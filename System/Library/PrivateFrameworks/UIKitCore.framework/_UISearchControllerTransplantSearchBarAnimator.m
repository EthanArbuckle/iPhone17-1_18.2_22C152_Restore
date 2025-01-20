@interface _UISearchControllerTransplantSearchBarAnimator
- (void)animateTransition:(id)a3;
@end

@implementation _UISearchControllerTransplantSearchBarAnimator

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:@"UITransitionContextFromViewController"];
  v6 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];
  int v7 = [v4 isAnimated];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v9 = v6;
  }
  else {
    v9 = v5;
  }
  id v10 = v9;
  v11 = [v10 _searchPresentationController];
  v12 = [v10 presentingViewController];
  v54 = [v12 transitionCoordinator];

  v53 = v10;
  v13 = [v10 searchBar];
  char v14 = [v13 _supportsLayoutStates];
  v55 = v11;
  if (isKindOfClass)
  {
    v50 = self;
    v51 = v5;
    if ([v11 searchBarToBecomeTopAttached])
    {
      objc_msgSend(v6, "set_previousSearchBarPosition:", objc_msgSend(v13, "barPosition"));
      [v13 _setBarPosition:3];
    }
    v15 = [v11 searchBarContainerView];
    [v15 addSubview:v13];

    v16 = [v6 view];
    [v4 finalFrameForViewController:v6];
    objc_msgSend(v16, "setFrame:");
    v17 = [v4 containerView];
    [v17 addSubview:v16];

    -[UIView _recursiveEagerlyUpdateSafeAreaInsetsUntilViewController](v16);
    [v11 resultsControllerContentOffset];
    double v19 = v18;
    uint64_t v77 = 0;
    v78 = (double *)&v77;
    uint64_t v79 = 0x3010000000;
    v80 = &unk_186D7DBA7;
    long long v81 = *MEMORY[0x1E4F1DAD8];
    v20 = [v6 searchResultsController];
    char v52 = v14;
    v21 = [v20 _contentOrObservableScrollViewForEdge:1];
    if ([v6 hidesNavigationBarDuringPresentation])
    {
      v22 = [v11 presentingViewController];
      v23 = [v22 navigationController];
      BOOL v24 = v23 != 0;
    }
    else
    {
      BOOL v24 = 0;
    }
    if (fabs(v19) >= 2.22044605e-16)
    {
      [v21 contentInset];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      v40 = v78;
      v78[4] = 0.0;
      v40[5] = -v19;
      if (v24)
      {
        [v6 _resultsContentScrollViewPresentationOffset];
        v78[5] = v78[5] - v41;
      }
      else
      {
        objc_msgSend(v6, "set_resultsContentScrollViewPresentationOffset:", 0.0);
      }
      objc_msgSend(v21, "setContentInset:", v19, v35, v37, v39);
      objc_msgSend(v21, "setContentOffset:", v78[4], v78[5]);
      objc_msgSend(v21, "setScrollIndicatorInsets:", v19, v35, v37, v39);
    }
    v42 = [v6 _resultsControllerViewContainer];
    [v42 setAlpha:0.0];

    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke;
    v68[3] = &unk_1E5303B60;
    id v69 = v6;
    char v74 = v52;
    id v43 = v13;
    id v70 = v43;
    char v75 = v7;
    id v44 = v20;
    BOOL v76 = v24;
    id v71 = v44;
    v73 = &v77;
    id v45 = v21;
    id v72 = v45;
    v46 = (void (**)(void))_Block_copy(v68);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_2;
    v65[3] = &unk_1E52DA660;
    id v66 = v43;
    id v47 = v4;
    id v67 = v47;
    v48 = (void (**)(void *, uint64_t))_Block_copy(v65);
    if (v7)
    {
      [(_UISearchControllerAnimator *)v50 transitionDuration:v47];
      v32 = v54;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v54 completionCurve], v46, v48, v49, 0.0);
    }
    else
    {
      v46[2](v46);
      v32 = v54;
      v48[2](v48, 1);
    }

    _Block_object_dispose(&v77, 8);
    v5 = v51;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_3;
    aBlock[3] = &unk_1E52DD128;
    id v25 = v5;
    char v26 = v14;
    id v27 = v25;
    id v61 = v25;
    char v63 = v26;
    id v28 = v13;
    id v62 = v28;
    char v64 = v7;
    v29 = (void (**)(void))_Block_copy(aBlock);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __68___UISearchControllerTransplantSearchBarAnimator_animateTransition___block_invoke_4;
    v56[3] = &unk_1E52DAF68;
    id v57 = v27;
    id v58 = v28;
    id v30 = v4;
    id v59 = v30;
    v31 = (void (**)(void *, uint64_t))_Block_copy(v56);
    if (v7)
    {
      [(_UISearchControllerAnimator *)self transitionDuration:v30];
      v32 = v54;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v54 completionCurve], v29, v31, v33, 0.0);
    }
    else
    {
      v29[2](v29);
      v31[2](v31, 1);
      v32 = v54;
    }

    v16 = v61;
  }
}

@end