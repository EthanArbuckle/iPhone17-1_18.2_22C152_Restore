@interface UIDocumentLaunchViewController
@end

@implementation UIDocumentLaunchViewController

void __93___UIDocumentLaunchViewController_browserPresentationControllerPresentationTransitionDidEnd___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIDocumentLaunchViewController _dismissBrowserViewController]((uint64_t)WeakRetained);
}

void __90___UIDocumentLaunchViewController_browserPresentationControllerDismissalTransitionDidEnd___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIDocumentLaunchViewController _presentBrowserViewController]((uint64_t)WeakRetained);
}

void __53___UIDocumentLaunchViewController_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v79 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_35;
  }
  v3 = WeakRetained[138];
  if (v3) {
    uint64_t v4 = v3[4];
  }
  else {
    LOBYTE(v4) = 0;
  }
  if (v3) {
    v3 = (void *)v3[6];
  }
  char v5 = *((unsigned char *)WeakRetained + 1096);
  v6 = *(void **)(v1 + 32);
  v67 = v3;
  v7 = [v79 parentViewController];
  v8 = v79[138];
  if (v8) {
    v8 = (void *)v8[10];
  }
  uint64_t v9 = v1;
  v10 = v8;
  id v73 = v79[123];
  v72 = [v79 view];
  id v11 = v79[134];
  id v78 = v79[128];
  v76 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:4];
  v12 = [v10 window];
  v13 = v7;
  if (v12)
  {
    v14 = [v7 view];
    int v15 = [v10 isDescendantOfView:v14];

    int v16 = v15 ^ 1;
  }
  else
  {
    int v16 = 1;
  }
  unsigned int v17 = v5 & 2;

  if (_AXSReduceMotionEnabled()) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = _AXSReduceMotionReduceSlideTransitionsEnabled() != 0;
  }
  unint64_t v74 = v4 & 4;
  v19 = [v78 selectedDetentIdentifier];
  char v20 = [v19 isEqualToString:@"com.apple.UIKit.full"];

  uint64_t v68 = v9;
  v70 = v11;
  v71 = v10;
  char v69 = v20;
  if ((v16 | v18))
  {
    id v21 = 0;
    id v22 = 0;
    v23 = v13;
LABEL_16:
    v77 = v21;
    if (v22) {
      BOOL v24 = v21 == 0;
    }
    else {
      BOOL v24 = 1;
    }
    int v25 = !v24;
    id v66 = v22;
    goto LABEL_23;
  }
  v45 = v10;
  id v22 = v45;
  v23 = v13;
  if (v17)
  {
    if (!v11)
    {
      id v21 = 0;
      goto LABEL_16;
    }
    uint64_t v46 = _UIDocumentUnavailablePortalViewForAnimationInfo(v11);
    [v76 addObject:v46];
    v47 = [v79 view];
    [v47 addSubview:v46];

    id v48 = v22;
  }
  else
  {
    if (!v74 || (v20 & 1) != 0)
    {
      if (!v11)
      {
        id v21 = v45;
        id v22 = 0;
        goto LABEL_16;
      }
      _UIDocumentUnavailablePortalViewForAnimationInfo(v11);
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      [v76 addObject:v48];
      v49 = [v79 view];
      [v49 addSubview:v48];
    }
    else
    {
      id v48 = v73;
    }
    uint64_t v46 = (uint64_t)v22;
  }
  v77 = (void *)v46;
  if (v48)
  {
    if (v46)
    {
      id v50 = [v23 view];

      if (v22 == v50)
      {
        v51 = [_UIDocumentUnavailablePortalContainerView alloc];
        v52 = [v23 view];
        v53 = -[_UIDocumentUnavailablePortalContainerView initWithSourceView:](v51, v52);

        [v76 addObject:v53];
        if (v17 || !v74)
        {
          v55 = [v79 view];
          [v55 addSubview:v53];
        }
        else
        {
          id v54 = v79[129];
          v55 = [v79[127] view];
          [v54 insertSubview:v53 belowSubview:v55];
        }

        id v56 = [v23 view];

        if (v48 == v56) {
          v57 = v48;
        }
        else {
          v57 = (void *)v46;
        }
        if (v48 != v56) {
          uint64_t v46 = (uint64_t)v53;
        }
        v77 = (void *)v46;
        if (v48 == v56) {
          id v48 = v53;
        }
      }
    }
  }
  int v25 = 0;
  id v66 = v48;
  if (v48 && v77)
  {
    id v58 = [v23 view];

    if (v17) {
      double v28 = 1.0;
    }
    else {
      double v28 = 0.0;
    }
    if (v22 == v58)
    {
      uint64_t v26 = 0;
      int v25 = 1;
      char v27 = 1;
    }
    else
    {
      v60 = [v23 view];
      v61 = -[UIView _backing_clientLayer](v60);
      float v59 = v28;
      *(float *)&double v62 = v59;
      [v61 setOpacity:v62];

      v63 = [v23 view];
      v64 = [v23 view];
      v65 = -[UIView _backing_clientLayer](v64);
      if (v63) {
        -[UIView _backing_addPrivateSubview:positioned:relativeTo:]((uint64_t)v63, v72, -3, (uint64_t)v65);
      }

      char v27 = 0;
      int v25 = 1;
      uint64_t v26 = 1;
    }
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v26 = 0;
  char v27 = 0;
  if (v17) {
    double v28 = 1.0;
  }
  else {
    double v28 = 0.0;
  }
LABEL_26:
  v29 = [v6 viewForKey:@"UITransitionContextFromView"];
  v30 = [v6 viewForKey:@"UITransitionContextToView"];
  if (v17)
  {
    v31 = [v6 containerView];
    [v31 addSubview:v30];
  }
  v32 = [v79 interruptibleAnimatorForTransition:v6];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke;
  v89[3] = &unk_1E530A490;
  char v94 = v17 >> 1;
  char v95 = v27;
  v89[4] = v79;
  double v93 = v28;
  char v96 = v25;
  char v97 = v74 >> 2;
  char v98 = v69;
  id v33 = v30;
  id v90 = v33;
  id v34 = v29;
  id v91 = v34;
  char v99 = v26;
  id v35 = v23;
  id v92 = v35;
  [v32 addAnimations:v89];
  if (v25)
  {
    id v75 = v33;
    v36 = objc_alloc_init(_UIMagicMorphAnimation);
    v37 = v66;
    [(_UIMagicMorphAnimation *)v36 morphTo:v66 reparentWithoutAnimation:v26 completion:0];
    uint64_t v80 = MEMORY[0x1E4F143A8];
    uint64_t v81 = 3221225472;
    v82 = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_6;
    v83 = &unk_1E52E5B08;
    v84 = v6;
    v38 = v76;
    id v85 = v76;
    char v88 = v26;
    id v86 = v35;
    v39 = v72;
    v87 = v72;
    v40 = v77;
    [(_UIMagicMorphAnimation *)v36 morphTo:v77 reparentWithoutAnimation:v26 completion:&v80];
    id v41 = v79[133];
    v79[133] = v36;
    v42 = v36;
    id v33 = v75;
    v43 = v42;

    v44 = v67;
    uint64_t v1 = v68;
  }
  else
  {
    uint64_t v80 = MEMORY[0x1E4F143A8];
    uint64_t v81 = 3221225472;
    v82 = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_7;
    v83 = &unk_1E52DC698;
    v84 = v6;
    [v32 addCompletion:&v80];
    v44 = v67;
    uint64_t v1 = v9;
    v39 = v72;
    v38 = v76;
    v40 = v77;
    v37 = v66;
  }

LABEL_35:
  [*(id *)(v1 + 40) startAnimation];
}

