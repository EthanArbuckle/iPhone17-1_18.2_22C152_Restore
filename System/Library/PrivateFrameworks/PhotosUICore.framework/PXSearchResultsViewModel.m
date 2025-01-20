@interface PXSearchResultsViewModel
- (BOOL)_resultsAreWordEmbeddingsOnly;
- (BOOL)_sectionIsTopAssetsSection:(int64_t)a3;
- (BOOL)hasDisplayableSuggestions;
- (BOOL)hasNoResults;
- (BOOL)isValidSection:(int64_t)a3;
- (BOOL)sectionIsExpandable:(int64_t)a3;
- (BOOL)sectionIsExpanded:(int64_t)a3;
- (BOOL)shouldDisplayHeaderViewForSection:(int64_t)a3;
- (BOOL)shouldShowTableFooterView;
- (BOOL)topAssetsExistForSection:(int64_t)a3;
- (NSArray)attachmentURLs;
- (NSArray)suggestions;
- (NSArray)wordEmbeddingSubstitutions;
- (PXSearchQueryMatchInfo)searchQueryMatchInfo;
- (PXSearchResultsLayoutDataSource)delegate;
- (PXSearchResultsSectionedDataSourceManager)dataSourceManager;
- (PXSearchResultsViewModel)initWithSearchSectionedDataSource:(id)a3 configurationType:(unint64_t)a4;
- (PXSearchResultsViewModel)initWithSectionedDataSourceManager:(id)a3 configurationType:(unint64_t)a4;
- (PXSearchTopAssetsResult)topAssetsSearchResult;
- (double)calculatedRowHeightForTopAssets;
- (double)heightForRowType:(unint64_t)a3 info:(id)a4;
- (double)numberOfTopAssetRows;
- (id)_adjustedIndexPathForIndexPath:(id)a3;
- (id)_selectedWordEmbeddingTextAtRow:(int64_t)a3;
- (id)_sugestionForIndexPath:(id)a3;
- (id)allSearchResultsForSection:(int64_t)a3;
- (id)collapseSection:(int64_t)a3;
- (id)expandSection:(int64_t)a3;
- (id)searchResultAtIndexPath:(id)a3;
- (id)suggestionItemForIndexPath:(id)a3;
- (id)thumbnailAssetsForResultIndexPaths:(id)a3;
- (id)titleForHeaderButtonInSection:(int64_t)a3;
- (id)titleForHeaderInSection:(int64_t)a3 accessibilityIdentifier:(id *)a4;
- (id)topAssetAtIndexPath:(id)a3;
- (id)wordEmbeddingForIndexPath:(id)a3;
- (int64_t)_adjustedSectionForSection:(int64_t)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSearchResultsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfVisibleSearchResultsInSection:(int64_t)a3;
- (int64_t)startingSectionNumberForType:(unint64_t)a3;
- (unint64_t)_displayableSuggestionCount;
- (unint64_t)configurationType;
- (unint64_t)rowTypeForIndexPath:(id)a3;
- (unint64_t)sectionTypeForSection:(int64_t)a3;
- (void)fetchImageForPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 completion:(id)a6;
- (void)searchResultDataForIndexPath:(id)a3 completion:(id)a4;
- (void)setConfigurationType:(unint64_t)a3;
- (void)setDataSourceManager:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PXSearchResultsViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDataSourceManager:(id)a3
{
}

- (PXSearchResultsSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setConfigurationType:(unint64_t)a3
{
  self->_configurationType = a3;
}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (void)setDelegate:(id)a3
{
}

- (PXSearchResultsLayoutDataSource)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSearchResultsLayoutDataSource *)WeakRetained;
}

- (NSArray)suggestions
{
  v2 = [(PXSearchResultsViewModel *)self dataSourceManager];
  v3 = [v2 searchResultsDataSource];
  v4 = [v3 suggestions];

  return (NSArray *)v4;
}

- (NSArray)wordEmbeddingSubstitutions
{
  v2 = [(PXSearchResultsViewModel *)self dataSourceManager];
  v3 = [v2 searchResultsDataSource];
  v4 = [v3 wordEmbeddingSubstitutions];

  return (NSArray *)v4;
}

