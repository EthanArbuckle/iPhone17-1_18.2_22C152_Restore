@interface UICollectionViewListCell
+ (Class)_contentViewClass;
+ (id)_createDefaultContentViewWithFrame:(CGRect)a3;
+ (id)_createVisualProviderForCell:(id)a3;
- (BOOL)_canFocusProgrammatically;
- (BOOL)_canPerformActionForKey:(id)a3;
- (BOOL)_cellSelectionTogglesExpansionState;
- (BOOL)_contentViewShouldBeIndented;
- (BOOL)_expanded;
- (BOOL)_hasCustomSelectionAction;
- (BOOL)_isAccompaniedSidebar;
- (BOOL)_isFocusableWhenStyledAsHeader;
- (BOOL)_performActionForKey:(id)a3;
- (BOOL)_removesHighlightedAndSelectedStatesForBackground;
- (BOOL)_reorderControlShouldBeginReordering:(id)a3;
- (BOOL)_shouldIncreaseCellLeadingLayoutMarginForIndentation;
- (BOOL)canBeEdited;
- (BOOL)indentsAccessories;
- (CGFloat)indentationWidth;
- (NSArray)accessories;
- (NSArray)leadingAccessoryConfigurations;
- (NSArray)leadingEditingAccessoryConfigurations;
- (NSArray)trailingAccessoryConfigurations;
- (NSArray)trailingEditingAccessoryConfigurations;
- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsFromContentViewWithDefaultInsets:(NSDirectionalEdgeInsets)a3;
- (NSDirectionalEdgeInsets)_separatorInsetsFromLayoutGuide;
- (NSDirectionalEdgeInsets)_separatorInsetsFromPrimaryTextLayoutFrameWithDefaultInsets:(NSDirectionalEdgeInsets)a3;
- (NSInteger)indentationLevel;
- (UICellAccessoryManager)_accessoryManager;
- (UICollectionViewListCell)initWithCoder:(id)a3;
- (UICollectionViewListCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)_adjustedRawLayoutMargins:(UIEdgeInsets)a3 withLeadingLayoutMarginAdjustment:(double)a4;
- (UIEdgeInsets)_contentViewInset;
- (UIFocusItem)_parentFocusItem;
- (UILayoutGuide)separatorLayoutGuide;
- (UIListContentConfiguration)defaultContentConfiguration;
- (UITableConstants)_constants;
- (double)_contentView:(id)a3 inset:(double)a4 convertedToCellInsetOnEdge:(unint64_t)a5;
- (double)_leadingIndentation;
- (double)_minimumCellAccessoryMargin;
- (id)_cellAccessoriesForConfigurations:(id)a3 isLeadingEdge:(BOOL)a4;
- (id)_cellAccessoryForConfiguration:(id)a3 isLeadingEdge:(BOOL)a4 usingState:(id)a5;
- (id)_configurationState;
- (id)_createSystemTypeAccessoryViewWithCellAccessory:(id)a3 orConfiguration:(id)a4 updatedForState:(id)a5;
- (id)_defaultBackgroundConfiguration;
- (id)_defaultBackgroundView;
- (id)_defaultSelectedBackgroundView;
- (id)_disclosureActionHandler;
- (id)_editingControlTintColorForStyle:(int64_t)a3;
- (id)_internalAccessoriesForCellAccessories:(id)a3 usingState:(id)a4;
- (id)_itemIdentifier;
- (id)_popUpMenuAccessory;
- (id)_popUpMenuAccessoryForCustomSelectionAction;
- (id)_preferredLayoutAttributesFittingAttributes:(id)a3 isAnimatingExistingView:(BOOL)a4;
- (id)_viewForMultiSelectAccessory;
- (int64_t)_cellStyle;
- (int64_t)_defaultFocusStyle;
- (int64_t)_defaultIndentationLevel;
- (int64_t)_tableStyle;
- (int64_t)selectionStyle;
- (unint64_t)_validatedDisclosureActionForKey:(id)a3;
- (void)_applyCellAccessoriesToNormalConfiguration:(id)a3 editingConfiguration:(id)a4;
- (void)_clearChangeHandlersForOldContentView:(id)a3;
- (void)_configureFocusedFloatingContentView:(id)a3;
- (void)_constantsDidChange;
- (void)_createAccessoryManager;
- (void)_deleteAccessoryTriggered;
- (void)_invalidatePreferredSeparatorInsetsFromContentView;
- (void)_layoutAccessoriesAndContentView;
- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3;
- (void)_performCustomSelectionAction;
- (void)_presentPopUpMenuForAccessory:(id)a3;
- (void)_reorderControl:(id)a3 didReceiveTouchesBegan:(id)a4;
- (void)_reorderControl:(id)a3 didUpdateWithOffset:(CGPoint)a4;
- (void)_reorderControlDidBeginReordering:(id)a3;
- (void)_reorderControlDidEndReordering:(id)a3 cancelled:(BOOL)a4;
- (void)_resetRawLayoutMargins;
- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3;
- (void)_setContentView:(id)a3 addToHierarchy:(BOOL)a4;
- (void)_setDefaultIndentationLevel:(int64_t)a3;
- (void)_setDisclosureActionHandler:(id)a3;
- (void)_setExpanded:(BOOL)a3;
- (void)_setIndentationLevel:(int64_t)a3;
- (void)_setIndentationWidth:(double)a3;
- (void)_setItemIdentifier:(id)a3;
- (void)_setLayoutAttributes:(id)a3;
- (void)_setNeedsUpdateAccessories;
- (void)_setParentFocusItem:(id)a3;
- (void)_setRawLayoutMargins:(UIEdgeInsets)a3;
- (void)_setupChangeHandlersForNewContentView:(id)a3;
- (void)_systemAccessoriesChanged;
- (void)_toggleExpansionState;
- (void)_updateAccessoriesIfNeeded;
- (void)_updateAccessoryLayoutMetrics;
- (void)_updateCellSelectionTogglesExpansionState;
- (void)_updateConfigurationUsingState:(id)a3;
- (void)_updateConstants;
- (void)_updateContentViewConstraintsIfNeeded;
- (void)_updateCurrentSystemTypeAccessoryViewsUsingState:(id)a3;
- (void)_updateDefaultIndentationWidth;
- (void)_updateLeadingLayoutMarginForIndentation;
- (void)_updateSeparatorConfigurationForPreferredAttributes:(id)a3 bounds:(CGRect)a4 isAnimatingExistingView:(BOOL)a5;
- (void)_updateSeparatorLayoutGuideForSectionSeparatorInsets:(NSDirectionalEdgeInsets)a3;
- (void)_updateSeparatorLayoutGuideHeight;
- (void)_updateSystemTypeAccessoryView:(id)a3 withCellAccessory:(id)a4 orConfiguration:(id)a5 usingState:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessories:(NSArray *)accessories;
- (void)setEditing:(BOOL)a3;
- (void)setIndentationLevel:(NSInteger)indentationLevel;
- (void)setIndentationWidth:(CGFloat)indentationWidth;
- (void)setIndentsAccessories:(BOOL)indentsAccessories;
- (void)setLeadingAccessoryConfigurations:(id)a3;
- (void)setLeadingEditingAccessoryConfigurations:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setTrailingAccessoryConfigurations:(id)a3;
- (void)setTrailingEditingAccessoryConfigurations:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UICollectionViewListCell

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double left = a3.left;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewListCell;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v9, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom);
  [(UIView *)self layoutMargins];
  if (left != v7 || right != v6) {
    [(UICellAccessoryManager *)self->_accessoryManager setNeedsLayout];
  }
}

uint64_t __96__UICollectionViewListCell__preferredLayoutAttributesFittingAttributes_isAnimatingExistingView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performConfigurationStateUpdate];
  v2 = *(void **)(a1 + 32);
  return [v2 _layoutAccessoriesAndContentView];
}

uint64_t __108__UICollectionViewListCell__createSystemTypeAccessoryViewWithCellAccessory_orConfiguration_updatedForState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemTypeAccessoryView:*(void *)(a1 + 40) withCellAccessory:*(void *)(a1 + 48) orConfiguration:*(void *)(a1 + 56) usingState:*(void *)(a1 + 64)];
}

uint64_t __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) layoutIfNeeded];
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);
    return v3();
  }
  return result;
}

- (BOOL)_contentViewShouldBeIndented
{
  if (![(UICollectionViewListCell *)self indentsAccessories]) {
    return 1;
  }
  v3 = [(UICellAccessoryManager *)self->_accessoryManager currentConfiguration];
  v4 = [v3 leadingAccessories];
  BOOL v5 = [v4 count] == 0;

  return v5;
}

- (BOOL)indentsAccessories
{
  return (*((unsigned __int16 *)&self->_listCellFlags + 2) >> 12) & 1;
}

- (void)_setLayoutAttributes:(id)a3
{
  v4 = (id *)a3;
  uint64_t v5 = *(_WORD *)(&self->_listCellFlags + 1) & 7;
  int64_t v6 = [(UICollectionReusableView *)self _styleFromLayoutAttributes:v4];
  unsigned int v7 = *(_WORD *)(&self->_listCellFlags + 1) & 8;
  int v8 = [(UICollectionReusableView *)self _isStyledAsHeaderOrFooterFromLayoutAttributes:v4];
  int v9 = v8;
  if (v6 != v5 || v8 != v7 >> 3) {
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
  }
  if (v9) {
    __int16 v10 = 8;
  }
  else {
    __int16 v10 = 0;
  }
  __int16 v11 = v10 & 0xFFF8 | v6 & 7 | *(_WORD *)(&self->_listCellFlags + 1) & 0xFFF0;
  *((_WORD *)&self->_listCellFlags + 2) = v11;
  if (v4 && ((_WORD)v4[36] & 3) == 0)
  {
    v12 = -[UIBarButtonItemGroup _items](v4);
    if ([v12 isEqualToString:@"UICollectionElementKindSectionFooter"]) {
      __int16 v13 = 16;
    }
    else {
      __int16 v13 = 0;
    }
    *((_WORD *)&self->_listCellFlags + 2) = *(_WORD *)(&self->_listCellFlags + 1) & 0xFFEF | v13;
  }
  else
  {
    *((_WORD *)&self->_listCellFlags + 2) = v11 & 0xFFEF;
  }
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewListCell;
  [(UICollectionViewCell *)&v15 _setLayoutAttributes:v4];
  if (v6 == v5)
  {
    unsigned int v14 = v7 >> 3;
    if (v7 >> 3 == v9)
    {
      if (![(UICollectionViewCell *)self _usingBackgroundViewConfiguration]) {
        [(UICollectionViewCell *)self _updateDefaultBackgroundAppearance];
      }
      goto LABEL_21;
    }
  }
  else
  {
    [(UICollectionViewListCell *)self _updateDefaultIndentationWidth];
    [(UICollectionViewListCell *)self _updateAccessoryLayoutMetrics];
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
    unsigned int v14 = v7 >> 3;
  }
  [(UICollectionViewCell *)self _updateDefaultBackgroundAppearance];
  if (v14 != v9)
  {
    [(UICollectionViewListCell *)self _updateCellSelectionTogglesExpansionState];
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
LABEL_21:
}

- (void)_createAccessoryManager
{
  v3 = [UICellAccessoryManager alloc];
  v4 = [(_UICollectionViewListCellVisualProvider *)self->_visualProvider accessoryManagerContainerView];
  uint64_t v5 = [(UICellAccessoryManager *)v3 initWithContainerView:v4];

  [(UICellAccessoryManager *)v5 setCurrentConfigurationIdentifier:0x1ED109440];
  objc_initWeak(&location, self);
  int64_t v6 = objc_alloc_init(UITableCellAccessoryLayout);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__UICollectionViewListCell__createAccessoryManager__block_invoke;
  v10[3] = &unk_1E52E4688;
  objc_copyWeak(&v11, &location);
  [(UITableCellAccessoryLayout *)v6 setSpacingBlock:v10];
  [(UICellAccessoryManager *)v5 setLeadingLayout:v6];
  unsigned int v7 = objc_alloc_init(UITableCellAccessoryLayout);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__UICollectionViewListCell__createAccessoryManager__block_invoke_2;
  v8[3] = &unk_1E52E4688;
  objc_copyWeak(&v9, &location);
  [(UITableCellAccessoryLayout *)v7 setSpacingBlock:v8];
  [(UICellAccessoryManager *)v5 setTrailingLayout:v7];
  objc_storeStrong((id *)&self->_accessoryManager, v5);
  [(UICollectionViewListCell *)self _updateAccessoryLayoutMetrics];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_updateAccessoryLayoutMetrics
{
  v3 = [(UIView *)self traitCollection];
  v4 = [(UICollectionViewListCell *)self _constants];
  BOOL v5 = (*(_WORD *)(&self->_listCellFlags + 1) & 7u) - 3 < 2;
  objc_initWeak(&location, self);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0xFFEFFFFFFFFFFFFFLL;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__UICollectionViewListCell__updateAccessoryLayoutMetrics__block_invoke;
  v17[3] = &unk_1E52E46D8;
  v20 = v22;
  id v6 = v3;
  id v18 = v6;
  id v7 = v4;
  id v19 = v7;
  BOOL v21 = v5;
  [(UICellAccessoryManager *)self->_accessoryManager setStandardLayoutWidthProvider:v17];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0xFFEFFFFFFFFFFFFFLL;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __57__UICollectionViewListCell__updateAccessoryLayoutMetrics__block_invoke_2;
  v12 = &unk_1E52E4700;
  unsigned int v14 = v16;
  id v8 = v7;
  id v13 = v8;
  objc_copyWeak(&v15, &location);
  [(UICellAccessoryManager *)self->_accessoryManager setDisclosureLayoutWidthProvider:&v9];
  [(UICellAccessoryManager *)self->_accessoryManager setNeedsLayout];
  objc_destroyWeak(&v15);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v22, 8);
  objc_destroyWeak(&location);
}

- (UITableConstants)_constants
{
  return self->_constants;
}

double __51__UICollectionViewListCell__createAccessoryManager__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _constants];
  [v8 interspaceBetweenInnerAccessoryIdentifier:v6 outerAccessoryIdentifier:v5 forCell:WeakRetained trailingAccessoryGroup:1];
  double v10 = v9;

  return v10;
}

- (double)_minimumCellAccessoryMargin
{
  return 0.0;
}

- (BOOL)_removesHighlightedAndSelectedStatesForBackground
{
  return (*((unsigned __int16 *)&self->_listCellFlags + 2) >> 6) & 1;
}

- (id)_configurationState
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewListCell;
  v3 = [(UICollectionViewCell *)&v5 _configurationState];
  [v3 setExpanded:(*((unsigned __int16 *)&self->_listCellFlags + 2) >> 7) & 1];
  return v3;
}

- (void)_updateConfigurationUsingState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewListCell;
  id v4 = a3;
  [(UICollectionViewCell *)&v6 _updateConfigurationUsingState:v4];
  -[UICollectionViewListCell _updateCurrentSystemTypeAccessoryViewsUsingState:](self, "_updateCurrentSystemTypeAccessoryViewsUsingState:", v4, v6.receiver, v6.super_class);

  objc_super v5 = [(UICollectionViewCell *)self _existingContentView];
  if (objc_opt_respondsToSelector()) {
    [v5 _defaultListContentConfigurationMayHaveChanged];
  }
}

void __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[88])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    return;
  }
  uint64_t v6 = [v2 _existingContentView];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = 2;
    id v4 = (void *)v6;
LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
    goto LABEL_8;
  }
  char v5 = objc_opt_respondsToSelector();
  id v4 = (void *)v6;
  if (v5)
  {
    uint64_t v3 = 3;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_updateCurrentSystemTypeAccessoryViewsUsingState:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x100) == 0)
  {
    char v5 = [(UICellAccessoryManager *)self->_accessoryManager configurations];
    if ([(NSArray *)self->_accessories count])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__UICollectionViewListCell__updateCurrentSystemTypeAccessoryViewsUsingState___block_invoke;
      aBlock[3] = &unk_1E52E4778;
      aBlock[4] = self;
      uint64_t v6 = &v29;
      id v29 = v4;
      id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
      id v8 = [v5 objectForKeyedSubscript:0x1ED109440];
      double v9 = [v8 leadingAccessories];
      v7[2](v7, v9);

      double v10 = [v5 objectForKeyedSubscript:0x1ED109440];
      id v11 = [v10 trailingAccessories];
      v7[2](v7, v11);

      v12 = [v5 objectForKeyedSubscript:0x1ED16D800];
      id v13 = [v12 leadingAccessories];
      v7[2](v7, v13);

      unsigned int v14 = [v5 objectForKeyedSubscript:0x1ED16D800];
      id v15 = [v14 trailingAccessories];
      v7[2](v7, v15);
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __77__UICollectionViewListCell__updateCurrentSystemTypeAccessoryViewsUsingState___block_invoke_2;
      v26[3] = &unk_1E52E47A0;
      v26[4] = self;
      id v27 = v4;
      id v7 = (void (**)(void *, void *))_Block_copy(v26);
      leadingAccessoryConfigurations = self->_leadingAccessoryConfigurations;
      v17 = [v5 objectForKeyedSubscript:0x1ED109440];
      id v18 = [v17 leadingAccessories];
      ((void (*)(void (**)(void *, void *), NSArray *, void *))v7[2])(v7, leadingAccessoryConfigurations, v18);

      trailingAccessoryConfigurations = self->_trailingAccessoryConfigurations;
      v20 = [v5 objectForKeyedSubscript:0x1ED109440];
      BOOL v21 = [v20 trailingAccessories];
      ((void (*)(void (**)(void *, void *), NSArray *, void *))v7[2])(v7, trailingAccessoryConfigurations, v21);

      leadingEditingAccessoryConfigurations = self->_leadingEditingAccessoryConfigurations;
      v23 = [v5 objectForKeyedSubscript:0x1ED16D800];
      v24 = [v23 leadingAccessories];
      ((void (*)(void (**)(void *, void *), NSArray *, void *))v7[2])(v7, leadingEditingAccessoryConfigurations, v24);

      uint64_t v6 = &v27;
      trailingEditingAccessoryConfigurations = self->_trailingEditingAccessoryConfigurations;
      unsigned int v14 = [v5 objectForKeyedSubscript:0x1ED16D800];
      id v15 = [v14 trailingAccessories];
      ((void (*)(void (**)(void *, void *), NSArray *, void *))v7[2])(v7, trailingEditingAccessoryConfigurations, v15);
    }
  }
}

void __77__UICollectionViewListCell__updateCurrentSystemTypeAccessoryViewsUsingState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    unint64_t v8 = [v5 count];
    unint64_t v9 = [v6 count];
    if (v8 >= v9) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      unint64_t v11 = 0;
      do
      {
        v12 = [v5 objectAtIndexedSubscript:v11];
        if ([v12 _isSystemType])
        {
          id v13 = [v6 objectAtIndexedSubscript:v11];
          unsigned int v14 = *(void **)(a1 + 32);
          id v15 = [v13 view];
          [v14 _updateSystemTypeAccessoryView:v15 withCellAccessory:0 orConfiguration:v12 usingState:*(void *)(a1 + 40)];
        }
        ++v11;
        unint64_t v16 = [v5 count];
        unint64_t v17 = [v6 count];
        if (v16 >= v17) {
          unint64_t v18 = v17;
        }
        else {
          unint64_t v18 = v16;
        }
      }
      while (v11 < v18);
    }
  }
  else
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v20 = [v5 count];
    uint64_t v21 = [v6 count];
    if (has_internal_diagnostics)
    {
      if (v20 != v21)
      {
        v22 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          int v25 = 138412546;
          id v26 = v5;
          __int16 v27 = 2112;
          id v28 = v6;
          _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "Configurations are out of sync with accessories! Configurations: %@; Accessories: %@",
            (uint8_t *)&v25,
            0x16u);
        }
      }
    }
    else if (v20 != v21)
    {
      v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke___s_category)+ 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v25 = 138412546;
        id v26 = v5;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Configurations are out of sync with accessories! Configurations: %@; Accessories: %@",
          (uint8_t *)&v25,
          0x16u);
      }
    }
    [*(id *)(a1 + 32) _setNeedsUpdateAccessories];
  }
}

- (UICollectionViewListCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewListCell;
  uint64_t v3 = -[UICollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    UICollectionViewListCellCommonInit(v3);
  }
  return v4;
}

+ (id)_createDefaultContentViewWithFrame:(CGRect)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UICollectionViewListCell;
  uint64_t v3 = objc_msgSendSuper2(&v5, sel__createDefaultContentViewWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v3 setEdgesPreservingSuperviewLayoutMargins:15];
  return v3;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (void)_setContentView:(id)a3 addToHierarchy:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_contentViewConstraints)
  {
    id v7 = [(UICollectionViewCell *)self contentView];

    if (v7 != v6)
    {
      [MEMORY[0x1E4F5B268] deactivateConstraints:self->_contentViewConstraints];
      contentViewConstraints = self->_contentViewConstraints;
      self->_contentViewConstraints = 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewListCell;
  [(UICollectionViewCell *)&v9 _setContentView:v6 addToHierarchy:v4];
  if (v6) {
    [(UICollectionViewListCell *)self _updateContentViewConstraintsIfNeeded];
  }
}

- (void)_clearChangeHandlersForOldContentView:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewListCell;
  [(UICollectionViewCell *)&v5 _clearChangeHandlersForOldContentView:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 _setPreferredSeparatorInsetsDidChangeHandler:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 _setDefaultListContentConfigurationProvider:0];
  }
}

- (void)_setupChangeHandlersForNewContentView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UICollectionViewListCell;
  [(UICollectionViewCell *)&v10 _setupChangeHandlersForNewContentView:v4];
  if (objc_opt_respondsToSelector())
  {
    self->_lastPreferredLeadingSeparatorInsetFromContentView = 1.79769313e308;
    self->_lastPreferredTrailingSeparatorInsetFromContentView = 1.79769313e308;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__UICollectionViewListCell__setupChangeHandlersForNewContentView___block_invoke;
    v7[3] = &unk_1E52DC308;
    objc_copyWeak(&v8, &location);
    [v4 _setPreferredSeparatorInsetsDidChangeHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__UICollectionViewListCell__setupChangeHandlersForNewContentView___block_invoke_2;
    v5[3] = &unk_1E52E46B0;
    objc_copyWeak(&v6, &location);
    [v4 _setDefaultListContentConfigurationProvider:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UICollectionViewCell *)self isEditing];
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewListCell;
  [(UICollectionViewCell *)&v9 setEditing:v3];
  if (v5 != [(UICollectionViewCell *)self isEditing])
  {
    id v6 = &_UITableCellAccessoryConfigurationIdentifierEditing;
    if (!v3) {
      id v6 = &_UITableCellAccessoryConfigurationIdentifierNormal;
    }
    [(UICellAccessoryManager *)self->_accessoryManager setCurrentConfigurationIdentifier:*v6];
    [(UICollectionViewListCell *)self _updateCellSelectionTogglesExpansionState];
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      id v7 = [(UICollectionViewCell *)self contentView];
      int v8 = [v7 translatesAutoresizingMaskIntoConstraints];

      if (v8) {
        [(UICollectionViewListCell *)self _layoutAccessoriesAndContentView];
      }
      else {
        [(UIView *)self layoutIfNeeded];
      }
    }
  }
}

- (BOOL)canBeEdited
{
  return 1;
}

- (void)layoutSubviews
{
  [(UICollectionViewListCell *)self _layoutAccessoriesAndContentView];
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewListCell;
  [(UICollectionViewCell *)&v3 layoutSubviews];
}

- (void)_updateLeadingLayoutMarginForIndentation
{
  double extraLeadingLayoutMarginForIndentation = self->_extraLeadingLayoutMarginForIndentation;
  BOOL v4 = [(UICollectionViewListCell *)self _shouldIncreaseCellLeadingLayoutMarginForIndentation];
  double v5 = 0.0;
  if (v4) {
    [(UICollectionViewListCell *)self _leadingIndentation];
  }
  self->_double extraLeadingLayoutMarginForIndentation = v5;
  if (v5 - extraLeadingLayoutMarginForIndentation != 0.0)
  {
    [(UIView *)self _rawLayoutMargins];
    -[UICollectionViewListCell _adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:](self, "_adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:");
    v6.receiver = self;
    v6.super_class = (Class)UICollectionViewListCell;
    [(UIView *)&v6 _setRawLayoutMargins:sel__setRawLayoutMargins_];
  }
}

- (UIEdgeInsets)_contentViewInset
{
  [(UICellAccessoryManager *)self->_accessoryManager contentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self safeAreaInsets];
  double v12 = UIEdgeInsetsMax(10, v4, v6, v8, v10, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if ([(UICollectionViewListCell *)self _contentViewShouldBeIndented])
  {
    BOOL v19 = [(UIView *)self _shouldReverseLayoutDirection];
    [(UICollectionViewListCell *)self _leadingIndentation];
    double v21 = v14 + v20;
    double v22 = v18 + v20;
    if (v19) {
      double v18 = v22;
    }
    else {
      double v14 = v21;
    }
  }
  double v23 = v12;
  double v24 = v14;
  double v25 = v16;
  double v26 = v18;
  result.double right = v26;
  result.bottom = v25;
  result.double left = v24;
  result.top = v23;
  return result;
}

- (double)_leadingIndentation
{
  return self->_indentationWidth * (double)self->_indentationLevel;
}

- (BOOL)_shouldIncreaseCellLeadingLayoutMarginForIndentation
{
  if ([(UICollectionViewListCell *)self indentsAccessories]) {
    return 1;
  }
  double v4 = [(UICellAccessoryManager *)self->_accessoryManager currentConfiguration];
  double v5 = [v4 leadingAccessories];
  BOOL v3 = [v5 count] == 0;

  return v3;
}

- (void)_layoutAccessoriesAndContentView
{
  [(UICollectionViewListCell *)self _updateLeadingLayoutMarginForIndentation];
  [(UICollectionViewCell *)self _layoutFocusedFloatingContentView];
  [(UICollectionViewListCell *)self _updateAccessoriesIfNeeded];
  [(UICellAccessoryManager *)self->_accessoryManager layoutIfNeeded];
  [(UICollectionViewListCell *)self _updateContentViewConstraintsIfNeeded];
  [(UICollectionViewCell *)self _layoutContentView];
}

- (void)_updateContentViewConstraintsIfNeeded
{
  v46[4] = *MEMORY[0x1E4F143B8];
  if (self->_separatorLayoutGuide
    && ![(UICollectionViewCell *)self _usingContentViewConfiguration])
  {
    [(UICollectionViewListCell *)self _contentViewInset];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    contentViewConstraints = self->_contentViewConstraints;
    if (contentViewConstraints)
    {
      if ([(NSArray *)contentViewConstraints count] != 4)
      {
        v38 = [MEMORY[0x1E4F28B00] currentHandler];
        [v38 handleFailureInMethod:a2, self, @"UICollectionViewListCell.m", 386, @"The _contentViewConstraints should hold exactly 4 constraints, in order: top, left, bottom, right" object file lineNumber description];
      }
      double v15 = [(NSArray *)self->_contentViewConstraints objectAtIndexedSubscript:0];
      [v15 setConstant:v7];

      double v16 = [(NSArray *)self->_contentViewConstraints objectAtIndexedSubscript:1];
      [v16 setConstant:v9];

      double v17 = [(NSArray *)self->_contentViewConstraints objectAtIndexedSubscript:2];
      [v17 setConstant:v11];

      id v39 = [(NSArray *)self->_contentViewConstraints objectAtIndexedSubscript:3];
      [v39 setConstant:v13];
    }
    else
    {
      double v18 = [(UICollectionViewCell *)self contentView];
      [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
      BOOL v19 = [v18 topAnchor];
      double v20 = [(UIView *)self topAnchor];
      double v21 = [v19 constraintEqualToAnchor:v20 constant:v7];

      [v21 setIdentifier:@"UICollectionViewListCell-top-contentView-constraint"];
      double v22 = [v18 leftAnchor];
      double v23 = [(UIView *)self leftAnchor];
      double v24 = [v22 constraintEqualToAnchor:v23 constant:v9];

      [v24 setIdentifier:@"UICollectionViewListCell-left-contentView-constraint"];
      double v25 = [(UIView *)self bottomAnchor];
      double v26 = [v18 bottomAnchor];
      __int16 v27 = [v25 constraintEqualToAnchor:v26 constant:v11];

      [v27 setIdentifier:@"UICollectionViewListCell-bottom-contentView-constraint"];
      id v28 = [(UIView *)self rightAnchor];
      uint64_t v29 = [v18 rightAnchor];
      v30 = [v28 constraintEqualToAnchor:v29 constant:v13];

      [v30 setIdentifier:@"UICollectionViewListCell-right-contentView-constraint"];
      id v40 = v21;
      v46[0] = v21;
      v46[1] = v24;
      v46[2] = v27;
      v46[3] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
      v32 = self->_contentViewConstraints;
      self->_contentViewConstraints = v31;

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v33 = self->_contentViewConstraints;
      uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v42 != v36) {
              objc_enumerationMutation(v33);
            }
            [*(id *)(*((void *)&v41 + 1) + 8 * i) setShouldBeArchived:1];
          }
          uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v35);
      }

      [MEMORY[0x1E4F5B268] activateConstraints:self->_contentViewConstraints];
    }
  }
  else if (self->_contentViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
    double v4 = self->_contentViewConstraints;
    self->_contentViewConstraints = 0;

    double v5 = [(UICollectionViewCell *)self contentView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:1];

    [(UIView *)self setNeedsLayout];
  }
}

- (void)_updateAccessoriesIfNeeded
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x100) != 0)
  {
    *((_WORD *)&self->_listCellFlags + 2) &= ~0x100u;
    [(UICollectionViewListCell *)self _updateCellSelectionTogglesExpansionState];
    BOOL v3 = objc_alloc_init(UICellAccessoryConfiguration);
    double v4 = objc_alloc_init(UICellAccessoryConfiguration);
    if ([(NSArray *)self->_accessories count])
    {
      [(UICollectionViewListCell *)self _applyCellAccessoriesToNormalConfiguration:v3 editingConfiguration:v4];
    }
    else
    {
      double v5 = [(UICollectionViewListCell *)self _cellAccessoriesForConfigurations:self->_leadingAccessoryConfigurations isLeadingEdge:1];
      [(UICellAccessoryConfiguration *)v3 setLeadingAccessories:v5];

      double v6 = [(UICollectionViewListCell *)self _cellAccessoriesForConfigurations:self->_trailingAccessoryConfigurations isLeadingEdge:0];
      [(UICellAccessoryConfiguration *)v3 setTrailingAccessories:v6];

      double v7 = [(UICollectionViewListCell *)self _cellAccessoriesForConfigurations:self->_leadingEditingAccessoryConfigurations isLeadingEdge:1];
      [(UICellAccessoryConfiguration *)v4 setLeadingAccessories:v7];

      double v8 = [(UICollectionViewListCell *)self _cellAccessoriesForConfigurations:self->_trailingEditingAccessoryConfigurations isLeadingEdge:0];
      [(UICellAccessoryConfiguration *)v4 setTrailingAccessories:v8];
    }
    v10[0] = 0x1ED109440;
    v10[1] = 0x1ED16D800;
    v11[0] = v3;
    v11[1] = v4;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    [(UICellAccessoryManager *)self->_accessoryManager setConfigurations:v9];
  }
}

