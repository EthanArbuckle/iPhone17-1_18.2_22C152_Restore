@interface PXCuratedAssetCollectionDiagnosticsViewController
- (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5;
- (BOOL)initiallyShowCuration;
- (BOOL)shouldPresentTapToRadar;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (NSString)hostLayoutDiagnosticDescription;
- (NSString)hostViewDiagnosticDescription;
- (PXCuratedAssetCollectionDiagnosticsViewController)init;
- (id)_curationTypeKeys;
- (id)_tapToRadarViewControllerWithScreenshot:(BOOL)a3;
- (id)assetsForCurationType:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)curationDebugInformationForCurationType:(int64_t)a3;
- (id)curationDebugInformationWithOptions:(id)a3;
- (id)fullCurationDebugInformation;
- (id)radarAttachmentURLs;
- (id)radarComponentInfoForRoute:(id)a3;
- (id)radarDescriptionTemplate;
- (id)radarRoutes;
- (id)radarTitleTemplate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)currentCurationType;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_closeAction:(id)a3;
- (void)_editSettings:(id)a3;
- (void)_enumerateDifferencesBetweenRect:(CGRect)a3 andRect:(CGRect)a4 usingBlock:(id)a5;
- (void)_tapToRadar:(id)a3;
- (void)_updateCachedAssets;
- (void)_updateUIElementsVisibility;
- (void)addAssetUUIDsTo:(id)a3 from:(id)a4;
- (void)changeCurationType:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)displayCurrentCurationType;
- (void)hideCurationSettings:(id)a3;
- (void)hideItemDetails:(id)a3;
- (void)hideToolbarItems;
- (void)presentTapToRadarIfNeeded;
- (void)reloadCuration;
- (void)requestCurationDebugInfoWithOptions:(id)a3 setGlobally:(BOOL)a4;
- (void)setCurrentCurationType:(int64_t)a3;
- (void)setHostLayoutDiagnosticDescription:(id)a3;
- (void)setHostViewDiagnosticDescription:(id)a3;
- (void)setInitiallyShowCuration:(BOOL)a3;
- (void)setShouldPresentTapToRadar:(BOOL)a3;
- (void)showCurationSettings:(id)a3;
- (void)showInfo:(id)a3;
- (void)showItemDetailsWithDebugInfo:(id)a3;
- (void)showToolbarItems;
- (void)toggleCurationComparison:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXCuratedAssetCollectionDiagnosticsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostViewDiagnosticDescription, 0);
  objc_storeStrong((id *)&self->_hostLayoutDiagnosticDescription, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_editSettingsViewController, 0);
  objc_storeStrong((id *)&self->_screenshotURL, 0);
  objc_storeStrong((id *)&self->_dedupedSymbolIndexByItemIdentifier, 0);
  objc_storeStrong((id *)&self->_itemDetailsView, 0);
  objc_storeStrong((id *)&self->_curationTypeView, 0);
  objc_storeStrong((id *)&self->_curationSettingsView, 0);
  objc_storeStrong((id *)&self->_curationDebugFetchQueue, 0);
  objc_storeStrong((id *)&self->_curationDebugInformation, 0);
  objc_storeStrong((id *)&self->_sortedVisibleAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_assetByUUID, 0);
  objc_storeStrong((id *)&self->_keyAssetUUID, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_visibleAssets, 0);
  objc_storeStrong((id *)&self->_removedAssets, 0);
  objc_storeStrong((id *)&self->_addedAssets, 0);
  objc_storeStrong((id *)&self->_thumbnailOptions, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)setHostViewDiagnosticDescription:(id)a3
{
}

- (NSString)hostViewDiagnosticDescription
{
  return self->_hostViewDiagnosticDescription;
}

- (void)setHostLayoutDiagnosticDescription:(id)a3
{
}

- (NSString)hostLayoutDiagnosticDescription
{
  return self->_hostLayoutDiagnosticDescription;
}

- (void)setShouldPresentTapToRadar:(BOOL)a3
{
  self->_shouldPresentTapToRadar = a3;
}

- (BOOL)shouldPresentTapToRadar
{
  return self->_shouldPresentTapToRadar;
}

- (int64_t)currentCurationType
{
  return self->_currentCurationType;
}

- (void)setInitiallyShowCuration:(BOOL)a3
{
  self->_initiallyShowCuration = a3;
}

- (BOOL)initiallyShowCuration
{
  return self->_initiallyShowCuration;
}

- (id)radarRoutes
{
  return 0;
}

- (id)radarDescriptionTemplate
{
  return &stru_1F00B0030;
}

- (id)radarTitleTemplate
{
  return &stru_1F00B0030;
}

- (id)radarComponentInfoForRoute:(id)a3
{
  return 0;
}

- (id)radarAttachmentURLs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5
{
  return 0;
}

- (id)assetsForCurationType:(int64_t)a3
{
  return 0;
}

- (id)curationDebugInformationWithOptions:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)requestCurationDebugInfoWithOptions:(id)a3 setGlobally:(BOOL)a4
{
  id v6 = a3;
  curationDebugFetchQueue = self->_curationDebugFetchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__PXCuratedAssetCollectionDiagnosticsViewController_requestCurationDebugInfoWithOptions_setGlobally___block_invoke;
  block[3] = &unk_1E5DD21E8;
  BOOL v12 = a4;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_async(curationDebugFetchQueue, block);
}

void __101__PXCuratedAssetCollectionDiagnosticsViewController_requestCurationDebugInfoWithOptions_setGlobally___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"includeKeyAsset"];
  [v2 setObject:v3 forKeyedSubscript:@"includeCuration"];
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"extendedCurationOptions"];
  v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:@"setGlobally"];

  v23 = v2;
  v26 = [*(id *)(a1 + 40) curationDebugInformationWithOptions:v2];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v22 = a1;
  id obj = [*(id *)(a1 + 40) _curationTypeKeys];
  uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v27)
  {
    uint64_t v6 = 0;
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v7;
        uint64_t v8 = *(void *)(*((void *)&v36 + 1) + 8 * v7);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v9 = [v26 objectForKeyedSubscript:v8];
        id v10 = [v9 objectForKeyedSubscript:@"items"];
        v11 = [v10 objectEnumerator];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v33 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = [*(id *)(*((void *)&v32 + 1) + 8 * i) objectForKeyedSubscript:@"dedupedItemIdentifier"];
              if (v16)
              {
                v17 = [v5 objectForKeyedSubscript:v16];
                if (!v17)
                {
                  uint64_t v18 = v6 + 1;
                  v19 = [NSNumber numberWithUnsignedInteger:v6];
                  [v5 setObject:v19 forKeyedSubscript:v16];

                  uint64_t v6 = v18;
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v13);
        }

        uint64_t v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v27);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__PXCuratedAssetCollectionDiagnosticsViewController_requestCurationDebugInfoWithOptions_setGlobally___block_invoke_2;
  block[3] = &unk_1E5DD0F30;
  void block[4] = *(void *)(v22 + 40);
  id v30 = v26;
  id v31 = v5;
  id v20 = v5;
  id v21 = v26;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __101__PXCuratedAssetCollectionDiagnosticsViewController_requestCurationDebugInfoWithOptions_setGlobally___block_invoke_2(id *a1)
{
  objc_storeStrong((id *)a1[4] + 144, a1[5]);
  objc_storeStrong((id *)a1[4] + 151, a1[6]);
  *((unsigned char *)a1[4] + 1176) = 1;
  [a1[4] reloadCuration];
  [a1[4] _updateUIElementsVisibility];
  id v2 = [a1[4] curationDebugInformationForCurationType:*((void *)a1[4] + 156)];
  id v3 = [v2 objectForKeyedSubscript:@"curationOptions"];

  [*((id *)a1[4] + 153) setOptions:v3];
  [a1[4] presentTapToRadarIfNeeded];
}