- (NSArray)attachmentURLs
{
  v2 = [(PXSearchResultsViewModel *)self dataSourceManager];
  v3 = [v2 searchResultsDataSource];
  v4 = [v3 tapToRadarAttachments];

  return (NSArray *)v4;
}

- (int64_t)_adjustedSectionForSection:(int64_t)a3
{
  if ([(PXSearchResultsViewModel *)self configurationType] != 3) {
    a3 -= [(PXSearchResultsViewModel *)self hasDisplayableSuggestions];
  }
  return a3;
}

- (id)_adjustedIndexPathForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", [v4 section]);
  if (v5 < 0)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v4, "row"), v5);
  }

  return v6;
}

- (unint64_t)_displayableSuggestionCount
{
  if ([(PXSearchResultsViewModel *)self configurationType] <= 2)
  {
    v3 = [(PXSearchResultsViewModel *)self dataSourceManager];
    id v4 = [v3 searchResultsDataSource];
    uint64_t v5 = [v4 numberOfSections];

    if (v5 >= 1)
    {
      v6 = [(PXSearchResultsViewModel *)self suggestions];
      unint64_t v7 = [v6 count];
LABEL_11:

      return v7;
    }
    if ([(PXSearchResultsViewModel *)self configurationType] != 2)
    {
      v6 = [(PXSearchResultsViewModel *)self wordEmbeddingSubstitutions];
      v8 = [(PXSearchResultsViewModel *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        v10 = [(PXSearchResultsViewModel *)self delegate];
        unint64_t v7 = [v10 maximumNumberWordEmbeddingRows];
      }
      else
      {
        unint64_t v7 = 0;
      }
      unint64_t v11 = [v6 count];
      if (v11 < v7) {
        unint64_t v7 = v11;
      }
      goto LABEL_11;
    }
  }
  return 0;
}

- (BOOL)isValidSection:(int64_t)a3
{
  int64_t v4 = [(PXSearchResultsViewModel *)self numberOfSections];
  return a3 >= 0 && v4 > a3;
}

- (BOOL)_sectionIsTopAssetsSection:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    int64_t v5 = [(PXSearchResultsViewModel *)self _adjustedSectionForSection:a3];
    if ((a3 & 0x8000000000000000) == 0)
    {
      int64_t v6 = v5;
      unint64_t v7 = [(PXSearchResultsViewModel *)self dataSourceManager];
      v8 = [v7 searchResultsDataSource];
      char v9 = [v8 isTopAssetsSection:v6];

      return v9;
    }
  }
  else
  {
    unint64_t v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218240;
      int64_t v13 = a3;
      __int16 v14 = 2048;
      unint64_t v15 = [(PXSearchResultsViewModel *)self configurationType];
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Results View Model: Requested section is top assets for invalid section: %lu, for config type %lu", (uint8_t *)&v12, 0x16u);
    }
  }
  return 0;
}

- (id)_selectedWordEmbeddingTextAtRow:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  int64_t v4 = [(PXSearchResultsViewModel *)self dataSourceManager];
  int64_t v5 = [v4 searchResultsDataSource];
  int64_t v6 = [v5 selectedWordEmbeddingTextAtIndex:v3];

  return v6;
}

