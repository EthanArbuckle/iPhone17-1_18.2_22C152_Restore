@interface _UISearchControllerInPlaceSearchBarAnimator
- (void)animateTransition:(id)a3;
@end

@implementation _UISearchControllerInPlaceSearchBarAnimator

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  v4 = [v3 viewControllerForKey:@"UITransitionContextFromViewController"];
  v5 = [v3 viewControllerForKey:@"UITransitionContextToViewController"];
  int v6 = [v3 isAnimated];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v8 = v5;
  }
  else {
    v8 = v4;
  }
  id v9 = v8;
  v10 = [v9 _searchPresentationController];
  v11 = [v9 presentingViewController];
  v50 = [v11 transitionCoordinator];

  v12 = [v9 searchBar];
  char v13 = [v12 _supportsLayoutStates];
  v49 = v4;
  v51 = v10;
  if (isKindOfClass)
  {
    objc_msgSend(v5, "set_resultsContentScrollViewPresentationOffset:", 0.0);
    v14 = v10;
    if ([v10 searchBarToBecomeTopAttached]) {
      objc_msgSend(v5, "set_previousSearchBarPosition:", objc_msgSend(v12, "barPosition"));
    }
    v15 = [v5 view];
    [v3 finalFrameForViewController:v5];
    objc_msgSend(v15, "setFrame:");
    v47 = [v3 containerView];
    v16 = [v47 window];
    v17 = [v16 windowScene];

    v46 = v17;
    if ([v5 _searchFieldIsBeginningEditing] && v17)
    {
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke;
      v74[3] = &unk_1E52D9F98;
      id v75 = v47;
      id v76 = v15;
      +[UIView _performBlockWithoutAutomaticallyUpdatingFirstResponder:forScene:]((uint64_t)UIView, v74, v17);
    }
    else
    {
      [v47 addSubview:v15];
    }
    [v14 resultsControllerContentOffset];
    double v24 = v23;
    uint64_t v69 = 0;
    v70 = (double *)&v69;
    uint64_t v71 = 0x3010000000;
    v72 = &unk_186D7DBA7;
    long long v73 = *MEMORY[0x1E4F1DAD8];
    v45 = [v5 searchResultsController];
    v25 = [v45 _contentOrObservableScrollViewForEdge:1];
    if ([v5 _hidesNavigationBarDuringPresentationRespectingInlineSearch])
    {
      v26 = [v51 presentingViewController];
      v27 = [v26 navigationController];
      BOOL v28 = v27 != 0;

      BOOL v29 = v28;
    }
    else
    {
      BOOL v29 = 0;
    }
    BOOL v30 = fabs(v24) < 2.22044605e-16 || v25 == 0;
    if (!v30 && [v25 _compatibleContentInsetAdjustmentBehavior] == 101)
    {
      [v25 contentInset];
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      v37 = v70;
      v70[4] = 0.0;
      v37[5] = -v24;
      if (v29)
      {
        [v5 _resultsContentScrollViewPresentationOffset];
        v70[5] = v70[5] - v38;
      }
      else
      {
        objc_msgSend(v5, "set_resultsContentScrollViewPresentationOffset:", 0.0);
      }
      objc_msgSend(v25, "setContentInset:", v24, v32, v34, v36);
      objc_msgSend(v25, "setContentOffset:", v70[4], v70[5]);
      objc_msgSend(v25, "setScrollIndicatorInsets:", v24, v32, v34, v36);
    }
    v39 = [v5 _resultsControllerViewContainer];
    [v39 setAlpha:0.0];

    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_2;
    v61[3] = &unk_1E5303B10;
    id v62 = v5;
    id v63 = v12;
    char v66 = v13;
    char v67 = v6;
    id v40 = v25;
    BOOL v68 = v29;
    id v64 = v40;
    v65 = &v69;
    v41 = (void (**)(void))_Block_copy(v61);
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_3;
    v59[3] = &unk_1E52DC3A0;
    id v42 = v3;
    id v60 = v42;
    v43 = (void (**)(void *, uint64_t))_Block_copy(v59);
    if (v6)
    {
      [(_UISearchControllerAnimator *)self transitionDuration:v42];
      v21 = v50;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v50 completionCurve], v41, v43, v44, 0.0);
    }
    else
    {
      v41[2](v41);
      v21 = v50;
      v43[2](v43, 1);
    }

    _Block_object_dispose(&v69, 8);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_4;
    aBlock[3] = &unk_1E52DD128;
    id v55 = v4;
    id v56 = v12;
    char v57 = v13;
    char v58 = v6;
    v18 = (void (**)(void))_Block_copy(aBlock);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __65___UISearchControllerInPlaceSearchBarAnimator_animateTransition___block_invoke_5;
    v52[3] = &unk_1E52DC3A0;
    id v19 = v3;
    id v53 = v19;
    v20 = (void (**)(void *, uint64_t))_Block_copy(v52);
    if (v6)
    {
      [(_UISearchControllerAnimator *)self transitionDuration:v19];
      v21 = v50;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v50 completionCurve], v18, v20, v22, 0.0);
    }
    else
    {
      v18[2](v18);
      v20[2](v20, 1);
      v21 = v50;
    }

    v15 = v55;
  }
}

@end