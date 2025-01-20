@interface PRInlineComplicationGalleryViewController
- (BOOL)isAlternateDateEnabled;
- (CGSize)preferredContentSize;
- (PRComplicationDescriptor)selectedComplication;
- (PRInlineComplicationGalleryViewController)initWithSuggestionSet:(id)a3 selectedComplication:(id)a4 alternateDateEnabled:(BOOL)a5;
- (PRInlineComplicationGalleryViewControllerDelegate)delegate;
- (id)_alternateCalendarGalleryItem;
- (id)_alternateCalendarIdentifier;
- (id)_alternateDateString;
- (id)_buildSnapshot;
- (id)_dateGalleryItem;
- (id)_galleryItemForWidgetDescriptor:(id)a3 intent:(id)a4 family:(int64_t)a5 iconImageHidden:(BOOL)a6 suggestedComplication:(id)a7;
- (id)_inlineGalleryItemsForWidgetDescriptors:(id)a3 iconImageHidden:(BOOL)a4 isSuggestion:(BOOL)a5;
- (id)_makeSectionHeaderRegistration;
- (id)_widgetHostViewControllerForDescriptor:(id)a3 shownAlongsideIcon:(BOOL)a4;
- (int64_t)layoutStyleForSectionIndex:(int64_t)a3;
- (void)_closeButtonTapped:(id)a3;
- (void)_configureWidgetCell:(id)a3 forItem:(id)a4 atIndexPath:(id)a5;
- (void)_configureWidgetHostViewController:(id)a3 forWidgetDescriptor:(id)a4;
- (void)_setAlternateDateEnabled:(BOOL)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PRInlineComplicationGalleryViewController

- (PRInlineComplicationGalleryViewController)initWithSuggestionSet:(id)a3 selectedComplication:(id)a4 alternateDateEnabled:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PRInlineComplicationGalleryViewController;
  v10 = [(PRInlineComplicationGalleryViewController *)&v23 init];
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    widgetHostViewControllers = v10->_widgetHostViewControllers;
    v10->_widgetHostViewControllers = v11;

    objc_storeStrong((id *)&v10->_selectedComplication, a4);
    v10->_alternateDateEnabled = a5;
    if (v8)
    {
      v13 = [v8 complications];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __109__PRInlineComplicationGalleryViewController_initWithSuggestionSet_selectedComplication_alternateDateEnabled___block_invoke;
      v21[3] = &unk_1E54DCFB0;
      v22 = v10;
      v14 = objc_msgSend(v13, "bs_compactMap:", v21);
    }
    else
    {
      v14 = 0;
    }
    if (v14) {
      v15 = v14;
    }
    else {
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v10->_suggestionItems, v15);
    v16 = PRSharedWidgetExtensionProvider();
    [v16 registerObserver:v10];

    v17 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    uint64_t v18 = [v17 addMonitor:v10 subjectMask:1 subscriptionOptions:1];
    appProtectionSubjectMonitorSubscription = v10->_appProtectionSubjectMonitorSubscription;
    v10->_appProtectionSubjectMonitorSubscription = (APSubjectMonitorSubscription *)v18;
  }
  return v10;
}

id __109__PRInlineComplicationGalleryViewController_initWithSuggestionSet_selectedComplication_alternateDateEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 widgetDescriptor];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 supportedFamilies];
    [v3 widgetFamily];
    if ((CHSWidgetFamilyMaskFromWidgetFamily() & v6) != 0)
    {
      v7 = *(void **)(a1 + 32);
      id v8 = [v3 intent];
      id v9 = objc_msgSend(v7, "_galleryItemForWidgetDescriptor:intent:family:iconImageHidden:suggestedComplication:", v5, v8, objc_msgSend(v3, "widgetFamily"), 0, v3);

      goto LABEL_9;
    }
    v10 = PRLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __127__PRComplicationGalleryViewController_initWithSuggestionSets_applicationWidgetCollections_listLayoutProvider_iconViewProvider___block_invoke_2_cold_2((uint64_t)v5, v3);
    }
  }
  else
  {
    v10 = PRLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2_cold_1(v10);
    }
  }

  id v9 = 0;
LABEL_9:

  return v9;
}