- (id)fullCurationDebugInformation
{
  dispatch_sync((dispatch_queue_t)self->_curationDebugFetchQueue, &__block_literal_global_99078);
  curationDebugInformation = self->_curationDebugInformation;
  return curationDebugInformation;
}

- (id)curationDebugInformationForCurationType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    id v3 = 0;
  }
  else {
    id v3 = off_1E5DB95B8[a3];
  }
  return [(NSDictionary *)self->_curationDebugInformation objectForKeyedSubscript:v3];
}

- (id)_curationTypeKeys
{
  return &unk_1F02D4180;
}

- (void)hideItemDetails:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PXCuratedAssetCollectionDiagnosticsViewController_hideItemDetails___block_invoke;
  v4[3] = &unk_1E5DD36F8;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__PXCuratedAssetCollectionDiagnosticsViewController_hideItemDetails___block_invoke_2;
  v3[3] = &unk_1E5DD2188;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:v3 completion:0.25];
}

uint64_t __69__PXCuratedAssetCollectionDiagnosticsViewController_hideItemDetails___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1200) setAlpha:0.0];
}

uint64_t __69__PXCuratedAssetCollectionDiagnosticsViewController_hideItemDetails___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 1200) setHidden:1];
  }
  return result;
}

- (void)showItemDetailsWithDebugInfo:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  itemDetailsView = self->_itemDetailsView;
  if (!itemDetailsView)
  {
    uint64_t v6 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
    [v6 frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;

    if (v12 >= v14) {
      double v15 = v14;
    }
    else {
      double v15 = v12;
    }
    CGFloat v16 = (v12 - v15) * 0.5 + 6.0;
    CGFloat v17 = (v14 - v15) * 0.5 + 6.0;
    v64.origin.x = v8;
    v64.origin.y = v10;
    v64.size.width = v12;
    v64.size.height = v14;
    CGRect v65 = CGRectInset(v64, v16, v17);
    uint64_t v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
    v19 = self->_itemDetailsView;
    self->_itemDetailsView = v18;

    id v20 = [(UIView *)self->_itemDetailsView layer];
    [v20 setCornerRadius:6.0];

    id v21 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(UIView *)self->_itemDetailsView setBackgroundColor:v21];

    uint64_t v22 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    objc_msgSend(v22, "setFrame:", 7.0, 8.0, 60.0, 24.0);
    [v22 setTitle:@"Done" forState:0];
    [v22 addTarget:self action:sel_hideItemDetails_ forControlEvents:0x2000];
    [(UIView *)self->_itemDetailsView addSubview:v22];
    [(UIView *)self->_itemDetailsView setHidden:1];
    [(UIView *)self->_itemDetailsView setAlpha:0.0];
    v23 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
    [v23 addSubview:self->_itemDetailsView];

    itemDetailsView = self->_itemDetailsView;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v24 = [(UIView *)itemDetailsView subviews];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v58 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        [v29 removeFromSuperview];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v26);
  }

  uint64_t v30 = [v4 objectForKeyedSubscript:@"criteriaReason"];
  v50 = (void *)v30;
  if (v30)
  {
    uint64_t v31 = v30;
    id v32 = objc_alloc(MEMORY[0x1E4FB1930]);
    long long v33 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
    [v33 frame];
    long long v35 = objc_msgSend(v32, "initWithFrame:", 10.0, 40.0, v34 + -20.0, 20.0);

    [v35 setAutoresizingMask:48];
    [v35 setNumberOfLines:0];
    long long v36 = [NSString stringWithFormat:@"Criteria evaluation:\n%@", v31];
    [v35 setText:v36];

    long long v37 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    [v35 setFont:v37];

    [v35 sizeToFit];
    [(UIView *)self->_itemDetailsView addSubview:v35];
    [v35 bounds];
    double v39 = v38 + 40.0;
  }
  else
  {
    double v39 = 40.0;
  }
  v51 = v4;
  v40 = [v4 objectForKeyedSubscript:@"stateHistory"];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = 0;
    uint64_t v44 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v54 != v44) {
          objc_enumerationMutation(v40);
        }
        v46 = [[PXHistoryLineView alloc] initWithHistoryLine:*(void *)(*((void *)&v53 + 1) + 8 * j)];
        v47 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
        [v47 frame];
        double v49 = v48 + -20.0;

        -[PXHistoryLineView setFrame:](v46, "setFrame:", 10.0, v39 + (double)(unint64_t)(v43 + j) * 40.0, v49, 20.0);
        [(UIView *)self->_itemDetailsView addSubview:v46];
      }
      v43 += j;
      uint64_t v42 = [v40 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v42);
  }
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __82__PXCuratedAssetCollectionDiagnosticsViewController_showItemDetailsWithDebugInfo___block_invoke;
  v52[3] = &unk_1E5DD36F8;
  v52[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v52 animations:0.25];
}

uint64_t __82__PXCuratedAssetCollectionDiagnosticsViewController_showItemDetailsWithDebugInfo___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1200) setHidden:0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1200);
  return [v2 setAlpha:1.0];
}

- (void)hideCurationSettings:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__PXCuratedAssetCollectionDiagnosticsViewController_hideCurationSettings___block_invoke;
  v4[3] = &unk_1E5DD36F8;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PXCuratedAssetCollectionDiagnosticsViewController_hideCurationSettings___block_invoke_2;
  v3[3] = &unk_1E5DD2188;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:v3 completion:0.25];
}

uint64_t __74__PXCuratedAssetCollectionDiagnosticsViewController_hideCurationSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1184) setAlpha:0.0];
}

uint64_t __74__PXCuratedAssetCollectionDiagnosticsViewController_hideCurationSettings___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 1184) setHidden:1];
  }
  return result;
}

