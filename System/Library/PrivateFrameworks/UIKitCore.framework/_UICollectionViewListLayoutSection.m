@interface _UICollectionViewListLayoutSection
- (BOOL)__isLastItemInSection:(id)a3;
- (BOOL)__isLastSection:(int64_t)a3;
- (BOOL)_adjustsLayoutToDrawTopSeparatorInSection:(int64_t)a3 interactionState:(id)a4;
- (BOOL)_hasHeaderFooterBelowLastItemInSection:(int64_t)a3 interactionState:(id)a4;
- (BOOL)_hasHorizontalInsets;
- (BOOL)_isRTL;
- (BOOL)_pinnedSupplementariesShouldOverlap;
- (BOOL)_shouldDrawSeparatorAtBottom:(BOOL)a3 ofSection:(int64_t)a4 interactionState:(id)a5;
- (BOOL)_shouldHideBottomSeparatorAtIndexPath:(id)a3 forGrouping:(unint64_t)a4 considerNextCellGrouping:(BOOL)a5 interactionState:(id)a6;
- (BOOL)_shouldHideTopSeparatorAtIndexPath:(id)a3 interactionState:(id)a4;
- (BOOL)_shouldInvalidateForScrollViewLayoutAdjustmentsChange;
- (BOOL)_useRoundedSwipeActions;
- (BOOL)_wantsBandSelectionVisuals;
- (BOOL)_wantsSwipeActions;
- (BOOL)prefersListSolver;
- (BOOL)shouldRestrictOrthogonalAxisDuringInteractiveMovement;
- (NSCollectionLayoutEnvironment_Private)_layoutEnvironment;
- (NSDirectionalEdgeInsets)_defaultDirectionalLayoutMarginsInsideSection;
- (NSDirectionalEdgeInsets)_defaultSectionContentInsetsForAppearanceStyle:(int64_t)a3;
- (NSDirectionalEdgeInsets)_effectiveBoundarySeparatorInsets:(NSDirectionalEdgeInsets)a3;
- (NSDirectionalEdgeInsets)_effectiveSectionHorizontalInsets;
- (NSDirectionalEdgeInsets)_effectiveSectionSupplementaryHorizontalInsets;
- (NSDirectionalEdgeInsets)_horizontalInsetsForInsetsReference:(int64_t)a3;
- (NSDirectionalEdgeInsets)_sectionPreferredBottomSeparatorInsetsForIndexPath:(id)a3;
- (NSDirectionalEdgeInsets)_sectionPreferredTopSeparatorInsetsWithBottomInsets:(NSDirectionalEdgeInsets)a3 hasCustomInsets:(BOOL *)a4;
- (UIEdgeInsets)_defaultLayoutMarginsForSupplementaryViewWithLayoutAttributes:(id)a3;
- (UIEdgeInsets)_defaultLayoutMarginsInsideSection;
- (UIEdgeInsets)_effectiveCollectionViewLayoutMarginsForAppearanceStyle:(int64_t)a3 forUseAsContentInsets:(BOOL)a4;
- (_UICollectionViewListLayoutSection)initWithConfiguration:(id)a3;
- (_UICollectionViewListLayoutSection)initWithConfiguration:(id)a3 layoutEnvironment:(id)a4;
- (double)_alignedContentMarginGivenMargin:(double)a3;
- (double)_effectiveCornerRadius;
- (double)_paddingToBoundarySupplementaries;
- (id)_constants;
- (id)_descriptionProperties;
- (id)_effectiveBackgroundColor;
- (id)_generateListSectionDataForLayoutAttributes:(id)a3 interactionState:(id)a4;
- (id)_invalidationContextForCellBackgroundOrBottomSeparatorChangeAtIndexPath:(id)a3 interactionState:(id)a4 separatorOnly:(BOOL)a5;
- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3;
- (id)_separatorConfigurationForItemAtIndexPath:(id)a3 withSelectionGrouping:(unint64_t)a4 considerNextCellGrouping:(BOOL)a5 interactionState:(id)a6;
- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_headerFooterPinningBehavior;
- (int64_t)_separatorInsetBehaviorAtBottom:(BOOL)a3 ofSection:(int64_t)a4 interactionState:(id)a5;
- (unint64_t)_maskedCornersForBackgroundOfItemWithSelectionGrouping:(unint64_t)a3;
- (void)_configureLayoutAttributes:(id)a3 forSeparatorAtBottom:(BOOL)a4 preferredConfiguration:(id)a5 interactionState:(id)a6;
- (void)_configureLayoutAttributesForBackgroundDecoration:(id)a3;
- (void)_configureLayoutAttributesForPlainCell:(id)a3;
- (void)_configureLayoutAttributesForPlainSupplementaryView:(id)a3;
- (void)_configureLayoutAttributesForSidebarPlainCell:(id)a3;
- (void)_configureLayoutAttributesForSwipeActionMasking:(id)a3 interactionState:(id)a4;
- (void)_configureLayoutAttributesWithDefaultMasking:(id)a3;
- (void)_configureLayoutAttributesWithInsetGroupedMasking:(id)a3 stylesFirstItemAsHeader:(BOOL)a4;
- (void)_didEndSwiping;
- (void)_enrichLayoutAttributes:(id)a3 interactionState:(id)a4;
- (void)_transformFittingLayoutAttributes:(id)a3 interactionState:(id)a4;
- (void)_transformPreferredLayoutAttributes:(id)a3 interactionState:(id)a4;
- (void)_updateMaxWidthForLayoutAttributes:(id)a3;
- (void)_updateStyleForSwipeActionsConfiguration:(id)a3;
- (void)_willBeginSwiping;
@end

@implementation _UICollectionViewListLayoutSection

- (BOOL)_isRTL
{
  v2 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment traitCollection];
  BOOL v3 = [v2 layoutDirection] == 1;

  return v3;
}

- (id)_constants
{
  v2 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment traitCollection];
  BOOL v3 = _UITableConstantsForTraitCollection(v2);

  return v3;
}

- (void)_configureLayoutAttributesForPlainCell:(id)a3
{
  [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesWithDefaultMasking:"_configureLayoutAttributesWithDefaultMasking:"];
  [(_UICollectionViewListLayoutSection *)self _defaultLayoutMarginsInsideSection];
  uint64_t v6 = v5;
  double v8 = v7;
  uint64_t v10 = v9;
  double v12 = v11;
  if ([(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration stylesFirstItemAsHeader])
  {
    v13 = [a3 indexPath];
    uint64_t v14 = [v13 item];

    if (!v14
      && ![(NSCollectionLayoutSection *)self supplementariesFollowContentInsets])
    {
      [(_UICollectionViewListLayoutSection *)self _effectiveSectionHorizontalInsets];
      double v16 = v15;
      double v18 = v17;
      [a3 bounds];
      objc_msgSend(a3, "setBounds:");
      BOOL v19 = [(_UICollectionViewListLayoutSection *)self _isRTL];
      if (v19) {
        double v20 = v18;
      }
      else {
        double v20 = v16;
      }
      if (v19) {
        double v21 = v16;
      }
      else {
        double v21 = v18;
      }
      double v8 = v8 + v20;
      double v12 = v12 + v21;
    }
  }
  if (a3)
  {
    *((_WORD *)a3 + 144) |= 0x200u;
    *((void *)a3 + 40) = v6;
    *((double *)a3 + 41) = v8;
    *((void *)a3 + 42) = v10;
    *((double *)a3 + 43) = v12;
  }
}

- (UIEdgeInsets)_defaultLayoutMarginsInsideSection
{
  int64_t v3 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle];
  int64_t v4 = v3;
  if (!v3)
  {
    uint64_t v5 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 6)
    {
LABEL_5:
      double v7 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment container];
      [v7 contentSize];
      double v9 = v8;
      double v11 = v10;

      [(_UICollectionViewListLayoutSection *)self _defaultSectionContentInsetsForAppearanceStyle:v4];
      double v14 = v9 - v12 - v13;
      double v15 = [(_UICollectionViewListLayoutSection *)self _constants];
      objc_msgSend(v15, "defaultLayoutMarginsInsideSectionForSize:tableStyle:", 2 * (v4 == 2), v14, v11);
      goto LABEL_6;
    }
LABEL_11:
    [(_UICollectionViewListLayoutSection *)self _effectiveCollectionViewLayoutMarginsForAppearanceStyle:v4 forUseAsContentInsets:0];
    double v20 = v24;
    double v21 = v25;
    double v22 = v26;
    double v23 = v27;
    goto LABEL_12;
  }
  if (v3 == 2) {
    goto LABEL_5;
  }
  if ((unint64_t)(v3 - 3) > 1) {
    goto LABEL_11;
  }
  double v15 = [(_UICollectionViewListLayoutSection *)self _constants];
  double v23 = 0.0;
  double v22 = 0.0;
  double v21 = 0.0;
  double v20 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_7;
  }
  [v15 defaultSidebarLayoutMarginsForElementsInsideSection];
LABEL_6:
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
LABEL_7:

LABEL_12:
  double v28 = v20;
  double v29 = v21;
  double v30 = v22;
  double v31 = v23;
  result.right = v31;
  result.bottom = v30;
  result.left = v29;
  result.top = v28;
  return result;
}

