@interface WFShortcutsV5CustomModificationsStep
- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4;
@end

@implementation WFShortcutsV5CustomModificationsStep

- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1C87CA430]();
  v7 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Shortcut"];
  [v7 setFetchLimit:5];
  [v7 setPropertiesToFetch:&unk_1F23179A0];
  id v37 = 0;
  v27 = v7;
  v8 = [v5 executeFetchRequest:v7 error:&v37];
  id v9 = v37;
  if (![v8 count])
  {
LABEL_13:

    if (a4) {
      *a4 = v9;
    }
    BOOL v22 = v9 == 0;
    goto LABEL_19;
  }
  uint64_t v10 = [MEMORY[0x1E4F1C0A8] entityForName:@"ShortcutActions" inManagedObjectContext:v5];
  if (v10)
  {
    v11 = (void *)v10;
    v25 = a4;
    v26 = v6;
    do
    {
      v29 = v9;
      v12 = v5;
      context = (void *)MEMORY[0x1C87CA430]();
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = v8;
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v18 = (void *)MEMORY[0x1C87CA430]();
            v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C108]) initWithEntity:v11 insertIntoManagedObjectContext:v12];
            v20 = [v17 valueForKey:@"actionsData"];
            [v19 setValue:v20 forKey:@"data"];
            [v17 setValue:v19 forKey:@"actions"];
            [v17 setValue:0 forKey:@"actionsData"];
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v14);
      }

      id v32 = v29;
      id v5 = v12;
      [v12 save:&v32];
      id v21 = v32;

      [v12 reset];
      objc_msgSend(v27, "setFetchOffset:", objc_msgSend(v27, "fetchOffset") + objc_msgSend(v27, "fetchLimit"));
      id v31 = v21;
      v8 = [v12 executeFetchRequest:v27 error:&v31];
      id v9 = v31;
    }
    while ([v8 count]);

    a4 = v25;
    v6 = v26;
    goto LABEL_13;
  }
  v23 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[WFShortcutsV5CustomModificationsStep performModificationsWithContext:error:]";
    _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_FAULT, "%s Couldn't make a ShortcutActions entity description", buf, 0xCu);
  }

  BOOL v22 = 0;
LABEL_19:

  return v22;
}

@end