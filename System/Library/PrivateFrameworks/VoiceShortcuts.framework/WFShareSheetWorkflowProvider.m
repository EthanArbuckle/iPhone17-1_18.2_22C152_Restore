@interface WFShareSheetWorkflowProvider
- (WFDatabaseProvider)databaseProvider;
- (WFShareSheetWorkflowProvider)initWithDatabaseProvider:(id)a3;
- (id)generateSingleUseTokenForWorkflowIdentifier:(id)a3;
- (id)shareSheetWorkflowsForExtensionMatchingDictionaries:(id)a3 hostBundleIdentifier:(id)a4 error:(id *)a5;
@end

@implementation WFShareSheetWorkflowProvider

- (WFShareSheetWorkflowProvider)initWithDatabaseProvider:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFShareSheetWorkflowProvider.m", 25, @"Invalid parameter not satisfying: %@", @"databaseProvider" object file lineNumber description];

    if (!self) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (self)
  {
LABEL_3:
    objc_storeStrong((id *)&self->_databaseProvider, a3);
    v7 = self;
  }
LABEL_4:

  return self;
}

- (void).cxx_destruct
{
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (id)generateSingleUseTokenForWorkflowIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFShareSheetWorkflowProvider.m", 77, @"Invalid parameter not satisfying: %@", @"workflowIdentifier" object file lineNumber description];
  }
  id v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];

  v8 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  [v8 setWorkflowIdentifier:v5 forToken:v7];

  return v7;
}

- (id)shareSheetWorkflowsForExtensionMatchingDictionaries:(id)a3 hostBundleIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"WFShareSheetWorkflowProvider.m", 35, @"Invalid parameter not satisfying: %@", @"extensionMatchingDictionaries" object file lineNumber description];
  }
  v11 = VCOSTransactionWithName(@"shareSheetWorkflowReferencesForExtensionMatchingDictionaries");
  v12 = [MEMORY[0x1E4F5A858] sharedRegistry];
  v13 = [v12 contentItemClassesForShareSheetWithExtensionMatchingDictionaries:v9 hostBundleIdentifier:v10];

  v49 = v13;
  if ([v13 count])
  {
    v14 = [(WFShareSheetWorkflowProvider *)self databaseProvider];
    id v54 = 0;
    v15 = [v14 databaseWithError:&v54];
    id v16 = v54;

    v45 = v15;
    if (v15)
    {
      id v41 = v16;
      v42 = v11;
      id v43 = v10;
      id v44 = v9;
      v17 = [v15 sortedVisibleWorkflowsWithType:*MEMORY[0x1E4FB4FB8]];
      v48 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"inputClasses", @"workflowTypes", 0);
      id v46 = (id)objc_opt_new();
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v40 = v17;
      id obj = [v17 descriptors];
      uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        v20 = v15;
        uint64_t v21 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v51 != v21) {
              objc_enumerationMutation(obj);
            }
            v23 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            v24 = [v20 recordWithDescriptor:v23 properties:v48 error:0];
            v25 = [v24 inputClasses];
            v26 = objc_msgSend(v25, "if_compactMap:", &__block_literal_global_4415);

            id v27 = objc_alloc(MEMORY[0x1E4F1CAD0]);
            v28 = (void *)MEMORY[0x1E4FB7390];
            v29 = [v24 workflowTypes];
            v30 = [v28 effectiveInputClassesFromInputClasses:v26 workflowTypes:v29];
            v31 = (void *)[v27 initWithArray:v30];

            if ([v49 intersectsSet:v31])
            {
              id v32 = objc_alloc(MEMORY[0x1E4FB4878]);
              v33 = [v23 identifier];
              v34 = [v23 name];
              v35 = [v23 icon];
              v36 = objc_msgSend(v32, "initWithIdentifier:name:glyphCharacter:", v33, v34, objc_msgSend(v35, "glyphCharacter"));

              v20 = v45;
              [v46 addObject:v36];
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v19);
      }

      id v10 = v43;
      id v9 = v44;
      id v16 = v41;
      v11 = v42;
    }
    else
    {
      v37 = getWFGeneralLogObject();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "-[WFShareSheetWorkflowProvider shareSheetWorkflowsForExtensionMatchingDictionaries:hostBundleIdentifier:error:]";
        __int16 v58 = 2114;
        id v59 = v16;
        _os_log_impl(&dword_1C7D7E000, v37, OS_LOG_TYPE_DEFAULT, "%s Database is not available, returning empty array of share sheet workflow references, error = %{public}@", buf, 0x16u);
      }

      if (a5) {
        *a5 = v16;
      }
      id v46 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v46 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v46;
}

Class __111__WFShareSheetWorkflowProvider_shareSheetWorkflowsForExtensionMatchingDictionaries_hostBundleIdentifier_error___block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

@end