- (void)_enrichLayoutAttributes:(id)a3 interactionState:(id)a4
{
  v59 = -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](a3);
  unint64_t v7 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle];
  if (v59)
  {
    v59[2] = v7;
    BOOL v8 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration stylesFirstItemAsHeader];
    *((unsigned char *)v59 + 8) = v59[1] & 0xFE | v8;
  }
  else
  {
    BOOL v8 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration stylesFirstItemAsHeader];
  }
  uint64_t v9 = -[UICollectionViewLayoutAttributes _preferredSizingData]((id *)a3);
  double v10 = (void *)v9;
  if (v9)
  {
    if (!a3) {
      goto LABEL_42;
    }
    *((void *)a3 + 38) = *(void *)(v9 + 16);
  }
  else if (!a3)
  {
    goto LABEL_42;
  }
  __int16 v11 = *((_WORD *)a3 + 144);
  if (v11)
  {
    if (v7 != 2 && *((void *)a3 + 38) != 0)
    {
      unint64_t v20 = -[_UICollectionViewListLayoutSection _maskedCornersForBackgroundOfItemWithSelectionGrouping:](self, "_maskedCornersForBackgroundOfItemWithSelectionGrouping:");
      if (v59)
      {
        v59[3] = v20;
        *((unsigned char *)v59 + 8) |= 2u;
      }
    }
    [a3 setZIndex:10];
    switch(v7)
    {
      case 0uLL:
        [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesForPlainCell:a3];
        break;
      case 1uLL:
      case 3uLL:
        [(_UICollectionViewListLayoutSection *)self _defaultLayoutMarginsInsideSection];
        *((_WORD *)a3 + 144) |= 0x200u;
        *((void *)a3 + 40) = v21;
        *((void *)a3 + 41) = v22;
        *((void *)a3 + 42) = v23;
        *((void *)a3 + 43) = v24;
        [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesWithDefaultMasking:a3];
        break;
      case 2uLL:
        [(_UICollectionViewListLayoutSection *)self _defaultLayoutMarginsInsideSection];
        *((_WORD *)a3 + 144) |= 0x200u;
        *((void *)a3 + 40) = v44;
        *((void *)a3 + 41) = v45;
        *((void *)a3 + 42) = v46;
        *((void *)a3 + 43) = v47;
        [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesWithInsetGroupedMasking:a3 stylesFirstItemAsHeader:v8];
        break;
      case 4uLL:
        [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesForSidebarPlainCell:a3];
        break;
      default:
        break;
    }
  }
  else if ((v11 & 3) != 0)
  {
    if ((v11 & 2) == 0) {
      goto LABEL_42;
    }
    double v12 = -[UIBarButtonItemGroup _items]((id *)a3);
    int v13 = [v12 isEqualToString:@"UICollectionViewListLayoutElementKindBottomSeparator"];

    if (v13)
    {
      if (v10) {
        double v14 = (void *)v10[1];
      }
      else {
        double v14 = 0;
      }
      id v15 = v14;
      double v16 = self;
      id v17 = a3;
      uint64_t v18 = 1;
LABEL_41:
      [(_UICollectionViewListLayoutSection *)v16 _configureLayoutAttributes:v17 forSeparatorAtBottom:v18 preferredConfiguration:v15 interactionState:a4];

      goto LABEL_42;
    }
    v48 = -[UIBarButtonItemGroup _items]((id *)a3);
    int v49 = [v48 isEqualToString:@"UICollectionViewListLayoutElementKindTopSeparator"];

    if (v49)
    {
      if (v10) {
        v50 = (void *)v10[1];
      }
      else {
        v50 = 0;
      }
      id v15 = v50;
      double v16 = self;
      id v17 = a3;
      uint64_t v18 = 0;
      goto LABEL_41;
    }
    v51 = -[UIBarButtonItemGroup _items]((id *)a3);
    int v52 = [v51 isEqualToString:0x1ED14A0C0];

    if (v52)
    {
      [a3 setHidden:1];
      if (v7 <= 4)
      {
        if (v7 == 2) {
          [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesWithInsetGroupedMasking:a3 stylesFirstItemAsHeader:v8];
        }
        else {
          [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesForSwipeActionMasking:a3 interactionState:a4];
        }
      }
      [(_UICollectionViewListLayoutSection *)self _defaultLayoutMarginsInsideSection];
      *((_WORD *)a3 + 144) |= 0x200u;
      *((void *)a3 + 40) = v53;
      *((void *)a3 + 41) = v54;
      *((void *)a3 + 42) = v55;
      *((void *)a3 + 43) = v56;
    }
    else
    {
      v57 = -[UIBarButtonItemGroup _items]((id *)a3);
      int v58 = [v57 isEqualToString:@"_UICollectionViewListLayoutSectionBackgroundColorDecorationElementKind"];

      if (v58) {
        [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesForBackgroundDecoration:a3];
      }
    }
  }
  else
  {
    if (dyld_program_sdk_at_least())
    {
      [(_UICollectionViewListLayoutSection *)self _defaultLayoutMarginsForSupplementaryViewWithLayoutAttributes:a3];
      uint64_t v26 = v25;
      double v28 = v27;
      uint64_t v30 = v29;
      double v32 = v31;
    }
    else
    {
      [(_UICollectionViewListLayoutSection *)self _defaultLayoutMarginsInsideSection];
      uint64_t v26 = v33;
      double v28 = v34;
      uint64_t v30 = v35;
      double v32 = v36;
      if (![(NSCollectionLayoutSection *)self supplementariesFollowContentInsets])
      {
        [(_UICollectionViewListLayoutSection *)self _effectiveSectionHorizontalInsets];
        double v38 = v37;
        double v40 = v39;
        BOOL v41 = [(_UICollectionViewListLayoutSection *)self _isRTL];
        if (v41) {
          double v42 = v40;
        }
        else {
          double v42 = v38;
        }
        if (v41) {
          double v43 = v38;
        }
        else {
          double v43 = v40;
        }
        double v28 = v28 + v42;
        double v32 = v32 + v43;
      }
    }
    *((_WORD *)a3 + 144) |= 0x200u;
    *((void *)a3 + 40) = v26;
    *((double *)a3 + 41) = v28;
    *((void *)a3 + 42) = v30;
    *((double *)a3 + 43) = v32;
    if (!v7) {
      [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesForPlainSupplementaryView:a3];
    }
  }
LABEL_42:
}

- (UIEdgeInsets)_effectiveCollectionViewLayoutMarginsForAppearanceStyle:(int64_t)a3 forUseAsContentInsets:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v8 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment container];
  if (v8)
  {
    BOOL v9 = [(_UICollectionViewListLayoutSection *)self _isRTL];
    double v10 = (void *)v8[1];
  }
  else
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 921, @"UIKit internal bug: missing layout container for environment: %@ section: %@", self->_layoutEnvironment, self object file lineNumber description];

    BOOL v9 = [(_UICollectionViewListLayoutSection *)self _isRTL];
    double v10 = 0;
  }
  id v11 = v10;
  [v11 safeAreaInsets];
  double v13 = v12;

  if (v8) {
    double v14 = (void *)v8[1];
  }
  else {
    double v14 = 0;
  }
  id v15 = v14;
  [v15 layoutMarginsInsets];
  double v19 = v18;
  double v21 = v20;
  if (v9) {
    double v22 = v17;
  }
  else {
    double v22 = v16;
  }
  if (v9) {
    double v23 = v16;
  }
  else {
    double v23 = v17;
  }

  if (!v4)
  {
    UIEdgeInsetsSubtract(15, v19, v22, v21, v23, v13);
    double v22 = v24;
    double v23 = v25;
  }
  if ((unint64_t)(a3 - 1) > 2) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = qword_186B9DC90[a3 - 1];
  }
  if (v4)
  {
    double v27 = [(_UICollectionViewListLayoutSection *)self _constants];
    char v28 = [v27 shouldUseDefaultTableLayoutMarginsAsContentInsets];

    if ((v28 & 1) == 0)
    {
      double v38 = [(_UICollectionViewListLayoutSection *)self _constants];
      [v38 defaultSectionContentInsetsForTableStyle:v26];
      double v31 = v39;
      double v33 = v40;
      double v35 = v41;
      double v37 = v42;

      goto LABEL_21;
    }
  }
  uint64_t v29 = [(_UICollectionViewListLayoutSection *)self _constants];
  [v8 contentSize];
  objc_msgSend(v29, "defaultTableLayoutMarginsForScreen:size:tableStyle:", 0, v26);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  if (v4)
  {
LABEL_21:
    UIEdgeInsetsAdd(15, v31, v33, v35, v37, v13);
    double v33 = v43;
    double v37 = v44;
  }
  if (v22 >= v33) {
    double v45 = v22;
  }
  else {
    double v45 = v33;
  }
  if (v23 >= v37) {
    double v46 = v23;
  }
  else {
    double v46 = v37;
  }

  double v47 = 0.0;
  double v48 = 0.0;
  double v49 = v45;
  double v50 = v46;
  result.right = v50;
  result.bottom = v48;
  result.left = v49;
  result.top = v47;
  return result;
}

- (void)_configureLayoutAttributesWithDefaultMasking:(id)a3
{
  if (a3)
  {
    *((_WORD *)a3 + 144) &= ~0x10u;
    -[UICollectionViewLayoutAttributes _setMaskedCorners:]((uint64_t)a3, 0xFuLL);
    *((void *)a3 + 39) = 0;
  }
  else
  {
    -[UICollectionViewLayoutAttributes _setMaskedCorners:](0, 0xFuLL);
  }
}