- (id)_cellAccessoriesForConfigurations:(id)a3 isLeadingEdge:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    double v7 = [(UICollectionViewCell *)self configurationState];
    double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v6;
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
          double v14 = -[UICollectionViewListCell _cellAccessoryForConfiguration:isLeadingEdge:usingState:](self, "_cellAccessoryForConfiguration:isLeadingEdge:usingState:", *(void *)(*((void *)&v16 + 1) + 8 * i), v4, v7, (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    double v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)_defaultBackgroundView
{
  BOOL v3 = objc_alloc_init(_UICollectionViewListCellBackgroundView);
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v4 = [(UICollectionViewListCell *)self _constants];
  int64_t v5 = [(UICollectionViewListCell *)self _tableStyle];
  id v6 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  double v7 = [(UIView *)self traitCollection];
  if (v4)
  {
    [v4 defaultCellBackgroundPropertiesForTableViewStyle:v5 state:v6 traitCollection:v7];
  }
  else
  {
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
  }

  [(UIView *)v3 setBackgroundColor:*((void *)&v9 + 1)];
  __destructor_8_s8_s16_s24_s80((uint64_t)&v9);
  return v3;
}

- (int64_t)_tableStyle
{
  unint64_t v2 = (*(_WORD *)(&self->_listCellFlags + 1) & 7) - 1;
  if (v2 > 2) {
    return 0;
  }
  else {
    return qword_186B93E40[v2];
  }
}

- (id)_preferredLayoutAttributesFittingAttributes:(id)a3 isAnimatingExistingView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id *)a3;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __96__UICollectionViewListCell__preferredLayoutAttributesFittingAttributes_isAnimatingExistingView___block_invoke;
  v23[3] = &unk_1E52D9F70;
  v23[4] = self;
  +[UIView _conditionallyPerformWithoutAnimation:v4 ^ 1 layout:v23];
  uint64_t v7 = -[UICollectionViewLayoutAttributes _existingListAttributes](v6);
  double v8 = (void *)v7;
  if (v7) {
    long long v9 = *(void **)(v7 + 32);
  }
  else {
    long long v9 = 0;
  }
  long long v10 = v9;

  if (!v10)
  {
    p_sectionSeparatorInsets = &self->_sectionSeparatorInsets;
    goto LABEL_8;
  }
  id v11 = v10[1];
  p_sectionSeparatorInsets = &self->_sectionSeparatorInsets;
  if (!v11)
  {
LABEL_8:
    long long v13 = 0;
    *(_OWORD *)&p_sectionSeparatorInsets->top = 0u;
    *(_OWORD *)&p_sectionSeparatorInsets->bottom = 0u;
    char v18 = 1;
    goto LABEL_9;
  }
  long long v13 = v11;
  [v11 bottomSeparatorInsets];
  p_sectionSeparatorInsets->top = v14;
  self->_sectionSeparatorInsets.leading = v15;
  self->_sectionSeparatorInsets.bottom = v16;
  self->_sectionSeparatorInsets.trailing = v17;
  [(UICollectionViewListCell *)self _updateSeparatorLayoutGuideForSectionSeparatorInsets:"_updateSeparatorLayoutGuideForSectionSeparatorInsets:"];
  char v18 = 0;
LABEL_9:
  v22.receiver = self;
  v22.super_class = (Class)UICollectionViewListCell;
  long long v19 = [(UICollectionReusableView *)&v22 _preferredLayoutAttributesFittingAttributes:v6 isAnimatingExistingView:v4];
  if ((v18 & 1) == 0 && ([v13 _ignoreBottomSeparatorInsetsFromCell] & 1) == 0)
  {
    [v19 bounds];
    -[UICollectionViewListCell _updateSeparatorConfigurationForPreferredAttributes:bounds:isAnimatingExistingView:](self, "_updateSeparatorConfigurationForPreferredAttributes:bounds:isAnimatingExistingView:", v13, v4);
    -[UIViewAnimationContext setViewAnimations:]((uint64_t)v10, v13);
    double v20 = -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](v19);
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v20, v10);
  }
  return v19;
}

- (void)_updateSeparatorLayoutGuideForSectionSeparatorInsets:(NSDirectionalEdgeInsets)a3
{
  if (!self->_separatorLayoutGuide) {
    return;
  }
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  id v28 = [(UICollectionViewCell *)self _existingContentView];
  char v8 = objc_opt_respondsToSelector();
  if ((v8 & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    long long v9 = 0;
  }
  else
  {
    long long v9 = [v28 _primaryTextLayoutRect];
  }
  long long v10 = [(UICollectionViewListCell *)self separatorLayoutGuide];
  BOOL v11 = [(NSLayoutConstraint *)self->_separatorLayoutGuideLeadingConstraint isActive];
  if (v9)
  {
    if (!v11 || (*(_WORD *)(&self->_listCellFlags + 1) & 0x2000) == 0)
    {
      long long v12 = self->_separatorLayoutGuideLeadingConstraint;
      [(NSLayoutConstraint *)v12 setActive:0];
      long long v13 = [v10 leadingAnchor];
      CGFloat v14 = [v9 leadingAnchor];
      _ListCellCreateSeparatorLayoutGuideLeadingConstraint(v13, v14, @"UICollectionViewListCell-primaryText-leading-separatorLayoutGuide-constraint");
      CGFloat v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      _ListCellReplaceSystemConstraintInLayoutGuide(v10, v12, v15);
      [(NSLayoutConstraint *)v15 setActive:1];
      separatorLayoutGuideLeadingConstraint = self->_separatorLayoutGuideLeadingConstraint;
      self->_separatorLayoutGuideLeadingConstraint = v15;

      *((_WORD *)&self->_listCellFlags + 2) |= 0x2000u;
LABEL_14:
    }
  }
  else if (!v11 || (*(_WORD *)(&self->_listCellFlags + 1) & 0x2000) != 0)
  {
    long long v12 = self->_separatorLayoutGuideLeadingConstraint;
    [(NSLayoutConstraint *)v12 setActive:0];
    CGFloat v17 = [v10 leadingAnchor];
    char v18 = [(UICollectionViewListCell *)self _owningViewForSeparatorLayoutGuide];
    long long v19 = [v18 leadingAnchor];
    _ListCellCreateSeparatorLayoutGuideLeadingConstraint(v17, v19, @"UICollectionViewListCell-leading-separatorLayoutGuide-constraint");
    double v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    _ListCellReplaceSystemConstraintInLayoutGuide(v10, v12, v20);
    [(NSLayoutConstraint *)v20 setActive:1];
    uint64_t v21 = self->_separatorLayoutGuideLeadingConstraint;
    self->_separatorLayoutGuideLeadingConstraint = v20;

    *((_WORD *)&self->_listCellFlags + 2) &= ~0x2000u;
    goto LABEL_14;
  }
  objc_super v22 = [(UICollectionViewListCell *)self _owningViewForSeparatorLayoutGuide];

  if (v22 != self)
  {
    double v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"UICollectionViewListCell.m" lineNumber:2338 description:@"The separatorLayoutGuide is expected to be added directly to the cell"];

    if ((v8 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v8)
  {
LABEL_17:
    -[UICollectionViewListCell _preferredSeparatorInsetsFromContentViewWithDefaultInsets:](self, "_preferredSeparatorInsetsFromContentViewWithDefaultInsets:", top, leading, bottom, trailing);
    double leading = v23;
    double trailing = v24;
  }
LABEL_18:
  double v25 = 0.0;
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x2000) == 0) {
    double v25 = leading;
  }
  [(NSLayoutConstraint *)self->_separatorLayoutGuideLeadingConstraint setConstant:v25];
  [(NSLayoutConstraint *)self->_separatorLayoutGuideTrailingConstraint setConstant:-trailing];
}

- (void)_updateSeparatorConfigurationForPreferredAttributes:(id)a3 bounds:(CGRect)a4 isAnimatingExistingView:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  double top = self->_sectionSeparatorInsets.top;
  double leading = self->_sectionSeparatorInsets.leading;
  double bottom = self->_sectionSeparatorInsets.bottom;
  double trailing = self->_sectionSeparatorInsets.trailing;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke;
  v38[3] = &unk_1E52E4728;
  v38[4] = self;
  v38[5] = &v39;
  __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke((uint64_t)v38);
  __int16 v15 = *((_WORD *)&self->_listCellFlags + 2);
  BOOL v17 = (v15 & 0x4000) == 0 && v40[3] == 0;
  [(UIView *)self bounds];
  double v35 = v19;
  double v36 = v18;
  double v33 = v21;
  double v34 = v20;
  if (!v17)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __111__UICollectionViewListCell__updateSeparatorConfigurationForPreferredAttributes_bounds_isAnimatingExistingView___block_invoke_2;
    v37[3] = &unk_1E52E4750;
    *(CGFloat *)&v37[6] = x;
    *(CGFloat *)&v37[7] = y;
    *(CGFloat *)&v37[8] = width;
    v37[9] = v32;
    v37[4] = self;
    v37[5] = &v39;
    v37[10] = v38;
    +[UIView _conditionallyPerformWithoutAnimation:!v5 layout:v37];
  }
  uint64_t v22 = v40[3];
  switch(v22)
  {
    case 3:
      -[UICollectionViewListCell _separatorInsetsFromPrimaryTextLayoutFrameWithDefaultInsets:](self, "_separatorInsetsFromPrimaryTextLayoutFrameWithDefaultInsets:", top, leading, bottom, trailing);
      break;
    case 2:
      -[UICollectionViewListCell _preferredSeparatorInsetsFromContentViewWithDefaultInsets:](self, "_preferredSeparatorInsetsFromContentViewWithDefaultInsets:", top, leading, bottom, trailing);
      break;
    case 1:
      [(UICollectionViewListCell *)self _separatorInsetsFromLayoutGuide];
      break;
    default:
      goto LABEL_16;
  }
  double top = v23;
  double leading = v24;
  double bottom = v25;
  double trailing = v26;
LABEL_16:
  if ((v15 & 0x4000) != 0)
  {
    -[UICollectionViewListCell _preferredSeparatorInsetsForProposedInsets:](self, "_preferredSeparatorInsetsForProposedInsets:", top, leading, bottom, trailing);
    double top = v27;
    double leading = v28;
    double bottom = v29;
    double trailing = v30;
  }
  objc_msgSend(v10, "setBottomSeparatorInsets:", top, leading, bottom, trailing);
  if (([v10 _ignoreTopSeparatorInsetsFromCell] & 1) == 0) {
    objc_msgSend(v10, "setTopSeparatorInsets:", top, leading, bottom, trailing);
  }
  if (!v17 && v5)
  {
    [(UIView *)self bounds];
    v44.origin.CGFloat y = v35;
    v44.origin.CGFloat x = v36;
    v44.size.CGFloat height = v33;
    v44.size.CGFloat width = v34;
    if (!CGRectEqualToRect(v43, v44)) {
      -[UIView setBounds:](self, "setBounds:", v36, v35, v34, v33);
    }
  }
  _Block_object_dispose(&v39, 8);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  [(UICollectionViewCell *)self isSelected];
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewListCell;
  [(UICollectionViewCell *)&v5 setSelected:v3];
}

- (BOOL)_canFocusProgrammatically
{
  return [(_UICollectionViewListCellVisualProvider *)self->_visualProvider canFocusProgrammatically];
}

- (void)_constantsDidChange
{
  [(UICollectionViewCell *)self _updateDefaultBackgroundAppearance];
  [(UICollectionViewListCell *)self _setNeedsUpdateAccessories];
}

- (id)_defaultBackgroundConfiguration
{
  __int16 v2 = *((_WORD *)&self->_listCellFlags + 2);
  switch(v2 & 7)
  {
    case 1:
      if ((v2 & 0x28) != 0) {
        goto LABEL_3;
      }
      BOOL v3 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
      break;
    case 2:
      if ((v2 & 0x28) != 0) {
        +[UIBackgroundConfiguration _listInsetGroupedHeaderFooterConfiguration];
      }
      else {
        +[UIBackgroundConfiguration _listInsetGroupedCellConfiguration];
      }
      goto LABEL_8;
    case 3:
      if ((v2 & 0x28) != 0)
      {
        if (dyld_program_sdk_at_least() && (v2 & 0x10) != 0)
        {
LABEL_3:
          BOOL v3 = +[UIBackgroundConfiguration listGroupedHeaderFooterConfiguration];
        }
        else
        {
          BOOL v3 = +[UIBackgroundConfiguration listSidebarHeaderConfiguration];
        }
      }
      else
      {
        if ([(UICollectionViewListCell *)self _isAccompaniedSidebar]) {
          +[UIBackgroundConfiguration listAccompaniedSidebarCellConfiguration];
        }
        else {
          +[UIBackgroundConfiguration listSidebarCellConfiguration];
        }
        BOOL v3 = LABEL_8:;
      }
      break;
    case 4:
      if ((v2 & 0x28) != 0) {
        goto LABEL_14;
      }
      BOOL v3 = +[UIBackgroundConfiguration _sidebarPlainCellConfiguration]();
      break;
    default:
      if ((v2 & 0x28) != 0)
      {
LABEL_14:
        BOOL v3 = +[UIBackgroundConfiguration listPlainHeaderFooterConfiguration];
      }
      else
      {
        BOOL v3 = +[UIBackgroundConfiguration listPlainCellConfiguration];
      }
      break;
  }
  return v3;
}

- (void)_updateSystemTypeAccessoryView:(id)a3 withCellAccessory:(id)a4 orConfiguration:(id)a5 usingState:(id)a6
{
  id v102 = a3;
  id v11 = a4;
  id v12 = a5;
  id v101 = a6;
  if (([v11 _isSystemType] & 1) == 0 && (objc_msgSend(v12, "_isSystemType") & 1) == 0)
  {
    v95 = [MEMORY[0x1E4F28B00] currentHandler];
    v96 = NSStringFromSelector(a2);
    [v95 handleFailureInMethod:a2, self, @"UICollectionViewListCell.m", 1446, @"%@ can only be called for system type accessories", v96 object file lineNumber description];
  }
  SEL v99 = a2;
  if (v11) {
    long long v13 = v11;
  }
  else {
    long long v13 = v12;
  }
  uint64_t v14 = [v13 _systemType];
  __int16 v15 = *((_WORD *)&self->_listCellFlags + 2);
  CGFloat v16 = [(UIView *)self traitCollection];
  uint64_t v17 = [v16 _splitViewControllerContext];

  uint64_t v18 = *(_WORD *)(&self->_listCellFlags + 1) & 7;
  if (v18 == 4)
  {
    uint64_t v19 = 3;
  }
  else if (v18 == 3)
  {
    if (v17 == 2) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 1;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  if (v11) {
    double v20 = v11;
  }
  else {
    double v20 = v12;
  }
  double v21 = [v20 tintColor];
  int v22 = v15 & 0x28;
  if (v21)
  {
    if (v11)
    {
LABEL_19:
      double v23 = v11;
      goto LABEL_22;
    }
  }
  else
  {
    double v24 = [(UICollectionViewListCell *)self _constants];
    [(UIView *)self traitCollection];
    v26 = id v25 = v12;
    double v27 = [(UIView *)self tintColor];
    double v21 = [v24 defaultAccessoryTintColorForAccessorySystemType:v14 header:v22 != 0 sidebarStyle:v19 cellConfigurationState:v101 traitCollection:v26 inheritedTintColor:v27];

    id v12 = v25;
    if (v11) {
      goto LABEL_19;
    }
  }
  double v23 = v12;
LABEL_22:
  double v28 = [v23 _backgroundColor];
  if (!v28)
  {
    BOOL v29 = v22 != 0;
    [(UICollectionViewListCell *)self _constants];
    v31 = id v30 = v12;
    uint64_t v32 = [(UIView *)self traitCollection];
    double v28 = [v31 defaultAccessoryBackgroundColorForAccessorySystemType:v14 header:v29 sidebarStyle:v19 cellConfigurationState:v101 traitCollection:v32];

    id v12 = v30;
  }
  switch(v14)
  {
    case 0:
      double v33 = [(UICollectionViewListCell *)self _constants];
      double v34 = [v33 defaultDisclosureImageForCell:self withAccessoryBaseColor:v21];

      double v35 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v35);
      objc_claimAutoreleasedReturnValue();
      double v36 = [(UICollectionViewListCell *)self _constants];
      [v102 setConstants:v36];

      [v102 setImage:v34];
      break;
    case 1:
      v38 = [(UICollectionViewListCell *)self _constants];
      uint64_t v39 = [v38 defaultCheckmarkImageForCell:self];

      if (v21)
      {
        uint64_t v40 = [v39 imageWithTintColor:v21 renderingMode:1];

        uint64_t v39 = (void *)v40;
      }
      uint64_t v41 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v41);
      objc_claimAutoreleasedReturnValue();
      [v102 setImage:v39];

      break;
    case 2:
      uint64_t v42 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v42);
      objc_claimAutoreleasedReturnValue();
      CGRect v43 = (objc_class *)objc_opt_class();
      if (v11)
      {
        _accessoryAsClass(v11, v43);
        id v44 = [(id)objc_claimAutoreleasedReturnValue() actionHandler];
        v45 = v11;
      }
      else
      {
        _accessoryConfigurationAsClass(v12, v43);
        id v44 = [(id)objc_claimAutoreleasedReturnValue() actionHandler];
        v45 = v12;
      }

      if (v44) {
        [v102 removeTarget:self action:sel__deleteAccessoryTriggered forControlEvents:0x2000];
      }
      else {
        [v102 addTarget:self action:sel__deleteAccessoryTriggered forControlEvents:0x2000];
      }
      [v102 setActionHandler:v44];
      goto LABEL_68;
    case 3:
      v46 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v46);
      objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      if (v11)
      {
        _accessoryAsClass(v11, v47);
        id v44 = [(id)objc_claimAutoreleasedReturnValue() actionHandler];
        v48 = v11;
      }
      else
      {
        _accessoryConfigurationAsClass(v12, v47);
        id v44 = [(id)objc_claimAutoreleasedReturnValue() actionHandler];
        v48 = v12;
      }

      [v102 setActionHandler:v44];
      [v102 setUserInteractionEnabled:v44 != 0];
