@interface UIViewController(NUScrollView)
- (uint64_t)nu_adjustInsetsForScrollView:()NUScrollView;
- (uint64_t)nu_adjustInsetsForScrollView:()NUScrollView withEdgeInsets:;
- (void)nu_adjustInsetsForScrollView:()NUScrollView transparentNavigationBar:withEdgeInsets:;
@end

@implementation UIViewController(NUScrollView)

- (uint64_t)nu_adjustInsetsForScrollView:()NUScrollView
{
  return objc_msgSend(a1, "nu_adjustInsetsForScrollView:withEdgeInsets:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
}

- (uint64_t)nu_adjustInsetsForScrollView:()NUScrollView withEdgeInsets:
{
  return objc_msgSend(a1, "nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:", a3, 0);
}

- (void)nu_adjustInsetsForScrollView:()NUScrollView transparentNavigationBar:withEdgeInsets:
{
  id v85 = a7;
  [v85 _setAutomaticContentOffsetAdjustmentEnabled:0];
  double v14 = *MEMORY[0x263F001A8];
  double v15 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  v18 = [a1 navigationController];
  v19 = [v18 toolbar];

  if (v19)
  {
    v20 = [a1 navigationController];
    char v21 = [v20 isToolbarHidden];

    if ((v21 & 1) == 0)
    {
      v22 = [a1 navigationController];
      v23 = [v22 toolbar];
      [v23 frame];
      double v14 = v24;
      double v15 = v25;
      double v17 = v26;

      v27 = [a1 view];
      [v27 frame];
      double Height = CGRectGetHeight(v87);
      v29 = [a1 view];
      v30 = [v29 safeAreaLayoutGuide];
      [v30 layoutFrame];
      double v16 = Height - CGRectGetMaxY(v88);
    }
  }
  v31 = [a1 tabBarController];
  v32 = [v31 tabBar];
  double v83 = a4;
  double v84 = a5;
  double v82 = a3;
  if ([v32 isHidden]) {
    goto LABEL_7;
  }
  v33 = [a1 tabBarController];
  v34 = [v33 tabBar];
  [v34 frame];
  BOOL IsEmpty = CGRectIsEmpty(v89);

  if (!IsEmpty)
  {
    v36 = [a1 tabBarController];
    v37 = [v36 tabBar];
    [v37 frame];
    double v14 = v38;
    double v15 = v39;
    double v17 = v40;

    v31 = [a1 view];
    [v31 frame];
    double v41 = CGRectGetHeight(v90);
    v32 = [a1 view];
    v42 = [v32 safeAreaLayoutGuide];
    [v42 layoutFrame];
    double v16 = v41 - CGRectGetMaxY(v91);

LABEL_7:
  }
  CGFloat rect = v16;
  CGFloat v81 = v17;
  CGFloat v43 = v15;
  CGFloat v44 = v14;
  v45 = [a1 navigationController];
  uint64_t v46 = [v45 navigationBar];
  [(id)v46 frameUsingCenterAndBounds];
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  CGFloat v54 = v53;

  v55 = [a1 navigationController];
  LOBYTE(v46) = [v55 isNavigationBarHidden];

  double v56 = 0.0;
  if ((v46 & 1) == 0 && (a8 & 1) == 0)
  {
    v92.origin.x = v48;
    v92.origin.y = v50;
    v92.size.width = v52;
    v92.size.height = v54;
    double MaxY = CGRectGetMaxY(v92);
    if (MaxY >= 0.0) {
      double v58 = MaxY;
    }
    else {
      double v58 = 0.0;
    }
    if (v58 == 0.0)
    {
      v59 = [a1 view];
      [v59 safeAreaInsets];
      double v61 = v60;

      if (v61 > 0.0)
      {
        v62 = [a1 view];
        [v62 safeAreaInsets];
        double v58 = v63;
      }
    }
    [a1 additionalSafeAreaInsets];
    double v56 = v58 + v64;
  }
  v65 = [a1 navigationController];
  v66 = [v65 navigationBar];
  v67 = [v66 items];
  v68 = [v67 firstObject];
  v69 = [v68 _bottomPalette];
  v70 = [v69 contentView];
  v71 = [v70 subviews];
  v72 = [v71 firstObject];
  [v72 frame];
  double v74 = v73;

  [a1 additionalSafeAreaInsets];
  if (v75 <= 0.0) {
    double v76 = v74;
  }
  else {
    double v76 = 0.0;
  }
  v93.size.width = v81;
  double v77 = a2 + v56 + v76;
  v93.origin.x = v44;
  v93.origin.y = v43;
  v93.size.height = rect;
  objc_msgSend(v85, "setContentInset:", v77, v82 + 0.0, v83 + CGRectGetHeight(v93), v84 + 0.0);
  [v85 contentOffset];
  if (v78 <= 0.0 && (a8 & 1) == 0)
  {
    [v85 contentInset];
    objc_msgSend(v85, "setContentOffset:", 0.0, -v79);
  }
  [v85 _setAutomaticContentOffsetAdjustmentEnabled:1];
}

@end