- (BOOL)_resultsAreWordEmbeddingsOnly
{
  int64_t v3 = [(PXSearchResultsViewModel *)self dataSourceManager];
  int64_t v4 = [v3 searchResultsDataSource];
  if ([v4 numberOfSections])
  {
    BOOL v5 = 0;
  }
  else
  {
    int64_t v6 = [(PXSearchResultsViewModel *)self wordEmbeddingSubstitutions];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

- (BOOL)shouldShowTableFooterView
{
  int64_t v3 = [(PXSearchResultsViewModel *)self dataSourceManager];
  int64_t v4 = [v3 searchResultsDataSource];
  uint64_t v5 = [v4 numberOfSections];

  return ([(PXSearchResultsViewModel *)self configurationType] | v5) == 0;
}

- (BOOL)hasNoResults
{
  int64_t v3 = [(PXSearchResultsViewModel *)self dataSourceManager];
  int64_t v4 = [v3 searchResultsDataSource];
  uint64_t v5 = [v4 numberOfSections];

  unint64_t v6 = [(PXSearchResultsViewModel *)self configurationType];
  char v7 = v6 - 1;
  if (v6 - 1 < 2)
  {
    char v7 = ![(PXSearchResultsViewModel *)self hasDisplayableSuggestions];
  }
  else if (v6 == 3)
  {
    char v7 = v5 == 0;
  }
  else if (!v6)
  {
    char v7 = (v5 == 0) & ~[(PXSearchResultsViewModel *)self hasDisplayableSuggestions];
  }
  return v7 & 1;
}

- (id)_sugestionForIndexPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", [v4 section]))
  {
    if ([(PXSearchResultsViewModel *)self configurationType] != 3)
    {
      unint64_t v5 = [v4 row];
      unint64_t v6 = [(PXSearchResultsViewModel *)self suggestions];
      if (v5 >= [v6 count])
      {
        char v7 = 0;
      }
      else
      {
        char v7 = [v6 objectAtIndexedSubscript:v5];
      }

      goto LABEL_11;
    }
  }
  else
  {
    v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      uint64_t v11 = [v4 section];
      __int16 v12 = 2048;
      unint64_t v13 = [(PXSearchResultsViewModel *)self configurationType];
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Results View Model: Requested suggestion for index path for invalid section: %lu, for config type %lu", (uint8_t *)&v10, 0x16u);
    }
  }
  char v7 = 0;
LABEL_11:

  return v7;
}

- (id)suggestionItemForIndexPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", [v4 section]))
  {
    uint64_t v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218240;
      uint64_t v16 = [v4 section];
      __int16 v17 = 2048;
      unint64_t v18 = [(PXSearchResultsViewModel *)self configurationType];
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Results View Model: Requested suggestion item for invalid section: %lu, for config type %lu", (uint8_t *)&v15, 0x16u);
    }

    goto LABEL_11;
  }
  unint64_t v5 = [v4 row];
  if ([v4 section] || -[PXSearchResultsViewModel configurationType](self, "configurationType") == 3) {
    goto LABEL_11;
  }
  if ([(PXSearchResultsViewModel *)self _resultsAreWordEmbeddingsOnly])
  {
    if (v5)
    {
      unint64_t v6 = [(PXSearchResultsViewModel *)self wordEmbeddingSubstitutions];
      unint64_t v7 = [v6 count];

      if (v5 <= v7)
      {
        v8 = [(PXSearchResultsViewModel *)self _selectedWordEmbeddingTextAtRow:v5];
        char v9 = [v8 string];

        int v10 = (void *)[objc_alloc(MEMORY[0x1E4F8ACC8]) initWithText:v9 userCategory:0 matchType:2];
        goto LABEL_12;
      }
    }
    goto LABEL_11;
  }
  unint64_t v13 = [(PXSearchResultsViewModel *)self suggestions];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
LABEL_11:
    int v10 = 0;
    goto LABEL_12;
  }
  int v10 = [(PXSearchResultsViewModel *)self _sugestionForIndexPath:v4];
LABEL_12:

  return v10;
}

- (PXSearchTopAssetsResult)topAssetsSearchResult
{
  int64_t v3 = [(PXSearchResultsViewModel *)self startingSectionNumberForType:1];
  int64_t v4 = [(PXSearchResultsViewModel *)self _adjustedSectionForSection:v3];
  if (v3 < 0)
  {
    v8 = 0;
  }
  else
  {
    unint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v4];
    unint64_t v6 = [(PXSearchResultsViewModel *)self dataSourceManager];
    unint64_t v7 = [v6 searchResultsDataSource];
    v8 = [v7 searchResultAtIndexPath:v5];

    if ([v8 itemType] != 2)
    {

      v8 = 0;
    }
  }
  return (PXSearchTopAssetsResult *)v8;
}

