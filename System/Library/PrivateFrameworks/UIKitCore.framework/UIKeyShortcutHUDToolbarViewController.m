@interface UIKeyShortcutHUDToolbarViewController
@end

@implementation UIKeyShortcutHUDToolbarViewController

void __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v7 configureForDisplayingInHUDWithCategory:v9];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_2;
    v13[3] = &unk_1E530B260;
    objc_copyWeak(&v14, v10);
    [v7 setConfigurationUpdateHandler:v13];
    v12 = [WeakRetained collectionViewManager];
    objc_msgSend(v7, "setCategoryVisible:", objc_msgSend(v12, "client:isCategoryVisibleForCellAtIndexPath:", WeakRetained, v8));

    objc_destroyWeak(&v14);
  }
}

void __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateScrollingSeparatorViewVisibility];
    id WeakRetained = v2;
  }
}

void __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = [v12 separatorView];
    [WeakRetained _configureSeparatorViewAppearance:v8];

    id v9 = [WeakRetained collectionViewManager];
    uint64_t v10 = [v9 client:WeakRetained shouldHideSeparatorAtIndexPath:v6];
    v11 = [v12 separatorView];
    [v11 setSeparatorHidden:v10];
  }
}

uint64_t __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

uint64_t __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(void *)(a1 + 32));
}

id __63___UIKeyShortcutHUDToolbarViewController__collectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained menu];
    id v8 = [v7 children];
    unint64_t v9 = [v8 count];

    uint64_t v10 = [v4 container];
    [v10 contentSize];
    double v11 = (double)v9;
    double v13 = v12 / (double)v9;

    id v14 = [v6 metrics];
    [v14 widestToolbarCategoryCellWidth];
    double v16 = v15;

    if (v13 >= v16) {
      double v16 = v13;
    }
    id v43 = v4;
    v17 = [v6 metrics];
    [v17 separatorWidth];
    v18 = objc_msgSend(off_1E52D2B08, "absoluteDimension:");
    v19 = [off_1E52D2B08 fractionalHeightDimension:1.0];
    v20 = [off_1E52D2B30 sizeWithWidthDimension:v18 heightDimension:v19];

    v21 = +[_UIKeyShortcutHUDUtilities separatorElementKind]();
    v22 = [off_1E52D2AF0 layoutAnchorWithEdges:2];
    v23 = [off_1E52D2B40 supplementaryItemWithLayoutSize:v20 elementKind:v21 containerAnchor:v22];

    v24 = [off_1E52D2B08 fractionalWidthDimension:1.0 / v11];
    v25 = [off_1E52D2B08 fractionalHeightDimension:1.0];
    v26 = [off_1E52D2B30 sizeWithWidthDimension:v24 heightDimension:v25];

    v44[0] = v23;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
    v28 = [off_1E52D2B20 itemWithLayoutSize:v26 supplementaryItems:v27];

    v29 = [off_1E52D2B08 absoluteDimension:v16 * v11];
    v30 = [off_1E52D2B08 fractionalHeightDimension:1.0];
    v31 = [off_1E52D2B30 sizeWithWidthDimension:v29 heightDimension:v30];

    v32 = [off_1E52D2B18 horizontalGroupWithLayoutSize:v31 repeatingSubitem:v28 count:v9];
    v33 = [v6 metrics];
    [v33 toolbarContentInset];
    double v35 = v34;
    v36 = [v6 metrics];
    [v36 toolbarContentInset];
    double v38 = v37;
    v39 = [v6 metrics];
    [v39 toolbarContentInset];
    objc_msgSend(v32, "setContentInsets:", v35, 0.0, v38, v40);

    id v4 = v43;
    v41 = [off_1E52D2B28 sectionWithGroup:v32];
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

void __69___UIKeyShortcutHUDToolbarViewController_didCompleteSearchTransition__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSearching])
  {
    id v2 = [*(id *)(a1 + 32) searchBar];
    [v2 becomeFirstResponder];
  }
}

uint64_t __81___UIKeyShortcutHUDToolbarViewController_flashCategoryAtIndex_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end