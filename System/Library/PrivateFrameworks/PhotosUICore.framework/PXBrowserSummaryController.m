@interface PXBrowserSummaryController
- (BOOL)_needsUpdate;
- (BOOL)isFilteringContainerContent;
- (BOOL)isReady;
- (BOOL)shouldShowLocationNames;
- (BOOL)shouldUpdateImmediately;
- (BOOL)shouldUseAbbreviatedDates;
- (BOOL)shouldUseNavigationTitle;
- (BOOL)shouldUseSubtitles;
- (BOOL)wantsVerboseLogging;
- (NSArray)stackedAssets;
- (NSAttributedString)attributedPrimaryTitle;
- (NSAttributedString)attributedSelectionTitle;
- (NSDateFormatter)importDateFormatter;
- (NSDateInterval)containerDateInterval;
- (NSDateIntervalFormatter)dateIntervalFormatter;
- (NSDictionary)defaultAttributes;
- (NSDictionary)emphasizedAttributes;
- (NSDictionary)selectionAttributes;
- (NSString)containerTitle;
- (NSString)localizedComponentsSeparator;
- (NSString)localizedContainerItemsCount;
- (NSString)navigationTitle;
- (NSString)noFilteringResultsPlaceholderText;
- (NSString)primaryTitleAccessibilityIdentifier;
- (NSString)secondaryTitle;
- (NSString)secondaryTitleAccessibilityIdentifier;
- (NSString)tertiaryTitle;
- (NSString)tertiaryTitleAccessibilityIdentifier;
- (OS_dispatch_queue)queue;
- (PXBrowserSelectionSnapshot)selectionSnapshot;
- (PXBrowserSummaryController)init;
- (PXBrowserSummaryControllerDataSource)dataSource;
- (PXInfoUpdater)selectionInfoUpdater;
- (PXInfoUpdater)titlesInfoUpdater;
- (PXInfoUpdater)visibleMetadataInfoUpdater;
- (PXSelectedItemsStack)selectedAssetsStack;
- (id)_performRequestBlock:(id)a3;
- (id)_requestTitlesInfoWithResultHandler:(id)a3;
- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4;
- (int64_t)priorityForInfoRequestOfKind:(id)a3;
- (unint64_t)containerDateFormatGranularity;
- (void)_invalidateAttributedSelectionTitle;
- (void)_invalidateContainerDateInterval;
- (void)_invalidateContainerTitle;
- (void)_invalidateFilteringContainerContent;
- (void)_invalidateLocalizedContainerItemsCount;
- (void)_invalidateSelectionSnapshot;
- (void)_invalidateStackedAssets;
- (void)_invalidateTitles;
- (void)_setAttributedPrimaryTitle:(id)a3 accessibilityIdentifier:(id)a4;
- (void)_setNeedsUpdate;
- (void)_setSecondaryTitle:(id)a3 accessibilityIdentifier:(id)a4;
- (void)_setTertiaryTitle:(id)a3 accessibilityIdentifier:(id)a4;
- (void)_updateAttributedSelectionTitleIfNeeded;
- (void)_updateContainerDateIntervalIfNeeded;
- (void)_updateContainerTitleIfNeeded;
- (void)_updateFilteringContainerContentIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateLocalizedContainerItemsCountIfNeeded;
- (void)_updateSelectionSnapshotIfNeeded;
- (void)_updateStackedAssetsIfNeeded;
- (void)didPerformChanges;
- (void)infoUpdaterDidUpdate:(id)a3;
- (void)invalidateContainerDateInterval;
- (void)invalidateContainerTitle;
- (void)invalidateFilteringContainerContent;
- (void)invalidateLocalizedContainerItemsCount;
- (void)invalidateSelection;
- (void)invalidateVisibleContent;
- (void)performBlockWhenDoneUpdating:(id)a3;
- (void)performChanges:(id)a3;
- (void)setAttributedSelectionTitle:(id)a3;
- (void)setContainerDateFormatGranularity:(unint64_t)a3;
- (void)setContainerDateInterval:(id)a3;
- (void)setContainerTitle:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultAttributes:(id)a3;
- (void)setEmphasizedAttributes:(id)a3;
- (void)setFilteringContainerContent:(BOOL)a3;
- (void)setLocalizedContainerItemsCount:(id)a3;
- (void)setNavigationTitle:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)setSelectedAssetsStack:(id)a3;
- (void)setSelectionAttributes:(id)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)setShouldShowLocationNames:(BOOL)a3;
- (void)setShouldUseAbbreviatedDates:(BOOL)a3;
- (void)setShouldUseNavigationTitle:(BOOL)a3;
- (void)setShouldUseSubtitles:(BOOL)a3;
- (void)setStackedAssets:(id)a3;
- (void)setWantsVerboseLogging:(BOOL)a3;
@end

@implementation PXBrowserSummaryController

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void))a4;
  if (![v7 isEqualToString:@"PXVisibleDateIntervalInfoKind"])
  {
    if ([v7 isEqualToString:@"PXSelectedItemsInfoKind"])
    {
      id v12 = [(PXBrowserSummaryController *)self selectionSnapshot];
      if ([v12 estimatedAssetCount] < 1)
      {
        v8[2](v8, 0);
        v13 = 0;
      }
      else
      {
        v14 = [(PXBrowserSummaryController *)self selectedAssetsStack];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke_2;
        v19[3] = &unk_1E5DD0E78;
        id v20 = v12;
        id v21 = v14;
        v22 = v8;
        id v15 = v14;
        v13 = [(PXBrowserSummaryController *)self _performRequestBlock:v19];
      }
      goto LABEL_14;
    }
    if (![v7 isEqualToString:@"PXOutputTitleInfoKind"])
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"PXBrowserSummaryController.m" lineNumber:850 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v16 = [(PXBrowserSummaryController *)self _requestTitlesInfoWithResultHandler:v8];
LABEL_12:
    v13 = 0;
    goto LABEL_15;
  }
  if (!self->_dataSourceRespondsTo.visibleContentSnapshot)
  {
    [(PXBrowserSummaryController *)self shouldShowLocationNames];
    goto LABEL_11;
  }
  v9 = [(PXBrowserSummaryController *)self dataSource];
  v10 = [v9 visibleContentSnapshotForBrowserSummaryController:self];

  BOOL v11 = [(PXBrowserSummaryController *)self shouldShowLocationNames];
  if (!v10)
  {
LABEL_11:
    v8[2](v8, 0);
    goto LABEL_12;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke;
  v23[3] = &unk_1E5DD1758;
  id v24 = v10;
  BOOL v26 = v11;
  v25 = v8;
  id v12 = v10;
  v13 = [(PXBrowserSummaryController *)self _performRequestBlock:v23];

LABEL_14:
LABEL_15:

  return v13;
}

