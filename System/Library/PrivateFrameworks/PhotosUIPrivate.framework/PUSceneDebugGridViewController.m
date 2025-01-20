@interface PUSceneDebugGridViewController
- (BOOL)_isJunkSceneIdentifer:(id)a3;
- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4;
- (BOOL)allowSlideshowButton;
- (BOOL)assetConfidenceIsAboveThreshold:(id)a3;
- (BOOL)assetShouldBeSurpassedInNormalUI:(id)a3;
- (NSDictionary)assetsHighestConfidence;
- (NSNumber)sceneIdentifier;
- (double)_thresholdForSceneIdentifer:(id)a3;
- (double)globalHeaderHeight;
- (id)_assetResourceForAsset:(id)a3;
- (id)_assetResourceFromAcceptableAssetResources:(id)a3;
- (id)_cloneAsset:(id)a3 toDirectory:(id)a4;
- (id)_globalHeaderTitle;
- (id)_keywordForSceneIdentifier:(id)a3;
- (id)_labelForSceneIdentifier:(id)a3;
- (id)_localFileURLForAssetResource:(id)a3 error:(id *)a4;
- (id)_newEditActionItemsWithWideSpacing:(BOOL)a3;
- (id)_preferredAssetResourcesForAnalyzingAsset:(id)a3;
- (id)sceneTaxonomy;
- (void)_fileRadarWithIncorrectAssets:(id)a3;
- (void)_tappedFileRadarButton:(id)a3;
- (void)configureDecorationsForCell:(id)a3 withAsset:(id)a4 assetCollection:(id)a5 thumbnailIsPlaceholder:(BOOL)a6 assetMayHaveChanged:(BOOL)a7;
- (void)configureGlobalHeaderView:(id)a3;
- (void)getEmptyPlaceholderViewTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 buttonAction:(id *)a6;
- (void)setAssetsHighestConfidence:(id)a3;
- (void)setSceneIdentifier:(id)a3;
@end

@implementation PUSceneDebugGridViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsHighestConfidence, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

- (void)setAssetsHighestConfidence:(id)a3
{
}

