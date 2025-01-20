@interface PUTopPeopleWallpaperSuggestionsDebugViewController
- (BOOL)_writeDiagnosticsToURL:(id)a3 goodSuggestions:(id)a4 badSuggestions:(id)a5;
- (BOOL)shouldShowToolbar;
- (PUTopPeopleWallpaperSuggesterFilteringContext)filteringContext;
- (PUTopPeopleWallpaperSuggestionsDistancingContext)distancingContext;
- (PUTopPeopleWallpaperSuggestionsScoringContext)scoringContext;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)newToolbarItems;
- (void)_editSettings:(id)a3;
- (void)_fileRadarWithGoodSuggestions:(id)a3 badSuggestions:(id)a4;
- (void)_presentTapToRadar;
- (void)_rewind:(id)a3;
- (void)_update;
- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7;
- (void)settingsDidDismiss;
- (void)viewDidLoad;
@end

@implementation PUTopPeopleWallpaperSuggestionsDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distancingContext, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
  objc_storeStrong((id *)&self->_filteringContext, 0);
  objc_storeStrong((id *)&self->_scoreByAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_usedAssetLocalIdentifiers, 0);
}

- (PUTopPeopleWallpaperSuggestionsDistancingContext)distancingContext
{
  return (PUTopPeopleWallpaperSuggestionsDistancingContext *)objc_getProperty(self, a2, 1808, 1);
}

- (PUTopPeopleWallpaperSuggestionsScoringContext)scoringContext
{
  return (PUTopPeopleWallpaperSuggestionsScoringContext *)objc_getProperty(self, a2, 1800, 1);
}

- (PUTopPeopleWallpaperSuggesterFilteringContext)filteringContext
{
  return (PUTopPeopleWallpaperSuggesterFilteringContext *)objc_getProperty(self, a2, 1792, 1);
}

