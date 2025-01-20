@interface INCodableEnumAttribute(Workflow)
- (WFStringSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (id)wf_contentItemForValue:()Workflow;
- (id)wf_objectClass;
- (id)wf_outputDisplayNameWithLocalizer:()Workflow;
- (id)wf_parameterClass;
- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:;
- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:;
@end

@implementation INCodableEnumAttribute(Workflow)

- (id)wf_contentItemForValue:()Workflow
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [a1 valueWithName:v4];
LABEL_5:
    v6 = v5;
    v7 = (void *)MEMORY[0x1E4F5A848];
    v8 = [v5 localizedDisplayName];
    v9 = [v7 itemWithObject:v8];

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = objc_msgSend(a1, "valueForIndex:", objc_msgSend(v4, "integerValue"));
    goto LABEL_5;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&off_1F2373A50;
  v9 = objc_msgSendSuper2(&v11, sel_wf_contentItemForValue_, v4);
LABEL_7:

  return v9;
}

- (WFStringSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 codableEnum];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v6 index];
LABEL_5:
    uint64_t v10 = v9;
    if ([v8 type] == 1)
    {
      objc_super v11 = [WFBooleanSubstitutableState alloc];
      v12 = [NSNumber numberWithInt:v10 == 1];
      v13 = [(WFNumberSubstitutableState *)v11 initWithNumber:v12];
LABEL_7:

      goto LABEL_19;
    }
    if (![v8 type])
    {
      v14 = [v7 objectForKey:@"IntentEnumOverrides"];
      uint64_t v15 = objc_opt_class();
      v12 = WFEnforceClass(v14, v15);

      v16 = [v8 values];
      v17 = [v16 objectMatchingKey:@"index" intValue:v10];

      if (v17)
      {
        v18 = [v17 name];
        v19 = [v12 objectForKeyedSubscript:v18];
        v20 = v19;
        if (v19)
        {
          id v21 = v19;
        }
        else
        {
          id v21 = [v17 name];
        }
        v24 = v21;

        v13 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v24];
        goto LABEL_7;
      }
    }
    objc_msgSendSuper2(&v25, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7, a1, &off_1F2373A50, v26.receiver, v26.super_class);
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v6 integerValue];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSendSuper2(&v26, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7, v25.receiver, v25.super_class, a1, &off_1F2373A50);
LABEL_12:
    v13 = (WFStringSubstitutableState *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v22 = getWFGeneralLogObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[INCodableEnumAttribute(Workflow) wf_parameterStateForIntentValue:parameterDefinition:]";
    __int16 v29 = 2114;
    id v30 = v6;
    _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_FAULT, "%s Unsupported value: %{public}@", buf, 0x16u);
  }

  v13 = 0;
LABEL_19:

  return v13;
}

- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = a6;
  v14 = [a1 codableEnum];
  uint64_t v15 = [v14 type];

  if (v15 == 1)
  {
    uint64_t v16 = objc_opt_class();
    v17 = WFEnforceClass(v10, v16);
    if ([v17 BOOLValue]) {
      v18 = &unk_1F2316668;
    }
    else {
      v18 = &unk_1F2316680;
    }
    v13[2](v13, v18, 0);
  }
  else
  {
    v19 = [a1 codableEnum];
    uint64_t v20 = [v19 type];

    if (!v20)
    {
      uint64_t v21 = objc_opt_class();
      v22 = WFEnforceClass(v11, v21);
      uint64_t v23 = objc_opt_class();
      v24 = WFEnforceClass(v10, v23);
      objc_super v25 = [v22 keysToEnumNames];
      uint64_t v26 = [v25 objectForKeyedSubscript:v24];
      v27 = (void *)v26;
      if (v26) {
        v28 = (void *)v26;
      }
      else {
        v28 = v24;
      }
      id v29 = v28;

      if (v29)
      {
        id v30 = [a1 valueWithName:v29];
        uint64_t v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v30, "index"));
        v13[2](v13, v31, 0);

        goto LABEL_13;
      }
    }
    v32.receiver = a1;
    v32.super_class = (Class)&off_1F2373A50;
    objc_msgSendSuper2(&v32, sel_wf_getProcessedIntentValueForParameterValue_parameter_parameterState_completionHandler_, v10, v11, v12, v13);
  }
LABEL_13:
}

- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:
{
  v74[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v65.receiver = a1;
  v65.super_class = (Class)&off_1F2373A50;
  objc_msgSendSuper2(&v65, sel_wf_updatedParameterDefinition_parameterClass_localizer_, a3, a4, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if ([a1 supportsDynamicEnumeration])
  {
    id v9 = v9;
    id v10 = v9;
  }
  else
  {
    id v11 = [a1 metadata];
    uint64_t v12 = objc_opt_class();
    v13 = WFEnforceClass(v11, v12);

    v14 = [v13 defaultValue];
    if ([a4 isEqual:objc_opt_class()])
    {
      v73[0] = @"DefaultValue";
      v55 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "index") == 1);
      v74[0] = v55;
      v73[1] = @"OnDisplayName";
      v53 = [a1 codableEnum];
      v51 = [v53 values];
      objc_msgSend(v51, "if_firstObjectPassingTest:", &__block_literal_global_13088);
      uint64_t v15 = v59 = v14;
      uint64_t v16 = [v15 localizedDisplayNameWithLocalizer:v8];
      v74[1] = v16;
      v73[2] = @"OffDisplayName";
      v17 = [a1 codableEnum];
      [v17 values];
      v18 = v57 = v13;
      v19 = objc_msgSend(v18, "if_firstObjectPassingTest:", &__block_literal_global_163);
      uint64_t v20 = [v19 localizedDisplayNameWithLocalizer:v8];
      v74[2] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
      id v10 = [v9 definitionByAddingEntriesInDictionary:v21];

      v13 = v57;
      v14 = v59;
    }
    else
    {
      if ([a4 isEqual:objc_opt_class()])
      {
        v58 = v13;
        v60 = v14;
        v22 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithObjects:", @"Variable", @"ExtensionInput", @"ActionOutput", @"CurrentDate", @"Clipboard", 0);
        uint64_t v23 = [v9 objectForKey:@"DisallowedVariableTypes"];
        v54 = (void *)v23;
        if (v23)
        {
          uint64_t v24 = [v22 orderedSetByAddingObjectsFromArray:v23];

          v22 = (void *)v24;
        }
        v71[0] = @"DisallowedVariableTypes";
        v56 = v22;
        objc_super v25 = [v22 array];
        v71[1] = @"EnumAttribute";
        v72[0] = v25;
        v72[1] = a1;
        uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
        v52 = [v9 definitionByAddingEntriesInDictionary:v26];

        v27 = objc_opt_new();
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v28 = [a1 codableEnum];
        id v29 = [v28 values];

        uint64_t v30 = [v29 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v62 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              if ([v34 index])
              {
                v35 = [v34 localizedName];
                v36 = v35;
                if (v35)
                {
                  id v37 = v35;
                }
                else
                {
                  id v37 = [v34 localizedDisplayNameWithLocalizer:v8];
                }
                v38 = v37;

                v39 = [v34 name];
                [v27 setObject:v38 forKeyedSubscript:v39];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v61 objects:v70 count:16];
          }
          while (v31);
        }

        v68 = @"EnumNamesToLabel";
        v69 = v27;
        v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        id v9 = [v52 definitionByAddingEntriesInDictionary:v40];

        v14 = v60;
        if (v60)
        {
          v41 = [v9 objectForKey:@"IntentEnumOverrides"];
          uint64_t v42 = objc_opt_class();
          v43 = WFEnforceClass(v41, v42);

          v44 = [v60 name];
          v66 = @"DefaultValue";
          uint64_t v45 = [v43 objectForKeyedSubscript:v44];
          v46 = (void *)v45;
          if (v45) {
            uint64_t v47 = v45;
          }
          else {
            uint64_t v47 = (uint64_t)v44;
          }
          uint64_t v67 = v47;
          v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
          uint64_t v49 = [v9 definitionByAddingEntriesInDictionary:v48];

          id v9 = (id)v49;
          v14 = v60;
        }
        v13 = v58;
      }
      id v9 = v9;
      id v10 = v9;
    }
  }
  return v10;
}

- (id)wf_parameterClass
{
  v1 = [a1 codableEnum];
  [v1 type];

  v2 = objc_opt_class();
  return v2;
}

- (id)wf_outputDisplayNameWithLocalizer:()Workflow
{
  id v4 = a3;
  v5 = [a1 codableEnum];
  id v6 = [v5 localizedDisplayNameWithLocalizer:v4];

  return v6;
}

- (id)wf_objectClass
{
  v1 = [a1 codableEnum];
  unint64_t v2 = [v1 type];

  if (v2 > 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_opt_class();
  }
  return v3;
}

@end