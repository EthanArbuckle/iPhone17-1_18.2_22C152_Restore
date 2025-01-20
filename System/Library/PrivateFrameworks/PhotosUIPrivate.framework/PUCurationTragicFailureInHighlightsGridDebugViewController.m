@interface PUCurationTragicFailureInHighlightsGridDebugViewController
- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4;
- (BOOL)shouldShowSectionHeaders;
- (PHPhotosHighlight)highlight;
- (PUCurationTragicFailureInHighlightsDebugViewController)parentController;
- (PUCurationTragicFailureInHighlightsGridDebugViewController)initWithSpec:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (unint64_t)utilityTypesWithAsset:(id)a3 sceneClassifications:(id)a4;
- (void)_fileRadarWithIncorrectAssets:(id)a3;
- (void)_presentTapToRadar;
- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7;
- (void)setButton:(id)a3 toOn:(BOOL)a4;
- (void)setHighlight:(id)a3;
- (void)setParentController:(id)a3;
- (void)toggleShowsAll:(id)a3;
- (void)toggleShowsNonMemorable:(id)a3;
- (void)toggleShowsPoorQuality:(id)a3;
- (void)toggleShowsTragicFailure:(id)a3;
- (void)update;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUCurationTragicFailureInHighlightsGridDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_showsPoorQualityButtonItem, 0);
  objc_storeStrong((id *)&self->_showsNonMemorableButtonItem, 0);
  objc_storeStrong((id *)&self->_showsTragicFailureButtonItem, 0);
  objc_storeStrong((id *)&self->_utilityTypesByAssetUUID, 0);
  objc_storeStrong((id *)&self->_filteredAssets, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
}

- (void)setParentController:(id)a3
{
}

- (PUCurationTragicFailureInHighlightsDebugViewController)parentController
{
  return self->_parentController;
}

- (PHPhotosHighlight)highlight
{
  return self->_highlight;
}

- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v114 = 0;
  v95 = v5;
  LOBYTE(v5) = [v7 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v114];
  v8 = v114;

  if (v5)
  {
    v90 = v8;
    uint64_t v9 = objc_opt_new();
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v91 = v6;
    id obj = v6;
    v94 = v9;
    uint64_t v96 = [obj countByEnumeratingWithState:&v110 objects:v125 count:16];
    if (v96)
    {
      uint64_t v93 = *(void *)v111;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v111 != v93) {
            objc_enumerationMutation(obj);
          }
          uint64_t v103 = v10;
          v11 = *(void **)(*((void *)&v110 + 1) + 8 * v10);
          v104 = [MEMORY[0x1E4F90200] cloneAsset:v11 resourceType:1 toDirectory:v95];
          v12 = NSStringFromSelector(sel_sceneIdentifier);
          v13 = objc_opt_new();
          v102 = v11;
          v14 = [v11 sceneClassifications];
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v106 objects:v124 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v107;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v107 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v106 + 1) + 8 * i);
                v122[0] = v12;
                v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v19, "extendedSceneIdentifier"));
                v122[1] = @"confidence";
                v123[0] = v20;
                v21 = NSNumber;
                [v19 confidence];
                v22 = objc_msgSend(v21, "numberWithDouble:");
                v123[1] = v22;
                v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:2];

                [v13 addObject:v23];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v106 objects:v124 count:16];
            }
            while (v16);
          }
          v101 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v12 ascending:1];
          v121 = v101;
          v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
          [v13 sortUsingDescriptors:v24];

          id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v26 = NSNumber;
          [v102 overallAestheticScore];
          v27 = objc_msgSend(v26, "numberWithFloat:");
          [v25 setObject:v27 forKeyedSubscript:@"overallAestheticScore"];

          v28 = [v102 aestheticProperties];
          v29 = NSNumber;
          v30 = v28;
          [v28 wellFramedSubjectScore];
          v31 = objc_msgSend(v29, "numberWithFloat:");
          [v25 setObject:v31 forKeyedSubscript:@"wellFramedSubjectScore"];

          v32 = NSNumber;
          [v30 wellChosenSubjectScore];
          v33 = objc_msgSend(v32, "numberWithFloat:");
          [v25 setObject:v33 forKeyedSubscript:@"wellChosenSubjectScore"];

          v34 = NSNumber;
          [v30 tastefullyBlurredScore];
          v35 = objc_msgSend(v34, "numberWithFloat:");
          [v25 setObject:v35 forKeyedSubscript:@"tastefullyBlurredScore"];

          v36 = NSNumber;
          [v30 sharplyFocusedSubjectScore];
          v37 = objc_msgSend(v36, "numberWithFloat:");
          [v25 setObject:v37 forKeyedSubscript:@"sharplyFocusedSubjectScore"];

          v38 = NSNumber;
          [v30 wellTimedShotScore];
          v39 = objc_msgSend(v38, "numberWithFloat:");
          [v25 setObject:v39 forKeyedSubscript:@"wellTimedShotScore"];

          v40 = NSNumber;
          [v30 pleasantLightingScore];
          v41 = objc_msgSend(v40, "numberWithFloat:");
          [v25 setObject:v41 forKeyedSubscript:@"pleasantLightingScore"];

          v42 = NSNumber;
          [v30 pleasantReflectionsScore];
          v43 = objc_msgSend(v42, "numberWithFloat:");
          [v25 setObject:v43 forKeyedSubscript:@"pleasantReflectionsScore"];

          v44 = NSNumber;
          [v30 harmoniousColorScore];
          v45 = objc_msgSend(v44, "numberWithFloat:");
          [v25 setObject:v45 forKeyedSubscript:@"harmoniousColorScore"];

          v46 = NSNumber;
          [v30 livelyColorScore];
          v47 = objc_msgSend(v46, "numberWithFloat:");
          [v25 setObject:v47 forKeyedSubscript:@"livelyColorScore"];

          v48 = NSNumber;
          [v30 pleasantSymmetryScore];
          v49 = objc_msgSend(v48, "numberWithFloat:");
          [v25 setObject:v49 forKeyedSubscript:@"pleasantSymmetryScore"];

          v50 = NSNumber;
          [v30 pleasantPatternScore];
          v51 = objc_msgSend(v50, "numberWithFloat:");
          [v25 setObject:v51 forKeyedSubscript:@"pleasantPatternScore"];

          v52 = NSNumber;
          [v30 immersivenessScore];
          v53 = objc_msgSend(v52, "numberWithFloat:");
          [v25 setObject:v53 forKeyedSubscript:@"immersivenessScore"];

          v54 = NSNumber;
          [v30 pleasantPerspectiveScore];
          v55 = objc_msgSend(v54, "numberWithFloat:");
          [v25 setObject:v55 forKeyedSubscript:@"pleasantPerspectiveScore"];

          v56 = NSNumber;
          [v30 pleasantPostProcessingScore];
          v57 = objc_msgSend(v56, "numberWithFloat:");
          [v25 setObject:v57 forKeyedSubscript:@"pleasantPostProcessingScore"];

          v58 = NSNumber;
          [v30 noiseScore];
          v59 = objc_msgSend(v58, "numberWithFloat:");
          [v25 setObject:v59 forKeyedSubscript:@"noiseScore"];

          v60 = NSNumber;
          [v30 failureScore];
          v61 = objc_msgSend(v60, "numberWithFloat:");
          [v25 setObject:v61 forKeyedSubscript:@"failureScore"];

          v62 = NSNumber;
          [v30 pleasantCompositionScore];
          v63 = objc_msgSend(v62, "numberWithFloat:");
          [v25 setObject:v63 forKeyedSubscript:@"pleasantCompositionScore"];

          v64 = NSNumber;
          [v30 interestingSubjectScore];
          v65 = objc_msgSend(v64, "numberWithFloat:");
          [v25 setObject:v65 forKeyedSubscript:@"interestingSubjectScore"];

          v66 = NSNumber;
          [v30 intrusiveObjectPresenceScore];
          v67 = objc_msgSend(v66, "numberWithFloat:");
          [v25 setObject:v67 forKeyedSubscript:@"intrusiveObjectPresenceScore"];

          v68 = NSNumber;
          [v30 pleasantCameraTiltScore];
          v69 = objc_msgSend(v68, "numberWithFloat:");
          [v25 setObject:v69 forKeyedSubscript:@"pleasantCameraTiltScore"];

          v70 = NSNumber;
          [v30 lowLight];
          v71 = objc_msgSend(v70, "numberWithFloat:");
          [v25 setObject:v71 forKeyedSubscript:@"lowLight"];

          v119[0] = @"image";
          uint64_t v72 = [v104 lastPathComponent];
          v100 = (void *)v72;
          v73 = &stru_1F06BE7B8;
          if (v72) {
            v73 = (__CFString *)v72;
          }
          v120[0] = v73;
          v119[1] = @"analysisVersion";
          v74 = NSNumber;
          v99 = [v102 sceneAnalysisProperties];
          v98 = objc_msgSend(v74, "numberWithShort:", objc_msgSend(v99, "sceneAnalysisVersion"));
          v120[1] = v98;
          v119[2] = @"blurrinessScore";
          v75 = NSNumber;
          v97 = [v102 mediaAnalysisProperties];
          [v97 blurrinessScore];
          v76 = objc_msgSend(v75, "numberWithFloat:");
          v120[2] = v76;
          v119[3] = @"exposureScore";
          v77 = NSNumber;
          v78 = [v102 mediaAnalysisProperties];
          [v78 exposureScore];
          v79 = objc_msgSend(v77, "numberWithFloat:");
          v120[3] = v79;
          v120[4] = v13;
          v119[4] = @"sceneClassifications";
          v119[5] = @"aestheticScores";
          v120[5] = v25;
          v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:6];

          uint64_t v9 = (uint64_t)v94;
          [v94 addObject:v80];

          uint64_t v10 = v103 + 1;
        }
        while (v103 + 1 != v96);
        uint64_t v96 = [obj countByEnumeratingWithState:&v110 objects:v125 count:16];
      }
      while (v96);
    }

    uint64_t v116 = v9;
    v117[0] = @"type";
    v117[1] = @"report";
    v118[0] = @"junk";
    v115 = @"FP";
    v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
    v118[1] = v81;
    v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:2];

    v105 = v90;
    v83 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v82 options:1 error:&v105];
    v84 = v105;

    if (v83)
    {
      v85 = [v95 URLByAppendingPathComponent:@"report.json"];
      BOOL v86 = 1;
      id v6 = v91;
      if ([v83 writeToURL:v85 atomically:1])
      {
LABEL_29:

        v88 = v94;
        goto LABEL_30;
      }
      v87 = PLUIGetLog();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v127 = v85;
        __int16 v128 = 2112;
        v129 = v84;
        _os_log_impl(&dword_1AE9F8000, v87, OS_LOG_TYPE_ERROR, "Failed to write JSON radar report to path: %@, error: %@", buf, 0x16u);
      }
    }
    else
    {
      v85 = PLUIGetLog();
      id v6 = v91;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v127 = v84;
        _os_log_impl(&dword_1AE9F8000, v85, OS_LOG_TYPE_ERROR, "Failed to create JSON data with error: %@", buf, 0xCu);
      }
    }
    BOOL v86 = 0;
    goto LABEL_29;
  }
  v88 = PLUIGetLog();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v127 = v95;
    __int16 v128 = 2112;
    v129 = v8;
    _os_log_impl(&dword_1AE9F8000, v88, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  BOOL v86 = 0;
  v84 = v8;
LABEL_30:

  return v86;
}