- (BOOL)_writeDiagnosticsToURL:(id)a3 goodSuggestions:(id)a4 badSuggestions:(id)a5
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v135 = 0;
  LOBYTE(a4) = [v10 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v135];
  v11 = v135;

  if (a4)
  {
    v107 = v11;
    id v111 = v9;
    v112 = v7;
    uint64_t v12 = [v8 arrayByAddingObjectsFromArray:v9];
    v13 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v14 = [v13 librarySpecificFetchOptions];

    uint64_t v15 = *MEMORY[0x1E4F39550];
    v144[0] = *MEMORY[0x1E4F39420];
    v144[1] = v15;
    v144[2] = *MEMORY[0x1E4F394E0];
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:3];
    [v14 setFetchPropertySets:v16];

    v109 = v14;
    v110 = v12;
    v17 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v12 options:v14];
    v18 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    uint64_t v19 = [v18 librarySpecificFetchOptions];

    v108 = (void *)v19;
    v116 = [MEMORY[0x1E4F39050] fetchFacesGroupedByAssetLocalIdentifierForAssets:v17 options:v19];
    id v118 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v117 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id obj = v17;
    uint64_t v119 = [obj countByEnumeratingWithState:&v131 objects:v143 count:16];
    if (v119)
    {
      uint64_t v114 = *(void *)v132;
      v115 = v8;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v132 != v114) {
            objc_enumerationMutation(obj);
          }
          uint64_t v124 = v20;
          v21 = *(void **)(*((void *)&v131 + 1) + 8 * v20);
          id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v23 = NSNumber;
          [v21 overallAestheticScore];
          v24 = objc_msgSend(v23, "numberWithFloat:");
          [v22 setObject:v24 forKeyedSubscript:@"overallAestheticScore"];

          v25 = [v21 aestheticProperties];
          v26 = NSNumber;
          [v25 wellFramedSubjectScore];
          v27 = objc_msgSend(v26, "numberWithFloat:");
          [v22 setObject:v27 forKeyedSubscript:@"wellFramedSubjectScore"];

          v28 = NSNumber;
          [v25 wellChosenSubjectScore];
          v29 = objc_msgSend(v28, "numberWithFloat:");
          [v22 setObject:v29 forKeyedSubscript:@"wellChosenSubjectScore"];

          v30 = NSNumber;
          [v25 tastefullyBlurredScore];
          v31 = objc_msgSend(v30, "numberWithFloat:");
          [v22 setObject:v31 forKeyedSubscript:@"tastefullyBlurredScore"];

          v32 = NSNumber;
          [v25 sharplyFocusedSubjectScore];
          v33 = objc_msgSend(v32, "numberWithFloat:");
          [v22 setObject:v33 forKeyedSubscript:@"sharplyFocusedSubjectScore"];

          v34 = NSNumber;
          [v25 wellTimedShotScore];
          v35 = objc_msgSend(v34, "numberWithFloat:");
          [v22 setObject:v35 forKeyedSubscript:@"wellTimedShotScore"];

          v36 = NSNumber;
          [v25 pleasantLightingScore];
          v37 = objc_msgSend(v36, "numberWithFloat:");
          [v22 setObject:v37 forKeyedSubscript:@"pleasantLightingScore"];

          v38 = NSNumber;
          [v25 pleasantReflectionsScore];
          v39 = objc_msgSend(v38, "numberWithFloat:");
          [v22 setObject:v39 forKeyedSubscript:@"pleasantReflectionsScore"];

          v40 = NSNumber;
          [v25 harmoniousColorScore];
          v41 = objc_msgSend(v40, "numberWithFloat:");
          [v22 setObject:v41 forKeyedSubscript:@"harmoniousColorScore"];

          v42 = NSNumber;
          [v25 livelyColorScore];
          v43 = objc_msgSend(v42, "numberWithFloat:");
          [v22 setObject:v43 forKeyedSubscript:@"livelyColorScore"];

          v44 = NSNumber;
          [v25 pleasantSymmetryScore];
          v45 = objc_msgSend(v44, "numberWithFloat:");
          [v22 setObject:v45 forKeyedSubscript:@"pleasantSymmetryScore"];

          v46 = NSNumber;
          [v25 pleasantPatternScore];
          v47 = objc_msgSend(v46, "numberWithFloat:");
          [v22 setObject:v47 forKeyedSubscript:@"pleasantPatternScore"];

          v48 = NSNumber;
          [v25 immersivenessScore];
          v49 = objc_msgSend(v48, "numberWithFloat:");
          [v22 setObject:v49 forKeyedSubscript:@"immersivenessScore"];

          v50 = NSNumber;
          [v25 pleasantPerspectiveScore];
          v51 = objc_msgSend(v50, "numberWithFloat:");
          [v22 setObject:v51 forKeyedSubscript:@"pleasantPerspectiveScore"];

          v52 = NSNumber;
          [v25 pleasantPostProcessingScore];
          v53 = objc_msgSend(v52, "numberWithFloat:");
          [v22 setObject:v53 forKeyedSubscript:@"pleasantPostProcessingScore"];

          v54 = NSNumber;
          [v25 noiseScore];
          v55 = objc_msgSend(v54, "numberWithFloat:");
          [v22 setObject:v55 forKeyedSubscript:@"noiseScore"];

          v56 = NSNumber;
          [v25 failureScore];
          v57 = objc_msgSend(v56, "numberWithFloat:");
          [v22 setObject:v57 forKeyedSubscript:@"failureScore"];

          v58 = NSNumber;
          [v25 pleasantCompositionScore];
          v59 = objc_msgSend(v58, "numberWithFloat:");
          [v22 setObject:v59 forKeyedSubscript:@"pleasantCompositionScore"];

          v60 = NSNumber;
          [v25 interestingSubjectScore];
          v61 = objc_msgSend(v60, "numberWithFloat:");
          [v22 setObject:v61 forKeyedSubscript:@"interestingSubjectScore"];

          v62 = NSNumber;
          [v25 intrusiveObjectPresenceScore];
          v63 = objc_msgSend(v62, "numberWithFloat:");
          [v22 setObject:v63 forKeyedSubscript:@"intrusiveObjectPresenceScore"];

          v64 = NSNumber;
          [v25 pleasantCameraTiltScore];
          v65 = objc_msgSend(v64, "numberWithFloat:");
          [v22 setObject:v65 forKeyedSubscript:@"pleasantCameraTiltScore"];

          v66 = NSNumber;
          v121 = v25;
          [v25 lowLight];
          v67 = objc_msgSend(v66, "numberWithFloat:");
          [v22 setObject:v67 forKeyedSubscript:@"lowLight"];

          v68 = [v21 mediaAnalysisProperties];
          v69 = NSNumber;
          [v68 blurrinessScore];
          v70 = objc_msgSend(v69, "numberWithFloat:");
          [v22 setObject:v70 forKeyedSubscript:@"blurrinessScore"];

          v71 = NSNumber;
          v120 = v68;
          [v68 exposureScore];
          v72 = objc_msgSend(v71, "numberWithFloat:");
          [v22 setObject:v72 forKeyedSubscript:@"exposureScore"];

          v73 = [v21 sceneprintProperties];
          v74 = [v73 sceneprint];
          v123 = v22;
          [v22 setObject:v74 forKeyedSubscript:@"sceneprint"];

          id v75 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v127 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          v122 = v21;
          v76 = [v21 localIdentifier];
          v77 = [v116 objectForKeyedSubscript:v76];

          id v125 = v77;
          uint64_t v78 = [v77 countByEnumeratingWithState:&v127 objects:v142 count:16];
          if (v78)
          {
            uint64_t v79 = v78;
            uint64_t v80 = *(void *)v128;
            do
            {
              for (uint64_t i = 0; i != v79; ++i)
              {
                if (*(void *)v128 != v80) {
                  objc_enumerationMutation(v125);
                }
                v82 = *(void **)(*((void *)&v127 + 1) + 8 * i);
                v83 = [v82 personLocalIdentifier];
                v84 = v83;
                if (v83)
                {
                  id v85 = v83;
                }
                else
                {
                  v86 = [MEMORY[0x1E4F29128] UUID];
                  id v85 = [v86 UUIDString];
                }
                v140[0] = @"size";
                v87 = NSNumber;
                [v82 size];
                v88 = objc_msgSend(v87, "numberWithDouble:");
                v141[0] = v88;
                v140[1] = @"quality";
                v89 = NSNumber;
                [v82 quality];
                v90 = objc_msgSend(v89, "numberWithDouble:");
                v141[1] = v90;
                v140[2] = @"centerX";
                v91 = NSNumber;
                [v82 centerX];
                v92 = objc_msgSend(v91, "numberWithDouble:");
                v141[2] = v92;
                v140[3] = @"centerY";
                v93 = NSNumber;
                [v82 centerY];
                v94 = objc_msgSend(v93, "numberWithDouble:");
                v141[3] = v94;
                v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v140 count:4];
                [v75 setObject:v95 forKeyedSubscript:v85];
              }
              uint64_t v79 = [v125 countByEnumeratingWithState:&v127 objects:v142 count:16];
            }
            while (v79);
          }

          [v123 setObject:v75 forKeyedSubscript:@"faces"];
          v96 = [v122 localIdentifier];
          id v8 = v115;
          int v97 = [v115 containsObject:v96];

          if (v97) {
            v98 = v118;
          }
          else {
            v98 = v117;
          }
          [v98 addObject:v123];

          uint64_t v20 = v124 + 1;
        }
        while (v124 + 1 != v119);
        uint64_t v119 = [obj countByEnumeratingWithState:&v131 objects:v143 count:16];
      }
      while (v119);
    }

    v138[1] = @"report";
    v139[0] = @"assetInformation";
    v138[0] = @"type";
    v136[0] = @"TP";
    v136[1] = @"FP";
    v137[0] = v118;
    v137[1] = v117;
    v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:v136 count:2];
    v139[1] = v99;
    v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v138 count:2];

    id v126 = 0;
    v101 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v100 format:100 options:0 error:&v126];
    v11 = v126;

    if (v101)
    {
      v7 = v112;
      v102 = [v112 URLByAppendingPathComponent:@"report.plist"];
      BOOL v103 = 1;
      if ([v101 writeToURL:v102 atomically:1])
      {
LABEL_33:

        v105 = v110;
        id v9 = v111;
        goto LABEL_34;
      }
      v104 = PLUIGetLog();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v146 = v102;
        __int16 v147 = 2112;
        v148 = v11;
        _os_log_impl(&dword_1AE9F8000, v104, OS_LOG_TYPE_ERROR, "Failed to write plist radar report to path: %@, error: %@", buf, 0x16u);
      }
    }
    else
    {
      v102 = PLUIGetLog();
      v7 = v112;
      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v146 = v11;
        _os_log_impl(&dword_1AE9F8000, v102, OS_LOG_TYPE_ERROR, "Failed to create plist data with error: %@", buf, 0xCu);
      }
    }
    BOOL v103 = 0;
    goto LABEL_33;
  }
  v105 = PLUIGetLog();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v146 = v7;
    __int16 v147 = 2112;
    v148 = v11;
    _os_log_impl(&dword_1AE9F8000, v105, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  BOOL v103 = 0;
LABEL_34:

  return v103;
}

