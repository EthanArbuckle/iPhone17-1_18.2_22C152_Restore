@interface PLGeneratedAssetDescription
+ (id)_fetchGeneratedAssetDescriptionEdgesForAsset:(id)a3;
+ (id)_labelIDWithCode:(unsigned int)a3 context:(id)a4;
+ (id)_labelWithCode:(unsigned int)a3 context:(id)a4;
+ (id)_newNodeContainerWithManagedObjectContext:(id)a3 dictionary:(id)a4;
+ (id)fetchGeneratedAssetDescriptionNodesForAsset:(id)a3;
+ (id)fetchGeneratedAssetDescriptionsGroupedByAssetIdWithType:(int64_t)a3 forAssetsIDs:(id)a4 inLibrary:(id)a5;
+ (id)newNodeContainerWithManagedObjectContext:(id)a3;
+ (void)_enumerateGraphNodesForAssetObjectIDs:(id)a3 inContext:(id)a4 withBlock:(id)a5;
+ (void)_updateAsset:(id)a3 nodeContainer:(id)a4;
+ (void)prepareForDeletingIncomingEdge:(id)a3;
+ (void)resetGeneratedAssetDescriptionsForAsset:(id)a3;
+ (void)resetGeneratedAssetDescriptionsForAsset:(id)a3 sourceTypes:(id)a4;
+ (void)setGeneratedAssetDescriptionForAsset:(id)a3 fromDictionaries:(id)a4;
- (NSString)descriptionText;
- (id)_insertEdgeForAsset:(id)a3;
- (id)asset;
- (id)description;
- (int64_t)analysisSourceType;
- (signed)analysisVersion;
- (void)_updateChangeFlagForProperties;
- (void)setAnalysisSourceType:(int64_t)a3;
- (void)setAnalysisVersion:(signed __int16)a3;
- (void)setDescriptionText:(id)a3;
@end

@implementation PLGeneratedAssetDescription

+ (void)resetGeneratedAssetDescriptionsForAsset:(id)a3 sourceTypes:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 containsObject:&unk_1EEBED4E8];
  unsigned int v9 = [v7 containsObject:&unk_1EEBED500];
  if (v8 && v9)
  {
    [a1 resetGeneratedAssetDescriptionsForAsset:v6];
  }
  else
  {
    objc_msgSend(v6, "managedObjectContext", __PAIR64__(v9, v8));
    v30 = v29 = v6;
    +[PLGeneratedAssetDescription _fetchGeneratedAssetDescriptionEdgesForAsset:v6];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v15 = [PLGeneratedAssetDescription alloc];
          v16 = [v14 targetNode];
          v17 = [(PLGraphNodeContainer *)v15 initWithNode:v16];

          v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLGeneratedAssetDescription analysisSourceType](v17, "analysisSourceType"));
          int v19 = [v7 containsObject:v18];

          if (v19)
          {
            v20 = [v14 targetNode];
            [v30 deleteObject:v20];
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v11);
    }
    id v6 = v29;
    if (v27)
    {
      v21 = [v29 mediaAnalysisAttributes];
      int v22 = [v21 imageCaptionVersion];

      if (v22)
      {
        v23 = [v29 mediaAnalysisAttributes];
        [v23 setImageCaptionVersion:0];
      }
    }
    if (v28)
    {
      v24 = [v29 mediaAnalysisAttributes];
      int v25 = [v24 videoCaptionVersion];

      if (v25)
      {
        v26 = [v29 mediaAnalysisAttributes];
        [v26 setVideoCaptionVersion:0];
      }
    }
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(PLGeneratedAssetDescription *)self asset];
  v5 = objc_msgSend(v4, "pl_shortDescription");
  id v6 = [(PLGeneratedAssetDescription *)self descriptionText];
  id v7 = [v3 stringWithFormat:@"\nasset: %@\ndescriptionText: %@\nanalysisVersion: %llu\nanalysisSourceType: %ld", v5, v6, -[PLGeneratedAssetDescription analysisVersion](self, "analysisVersion"), -[PLGeneratedAssetDescription analysisSourceType](self, "analysisSourceType")];

  return v7;
}

- (void)_updateChangeFlagForProperties
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  objc_msgSend(v2, "setChangeFlag0:", objc_msgSend(v2, "changeFlag0") + 1);
}

- (id)asset
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  v3 = [v2 edgesIn];
  v4 = [v3 anyObject];
  v5 = [v4 sourceAsset];

  return v5;
}

- (void)setAnalysisSourceType:(int64_t)a3
{
  v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 nodeValueWithName:@"analysisSourceType" createIfMissing:1];

  [v6 setIntValue:a3];
  [(PLGeneratedAssetDescription *)self _updateChangeFlagForProperties];
}