- (void)_fileRadarWithIncorrectAssets:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:@"Collecting data for radar..." preferredStyle:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__PUCurationTragicFailureInHighlightsGridDebugViewController__fileRadarWithIncorrectAssets___block_invoke;
  v8[3] = &unk_1E5F2E908;
  v8[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self presentViewController:v6 animated:1 completion:v8];
}

void __92__PUCurationTragicFailureInHighlightsGridDebugViewController__fileRadarWithIncorrectAssets___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] assetCollectionAssets];
  unint64_t v3 = [v2 count];

  unint64_t v4 = [a1[5] count];
  v5 = (void *)MEMORY[0x1E4F28EE0];
  id v6 = [NSNumber numberWithDouble:(double)v4 / (double)v3];
  id v7 = [v5 localizedStringFromNumber:v6 numberStyle:3];

  v8 = objc_msgSend(NSString, "stringWithFormat:", @"[CLC] %ld incorrect tragic failure classification(s)", v4);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v9 appendString:@"— Tragic Failure Classification Feedback —\n"];
  [v9 appendFormat:@"Incorrect Classification(s): %ld of %ld (%@)\n", v4, v3, v7];
  id v10 = NSTemporaryDirectory();
  v11 = [MEMORY[0x1E4F29128] UUID];
  v12 = [v11 UUIDString];
  v13 = [v10 stringByAppendingPathComponent:v12];

  v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:1];
  if (([a1[4] _writeDiagnosticsToURL:v14 incorrectAssets:a1[5]] & 1) == 0)
  {
    uint64_t v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Failed to write diagnostics to URL: %@", buf, 0xCu);
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v28 = 0;
  uint64_t v17 = [v16 contentsOfDirectoryAtURL:v14 includingPropertiesForKeys:0 options:4 error:&v28];
  id v18 = v28;
  if (!v17)
  {
    v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to find diagnostic files at URL: %@, error: %@", buf, 0x16u);
    }
  }
  v20 = (void *)MEMORY[0x1E4F90200];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__PUCurationTragicFailureInHighlightsGridDebugViewController__fileRadarWithIncorrectAssets___block_invoke_378;
  v24[3] = &unk_1E5F2B8C8;
  v24[4] = a1[4];
  id v25 = a1[6];
  id v26 = v16;
  id v27 = v14;
  id v21 = v14;
  id v22 = v16;
  LOBYTE(v23) = 0;
  [v20 fileRadarWithTitle:v8 description:v9 classification:@"Other Bug" componentID:@"721490" componentName:@"Photos Scene Classification" componentVersion:@"all" keyword:&stru_1F06BE7B8 attachmentURLs:v17 includeSysDiagnose:v23 completionHandler:v24];
}

