@interface INIntentCodableDescription(Workflow)
- (id)wf_actionParameterDefinitionsWithOverrides:()Workflow;
- (id)wf_relationResourceDefinitionForAttribute:()Workflow parameters:overrides:;
@end

@implementation INIntentCodableDescription(Workflow)

- (id)wf_relationResourceDefinitionForAttribute:()Workflow parameters:overrides:
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 relationship];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 parentCodableAttribute];

    if (v11)
    {
      v11 = objc_opt_new();
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      [v11 setObject:v13 forKeyedSubscript:@"WFResourceClass"];

      v14 = [v10 parentCodableAttribute];
      v15 = [v14 propertyName];

      v16 = [v8 objectForKeyedSubscript:v15];
      uint64_t v17 = [v16 objectForKey:@"Key"];
      v18 = (void *)v17;
      if (v17) {
        v19 = (void *)v17;
      }
      else {
        v19 = v15;
      }
      id v20 = v19;

      [v11 setObject:v20 forKeyedSubscript:@"WFParameterKey"];
      unint64_t v21 = [v10 relation] - 1;
      if (v21 <= 8 && ((0x17Du >> v21) & 1) != 0) {
        v22 = *off_1E654F740[v21];
      }
      else {
        v22 = 0;
      }
      [v11 setObject:v22 forKeyedSubscript:@"WFParameterRelation"];
      v23 = [v10 values];
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __103__INIntentCodableDescription_Workflow__wf_relationResourceDefinitionForAttribute_parameters_overrides___block_invoke;
      v29 = &unk_1E654F720;
      id v30 = v7;
      id v31 = v10;
      v24 = objc_msgSend(v23, "if_map:", &v26);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, @"WFParameterValues", v26, v27, v28, v29);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)wf_actionParameterDefinitionsWithOverrides:()Workflow
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  uint64_t v4 = objc_opt_new();
  v5 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v6 = (void *)v4;
  v44 = a1;
  id v7 = [a1 displayOrderedAttributes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if ([v12 isConfigurable])
        {
          v13 = [v12 propertyName];
          v14 = [v45 objectForKeyedSubscript:v13];
          v15 = v14;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            uint64_t v17 = [WFParameterDefinition alloc];
            v16 = [(WFParameterDefinition *)v17 initWithDictionary:MEMORY[0x1E4F1CC08]];
          }
          v18 = v16;

          if ([v12 supportsDynamicEnumeration]) {
            uint64_t v19 = objc_opt_class();
          }
          else {
            uint64_t v19 = objc_msgSend(v12, "wf_parameterClass");
          }
          uint64_t v20 = v19;
          if (v19)
          {
            unint64_t v21 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
            uint64_t v22 = objc_msgSend(v12, "wf_updatedParameterDefinition:parameterClass:localizer:", v18, v20, v21);

            v23 = [v12 propertyName];
            [v5 setObject:v22 forKey:v23];

            v24 = [v12 propertyName];
            [v6 addObject:v24];

            v18 = (void *)v22;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v9);
  }
  v42 = v6;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = [v44 displayOrderedAttributes];
  uint64_t v25 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        id v30 = objc_msgSend(v44, "wf_relationResourceDefinitionForAttribute:parameters:overrides:", v29, v5, v45);
        if (v30)
        {
          id v31 = [v29 propertyName];
          v32 = [v5 objectForKeyedSubscript:v31];

          id v33 = objc_alloc(MEMORY[0x1E4F1CA48]);
          v34 = [v32 objectForKey:@"RequiredResources"];
          v35 = (void *)[v33 initWithArray:v34];

          [v35 addObject:v30];
          v56 = @"RequiredResources";
          v57 = v35;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          v37 = [v32 definitionByAddingEntriesInDictionary:v36];
          v38 = [v29 propertyName];
          [v5 setObject:v37 forKeyedSubscript:v38];
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v26);
  }

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __83__INIntentCodableDescription_Workflow__wf_actionParameterDefinitionsWithOverrides___block_invoke;
  v46[3] = &unk_1E654F6B8;
  id v47 = v5;
  id v39 = v5;
  v40 = objc_msgSend(v42, "if_map:", v46);

  return v40;
}

@end