- (BOOL)shouldShowLocationNames
{
  return self->_shouldShowLocationNames;
}

- (id)_performRequestBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([(PXBrowserSummaryController *)self shouldUpdateImmediately])
  {
    v4[2](v4);
    id v5 = 0;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    id v7 = [(PXBrowserSummaryController *)self queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__PXBrowserSummaryController__performRequestBlock___block_invoke;
    v9[3] = &unk_1E5DD3280;
    id v5 = v6;
    id v10 = v5;
    BOOL v11 = v4;
    dispatch_async(v7, v9);
  }
  return v5;
}

- (int64_t)priorityForInfoRequestOfKind:(id)a3
{
  if ([a3 isEqualToString:@"PXSelectedItemsInfoKind"])
  {
    v4 = [(PXBrowserSummaryController *)self selectionSnapshot];
    uint64_t v5 = [v4 estimatedAssetCount];

    uint64_t v6 = 10;
    if (v5 != 1) {
      uint64_t v6 = 0;
    }
    if (v5) {
      int64_t v7 = v6;
    }
    else {
      int64_t v7 = 100;
    }
  }
  else
  {
    int64_t v7 = 0;
  }
  if ([(PXBrowserSummaryController *)self shouldUpdateImmediately]) {
    return 100;
  }
  else {
    return v7;
  }
}

- (BOOL)shouldUpdateImmediately
{
  if (!self->_dataSourceRespondsTo.shouldUpdateImmediately) {
    return 0;
  }
  v2 = self;
  v3 = [(PXBrowserSummaryController *)self dataSource];
  LOBYTE(v2) = [v3 browserSummaryControllerShouldUpdateImmediately:v2];

  return (char)v2;
}

- (PXBrowserSummaryControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PXBrowserSummaryControllerDataSource *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PXBrowserSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

void __44__PXBrowserSummaryController_setDataSource___block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PXBrowserSummaryController_setDataSource___block_invoke_4;
  v3[3] = &unk_1E5DB1BF8;
  objc_copyWeak(&v4, v1);
  [WeakRetained performChanges:v3];

  objc_destroyWeak(&v4);
}

- (void)performBlockWhenDoneUpdating:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXBrowserSummaryController *)self wantsVerboseLogging];
  BOOL v6 = v5;
  if (v5) {
    NSLog(&cfstr_WillPerformblo.isa, self);
  }
  objc_initWeak(&location, self);
  int64_t v7 = [(PXBrowserSummaryController *)self visibleMetadataInfoUpdater];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke;
  v9[3] = &unk_1E5DB2F10;
  BOOL v12 = v6;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v7 performBlockWhenDoneUpdating:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)wantsVerboseLogging
{
  return self->_wantsVerboseLogging;
}

uint64_t __44__PXBrowserSummaryController_setDataSource___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateContainerTitle];
  [*(id *)(a1 + 32) invalidateLocalizedContainerItemsCount];
  [*(id *)(a1 + 32) invalidateContainerDateInterval];
  [*(id *)(a1 + 32) invalidateVisibleContent];
  [*(id *)(a1 + 32) invalidateSelection];
  [*(id *)(a1 + 32) invalidateFilteringContainerContent];
  v2 = *(void **)(a1 + 32);
  return [v2 setReady:0];
}

- (void)invalidateSelection
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__PXBrowserSummaryController_invalidateSelection__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXBrowserSummaryController *)self performChanges:v2];
}

- (void)invalidateLocalizedContainerItemsCount
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__PXBrowserSummaryController_invalidateLocalizedContainerItemsCount__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXBrowserSummaryController *)self performChanges:v2];
}

- (void)invalidateFilteringContainerContent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__PXBrowserSummaryController_invalidateFilteringContainerContent__block_invoke;
  v2[3] = &unk_1E5DB1BD0;
  v2[4] = self;
  [(PXBrowserSummaryController *)self performChanges:v2];
}

- (void)invalidateContainerTitle
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__PXBrowserSummaryController_invalidateContainerTitle__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXBrowserSummaryController *)self performChanges:v2];
}

- (void)invalidateContainerDateInterval
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__PXBrowserSummaryController_invalidateContainerDateInterval__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXBrowserSummaryController *)self performChanges:v2];
}

- (id)_requestTitlesInfoWithResultHandler:(id)a3
{
  id v41 = a3;
  v43 = [(PXBrowserSummaryController *)self defaultAttributes];
  id v4 = [(PXBrowserSummaryController *)self emphasizedAttributes];
  BOOL v5 = [(PXBrowserSummaryController *)self visibleMetadataInfoUpdater];
  v44 = [v5 info];

  BOOL v6 = [(PXBrowserSummaryController *)self containerTitle];
  BOOL v31 = [(PXBrowserSummaryController *)self isFilteringContainerContent];
  int64_t v7 = [(PXBrowserSummaryController *)self containerDateInterval];
  v40 = [(PXBrowserSummaryController *)self dateIntervalFormatter];
  v39 = [(PXBrowserSummaryController *)self noFilteringResultsPlaceholderText];
  v37 = [(PXBrowserSummaryController *)self localizedContainerItemsCount];
  v35 = [(PXBrowserSummaryController *)self localizedComponentsSeparator];
  BOOL v29 = [(PXBrowserSummaryController *)self shouldUseSubtitles];
  BOOL v8 = [(PXBrowserSummaryController *)self shouldUseNavigationTitle];
  BOOL v33 = [(PXBrowserSummaryController *)self shouldShowLocationNames];
  if (self->_dataSourceRespondsTo.useAssetImportDate)
  {
    v9 = [(PXBrowserSummaryController *)self dataSource];
    char v32 = [v9 shouldShowImportDates];
  }
  else
  {
    char v32 = 0;
  }
  BOOL v10 = [(PXBrowserSummaryController *)self shouldUseAbbreviatedDates];
  unint64_t v11 = [(PXBrowserSummaryController *)self containerDateFormatGranularity];
  if (v6)
  {
    unint64_t v12 = v11;
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v4];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __66__PXBrowserSummaryController__requestTitlesInfoWithResultHandler___block_invoke;
    v68[3] = &unk_1E5DB1C20;
    v68[4] = self;
    id v14 = v13;
    id v15 = @"ContainerTitle";
    id v69 = v14;
    v70 = @"ContainerTitle";
    [(PXBrowserSummaryController *)self performChanges:v68];

    unint64_t v11 = v12;
    BOOL v16 = v29;
    BOOL v17 = v29;
  }
  else
  {
    BOOL v17 = 0;
    id v14 = 0;
    id v15 = 0;
    BOOL v16 = v29;
  }
  v30 = v14;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __66__PXBrowserSummaryController__requestTitlesInfoWithResultHandler___block_invoke_2;
  v45[3] = &unk_1E5DB1C48;
  if (v7) {
    char v18 = v8;
  }
  else {
    char v18 = 1;
  }
  id v46 = v44;
  id v47 = v14;
  BOOL v60 = v31;
  v48 = v15;
  id v49 = v7;
  BOOL v61 = v10;
  id v50 = v40;
  id v51 = v43;
  BOOL v62 = v33;
  char v63 = v32;
  v19 = v4;
  id v52 = v4;
  v53 = self;
  char v64 = v17 & (v18 ^ 1);
  char v65 = v17 & v18;
  BOOL v66 = v16;
  BOOL v67 = v8;
  id v54 = v39;
  id v55 = v37;
  id v56 = v6;
  unint64_t v59 = v11;
  id v57 = v35;
  id v58 = v41;
  id v42 = v41;
  id v36 = v35;
  id v34 = v6;
  id v38 = v37;
  id v20 = v39;
  id v21 = v19;
  id v22 = v43;
  id v23 = v40;
  id v24 = v7;
  id v25 = v30;
  id v26 = v44;
  v27 = [(PXBrowserSummaryController *)self _performRequestBlock:v45];

  return v27;
}

