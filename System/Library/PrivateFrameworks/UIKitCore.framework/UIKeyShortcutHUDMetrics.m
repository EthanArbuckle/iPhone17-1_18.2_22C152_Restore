@interface UIKeyShortcutHUDMetrics
+ (UIKeyShortcutHUDMetrics)currentMetrics;
+ (void)setCurrentMetrics:(id)a3;
- (BOOL)areShortcutAndAlternateColumnWidthsCombined;
- (BOOL)isHUDShrunkToFitHorizontally;
- (BOOL)isSearching;
- (BOOL)shouldAlignShortcutModifiersAndInputInColumn;
- (BOOL)shouldDisplayEscShortcutAlternative;
- (BOOL)shouldDisplayGlobeModiferAsGlobeSymbol;
- (BOOL)shouldExtendToolbarThroughSafeArea;
- (BOOL)shouldMirrorShortcutInputs;
- (BOOL)toolbarStylesCategoriesAsPageControl;
- (NSDictionary)platterSeparatedOptions;
- (NSMapTable)shortcutCellIndexPathsMap;
- (NSMapTable)shortcutCellMetricsMap;
- (NSMutableArray)displayedMenuCategoryOffsets;
- (NSMutableArray)displayedMenuColumnMetrics;
- (UIColor)menuSeparatorColor;
- (UIColor)platterStrokeColor;
- (UIColor)searchHUDTextColor;
- (UIColor)shortcutSubtitleTextColor;
- (UIColor)standardHUDTextColor;
- (UIColor)toolbarSeparatorColor;
- (UIFont)cancelButtonFont;
- (UIFont)categoryHeaderFont;
- (UIFont)keyShortcutInputCharacterFont;
- (UIFont)shortcutSubtitleFont;
- (UIFont)standardHUDFont;
- (UIFont)toolbarCategoryVisibleFont;
- (UITraitCollection)traitCollection;
- (UIView)selfSizingPlayground;
- (UIVisualEffect)menuSeparatorVisualEffect;
- (UIVisualEffect)platterVisualEffect;
- (UIVisualEffect)toolbarSeparatorVisualEffect;
- (_UIKeyShortcutHUDClientTraits)clientTraits;
- (_UIKeyShortcutHUDMenu)baseMenu;
- (_UIKeyShortcutHUDMenu)displayedMenu;
- (_UIKeyShortcutHUDShortcutCell)selfSizingShortcutCell;
- (_UIKeyShortcutHUDShortcutColumnMetrics)displayedSearchColumnMetrics;
- (_UIKeyShortcutHUDToolbarCategoryCell)selfSizingToolbarCategoryCell;
- (_UIKeyShortcutHUDToolbarSearchCell)selfSizingSearchCell;
- (double)_computedWidthForCategoryAtIndex:(unint64_t)a3;
- (double)_shortcutWidthAdjustmentForMetrics:(id)a3 shortcutWidth:(double)a4;
- (double)_toolbarContentToWindowBottomEdgeSpacing;
- (double)_toolbarDistanceFromBottomOfWindow;
- (double)_toolbarHeight;
- (double)availableVerticalSpace;
- (double)categoryHeaderVerticalTextAdjustment;
- (double)cellFlashDuration;
- (double)cellWidthForShortcut:(id)a3;
- (double)computedHUDWidthForBaseMenu;
- (double)contentSizeScaledMetric:(double)a3;
- (double)displayedMenuContentWidth;
- (double)headerWidthForCategory:(id)a3;
- (double)hiddenMenuPanelHeight;
- (double)horizontalOffsetForCategoryAtIndex:(unint64_t)a3;
- (double)inputWidthForShortcut:(id)a3;
- (double)maxShortcutCellWidth;
- (double)menuCellCornerRadius;
- (double)menuCellHeight;
- (double)menuCellHorizontalContentMargin;
- (double)menuColumnSpacing;
- (double)menuHorizontalContentInset;
- (double)menuPlatterCornerRadius;
- (double)menuTopContentInset;
- (double)minShortcutCellWidth;
- (double)minShortcutNameKeyCombinationSpacing;
- (double)minimumBottomScreenEdgeDistance;
- (double)minimumScreenEdgeDistance;
- (double)modifiersWidthForShortcut:(id)a3;
- (double)platterShadowOpacity;
- (double)platterShadowRadius;
- (double)platterZPosition;
- (double)searchButtonWidth;
- (double)searchModeMaximumMenuPanelHeight;
- (double)searchModeMenuBaseVerticalContentInset;
- (double)searchModeMenuTopContentInset;
- (double)searchModePreferredMenuPanelHeight;
- (double)searchModePreferredMenuPanelWidth;
- (double)searchModeStandardHUDWidth;
- (double)separatorWidth;
- (double)shortcutTitleToSubtitleVerticalPadding;
- (double)standardHUDWidth;
- (double)standardMenuPadding;
- (double)standardMenuPanelHeight;
- (double)standardMenuToolbarSpacing;
- (double)standardPlatterStrokeWidth;
- (double)standardShortcutInputReservedWidth;
- (double)standardShortcutModifierInputMinimumSpacing;
- (double)standardToolbarContentHeight;
- (double)toolbarCellCornerRadius;
- (double)toolbarContentInset;
- (double)toolbarPlatterCornerRadius;
- (double)toolbarSeparatorVerticalMargin;
- (double)widestToolbarCategoryCellWidth;
- (int64_t)hudBlurStyle;
- (unint64_t)baseNumberOfVisibleColumns;
- (unint64_t)categoryIndexAtHorizontalOffset:(double)a3;
- (unint64_t)contentSizeAdjustedMaxNumberOfCellsPerColumn;
- (unint64_t)maxNumberOfCellsInSearchResults;
- (unint64_t)maxNumberOfCellsPerColumn;
- (unint64_t)menuPanelCornerMask;
- (unint64_t)numCellsPerColumn;
- (unint64_t)toolbarPanelCornerMask;
- (void)_computeAndStoreCellMetricsForShortcut:(id)a3 indexPath:(id)a4;
- (void)_setDisplayedMenu:(id)a3 searching:(BOOL)a4 combinedShortcutAndAlternateColumnWidths:(BOOL)a5;
- (void)_updateBaseMenuMetrics;
- (void)_updateDisplayedMenuMetrics;
- (void)_updateDisplayedSearchMenuMetrics;
- (void)_updateDisplayedStandardMenuMetrics;
- (void)computeOneTimeMetrics;
- (void)setAvailableVerticalSpace:(double)a3;
- (void)setBaseMenu:(id)a3;
- (void)setClientTraits:(id)a3;
- (void)setComputedHUDWidthForBaseMenu:(double)a3;
- (void)setDisplayedMenu:(id)a3 searching:(BOOL)a4;
- (void)setDisplayedMenuCategoryOffsets:(id)a3;
- (void)setDisplayedMenuColumnMetrics:(id)a3;
- (void)setDisplayedSearchColumnMetrics:(id)a3;
- (void)setSelfSizingPlayground:(id)a3;
- (void)setShortcutCellIndexPathsMap:(id)a3;
- (void)setShortcutCellMetricsMap:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation UIKeyShortcutHUDMetrics