void __92__PUCurationTragicFailureInHighlightsGridDebugViewController__fileRadarWithIncorrectAssets___block_invoke_378(uint64_t a1)
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
    id v6 = PLUIGetLog();
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

- (void)_presentTapToRadar
{
  uint64_t v3 = [(PUPhotosGridViewController *)self photoSelectionManager];
  char v4 = [(PUPhotosAlbumViewController *)self assetCollection];
  char v5 = [v3 isAnyAssetSelectedInAssetCollection:v4];

  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__PUCurationTragicFailureInHighlightsGridDebugViewController__presentTapToRadar__block_invoke_2;
    v9[3] = &unk_1E5F2CEE8;
    v9[4] = self;
    [MEMORY[0x1E4F90200] presentTermsAndConditionsForUIViewController:self completion:v9];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"File Radar" message:@"File radar without attaching photos?\nSelecting incorrect photos can help improve the tragic failure classification feature." preferredStyle:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__PUCurationTragicFailureInHighlightsGridDebugViewController__presentTapToRadar__block_invoke;
    v10[3] = &unk_1E5F2BF98;
    v10[4] = self;
    uint64_t v7 = [MEMORY[0x1E4FB1410] actionWithTitle:@"File Radar" style:0 handler:v10];
    id v8 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
    [v6 addAction:v7];
    [v6 addAction:v8];
    [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

uint64_t __80__PUCurationTragicFailureInHighlightsGridDebugViewController__presentTapToRadar__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fileRadarWithIncorrectAssets:0];
}

void __80__PUCurationTragicFailureInHighlightsGridDebugViewController__presentTapToRadar__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) selectedAssets];
    [*(id *)(a1 + 32) _fileRadarWithIncorrectAssets:v3];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  id v6 = a4;
  uint64_t v7 = [(PUPhotosGridViewController *)&v15 collectionView:a3 cellForItemAtIndexPath:v6];
  filteredAssets = self->_filteredAssets;
  uint64_t v9 = objc_msgSend(v6, "item", v15.receiver, v15.super_class);

  uint64_t v10 = [(NSArray *)filteredAssets objectAtIndexedSubscript:v9];
  utilityTypesByAssetUUID = self->_utilityTypesByAssetUUID;
  id v12 = [v10 uuid];
  uint64_t v13 = [(NSDictionary *)utilityTypesByAssetUUID objectForKeyedSubscript:v12];
  objc_msgSend(v7, "setUtilityTypes:", objc_msgSend(v13, "unsignedIntegerValue"));

  return v7;
}