- (BOOL)topAssetsExistForSection:(int64_t)a3
{
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  if ([(PXSearchResultsViewModel *)self configurationType] == 2
    || [(PXSearchResultsViewModel *)self configurationType] == 1)
  {
    return 0;
  }
  unint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:a3];
  unint64_t v6 = [(PXSearchResultsViewModel *)self searchResultAtIndexPath:v5];
  unint64_t v7 = v6;
  BOOL v11 = 0;
  if (v6)
  {
    v8 = [v6 itemType] == 2 ? v7 : 0;
    char v9 = [v8 assetUUIDs];
    uint64_t v10 = [v9 count];

    if (v10) {
      BOOL v11 = 1;
    }
  }

  return v11;
}

- (double)numberOfTopAssetRows
{
  int64_t v3 = [(PXSearchResultsViewModel *)self topAssetsSearchResult];
  uint64_t v4 = [v3 topAssetsFetchResult];
  uint64_t v5 = [(id)v4 count];

  unint64_t v6 = [(PXSearchResultsViewModel *)self delegate];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    unint64_t v7 = [(PXSearchResultsViewModel *)self delegate];
    uint64_t v8 = [v7 maximumNumberOfThumbnailsPerRow];
  }
  else
  {
    uint64_t v8 = 0;
  }
  double result = 1.0;
  if (v5 > v8) {
    return 2.0;
  }
  return result;
}

- (double)calculatedRowHeightForTopAssets
{
  int64_t v3 = [(PXSearchResultsViewModel *)self delegate];
  [v3 imageViewSize];
  double v5 = v4;

  [(PXSearchResultsViewModel *)self numberOfTopAssetRows];
  return v5 * v6;
}

- (double)heightForRowType:(unint64_t)a3 info:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = v7;
  switch(a3)
  {
    case 0uLL:
      char v9 = [v7 objectForKeyedSubscript:@"PXSearchResultsViewModelHeightInfoText"];
      __int16 v12 = [v8 objectForKeyedSubscript:@"PXSearchResultsViewModelHeightInfoTextSize"];
      [v12 CGSizeValue];
      double v14 = v13;
      [v12 CGSizeValue];
      double v16 = v15;
      uint64_t v22 = *MEMORY[0x1E4FB06F8];
      __int16 v17 = [v8 objectForKeyedSubscript:@"PXSearchResultsViewModelHeightInfoTextFont"];
      v23[0] = v17;
      unint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 3, v18, 0, v14, v16);
      double v20 = v19;

      double v4 = v20 + 1.0 + 6.0;
      goto LABEL_9;
    case 1uLL:
    case 2uLL:
      char v9 = [v7 objectForKeyedSubscript:@"PXSearchResultsViewModelHeightInfoShouldUseAccessibilityLayout"];
      if ([v9 BOOLValue])
      {
        +[PXSearchDisplayUtility automaticRowHeight];
        double v4 = v10;
      }
      else
      {
        double v4 = 50.0;
      }
LABEL_9:

      break;
    case 3uLL:
      [(PXSearchResultsViewModel *)self calculatedRowHeightForTopAssets];
      goto LABEL_7;
    case 4uLL:
    case 5uLL:
      +[PXSearchDisplayUtility automaticRowHeight];
LABEL_7:
      double v4 = v11;
      break;
    default:
      break;
  }

  return v4;
}

- (id)wordEmbeddingForIndexPath:(id)a3
{
  id v4 = a3;
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", [v4 section])) {
    PXAssertGetLog();
  }
  if ([v4 section]
    || ![(PXSearchResultsViewModel *)self _resultsAreWordEmbeddingsOnly]
    || [(PXSearchResultsViewModel *)self configurationType] == 3
    || (uint64_t v5 = [v4 row]) == 0
    || (unint64_t v6 = v5,
        [(PXSearchResultsViewModel *)self wordEmbeddingSubstitutions],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v6 > v8))
  {
    double v10 = 0;
  }
  else
  {
    char v9 = [(PXSearchResultsViewModel *)self wordEmbeddingSubstitutions];
    double v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "row") - 1);
  }
  return v10;
}