- (BOOL)shouldUseSubtitles
{
  return self->_shouldUseSubtitles;
}

- (BOOL)shouldUseNavigationTitle
{
  return self->_shouldUseNavigationTitle;
}

- (BOOL)shouldUseAbbreviatedDates
{
  return self->_shouldUseAbbreviatedDates;
}

- (NSString)noFilteringResultsPlaceholderText
{
  return self->_noFilteringResultsPlaceholderText;
}

- (NSString)localizedContainerItemsCount
{
  return self->_localizedContainerItemsCount;
}

- (NSString)localizedComponentsSeparator
{
  return self->_localizedComponentsSeparator;
}

- (BOOL)isFilteringContainerContent
{
  return self->_filteringContainerContent;
}

- (NSDictionary)emphasizedAttributes
{
  return self->_emphasizedAttributes;
}

- (NSDictionary)defaultAttributes
{
  return self->_defaultAttributes;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  return self->_dateIntervalFormatter;
}

- (NSString)containerTitle
{
  return self->_containerTitle;
}

- (NSDateInterval)containerDateInterval
{
  return self->_containerDateInterval;
}

- (unint64_t)containerDateFormatGranularity
{
  return self->_containerDateFormatGranularity;
}

- (void)_invalidateTitles
{
  id v2 = [(PXBrowserSummaryController *)self titlesInfoUpdater];
  [v2 invalidateInfo];
}

- (void)invalidateVisibleContent
{
  id v2 = [(PXBrowserSummaryController *)self visibleMetadataInfoUpdater];
  [v2 invalidateInfo];
}

void __51__PXBrowserSummaryController_infoUpdaterDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) visibleMetadataInfoUpdater];

  if (v3 == v4)
  {
    [*(id *)(a1 + 40) _invalidateTitles];
  }
  else
  {
    BOOL v5 = *(void **)(a1 + 32);
    BOOL v6 = [*(id *)(a1 + 40) selectionInfoUpdater];

    if (v5 == v6)
    {
      [*(id *)(a1 + 40) _invalidateAttributedSelectionTitle];
      [*(id *)(a1 + 40) _invalidateStackedAssets];
    }
    else
    {
      int64_t v7 = *(void **)(a1 + 32);
      BOOL v8 = [*(id *)(a1 + 40) titlesInfoUpdater];

      if (v7 != v8)
      {
        id v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"PXBrowserSummaryController.m" lineNumber:798 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      v9 = [*(id *)(a1 + 40) titlesInfoUpdater];
      BOOL v10 = [v9 info];

      unint64_t v11 = *(void **)(a1 + 40);
      unint64_t v12 = [v10 objectForKeyedSubscript:@"attributedPrimaryTitle"];
      v13 = [v10 objectForKeyedSubscript:@"primaryTitleAccessibilityIdentifier"];
      [v11 _setAttributedPrimaryTitle:v12 accessibilityIdentifier:v13];

      id v14 = *(void **)(a1 + 40);
      id v15 = [v10 objectForKeyedSubscript:@"secondaryTitle"];
      BOOL v16 = [v10 objectForKeyedSubscript:@"secondaryTitleAccessibilityIdentifier"];
      [v14 _setSecondaryTitle:v15 accessibilityIdentifier:v16];

      BOOL v17 = *(void **)(a1 + 40);
      char v18 = [v10 objectForKeyedSubscript:@"tertiaryTitle"];
      v19 = [v10 objectForKeyedSubscript:@"tertiaryTitleAccessibilityIdentifier"];
      [v17 _setTertiaryTitle:v18 accessibilityIdentifier:v19];

      id v20 = [v10 objectForKeyedSubscript:@"navigationTitle"];
      [*(id *)(a1 + 40) setNavigationTitle:v20];
    }
  }
}

- (PXInfoUpdater)visibleMetadataInfoUpdater
{
  return self->_visibleMetadataInfoUpdater;
}

- (PXInfoUpdater)titlesInfoUpdater
{
  return self->_titlesInfoUpdater;
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PXBrowserSummaryController_infoUpdaterDidUpdate___block_invoke;
  v7[3] = &unk_1E5DD0510;
  id v8 = v5;
  v9 = self;
  SEL v10 = a2;
  id v6 = v5;
  [(PXBrowserSummaryController *)self performChanges:v7];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXBrowserSummaryController;
  [(PXBrowserSummaryController *)&v3 performChanges:a3];
}

- (PXInfoUpdater)selectionInfoUpdater
{
  return self->_selectionInfoUpdater;
}

- (void)setNavigationTitle:(id)a3
{
  id v8 = (NSString *)a3;
  id v4 = self->_navigationTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      navigationTitle = self->_navigationTitle;
      self->_navigationTitle = v6;

      [(PXBrowserSummaryController *)self signalChange:8];
    }
  }
}