- (void)_configureLayoutAttributesForSwipeActionMasking:(id)a3 interactionState:(id)a4
{
  unint64_t v7 = [a3 indexPath];
  uint64_t v8 = -[_UICollectionViewLayoutInteractionStateModule swipeActionsStyleForSwipedItemAtIndexPath:]((uint64_t)a4, v7);

  if (v8 == 2)
  {
    if (a3) {
      *((_WORD *)a3 + 144) |= 0x10u;
    }
    -[UICollectionViewLayoutAttributes _setMaskedCorners:]((uint64_t)a3, 0xFuLL);
    [(_UICollectionViewListLayoutSection *)self _effectiveCornerRadius];
    if (a3) {
      *((void *)a3 + 39) = v9;
    }
  }
  else
  {
    [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesWithDefaultMasking:a3];
  }
}

- (NSDirectionalEdgeInsets)_sectionPreferredTopSeparatorInsetsWithBottomInsets:(NSDirectionalEdgeInsets)a3 hasCustomInsets:(BOOL *)a4
{
  double trailing = a3.trailing;
  double leading = a3.leading;
  if (!a4)
  {
    double v24 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.top, a3.leading, a3.bottom);
    [v24 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 1494, @"Invalid parameter not satisfying: %@", @"hasCustomInsets != nil" object file lineNumber description];
  }
  uint64_t v8 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _separatorConfigurationNoCopy];
  [v8 topSeparatorInsets];
  double v10 = v9;
  double v12 = v11;

  double v13 = fabs(v10 + -1.79769313e308);
  BOOL v14 = fabs(v10 + 1.0) > 2.22044605e-16 && v13 > 2.22044605e-16;
  if (v14) {
    double v15 = v10;
  }
  else {
    double v15 = leading;
  }
  char v16 = !v14;
  double v17 = fabs(v12 + -1.79769313e308);
  BOOL v18 = fabs(v12 + 1.0) > 2.22044605e-16 && v17 > 2.22044605e-16;
  if (v18) {
    double v19 = v12;
  }
  else {
    double v19 = trailing;
  }
  char v20 = !v18;
  *a4 = v16 & v20 ^ 1;
  double v21 = 0.0;
  double v22 = 0.0;
  result.double trailing = v19;
  result.bottom = v22;
  result.double leading = v15;
  result.top = v21;
  return result;
}

- (NSDirectionalEdgeInsets)_sectionPreferredBottomSeparatorInsetsForIndexPath:(id)a3
{
  uint64_t v5 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _separatorConfigurationNoCopy];
  [v5 bottomSeparatorInsets];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration separatorInsetProvider];
  double v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, a3);
    double v7 = v12;
    double v9 = v13;
  }
  BOOL v14 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment traitCollection];
  double v15 = 0.0;
  if ([v14 userInterfaceIdiom] != 6)
  {
    [(_UICollectionViewListLayoutSection *)self _defaultDirectionalLayoutMarginsInsideSection];
    double v15 = v16;
  }

  double v17 = fabs(v7 + -1.79769313e308);
  if (fabs(v7 + 1.0) <= 2.22044605e-16 || v17 <= 2.22044605e-16) {
    double v7 = v15;
  }
  double v19 = fabs(v9 + -1.79769313e308);
  if (fabs(v9 + 1.0) <= 2.22044605e-16 || v19 <= 2.22044605e-16) {
    double v9 = 0.0;
  }

  double v21 = 0.0;
  double v22 = 0.0;
  double v23 = v7;
  double v24 = v9;
  result.double trailing = v24;
  result.bottom = v22;
  result.double leading = v23;
  result.top = v21;
  return result;
}

- (NSDirectionalEdgeInsets)_defaultDirectionalLayoutMarginsInsideSection
{
  [(_UICollectionViewListLayoutSection *)self _defaultLayoutMarginsInsideSection];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(_UICollectionViewListLayoutSection *)self _isRTL];
  if (v11) {
    double v12 = v10;
  }
  else {
    double v12 = v6;
  }
  if (v11) {
    double v13 = v6;
  }
  else {
    double v13 = v10;
  }
  double v14 = v4;
  double v15 = v8;
  result.double trailing = v13;
  result.bottom = v15;
  result.double leading = v12;
  result.top = v14;
  return result;
}

- (BOOL)_shouldHideBottomSeparatorAtIndexPath:(id)a3 forGrouping:(unint64_t)a4 considerNextCellGrouping:(BOOL)a5 interactionState:(id)a6
{
  BOOL v7 = a5;
  double v12 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _separatorConfigurationNoCopy];
  uint64_t v13 = [v12 _hidingBehavior];
  if (!v13)
  {
    uint64_t v19 = [v12 bottomSeparatorVisibility];
    if (v19 == 1) {
      goto LABEL_23;
    }
    if (v19 == 2)
    {
LABEL_50:
      BOOL v16 = 1;
      goto LABEL_51;
    }
    int64_t v20 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle];
    if ([a3 item]) {
      BOOL v21 = 0;
    }
    else {
      BOOL v21 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration stylesFirstItemAsHeader];
    }
    BOOL v22 = [(_UICollectionViewListLayoutSection *)self __isLastItemInSection:a3];
    if (v20 == 3)
    {
      if (v21 && v22) {
        uint64_t v13 = 3;
      }
      else {
        uint64_t v13 = 2;
      }
    }
    else
    {
      if (v21) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 3;
      }
      if (!v21 && v22)
      {
        if (-[_UICollectionViewListLayoutSection _shouldDrawSeparatorAtBottom:ofSection:interactionState:](self, "_shouldDrawSeparatorAtBottom:ofSection:interactionState:", 1, [a3 section], a6))
        {
          uint64_t v13 = 3;
        }
        else
        {
          uint64_t v13 = 2;
        }
      }
      char v23 = v20 != 2 || v21;
      if ((v23 & 1) == 0)
      {
        [(NSCollectionLayoutSection *)self interGroupSpacing];
        if (v24 > 0.0) {
          uint64_t v13 = 2;
        }
      }
    }
    double v25 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment traitCollection];
    if ([v25 userInterfaceIdiom] == 6 && v20 == 0)
    {
      [(NSCollectionLayoutSection *)self interGroupSpacing];
      double v28 = v27;

      if (v28 > 0.0) {
        goto LABEL_50;
      }
    }
    else
    {
    }
  }
  if (v13 == 2) {
    goto LABEL_50;
  }
  if (v13 == 1) {
    goto LABEL_23;
  }
  if ((unint64_t)(v13 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"_UICollectionViewListLayoutSection.m" lineNumber:1955 description:@"Hiding behavior resolved to unsupported type"];
  }
  [(NSCollectionLayoutSection *)self interGroupSpacing];
  BOOL v16 = v14 > 0.0 || v13 == 4;
  if (!v7
    || v14 > 0.0
    || (objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(a3, "item") + 1, objc_msgSend(a3, "section")), double v17 = objc_claimAutoreleasedReturnValue(), v18 = -[_UICollectionViewLayoutInteractionStateModule selectionGroupingForItemAtIndexPath:]((uint64_t)a6, v17)- 1, v17, v18 > 1))
  {
    if (a4 - 2 < 2) {
      goto LABEL_51;
    }
    if (a4 != 4)
    {
      if (a4 == 1)
      {
        BOOL v16 = v13 == 3;
        goto LABEL_51;
      }
LABEL_23:
      BOOL v16 = 0;
      goto LABEL_51;
    }
  }
  if (v13 == 3) {
    BOOL v16 = 1;
  }
LABEL_51:

  return v16;
}