- (_UIKeyShortcutHUDShortcutCell)selfSizingShortcutCell
{
  selfSizingShortcutCell = self->_selfSizingShortcutCell;
  if (!selfSizingShortcutCell)
  {
    v5 = [(UIKeyShortcutHUDMetrics *)self selfSizingPlayground];

    if (!v5)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"UIKeyShortcutHUDMetrics.m" lineNumber:126 description:@"Fatal: attempted to create the self-sizing shortcut cell in the HUD metrics without a self-sizing playground!"];
    }
    v6 = [_UIKeyShortcutHUDShortcutCell alloc];
    [(UIKeyShortcutHUDMetrics *)self menuCellHeight];
    v8 = -[_UIKeyShortcutHUDShortcutCell initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, 0.0, v7);
    v9 = self->_selfSizingShortcutCell;
    self->_selfSizingShortcutCell = v8;

    v10 = [(UIKeyShortcutHUDMetrics *)self selfSizingPlayground];
    [v10 addSubview:self->_selfSizingShortcutCell];

    selfSizingShortcutCell = self->_selfSizingShortcutCell;
  }
  return selfSizingShortcutCell;
}

- (_UIKeyShortcutHUDToolbarSearchCell)selfSizingSearchCell
{
  selfSizingSearchCell = self->_selfSizingSearchCell;
  if (!selfSizingSearchCell)
  {
    v5 = [(UIKeyShortcutHUDMetrics *)self selfSizingPlayground];

    if (!v5)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"UIKeyShortcutHUDMetrics.m" lineNumber:136 description:@"Fatal: attempted to create the self-sizing search cell in the HUD metrics without a self-sizing playground!"];
    }
    v6 = [_UIKeyShortcutHUDToolbarSearchCell alloc];
    [(UIKeyShortcutHUDMetrics *)self menuCellHeight];
    v8 = -[_UIKeyShortcutHUDToolbarSearchCell initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, 0.0, v7);
    v9 = self->_selfSizingSearchCell;
    self->_selfSizingSearchCell = v8;

    v10 = [(UIKeyShortcutHUDMetrics *)self selfSizingPlayground];
    [v10 addSubview:self->_selfSizingSearchCell];

    selfSizingSearchCell = self->_selfSizingSearchCell;
  }
  return selfSizingSearchCell;
}

- (_UIKeyShortcutHUDToolbarCategoryCell)selfSizingToolbarCategoryCell
{
  selfSizingToolbarCategoryCell = self->_selfSizingToolbarCategoryCell;
  if (!selfSizingToolbarCategoryCell)
  {
    v5 = [(UIKeyShortcutHUDMetrics *)self selfSizingPlayground];

    if (!v5)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"UIKeyShortcutHUDMetrics.m" lineNumber:146 description:@"Fatal: attempted to create the self-sizing toolbar category cell in the HUD metrics without a self-sizing playground!"];
    }
    v6 = [_UIKeyShortcutHUDToolbarCategoryCell alloc];
    [(UIKeyShortcutHUDMetrics *)self menuCellHeight];
    v8 = -[_UIKeyShortcutHUDCell initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, 0.0, v7);
    v9 = self->_selfSizingToolbarCategoryCell;
    self->_selfSizingToolbarCategoryCell = v8;

    v10 = [(UIKeyShortcutHUDMetrics *)self selfSizingPlayground];
    [v10 addSubview:self->_selfSizingToolbarCategoryCell];

    selfSizingToolbarCategoryCell = self->_selfSizingToolbarCategoryCell;
  }
  return selfSizingToolbarCategoryCell;
}

- (void)setBaseMenu:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseMenu);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_baseMenu, obj);
    [(UIKeyShortcutHUDMetrics *)self _updateBaseMenuMetrics];
    v5 = obj;
  }
}

- (void)setDisplayedMenu:(id)a3 searching:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(UIKeyShortcutHUDMetrics *)self _setDisplayedMenu:v6 searching:v4 combinedShortcutAndAlternateColumnWidths:[(UIKeyShortcutHUDMetrics *)self isHUDShrunkToFitHorizontally]];
}

- (void)_setDisplayedMenu:(id)a3 searching:(BOOL)a4 combinedShortcutAndAlternateColumnWidths:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v9 = (_UIKeyShortcutHUDMenu *)a3;
  if (self->_displayedMenu != v9 || self->_searching != v6 || self->_combinedShortcutAndAlternateColumnWidths != v5)
  {
    v10 = v9;
    objc_storeStrong((id *)&self->_displayedMenu, a3);
    self->_searching = v6;
    self->_combinedShortcutAndAlternateColumnWidths = v5;
    [(UIKeyShortcutHUDMetrics *)self _updateDisplayedMenuMetrics];
    v9 = v10;
  }
}

- (void)computeOneTimeMetrics
{
  p_clientTraits = &self->_clientTraits;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientTraits);
  if ([WeakRetained hasArabicHardwareKeyboard])
  {
    id v5 = objc_loadWeakRetained((id *)p_clientTraits);
    self->_shouldMirrorShortcutInputs = [v5 layoutDirection] == 1;
  }
  else
  {
    self->_shouldMirrorShortcutInputs = 0;
  }

  self->_shouldDisplayEscShortcutAlternative = 1;
  id v6 = objc_loadWeakRetained((id *)p_clientTraits);
  self->_shouldDisplayGlobeModiferAsGlobeSymbol = [v6 globeKeyLabelHasGlobeSymbol];
}

