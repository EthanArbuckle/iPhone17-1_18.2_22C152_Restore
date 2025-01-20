@interface PUCurationTragicFailureInHighlightsDebugViewController
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchUtilityAssetInformation;
- (void)dealloc;
- (void)goToNextHighlight:(id)a3;
- (void)goToPreviousHighlight:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUCurationTragicFailureInHighlightsDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightDatas, 0);
  objc_storeStrong((id *)&self->_backgroundActivityLock, 0);
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
}

- (void)goToPreviousHighlight:(id)a3
{
  unint64_t currentHighlightIndex = self->_currentHighlightIndex;
  if (!currentHighlightIndex) {
    unint64_t currentHighlightIndex = [(PHFetchResult *)self->_highlights count];
  }
  self->_unint64_t currentHighlightIndex = currentHighlightIndex - 1;
  -[PHFetchResult objectAtIndexedSubscript:](self->_highlights, "objectAtIndexedSubscript:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self->_assetCollectionViewController setHighlight:v5];
}

- (void)goToNextHighlight:(id)a3
{
  unint64_t v4 = self->_currentHighlightIndex + 1;
  self->_unint64_t currentHighlightIndex = v4;
  if (v4 == [(PHFetchResult *)self->_highlights count])
  {
    unint64_t currentHighlightIndex = 0;
    self->_unint64_t currentHighlightIndex = 0;
  }
  else
  {
    unint64_t currentHighlightIndex = self->_currentHighlightIndex;
  }
  id v6 = [(PHFetchResult *)self->_highlights objectAtIndexedSubscript:currentHighlightIndex];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self->_assetCollectionViewController setHighlight:v6];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"TragicFailureInHighlightsDebugTableViewCellIdentifier"];
  if (!v7)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"TragicFailureInHighlightsDebugTableViewCellIdentifier"];
    v8 = [v7 detailTextLabel];
    [v8 setNumberOfLines:1];

    v9 = [v7 detailTextLabel];
    [v9 setLineBreakMode:0];
  }
  unint64_t v10 = [v6 item];
  v11 = [(PHFetchResult *)self->_highlights objectAtIndexedSubscript:v10];
  v12 = [v11 localizedTitle];
  v13 = [v11 localizedSubtitle];
  if (v13)
  {
    v14 = [NSString stringWithFormat:@"%@ - %@", v12, v13];
  }
  else
  {
    v14 = v12;
  }
  v15 = [v7 textLabel];
  [v15 setText:v14];

  if (v13) {
  if (v10 < [(NSMutableArray *)self->_highlightDatas count])
  }
  {
    v40 = v12;
    v16 = [(NSMutableArray *)self->_highlightDatas objectAtIndexedSubscript:v10];
    v17 = [v16 objectAtIndexedSubscript:0];
    uint64_t v18 = [v17 unsignedIntegerValue];

    v19 = [v16 objectAtIndexedSubscript:1];
    uint64_t v20 = [v19 unsignedIntegerValue];

    v21 = [v16 objectAtIndexedSubscript:2];
    uint64_t v22 = [v21 unsignedIntegerValue];

    if (v20)
    {
      id v39 = v6;
      id v23 = objc_alloc(MEMORY[0x1E4F28E48]);
      v24 = [NSString stringWithFormat:@"%d assets, ", v18];
      v25 = (void *)[v23 initWithString:v24];

      id v26 = objc_alloc(MEMORY[0x1E4F28B18]);
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"%d tragic failures", v20);
      uint64_t v41 = *MEMORY[0x1E4FB0700];
      v28 = [MEMORY[0x1E4FB1618] redColor];
      v42[0] = v28;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
      v30 = (void *)[v26 initWithString:v27 attributes:v29];
      [v25 appendAttributedString:v30];

      if (v22)
      {
        id v31 = objc_alloc(MEMORY[0x1E4F28B18]);
        v32 = [NSString stringWithFormat:@", %d other utilities", v22];
        v33 = (void *)[v31 initWithString:v32];
        [v25 appendAttributedString:v33];
      }
      v34 = [v7 detailTextLabel];
      [v34 setAttributedText:v25];

      id v6 = v39;
    }
    else
    {
      if (v22) {
        [NSString stringWithFormat:@"%d assets, %d other utilities", v18, v22];
      }
      else {
      v35 = [NSString stringWithFormat:@"%d assets, no utilities", v18, v38];
      }
      v36 = [v7 detailTextLabel];
      [v36 setText:v35];
    }
    v12 = v40;
  }
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(PHFetchResult *)self->_highlights count];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 48.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t v5 = objc_msgSend(a4, "item", a3);
  self->_unint64_t currentHighlightIndex = v5;
  id v6 = [(PHFetchResult *)self->_highlights objectAtIndexedSubscript:v5];
  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self->_assetCollectionViewController setHighlight:v6];

  id v7 = [(PUCurationTragicFailureInHighlightsDebugViewController *)self navigationController];
  [v7 pushViewController:self->_assetCollectionViewController animated:1];
}