- (BOOL)shouldDisplayHeaderViewForSection:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  if ([(PXSearchResultsViewModel *)self hasNoResults]) {
    return 0;
  }
  unint64_t v5 = [(PXSearchResultsViewModel *)self configurationType];
  if (v5) {
    return v5 == 3;
  }
  BOOL v7 = ![(PXSearchResultsViewModel *)self hasDisplayableSuggestions];
  return a3 > 0 || v7;
}

- (id)titleForHeaderButtonInSection:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  if ([(PXSearchResultsViewModel *)self sectionIsExpandable:a3])
  {
    if ([(PXSearchResultsViewModel *)self sectionIsExpanded:a3]) {
      unint64_t v5 = @"SEARCH_RESULTS_SECTION_SEE_LESS_BUTTON";
    }
    else {
      unint64_t v5 = @"SEARCH_RESULTS_SECTION_SEE_ALL_BUTTON";
    }
    goto LABEL_9;
  }
  if ([(PXSearchResultsViewModel *)self sectionTypeForSection:a3] == 1)
  {
    unint64_t v5 = @"SEARCH_RESULTS_SECTION_SEE_ALL_BUTTON";
LABEL_9:
    unint64_t v6 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
    goto LABEL_11;
  }
  unint64_t v6 = 0;
LABEL_11:
  return v6;
}

- (id)titleForHeaderInSection:(int64_t)a3 accessibilityIdentifier:(id *)a4
{
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  int64_t v7 = [(PXSearchResultsViewModel *)self _adjustedSectionForSection:a3];
  if (v7 < 0)
  {
    double v11 = 0;
  }
  else
  {
    int64_t v8 = v7;
    char v9 = [(PXSearchResultsViewModel *)self dataSourceManager];
    double v10 = [v9 searchResultsDataSource];
    double v11 = [v10 titleForHeaderInSection:v8 accessibilityIdentifier:a4];
  }
  return v11;
}

- (id)allSearchResultsForSection:(int64_t)a3
{
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  if ([(PXSearchResultsViewModel *)self sectionTypeForSection:a3] == 2)
  {
    unint64_t v5 = [(PXSearchResultsViewModel *)self dataSourceManager];
    unint64_t v6 = [v5 searchResultsDataSource];
    int64_t v7 = [v6 allSearchResultsForSection:a3];
  }
  else
  {
    int64_t v7 = 0;
  }
  return v7;
}

- (int64_t)numberOfSearchResultsInSection:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  int64_t v5 = [(PXSearchResultsViewModel *)self _adjustedSectionForSection:a3];
  if (v5 < 0) {
    return 0;
  }
  int64_t v6 = v5;
  int64_t v7 = [(PXSearchResultsViewModel *)self dataSourceManager];
  int64_t v8 = [v7 searchResultsDataSource];
  int64_t v9 = [v8 numberOfSearchResultsInSection:v6];

  return v9;
}

- (int64_t)numberOfVisibleSearchResultsInSection:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  int64_t v5 = [(PXSearchResultsViewModel *)self _adjustedSectionForSection:a3];
  if (v5 < 0) {
    return 0;
  }
  int64_t v6 = v5;
  int64_t v7 = [(PXSearchResultsViewModel *)self dataSourceManager];
  int64_t v8 = [v7 searchResultsDataSource];
  int64_t v9 = [v8 numberOfVisibleSearchResultsInSection:v6];

  return v9;
}