- (void)_setTertiaryTitle:(id)a3 accessibilityIdentifier:(id)a4
{
  BOOL v16 = (NSString *)a3;
  id v6 = (NSString *)a4;
  int64_t v7 = self->_tertiaryTitle;
  if (v7 == v16)
  {
  }
  else
  {
    BOOL v8 = [(NSString *)v16 isEqualToString:v7];

    if (!v8)
    {
LABEL_7:
      unint64_t v12 = (NSString *)[(NSString *)v16 copy];
      tertiaryTitle = self->_tertiaryTitle;
      self->_tertiaryTitle = v12;

      id v14 = (NSString *)[(NSString *)v6 copy];
      tertiaryTitleAccessibilityIdentifier = self->_tertiaryTitleAccessibilityIdentifier;
      self->_tertiaryTitleAccessibilityIdentifier = v14;

      [(PXBrowserSummaryController *)self signalChange:4];
      goto LABEL_9;
    }
  }
  v9 = self->_tertiaryTitleAccessibilityIdentifier;
  if (v9 != v6)
  {
    SEL v10 = v9;
    BOOL v11 = [(NSString *)v6 isEqualToString:v9];

    if (v11) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

LABEL_9:
}

- (void)_setSecondaryTitle:(id)a3 accessibilityIdentifier:(id)a4
{
  BOOL v16 = (NSString *)a3;
  id v6 = (NSString *)a4;
  int64_t v7 = self->_secondaryTitle;
  if (v7 == v16)
  {
  }
  else
  {
    BOOL v8 = [(NSString *)v16 isEqualToString:v7];

    if (!v8)
    {
LABEL_7:
      unint64_t v12 = (NSString *)[(NSString *)v16 copy];
      secondaryTitle = self->_secondaryTitle;
      self->_secondaryTitle = v12;

      id v14 = (NSString *)[(NSString *)v6 copy];
      secondaryTitleAccessibilityIdentifier = self->_secondaryTitleAccessibilityIdentifier;
      self->_secondaryTitleAccessibilityIdentifier = v14;

      [(PXBrowserSummaryController *)self signalChange:2];
      goto LABEL_9;
    }
  }
  v9 = self->_secondaryTitleAccessibilityIdentifier;
  if (v9 != v6)
  {
    SEL v10 = v9;
    BOOL v11 = [(NSString *)v6 isEqualToString:v9];

    if (v11) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

LABEL_9:
}

- (void)_setAttributedPrimaryTitle:(id)a3 accessibilityIdentifier:(id)a4
{
  BOOL v16 = (NSAttributedString *)a3;
  id v6 = (NSString *)a4;
  int64_t v7 = self->_attributedPrimaryTitle;
  if (v7 == v16)
  {
  }
  else
  {
    int v8 = [(NSAttributedString *)v16 isEqual:v7];

    if (!v8)
    {
LABEL_7:
      unint64_t v12 = (NSAttributedString *)[(NSAttributedString *)v16 copy];
      attributedPrimaryTitle = self->_attributedPrimaryTitle;
      self->_attributedPrimaryTitle = v12;

      id v14 = (NSString *)[(NSString *)v6 copy];
      primaryTitleAccessibilityIdentifier = self->_primaryTitleAccessibilityIdentifier;
      self->_primaryTitleAccessibilityIdentifier = v14;

      [(PXBrowserSummaryController *)self signalChange:1];
      goto LABEL_9;
    }
  }
  v9 = self->_primaryTitleAccessibilityIdentifier;
  if (v9 != v6)
  {
    SEL v10 = v9;
    BOOL v11 = [(NSString *)v6 isEqualToString:v9];

    if (v11) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

LABEL_9:
}

void __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  id v2 = [*(id *)(a1 + 32) dateInterval];
  [v6 setObject:v2 forKeyedSubscript:@"dateInterval"];

  objc_super v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "dateIntervalGranularity"));
  [v6 setObject:v3 forKeyedSubscript:@"granularity"];

  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) locationNames];
    [v6 setObject:v4 forKeyedSubscript:@"locationNames"];
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [*(id *)(a1 + 32) localizedPlaceholderText];
    [v6 setObject:v5 forKeyedSubscript:@"placeholder"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__PXBrowserSummaryController__requestTitlesInfoWithResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"dateInterval"];
  objc_super v3 = *(void **)(a1 + 40);
  id v30 = (id)v2;
  if (v3)
  {
    id v4 = v3;
    BOOL v5 = (__CFString *)*(id *)(a1 + 48);
    goto LABEL_11;
  }
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"granularity"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  int v8 = (__CFString *)v30;
  if (v8)
  {
    BOOL v5 = v8;
LABEL_5:
    v9 = objc_msgSend(*(id *)(a1 + 64), "px_dateTemplateForGranularity:abbreviated:", v7, *(unsigned __int8 *)(a1 + 145));
    [*(id *)(a1 + 64) setDateTemplate:v9];

    SEL v10 = objc_msgSend(*(id *)(a1 + 64), "px_attributedStringFromDateInterval:defaultAttributes:emphasizedAttributes:", v5, *(void *)(a1 + 72), *(void *)(a1 + 80));
    objc_msgSend(v10, "px_attributedStringByApplyingCapitalization:", 3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v5 = @"DateInterval";
    goto LABEL_11;
  }
  if (*(unsigned char *)(a1 + 144))
  {
    BOOL v5 = (__CFString *)*(id *)(a1 + 56);
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 136);
      goto LABEL_5;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  id v4 = 0;
LABEL_11:
  if (*(unsigned char *)(a1 + 146))
  {
    id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"locationNames"];
    if ([v11 count] == 1)
    {
      unint64_t v12 = [v11 firstObject];
    }
    else if ((unint64_t)[v11 count] < 2)
    {
      unint64_t v12 = 0;
    }
    else
    {
      id v14 = PXLocalizedStringFromTable(@"PXBrowserSummaryLocationAndMore", @"PhotosUICore");
      BOOL v29 = [v11 firstObject];
      PXStringWithValidatedFormat();
      unint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v15 = @"Location";
    goto LABEL_27;
  }
  if (*(unsigned char *)(a1 + 147))
  {
    PXLocalizedStringFromTable(@"IMPORT_HISTORY_IMPORTED_ON_DATE", @"PhotosUICore");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v13 = [v30 startDate];
    if (v13)
    {
      BOOL v29 = [*(id *)(*(void *)(a1 + 88) + 280) stringFromDate:v13];
      PXLocalizedStringWithValidatedFormat(v11, @"%@");
      unint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v12 = &stru_1F00B0030;
    }

    id v15 = @"ImportDate";
    goto LABEL_27;
  }
  id v16 = v30;
  if (!v30 && *(unsigned char *)(a1 + 144))
  {
    unint64_t v12 = (__CFString *)*(id *)(a1 + 96);
    id v15 = @"FilteringResultsPlaceholder";
    if (!*(unsigned char *)(a1 + 150)) {
      goto LABEL_35;
    }
LABEL_34:
    if (*(unsigned char *)(a1 + 144)) {
      goto LABEL_35;
    }
    goto LABEL_30;
  }
  if (*(unsigned char *)(a1 + 148))
  {
    id v11 = *(id *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 136);
    if (v11)
    {
LABEL_24:
      char v18 = objc_msgSend(*(id *)(a1 + 64), "px_dateTemplateForGranularity:abbreviated:", v17, *(unsigned __int8 *)(a1 + 145));
      [*(id *)(a1 + 64) setDateTemplate:v18];

      unint64_t v12 = [*(id *)(a1 + 64) stringFromDateInterval:v11];
      id v15 = @"DateInterval";
LABEL_27:

      id v16 = v30;
      goto LABEL_28;
    }
LABEL_62:
    id v15 = 0;
    unint64_t v12 = 0;
    goto LABEL_27;
  }
  if (*(unsigned char *)(a1 + 149))
  {
    id v11 = v30;
    v28 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"granularity"];
    uint64_t v17 = [v28 unsignedIntegerValue];

    if (v11) {
      goto LABEL_24;
    }
    goto LABEL_62;
  }
  id v15 = 0;
  unint64_t v12 = 0;