LABEL_68:
      v87 = [(UICollectionViewListCell *)self _constants];
      [v102 setConstants:v87];

      v59 = v102;
      id v60 = v21;
      goto LABEL_69;
    case 4:
      v49 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v49);
      objc_claimAutoreleasedReturnValue();
      v50 = [(UICollectionViewListCell *)self _constants];
      [v102 setConstants:v50];

      [v102 setAccessoryTintColor:v21];
      goto LABEL_71;
    case 5:
      v51 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v51);
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setSelected:", -[UICollectionViewCell isSelected](self, "isSelected"));
      v52 = [(UICollectionViewListCell *)self _constants];
      [v102 setConstants:v52];

      id v44 = v21;
      BOOL v53 = [(UICollectionViewCell *)self isSelected];
      if (v12 && v53)
      {
        v54 = (objc_class *)objc_opt_class();
        _accessoryConfigurationAsClass(v12, v54);
        uint64_t v55 = [(id)objc_claimAutoreleasedReturnValue() selectedTintColor];
        v56 = (void *)v55;
        if (v55) {
          v57 = (void *)v55;
        }
        else {
          v57 = v44;
        }
        id v58 = v57;

        id v44 = v58;
      }
      v59 = v102;
      id v60 = v44;
LABEL_69:
      [v59 setAccessoryTintColor:v60];
      [v102 setAccessoryBackgroundColor:v28];
      goto LABEL_70;
    case 6:
      id v61 = v102;
      v62 = (objc_class *)objc_opt_class();
      if (v11)
      {
        _accessoryAsClass(v11, v62);
        v63 = [(id)objc_claimAutoreleasedReturnValue() _customImage];
        [v11 rotationAngle];
        double v65 = v64;
        v97 = [v11 actionHandler];
        uint64_t v66 = 0;
        v67 = v11;
      }
      else
      {
        _accessoryConfigurationAsClass(v12, v62);
        v63 = [(id)objc_claimAutoreleasedReturnValue() _customImage];
        uint64_t v66 = [v12 selectedTintColor];
        [v12 rotationAngle];
        double v65 = v81;
        v97 = 0;
        v67 = v12;
      }

      v82 = [(UICollectionViewListCell *)self _constants];
      if (!v63)
      {
        if (objc_opt_respondsToSelector())
        {
          v63 = [v82 defaultOutlineDisclosureImageForView:self];
        }
        else
        {
          v63 = 0;
        }
      }
      v100 = v82;
      id v88 = v21;
      id v98 = v12;
      if ([(UICollectionViewCell *)self isSelected])
      {
        v89 = (void *)v66;
        if (v66) {
          v90 = (void *)v66;
        }
        else {
          v90 = v88;
        }
        id v91 = v90;

        id v88 = v91;
      }
      else
      {
        v89 = (void *)v66;
      }
      [v61 setAccessoryTintColor:v88];
      v92 = [(UICollectionViewListCell *)self _constants];
      [v61 setConstants:v92];

      [v61 setImage:v63];
      [v61 setRotationAngle:v65];
      objc_msgSend(v61, "setRotated:", objc_msgSend(v101, "isExpanded"));
      v93 = [v61 control];
      v94 = v93;
      if (v97) {
        [v93 removeTarget:self action:sel__toggleExpansionState forControlEvents:0x2000];
      }
      else {
        [v93 addTarget:self action:sel__toggleExpansionState forControlEvents:0x2000];
      }

      [v61 setActionHandler:v97];
      id v12 = v98;
      break;
    case 7:
      v68 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v68);
      objc_claimAutoreleasedReturnValue();
      v69 = (objc_class *)objc_opt_class();
      if (v11)
      {
        _accessoryAsClass(v11, v69);
        v70 = [(id)objc_claimAutoreleasedReturnValue() text];
        v71 = [v11 font];
        uint64_t v72 = [v11 adjustsFontForContentSizeCategory];
        v73 = v11;
      }
      else
      {
        _accessoryConfigurationAsClass(v12, v69);
        v70 = [(id)objc_claimAutoreleasedReturnValue() text];
        v71 = [v12 font];
        uint64_t v72 = [v12 adjustsFontForContentSizeCategory];
        v73 = v12;
      }

      [v102 setFont:v71];
      [v102 setAdjustsFontForContentSizeCategory:v72];
      [v102 setText:v70];
      [v102 setTextColor:v21];

      goto LABEL_71;
    case 8:
      [v102 setBackgroundColor:v21];
      break;
    case 9:
      id v74 = v102;
      v75 = (objc_class *)objc_opt_class();
      _accessoryAsClass(v11, v75);
      v76 = [(id)objc_claimAutoreleasedReturnValue() actionHandler];
      [v74 setActionHandler:v76];
      [v74 setUserInteractionEnabled:v76 != 0];
      v77 = [(UICollectionViewListCell *)self _constants];
      [v74 setConstants:v77];

      [v74 setAccessoryTintColor:v21];
      [v74 setAccessoryBackgroundColor:v28];

      break;
    case 10:
      v78 = (objc_class *)objc_opt_class();
      _accessoryViewAsClass(v102, v78);
      objc_claimAutoreleasedReturnValue();
      id v44 = [(UICollectionViewListCell *)self _constants];
      [v102 setConstants:v44];
      if (objc_opt_respondsToSelector())
      {
        v79 = [(UIView *)self traitCollection];
        v80 = [v44 defaultPopUpMenuIndicatorImageForTraitCollection:v79];
      }
      else
      {
        v80 = 0;
      }
      [v102 setImage:v80];
      if (v21)
      {
        [v102 setAccessoryTintColor:v21];
      }
      else
      {
        v83 = +[UIColor secondaryLabelColor];
        [v102 setAccessoryTintColor:v83];
      }
      v84 = (objc_class *)objc_opt_class();
      _accessoryAsClass(v11, v84);
      v85 = [(id)objc_claimAutoreleasedReturnValue() selectedElementDidChangeHandler];
      [v102 setSelectedElementDidChangeHandler:v85];

      v86 = [v11 _internalMenu];
      [v102 setMenu:v86];

LABEL_70:
LABEL_71:

      break;
    default:
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v99, self, @"UICollectionViewListCell.m", 1621, @"Invalid _UICellAccessorySystemType value: %ld", v14);

      break;
  }
}

- (void)_applyCellAccessoriesToNormalConfiguration:(id)a3 editingConfiguration:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v47 = a4;
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int v6 = *(_WORD *)(&self->_listCellFlags + 1) & 8;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v46 = self;
  uint64_t v7 = self->_accessories;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    BOOL v53 = 0;
    id v11 = 0;
    v51 = 0;
    uint64_t v12 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v62 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        unint64_t v15 = [v14 displayedState];
        uint64_t v16 = [v14 _defaultPlacementForHeader:v6 != 0];
        if ((v15 & 0xFFFFFFFFFFFFFFFDLL) == 0)
        {
          char v17 = [v14 _isSystemType];
          if (v16)
          {
            if (v17)
            {
              id v18 = v52;
            }
            else if (v11)
            {
              id v18 = v11;
            }
            else
            {
              id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              id v11 = v18;
            }
          }
          else if (v17)
          {
            id v18 = v49;
          }
          else
          {
            id v18 = v51;
            if (!v51)
            {
              id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v51 = v18;
            }
          }
          [v18 addObject:v14];
        }
        if (v15 <= 1)
        {
          char v19 = [v14 _isSystemType];
          if (v16)
          {
            if (v19)
            {
              id v20 = v54;
            }
            else if (v10)
            {
              id v20 = v10;
            }
            else
            {
              id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              id v10 = v20;
            }
          }
          else if (v19)
          {
            id v20 = v50;
          }
          else
          {
            id v20 = v53;
            if (!v53)
            {
              id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              BOOL v53 = v20;
            }
          }
          [v20 addObject:v14];
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
    BOOL v53 = 0;
    id v11 = 0;
    v51 = 0;
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke;
  aBlock[3] = &unk_1E52E47C8;
  char v60 = v6 >> 3;
  aBlock[4] = v46;
  void aBlock[5] = a2;
  id v44 = _Block_copy(aBlock);
  [v49 sortUsingComparator:v44];
  [v52 sortUsingComparator:v44];
  [v50 sortUsingComparator:v44];
  [v54 sortUsingComparator:v44];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_2;
  v58[3] = &unk_1E52E47F0;
  v58[4] = v46;
  v58[5] = a2;
  double v21 = (void (**)(void *, void *, id))_Block_copy(v58);
  int v22 = [v51 objectEnumerator];
  double v23 = v21;
  double v24 = v21[2];
  v21 += 2;
  id v25 = v23;
  v24(v23, v22, v49);

  double v26 = [v11 reverseObjectEnumerator];
  (*v21)(v25, v26, v52);

  double v27 = [v53 objectEnumerator];
  (*v21)(v25, v27, v50);

  double v28 = [v10 reverseObjectEnumerator];
  (*v21)(v25, v28, v54);

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_3;
  v57[3] = &unk_1E52DA850;
  v57[4] = v46;
  CGRect v43 = (void (**)(void *, id))_Block_copy(v57);
  v43[2](v43, v52);
  v43[2](v43, v54);
  BOOL v29 = [(UICollectionViewCell *)v46 configurationState];
  id v30 = [(UICollectionViewListCell *)v46 _internalAccessoriesForCellAccessories:v49 usingState:v29];
  [v48 setLeadingAccessories:v30];

  v31 = [(UICollectionViewListCell *)v46 _internalAccessoriesForCellAccessories:v52 usingState:v29];
  [v48 setTrailingAccessories:v31];

  uint64_t v32 = [(UICollectionViewListCell *)v46 _internalAccessoriesForCellAccessories:v50 usingState:v29];
  [v47 setLeadingAccessories:v32];

  double v33 = [(UICollectionViewListCell *)v46 _internalAccessoriesForCellAccessories:v54 usingState:v29];
  [v47 setTrailingAccessories:v33];

  double v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](v46->_accessories, "count"));
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_5;
  v55[3] = &unk_1E52E4838;
  double v35 = v34;
  v56 = v35;
  double v36 = (void (**)(void *, id, void *))_Block_copy(v55);
  v37 = [v48 leadingAccessories];
  v36[2](v36, v49, v37);

  v38 = [v48 trailingAccessories];
  v36[2](v36, v52, v38);

  uint64_t v39 = [v47 leadingAccessories];
  v36[2](v36, v50, v39);

  uint64_t v40 = [v47 trailingAccessories];
  v36[2](v36, v54, v40);

  accessoriesByIdentifier = v46->_accessoriesByIdentifier;
  v46->_accessoriesByIdentifier = v35;
  uint64_t v42 = v35;
}

void __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v8 = [v5 count];
  uint64_t v9 = [v6 count];
  if (has_internal_diagnostics)
  {
    if (v8 != v9)
    {
      double v21 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        int v24 = 138412546;
        id v25 = v5;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "Cell and internal accessory counts do not match! Cell accessories: %@; Internal accessories: %@",
          (uint8_t *)&v24,
          0x16u);
      }
    }
  }
  else if (v8 != v9)
  {
    int v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke_2___s_category)+ 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138412546;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Cell and internal accessory counts do not match! Cell accessories: %@; Internal accessories: %@",
        (uint8_t *)&v24,
        0x16u);
    }
  }
  unint64_t v10 = [v5 count];
  unint64_t v11 = [v6 count];
  if (v10 >= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = *(void **)(a1 + 32);
      unint64_t v15 = [v5 objectAtIndexedSubscript:v13];
      uint64_t v16 = [v6 objectAtIndexedSubscript:v13];
      char v17 = [v16 identifier];
      [v14 setObject:v15 forKey:v17];

      ++v13;
      unint64_t v18 = [v5 count];
      unint64_t v19 = [v6 count];
      if (v18 >= v19) {
        unint64_t v20 = v19;
      }
      else {
        unint64_t v20 = v18;
      }
    }
    while (v13 < v20);
  }
}

void __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v12 = [v11 position];
        unint64_t v13 = ((uint64_t (**)(void, id))v12)[2](v12, v6);

        if (v13 > [v6 count])
        {
          uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"UICollectionViewListCell.m", 1195, @"Position returned an invalid index (%llu) to insert accessory: %@ into accessories array: %@", v13, v11, v6 object file lineNumber description];
        }
        [v6 insertObject:v11 atIndex:v13];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (id)_internalAccessoriesForCellAccessories:(id)a3 usingState:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v28 = a4;
  if ([v5 count])
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v12 _isSystemType])
          {
            [v12 _systemType];
            unint64_t v13 = [(UICollectionViewListCell *)self _createSystemTypeAccessoryViewWithCellAccessory:v12 orConfiguration:0 updatedForState:v28];
            uint64_t v14 = 1;
          }
          else
          {
            long long v15 = (objc_class *)objc_opt_class();
            _accessoryAsClass(v12, v15);
            unint64_t v13 = [(id)objc_claimAutoreleasedReturnValue() customView];
            long long v16 = [v12 tintColor];

            if (v16)
            {
              long long v17 = [v12 tintColor];
              [v13 setTintColor:v17];
            }
            if ([v12 maintainsFixedSize]) {
              uint64_t v14 = 12;
            }
            else {
              uint64_t v14 = 14;
            }
          }
          objc_msgSend(v13, "setHidden:", objc_msgSend(v12, "isHidden"));
          [v12 reservedLayoutWidth];
          double v18 = -1.79769313e308;
          if (v19 != -1.79769313e308)
          {
            [v12 reservedLayoutWidth];
            double v18 = -1000.0;
            if (v20 != -1000.0)
            {
              [v12 reservedLayoutWidth];
              if (v21 == 0.0)
              {
                double v18 = 1.79769313e308;
              }
              else
              {
                [v12 reservedLayoutWidth];
                double v18 = v22;
              }
            }
          }
          double v23 = [v12 _identifier];
          int v24 = +[_UICellViewAccessory accessoryWithIdentifier:v23 view:v13 options:v14 reservedLayoutWidth:v18];

          [v6 addObject:v24];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v9);
    }

    id v5 = v26;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

