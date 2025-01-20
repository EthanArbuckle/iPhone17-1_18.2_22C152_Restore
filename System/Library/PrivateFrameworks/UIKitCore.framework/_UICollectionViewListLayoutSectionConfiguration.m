@interface _UICollectionViewListLayoutSectionConfiguration
+ (id)new;
- (BOOL)_hasFooter;
- (BOOL)_hasHeaderOrFirstItemStyledAsHeader;
- (BOOL)_hasSupplementaryAsHeader;
- (BOOL)_isAPIVersion;
- (BOOL)_shouldDrawThickSeparators;
- (BOOL)_shouldPinSupplementaries;
- (BOOL)_shouldSupplementariesFollowSectionInsets;
- (BOOL)_wantsSwipeActions;
- (BOOL)sectionHeaderHugsContent;
- (BOOL)stylesFirstItemAsHeader;
- (NSArray)_itemHeights;
- (NSCollectionLayoutEnvironment_Private)_layoutEnvironment;
- (NSDirectionalEdgeInsets)_sectionContentInsetsForAppearanceStyleWithDefaultInsets:(NSDirectionalEdgeInsets)a3 headerFootersAreChromeless:(BOOL)a4;
- (NSDirectionalEdgeInsets)_sectionContentInsetsForVerticallySeparatedSectionsWithDefaultInsets:(NSDirectionalEdgeInsets)a3;
- (NSDirectionalEdgeInsets)separatorInset;
- (NSString)_footerElementKind;
- (NSString)_headerElementKind;
- (UICollectionView)_collectionView;
- (UIColor)_backgroundColor;
- (UITableConstants)_constants;
- (_UICollectionViewListLayoutSectionConfiguration)init;
- (_UICollectionViewListLayoutSectionConfiguration)initWithAppearanceStyle:(int64_t)a3 layoutEnvironment:(id)a4;
- (_UICollectionViewListLayoutSectionConfiguration)initWithCollectionView:(id)a3;
- (_UIListSeparatorConfiguration)_separatorConfiguration;
- (_UIListSeparatorConfiguration)_separatorConfigurationNoCopy;
- (double)_defaultRowHeight;
- (double)_defaultSectionFooterHeight;
- (double)_defaultSectionHeaderHeight;
- (double)_effectiveEstimatedRowHeight;
- (double)_effectiveEstimatedSectionFooterHeight;
- (double)_effectiveEstimatedSectionHeaderHeight;
- (double)_separatorHeight;
- (double)_topContentInsetForGroupedAppearance;
- (double)_topContentInsetForPaddingAboveHeader;
- (double)cornerRadius;
- (double)estimatedRowHeight;
- (double)estimatedSectionFooterHeight;
- (double)estimatedSectionHeaderHeight;
- (double)headerTopPadding;
- (double)rowHeight;
- (double)sectionFooterHeight;
- (double)sectionHeaderHeight;
- (id)_createSeparatorForBottom:(BOOL)a3;
- (id)_createSwipeActionsContainer;
- (id)_generateLayoutGroup:(id)a3;
- (id)_itemSeparatorHandler;
- (id)_traitCollection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)didEndSwipingHandler;
- (id)leadingSwipeActionsConfigurationProvider;
- (id)separatorInsetProvider;
- (id)trailingSwipeActionsConfigurationProvider;
- (id)willBeginSwipingHandler;
- (int64_t)_defaultContentInsetsReference;
- (int64_t)_defaultSeparatorStyleForAppearanceStyle:(int64_t)a3;
- (int64_t)appearanceStyle;
- (int64_t)separatorStyle;
- (void)_addSupplementaryItemsToLayout:(id)a3;
- (void)_setItemHeights:(id)a3;
- (void)_setItemSeparatorHandler:(id)a3;
- (void)_setSeparatorConfiguration:(id)a3;
- (void)setAppearanceStyle:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDidEndSwipingHandler:(id)a3;
- (void)setEstimatedRowHeight:(double)a3;
- (void)setEstimatedSectionFooterHeight:(double)a3;
- (void)setEstimatedSectionHeaderHeight:(double)a3;
- (void)setHeaderTopPadding:(double)a3;
- (void)setLeadingSwipeActionsConfigurationProvider:(id)a3;
- (void)setRowHeight:(double)a3;
- (void)setSectionFooterHeight:(double)a3;
- (void)setSectionHeaderHeight:(double)a3;
- (void)setSectionHeaderHugsContent:(BOOL)a3;
- (void)setSeparatorInset:(NSDirectionalEdgeInsets)a3;
- (void)setSeparatorInsetProvider:(id)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setStylesFirstItemAsHeader:(BOOL)a3;
- (void)setTrailingSwipeActionsConfigurationProvider:(id)a3;
- (void)setWillBeginSwipingHandler:(id)a3;
- (void)set_apiVersion:(BOOL)a3;
- (void)set_backgroundColor:(id)a3;
- (void)set_footerElementKind:(id)a3;
- (void)set_headerElementKind:(id)a3;
@end