- (unint64_t)utilityTypesWithAsset:(id)a3 sceneClassifications:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 curationScore];
  unint64_t v8 = v7 < 0.5;
  id v31 = v5;
  if ([v5 isPhoto])
  {
    uint64_t v9 = [v5 mediaAnalysisProperties];
    [v9 blurrinessScore];
    if (v10 < 0.01) {
      goto LABEL_5;
    }
    [v5 overallAestheticScore];
    double v12 = v11;

    if (v12 < 0.1)
    {
LABEL_6:
      v8 |= 2uLL;
      goto LABEL_7;
    }
    uint64_t v9 = [v5 aestheticProperties];
    [v9 failureScore];
    if (v13 < -0.45)
    {
LABEL_5:

      goto LABEL_6;
    }
    [v9 tastefullyBlurredScore];
    double v29 = v28;

    if (v29 < -0.92) {
      goto LABEL_6;
    }
  }
LABEL_7:
  unint64_t v30 = v8;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    BOOL v17 = 0;
    BOOL v18 = 0;
    uint64_t v19 = *(void *)v33;
LABEL_9:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v33 != v19) {
        objc_enumerationMutation(v14);
      }
      id v21 = *(void **)(*((void *)&v32 + 1) + 8 * v20);
      if (objc_msgSend(v21, "extendedSceneIdentifier", v30) == 2147483644)
      {
        [v21 confidence];
        if (v22 >= 0.54) {
          break;
        }
      }
      if ([v21 extendedSceneIdentifier] == 2147483645)
      {
        [v21 confidence];
        BOOL v17 = v23 >= 0.675;
      }
      else if ([v21 extendedSceneIdentifier] == 2147483646)
      {
        [v21 confidence];
        BOOL v18 = v24 >= 0.43;
      }
      if (v16 == ++v20)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v16) {
          goto LABEL_9;
        }

        if (v17)
        {
          id v25 = v31;
          unint64_t v26 = v30 | 4;
          if (!v18) {
            goto LABEL_24;
          }
        }
        else
        {
          unint64_t v26 = v30;
          id v25 = v31;
          if (!v18) {
            goto LABEL_24;
          }
        }
        v26 |= 8uLL;
        goto LABEL_24;
      }
    }
  }

  unint64_t v26 = v30;
  id v25 = v31;
LABEL_24:

  return v26;
}

- (void)toggleShowsPoorQuality:(id)a3
{
  BOOL v4 = !self->_showsPoorQuality;
  self->_showsPoorQuality ^= 1u;
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setButton:a3 toOn:v4];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self update];
}

- (void)toggleShowsNonMemorable:(id)a3
{
  BOOL v4 = !self->_showsNonMemorable;
  self->_showsNonMemorable ^= 1u;
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setButton:a3 toOn:v4];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self update];
}

- (void)toggleShowsTragicFailure:(id)a3
{
  BOOL v4 = !self->_showsTragicFailure;
  self->_showsTragicFailure ^= 1u;
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setButton:a3 toOn:v4];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self update];
}

- (void)toggleShowsAll:(id)a3
{
  BOOL v4 = !self->_showsAll;
  self->_showsAll ^= 1u;
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setButton:a3 toOn:v4];
  [(UIBarButtonItem *)self->_showsTragicFailureButtonItem setEnabled:!self->_showsAll];
  [(UIBarButtonItem *)self->_showsNonMemorableButtonItem setEnabled:!self->_showsAll];
  [(UIBarButtonItem *)self->_showsPoorQualityButtonItem setEnabled:!self->_showsAll];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self update];
}

- (void)setButton:(id)a3 toOn:(BOOL)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4FB0858];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setShadowBlurRadius:3.0];
  objc_msgSend(v7, "setShadowOffset:", 3.0, 2.0);
  unint64_t v8 = [MEMORY[0x1E4FB1618] labelColor];
  [v7 setShadowColor:v8];

  uint64_t v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:24.0];
  float v10 = (void *)v9;
  if (a4)
  {
    uint64_t v11 = *MEMORY[0x1E4FB0758];
    v19[0] = *MEMORY[0x1E4FB06F8];
    v19[1] = v11;
    v20[0] = v9;
    v20[1] = v7;
    double v12 = (void *)MEMORY[0x1E4F1C9E8];
    float v13 = v20;
    id v14 = v19;
    uint64_t v15 = 2;
  }
  else
  {
    uint64_t v17 = *MEMORY[0x1E4FB06F8];
    uint64_t v18 = v9;
    double v12 = (void *)MEMORY[0x1E4F1C9E8];
    float v13 = &v18;
    id v14 = &v17;
    uint64_t v15 = 1;
  }
  uint64_t v16 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:v15];
  [v6 setTitleTextAttributes:v16 forState:0];
  [v6 setWidth:0.0];
}

