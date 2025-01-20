@interface _UISearchControllerCarPlaySearchBarAnimator
- (void)animateTransition:(id)a3;
- (void)didFocusSearchBarForController:(id)a3;
- (void)didUnfocusSearchBarForController:(id)a3;
@end

@implementation _UISearchControllerCarPlaySearchBarAnimator

- (void)animateTransition:(id)a3
{
  v186[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 viewControllerForKey:@"UITransitionContextFromViewController"];
  v5 = [v3 viewControllerForKey:@"UITransitionContextToViewController"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v7 = v5;
  }
  else {
    v7 = v4;
  }
  id v8 = v7;
  v9 = [v8 presentingViewController];
  v173 = [v9 transitionCoordinator];

  v10 = [v8 _searchPresentationController];
  v11 = [v8 searchBar];
  if (isKindOfClass)
  {
    v12 = [v5 view];
    [v12 setAutoresizingMask:26];

    v13 = [v5 view];
    [v3 finalFrameForViewController:v5];
    objc_msgSend(v13, "setFrame:");
    v14 = [v3 containerView];
    [v14 addSubview:v13];

    if ([v5 obscuresBackgroundDuringPresentation])
    {
      v15 = [v10 backgroundObscuringView];
      [v3 finalFrameForViewController:v5];
      objc_msgSend(v15, "setFrame:");
    }
    if (v11)
    {
      v16 = [v5 searchBar];
      [v16 _setDisableFocus:1];

      if ([v5 automaticallyShowsCancelButton]) {
        objc_msgSend(v11, "setShowsCancelButton:animated:", 1, objc_msgSend(v3, "isAnimated"));
      }
    }
    id v169 = v3;
    v17 = [v5 _systemInputViewController];
    v170 = v13;
    v172 = v17;
    id v167 = v8;
    v168 = v4;
    v165 = v11;
    v166 = v10;
    if ([v17 supportsTouchInput])
    {
      v18 = [v5 searchBar];
      v19 = [v18 searchField];
      [v19 frame];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;

      [v13 bounds];
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      v36 = [v13 _screen];
      [v36 scale];
      UIRectCenteredXInRectScale(v21, v23, v25, v27, v29, v31, v33, v35, v37);
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;

      v46 = [v10 searchBarContainerView];
      objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

      v47 = [v17 view];
      long long v48 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v184[0] = *MEMORY[0x1E4F1DAB8];
      v184[1] = v48;
      v184[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v47 setTransform:v184];

      v49 = [v17 view];
      [v49 layoutIfNeeded];

      v50 = [v17 alignmentConstraintForAxis:1];
      if (!v50)
      {
        v51 = (void *)MEMORY[0x1E4F5B268];
        v52 = [v17 view];
        v53 = [v17 view];
        v54 = [v53 superview];
        v50 = [v51 constraintWithItem:v52 attribute:4 relatedBy:0 toItem:v54 attribute:4 multiplier:1.0 constant:0.0];

        v17 = v172;
        [v50 setActive:1];
        [v172 setAlignmentConstraint:v50 forAxis:1];
      }
      v164 = v50;
      v55 = [v17 alignmentConstraintForAxis:0];
      if (!v55)
      {
        v56 = (void *)MEMORY[0x1E4F5B268];
        v57 = [v17 view];
        v58 = [v17 view];
        v59 = [v58 superview];
        v60 = [v59 safeAreaLayoutGuide];
        v55 = [v56 constraintWithItem:v57 attribute:9 relatedBy:0 toItem:v60 attribute:9 multiplier:1.0 constant:0.0];

        v17 = v172;
        [v55 setActive:1];
        [v172 setAlignmentConstraint:v55 forAxis:0];
      }
      v163 = v55;
      v61 = [UIView alloc];
      v62 = -[UIView initWithFrame:](v61, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIView *)v62 setTranslatesAutoresizingMaskIntoConstraints:0];
      v63 = +[UIColor tableBackgroundColor];
      [(UIView *)v62 setBackgroundColor:v63];

      objc_msgSend(v5, "set_systemInputMarginView:", v62);
      v147 = (void *)MEMORY[0x1E4F5B268];
      v159 = [(UIView *)v62 leftAnchor];
      v161 = [v13 safeAreaLayoutGuide];
      v157 = [v161 leftAnchor];
      v155 = [v159 constraintEqualToAnchor:v157];
      v186[0] = v155;
      v151 = [(UIView *)v62 rightAnchor];
      v153 = [v13 safeAreaLayoutGuide];
      v149 = [v153 rightAnchor];
      v145 = [v151 constraintEqualToAnchor:v149];
      v186[1] = v145;
      v143 = [(UIView *)v62 topAnchor];
      v64 = [v17 view];
      [v64 topAnchor];
      v66 = v65 = v17;
      v67 = [v143 constraintEqualToAnchor:v66];
      v186[2] = v67;
      v68 = [(UIView *)v62 bottomAnchor];
      v69 = [v65 view];
      [v69 bottomAnchor];
      v71 = v70 = v5;
      v72 = [v68 constraintEqualToAnchor:v71];
      v186[3] = v72;
      v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:4];
      [v147 activateConstraints:v73];

      v5 = v70;
      v74 = [v70 _resultsControllerViewContainer];
      v75 = [v74 superview];
      [v75 bounds];
      double v77 = v76;
      double v79 = v78;

      v4 = v168;
      v80 = [v168 navigationController];
      v81 = [v80 navigationBar];
      [v81 frame];
      double MaxY = CGRectGetMaxY(v187);

      v83 = [v70 view];
      [v83 frame];
      double v85 = v84 - MaxY;

      v86 = [v70 _resultsControllerViewContainer];
      -[UIView setFrame:](v86, "setFrame:", v77, MaxY, v79, v85);
      v87 = v169;
    }
    else
    {
      v95 = [v4 navigationController];
      v96 = [v95 navigationBar];
      [v96 frame];
      double v97 = CGRectGetMaxY(v188);

      double v98 = v97 + 1.0;
      v99 = [v17 alignmentConstraintForAxis:1];
      if (!v99)
      {
        v100 = (void *)MEMORY[0x1E4F5B268];
        v101 = [v17 view];
        v102 = [v17 view];
        v103 = [v102 superview];
        v99 = [v100 constraintWithItem:v101 attribute:3 relatedBy:0 toItem:v103 attribute:3 multiplier:1.0 constant:v98];

        v17 = v172;
        v13 = v170;

        [v99 setActive:1];
        [v172 setAlignmentConstraint:v99 forAxis:1];
      }
      v164 = v99;
      v104 = [v17 alignmentConstraintForAxis:0];
      if (!v104)
      {
        v105 = (void *)MEMORY[0x1E4F5B268];
        v106 = [v17 view];
        v107 = [v17 view];
        v108 = [v107 superview];
        v109 = [v108 safeAreaLayoutGuide];
        v104 = [v105 constraintWithItem:v106 attribute:9 relatedBy:0 toItem:v109 attribute:9 multiplier:1.0 constant:0.0];

        v17 = v172;
        v13 = v170;

        [v104 setActive:1];
        [v172 setAlignmentConstraint:v104 forAxis:0];
      }
      v163 = v104;
      v110 = [v17 view];
      [v110 layoutIfNeeded];

      uint64_t v111 = [v5 _resultsControllerViewContainer];
      if (v111)
      {
        v112 = (UIView *)v111;
        v113 = [v17 view];
        [v113 frame];
        double v114 = v98 + CGRectGetHeight(v189);

        [(UIView *)v112 frameOrigin];
        double v116 = v115;
        [(UIView *)v112 size];
        double v118 = v117;
        [(UIView *)v112 size];
        v160 = v112;
        -[UIView setFrame:](v112, "setFrame:", v116, v114, v118, v119 - v114);
      }
      else
      {
        v160 = [v4 view];
        -[UIView setFrameOrigin:](v160, "setFrameOrigin:", 0.0, 132.0);
      }
      v121 = [UIView alloc];
      v86 = -[UIView initWithFrame:](v121, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIView *)v86 setTranslatesAutoresizingMaskIntoConstraints:0];
      v122 = +[UIColor tableBackgroundColor];
      [(UIView *)v86 setBackgroundColor:v122];

      objc_msgSend(v5, "set_systemInputMarginView:", v86);
      v144 = (void *)MEMORY[0x1E4F5B268];
      v156 = [(UIView *)v86 leftAnchor];
      v158 = [v13 safeAreaLayoutGuide];
      v154 = [v158 leftAnchor];
      v152 = [v156 constraintEqualToAnchor:v154];
      v185[0] = v152;
      v148 = [(UIView *)v86 rightAnchor];
      v150 = [v13 safeAreaLayoutGuide];
      v146 = [v150 rightAnchor];
      v142 = [v148 constraintEqualToAnchor:v146];
      v185[1] = v142;
      v123 = [(UIView *)v86 topAnchor];
      [v17 view];
      v125 = v124 = v17;
      [v125 topAnchor];
      v126 = v162 = v5;
      v127 = [v123 constraintEqualToAnchor:v126];
      v185[2] = v127;
      v128 = [(UIView *)v86 bottomAnchor];
      v129 = [v124 view];
      v130 = [v129 bottomAnchor];
      v131 = [v128 constraintEqualToAnchor:v130];
      v185[3] = v131;
      v132 = [MEMORY[0x1E4F1C978] arrayWithObjects:v185 count:4];
      [v144 activateConstraints:v132];

      v5 = v162;
      v4 = v168;
      v87 = v169;
      v62 = v160;
    }

    v133 = [v172 view];
    v134 = [v133 superview];
    v135 = [v172 view];
    [v134 bringSubviewToFront:v135];

    v136 = [v5 _resultsControllerViewContainer];
    [v136 setAlpha:0.0];

    v182[0] = MEMORY[0x1E4F143A8];
    v182[1] = 3221225472;
    v182[2] = __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke;
    v182[3] = &unk_1E52D9F70;
    id v137 = v5;
    id v183 = v137;
    v138 = (void (**)(void))_Block_copy(v182);
    v179[0] = MEMORY[0x1E4F143A8];
    v179[1] = 3221225472;
    v179[2] = __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_2;
    v179[3] = &unk_1E52DA660;
    id v180 = v137;
    v88 = v87;
    id v139 = v87;
    id v181 = v139;
    v140 = (void (**)(void *, uint64_t))_Block_copy(v179);
    id v8 = v167;
    v11 = v165;
    if ([v139 isAnimated])
    {
      [(_UISearchControllerAnimator *)self transitionDuration:v139];
      v93 = v173;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v173 completionCurve], v138, v140, v141, 0.0);
    }
    else
    {
      v138[2](v138);
      v140[2](v140, 1);
      v93 = v173;
    }
    v10 = v166;
    v120 = v170;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_3;
    aBlock[3] = &unk_1E52D9F98;
    id v177 = v4;
    v88 = v3;
    id v89 = v3;
    id v178 = v89;
    v90 = (void (**)(void))_Block_copy(aBlock);
    v174[0] = MEMORY[0x1E4F143A8];
    v174[1] = 3221225472;
    v174[2] = __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_4;
    v174[3] = &unk_1E52DC3A0;
    id v91 = v89;
    id v175 = v91;
    v92 = (void (**)(void *, uint64_t))_Block_copy(v174);
    if ([v91 isAnimated])
    {
      [(_UISearchControllerAnimator *)self transitionDuration:v91];
      v93 = v173;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v173 completionCurve], v90, v92, v94, 0.0);
    }
    else
    {
      v90[2](v90);
      v92[2](v92, 1);
      v93 = v173;
    }

    v120 = v177;
  }
}