- (void)showCurationSettings:(id)a3
{
  if (!self->_curationSettingsView)
  {
    id v4 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
    [v4 frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double v10 = v9;
    double v12 = v11;

    if (v10 >= v12) {
      double v13 = v12;
    }
    else {
      double v13 = v10;
    }
    CGFloat v14 = (v10 - v13) * 0.5 + 6.0;
    CGFloat v15 = (v12 - v13) * 0.5 + 6.0;
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.width = v10;
    v28.size.height = v12;
    CGRect v29 = CGRectInset(v28, v14, v15);
    CGFloat v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
    curationSettingsView = self->_curationSettingsView;
    self->_curationSettingsView = v16;

    uint64_t v18 = [(UIView *)self->_curationSettingsView layer];
    [v18 setCornerRadius:6.0];

    v19 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(UIView *)self->_curationSettingsView setBackgroundColor:v19];

    id v20 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    objc_msgSend(v20, "setFrame:", 7.0, 8.0, 60.0, 24.0);
    [v20 setTitle:@"Done" forState:0];
    [v20 addTarget:self action:sel_hideCurationSettings_ forControlEvents:0x2000];
    [(UIView *)self->_curationSettingsView addSubview:v20];
    id v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DD8]), "initWithFrame:", 35.0, 80.0, 200.0, 200.0);
    [v21 setBackgroundColor:0];
    uint64_t v22 = [v20 titleLabel];
    v23 = [v22 font];
    [v21 setFont:v23];

    [v21 setText:@"Symbols:\n\t💟 favorite\n\t🚮 junk\n\t📳 blurry\n\t🏞 SDOF/HDR\n\t✅ elected\n\t✳️ completed\n\t❌ rejected\n\t⁉️ ?!?!"];
    [(UIView *)self->_curationSettingsView addSubview:v21];
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DD8]), "initWithFrame:", 180.0, 80.0, 200.0, 200.0);
    [v24 setBackgroundColor:0];
    uint64_t v25 = [v21 font];
    [v24 setFont:v25];

    [v24 setText:@"Deduping\n\t⏏️ similar\n\t🔀 semantic\n\t⤴️ SDOF/HDR\n\t🔃 timing\n\t🎦 video"];
    [(UIView *)self->_curationSettingsView addSubview:v24];
    [(UIView *)self->_curationSettingsView setHidden:1];
    [(UIView *)self->_curationSettingsView setAlpha:0.0];
    uint64_t v26 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
    [v26 addSubview:self->_curationSettingsView];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__PXCuratedAssetCollectionDiagnosticsViewController_showCurationSettings___block_invoke;
  v27[3] = &unk_1E5DD36F8;
  v27[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v27 animations:0.25];
}

uint64_t __74__PXCuratedAssetCollectionDiagnosticsViewController_showCurationSettings___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1184) setHidden:0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1184);
  return [v2 setAlpha:1.0];
}

- (void)setCurrentCurationType:(int64_t)a3
{
  if (self->_currentCurationType != a3)
  {
    self->_currentCurationType = a3;
    id v4 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationController];
    double v5 = [v4 topViewController];

    if (v5 == self) {
      [(PXCuratedAssetCollectionDiagnosticsViewController *)self showToolbarItems];
    }
    [(PXCuratedAssetCollectionDiagnosticsViewController *)self reloadCuration];
  }
}

- (void)addAssetUUIDsTo:(id)a3 from:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = [v7 objectForKeyedSubscript:@"itemIdentifiers"];
  if (v8)
  {
    [v6 addObjectsFromArray:v8];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v9 = objc_msgSend(v7, "objectForKeyedSubscript:", @"sortedObjects", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [(PXCuratedAssetCollectionDiagnosticsViewController *)self addAssetUUIDsTo:v6 from:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)changeCurationType:(id)a3
{
  id v4 = a3;
  int64_t currentCurationType = self->_currentCurationType;
  id v11 = v4;
  if ([v4 direction] == 1)
  {
    if (currentCurationType <= 5) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = currentCurationType;
    }
    while (v6 != currentCurationType)
    {
      id v7 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self curationDebugInformationForCurationType:++currentCurationType];

      if (v7) {
        goto LABEL_7;
      }
    }
  }
  else if ([v11 direction] == 2 && currentCurationType-- >= 1)
  {
    while (1)
    {
      double v9 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self curationDebugInformationForCurationType:currentCurationType];

      if (v9) {
        break;
      }
      unint64_t v10 = currentCurationType-- + 1;
      if (v10 < 2) {
        goto LABEL_12;
      }
    }
LABEL_7:
    [(PXCuratedAssetCollectionDiagnosticsViewController *)self setCurrentCurationType:currentCurationType];
  }
LABEL_12:
}

- (void)reloadCuration
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self assetsForCurationType:5];
  allAssets = self->_allAssets;
  self->_allAssets = v3;

  double v5 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self assetsForCurationType:0];
  uint64_t v6 = [v5 firstObject];
  id v7 = [v6 uuid];
  keyAssetUUID = self->_keyAssetUUID;
  self->_keyAssetUUID = v7;

  double v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v10 = self->_allAssets;
  uint64_t v11 = [(PHFetchResult *)v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "uuid", (void)v27);
        [(NSDictionary *)v9 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v12 = [(PHFetchResult *)v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  assetByUUID = self->_assetByUUID;
  self->_assetByUUID = v9;
  uint64_t v18 = v9;

  uint64_t v19 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self curationDebugInformationForCurationType:self->_currentCurationType];
  id v20 = [v19 objectForKeyedSubscript:@"rootCluster"];
  id v21 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(PXCuratedAssetCollectionDiagnosticsViewController *)self addAssetUUIDsTo:v21 from:v20];
  sortedVisibleAssetUUIDs = self->_sortedVisibleAssetUUIDs;
  self->_sortedVisibleAssetUUIDs = v21;
  v23 = v21;

  v24 = [(PHFetchResult *)self->_allAssets fetchedObjects];
  visibleAssets = self->_visibleAssets;
  self->_visibleAssets = v24;

  [(UICollectionView *)self->_collectionView reloadData];
  NSInteger v26 = [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex];

  if (v26 == 1) {
    [(PXCuratedAssetCollectionDiagnosticsViewController *)self displayCurrentCurationType];
  }
}

- (void)displayCurrentCurationType
{
  if (!self->_curationTypeView)
  {
    id v3 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
    [v3 frame];
    CGFloat v5 = v4 * 0.5;
    uint64_t v6 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
    [v6 frame];
    CGFloat v8 = v7 * 0.5;
    v29.origin.double x = -90.0;
    v29.origin.double y = -45.0;
    v29.size.double width = 180.0;
    v29.size.double height = 90.0;
    CGRect v30 = CGRectOffset(v29, v5, v8);
    double x = v30.origin.x;
    double y = v30.origin.y;
    double width = v30.size.width;
    double height = v30.size.height;

    uint64_t v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    curationTypeView = self->_curationTypeView;
    self->_curationTypeView = v13;

    long long v15 = [(UIView *)self->_curationTypeView layer];
    [v15 setCornerRadius:6.0];

    long long v16 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    long long v17 = [v16 colorWithAlphaComponent:0.75];
    [(UIView *)self->_curationTypeView setBackgroundColor:v17];

    id v18 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(UIView *)self->_curationTypeView bounds];
    uint64_t v19 = objc_msgSend(v18, "initWithFrame:");
    id v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:24.0 weight:2.0];
    [v19 setFont:v20];

    id v21 = [MEMORY[0x1E4FB1618] labelColor];
    [v19 setTextColor:v21];

    [v19 setTextAlignment:1];
    [(UIView *)self->_curationTypeView addSubview:v19];
    [(UIView *)self->_curationTypeView setHidden:1];
    [(UIView *)self->_curationTypeView setAlpha:0.0];
    uint64_t v22 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
    [v22 addSubview:self->_curationTypeView];
  }
  unint64_t currentCurationType = self->_currentCurationType;
  if (currentCurationType > 5) {
    v24 = 0;
  }
  else {
    v24 = off_1E5DB9588[currentCurationType];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke;
  v27[3] = &unk_1E5DD32A8;
  v27[4] = self;
  long long v28 = v24;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v27 animations:0.25];
  dispatch_time_t v25 = dispatch_time(0, 600000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_2;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_after(v25, MEMORY[0x1E4F14428], block);
}

