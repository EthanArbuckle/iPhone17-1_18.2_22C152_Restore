@interface PXSearchTaxonomyUtility
+ (id)localizedSceneAncestryInformationWithError:(id *)a3;
@end

@implementation PXSearchTaxonomyUtility

+ (id)localizedSceneAncestryInformationWithError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PXSearchTaxonomyUtility_localizedSceneAncestryInformationWithError___block_invoke;
  aBlock[3] = &unk_1E5DB0EB0;
  aBlock[4] = &v23;
  v22 = (void (**)(id, void *, void *, id))_Block_copy(aBlock);
  v24[3] = (uint64_t)&v22;
  id v4 = objc_alloc_init(MEMORY[0x1E4F8ABA8]);
  v5 = [v4 latestSceneTaxonomy];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = objc_msgSend(v5, "rootNode", 0);
    v8 = [v7 children];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v12 isIndexed])
          {
            v13 = [v12 localizedLabel];
          }
          else
          {
            v13 = 0;
          }
          v14 = v22;
          v15 = [v12 children];
          v14[2](v14, v13, v15, v6);
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v27 count:16];
      }
      while (v9);
    }
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Error allocating latest version of PFSceneTaxonomy for scene ancestry information");
    id v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v6;
}

void __70__PXSearchTaxonomyUtility_localizedSceneAncestryInformationWithError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v14 isIndexed])
        {
          uint64_t v15 = [v14 localizedLabel];
          id v16 = (id)v15;
          if (v7 && v15) {
            [v9 setObject:v7 forKeyedSubscript:v15];
          }
        }
        else
        {
          id v16 = v7;
        }
        long long v17 = [v14 children];
        long long v18 = v17;
        if (v17 && [v17 count]) {
          (*(void (**)(void))(**(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 16))();
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

@end