- (void)_fileRadarWithGoodSuggestions:(id)a3 badSuggestions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:@"Collecting data for radar..." preferredStyle:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__PUTopPeopleWallpaperSuggestionsDebugViewController__fileRadarWithGoodSuggestions_badSuggestions___block_invoke;
  v12[3] = &unk_1E5F2D098;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v15 = v8;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self presentViewController:v9 animated:1 completion:v12];
}

void __99__PUTopPeopleWallpaperSuggestionsDebugViewController__fileRadarWithGoodSuggestions_badSuggestions___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) assetCollectionAssets];
  unint64_t v3 = [v2 count];

  unint64_t v4 = [*(id *)(a1 + 40) count];
  v5 = (void *)MEMORY[0x1E4F28EE0];
  id v6 = [NSNumber numberWithDouble:(double)v4 / (double)v3];
  id v7 = [v5 localizedStringFromNumber:v6 numberStyle:3];

  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld incorrectly suggested asset(s)", v4);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v9 appendString:@"— Top People Wallpaper Suggestion Feedback —\n"];
  [v9 appendFormat:@"Incorrect Suggestion(s): %ld of %ld (%@)\n", v4, v3, v7];
  id v10 = NSTemporaryDirectory();
  id v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v12 = [v11 UUIDString];
  id v13 = [v10 stringByAppendingPathComponent:v12];

  id v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:1];
  if (([*(id *)(a1 + 32) _writeDiagnosticsToURL:v14 goodSuggestions:*(void *)(a1 + 48) badSuggestions:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Failed to write diagnostics to URL: %@", buf, 0xCu);
    }
  }
  v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v28 = 0;
  v17 = [v16 contentsOfDirectoryAtURL:v14 includingPropertiesForKeys:0 options:4 error:&v28];
  id v18 = v28;
  if (!v17)
  {
    uint64_t v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to find diagnostic files at URL: %@, error: %@", buf, 0x16u);
    }
  }
  uint64_t v20 = (void *)MEMORY[0x1E4F90200];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __99__PUTopPeopleWallpaperSuggestionsDebugViewController__fileRadarWithGoodSuggestions_badSuggestions___block_invoke_369;
  v24[3] = &unk_1E5F2B8C8;
  v24[4] = *(void *)(a1 + 32);
  id v25 = *(id *)(a1 + 56);
  id v26 = v16;
  id v27 = v14;
  id v21 = v14;
  id v22 = v16;
  LOBYTE(v23) = 0;
  [v20 fileRadarWithTitle:v8 description:v9 classification:@"Other Bug" componentID:@"819256" componentName:@"Photos Media Mining (New Bugs)" componentVersion:@"all" keyword:&stru_1F06BE7B8 attachmentURLs:v17 includeSysDiagnose:v23 completionHandler:v24];
}

