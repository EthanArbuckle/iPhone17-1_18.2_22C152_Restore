@interface PLSearchIndexSceneTaxonomy
- (void)enumerateKeywordAndSynonymsForSceneIdentifiers:(id)a3 usingBlock:(id)a4;
- (void)enumerateKeywordAndSynonymsForScenes:(id)a3 usingBlock:(id)a4;
@end

@implementation PLSearchIndexSceneTaxonomy

- (void)enumerateKeywordAndSynonymsForSceneIdentifiers:(id)a3 usingBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, void *, uint64_t))a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x19F38D3B0]();
        if (PLIsNodeAllowedForSearch(-[PLSearchIndexSceneTaxonomy nodeRefForExtendedSceneClassId:](self, "nodeRefForExtendedSceneClassId:", [v12 unsignedIntegerValue])))
        {
          v14 = PFSceneTaxonomyNodeLocalizedLabel();
          v15 = PFSceneTaxonomyNodeLocalizedSynonyms();
          v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
          uint64_t v17 = PFSceneTaxonomyNodeExtendedSceneClassId();
          v7[2](v7, v14, v16, v17);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (void)enumerateKeywordAndSynonymsForScenes:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F28E60];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__PLSearchIndexSceneTaxonomy_enumerateKeywordAndSynonymsForScenes_usingBlock___block_invoke;
  v12[3] = &unk_1E58659B0;
  v12[4] = self;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  [v8 enumerateObjectsUsingBlock:v12];
}

void __78__PLSearchIndexSceneTaxonomy_enumerateKeywordAndSynonymsForScenes_usingBlock___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (([v3 classificationType] & 0xFFFFFFFD) == 0)
  {
    if (objc_msgSend(a1[4], "nodeRefForExtendedSceneClassId:", objc_msgSend(v3, "sceneIdentifier")))
    {
      if ((PFSceneTaxonomyNodeIsRoot() & 1) == 0)
      {
        if (PFSceneTaxonomyNodeIsIndexed())
        {
          [v3 confidence];
          double v5 = v4;
          PFSceneTaxonomyNodeSearchThreshold();
          if (v5 >= v6)
          {
            id v7 = a1[5];
            id v9 = a1[6];
            id v8 = v3;
            PFSceneTaxonomyNodeTraverseParents();
          }
        }
      }
    }
  }
}

uint64_t __78__PLSearchIndexSceneTaxonomy_enumerateKeywordAndSynonymsForScenes_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = PLIsNodeAllowedForSearch(a2);
  if (result)
  {
    uint64_t v6 = *(void *)(a3 + 16);
    if ([*(id *)(a1 + 32) containsIndex:v6])
    {
      return 1;
    }
    else
    {
      id v7 = PFSceneTaxonomyNodeLocalizedLabel();
      id v8 = PFSceneTaxonomyNodeLocalizedSynonyms();
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
      (*(void (**)(uint64_t, uint64_t, void *, void *, uint64_t))(v9 + 16))(v9, v10, v7, v11, v6);

      [*(id *)(a1 + 32) addIndex:v6];
      return 0;
    }
  }
  return result;
}

@end