- (void)_updateBaseMenuMetrics
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(UIKeyShortcutHUDMetrics *)self selfSizingPlayground];

  if (!v4)
  {
    v78 = [MEMORY[0x1E4F28B00] currentHandler];
    [v78 handleFailureInMethod:a2 object:self file:@"UIKeyShortcutHUDMetrics.m" lineNumber:202 description:@"Fatal: attempted to compute base menu metrics for the HUD without a self-sizing playground!"];
  }
  id v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  shortcutCellMetricsMap = self->_shortcutCellMetricsMap;
  self->_shortcutCellMetricsMap = v5;

  double v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  shortcutCellIndexPathsMap = self->_shortcutCellIndexPathsMap;
  self->_shortcutCellIndexPathsMap = v7;

  p_baseMenu = &self->_baseMenu;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseMenu);
  v11 = [WeakRetained children];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      id v14 = objc_loadWeakRetained((id *)p_baseMenu);
      v15 = [v14 children];
      v16 = [v15 objectAtIndexedSubscript:v13];

      v17 = [v16 children];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        unint64_t v19 = 0;
        do
        {
          v20 = [v16 children];
          v21 = [v20 objectAtIndexedSubscript:v19];

          v22 = [MEMORY[0x1E4F28D58] indexPathForItem:v19 inSection:v13];
          [(UIKeyShortcutHUDMetrics *)self _computeAndStoreCellMetricsForShortcut:v21 indexPath:v22];
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          v23 = [v21 shortcutAlternates];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v87 objects:v101 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v88;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v88 != v26) {
                  objc_enumerationMutation(v23);
                }
                [(UIKeyShortcutHUDMetrics *)self _computeAndStoreCellMetricsForShortcut:*(void *)(*((void *)&v87 + 1) + 8 * i) indexPath:v22];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v87 objects:v101 count:16];
            }
            while (v25);
          }

          ++v19;
          v28 = [v16 children];
          unint64_t v29 = [v28 count];
        }
        while (v19 < v29);
      }

      ++v13;
      p_baseMenu = &self->_baseMenu;
      id v30 = objc_loadWeakRetained((id *)&self->_baseMenu);
      v31 = [v30 children];
      unint64_t v32 = [v31 count];
    }
    while (v13 < v32);
  }
  self->_double numCellsPerColumn = 0;
  double v33 = COERCE_DOUBLE([(UIKeyShortcutHUDMetrics *)self contentSizeAdjustedMaxNumberOfCellsPerColumn]);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v34 = objc_loadWeakRetained((id *)p_baseMenu);
  v35 = [v34 children];

  uint64_t v36 = [v35 countByEnumeratingWithState:&v83 objects:v100 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v84 != v38) {
          objc_enumerationMutation(v35);
        }
        double numCellsPerColumn = (double)self->_numCellsPerColumn;
        v41 = [*(id *)(*((void *)&v83 + 1) + 8 * j) children];
        self->_double numCellsPerColumn = (unint64_t)fmax(numCellsPerColumn, fmin((double)(unint64_t)[v41 count], (double)*(unint64_t *)&v33));
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v83 objects:v100 count:16];
    }
    while (v37);
  }

  v42 = _UIKeyShortcutHUDLog();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v43 = self->_numCellsPerColumn;
    *(_DWORD *)buf = 134349312;
    unint64_t v93 = v43;
    __int16 v94 = 2050;
    double v95 = v33;
    _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_DEFAULT, "HUD metrics: computed double numCellsPerColumn = %{public}lu before accounting for available vertical space, with max possible cells = %{public}lu", buf, 0x16u);
  }

  [(UIKeyShortcutHUDMetrics *)self availableVerticalSpace];
  double v45 = v44;
  [(UIKeyShortcutHUDMetrics *)self _toolbarDistanceFromBottomOfWindow];
  double v47 = v45 - v46;
  [(UIKeyShortcutHUDMetrics *)self _toolbarHeight];
  double v49 = v47 - v48;
  [(UIKeyShortcutHUDMetrics *)self standardMenuToolbarSpacing];
  double v51 = v49 - v50;
  [(UIKeyShortcutHUDMetrics *)self minimumScreenEdgeDistance];
  double v53 = v51 - v52;
  [(UIKeyShortcutHUDMetrics *)self standardMenuPanelHeight];
  double v55 = v54;
  if (v54 > v53)
  {
    [(UIKeyShortcutHUDMetrics *)self menuCellHeight];
    unint64_t v57 = vcvtpd_u64_f64((v55 - v53) / v56);
    unint64_t v58 = self->_numCellsPerColumn;
    if (v58 - 1 < v57) {
      unint64_t v57 = v58 - 1;
    }
    self->_double numCellsPerColumn = v58 - v57;
  }
  v59 = _UIKeyShortcutHUDLog();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v60 = self->_numCellsPerColumn;
    [(UIKeyShortcutHUDMetrics *)self availableVerticalSpace];
    *(float *)&double v61 = v61;
    float v62 = v53;
    *(_DWORD *)buf = 134349824;
    unint64_t v93 = v60;
    float v63 = v55;
    __int16 v94 = 2050;
    double v95 = *(float *)&v61;
    __int16 v96 = 2050;
    double v97 = v62;
    __int16 v98 = 2050;
    double v99 = v63;
    _os_log_impl(&dword_1853B0000, v59, OS_LOG_TYPE_DEFAULT, "HUD metrics: computed double numCellsPerColumn = %{public}lu after accounting for available vertical space; availableSpac"
      "e = %{public}.2f, availableMenuPanelVerticalSpace = %{public}.2f, idealMenuHeight = %{public}.2f",
      buf,
      0x2Au);
  }

  unint64_t v64 = self->_numCellsPerColumn;
  if (v64 <= 1) {
    unint64_t v64 = 1;
  }
  self->_double numCellsPerColumn = v64;
  id v65 = objc_loadWeakRetained((id *)p_baseMenu);
  [(UIKeyShortcutHUDMetrics *)self _setDisplayedMenu:v65 searching:0 combinedShortcutAndAlternateColumnWidths:1];

  self->_computedHUDWidthForBaseMenu = self->_displayedMenuContentWidth;
  v66 = [(UIKeyShortcutHUDMetrics *)self selfSizingSearchCell];
  [v66 layoutIfNeeded];
  objc_msgSend(v66, "systemLayoutSizeFittingSize:", 0.0, 0.0);
  self->_searchButtonWidth = v67;
  [(UIKeyShortcutHUDMetrics *)self toolbarContentInset];
  self->_searchButtonWidth = v68 + self->_searchButtonWidth;
  self->_double widestToolbarCategoryCellWidth = 0.0;
  v69 = [(UIKeyShortcutHUDMetrics *)self selfSizingToolbarCategoryCell];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v70 = objc_loadWeakRetained((id *)p_baseMenu);
  v71 = [v70 children];

  uint64_t v72 = [v71 countByEnumeratingWithState:&v79 objects:v91 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v80;
    do
    {
      for (uint64_t k = 0; k != v73; ++k)
      {
        if (*(void *)v80 != v74) {
          objc_enumerationMutation(v71);
        }
        [v69 configureForMetricsCalculationsWithCategory:*(void *)(*((void *)&v79 + 1) + 8 * k)];
        [v69 layoutIfNeeded];
        double widestToolbarCategoryCellWidth = self->_widestToolbarCategoryCellWidth;
        objc_msgSend(v69, "systemLayoutSizeFittingSize:", 0.0, 0.0);
        if (widestToolbarCategoryCellWidth >= v77) {
          double v77 = widestToolbarCategoryCellWidth;
        }
        self->_double widestToolbarCategoryCellWidth = v77;
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v79 objects:v91 count:16];
    }
    while (v73);
  }
}

- (void)_computeAndStoreCellMetricsForShortcut:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v16 = [(UIKeyShortcutHUDMetrics *)self selfSizingShortcutCell];
  v8 = [v16 shortcutInputAccessoryView];
  v9 = [v8 shortcutInputView];

  [v16 configureWithShortcut:v7];
  [v16 layoutIfNeeded];
  objc_msgSend(v16, "systemLayoutSizeFittingSize:", 0.0, 0.0);
  double v11 = v10;
  [v9 modifiersLabelWidth];
  double v13 = v12;
  [v9 inputLabelWidth];
  v15 = +[_UIKeyShortcutHUDShortcutCellMetrics metricsWithCellWidth:v11 modifiersWidth:v13 inputWidth:v14];
  [(NSMapTable *)self->_shortcutCellMetricsMap setObject:v15 forKey:v7];
  [(NSMapTable *)self->_shortcutCellIndexPathsMap setObject:v6 forKey:v7];
}

- (void)_updateDisplayedMenuMetrics
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  BOOL v4 = [(_UIKeyShortcutHUDMenu *)self->_displayedMenu children];
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  displayedMenuColumnMetrics = self->_displayedMenuColumnMetrics;
  self->_displayedMenuColumnMetrics = v5;

  id v7 = (void *)MEMORY[0x1E4F1CA48];
  v8 = [(_UIKeyShortcutHUDMenu *)self->_displayedMenu children];
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  displayedMenuCategoryOffsets = self->_displayedMenuCategoryOffsets;
  self->_displayedMenuCategoryOffsets = v9;

  self->_displayedMenuContentWidth = 0.0;
  displayedSearchColumnMetrics = self->_displayedSearchColumnMetrics;
  self->_displayedSearchColumnMetrics = 0;

  self->_searchModePreferredMenuPanelHeight = 0.0;
  if (self->_searching)
  {
    [(UIKeyShortcutHUDMetrics *)self _updateDisplayedSearchMenuMetrics];
  }
  else
  {
    [(UIKeyShortcutHUDMetrics *)self _updateDisplayedStandardMenuMetrics];
  }
}

