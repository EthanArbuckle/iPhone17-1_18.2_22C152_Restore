@interface UIViewController(PhotosUICore)
+ (_PXFrozenViewController)px_freezeViewController:()PhotosUICore timeout:;
- (BOOL)px_isDescendantOfOrPresentedByViewController:()PhotosUICore;
- (BOOL)px_isDescendantOfViewController:()PhotosUICore;
- (BOOL)px_isVisible;
- (PXStatusBarHiddenViewController)px_createViewControllerWithHiddenStatusBarForMainViewController:()PhotosUICore;
- (double)px_layoutMargins;
- (double)px_safeAreaInsets;
- (id)px_descendantViewControllerWithClass:()PhotosUICore;
- (id)px_nextViewControllerInNavigationController;
- (id)px_previewActionMenus;
- (id)px_subtitle;
- (id)px_topmostPresentedViewController;
- (uint64_t)debugURLsForDiagnostics;
- (uint64_t)ppt_containedViewController;
- (uint64_t)px_canPresentViewControllerAnimated:()PhotosUICore;
- (uint64_t)px_containsViewControllerModalInPresentation;
- (uint64_t)px_determinesPreferredStatusBarHidden;
- (uint64_t)px_determinesPreferredStatusBarStyle;
- (uint64_t)px_dismissViewControllerIfAllowedAnimated:()PhotosUICore forced:;
- (uint64_t)px_isDelayingPresentation;
- (uint64_t)px_setModalInPresentation:()PhotosUICore;
- (void)px_addOrReplaceChildViewController:()PhotosUICore activateConstraints:;
- (void)px_adjustAdditionalSafeAreaInsetsToKeepContentStableRegardlessOfStatusBarVisibility;
- (void)px_containedViewControllerModalStateChanged;
- (void)px_enumerateDescendantViewControllersWithOptions:()PhotosUICore usingBlock:;
- (void)px_presentOverTopmostPresentedViewController:()PhotosUICore animated:completion:;
- (void)px_setPreviewActionMenus:()PhotosUICore;
- (void)px_setSubtitle:()PhotosUICore;
@end

@implementation UIViewController(PhotosUICore)

- (double)px_safeAreaInsets
{
  if ([a1 isViewLoaded])
  {
    v2 = [a1 view];
    [v2 safeAreaInsets];
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4FB2848];
  }
  v5 = +[PXKitSettings sharedInstance];
  [v5 simulatedSafeAreaHorizontalInsets];
  double v7 = v6;

  if (v7 > 0.0)
  {
    v8 = [a1 traitCollection];
    [v8 horizontalSizeClass];
  }
  return v4;
}

- (double)px_layoutMargins
{
  if (![a1 isViewLoaded]) {
    return *MEMORY[0x1E4FB2848];
  }
  v2 = [a1 view];
  [v2 layoutMargins];
  double v4 = v3;

  return v4;
}

- (uint64_t)debugURLsForDiagnostics
{
  return MEMORY[0x1E4F1CBF0];
}

- (void)px_adjustAdditionalSafeAreaInsetsToKeepContentStableRegardlessOfStatusBarVisibility
{
  v2 = +[PXWorkaroundSettings sharedInstance];
  int v3 = [v2 shouldWorkAround128269285];

  if (v3)
  {
    double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v4 userInterfaceIdiom] == 1)
    {
      v5 = [a1 presentingViewController];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __117__UIViewController_PhotosUICore__px_adjustAdditionalSafeAreaInsetsToKeepContentStableRegardlessOfStatusBarVisibility__block_invoke;
    aBlock[3] = &unk_1E5DBF650;
    aBlock[4] = a1;
    double v7 = (double (**)(void))_Block_copy(aBlock);
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v11 = 0.0;
    if (v6)
    {
      if ([a1 prefersStatusBarHidden]) {
        double v11 = v7[2](v7);
      }
    }
    objc_msgSend(a1, "setAdditionalSafeAreaInsets:", v11, v8, v9, v10);
  }
}