- (void)dealloc
{
  id v3 = PRSharedWidgetExtensionProvider();
  [v3 unregisterObserver:self];

  [(APSubjectMonitorSubscription *)self->_appProtectionSubjectMonitorSubscription invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PRInlineComplicationGalleryViewController;
  [(PRInlineComplicationGalleryViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = [PRInlineComplicationGalleryView alloc];
  objc_super v4 = -[PRInlineComplicationGalleryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  complicationGalleryView = self->_complicationGalleryView;
  self->_complicationGalleryView = v4;

  [(PRInlineComplicationGalleryView *)self->_complicationGalleryView setDelegate:self];
  uint64_t v6 = self->_complicationGalleryView;
  [(PRInlineComplicationGalleryViewController *)self setView:v6];
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)PRInlineComplicationGalleryViewController;
  [(PRInlineComplicationGalleryViewController *)&v38 viewDidLoad];
  id v3 = [(PRInlineComplicationGalleryViewController *)self navigationController];
  objc_super v4 = [v3 navigationBar];
  v5 = [v4 topItem];

  [v5 _setManualScrollEdgeAppearanceProgress:0.0];
  uint64_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__closeButtonTapped_];
    [v5 setRightBarButtonItem:v8];
  }
  id v9 = PRBundle();
  v10 = [v9 localizedStringForKey:@"INLINE_COMPLICATION_GALLERY_TITLE" value:&stru_1ED9A3120 table:@"PosterKit"];
  [(PRInlineComplicationGalleryViewController *)self setTitle:v10];

  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v12 = objc_opt_class();
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke;
  v35[3] = &unk_1E54DCFD8;
  objc_copyWeak(&v36, &location);
  v13 = [v11 registrationWithCellClass:v12 configurationHandler:v35];
  v14 = [(PRInlineComplicationGalleryViewController *)self _makeSectionHeaderRegistration];
  v15 = [(PRInlineComplicationGalleryView *)self->_complicationGalleryView collectionView];
  [v15 setDelegate:self];
  id v16 = objc_alloc(MEMORY[0x1E4FB1598]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke_2;
  v32[3] = &unk_1E54DAC50;
  id v17 = v15;
  id v33 = v17;
  id v18 = v13;
  id v34 = v18;
  v19 = (UICollectionViewDiffableDataSource *)[v16 initWithCollectionView:v17 cellProvider:v32];
  dataSource = self->_dataSource;
  self->_dataSource = v19;

  v21 = self->_dataSource;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke_3;
  v29 = &unk_1E54DD000;
  id v22 = v17;
  id v30 = v22;
  id v23 = v14;
  id v31 = v23;
  [(UICollectionViewDiffableDataSource *)v21 setSupplementaryViewProvider:&v26];
  objc_msgSend(v22, "setContentInset:", 8.0, 0.0, 16.0, 0.0, v26, v27, v28, v29);
  v24 = self->_dataSource;
  v25 = [(PRInlineComplicationGalleryViewController *)self _buildSnapshot];
  [(UICollectionViewDiffableDataSource *)v24 applySnapshot:v25 animatingDifferences:0];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  v10 = [v7 widgetItem];

  [WeakRetained _configureWidgetCell:v9 forItem:v10 atIndexPath:v8];
}

uint64_t __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 40) forIndexPath:a3 item:a4];
}