- (void)_updateDisplayedStandardMenuMetrics
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id obj = [(_UIKeyShortcutHUDMenu *)self->_displayedMenu children];
  uint64_t v3 = [obj countByEnumeratingWithState:&v111 objects:v118 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v112;
    uint64_t v89 = *(void *)v112;
    do
    {
      uint64_t v6 = 0;
      uint64_t v90 = v4;
      do
      {
        if (*(void *)v112 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v92 = v6;
        id v7 = *(void **)(*((void *)&v111 + 1) + 8 * v6);
        if ([v7 isEmpty])
        {
          [(UIKeyShortcutHUDMetrics *)self emptyColumnWidth];
          v8 = +[_UIKeyShortcutHUDShortcutColumnMetrics metricsWithColumnWidth:modifiersWidth:inputWidth:](_UIKeyShortcutHUDShortcutColumnMetrics, "metricsWithColumnWidth:modifiersWidth:inputWidth:");
          displayedMenuColumnMetrics = self->_displayedMenuColumnMetrics;
          v117 = v8;
          double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
          [(NSMutableArray *)displayedMenuColumnMetrics addObject:v10];
        }
        else
        {
          double v11 = [v7 children];
          unint64_t v12 = [v11 count] - 1;
          unint64_t v95 = v12 / [(UIKeyShortcutHUDMetrics *)self numCellsPerColumn];

          uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v95 + 1];
          v8 = (void *)v13;
          if (v95 != -1)
          {
            uint64_t v14 = 0;
            uint64_t v97 = 1;
            v101 = v7;
            unint64_t v93 = (void *)v13;
            do
            {
              unint64_t v15 = [(UIKeyShortcutHUDMetrics *)self numCellsPerColumn] * v14;
              unint64_t v16 = [(UIKeyShortcutHUDMetrics *)self numCellsPerColumn];
              uint64_t v96 = v14 + 1;
              double v17 = 0.0;
              double v18 = 0.0;
              double v19 = 0.0;
              if (v15 < v16 * (v14 + 1))
              {
                uint64_t v94 = v14;
                unint64_t v102 = v16 * v97;
                unint64_t v20 = v15;
                double v21 = 0.0;
                do
                {
                  v22 = [v7 children];
                  unint64_t v23 = [v22 count];

                  if (v20 >= v23) {
                    break;
                  }
                  uint64_t v24 = [v7 children];
                  uint64_t v25 = [v24 objectAtIndexedSubscript:v20];

                  uint64_t v26 = [(NSMapTable *)self->_shortcutCellMetricsMap objectForKey:v25];
                  [v26 modifiersWidth];
                  if (v17 < v27) {
                    double v17 = v27;
                  }
                  [v26 inputWidth];
                  if (v18 < v28) {
                    double v18 = v28;
                  }
                  if (self->_combinedShortcutAndAlternateColumnWidths)
                  {
                    unint64_t v29 = [v25 baseShortcutForAlternate];
                    id v30 = [(NSMapTable *)self->_shortcutCellMetricsMap objectForKey:v29];
                    [v30 modifiersWidth];
                    if (v19 < v31) {
                      double v19 = v31;
                    }
                    __int16 v98 = v30;
                    [v30 inputWidth];
                    if (v21 < v32) {
                      double v21 = v32;
                    }
                    long long v107 = 0u;
                    long long v108 = 0u;
                    long long v109 = 0u;
                    long long v110 = 0u;
                    double v99 = v29;
                    double v33 = [v29 shortcutAlternates];
                    uint64_t v34 = [v33 countByEnumeratingWithState:&v107 objects:v116 count:16];
                    if (v34)
                    {
                      uint64_t v35 = v34;
                      uint64_t v36 = *(void *)v108;
                      do
                      {
                        for (uint64_t i = 0; i != v35; ++i)
                        {
                          if (*(void *)v108 != v36) {
                            objc_enumerationMutation(v33);
                          }
                          uint64_t v38 = [(NSMapTable *)self->_shortcutCellMetricsMap objectForKey:*(void *)(*((void *)&v107 + 1) + 8 * i)];
                          [v38 modifiersWidth];
                          if (v19 < v39) {
                            double v19 = v39;
                          }
                          [v38 inputWidth];
                          if (v21 < v40) {
                            double v21 = v40;
                          }
                        }
                        uint64_t v35 = [v33 countByEnumeratingWithState:&v107 objects:v116 count:16];
                      }
                      while (v35);
                    }

                    id v7 = v101;
                  }

                  ++v20;
                }
                while (v20 != v102);
                if (self->_combinedShortcutAndAlternateColumnWidths) {
                  double v41 = v21 + v19;
                }
                else {
                  double v41 = v18 + v17;
                }
                double v19 = 0.0;
                do
                {
                  v42 = [v7 children];
                  unint64_t v43 = [v42 count];

                  if (v15 >= v43) {
                    break;
                  }
                  double v44 = [v7 children];
                  double v45 = [v44 objectAtIndexedSubscript:v15];

                  double v46 = [(NSMapTable *)self->_shortcutCellMetricsMap objectForKey:v45];
                  double v47 = v46;
                  if (self->_combinedShortcutAndAlternateColumnWidths)
                  {
                    v100 = v46;
                    double v48 = [v45 baseShortcutForAlternate];
                    double v49 = [(NSMapTable *)self->_shortcutCellMetricsMap objectForKey:v48];
                    [v49 cellWidth];
                    double v51 = v50;
                    [(UIKeyShortcutHUDMetrics *)self _shortcutWidthAdjustmentForMetrics:v49 shortcutWidth:v41];
                    double v53 = v51 + v52;
                    long long v103 = 0u;
                    long long v104 = 0u;
                    long long v105 = 0u;
                    long long v106 = 0u;
                    double v54 = [v48 shortcutAlternates];
                    uint64_t v55 = [v54 countByEnumeratingWithState:&v103 objects:v115 count:16];
                    if (v55)
                    {
                      uint64_t v56 = v55;
                      uint64_t v57 = *(void *)v104;
                      do
                      {
                        for (uint64_t j = 0; j != v56; ++j)
                        {
                          if (*(void *)v104 != v57) {
                            objc_enumerationMutation(v54);
                          }
                          v59 = [(NSMapTable *)self->_shortcutCellMetricsMap objectForKey:*(void *)(*((void *)&v103 + 1) + 8 * j)];
                          [v59 cellWidth];
                          double v61 = v60;
                          [(UIKeyShortcutHUDMetrics *)self _shortcutWidthAdjustmentForMetrics:v59 shortcutWidth:v41];
                          double v63 = v61 + v62;
                          if (v53 < v63) {
                            double v53 = v63;
                          }
                        }
                        uint64_t v56 = [v54 countByEnumeratingWithState:&v103 objects:v115 count:16];
                      }
                      while (v56);
                    }

                    double v47 = v100;
                    id v7 = v101;
                  }
                  else
                  {
                    [v46 cellWidth];
                    double v65 = v64;
                    [(UIKeyShortcutHUDMetrics *)self _shortcutWidthAdjustmentForMetrics:v47 shortcutWidth:v41];
                    double v53 = v65 + v66;
                  }
                  if (v19 < v53) {
                    double v19 = v53;
                  }

                  ++v15;
                }
                while (v15 != v102);
                v8 = v93;
                uint64_t v14 = v94;
              }
              double v67 = +[_UIKeyShortcutHUDShortcutColumnMetrics metricsWithColumnWidth:v19 modifiersWidth:v17 inputWidth:v18];
              [v8 addObject:v67];

              ++v97;
              BOOL v68 = v14 == v95;
              uint64_t v14 = v96;
            }
            while (!v68);
          }
          [(NSMutableArray *)self->_displayedMenuColumnMetrics addObject:v8];
          uint64_t v5 = v89;
          uint64_t v4 = v90;
        }

        uint64_t v6 = v92 + 1;
      }
      while (v92 + 1 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v111 objects:v118 count:16];
    }
    while (v4);
  }

  v69 = [(_UIKeyShortcutHUDMenu *)self->_displayedMenu children];
  uint64_t v70 = [v69 count];

  if (v70)
  {
    unint64_t v71 = 0;
    do
    {
      if (v71)
      {
        uint64_t v72 = [(NSMutableArray *)self->_displayedMenuCategoryOffsets objectAtIndexedSubscript:v71 - 1];
        [v72 doubleValue];
        double v74 = v73;

        [(UIKeyShortcutHUDMetrics *)self _computedWidthForCategoryAtIndex:v71 - 1];
        double v76 = v74 + v75;
        [(UIKeyShortcutHUDMetrics *)self menuColumnSpacing];
        double v78 = v76 + v77;
      }
      else
      {
        [(UIKeyShortcutHUDMetrics *)self menuHorizontalContentInset];
      }
      displayedMenuCategoryOffsets = self->_displayedMenuCategoryOffsets;
      long long v80 = [NSNumber numberWithDouble:v78];
      [(NSMutableArray *)displayedMenuCategoryOffsets addObject:v80];

      ++v71;
      long long v81 = [(_UIKeyShortcutHUDMenu *)self->_displayedMenu children];
      unint64_t v82 = [v81 count];
    }
    while (v71 < v82);
  }
  if (![(_UIKeyShortcutHUDMenu *)self->_displayedMenu isEmpty])
  {
    long long v83 = [(_UIKeyShortcutHUDMenu *)self->_displayedMenu children];
    uint64_t v84 = [v83 count] - 1;

    long long v85 = [(NSMutableArray *)self->_displayedMenuCategoryOffsets objectAtIndexedSubscript:v84];
    [v85 doubleValue];
    self->_displayedMenuContentWidth = v86;

    [(UIKeyShortcutHUDMetrics *)self _computedWidthForCategoryAtIndex:v84];
    self->_displayedMenuContentWidth = v87 + self->_displayedMenuContentWidth;
    [(UIKeyShortcutHUDMetrics *)self menuHorizontalContentInset];
    self->_displayedMenuContentWidth = v88 + self->_displayedMenuContentWidth;
  }
}