@implementation _UICollectionViewListLayoutSectionConfiguration

- (int64_t)appearanceStyle
{
  return self->_appearanceStyle;
}

- (BOOL)stylesFirstItemAsHeader
{
  return self->_stylesFirstItemAsHeader;
}

- (id)separatorInsetProvider
{
  return self->_separatorInsetProvider;
}

- (_UIListSeparatorConfiguration)_separatorConfigurationNoCopy
{
  return self->_separatorConfiguration;
}

- (_UIListSeparatorConfiguration)_separatorConfiguration
{
  v2 = (void *)[(_UIListSeparatorConfiguration *)self->_separatorConfiguration copy];
  return (_UIListSeparatorConfiguration *)v2;
}

- (id)_itemSeparatorHandler
{
  return self->_itemSeparatorHandler;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    objc_storeWeak((id *)(v4 + 152), WeakRetained);

    objc_storeStrong((id *)(v4 + 160), self->_layoutEnvironment);
    objc_storeStrong((id *)(v4 + 168), self->_itemHeights);
    *(unsigned char *)(v4 + 10) = self->__apiVersion;
    objc_storeStrong((id *)(v4 + 176), self->__headerElementKind);
    objc_storeStrong((id *)(v4 + 184), self->__footerElementKind);
    objc_storeStrong((id *)(v4 + 192), self->__backgroundColor);
    *(void *)(v4 + 32) = self->_appearanceStyle;
    *(double *)(v4 + 40) = self->_cornerRadius;
    *(unsigned char *)(v4 + 8) = self->_stylesFirstItemAsHeader;
    *(double *)(v4 + 48) = self->_rowHeight;
    *(double *)(v4 + 56) = self->_sectionHeaderHeight;
    *(double *)(v4 + 64) = self->_sectionFooterHeight;
    *(double *)(v4 + 72) = self->_estimatedRowHeight;
    *(double *)(v4 + 80) = self->_estimatedSectionHeaderHeight;
    *(double *)(v4 + 88) = self->_estimatedSectionFooterHeight;
    *(double *)(v4 + 96) = self->_headerTopPadding;
    *(void *)(v4 + 104) = self->_separatorStyle;
    uint64_t v6 = [self->_separatorInsetProvider copy];
    v7 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = v6;

    uint64_t v8 = [(_UIListSeparatorConfiguration *)self->_separatorConfiguration copy];
    v9 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v8;

    uint64_t v10 = [self->_itemSeparatorHandler copy];
    v11 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v10;

    uint64_t v12 = [self->_leadingSwipeActionsConfigurationProvider copy];
    v13 = *(void **)(v4 + 120);
    *(void *)(v4 + 120) = v12;

    uint64_t v14 = [self->_trailingSwipeActionsConfigurationProvider copy];
    v15 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = v14;

    uint64_t v16 = [self->_willBeginSwipingHandler copy];
    v17 = *(void **)(v4 + 136);
    *(void *)(v4 + 136) = v16;

    uint64_t v18 = [self->_didEndSwipingHandler copy];
    v19 = *(void **)(v4 + 144);
    *(void *)(v4 + 144) = v18;

    *(unsigned char *)(v4 + 9) = self->_sectionHeaderHugsContent;
  }
  return (id)v4;
}

- (_UICollectionViewListLayoutSectionConfiguration)init
{
  return [(_UICollectionViewListLayoutSectionConfiguration *)self initWithAppearanceStyle:0 layoutEnvironment:0];
}

- (double)headerTopPadding
{
  return self->_headerTopPadding;
}