- (BOOL)shouldShowSectionHeaders
{
  return 0;
}

- (void)update
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = self->_highlight;
  objc_storeStrong((id *)&self->_filteredAssets, self->_allAssets);
  if (!self->_showsAll)
  {
    p_filteredAssets = &self->_filteredAssets;
    id v31 = v3;
    BOOL v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = self->_allAssets;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          utilityTypesByAssetUUID = self->_utilityTypesByAssetUUID;
          uint64_t v11 = objc_msgSend(v9, "uuid", p_filteredAssets);
          double v12 = [(NSDictionary *)utilityTypesByAssetUUID objectForKeyedSubscript:v11];
          char v13 = [v12 unsignedIntegerValue];

          if ((!self->_showsTragicFailure || (v13 & 2) == 0)
            && (!self->_showsNonMemorable || (v13 & 4) == 0)
            && (!self->_showsPoorQuality || (v13 & 8) == 0))
          {
            continue;
          }
          [(NSArray *)v4 addObject:v9];
        }
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v6);
    }

    uint64_t v17 = *p_filteredAssets;
    *p_filteredAssets = v4;
    uint64_t v18 = v4;

    uint64_t v19 = (void *)MEMORY[0x1E4F38EE8];
    uint64_t v20 = *p_filteredAssets;
    id v21 = [(PHPhotosHighlight *)self->_highlight localizedTitle];
    uint64_t v22 = [v19 transientAssetCollectionWithAssets:v20 title:v21];

    id v3 = (PHPhotosHighlight *)v22;
  }
  double v23 = (void *)MEMORY[0x1E4F39008];
  uint64_t v37 = v3;
  double v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v37, 1, p_filteredAssets);
  id v25 = [(PHPhotosHighlight *)v3 localizedTitle];
  unint64_t v26 = [v23 transientCollectionListWithCollections:v24 title:v25];

  id v27 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v26 options:0];
  [(PUPhotosAlbumViewController *)self setAssetCollection:v3 fetchResultContainingAssetCollection:v27 filterPredicate:0];
  float v28 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self collectionView];
  [v28 reloadData];

  double v29 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self navigationController];
  [v29 setToolbarHidden:0];
}

- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7
{
  v16[1] = *MEMORY[0x1E4F143B8];
  char v13 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUTTR");
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v13 style:0 target:self action:sel__presentTapToRadar];
  v15.receiver = self;
  v15.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  [(PUPhotosGridViewController *)&v15 getTitle:a3 prompt:a4 shouldHideBackButton:a5 leftBarButtonItems:a6 rightBarButtonItems:a7];
  if (*a6)
  {
    [*a6 arrayByAddingObject:v14];
  }
  else
  {
    v16[0] = v14;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  *a6 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)setHighlight:(id)a3
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_highlight, a3);
  uint64_t v6 = [v5 photoLibrary];
  uint64_t v7 = [v6 librarySpecificFetchOptions];

  unint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v39[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v39[1] = v9;
  float v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [v7 setSortDescriptors:v10];

  uint64_t v11 = *MEMORY[0x1E4F394E0];
  v38[0] = *MEMORY[0x1E4F39538];
  v38[1] = v11;
  v38[2] = *MEMORY[0x1E4F39420];
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  [v7 setFetchPropertySets:v12];

  unint64_t v30 = v7;
  id v31 = v5;
  char v13 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v7];
  id v14 = [v13 fetchedObjects];
  allAssets = self->_allAssets;
  self->_allAssets = v14;

  uint64_t v16 = [MEMORY[0x1E4F39280] fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:self->_allAssets];
  uint64_t v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v18 = self;
  id obj = self->_allAssets;
  uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(obj);
        }
        double v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        double v24 = [v23 localIdentifier];
        id v25 = [v16 objectForKeyedSubscript:v24];
        uint64_t v26 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)v18 utilityTypesWithAsset:v23 sceneClassifications:v25];

        id v27 = [NSNumber numberWithUnsignedInteger:v26];
        float v28 = [v23 uuid];
        [(NSDictionary *)v17 setObject:v27 forKeyedSubscript:v28];
      }
      uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v20);
  }

  utilityTypesByAssetUUID = v18->_utilityTypesByAssetUUID;
  v18->_utilityTypesByAssetUUID = v17;

  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)v18 update];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  [(PUPhotosGridViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  [(PUPhotosAlbumViewController *)&v7 viewDidAppear:a3];
  BOOL v4 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self navigationController];
  id v5 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self toolbarItems];
  [v4 setToolbarItems:v5 animated:1];

  uint64_t v6 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self navigationController];
  [v6 setToolbarHidden:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  [(PUPhotosGridViewController *)&v6 viewWillAppear:a3];
  BOOL v4 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self collectionView];
  id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  [v4 scrollToItemAtIndexPath:v5 atScrollPosition:1 animated:0];
}

