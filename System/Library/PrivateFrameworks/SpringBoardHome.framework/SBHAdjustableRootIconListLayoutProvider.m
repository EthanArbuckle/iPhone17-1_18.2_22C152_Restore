@interface SBHAdjustableRootIconListLayoutProvider
- (id)layoutForIconLocation:(id)a3;
@end

@implementation SBHAdjustableRootIconListLayoutProvider

- (id)layoutForIconLocation:(id)a3
{
  id v4 = a3;
  if (layoutForIconLocation__onceToken != -1) {
    dispatch_once(&layoutForIconLocation__onceToken, &__block_literal_global_56);
  }
  if (SBIconLocationGroupContainsLocation((void *)layoutForIconLocation__sAdjustableLocationGroup, v4))
  {
    v62.receiver = self;
    v62.super_class = (Class)SBHAdjustableRootIconListLayoutProvider;
    v5 = [(SBHDefaultIconListLayoutProvider *)&v62 layoutForIconLocation:v4];
    v6 = [v5 layoutConfiguration];
    v7 = (void *)[v6 copy];

    v8 = +[SBHHomeScreenDomain rootSettings];
    v9 = [v8 rootFolderSettings];

    v10 = self;
    objc_opt_isKindOfClass();

    if (([v4 isEqualToString:@"SBIconLocationRoot"] & 1) != 0
      || [v4 isEqualToString:@"SBIconLocationRootWithWidgets"])
    {
      [v7 portraitLayoutInsets];
      [v9 portraitLayoutInsets];
      UIEdgeInsetsAdd();
      objc_msgSend(v7, "setPortraitLayoutInsets:");
      [v7 landscapeLayoutInsets];
      [v9 landscapeLayoutInsets];
      UIEdgeInsetsAdd();
      objc_msgSend(v7, "setLandscapeLayoutInsets:");
      [v7 portraitAdditionalWidgetLayoutInsets];
      [v9 portraitAdditionalWidgetLayoutInsets];
      UIEdgeInsetsAdd();
      objc_msgSend(v7, "setPortraitAdditionalWidgetLayoutInsets:");
      [v7 landscapeAdditionalWidgetLayoutInsets];
      [v9 landscapeAdditionalWidgetLayoutInsets];
      UIEdgeInsetsAdd();
      objc_msgSend(v7, "setLandscapeAdditionalWidgetLayoutInsets:");
      objc_msgSend(v7, "setLayoutInsetsEnforcementAxis:", objc_msgSend(v9, "layoutInsetsEnforcementAxis") | objc_msgSend(v7, "layoutInsetsEnforcementAxis"));
    }
    else if ([v4 isEqualToString:@"SBIconLocationDock"])
    {
      [v7 portraitLayoutInsets];
      [v9 portraitLayoutInsets];
      UIEdgeInsetsAdd();
      [v9 dockAdditionalIconInsets];
      UIEdgeInsetsAdd();
      objc_msgSend(v7, "setPortraitLayoutInsets:");
    }
    v11 = [[SBHIconGridSizeClassSet alloc] initWithGridSizeClassGroup:@"SBHIconGridSizeClassGroupAll"];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __65__SBHAdjustableRootIconListLayoutProvider_layoutForIconLocation___block_invoke_2;
    v59[3] = &unk_1E6AB2BF8;
    id v12 = v7;
    id v60 = v12;
    id v13 = v9;
    id v61 = v13;
    [(SBHIconGridSizeClassSet *)v11 enumerateGridSizeClassesUsingBlock:v59];

    v14 = [v12 rootFolderVisualConfiguration];
    [v13 dockPlatterInsets];
    [v14 dockBackgroundViewInsets];
    UIEdgeInsetsAdd();
    double v57 = v15;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    [v14 dockListViewInsets];
    UIEdgeInsetsAdd();
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    [v14 dockViewHeight];
    double v31 = v30;
    [v13 dockViewHeight];
    [v14 setDockViewHeight:v31 + v32];
    [v14 dockBackgroundViewCornerRadius];
    double v34 = v33;
    [v13 dockCornerRadius];
    [v14 setDockBackgroundViewCornerRadius:v34 + v35];
    objc_msgSend(v14, "setDockListViewInsets:", v23, v25, v27, v29);
    objc_msgSend(v14, "setDockBackgroundViewInsets:", v57, v17, v19, v21);
    [v14 pageControlVerticalOffset];
    double v37 = v36;
    [v13 pageControlVerticalOffset];
    [v14 setPageControlVerticalOffset:v37 + v38];
    [v14 idleTextVerticalOffset];
    double v40 = v39;
    [v13 idleTextVerticalOffset];
    [v14 setIdleTextVerticalOffset:v40 + v41];
    [v14 editModeButtonSize];
    double v43 = v42;
    double v45 = v44;
    [v13 editModeButtonSize];
    objc_msgSend(v14, "setEditModeButtonSize:", v43 + v46, v45 + v47);
    [v14 editModeButtonLayoutOffset];
    double v49 = v48;
    double v51 = v50;
    [v13 editModeButtonLayoutOffset];
    objc_msgSend(v14, "setEditModeButtonLayoutOffset:", v49 + v52, v51 + v53);
    v54 = self;

    v55 = (void *)[objc_alloc((Class)v54) initWithLayoutConfiguration:v12];
  }
  else
  {
    v58.receiver = self;
    v58.super_class = (Class)SBHAdjustableRootIconListLayoutProvider;
    v55 = [(SBHDefaultIconListLayoutProvider *)&v58 layoutForIconLocation:v4];
  }

  return v55;
}

void __65__SBHAdjustableRootIconListLayoutProvider_layoutForIconLocation___block_invoke()
{
  v0 = (void *)layoutForIconLocation__sAdjustableLocationGroup;
  layoutForIconLocation__sAdjustableLocationGroup = @"AdjustableLocationGroup";

  SBIconLocationGroupAddLocation(@"AdjustableLocationGroup", @"SBIconLocationRoot");
  SBIconLocationGroupAddLocation(@"AdjustableLocationGroup", @"SBIconLocationRootWithWidgets");
  SBIconLocationGroupAddLocation(@"AdjustableLocationGroup", @"SBIconLocationDock");
}

void __65__SBHAdjustableRootIconListLayoutProvider_layoutForIconLocation___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v14 = a2;
  [v3 iconImageInfoForGridSizeClass:v14];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [*(id *)(a1 + 40) iconImageSizeForGridSizeClass:v14];
  objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:forGridSizeClass:", v14, v5 + v12, v7 + v13, v9, v11);
}

@end