- (_UICollectionViewListLayoutSectionConfiguration)initWithAppearanceStyle:(int64_t)a3 layoutEnvironment:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)_UICollectionViewListLayoutSectionConfiguration;
  uint64_t v6 = [(_UICollectionViewListLayoutSectionConfiguration *)&v15 init];
  if (v6)
  {
    id v7 = a4;
    objc_storeStrong((id *)v6 + 20, a4);
    uint64_t v8 = (void *)*((void *)v6 + 22);
    *((void *)v6 + 22) = @"UICollectionViewListLayoutElementKindSectionHeader";

    v9 = (void *)*((void *)v6 + 23);
    *((void *)v6 + 23) = @"UICollectionViewListLayoutElementKindSectionFooter";

    *((void *)v6 + 4) = a3;
    v6[8] = 0;
    *(int64x2_t *)(v6 + 40) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)(v6 + 56) = vdupq_n_s64(0xC08F400000000000);
    *((void *)v6 + 12) = 0x7FEFFFFFFFFFFFFFLL;
    *((void *)v6 + 13) = [v6 _defaultSeparatorStyleForAppearanceStyle:a3];
    uint64_t v10 = +[_UIListSeparatorConfiguration _configurationForAppearanceStyle:a3 inLayoutEnvironment:v7];
    v11 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v10;

    if ([v6 _shouldPinSupplementaries])
    {
      uint64_t v12 = [v7 traitCollection];
      if ([v12 userInterfaceIdiom] == 6) {
        char v13 = _UISupportsVisionDefaultContentHuggingSectionHeaders();
      }
      else {
        char v13 = 0;
      }
      v6[9] = v13;
    }
    else
    {
      v6[9] = 0;
    }
  }
  return (_UICollectionViewListLayoutSectionConfiguration *)v6;
}

- (BOOL)_shouldPinSupplementaries
{
  return (self->_appearanceStyle & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (int64_t)_defaultSeparatorStyleForAppearanceStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_186B9DC90[a3 - 1];
  }
  uint64_t v4 = [(_UICollectionViewListLayoutSectionConfiguration *)self _constants];
  uint64_t v5 = [v4 defaultSeparatorStyleForTableViewStyle:v3];

  return v5 != 0;
}

- (double)_separatorHeight
{
  uint64_t v3 = [(_UICollectionViewListLayoutSectionConfiguration *)self _traitCollection];
  [v3 displayScale];
  double v5 = v4;

  double v6 = 1.0;
  if (v5 > 0.0
    && ![(_UICollectionViewListLayoutSectionConfiguration *)self _shouldDrawThickSeparators])
  {
    return 1.0 / v5;
  }
  return v6;
}

- (BOOL)_shouldDrawThickSeparators
{
  v2 = [(_UICollectionViewListLayoutSectionConfiguration *)self _traitCollection];
  uint64_t v3 = [v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (UITableConstants)_constants
{
  v2 = [(_UICollectionViewListLayoutSectionConfiguration *)self _traitCollection];
  uint64_t v3 = _UITableConstantsForTraitCollection(v2);

  return (UITableConstants *)v3;
}

- (id)_traitCollection
{
  v2 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment traitCollection];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    +[UITraitCollection _fallbackTraitCollection]();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v5 = v4;

  return v5;
}

- (int64_t)_defaultContentInsetsReference
{
  return 1;
}

- (UICollectionView)_collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIColor)_backgroundColor
{
  return self->__backgroundColor;
}

- (NSString)_headerElementKind
{
  return self->__headerElementKind;
}

- (NSCollectionLayoutEnvironment_Private)_layoutEnvironment
{
  return self->_layoutEnvironment;
}