- (void)_fetchUtilityAssetInformation
{
  v28[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  unint64_t v4 = [v3 librarySpecificFetchOptions];
  unint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v28[0] = v5;
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:0];
  v28[1] = v6;
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v28[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  [v4 setSortDescriptors:v8];

  v9 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v4];
  highlights = self->_highlights;
  self->_highlights = v9;

  v11 = [(PUCurationTragicFailureInHighlightsDebugViewController *)self tableView];
  [v11 reloadData];

  v12 = self->_highlights;
  v13 = self->_backgroundActivityLock;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  v15 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke;
  block[3] = &unk_1E5F2C320;
  id v21 = v3;
  uint64_t v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  v17 = v12;
  uint64_t v18 = v13;
  id v19 = v3;
  objc_copyWeak(&v26, &location);
  v25 = self;
  dispatch_async(v15, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke(id *a1)
{
  v1 = a1;
  v87[3] = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] librarySpecificFetchOptions];
  uint64_t v3 = *MEMORY[0x1E4F394E0];
  v87[0] = *MEMORY[0x1E4F39538];
  v87[1] = v3;
  v87[2] = *MEMORY[0x1E4F39420];
  unint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
  [v2 setFetchPropertySets:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  unint64_t v6 = 0;
  v59 = (id *)&v75;
  v60 = v72;
  from = v1 + 9;
  unint64_t v7 = 0x1E4F1C000uLL;
  uint64_t v57 = 3221225472;
  unint64_t v8 = 0x1E4F38000uLL;
  do
  {
    while (1)
    {
      v9 = (void *)MEMORY[0x1B3E7C430]();
      id v10 = v1[5];
      v11 = [*(id *)(v7 + 2504) dateWithTimeIntervalSinceNow:1.0];
      LODWORD(v10) = [v10 lockWhenCondition:0 beforeDate:v11];

      if (v10) {
        break;
      }
      uint64_t v12 = [v1[5] condition];
      if (v12 == 2) {
        goto LABEL_40;
      }
    }
    v63 = v9;
    v64 = v5;
    v66 = v1;
    v62 = [v1[6] objectAtIndexedSubscript:v6];
    v67 = v2;
    v13 = objc_msgSend(*(id *)(v8 + 3768), "fetchAssetsInAssetCollection:options:");
    uint64_t v14 = [v13 count];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v80 objects:v86 count:16];
    v68 = v15;
    unint64_t v65 = v6;
    uint64_t v61 = v14;
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v81;
      while (1)
      {
        uint64_t v21 = 0;
        uint64_t v69 = v17;
        do
        {
          if (*(void *)v81 != v20) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void **)(*((void *)&v80 + 1) + 8 * v21);
          if (objc_msgSend(v22, "isPhoto", v57, from, v59, v60))
          {
            id v23 = [v22 sceneAnalysisProperties];
            int v24 = [v23 sceneAnalysisVersion];

            if (v24 > 40)
            {
              uint64_t v30 = v20;
              uint64_t v31 = v18;
              uint64_t v32 = v19;
              long long v78 = 0u;
              long long v79 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              v33 = [v22 sceneClassifications];
              uint64_t v34 = [v33 countByEnumeratingWithState:&v76 objects:v85 count:16];
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v77;
LABEL_18:
                uint64_t v37 = 0;
                while (1)
                {
                  if (*(void *)v77 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  uint64_t v38 = *(void **)(*((void *)&v76 + 1) + 8 * v37);
                  if ([v38 extendedSceneIdentifier] == 2147483631) {
                    break;
                  }
                  if (v35 == ++v37)
                  {
                    uint64_t v35 = [v33 countByEnumeratingWithState:&v76 objects:v85 count:16];
                    if (v35) {
                      goto LABEL_18;
                    }
                    goto LABEL_24;
                  }
                }
                [v38 confidence];
                double v40 = v39;

                uint64_t v19 = v32;
                uint64_t v18 = v31;
                uint64_t v20 = v30;
                id v15 = v68;
                uint64_t v17 = v69;
                if (v40 < 0.34)
                {
                  if (v40 < 0.05) {
                    goto LABEL_30;
                  }
                  uint64_t v41 = [v22 mediaAnalysisProperties];
                  [v41 blurrinessScore];
                  float v43 = v42;

                  if (v43 >= 0.25) {
                    goto LABEL_30;
                  }
                }
                goto LABEL_28;
              }
LABEL_24:

              uint64_t v19 = v32;
              uint64_t v18 = v31;
              uint64_t v20 = v30;
              id v15 = v68;
              uint64_t v17 = v69;
            }
            else
            {
              v25 = [v22 mediaAnalysisProperties];
              [v25 blurrinessScore];
              if (v26 < 0.01) {
                goto LABEL_15;
              }
              [v22 overallAestheticScore];
              double v28 = v27;

              if (v28 < 0.1) {
                goto LABEL_28;
              }
              v25 = [v22 aestheticProperties];
              [v25 failureScore];
              if (v29 < -0.45)
              {
LABEL_15:

LABEL_28:
                ++v18;
                goto LABEL_32;
              }
              [v25 tastefullyBlurredScore];
              double v45 = v44;

              if (v45 < -0.92) {
                goto LABEL_28;
              }
            }
          }
LABEL_30:
          [v22 curationScore];
          if (v46 < 0.5) {
            ++v19;
          }
LABEL_32:
          ++v21;
        }
        while (v21 != v17);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v80 objects:v86 count:16];
        if (!v17) {
          goto LABEL_36;
        }
      }
    }
    uint64_t v18 = 0;
    uint64_t v19 = 0;