- (void)didFocusSearchBarForController:(id)a3
{
  id v4 = a3;
  v5 = [v4 _systemInputViewController];
  v6 = [v4 searchBar];
  [v6 becomeFirstResponder];

  if ([v5 supportsTouchInput])
  {
    v7 = [v5 view];
    [v7 frame];
    double MinY = CGRectGetMinY(v18);
    v9 = [v4 _resultsControllerViewContainer];
    [v9 frame];
    double MaxY = CGRectGetMaxY(v19);

    if (MinY >= MaxY)
    {
      v11 = [v5 view];
      v12 = [v11 superview];
      [v12 layoutIfNeeded];

      v13 = [v5 alignmentConstraintForAxis:1];
      [v13 setConstant:0.0];
      [(_UISearchControllerAnimator *)self transitionDuration:0];
      double v15 = v14;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __78___UISearchControllerCarPlaySearchBarAnimator_didFocusSearchBarForController___block_invoke;
      v16[3] = &unk_1E52D9F70;
      id v17 = v5;
      +[UIView animateWithDuration:v16 animations:0 completion:v15];
    }
  }
}

- (void)didUnfocusSearchBarForController:(id)a3
{
  id v4 = a3;
  v5 = [v4 _systemInputViewController];
  if ([v5 supportsTouchInput])
  {
    v6 = [v5 view];
    v7 = v6;
    if (v6) {
      [v6 transform];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    BOOL IsIdentity = CGAffineTransformIsIdentity(&v19);

    if (IsIdentity)
    {
      v9 = [v5 view];
      v10 = [v9 superview];
      [v10 layoutIfNeeded];

      v11 = [v5 alignmentConstraintForAxis:1];
      v12 = [v5 view];
      [v12 frame];
      [v11 setConstant:v13];

      [(_UISearchControllerAnimator *)self transitionDuration:0];
      double v15 = v14;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80___UISearchControllerCarPlaySearchBarAnimator_didUnfocusSearchBarForController___block_invoke;
      v17[3] = &unk_1E52D9F70;
      id v18 = v5;
      +[UIView animateWithDuration:v17 animations:0 completion:v15];
    }
  }
  v16 = [v4 searchBar];
  [v16 resignFirstResponder];
}

@end