- (double)_defaultRowHeight
{
  v2 = [(_UICollectionViewListLayoutSectionConfiguration *)self _constants];
  [v2 defaultRowHeightForTableView:0];
  double v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundColor, 0);
  objc_storeStrong((id *)&self->__footerElementKind, 0);
  objc_storeStrong((id *)&self->__headerElementKind, 0);
  objc_storeStrong((id *)&self->_itemHeights, 0);
  objc_storeStrong((id *)&self->_layoutEnvironment, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong(&self->_didEndSwipingHandler, 0);
  objc_storeStrong(&self->_willBeginSwipingHandler, 0);
  objc_storeStrong(&self->_trailingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong(&self->_leadingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong(&self->_separatorInsetProvider, 0);
  objc_storeStrong(&self->_itemSeparatorHandler, 0);
  objc_storeStrong((id *)&self->_separatorConfiguration, 0);
}

- (BOOL)_hasHeaderOrFirstItemStyledAsHeader
{
  return self->_sectionHeaderHeight != -1000.0 || self->_stylesFirstItemAsHeader;
}

- (BOOL)_hasFooter
{
  return self->_sectionFooterHeight != -1000.0;
}

- (void)_addSupplementaryItemsToLayout:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  double v5 = objc_opt_new();
  int v6 = [a3 _pinnedSupplementariesShouldOverlap];
  if (self->_sectionHeaderHugsContent) {
    [off_1E52D2B08 estimatedDimension:100.0];
  }
  else {
  id v7 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  }
  double sectionHeaderHeight = self->_sectionHeaderHeight;
  double v9 = fabs(sectionHeaderHeight + -1.79769313e308);
  if (fabs(sectionHeaderHeight + 1.0) > 2.22044605e-16 && v9 > 2.22044605e-16)
  {
    if (sectionHeaderHeight <= 0.0) {
      goto LABEL_16;
    }
    v11 = off_1E52D2B30;
    uint64_t v12 = objc_msgSend(off_1E52D2B08, "absoluteDimension:");
  }
  else
  {
    [(_UICollectionViewListLayoutSectionConfiguration *)self _effectiveEstimatedSectionHeaderHeight];
    v11 = off_1E52D2B30;
    uint64_t v12 = objc_msgSend(off_1E52D2B08, "estimatedDimension:");
  }
  char v13 = (void *)v12;
  uint64_t v14 = [v11 sizeWithWidthDimension:v7 heightDimension:v12];

  if (v14)
  {
    if (self->_sectionHeaderHugsContent) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    uint64_t v16 = [off_1E52D2AF8 boundarySupplementaryItemWithLayoutSize:v14 elementKind:self->__headerElementKind alignment:v15];
    objc_msgSend(v16, "setPinToVisibleBounds:", -[_UICollectionViewListLayoutSectionConfiguration _shouldPinSupplementaries](self, "_shouldPinSupplementaries"));
    [v16 setZIndex:200];
    if (v6) {
      [v16 _setPinningZIndex:210];
    }
    [v5 addObject:v16];
  }
LABEL_16:
  double sectionFooterHeight = self->_sectionFooterHeight;
  double v18 = fabs(sectionFooterHeight + -1.79769313e308);
  if (fabs(sectionFooterHeight + 1.0) > 2.22044605e-16 && v18 > 2.22044605e-16)
  {
    if (sectionFooterHeight <= 0.0) {
      goto LABEL_28;
    }
    v22 = off_1E52D2B30;
    v23 = objc_msgSend(off_1E52D2B08, "fractionalWidthDimension:", 1.0, v18);
    uint64_t v24 = [off_1E52D2B08 absoluteDimension:self->_sectionFooterHeight];
  }
  else
  {
    [(_UICollectionViewListLayoutSectionConfiguration *)self _effectiveEstimatedSectionFooterHeight];
    double v21 = v20;
    v22 = off_1E52D2B30;
    v23 = [off_1E52D2B08 fractionalWidthDimension:1.0];
    uint64_t v24 = [off_1E52D2B08 estimatedDimension:v21];
  }
  v25 = (void *)v24;
  v26 = [v22 sizeWithWidthDimension:v23 heightDimension:v24];

  if (v26)
  {
    if (self->_sectionHeaderHugsContent) {
      uint64_t v27 = 4;
    }
    else {
      uint64_t v27 = 5;
    }
    v28 = [off_1E52D2AF8 boundarySupplementaryItemWithLayoutSize:v26 elementKind:self->__footerElementKind alignment:v27];
    objc_msgSend(v28, "setPinToVisibleBounds:", -[_UICollectionViewListLayoutSectionConfiguration _shouldPinSupplementaries](self, "_shouldPinSupplementaries"));
    [v28 setZIndex:200];
    if (v6) {
      [v28 _setPinningZIndex:210];
    }
    [v5 addObject:v28];
  }
LABEL_28:
  objc_msgSend(a3, "setSupplementariesFollowContentInsets:", -[_UICollectionViewListLayoutSectionConfiguration _shouldSupplementariesFollowSectionInsets](self, "_shouldSupplementariesFollowSectionInsets"));
  [a3 setBoundarySupplementaryItems:v5];
  if ([(_UICollectionViewListLayoutSectionConfiguration *)self _usesSectionBackgroundDecoration])
  {
    v29 = [off_1E52D2B00 backgroundDecorationItemWithElementKind:@"_UICollectionViewListLayoutSectionBackgroundColorDecorationElementKind"];
    [v29 _setRegistrationViewClass:objc_opt_class()];
    [v29 setZIndex:0];
    v31[0] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    [a3 setDecorationItems:v30];
  }
}

- (BOOL)_hasSupplementaryAsHeader
{
  return self->_sectionHeaderHeight != -1000.0;
}

- (BOOL)_shouldSupplementariesFollowSectionInsets
{
  double v3 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  return v4 == 6 || (self->_appearanceStyle & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

- (BOOL)_isAPIVersion
{
  return self->__apiVersion;
}

- (id)_createSwipeActionsContainer
{
  v2 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  double v3 = [off_1E52D2B08 fractionalHeightDimension:1.0];
  uint64_t v4 = [off_1E52D2B30 sizeWithWidthDimension:v2 heightDimension:v3];

  double v5 = objc_msgSend(off_1E52D2AF0, "layoutAnchorWithAnchorPoint:", 0.5, 0.5);
  int v6 = [off_1E52D2B00 decorationItemWithSize:v4 elementKind:0x1ED14A0C0 containerAnchor:v5];
  [v6 _setRegistrationViewClass:objc_opt_class()];
  [v6 setZIndex:5];

  return v6;
}

- (id)_generateLayoutGroup:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 364, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_layoutEnvironment, a3);
  v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  if (self->_separatorStyle || self->_itemSeparatorHandler)
  {
    double v5 = [(_UICollectionViewListLayoutSectionConfiguration *)self _createSeparatorForBottom:1];
    [v47 addObject:v5];

    int v6 = [(_UICollectionViewListLayoutSectionConfiguration *)self _createSeparatorForBottom:0];
    [v47 addObject:v6];
  }
  if ([(_UICollectionViewListLayoutSectionConfiguration *)self _wantsSwipeActions])
  {
    id v7 = [(_UICollectionViewListLayoutSectionConfiguration *)self _createSwipeActionsContainer];
    [v47 addObject:v7];
  }
  if (!self->_itemHeights) {
    goto LABEL_23;
  }
  uint64_t v8 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  double v9 = self;
  obj = self->_itemHeights;
  uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * i) doubleValue];
        double v15 = v14;
        BOOL v17 = fabs(v14 + 1.0) > 2.22044605e-16;
        double v16 = fabs(v14 + -1.79769313e308);
        BOOL v17 = v17 && v16 > 2.22044605e-16;
        if (v17)
        {
          double v20 = off_1E52D2B30;
          double v21 = [off_1E52D2B08 fractionalWidthDimension:1.0];
          [off_1E52D2B08 absoluteDimension:v15];
        }
        else
        {
          [(_UICollectionViewListLayoutSectionConfiguration *)v9 _effectiveEstimatedRowHeight];
          double v19 = v18;
          double v20 = off_1E52D2B30;
          double v21 = [off_1E52D2B08 fractionalWidthDimension:1.0];
          [off_1E52D2B08 estimatedDimension:v19];
        v22 = };
        v23 = [v20 sizeWithWidthDimension:v21 heightDimension:v22];

        uint64_t v24 = [off_1E52D2B20 itemWithSize:v23 decorationItems:v47];
        [v8 addObject:v24];
      }
      uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v11);
  }

  v25 = (void *)[v8 copy];
  self = v9;
  if (!v25)
  {
LABEL_23:
    double rowHeight = self->_rowHeight;
    double v27 = fabs(rowHeight + -1.79769313e308);
    if (fabs(rowHeight + 1.0) <= 2.22044605e-16 || v27 <= 2.22044605e-16) {
      goto LABEL_27;
    }
    v40 = [off_1E52D2B08 fractionalWidthDimension:1.0];
    v41 = [off_1E52D2B08 absoluteDimension:rowHeight];
    v42 = [off_1E52D2B30 sizeWithWidthDimension:v40 heightDimension:v41];

    v43 = [off_1E52D2B20 itemWithSize:v42 decorationItems:v47];
    v53 = v43;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];

    if (!v25)
    {
LABEL_27:
      [(_UICollectionViewListLayoutSectionConfiguration *)self _effectiveEstimatedRowHeight];
      double v30 = v29;
      v31 = [off_1E52D2B08 fractionalWidthDimension:1.0];
      v32 = [off_1E52D2B08 estimatedDimension:v30];
      v33 = [off_1E52D2B30 sizeWithWidthDimension:v31 heightDimension:v32];

      v34 = [off_1E52D2B20 itemWithSize:v33 decorationItems:v47];
      v52 = v34;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    }
  }
  v35 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  v36 = [off_1E52D2B08 estimatedDimension:1000.0];
  v37 = [off_1E52D2B30 sizeWithWidthDimension:v35 heightDimension:v36];

  v38 = [off_1E52D2B18 verticalGroupWithLayoutSize:v37 subitems:v25];

  return v38;
}