void __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 72))
  {
    if (*(unsigned char *)(a1 + 73)) {
      goto LABEL_6;
    }
LABEL_5:
    [*(id *)(*(void *)(a1 + 32) + 976) setAlpha:*(double *)(a1 + 64)];
    goto LABEL_6;
  }
  if (!*(unsigned char *)(a1 + 73)) {
    goto LABEL_5;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_2;
  v34[3] = &unk_1E52D9CD0;
  v34[4] = *(void *)(a1 + 32);
  v34[5] = *(void *)(a1 + 64);
  +[UIView performWithoutAnimation:v34];
LABEL_6:
  if (*(unsigned char *)(a1 + 74) && !*(unsigned char *)(a1 + 72) && *(unsigned char *)(a1 + 75))
  {
    [*(id *)(*(void *)(a1 + 32) + 1056) setAlpha:*(double *)(a1 + 64)];
    double v2 = *(double *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = 1048;
    goto LABEL_14;
  }
  if (!*(unsigned char *)(a1 + 73))
  {
    double v2 = *(double *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = 1032;
LABEL_14:
    [*(id *)(v3 + v4) setAlpha:v2];
    goto LABEL_15;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_3;
    v33[3] = &unk_1E52D9CD0;
    v33[4] = *(void *)(a1 + 32);
    v33[5] = *(void *)(a1 + 64);
    +[UIView performWithoutAnimation:v33];
  }
LABEL_15:
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_4;
  v30[3] = &unk_1E52DF220;
  v30[4] = *(void *)(a1 + 32);
  char v31 = *(unsigned char *)(a1 + 72);
  char v32 = *(unsigned char *)(a1 + 74);
  +[UIView performWithoutAnimation:v30];
  if (*(unsigned char *)(a1 + 72)) {
    int v5 = 1;
  }
  else {
    int v5 = *(unsigned char *)(a1 + 74) != 0;
  }
  v6 = *(unsigned __int8 **)(*(void *)(a1 + 32) + 1008);
  if (v6 && v6[424] != v5)
  {
    v6[424] = v5;
    -[_UIDocumentUnavailablePageBackgroundAccessoryView _layoutPageViews](v6);
  }
  if (!*(unsigned char *)(a1 + 76) && (*(unsigned char *)(a1 + 75) || !*(unsigned char *)(a1 + 74)))
  {
    if (*(unsigned char *)(a1 + 72))
    {
      [*(id *)(a1 + 40) frame];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_5;
      v24[3] = &unk_1E52DA520;
      id v25 = *(id *)(a1 + 40);
      double v26 = v8;
      double v27 = v10;
      double v28 = v12;
      double v29 = v14;
      +[UIView performWithoutAnimation:v24];
      objc_msgSend(*(id *)(a1 + 40), "setFrame:", v8, v10, v12, v14);
    }
    else
    {
      [*(id *)(a1 + 48) frame];
      CGFloat x = v35.origin.x;
      CGFloat y = v35.origin.y;
      CGFloat width = v35.size.width;
      CGFloat height = v35.size.height;
      CGFloat v19 = CGRectGetHeight(v35);
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      CGRect v37 = CGRectOffset(v36, 0.0, v19);
      objc_msgSend(*(id *)(a1 + 48), "setFrame:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
    }
  }
  -[_UIDocumentLaunchViewController _updateParentNavigationBarVisibility:](*(void **)(a1 + 32), 2 * *(unsigned __int8 *)(a1 + 72));
  if (*(unsigned char *)(a1 + 77))
  {
    float v20 = 1.0 - *(double *)(a1 + 64);
    id v21 = [*(id *)(a1 + 56) view];
    id v22 = -[UIView _backing_clientLayer](v21);
    *(float *)&double v23 = v20;
    [v22 setOpacity:v23];
  }
}

uint64_t __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:*(double *)(a1 + 40)];
}

unsigned __int8 *__84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    int v1 = *(unsigned char *)(a1 + 41) != 0;
  }
  else {
    int v1 = 1;
  }
  result = *(unsigned __int8 **)(*(void *)(a1 + 32) + 1008);
  if (result)
  {
    if (result[424] != v1)
    {
      result[424] = v1;
      return -[_UIDocumentUnavailablePageBackgroundAccessoryView _layoutPageViews](result);
    }
  }
  return result;
}

