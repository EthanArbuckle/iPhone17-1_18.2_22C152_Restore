@interface WFLinkActionRunDescriptor(Conversion)
- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:;
@end

@implementation WFLinkActionRunDescriptor(Conversion)

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v55 = a4;
  v8 = a5;
  v9 = [a1 action];
  v10 = [a1 identifier];
  v51 = a1;
  v11 = [a1 metadata];
  v12 = [v10 compositeIdentifier];
  v13 = objc_opt_new();
  v14 = [v11 shortcutsActionMetadata];
  v15 = [v14 dictionaryRepresentation];

  v52 = v15;
  if (v15)
  {
    v16 = [v15 objectForKeyedSubscript:@"IdentifierOverrideKey"];
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v45 = a3;
      v47 = v11;
      v48 = v10;
      v50 = v8;
      id v46 = v16;

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v49 = v9;
      v17 = [v9 parameters];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v59;
        unint64_t v21 = 0x1E4F72000uLL;
        v53 = v17;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v59 != v20) {
              objc_enumerationMutation(v17);
            }
            v23 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * i), "value", v45);
            v24 = [v23 value];

            if (v24)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unint64_t v25 = v21;
                v26 = v13;
                v27 = [(WFWorkflow *)v24 identifier];
                v28 = [v27 instanceIdentifier];
                id v57 = 0;
                v29 = [v55 serializedParametersForAppEntityIdentifier:v28 error:&v57];
                id v30 = v57;

                if (v30)
                {
                  v8 = v50;
                  ((void (**)(id, void *, id))v50)[2](v50, 0, v30);

                  v42 = v46;
                  v11 = v47;
                  v10 = v48;
                  v34 = v49;
                  v13 = v26;
                  v44 = v46;
                  id v41 = v53;
                  goto LABEL_27;
                }
                v13 = v26;
                if (v29)
                {
                  v31 = [MEMORY[0x1E4F28DC0] unarchiveObjectWithData:v29];
                  [v26 addEntriesFromDictionary:v31];
                }
                unint64_t v21 = v25;
                v17 = v53;
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v62 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      v12 = v46;
      v9 = v49;
      v8 = v50;
      v11 = v47;
      v10 = v48;
      a3 = v45;
    }
    else
    {
    }
  }
  v32 = +[WFActionRegistry sharedRegistry];
  v33 = [v32 createActionWithIdentifier:v12 serializedParameters:0 forceLocalActionsOnly:1];

  objc_opt_class();
  v54 = v12;
  v34 = v9;
  if (objc_opt_isKindOfClass())
  {
    v35 = WFLinkActionSerializedParametersForWFAction(v33, v9, v11);
    uint64_t v36 = a3;
    uint64_t v37 = [v35 mutableCopy];

    v13 = (void *)v37;
    a3 = v36;
  }
  uint64_t v38 = [v33 copyWithSerializedParameters:v13];

  v39 = [WFWorkflow alloc];
  v40 = objc_opt_new();
  id v56 = 0;
  v24 = [(WFWorkflow *)v39 initWithRecord:v40 reference:0 storageProvider:0 migrateIfNecessary:0 environment:a3 error:&v56];
  id v41 = v56;

  if (v24)
  {
    v42 = (void *)v38;
    [(WFWorkflow *)v24 addAction:v38];
    if ([v51 isAutoShortcut]) {
      [(WFWorkflow *)v24 setSource:@"ShortcutSourceAppShortcut"];
    }
    v43 = [v51 name];
    [(WFWorkflow *)v24 setName:v43];

    v8[2](v8, v24, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v41);
    v42 = (void *)v38;
  }
  v44 = v54;
LABEL_27:
}

@end