- (NSDictionary)assetsHighestConfidence
{
  return self->_assetsHighestConfidence;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (NSNumber)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (id)_preferredAssetResourcesForAnalyzingAsset:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isTable = NO AND isThumbnail = YES AND maxSideLengthIfSquare >= 256"];
  v6 = (void *)MEMORY[0x1E4F38F88];
  v7 = [v3 photoLibrary];
  v8 = [v6 allQualityClassesMatchingPredicate:v5 inLibrary:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(MEMORY[0x1E4F38F60], "assetResourceForAsset:qualityClass:", v3, *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v14) {
          [v4 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v4 sortUsingComparator:&__block_literal_global_436];
  return v4;
}

uint64_t __76__PUSceneDebugGridViewController__preferredAssetResourcesForAnalyzingAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = [v6 pixelWidth];
  unint64_t v9 = [v6 pixelHeight] * v8;
  uint64_t v10 = [v7 pixelWidth];
  uint64_t v11 = [v7 pixelHeight];
  if (v9 <= v11 * v10)
  {
    if (v9 >= v11 * v10)
    {
      v13 = [v6 assetLocalIdentifier];
      v14 = [v7 assetLocalIdentifier];
      uint64_t v12 = [v13 compare:v14];
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (id)_assetResourceFromAcceptableAssetResources:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = -[PUSceneDebugGridViewController _localFileURLForAssetResource:error:](self, "_localFileURLForAssetResource:error:", v10, 0, (void)v15);
          if (v11)
          {
            v13 = (void *)v11;
            id v12 = v10;

            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v12 = [v5 firstObject];
  }
  else
  {
    id v12 = 0;
  }
LABEL_13:

  return v12;
}

- (id)_localFileURLForAssetResource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F38F98]);
  [v6 setNetworkAccessAllowed:0];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__80254;
  v28 = __Block_byref_object_dispose__80255;
  id v29 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__80254;
  v22 = __Block_byref_object_dispose__80255;
  id v23 = 0;
  uint64_t v8 = [MEMORY[0x1E4F38F78] defaultManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__PUSceneDebugGridViewController__localFileURLForAssetResource_error___block_invoke;
  v17[3] = &unk_1E5F2B910;
  v17[4] = &v24;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PUSceneDebugGridViewController__localFileURLForAssetResource_error___block_invoke_2;
  v13[3] = &unk_1E5F2B938;
  long long v15 = &v24;
  long long v16 = &v18;
  unint64_t v9 = v7;
  v14 = v9;
  if ([v8 requestFileURLForAssetResource:v5 options:v6 urlReceivedHandler:v17 completionHandler:v13])
  {
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v10 = (void *)v25[5];
    if (v10)
    {
      id v11 = v10;
      goto LABEL_9;
    }
    if (a4)
    {
      id v11 = 0;
      *a4 = (id) v19[5];
      goto LABEL_9;
    }
  }
  else if (a4)
  {
    id v11 = 0;
    *a4 = 0;
    goto LABEL_9;
  }
  id v11 = 0;
LABEL_9:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __70__PUSceneDebugGridViewController__localFileURLForAssetResource_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__PUSceneDebugGridViewController__localFileURLForAssetResource_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isJunkSceneIdentifer:(id)a3
{
  return [a3 unsignedIntValue] == 0x7FFFFFFF;
}

- (double)_thresholdForSceneIdentifer:(id)a3
{
  id v4 = a3;
  if ([(PUSceneDebugGridViewController *)self _isJunkSceneIdentifer:v4])
  {
    double v5 = 0.15;
  }
  else
  {
    id v6 = [(PUSceneDebugGridViewController *)self sceneTaxonomy];
    objc_msgSend(v6, "nodeRefForExtendedSceneClassId:", objc_msgSend(v4, "unsignedLongLongValue"));
    PFSceneTaxonomyNodeSearchThreshold();
    double v5 = v7;
  }
  return v5;
}

- (id)_labelForSceneIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(PUSceneDebugGridViewController *)self sceneTaxonomy];
  objc_msgSend(v5, "nodeRefForExtendedSceneClassId:", objc_msgSend(v4, "unsignedLongLongValue"));
  id v6 = PFSceneTaxonomyNodeName();
  if (!v6)
  {
    uint64_t v7 = [v4 unsignedIntegerValue];
    uint64_t v8 = [0 localizedDescription];
    NSLog(&cfstr_FailedToGetLab.isa, v7, v8);
  }
  return v6;
}

- (id)_keywordForSceneIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(PUSceneDebugGridViewController *)self sceneTaxonomy];
  objc_msgSend(v5, "nodeRefForExtendedSceneClassId:", objc_msgSend(v4, "unsignedLongLongValue"));
  id v6 = PFSceneTaxonomyNodeLocalizedLabel();
  if (!v6)
  {
    [v4 unsignedIntValue];
    uint64_t v7 = [v4 unsignedIntegerValue];
    uint64_t v8 = [0 localizedDescription];
    NSLog(&cfstr_FailedToGetLoc.isa, v7, v8);

    id v6 = 0;
  }

  return v6;
}

- (id)_assetResourceForAsset:(id)a3
{
  id v4 = [(PUSceneDebugGridViewController *)self _preferredAssetResourcesForAnalyzingAsset:a3];
  double v5 = [(PUSceneDebugGridViewController *)self _assetResourceFromAcceptableAssetResources:v4];

  return v5;
}

- (id)_cloneAsset:(id)a3 toDirectory:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PUSceneDebugGridViewController *)self _assetResourceForAsset:v6];
  id v22 = 0;
  unint64_t v9 = [(PUSceneDebugGridViewController *)self _localFileURLForAssetResource:v8 error:&v22];
  id v10 = v22;
  if (v9)
  {
    id v11 = [v6 uuid];
    id v12 = [v9 pathExtension];
    v13 = [v11 stringByAppendingPathExtension:v12];

    v14 = [v7 URLByAppendingPathComponent:v13];
    long long v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = v10;
    char v16 = [v15 copyItemAtURL:v9 toURL:v14 error:&v21];
    id v17 = v21;

    if (v16)
    {
      id v18 = v14;
    }
    else
    {
      long long v19 = PLUIGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v24 = v9;
        __int16 v25 = 2112;
        uint64_t v26 = v14;
        __int16 v27 = 2112;
        id v28 = v17;
        _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to clone asset file from URL: %@, to URL: %@, error: %@", buf, 0x20u);
      }

      id v18 = 0;
    }
  }
  else
  {
    v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v6;
      __int16 v25 = 2112;
      uint64_t v26 = v8;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "Scene Inspector: Failed to find file URL for asset: %@, assetResource: %@, error: %@", buf, 0x20u);
    }
    id v18 = 0;
    id v17 = v10;
  }

  return v18;
}

- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v92 = 0;
  v73 = v6;
  LOBYTE(v6) = [v8 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v92];
  unint64_t v9 = v92;

  if (v6)
  {
    v65 = v9;
    uint64_t v10 = PFMap();
    id v11 = (void *)MEMORY[0x1E4F390A0];
    id v68 = v7;
    id v12 = [v7 firstObject];
    v13 = [v11 fetchOptionsWithPhotoLibrary:0 orObject:v12];

    uint64_t v102 = *MEMORY[0x1E4F39538];
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
    [v13 setFetchPropertySets:v14];

    v66 = v13;
    v67 = v10;
    long long v15 = [MEMORY[0x1E4F38EB8] fetchAssetsWithObjectIDs:v10 options:v13];
    v69 = [(PUSceneDebugGridViewController *)self sceneIdentifier];
    -[PUSceneDebugGridViewController _thresholdForSceneIdentifer:](self, "_thresholdForSceneIdentifer:");
    double v17 = v16;
    v72 = objc_opt_new();
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id obj = v15;
    uint64_t v74 = [obj countByEnumeratingWithState:&v88 objects:v101 count:16];
    if (v74)
    {
      uint64_t v71 = *(void *)v89;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v89 != v71) {
            objc_enumerationMutation(obj);
          }
          long long v19 = *(void **)(*((void *)&v88 + 1) + 8 * v18);
          uint64_t v20 = self;
          v80 = -[PUSceneDebugGridViewController _cloneAsset:toDirectory:](self, "_cloneAsset:toDirectory:", v19, v73, v65);
          id v21 = NSStringFromSelector(sel_sceneIdentifier);
          id v22 = objc_opt_new();
          id v23 = [v19 sceneClassifications];
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v82 = v23;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v84 objects:v100 count:16];
          v78 = v19;
          uint64_t v79 = v18;
          if (v24)
          {
            uint64_t v25 = v24;
            char v81 = 0;
            uint64_t v26 = *(void *)v85;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v85 != v26) {
                  objc_enumerationMutation(v82);
                }
                id v28 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                v98[0] = v21;
                uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v28, "extendedSceneIdentifier"));
                v99[0] = v29;
                v98[1] = @"confidence";
                v30 = NSNumber;
                [v28 confidence];
                v31 = objc_msgSend(v30, "numberWithDouble:");
                v99[1] = v31;
                v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:2];

                [v22 addObject:v32];
                uint64_t v33 = [v28 extendedSceneIdentifier];
                v34 = [(PUSceneDebugGridViewController *)v20 sceneIdentifier];
                if (v33 == [v34 unsignedIntValue])
                {
                  [v28 confidence];
                  double v36 = v35;

                  if (v36 > v17) {
                    char v81 = 1;
                  }
                }
                else
                {
                }
              }
              uint64_t v25 = [v82 countByEnumeratingWithState:&v84 objects:v100 count:16];
            }
            while (v25);
          }
          else
          {
            char v81 = 0;
          }
          v77 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v21 ascending:1];
          v97 = v77;
          v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
          [v22 sortUsingDescriptors:v37];

          v95[0] = @"image";
          uint64_t v38 = [v80 lastPathComponent];
          v76 = (void *)v38;
          v39 = &stru_1F06BE7B8;
          if (v38) {
            v39 = (__CFString *)v38;
          }
          v96[0] = v39;
          v96[1] = v22;
          v95[1] = @"classifications";
          v95[2] = @"sceneAnalysisVersion";
          v40 = NSNumber;
          v75 = [v78 sceneAnalysisProperties];
          v41 = objc_msgSend(v40, "numberWithShort:", objc_msgSend(v75, "sceneAnalysisVersion"));
          v96[2] = v41;
          v95[3] = @"imgOriginalWidth";
          v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v78, "pixelWidth"));
          v96[3] = v42;
          v95[4] = @"imgOriginalHeight";
          v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v78, "pixelHeight"));
          v96[4] = v43;
          v95[5] = @"userLabel";
          v44 = [NSNumber numberWithBool:(v81 & 1) == 0];
          v96[5] = v44;
          v95[6] = @"sceneAnalysisPrediction";
          v45 = [NSNumber numberWithBool:v81 & 1];
          v96[6] = v45;
          v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:7];

          [v72 addObject:v46];
          uint64_t v18 = v79 + 1;
          self = v20;
        }
        while (v79 + 1 != v74);
        uint64_t v74 = [obj countByEnumeratingWithState:&v88 objects:v101 count:16];
      }
      while (v74);
    }

    uint64_t v47 = [(PUSceneDebugGridViewController *)self _keywordForSceneIdentifier:v69];
    v48 = (void *)v47;
    if (v47) {
      v49 = (__CFString *)v47;
    }
    else {
      v49 = @"null";
    }
    v50 = v49;

    uint64_t v51 = [(PUSceneDebugGridViewController *)self _labelForSceneIdentifier:v69];
    v52 = (void *)v51;
    if (v51) {
      v53 = (__CFString *)v51;
    }
    else {
      v53 = @"null";
    }
    v54 = v53;

    v55 = (void *)MGCopyAnswer();
    v56 = (void *)MGCopyAnswer();
    v93[0] = @"type";
    v93[1] = @"sceneIdentifier";
    v94[0] = @"scene";
    v94[1] = v69;
    v94[2] = v54;
    v93[2] = @"sceneNetLabel";
    v93[3] = @"confidenceThreshold";
    v57 = [NSNumber numberWithDouble:v17];
    v94[3] = v57;
    v94[4] = v50;
    v93[4] = @"localized_category";
    v93[5] = @"deviceType";
    v94[5] = v56;
    v94[6] = v55;
    v93[6] = @"buildVersion";
    v93[7] = @"assets";
    v94[7] = v72;
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:8];

    v83 = v65;
    v59 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v58 options:1 error:&v83];
    unint64_t v9 = v83;

    if (v59)
    {
      v60 = [v73 URLByAppendingPathComponent:@"report.json"];
      BOOL v61 = 1;
      if ([v59 writeToURL:v60 atomically:1])
      {
LABEL_41:

        v63 = v67;
        id v7 = v68;
        goto LABEL_42;
      }
      v62 = PLUIGetLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v104 = v60;
        __int16 v105 = 2112;
        v106 = v9;
        _os_log_impl(&dword_1AE9F8000, v62, OS_LOG_TYPE_ERROR, "Failed to write JSON radar report to path: %@, error: %@", buf, 0x16u);
      }
    }
    else
    {
      v60 = PLUIGetLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v104 = v9;
        _os_log_impl(&dword_1AE9F8000, v60, OS_LOG_TYPE_ERROR, "Failed to create JSON data with error: %@", buf, 0xCu);
      }
    }
    BOOL v61 = 0;
    goto LABEL_41;
  }
  v63 = PLUIGetLog();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v104 = v73;
    __int16 v105 = 2112;
    v106 = v9;
    _os_log_impl(&dword_1AE9F8000, v63, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  BOOL v61 = 0;
LABEL_42:

  return v61;
}