LABEL_36:

    v1 = v66;
    id v47 = v66[7];
    v48 = [NSNumber numberWithUnsignedInteger:v61];
    v84[0] = v48;
    v49 = [NSNumber numberWithUnsignedInteger:v18];
    v84[1] = v49;
    v50 = [NSNumber numberWithUnsignedInteger:v19];
    v84[2] = v50;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
    [v47 addObject:v51];

    id v5 = v64;
    [v64 addIndex:v65];
    unint64_t v6 = v65 + 1;
    unint64_t v52 = [v66[6] count];
    unint64_t v53 = v52;
    if (__ROR8__(0x8F5C28F5C28F5C29 * (v65 + 1), 2) < 0x28F5C28F5C28F5DuLL || v6 >= v52)
    {
      id v54 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = v57;
      v72[0] = __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_2;
      v72[1] = &unk_1E5F2D3F0;
      objc_copyWeak(v59, from);
      int8x16_t v70 = *(int8x16_t *)(v66 + 7);
      id v55 = (id)v70.i64[0];
      int8x16_t v73 = vextq_s8(v70, v70, 8uLL);
      id v74 = v64;
      id v56 = v64;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(v59);
      id v5 = v54;
    }
    v2 = v67;
    unint64_t v7 = 0x1E4F1C000;
    unint64_t v8 = 0x1E4F38000;
    objc_msgSend(v66[5], "unlock", v57, from, v59);
  }
  while (v6 < v53);
LABEL_40:
}

void __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 40) copy];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 1056);
    *(void *)(v4 + 1056) = v3;

    unint64_t v6 = [WeakRetained tableView];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_3;
    v7[3] = &unk_1E5F2ECC8;
    id v8 = *(id *)(a1 + 48);
    id v9 = WeakRetained;
    [v6 performBatchUpdates:v7 completion:&__block_literal_global_89568];
  }
}

uint64_t __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_4;
  v3[3] = &unk_1E5F2C2D8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateIndexesUsingBlock:v3];
}

void __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) tableView];
  uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:0];
  v6[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 reloadRowsAtIndexPaths:v5 withRowAnimation:5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCurationTragicFailureInHighlightsDebugViewController;
  [(PUCurationTragicFailureInHighlightsDebugViewController *)&v4 viewWillDisappear:a3];
  [(NSConditionLock *)self->_backgroundActivityLock lock];
  [(NSConditionLock *)self->_backgroundActivityLock unlockWithCondition:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCurationTragicFailureInHighlightsDebugViewController;
  [(PUCurationTragicFailureInHighlightsDebugViewController *)&v4 viewDidAppear:a3];
  [(NSConditionLock *)self->_backgroundActivityLock lock];
  [(NSConditionLock *)self->_backgroundActivityLock unlockWithCondition:0];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PUCurationTragicFailureInHighlightsDebugViewController;
  [(PUCurationTragicFailureInHighlightsDebugViewController *)&v12 viewDidLoad];
  uint64_t v3 = [(PUCurationTragicFailureInHighlightsDebugViewController *)self px_extendedTraitCollection];
  [v3 userInterfaceIdiom];
  objc_opt_class();

  objc_super v4 = [PUCurationTragicFailureInHighlightsGridDebugViewController alloc];
  id v5 = objc_opt_new();
  unint64_t v6 = [(PUCurationTragicFailureInHighlightsGridDebugViewController *)v4 initWithSpec:v5];
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v6;

  [(PUCurationTragicFailureInHighlightsGridDebugViewController *)self->_assetCollectionViewController setParentController:self];
  id v8 = (NSConditionLock *)objc_alloc_init(MEMORY[0x1E4F28BB8]);
  backgroundActivityLock = self->_backgroundActivityLock;
  self->_backgroundActivityLock = v8;

  id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  highlightDatas = self->_highlightDatas;
  self->_highlightDatas = v10;

  [(PUCurationTragicFailureInHighlightsDebugViewController *)self _fetchUtilityAssetInformation];
}

- (void)dealloc
{
  [(NSConditionLock *)self->_backgroundActivityLock lock];
  [(NSConditionLock *)self->_backgroundActivityLock unlockWithCondition:2];
  v3.receiver = self;
  v3.super_class = (Class)PUCurationTragicFailureInHighlightsDebugViewController;
  [(PUCurationTragicFailureInHighlightsDebugViewController *)&v3 dealloc];
}

@end