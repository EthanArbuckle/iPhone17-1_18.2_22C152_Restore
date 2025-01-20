@interface UINavigationItemProxy
@end

@implementation UINavigationItemProxy

void __57___UINavigationItemProxy_reloadDestinationItemFromSource__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) title];
  [*(id *)(*(void *)(a1 + 32) + 8) setTitle:v2];

  v3 = [*(id *)(a1 + 40) titleView];
  [*(id *)(*(void *)(a1 + 32) + 8) setTitleView:v3];

  v4 = [*(id *)(a1 + 40) _weeTitle];
  [*(id *)(*(void *)(a1 + 32) + 8) _setWeeTitle:v4];

  id v35 = 0;
  id v36 = 0;
  [*(id *)(a1 + 40) _getLeadingItems:&v36 groups:&v35];
  if (v36)
  {
    v5 = *(void **)(*(void *)(a1 + 32) + 8);
LABEL_3:
    objc_msgSend(v5, "setLeftBarButtonItems:");
    goto LABEL_6;
  }
  v6 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v35) {
    goto LABEL_5;
  }
  uint64_t v21 = [v6 leftBarButtonItems];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [*(id *)(a1 + 40) leftBarButtonItems];

    if (!v23)
    {
      v5 = *(void **)(*(void *)(a1 + 32) + 8);
      goto LABEL_3;
    }
  }
  v24 = [*(id *)(*(void *)(a1 + 32) + 8) leadingItemGroups];
  if ([v24 count])
  {
    v25 = [*(id *)(a1 + 40) leadingItemGroups];
    uint64_t v26 = [v25 count];

    if (!v26)
    {
      v6 = *(void **)(*(void *)(a1 + 32) + 8);
LABEL_5:
      objc_msgSend(v6, "setLeadingItemGroups:");
    }
  }
  else
  {
  }
LABEL_6:
  id v33 = 0;
  id v34 = 0;
  [*(id *)(a1 + 40) _getTrailingItems:&v34 groups:&v33];
  if (v34)
  {
    v7 = *(void **)(*(void *)(a1 + 32) + 8);
LABEL_8:
    objc_msgSend(v7, "setRightBarButtonItems:");
    goto LABEL_11;
  }
  v8 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v33)
  {
LABEL_10:
    objc_msgSend(v8, "setTrailingItemGroups:");
    goto LABEL_11;
  }
  uint64_t v27 = [v8 rightBarButtonItems];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [*(id *)(a1 + 40) rightBarButtonItems];

    if (!v29)
    {
      v7 = *(void **)(*(void *)(a1 + 32) + 8);
      goto LABEL_8;
    }
  }
  v30 = [*(id *)(*(void *)(a1 + 32) + 8) trailingItemGroups];
  if (![v30 count])
  {

    goto LABEL_11;
  }
  v31 = [*(id *)(a1 + 40) trailingItemGroups];
  uint64_t v32 = [v31 count];

  if (!v32)
  {
    v8 = *(void **)(*(void *)(a1 + 32) + 8);
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setHidesBackButton:", objc_msgSend(*(id *)(a1 + 40), "hidesBackButton"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setLeftItemsSupplementBackButton:", objc_msgSend(*(id *)(a1 + 40), "leftItemsSupplementBackButton"));
  v9 = [*(id *)(a1 + 40) backButtonTitle];
  [*(id *)(*(void *)(a1 + 32) + 8) setBackButtonTitle:v9];

  v10 = [*(id *)(a1 + 40) backBarButtonItem];
  [*(id *)(*(void *)(a1 + 32) + 8) setBackBarButtonItem:v10];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setLargeTitleDisplayMode:", objc_msgSend(*(id *)(a1 + 40), "largeTitleDisplayMode"));
  v11 = [*(id *)(a1 + 40) _largeTitleAccessoryView];
  [*(id *)(*(void *)(a1 + 32) + 8) _setLargeTitleAccessoryView:v11];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "_setLargeTitleTwoLineMode:", objc_msgSend(*(id *)(a1 + 40), "_largeTitleTwoLineMode"));
  v12 = [*(id *)(a1 + 40) compactAppearance];
  [*(id *)(*(void *)(a1 + 32) + 8) setCompactAppearance:v12];

  v13 = [*(id *)(a1 + 40) standardAppearance];
  [*(id *)(*(void *)(a1 + 32) + 8) setStandardAppearance:v13];

  v14 = [*(id *)(a1 + 40) scrollEdgeAppearance];
  [*(id *)(*(void *)(a1 + 32) + 8) setScrollEdgeAppearance:v14];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "_setBackgroundHidden:", objc_msgSend(*(id *)(a1 + 40), "_backgroundHidden"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "_setManualScrollEdgeAppearanceEnabled:", objc_msgSend(*(id *)(a1 + 40), "_isManualScrollEdgeAppearanceEnabled"));
  [*(id *)(a1 + 40) _manualScrollEdgeAppearanceProgress];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "_setManualScrollEdgeAppearanceProgress:");
  v15 = [*(id *)(a1 + 40) prompt];
  [*(id *)(*(void *)(a1 + 32) + 8) setPrompt:v15];

  v16 = [*(id *)(a1 + 40) searchController];
  [*(id *)(*(void *)(a1 + 32) + 8) setSearchController:v16];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setHidesSearchBarWhenScrolling:", objc_msgSend(*(id *)(a1 + 40), "hidesSearchBarWhenScrolling"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setPreferredSearchBarPlacement:", objc_msgSend(*(id *)(a1 + 40), "preferredSearchBarPlacement"));
  v17 = [*(id *)(a1 + 40) centerItemGroups];
  [*(id *)(*(void *)(a1 + 32) + 8) setCenterItemGroups:v17];

  v18 = [*(id *)(a1 + 40) additionalOverflowItems];
  [*(id *)(*(void *)(a1 + 32) + 8) setAdditionalOverflowItems:v18];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "_setPreferredNavigationBarVisibility:", objc_msgSend(*(id *)(a1 + 40), "_navigationBarVisibility"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "_setNavigationBarHidden:", objc_msgSend(*(id *)(a1 + 40), "_isNavigationBarHidden"));
  v19 = [*(id *)(a1 + 40) _topPalette];
  [*(id *)(*(void *)(a1 + 32) + 8) _setTopPalette:v19];

  v20 = [*(id *)(a1 + 40) _bottomPalette];
  [*(id *)(*(void *)(a1 + 32) + 8) _setBottomPalette:v20];
}

@end