- (id)_createSeparatorForBottom:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  [(_UICollectionViewListLayoutSectionConfiguration *)self _separatorHeight];
  int v6 = objc_msgSend(off_1E52D2B08, "absoluteDimension:");
  id v7 = [off_1E52D2B30 sizeWithWidthDimension:v5 heightDimension:v6];

  if (v3) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 1;
  }
  if (v3) {
    double v9 = _UICollectionViewListLayoutElementKindBottomSeparator;
  }
  else {
    double v9 = &_UICollectionViewListLayoutElementKindTopSeparator;
  }
  uint64_t v10 = objc_msgSend(off_1E52D2AF0, "layoutAnchorWithEdges:absoluteOffset:", v8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  uint64_t v11 = [off_1E52D2B00 decorationItemWithSize:v7 elementKind:*v9 containerAnchor:v10];
  [v11 _setRegistrationViewClass:objc_opt_class()];
  [v11 setZIndex:100];

  return v11;
}

- (BOOL)_wantsSwipeActions
{
  return (dyld_program_sdk_at_least() & 1) != 0
      || self->_trailingSwipeActionsConfigurationProvider
      || self->_leadingSwipeActionsConfigurationProvider != 0;
}

- (double)_effectiveEstimatedRowHeight
{
  double result = self->_estimatedRowHeight;
  double v3 = fabs(result + -1.79769313e308);
  BOOL v4 = fabs(result + 1.0) > 2.22044605e-16 && v3 > 2.22044605e-16;
  if (!v4 || result == 0.0) {
    [(_UICollectionViewListLayoutSectionConfiguration *)self _defaultRowHeight];
  }
  return result;
}

