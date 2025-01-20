@interface WFConditionallyCompiledActionProvider
- (id)actionDefinitionsWithIdentifiers:(id)a3;
- (id)allActionDefinitionsByIdentifier;
- (id)availableActionIdentifiers;
- (void)createActionsForRequests:(id)a3;
@end

@implementation WFConditionallyCompiledActionProvider

- (void)createActionsForRequests:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WFConditionallyCompiledActionProvider *)self allActionDefinitionsByIdentifier];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v28 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "actionIdentifier", v28);
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v10);
    }

    v14 = [(WFConditionallyCompiledActionProvider *)self actionDefinitionsWithIdentifiers:v7];
    v15 = getWFActionRegistryLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v14 allKeys];
      *(_DWORD *)buf = 136315394;
      v40 = "-[WFConditionallyCompiledActionProvider createActionsForRequests:]";
      __int16 v41 = 2114;
      v42 = v16;
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_DEFAULT, "%s Found conditionally compiled actions: %{public}@", buf, 0x16u);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v8;
    uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          v22 = objc_msgSend(v21, "actionIdentifier", v28);
          uint64_t v23 = [v14 objectForKey:v22];
          if (v23)
          {
            v24 = (void *)v23;
            v25 = [WFAction alloc];
            v26 = [v21 serializedParameters];
            v27 = [(WFAction *)v25 initWithIdentifier:v22 definition:v24 serializedParameters:v26];

            if (!v27)
            {

              goto LABEL_23;
            }
            [v21 setResult:v27];
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_23:

    id v4 = v28;
  }
}

- (id)availableActionIdentifiers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(WFConditionallyCompiledActionProvider *)self allActionDefinitionsByIdentifier];
  id v4 = [v3 allKeys];
  v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)actionDefinitionsWithIdentifiers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v12 = [(WFConditionallyCompiledActionProvider *)self allActionDefinitionsByIdentifier];
          v13 = [v12 objectForKey:v11];

          if (v13)
          {
            v14 = [(WFConditionallyCompiledActionProvider *)self allActionDefinitionsByIdentifier];
            v15 = [v14 objectForKey:v11];
            [v5 setObject:v15 forKey:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v4, "count", (void)v19))
  {
    id v16 = v5;
  }
  else
  {
    id v16 = [(WFConditionallyCompiledActionProvider *)self allActionDefinitionsByIdentifier];
  }
  uint64_t v17 = v16;

  return v17;
}

- (id)allActionDefinitionsByIdentifier
{
  return (id)MEMORY[0x1E4F1CC08];
}

@end