void __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1192) subviews];
  id v3 = [v2 firstObject];

  [v3 setText:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 1192) setHidden:0];
  [*(id *)(*(void *)(a1 + 32) + 1192) setAlpha:1.0];
}

uint64_t __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_3;
  v3[3] = &unk_1E5DD36F8;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_4;
  v2[3] = &unk_1E5DD2188;
  v2[4] = v4;
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:v2 completion:0.25];
}

uint64_t __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1192) setAlpha:0.0];
}

uint64_t __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_4(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 1192) setHidden:1];
  }
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = [a3 cellForItemAtIndexPath:a4];
  CGFloat v5 = [v6 debugInfo];
  [(PXCuratedAssetCollectionDiagnosticsViewController *)self showItemDetailsWithDebugInfo:v5];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  double v9 = [a3 dequeueReusableSupplementaryViewOfKind:a4 withReuseIdentifier:@"PXCuratedAssetCollectionSectionHeaderReuseIdentifier" forIndexPath:v8];
  if (self->_curationDebugInformation)
  {
    unint64_t v10 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self curationDebugInformationForCurationType:self->_currentCurationType];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"rootCluster"];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"sortedObjects"];
    uint64_t v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "section"));

    [v9 setSectionInfo:v13];
  }

  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  CGFloat v5 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
  [v5 bounds];
  double v7 = v6;

  double v8 = 42.0;
  double v9 = v7;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = [(NSArray *)self->_visibleAssets count];
  }
  if (self->_curationDebugInformation)
  {
    double v8 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self curationDebugInformationForCurationType:self->_currentCurationType];
    double v9 = [v8 objectForKeyedSubscript:@"rootCluster"];
    unint64_t v10 = [v9 objectForKeyedSubscript:@"sortedObjects"];
    uint64_t v11 = [v10 objectAtIndex:a4];

    uint64_t v12 = [v11 objectForKeyedSubscript:@"totalNumberOfItems"];
    int64_t v7 = [v12 unsignedIntegerValue];
    if (!v7)
    {
      uint64_t v13 = [v11 objectForKeyedSubscript:@"itemIdentifiers"];
      int64_t v7 = [v13 count];
    }
  }

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 item];
  id v75 = v6;
  v79 = v7;
  v76 = self;
  if (self->_curationDebugInformation)
  {
    v69 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self curationDebugInformationForCurationType:self->_currentCurationType];
    v67 = [v69 objectForKeyedSubscript:@"rootCluster"];
    double v9 = [v67 objectForKeyedSubscript:@"sortedObjects"];
    if ([v7 section])
    {
      unint64_t v10 = 0;
      do
      {
        uint64_t v11 = [v9 objectAtIndexedSubscript:v10];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"totalNumberOfItems"];
        uint64_t v13 = [v12 unsignedIntegerValue];

        v8 += v13;
        ++v10;
      }
      while (v10 < [v7 section]);
    }
    v72 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    long long v14 = [v72 objectForKeyedSubscript:@"sortedObjects"];
    if (v14)
    {
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v66 = v14;
      id obj = v14;
      uint64_t v15 = [obj countByEnumeratingWithState:&v83 objects:v87 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        unint64_t v17 = 0;
        BOOL v18 = 0;
        id v19 = 0;
        uint64_t v20 = *(void *)v84;
        while (2)
        {
          uint64_t v21 = 0;
          unint64_t v22 = v17;
          v23 = v19;
          do
          {
            if (*(void *)v84 != v20) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(id *)(*((void *)&v83 + 1) + 8 * v21);

            v24 = [v19 objectForKeyedSubscript:@"totalNumberOfItems"];
            uint64_t v25 = [v24 unsignedIntegerValue];

            NSInteger v26 = [v19 objectForKeyedSubscript:@"sortedObjects"];

            unint64_t v17 = v25 + v22;
            if (v17 > [v79 item])
            {
              BOOL v28 = v26 != 0;
              if (v26) {
                BOOL v27 = v22 == [v79 item];
              }
              else {
                BOOL v27 = 0;
              }
              id v6 = v75;
              self = v76;
              goto LABEL_23;
            }
            BOOL v18 = !v18;
            ++v21;
            unint64_t v22 = v17;
            v23 = v19;
          }
          while (v16 != v21);
          uint64_t v16 = [obj countByEnumeratingWithState:&v83 objects:v87 count:16];
          if (v16) {
            continue;
          }
          break;
        }

        BOOL v27 = 0;
        BOOL v28 = 0;
        id v19 = 0;
        id v6 = v75;
      }
      else
      {
        BOOL v27 = 0;
        BOOL v18 = 0;
        BOOL v28 = 0;
        id v19 = 0;
      }
      self = v76;
LABEL_23:
      CGRect v30 = v67;
      CGRect v29 = v69;

      long long v14 = v66;
    }
    else
    {
      BOOL v27 = 0;
      BOOL v18 = 0;
      BOOL v28 = 0;
      id v19 = 0;
      self = v76;
      CGRect v30 = v67;
      CGRect v29 = v69;
    }

    BOOL v70 = v27;
    uint64_t v31 = 1;
    if (v18) {
      uint64_t v31 = 2;
    }
    if (!v28) {
      uint64_t v31 = 0;
    }
    uint64_t v68 = v31;
    id v7 = v79;
  }
  else
  {
    BOOL v70 = 0;
    uint64_t v68 = 0;
    id v19 = 0;
  }
  if (v8 < [(NSArray *)self->_sortedVisibleAssetUUIDs count]
    && ([(NSArray *)self->_sortedVisibleAssetUUIDs objectAtIndexedSubscript:v8],
        (uint64_t v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v33 = (void *)v32;
    double v34 = [(NSDictionary *)self->_assetByUUID objectForKeyedSubscript:v32];
  }
  else
  {
    double v34 = [(NSArray *)self->_visibleAssets objectAtIndexedSubscript:v8];
  }
  long long v35 = [v6 dequeueReusableCellWithReuseIdentifier:@"PXCuratedAssetCollectionCellReuseIdentifier" forIndexPath:v7];
  long long v36 = [v34 localIdentifier];
  [v35 setRepresentedAssetIdentifier:v36];
  id v37 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v37 setAllowPlaceholder:1];
  [v37 setNetworkAccessAllowed:1];
  [v37 setDeliveryMode:0];
  imageManager = self->_imageManager;
  p_thumbnailSize = &self->_thumbnailSize;
  int64_t thumbnailContentMode = v76->_thumbnailContentMode;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __91__PXCuratedAssetCollectionDiagnosticsViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v80[3] = &unk_1E5DCBF98;
  id v41 = v35;
  id v81 = v41;
  id v42 = v36;
  id v82 = v42;
  -[PHCachingImageManager requestImageForAsset:targetSize:contentMode:options:resultHandler:](imageManager, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v34, thumbnailContentMode, v37, v80, p_thumbnailSize->width, p_thumbnailSize->height);
  if (v76->_curationDebugInformation)
  {
    id obja = [(PXCuratedAssetCollectionDiagnosticsViewController *)v76 curationDebugInformationForCurationType:v76->_currentCurationType];
    uint64_t v43 = [obja objectForKeyedSubscript:@"items"];
    id v73 = v42;
    uint64_t v44 = [MEMORY[0x1E4F38EB8] uuidFromLocalIdentifier:v42];
    v74 = v43;
    v45 = [v43 objectForKeyedSubscript:v44];
    if (v76->_curationComparisonEnabled)
    {
      v71 = (void *)v44;
      [v41 setDebugInfo:0];
      v46 = v45;
      v47 = [v45 objectForKeyedSubscript:@"state"];
      [v41 setState:v47];

      double v48 = [(PXCuratedAssetCollectionDiagnosticsViewController *)v76 assetsForCurationType:v76->_currentCurationType];
      double v49 = [v48 fetchedObjects];

      v50 = [v34 uuid];
      if ([v50 isEqualToString:v76->_keyAssetUUID])
      {
        v51 = @"Required";
      }
      else if ([v49 containsObject:v34])
      {
        v51 = @"Chosen";
      }
      else
      {
        v51 = @"Rejected";
      }
      [v41 setAlternateState:v51];

      long long v54 = [v41 state];
      long long v55 = [v41 alternateState];
      if ([v54 isEqualToString:v55])
      {
        [v41 setComparisonMatch:1];
      }
      else
      {
        long long v56 = [v41 state];
        if ([v56 isEqualToString:@"ForceChosen"])
        {
          long long v57 = [v41 alternateState];
          objc_msgSend(v41, "setComparisonMatch:", objc_msgSend(v57, "isEqualToString:", @"Chosen"));
        }
        else
        {
          [v41 setComparisonMatch:0];
        }
      }
      [v41 setClusterState:0];
      [v41 setSymbolIndex:0];
      [v41 setDedupingType:0];
      [v41 setDedupedSymbolIndex:0];
      v52 = v75;
      v61 = v71;
    }
    else
    {
      v46 = v45;
      [v41 setDebugInfo:v45];
      [v41 setClusterParity:v68];
      v52 = v75;
      if (v70)
      {
        long long v53 = [v19 objectForKeyedSubscript:@"state"];
        [v41 setClusterState:v53];
      }
      else
      {
        [v41 setClusterState:0];
      }
      long long v58 = [(NSDictionary *)v76->_dedupedSymbolIndexByItemIdentifier objectForKeyedSubscript:v44];
      [v41 setSymbolIndex:v58];

      long long v59 = [v46 objectForKeyedSubscript:@"dedupingType"];
      [v41 setDedupingType:v59];

      dedupedSymbolIndexByItemIdentifier = v76->_dedupedSymbolIndexByItemIdentifier;
      [v46 objectForKeyedSubscript:@"dedupedItemIdentifier"];
      double v49 = v61 = (void *)v44;
      v62 = [(NSDictionary *)dedupedSymbolIndexByItemIdentifier objectForKeyedSubscript:v49];
      [v41 setDedupedSymbolIndex:v62];
    }
    id v7 = v79;
    id v42 = v73;
  }
  else
  {
    [v41 setDebugInfo:0];
    [v41 setClusterState:0];
    [v41 setClusterParity:0];
    v52 = v75;
  }
  uint64_t v63 = v82;
  id v64 = v41;

  return v64;
}