- (id)_separatorConfigurationForItemAtIndexPath:(id)a3 withSelectionGrouping:(unint64_t)a4 considerNextCellGrouping:(BOOL)a5 interactionState:(id)a6
{
  BOOL v7 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  BOOL v11 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _separatorConfiguration];
  int v12 = -[_UICollectionViewLayoutInteractionStateModule itemAtIndexPathIsBeingReordered:]((uint64_t)a6, a3);
  [(_UICollectionViewListLayoutSection *)self _sectionPreferredBottomSeparatorInsetsForIndexPath:a3];
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  if (v12)
  {
    v52[0] = 0;
    -[_UICollectionViewListLayoutSection _sectionPreferredTopSeparatorInsetsWithBottomInsets:hasCustomInsets:](self, "_sectionPreferredTopSeparatorInsetsWithBottomInsets:hasCustomInsets:", v52, v13, v14, v15, v16);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    objc_msgSend(v11, "setBottomSeparatorInsets:", v17, v18, v19, v20);
    objc_msgSend(v11, "setTopSeparatorInsets:", v22, v24, v26, v28);
    [v11 setBottomSeparatorVisibility:2];
    [v11 setTopSeparatorVisibility:2];
    goto LABEL_52;
  }
  if (v14 == -1000.0 && v16 == -1000.0) {
    [v11 setBottomSeparatorVisibility:2];
  }
  if (![v11 bottomSeparatorVisibility])
  {
    if ([(_UICollectionViewListLayoutSection *)self _shouldHideBottomSeparatorAtIndexPath:a3 forGrouping:a4 considerNextCellGrouping:v7 interactionState:a6])
    {
      uint64_t v29 = 2;
    }
    else
    {
      uint64_t v29 = 1;
    }
    [v11 setBottomSeparatorVisibility:v29];
  }
  if (![v11 topSeparatorVisibility])
  {
    uint64_t v30 = [v11 bottomSeparatorVisibility];
    if (a4 && v30 == 2
      || [(_UICollectionViewListLayoutSection *)self _shouldHideTopSeparatorAtIndexPath:a3 interactionState:a6])
    {
      uint64_t v31 = 2;
    }
    else
    {
      uint64_t v31 = 1;
    }
    [v11 setTopSeparatorVisibility:v31];
  }
  BOOL v32 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration stylesFirstItemAsHeader];
  BOOL v33 = v32 && [a3 item] == 0;
  [(NSCollectionLayoutSection *)self interGroupSpacing];
  BOOL v35 = v34 > 0.0
     && [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle] == 1;
  if ([(_UICollectionViewListLayoutSection *)self __isLastItemInSection:a3])
  {
    int64_t v36 = -[_UICollectionViewListLayoutSection _separatorInsetBehaviorAtBottom:ofSection:interactionState:](self, "_separatorInsetBehaviorAtBottom:ofSection:interactionState:", 1, [a3 section], a6);
  }
  else
  {
    if (v35) {
      int64_t v36 = 2;
    }
    else {
      int64_t v36 = 0;
    }
    if (v33) {
      goto LABEL_33;
    }
  }
  if (!v36)
  {
LABEL_33:
    objc_msgSend(v11, "setBottomSeparatorInsets:", v17, v18, v19, v20);
    goto LABEL_34;
  }
  if (v36 == 2)
  {
    [v11 _insetsForBoundarySeparators];
    -[_UICollectionViewListLayoutSection _effectiveBoundarySeparatorInsets:](self, "_effectiveBoundarySeparatorInsets:");
    objc_msgSend(v11, "setBottomSeparatorInsets:");
    [v11 _setIgnoreBottomSeparatorInsetsFromCell:1];
  }
  else if (os_variant_has_internal_diagnostics())
  {
    double v50 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)int v52 = 134217984;
      *(void *)&v52[4] = v36;
      _os_log_fault_impl(&dword_1853B0000, v50, OS_LOG_TYPE_FAULT, "The separator at the bottom of list sections does not support behavior %ld", v52, 0xCu);
    }
  }
  else
  {
    double v48 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_85) + 8);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v52 = 134217984;
      *(void *)&v52[4] = v36;
      _os_log_impl(&dword_1853B0000, v48, OS_LOG_TYPE_ERROR, "The separator at the bottom of list sections does not support behavior %ld", v52, 0xCu);
    }
  }
LABEL_34:
  uint64_t v37 = [a3 item];
  if (v32)
  {
    if (v37 == 1) {
      goto LABEL_36;
    }
LABEL_43:
    if (v35) {
      goto LABEL_44;
    }
LABEL_45:
    v52[0] = 0;
    objc_msgSend(v11, "bottomSeparatorInsets", *(void *)v52);
    -[_UICollectionViewListLayoutSection _sectionPreferredTopSeparatorInsetsWithBottomInsets:hasCustomInsets:](self, "_sectionPreferredTopSeparatorInsetsWithBottomInsets:hasCustomInsets:", v52);
    objc_msgSend(v11, "setTopSeparatorInsets:");
    uint64_t v46 = v52[0];
    double v47 = v11;
LABEL_51:
    [v47 _setIgnoreTopSeparatorInsetsFromCell:v46];
    goto LABEL_52;
  }
  if (v37) {
    goto LABEL_43;
  }
LABEL_36:
  int64_t v38 = -[_UICollectionViewListLayoutSection _separatorInsetBehaviorAtBottom:ofSection:interactionState:](self, "_separatorInsetBehaviorAtBottom:ofSection:interactionState:", 0, [a3 section], a6);
  if (!v38) {
    goto LABEL_45;
  }
  int64_t v39 = v38;
  if (v38 == 1)
  {
    double v42 = 1.79769313e308;
    double v41 = 0.0;
    double v43 = 0.0;
    double v45 = self;
    double v44 = 1.79769313e308;
    goto LABEL_50;
  }
  if (v38 == 2)
  {
LABEL_44:
    [v11 _insetsForBoundarySeparators];
    double v45 = self;
LABEL_50:
    -[_UICollectionViewListLayoutSection _effectiveBoundarySeparatorInsets:](v45, "_effectiveBoundarySeparatorInsets:", v41, v42, v43, v44);
    objc_msgSend(v11, "setTopSeparatorInsets:");
    double v47 = v11;
    uint64_t v46 = 1;
    goto LABEL_51;
  }
  if (os_variant_has_internal_diagnostics())
  {
    v51 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)int v52 = 134217984;
      *(void *)&v52[4] = v39;
      _os_log_fault_impl(&dword_1853B0000, v51, OS_LOG_TYPE_FAULT, "The separator at the top of list sections does not support behavior %ld", v52, 0xCu);
    }
  }
  else
  {
    double v40 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB259678) + 8);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v52 = 134217984;
      *(void *)&v52[4] = v39;
      _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_ERROR, "The separator at the top of list sections does not support behavior %ld", v52, 0xCu);
    }
  }
LABEL_52:
  return v11;
}

- (BOOL)__isLastItemInSection:(id)a3
{
  id v3 = a3;
  uint64_t v5 = [a3 item];
  double v6 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment _dataSourceSnapshot];
  LOBYTE(v3) = v5 == objc_msgSend(v6, "numberOfItemsInSection:", objc_msgSend(v3, "section")) - 1;

  return (char)v3;
}

- (void)_configureLayoutAttributes:(id)a3 forSeparatorAtBottom:(BOOL)a4 preferredConfiguration:(id)a5 interactionState:(id)a6
{
  BOOL v8 = a4;
  id v51 = [a3 indexPath];
  if (a3) {
    uint64_t v12 = *((void *)a3 + 38);
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = a5;
  if (!v13)
  {
    id v13 = [(_UICollectionViewListLayoutSection *)self _separatorConfigurationForItemAtIndexPath:v51 withSelectionGrouping:0 considerNextCellGrouping:0 interactionState:a6];
  }
  if (![v13 topSeparatorVisibility])
  {
    double v47 = [MEMORY[0x1E4F28B00] currentHandler];
    double v48 = [a3 indexPath];
    [v47 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 2009, @"topSeparatorVisibility for %@ is unresolved in the list section data, which is unsupported. This is a UIKit bug.", v48 object file lineNumber description];
  }
  if (![v13 bottomSeparatorVisibility])
  {
    double v49 = [MEMORY[0x1E4F28B00] currentHandler];
    double v50 = [a3 indexPath];
    [v49 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 2010, @"bottomSeparatorVisibility for %@ is unresolved in the list section data, which is unsupported. This is a UIKit bug.", v50 object file lineNumber description];
  }
  int v14 = -[_UICollectionViewLayoutInteractionStateModule itemAtIndexPathIsSelected:]((uint64_t)a6, v51);
  double v15 = -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](a3);
  double v16 = [v13 color];
  -[_UICollectionLayoutItemSolver setSolveResult:]((uint64_t)v15, v16);

  double v17 = [v13 visualEffect];
  -[_UICollectionLayoutListAttributes setSeparatorVisualEffect:]((uint64_t)v15, v17);

  if (v8)
  {
    objc_msgSend(a3, "setHidden:", objc_msgSend(v13, "bottomSeparatorVisibility") == 2);
    [v13 bottomSeparatorInsets];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [a3 frame];
    objc_msgSend(a3, "setFrame:", v21 + v26, v19 + v27, v28 - (v21 + v25), v29 - (v19 + v23));
    if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      char v30 = v14;
    }
    else {
      char v30 = 0;
    }
    if ((v30 & 1) == 0) {
      goto LABEL_20;
    }
LABEL_19:
    double v44 = [v13 multipleSelectionColor];
    -[_UICollectionLayoutItemSolver setSolveResult:]((uint64_t)v15, v44);

    goto LABEL_20;
  }
  objc_msgSend(a3, "setHidden:", objc_msgSend(v13, "topSeparatorVisibility") == 2);
  [v13 topSeparatorInsets];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  [a3 frame];
  objc_msgSend(a3, "setFrame:", v34 + v39, v32 + v40, v41 - (v34 + v38), v42 - (v32 + v36));
  if ((unint64_t)(v12 - 3) < 2) {
    int v43 = v14;
  }
  else {
    int v43 = 0;
  }
  if (v43 == 1) {
    goto LABEL_19;
  }
LABEL_20:
  int v45 = [a3 isHidden];
  double v46 = 1.0;
  if (v45) {
    double v46 = 0.0;
  }
  [a3 setAlpha:v46];
}

