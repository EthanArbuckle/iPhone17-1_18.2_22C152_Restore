@interface UIContextMenuListView
@end

@implementation UIContextMenuListView

void __40___UIContextMenuListView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v4 = a3;
  [v10 _updateContentMargins];
  [v10 setHasValidContentSize:0];
  v5 = [v4 preferredContentSizeCategory];

  LODWORD(v4) = UIContentSizeCategoryIsAccessibilityCategory(v5);
  v6 = [v10 traitCollection];
  v7 = [v6 preferredContentSizeCategory];
  int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (v4 != IsAccessibilityCategory)
  {
    [v10 updateTraitsIfNeeded];
    v9 = [v10 collectionView];
    [v9 reloadData];
  }
}

void __41___UIContextMenuListView_setShadowAlpha___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setClipsToBounds:0];
  v2 = [_UICutoutShadowView alloc];
  v3 = [*(id *)(a1 + 32) _platformMetrics];
  [v3 menuCornerRadius];
  id v4 = -[_UIRoundedRectShadowView initWithCornerRadius:](v2, "initWithCornerRadius:");
  [*(id *)(a1 + 32) setShadowView:v4];

  v5 = [*(id *)(a1 + 32) shadowView];
  [v5 setUserInteractionEnabled:0];

  v6 = [*(id *)(a1 + 32) shadowView];
  v7 = [v6 layer];
  [v7 setAllowsHitTesting:0];

  v8 = [*(id *)(a1 + 32) shadowView];
  v9 = [*(id *)(a1 + 32) clippingView];
  [v9 frame];
  objc_msgSend(v8, "frameWithContentWithFrame:");
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [*(id *)(a1 + 32) shadowView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = [*(id *)(a1 + 32) shadowView];
  [v19 setAlpha:0.0];

  v20 = [*(id *)(a1 + 32) shadowView];
  [v20 layoutIfNeeded];

  v21 = *(void **)(a1 + 32);
  id v22 = [v21 shadowView];
  [v21 insertSubview:v22 atIndex:0];
}

uint64_t __114___UIContextMenuListView_setSubmenuTitleViewExpanded_withMaterialGroupName_associatedCellContentView_highlighted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) highlightItemAtIndexPath:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 73))
  {
    v2 = [*(id *)(a1 + 48) contentView];
    [v2 _inheritRelevantPropertiesFromContentView:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 48) addObscuringMaterialViewWithGroupName:*(void *)(a1 + 64)];
  if (*(unsigned char *)(a1 + 73)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [*(id *)(a1 + 48) obscuringMaterialView];
  [v4 setAlpha:v3];

  if (*(unsigned char *)(a1 + 73))
  {
    v5 = [*(id *)(a1 + 48) contentView];
    uint64_t v6 = [v5 options];

    unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFBFLL;
    v8 = [*(id *)(a1 + 48) contentView];
    [v8 setOptions:v7];
  }
  v9 = *(void **)(a1 + 32);
  return [v9 layoutIfNeeded];
}

uint64_t __66___UIContextMenuListView_preferredContentSizeWithinContainerSize___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  [*(id *)(a1 + 32) frame];
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = v2;
  v15.size.height = v3;
  if (!CGRectEqualToRect(v13, v15)) {
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", 0.0, 0.0, v2, v3);
  }
  id v4 = [*(id *)(a1 + 32) collectionViewLayout];
  [v4 invalidateLayout];

  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 32) contentSize];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  double v8 = *(double *)(a1 + 56);
  [*(id *)(a1 + 40) bounds];
  double v9 = v8 - CGRectGetWidth(v14);
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 < 0.00000011920929) {
    [*(id *)(a1 + 40) _sizeClippingAndCollectionViews];
  }
  double v10 = *(void **)(a1 + 40);
  return [v10 setHasValidContentSize:1];
}

id __55___UIContextMenuListView__dataSourceForCollectionView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = [v7 dataSource];
  double v12 = [v11 snapshot];
  CGRect v13 = [v12 sectionIdentifiers];
  CGRect v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));

  CGRect v15 = [v9 _customContentView];
  double v16 = [v7 traitCollection];
  uint64_t v17 = [v14 cellSizeGivenTraits:v16];

  if ([v14 layout] == 1)
  {
    uint64_t v17 = [v14 preferredCellSize];
    v18 = @"kContextMenuSmallCell";
    if (!v15) {
      goto LABEL_17;
    }
  }
  else
  {
    unint64_t v19 = [v8 item];
    unint64_t v20 = 3;
    if (v17 != 1) {
      unint64_t v20 = 0;
    }
    if (!v17) {
      unint64_t v20 = 4;
    }
    if (v19 >= v20)
    {
      v18 = @"kContextMenuLargeCell";
      uint64_t v17 = 2;
      if (!v15)
      {
LABEL_17:
        if ([v9 _isLoadingPlaceholder])
        {
          v24 = @"kContextMenuLoadingCell";
          v25 = v7;
        }
        else
        {
          v25 = v7;
          v24 = v18;
        }
        id v23 = [v25 dequeueReusableCellWithReuseIdentifier:v24 forIndexPath:v8];
        [WeakRetained contentMargins];
        objc_msgSend(v23, "setDirectionalLayoutMargins:");
        [WeakRetained _configureCell:v23 inCollectionView:v7 atIndexPath:v8 forElement:v9 section:v14 size:v17];
        goto LABEL_21;
      }
    }
    else
    {
      v21 = @"kContextMenuLargeCell";
      if (!v17) {
        v21 = @"kContextMenuSmallCell";
      }
      if (v17 == 1) {
        v18 = @"kContextMenuMediumCell";
      }
      else {
        v18 = v21;
      }
      if (!v15) {
        goto LABEL_17;
      }
    }
  }
  id v22 = [v7 dequeueReusableCellWithReuseIdentifier:@"kContextMenuCustomViewCell" forIndexPath:v8];
  [v22 setCustomContentView:v15];
  id v23 = v22;
  [WeakRetained contentMargins];
  objc_msgSend(v23, "setDirectionalLayoutMargins:");