- (id)topAssetAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", [v4 section])) {
    PXAssertGetLog();
  }
  int64_t v5 = [(PXSearchResultsViewModel *)self _adjustedIndexPathForIndexPath:v4];
  if (-[PXSearchResultsViewModel sectionTypeForSection:](self, "sectionTypeForSection:", [v5 section]) == 1)
  {
    int64_t v6 = [(PXSearchResultsViewModel *)self topAssetsSearchResult];
    int64_t v7 = [v6 topAssetsFetchResult];

    unint64_t v8 = [v4 row];
    if (v8 >= [v7 count])
    {
      int64_t v9 = 0;
    }
    else
    {
      int64_t v9 = [v7 objectAtIndex:v8];
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)searchResultAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", [v4 section])) {
    PXAssertGetLog();
  }
  int64_t v5 = [(PXSearchResultsViewModel *)self _adjustedIndexPathForIndexPath:v4];
  if (v5)
  {
    int64_t v6 = [(PXSearchResultsViewModel *)self dataSourceManager];
    int64_t v7 = [v6 searchResultsDataSource];
    unint64_t v8 = [v7 searchResultAtIndexPath:v5];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)sectionIsExpanded:(int64_t)a3
{
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  int64_t v5 = [(PXSearchResultsViewModel *)self _adjustedSectionForSection:a3];
  if (v5 < 0) {
    return 0;
  }
  int64_t v6 = v5;
  int64_t v7 = [(PXSearchResultsViewModel *)self dataSourceManager];
  unint64_t v8 = [v7 searchResultsDataSource];
  LOBYTE(v6) = [v8 isSectionExpanded:v6];

  return v6;
}

- (BOOL)sectionIsExpandable:(int64_t)a3
{
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  int64_t v5 = [(PXSearchResultsViewModel *)self _adjustedSectionForSection:a3];
  if (v5 < 0) {
    return 0;
  }
  int64_t v6 = v5;
  int64_t v7 = [(PXSearchResultsViewModel *)self dataSourceManager];
  unint64_t v8 = [v7 searchResultsDataSource];
  LOBYTE(v6) = [v8 isSectionExpandable:v6];

  return v6;
}

- (id)collapseSection:(int64_t)a3
{
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  unint64_t v5 = [(PXSearchResultsViewModel *)self numberOfVisibleSearchResultsInSection:a3];
  int64_t v6 = [(PXSearchResultsViewModel *)self _adjustedSectionForSection:a3];
  if ((v6 & 0x8000000000000000) == 0)
  {
    int64_t v7 = v6;
    unint64_t v8 = [(PXSearchResultsViewModel *)self dataSourceManager];
    int64_t v9 = [v8 searchResultsDataSource];
    [v9 collapseSection:v7];
  }
  double v10 = objc_opt_new();
  unint64_t v11 = [(PXSearchResultsViewModel *)self numberOfVisibleSearchResultsInSection:a3];
  if (v11 < v5)
  {
    unint64_t v12 = v11;
    do
    {
      double v13 = [MEMORY[0x1E4F28D58] indexPathForRow:v12 inSection:a3];
      [v10 addObject:v13];

      ++v12;
    }
    while (v5 != v12);
  }
  double v14 = (void *)[v10 copy];

  return v14;
}

- (id)expandSection:(int64_t)a3
{
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  unint64_t v5 = [(PXSearchResultsViewModel *)self numberOfVisibleSearchResultsInSection:a3];
  int64_t v6 = [(PXSearchResultsViewModel *)self _adjustedSectionForSection:a3];
  if ((v6 & 0x8000000000000000) == 0)
  {
    int64_t v7 = v6;
    unint64_t v8 = [(PXSearchResultsViewModel *)self dataSourceManager];
    int64_t v9 = [v8 searchResultsDataSource];
    [v9 expandSection:v7];
  }
  double v10 = objc_opt_new();
  unint64_t v11 = [(PXSearchResultsViewModel *)self numberOfVisibleSearchResultsInSection:a3];
  if (v5 < v11)
  {
    unint64_t v12 = v11;
    do
    {
      double v13 = [MEMORY[0x1E4F28D58] indexPathForRow:v5 inSection:a3];
      [v10 addObject:v13];

      ++v5;
    }
    while (v12 != v5);
  }
  double v14 = (void *)[v10 copy];

  return v14;
}