uint64_t __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(void *)(a1 + 40));
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PRInlineComplicationGalleryViewController;
  [(PRInlineComplicationGalleryViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PRInlineComplicationGalleryViewController;
  [(PRInlineComplicationGalleryViewController *)&v13 viewDidDisappear:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  objc_super v4 = [(NSMutableDictionary *)self->_widgetHostViewControllers allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) invalidate];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (CGSize)preferredContentSize
{
  [MEMORY[0x1E4F5E4D0] frameForElements:4];
  double v2 = CGRectGetWidth(v5) + 8.0 + 16.0 + 8.0 + 16.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_buildSnapshot
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  suggestionItems = self->_suggestionItems;
  if (suggestionItems && [(NSArray *)suggestionItems count])
  {
    v82[0] = @"PRInlineComplicationSuggestionsSectionIdentifier";
    CGRect v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
    [v3 appendSectionsWithIdentifiers:v5];

    [v3 appendItemsWithIdentifiers:self->_suggestionItems];
  }
  v53 = self;
  v54 = v3;
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v6 = PRSharedWidgetExtensionProvider();
  uint64_t v7 = [v6 extensions];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v66 objects:v81 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id obj = *(id *)v67;
    v55 = v7;
    do
    {
      uint64_t v10 = 0;
      uint64_t v56 = v9;
      do
      {
        if (*(id *)v67 != obj) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v66 + 1) + 8 * v10);
        long long v12 = objc_msgSend(v11, "orderedDescriptors", v53, v54);
        objc_super v13 = objc_msgSend(v12, "bs_filter:", &__block_literal_global_46);
        if ([v13 count])
        {
          v14 = [v11 identity];
          uint64_t v15 = [v14 containerBundleIdentifier];

          id v16 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v15];
          if (([v16 isLocked] & 1) == 0 && (objc_msgSend(v16, "isHidden") & 1) == 0)
          {
            id v17 = objc_alloc(MEMORY[0x1E4F223A0]);
            id v18 = [v11 identity];
            v19 = [v18 extensionBundleIdentifier];
            id v65 = 0;
            v20 = (void *)[v17 initWithBundleIdentifier:v19 error:&v65];
            id v57 = v65;

            if (v20)
            {
              v21 = [v20 containingBundleRecord];
              if (v21)
              {
                id v22 = [v60 objectForKeyedSubscript:v21];
                id v23 = v22;
                if (!v22) {
                  id v22 = (void *)MEMORY[0x1E4F1CBF0];
                }
                v24 = [v22 arrayByAddingObjectsFromArray:v12];

                [v60 setObject:v24 forKeyedSubscript:v21];
LABEL_17:
              }
            }
            else
            {
              v21 = PRLogCommon();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v25 = [v11 identity];
                v24 = [v25 extensionBundleIdentifier];
                *(_DWORD *)buf = 138412546;
                v78 = v24;
                __int16 v79 = 2112;
                id v80 = v57;
                _os_log_error_impl(&dword_18C1C4000, v21, OS_LOG_TYPE_ERROR, "Failed to get application extension record for widget bundle identifier %@: %@", buf, 0x16u);

                goto LABEL_17;
              }
            }
            uint64_t v7 = v55;

            uint64_t v9 = v56;
          }
        }
        ++v10;
      }
      while (v9 != v10);
      uint64_t v26 = [v7 countByEnumeratingWithState:&v66 objects:v81 count:16];
      uint64_t v9 = v26;
    }
    while (v26);
  }

  uint64_t v27 = [v60 allKeys];
  v28 = [v27 sortedArrayUsingComparator:&__block_literal_global_54];

  id v30 = v53;
  v29 = v54;
  if ((objc_msgSend(v28, "bs_containsObjectPassingTest:", &__block_literal_global_57) & 1) == 0)
  {
    v76 = @"PRDateOptionsSectionIdentifier";
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    [v54 appendSectionsWithIdentifiers:v31];

    v32 = [(PRInlineComplicationGalleryViewController *)v53 _dateGalleryItem];
    v75 = v32;
    id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
    [v54 appendItemsWithIdentifiers:v33];

    uint64_t v34 = [(PRInlineComplicationGalleryViewController *)v53 _alternateCalendarGalleryItem];
    v35 = (void *)v34;
    if (v34)
    {
      uint64_t v74 = v34;
      id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
      [v54 appendItemsWithIdentifiers:v36];
    }
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obja = v28;
  uint64_t v37 = [obja countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v62 != v39) {
          objc_enumerationMutation(obja);
        }
        v41 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v42 = objc_msgSend(v41, "bundleIdentifier", v53, v54);
        v72 = v42;
        v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
        [v29 appendSectionsWithIdentifiers:v43];

        v44 = [v41 bundleIdentifier];
        LODWORD(v43) = [v44 isEqual:@"com.apple.mobilecal"];

        if (v43)
        {
          v45 = [(PRInlineComplicationGalleryViewController *)v30 _dateGalleryItem];
          v71 = v45;
          v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
          [v29 appendItemsWithIdentifiers:v46];

          uint64_t v47 = [(PRInlineComplicationGalleryViewController *)v30 _alternateCalendarGalleryItem];
          v48 = (void *)v47;
          if (v47)
          {
            uint64_t v70 = v47;
            v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
            [v29 appendItemsWithIdentifiers:v49];
          }
        }
        v50 = [v60 objectForKeyedSubscript:v41];
        v51 = [(PRInlineComplicationGalleryViewController *)v30 _inlineGalleryItemsForWidgetDescriptors:v50 iconImageHidden:1 isSuggestion:0];
        [v29 appendItemsWithIdentifiers:v51];
      }
      uint64_t v38 = [obja countByEnumeratingWithState:&v61 objects:v73 count:16];
    }
    while (v38);
  }

  return v29;
}

uint64_t __59__PRInlineComplicationGalleryViewController__buildSnapshot__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned int v3 = [v2 supportedFamilies];
  int v4 = objc_msgSend(v2, "pr_shouldDisplayInGallery");

  return v4 & (v3 >> 12);
}

uint64_t __59__PRInlineComplicationGalleryViewController__buildSnapshot__block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  CGRect v5 = [a2 localizedName];
  uint64_t v6 = [v4 localizedName];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