uint64_t __73__PUSceneDebugGridViewController__writeDiagnosticsToURL_incorrectAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (void)_fileRadarWithIncorrectAssets:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:@"Collecting data for radar..." preferredStyle:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PUSceneDebugGridViewController__fileRadarWithIncorrectAssets___block_invoke;
  v8[3] = &unk_1E5F2E908;
  v8[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(PUSceneDebugGridViewController *)self presentViewController:v6 animated:1 completion:v8];
}

void __64__PUSceneDebugGridViewController__fileRadarWithIncorrectAssets___block_invoke(id *a1)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] assetCollectionAssets];
  uint64_t v3 = [v2 count];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v4 = [a1[4] assetCollectionAssets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v72 objects:v81 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v73 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [a1[4] assetConfidenceIsAboveThreshold:*(void *)(*((void *)&v72 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v72 objects:v81 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  unint64_t v60 = v3 - v7;
  unint64_t v10 = [a1[5] count];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v11 = a1[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = v3;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v69 != v16) {
          objc_enumerationMutation(v11);
        }
        v15 += [a1[4] assetConfidenceIsAboveThreshold:*(void *)(*((void *)&v68 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v68 objects:v80 count:16];
    }
    while (v13);
  }
  else
  {
    unint64_t v14 = v3;
    unint64_t v15 = 0;
  }

  unint64_t v54 = v10 - v15;
  id v18 = a1[4];
  long long v19 = [v18 sceneIdentifier];
  [v18 _thresholdForSceneIdentifer:v19];
  double v21 = v20;

  unint64_t v22 = v10;
  id v23 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v24 = [NSNumber numberWithDouble:v21];
  v62 = [v23 localizedStringFromNumber:v24 numberStyle:3];

  unint64_t v58 = v14;
  uint64_t v25 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v26 = [NSNumber numberWithDouble:(double)v10 / (double)v14];
  BOOL v61 = [v25 localizedStringFromNumber:v26 numberStyle:3];

  __int16 v27 = (void *)MEMORY[0x1E4F28EE0];
  id v28 = [NSNumber numberWithDouble:(double)v15 / (double)v7];
  uint64_t v29 = [v27 localizedStringFromNumber:v28 numberStyle:3];

  v30 = (void *)MEMORY[0x1E4F28EE0];
  v31 = [NSNumber numberWithDouble:(double)(v10 - v15) / (double)v60];
  v32 = [v30 localizedStringFromNumber:v31 numberStyle:3];

  id v33 = a1[4];
  v34 = [v33 sceneIdentifier];
  uint64_t v35 = [v33 _keywordForSceneIdentifier:v34];

  double v36 = (void *)MEMORY[0x1E4F28EE0];
  v37 = [a1[4] sceneIdentifier];
  uint64_t v38 = [v36 localizedStringFromNumber:v37 numberStyle:0];

  v55 = [NSString stringWithFormat:@"\"%@\" Scene has %ld Incorrect Classification(s)", v35, v10];
  id v39 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v39 appendString:@"— Scene Classification Feedback —\n"];
  v57 = (void *)v35;
  [v39 appendFormat:@"Scene Keyword: \"%@\"\n", v35];
  v56 = (void *)v38;
  [v39 appendFormat:@"Scene Identifier: %@\n", v38];
  [v39 appendFormat:@"Scene Threshold: %@\n\n", v62];
  [v39 appendFormat:@"Incorrect Classification(s): %ld of %ld (%@)\n", v22, v58, v61];
  v59 = (void *)v29;
  [v39 appendFormat:@"  - False Positive(s): %ld of %ld (%@)\n", v15, v7, v29];
  [v39 appendFormat:@"  - False Negative(s): %ld of %ld (%@)\n\n\n", v54, v60, v32];
  v40 = NSTemporaryDirectory();
  v41 = [MEMORY[0x1E4F29128] UUID];
  v42 = [v41 UUIDString];
  v43 = [v40 stringByAppendingPathComponent:v42];

  v44 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v43 isDirectory:1];
  if (([a1[4] _writeDiagnosticsToURL:v44 incorrectAssets:a1[5]] & 1) == 0)
  {
    v45 = PLUIGetLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v44;
      _os_log_impl(&dword_1AE9F8000, v45, OS_LOG_TYPE_ERROR, "Failed to write diagnostics to URL: %@", buf, 0xCu);
    }
  }
  v46 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v67 = 0;
  uint64_t v47 = [v46 contentsOfDirectoryAtURL:v44 includingPropertiesForKeys:0 options:4 error:&v67];
  id v48 = v67;
  if (!v47)
  {
    v49 = PLUIGetLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v77 = v44;
      __int16 v78 = 2112;
      id v79 = v48;
      _os_log_impl(&dword_1AE9F8000, v49, OS_LOG_TYPE_ERROR, "Failed to find diagnostic files at URL: %@, error: %@", buf, 0x16u);
    }
  }
  v50 = (void *)MEMORY[0x1E4F90200];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __64__PUSceneDebugGridViewController__fileRadarWithIncorrectAssets___block_invoke_344;
  v63[3] = &unk_1E5F2B8C8;
  v63[4] = a1[4];
  id v64 = a1[6];
  id v65 = v46;
  id v66 = v44;
  id v51 = v44;
  id v52 = v46;
  LOWORD(v53) = 0;
  objc_msgSend(v50, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v55, v39, @"Other Bug", @"1116536", @"SIML Field Feedback Secured Data | Classification", @"all", @"1532088", 0, v47, v53, 0, v63);
}