void __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 indexOfObjectWithOptions:2 passingTest:&__block_literal_global_132];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = v3;
    id v5 = objc_alloc_init(UICellAccessorySeparator);
    id v6 = [*(id *)(a1 + 32) traitCollection];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 == 6)
    {
      [(UICellAccessory *)v5 setHidden:1];
      uint64_t v8 = [*(id *)(a1 + 32) _constants];
      [v8 defaultVerticalAccessorySeparatorReplacementPaddingWidth];
      double v10 = v9;

      [(UICellAccessory *)v5 setReservedLayoutWidth:v10];
    }
    unint64_t v11 = [v13 objectAtIndexedSubscript:v4];
    unint64_t v12 = [v11 tintColor];
    [(UICellAccessory *)v5 setTintColor:v12];

    [v13 insertObject:v5 atIndex:v4];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewListCell;
  [(UICollectionViewCell *)&v8 traitCollectionDidChange:v4];
  [(UICollectionViewListCell *)self _updateConstants];
  [(UICollectionViewListCell *)self _updateAccessoryLayoutMetrics];
  [(UICollectionViewListCell *)self _updateSeparatorLayoutGuideHeight];
  id v5 = [(UIView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];
  if (v6 != [v4 userInterfaceIdiom]
    || (uint64_t v7 = [v5 layoutDirection], v7 != objc_msgSend(v4, "layoutDirection"))
    || v5 && (!v4 || v5[13] != v4[13] || v5[15] != v4[15]))
  {
    [(UICollectionViewListCell *)self _setNeedsUpdateAccessories];
  }
  [(UICollectionViewListCell *)self _updateCellSelectionTogglesExpansionState];
}

- (void)_updateCellSelectionTogglesExpansionState
{
  unsigned int v3 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  if ([(UICollectionViewListCell *)self _cellSelectionTogglesExpansionState]) {
    unsigned int v4 = 2048;
  }
  else {
    unsigned int v4 = 0;
  }
  int v5 = *(_WORD *)(&self->_listCellFlags + 1) & 0xF7FF | v4;
  *((_WORD *)&self->_listCellFlags + 2) = *(_WORD *)(&self->_listCellFlags + 1) & 0xF7FF | v4;
  if (((v3 >> 11) & 1) != v4 >> 11)
  {
    [(UICollectionViewListCell *)self _setNeedsUpdateAccessories];
    int v5 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  }
  if (((v5 ^ v3) & 0x20) != 0)
  {
    [(UICollectionViewCell *)self _updateDefaultBackgroundAppearance];
  }
}

- (BOOL)_cellSelectionTogglesExpansionState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v3 = self->_accessories;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isHidden", (void)v11) & 1) == 0
          && [v7 _isSystemType]
          && [v7 _systemType] == 6
          && _UICellAccessoryOutlineDisclosureBehavesAsDisplayedForCurrentState(v7, [(UICollectionViewCell *)self isEditing]))
        {
          objc_super v8 = (objc_class *)objc_opt_class();
          _accessoryAsClass(v7, v8);
          uint64_t v9 = [(id)objc_claimAutoreleasedReturnValue() style];
          if (v9)
          {
            if (v9 == 1) {
              goto LABEL_18;
            }
          }
          else if ((*(_WORD *)(&self->_listCellFlags + 1) & 8) != 0)
          {
LABEL_18:

            LOBYTE(v4) = 1;
            goto LABEL_19;
          }
        }
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  if ((__63__UICollectionViewListCell__cellSelectionTogglesExpansionState__block_invoke(self->_leadingAccessoryConfigurations) & 1) != 0
    || (__63__UICollectionViewListCell__cellSelectionTogglesExpansionState__block_invoke(self->_trailingAccessoryConfigurations) & 1) != 0
    || (__63__UICollectionViewListCell__cellSelectionTogglesExpansionState__block_invoke(self->_leadingEditingAccessoryConfigurations) & 1) != 0
    || __63__UICollectionViewListCell__cellSelectionTogglesExpansionState__block_invoke(self->_trailingEditingAccessoryConfigurations))
  {
    *((_WORD *)&self->_listCellFlags + 2) |= 0x20u;
    LOBYTE(v4) = 1;
  }
  else
  {
    *((_WORD *)&self->_listCellFlags + 2) &= ~0x20u;
  }
  return v4;
}

uint64_t __63__UICollectionViewListCell__cellSelectionTogglesExpansionState__block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v5, "_isSystemType", (void)v9))
        {
          if ([v5 _systemType] == 6)
          {
            uint64_t v6 = (objc_class *)objc_opt_class();
            _accessoryConfigurationAsClass(v5, v6);
            char v7 = [(id)objc_claimAutoreleasedReturnValue() cellSelectionTogglesExpansionState];

            if (v7)
            {
              uint64_t v2 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v2;
}

- (void)_updateConstants
{
  uint64_t v3 = [(UIView *)self traitCollection];
  _UITableConstantsForTraitCollection(v3);
  obj = (UITableConstants *)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = obj;
  if (obj != self->_constants)
  {
    objc_storeStrong((id *)&self->_constants, obj);
    [(UICollectionViewListCell *)self _constantsDidChange];
    uint64_t v4 = obj;
  }
}

- (void)_updateSeparatorLayoutGuideHeight
{
  if (self->_separatorLayoutGuideHeightConstraint)
  {
    double v3 = _ListCellSeparatorLayoutGuideHeightForCell(self);
    separatorLayoutGuideHeightConstraint = self->_separatorLayoutGuideHeightConstraint;
    [(NSLayoutConstraint *)separatorLayoutGuideHeightConstraint setConstant:v3];
  }
}

- (void)_setNeedsUpdateAccessories
{
  *((_WORD *)&self->_listCellFlags + 2) |= 0x100u;
  [(UIView *)self setNeedsLayout];
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    [(UIView *)self layoutIfNeeded];
  }
}

- (void)_updateDefaultIndentationWidth
{
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x400) == 0)
  {
    double v3 = [(UICollectionViewListCell *)self _constants];
    [v3 defaultIndentationWidthForSidebarStyle:(*(_WORD *)(&self->_listCellFlags + 1) & 7) == 3];
    double v5 = v4;

    [(UICollectionViewListCell *)self _setIndentationWidth:v5];
  }
}

- (void)_setIndentationWidth:(double)a3
{
  if (self->_indentationWidth != a3)
  {
    self->_indentationWidth = a3;
    [(UICollectionViewListCell *)self _updateAccessoryLayoutMetrics];
    [(UIView *)self setNeedsLayout];
  }
}

- (int64_t)_defaultFocusStyle
{
  return [(_UICollectionViewListCellVisualProvider *)self->_visualProvider defaultFocusStyle];
}

+ (id)_createVisualProviderForCell:(id)a3
{
  id v3 = a3;
  double v4 = [[_UICollectionViewListCellVisualProvider_iOS alloc] initWithListCell:v3];

  return v4;
}

- (id)_createSystemTypeAccessoryViewWithCellAccessory:(id)a3 orConfiguration:(id)a4 updatedForState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v9 _isSystemType] & 1) == 0 && (objc_msgSend(v10, "_isSystemType") & 1) == 0)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"UICollectionViewListCell.m", 1354, @"%@ can only be called for system type accessories", v14 object file lineNumber description];

    if (v9) {
      goto LABEL_4;
    }
LABEL_6:
    long long v12 = v10;
    goto LABEL_7;
  }
  if (!v9) {
    goto LABEL_6;
  }
LABEL_4:
  long long v12 = v9;
LABEL_7:
  uint64_t v15 = [v12 _systemType];
  switch(v15)
  {
    case 0:
      uint64_t v16 = [_UICollectionViewListAccessoryDisclosure alloc];
      long long v17 = [(UICollectionViewListCell *)self _constants];
      uint64_t v18 = [(_UICollectionViewListAccessoryDisclosure *)v16 initWithConstants:v17 handlesOwnAction:0];
      goto LABEL_14;
    case 1:
      double v19 = _UICollectionViewListAccessoryCheckmark;
      goto LABEL_19;
    case 2:
      double v20 = [_UICollectionViewListAccessoryControl alloc];
      double v21 = [(UICollectionViewListCell *)self _constants];
      double v22 = v20;
      uint64_t v23 = 0;
      goto LABEL_22;
    case 3:
      int v24 = [_UICollectionViewListAccessoryControl alloc];
      double v21 = [(UICollectionViewListCell *)self _constants];
      double v22 = v24;
      uint64_t v23 = 1;
      goto LABEL_22;
    case 4:
      id v25 = [_UICollectionViewListCellReorderControl alloc];
      double v21 = [(UICollectionViewListCell *)self _constants];
      uint64_t v26 = [(_UICollectionViewListCellReorderControl *)v25 initWithDelegate:self constants:v21];
      goto LABEL_23;
    case 5:
      id v27 = [_UICollectionViewListAccessoryControl alloc];
      long long v17 = [(UICollectionViewListCell *)self _constants];
      uint64_t v18 = [(_UICollectionViewListAccessoryControl *)v27 initWithType:2 constants:v17];
LABEL_14:
      id v28 = (_UICollectionViewListAccessoryDisclosure *)v18;

      [(UIView *)v28 setUserInteractionEnabled:0];
      if (!v28) {
        goto LABEL_26;
      }
      goto LABEL_24;
    case 6:
      long long v29 = [_UICollectionViewListAccessoryDisclosure alloc];
      double v21 = [(UICollectionViewListCell *)self _constants];
      uint64_t v26 = [(_UICollectionViewListAccessoryDisclosure *)v29 initWithConstants:v21 handlesOwnAction:(*(_WORD *)(&self->_listCellFlags + 1) & 0x800) == 0];
      goto LABEL_23;
    case 7:
      double v19 = UILabel;
      goto LABEL_19;
    case 8:
      double v19 = _UICollectionViewListAccessoryVerticalSeparator;
LABEL_19:
      id v28 = (_UICollectionViewListAccessoryDisclosure *)objc_alloc_init(v19);
      if (!v28) {
        goto LABEL_26;
      }
      goto LABEL_24;
    case 9:
      long long v30 = [_UICollectionViewListAccessoryControl alloc];
      double v21 = [(UICollectionViewListCell *)self _constants];
      double v22 = v30;
      uint64_t v23 = 3;
LABEL_22:
      uint64_t v26 = [(_UICollectionViewListAccessoryControl *)v22 initWithType:v23 constants:v21];
LABEL_23:
      id v28 = (_UICollectionViewListAccessoryDisclosure *)v26;

      if (v28) {
        goto LABEL_24;
      }
      goto LABEL_26;
    case 10:
      v38 = [_UICollectionViewListAccessoryDisclosure alloc];
      uint64_t v39 = [(UICollectionViewListCell *)self _constants];
      id v28 = [(_UICollectionViewListAccessoryDisclosure *)v38 initWithConstants:v39 handlesOwnAction:0];

      [(UIView *)v28 setUserInteractionEnabled:0];
      [(UIControl *)v28 setShowsMenuAsPrimaryAction:1];
      if (!v28) {
        goto LABEL_26;
      }
      goto LABEL_24;
    default:
LABEL_26:
      uint64_t v40 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewListCell.m", 1429, @"Unable to create cell accessory for _UICellAccessorySystemType: %ld", v15);

      id v28 = 0;
LABEL_24:
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __108__UICollectionViewListCell__createSystemTypeAccessoryViewWithCellAccessory_orConfiguration_updatedForState___block_invoke;
      v41[3] = &unk_1E52DF078;
      v41[4] = self;
      long long v31 = v28;
      uint64_t v42 = v31;
      id v43 = v9;
      id v44 = v10;
      id v45 = v11;
      id v32 = v11;
      id v33 = v10;
      id v34 = v9;
      +[UIView performWithoutAnimation:v41];
      double v35 = v45;
      double v36 = v31;

      return v36;
  }
}

- (NSArray)accessories
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_accessories copyItems:1];
  return (NSArray *)v2;
}

- (void)_setRawLayoutMargins:(UIEdgeInsets)a3
{
  if (self->_extraLeadingLayoutMarginForIndentation > 0.0) {
    -[UICollectionViewListCell _adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:](self, "_adjustedRawLayoutMargins:withLeadingLayoutMarginAdjustment:", a3.top, a3.left, a3.bottom, a3.right);
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewListCell;
  [(UIView *)&v4 _setRawLayoutMargins:sel__setRawLayoutMargins_];
}

- (void)setLeadingEditingAccessoryConfigurations:(id)a3
{
  id v4 = a3;
  double v5 = self->_leadingEditingAccessoryConfigurations;
  uint64_t v6 = (NSArray *)v4;
  id v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSArray *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    objc_super v8 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v10 copyItems:1];
    leadingEditingAccessoryConfigurations = self->_leadingEditingAccessoryConfigurations;
    self->_leadingEditingAccessoryConfigurations = v8;

    [(UICollectionViewListCell *)self _setNeedsUpdateAccessories];
  }
LABEL_9:
}

- (void)setTrailingEditingAccessoryConfigurations:(id)a3
{
  id v4 = a3;
  double v5 = self->_trailingEditingAccessoryConfigurations;
  uint64_t v6 = (NSArray *)v4;
  id v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSArray *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    objc_super v8 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v10 copyItems:1];
    trailingEditingAccessoryConfigurations = self->_trailingEditingAccessoryConfigurations;
    self->_trailingEditingAccessoryConfigurations = v8;

    [(UICollectionViewListCell *)self _setNeedsUpdateAccessories];
  }
LABEL_9:
}

- (NSDirectionalEdgeInsets)_separatorInsetsFromPrimaryTextLayoutFrameWithDefaultInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  double leading = a3.leading;
  CGFloat top = a3.top;
  id v9 = [(UIView *)self traitCollection];
  uint64_t v10 = [v9 userInterfaceIdiom];

  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  if (v10 != 6)
  {
    if (self->_separatorLayoutGuide)
    {
      double v35 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0.0, 0.0, 0.0, 0.0);
      [v35 handleFailureInMethod:a2, self, @"UICollectionViewListCell.m", 2444, @"Invalid parameter not satisfying: %@", @"_separatorLayoutGuide == nil" object file lineNumber description];
    }
    uint64_t v15 = [(UICollectionViewCell *)self _existingContentView];
    uint64_t v16 = v15;
    if (v15)
    {
      [v15 _primaryTextLayoutFrame];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
    }
    else
    {
      double v18 = *MEMORY[0x1E4F1DB20];
      double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    v36.origin.CGFloat x = v18;
    v36.origin.CGFloat y = v20;
    v36.size.CGFloat width = v22;
    v36.size.CGFloat height = v24;
    if (!CGRectIsNull(v36))
    {
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v16, v18, v20, v22, v24);
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      if ([(UIView *)self _shouldReverseLayoutDirection])
      {
        [(UIView *)self bounds];
        double MaxX = CGRectGetMaxX(v37);
        v38.origin.CGFloat x = v26;
        v38.origin.CGFloat y = v28;
        v38.size.CGFloat width = v30;
        v38.size.CGFloat height = v32;
        double leading = MaxX - CGRectGetMaxX(v38);
      }
      else
      {
        v39.origin.CGFloat x = v26;
        v39.origin.CGFloat y = v28;
        v39.size.CGFloat width = v30;
        v39.size.CGFloat height = v32;
        double MinX = CGRectGetMinX(v39);
        [(UIView *)self bounds];
        double leading = MinX - CGRectGetMinX(v40);
      }
    }

    double v11 = trailing;
    double v12 = bottom;
    double v13 = leading;
    double v14 = top;
  }
  result.CGFloat trailing = v11;
  result.CGFloat bottom = v12;
  result.double leading = v13;
  result.CGFloat top = v14;
  return result;
}