- (double)_defaultSectionHeaderHeight
{
  unint64_t v3 = [(_UICollectionViewListLayoutSectionConfiguration *)self appearanceStyle] - 1;
  if (v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_186B9DC90[v3];
  }
  double v5 = [(_UICollectionViewListLayoutSectionConfiguration *)self _constants];
  [v5 defaultSectionHeaderHeightForTableViewStyle:v4 screen:0];
  double v7 = v6;
  uint64_t v8 = [(_UICollectionViewListLayoutSectionConfiguration *)self _traitCollection];
  [v8 displayScale];
  double v10 = UIPixelBoundaryOffset(1, v7, v9);

  return v10;
}

- (double)_effectiveEstimatedSectionHeaderHeight
{
  double result = self->_estimatedSectionHeaderHeight;
  double v3 = fabs(result + -1.79769313e308);
  BOOL v4 = fabs(result + 1.0) > 2.22044605e-16 && v3 > 2.22044605e-16;
  if (!v4 || result == 0.0) {
    [(_UICollectionViewListLayoutSectionConfiguration *)self _defaultSectionHeaderHeight];
  }
  return result;
}

- (NSDirectionalEdgeInsets)_sectionContentInsetsForAppearanceStyleWithDefaultInsets:(NSDirectionalEdgeInsets)a3 headerFootersAreChromeless:(BOOL)a4
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  [(_UICollectionViewListLayoutSectionConfiguration *)self _topContentInsetForPaddingAboveHeader];
  double v10 = v9;
  switch(self->_appearanceStyle)
  {
    case 0:
      double v19 = [(_UICollectionViewListLayoutSectionConfiguration *)self _traitCollection];
      uint64_t v20 = [v19 userInterfaceIdiom];

      if (v20 == 6) {
        goto LABEL_2;
      }
      break;
    case 1:
    case 2:
      goto LABEL_2;
    case 3:
      double v21 = [(_UICollectionViewListLayoutSectionConfiguration *)self _traitCollection];
      uint64_t v22 = [v21 userInterfaceIdiom];

      if (v22 == 6)
      {
LABEL_2:
        -[_UICollectionViewListLayoutSectionConfiguration _sectionContentInsetsForVerticallySeparatedSectionsWithDefaultInsets:](self, "_sectionContentInsetsForVerticallySeparatedSectionsWithDefaultInsets:", v10, leading, bottom, trailing);
        double v10 = v11;
        double leading = v12;
        double bottom = v13;
        double trailing = v14;
      }
      else if (![(_UICollectionViewListLayoutSectionConfiguration *)self _hasFooter])
      {
        double bottom = bottom + 10.0;
      }
      break;
    case 4:
      if (!a4
        && ([(_UICollectionViewListLayoutSectionConfiguration *)self _hasHeaderOrFirstItemStyledAsHeader]|| [(_UICollectionViewListLayoutSectionConfiguration *)self _hasFooter]))
      {
        double v10 = v10 + 8.0;
        double bottom = bottom + 8.0;
      }
      break;
    default:
      break;
  }
  double v15 = v10;
  double v16 = leading;
  double v17 = bottom;
  double v18 = trailing;
  result.double trailing = v18;
  result.double bottom = v17;
  result.double leading = v16;
  result.top = v15;
  return result;
}

