@interface WFInputContentClassesMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
+ (id)addedContentItemClassesByVersion;
- (void)migrateWorkflow;
@end

@implementation WFInputContentClassesMigration

+ (id)addedContentItemClassesByVersion
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1F2316758;
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"WFSafariWebPageContentItem"];
  v9[0] = v2;
  v8[1] = &unk_1F2316770;
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"WFArticleContentItem"];
  v9[1] = v3;
  v8[2] = &unk_1F2316788;
  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"WFiTunesProductContentItem", @"WFAppStoreAppContentItem", 0);
  v9[2] = v4;
  v8[3] = &unk_1F23167A0;
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"WFFolderContentItem"];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"327") == 3)
  {
    v6 = [v5 objectForKey:@"WFWorkflowInputContentItemClasses"];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)migrateWorkflow
{
  v3 = [(WFWorkflowMigration *)self workflow];
  v4 = [v3 objectForKey:@"WFWorkflowInputContentItemClasses"];

  if ([v4 containsObject:@"WFAudiovisualContentItem"])
  {
    [v4 removeObject:@"WFAudiovisualContentItem"];
    [v4 addObject:@"WFAVAssetContentItem"];
  }
  id v5 = [(WFWorkflowMigration *)self workflow];
  v6 = [v5 objectForKey:@"WFWorkflowClientVersion"];
  uint64_t v7 = [v6 integerValue];

  v8 = [(id)objc_opt_class() addedContentItemClassesByVersion];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __49__WFInputContentClassesMigration_migrateWorkflow__block_invoke;
  v13 = &unk_1E654F5E8;
  id v14 = v4;
  uint64_t v15 = v7;
  id v9 = v4;
  [v8 enumerateKeysAndObjectsUsingBlock:&v10];

  [(WFWorkflowMigration *)self finish];
}

void __49__WFInputContentClassesMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 < [a2 integerValue])
  {
    uint64_t v7 = +[WFWorkflow supportedInputClassNames];
    v8 = [v7 set];
    id v9 = (void *)[v8 mutableCopy];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          [v9 removeObject:*(void *)(*((void *)&v26 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v12);
    }

    uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
    int v16 = [v15 isEqualToSet:v9];

    if (v16)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v17 = v10;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v23;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(v17);
            }
            objc_msgSend(*(id *)(a1 + 32), "addObject:", *(void *)(*((void *)&v22 + 1) + 8 * v21++), (void)v22);
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v19);
      }
    }
  }
}

@end