- (UIListContentConfiguration)defaultContentConfiguration
{
  __int16 v3 = *((_WORD *)&self->_listCellFlags + 2);
  int v4 = v3 & 7;
  if ((v4 - 1) >= 2)
  {
    if (v4 != 3)
    {
      if (v4 == 4)
      {
        if ((v3 & 8) == 0)
        {
          double v5 = +[UIListContentConfiguration _sidebarPlainCellConfiguration]();
          goto LABEL_30;
        }
        if ((v3 & 0x10) != 0) {
          goto LABEL_19;
        }
LABEL_25:
        double v5 = +[UIListContentConfiguration plainHeaderConfiguration];
        goto LABEL_30;
      }
      if ((v3 & 8) != 0)
      {
        if ((v3 & 0x10) != 0)
        {
LABEL_19:
          double v5 = +[UIListContentConfiguration plainFooterConfiguration];
          goto LABEL_30;
        }
        goto LABEL_25;
      }
      char v7 = [(UICollectionViewListCell *)self _popUpMenuAccessory];

      if (v7)
      {
LABEL_15:
        double v5 = +[UIListContentConfiguration valueCellConfiguration];
        goto LABEL_30;
      }
      goto LABEL_28;
    }
    if ((v3 & 8) == 0)
    {
      if ([(UICollectionViewListCell *)self _isAccompaniedSidebar]) {
        +[UIListContentConfiguration accompaniedSidebarCellConfiguration];
      }
      else {
      double v5 = +[UIListContentConfiguration sidebarCellConfiguration];
      }
      goto LABEL_30;
    }
    if (!dyld_program_sdk_at_least() || (v3 & 0x10) == 0)
    {
      double v5 = +[UIListContentConfiguration sidebarHeaderConfiguration];
      goto LABEL_30;
    }
LABEL_23:
    double v5 = +[UIListContentConfiguration groupedFooterConfiguration];
    goto LABEL_30;
  }
  if ((v3 & 8) != 0)
  {
    if ((v3 & 0x10) == 0)
    {
      double v5 = +[UIListContentConfiguration groupedHeaderConfiguration];
      goto LABEL_30;
    }
    goto LABEL_23;
  }
  uint64_t v6 = [(UICollectionViewListCell *)self _popUpMenuAccessory];

  if (v6) {
    goto LABEL_15;
  }
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 7) == 2)
  {
    double v5 = +[UIListContentConfiguration _defaultInsetGroupedCellConfiguration];
    goto LABEL_30;
  }
LABEL_28:
  double v5 = +[UIListContentConfiguration cellConfiguration];
LABEL_30:
  return (UIListContentConfiguration *)v5;
}

- (id)_popUpMenuAccessory
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = self->_accessories;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isHidden", (void)v10) & 1) == 0
          && [v7 _isSystemType]
          && [v7 _systemType] == 10)
        {
          objc_super v8 = (objc_class *)objc_opt_class();
          _accessoryAsClass(v7, v8);
          objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  char v7 = 0;
LABEL_13:

  return v7;
}

- (void)setAccessories:(NSArray *)accessories
{
  uint64_t v4 = accessories;
  uint64_t v37 = 0;
  CGRect v38 = &v37;
  uint64_t v39 = 0x2020000000;
  BOOL v40 = 0;
  if (*((unsigned char *)&self->_listCellFlags + 5))
  {
    char v7 = &v40;
    BOOL v6 = 1;
  }
  else
  {
    NSUInteger v5 = [(NSArray *)self->_accessories count];
    BOOL v6 = v5 != [(NSArray *)v4 count];
    char v7 = (BOOL *)(v38 + 3);
  }
  BOOL v40 = v6;
  if (!*v7)
  {
    double v20 = self->_accessories;
    double v21 = v4;
    double v22 = v21;
    if (v20 == v21)
    {

      goto LABEL_31;
    }
    if (v21 && v20)
    {
      char v23 = [(NSArray *)v20 isEqual:v21];

      if (v23) {
        goto LABEL_31;
      }
    }
    else
    {
    }
  }
  if (*((unsigned char *)v38 + 24)) {
    goto LABEL_27;
  }
  objc_super v8 = [(NSArray *)self->_accessories sortedArrayUsingSelector:sel__compare_];
  id v9 = [(NSArray *)v4 sortedArrayUsingSelector:sel__compare_];
  for (unint64_t i = 0; i < [v8 count]; ++i)
  {
    long long v11 = [v8 objectAtIndexedSubscript:i];
    long long v12 = [v9 objectAtIndexedSubscript:i];
    long long v13 = [v11 _identifier];
    double v14 = [v12 _identifier];
    char v15 = [v13 isEqualToString:v14];

    if ((v15 & 1) == 0) {
      goto LABEL_23;
    }
    id v16 = v11;
    id v17 = v12;
    double v18 = v17;
    if (v16 == v17)
    {

      goto LABEL_17;
    }
    if (v16 && v17)
    {
      char v19 = [v16 isEqual:v17];

      if (v19) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    if (![v18 _canDirectlyUpdateExistingAccessoryViewFrom:v16])
    {
LABEL_23:
      *((unsigned char *)v38 + 24) = 1;

      break;
    }
LABEL_17:
  }
  if (!*((unsigned char *)v38 + 24))
  {
    double v24 = (void *)[(NSDictionary *)self->_accessoriesByIdentifier mutableCopy];
    accessoriesByIdentifier = self->_accessoriesByIdentifier;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __43__UICollectionViewListCell_setAccessories___block_invoke;
    v32[3] = &unk_1E52E4860;
    id v33 = v8;
    id v34 = v9;
    CGFloat v26 = v24;
    double v35 = v26;
    CGRect v36 = &v37;
    [(NSDictionary *)accessoriesByIdentifier enumerateKeysAndObjectsUsingBlock:v32];
    double v27 = self->_accessoriesByIdentifier;
    self->_accessoriesByIdentifier = v26;
    CGFloat v28 = v26;
  }
LABEL_27:
  double v29 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:1];
  CGFloat v30 = self->_accessories;
  self->_accessories = v29;

  if (*((unsigned char *)v38 + 24))
  {
    double v31 = self->_accessoriesByIdentifier;
    self->_accessoriesByIdentifier = 0;

    [(UICollectionViewListCell *)self _setNeedsUpdateAccessories];
  }
  else
  {
    [(UICollectionViewListCell *)self _systemAccessoriesChanged];
  }
LABEL_31:
  _Block_object_dispose(&v37, 8);
}

uint64_t __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  NSUInteger v5 = v4;
  if (a3)
  {
    if ([v4 _isSystemType] && objc_msgSend(v5, "_systemType") == 4)
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      _accessoryAsClass(v5, v6);
      a3 = [(id)objc_claimAutoreleasedReturnValue() showsVerticalSeparator];
    }
    else
    {
      a3 = 0;
    }
  }

  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_destroyWeak((id *)&self->__parentFocusItem);
  objc_storeStrong(&self->__disclosureActionHandler, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_trailingEditingAccessoryConfigurations, 0);
  objc_storeStrong((id *)&self->_leadingEditingAccessoryConfigurations, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryConfigurations, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryConfigurations, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_separatorLayoutGuide, 0);
  objc_storeStrong((id *)&self->_separatorLayoutGuideTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_separatorLayoutGuideLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_separatorLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewConstraints, 0);
  objc_storeStrong((id *)&self->_accessoriesByIdentifier, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
}

- (UICollectionViewListCell)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UICollectionViewListCell;
  NSUInteger v5 = [(UICollectionViewCell *)&v25 initWithCoder:v4];
  BOOL v6 = v5;
  if (v5)
  {
    UICollectionViewListCellCommonInit(v5);
    int v7 = [v4 containsValueForKey:@"UIIndentationLevel"];
    if (v7) {
      __int16 v8 = 512;
    }
    else {
      __int16 v8 = 0;
    }
    *((_WORD *)&v6->_listCellFlags + 2) = *(_WORD *)(&v6->_listCellFlags + 1) & 0xFDFF | v8;
    if (v7) {
      v6->_indentationLevel = [v4 decodeIntegerForKey:@"UIIndentationLevel"];
    }
    int v9 = [v4 containsValueForKey:@"UIIndentationWidth"];
    if (v9) {
      __int16 v10 = 1024;
    }
    else {
      __int16 v10 = 0;
    }
    *((_WORD *)&v6->_listCellFlags + 2) = *(_WORD *)(&v6->_listCellFlags + 1) & 0xFBFF | v10;
    if (v9) {
      v6->_indentationWidth = (double)[v4 decodeIntegerForKey:@"UIIndentationWidth"];
    }
    if ([v4 decodeBoolForKey:@"UIIndentsAccessories"]) {
      __int16 v11 = 4096;
    }
    else {
      __int16 v11 = 0;
    }
    *((_WORD *)&v6->_listCellFlags + 2) = *(_WORD *)(&v6->_listCellFlags + 1) & 0xEFFF | v11;
    long long v12 = [v4 decodeObjectForKey:@"UIAccessories"];
    if ([v12 count]) {
      [(UICollectionViewListCell *)v6 setAccessories:v12];
    }
    uint64_t v13 = [v4 decodeObjectForKey:@"UIContentViewConstraints"];
    contentViewConstraints = v6->_contentViewConstraints;
    v6->_contentViewConstraints = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectForKey:@"UISeparatorLayoutGuide"];
    separatorLayoutGuide = v6->_separatorLayoutGuide;
    v6->_separatorLayoutGuide = (UILayoutGuide *)v15;

    if (v6->_separatorLayoutGuide)
    {
      if ([v4 decodeBoolForKey:@"UISeparatorLayoutGuideLeadingReferencesPrimaryText"])__int16 v17 = 0x2000; {
      else
      }
        __int16 v17 = 0;
      *((_WORD *)&v6->_listCellFlags + 2) = *(_WORD *)(&v6->_listCellFlags + 1) & 0xDFFF | v17;
      uint64_t v18 = [v4 decodeObjectForKey:@"UISeparatorLayoutGuideHeightConstraint"];
      separatorLayoutGuideHeightConstraint = v6->_separatorLayoutGuideHeightConstraint;
      v6->_separatorLayoutGuideHeightConstraint = (NSLayoutConstraint *)v18;

      uint64_t v20 = [v4 decodeObjectForKey:@"UISeparatorLayoutGuideLeadingConstraint"];
      separatorLayoutGuideLeadingConstraint = v6->_separatorLayoutGuideLeadingConstraint;
      v6->_separatorLayoutGuideLeadingConstraint = (NSLayoutConstraint *)v20;

      uint64_t v22 = [v4 decodeObjectForKey:@"UISeparatorLayoutGuideTrailingConstraint"];
      separatorLayoutGuideTrailingConstraint = v6->_separatorLayoutGuideTrailingConstraint;
      v6->_separatorLayoutGuideTrailingConstraint = (NSLayoutConstraint *)v22;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewListCell;
  [(UICollectionViewCell *)&v7 encodeWithCoder:v4];
  unsigned int v5 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  if ((v5 & 0x200) != 0)
  {
    [v4 encodeInteger:self->_indentationLevel forKey:@"UIIndentationLevel"];
    unsigned int v5 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  }
  if ((v5 & 0x400) != 0)
  {
    [v4 encodeInteger:(uint64_t)self->_indentationWidth forKey:@"UIIndentationWidth"];
    unsigned int v5 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  }
  [v4 encodeBool:(v5 >> 12) & 1 forKey:@"UIIndentsAccessories"];
  if ([(NSArray *)self->_accessories count]) {
    [v4 encodeObject:self->_accessories forKey:@"UIAccessories"];
  }
  [v4 encodeObject:self->_contentViewConstraints forKey:@"UIContentViewConstraints"];
  separatorLayoutGuide = self->_separatorLayoutGuide;
  if (separatorLayoutGuide)
  {
    [v4 encodeObject:separatorLayoutGuide forKey:@"UISeparatorLayoutGuide"];
    [v4 encodeBool:(*((unsigned __int16 *)&self->_listCellFlags + 2) >> 13) & 1 forKey:@"UISeparatorLayoutGuideLeadingReferencesPrimaryText"];
    [v4 encodeObject:self->_separatorLayoutGuideHeightConstraint forKey:@"UISeparatorLayoutGuideHeightConstraint"];
    [v4 encodeObject:self->_separatorLayoutGuideLeadingConstraint forKey:@"UISeparatorLayoutGuideLeadingConstraint"];
    [v4 encodeObject:self->_separatorLayoutGuideTrailingConstraint forKey:@"UISeparatorLayoutGuideTrailingConstraint"];
  }
}

double __51__UICollectionViewListCell__createAccessoryManager__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  __int16 v8 = [WeakRetained _constants];
  [v8 interspaceBetweenInnerAccessoryIdentifier:v6 outerAccessoryIdentifier:v5 forCell:WeakRetained trailingAccessoryGroup:0];
  double v10 = v9;

  return v10;
}

void __66__UICollectionViewListCell__setupChangeHandlersForNewContentView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidatePreferredSeparatorInsetsFromContentView];
}

id __66__UICollectionViewListCell__setupChangeHandlersForNewContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained defaultContentConfiguration];
  uint64_t v3 = [WeakRetained configurationState];
  id v4 = [v2 updatedConfigurationForState:v3];

  return v4;
}

double __57__UICollectionViewListCell__updateAccessoryLayoutMetrics__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (result == -1.79769313e308)
  {
    BOOL v3 = _UITableCellSupportsHorizontalCenteringBehaviorForTraitCollection(*(void **)(a1 + 32));
    uint64_t v4 = 0;
    if (v3) {
      objc_msgSend(*(id *)(a1 + 40), "defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:traitCollection:", *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), 0.0);
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
    return *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  return result;
}

double __57__UICollectionViewListCell__updateAccessoryLayoutMetrics__block_invoke_2(uint64_t a1)
{
  double result = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (result == -1.79769313e308)
  {
    BOOL v3 = *(void **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v3 defaultDisclosureLayoutWidthForView:WeakRetained];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;

    return *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewListCell;
  -[UIView _safeAreaInsetsDidChangeFromOldInsets:](&v4, sel__safeAreaInsetsDidChangeFromOldInsets_, a3.top, a3.left, a3.bottom, a3.right);
  [(UIView *)self safeAreaInsets];
  -[UICellAccessoryManager setSafeAreaInsets:](self->_accessoryManager, "setSafeAreaInsets:");
}

- (void)setSelectionStyle:(int64_t)a3
{
  unint64_t v3 = *((unsigned __int16 *)&self->_listCellFlags + 2);
  if (((v3 >> 6) & 1) != a3)
  {
    *((_WORD *)&self->_listCellFlags + 2) = v3 & 0xFFBF | ((a3 & 1) << 6);
    [(UICollectionViewCell *)self _updateDefaultBackgroundAppearance];
  }
}

- (int64_t)selectionStyle
{
  return ((unint64_t)*((unsigned __int16 *)&self->_listCellFlags + 2) >> 6) & 1;
}

- (BOOL)_isAccompaniedSidebar
{
  uint64_t v2 = [(UIView *)self traitCollection];
  BOOL v3 = [v2 _splitViewControllerContext] == 2;

  return v3;
}

- (id)_defaultSelectedBackgroundView
{
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x40) != 0)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = objc_alloc_init(_UICollectionViewListCellSelectedBackgroundView);
    uint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    if ([(UICollectionViewCell *)self isFocused]) {
      uint64_t v4 = 12;
    }
    else {
      uint64_t v4 = 4;
    }
    long long v14 = 0uLL;
    long long v15 = 0uLL;
    long long v12 = 0uLL;
    long long v13 = 0uLL;
    *((void *)&v10 + 1) = 0;
    long long v11 = 0uLL;
    uint64_t v5 = [(UICollectionViewListCell *)self _constants];
    int64_t v6 = [(UICollectionViewListCell *)self _tableStyle];
    objc_super v7 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, v4);
    __int16 v8 = [(UIView *)self traitCollection];
    if (v5)
    {
      [v5 defaultCellBackgroundPropertiesForTableViewStyle:v6 state:v7 traitCollection:v8];
    }
    else
    {
      uint64_t v18 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
    }

    [(UIView *)v3 setBackgroundColor:*((void *)&v10 + 1)];
    __destructor_8_s8_s16_s24_s80((uint64_t)&v10);
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewListCell;
  [(UICollectionViewCell *)&v3 prepareForReuse];
  [(UICollectionViewListCell *)self _setItemIdentifier:0];
  [(UICollectionViewListCell *)self _setDefaultIndentationLevel:0];
  [(UICollectionViewListCell *)self _setDisclosureActionHandler:0];
  [(UICollectionViewListCell *)self _setExpanded:0];
  [(UICollectionViewListCell *)self _resetRawLayoutMargins];
}

- (BOOL)_isFocusableWhenStyledAsHeader
{
  return (*((unsigned __int16 *)&self->_listCellFlags + 2) >> 11) & 1;
}

- (void)_configureFocusedFloatingContentView:(id)a3
{
}