void __91__PXCuratedAssetCollectionDiagnosticsViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) representedAssetIdentifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  if (v4) {
    [*(id *)(a1 + 32) setThumbnailImage:v5];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self curationDebugInformationForCurationType:self->_currentCurationType];
  int v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"rootCluster"];
    id v6 = [v5 objectForKeyedSubscript:@"sortedObjects"];
    int64_t v7 = [v6 count];
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(NSArray *)self->_sectionTitles objectAtIndexedSubscript:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v7 dequeueReusableCellWithIdentifier:@"KeywordsCell"];
  if (!v8) {
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"KeywordsCell"];
  }
  double v9 = -[PXCuratedAssetCollectionDiagnosticsViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v7, [v6 section]);

  unint64_t v10 = [(NSDictionary *)self->_tableContent objectForKeyedSubscript:v9];
  uint64_t v11 = [v6 row];

  uint64_t v12 = [v10 objectAtIndexedSubscript:v11];

  uint64_t v13 = [v9 lowercaseString];
  LODWORD(v11) = [v13 isEqualToString:@"location"];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v12;
      if ((unint64_t)[v14 count] < 2)
      {
        BOOL v18 = @"Invalid location";
      }
      else
      {
        uint64_t v15 = NSString;
        uint64_t v16 = [v14 objectAtIndexedSubscript:0];
        unint64_t v17 = [v14 objectAtIndexedSubscript:1];
        BOOL v18 = [v15 stringWithFormat:@"(%@, %@)", v16, v17];

        id v14 = (id)v16;
      }
    }
    else
    {
      BOOL v18 = @"Invalid location";
    }

    uint64_t v12 = v18;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v20 = [v8 textLabel];
  uint64_t v21 = v20;
  if (isKindOfClass)
  {
    [v20 setAttributedText:v12];
  }
  else
  {
    [v20 setText:v12];

    uint64_t v21 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    unint64_t v22 = [v8 textLabel];
    [v22 setFont:v21];
  }
  v23 = [v8 textLabel];
  [v23 setNumberOfLines:0];

  v24 = [v8 textLabel];
  [v24 sizeToFit];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self tableView:a3 titleForHeaderInSection:a4];
  id v6 = [(NSDictionary *)self->_tableContent objectForKeyedSubscript:v5];
  int64_t v7 = [v6 count];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sectionTitles count];
}

- (void)_closeAction:(id)a3
{
}

- (void)_tapToRadar:(id)a3
{
  uint64_t v4 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self _tapToRadarViewControllerWithScreenshot:1];
  id v7 = (id)v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Error" message:@"The debug information for the selected highlight is incomplete." preferredStyle:1];
    id v6 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
    [v5 addAction:v6];

    uint64_t v4 = 0;
  }
  [(PXCuratedAssetCollectionDiagnosticsViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)_tapToRadarViewControllerWithScreenshot:(BOOL)a3
{
  if (self->_isReady)
  {
    BOOL v3 = a3;
    if (a3)
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_screenshotURL, 0);
    }
    else
    {
      id v5 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v7 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self radarAttachmentURLs];
    id v6 = objc_alloc_init(PXFeedbackTapToRadarViewController);
    [(PXFeedbackTapToRadarViewController *)v6 setRequestScreenshotPermission:v3];
    unint64_t v8 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self radarRoutes];
    [(PXFeedbackTapToRadarViewController *)v6 setRoutes:v8];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93__PXCuratedAssetCollectionDiagnosticsViewController__tapToRadarViewControllerWithScreenshot___block_invoke;
    v12[3] = &unk_1E5DC2620;
    v12[4] = self;
    id v13 = v5;
    id v14 = v7;
    id v9 = v7;
    id v10 = v5;
    [(PXFeedbackTapToRadarViewController *)v6 setFileRadarHandler:v12];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