LABEL_28:
  if (!*(unsigned char *)(a1 + 150)) {
    goto LABEL_35;
  }
  if (!v16) {
    goto LABEL_34;
  }
LABEL_30:
  if (!*(unsigned char *)(a1 + 151))
  {
    id v19 = *(id *)(a1 + 104);
    id v20 = @"ContainerItemsCount";
    goto LABEL_36;
  }
LABEL_35:
  id v19 = 0;
  id v20 = 0;
LABEL_36:
  if (*(unsigned char *)(a1 + 151))
  {
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    if (*(void *)(a1 + 112))
    {
      if (*(unsigned char *)(a1 + 144) || !*(void *)(a1 + 56)) {
        goto LABEL_66;
      }
      id v22 = objc_msgSend(*(id *)(a1 + 64), "px_dateTemplateForGranularity:abbreviated:", *(void *)(a1 + 136), *(unsigned __int8 *)(a1 + 145));
      [*(id *)(a1 + 64) setDateTemplate:v22];

      id v23 = [*(id *)(a1 + 64) stringFromDateInterval:*(void *)(a1 + 56)];
      if (v23) {
        [v21 addObject:v23];
      }

      if (*(void *)(a1 + 112)) {
        goto LABEL_66;
      }
    }
    if (*(unsigned char *)(a1 + 144) && ![v21 count])
    {
LABEL_66:
      if (*(void *)(a1 + 104)) {
        objc_msgSend(v21, "addObject:");
      }
    }
    if (objc_msgSend(v21, "count", v29))
    {
      id v24 = [v21 componentsJoinedByString:*(void *)(a1 + 120)];
    }
    else
    {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }
  if (!objc_msgSend(v4, "length", v29) && !-[__CFString length](v12, "length"))
  {
    id v25 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"placeholder"];
    if (v25)
    {
      uint64_t v26 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v25 attributes:*(void *)(a1 + 80)];

      BOOL v5 = @"PlaceholderText";
      id v4 = (id)v26;
    }
  }
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  [v27 setObject:v4 forKeyedSubscript:@"attributedPrimaryTitle"];
  [v27 setObject:v5 forKeyedSubscript:@"primaryTitleAccessibilityIdentifier"];
  [v27 setObject:v12 forKeyedSubscript:@"secondaryTitle"];
  [v27 setObject:v15 forKeyedSubscript:@"secondaryTitleAccessibilityIdentifier"];
  [v27 setObject:v19 forKeyedSubscript:@"tertiaryTitle"];
  [v27 setObject:v20 forKeyedSubscript:@"tertiaryTitleAccessibilityIdentifier"];
  [v27 setObject:v24 forKeyedSubscript:@"navigationTitle"];
  (*(void (**)(void))(*(void *)(a1 + 128) + 16))();
}

uint64_t __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    NSLog(&cfstr_Titlesinfoupda.isa, WeakRetained);
  }
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

void __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    NSLog(&cfstr_Selectioninfou.isa, WeakRetained);
  }
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [v3 titlesInfoUpdater];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke_3;
  v5[3] = &unk_1E5DB2F10;
  char v8 = *(unsigned char *)(a1 + 48);
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  [v4 performBlockWhenDoneUpdating:v5];

  objc_destroyWeak(&v7);
}

void __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    NSLog(&cfstr_Visiblemetadat.isa, WeakRetained);
  }
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [v3 selectionInfoUpdater];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke_2;
  v5[3] = &unk_1E5DB2F10;
  char v8 = *(unsigned char *)(a1 + 48);
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  [v4 performBlockWhenDoneUpdating:v5];

  objc_destroyWeak(&v7);
}

void __44__PXBrowserSummaryController_setDataSource___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PXBrowserSummaryController_setDataSource___block_invoke_3;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

- (void)_setNeedsUpdate
{
}

- (void)_updateIfNeeded
{
  if ([(PXBrowserSummaryController *)self _needsUpdate])
  {
    [(PXBrowserSummaryController *)self _updateContainerTitleIfNeeded];
    [(PXBrowserSummaryController *)self _updateLocalizedContainerItemsCountIfNeeded];
    [(PXBrowserSummaryController *)self _updateContainerDateIntervalIfNeeded];
    [(PXBrowserSummaryController *)self _updateSelectionSnapshotIfNeeded];
    [(PXBrowserSummaryController *)self _updateFilteringContainerContentIfNeeded];
    [(PXBrowserSummaryController *)self _updateAttributedSelectionTitleIfNeeded];
    [(PXBrowserSummaryController *)self _updateStackedAssetsIfNeeded];
  }
}