- (void)_systemAccessoriesChanged
{
  [(UICellAccessoryManager *)self->_accessoryManager setNeedsLayout];
  objc_super v3 = [(UICollectionViewCell *)self configurationState];
  [(UICollectionViewListCell *)self _updateCurrentSystemTypeAccessoryViewsUsingState:v3];

  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    [(UIView *)self layoutIfNeeded];
  }
}

void __77__UICollectionViewListCell__updateCurrentSystemTypeAccessoryViewsUsingState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if ((*(_WORD *)(*(void *)(a1 + 32) + 644) & 0x100) == 0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v11 = *(void **)(*(void *)(a1 + 32) + 656);
          long long v12 = objc_msgSend(v10, "identifier", (void)v16);
          long long v13 = [v11 objectForKeyedSubscript:v12];

          if (!v13)
          {
            [*(id *)(a1 + 32) _setNeedsUpdateAccessories];
            goto LABEL_14;
          }
          if ([v13 _isSystemType])
          {
            long long v14 = *(void **)(a1 + 32);
            long long v15 = [v10 view];
            [v14 _updateSystemTypeAccessoryView:v15 withCellAccessory:v13 orConfiguration:0 usingState:*(void *)(a1 + 40)];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

uint64_t __92__UICollectionViewListCell__applyCellAccessoriesToNormalConfiguration_editingConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 _systemTypePlacementForHeader:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v8 = [v6 _systemTypePlacementForHeader:*(unsigned __int8 *)(a1 + 48)];
  if (v7 >= v8)
  {
    if (v7 <= v8)
    {
      if (v7 == v8)
      {
        long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"UICollectionViewListCell.m", 1180, @"Accessories array contains more than one system accessory of the same type. Duplicate accessories: %@ %@", v5, v6 object file lineNumber description];
      }
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (id)_cellAccessoryForConfiguration:(id)a3 isLeadingEdge:(BOOL)a4 usingState:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 _isSystemType])
  {
    [v8 _systemType];
    long long v10 = [(UICollectionViewListCell *)self _createSystemTypeAccessoryViewWithCellAccessory:0 orConfiguration:v8 updatedForState:v9];
    uint64_t v11 = 1;
  }
  else
  {
    long long v12 = (objc_class *)objc_opt_class();
    _accessoryConfigurationAsClass(v8, v12);
    long long v10 = [(id)objc_claimAutoreleasedReturnValue() customView];
    long long v13 = [v8 tintColor];

    if (v13)
    {
      long long v14 = [v8 tintColor];
      [v10 setTintColor:v14];
    }
    if ([v8 maintainsFixedSize]) {
      uint64_t v11 = 12;
    }
    else {
      uint64_t v11 = 14;
    }
  }
  if ([v8 usesDefaultLayoutWidth]) {
    double v15 = -1.79769313e308;
  }
  else {
    double v15 = 1.79769313e308;
  }
  long long v16 = NSString;
  if (v6) {
    long long v17 = @"L";
  }
  else {
    long long v17 = @"T";
  }
  long long v18 = [v8 _identifier];
  long long v19 = [v16 stringWithFormat:@"%@-%@", v17, v18];

  uint64_t v20 = +[_UICellViewAccessory accessoryWithIdentifier:v19 view:v10 options:v11 reservedLayoutWidth:v15];

  return v20;
}

void __43__UICollectionViewListCell_setAccessories___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) indexOfObject:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v7];
    [*(id *)(a1 + 48) setObject:v8 forKey:v9];
  }
}

- (void)setLeadingAccessoryConfigurations:(id)a3
{
  id v4 = a3;
  id v5 = self->_leadingAccessoryConfigurations;
  BOOL v6 = (NSArray *)v4;
  long long v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSArray *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    id v8 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v10 copyItems:1];
    leadingAccessoryConfigurations = self->_leadingAccessoryConfigurations;
    self->_leadingAccessoryConfigurations = v8;

    [(UICollectionViewListCell *)self _setNeedsUpdateAccessories];
  }
LABEL_9:
}

- (NSArray)leadingAccessoryConfigurations
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_leadingAccessoryConfigurations copyItems:1];
  return (NSArray *)v2;
}

- (void)setTrailingAccessoryConfigurations:(id)a3
{
  id v4 = a3;
  id v5 = self->_trailingAccessoryConfigurations;
  BOOL v6 = (NSArray *)v4;
  long long v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSArray *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    id v8 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v10 copyItems:1];
    trailingAccessoryConfigurations = self->_trailingAccessoryConfigurations;
    self->_trailingAccessoryConfigurations = v8;

    [(UICollectionViewListCell *)self _setNeedsUpdateAccessories];
  }
LABEL_9:
}

- (NSArray)trailingAccessoryConfigurations
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_trailingAccessoryConfigurations copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)leadingEditingAccessoryConfigurations
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_leadingEditingAccessoryConfigurations copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)trailingEditingAccessoryConfigurations
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_trailingEditingAccessoryConfigurations copyItems:1];
  return (NSArray *)v2;
}

- (void)_setExpanded:(BOOL)a3
{
  if (((((*(_WORD *)(&self->_listCellFlags + 1) & 0x80) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(UICollectionViewCell *)self _prepareForConfigurationStateUpdate];
    if (v3) {
      __int16 v5 = 128;
    }
    else {
      __int16 v5 = 0;
    }
    *((_WORD *)&self->_listCellFlags + 2) = *(_WORD *)(&self->_listCellFlags + 1) & 0xFF7F | v5;
    [(UICollectionViewCell *)self setNeedsUpdateConfiguration];
  }
}

- (BOOL)_expanded
{
  return (*((unsigned __int16 *)&self->_listCellFlags + 2) >> 7) & 1;
}

- (BOOL)_hasCustomSelectionAction
{
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x800) != 0) {
    return 1;
  }
  BOOL v3 = [(UICollectionViewListCell *)self _popUpMenuAccessoryForCustomSelectionAction];

  if (v3) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewListCell;
  return [(UICollectionViewCell *)&v5 _hasCustomSelectionAction];
}

- (void)_performCustomSelectionAction
{
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x800) != 0)
  {
    [(UICollectionViewListCell *)self _toggleExpansionState];
  }
  else
  {
    BOOL v3 = [(UICollectionViewListCell *)self _popUpMenuAccessoryForCustomSelectionAction];
    if (v3)
    {
      [(UICollectionViewListCell *)self _presentPopUpMenuForAccessory:v3];
    }
    else
    {
      v4.receiver = self;
      v4.super_class = (Class)UICollectionViewListCell;
      [(UICollectionViewCell *)&v4 _performCustomSelectionAction];
    }
  }
}

- (id)_popUpMenuAccessoryForCustomSelectionAction
{
  BOOL v3 = [(UICollectionViewListCell *)self _popUpMenuAccessory];
  if (v3
    && objc_msgSend(v3, "_isDisplayedForEditingState:", -[UICollectionViewCell isEditing](self, "isEditing")))
  {
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_presentPopUpMenuForAccessory:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v20 = self;
  objc_super v5 = [(UICellAccessoryManager *)self->_accessoryManager currentConfiguration];
  BOOL v6 = [v5 trailingAccessories];
  char v7 = [v5 leadingAccessories];
  id v8 = [v6 arrayByAddingObjectsFromArray:v7];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  long long v10 = (void *)[v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v14 = [v13 identifier];
        double v15 = [v4 _identifier];
        int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          long long v10 = [v13 view];
          long long v17 = (objc_class *)objc_opt_class();
          _accessoryViewAsClass(v10, v17);
          objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      long long v10 = (void *)[v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (os_variant_has_internal_diagnostics())
  {
    if (!v10)
    {
      long long v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        CGFloat v26 = v20;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Unable to obtain popup menu accessory view in cell: %@", buf, 0xCu);
      }
    }
  }
  else if (!v10)
  {
    long long v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_presentPopUpMenuForAccessory____s_category) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CGFloat v26 = v20;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Unable to obtain popup menu accessory view in cell: %@", buf, 0xCu);
    }
  }
  [v10 performPrimaryAction];
}

- (unint64_t)_validatedDisclosureActionForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UICollectionReusableView *)self _layoutAttributes];
  BOOL v6 = -[UICollectionViewLayoutAttributes _existingListAttributes](v5);

  if (v6
    && ([(UICollectionViewListCell *)self _itemIdentifier],
        (char v7 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id disclosureActionHandler = self->__disclosureActionHandler, v7, disclosureActionHandler)
    && ([v4 modifierFlags] & 0xFFFFFFFFFFDFFFFFLL) == 0)
  {
    UIUserInterfaceLayoutDirection v11 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
    if ([v4 keyCode] == 80)
    {
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft) {
        unint64_t v9 = 2;
      }
      else {
        unint64_t v9 = 3;
      }
    }
    else
    {
      uint64_t v12 = [v4 keyCode];
      uint64_t v13 = 2;
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft) {
        uint64_t v13 = 3;
      }
      if (v12 == 79) {
        unint64_t v9 = v13;
      }
      else {
        unint64_t v9 = 0;
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_canPerformActionForKey:(id)a3
{
  BOOL v3 = self;
  unint64_t v4 = [(UICollectionViewListCell *)self _validatedDisclosureActionForKey:a3];
  if (v4 == 3)
  {
    if ([(UICollectionViewListCell *)v3 _expanded])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      objc_super v5 = [(UICollectionViewListCell *)v3 _parentFocusItem];
      LOBYTE(v3) = v5 != 0;
    }
  }
  else if (v4 == 2)
  {
    LODWORD(v3) = ![(UICollectionViewListCell *)v3 _expanded];
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (BOOL)_performActionForKey:(id)a3
{
  unint64_t v4 = [(UICollectionViewListCell *)self _validatedDisclosureActionForKey:a3];
  if (v4)
  {
    objc_super v5 = [(UICollectionViewListCell *)self _parentFocusItem];
    BOOL v6 = [(UICollectionViewListCell *)self _expanded];
    if (v4 == 3 && !v6 && v5)
    {
      char v7 = [(UIView *)self _focusSystem];
      char v8 = [v7 _updateFocusImmediatelyToEnvironment:v5];
    }
    else
    {
      id disclosureActionHandler = (uint64_t (**)(id, unint64_t, void *))self->__disclosureActionHandler;
      char v7 = [(UICollectionViewListCell *)self _itemIdentifier];
      char v8 = disclosureActionHandler[2](disclosureActionHandler, v4, v7);
    }
    LOBYTE(v4) = v8;
  }
  return v4;
}

- (void)_toggleExpansionState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v3 = self->_accessories;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v4)
  {

LABEL_18:
    uint64_t v13 = [(UICollectionViewListCell *)self _itemIdentifier];
    if (v13)
    {
      id disclosureActionHandler = (void (**)(id, uint64_t, void *))self->__disclosureActionHandler;
      if (disclosureActionHandler) {
        disclosureActionHandler[2](disclosureActionHandler, 1, v13);
      }
    }

    return;
  }
  uint64_t v5 = v4;
  char v6 = 0;
  uint64_t v7 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v3);
      }
      unint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if ((objc_msgSend(v9, "isHidden", (void)v15) & 1) == 0
        && [v9 _isSystemType]
        && [v9 _systemType] == 6
        && _UICellAccessoryOutlineDisclosureBehavesAsDisplayedForCurrentState(v9, [(UICollectionViewCell *)self isEditing]))
      {
        long long v10 = (objc_class *)objc_opt_class();
        _accessoryAsClass(v9, v10);
        UIUserInterfaceLayoutDirection v11 = [(id)objc_claimAutoreleasedReturnValue() actionHandler];

        if (v11)
        {
          uint64_t v12 = [v9 actionHandler];
          v12[2]();

          char v6 = 1;
        }
      }
    }
    uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v5);

  if ((v6 & 1) == 0) {
    goto LABEL_18;
  }
}

- (void)setIndentsAccessories:(BOOL)indentsAccessories
{
  __int16 v3 = *((_WORD *)&self->_listCellFlags + 2);
  if (((((v3 & 0x1000) == 0) ^ indentsAccessories) & 1) == 0)
  {
    if (indentsAccessories) {
      __int16 v5 = 4096;
    }
    else {
      __int16 v5 = 0;
    }
    *((_WORD *)&self->_listCellFlags + 2) = v3 & 0xEFFF | v5;
    [(UICollectionViewListCell *)self _updateAccessoryLayoutMetrics];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setIndentationLevel:(int64_t)a3
{
  if (self->_indentationLevel != a3)
  {
    self->_indentationLevel = a3;
    [(UICollectionViewListCell *)self _updateAccessoryLayoutMetrics];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setIndentationLevel:(NSInteger)indentationLevel
{
  *((_WORD *)&self->_listCellFlags + 2) |= 0x200u;
  [(UICollectionViewListCell *)self _setIndentationLevel:indentationLevel];
}

- (void)_setDefaultIndentationLevel:(int64_t)a3
{
  self->_defaultIndentationLevel = a3;
  if ((*(_WORD *)(&self->_listCellFlags + 1) & 0x200) == 0) {
    -[UICollectionViewListCell _setIndentationLevel:](self, "_setIndentationLevel:");
  }
}

- (void)setIndentationWidth:(CGFloat)indentationWidth
{
  *((_WORD *)&self->_listCellFlags + 2) |= 0x400u;
  [(UICollectionViewListCell *)self _setIndentationWidth:indentationWidth];
}

- (UIEdgeInsets)_adjustedRawLayoutMargins:(UIEdgeInsets)a3 withLeadingLayoutMarginAdjustment:(double)a4
{
  double right = a3.right;
  CGFloat bottom = a3.bottom;
  double left = a3.left;
  CGFloat top = a3.top;
  if ([(UIView *)self _shouldReverseLayoutDirection])
  {
    if (right == -1.79769313e308)
    {
      [(UICollectionReusableView *)self _concreteDefaultLayoutMargins];
      double right = v10 + a4;
    }
    else
    {
      double right = right + a4;
    }
  }
  else if (left == -1.79769313e308)
  {
    [(UICollectionReusableView *)self _concreteDefaultLayoutMargins];
    double left = v11 + a4;
  }
  else
  {
    double left = left + a4;
  }
  double v12 = top;
  double v13 = left;
  double v14 = bottom;
  double v15 = right;
  result.double right = v15;
  result.CGFloat bottom = v14;
  result.double left = v13;
  result.CGFloat top = v12;
  return result;
}

- (void)_resetRawLayoutMargins
{
  self->_double extraLeadingLayoutMarginForIndentation = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)UICollectionViewListCell;
  -[UIView _setRawLayoutMargins:](&v2, sel__setRawLayoutMargins_, -1.79769313e308, -1.79769313e308, -1.79769313e308, -1.79769313e308);
}

- (id)_viewForMultiSelectAccessory
{
  __int16 v3 = [(UICellAccessoryManager *)self->_accessoryManager currentConfiguration];
  if ([(NSArray *)self->_accessories count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke;
    aBlock[3] = &unk_1E52E4888;
    aBlock[4] = self;
    uint64_t v4 = (void (**)(void *, void *))_Block_copy(aBlock);
    __int16 v5 = [v3 leadingAccessories];
    v4[2](v4, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
LABEL_5:

      goto LABEL_6;
    }
    uint64_t v7 = [v3 trailingAccessories];
    char v8 = v4[2](v4, v7);

    if (v8)
    {
      id v6 = v8;

      goto LABEL_5;
    }

LABEL_17:
    id v6 = 0;
    goto LABEL_6;
  }
  double v10 = [(UICellAccessoryManager *)self->_accessoryManager currentConfigurationIdentifier];
  int v11 = [v10 isEqualToString:0x1ED16D800];

  if (v11)
  {
    leadingEditingAccessoryConfigurations = self->_leadingEditingAccessoryConfigurations;
    double v13 = [v3 leadingAccessories];
    __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke_2(leadingEditingAccessoryConfigurations, v13);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6) {
      goto LABEL_6;
    }
    uint64_t v14 = 792;
  }
  else
  {
    leadingAccessoryConfigurations = self->_leadingAccessoryConfigurations;
    long long v16 = [v3 leadingAccessories];
    __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke_2(leadingAccessoryConfigurations, v16);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6) {
      goto LABEL_6;
    }
    uint64_t v14 = 776;
  }
  long long v17 = *(Class *)((char *)&self->super.super.super.super.super.isa + v14);
  long long v18 = [v3 trailingAccessories];
  __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke_2(v17, v18);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6) {
    goto LABEL_17;
  }
LABEL_6:

  return v6;
}

id __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v9 = *(void **)(*(void *)(a1 + 32) + 656);
        double v10 = objc_msgSend(v8, "identifier", (void)v14);
        int v11 = [v9 objectForKeyedSubscript:v10];

        if (([v11 isHidden] & 1) == 0
          && [v11 _isSystemType]
          && [v11 _systemType] == 5)
        {
          double v12 = [v8 view];

          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  double v12 = 0;
LABEL_13:

  return v12;
}

id __56__UICollectionViewListCell__viewForMultiSelectAccessory__block_invoke_2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 count];
  if (v5 == [v4 count]
    && ((unint64_t v6 = [v3 count], v7 = objc_msgSend(v4, "count"), v6 >= v7) ? (v8 = v7) : (v8 = v6), v8))
  {
    unint64_t v9 = 0;
    while (1)
    {
      double v10 = [v3 objectAtIndexedSubscript:v9];
      if ([v10 _isSystemType])
      {
        if ([v10 _systemType] == 5) {
          break;
        }
      }

      ++v9;
      unint64_t v11 = [v3 count];
      unint64_t v12 = [v4 count];
      if (v11 >= v12) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v9 >= v13) {
        goto LABEL_13;
      }
    }
    long long v16 = [v4 objectAtIndexedSubscript:v9];
    long long v14 = [v16 view];
  }
  else
  {
LABEL_13:
    long long v14 = 0;
  }

  return v14;
}