- (BOOL)hasDisplayableSuggestions
{
  return [(PXSearchResultsViewModel *)self _displayableSuggestionCount] != 0;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  unint64_t v5 = [(PXSearchResultsViewModel *)self sectionTypeForSection:a3];
  int64_t v6 = [(PXSearchResultsViewModel *)self _displayableSuggestionCount];
  unint64_t v7 = [(PXSearchResultsViewModel *)self configurationType];
  if (v7)
  {
    if (v7 != 3)
    {
      if (v7 != 1) {
        return v6;
      }
      goto LABEL_10;
    }
    if (v5 != 3) {
      goto LABEL_13;
    }
    return 0;
  }
  if (v5 == 3) {
    return 0;
  }
  if (!v5)
  {
LABEL_10:
    v6 += [(PXSearchResultsViewModel *)self _resultsAreWordEmbeddingsOnly];
    return v6;
  }
LABEL_13:
  return [(PXSearchResultsViewModel *)self numberOfVisibleSearchResultsInSection:a3];
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  v2 = [(PXSearchResultsViewModel *)self dataSourceManager];
  int64_t v3 = [v2 searchResultsDataSource];
  id v4 = [v3 searchQueryMatchInfo];

  return (PXSearchQueryMatchInfo *)v4;
}

- (int64_t)numberOfSections
{
  int64_t v3 = [(PXSearchResultsViewModel *)self dataSourceManager];
  id v4 = [v3 searchResultsDataSource];
  int64_t v5 = [v4 numberOfSections];

  unint64_t v6 = [(PXSearchResultsViewModel *)self configurationType];
  if (v6 - 1 < 2) {
    return [(PXSearchResultsViewModel *)self hasDisplayableSuggestions];
  }
  if (!v6) {
    v5 += [(PXSearchResultsViewModel *)self hasDisplayableSuggestions];
  }
  return v5;
}

- (id)thumbnailAssetsForResultIndexPaths:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (-[PXSearchResultsViewModel sectionTypeForSection:](self, "sectionTypeForSection:", objc_msgSend(v11, "section", (void)v17)) != 1)
        {
          unint64_t v12 = [(PXSearchResultsViewModel *)self searchResultAtIndexPath:v11];
          double v13 = [v12 assets];
          double v14 = [v13 firstObject];

          if (v14) {
            [v5 addObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  double v15 = (void *)[v5 copy];
  return v15;
}

- (void)searchResultDataForIndexPath:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *, void *, void *, void *, void *, uint64_t))a4;
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", [v6 section])) {
    PXAssertGetLog();
  }
  uint64_t v8 = [(PXSearchResultsViewModel *)self searchResultAtIndexPath:v6];
  uint64_t v9 = +[PXSearchResultsDataUtility titleForSearchResult:v8];
  double v10 = +[PXSearchResultsDataUtility subtitleForSearchResult:v8];
  uint64_t v11 = [v8 approximateCount];
  unint64_t v12 = PLSharedCountFormatter();
  double v13 = [NSNumber numberWithUnsignedInteger:v11];
  double v14 = [v12 stringFromNumber:v13];

  double v15 = [v8 assetUUIDs];
  double v16 = [v15 firstObject];

  long long v17 = [v8 assets];
  long long v18 = [v17 firstObject];

  long long v19 = [v8 person];
  v7[2](v7, v9, v10, v14, v18, v16, v19, [v8 approximateCount]);
}