- (BOOL)_shouldHideTopSeparatorAtIndexPath:(id)a3 interactionState:(id)a4
{
  BOOL v7 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _separatorConfigurationNoCopy];
  uint64_t v8 = [v7 topSeparatorVisibility];

  if (v8 == 1) {
    return 0;
  }
  if (v8 == 2) {
    return 1;
  }
  int64_t v9 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle];
  double v10 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 6) {
    return 1;
  }
  BOOL v13 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration stylesFirstItemAsHeader];
  uint64_t v14 = [a3 item];
  uint64_t v15 = v14;
  if (v13)
  {
    if (![a3 item] || v15 == 1)
    {
      if (v15 != 1) {
        return 1;
      }
      return !-[_UICollectionViewListLayoutSection _shouldDrawSeparatorAtBottom:ofSection:interactionState:](self, "_shouldDrawSeparatorAtBottom:ofSection:interactionState:", 0, [a3 section], a4);
    }
  }
  else if (!v14)
  {
    return !-[_UICollectionViewListLayoutSection _shouldDrawSeparatorAtBottom:ofSection:interactionState:](self, "_shouldDrawSeparatorAtBottom:ofSection:interactionState:", 0, [a3 section], a4);
  }
  [(NSCollectionLayoutSection *)self interGroupSpacing];
  return v16 <= 0.0 || v9 != 1;
}

- (void)_transformPreferredLayoutAttributes:(id)a3 interactionState:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 && (*((_WORD *)a3 + 144) & 1) != 0)
  {
    uint64_t v8 = -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)a3);
    int64_t v9 = (void *)v8;
    if (v8)
    {
      double v10 = *(id *)(v8 + 32);
      if (v10) {
        goto LABEL_5;
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      double v21 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = a3;
        _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "No list section data present in the preferred attributes from the cell. Attrs: %@", buf, 0xCu);
      }
    }
    else
    {
      double v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_transformPreferredLayoutAttributes_interactionState____s_category)+ 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = a3;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "No list section data present in the preferred attributes from the cell. Attrs: %@", buf, 0xCu);
      }
    }
    double v10 = [(_UICollectionViewListLayoutSection *)self _generateListSectionDataForLayoutAttributes:a3 interactionState:a4];
    if (v10) {
LABEL_5:
    }
      uint64_t v11 = (void *)v10[1];
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;
    if (![v12 topSeparatorVisibility])
    {
      double v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 1561, @"Separator configuration from preferred attributes of cell has unresolved top separator visibility. %@", a3 object file lineNumber description];
    }
    if (![v12 bottomSeparatorVisibility])
    {
      double v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 1562, @"Separator configuration from preferred attributes of cell has unresolved bottom separator visibility. %@", a3 object file lineNumber description];
    }
    BOOL v13 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _itemSeparatorHandler];
    if (v13)
    {
      uint64_t v14 = [a3 indexPath];
      uint64_t v15 = (void *)[v12 copy];
      double v16 = ((void (**)(void, void *, void *))v13)[2](v13, v14, v15);
      double v17 = (void *)[v16 copy];

      [v17 _replaceAutomaticValuesWithValuesFromConfiguration:v12];
      -[UIViewAnimationContext setViewAnimations:]((uint64_t)v10, v17);
    }
    -[UICollectionViewLayoutAttributes _setPreferredSizingData:]((uint64_t)a3, v10);
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v9, 0);
  }
}

- (void)_transformFittingLayoutAttributes:(id)a3 interactionState:(id)a4
{
  if (a3 && (*((_WORD *)a3 + 144) & 1) != 0)
  {
    double v6 = [(_UICollectionViewListLayoutSection *)self _generateListSectionDataForLayoutAttributes:a3 interactionState:a4];
    BOOL v7 = -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](a3);
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v7, v6);
  }
  -[_UICollectionViewListLayoutSection _updateMaxWidthForLayoutAttributes:](self, "_updateMaxWidthForLayoutAttributes:", a3, a4);
}

- (int64_t)_separatorInsetBehaviorAtBottom:(BOOL)a3 ofSection:(int64_t)a4 interactionState:(id)a5
{
  int64_t v9 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle];
  int64_t v10 = v9;
  if (a3)
  {
    if ((v9 | 4) != 4
      || [(_UICollectionViewListLayoutSection *)self _hasHeaderFooterBelowLastItemInSection:a4 interactionState:a5]&& (unint64_t)([(_UICollectionViewListLayoutSection *)self _headerFooterPinningBehavior]- 1) >= 2)
    {
      return 2;
    }
    return 0;
  }
  if ([(_UICollectionViewListLayoutSection *)self _adjustsLayoutToDrawTopSeparatorInSection:a4 interactionState:a5])
  {
    return 0;
  }
  if ((unint64_t)(v10 - 1) >= 3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)_shouldDrawSeparatorAtBottom:(BOOL)a3 ofSection:(int64_t)a4 interactionState:(id)a5
{
  int64_t v9 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle];
  if ((unint64_t)(v9 - 2) < 2) {
    goto LABEL_19;
  }
  if (v9 != 4 && v9 != 0) {
    goto LABEL_14;
  }
  if (!a3)
  {
    if ([(_UICollectionViewListLayoutSection *)self _adjustsLayoutToDrawTopSeparatorInSection:a4 interactionState:a5]|| [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _hasHeaderOrFirstItemStyledAsHeader]&& [(_UICollectionViewListLayoutSection *)self _headerFooterPinningBehavior] == 1&& (([(NSCollectionLayoutSection *)self contentInsets], v13 == 0.0)|| [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration stylesFirstItemAsHeader]))
    {
LABEL_14:
      LOBYTE(v12) = 1;
      return v12;
    }
LABEL_19:
    LOBYTE(v12) = 0;
    return v12;
  }
  BOOL v11 = [(_UICollectionViewListLayoutSection *)self _hasHeaderFooterBelowLastItemInSection:a4 interactionState:a5];
  if (!v11
    || (int64_t v12 = [(_UICollectionViewListLayoutSection *)self _headerFooterPinningBehavior],
        v12 != 1))
  {
    LOBYTE(v12) = [(_UICollectionViewListLayoutSection *)self _headerFooterPinningBehavior] != 2&& !v11;
  }
  return v12;
}

- (NSDirectionalEdgeInsets)_effectiveBoundarySeparatorInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double leading = a3.leading;
  [(_UICollectionViewListLayoutSection *)self _defaultDirectionalLayoutMarginsInsideSection];
  double v6 = fabs(leading + -1.79769313e308);
  if (fabs(leading + 1.0) > 2.22044605e-16 && v6 > 2.22044605e-16) {
    double v5 = leading;
  }
  double v8 = fabs(trailing + -1.79769313e308);
  BOOL v9 = fabs(trailing + 1.0) > 2.22044605e-16 && v8 > 2.22044605e-16;
  double v10 = 0.0;
  if (v9) {
    double v11 = trailing;
  }
  else {
    double v11 = 0.0;
  }
  double v12 = 0.0;
  result.double trailing = v11;
  result.bottom = v12;
  result.double leading = v5;
  result.top = v10;
  return result;
}

