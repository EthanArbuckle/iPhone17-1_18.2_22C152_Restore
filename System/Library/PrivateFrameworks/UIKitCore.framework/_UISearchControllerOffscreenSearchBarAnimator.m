@interface _UISearchControllerOffscreenSearchBarAnimator
- (void)animateTransition:(id)a3;
@end

@implementation _UISearchControllerOffscreenSearchBarAnimator

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:@"UITransitionContextFromViewController"];
  v6 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];
  int v61 = [v4 isAnimated];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v8 = v6;
  }
  else {
    v8 = v5;
  }
  id v9 = v8;
  v10 = [v9 _searchPresentationController];
  v11 = [v9 presentingViewController];
  v12 = [v11 transitionCoordinator];

  v13 = [v9 searchBar];
  v14 = v13;
  v62 = v10;
  v63 = v12;
  v60 = self;
  if (isKindOfClass)
  {
    id v58 = v9;
    if ([v10 searchBarToBecomeTopAttached]) {
      [v14 _setBarPosition:3];
    }
    v15 = (double *)MEMORY[0x1E4F1DAD8];
    if (v14 && ([v14 _isTextFieldManagedInNSToolbar] & 1) == 0)
    {
      v16 = [v10 searchBarContainerView];
      v17 = [v14 window];

      if (!v17)
      {
        [v14 frame];
        v87.origin.CGFloat x = *v15;
        v87.origin.y = v15[1];
        objc_msgSend(v14, "setFrame:", *v15, v87.origin.y - CGRectGetHeight(v87), v87.size.width, v87.size.height);
      }
      [v16 addSubview:v14];
    }
    v18 = [v4 viewForKey:@"UITransitionContextToView"];
    v19 = v18;
    v59 = v5;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [v6 view];
    }
    v31 = v20;

    [v4 finalFrameForViewController:v6];
    objc_msgSend(v31, "setFrame:");
    v32 = [v4 containerView];
    [v32 addSubview:v31];

    [v10 resultsControllerContentOffset];
    double v34 = v33;
    double v35 = *v15;
    double v36 = v15[1];
    v37 = [v6 searchResultsController];
    v38 = [v37 _contentOrObservableScrollViewForEdge:1];
    v39 = v38;
    if (fabs(v34) >= 2.22044605e-16)
    {
      [v38 contentInset];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      [v39 setContentInset:v34];
      objc_msgSend(v39, "setContentOffset:", v35, v36);
      objc_msgSend(v39, "setScrollIndicatorInsets:", v34, v41, v43, v45);
      double v35 = 0.0;
      double v36 = -v34;
    }
    if ([v6 automaticallyShowsCancelButton]) {
      [v14 setShowsCancelButton:1 animated:0];
    }
    [v14 frame];
    CGFloat x = v89.origin.x;
    CGFloat width = v89.size.width;
    CGFloat height = v89.size.height;
    double v49 = CGRectGetHeight(v89) + v89.origin.y;
    if ([v14 barPosition] == 3)
    {
      [v10 statusBarAdjustment];
      double v49 = v49 + v50;
    }
    v51 = [v6 _resultsControllerViewContainer];
    [v51 setAlpha:0.0];

    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke;
    v76[3] = &unk_1E5303B38;
    id v77 = v6;
    id v78 = v14;
    CGFloat v81 = x;
    double v82 = v49;
    CGFloat v83 = width;
    CGFloat v84 = height;
    id v52 = v37;
    id v79 = v52;
    id v53 = v39;
    id v80 = v53;
    double v85 = v35;
    double v86 = v36;
    v54 = (void (**)(void))_Block_copy(v76);
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_2;
    v74[3] = &unk_1E52DC3A0;
    id v55 = v4;
    id v75 = v55;
    v56 = (void (**)(void *, uint64_t))_Block_copy(v74);
    if (v61)
    {
      [(_UISearchControllerAnimator *)v60 transitionDuration:v55];
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v63 completionCurve], v54, v56, v57, 0.0);
    }
    else
    {
      v54[2](v54);
      v56[2](v56, 1);
    }
    id v9 = v58;

    v5 = v59;
  }
  else
  {
    [v13 frame];
    CGFloat v21 = v88.origin.x;
    CGFloat v22 = v88.size.width;
    CGFloat v23 = v88.size.height;
    double v24 = v88.origin.y - CGRectGetHeight(v88);
    if ([v14 barPosition] == 3)
    {
      [v10 statusBarAdjustment];
      double v24 = v24 - v25;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_3;
    aBlock[3] = &unk_1E52E69B8;
    id v68 = v5;
    id v26 = v14;
    id v69 = v26;
    CGFloat v70 = v21;
    double v71 = v24;
    CGFloat v72 = v22;
    CGFloat v73 = v23;
    v27 = (void (**)(void))_Block_copy(aBlock);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __67___UISearchControllerOffscreenSearchBarAnimator_animateTransition___block_invoke_4;
    v64[3] = &unk_1E52DA660;
    id v65 = v26;
    id v28 = v4;
    id v66 = v28;
    v29 = (void (**)(void *, uint64_t))_Block_copy(v64);
    if (v61)
    {
      [(_UISearchControllerAnimator *)v60 transitionDuration:v28];
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v12 completionCurve], v27, v29, v30, 0.0);
    }
    else
    {
      v27[2](v27);
      v29[2](v29, 1);
    }

    v31 = v68;
  }
}

@end