uint64_t __59__PRInlineComplicationGalleryViewController__buildSnapshot__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 bundleIdentifier];
  uint64_t v3 = [v2 isEqual:@"com.apple.mobilecal"];

  return v3;
}

- (id)_alternateCalendarIdentifier
{
  if (_alternateCalendarIdentifier_onceToken != -1) {
    dispatch_once(&_alternateCalendarIdentifier_onceToken, &__block_literal_global_60_1);
  }
  id v2 = (void *)_alternateCalendarIdentifier_alternateCalendarIdentifier;
  return v2;
}

void __73__PRInlineComplicationGalleryViewController__alternateCalendarIdentifier__block_invoke()
{
  v0 = [MEMORY[0x1E4F57C00] sharedPreferences];
  uint64_t v1 = [v0 overlayCalendarID];
  id v2 = (void *)_alternateCalendarIdentifier_alternateCalendarIdentifier;
  _alternateCalendarIdentifier_alternateCalendarIdentifier = v1;

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F57AE8];
  id v4 = [MEMORY[0x1E4F28F08] mainQueue];
  id v5 = (id)[v6 addObserverForName:v3 object:0 queue:v4 usingBlock:&__block_literal_global_66];
}

void __73__PRInlineComplicationGalleryViewController__alternateCalendarIdentifier__block_invoke_2()
{
  id v2 = [MEMORY[0x1E4F57C00] sharedPreferences];
  uint64_t v0 = [v2 overlayCalendarID];
  uint64_t v1 = (void *)_alternateCalendarIdentifier_alternateCalendarIdentifier;
  _alternateCalendarIdentifier_alternateCalendarIdentifier = v0;
}

- (id)_alternateDateString
{
  id v2 = [(PRInlineComplicationGalleryViewController *)self _alternateCalendarIdentifier];
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v2];
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F70FE8] localeForCalendarID:v2];
      if (v4)
      {
        uint64_t v9 = MEMORY[0x1E4F143A8];
        uint64_t v10 = 3221225472;
        long long v11 = __65__PRInlineComplicationGalleryViewController__alternateDateString__block_invoke;
        long long v12 = &unk_1E54DAA08;
        id v13 = v3;
        id v14 = v4;
        if (_alternateDateString_onceToken != -1) {
          dispatch_once(&_alternateDateString_onceToken, &v9);
        }
        id v5 = (void *)_alternateDateString_alternateCalendarDateFormatter;
        id v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v9, v10, v11, v12);
        uint64_t v7 = [v5 stringFromDate:v6];
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __65__PRInlineComplicationGalleryViewController__alternateDateString__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v3 = (void *)_alternateDateString_alternateCalendarDateFormatter;
  _alternateDateString_alternateCalendarDateFormatter = (uint64_t)v2;

  [(id)_alternateDateString_alternateCalendarDateFormatter setCalendar:*(void *)(a1 + 32)];
  [(id)_alternateDateString_alternateCalendarDateFormatter setLocale:*(void *)(a1 + 40)];
  [(id)_alternateDateString_alternateCalendarDateFormatter setDateStyle:2];
  id v4 = (void *)_alternateDateString_alternateCalendarDateFormatter;
  return [v4 setLocalizedDateFormatFromTemplate:@"UMMMd"];
}

- (id)_dateGalleryItem
{
  if (_dateGalleryItem_onceToken[0] != -1) {
    dispatch_once(_dateGalleryItem_onceToken, &__block_literal_global_75);
  }
  uint64_t v3 = (void *)_dateGalleryItem_dateFormatter;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 stringFromDate:v4];

  id v6 = [PRComplicationGalleryWidgetItem alloc];
  uint64_t v7 = PRBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"COMPLICATION_GALLERY_DATE_ITEM_TITLE" value:&stru_1ED9A3120 table:@"PosterKit"];
  if (self->_selectedComplication) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = !self->_alternateDateEnabled;
  }
  uint64_t v10 = [(PRComplicationGalleryWidgetItem *)v6 initWithDisplayName:v8 selected:v9 iconImageHidden:1 text:v5 kind:1];

  long long v11 = [[PRComplicationGalleryItem alloc] initWithWidgetItem:v10];
  return v11;
}

void __61__PRInlineComplicationGalleryViewController__dateGalleryItem__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)_dateGalleryItem_dateFormatter;
  _dateGalleryItem_dateFormatter = (uint64_t)v0;

  [(id)_dateGalleryItem_dateFormatter setFormattingContext:2];
  id v2 = (void *)_dateGalleryItem_dateFormatter;
  uint64_t v3 = (void *)MEMORY[0x1E4F28C10];
  id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v4 = [v3 dateFormatFromTemplate:@"EEEEMMMMd" options:0 locale:v5];
  [v2 setDateFormat:v4];
}