uint64_t __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_5(uint64_t a1)
{
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  CGRect v6 = CGRectOffset(*(CGRect *)(a1 + 40), 0.0, Height);
  uint64_t v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

void __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_6(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "removeFromSuperview", (void)v14);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(a1 + 64))
  {
    double v7 = [*(id *)(a1 + 48) view];
    double v8 = -[UIView _backing_clientLayer](v7);
    LODWORD(v9) = 1.0;
    [v8 setOpacity:v9];

    double v10 = [*(id *)(a1 + 48) view];
    double v11 = *(void **)(a1 + 56);
    double v12 = [*(id *)(a1 + 48) view];
    double v13 = -[UIView _backing_clientLayer](v12);
    if (v10) {
      -[UIView _backing_addPrivateSubview:positioned:relativeTo:]((uint64_t)v10, v11, -2, (uint64_t)v13);
    }
  }
}

uint64_t __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_7(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

void __79___UIDocumentLaunchViewController__prepareDocumentAnimationInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 134, a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64___UIDocumentLaunchViewController__presentBrowserViewController__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1056) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 1048) setAlpha:1.0];
  BOOL isParentViewControllerDisappearedOr = -[_UIDocumentLaunchViewController _isParentViewControllerDisappearedOrAppearing](*(void **)(a1 + 32));
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 976);
  if (isParentViewControllerDisappearedOr)
  {
    [v4 setAlpha:1.0];
    uint64_t v5 = *(void **)(a1 + 32);
    -[_UIDocumentLaunchViewController _updateParentNavigationBarVisibility:](v5, 2);
  }
  else
  {
    [v4 setAlpha:0.0];
  }
}

uint64_t __64___UIDocumentLaunchViewController__dismissBrowserViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __64___UIDocumentLaunchViewController__dismissBrowserViewController__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:4 delay:a2 options:a3 animations:0.5 completion:0.0];
}

void __64___UIDocumentLaunchViewController__dismissBrowserViewController__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) setAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 32);
  -[_UIDocumentLaunchViewController _updateParentNavigationBarVisibility:](v2, 0);
}