void __99__PUTopPeopleWallpaperSuggestionsDebugViewController__fileRadarWithGoodSuggestions_badSuggestions___block_invoke_369(uint64_t a1)
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

  id v6 = (void *)MEMORY[0x1E4F38EB8];
  uint64_t v7 = [(PUPhotosAlbumViewController *)self assetCollection];
  id v8 = [v6 fetchAssetsInAssetCollection:v7 options:0];
  id v9 = [v8 fetchedObjects];

  uint64_t v10 = NSStringFromSelector(sel_localIdentifier);
  __int16 v11 = v10;
  if (v5)
  {
    id v12 = (void *)MEMORY[0x1E4F90200];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__PUTopPeopleWallpaperSuggestionsDebugViewController__presentTapToRadar__block_invoke_2;
    v18[3] = &unk_1E5F25270;
    v18[4] = self;
    id v19 = v9;
    id v20 = v10;
    id v13 = v9;
    [v12 presentTermsAndConditionsForUIViewController:self completion:v18];
  }
  else
  {
    id v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"File Radar" message:@"No photo is selected. Are all the suggestions shown good?" preferredStyle:1];
    id v14 = (void *)MEMORY[0x1E4FB1410];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __72__PUTopPeopleWallpaperSuggestionsDebugViewController__presentTapToRadar__block_invoke;
    v21[3] = &unk_1E5F22E10;
    v21[4] = self;
    id v22 = v9;
    id v23 = v11;
    id v15 = v9;
    v16 = [v14 actionWithTitle:@"File Radar" style:0 handler:v21];
    v17 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
    [v13 addAction:v16];
    [v13 addAction:v17];
    [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self presentViewController:v13 animated:1 completion:0];
  }
}