- (id)_alternateCalendarGalleryItem
{
  uint64_t v3 = [(PRInlineComplicationGalleryViewController *)self _alternateDateString];
  if (v3)
  {
    id v4 = [PRComplicationGalleryWidgetItem alloc];
    id v5 = PRBundle();
    id v6 = [v5 localizedStringForKey:@"COMPLICATION_GALLERY_ALTERNATE_DATE_ITEM_TITLE" value:&stru_1ED9A3120 table:@"PosterKit"];
    if (self->_selectedComplication) {
      BOOL alternateDateEnabled = 0;
    }
    else {
      BOOL alternateDateEnabled = self->_alternateDateEnabled;
    }
    BOOL v9 = [(PRComplicationGalleryWidgetItem *)v4 initWithDisplayName:v6 selected:alternateDateEnabled iconImageHidden:1 text:v3 kind:2];

    uint64_t v8 = [[PRComplicationGalleryItem alloc] initWithWidgetItem:v9];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_inlineGalleryItemsForWidgetDescriptors:(id)a3 iconImageHidden:(BOOL)a4 isSuggestion:(BOOL)a5
{
  uint64_t v7 = objc_msgSend(a3, "bs_filter:", &__block_literal_global_89, a4, a5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __114__PRInlineComplicationGalleryViewController__inlineGalleryItemsForWidgetDescriptors_iconImageHidden_isSuggestion___block_invoke_2;
  v10[3] = &unk_1E54DD088;
  v10[4] = self;
  BOOL v11 = a4;
  uint64_t v8 = objc_msgSend(v7, "bs_map:", v10);

  return v8;
}

unint64_t __114__PRInlineComplicationGalleryViewController__inlineGalleryItemsForWidgetDescriptors_iconImageHidden_isSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 supportedFamilies] >> 12) & 1;
}

uint64_t __114__PRInlineComplicationGalleryViewController__inlineGalleryItemsForWidgetDescriptors_iconImageHidden_isSuggestion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _galleryItemForWidgetDescriptor:a2 intent:0 family:12 iconImageHidden:*(unsigned __int8 *)(a1 + 40) suggestedComplication:0];
}

- (id)_galleryItemForWidgetDescriptor:(id)a3 intent:(id)a4 family:(int64_t)a5 iconImageHidden:(BOOL)a6 suggestedComplication:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a3;
  id v14 = [v13 widgetForFamily:a5 intent:a4];
  uint64_t v15 = NSString;
  id v16 = [v14 extensionBundleIdentifier];
  id v17 = [v14 kind];
  id v18 = [v15 stringWithFormat:@"%@ - %@ - %@", v16, v17, v12];

  v19 = [[PRComplicationDescriptor alloc] initWithUniqueIdentifier:v18 widget:v14];
  [(PRComplicationDescriptor *)v19 setSuggestedComplication:v12];

  v20 = [(PRComplicationDescriptor *)self->_selectedComplication widget];
  unsigned int v21 = [v14 matchesPersonality:v20];
  if (v12) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v21;
  }

  id v23 = [PRComplicationGalleryWidgetItem alloc];
  v24 = [v13 displayName];

  v25 = [(PRComplicationGalleryWidgetItem *)v23 initWithDisplayName:v24 selected:v22 iconImageHidden:v7 descriptor:v19];
  uint64_t v26 = [[PRComplicationGalleryItem alloc] initWithWidgetItem:v25];

  return v26;
}