- (void)didPerformChanges
{
  [(PXBrowserSummaryController *)self _updateIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)PXBrowserSummaryController;
  [(PXBrowserSummaryController *)&v3 didPerformChanges];
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.containerTitle
      || self->_needsUpdateFlags.localizedContainerItemsCount
      || self->_needsUpdateFlags.containerDateInterval
      || self->_needsUpdateFlags.selectionSnapshot
      || self->_needsUpdateFlags.filteringContainerContent
      || self->_needsUpdateFlags.attributedPrimaryTitle
      || self->_needsUpdateFlags.secondaryTitle
      || self->_needsUpdateFlags.tertiaryTitle
      || self->_needsUpdateFlags.navigationTitle
      || self->_needsUpdateFlags.attributedSelectionTitle
      || self->_needsUpdateFlags.stackedAssets;
}

- (void)setSelectionSnapshot:(id)a3
{
  char v8 = (PXBrowserSelectionSnapshot *)a3;
  BOOL v5 = self->_selectionSnapshot;
  id v6 = v8;
  if (v5 != v8)
  {
    char v7 = [(PXBrowserSelectionSnapshot *)v8 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_selectionSnapshot, a3);
    id v6 = [(PXBrowserSummaryController *)self selectionInfoUpdater];
    [v6 invalidateInfo];
  }

LABEL_5:
}

- (void)setFilteringContainerContent:(BOOL)a3
{
  if (self->_filteringContainerContent != a3)
  {
    self->_filteringContainerContent = a3;
    [(PXBrowserSummaryController *)self _invalidateTitles];
  }
}

- (void)_updateStackedAssetsIfNeeded
{
  if (self->_needsUpdateFlags.stackedAssets)
  {
    self->_needsUpdateFlags.stackedAssets = 0;
    objc_super v3 = [(PXBrowserSummaryController *)self selectionInfoUpdater];
    id v7 = [v3 info];

    id v4 = [v7 objectForKeyedSubscript:@"count"];
    uint64_t v5 = [v4 integerValue];

    if (v5 < 2)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [v7 objectForKeyedSubscript:@"stackedAssets"];
    }
    [(PXBrowserSummaryController *)self setStackedAssets:v6];
  }
}

- (void)_updateSelectionSnapshotIfNeeded
{
  if (self->_needsUpdateFlags.selectionSnapshot)
  {
    self->_needsUpdateFlags.selectionSnapshot = 0;
    if (self->_dataSourceRespondsTo.selectionSnapshot)
    {
      id v4 = [(PXBrowserSummaryController *)self dataSource];
      objc_super v3 = [v4 selectionSnapshotForBrowserSummaryController:self];
      [(PXBrowserSummaryController *)self setSelectionSnapshot:v3];
    }
    else
    {
      [(PXBrowserSummaryController *)self setSelectionSnapshot:0];
    }
  }
}

- (void)_updateFilteringContainerContentIfNeeded
{
  if (self->_needsUpdateFlags.filteringContainerContent)
  {
    self->_needsUpdateFlags.filteringContainerContent = 0;
    if (self->_dataSourceRespondsTo.filteringContainerContent)
    {
      id v3 = [(PXBrowserSummaryController *)self dataSource];
      -[PXBrowserSummaryController setFilteringContainerContent:](self, "setFilteringContainerContent:", [v3 isFilteringContainerContentForBrowserSummaryController:self]);
    }
    else
    {
      [(PXBrowserSummaryController *)self setFilteringContainerContent:0];
    }
  }
}

- (void)_updateAttributedSelectionTitleIfNeeded
{
  if (self->_needsUpdateFlags.attributedSelectionTitle)
  {
    self->_needsUpdateFlags.attributedSelectionTitle = 0;
    id v3 = [(PXBrowserSummaryController *)self selectionInfoUpdater];
    id v12 = [v3 info];

    id v4 = [v12 objectForKeyedSubscript:@"count"];
    uint64_t v5 = [v4 integerValue];

    if (v5 < 2)
    {
      id v11 = 0;
    }
    else
    {
      id v6 = [v12 objectForKeyedSubscript:@"mediaType"];
      uint64_t v7 = [v6 integerValue];

      char v8 = PXLocalizedAssetCountForUsage(v5, v7, 0, 1);
      id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
      SEL v10 = [(PXBrowserSummaryController *)self selectionAttributes];
      id v11 = (void *)[v9 initWithString:v8 attributes:v10];
    }
    [(PXBrowserSummaryController *)self setAttributedSelectionTitle:v11];
  }
}

uint64_t __51__PXBrowserSummaryController__performRequestBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __68__PXBrowserSummaryController_invalidateLocalizedContainerItemsCount__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLocalizedContainerItemsCount];
}

uint64_t __65__PXBrowserSummaryController_invalidateFilteringContainerContent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateFilteringContainerContent];
}

uint64_t __61__PXBrowserSummaryController_invalidateContainerDateInterval__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateContainerDateInterval];
}

uint64_t __54__PXBrowserSummaryController_invalidateContainerTitle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateContainerTitle];
}

uint64_t __49__PXBrowserSummaryController_invalidateSelection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateSelectionSnapshot];
}

- (NSAttributedString)attributedPrimaryTitle
{
  return self->_attributedPrimaryTitle;
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_dataSource, v4);
    self->_dataSourceRespondsTo.containerTitle = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.localizedContainerItemsCount = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.containerDateInterval = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.visibleContentSnapshot = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.selectionSnapshot = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.filteringContainerContent = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.useAssetImportDate = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.shouldUpdateImmediately = objc_opt_respondsToSelector() & 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PXBrowserSummaryController_setDataSource___block_invoke;
    v9[3] = &unk_1E5DB1BD0;
    void v9[4] = self;
    [(PXBrowserSummaryController *)self performChanges:v9];
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__PXBrowserSummaryController_setDataSource___block_invoke_2;
    v6[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v7, &location);
    [(PXBrowserSummaryController *)self performBlockWhenDoneUpdating:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __44__PXBrowserSummaryController_setDataSource___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setReady:1];
}

- (void)setReady:(BOOL)a3
{
  if (self->_ready != a3)
  {
    self->_ready = a3;
    [(PXBrowserSummaryController *)self signalChange:64];
  }
}

- (void)_invalidateContainerTitle
{
  self->_needsUpdateFlags.containerTitle = 1;
  [(PXBrowserSummaryController *)self _setNeedsUpdate];
}