- (double)_shortcutWidthAdjustmentForMetrics:(id)a3 shortcutWidth:(double)a4
{
  id v6 = a3;
  double v7 = 0.0;
  if ([(UIKeyShortcutHUDMetrics *)self shouldAlignShortcutModifiersAndInputInColumn])
  {
    [v6 modifiersWidth];
    double v9 = v8;
    [v6 inputWidth];
    double v7 = a4 - (v9 + v10);
  }

  return v7;
}

- (void)_updateDisplayedSearchMenuMetrics
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  if ([(UIKeyShortcutHUDMetrics *)self shouldAlignShortcutModifiersAndInputInColumn])
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v6 = [(_UIKeyShortcutHUDMenu *)self->_displayedMenu children];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v70 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          unint64_t v12 = [v11 children];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v76 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v66;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v66 != v15) {
                  objc_enumerationMutation(v12);
                }
                double v17 = [(NSMapTable *)self->_shortcutCellMetricsMap objectForKey:*(void *)(*((void *)&v65 + 1) + 8 * j)];
                [v17 modifiersWidth];
                if (v5 < v18) {
                  double v5 = v18;
                }
                [v17 inputWidth];
                if (v4 < v19) {
                  double v4 = v19;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v65 objects:v76 count:16];
            }
            while (v14);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v69 objects:v77 count:16];
      }
      while (v8);
    }
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  unint64_t v20 = [(_UIKeyShortcutHUDMenu *)self->_displayedMenu children];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v62;
    double v3 = 0.0;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v62 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v61 + 1) + 8 * k);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        uint64_t v26 = [v25 children];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v57 objects:v74 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v58;
          do
          {
            for (uint64_t m = 0; m != v28; ++m)
            {
              if (*(void *)v58 != v29) {
                objc_enumerationMutation(v26);
              }
              double v31 = [(NSMapTable *)self->_shortcutCellMetricsMap objectForKey:*(void *)(*((void *)&v57 + 1) + 8 * m)];
              double v32 = 0.0;
              if ([(UIKeyShortcutHUDMetrics *)self shouldAlignShortcutModifiersAndInputInColumn])
              {
                [v31 modifiersWidth];
                double v34 = v33;
                [v31 inputWidth];
                double v32 = v4 + v5 - (v34 + v35);
              }
              [v31 cellWidth];
              double v37 = v32 + v36;
              if (v3 < v37) {
                double v3 = v37;
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v57 objects:v74 count:16];
          }
          while (v28);
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v22);
  }

  uint64_t v38 = +[_UIKeyShortcutHUDShortcutColumnMetrics metricsWithColumnWidth:v3 modifiersWidth:v5 inputWidth:v4];
  displayedSearchColumnMetrics = self->_displayedSearchColumnMetrics;
  self->_displayedSearchColumnMetrics = v38;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  double v40 = [(_UIKeyShortcutHUDMenu *)self->_displayedMenu children];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v53 objects:v73 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    unint64_t v43 = 0;
    uint64_t v44 = *(void *)v54;
    do
    {
      for (uint64_t n = 0; n != v42; ++n)
      {
        if (*(void *)v54 != v44) {
          objc_enumerationMutation(v40);
        }
        double v46 = [*(id *)(*((void *)&v53 + 1) + 8 * n) children];
        v43 += [v46 count] + 1;
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v53 objects:v73 count:16];
    }
    while (v42);
    double v47 = (double)v43;
  }
  else
  {
    double v47 = 0.0;
  }

  [(UIKeyShortcutHUDMetrics *)self menuCellHeight];
  double v49 = v47 * v48;
  [(UIKeyShortcutHUDMetrics *)self searchModeMenuTopContentInset];
  double v51 = v49 + v50;
  [(UIKeyShortcutHUDMetrics *)self searchModeMenuBottomContentInset];
  self->_searchModePreferredMenuPanelHeight = v51 + v52;
}

- (double)_computedWidthForCategoryAtIndex:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v4 = [(NSMutableArray *)self->_displayedMenuColumnMetrics objectAtIndexedSubscript:a3];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [(UIKeyShortcutHUDMetrics *)self minShortcutCellWidth];
        double v12 = v11;
        [v10 columnWidth];
        double v14 = v13;
        [(UIKeyShortcutHUDMetrics *)self maxShortcutCellWidth];
        double v8 = v8 + fmax(v12, fmin(v14, v15));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }
  [(UIKeyShortcutHUDMetrics *)self menuColumnSpacing];
  double v17 = v16;
  uint64_t v18 = [v4 count];

  return v8 + v17 * (double)(unint64_t)(v18 - 1);
}

+ (UIKeyShortcutHUDMetrics)currentMetrics
{
  id WeakRetained = objc_loadWeakRetained(&_currentMetrics);
  return (UIKeyShortcutHUDMetrics *)WeakRetained;
}

+ (void)setCurrentMetrics:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&_currentMetrics);

  double v4 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&_currentMetrics, obj);
    double v4 = obj;
  }
}

- (double)contentSizeScaledMetric:(double)a3
{
  if (qword_1EB261450 != -1) {
    dispatch_once(&qword_1EB261450, &__block_literal_global_298);
  }
  double v4 = (void *)_MergedGlobals_1103;
  [v4 scaledValueForValue:a3];
  return result;
}

void __51__UIKeyShortcutHUDMetrics_contentSizeScaledMetric___block_invoke()
{
  uint64_t v0 = +[UIFontMetrics metricsForTextStyle:@"UICTFontTextStyleBody"];
  v1 = (void *)_MergedGlobals_1103;
  _MergedGlobals_1103 = v0;
}

- (BOOL)isHUDShrunkToFitHorizontally
{
  [(UIKeyShortcutHUDMetrics *)self standardHUDWidth];
  double v4 = v3;
  [(UIKeyShortcutHUDMetrics *)self computedHUDWidthForBaseMenu];
  return v4 == v5;
}