- (double)_topContentInsetForPaddingAboveHeader
{
  if (!self->_stylesFirstItemAsHeader) {
    return 0.0;
  }
  double headerTopPadding = self->_headerTopPadding;
  if (headerTopPadding == 1.79769313e308)
  {
    int64_t appearanceStyle = self->_appearanceStyle;
    if (appearanceStyle == 3)
    {
      double v9 = [(_UICollectionViewListLayoutSectionConfiguration *)self _constants];
      [v9 defaultSidebarPaddingAboveSectionHeadersWithFallbackTableStyle:1];
    }
    else
    {
      if (appearanceStyle == 2) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = appearanceStyle == 1;
      }
      double v6 = [(_UICollectionViewListLayoutSectionConfiguration *)self _layoutEnvironment];
      uint64_t v7 = [v6 _sectionIndex];

      uint64_t v8 = [(_UICollectionViewListLayoutSectionConfiguration *)self _constants];
      double v9 = v8;
      if (v7) {
        [v8 defaultPaddingAboveSectionHeadersForTableStyle:v5];
      }
      else {
        [v8 defaultPaddingAboveFirstSectionHeaderForTableStyle:v5];
      }
    }
    double headerTopPadding = v10;
  }
  return headerTopPadding;
}

- (NSDirectionalEdgeInsets)_sectionContentInsetsForVerticallySeparatedSectionsWithDefaultInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing = a3.trailing;
  double bottom = a3.bottom;
  CGFloat leading = a3.leading;
  double top = a3.top;
  [(_UICollectionViewListLayoutSectionConfiguration *)self _topContentInsetForGroupedAppearance];
  double v9 = v8;
  uint64_t v10 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment _sectionIndex];
  double v11 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment _dataSourceSnapshot];
  uint64_t v12 = [v11 numberOfSections] - 1;

  double v13 = 20.0;
  if (v10 != v12)
  {
    [(_UICollectionViewListLayoutSectionConfiguration *)self _defaultSectionFooterHeight];
    double v13 = v14;
  }
  double v15 = top + v9;
  BOOL v16 = [(_UICollectionViewListLayoutSectionConfiguration *)self _hasFooter];
  double v17 = 0.0;
  if (!v16) {
    double v17 = v13;
  }
  double v18 = bottom + v17;
  double v19 = v15;
  double v20 = leading;
  double v21 = trailing;
  result.CGFloat trailing = v21;
  result.double bottom = v18;
  result.CGFloat leading = v20;
  result.double top = v19;
  return result;
}

- (double)_topContentInsetForGroupedAppearance
{
  double v3 = 0.0;
  if (![(_UICollectionViewListLayoutSectionConfiguration *)self _hasHeaderOrFirstItemStyledAsHeader])
  {
    [(_UICollectionViewListLayoutSectionConfiguration *)self _defaultSectionHeaderHeight];
    double v3 = v4;
  }
  if (dyld_program_sdk_at_least())
  {
    if (![(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment _sectionIndex])
    {
      double v3 = 0.0;
      if (([(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment _wantsCollapsedTopSpacing] & 1) == 0&& ![(_UICollectionViewListLayoutSectionConfiguration *)self _hasHeaderOrFirstItemStyledAsHeader])
      {
        unint64_t v5 = self->_appearanceStyle - 1;
        if (v5 > 2) {
          uint64_t v6 = 0;
        }
        else {
          uint64_t v6 = qword_186B9DC90[v5];
        }
        uint64_t v7 = [(_UICollectionViewListLayoutSectionConfiguration *)self _constants];
        [v7 defaultPaddingAboveFirstSectionWithoutHeaderTableStyle:v6];
        double v3 = v8;
      }
    }
  }
  return v3;
}

- (double)_defaultSectionFooterHeight
{
  unint64_t v3 = [(_UICollectionViewListLayoutSectionConfiguration *)self appearanceStyle] - 1;
  if (v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_186B9DC90[v3];
  }
  unint64_t v5 = [(_UICollectionViewListLayoutSectionConfiguration *)self _constants];
  [v5 defaultSectionFooterHeightForTableViewStyle:v4 screen:0];
  double v7 = v6;
  double v8 = [(_UICollectionViewListLayoutSectionConfiguration *)self _traitCollection];
  [v8 displayScale];
  double v10 = UIPixelBoundaryOffset(1, v7, v9);

  return v10;
}

- (void)setWillBeginSwipingHandler:(id)a3
{
}

- (void)setTrailingSwipeActionsConfigurationProvider:(id)a3
{
}

- (void)setSeparatorStyle:(int64_t)a3
{
  self->_separatorStyle = a3;
}

- (void)setLeadingSwipeActionsConfigurationProvider:(id)a3
{
}

- (void)setDidEndSwipingHandler:(id)a3
{
}

- (void)set_headerElementKind:(id)a3
{
}

- (void)set_footerElementKind:(id)a3
{
}

- (void)set_backgroundColor:(id)a3
{
}

- (void)set_apiVersion:(BOOL)a3
{
  self->__apiVersion = a3;
}

- (void)setStylesFirstItemAsHeader:(BOOL)a3
{
  self->_stylesFirstItemAsHeader = a3;
}

- (void)setSectionHeaderHugsContent:(BOOL)a3
{
  self->_sectionHeaderHugsContent = a3;
}

- (void)setSectionHeaderHeight:(double)a3
{
  self->_double sectionHeaderHeight = a3;
}

- (void)setSectionFooterHeight:(double)a3
{
  self->_double sectionFooterHeight = a3;
}

- (void)setHeaderTopPadding:(double)a3
{
  if (a3 < 0.0) {
    a3 = 1.79769313e308;
  }
  self->_double headerTopPadding = a3;
}

- (void)setCornerRadius:(double)a3
{
  if (a3 < 0.0) {
    a3 = 1.79769313e308;
  }
  self->_cornerRadius = a3;
}

- (void)setAppearanceStyle:(int64_t)a3
{
  self->_int64_t appearanceStyle = a3;
}

- (void)_setSeparatorConfiguration:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (_UIListSeparatorConfiguration *)[a3 copy];
  }
  else
  {
    uint64_t v4 = +[_UIListSeparatorConfiguration _configurationForAppearanceStyle:self->_appearanceStyle inLayoutEnvironment:self->_layoutEnvironment];
  }
  separatorConfiguration = self->_separatorConfiguration;
  self->_separatorConfiguration = v4;
}