- (void)px_containedViewControllerModalStateChanged
{
  v2 = [a1 parentViewController];
  int v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [a1 presentingViewController];
  }
  id v5 = v4;

  objc_msgSend(v5, "px_containedViewControllerModalStateChanged");
}

- (uint64_t)px_containsViewControllerModalInPresentation
{
  if (([a1 isModalInPresentation] & 1) == 0)
  {
    objc_msgSend(a1, "px_childViewControllersForModalInPresentation");
    objc_claimAutoreleasedReturnValue();
    PXExists();
  }
  return 1;
}

- (uint64_t)px_setModalInPresentation:()PhotosUICore
{
  uint64_t result = [a1 isModalInPresentation];
  if (result != a3)
  {
    [a1 setModalInPresentation:a3];
    return objc_msgSend(a1, "px_containedViewControllerModalStateChanged");
  }
  return result;
}

- (uint64_t)px_determinesPreferredStatusBarHidden
{
  return 0;
}

- (uint64_t)px_determinesPreferredStatusBarStyle
{
  return 0;
}

- (id)px_nextViewControllerInNavigationController
{
  v2 = [a1 navigationController];
  int v3 = [v2 viewControllers];

  uint64_t v4 = [v3 indexOfObject:a1];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v5 = v4 + 1, v4 + 1 >= (unint64_t)[v3 count]))
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [v3 objectAtIndexedSubscript:v5];
  }

  return v6;
}

- (void)px_setPreviewActionMenus:()PhotosUICore
{
}

- (id)px_previewActionMenus
{
  return objc_getAssociatedObject(a1, (const void *)PXPreviewActionMenusKey);
}

- (void)px_setSubtitle:()PhotosUICore
{
}

- (id)px_subtitle
{
  return objc_getAssociatedObject(a1, (const void *)PXSubtitleAssociationKey);
}

- (id)px_descendantViewControllerWithClass:()PhotosUICore
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__147989;
  double v10 = __Block_byref_object_dispose__147990;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__UIViewController_PhotosUICore__px_descendantViewControllerWithClass___block_invoke;
  v5[3] = &unk_1E5DBF2A8;
  v5[4] = &v6;
  v5[5] = a3;
  objc_msgSend(a1, "px_enumerateDescendantViewControllersWithOptions:usingBlock:", 0, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)px_enumerateDescendantViewControllersWithOptions:()PhotosUICore usingBlock:
{
  id v6 = a4;
  double v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:a1];
  uint64_t v8 = [a1 childViewControllers];
  [v7 addObjectsFromArray:v8];

  double v9 = [a1 presentedViewController];
  double v10 = v9;
  if (v9)
  {
    id v11 = [v9 presentingViewController];
    if (v11 == a1)
    {
      char v12 = [v7 containsObject:v10];

      if ((v12 & 1) == 0) {
        [v7 addObject:v10];
      }
    }
    else
    {
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__UIViewController_PhotosUICore__px_enumerateDescendantViewControllersWithOptions_usingBlock___block_invoke;
  v14[3] = &unk_1E5DBF280;
  v14[4] = a1;
  id v15 = v6;
  uint64_t v16 = a3;
  id v13 = v6;
  [v7 enumerateObjectsWithOptions:a3 usingBlock:v14];
}

- (BOOL)px_isDescendantOfOrPresentedByViewController:()PhotosUICore
{
  id v4 = a3;
  id v5 = a1;
  id v6 = v5;
  BOOL v7 = v5 != 0;
  if (v5 == v4 || !v5)
  {
    id v11 = v5;
  }
  else
  {
    do
    {
      uint64_t v8 = [v6 parentViewController];
      double v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [v6 presentingViewController];
      }
      id v11 = v10;

      BOOL v7 = v11 != 0;
      if (v11 == v4) {
        break;
      }
      id v6 = v11;
    }
    while (v11);
  }

  return v7;
}

- (BOOL)px_isDescendantOfViewController:()PhotosUICore
{
  id v4 = a3;
  if (v4)
  {
    id v5 = a1;
    id v6 = v5;
    for (BOOL i = v5 != 0; v6 != v4 && v6; BOOL i = v6 != 0)
    {
      uint64_t v8 = v6;
      id v6 = [v6 parentViewController];
    }
  }
  else
  {
    BOOL i = 0;
  }

  return i;
}