- (int64_t)analysisSourceType
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  v3 = [v2 nodeValueWithName:@"analysisSourceType"];

  int64_t v4 = [v3 intValue];
  return v4;
}

- (void)setAnalysisVersion:(signed __int16)a3
{
  int v3 = a3;
  v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 nodeValueWithName:@"analysisVersion" createIfMissing:1];

  [v6 setIntValue:v3];
  [(PLGeneratedAssetDescription *)self _updateChangeFlagForProperties];
}

- (signed)analysisVersion
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  int v3 = [v2 nodeValueWithName:@"analysisVersion"];

  LOWORD(v2) = [v3 intValue];
  return (__int16)v2;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 nodeValueWithName:@"descriptionText" createIfMissing:1];

  [v6 setStringValue:v4];
  [(PLGeneratedAssetDescription *)self _updateChangeFlagForProperties];
}

- (NSString)descriptionText
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  int v3 = [v2 nodeValueWithName:@"descriptionText"];

  id v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (id)_insertEdgeForAsset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLGeneratedAssetDescription.m", 63, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v6 = [(PLGraphNodeContainer *)self sourceNode];
  id v7 = [v6 managedObjectContext];

  unsigned int v8 = +[PLGraphEdge entityName];
  unsigned int v9 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);

  uint64_t v10 = +[PLGeneratedAssetDescription _labelWithCode:1300 context:v7];
  [v9 setPrimaryLabel:v10];

  uint64_t v11 = [(PLGraphNodeContainer *)self sourceNode];
  [v9 setTargetNode:v11];

  [v9 setSourceAsset:v5];
  return v9;
}

+ (void)resetGeneratedAssetDescriptionsForAsset:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  id v5 = +[PLGeneratedAssetDescription _fetchGeneratedAssetDescriptionEdgesForAsset:v3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * v9) targetNode];
        [v4 deleteObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  uint64_t v11 = [v3 mediaAnalysisAttributes];
  int v12 = [v11 imageCaptionVersion];

  if (v12)
  {
    v13 = [v3 mediaAnalysisAttributes];
    [v13 setImageCaptionVersion:0];
  }
  v14 = [v3 mediaAnalysisAttributes];
  int v15 = [v14 videoCaptionVersion];

  if (v15)
  {
    v16 = [v3 mediaAnalysisAttributes];
    [v16 setVideoCaptionVersion:0];
  }
}

+ (void)setGeneratedAssetDescriptionForAsset:(id)a3 fromDictionaries:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v39 = a4;
  uint64_t v6 = (void *)[v39 mutableCopy];
  uint64_t v7 = v5;
  +[PLGeneratedAssetDescription _fetchGeneratedAssetDescriptionEdgesForAsset:v5];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v35 = (id)[obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v50;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v8;
        uint64_t v9 = [*(id *)(*((void *)&v49 + 1) + 8 * v8) targetNode];
        id v10 = +[PLGraphNodeContainer newNodeContainerWithNode:v9];

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v11 = v39;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v46 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              uint64_t v17 = [v16 integerValue];
              if (v17 == [v10 analysisSourceType])
              {
                long long v18 = [v11 objectForKeyedSubscript:v16];
                long long v19 = [v18 objectForKeyedSubscript:@"descriptionText"];
                [v10 setDescriptionText:v19];

                long long v20 = [v11 objectForKeyedSubscript:v16];
                v21 = [v20 objectForKeyedSubscript:@"analysisVersion"];
                objc_msgSend(v10, "setAnalysisVersion:", (__int16)objc_msgSend(v21, "integerValue"));

                [a1 _updateAsset:v7 nodeContainer:v10];
                [v6 removeObjectForKey:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }
          while (v13);
        }

        uint64_t v8 = v37 + 1;
      }
      while ((id)(v37 + 1) != v35);
      id v35 = (id)[obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v35);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v36 = v6;
  uint64_t v22 = [v36 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v38 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v42 != v38) {
          objc_enumerationMutation(v36);
        }
        int v25 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        v26 = [v7 managedObjectContext];
        int v27 = (void *)[a1 newNodeContainerWithManagedObjectContext:v26];

        int v28 = [v39 objectForKeyedSubscript:v25];
        v29 = [v28 objectForKeyedSubscript:@"descriptionText"];
        [v27 setDescriptionText:v29];

        v30 = [v39 objectForKeyedSubscript:v25];
        v31 = [v30 objectForKeyedSubscript:@"analysisVersion"];
        objc_msgSend(v27, "setAnalysisVersion:", (__int16)objc_msgSend(v31, "integerValue"));

        objc_msgSend(v27, "setAnalysisSourceType:", objc_msgSend(v25, "integerValue"));
        id v32 = (id)[v27 _insertEdgeForAsset:v7];
        [a1 _updateAsset:v7 nodeContainer:v27];
      }
      uint64_t v23 = [v36 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v23);
  }
}