- (BOOL)_adjustsLayoutToDrawTopSeparatorInSection:(int64_t)a3 interactionState:(id)a4
{
  if ([(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle]
    || [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _hasHeaderOrFirstItemStyledAsHeader])
  {
    return 0;
  }
  return -[_UICollectionViewLayoutInteractionStateModule _shouldAdjustLayoutToDrawTopSeparatorInSection:]((uint64_t)a4, a3);
}

- (BOOL)_hasHeaderFooterBelowLastItemInSection:(int64_t)a3 interactionState:(id)a4
{
  [(NSCollectionLayoutSection *)self contentInsets];
  if (v8 > 0.0) {
    return 0;
  }
  if ([(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _hasFooter]) {
    return 1;
  }
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94___UICollectionViewListLayoutSection__hasHeaderFooterBelowLastItemInSection_interactionState___block_invoke;
  v11[3] = &unk_1E530DA40;
  v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  -[_UICollectionViewLayoutInteractionStateModule enumerateSectionsAfterSectionIndex:enumerator:]((uint64_t)a4, a3, v11);
  BOOL v9 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (_UICollectionViewListLayoutSection)initWithConfiguration:(id)a3 layoutEnvironment:(id)a4
{
  int v8 = a4 != 0;
  BOOL v9 = [a3 _collectionView];
  int v10 = v9 == 0;

  if (v8 != v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 764, @"SPI inconsistency detected. Old and new SPI is being mixed. Please initialize your configuration with -init and then initialize the section with -initWithConfiguration:layoutEnvironement:, passing in the layout environment you receive from the section provider of your compositional layout." object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    double v13 = [_UICollectionViewEnvironmentAdapter alloc];
    uint64_t v14 = [a3 _collectionView];
    char v15 = [(_UICollectionViewEnvironmentAdapter *)v13 initWithCollectionView:v14];
    id v11 = [(_UICollectionViewEnvironmentAdapter *)v15 createEnvironment];

    goto LABEL_6;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  id v11 = a4;
LABEL_6:
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    double v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"_UICollectionViewListLayoutSection.m" lineNumber:768 description:@"Incompatible layout environment. Make sure to pass the layout environment received from the compositional layout's section provider as is."];
  }
  id v16 = v11;
  double v17 = (void *)[a3 copy];
  double v18 = [v17 _generateLayoutGroup:v16];
  unint64_t v19 = [v17 appearanceStyle] - 1;
  if (v19 > 2) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = qword_186B9DC90[v19];
  }
  double v21 = [v17 _constants];
  [v21 defaultPaddingBetweenRowsForTableStyle:v20];
  double v23 = v22;

  if (v23 > 0.0)
  {
    uint64_t v24 = [v17 _itemHeights];

    if (v24)
    {
      double v25 = [off_1E52D2B38 fixedSpacing:v23];
      [v18 setInterItemSpacing:v25];
    }
  }
  v34.receiver = self;
  v34.super_class = (Class)_UICollectionViewListLayoutSection;
  double v26 = [(NSCollectionLayoutSection *)&v34 initWithLayoutGroup:v18];
  if (v26)
  {
    if (v23 > 0.0)
    {
      double v27 = [v17 _itemHeights];

      if (!v27) {
        [(NSCollectionLayoutSection *)v26 setInterGroupSpacing:v23];
      }
    }
    objc_storeStrong((id *)&v26->_layoutEnvironment, v11);
    objc_storeStrong((id *)&v26->_configuration, v17);
    uint64_t v28 = [v17 appearanceStyle];
    [v17 headerTopPadding];
    if (v29 == 0.0)
    {
      v26->_headerFooterPinningBehavior = 0;
    }
    else
    {
      if ((unint64_t)(v28 - 1) > 2) {
        uint64_t v30 = 0;
      }
      else {
        uint64_t v30 = qword_186B9DC90[v28 - 1];
      }
      double v31 = [(_UICollectionViewListLayoutSection *)v26 _constants];
      v26->_headerFooterPinningBehavior = [v31 defaultHeaderFooterPinningBehaviorForTableStyle:v30];
    }
    [v17 _addSupplementaryItemsToLayout:v26];
    -[NSCollectionLayoutSection setContentInsetsReference:](v26, "setContentInsetsReference:", [v17 _defaultContentInsetsReference]);
    [(_UICollectionViewListLayoutSection *)v26 _defaultSectionContentInsetsForAppearanceStyle:v28];
    objc_msgSend(v17, "_sectionContentInsetsForAppearanceStyleWithDefaultInsets:headerFootersAreChromeless:", (unint64_t)(v26->_headerFooterPinningBehavior - 1) < 2);
    -[NSCollectionLayoutSection setContentInsets:](v26, "setContentInsets:");
  }

  return v26;
}

- (NSDirectionalEdgeInsets)_defaultSectionContentInsetsForAppearanceStyle:(int64_t)a3
{
  double v4 = self;
  if ((unint64_t)(a3 - 2) < 3) {
    goto LABEL_2;
  }
  double v12 = 0.0;
  if (a3)
  {
    double v10 = 0.0;
    double v8 = 0.0;
    double v6 = 0.0;
  }
  else
  {
    double v13 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment traitCollection];
    uint64_t v14 = [v13 userInterfaceIdiom];

    double v10 = 0.0;
    double v8 = 0.0;
    double v6 = 0.0;
    if (v14 == 6)
    {
      self = v4;
LABEL_2:
      -[_UICollectionViewListLayoutSection _effectiveCollectionViewLayoutMarginsForAppearanceStyle:forUseAsContentInsets:](self, "_effectiveCollectionViewLayoutMarginsForAppearanceStyle:forUseAsContentInsets:");
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
    }
  }
  char v15 = [(NSCollectionLayoutEnvironment_Private *)v4->_layoutEnvironment traitCollection];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 == 6)
  {
    uint64_t v17 = [(NSCollectionLayoutEnvironment_Private *)v4->_layoutEnvironment container];
    double v18 = (void *)v17;
    if (v17)
    {
      unint64_t v19 = *(void **)(v17 + 8);
    }
    else
    {
      double v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2, v4, @"_UICollectionViewListLayoutSection.m", 990, @"UIKit internal bug: missing layout container for environment: %@ section: %@", v4->_layoutEnvironment, v4 object file lineNumber description];

      unint64_t v19 = 0;
    }
    id v20 = v19;
    [v20 scrollAccessoryInsets];
    double v22 = v21;

    double v23 = [(NSCollectionLayoutEnvironment_Private *)v4->_layoutEnvironment traitCollection];
    [v23 layoutDirection];

    double v6 = UIEdgeInsetsMax(10, v6, v8, v10, v12, v22);
    double v8 = v24;
    double v10 = v25;
    double v12 = v26;
  }
  BOOL v27 = [(_UICollectionViewListLayoutSection *)v4 _isRTL];
  if (v27) {
    double v28 = v12;
  }
  else {
    double v28 = v8;
  }
  if (v27) {
    double v29 = v8;
  }
  else {
    double v29 = v12;
  }
  double v30 = v6;
  double v31 = v10;
  result.double trailing = v29;
  result.bottom = v31;
  result.double leading = v28;
  result.top = v30;
  return result;
}

- (double)_alignedContentMarginGivenMargin:(double)a3
{
  if ((unint64_t)([(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle]- 3) <= 1&& [(_UICollectionViewListLayoutSection *)self _hasHorizontalInsets])
  {
    double v5 = [(_UICollectionViewListLayoutSection *)self _constants];
    char v6 = objc_opt_respondsToSelector();
    double v7 = 0.0;
    if (v6) {
      [v5 defaultSidebarLayoutMarginsForElementsInsideSection];
    }
    a3 = v7 + a3;
  }
  return a3;
}

- (BOOL)_hasHorizontalInsets
{
  [(_UICollectionViewListLayoutSection *)self _effectiveSectionHorizontalInsets];
  return v3 > 0.0 || v2 > 0.0;
}

- (void)_configureLayoutAttributesWithInsetGroupedMasking:(id)a3 stylesFirstItemAsHeader:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = [a3 indexPath];
  uint64_t v7 = [v17 item];
  [(NSCollectionLayoutSection *)self interGroupSpacing];
  if (v8 <= 0.0)
  {
    if (v4)
    {
      uint64_t v10 = 15;
      if (v7) {
        uint64_t v10 = 0;
      }
      if (v7 == 1) {
        unint64_t v9 = 3;
      }
      else {
        unint64_t v9 = v10;
      }
      if (v7)
      {
        double v11 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment _dataSourceSnapshot];
        BOOL v12 = v7 == objc_msgSend(v11, "numberOfItemsInSection:", objc_msgSend(v17, "section")) - 1;

        if (v12) {
          v9 |= 0xCuLL;
        }
      }
    }
    else
    {
      if (v7) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = 3;
      }
      uint64_t v14 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment _dataSourceSnapshot];
      uint64_t v15 = objc_msgSend(v14, "numberOfItemsInSection:", objc_msgSend(v17, "section")) - 1;

      if (v7 == v15) {
        unint64_t v9 = v13 | 0xC;
      }
      else {
        unint64_t v9 = v13;
      }
    }
  }
  else if (v4 && v7 == 0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = 15;
  }
  if (a3) {
    *((_WORD *)a3 + 144) |= 0x10u;
  }
  -[UICollectionViewLayoutAttributes _setMaskedCorners:]((uint64_t)a3, v9);
  [(_UICollectionViewListLayoutSection *)self _effectiveCornerRadius];
  if (a3) {
    *((void *)a3 + 39) = v16;
  }
}

- (double)_effectiveCornerRadius
{
  [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration cornerRadius];
  if (result == 1.79769313e308)
  {
    BOOL v4 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment traitCollection];
    [v4 userInterfaceIdiom];

    return 10.0;
  }
  return result;
}

- (id)_generateListSectionDataForLayoutAttributes:(id)a3 interactionState:(id)a4
{
  char v6 = [a3 indexPath];
  uint64_t v7 = objc_alloc_init(_UICollectionLayoutListSectionData);
  unint64_t v8 = -[_UICollectionViewLayoutInteractionStateModule selectionGroupingForItemAtIndexPath:]((uint64_t)a4, v6);
  if (v7) {
    v7->_selectionGrouping = v8;
  }
  unint64_t v9 = [(_UICollectionViewListLayoutSection *)self _separatorConfigurationForItemAtIndexPath:v6 withSelectionGrouping:v8 considerNextCellGrouping:1 interactionState:a4];
  -[UIViewAnimationContext setViewAnimations:]((uint64_t)v7, v9);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewListLayoutSection;
  id v4 = [(NSCollectionLayoutSection *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration copy];
    char v6 = (void *)*((void *)v4 + 33);
    *((void *)v4 + 33) = v5;

    objc_storeStrong((id *)v4 + 35, self->_layoutEnvironment);
    *((void *)v4 + 34) = self->_headerFooterPinningBehavior;
  }
  return v4;
}