void __64__PUSceneDebugGridViewController__fileRadarWithIncorrectAssets___block_invoke_344(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setEditing:0 animated:0];
  [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v8 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to cleanup temporary Tap-To-Radar item at URL: %@, error: %@", buf, 0x16u);
    }
  }
}

- (void)_tappedFileRadarButton:(id)a3
{
  char v4 = [(PUPhotosGridViewController *)self photoSelectionManager];
  id v5 = [(PUPhotosAlbumViewController *)self assetCollection];
  char v6 = [v4 isAnyAssetSelectedInAssetCollection:v5];

  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PUSceneDebugGridViewController__tappedFileRadarButton___block_invoke_2;
    v10[3] = &unk_1E5F2CEE8;
    v10[4] = self;
    uint64_t v7 = [MEMORY[0x1E4F90200] alertControllerWithPrivacyTitle:@"Release Agreement", @"You hereby agree that Apple and its affiliates may use, store, and analyze content (including images and metadata associated with images) you submit for debugging purposes of Apple products and services and for testing the debugging solution. Please do not upload any content that contains sensitive information, such as health or financial information, and do not upload objectionable or offensive content (including offensive language and nudity). Apple may retain the images and metadata associated with the images for up to 10 years.\n\nBy choosing to provide content to Apple, you agree and consent to Apple and its subsidiaries and agents transmitting, collecting, maintaining, processing, and using the information described above. Do not upload content that includes images or videos of individuals other than yourself unless you have the individual’s consent to provide Apple with the content and for Apple to use the information as described above. Do not include images that are not yours. By submitting the images, you agree to release Apple from all privacy and intellectual property claims arising out of the use of these images.\n\nYour decision to provide content is completely voluntary and you can choose to submit only a description of the error without an image attachment.", v10 message completion];
    [(PUSceneDebugGridViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"File Radar" message:@"File radar without attaching photos?\nSelecting incorrect photos can help improve the scenes feature." preferredStyle:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__PUSceneDebugGridViewController__tappedFileRadarButton___block_invoke;
    v11[3] = &unk_1E5F2BF98;
    v11[4] = self;
    id v8 = [MEMORY[0x1E4FB1410] actionWithTitle:@"File Radar" style:0 handler:v11];
    id v9 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
    [v7 addAction:v8];
    [v7 addAction:v9];
    [(PUSceneDebugGridViewController *)self presentViewController:v7 animated:1 completion:0];
  }
}

uint64_t __57__PUSceneDebugGridViewController__tappedFileRadarButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fileRadarWithIncorrectAssets:0];
}