+ (void)_updateAsset:(id)a3 nodeContainer:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (![v7 analysisSourceType])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PLGeneratedAssetDescription.m", 198, @"Invalid parameter not satisfying: %@", @"description.analysisSourceType != PLGeneratedAssetDescriptionSourceTypeUnknown" object file lineNumber description];
  }
  uint64_t v8 = [v11 mediaAnalysisAttributesInsertingIfNecessary];
  uint64_t v9 = [v7 analysisSourceType];
  if (v9 == 2)
  {
    objc_msgSend(v8, "setVideoCaptionVersion:", objc_msgSend(v7, "analysisVersion"));
  }
  else if (v9 == 1)
  {
    objc_msgSend(v8, "setImageCaptionVersion:", objc_msgSend(v7, "analysisVersion"));
  }
}

+ (void)_enumerateGraphNodesForAssetObjectIDs:(id)a3 inContext:(id)a4 withBlock:(id)a5
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[PLGeneratedAssetDescription _labelIDWithCode:1300 context:v8];
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"primaryLabel", v10];
  v34[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"sourceAsset", v7];
  v34[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  int v15 = [v11 andPredicateWithSubpredicates:v14];

  v16 = +[PLGraphEdge fetchRequest];
  [v16 setPredicate:v15];
  [v16 setResultType:2];
  [v16 setFetchBatchSize:200];
  v33[0] = @"objectID";
  v33[1] = @"targetNode";
  v33[2] = @"sourceAsset";
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  [v16 setPropertiesToFetch:v17];

  id v32 = @"targetNode";
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  [v16 setRelationshipKeyPathsForPrefetching:v18];

  id v27 = 0;
  long long v19 = [v8 executeFetchRequest:v16 error:&v27];
  id v20 = v27;
  if (!v19)
  {
    v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = v20;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to fetch generated asset descriptions for assets %{public}@ with error %@", buf, 0x16u);
    }
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __89__PLGeneratedAssetDescription__enumerateGraphNodesForAssetObjectIDs_inContext_withBlock___block_invoke;
  v24[3] = &unk_1E586E608;
  id v25 = v8;
  id v26 = v9;
  id v22 = v9;
  id v23 = v8;
  [v19 enumerateObjectsUsingBlock:v24];
}

void __89__PLGeneratedAssetDescription__enumerateGraphNodesForAssetObjectIDs_inContext_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = a2;
  uint64_t v6 = [v10 objectForKeyedSubscript:@"targetNode"];
  id v7 = [*(id *)(a1 + 32) objectWithID:v6];
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [v10 objectForKeyedSubscript:@"sourceAsset"];
    (*(void (**)(uint64_t, void *, void *, uint64_t))(v8 + 16))(v8, v7, v9, a4);
  }
}

+ (id)fetchGeneratedAssetDescriptionNodesForAsset:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = [v5 objectID];
  id v9 = [v7 setWithObject:v8];
  id v10 = [v5 managedObjectContext];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PLGeneratedAssetDescription_fetchGeneratedAssetDescriptionNodesForAsset___block_invoke;
  v13[3] = &unk_1E5864808;
  id v11 = v6;
  id v14 = v11;
  [a1 _enumerateGraphNodesForAssetObjectIDs:v9 inContext:v10 withBlock:v13];

  return v11;
}

uint64_t __75__PLGeneratedAssetDescription_fetchGeneratedAssetDescriptionNodesForAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)fetchGeneratedAssetDescriptionsGroupedByAssetIdWithType:(int64_t)a3 forAssetsIDs:(id)a4 inLibrary:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = [v8 dictionary];
  id v11 = [v9 managedObjectContext];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __110__PLGeneratedAssetDescription_fetchGeneratedAssetDescriptionsGroupedByAssetIdWithType_forAssetsIDs_inLibrary___block_invoke;
  v18[3] = &unk_1E58735D8;
  id v19 = v11;
  id v20 = v7;
  int64_t v22 = a3;
  id v12 = v10;
  id v21 = v12;
  id v13 = v7;
  id v14 = v11;
  [v9 performBlockAndWait:v18];

  int v15 = v21;
  id v16 = v12;

  return v16;
}