void __93__PXCuratedAssetCollectionDiagnosticsViewController__tapToRadarViewControllerWithScreenshot___block_invoke(uint64_t a1, int a2, char a3, uint64_t a4)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = [*(id *)(a1 + 32) radarComponentInfoForRoute:a4];
  if (v7)
  {
    unint64_t v8 = [*(id *)(a1 + 32) radarTitleTemplate];
    id v9 = [*(id *)(a1 + 32) radarDescriptionTemplate];
    id v10 = [v7 componentID];
    uint64_t v11 = [v7 name];
    uint64_t v12 = [v7 version];
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
    if (a2) {
      uint64_t v13 = *(void *)(a1 + 40);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    if (a3)
    {
      v17[0] = @"com.apple.PhotoLibraryServices.PhotosDiagnostics";
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      LOWORD(v16) = 1;
      +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v8, v9, @"Other bug", v10, v11, v12, @"1091395", v13, v14, v16, v15, 0);
    }
    else
    {
      LOWORD(v16) = 0;
      +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v8, v9, @"Other bug", v10, v11, v12, @"1091395", v13, v14, v16, MEMORY[0x1E4F1CBF0], 0);
    }
  }
}

- (void)_updateUIElementsVisibility
{
  if (self->_isReady)
  {
    NSInteger v3 = [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
    [(UISegmentedControl *)self->_segmentedControl setHidden:0];
    id v24 = 0;
    id v25 = 0;
    [(PXCuratedAssetCollectionDiagnosticsViewController *)self generateSectionTitles:&v25 andTableContent:&v24 forIndex:v3];
    id v4 = v25;
    id v5 = v25;
    id v6 = v24;
    id v7 = v24;
    if ((unint64_t)(v3 - 1) > 1)
    {
      objc_storeStrong((id *)&self->_sectionTitles, v4);
      objc_storeStrong((id *)&self->_tableContent, v6);
      [(UITableView *)self->_tableView setHidden:0];
      [(UICollectionView *)self->_collectionView setHidden:1];
      [(UITableView *)self->_tableView reloadData];
      uint64_t v20 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationController];
      uint64_t v21 = [v20 topViewController];

      if (v21 == self) {
        [(PXCuratedAssetCollectionDiagnosticsViewController *)self hideToolbarItems];
      }
    }
    else
    {
      [(UITableView *)self->_tableView setHidden:1];
      [(UICollectionView *)self->_collectionView setHidden:0];
      [(UICollectionView *)self->_collectionView reloadData];
      if (v3 == 2) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = 3;
      }
      [(PXCuratedAssetCollectionDiagnosticsViewController *)self setCurrentCurationType:v8];
      [(PXCuratedAssetCollectionDiagnosticsViewController *)self displayCurrentCurationType];
      id v9 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationController];
      id v10 = [v9 topViewController];

      if (v10 == self) {
        [(PXCuratedAssetCollectionDiagnosticsViewController *)self showToolbarItems];
      }
    }
    [(UIActivityIndicatorView *)self->_progressView stopAnimating];
    [(UIActivityIndicatorView *)self->_progressView removeFromSuperview];
    unint64_t v22 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationItem];
    v23 = [v22 rightBarButtonItem];
    [v23 setEnabled:1];
  }
  else
  {
    uint64_t v11 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    progressView = self->_progressView;
    self->_progressView = v11;

    [(UIView *)self->_contentView addSubview:self->_progressView];
    [(UIActivityIndicatorView *)self->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v13 = [(UIActivityIndicatorView *)self->_progressView centerXAnchor];
    uint64_t v14 = [(UIView *)self->_contentView centerXAnchor];
    uint64_t v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    uint64_t v16 = [(UIActivityIndicatorView *)self->_progressView centerYAnchor];
    unint64_t v17 = [(UIView *)self->_contentView centerYAnchor];
    BOOL v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    id v19 = self->_progressView;
    [(UIActivityIndicatorView *)v19 startAnimating];
  }
}

- (void)_enumerateDifferencesBetweenRect:(CGRect)a3 andRect:(CGRect)a4 usingBlock:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double v11 = a3.origin.y;
  double v12 = a3.origin.x;
  CGRect v29 = (void (**)(id, uint64_t, double, double, double, double))a5;
  v32.origin.double x = v12;
  v32.origin.double y = v11;
  v32.size.double width = v10;
  CGFloat rect = v9;
  v32.size.double height = v9;
  v53.origin.double x = x;
  v53.origin.double y = y;
  v53.size.double width = width;
  v53.size.double height = height;
  if (CGRectIntersectsRect(v32, v53))
  {
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    double MaxY = CGRectGetMaxY(v33);
    v34.origin.double x = v12;
    v34.origin.double y = v11;
    v34.size.double width = v10;
    v34.size.double height = rect;
    if (MaxY > CGRectGetMaxY(v34))
    {
      v35.origin.double x = v12;
      v35.origin.double y = v11;
      v35.size.double width = v10;
      v35.size.double height = rect;
      double v25 = CGRectGetMaxY(v35);
      v36.origin.double x = x;
      v36.origin.double y = y;
      v36.size.double width = width;
      v36.size.double height = height;
      double v24 = CGRectGetMaxY(v36);
      v37.origin.double x = v12;
      v37.origin.double y = v11;
      v37.size.double width = v10;
      v37.size.double height = rect;
      CGFloat v14 = CGRectGetMaxY(v37);
      v29[2](v29, 1, x, v25, width, v24 - v14);
    }
    v38.origin.double x = v12;
    v38.origin.double y = v11;
    v38.size.double width = v10;
    v38.size.double height = rect;
    double MinY = CGRectGetMinY(v38);
    v39.origin.double x = x;
    v39.origin.double y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    if (MinY > CGRectGetMinY(v39))
    {
      v40.origin.double x = x;
      v40.origin.double y = y;
      v40.size.double width = width;
      v40.size.double height = height;
      double v26 = CGRectGetMinY(v40);
      v41.origin.double x = v12;
      v41.origin.double y = v11;
      v41.size.double width = v10;
      v41.size.double height = rect;
      double v16 = CGRectGetMinY(v41);
      v42.origin.double x = x;
      v42.origin.double y = y;
      v42.size.double width = width;
      v42.size.double height = height;
      CGFloat v17 = CGRectGetMinY(v42);
      v29[2](v29, 1, x, v26, width, v16 - v17);
    }
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    double v18 = CGRectGetMaxY(v43);
    v44.origin.double x = v12;
    v44.origin.double y = v11;
    v44.size.double width = v10;
    v44.size.double height = rect;
    if (v18 < CGRectGetMaxY(v44))
    {
      v45.origin.double x = x;
      v45.origin.double y = y;
      v45.size.double width = width;
      v45.size.double height = height;
      double v27 = CGRectGetMaxY(v45);
      v46.origin.double x = v12;
      v46.origin.double y = v11;
      v46.size.double width = v10;
      v46.size.double height = rect;
      double v19 = CGRectGetMaxY(v46);
      v47.origin.double x = x;
      v47.origin.double y = y;
      v47.size.double width = width;
      v47.size.double height = height;
      CGFloat v20 = CGRectGetMaxY(v47);
      v29[2](v29, 0, x, v27, width, v19 - v20);
    }
    v48.origin.double x = v12;
    v48.origin.double y = v11;
    v48.size.double width = v10;
    v48.size.double height = rect;
    double v21 = CGRectGetMinY(v48);
    v49.origin.double x = x;
    v49.origin.double y = y;
    v49.size.double width = width;
    v49.size.double height = height;
    if (v21 < CGRectGetMinY(v49))
    {
      v50.origin.double x = v12;
      v50.origin.double y = v11;
      v50.size.double width = v10;
      v50.size.double height = rect;
      double v28 = CGRectGetMinY(v50);
      v51.origin.double x = x;
      v51.origin.double y = y;
      v51.size.double width = width;
      v51.size.double height = height;
      double v22 = CGRectGetMinY(v51);
      v52.origin.double x = v12;
      v52.origin.double y = v11;
      v52.size.double width = v10;
      v52.size.double height = rect;
      CGFloat v23 = CGRectGetMinY(v52);
      v29[2](v29, 0, x, v28, width, v22 - v23);
    }
  }
  else
  {
    v29[2](v29, 1, x, y, width, height);
    v29[2](v29, 0, v12, v11, v10, v9);
  }
}