- (id)_makeSectionHeaderRegistration
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4FB15F8];
  uint64_t v3 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke;
  v6[3] = &unk_1E54DD0B0;
  objc_copyWeak(&v7, &location);
  id v4 = [v2 registrationWithSupplementaryClass:v3 elementKind:@"PRInlineComplicationGalleryTitleElementKind" configurationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = [WeakRetained[123] snapshot];
    BOOL v11 = [v10 sectionIdentifiers];
    id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

    if ([v12 isEqualToString:@"PRInlineComplicationSuggestionsSectionIdentifier"])
    {
      id v13 = PRBundle();
      id v14 = v13;
      uint64_t v15 = @"COMPLICATION_GALLERY_SUGGESTIONS_TITLE";
    }
    else
    {
      if (![v12 isEqualToString:@"PRDateOptionsSectionIdentifier"])
      {
        id v28 = 0;
        id v17 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v12 allowPlaceholder:1 error:&v28];
        id v18 = v28;
        if (v18)
        {
          v19 = PRLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke_cold_1((uint64_t)v12, (uint64_t)v18, v19);
          }
        }
        else
        {
          v20 = [v17 localizedName];
          [v6 setTitle:v20];

          unsigned int v21 = [v9[122] collectionView];
          +[PRComplicationGallerySectionHeaderView iconImageSize];
          double v23 = v22;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke_106;
          v24[3] = &unk_1E54DACC0;
          id v25 = v6;
          id v26 = v21;
          id v27 = v7;
          v19 = v21;
          +[PRComplicationGalleryIconProvider loadIconImageForApplicationBundleIdentifier:v12 atWidth:v24 completion:v23];
        }
        goto LABEL_12;
      }
      id v13 = PRBundle();
      id v14 = v13;
      uint64_t v15 = @"COMPLICATION_GALLERY_DATE_SECTION_TITLE";
    }
    id v16 = [v13 localizedStringForKey:v15 value:&stru_1ED9A3120 table:@"PosterKit"];
    [v6 setTitle:v16];

    [v6 setIconImage:0];
LABEL_12:
  }
}

void __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke_106(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) supplementaryViewForElementKind:@"PRInlineComplicationGalleryTitleElementKind" atIndexPath:*(void *)(a1 + 48)];

  if (v3 == v4) {
    [*(id *)(a1 + 32) setIconImage:v5];
  }
}

- (id)_widgetHostViewControllerForDescriptor:(id)a3 shownAlongsideIcon:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_widgetHostViewControllers objectForKeyedSubscript:v6];
  if (!v7)
  {
    uint64_t v8 = +[PRWidgetMetricsProvider sharedInstance];
    BOOL v9 = [v6 widget];
    uint64_t v10 = [v8 systemMetricsForWidget:v9];

    [v10 size];
    [v10 size];
    double v12 = v11;
    if (v4) {
      +[PRInlineComplicationGalleryItemCell suggestionInset];
    }
    else {
      +[PRInlineComplicationGalleryItemCell checkmarkInset];
    }
    double v14 = v12 - v13;
    id v15 = objc_alloc(MEMORY[0x1E4F58E80]);
    [v10 cornerRadius];
    double v17 = v16;
    [v10 scaleFactor];
    double v19 = v18;
    uint64_t v20 = [v10 fontStyle];
    [v10 safeAreaInsets];
    id v25 = objc_msgSend(v15, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:", v20, v14, 26.0, v17, v19, v21, v22, v23, v24);

    id v26 = objc_alloc(MEMORY[0x1E4F58F58]);
    id v27 = [v6 widget];
    id v7 = (void *)[v26 initWithWidget:v27 metrics:v25 widgetConfigurationIdentifier:0];

    [v7 setShouldShareTouchesWithHost:1];
    [v7 setDrawSystemBackgroundMaterialIfNecessary:0];
    [v7 setVisibility:0];
    [v7 setCanAppearInSecureEnvironment:1];
    [v7 setContentType:1];
    [v7 setColorScheme:2];
    id v28 = objc_alloc_init(MEMORY[0x1E4F58CE8]);
    [v28 setHorizontalAlignment:1];
    [v28 setSymbolScale:1];
    id v29 = objc_alloc_init(MEMORY[0x1E4F58CD0]);
    [v29 setSize:&unk_1ED9EF240];
    id v30 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
    [v29 setWeight:v30];

    [v28 setFontSpecification:v29];
    [v7 setInlineTextParameters:v28];
    id v31 = objc_alloc(MEMORY[0x1E4F58EE8]);
    v32 = [MEMORY[0x1E4FB1618] darkGrayColor];
    id v33 = [v32 BSColor];
    uint64_t v34 = (void *)[v31 initWithPrimaryTintColor:0 secondaryTintColor:v33 filterStyle:4 fallbackFilterStyle:4 fraction:1.0];

    [v7 setTintParameters:v34];
    v35 = [(NSMutableDictionary *)self->_widgetHostViewControllers objectForKeyedSubscript:v6];
    [v35 invalidate];

    [(NSMutableDictionary *)self->_widgetHostViewControllers setObject:v7 forKeyedSubscript:v6];
  }
  [(PRInlineComplicationGalleryViewController *)self _configureWidgetHostViewController:v7 forWidgetDescriptor:v6];
  [v7 setPresentationMode:2];

  return v7;
}