- (unint64_t)contentSizeAdjustedMaxNumberOfCellsPerColumn
{
  double v3 = [(UIKeyShortcutHUDMetrics *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory(&cfstr_Uictcontentsiz_10.isa, v4) == NSOrderedAscending)
  {
    uint64_t v5 = -3;
  }
  else if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    uint64_t v5 = -2;
  }
  else if (UIContentSizeCategoryCompareToCategory(&cfstr_Uictcontentsiz_5.isa, v4) == NSOrderedAscending)
  {
    uint64_t v5 = -1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  unint64_t v6 = (unint64_t)fmax(fmin((double)([(UIKeyShortcutHUDMetrics *)self maxNumberOfCellsPerColumn]+ v5), (double)[(UIKeyShortcutHUDMetrics *)self maxNumberOfCellsPerColumn]), 2.0);

  return v6;
}

- (unint64_t)baseNumberOfVisibleColumns
{
  return 3;
}

- (unint64_t)maxNumberOfCellsPerColumn
{
  return 6;
}

- (double)standardHUDWidth
{
  [(UIKeyShortcutHUDMetrics *)self minShortcutCellWidth];
  double v4 = v3 * (double)[(UIKeyShortcutHUDMetrics *)self baseNumberOfVisibleColumns];
  [(UIKeyShortcutHUDMetrics *)self menuColumnSpacing];
  double v6 = v4 + v5 * (double)([(UIKeyShortcutHUDMetrics *)self baseNumberOfVisibleColumns] - 1);
  [(UIKeyShortcutHUDMetrics *)self menuHorizontalContentInset];
  double v8 = v7 + v7 + v6;
  [(UIKeyShortcutHUDMetrics *)self computedHUDWidthForBaseMenu];
  if (v8 < result) {
    return v8;
  }
  return result;
}

- (double)searchModeStandardHUDWidth
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:327.0];
  return result;
}

- (double)standardMenuToolbarSpacing
{
  return 20.0;
}

- (double)minimumScreenEdgeDistance
{
  return 15.0;
}

- (double)minimumBottomScreenEdgeDistance
{
  return 12.0;
}

- (UIVisualEffect)platterVisualEffect
{
  int64_t v2 = [(UIKeyShortcutHUDMetrics *)self hudBlurStyle];
  return (UIVisualEffect *)+[UIBlurEffect effectWithStyle:v2];
}

- (double)platterZPosition
{
  return 0.0;
}

- (NSDictionary)platterSeparatedOptions
{
  return 0;
}

- (double)menuPlatterCornerRadius
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:12.0];
  return result;
}

- (double)toolbarPlatterCornerRadius
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:12.0];
  return result;
}

- (double)standardPlatterStrokeWidth
{
  [(UITraitCollection *)self->_traitCollection displayScale];
  return 1.0 / v2;
}

- (double)platterShadowRadius
{
  return 15.0;
}

- (double)platterShadowOpacity
{
  return 0.2;
}

- (double)standardMenuPanelHeight
{
  [(UIKeyShortcutHUDMetrics *)self menuCellHeight];
  double v4 = v3;
  [(UIKeyShortcutHUDMetrics *)self menuCellHeight];
  double v6 = v4 + v5 * (double)[(UIKeyShortcutHUDMetrics *)self numCellsPerColumn];
  [(UIKeyShortcutHUDMetrics *)self menuTopContentInset];
  double v8 = v7 + v6;
  [(UIKeyShortcutHUDMetrics *)self menuBottomContentInset];
  return v9 + v8;
}

- (double)searchModeMaximumMenuPanelHeight
{
  [(UIKeyShortcutHUDMetrics *)self availableVerticalSpace];
  double result = v2 * 0.75;
  if (result > 520.0) {
    return 520.0;
  }
  return result;
}

- (double)searchModePreferredMenuPanelWidth
{
  [(UIKeyShortcutHUDMetrics *)self menuHorizontalContentInset];
  double v4 = v3;
  [(UIKeyShortcutHUDMetrics *)self searchModeStandardHUDWidth];
  double v6 = v5 - v4;
  [(_UIKeyShortcutHUDShortcutColumnMetrics *)self->_displayedSearchColumnMetrics columnWidth];
  double v8 = v7;
  [(UIKeyShortcutHUDMetrics *)self maxShortcutCellWidth];
  return v4 + fmax(v6, fmin(v8, v9));
}

- (double)hiddenMenuPanelHeight
{
  return 1.0;
}

- (unint64_t)menuPanelCornerMask
{
  return 15;
}

- (double)standardToolbarContentHeight
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:51.0];
  return result;
}

- (BOOL)shouldExtendToolbarThroughSafeArea
{
  return 0;
}

- (unint64_t)toolbarPanelCornerMask
{
  return 15;
}

- (double)_toolbarContentToWindowBottomEdgeSpacing
{
  [(UIKeyShortcutHUDMetrics *)self minimumBottomScreenEdgeDistance];
  double v4 = v3;
  double v5 = [(UIKeyShortcutHUDMetrics *)self selfSizingPlayground];
  double v6 = [v5 window];
  [v6 safeAreaInsets];
  double v8 = fmax(v4, v7);

  return v8;
}

- (double)_toolbarDistanceFromBottomOfWindow
{
  if ([(UIKeyShortcutHUDMetrics *)self shouldExtendToolbarThroughSafeArea]) {
    return 0.0;
  }
  [(UIKeyShortcutHUDMetrics *)self _toolbarContentToWindowBottomEdgeSpacing];
  return result;
}

- (double)_toolbarHeight
{
  [(UIKeyShortcutHUDMetrics *)self standardToolbarContentHeight];
  double v4 = v3;
  if ([(UIKeyShortcutHUDMetrics *)self shouldExtendToolbarThroughSafeArea])
  {
    [(UIKeyShortcutHUDMetrics *)self _toolbarContentToWindowBottomEdgeSpacing];
    return v4 + v5;
  }
  return v4;
}

- (unint64_t)maxNumberOfCellsInSearchResults
{
  [(UIKeyShortcutHUDMetrics *)self searchModeMaximumMenuPanelHeight];
  double v4 = v3;
  [(UIKeyShortcutHUDMetrics *)self searchModeMenuTopContentInset];
  double v6 = v5;
  [(UIKeyShortcutHUDMetrics *)self searchModeMenuBottomContentInset];
  double v8 = v4 - (v6 + v7);
  [(UIKeyShortcutHUDMetrics *)self menuCellHeight];
  return (unint64_t)(v8 / v9);
}

- (BOOL)shouldAlignShortcutModifiersAndInputInColumn
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientTraits);
  BOOL v3 = [WeakRetained layoutDirection] == 1;

  return v3;
}

- (double)standardMenuPadding
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:20.0];
  return result;
}

- (double)menuHorizontalContentInset
{
  [(UIKeyShortcutHUDMetrics *)self standardMenuPadding];
  double v4 = v3;
  [(UIKeyShortcutHUDMetrics *)self menuCellHorizontalContentMargin];
  return v4 - v5;
}

- (double)menuTopContentInset
{
  [(UIKeyShortcutHUDMetrics *)self menuBaseVerticalContentInset];
  double v4 = v3;
  [(UIKeyShortcutHUDMetrics *)self categoryHeaderVerticalTextAdjustment];
  return v4 - v5;
}

- (double)searchModeMenuBaseVerticalContentInset
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:12.0];
  return result;
}

- (double)searchModeMenuTopContentInset
{
  [(UIKeyShortcutHUDMetrics *)self searchModeMenuBaseVerticalContentInset];
  double v4 = v3;
  [(UIKeyShortcutHUDMetrics *)self categoryHeaderVerticalTextAdjustment];
  return v4 - v5;
}