void __110__PLGeneratedAssetDescription_fetchGeneratedAssetDescriptionsGroupedByAssetIdWithType_forAssetsIDs_inLibrary___block_invoke(uint64_t a1)
{
  v43[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLGeneratedAssetDescription _labelIDWithCode:1300 context:*(void *)(a1 + 32)];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v31 = (void *)v2;
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(%K) == %@", @"primaryLabel", v2];
  v43[0] = v4;
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"sourceAsset", *(void *)(a1 + 40)];
  v43[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  uint64_t v7 = [v3 andPredicateWithSubpredicates:v6];

  uint64_t v8 = +[PLGraphEdge fetchRequest];
  __int16 v30 = (void *)v7;
  [v8 setPredicate:v7];
  [v8 setResultType:0];
  long long v42 = @"targetNode";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  [v8 setRelationshipKeyPathsForPrefetching:v9];

  id v10 = *(void **)(a1 + 32);
  id v36 = 0;
  id v29 = v8;
  id v11 = [v10 executeFetchRequest:v8 error:&v36];
  id v12 = v36;
  if (!v11)
  {
    id v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = v14;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch generated asset descriptions for assets %@ with error %@", buf, 0x16u);
    }
  }
  int v28 = v12;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v21 = [v20 targetNode];
        int64_t v22 = [v20 sourceAsset];
        id v23 = [v22 objectID];

        id v24 = +[PLGraphNodeContainer newNodeContainerWithNode:v21];
        if ([v24 analysisSourceType] == *(void *)(a1 + 56))
        {
          id v25 = [*(id *)(a1 + 48) objectForKeyedSubscript:v23];

          if (v25)
          {
            id v26 = PLBackendGetLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              uint64_t v27 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 134218242;
              uint64_t v39 = v27;
              __int16 v40 = 2114;
              id v41 = v23;
              _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Found more that one generated asset description node for type %ld for asset %{public}@", buf, 0x16u);
            }
          }
          [*(id *)(a1 + 48) setObject:v24 forKeyedSubscript:v23];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v17);
  }
}

+ (id)_fetchGeneratedAssetDescriptionEdgesForAsset:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = +[PLGraphEdge entityName];
  uint64_t v7 = [v5 fetchRequestWithEntityName:v6];

  uint64_t v8 = +[PLGeneratedAssetDescription _labelIDWithCode:1300 context:v4];
  id v9 = (void *)MEMORY[0x1E4F28BA0];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"primaryLabel", v8];
  v22[0] = v10;
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"sourceAsset", v3];

  v22[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v13 = [v9 andPredicateWithSubpredicates:v12];
  [v7 setPredicate:v13];

  id v19 = 0;
  uint64_t v14 = [v4 executeFetchRequest:v7 error:&v19];
  id v15 = v19;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    uint64_t v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v15;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Fetch for edges failed: %@", buf, 0xCu);
    }
  }
  return v14;
}

+ (id)_newNodeContainerWithManagedObjectContext:(id)a3 dictionary:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[a1 newNodeContainerWithManagedObjectContext:a3];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"descriptionText"];
  [v7 setDescriptionText:v8];

  id v9 = [v6 objectForKeyedSubscript:@"analysisVersion"];
  objc_msgSend(v7, "setAnalysisVersion:", (__int16)objc_msgSend(v9, "integerValue"));

  id v10 = [v6 objectForKeyedSubscript:@"analysisSourceType"];

  objc_msgSend(v7, "setAnalysisSourceType:", objc_msgSend(v10, "integerValue"));
  return v7;
}

+ (id)_labelIDWithCode:(unsigned int)a3 context:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = objc_msgSend(v5, "pl_graphCache");
  uint64_t v7 = [v6 objectIDForLabelWithCode:v4 inContext:v5];

  return v7;
}

+ (id)_labelWithCode:(unsigned int)a3 context:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = objc_msgSend(v5, "pl_graphCache");
  uint64_t v7 = [v6 labelWithCode:v4 inContext:v5];

  return v7;
}

+ (void)prepareForDeletingIncomingEdge:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PLGeneratedAssetDescription;
  id v3 = a3;
  objc_msgSendSuper2(&v6, sel_prepareForDeletingIncomingEdge_, v3);
  uint64_t v4 = objc_msgSend(v3, "managedObjectContext", v6.receiver, v6.super_class);
  id v5 = [v3 targetNode];

  [v4 deleteObject:v5];
}

+ (id)newNodeContainerWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "pl_graphCache");
  objc_super v6 = [v5 labelWithCode:1300 inContext:v4];
  uint64_t v7 = +[PLGraphNode insertGraphNodeInContext:v4 withPrimaryLabel:v6];

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___PLGeneratedAssetDescription;
  uint64_t v8 = objc_msgSend(objc_msgSendSuper2(&v12, sel_alloc), "initWithNode:", v7);
  id v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = [v9 UUIDString];
  [v8 setUuid:v10];

  return v8;
}

@end