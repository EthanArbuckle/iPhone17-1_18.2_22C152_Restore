@interface WFShortcutsV3CustomModificationsStep
- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4;
@end

@implementation WFShortcutsV3CustomModificationsStep

- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39 = (void *)MEMORY[0x1C87CA430]();
  v5 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Shortcut"];
  [v5 setFetchLimit:5];
  [v5 setPropertiesToFetch:&unk_1F2317B98];
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"workflowID" ascending:1];
  v70[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
  [v5 setSortDescriptors:v7];

  id v66 = 0;
  v45 = v4;
  v42 = v5;
  v8 = [v4 executeFetchRequest:v5 error:&v66];
  id v9 = v66;
  while ([v8 count])
  {
    uint64_t v10 = MEMORY[0x1C87CA430]();
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v62 objects:v69 count:16];
    context = (void *)v10;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v63 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1C87CA430]();
          id v61 = v9;
          WFMigratePropertyListObject(v16, @"actions", @"actionsData", (uint64_t)&v61);
          id v18 = v61;

          id v60 = v18;
          WFMigratePropertyListObject(v16, @"importQuestions", @"importQuestionsData", (uint64_t)&v60);
          id v19 = v60;

          id v59 = v19;
          WFMigratePropertyListObject(v16, @"inputClasses", @"inputClassesData", (uint64_t)&v59);
          id v9 = v59;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v13);
    }

    id v58 = v9;
    [v45 save:&v58];
    id v20 = v58;

    [v45 reset];
    objc_msgSend(v42, "setFetchOffset:", objc_msgSend(v42, "fetchOffset") + objc_msgSend(v42, "fetchLimit"));
    id v57 = v20;
    v8 = [v45 executeFetchRequest:v42 error:&v57];
    id v9 = v57;
  }

  v40 = (void *)MEMORY[0x1C87CA430]();
  v21 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Collection"];
  [v21 setFetchLimit:5];
  [v21 setPropertiesToFetch:&unk_1F2317BB0];
  v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  v68 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  [v21 setSortDescriptors:v23];

  id v56 = v9;
  v24 = [v45 executeFetchRequest:v21 error:&v56];
  id v25 = v56;

  while ([v24 count])
  {
    uint64_t v26 = MEMORY[0x1C87CA430]();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v27 = v24;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v52 objects:v67 count:16];
    contexta = (void *)v26;
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v53 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v52 + 1) + 8 * j);
          v33 = (void *)MEMORY[0x1C87CA430]();
          id v51 = v25;
          WFMigratePropertyListObject(v32, @"lastRemoteCollectionOrdering", @"lastRemoteCollectionOrderingData", (uint64_t)&v51);
          id v34 = v51;

          id v50 = v34;
          WFMigratePropertyListObject(v32, @"lastRemoteCollectionOrderingSubset", @"lastRemoteCollectionOrderingSubsetData", (uint64_t)&v50);
          id v35 = v50;

          id v49 = v35;
          WFMigratePropertyListObject(v32, @"lastRemoteShortcutOrdering", @"lastRemoteShortcutOrderingData", (uint64_t)&v49);
          id v36 = v49;

          id v48 = v36;
          WFMigratePropertyListObject(v32, @"lastRemoteShortcutOrderingSubset", @"lastRemoteShortcutOrderingSubsetData", (uint64_t)&v48);
          id v25 = v48;
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v52 objects:v67 count:16];
      }
      while (v29);
    }

    id v47 = v25;
    [v45 save:&v47];
    id v37 = v47;

    [v45 reset];
    objc_msgSend(v21, "setFetchOffset:", objc_msgSend(v21, "fetchOffset") + objc_msgSend(v21, "fetchLimit"));
    id v46 = v37;
    v24 = [v45 executeFetchRequest:v21 error:&v46];
    id v25 = v46;
  }

  if (a4) {
    *a4 = v25;
  }

  return v25 == 0;
}

@end