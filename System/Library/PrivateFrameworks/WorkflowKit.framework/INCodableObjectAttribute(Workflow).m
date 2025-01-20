@interface INCodableObjectAttribute(Workflow)
- (WFPodcastSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (__CFString)mediaTypeFromIntentMediaType:()Workflow;
- (id)wf_contentItemForValue:()Workflow;
- (id)wf_facadeClass;
- (id)wf_objectClass;
- (id)wf_parameterClass;
- (id)wf_processedParameterValueForValue:()Workflow;
- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:;
- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:;
@end

@implementation INCodableObjectAttribute(Workflow)

- (__CFString)mediaTypeFromIntentMediaType:()Workflow
{
  if ((unint64_t)(a3 - 1) > 4) {
    v3 = WFMediaTypeSong;
  }
  else {
    v3 = off_1E6550560[a3 - 1];
  }
  return *v3;
}

- (id)wf_processedParameterValueForValue:()Workflow
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class()))
  {
    id v7 = v4;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&off_1F237B468;
    objc_msgSendSuper2(&v10, sel_wf_processedParameterValueForValue_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)wf_contentItemForValue:()Workflow
{
  id v4 = a3;
  uint64_t v5 = [a1 metadata];
  uint64_t v6 = objc_msgSend(v5, "wf_contentItemForValue:", v4);

  if (!v6)
  {
    if (![v4 conformsToProtocol:&unk_1F23873A0]
      || (objc_msgSend(v4, "wf_contentItemWithCodableAttribute:", a1),
          (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v6 = [MEMORY[0x1E4F5A848] itemWithObject:v4];
    }
  }

  return v6;
}

- (WFPodcastSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 metadata];

  if (!v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_17:
      v31.receiver = a1;
      v31.super_class = (Class)&off_1F237B468;
      objc_msgSendSuper2(&v31, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7);
      objc_super v10 = (WFPodcastSubstitutableState *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    id v14 = v6;
    v15 = [v14 identifier];

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E4F29088];
      v17 = [v14 identifier];
      v18 = [v16 componentsWithString:v17];

      if ([v14 type] == 6)
      {
        v19 = [v18 queryItems];
        v20 = [v19 objectMatchingKey:@"name" value:@"storeCollectionId"];

        v21 = [WFiTunesPodcastObject alloc];
        v22 = [v14 title];
        v23 = [v20 value];
        v24 = [(WFiTunesPodcastObject *)v21 initWithName:v22 identifier:v23 podcastUUID:0 feedURL:0 kind:@"podcast"];

        objc_super v10 = [(WFVariableSubstitutableParameterState *)[WFPodcastSubstitutableState alloc] initWithValue:v24];
      }
      else
      {
        if ([v14 type] == 8
          || ([v18 queryItems],
              v25 = objc_claimAutoreleasedReturnValue(),
              [v25 objectMatchingKey:@"name" value:@"deviceLibraryPersistentID"],
              v20 = objc_claimAutoreleasedReturnValue(),
              v25,
              !v20))
        {

          objc_super v10 = 0;
          goto LABEL_18;
        }
        v26 = [WFMediaItemState alloc];
        objc_msgSend(a1, "mediaTypeFromIntentMediaType:", objc_msgSend(v14, "type"));
        v24 = (WFiTunesPodcastObject *)objc_claimAutoreleasedReturnValue();
        v27 = NSNumber;
        v28 = [v20 value];
        v29 = objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "integerValue"));
        objc_super v10 = [(WFMediaItemState *)v26 initWithMediaType:v24 persistentID:v29];
      }
    }
    else
    {
      objc_super v10 = 0;
    }

    if (v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v9 = [a1 metadata];
  objc_msgSend(v9, "wf_parameterStateForIntentValue:parameterDefinition:", v6, v7);
  objc_super v10 = (WFPodcastSubstitutableState *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (!objc_msgSend(a1, "wf_multipleValues")) {
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    id v11 = v6;
    v12 = [WFMultipleValueParameterState alloc];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __90__INCodableObjectAttribute_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke;
    v32[3] = &unk_1E6554A90;
    v32[4] = a1;
    id v33 = v7;
    v13 = objc_msgSend(v11, "if_compactMap:", v32);

    objc_super v10 = [(WFMultipleValueParameterState *)v12 initWithParameterStates:v13];
    if (!v10) {
      goto LABEL_17;
    }
  }
LABEL_18:

  return v10;
}

- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = a6;
  uint64_t v14 = objc_opt_class();
  if (v14 == objc_opt_class())
  {
    v13[2](v13, v10, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = a1;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v10;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        while (2)
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = objc_opt_class();
            if (v20 == objc_opt_class())
            {
              v13[2](v13, v15, 0);

              goto LABEL_16;
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      a1 = v23;
    }
    v21 = [a1 metadata];
    char v22 = objc_msgSend(v21, "wf_processParameterValue:forParameter:parameterState:codableAttribute:completionHandler:", v10, v11, v12, a1, v13);

    if ((v22 & 1) == 0)
    {
      v24.receiver = a1;
      v24.super_class = (Class)&off_1F237B468;
      objc_msgSendSuper2(&v24, sel_wf_getProcessedIntentValueForParameterValue_parameter_parameterState_completionHandler_, v10, v11, v12, v13);
    }
  }
LABEL_16:
}

- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:
{
  id v8 = a5;
  v14.receiver = a1;
  v14.super_class = (Class)&off_1F237B468;
  v9 = objc_msgSendSuper2(&v14, sel_wf_updatedParameterDefinition_parameterClass_localizer_, a3, a4, v8);
  if ([a1 supportsDynamicEnumeration]
    || ([a1 metadata], id v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    id v12 = v9;
  }
  else
  {
    id v11 = [a1 metadata];
    objc_msgSend(v11, "wf_updatedParameterDefinition:forCodableAttribute:localizer:", v9, a1, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (id)wf_parameterClass
{
  v1 = [a1 metadata];
  v2 = objc_msgSend(v1, "wf_parameterClass");

  return v2;
}

- (id)wf_objectClass
{
  v2 = [a1 metadata];
  v3 = objc_msgSend(v2, "wf_objectClass");
  if (!v3) {
    v3 = objc_msgSend(a1, "wf_facadeClass");
  }
  id v4 = v3;

  return v4;
}

- (id)wf_facadeClass
{
  v1 = [a1 valueTransformer];
  v2 = [(id)objc_opt_class() transformedValueClass];

  return v2;
}

@end