id __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 identifier];
  uint64_t v5 = _UIDocumentCreationIntentFromActionIdentifier(v4);

  if (v5)
  {
    CGRect v6 = [a2 title];
    double v7 = [a2 image];
    double v8 = [a2 identifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke_2;
    v11[3] = &unk_1E530A4E0;
    id v12 = *(id *)(a1 + 32);
    id v13 = v5;
    id v9 = +[UIAction actionWithTitle:v6 image:v7 identifier:v8 handler:v11];
  }
  else
  {
    id v9 = a2;
  }

  return v9;
}

void __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _UIDocumentUnavailableBrowserViewController(*(void *)(a1 + 32));
  uint64_t v3 = [v2 activeDocumentCreationIntent];

  if (v3)
  {
    uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDocument", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_13)+ 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      CGRect v6 = v2;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Ignoring document creation request as the import handler for a previous request has not been called. When implementing -[UIDocumentBrowserViewControllerDelegate documentBrowser:didRequestDocumentCreationWithHandler:], be sure to call the import handler when either the document has been created or the request has been canceled. Browser view controller: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    [v2 _initiateDocumentCreationWithIntent:*(void *)(a1 + 40)];
  }
}

uint64_t __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke_30(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41)) {
    return 0;
  }
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = _UIDocumentCreationIntentFromActionIdentifier(v3);

  int v5 = *(void **)(a1 + 32);
  if (v5) {
    int v5 = (void *)v5[5];
  }
  CGRect v6 = v5;
  uint64_t v7 = [v6 isEqualToString:v4];

  return v7;
}

uint64_t __60___UIDocumentLaunchViewController__firstResponderDidChange___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isFirstResponder];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 becomeFirstResponder];
  }
  return result;
}

void __54___UIDocumentLaunchViewController__layoutContentViews__block_invoke(double *a1, void *a2, void *a3)
{
  if (a3)
  {
    if (!a2) {
      return;
    }
  }
  else
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    double v26 = [NSString stringWithUTF8String:"-[_UIDocumentLaunchViewController _layoutContentViews]_block_invoke"];
    [v25 handleFailureInFunction:v26, @"_UIDocumentLaunchViewController.m", 809, @"Invalid parameter not satisfying: %@", @"containerView != nil" file lineNumber description];

    if (!a2) {
      return;
    }
  }
  [a3 center];
  objc_msgSend(a2, "setCenter:");
  [a3 bounds];
  objc_msgSend(a2, "setBounds:");
  CGRect v6 = [a2 superview];

  if (v6 != a3) {
    [a3 addSubview:a2];
  }
  char v7 = [a2 edgesInsettingLayoutMarginsFromSafeArea];
  double v8 = a1[4] + 0.0;
  if ((v7 & 1) == 0) {
    double v8 = 0.0;
  }
  double v9 = a1[5] + 0.0;
  if ((v7 & 2) == 0) {
    double v9 = 0.0;
  }
  double v10 = a1[6] + 0.0;
  if ((v7 & 4) == 0) {
    double v10 = 0.0;
  }
  double v11 = a1[7] + 0.0;
  if ((v7 & 8) == 0) {
    double v11 = 0.0;
  }
  double v12 = v11 + v9 + a1[10];
  double v13 = v12 * 0.5;
  if (v12 >= 0.0) {
    double v13 = 0.0;
  }
  double v14 = fmax(v12, 0.0);
  double v15 = v10 + v8 + a1[11];
  double v16 = v15 * 0.5;
  if (v15 >= 0.0) {
    double v16 = 0.0;
  }
  CGFloat v17 = fmax(v15, 0.0);
  CGFloat v18 = a1[8] - v9 + v13;
  CGFloat v19 = a1[9] - v8 + v16;
  v28.origin.CGFloat x = v18;
  v28.origin.CGFloat y = v19;
  v28.size.CGFloat width = v14;
  v28.size.CGFloat height = v17;
  double MinY = CGRectGetMinY(v28);
  v29.origin.CGFloat x = v18;
  v29.origin.CGFloat y = v19;
  v29.size.CGFloat width = v14;
  v29.size.CGFloat height = v17;
  double MinX = CGRectGetMinX(v29);
  double v22 = a1[12];
  [a3 bounds];
  double Width = CGRectGetWidth(v30);
  v31.origin.CGFloat x = v18;
  v31.origin.CGFloat y = v19;
  v31.size.CGFloat width = v14;
  v31.size.CGFloat height = v17;
  double v24 = Width - CGRectGetMaxX(v31);
  objc_msgSend(a2, "setLayoutMargins:", MinY, MinX, v22, v24);
}

@end