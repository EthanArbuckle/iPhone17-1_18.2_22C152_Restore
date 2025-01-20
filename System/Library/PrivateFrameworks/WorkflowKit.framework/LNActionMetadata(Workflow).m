@interface LNActionMetadata(Workflow)
- (id)wf_actionMetadataWithOutputType:()Workflow;
- (id)wf_parameterDefinitions;
- (uint64_t)wf_validateParametersForAction:()Workflow error:;
@end

@implementation LNActionMetadata(Workflow)

- (id)wf_parameterDefinitions
{
  v1 = [a1 parameters];
  v2 = objc_msgSend(v1, "if_compactMap:", &__block_literal_global_54036);

  return v2;
}

- (id)wf_actionMetadataWithOutputType:()Workflow
{
  v4 = (objc_class *)MEMORY[0x1E4F72AE0];
  id v23 = a3;
  id v26 = [v4 alloc];
  v32 = [a1 identifier];
  v28 = [a1 mangledTypeName];
  v25 = [a1 mangledTypeNameByBundleIdentifier];
  v24 = [a1 effectiveBundleIdentifiers];
  uint64_t v22 = [a1 bundleMetadataVersion];
  v21 = [a1 title];
  v31 = [a1 descriptionMetadata];
  v30 = [a1 deprecationMetadata];
  char v20 = [a1 openAppWhenRun];
  char v19 = [a1 isDiscoverable];
  uint64_t v18 = [a1 authenticationPolicy];
  uint64_t v17 = [a1 outputFlags];
  v29 = [a1 parameters];
  v16 = [a1 systemProtocolMetadata];
  v15 = [a1 actionConfiguration];
  v14 = [a1 typeSpecificMetadata];
  v13 = [a1 customIntentClassName];
  v5 = [a1 availabilityAnnotations];
  v6 = [a1 shortcutsMetadata];
  v12 = [a1 requiredCapabilities];
  v7 = [a1 attributionBundleIdentifier];
  v8 = [a1 sideEffect];
  v9 = [a1 assistantDefinedSchemas];
  BYTE1(v11) = v19;
  LOBYTE(v11) = v20;
  v27 = objc_msgSend(v26, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:", v32, v28, v25, v24, v22, v21, v31, v30, v11, v18, v23, v17, v29,
                  v16,
                  v15,
                  v14,
                  v13,
                  v5,
                  v6,
                  v12,
                  v7,
                  v8,
                  v9);

  return v27;
}

- (uint64_t)wf_validateParametersForAction:()Workflow error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 parameters];
  v8 = objc_msgSend(v7, "if_map:", &__block_literal_global_160);

  v9 = (void *)MEMORY[0x1E4F1C9E8];
  v10 = [v6 parameters];
  uint64_t v11 = [v9 dictionaryWithObjects:v10 forKeys:v8];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = [a1 parameters];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v23 = v8;
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v18 = [v17 name];
        char v19 = [v11 objectForKeyedSubscript:v18];

        char v20 = [v19 value];
        LODWORD(v17) = objc_msgSend(v17, "wf_validateParameterValue:error:", v20, a4);

        if (!v17)
        {
          uint64_t v21 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    uint64_t v21 = 1;
LABEL_11:
    v8 = v23;
  }
  else
  {
    uint64_t v21 = 1;
  }

  return v21;
}

@end