- (uint64_t)px_canPresentViewControllerAnimated:()PhotosUICore
{
  if (a3 && !objc_msgSend(a1, "px_isVisible")) {
    return 0;
  }
  id v5 = [a1 presentedViewController];
  id v6 = v5;
  if (!v5
    || ([v5 isBeingDismissed] & 1) != 0
    || ([a1 navigationItem],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        [v7 searchController],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v6 == v8))
  {

    goto LABEL_10;
  }
  if (([a1 _mayForwardPresentationsToPresentedViewController] & 1) == 0)
  {
    uint64_t v10 = 0;
LABEL_14:

    return v10;
  }
  int v9 = objc_msgSend(v6, "px_canPresentViewControllerAnimated:", a3);

  if (v9)
  {
LABEL_10:
    id v11 = [a1 navigationController];
    id v6 = v11;
    if (v11)
    {
      char v12 = [v11 topViewController];
      uint64_t v10 = objc_msgSend(a1, "px_isDescendantOfViewController:", v12);
    }
    else
    {
      uint64_t v10 = 1;
    }
    goto LABEL_14;
  }
  return 0;
}

- (PXStatusBarHiddenViewController)px_createViewControllerWithHiddenStatusBarForMainViewController:()PhotosUICore
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v3 = objc_alloc_init(PXStatusBarHiddenViewController);
  [(PXStatusBarHiddenViewController *)v3 addChildViewController:v27];
  id v4 = [v27 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(PXStatusBarHiddenViewController *)v3 view];
  [v5 addSubview:v4];

  v19 = (void *)MEMORY[0x1E4F28DC8];
  v25 = [v4 topAnchor];
  v26 = [(PXStatusBarHiddenViewController *)v3 view];
  v24 = [v26 topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v29[0] = v23;
  v21 = [v4 bottomAnchor];
  v22 = [(PXStatusBarHiddenViewController *)v3 view];
  v20 = [v22 bottomAnchor];
  v18 = [v21 constraintEqualToAnchor:v20];
  v29[1] = v18;
  v17 = [v4 leadingAnchor];
  id v6 = [(PXStatusBarHiddenViewController *)v3 view];
  BOOL v7 = [v6 leadingAnchor];
  uint64_t v8 = [v17 constraintEqualToAnchor:v7];
  v29[2] = v8;
  int v9 = [v4 trailingAnchor];
  uint64_t v10 = [(PXStatusBarHiddenViewController *)v3 view];
  id v11 = [v10 trailingAnchor];
  char v12 = [v9 constraintEqualToAnchor:v11];
  v29[3] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v19 activateConstraints:v13];

  [v27 didMoveToParentViewController:a1];
  v14 = [v27 contentScrollViewForEdge:1];
  id v15 = [v27 contentScrollViewForEdge:4];

  [(PXStatusBarHiddenViewController *)v3 setContentScrollView:v14 forEdge:1];
  [(PXStatusBarHiddenViewController *)v3 setContentScrollView:v15 forEdge:4];

  return v3;
}