void __57__PUSceneDebugGridViewController__tappedFileRadarButton___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) selectedAssets];
    [*(id *)(a1 + 32) _fileRadarWithIncorrectAssets:v3];
  }
}

- (BOOL)assetConfidenceIsAboveThreshold:(id)a3
{
  id v4 = a3;
  id v5 = [(PUSceneDebugGridViewController *)self sceneIdentifier];
  [(PUSceneDebugGridViewController *)self _thresholdForSceneIdentifer:v5];
  double v7 = v6;

  id v8 = [(PUSceneDebugGridViewController *)self assetsHighestConfidence];
  id v9 = [v4 localIdentifier];

  uint64_t v10 = [v8 objectForKeyedSubscript:v9];
  [v10 doubleValue];
  double v12 = v11;

  return v12 > v7;
}

- (BOOL)assetShouldBeSurpassedInNormalUI:(id)a3
{
  id v3 = self;
  BOOL v4 = [(PUSceneDebugGridViewController *)self assetConfidenceIsAboveThreshold:a3];
  id v5 = [(PUSceneDebugGridViewController *)v3 sceneIdentifier];
  LOBYTE(v3) = [(PUSceneDebugGridViewController *)v3 _isJunkSceneIdentifer:v5];

  return v4 ^ v3 ^ 1;
}

