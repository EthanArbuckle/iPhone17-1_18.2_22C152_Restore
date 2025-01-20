@interface ICDatabaseStateHandler
+ (id)miscState;
+ (id)modernDatabaseState;
+ (id)stateDictionary;
+ (id)stateDictionaryFromLoggables:(id)a3;
+ (void)addLoggable:(id)a3 toDictionary:(id)a4;
+ (void)registerStateHandler;
@end

@implementation ICDatabaseStateHandler

+ (void)registerStateHandler
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__ICDatabaseStateHandler_registerStateHandler__block_invoke;
  v2[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v2[4] = a1;
  [MEMORY[0x1E4F837E0] addStateHandlerWithName:"Notes Database" stateBlock:v2];
}

uint64_t __46__ICDatabaseStateHandler_registerStateHandler__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stateDictionary];
}

+ (id)stateDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = (void *)MEMORY[0x1C877DB80]();
  v5 = [a1 modernDatabaseState];
  [v3 setObject:v5 forKeyedSubscript:@"Modern"];

  v6 = (void *)MEMORY[0x1C877DB80]();
  v7 = [a1 miscState];
  [v3 setObject:v7 forKeyedSubscript:@"Misc"];

  return v3;
}

+ (id)miscState
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = +[ICNoteContext sharedContext];
  v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ICDatabaseStateHandler_miscState__block_invoke;
  v7[3] = &unk_1E64A4240;
  id v5 = v2;
  id v8 = v5;
  [v4 performBlockAndWait:v7];

  return v5;
}

void __35__ICDatabaseStateHandler_miscState__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", +[ICNoteContext legacyNotesDisabled](ICNoteContext, "legacyNotesDisabled"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"LegacyNotesDisabled"];
}

+ (id)modernDatabaseState
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = +[ICNoteContext sharedContext];
  id v5 = [v4 workerManagedObjectContext];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke;
  v11[3] = &unk_1E64A4710;
  id v12 = v5;
  id v14 = a1;
  id v6 = v3;
  id v13 = v6;
  id v7 = v5;
  [v7 performBlockAndWait:v11];
  id v8 = v13;
  id v9 = v6;

  return v9;
}

void __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v2 = +[ICAccount allAccountsInContext:*(void *)(a1 + 32)];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v67 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        [*(id *)(a1 + 48) addLoggable:v7 toDictionary:*(void *)(a1 + 40)];
        id v8 = [v7 accountData];
        if (v8) {
          [*(id *)(a1 + 48) addLoggable:v8 toDictionary:*(void *)(a1 + 40)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v4);
  }

  id v9 = +[ICFolder allFoldersInContext:*(void *)(a1 + 32)];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(a1 + 48) addLoggable:*(void *)(*((void *)&v62 + 1) + 8 * j) toDictionary:*(void *)(a1 + 40)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v11);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_2;
  v60[3] = &unk_1E64A4620;
  long long v36 = *(_OWORD *)(a1 + 40);
  id v15 = (id)v36;
  long long v61 = v36;
  +[ICNote enumerateNotesInContext:v14 batchSize:10 visibleOnly:0 saveAfterBatch:0 usingBlock:v60];
  uint64_t v16 = *(void *)(a1 + 32);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_3;
  v58[3] = &unk_1E64A4648;
  long long v37 = *(_OWORD *)(a1 + 40);
  id v17 = (id)v37;
  long long v59 = v37;
  +[ICAttachment enumerateAttachmentsInContext:v16 batchSize:10 visibleOnly:0 saveAfterBatch:0 usingBlock:v58];
  uint64_t v18 = *(void *)(a1 + 32);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_4;
  v56[3] = &unk_1E64A4670;
  long long v38 = *(_OWORD *)(a1 + 40);
  id v19 = (id)v38;
  long long v57 = v38;
  +[ICMedia enumerateMediaInContext:v18 batchSize:10 saveAfterBatch:0 usingBlock:v56];
  uint64_t v20 = *(void *)(a1 + 32);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_5;
  v54[3] = &unk_1E64A4698;
  long long v39 = *(_OWORD *)(a1 + 40);
  id v21 = (id)v39;
  long long v55 = v39;
  +[ICAttachmentPreviewImage enumerateAttachmentPreviewImagesInContext:v20 batchSize:10 saveAfterBatch:0 usingBlock:v54];
  uint64_t v22 = *(void *)(a1 + 32);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_6;
  v52[3] = &unk_1E64A46C0;
  long long v40 = *(_OWORD *)(a1 + 40);
  id v23 = (id)v40;
  long long v53 = v40;
  +[ICInlineAttachment enumerateInlineAttachmentsInContext:v22 typeUTI:0 tokenContentIdentifier:0 batchSize:10 visibleOnly:0 saveAfterBatch:0 usingBlock:v52];
  uint64_t v24 = *(void *)(a1 + 32);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_7;
  v50[3] = &unk_1E64A46E8;
  long long v41 = *(_OWORD *)(a1 + 40);
  id v25 = (id)v41;
  long long v51 = v41;
  +[ICHashtag enumerateHashtagsInContext:v24 batchSize:10 saveAfterBatch:0 usingBlock:v50];
  v26 = +[ICDeviceMigrationState allDeviceMigrationStatesInContext:*(void *)(a1 + 32)];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v71 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(a1 + 48) addLoggable:*(void *)(*((void *)&v46 + 1) + 8 * k) toDictionary:*(void *)(a1 + 40)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v71 count:16];
    }
    while (v28);
  }

  v31 = +[ICServerChangeToken serverChangeTokensMatchingPredicate:0 inContext:*(void *)(a1 + 32)];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v70 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v43;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(a1 + 48) addLoggable:*(void *)(*((void *)&v42 + 1) + 8 * m) toDictionary:*(void *)(a1 + 40)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v70 count:16];
    }
    while (v33);
  }
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) addLoggable:a2 toDictionary:*(void *)(a1 + 32)];
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) addLoggable:a2 toDictionary:*(void *)(a1 + 32)];
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) addLoggable:a2 toDictionary:*(void *)(a1 + 32)];
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) addLoggable:a2 toDictionary:*(void *)(a1 + 32)];
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) addLoggable:a2 toDictionary:*(void *)(a1 + 32)];
}

uint64_t __45__ICDatabaseStateHandler_modernDatabaseState__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) addLoggable:a2 toDictionary:*(void *)(a1 + 32)];
}

+ (id)stateDictionaryFromLoggables:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(a1, "addLoggable:toDictionary:", *(void *)(*((void *)&v12 + 1) + 8 * i), v5, (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (void)addLoggable:(id)a3 toDictionary:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setObject:v8 forKeyedSubscript:v7];
  }
  uint64_t v9 = objc_msgSend(v11, "ic_loggingIdentifier");
  if (!v9)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v11);
  }
  uint64_t v10 = objc_msgSend(v11, "ic_loggingValues");
  if (v10) {
    [v8 setObject:v10 forKeyedSubscript:v9];
  }
}

@end