- (void)_invalidateSelectionSnapshot
{
  self->_needsUpdateFlags.selectionSnapshot = 1;
  [(PXBrowserSummaryController *)self _setNeedsUpdate];
}

- (void)_invalidateLocalizedContainerItemsCount
{
  self->_needsUpdateFlags.localizedContainerItemsCount = 1;
  [(PXBrowserSummaryController *)self _setNeedsUpdate];
}

- (void)_invalidateFilteringContainerContent
{
  self->_needsUpdateFlags.filteringContainerContent = 1;
  [(PXBrowserSummaryController *)self _setNeedsUpdate];
}

- (void)_invalidateContainerDateInterval
{
  self->_needsUpdateFlags.containerDateInterval = 1;
  [(PXBrowserSummaryController *)self _setNeedsUpdate];
}

- (PXBrowserSummaryController)init
{
  v24.receiver = self;
  v24.super_class = (Class)PXBrowserSummaryController;
  id v2 = [(PXBrowserSummaryController *)&v24 init];
  if (v2)
  {
    id v3 = [[PXInfoUpdater alloc] initWithInfoProvider:v2 infoKind:@"PXVisibleDateIntervalInfoKind"];
    id v4 = (void *)*((void *)v2 + 30);
    *((void *)v2 + 30) = v3;

    uint64_t v5 = [[PXInfoUpdater alloc] initWithInfoProvider:v2 infoKind:@"PXSelectedItemsInfoKind"];
    id v6 = (void *)*((void *)v2 + 31);
    *((void *)v2 + 31) = v5;

    id v7 = [[PXInfoUpdater alloc] initWithInfoProvider:v2 infoKind:@"PXOutputTitleInfoKind"];
    char v8 = (void *)*((void *)v2 + 32);
    *((void *)v2 + 32) = v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    SEL v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PXBrowserSummaryController", v10);
    id v12 = (void *)*((void *)v2 + 33);
    *((void *)v2 + 33) = v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    id v14 = (void *)*((void *)v2 + 34);
    *((void *)v2 + 34) = v13;

    id v15 = [[PXSelectedItemsStack alloc] initWithDepth:3];
    id v16 = (void *)*((void *)v2 + 41);
    *((void *)v2 + 41) = v15;

    *(_WORD *)(v2 + 115) = 1;
    v2[118] = 0;
    uint64_t v17 = PXLocalizedStringFromTable(@"PXBrowserSummaryNoFilteringResultsPlaceholderText", @"PhotosUICore");
    char v18 = (void *)*((void *)v2 + 42);
    *((void *)v2 + 42) = v17;

    uint64_t v19 = PXLocalizedStringFromTable(@"PXBrowserSummaryComponentsSeparator", @"PhotosUICore");
    id v20 = (void *)*((void *)v2 + 36);
    *((void *)v2 + 36) = v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v22 = (void *)*((void *)v2 + 35);
    *((void *)v2 + 35) = v21;

    [*((id *)v2 + 35) setDateStyle:3];
    [*((id *)v2 + 35) setTimeStyle:0];
    [*((id *)v2 + 30) setObserver:v2];
    [*((id *)v2 + 31) setObserver:v2];
    [*((id *)v2 + 32) setObserver:v2];
    *((void *)v2 + 19) = 8;
  }
  return (PXBrowserSummaryController *)v2;
}

- (void)setShouldUseAbbreviatedDates:(BOOL)a3
{
  if (self->_shouldUseAbbreviatedDates != a3)
  {
    self->_shouldUseAbbreviatedDates = a3;
    [(PXBrowserSummaryController *)self _invalidateTitles];
  }
}

- (void)setShouldShowLocationNames:(BOOL)a3
{
  if (self->_shouldShowLocationNames != a3)
  {
    self->_shouldShowLocationNames = a3;
    [(PXBrowserSummaryController *)self _invalidateTitles];
  }
}

- (void)setEmphasizedAttributes:(id)a3
{
  char v8 = (NSDictionary *)a3;
  id v4 = self->_emphasizedAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      emphasizedAttributes = self->_emphasizedAttributes;
      self->_emphasizedAttributes = v6;

      [(PXBrowserSummaryController *)self _invalidateTitles];
    }
  }
}

- (void)setDefaultAttributes:(id)a3
{
  char v8 = (NSDictionary *)a3;
  id v4 = self->_defaultAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      defaultAttributes = self->_defaultAttributes;
      self->_defaultAttributes = v6;

      [(PXBrowserSummaryController *)self _invalidateTitles];
    }
  }
}

- (void)_updateContainerTitleIfNeeded
{
  if (self->_needsUpdateFlags.containerTitle)
  {
    self->_needsUpdateFlags.containerTitle = 0;
    if (self->_dataSourceRespondsTo.containerTitle)
    {
      id v3 = [(PXBrowserSummaryController *)self dataSource];
      id v4 = [v3 containerTitleForBrowserSummaryController:self];
    }
    else
    {
      id v4 = 0;
    }
    [(PXBrowserSummaryController *)self setContainerTitle:v4];
  }
}

- (void)setContainerTitle:(id)a3
{
  char v8 = (NSString *)a3;
  id v4 = self->_containerTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      containerTitle = self->_containerTitle;
      self->_containerTitle = v6;

      [(PXBrowserSummaryController *)self _invalidateTitles];
    }
  }
}

- (void)_updateLocalizedContainerItemsCountIfNeeded
{
  if (self->_needsUpdateFlags.localizedContainerItemsCount)
  {
    self->_needsUpdateFlags.localizedContainerItemsCount = 0;
    if (self->_dataSourceRespondsTo.localizedContainerItemsCount)
    {
      id v3 = [(PXBrowserSummaryController *)self dataSource];
      id v4 = [v3 localizedContainerItemsCountForBrowserSummaryController:self];
    }
    else
    {
      id v4 = 0;
    }
    [(PXBrowserSummaryController *)self setLocalizedContainerItemsCount:v4];
  }
}

- (void)setLocalizedContainerItemsCount:(id)a3
{
  char v8 = (NSString *)a3;
  id v4 = self->_localizedContainerItemsCount;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      localizedContainerItemsCount = self->_localizedContainerItemsCount;
      self->_localizedContainerItemsCount = v6;

      [(PXBrowserSummaryController *)self _invalidateTitles];
    }
  }
}