LABEL_21:
  return v23;
}

id __55___UIContextMenuListView__dataSourceForCollectionView___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v8 forIndexPath:v9];
  double v12 = [WeakRetained displayedMenu];
  v41 = [v7 dataSource];
  CGRect v13 = [v41 snapshot];
  CGRect v14 = [v13 sectionIdentifiers];

  if ([v14 count])
  {
    CGRect v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));
  }
  else
  {
    CGRect v15 = 0;
  }
  if ([v8 isEqualToString:@"kContextMenuHeader"])
  {
    id v16 = v11;
    v39 = v11;
    v40 = v15;
    if (v15 && ([v9 length] != 1 || objc_msgSend(v9, "section")))
    {
      uint64_t v17 = [v15 title];
      [WeakRetained headerMargins];
      objc_msgSend(v16, "setUnscaledLayoutMargins:");
      [v16 setIsMenuTitle:0];
      uint64_t v18 = 1;
      goto LABEL_28;
    }
    [v12 title];
    uint64_t v17 = v18 = (uint64_t)v15;
    v38 = [v12 headerView];
    if (!v18)
    {
LABEL_26:
      [WeakRetained menuTitleMargins];
      objc_msgSend(v16, "setUnscaledLayoutMargins:");
      [v16 setIsMenuTitle:1];
      if (v38)
      {
        [v16 setContentView:v38];

LABEL_29:
        [v16 setSeparatorStyle:v18];
        v34 = [WeakRetained backgroundMaterialGroupName];
        [v16 setBackgroundMaterialGroupName:v34];

        double v11 = v39;
        goto LABEL_30;
      }
LABEL_28:
      [v16 setTitle:v17];
      goto LABEL_29;
    }
    v31 = [v12 children];
    v32 = [v31 firstObject];

    v33 = [WeakRetained _platformMetrics];
    if (([v33 menuTitleAlwaysShowsSeparator] & 1) != 0 || v38)
    {
    }
    else
    {
      if (([v32 _isInlineGroup] & 1) == 0)
      {

LABEL_24:
        uint64_t v18 = 1;
        goto LABEL_25;
      }
      v36 = [v32 title];
      uint64_t v37 = [v36 length];

      if (!v37) {
        goto LABEL_24;
      }
    }
    uint64_t v18 = 2;
LABEL_25:

    goto LABEL_26;
  }
  if ([v8 isEqualToString:@"kContextMenuSubmenuTitleHeader"])
  {
    v40 = v15;
    id v16 = v11;
    [WeakRetained contentMargins];
    objc_msgSend(v16, "setDirectionalLayoutMargins:");
    objc_msgSend(v16, "setAllowsFocus:", objc_msgSend(WeakRetained, "allowsFocus"));
    unint64_t v19 = [v16 contentView];
    unint64_t v20 = [v12 title];
    [v19 setTitle:v20];

    v21 = [v16 contentView];
    id v22 = [v12 subtitle];
    [v21 setSubtitle:v22];

    id v23 = [v16 contentView];
    v24 = [v12 image];
    [v23 setImage:v24];

    v25 = [WeakRetained backgroundMaterialGroupName];
    [v16 setBackgroundMaterialGroupName:v25];

    uint64_t v26 = [v12 options] & 2;
    int v27 = [v12 _shouldShowSelectionState];
    uint64_t v28 = 80;
    if (v27) {
      uint64_t v28 = 84;
    }
    uint64_t v29 = v28 | v26;
    uint64_t v17 = [v16 contentView];
    [v17 setOptions:v29];
  }
  else
  {
    if (![v8 isEqualToString:@"kContextMenuSectionSeparator"]) {
      goto LABEL_31;
    }
    v40 = v15;
    id v16 = [v7 traitCollection];
    v30 = _UIContextMenuGetPlatformMetrics([v16 userInterfaceIdiom]);
    uint64_t v17 = [v30 sectionSeparatorColor];

    [v11 setBackgroundColor:v17];
  }
LABEL_30:

  CGRect v15 = v40;
LABEL_31:

  return v11;
}

void __94___UIContextMenuListView__configureCell_inCollectionView_atIndexPath_forElement_section_size___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB3418], "variantForSelector:", objc_msgSend(a2, "action"));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __94___UIContextMenuListView__configureCell_inCollectionView_atIndexPath_forElement_section_size___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB3418];
  id v7 = [a2 identifier];
  uint64_t v4 = [v3 variantForActionIdentifier:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end