- (int64_t)_cellStyle
{
  return 0;
}

- (id)_editingControlTintColorForStyle:(int64_t)a3
{
  return 0;
}

- (void)_deleteAccessoryTriggered
{
  id v6 = [(UICollectionReusableView *)self _collectionView];
  id v3 = [v6 indexPathForCell:self];
  if (v3)
  {
    uint64_t v4 = [v6 collectionViewLayout];
    uint64_t v5 = (void *)v4;
    if (v4) {
      [*(id *)(v4 + 136) revealTrailingSwipeActionsForIndexPath:v3];
    }
  }
}

- (void)_reorderControl:(id)a3 didReceiveTouchesBegan:(id)a4
{
  objc_msgSend(a4, "anyObject", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UICollectionViewListCell.m", 2135, @"Invalid parameter not satisfying: %@", @"touch != nil" object file lineNumber description];
  }
  id v6 = [(UICollectionReusableView *)self _collectionView];
  [v6 _immediatelyBeginDruidBasedReorderIfPossibleWithTouch:v8];
}

- (BOOL)_reorderControlShouldBeginReordering:(id)a3
{
  uint64_t v4 = [(UICollectionReusableView *)self _collectionView];
  uint64_t v5 = v4;
  if (v4 && [v4 _canBeginReorderingItem])
  {
    id v6 = [v5 indexPathForCell:self];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_reorderControlDidBeginReordering:(id)a3
{
  id v8 = a3;
  uint64_t v5 = [(UICollectionReusableView *)self _collectionView];
  if (!v5)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UICollectionViewListCell.m" lineNumber:2149 description:@"List cell cannot reorder without a collection view"];
  }
  id v6 = [v5 indexPathForCell:self];
  if (v6) {
    [v5 beginInteractiveMovementForItemAtIndexPath:v6];
  }
  else {
    [v8 cancelReorderingGesture];
  }
}

- (void)_reorderControl:(id)a3 didUpdateWithOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v19 = a3;
  id v8 = [(UICollectionReusableView *)self _collectionView];
  if (!v8)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"UICollectionViewListCell.m" lineNumber:2164 description:@"List cell cannot reorder without a collection view"];
  }
  if ([v8 _isReordering])
  {
    [(UIView *)self center];
    double v10 = v9;
    double v12 = v11;
    unint64_t v13 = [(UIView *)self superview];
    objc_msgSend(v8, "convertPoint:fromView:", v13, v10, v12);
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(v8, "updateInteractiveMovementTargetPosition:", x + v15, y + v17);
  }
  else
  {
    [v19 cancelReorderingGesture];
  }
}

- (void)_reorderControlDidEndReordering:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(UICollectionReusableView *)self _collectionView];
  id v9 = v7;
  if (v7)
  {
    if (v4)
    {
LABEL_3:
      [v7 cancelInteractiveMovement];
      goto LABEL_6;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UICollectionViewListCell.m" lineNumber:2186 description:@"List cell cannot reorder without a collection view"];

    BOOL v7 = 0;
    if (v4) {
      goto LABEL_3;
    }
  }
  [v7 endInteractiveMovement];
LABEL_6:
}

- (UILayoutGuide)separatorLayoutGuide
{
  v33[4] = *MEMORY[0x1E4F143B8];
  separatorLayoutGuide = self->_separatorLayoutGuide;
  if (!separatorLayoutGuide)
  {
    BOOL v4 = objc_alloc_init(UILayoutGuide);
    uint64_t v5 = self->_separatorLayoutGuide;
    self->_separatorLayoutGuide = v4;

    id v6 = [(UICollectionViewListCell *)self _owningViewForSeparatorLayoutGuide];
    [v6 addLayoutGuide:self->_separatorLayoutGuide];

    [(UILayoutGuide *)self->_separatorLayoutGuide _setLockedToOwningView:1];
    [(UILayoutGuide *)self->_separatorLayoutGuide _setShouldBeArchived:1];
    [(UILayoutGuide *)self->_separatorLayoutGuide setIdentifier:@"UICollectionViewListCellSeparatorLayoutGuide"];
    BOOL v7 = [(UILayoutGuide *)self->_separatorLayoutGuide heightAnchor];
    id v8 = [v7 constraintEqualToConstant:_ListCellSeparatorLayoutGuideHeightForCell(self)];

    [(NSLayoutConstraint *)v8 setShouldBeArchived:1];
    [(NSLayoutConstraint *)v8 setIdentifier:@"UICollectionViewListCell-height-separatorLayoutGuide-constraint"];
    separatorLayoutGuideHeightConstraint = self->_separatorLayoutGuideHeightConstraint;
    self->_separatorLayoutGuideHeightConstraint = v8;
    double v10 = v8;

    double v11 = [(UILayoutGuide *)self->_separatorLayoutGuide bottomAnchor];
    double v12 = [(UICollectionViewListCell *)self _owningViewForSeparatorLayoutGuide];
    unint64_t v13 = [v12 bottomAnchor];
    double v14 = [v11 constraintEqualToAnchor:v13];

    [v14 setShouldBeArchived:1];
    [v14 setIdentifier:@"UICollectionViewListCell-bottom-separatorLayoutGuide-constraint"];
    double v15 = [(UILayoutGuide *)self->_separatorLayoutGuide leadingAnchor];
    double v16 = [(UICollectionViewListCell *)self _owningViewForSeparatorLayoutGuide];
    double v17 = [v16 leadingAnchor];
    _ListCellCreateSeparatorLayoutGuideLeadingConstraint(v15, v17, @"UICollectionViewListCell-leading-separatorLayoutGuide-constraint");
    long long v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    separatorLayoutGuideLeadingConstraint = self->_separatorLayoutGuideLeadingConstraint;
    self->_separatorLayoutGuideLeadingConstraint = v18;
    uint64_t v20 = v18;

    long long v21 = [(UILayoutGuide *)self->_separatorLayoutGuide trailingAnchor];
    long long v22 = [(UICollectionViewListCell *)self _owningViewForSeparatorLayoutGuide];
    long long v23 = [v22 trailingAnchor];
    long long v24 = [v21 constraintEqualToAnchor:v23];

    [(NSLayoutConstraint *)v24 setShouldBeArchived:1];
    LODWORD(v25) = 1132068864;
    [(NSLayoutConstraint *)v24 setPriority:v25];
    [(NSLayoutConstraint *)v24 setIdentifier:@"UICollectionViewListCell-trailing-separatorLayoutGuide-constraint"];
    separatorLayoutGuideTrailingConstraint = self->_separatorLayoutGuideTrailingConstraint;
    self->_separatorLayoutGuideTrailingConstraint = v24;
    double v27 = v24;

    uint64_t v28 = self->_separatorLayoutGuide;
    v33[0] = v10;
    v33[1] = v20;
    v33[2] = v14;
    v33[3] = v27;
    double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    [(UILayoutGuide *)v28 _setSystemConstraints:v29];

    CGFloat v30 = (void *)MEMORY[0x1E4F5B268];
    double v31 = [(UILayoutGuide *)self->_separatorLayoutGuide _systemConstraints];
    [v30 activateConstraints:v31];

    -[UICollectionViewListCell _updateSeparatorLayoutGuideForSectionSeparatorInsets:](self, "_updateSeparatorLayoutGuideForSectionSeparatorInsets:", self->_sectionSeparatorInsets.top, self->_sectionSeparatorInsets.leading, self->_sectionSeparatorInsets.bottom, self->_sectionSeparatorInsets.trailing);
    [(UICollectionViewListCell *)self _updateContentViewConstraintsIfNeeded];

    separatorLayoutGuide = self->_separatorLayoutGuide;
  }
  return separatorLayoutGuide;
}

- (NSDirectionalEdgeInsets)_separatorInsetsFromLayoutGuide
{
  if (!self->_separatorLayoutGuide)
  {
    CGFloat v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"UICollectionViewListCell.m" lineNumber:2362 description:@"Cannot get insets with a nil _separatorLayoutGuide"];
  }
  BOOL v4 = [(UICollectionViewListCell *)self _owningViewForSeparatorLayoutGuide];

  if (v4 != self)
  {
    double v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"UICollectionViewListCell.m" lineNumber:2364 description:@"The separatorLayoutGuide is expected to be added directly to the cell"];
  }
  [(UILayoutGuide *)self->_separatorLayoutGuide layoutFrame];
  CGFloat v6 = v5;
  CGFloat v32 = v7;
  CGFloat v33 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(UIView *)self bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v34.origin.double x = v6;
  v34.origin.double y = v8;
  v34.size.CGFloat width = v10;
  v34.size.CGFloat height = v12;
  double MinX = CGRectGetMinX(v34);
  v35.origin.double x = v14;
  v35.origin.double y = v16;
  v35.size.CGFloat width = v18;
  v35.size.CGFloat height = v20;
  double v22 = MinX - CGRectGetMinX(v35);
  v36.origin.double x = v14;
  v36.origin.double y = v16;
  v36.size.CGFloat width = v18;
  v36.size.CGFloat height = v20;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.double y = v32;
  v37.origin.double x = v33;
  v37.size.CGFloat width = v10;
  v37.size.CGFloat height = v12;
  double v24 = MaxX - CGRectGetMaxX(v37);
  BOOL v25 = [(UIView *)self _shouldReverseLayoutDirection];
  if (v25) {
    double v26 = v24;
  }
  else {
    double v26 = v22;
  }
  if (v25) {
    double v27 = v22;
  }
  else {
    double v27 = v24;
  }
  double v28 = 0.0;
  double v29 = 0.0;
  result.CGFloat trailing = v27;
  result.CGFloat bottom = v29;
  result.double leading = v26;
  result.CGFloat top = v28;
  return result;
}

- (double)_contentView:(id)a3 inset:(double)a4 convertedToCellInsetOnEdge:(unint64_t)a5
{
  id v9 = a3;
  if (a5 != 2 && a5 != 8)
  {
    CGFloat v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UICollectionViewListCell.m", 2380, @"Invalid parameter not satisfying: %@", @"edge == NSDirectionalRectEdgeLeading || edge == NSDirectionalRectEdgeTrailing" object file lineNumber description];
  }
  if (a5 == 2) {
    double v11 = 0.0;
  }
  else {
    double v11 = a4;
  }
  if (a5 != 2) {
    a4 = 0.0;
  }
  BOOL v12 = [(UIView *)self _shouldReverseLayoutDirection];
  [v9 bounds];
  if (v12) {
    double v16 = v11;
  }
  else {
    double v16 = a4;
  }
  if (v12) {
    double v17 = a4;
  }
  else {
    double v17 = v11;
  }
  double v18 = v16 + v13;
  double v19 = v14 + 0.0;
  double v20 = v15 - (v16 + v17);
  if (v12) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 8;
  }
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v9, v18, v19, v20);
  CGFloat v26 = v22;
  CGFloat v27 = v23;
  CGFloat v28 = v24;
  CGFloat v29 = v25;
  if (v21 == a5)
  {
    [(UIView *)self bounds];
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.double x = v26;
    v35.origin.double y = v27;
    v35.size.CGFloat width = v28;
    v35.size.CGFloat height = v29;
    double v31 = MaxX - CGRectGetMaxX(v35);
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v22);
    [(UIView *)self bounds];
    double v31 = MinX - CGRectGetMinX(v36);
  }

  return v31;
}

- (void)_invalidatePreferredSeparatorInsetsFromContentView
{
  double lastPreferredLeadingSeparatorInsetFromContentView = self->_lastPreferredLeadingSeparatorInsetFromContentView;
  double lastPreferredTrailingSeparatorInsetFromContentView = self->_lastPreferredTrailingSeparatorInsetFromContentView;
  -[UICollectionViewListCell _preferredSeparatorInsetsFromContentViewWithDefaultInsets:](self, "_preferredSeparatorInsetsFromContentViewWithDefaultInsets:", self->_sectionSeparatorInsets.top, self->_sectionSeparatorInsets.leading, self->_sectionSeparatorInsets.bottom, self->_sectionSeparatorInsets.trailing);
  if (v6 != lastPreferredLeadingSeparatorInsetFromContentView
    || v5 != lastPreferredTrailingSeparatorInsetFromContentView)
  {
    id v8 = [(UICollectionReusableView *)self _collectionView];
    [v8 _cellPreferredSeparatorInsetsChanged:self];
  }
}

- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsFromContentViewWithDefaultInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  CGFloat leading = a3.leading;
  CGFloat top = a3.top;
  id v8 = [(UIView *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  if (v9 != 6)
  {
    double v14 = [(UICollectionViewCell *)self _existingContentView];
    if (objc_opt_respondsToSelector())
    {
      [v14 _preferredLeadingSeparatorInset];
      double v12 = leading;
      if (v15 != 1.79769313e308)
      {
        -[UICollectionViewListCell _contentView:inset:convertedToCellInsetOnEdge:](self, "_contentView:inset:convertedToCellInsetOnEdge:", v14, 2);
        double v12 = v16;
      }
    }
    else
    {
      double v12 = leading;
    }
    if (objc_opt_respondsToSelector())
    {
      [v14 _preferredTrailingSeparatorInset];
      if (v17 != 1.79769313e308)
      {
        -[UICollectionViewListCell _contentView:inset:convertedToCellInsetOnEdge:](self, "_contentView:inset:convertedToCellInsetOnEdge:", v14, 8);
        double trailing = v18;
      }
    }
    self->_double lastPreferredLeadingSeparatorInsetFromContentView = v12;
    self->_double lastPreferredTrailingSeparatorInsetFromContentView = trailing;

    double v10 = trailing;
    double v11 = bottom;
    double v13 = top;
  }
  double v19 = v12;
  result.double trailing = v10;
  result.CGFloat bottom = v11;
  result.CGFloat leading = v19;
  result.CGFloat top = v13;
  return result;
}

- (NSInteger)indentationLevel
{
  return self->_indentationLevel;
}

- (CGFloat)indentationWidth
{
  return self->_indentationWidth;
}

- (id)_disclosureActionHandler
{
  return self->__disclosureActionHandler;
}

- (void)_setDisclosureActionHandler:(id)a3
{
}

- (UIFocusItem)_parentFocusItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parentFocusItem);
  return (UIFocusItem *)WeakRetained;
}

- (void)_setParentFocusItem:(id)a3
{
}

- (UICellAccessoryManager)_accessoryManager
{
  return self->_accessoryManager;
}

- (int64_t)_defaultIndentationLevel
{
  return self->_defaultIndentationLevel;
}

- (id)_itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)_setItemIdentifier:(id)a3
{
}

@end