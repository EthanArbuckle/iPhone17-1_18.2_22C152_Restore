@interface _PSPhotoUtils
+ (id)assetsWithIdentifiers:(id)a3;
+ (id)candidateContactsIdentifiersFromPhotoSuggestedPeople:(id)a3;
+ (id)candidateLocalIdentifiersFromPhotoSuggestedPeople:(id)a3;
+ (id)sceneAnalysisFromAssets:(id)a3;
+ (void)prewarmPhotosFrameworks;
@end

@implementation _PSPhotoUtils

+ (void)prewarmPhotosFrameworks
{
  if (prewarmPhotosFrameworks_prewarmOnce != -1) {
    dispatch_once(&prewarmPhotosFrameworks_prewarmOnce, &__block_literal_global_27);
  }
}

+ (id)assetsWithIdentifiers:(id)a3
{
  v26[1] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v4 = (void *)getPHFetchOptionsClass_softClass;
  uint64_t v25 = getPHFetchOptionsClass_softClass;
  if (!getPHFetchOptionsClass_softClass)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __getPHFetchOptionsClass_block_invoke;
    v20 = &unk_1E5ADE858;
    v21 = &v22;
    PhotosLibraryCore();
    v23[3] = (uint64_t)objc_getClass("PHFetchOptions");
    getPHFetchOptionsClass_softClass Class = *(void *)(v21[1] + 24);
    v4 = (void *)v23[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v22, 8);
  v6 = [v5 fetchOptionsWithInclusiveDefaults];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  v7 = (id *)getPHAssetPropertySetSceneAnalysisSymbolLoc_ptr;
  uint64_t v25 = getPHAssetPropertySetSceneAnalysisSymbolLoc_ptr;
  if (!getPHAssetPropertySetSceneAnalysisSymbolLoc_ptr)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __getPHAssetPropertySetSceneAnalysisSymbolLoc_block_invoke;
    v20 = &unk_1E5ADE858;
    v21 = &v22;
    __getPHAssetPropertySetSceneAnalysisSymbolLoc_block_invoke((uint64_t)&v17);
    v7 = (id *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v7)
  {
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  v26[0] = *v7;
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = v26[0];
  v10 = [v8 arrayWithObjects:v26 count:1];

  [v6 setFetchPropertySets:v10];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v11 = (void *)getPHAssetClass_softClass;
  uint64_t v25 = getPHAssetClass_softClass;
  if (!getPHAssetClass_softClass)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __getPHAssetClass_block_invoke;
    v20 = &unk_1E5ADE858;
    v21 = &v22;
    PhotosLibraryCore();
    Class Class = objc_getClass("PHAsset");
    *(void *)(v21[1] + 24) = Class;
    getPHAssetClass_softClass Class = *(void *)(v21[1] + 24);
    v11 = (void *)v23[3];
  }
  id v13 = v11;
  _Block_object_dispose(&v22, 8);
  v14 = [v13 fetchAssetsWithLocalIdentifiers:v3 options:v6];
  v15 = [v14 fetchedObjects];

  return v15;
}

+ (id)sceneAnalysisFromAssets:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 URLForResource:@"blacklistedScenes" withExtension:@"plist"];
  id v45 = 0;
  v7 = [v4 arrayWithContentsOfURL:v6 error:&v45];
  id v8 = v45;

  if (v8)
  {
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[_PSPhotoUtils sceneAnalysisFromAssets:]((uint64_t)v8, v9);
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v36 = [MEMORY[0x1E4F1CA80] set];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v31 = v3;
    id obj = v3;
    uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v42;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v42 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = v11;
          v12 = [*(id *)(*((void *)&v41 + 1) + 8 * v11) sceneClassifications];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v38 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                [v17 confidence];
                double v19 = v18;
                uint64_t v20 = [v17 sceneIdentifier];
                v21 = [getPFSceneTaxonomyClass() sharedTaxonomy];
                uint64_t v22 = [v21 nodeForSceneClassId:v20];

                if (v22)
                {
                  v23 = [v22 name];
                  char v24 = [v7 containsObject:v23];

                  if ((v24 & 1) == 0)
                  {
                    [v22 highRecallThreshold];
                    if (v19 >= v25)
                    {
                      [v22 highPrecisionThreshold];
                      double v27 = v26;
                      v28 = [NSNumber numberWithUnsignedInt:v20];
                      v29 = [v28 stringValue];

                      if (v29 && v19 >= v27) {
                        [v36 addObject:v29];
                      }
                    }
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v14);
          }

          uint64_t v11 = v35 + 1;
        }
        while (v35 + 1 != v34);
        uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v34);
    }

    id v9 = v36;
    v10 = [v36 allObjects];
    id v8 = 0;
    id v3 = v31;
  }

  return v10;
}

+ (id)candidateContactsIdentifiersFromPhotoSuggestedPeople:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"contactIdentifier", (void)v14);

          if (v11)
          {
            v12 = [v10 objectForKeyedSubscript:@"contactIdentifier"];
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }

  return v4;
}

+ (id)candidateLocalIdentifiersFromPhotoSuggestedPeople:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"localIdentifier", (void)v14);

          if (v11)
          {
            v12 = [v10 objectForKeyedSubscript:@"localIdentifier"];
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }

  return v4;
}

+ (void)sceneAnalysisFromAssets:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error loading scene backlist = %@", (uint8_t *)&v2, 0xCu);
}

@end