- (NSDirectionalEdgeInsets)_effectiveSectionSupplementaryHorizontalInsets
{
  if ([(NSCollectionLayoutSection *)self supplementaryContentInsetsReference]) {
    int64_t v3 = [(NSCollectionLayoutSection *)self supplementaryContentInsetsReference];
  }
  else {
    int64_t v3 = [(NSCollectionLayoutSection *)self contentInsetsReference];
  }
  [(_UICollectionViewListLayoutSection *)self _horizontalInsetsForInsetsReference:v3];
  result.double trailing = v7;
  result.bottom = v6;
  result.double leading = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)_defaultLayoutMarginsForSupplementaryViewWithLayoutAttributes:(id)a3
{
  [(_UICollectionViewListLayoutSection *)self _defaultLayoutMarginsInsideSection];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = -[UIBarButtonItemGroup _items]((id *)a3);
  uint64_t v15 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _headerElementKind];
  int v16 = [v14 isEqualToString:v15];

  if (v16)
  {
    id v17 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _layoutEnvironment];
    double v18 = [v17 traitCollection];
    if ([v18 userInterfaceIdiom] == 6)
    {
      int64_t v19 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle];

      if (!v19)
      {
        unint64_t v20 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle]- 1;
        if (v20 > 2) {
          uint64_t v21 = 0;
        }
        else {
          uint64_t v21 = qword_186B9DC90[v20];
        }
        v67 = [a3 indexPath];
        BOOL v68 = [v67 section] == 0;

        v60 = [(_UICollectionViewListLayoutSection *)self _constants];
        [v60 defaultHeaderFooterLayoutMarginsForTableViewStyle:v21 isHeader:1 isFirstSection:v68];
        double v7 = v69;
        double v9 = v70;
        double v11 = v71;
        double v13 = v72;
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
    }
  }
  if (![(NSCollectionLayoutSection *)self supplementariesFollowContentInsets])
  {
    double v74 = v11;
    double v75 = v9;
    double v76 = v13;
    [(_UICollectionViewListLayoutSection *)self _effectiveSectionHorizontalInsets];
    double v23 = v22;
    double v25 = v24;
    BOOL v26 = [(_UICollectionViewListLayoutSection *)self _isRTL];
    if (v26) {
      double v27 = v25;
    }
    else {
      double v27 = v23;
    }
    if (v26) {
      double v28 = v23;
    }
    else {
      double v28 = v25;
    }
    [(_UICollectionViewListLayoutSection *)self _effectiveSectionSupplementaryHorizontalInsets];
    double v30 = v29;
    double v32 = v31;
    BOOL v33 = [(_UICollectionViewListLayoutSection *)self _isRTL];
    if (v33) {
      double v34 = v32;
    }
    else {
      double v34 = v30;
    }
    if (v33) {
      double v35 = v30;
    }
    else {
      double v35 = v32;
    }
    uint64_t v36 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment container];
    double v37 = (void *)v36;
    if (v36)
    {
      double v38 = *(void **)(v36 + 8);
    }
    else
    {
      v73 = [MEMORY[0x1E4F28B00] currentHandler];
      [v73 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 1073, @"UIKit internal bug: missing layout container for environment: %@ section: %@", self->_layoutEnvironment, self object file lineNumber description];

      double v38 = 0;
    }
    id v39 = v38;
    [v39 safeAreaInsets];
    double v41 = v40;
    double v43 = v42;
    BOOL v44 = [(_UICollectionViewListLayoutSection *)self _isRTL];
    if (v44) {
      double v45 = v43;
    }
    else {
      double v45 = v41;
    }
    if (!v44) {
      double v41 = v43;
    }

    double v13 = v76;
    double v46 = v75 + v27;
    double v47 = v76 + v28;
    double v48 = v45 - v27;
    double v9 = v75;
    if (v46 >= v45) {
      double v48 = -0.0;
    }
    double v49 = v46 + v48;
    double v50 = v41 - v28;
    if (v47 >= v41) {
      double v50 = -0.0;
    }
    double v51 = v47 + v50;
    if (v34 < v49)
    {
      double v52 = v49 - v34;
      if (v34 < v45) {
        double v9 = v52 - (v45 - v34);
      }
      else {
        double v9 = v52;
      }
    }
    double v11 = v74;
    if (v35 < v51)
    {
      double v13 = v51 - v35;
      if (v35 < v41) {
        double v13 = v13 - (v41 - v35);
      }
    }
  }
  if (_UIShouldApplyVerticalLayoutMarginsToListHeaderFooterViews())
  {
    unint64_t v53 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle]
        - 1;
    if (v53 > 2) {
      uint64_t v54 = 0;
    }
    else {
      uint64_t v54 = qword_186B9DC90[v53];
    }
    uint64_t v55 = -[UIBarButtonItemGroup _items]((id *)a3);
    uint64_t v56 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _headerElementKind];
    uint64_t v57 = [v55 isEqualToString:v56];

    int v58 = [a3 indexPath];
    BOOL v59 = [v58 section] == 0;

    v60 = [(_UICollectionViewListLayoutSection *)self _constants];
    [v60 defaultHeaderFooterLayoutMarginsForTableViewStyle:v54 isHeader:v57 isFirstSection:v59];
    double v7 = v61;
    double v11 = v62;
    goto LABEL_44;
  }
LABEL_45:
  double v63 = v7;
  double v64 = v9;
  double v65 = v11;
  double v66 = v13;
  result.right = v66;
  result.bottom = v65;
  result.left = v64;
  result.top = v63;
  return result;
}

- (void)_configureLayoutAttributesForBackgroundDecoration:(id)a3
{
  double v5 = [(_UICollectionViewListLayoutSection *)self _effectiveBackgroundColor];
  double v6 = -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](a3);
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v6, v5);

  [(_UICollectionViewListLayoutSection *)self _effectiveSectionHorizontalInsets];
  id v9 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment container];
  [v9 contentSize];
  double v7 = [a3 indexPath];
  uint64_t v8 = [v7 section];

  [(_UICollectionViewListLayoutSection *)self __isLastSection:v8];
  [a3 bounds];
  objc_msgSend(a3, "setBounds:");
  [a3 center];
  objc_msgSend(a3, "setCenter:");
}

- (void)_updateMaxWidthForLayoutAttributes:(id)a3
{
  if (!a3
    || (*((_WORD *)a3 + 144) & 3) != 0
    || [(NSCollectionLayoutSection *)self supplementariesFollowContentInsets])
  {
    [(_UICollectionViewListLayoutSection *)self _effectiveSectionHorizontalInsets];
  }
  else
  {
    [(_UICollectionViewListLayoutSection *)self _effectiveSectionSupplementaryHorizontalInsets];
  }
  double v7 = v5;
  double v8 = v6;
  id v9 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment container];
  [v9 contentSize];
  double v11 = v10;

  -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](a3);
  double v12 = (double *)objc_claimAutoreleasedReturnValue();
  if (v12) {
    v12[8] = fmax(v11 - v7 - v8, 0.0);
  }
}

- (NSDirectionalEdgeInsets)_effectiveSectionHorizontalInsets
{
  [(_UICollectionViewListLayoutSection *)self _horizontalInsetsForInsetsReference:[(NSCollectionLayoutSection *)self contentInsetsReference]];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(NSCollectionLayoutSection *)self contentInsets];
  double v12 = v6 + v11;
  double v14 = v10 + v13;
  double v15 = v4;
  double v16 = v8;
  result.double trailing = v14;
  result.bottom = v16;
  result.double leading = v12;
  result.top = v15;
  return result;
}

- (NSDirectionalEdgeInsets)_horizontalInsetsForInsetsReference:(int64_t)a3
{
  uint64_t v6 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment container];
  double v7 = (void *)v6;
  if (v6)
  {
    if (a3) {
      goto LABEL_5;
    }
    double v8 = *(void **)(v6 + 8);
    goto LABEL_4;
  }
  double v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 1154, @"UIKit internal bug: missing layout container for environment: %@ section: %@", self->_layoutEnvironment, self object file lineNumber description];

  if (!a3)
  {
    double v8 = 0;
LABEL_4:
    id v9 = v8;
    a3 = [v9 insetReference];
  }
LABEL_5:
  if (a3 == 4)
  {
    if (v7) {
      double v16 = (void *)v7[1];
    }
    else {
      double v16 = 0;
    }
    id v13 = v16;
    [v13 readableContentInsets];
    goto LABEL_17;
  }
  if (a3 == 3)
  {
    if (v7) {
      id v17 = (void *)v7[1];
    }
    else {
      id v17 = 0;
    }
    id v13 = v17;
    [v13 layoutMarginsInsets];
    goto LABEL_17;
  }
  double v10 = 0.0;
  double v11 = 0.0;
  if (a3 == 2)
  {
    if (v7) {
      double v12 = (void *)v7[1];
    }
    else {
      double v12 = 0;
    }
    id v13 = v12;
    [v13 safeAreaInsets];
LABEL_17:
    double v18 = v14;
    double v19 = v15;

    double v11 = v18 + 0.0;
    double v10 = v19 + 0.0;
  }

  double v20 = 0.0;
  double v21 = 0.0;
  double v22 = v11;
  double v23 = v10;
  result.double trailing = v23;
  result.bottom = v21;
  result.double leading = v22;
  result.top = v20;
  return result;
}

- (id)_effectiveBackgroundColor
{
  double v3 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _backgroundColor];
  if (v3) {
    goto LABEL_10;
  }
  int64_t v4 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle];
  int64_t v5 = v4;
  if (v4 == 1 || v4 == 2)
  {
LABEL_8:
    double v8 = [(_UICollectionViewListLayoutSection *)self _constants];
    uint64_t v9 = [v8 defaultBackgroundColorForTableViewStyle:v5];
    goto LABEL_9;
  }
  if (v4 != 3)
  {
    int64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = [(_UICollectionViewListLayoutSection *)self _constants];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(_UICollectionViewListLayoutSection *)self _constants];
    uint64_t v9 = [v8 defaultSidebarBackgroundColor];
LABEL_9:
    double v3 = (void *)v9;

    goto LABEL_10;
  }
  double v3 = +[UIColor _sidebarBackgroundColor];
LABEL_10:
  return v3;
}

- (BOOL)__isLastSection:(int64_t)a3
{
  int64_t v4 = [(NSCollectionLayoutEnvironment_Private *)self->_layoutEnvironment _dataSourceSnapshot];
  LOBYTE(a3) = [v4 numberOfSections] - 1 == a3;

  return a3;
}