void __72__PUTopPeopleWallpaperSuggestionsDebugViewController__presentTapToRadar__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) valueForKey:*(void *)(a1 + 48)];
  [v1 _fileRadarWithGoodSuggestions:v2 badSuggestions:0];
}

void __72__PUTopPeopleWallpaperSuggestionsDebugViewController__presentTapToRadar__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) selectedAssets];
    uint64_t v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v3 removeObjectsInArray:v7];
    char v4 = *(void **)(a1 + 32);
    char v5 = [v3 valueForKey:*(void *)(a1 + 48)];
    id v6 = [v7 valueForKey:*(void *)(a1 + 48)];
    [v4 _fileRadarWithGoodSuggestions:v5 badSuggestions:v6];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugViewController;
  id v6 = a4;
  id v7 = [(PUPhotosGridViewController *)&v18 collectionView:a3 cellForItemAtIndexPath:v6];
  id v8 = [(PUPhotosAlbumViewController *)self assetCollectionAssets];
  uint64_t v9 = [v6 item];

  uint64_t v10 = [v8 objectAtIndex:v9];

  scoreByAssetLocalIdentifier = self->_scoreByAssetLocalIdentifier;
  id v12 = [v10 localIdentifier];
  id v13 = [(NSDictionary *)scoreByAssetLocalIdentifier objectForKeyedSubscript:v12];
  [v13 doubleValue];
  uint64_t v15 = v14;

  v16 = [NSString stringWithFormat:@"%.2f", v15];
  [v7 setScore:v16];

  return v7;
}

- (void)_rewind:(id)a3
{
  [(NSMutableSet *)self->_usedAssetLocalIdentifiers removeAllObjects];
  [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self _update];
}