- (void)configureDecorationsForCell:(id)a3 withAsset:(id)a4 assetCollection:(id)a5 thumbnailIsPlaceholder:(BOOL)a6 assetMayHaveChanged:(BOOL)a7
{
  id v26 = a3;
  id v9 = a4;
  uint64_t v10 = +[PUSceneSettings sharedInstance];
  int v11 = [v10 showConfidenceOverlay];

  if (v9 && v11)
  {
    double v12 = [(PUSceneDebugGridViewController *)self assetsHighestConfidence];
    uint64_t v13 = [v9 localIdentifier];
    unint64_t v14 = [v12 objectForKeyedSubscript:v13];
    [v14 doubleValue];
    uint64_t v16 = v15;

    double v17 = [v26 photoContentView];
    id v18 = [v17 contentHelper];

    [v18 setTextBannerVisible:1];
    long long v19 = objc_msgSend(NSString, "stringWithFormat:", @"%0.2f", v16);
    double v20 = [v18 textBannerView];
    [v20 setText:v19];

    double v21 = [(PUPhotosGridViewController *)self gridSpec];
    uint64_t v22 = [v21 cellBannerTextAlignment];
    id v23 = [v18 textBannerView];
    [v23 setTextAlignment:v22];

    BOOL v24 = [(PUSceneDebugGridViewController *)self assetShouldBeSurpassedInNormalUI:v9];
    uint64_t v25 = [v18 textBannerView];
    [v25 setDestructiveText:v24];
  }
}

- (BOOL)allowSlideshowButton
{
  return 0;
}

- (id)_newEditActionItemsWithWideSpacing:(BOOL)a3
{
  BOOL v3 = a3;
  v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"File Radar" style:0 target:self action:sel__tappedFileRadarButton_];
  id v5 = (void *)v4;
  if (v3)
  {
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v11[0] = v6;
    v11[1] = v5;
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v11[2] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  }
  else
  {
    uint64_t v10 = v4;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  }

  return v8;
}

- (double)globalHeaderHeight
{
  BOOL v3 = [(PUSceneDebugGridViewController *)self _globalHeaderTitle];
  uint64_t v4 = [(PUSceneDebugGridViewController *)self _existingView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  objc_msgSend(MEMORY[0x1E4F90570], "sizeThatFits:forTitle:", v3, v6, v8);
  double v10 = v9;

  return v10;
}

- (void)configureGlobalHeaderView:(id)a3
{
  id v4 = a3;
  id v5 = [(PUSceneDebugGridViewController *)self _globalHeaderTitle];
  [v4 setTitle:v5];
}

- (void)getEmptyPlaceholderViewTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 buttonAction:(id *)a6
{
  *a3 = @" ";
  *a4 = @"Loading...";
  *a5 = 0;
  *a6 = 0;
}

- (id)_globalHeaderTitle
{
  BOOL v3 = [(PUSceneDebugGridViewController *)self sceneIdentifier];
  BOOL v4 = [(PUSceneDebugGridViewController *)self _isJunkSceneIdentifer:v3];

  if (v4)
  {
    id v5 = @"Select photos with a red number that should be used by Memories and Search. Select photos with a white number that shouldn't be used by Memories and Search.";
  }
  else
  {
    double v6 = [(PUSceneDebugGridViewController *)self sceneIdentifier];
    double v7 = [(PUSceneDebugGridViewController *)self _keywordForSceneIdentifier:v6];

    id v5 = [NSString stringWithFormat:@"Select photos with a white number that don't contain \"%@\", and select photos with a red number that contain \"%@\".", v7, v7];
  }
  return v5;
}

- (id)sceneTaxonomy
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sceneTaxonomy)
  {
    BOOL v3 = (PFSceneTaxonomy *)objc_alloc_init(MEMORY[0x1E4F8CD60]);
    sceneTaxonomy = v2->_sceneTaxonomy;
    v2->_sceneTaxonomy = v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_sceneTaxonomy;
  return v5;
}

@end