- (void)_configureWidgetCell:(id)a3 forItem:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = [v10 descriptor];
  uint64_t v13 = [v10 text];
  double v14 = (void *)v13;
  if (v12)
  {
    id v15 = -[PRInlineComplicationGalleryViewController _widgetHostViewControllerForDescriptor:shownAlongsideIcon:](self, "_widgetHostViewControllerForDescriptor:shownAlongsideIcon:", v12, [v10 isIconImageHidden] ^ 1);
    double v16 = [v9 contentViewController];

    if (v16 == v15) {
      goto LABEL_10;
    }
    double v17 = [v15 parentViewController];
    if (v17 == self)
    {
      double v18 = [v15 view];
      [v18 removeFromSuperview];

      [v15 removeFromParentViewController];
      double v17 = 0;
    }
    [v9 setContentViewController:v15];
    if (v17 != self)
    {
      [v9 contentViewController];
      id v19 = v11;
      uint64_t v20 = v12;
      double v22 = v21 = v14;
      double v23 = [v9 contentView];
      [(PRInlineComplicationGalleryViewController *)self bs_addChildViewController:v22 withSuperview:v23];

      double v14 = v21;
      double v12 = v20;
      id v11 = v19;
    }
    goto LABEL_9;
  }
  if (v13)
  {
    double v24 = [[_PRInlineTextViewController alloc] initWithText:v13];
    [v9 setContentViewController:v24];

    id v15 = [v9 contentViewController];
    double v17 = [v9 contentView];
    [(PRInlineComplicationGalleryViewController *)self bs_addChildViewController:v15 withSuperview:v17];
LABEL_9:

    goto LABEL_10;
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2 object:self file:@"PRInlineComplicationGalleryViewController.m" lineNumber:538 description:@"Descriptor and text of PRComplicationGalleryItem are both nil"];
LABEL_10:

  id v25 = [v10 displayName];
  [v9 setTitle:v25];

  if ([v10 isIconImageHidden])
  {
    [v9 setIconImage:0];
  }
  else
  {
    id v26 = [(PRInlineComplicationGalleryView *)self->_complicationGalleryView collectionView];
    [v12 widget];
    id v33 = v12;
    v28 = id v27 = v14;
    id v29 = [v28 extensionBundleIdentifier];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __86__PRInlineComplicationGalleryViewController__configureWidgetCell_forItem_atIndexPath___block_invoke;
    v34[3] = &unk_1E54DACC0;
    id v35 = v26;
    id v36 = v9;
    id v37 = v11;
    id v30 = v26;
    +[PRComplicationGalleryIconProvider loadIconImageForExtensionBundleIdentifier:v29 atWidth:v34 completion:40.0];

    double v14 = v27;
    double v12 = v33;
  }
  id v31 = [(PRInlineComplicationGalleryView *)self->_complicationGalleryView collectionView];
  uint64_t v32 = objc_msgSend(v31, "numberOfItemsInSection:", objc_msgSend(v11, "section")) - 1;

  objc_msgSend(v9, "setSeparatorVisible:", objc_msgSend(v11, "item") != v32);
  objc_msgSend(v9, "setShowsCheckmark:", objc_msgSend(v10, "isSelected"));
}

void __86__PRInlineComplicationGalleryViewController__configureWidgetCell_forItem_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];
  int v4 = [v3 isEqual:*(void *)(a1 + 48)];

  if (v4) {
    [*(id *)(a1 + 40) setIconImage:v5];
  }
}

- (void)_configureWidgetHostViewController:(id)a3 forWidgetDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = [a4 widget];
  id v7 = PRSharedWidgetExtensionProvider();
  uint64_t v8 = [v7 widgetDescriptorForWidget:v6];

  uint64_t v9 = [v8 intentType];
  if (v9
    && (id v10 = (void *)v9,
        [v6 intent],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __100__PRInlineComplicationGalleryViewController__configureWidgetHostViewController_forWidgetDescriptor___block_invoke;
    v12[3] = &unk_1E54DD0D8;
    id v13 = v6;
    id v14 = v5;
    [v8 loadDefaultIntent:v12];
  }
  else
  {
    [v5 setWidget:v6];
  }
}

void __100__PRInlineComplicationGalleryViewController__configureWidgetHostViewController_forWidgetDescriptor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PRLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) extensionBundleIdentifier];
    id v6 = [*(id *)(a1 + 32) kind];
    int v10 = 138412802;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "Loaded new default intent for widget(%@ - %@): %@", (uint8_t *)&v10, 0x20u);
  }
  if (!v3)
  {
    uint64_t v9 = PRLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __100__PRInlineComplicationGalleryViewController__configureWidgetHostViewController_forWidgetDescriptor___block_invoke_cold_1(a1);
    }
    goto LABEL_8;
  }
  id v7 = [*(id *)(a1 + 40) widget];
  uint64_t v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) widgetByReplacingIntent:v3];
    [*(id *)(a1 + 40) setWidget:v9];