- (void)_updateCachedAssets
{
  [(UICollectionView *)self->_collectionView bounds];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGFloat v7 = CGRectGetHeight(v20) * -0.5;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectInset(v21, 0.0, v7);
  double v8 = v22.origin.y;
  double v9 = v22.size.width;
  double v10 = v22.size.height;
  double v17 = v22.origin.x;
  double MidY = CGRectGetMidY(v22);
  p_previousPreheatRect = &self->_previousPreheatRect;
  double v13 = MidY - CGRectGetMidY(self->_previousPreheatRect);
  if (v13 >= 0.0) {
    double v14 = v13;
  }
  else {
    double v14 = -v13;
  }
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  if (v14 > CGRectGetHeight(v23) / 3.0)
  {
    uint64_t v15 = self->_visibleAssets;
    double v16 = v15;
    if (v15)
    {
      if ([(NSArray *)v15 count])
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __72__PXCuratedAssetCollectionDiagnosticsViewController__updateCachedAssets__block_invoke;
        v18[3] = &unk_1E5DB9568;
        v18[4] = self;
        double v19 = v16;
        -[PXCuratedAssetCollectionDiagnosticsViewController _enumerateDifferencesBetweenRect:andRect:usingBlock:](self, "_enumerateDifferencesBetweenRect:andRect:usingBlock:", v18, p_previousPreheatRect->origin.x, self->_previousPreheatRect.origin.y, self->_previousPreheatRect.size.width, self->_previousPreheatRect.size.height, v17, v8, v9, v10);
        -[PHCachingImageManager startCachingImagesForAssets:targetSize:contentMode:options:](self->_imageManager, "startCachingImagesForAssets:targetSize:contentMode:options:", self->_addedAssets, self->_thumbnailContentMode, self->_thumbnailOptions, self->_thumbnailSize.width, self->_thumbnailSize.height);
        -[PHCachingImageManager stopCachingImagesForAssets:targetSize:contentMode:options:](self->_imageManager, "stopCachingImagesForAssets:targetSize:contentMode:options:", self->_removedAssets, self->_thumbnailContentMode, self->_thumbnailOptions, self->_thumbnailSize.width, self->_thumbnailSize.height);
        p_previousPreheatRect->origin.CGFloat x = v17;
        self->_previousPreheatRect.origin.CGFloat y = v8;
        self->_previousPreheatRect.size.CGFloat width = v9;
        self->_previousPreheatRect.size.CGFloat height = v10;
        [(NSMutableArray *)self->_addedAssets removeAllObjects];
        [(NSMutableArray *)self->_removedAssets removeAllObjects];
      }
    }
  }
}

void __72__PXCuratedAssetCollectionDiagnosticsViewController__updateCachedAssets__block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "collectionViewLayout", 0);
  double v13 = objc_msgSend(v12, "layoutAttributesForElementsInRect:", a3, a4, a5, a6);

  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    if (a2) {
      double v17 = &OBJC_IVAR___PXCuratedAssetCollectionDiagnosticsViewController__addedAssets;
    }
    else {
      double v17 = &OBJC_IVAR___PXCuratedAssetCollectionDiagnosticsViewController__removedAssets;
    }
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        double v19 = [*(id *)(*((void *)&v21 + 1) + 8 * v18) indexPath];
        CGRect v20 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v19, "item"));
        [*(id *)(*(void *)(a1 + 32) + *v17) addObject:v20];

        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }
}

- (void)_editSettings:(id)a3
{
  id v4 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self curationDebugInformationForCurationType:self->_currentCurationType];
  id v8 = [v4 objectForKeyedSubscript:@"curationOptions"];

  if (!self->_editSettingsViewController)
  {
    id v5 = [[PXDiagnosticsHighlightCurationSettingsViewController alloc] initWithDelegate:self];
    editSettingsViewController = self->_editSettingsViewController;
    self->_editSettingsViewController = v5;

    [(PXDiagnosticsHighlightCurationSettingsViewController *)self->_editSettingsViewController setOptions:v8];
  }
  CGFloat v7 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationController];
  [v7 pushViewController:self->_editSettingsViewController animated:1];
}

- (void)presentTapToRadarIfNeeded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PXCuratedAssetCollectionDiagnosticsViewController_presentTapToRadarIfNeeded__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__PXCuratedAssetCollectionDiagnosticsViewController_presentTapToRadarIfNeeded__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 1241))
  {
    if (*(void *)(v1 + 1152))
    {
      *(unsigned char *)(v1 + 1241) = 0;
      return [*(id *)(result + 32) _tapToRadar:0];
    }
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedAssetCollectionDiagnosticsViewController;
  [(PXCuratedAssetCollectionDiagnosticsViewController *)&v4 viewDidAppear:a3];
  [(PXCuratedAssetCollectionDiagnosticsViewController *)self _updateCachedAssets];
  [(PXCuratedAssetCollectionDiagnosticsViewController *)self presentTapToRadarIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PXCuratedAssetCollectionDiagnosticsViewController;
  [(PXCuratedAssetCollectionDiagnosticsViewController *)&v15 viewWillAppear:a3];
  objc_super v4 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  id v5 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
  [v5 frame];
  double v7 = v6;

  double v8 = floor(v7 * 0.25);
  +[PXDiagnosticsCurationViewCell cellHeightWithCellWidth:v8];
  objc_msgSend(v4, "setItemSize:", v8, v9);
  [v4 setMinimumInteritemSpacing:0.0];
  [v4 setMinimumLineSpacing:1.0];
  objc_msgSend(v4, "setSectionInset:", 0.0, (double)((unint64_t)(v7 + v8 * -4.0) >> 1), 0.0, (double)(unint64_t)(v7 + v8 * -4.0) - (double)((unint64_t)(v7 + v8 * -4.0) >> 1));
  double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  double v12 = v11;

  [v4 itemSize];
  self->_thumbnailSize.CGFloat width = v12 * v13;
  self->_thumbnailSize.CGFloat height = v12 * v14;
  self->_int64_t thumbnailContentMode = 1;
}

- (void)showInfo:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = [(NSDictionary *)self->_curationDebugInformation objectForKeyedSubscript:@"keyAssetCurationCriteria"];
  id v7 = [v4 alertControllerWithTitle:@"Key Asset" message:v5 preferredStyle:1];

  double v6 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Dismiss" style:0 handler:0];
  [v7 addAction:v6];

  [(PXCuratedAssetCollectionDiagnosticsViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)toggleCurationComparison:(id)a3
{
  self->_curationComparisonEnabled ^= 1u;
  objc_super v4 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationController];
  id v5 = [v4 topViewController];

  if (v5 == self) {
    [(PXCuratedAssetCollectionDiagnosticsViewController *)self showToolbarItems];
  }
  collectionView = self->_collectionView;
  [(UICollectionView *)collectionView reloadData];
}

- (void)hideToolbarItems
{
  [(PXCuratedAssetCollectionDiagnosticsViewController *)self setToolbarItems:MEMORY[0x1E4F1CBF0]];
  id v3 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationController];
  [v3 setToolbarHidden:1 animated:1];
}