- (BOOL)prefersListSolver
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutEnvironment, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)_configureLayoutAttributesForPlainSupplementaryView:(id)a3
{
  int64_t v5 = -[UIBarButtonItemGroup _items]((id *)a3);
  uint64_t v6 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _headerElementKind];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if ([(_UICollectionViewListLayoutSection *)self _headerFooterPinningBehavior] == 2)
    {
      double v8 = [a3 indexPath];
      uint64_t v9 = [v8 section];

      if (a3)
      {
        if (!v9) {
          *((_WORD *)a3 + 144) |= 0x800u;
        }
      }
    }
  }
}

- (void)_configureLayoutAttributesForSidebarPlainCell:(id)a3
{
  [(_UICollectionViewListLayoutSection *)self _configureLayoutAttributesForPlainCell:"_configureLayoutAttributesForPlainCell:"];
  if ((unint64_t)([(_UICollectionViewListLayoutSection *)self _headerFooterPinningBehavior]- 1) >= 2)
  {
    if ([(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration stylesFirstItemAsHeader])
    {
      int64_t v5 = [a3 indexPath];
      uint64_t v6 = [v5 item];

      if (!v6)
      {
        [a3 center];
        double v8 = v7;
        double v10 = v9;
        [(NSCollectionLayoutSection *)self contentInsets];
        if (v11 > 8.0) {
          double v11 = 8.0;
        }
        objc_msgSend(a3, "setCenter:", v8, v10 - v11);
      }
    }
  }
}

- (double)_paddingToBoundarySupplementaries
{
  double v3 = 0.0;
  if ([(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _hasSupplementaryAsHeader])
  {
    [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration headerTopPadding];
    double v3 = v4;
    if (v4 == 1.79769313e308)
    {
      int64_t v5 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle];
      if (v5 == 3)
      {
        double v10 = [(_UICollectionViewListLayoutSection *)self _constants];
        [v10 defaultSidebarPaddingAboveSectionHeadersWithFallbackTableStyle:1];
      }
      else
      {
        if (v5 == 2) {
          uint64_t v6 = 2;
        }
        else {
          uint64_t v6 = v5 == 1;
        }
        double v7 = [(_UICollectionViewListLayoutSection *)self _layoutEnvironment];
        uint64_t v8 = [v7 _sectionIndex];

        double v9 = [(_UICollectionViewListLayoutSection *)self _constants];
        double v10 = v9;
        if (v8) {
          [v9 defaultPaddingAboveSectionHeadersForTableStyle:v6];
        }
        else {
          [v9 defaultPaddingAboveFirstSectionHeaderForTableStyle:v6];
        }
      }
      double v3 = v11;
    }
  }
  return v3;
}

- (BOOL)_pinnedSupplementariesShouldOverlap
{
  BOOL v3 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _hasSupplementaryAsHeader];
  if (v3) {
    LOBYTE(v3) = (unint64_t)([(_UICollectionViewListLayoutSection *)self _headerFooterPinningBehavior]- 1) < 2;
  }
  return v3;
}

- (int64_t)_headerFooterPinningBehavior
{
  return self->_headerFooterPinningBehavior;
}

- (NSCollectionLayoutEnvironment_Private)_layoutEnvironment
{
  return self->_layoutEnvironment;
}

- (BOOL)_wantsSwipeActions
{
  return [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _wantsSwipeActions];
}

- (id)_invalidationContextForCellBackgroundOrBottomSeparatorChangeAtIndexPath:(id)a3 interactionState:(id)a4 separatorOnly:(BOOL)a5
{
  if (a4) {
    double v7 = (objc_class *)*((void *)a4 + 2);
  }
  else {
    double v7 = 0;
  }
  id v8 = objc_alloc_init(v7);
  [v8 _setIntent:10];
  if (a5 || [a3 item] < 1)
  {
    double v9 = 0;
  }
  else
  {
    double v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(a3, "item") - 1, objc_msgSend(a3, "section"));
  }
  double v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", a3, v9, 0);
  [v8 invalidateDecorationElementsOfKind:@"UICollectionViewListLayoutElementKindBottomSeparator" atIndexPaths:v10];
  [v8 invalidateItemsAtIndexPaths:v10];

  return v8;
}

- (_UICollectionViewListLayoutSection)initWithConfiguration:(id)a3
{
  return [(_UICollectionViewListLayoutSection *)self initWithConfiguration:a3 layoutEnvironment:0];
}

- (BOOL)shouldRestrictOrthogonalAxisDuringInteractiveMovement
{
  return 1;
}

- (BOOL)_wantsBandSelectionVisuals
{
  return 0;
}

- (BOOL)_useRoundedSwipeActions
{
  if ([(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle] == 2) {
    return 0;
  }
  return [(_UICollectionViewListLayoutSection *)self _hasHorizontalInsets];
}

- (void)_updateStyleForSwipeActionsConfiguration:(id)a3
{
  if (a3)
  {
    if (![a3 _swipeActionsStyle]
      && [(_UICollectionViewListLayoutSection *)self _useRoundedSwipeActions])
    {
      [a3 _setSwipeActionsStyle:2];
    }
    if ([a3 _swipeActionsStyle] == 2)
    {
      [a3 _roundedStyleCornerRadius];
      if (v5 == 0.0)
      {
        [(_UICollectionViewListLayoutSection *)self _effectiveCornerRadius];
        objc_msgSend(a3, "_setRoundedStyleCornerRadius:");
      }
    }
  }
}

- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3
{
  double v5 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration leadingSwipeActionsConfigurationProvider];

  if (v5)
  {
    uint64_t v6 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration leadingSwipeActionsConfigurationProvider];
    double v7 = ((void (**)(void, id))v6)[2](v6, a3);
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3
{
  double v5 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration trailingSwipeActionsConfigurationProvider];

  if (v5)
  {
    uint64_t v6 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration trailingSwipeActionsConfigurationProvider];
    double v7 = ((void (**)(void, id))v6)[2](v6, a3);
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

- (void)_willBeginSwiping
{
  BOOL v3 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration willBeginSwipingHandler];

  if (v3)
  {
    double v4 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration willBeginSwipingHandler];
    v4[2]();
  }
}

- (void)_didEndSwiping
{
  BOOL v3 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration didEndSwipingHandler];

  if (v3)
  {
    double v4 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration didEndSwipingHandler];
    v4[2]();
  }
}

- (BOOL)_shouldInvalidateForScrollViewLayoutAdjustmentsChange
{
  return 1;
}

- (unint64_t)_maskedCornersForBackgroundOfItemWithSelectionGrouping:(unint64_t)a3
{
  [(NSCollectionLayoutSection *)self interGroupSpacing];
  unint64_t v4 = a3 - 2;
  if (v5 > 0.0) {
    unint64_t v4 = -1;
  }
  if (v4 > 2) {
    return 15;
  }
  else {
    return qword_186B9DCA8[v4];
  }
}

- (id)_descriptionProperties
{
  v25.receiver = self;
  v25.super_class = (Class)_UICollectionViewListLayoutSection;
  BOOL v3 = [(NSCollectionLayoutSection *)&v25 _descriptionProperties];
  if (![(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _isAPIVersion]) {
    [v3 addObject:@"SPI List Section Configuration"];
  }
  unint64_t v4 = NSString;
  unint64_t v5 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration appearanceStyle];
  if (v5 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown value: %ld)", v5);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = off_1E530DA60[v5];
  }
  double v7 = [v4 stringWithFormat:@"appearance = %@", v6];
  [v3 addObject:v7];

  [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration sectionHeaderHeight];
  if (v8 == -1000.0)
  {
    if (![(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration stylesFirstItemAsHeader])goto LABEL_11; {
    double v9 = @"headerMode = .firstItemInSection";
    }
  }
  else
  {
    double v9 = @"headerMode = .supplementary";
  }
  [v3 addObject:v9];
LABEL_11:
  [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration sectionFooterHeight];
  if (v10 != -1000.0) {
    [v3 addObject:@"footerMode = .supplementary"];
  }
  [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration headerTopPadding];
  if (v11 != 1.79769313e308)
  {
    double v12 = NSString;
    [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration headerTopPadding];
    double v14 = objc_msgSend(v12, "stringWithFormat:", @"headerTopPadding = %g", v13);
    [v3 addObject:v14];
  }
  if ([(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration separatorStyle] != 1) {
    [v3 addObject:@"showsSeparators = NO"];
  }
  double v15 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _itemSeparatorHandler];

  if (v15) {
    [v3 addObject:@"Has Item Separator Handler"];
  }
  double v16 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _backgroundColor];

  if (v16)
  {
    id v17 = NSString;
    double v18 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration _backgroundColor];
    double v19 = [v17 stringWithFormat:@"backgroundColor = %@", v18];
    [v3 addObject:v19];
  }
  uint64_t v20 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration leadingSwipeActionsConfigurationProvider];

  uint64_t v21 = [(_UICollectionViewListLayoutSectionConfiguration *)self->_configuration trailingSwipeActionsConfigurationProvider];

  if (v20 | v21)
  {
    double v22 = @"Has Leading & Trailing Swipe Actions Providers";
    if (!v21) {
      double v22 = @"Has Leading Swipe Actions Provider";
    }
    if (v20) {
      double v23 = v22;
    }
    else {
      double v23 = @"Has Trailing Swipe Actions Provider";
    }
    [v3 addObject:v23];
  }
  return v3;
}

@end