- (void)_setItemSeparatorHandler:(id)a3
{
}

+ (id)new
{
  id v2 = objc_alloc((Class)a1);
  return (id)[v2 initWithAppearanceStyle:0 layoutEnvironment:0];
}

- (void)setSeparatorInset:(NSDirectionalEdgeInsets)a3
{
}

- (void)setRowHeight:(double)a3
{
  self->_double rowHeight = a3;
}

- (_UICollectionViewListLayoutSectionConfiguration)initWithCollectionView:(id)a3
{
  uint64_t v4 = [(_UICollectionViewListLayoutSectionConfiguration *)self initWithAppearanceStyle:0 layoutEnvironment:0];
  unint64_t v5 = v4;
  if (v4) {
    objc_storeWeak((id *)&v4->_collectionView, a3);
  }
  return v5;
}

- (NSDirectionalEdgeInsets)separatorInset
{
  [(_UIListSeparatorConfiguration *)self->_separatorConfiguration _insets];
  result.CGFloat trailing = v5;
  result.double bottom = v4;
  result.CGFloat leading = v3;
  result.double top = v2;
  return result;
}

- (double)_effectiveEstimatedSectionFooterHeight
{
  double result = self->_estimatedSectionFooterHeight;
  double v3 = fabs(result + -1.79769313e308);
  BOOL v4 = fabs(result + 1.0) > 2.22044605e-16 && v3 > 2.22044605e-16;
  if (!v4 || result == 0.0) {
    [(_UICollectionViewListLayoutSectionConfiguration *)self _defaultSectionFooterHeight];
  }
  return result;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (double)sectionHeaderHeight
{
  return self->_sectionHeaderHeight;
}

- (double)sectionFooterHeight
{
  return self->_sectionFooterHeight;
}

- (double)estimatedRowHeight
{
  return self->_estimatedRowHeight;
}

- (void)setEstimatedRowHeight:(double)a3
{
  self->_estimatedRowHeight = a3;
}

- (double)estimatedSectionHeaderHeight
{
  return self->_estimatedSectionHeaderHeight;
}

- (void)setEstimatedSectionHeaderHeight:(double)a3
{
  self->_estimatedSectionHeaderHeight = a3;
}

- (double)estimatedSectionFooterHeight
{
  return self->_estimatedSectionFooterHeight;
}

- (void)setEstimatedSectionFooterHeight:(double)a3
{
  self->_estimatedSectionFooterHeight = a3;
}

- (BOOL)sectionHeaderHugsContent
{
  return self->_sectionHeaderHugsContent;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void)setSeparatorInsetProvider:(id)a3
{
}

- (id)leadingSwipeActionsConfigurationProvider
{
  return self->_leadingSwipeActionsConfigurationProvider;
}

- (id)trailingSwipeActionsConfigurationProvider
{
  return self->_trailingSwipeActionsConfigurationProvider;
}

- (id)willBeginSwipingHandler
{
  return self->_willBeginSwipingHandler;
}

- (id)didEndSwipingHandler
{
  return self->_didEndSwipingHandler;
}

- (NSArray)_itemHeights
{
  return self->_itemHeights;
}

- (void)_setItemHeights:(id)a3
{
}

- (NSString)_footerElementKind
{
  return self->__footerElementKind;
}

@end