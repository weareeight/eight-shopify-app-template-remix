import fs from "fs";
import { SHOPIFY_API_VERSION } from "./app/constants";
import { shopifyApiProject, ApiType } from "@shopify/api-codegen-preset";
import type { IGraphQLConfig } from "graphql-config";

const shopifyApi = shopifyApiProject({
  apiType: ApiType.Admin,
  apiVersion: SHOPIFY_API_VERSION,
  documents: ["./app/**/*.{js,ts,jsx,tsx}", "./app/.server/**/*.{js,ts,jsx,tsx}"],
  outputDir: "./app/types",
  declarations: false,
});

console.log(JSON.stringify(shopifyApi, null, 2));

function getConfig() {
  const config: IGraphQLConfig = {
    projects: {
      default: shopifyApi,
    },
  };

  let extensions: string[] = [];
  try {
    extensions = fs.readdirSync("./extensions");
  } catch {
    // ignore if no extensions
  }

  for (const entry of extensions) {
    const extensionPath = `./extensions/${entry}`;
    const schema = `${extensionPath}/schema.graphql`;
    if (!fs.existsSync(schema)) {
      continue;
    }
    config.projects[entry] = {
      schema,
      documents: [`${extensionPath}/**/*.graphql`],
    };
  }

  return config;
}

const config = getConfig();

export default config;