- (void)px_addOrReplaceChildViewController:()PhotosUICore activateConstraints:
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [a1 childViewControllers];
  unint64_t v9 = [v8 count];

  if (v9 >= 2)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:a1 file:@"UIViewController+PhotosUICore.m" lineNumber:138 description:@"Only 0 or 1 child view controller is expected."];
  }
  uint64_t v10 = [a1 childViewControllers];
  id v11 = [v10 firstObject];

  if (v11)
  {
    [v11 willMoveToParentViewController:0];
    char v12 = [v11 view];
    [v12 removeFromSuperview];

    [v11 removeFromParentViewController];
  }
  [a1 addChildViewController:v7];
  id v13 = [a1 view];
  v14 = [v7 view];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v13 addSubview:v14];
  if (a4)
  {
    v26 = (void *)MEMORY[0x1E4F28DC8];
    v31 = [v14 topAnchor];
    v30 = [v13 topAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v32[0] = v29;
    v28 = [v14 bottomAnchor];
    id v27 = [v13 bottomAnchor];
    v25 = [v28 constraintEqualToAnchor:v27];
    v32[1] = v25;
    v24 = [v14 leadingAnchor];
    v23 = [v13 leadingAnchor];
    id v15 = [v24 constraintEqualToAnchor:v23];
    v32[2] = v15;
    uint64_t v16 = [v14 trailingAnchor];
    v17 = [v13 trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v32[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    [v26 activateConstraints:v19];
  }
  else
  {
    [v13 bounds];
    objc_msgSend(v14, "setFrame:");
  }
  [v7 didMoveToParentViewController:a1];
  v20 = [v7 contentScrollViewForEdge:1];
  v21 = [v7 contentScrollViewForEdge:4];
  [a1 setContentScrollView:v20 forEdge:1];
  [a1 setContentScrollView:v21 forEdge:4];
}

- (uint64_t)px_dismissViewControllerIfAllowedAnimated:()PhotosUICore forced:
{
  uint64_t v7 = [a1 presentedViewController];
  if (!v7)
  {
    char v12 = 0;
LABEL_15:
    [a1 dismissViewControllerAnimated:a3 completion:0];
    uint64_t v14 = 1;
    goto LABEL_16;
  }
  uint64_t v8 = (void *)v7;
  do
  {
    if (objc_opt_respondsToSelector()) {
      int v9 = [v8 prepareForDismissingForced:a4] | a4;
    }
    else {
      int v9 = 1;
    }
    uint64_t v10 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [v8 setActive:0];
    }
    char v12 = [v8 presentedViewController];

    if (v12) {
      char v13 = v9;
    }
    else {
      char v13 = 0;
    }
    uint64_t v8 = v12;
  }
  while ((v13 & 1) != 0);
  if (v9) {
    goto LABEL_15;
  }
  uint64_t v14 = 0;
LABEL_16:

  return v14;
}

- (void)px_presentOverTopmostPresentedViewController:()PhotosUICore animated:completion:
{
  id v8 = a5;
  id v13 = a3;
  uint64_t v9 = objc_msgSend(a1, "px_topmostPresentedViewController");
  uint64_t v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = a1;
  }
  id v12 = v11;

  [v12 presentViewController:v13 animated:a4 completion:v8];
}

- (uint64_t)ppt_containedViewController
{
  return 0;
}

- (id)px_topmostPresentedViewController
{
  v1 = [a1 presentedViewController];
  v2 = [v1 presentedViewController];

  if (v2)
  {
    do
    {
      id v3 = [v1 presentedViewController];

      id v4 = [v3 presentedViewController];

      v1 = v3;
    }
    while (v4);
  }
  else
  {
    id v3 = v1;
  }
  return v3;
}

- (uint64_t)px_isDelayingPresentation
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [a1 _isDelayingPresentation];
}

- (BOOL)px_isVisible
{
  if (![a1 isViewLoaded]) {
    return 0;
  }
  v2 = [a1 view];
  id v3 = [v2 window];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (_PXFrozenViewController)px_freezeViewController:()PhotosUICore timeout:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = [a4 viewIfLoaded];
  id v6 = [v5 window];

  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v6 = objc_msgSend(v7, "px_firstKeyWindow");
  }
  id v8 = [v6 snapshotViewAfterScreenUpdates:0];
  uint64_t v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v18 = v6;
    __int16 v19 = 2048;
    double v20 = a1;
    __int16 v21 = 2048;
    v22 = v8;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_INFO, "Freezing window: %p timeout: %f snapshot: %p", buf, 0x20u);
  }

  uint64_t v10 = [v8 layer];
  [v10 setZPosition:1.79769313e308];

  [v6 addSubview:v8];
  id v11 = [[_PXFrozenViewController alloc] initWithSnapshotView:v8];
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__UIViewController_PhotosUICore__px_freezeViewController_timeout___block_invoke;
  block[3] = &unk_1E5DD36F8;
  id v13 = v11;
  uint64_t v16 = v13;
  dispatch_after(v12, MEMORY[0x1E4F14428], block);

  return v13;
}

@end