- (void)showToolbarItems
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  int64_t currentCurationType = self->_currentCurationType;
  if (currentCurationType == 3)
  {
    if (self->_curationComparisonEnabled) {
      uint64_t v7 = 18;
    }
    else {
      uint64_t v7 = 17;
    }
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:v7 target:self action:sel_toggleCurationComparison_];
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__editSettings_];
    v10[0] = v3;
    v10[1] = v5;
    v10[2] = v3;
    v10[3] = v6;
    v10[4] = v3;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];
    [(PXCuratedAssetCollectionDiagnosticsViewController *)self setToolbarItems:v8];

    goto LABEL_8;
  }
  if (!currentCurationType)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:11 target:self action:sel_showInfo_];
    v11[0] = v3;
    v11[1] = v5;
    v11[2] = v3;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    [(PXCuratedAssetCollectionDiagnosticsViewController *)self setToolbarItems:v6];
LABEL_8:
  }
  double v9 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationController];
  [v9 setToolbarHidden:0 animated:1];
}

- (void)viewDidLoad
{
  v42.receiver = self;
  v42.super_class = (Class)PXCuratedAssetCollectionDiagnosticsViewController;
  [(PXCuratedAssetCollectionDiagnosticsViewController *)&v42 viewDidLoad];
  id v3 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
  [v3 setAutoresizingMask:18];

  objc_super v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  id v5 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
  [v5 setBackgroundColor:v4];

  double v6 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationController];
  [v6 setToolbarHidden:1 animated:0];

  uint64_t v7 = (UISegmentedControl *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:&unk_1F02D4168];
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v7;

  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:sel__switchLogsAction_ forControlEvents:4096];
  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:self->_initiallyShowCuration];
  [(UISegmentedControl *)self->_segmentedControl setHidden:1];
  [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  double v9 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
  [v9 addSubview:self->_segmentedControl];

  double v10 = [(UISegmentedControl *)self->_segmentedControl topAnchor];
  double v11 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
  double v12 = [v11 safeAreaLayoutGuide];
  double v13 = [v12 topAnchor];
  double v14 = [v10 constraintEqualToAnchor:v13 constant:10.0];
  [v14 setActive:1];

  objc_super v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  contentView = self->_contentView;
  self->_contentView = v15;

  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v17 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
  [v17 addSubview:self->_contentView];

  uint64_t v18 = _NSDictionaryOfVariableBindings(&cfstr_Segmentedcontr_1.isa, self->_segmentedControl, self->_contentView, 0);
  double v19 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
  CGRect v20 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[_segmentedControl(<=44)]-10-[_contentView]-0-|" options:0 metrics:0 views:v18];
  [v19 addConstraints:v20];

  long long v21 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
  long long v22 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[_segmentedControl]-|" options:0 metrics:0 views:v18];
  [v21 addConstraints:v22];

  long long v23 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self view];
  long long v24 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[_contentView]|" options:0 metrics:0 views:v18];
  [v23 addConstraints:v24];

  id v25 = objc_alloc(MEMORY[0x1E4FB1D00]);
  [(UIView *)self->_contentView frame];
  uint64_t v26 = (UITableView *)objc_msgSend(v25, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v26;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setHidden:1];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setAllowsSelection:0];
  [(UITableView *)self->_tableView setContentInsetAdjustmentBehavior:2];
  id v28 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  id v29 = objc_alloc(MEMORY[0x1E4FB1568]);
  [(UIView *)self->_contentView frame];
  CGRect v30 = (UICollectionView *)objc_msgSend(v29, "initWithFrame:collectionViewLayout:", v28);
  collectionView = self->_collectionView;
  self->_collectionView = v30;

  [(UICollectionView *)self->_collectionView setAutoresizingMask:18];
  [(UICollectionView *)self->_collectionView setHidden:1];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  CGRect v32 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v32];

  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PXCuratedAssetCollectionCellReuseIdentifier"];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"PXCuratedAssetCollectionSectionHeaderReuseIdentifier"];
  CGRect v33 = (void *)[objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:self action:sel_changeCurationType_];
  [v33 setDirection:2];
  [(UICollectionView *)self->_collectionView addGestureRecognizer:v33];
  CGRect v34 = (void *)[objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:self action:sel_changeCurationType_];

  [v34 setDirection:1];
  [(UICollectionView *)self->_collectionView addGestureRecognizer:v34];
  CGRect v35 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_showCurationSettings_];
  [v35 setNumberOfTouchesRequired:2];
  [v35 setNumberOfTapsRequired:2];
  [v35 setDelaysTouchesEnded:1];
  [(UICollectionView *)self->_collectionView addGestureRecognizer:v35];
  [(UIView *)self->_contentView addSubview:self->_tableView];
  [(UIView *)self->_contentView addSubview:self->_collectionView];
  CGRect v36 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Close" style:2 target:self action:sel__closeAction_];
  CGRect v37 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationItem];
  [v37 setLeftBarButtonItem:v36];

  CGRect v38 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Radar" style:2 target:self action:sel__tapToRadar_];
  CGRect v39 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationItem];
  [v39 setRightBarButtonItem:v38];

  CGRect v40 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self navigationItem];
  CGRect v41 = [v40 rightBarButtonItem];
  [v41 setEnabled:0];

  [(PXCuratedAssetCollectionDiagnosticsViewController *)self _switchLogsAction:0];
}

- (PXCuratedAssetCollectionDiagnosticsViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)PXCuratedAssetCollectionDiagnosticsViewController;
  id v2 = [(PXCuratedAssetCollectionDiagnosticsViewController *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    addedAssets = v2->_addedAssets;
    v2->_addedAssets = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    removedAssets = v2->_removedAssets;
    v2->_removedAssets = (NSMutableArray *)v5;

    uint64_t v7 = (PHCachingImageManager *)objc_alloc_init(MEMORY[0x1E4F38FB0]);
    imageManager = v2->_imageManager;
    v2->_imageManager = v7;

    v2->_int64_t currentCurationType = 3;
    uint64_t v9 = +[PXFeedbackTapToRadarUtilities captureScreenshot];
    screenshotURL = v2->_screenshotURL;
    v2->_screenshotURL = (NSURL *)v9;

    v2->_shouldPresentTapToRadar = 0;
    double v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.library.curationDebug", v11);
    curationDebugFetchQueue = v2->_curationDebugFetchQueue;
    v2->_curationDebugFetchQueue = (OS_dispatch_queue *)v12;

    [(PXCuratedAssetCollectionDiagnosticsViewController *)v2 requestCurationDebugInfoWithOptions:0 setGlobally:0];
  }
  return v2;
}

@end