- (void)_updateContainerDateIntervalIfNeeded
{
  if (self->_needsUpdateFlags.containerDateInterval)
  {
    self->_needsUpdateFlags.containerDateInterval = 0;
    if (self->_dataSourceRespondsTo.containerDateInterval)
    {
      id v3 = [(PXBrowserSummaryController *)self dataSource];
      id v4 = [v3 containerDateIntervalForBrowserSummaryController:self];
    }
    else
    {
      id v4 = 0;
    }
    [(PXBrowserSummaryController *)self setContainerDateInterval:v4];
  }
}

- (void)setContainerDateInterval:(id)a3
{
  char v8 = (NSDateInterval *)a3;
  id v4 = self->_containerDateInterval;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDateInterval *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSDateInterval *)[(NSDateInterval *)v8 copy];
      containerDateInterval = self->_containerDateInterval;
      self->_containerDateInterval = v6;

      [(PXBrowserSummaryController *)self _invalidateTitles];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noFilteringResultsPlaceholderText, 0);
  objc_storeStrong((id *)&self->_selectedAssetsStack, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_containerDateInterval, 0);
  objc_storeStrong((id *)&self->_localizedContainerItemsCount, 0);
  objc_storeStrong((id *)&self->_containerTitle, 0);
  objc_storeStrong((id *)&self->_localizedComponentsSeparator, 0);
  objc_storeStrong((id *)&self->_importDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_titlesInfoUpdater, 0);
  objc_storeStrong((id *)&self->_selectionInfoUpdater, 0);
  objc_storeStrong((id *)&self->_visibleMetadataInfoUpdater, 0);
  objc_storeStrong((id *)&self->_stackedAssets, 0);
  objc_storeStrong((id *)&self->_attributedSelectionTitle, 0);
  objc_storeStrong((id *)&self->_navigationTitle, 0);
  objc_storeStrong((id *)&self->_tertiaryTitleAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_tertiaryTitle, 0);
  objc_storeStrong((id *)&self->_secondaryTitleAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_primaryTitleAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_attributedPrimaryTitle, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_selectionAttributes, 0);
  objc_storeStrong((id *)&self->_emphasizedAttributes, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
}

- (void)setWantsVerboseLogging:(BOOL)a3
{
  self->_wantsVerboseLogging = a3;
}

- (void)setSelectedAssetsStack:(id)a3
{
}

- (PXSelectedItemsStack)selectedAssetsStack
{
  return self->_selectedAssetsStack;
}

- (NSDateFormatter)importDateFormatter
{
  return self->_importDateFormatter;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (NSArray)stackedAssets
{
  return self->_stackedAssets;
}

- (NSAttributedString)attributedSelectionTitle
{
  return self->_attributedSelectionTitle;
}

- (NSString)navigationTitle
{
  return self->_navigationTitle;
}

- (NSString)tertiaryTitleAccessibilityIdentifier
{
  return self->_tertiaryTitleAccessibilityIdentifier;
}

- (NSString)tertiaryTitle
{
  return self->_tertiaryTitle;
}

- (NSString)secondaryTitleAccessibilityIdentifier
{
  return self->_secondaryTitleAccessibilityIdentifier;
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (NSString)primaryTitleAccessibilityIdentifier
{
  return self->_primaryTitleAccessibilityIdentifier;
}

- (NSDictionary)selectionAttributes
{
  return self->_selectionAttributes;
}

void __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "assetCount"));
  [v2 setObject:v3 forKeyedSubscript:@"count"];

  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "mediaType"));
  [v2 setObject:v4 forKeyedSubscript:@"mediaType"];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke_3;
  v7[3] = &unk_1E5DB1C70;
  char v5 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  [v5 performChanges:v7];
  id v6 = [*(id *)(a1 + 40) topItems];
  [v2 setObject:v6 forKeyedSubscript:@"stackedAssets"];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[_PXBrowserSummarySelectedItemsSnapshot alloc] initWithBrowserSelectionSnapshot:*(void *)(a1 + 32)];
  [v3 updateWithSelectedItemsSnapshot:v4];
}

- (void)_invalidateStackedAssets
{
  self->_needsUpdateFlags.stackedAssets = 1;
  [(PXBrowserSummaryController *)self _setNeedsUpdate];
}

- (void)_invalidateAttributedSelectionTitle
{
  self->_needsUpdateFlags.attributedSelectionTitle = 1;
  [(PXBrowserSummaryController *)self _setNeedsUpdate];
}

uint64_t __66__PXBrowserSummaryController__requestTitlesInfoWithResultHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAttributedPrimaryTitle:*(void *)(a1 + 40) accessibilityIdentifier:*(void *)(a1 + 48)];
}

- (void)setContainerDateFormatGranularity:(unint64_t)a3
{
  if (self->_containerDateFormatGranularity != a3)
  {
    self->_containerDateFormatGranularity = a3;
    [(PXBrowserSummaryController *)self _invalidateTitles];
  }
}

- (void)setShouldUseNavigationTitle:(BOOL)a3
{
  if (self->_shouldUseNavigationTitle != a3)
  {
    self->_shouldUseNavigationTitle = a3;
    [(PXBrowserSummaryController *)self _invalidateTitles];
  }
}

- (void)setShouldUseSubtitles:(BOOL)a3
{
  if (self->_shouldUseSubtitles != a3)
  {
    self->_shouldUseSubtitles = a3;
    [(PXBrowserSummaryController *)self _invalidateTitles];
  }
}

- (void)setSelectionAttributes:(id)a3
{
  id v8 = (NSDictionary *)a3;
  id v4 = self->_selectionAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      selectionAttributes = self->_selectionAttributes;
      self->_selectionAttributes = v6;

      [(PXBrowserSummaryController *)self _invalidateTitles];
      [(PXBrowserSummaryController *)self _invalidateAttributedSelectionTitle];
    }
  }
}

- (void)setStackedAssets:(id)a3
{
  id v8 = (NSArray *)a3;
  id v4 = self->_stackedAssets;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSArray *)[(NSArray *)v8 copy];
      stackedAssets = self->_stackedAssets;
      self->_stackedAssets = v6;

      [(PXBrowserSummaryController *)self signalChange:32];
    }
  }
}

- (void)setAttributedSelectionTitle:(id)a3
{
  id v8 = (NSAttributedString *)a3;
  id v4 = self->_attributedSelectionTitle;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSAttributedString *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSAttributedString *)[(NSAttributedString *)v8 copy];
      attributedSelectionTitle = self->_attributedSelectionTitle;
      self->_attributedSelectionTitle = v6;

      [(PXBrowserSummaryController *)self signalChange:16];
    }
  }
}

@end