- (double)menuColumnSpacing
{
  [(UIKeyShortcutHUDMetrics *)self standardMenuPadding];
  double v4 = v3;
  [(UIKeyShortcutHUDMetrics *)self menuCellHorizontalContentMargin];
  return v4 - (v5 + v5);
}

- (double)toolbarContentInset
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:4.0];
  return result;
}

- (BOOL)toolbarStylesCategoriesAsPageControl
{
  return 0;
}

- (double)separatorWidth
{
  return 1.0;
}

- (UIColor)menuSeparatorColor
{
  return +[UIColor separatorColor];
}

- (UIVisualEffect)menuSeparatorVisualEffect
{
  double v2 = +[UIBlurEffect effectWithStyle:[(UIKeyShortcutHUDMetrics *)self hudBlurStyle]];
  double v3 = +[UIVibrancyEffect effectForBlurEffect:v2 style:7];

  return (UIVisualEffect *)v3;
}

- (double)toolbarSeparatorVerticalMargin
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:13.0];
  return result;
}

- (UIColor)toolbarSeparatorColor
{
  return +[UIColor tertiaryLabelColor];
}

- (UIVisualEffect)toolbarSeparatorVisualEffect
{
  return 0;
}

- (unint64_t)categoryIndexAtHorizontalOffset:(double)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_displayedMenuCategoryOffsets count];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = (v7 + v6) >> 1;
      double v9 = [(NSMutableArray *)self->_displayedMenuCategoryOffsets objectAtIndexedSubscript:v8];
      [v9 doubleValue];
      double v11 = v10;

      if (v11 <= a3)
      {
        if (v8 == [(NSMutableArray *)self->_displayedMenuCategoryOffsets count] - 1) {
          return v8;
        }
        double v12 = [(NSMutableArray *)self->_displayedMenuCategoryOffsets objectAtIndexedSubscript:v8 + 1];
        [v12 doubleValue];
        double v14 = v13;

        unint64_t v7 = (v7 + v6) >> 1;
        if (v14 > a3) {
          return v8;
        }
      }
      else
      {
        uint64_t v6 = (v7 + v6) >> 1;
        unint64_t v8 = v7;
      }
      if (v6 == v7) {
        return v8;
      }
    }
  }
  return 0;
}

- (double)horizontalOffsetForCategoryAtIndex:(unint64_t)a3
{
  double v3 = [(NSMutableArray *)self->_displayedMenuCategoryOffsets objectAtIndexedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)menuCellHorizontalContentMargin
{
  return 10.0;
}

- (double)minShortcutNameKeyCombinationSpacing
{
  return 25.0;
}

- (double)standardShortcutInputReservedWidth
{
  return 20.0;
}

- (double)standardShortcutModifierInputMinimumSpacing
{
  return 3.0;
}

- (double)shortcutTitleToSubtitleVerticalPadding
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:-1.5];
  return result;
}

- (double)cellFlashDuration
{
  return 0.1;
}

- (double)menuCellCornerRadius
{
  [(UIKeyShortcutHUDMetrics *)self menuPlatterCornerRadius];
  double v4 = v3;
  [(UIKeyShortcutHUDMetrics *)self menuHorizontalContentInset];
  return v4 - v5;
}

- (double)toolbarCellCornerRadius
{
  [(UIKeyShortcutHUDMetrics *)self toolbarPlatterCornerRadius];
  double v4 = v3;
  [(UIKeyShortcutHUDMetrics *)self toolbarContentInset];
  return v4 - v5;
}

- (double)categoryHeaderVerticalTextAdjustment
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:5.0];
  return result;
}

- (int64_t)hudBlurStyle
{
  return 8;
}

- (UIColor)platterStrokeColor
{
  return +[UIColor systemFillColor];
}

- (UIColor)standardHUDTextColor
{
  if (qword_1EB261460 != -1) {
    dispatch_once(&qword_1EB261460, &__block_literal_global_29_2);
  }
  double v2 = (void *)qword_1EB261458;
  return (UIColor *)v2;
}

void __47__UIKeyShortcutHUDMetrics_standardHUDTextColor__block_invoke()
{
  uint64_t v0 = +[UIColor colorWithDynamicProvider:&__block_literal_global_32_3];
  v1 = (void *)qword_1EB261458;
  qword_1EB261458 = v0;
}

id __47__UIKeyShortcutHUDMetrics_standardHUDTextColor__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 accessibilityContrast];
  double v3 = +[UIColor labelColor];
  double v4 = v3;
  if (v2 == 1)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 colorWithAlphaComponent:0.85];
  }
  uint64_t v6 = v5;

  return v6;
}

- (UIColor)shortcutSubtitleTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (UIColor)searchHUDTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (UIFont)standardHUDFont
{
  if (qword_1EB261470 != -1) {
    dispatch_once(&qword_1EB261470, &__block_literal_global_34_2);
  }
  uint64_t v2 = (void *)qword_1EB261468;
  return (UIFont *)v2;
}

void __42__UIKeyShortcutHUDMetrics_standardHUDFont__block_invoke()
{
  uint64_t v0 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  v1 = (void *)qword_1EB261468;
  qword_1EB261468 = v0;
}

- (UIFont)shortcutSubtitleFont
{
  if (qword_1EB261480 != -1) {
    dispatch_once(&qword_1EB261480, &__block_literal_global_37_5);
  }
  uint64_t v2 = (void *)qword_1EB261478;
  return (UIFont *)v2;
}

void __47__UIKeyShortcutHUDMetrics_shortcutSubtitleFont__block_invoke()
{
  uint64_t v0 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption2"];
  v1 = (void *)qword_1EB261478;
  qword_1EB261478 = v0;
}

- (UIFont)categoryHeaderFont
{
  if (qword_1EB261490 != -1) {
    dispatch_once(&qword_1EB261490, &__block_literal_global_39_1);
  }
  uint64_t v2 = (void *)qword_1EB261488;
  return (UIFont *)v2;
}

void __45__UIKeyShortcutHUDMetrics_categoryHeaderFont__block_invoke()
{
  uint64_t v0 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedTitle2"];
  v1 = (void *)qword_1EB261488;
  qword_1EB261488 = v0;
}

- (UIFont)keyShortcutInputCharacterFont
{
  if (qword_1EB2614A0 != -1) {
    dispatch_once(&qword_1EB2614A0, &__block_literal_global_41_1);
  }
  uint64_t v2 = (void *)qword_1EB261498;
  return (UIFont *)v2;
}

void __56__UIKeyShortcutHUDMetrics_keyShortcutInputCharacterFont__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleBody"];
  uint64_t v5 = *(void *)off_1E52D6B70;
  v6[0] = &unk_1ED3EFD28;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v2 = [v0 fontDescriptorByAddingAttributes:v1];

  uint64_t v3 = [off_1E52D39B8 fontWithDescriptor:v2 size:0.0];
  double v4 = (void *)qword_1EB261498;
  qword_1EB261498 = v3;
}

- (UIFont)cancelButtonFont
{
  if (qword_1EB2614B0 != -1) {
    dispatch_once(&qword_1EB2614B0, &__block_literal_global_48);
  }
  uint64_t v2 = (void *)qword_1EB2614A8;
  return (UIFont *)v2;
}

void __43__UIKeyShortcutHUDMetrics_cancelButtonFont__block_invoke()
{
  uint64_t v0 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
  v1 = (void *)qword_1EB2614A8;
  qword_1EB2614A8 = v0;
}

- (UIFont)toolbarCategoryVisibleFont
{
  if (qword_1EB2614C0 != -1) {
    dispatch_once(&qword_1EB2614C0, &__block_literal_global_50_1);
  }
  uint64_t v2 = (void *)qword_1EB2614B8;
  return (UIFont *)v2;
}

