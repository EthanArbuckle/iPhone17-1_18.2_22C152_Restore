@interface WFShortcutsV10CustomModificationStep
- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4;
@end

@implementation WFShortcutsV10CustomModificationStep

- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  v5 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 136315394;
    v59 = "-[WFShortcutsV10CustomModificationStep performModificationsWithContext:error:]";
    __int16 v60 = 2112;
    v61 = v7;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Performing custom modification step: %@", buf, 0x16u);
  }
  v36 = (void *)MEMORY[0x1C87CA430]();
  v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Shortcut"];
  [v8 setFetchLimit:5];
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"triggers.@count > 0"];
  [v8 setPredicate:v9];

  id v55 = 0;
  v10 = [v41 executeFetchRequest:v8 error:&v55];
  id v11 = v55;
  v38 = a4;
  if ([v10 count])
  {
    v12 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[WFShortcutsV10CustomModificationStep performModificationsWithContext:error:]";
      __int16 v60 = 2112;
      v61 = v10;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%s Associated triggers found for %@ shortcuts. Setting hiddenFromLibraryAndSync flag to YES", buf, 0x16u);
    }

    uint64_t v13 = MEMORY[0x1E4F1CC38];
    do
    {
      context = (void *)MEMORY[0x1C87CA430]();
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v14 = v10;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v52 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            v20 = (void *)MEMORY[0x1C87CA430]();
            [v19 setValue:v13 forKey:@"hiddenFromLibraryAndSync"];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v51 objects:v57 count:16];
        }
        while (v16);
      }

      id v50 = v11;
      [v41 save:&v50];
      id v21 = v50;

      [v41 reset];
      objc_msgSend(v8, "setFetchOffset:", objc_msgSend(v8, "fetchOffset") + objc_msgSend(v8, "fetchLimit"));
      id v49 = v21;
      v10 = [v41 executeFetchRequest:v8 error:&v49];
      id v11 = v49;
    }
    while ([v10 count]);
  }

  v37 = (void *)MEMORY[0x1C87CA430]();
  v22 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Trigger"];
  [v22 setFetchLimit:5];
  id v48 = v11;
  v23 = [v41 executeFetchRequest:v22 error:&v48];
  id v24 = v48;

  if ([v23 count])
  {
    v25 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[WFShortcutsV10CustomModificationStep performModificationsWithContext:error:]";
      __int16 v60 = 2112;
      v61 = v23;
      _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_DEFAULT, "%s Triggers found: %@. Setting editableShortcut flag to YES", buf, 0x16u);
    }

    uint64_t v26 = MEMORY[0x1E4F1CC38];
    do
    {
      contexta = (void *)MEMORY[0x1C87CA430]();
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v27 = v23;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v45 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            v33 = (void *)MEMORY[0x1C87CA430]();
            [v32 setValue:v26 forKey:@"editableShortcut"];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v56 count:16];
        }
        while (v29);
      }

      id v43 = v24;
      [v41 save:&v43];
      id v34 = v43;

      [v41 reset];
      objc_msgSend(v22, "setFetchOffset:", objc_msgSend(v22, "fetchOffset") + objc_msgSend(v22, "fetchLimit"));
      id v42 = v34;
      v23 = [v41 executeFetchRequest:v22 error:&v42];
      id v24 = v42;
    }
    while ([v23 count]);
  }

  if (v38) {
    id *v38 = v24;
  }

  return v24 == 0;
}

@end