- (int64_t)startingSectionNumberForType:(unint64_t)a3
{
  if ([(PXSearchResultsViewModel *)self hasNoResults]) {
    return -1;
  }
  if (a3 == 2)
  {
    if ([(PXSearchResultsViewModel *)self _resultsAreWordEmbeddingsOnly]
      || [(PXSearchResultsViewModel *)self configurationType] == 2
      || [(PXSearchResultsViewModel *)self configurationType] == 1)
    {
      return -1;
    }
    if ([(PXSearchResultsViewModel *)self hasDisplayableSuggestions]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else
  {
    if (a3 != 1)
    {
      if (!a3 && [(PXSearchResultsViewModel *)self configurationType] != 3) {
        return [(PXSearchResultsViewModel *)self hasDisplayableSuggestions] - 1;
      }
      return -1;
    }
    if ([(PXSearchResultsViewModel *)self _resultsAreWordEmbeddingsOnly]
      || [(PXSearchResultsViewModel *)self configurationType] == 2
      || [(PXSearchResultsViewModel *)self configurationType] == 1)
    {
      return -1;
    }
    return [(PXSearchResultsViewModel *)self hasDisplayableSuggestions];
  }
}

- (unint64_t)rowTypeForIndexPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", [v4 section])) {
    PXAssertGetLog();
  }
  unint64_t v5 = -[PXSearchResultsViewModel sectionTypeForSection:](self, "sectionTypeForSection:", [v4 section]);
  if (v5 == 3)
  {
    unint64_t v6 = 5;
  }
  else if (v5 == 2)
  {
    unint64_t v6 = 4;
  }
  else if (v5)
  {
    unint64_t v6 = 3;
  }
  else if ([(PXSearchResultsViewModel *)self _resultsAreWordEmbeddingsOnly])
  {
    unint64_t v6 = [v4 row] != 0;
  }
  else
  {
    unint64_t v6 = 2;
  }

  return v6;
}

- (unint64_t)sectionTypeForSection:(int64_t)a3
{
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:")) {
    PXAssertGetLog();
  }
  if ([(PXSearchResultsViewModel *)self hasNoResults]) {
    return 3;
  }
  unint64_t v5 = [(PXSearchResultsViewModel *)self configurationType];
  if (!v5)
  {
    BOOL v7 = [(PXSearchResultsViewModel *)self hasDisplayableSuggestions];
    if (a3 || !v7) {
      goto LABEL_5;
    }
    return 0;
  }
  if (v5 != 3) {
    return 0;
  }
LABEL_5:
  if ([(PXSearchResultsViewModel *)self _sectionIsTopAssetsSection:a3]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)fetchImageForPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v11 = a6;
  unint64_t v12 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v10, width, height, a5);
  double v13 = +[PXPeopleFaceCropManager sharedManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__PXSearchResultsViewModel_fetchImageForPerson_targetSize_displayScale_completion___block_invoke;
  v16[3] = &unk_1E5DCE7D0;
  id v17 = v10;
  id v18 = v11;
  id v14 = v10;
  id v15 = v11;
  [v13 requestFaceCropForOptions:v12 resultHandler:v16];
}

void __83__PXSearchResultsViewModel_fetchImageForPerson_targetSize_displayScale_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    [a3 objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
    [(id)objc_claimAutoreleasedReturnValue() CGRectValue];
    *(id *)(a1 + 40);
    v5;
    px_dispatch_on_main_queue();
  }
  unint64_t v6 = [a3 objectForKeyedSubscript:@"PXPeopleErrorKey"];
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
  BOOL v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v10 = "-[PXSearchResultsViewModel fetchImageForPerson:targetSize:displayScale:completion:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "%s failed to get face tile for person %@, error: %@", buf, 0x20u);
  }
}

uint64_t __83__PXSearchResultsViewModel_fetchImageForPerson_targetSize_displayScale_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (PXSearchResultsViewModel)initWithSearchSectionedDataSource:(id)a3 configurationType:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSearchResultsViewModel;
  BOOL v7 = [(PXSearchResultsViewModel *)&v10 init];
  if (v7)
  {
    uint64_t v8 = [[PXSearchResultsSectionedDataSourceManager alloc] initWithSearchSectionedDataSource:v6];
    [(PXSearchResultsViewModel *)v7 setDataSourceManager:v8];

    [(PXSearchResultsViewModel *)v7 setConfigurationType:a4];
  }

  return v7;
}

- (PXSearchResultsViewModel)initWithSectionedDataSourceManager:(id)a3 configurationType:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSearchResultsViewModel;
  BOOL v7 = [(PXSearchResultsViewModel *)&v10 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(PXSearchResultsViewModel *)v7 setDataSourceManager:v6];
    [(PXSearchResultsViewModel *)v8 setConfigurationType:a4];
  }

  return v8;
}

@end