void __53__UIKeyShortcutHUDMetrics_toolbarCategoryVisibleFont__block_invoke()
{
  uint64_t v0 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedBody"];
  v1 = (void *)qword_1EB2614B8;
  qword_1EB2614B8 = v0;
}

- (double)minShortcutCellWidth
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:250.0];
  return result;
}

- (double)maxShortcutCellWidth
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:500.0];
  return result;
}

- (double)menuCellHeight
{
  [(UIKeyShortcutHUDMetrics *)self contentSizeScaledMetric:45.0];
  return result;
}

- (double)cellWidthForShortcut:(id)a3
{
  if (self->_searching)
  {
    [(UIKeyShortcutHUDMetrics *)self minShortcutCellWidth];
  }
  else
  {
    uint64_t v5 = [(NSMapTable *)self->_shortcutCellIndexPathsMap objectForKey:a3];
    unint64_t v6 = [v5 item];
    unint64_t v7 = v6 / [(UIKeyShortcutHUDMetrics *)self numCellsPerColumn];
    unint64_t v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuColumnMetrics, "objectAtIndexedSubscript:", [v5 section]);
    double v9 = [v8 objectAtIndexedSubscript:v7];
    [v9 columnWidth];
    double v11 = v10;

    [(UIKeyShortcutHUDMetrics *)self minShortcutCellWidth];
    double v13 = v12;
    [(UIKeyShortcutHUDMetrics *)self maxShortcutCellWidth];
    double v15 = fmax(v13, fmin(v11, v14));

    return v15;
  }
  return result;
}

- (double)modifiersWidthForShortcut:(id)a3
{
  if (self->_searching)
  {
    displayedSearchColumnMetrics = self->_displayedSearchColumnMetrics;
    [(_UIKeyShortcutHUDShortcutColumnMetrics *)displayedSearchColumnMetrics modifiersWidth];
  }
  else
  {
    unint64_t v6 = [(NSMapTable *)self->_shortcutCellIndexPathsMap objectForKey:a3];
    unint64_t v7 = [v6 item];
    unint64_t v8 = v7 / [(UIKeyShortcutHUDMetrics *)self numCellsPerColumn];
    double v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuColumnMetrics, "objectAtIndexedSubscript:", [v6 section]);
    double v10 = [v9 objectAtIndexedSubscript:v8];
    [v10 modifiersWidth];
    double v12 = v11;

    return v12;
  }
  return result;
}

- (double)inputWidthForShortcut:(id)a3
{
  if (self->_searching)
  {
    displayedSearchColumnMetrics = self->_displayedSearchColumnMetrics;
    [(_UIKeyShortcutHUDShortcutColumnMetrics *)displayedSearchColumnMetrics inputWidth];
  }
  else
  {
    unint64_t v6 = [(NSMapTable *)self->_shortcutCellIndexPathsMap objectForKey:a3];
    unint64_t v7 = [v6 item];
    unint64_t v8 = v7 / [(UIKeyShortcutHUDMetrics *)self numCellsPerColumn];
    double v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuColumnMetrics, "objectAtIndexedSubscript:", [v6 section]);
    double v10 = [v9 objectAtIndexedSubscript:v8];
    [v10 inputWidth];
    double v12 = v11;

    return v12;
  }
  return result;
}

- (double)headerWidthForCategory:(id)a3
{
  id v4 = a3;
  if ([v4 isEmpty])
  {
    [(UIKeyShortcutHUDMetrics *)self emptyColumnWidth];
    double v6 = v5;
  }
  else
  {
    unint64_t v7 = [v4 children];
    unint64_t v8 = [v7 lastObject];
    [(UIKeyShortcutHUDMetrics *)self cellWidthForShortcut:v8];
    double v6 = v9;
  }
  return v6;
}

- (unint64_t)numCellsPerColumn
{
  return self->_numCellsPerColumn;
}

- (double)searchModePreferredMenuPanelHeight
{
  return self->_searchModePreferredMenuPanelHeight;
}

- (double)displayedMenuContentWidth
{
  return self->_displayedMenuContentWidth;
}

- (BOOL)shouldMirrorShortcutInputs
{
  return self->_shouldMirrorShortcutInputs;
}

- (BOOL)shouldDisplayEscShortcutAlternative
{
  return self->_shouldDisplayEscShortcutAlternative;
}

- (BOOL)shouldDisplayGlobeModiferAsGlobeSymbol
{
  return self->_shouldDisplayGlobeModiferAsGlobeSymbol;
}

- (double)searchButtonWidth
{
  return self->_searchButtonWidth;
}

- (double)widestToolbarCategoryCellWidth
{
  return self->_widestToolbarCategoryCellWidth;
}

- (NSMapTable)shortcutCellMetricsMap
{
  return self->_shortcutCellMetricsMap;
}

- (void)setShortcutCellMetricsMap:(id)a3
{
}

- (NSMapTable)shortcutCellIndexPathsMap
{
  return self->_shortcutCellIndexPathsMap;
}

- (void)setShortcutCellIndexPathsMap:(id)a3
{
}

- (double)computedHUDWidthForBaseMenu
{
  return self->_computedHUDWidthForBaseMenu;
}

- (void)setComputedHUDWidthForBaseMenu:(double)a3
{
  self->_computedHUDWidthForBaseMenu = a3;
}

- (_UIKeyShortcutHUDMenu)displayedMenu
{
  return self->_displayedMenu;
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (BOOL)areShortcutAndAlternateColumnWidthsCombined
{
  return self->_combinedShortcutAndAlternateColumnWidths;
}

- (NSMutableArray)displayedMenuColumnMetrics
{
  return self->_displayedMenuColumnMetrics;
}

- (void)setDisplayedMenuColumnMetrics:(id)a3
{
}

- (NSMutableArray)displayedMenuCategoryOffsets
{
  return self->_displayedMenuCategoryOffsets;
}

- (void)setDisplayedMenuCategoryOffsets:(id)a3
{
}

- (_UIKeyShortcutHUDShortcutColumnMetrics)displayedSearchColumnMetrics
{
  return self->_displayedSearchColumnMetrics;
}

- (void)setDisplayedSearchColumnMetrics:(id)a3
{
}

- (_UIKeyShortcutHUDMenu)baseMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseMenu);
  return (_UIKeyShortcutHUDMenu *)WeakRetained;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (_UIKeyShortcutHUDClientTraits)clientTraits
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientTraits);
  return (_UIKeyShortcutHUDClientTraits *)WeakRetained;
}

- (void)setClientTraits:(id)a3
{
}

- (double)availableVerticalSpace
{
  return self->_availableVerticalSpace;
}

- (void)setAvailableVerticalSpace:(double)a3
{
  self->_availableVerticalSpace = a3;
}

- (UIView)selfSizingPlayground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selfSizingPlayground);
  return (UIView *)WeakRetained;
}

- (void)setSelfSizingPlayground:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selfSizingPlayground);
  objc_destroyWeak((id *)&self->_clientTraits);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_baseMenu);
  objc_storeStrong((id *)&self->_displayedSearchColumnMetrics, 0);
  objc_storeStrong((id *)&self->_displayedMenuCategoryOffsets, 0);
  objc_storeStrong((id *)&self->_displayedMenuColumnMetrics, 0);
  objc_storeStrong((id *)&self->_displayedMenu, 0);
  objc_storeStrong((id *)&self->_shortcutCellIndexPathsMap, 0);
  objc_storeStrong((id *)&self->_shortcutCellMetricsMap, 0);
  objc_storeStrong((id *)&self->_selfSizingToolbarCategoryCell, 0);
  objc_storeStrong((id *)&self->_selfSizingSearchCell, 0);
  objc_storeStrong((id *)&self->_selfSizingShortcutCell, 0);
}

@end