LABEL_8:
  }
}

- (void)_closeButtonTapped:(id)a3
{
  [(PRInlineComplicationGalleryViewController *)self dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inlineComplicationGalleryViewControllerDidFinish:self];
}

- (void)_setAlternateDateEnabled:(BOOL)a3
{
  if (self->_alternateDateEnabled != a3)
  {
    BOOL v3 = a3;
    self->_BOOL alternateDateEnabled = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained inlineComplicationGalleryViewController:self didToggleAlternateDate:v3];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a4];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  id v17 = [v9 widgetItem];

  int v10 = v17;
  if (v17)
  {
    id v11 = [v17 descriptor];
    selectedComplication = self->_selectedComplication;
    self->_selectedComplication = v11;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    __int16 v14 = [v17 descriptor];
    [WeakRetained inlineComplicationGalleryViewController:self didSelectComplication:v14];

    if ([v17 kind]) {
      -[PRInlineComplicationGalleryViewController _setAlternateDateEnabled:](self, "_setAlternateDateEnabled:", [v17 kind] == 2);
    }
    dataSource = self->_dataSource;
    uint64_t v16 = [(PRInlineComplicationGalleryViewController *)self _buildSnapshot];
    [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v16 animatingDifferences:0];

    int v10 = v17;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v11 = a3;
  if (([MEMORY[0x1E4FB1EB0] _isInAnimationBlock] & 1) == 0)
  {
    [v11 adjustedContentInset];
    double v5 = v4;
    [v11 contentOffset];
    double v7 = fmin(fmax((v5 + v6) * 0.0625, 0.0), 1.0);
    uint64_t v8 = [(PRInlineComplicationGalleryViewController *)self navigationController];
    id v9 = [v8 navigationBar];
    int v10 = [v9 topItem];

    [v10 _setManualScrollEdgeAppearanceProgress:v7];
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v14 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v14;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 contentViewController];

  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      __int16 v12 = v11;
    }
    else {
      __int16 v12 = 0;
    }
  }
  else
  {
    __int16 v12 = 0;
  }
  id v13 = v12;

  [v13 setVisibility:2];
  [v13 setPresentationMode:2];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v16 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v16;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 contentViewController];
  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      __int16 v12 = v11;
    }
    else {
      __int16 v12 = 0;
    }
  }
  else
  {
    __int16 v12 = 0;
  }
  id v13 = v12;

  id v14 = [v13 view];
  int v15 = [v14 isDescendantOfView:v16];

  if (v15)
  {
    [v13 setVisibility:0];
    [v13 setPresentationMode:1];
  }
}

- (int64_t)layoutStyleForSectionIndex:(int64_t)a3
{
  double v4 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  id v5 = [v4 sectionIdentifiers];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
  int64_t v7 = v6 != @"PRInlineComplicationSuggestionsSectionIdentifier";

  return v7;
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
}

void __85__PRInlineComplicationGalleryViewController_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (void *)v1[123];
  id v3 = [v1 _buildSnapshot];
  [v2 applySnapshot:v3 animatingDifferences:0];
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
}

void __90__PRInlineComplicationGalleryViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (void *)v1[123];
  id v3 = [v1 _buildSnapshot];
  [v2 applySnapshot:v3 animatingDifferences:0];
}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (PRComplicationDescriptor)selectedComplication
{
  return self->_selectedComplication;
}

- (PRInlineComplicationGalleryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRInlineComplicationGalleryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedComplication, 0);
  objc_storeStrong((id *)&self->_appProtectionSubjectMonitorSubscription, 0);
  objc_storeStrong((id *)&self->_widgetHostViewControllers, 0);
  objc_storeStrong((id *)&self->_suggestionItems, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_complicationGalleryView, 0);
}

void __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Failed to create bundle record for bundle identifier %@: %@", (uint8_t *)&v3, 0x16u);
}

void __100__PRInlineComplicationGalleryViewController__configureWidgetHostViewController_forWidgetDescriptor___block_invoke_cold_1(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) extensionBundleIdentifier];
  id v9 = [*(id *)(a1 + 32) kind];
  OUTLINED_FUNCTION_0_1(&dword_18C1C4000, v3, v4, "Default intent asked for but not provided: %@ - %@", v5, v6, v7, v8, 2u);
}

@end