- (void)viewDidLoad
{
  v23[11] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  [(PUPhotosAlbumViewController *)&v22 viewDidLoad];
  objc_super v3 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self navigationItem];
  [v3 setLeftItemsSupplementBackButton:1];

  BOOL v4 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self collectionView];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPhotoCell"];

  id v5 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self collectionView];
  [v5 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"PUCurationTragicFailureInHighlightsGridDebugViewSectionHeaderReuseIdentifier"];

  objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB14A8]), "initWithTitle:style:target:action:", @"⬅️", 0, self->_parentController);
  objc_super v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB14A8]), "initWithTitle:style:target:action:", @"➡️", 0, self->_parentController);
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"🤡" style:0 target:self action:sel_toggleShowsAll_];
  uint64_t v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"🛑" style:0 target:self action:sel_toggleShowsTragicFailure_];
  showsTragicFailureButtonItem = self->_showsTragicFailureButtonItem;
  self->_showsTragicFailureButtonItem = v9;

  uint64_t v11 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"🥱" style:0 target:self action:sel_toggleShowsNonMemorable_];
  showsNonMemorableButtonItem = self->_showsNonMemorableButtonItem;
  self->_showsNonMemorableButtonItem = v11;

  char v13 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"🤢" style:0 target:self action:sel_toggleShowsPoorQuality_];
  showsPoorQualityButtonItem = self->_showsPoorQualityButtonItem;
  self->_showsPoorQualityButtonItem = v13;

  objc_super v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v23[0] = v6;
  v23[1] = v15;
  v23[2] = v8;
  v23[3] = v15;
  v23[4] = self->_showsTragicFailureButtonItem;
  v23[5] = v15;
  uint64_t v16 = self->_showsPoorQualityButtonItem;
  v23[6] = self->_showsNonMemorableButtonItem;
  v23[7] = v15;
  v23[8] = v16;
  v23[9] = v15;
  v23[10] = v7;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:11];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setToolbarItems:v17];

  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setButton:v8 toOn:self->_showsAll];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setButton:self->_showsTragicFailureButtonItem toOn:self->_showsTragicFailure];
  [(UIBarButtonItem *)self->_showsTragicFailureButtonItem setEnabled:!self->_showsAll];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setButton:self->_showsNonMemorableButtonItem toOn:self->_showsNonMemorable];
  [(UIBarButtonItem *)self->_showsNonMemorableButtonItem setEnabled:!self->_showsAll];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setButton:self->_showsPoorQualityButtonItem toOn:self->_showsPoorQuality];
  [(UIBarButtonItem *)self->_showsPoorQualityButtonItem setEnabled:!self->_showsAll];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setButton:v6 toOn:0];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self setButton:v7 toOn:0];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:self->_parentController action:sel_goToNextHighlight_];
  [v18 setDirection:2];
  uint64_t v19 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self view];
  [v19 addGestureRecognizer:v18];

  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:self->_parentController action:sel_goToPreviousHighlight_];
  [v20 setDirection:1];
  uint64_t v21 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self view];
  [v21 addGestureRecognizer:v20];
}

- (PUCurationTragicFailureInHighlightsGridDebugViewController)initWithSpec:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  result = [(PUPhotosAlbumViewController *)&v4 initWithSpec:a3];
  if (result)
  {
    result->_showsAll = 1;
    result->_showsTragicFailure = 1;
    result->_showsNonMemorable = 1;
    result->_showsPoorQuality = 1;
  }
  return result;
}

@end