- (void)_editSettings:(id)a3
{
  char v4 = [[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController alloc] initWithDelegate:self];
  [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self setModalPresentationStyle:7];
  [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_update
{
  v37[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v4 = *MEMORY[0x1E4F8B0F8];
  v36[0] = *MEMORY[0x1E4F8B108];
  v36[1] = v4;
  v37[0] = &unk_1F078BA80;
  v37[1] = &unk_1F078BA98;
  uint64_t v5 = *MEMORY[0x1E4F8B0E0];
  v36[2] = *MEMORY[0x1E4F8B0A8];
  v36[3] = v5;
  v37[2] = MEMORY[0x1E4F1CC38];
  v37[3] = &unk_1F078BAB0;
  v36[4] = *MEMORY[0x1E4F8B090];
  v34[0] = @"filteringContext";
  id v6 = [(PUTopPeopleWallpaperSuggesterFilteringContext *)self->_filteringContext dictionaryRepresentation];
  v35[0] = v6;
  v34[1] = @"scoringContext";
  id v7 = [(PUTopPeopleWallpaperSuggestionsScoringContext *)self->_scoringContext dictionaryRepresentation];
  v35[1] = v7;
  v34[2] = @"distancingContext";
  id v8 = [(PUTopPeopleWallpaperSuggestionsDistancingContext *)self->_distancingContext dictionaryRepresentation];
  v35[2] = v8;
  v34[3] = @"usedAssetLocalIdentifiers";
  uint64_t v9 = [(NSMutableSet *)self->_usedAssetLocalIdentifiers allObjects];
  v35[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
  v37[4] = v10;
  __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:5];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
  uint64_t v15 = [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self view];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;

  [v14 bounds];
  objc_msgSend(v14, "setFrame:", (v17 - v20) * 0.5, (v19 - v21) * 0.5);
  id v22 = [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self view];
  [v22 addSubview:v14];

  [v14 startAnimating];
  id v23 = [v3 photoAnalysisClient];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke;
  v28[3] = &unk_1E5F22DE8;
  id v29 = v12;
  id v30 = v13;
  __int16 v31 = self;
  id v32 = v3;
  id v33 = v14;
  id v24 = v14;
  id v25 = v3;
  id v26 = v13;
  id v27 = v12;
  [v23 generateSuggestionsWithOptions:v11 reply:v28];
}

void __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F8B118]];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v9 = [v8 objectForKeyedSubscript:@"assetLocalIdentifier"];
        [*(id *)(a1 + 32) addObject:v9];
        uint64_t v10 = [v8 objectForKeyedSubscript:@"score"];
        [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v5);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 1784), *(id *)(a1 + 40));
  __int16 v11 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v12 = [v11 librarySpecificFetchOptions];

  uint64_t v13 = *MEMORY[0x1E4F39458];
  v46[0] = *MEMORY[0x1E4F39448];
  v46[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  [v12 setFetchPropertySets:v14];

  uint64_t v15 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:*(void *)(a1 + 32) options:v12];
  double v16 = [v15 fetchedObjects];

  double v17 = (void *)MEMORY[0x1E4F29008];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke_2;
  v38[3] = &unk_1E5F22DC0;
  id v39 = *(id *)(a1 + 32);
  double v18 = [v17 sortDescriptorWithKey:@"localIdentifier" ascending:1 comparator:v38];
  v45 = v18;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  double v20 = [v16 sortedArrayUsingDescriptors:v19];

  double v21 = *(void **)(*(void *)(a1 + 48) + 1776);
  id v22 = [v20 valueForKey:@"localIdentifier"];
  [v21 addObjectsFromArray:v22];

  id v23 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v20 title:0 identifier:0 photoLibrary:*(void *)(a1 + 56)];
  id v24 = (void *)MEMORY[0x1E4F39008];
  v44 = v23;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  id v26 = [v23 localizedTitle];
  id v27 = [v24 transientCollectionListWithCollections:v25 title:v26];

  id v28 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v27 options:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke_3;
  block[3] = &unk_1E5F2D098;
  id v29 = *(id *)(a1 + 64);
  uint64_t v30 = *(void *)(a1 + 48);
  id v34 = v29;
  uint64_t v35 = v30;
  id v36 = v23;
  id v37 = v28;
  id v31 = v28;
  id v32 = v23;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = NSNumber;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  uint64_t v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  __int16 v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

uint64_t __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  return [v2 setAssetCollection:v3 fetchResultContainingAssetCollection:v4 filterPredicate:0];
}

- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUTTR");
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v13 style:0 target:self action:sel__presentTapToRadar];
  v15.receiver = self;
  v15.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugViewController;
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

- (id)newToolbarItems
{
  v9[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__editSettings_];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:17 target:self action:sel__next_];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:19 target:self action:sel__rewind_];
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v3;
  v9[3] = v5;
  v9[4] = v3;
  v9[5] = v6;
  v9[6] = v3;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];

  return v7;
}

- (BOOL)shouldShowToolbar
{
  return 1;
}

- (void)settingsDidDismiss
{
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugViewController;
  [(PUPhotosAlbumViewController *)&v13 viewDidLoad];
  uint64_t v3 = [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self navigationItem];
  [v3 setLeftItemsSupplementBackButton:1];

  [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self setDefinesPresentationContext:1];
  uint64_t v4 = [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self collectionView];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPhotoCell"];

  uint64_t v5 = objc_alloc_init(PUTopPeopleWallpaperSuggesterFilteringContext);
  filteringContext = self->_filteringContext;
  self->_filteringContext = v5;

  id v7 = objc_alloc_init(PUTopPeopleWallpaperSuggestionsScoringContext);
  scoringContext = self->_scoringContext;
  self->_scoringContext = v7;

  uint64_t v9 = objc_alloc_init(PUTopPeopleWallpaperSuggestionsDistancingContext);
  distancingContext = self->_distancingContext;
  self->_distancingContext = v9;

  __int16 v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  usedAssetLocalIdentifiers = self->_usedAssetLocalIdentifiers;
  self->_usedAssetLocalIdentifiers = v11;

  [(PUTopPeopleWallpaperSuggestionsDebugViewController *)self _update];
}

@end