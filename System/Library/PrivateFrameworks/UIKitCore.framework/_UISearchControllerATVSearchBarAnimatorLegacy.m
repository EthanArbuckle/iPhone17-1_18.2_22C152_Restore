@interface _UISearchControllerATVSearchBarAnimatorLegacy
- (BOOL)collapesKeyboardWhenNotFocused;
- (void)animateTransition:(id)a3;
- (void)didFocusSearchBarForController:(id)a3;
- (void)didRelayoutSearchBarForController:(id)a3;
- (void)didUnfocusSearchBarForController:(id)a3;
- (void)willFocusOffscreenViewForController:(id)a3 withHeading:(unint64_t)a4;
@end

@implementation _UISearchControllerATVSearchBarAnimatorLegacy

- (void)animateTransition:(id)a3
{
  v353[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 viewControllerForKey:@"UITransitionContextFromViewController"];
  v7 = [v5 viewControllerForKey:@"UITransitionContextToViewController"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v9 = v7;
  }
  else {
    v9 = v6;
  }
  id v10 = v9;
  v11 = [v10 presentingViewController];
  v12 = [v11 transitionCoordinator];

  v13 = [v10 _searchPresentationController];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) == 0)
  {
    v301 = [MEMORY[0x1E4F28B00] currentHandler];
    [v301 handleFailureInMethod:a2 object:self file:@"_UISearchControllerATVSearchAnimatorLegacy.m" lineNumber:46 description:@"UISearchBar's presentation controller must be of type _UISearchATVPresentationController."];
  }
  v335 = self;
  v15 = [v10 _searchPresentationController];
  v16 = [v10 searchBar];
  if ([v16 showsScopeBar])
  {
    v17 = [v16 _scopeBarContainerView];
    if (v17)
    {
      v337 = [v16 _scopeBarContainerView];
    }
    else
    {
      v337 = 0;
    }
  }
  else
  {
    v337 = 0;
  }
  v338 = v16;
  if (isKindOfClass)
  {
    id v333 = v10;
    v334 = v6;
    v18 = [v7 view];
    [v5 finalFrameForViewController:v7];
    objc_msgSend(v18, "setFrame:");
    v19 = [v5 containerView];
    [v19 addSubview:v18];

    if ([v7 obscuresBackgroundDuringPresentation])
    {
      v20 = [v15 backgroundObscuringView];
      [v5 finalFrameForViewController:v7];
      objc_msgSend(v20, "setFrame:");
    }
    v332 = v12;
    v21 = [v7 _systemInputViewControllerAfterUpdate:0];
    v336 = v18;
    v331 = v15;
    if ([v21 resolvedKeyboardStyle] == 1)
    {
      v22 = [v7 searchBar];
      [v22 _setDisableFocus:1];

      [v338 frame];
      [v18 frame];
      objc_msgSend(v338, "sizeThatFits:", v23, v24);
      double v26 = v25;
      [v18 frame];
      double v28 = v27 + -80.0;
      v29 = (double *)MEMORY[0x1E4F1DAD8];
      v30 = [v15 searchBarContainerView];
      [v30 addSubview:v338];

      if (dyld_program_sdk_at_least())
      {
        v31 = [v7 view];
        [v31 safeAreaInsets];
        double v33 = v32;
      }
      else
      {
        double v33 = 34.5;
      }
      double v55 = v28 + -80.0;
      double v56 = *v29;
      double v327 = v29[1];
      v57 = [v7 presentationController];
      v58 = [v57 presentingViewController];
      v59 = [v58 tabBarController];

      if (v59)
      {
        v60 = [v7 presentationController];
        v61 = [v60 presentingViewController];
        [v61 tabBarController];
        v63 = v62 = v15;
        v64 = [v63 tabBar];

        v65 = [v64 superview];
        v66 = [v65 coordinateSpace];
        [v64 frame];
        double v68 = v67;
        double v70 = v69;
        double v72 = v71;
        double v74 = v73;
        v75 = v62;
        v76 = [v62 searchBarContainerView];
        v77 = [v76 superview];
        v78 = [v77 coordinateSpace];
        objc_msgSend(v66, "convertRect:toCoordinateSpace:", v78, v68, v70, v72, v74);
        CGFloat v80 = v79;
        CGFloat v82 = v81;
        CGFloat v84 = v83;
        CGFloat v86 = v85;

        if ([v64 _displayStyle] == 1)
        {
          v354.origin.x = v80;
          v354.origin.y = v82;
          v354.size.width = v84;
          v354.size.height = v86;
          double v33 = CGRectGetMaxY(v354) + 43.0;
        }

        v15 = v75;
        v18 = v336;
      }
      [v18 bounds];
      double v88 = v87;
      double v90 = v89;
      double v92 = v91;
      double v94 = v93;
      v95 = [v18 _screen];
      [v95 scale];
      UIRectCenteredXInRectScale(v56, v33, v55, v26, v88, v90, v92, v94, v96);
      double v98 = v97;
      double v100 = v99;
      double v102 = v101;
      double v104 = v103;

      v105 = [v15 searchBarContainerView];
      objc_msgSend(v105, "setFrame:", v98, v100, v102, v104);

      objc_msgSend(v338, "setFrame:", v56, v327, v55, v26);
      v106 = [v21 view];
      long long v107 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v349[0] = *MEMORY[0x1E4F1DAB8];
      v349[1] = v107;
      v349[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v106 setTransform:v349];

      v108 = [v21 view];
      [v108 layoutIfNeeded];

      [v21 view];
      v319 = double v109 = 1.0;
      [v319 setAlpha:1.0];
      v110 = (void *)MEMORY[0x1E4F5B268];
      v111 = [v21 alignmentConstraintArrayForAxis:0];
      [v110 deactivateConstraints:v111];

      v112 = (void *)MEMORY[0x1E4F5B268];
      v113 = [v21 alignmentConstraintArrayForAxis:1];
      [v112 deactivateConstraints:v113];

      v355.origin.x = v98;
      v355.origin.y = v100;
      v355.size.width = v102;
      v355.size.height = v104;
      CGFloat v114 = CGRectGetMaxY(v355) + 34.5;
      v115 = [v21 view];
      v116 = [v115 centerXAnchor];
      v117 = [v7 view];
      v118 = [v117 centerXAnchor];
      uint64_t v119 = [v116 constraintEqualToAnchor:v118];

      v120 = [v21 view];
      v121 = [v120 topAnchor];
      v122 = [v21 view];
      v123 = [v122 superview];
      v124 = [v123 topAnchor];
      uint64_t v125 = [v121 constraintEqualToAnchor:v124 constant:v114];

      v126 = (void *)v119;
      uint64_t v127 = v125;

      v128 = (void *)MEMORY[0x1E4F5B268];
      v353[0] = v119;
      v353[1] = v125;
      v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:v353 count:2];
      [v128 activateConstraints:v129];

      [v21 setAlignmentConstraint:v119 forAxis:0];
      [v21 setAlignmentConstraint:v125 forAxis:1];
      v130 = [v21 view];
      [v130 frame];
      double v132 = v114 + v131;

      v133 = [v7 _leftDividerView];
      v134 = [v7 view];
      [v134 frame];
      double v136 = v135 + -160.0;

      objc_msgSend(v133, "setFrame:", 80.0, v132, v136, 1.0);
      [v336 addSubview:v133];
      v137 = [v7 _rightDividerView];
      [v137 removeFromSuperview];

      [v336 frame];
      double v139 = v138 + -160.0;
      v356.size.height = 1.0;
      v356.origin.x = 80.0;
      v356.origin.y = v132;
      v356.size.width = v138 + -160.0;
      double MaxY = CGRectGetMaxY(v356);
      v141 = [v7 _leftDividerView];
      v322 = [v7 _rightDividerView];
      v328 = (void *)v127;
      if ([v338 showsScopeBar] && v337)
      {
        v323 = v133;
        id v325 = v5;
        v316 = v126;
        v318 = v21;
        [v338 _scopeBarHeight];
        double v143 = v142;
        v144 = [v338 _scopeBar];
        objc_msgSend(v144, "sizeThatFits:", 10000.0, 10000.0);
        double v146 = v145;

        double v147 = (v139 - v146) * 0.5 + 80.0;
        objc_msgSend(v337, "setFrame:", v147, v132, v146, v143);
        [v337 setAlpha:1.0];
        [v336 addSubview:v337];
        v357.origin.x = v147;
        v357.origin.y = v132;
        v357.size.width = v146;
        CGFloat rect = v143;
        v357.size.height = v143;
        double MaxY = CGRectGetMaxY(v357);
        v148 = [v7 _scopeBarFocusContainerGuide];
        v149 = [v7 _scopeBarConstraints];

        if (v149)
        {
          v150 = (void *)MEMORY[0x1E4F5B268];
          v151 = [v7 _scopeBarConstraints];
          [v150 deactivateConstraints:v151];
        }
        v310 = [v148 topAnchor];
        v308 = [v337 topAnchor];
        v306 = [v310 constraintEqualToAnchor:v308];
        v352[0] = v306;
        v304 = [v337 bottomAnchor];
        v303 = [v148 bottomAnchor];
        v302 = [v304 constraintEqualToAnchor:v303 constant:-30.0];
        v352[1] = v302;
        v152 = [v148 leftAnchor];
        v153 = v148;
        v312 = v148;
        v154 = v336;
        v155 = [v336 leftAnchor];
        v156 = [v152 constraintEqualToAnchor:v155 constant:80.0];
        v352[2] = v156;
        v157 = [v336 rightAnchor];
        v158 = [v153 rightAnchor];
        v159 = [v157 constraintEqualToAnchor:v158 constant:80.0];
        v352[3] = v159;
        v160 = [MEMORY[0x1E4F1C978] arrayWithObjects:v352 count:4];
        objc_msgSend(v7, "set_scopeBarConstraints:", v160);

        v161 = (void *)MEMORY[0x1E4F5B268];
        v162 = [v7 _scopeBarConstraints];
        [v161 activateConstraints:v162];

        [v337 frame];
        double MidY = CGRectGetMidY(v358);
        double v139 = v147 + -30.0 + -80.0;
        v359.origin.x = v147;
        v359.origin.y = v132;
        v359.size.width = v146;
        v359.size.height = rect;
        CGFloat v164 = CGRectGetMaxX(v359) + 30.0;
        [v336 frame];
        v165 = v322;
        objc_msgSend(v322, "setFrame:", v164, MidY, CGRectGetMaxX(v360) + -80.0 - v164, 1.0);
        [v336 addSubview:v322];

        double v132 = MidY;
        v133 = v323;
        id v5 = v325;
        v126 = v316;
        v21 = v318;
        double v109 = 1.0;
      }
      else
      {
        v154 = v336;
        v165 = v322;
      }
      double v268 = MaxY + 30.0;
      objc_msgSend(v141, "setFrame:", 80.0, v132, v139, v109);
      [v154 addSubview:v141];
      v269 = [v7 _resultsControllerViewContainer];
      v270 = [v269 superview];
      [v270 bounds];
      double v272 = v271;
      double v274 = v273;

      [v154 frame];
      double v276 = v275 - v268;
      v277 = [v7 _resultsControllerViewContainer];
      objc_msgSend(v277, "setFrame:", v272, v268, v274, v276);

      v235 = v319;
      v245 = v328;
    }
    else
    {
      v39 = [v7 presentationController];
      v40 = [v39 presentingViewController];
      v41 = [v40 view];
      int v321 = [v41 _shouldReverseLayoutDirection];

      [v338 frame];
      [v18 frame];
      objc_msgSend(v338, "sizeThatFits:", v42, v43);
      double v45 = v44;
      [v18 frame];
      double v47 = v46 + -190.0;
      v48 = (double *)MEMORY[0x1E4F1DAD8];
      v49 = [v15 searchBarContainerView];
      [v49 addSubview:v338];

      if (dyld_program_sdk_at_least())
      {
        v51 = [v7 view];
        [v51 safeAreaInsets];
        double v53 = v52;
      }
      else
      {
        double v53 = 34.5;
      }
      double v166 = v47 + -80.0;
      double v167 = *v48;
      double v329 = v48[1];
      v168 = [v7 presentationController];
      v169 = [v168 presentingViewController];
      v170 = [v169 tabBarController];

      id v326 = v5;
      if (v170)
      {
        v171 = [v7 presentationController];
        v172 = [v171 presentingViewController];
        [v172 tabBarController];
        v174 = v173 = v15;
        v175 = [v174 tabBar];

        v176 = [v175 superview];
        v177 = [v176 coordinateSpace];
        [v175 frame];
        double v179 = v178;
        double v181 = v180;
        double v183 = v182;
        double v185 = v184;
        v186 = v173;
        v187 = [v173 searchBarContainerView];
        v188 = [v187 superview];
        v189 = [v188 coordinateSpace];
        objc_msgSend(v177, "convertRect:toCoordinateSpace:", v189, v179, v181, v183, v185);
        CGFloat v191 = v190;
        CGFloat v193 = v192;
        CGFloat v195 = v194;
        CGFloat v197 = v196;

        if ([v175 _displayStyle] == 1)
        {
          v361.origin.x = v191;
          v361.origin.y = v193;
          v361.size.width = v195;
          v361.size.height = v197;
          double v53 = CGRectGetMaxY(v361) + 43.0;
        }

        v15 = v186;
        v18 = v336;
      }
      [v18 bounds];
      double v199 = v198;
      double v201 = v200;
      double v203 = v202;
      double v205 = v204;
      v206 = [v18 _screen];
      [v206 scale];
      UIRectCenteredXInRectScale(v167, v53, v166, v45, v199, v201, v203, v205, v207);
      double v209 = v208;
      double v211 = v210;
      double v213 = v212;
      double v215 = v214;

      v216 = [v15 searchBarContainerView];
      objc_msgSend(v216, "setFrame:", v209, v211, v213, v215);

      objc_msgSend(v338, "setFrame:", v167, v329, v166, v45);
      v217 = [v21 view];
      [v217 layoutIfNeeded];

      v218 = (void *)MEMORY[0x1E4F5B268];
      v219 = [v21 alignmentConstraintArrayForAxis:0];
      [v218 deactivateConstraints:v219];

      v220 = (void *)MEMORY[0x1E4F5B268];
      v221 = [v21 alignmentConstraintArrayForAxis:1];
      [v220 deactivateConstraints:v221];

      v362.origin.x = v209;
      v362.origin.y = v211;
      v362.size.width = v213;
      v362.size.height = v215;
      double v222 = CGRectGetMaxY(v362) + 34.5;
      v223 = [v21 view];
      v224 = [v223 leadingAnchor];
      v225 = [v21 view];
      v226 = [v225 superview];
      v227 = [v226 leadingAnchor];
      double v228 = 190.0;
      double v229 = 80.0;
      if (!v321) {
        double v229 = 190.0;
      }
      uint64_t v230 = [v224 constraintEqualToAnchor:v227 constant:v229];

      v231 = [v21 view];
      v232 = [v231 topAnchor];
      v233 = [v7 view];
      v234 = [v233 topAnchor];
      v126 = [v232 constraintEqualToAnchor:v234 constant:v222];

      v235 = (void *)v230;
      v236 = &qword_186B94000;

      v237 = (void *)MEMORY[0x1E4F5B268];
      v351[0] = v235;
      v351[1] = v126;
      v238 = [MEMORY[0x1E4F1C978] arrayWithObjects:v351 count:2];
      [v237 activateConstraints:v238];

      [v21 setAlignmentConstraint:v235 forAxis:0];
      [v21 setAlignmentConstraint:v126 forAxis:1];
      objc_msgSend(v21, "setUnfocusedFocusGuideOutsets:", -34.5, -40.0, -34.5, -40.0);
      if ((v321 & 1) == 0)
      {
        v239 = [v21 view];
        [v239 frame];
        double v228 = v240 + 70.0 + 190.0;
      }
      [v18 frame];
      double v242 = v241 + -270.0;
      double v243 = 1.0;
      v363.size.height = 1.0;
      v363.origin.x = v228;
      v363.origin.y = v222;
      v363.size.width = v241 + -270.0;
      double v244 = CGRectGetMaxY(v363);
      v245 = [v7 _leftDividerView];
      v324 = [v7 _rightDividerView];
      if ([v338 showsScopeBar])
      {
        v330 = v245;
        if (v337)
        {
          v317 = v126;
          v320 = v235;
          [v338 _scopeBarHeight];
          double v247 = v246;
          v248 = [v338 _scopeBar];
          objc_msgSend(v248, "sizeThatFits:", 10000.0, 10000.0);
          double v250 = v249;

          double v251 = v228 + (v242 - v250) * 0.5;
          objc_msgSend(v337, "setFrame:", v251, v222, v250, v247);
          [v337 setAlpha:1.0];
          [v18 addSubview:v337];
          v364.origin.x = v251;
          v364.origin.y = v222;
          v364.size.width = v250;
          v364.size.height = v247;
          double v244 = CGRectGetMaxY(v364);
          v252 = [v7 _scopeBarFocusContainerGuide];
          v253 = [v7 _scopeBarConstraints];

          if (v253)
          {
            v254 = (void *)MEMORY[0x1E4F5B268];
            v255 = [v7 _scopeBarConstraints];
            [v254 deactivateConstraints:v255];
          }
          v313 = [v252 topAnchor];
          v311 = [v337 topAnchor];
          v309 = [v313 constraintEqualToAnchor:v311];
          v350[0] = v309;
          v307 = [v337 bottomAnchor];
          v305 = [v252 bottomAnchor];
          v256 = [v307 constraintEqualToAnchor:v305 constant:-30.0];
          v350[1] = v256;
          v257 = [v252 leftAnchor];
          v258 = [v18 leftAnchor];
          v259 = [v257 constraintEqualToAnchor:v258 constant:190.0];
          v350[2] = v259;
          v260 = [v336 rightAnchor];
          [v252 rightAnchor];
          v261 = recta = v252;
          v262 = [v260 constraintEqualToAnchor:v261 constant:80.0];
          v350[3] = v262;
          v263 = [MEMORY[0x1E4F1C978] arrayWithObjects:v350 count:4];
          objc_msgSend(v7, "set_scopeBarConstraints:", v263);

          v18 = v336;
          v236 = &qword_186B94000;

          v264 = (void *)MEMORY[0x1E4F5B268];
          v265 = [v7 _scopeBarConstraints];
          [v264 activateConstraints:v265];

          [v337 frame];
          double v266 = CGRectGetMidY(v365);
          double v242 = v251 + -30.0 - v228;
          v366.origin.x = v251;
          v366.origin.y = v222;
          v366.size.width = v250;
          v366.size.height = v247;
          CGFloat v267 = CGRectGetMaxX(v366) + 30.0;
          [v336 frame];
          objc_msgSend(v324, "setFrame:", v267, v266, CGRectGetMaxX(v367) + -80.0 - v267, 1.0);
          [v336 addSubview:v324];

          double v222 = v266;
          id v5 = v326;
          v245 = v330;
          v235 = v320;
          v126 = v317;
          double v243 = 1.0;
        }
      }
      double v278 = v244 + 30.0;
      objc_msgSend(v245, "setFrame:", v228, v222, v242, v243);
      [v18 addSubview:v245];
      v279 = [v7 _resultsControllerViewContainer];
      v280 = [v279 superview];
      [v280 bounds];

      v281 = [v21 view];
      [v281 frame];
      double v282 = *((double *)v236 + 485);
      double v284 = v283 + v282 + 70.0;

      if (!v321) {
        double v282 = v284;
      }
      [v18 frame];
      double v286 = v285;
      v287 = [v21 view];
      [v287 frame];
      double v289 = v286 - v288 + -70.0 + -190.0 + -80.0;

      [v18 frame];
      double v291 = v290 - v278;
      v141 = [v7 _resultsControllerViewContainer];
      objc_msgSend(v141, "setFrame:", v282, v278, v289, v291);
      v133 = v324;
    }

    v292 = [v21 view];
    v293 = [v292 superview];
    v294 = [v21 view];
    [v293 bringSubviewToFront:v294];

    v295 = [v7 _resultsControllerViewContainer];
    [v295 setAlpha:0.0];

    v347[0] = MEMORY[0x1E4F143A8];
    v347[1] = 3221225472;
    v347[2] = __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke;
    v347[3] = &unk_1E52D9F70;
    id v296 = v7;
    id v348 = v296;
    v297 = (void (**)(void))_Block_copy(v347);
    v344[0] = MEMORY[0x1E4F143A8];
    v344[1] = 3221225472;
    v344[2] = __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_2;
    v344[3] = &unk_1E52DA660;
    id v345 = v296;
    id v298 = v5;
    id v346 = v298;
    v299 = (void (**)(void *, uint64_t))_Block_copy(v344);
    if ([v298 isAnimated])
    {
      [(_UISearchControllerAnimator *)v335 transitionDuration:v298];
      v12 = v332;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v332 completionCurve], v297, v299, v300, 0.0);
    }
    else
    {
      v297[2](v297);
      v299[2](v299, 1);
      v12 = v332;
    }
    v15 = v331;

    id v10 = v333;
    v6 = v334;
    v16 = v338;
    v54 = v336;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_3;
    aBlock[3] = &unk_1E52D9F98;
    id v342 = v6;
    id v34 = v5;
    id v343 = v34;
    v35 = (void (**)(void))_Block_copy(aBlock);
    v339[0] = MEMORY[0x1E4F143A8];
    v339[1] = 3221225472;
    v339[2] = __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_4;
    v339[3] = &unk_1E52DC3A0;
    id v36 = v34;
    id v340 = v36;
    v37 = (void (**)(void *, uint64_t))_Block_copy(v339);
    if ([v36 isAnimated])
    {
      [(_UISearchControllerAnimator *)v335 transitionDuration:v36];
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", [v12 completionCurve], v35, v37, v38, 0.0);
    }
    else
    {
      v35[2](v35);
      v37[2](v37, 1);
    }

    v54 = v342;
  }
}

- (void)didRelayoutSearchBarForController:(id)a3
{
  v212[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 _searchPresentationController];

  if (v6)
  {
    v7 = [v5 _systemInputViewControllerAfterUpdate:0];
    v8 = [v5 _searchPresentationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      double v181 = [MEMORY[0x1E4F28B00] currentHandler];
      [v181 handleFailureInMethod:a2 object:self file:@"_UISearchControllerATVSearchAnimatorLegacy.m" lineNumber:394 description:@"UISearchBar's presentation controller must be of type _UISearchATVPresentationController."];
    }
    id v10 = [v5 _searchPresentationController];
    v11 = [v10 searchBarContainerView];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v20 = [v5 searchBar];
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    v21 = [v10 searchBarContainerView];
    [v21 frame];
    CGFloat v23 = v22;
    double v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    v30 = [v5 presentingViewController];
    v31 = [v30 tabBarController];
    double v32 = [v31 tabBar];

    if (v25 < 0.0 && [v32 _displayStyle] == 1)
    {
      [v32 frame];
      objc_msgSend(v32, "setFrame:");
    }
    double v33 = [v5 searchBar];
    id v34 = [v33 _scopeBarContainerView];

    v213.origin.x = v23;
    v213.origin.y = v25;
    v213.size.width = v27;
    v213.size.height = v29;
    double MaxY = CGRectGetMaxY(v213);
    id v36 = [v5 view];
    LODWORD(v37) = [v36 _shouldReverseLayoutDirection];

    if ([v7 resolvedKeyboardStyle] == 1)
    {
      double v38 = [v7 view];
      [v38 frame];
      double v40 = MaxY + 34.5 + v39;

      v41 = [v7 view];
      double v42 = v41;
      if (v41) {
        [v41 transform];
      }
      else {
        memset(&v210, 0, sizeof(v210));
      }
      BOOL IsIdentity = CGAffineTransformIsIdentity(&v210);

      if (!IsIdentity) {
        double v40 = v40 + -34.5;
      }
      double v52 = [v5 _leftDividerView];
      double v53 = [v5 view];
      [v53 frame];
      double v55 = v54 + -160.0;

      double v56 = 1.0;
      objc_msgSend(v52, "setFrame:", 80.0, v40, v55, 1.0);
      v57 = [v5 view];
      [v57 addSubview:v52];

      v58 = [v5 _rightDividerView];
      [v58 removeFromSuperview];

      v59 = [v5 view];
      [v59 frame];
      double v61 = v60 + -160.0;

      v215.size.height = 1.0;
      v215.origin.x = 80.0;
      v215.origin.y = v40;
      v215.size.width = v61;
      double v62 = CGRectGetMaxY(v215);
      v63 = [v5 _leftDividerView];
      v64 = [v5 _rightDividerView];
      v65 = [v5 searchBar];
      int v66 = [v65 showsScopeBar];

      if (v66 && v34)
      {
        CGFloat rect = v64;
        double v200 = v63;
        double v202 = v52;
        double v204 = v32;
        v206 = v10;
        double v208 = v7;
        double v67 = [v5 searchBar];
        [v67 _scopeBarHeight];
        double v69 = v68;

        double v70 = [v5 searchBar];
        double v71 = [v70 _scopeBar];
        objc_msgSend(v71, "sizeThatFits:", 10000.0, 10000.0);
        double v73 = v72;

        double v74 = (v61 - v73) * 0.5 + 80.0;
        objc_msgSend(v34, "setFrame:", v74, v40, v73, v69);
        [v34 setAlpha:1.0];
        v75 = [v5 view];
        [v75 addSubview:v34];

        v216.origin.x = v74;
        v216.origin.y = v40;
        v216.size.width = v73;
        v216.size.height = v69;
        CGFloat v197 = CGRectGetMaxY(v216);
        v76 = [v5 _scopeBarFocusContainerGuide];
        v77 = [v5 _scopeBarConstraints];

        if (v77)
        {
          v78 = (void *)MEMORY[0x1E4F5B268];
          double v79 = [v5 _scopeBarConstraints];
          [v78 deactivateConstraints:v79];
        }
        CGFloat v193 = [v76 topAnchor];
        CGFloat v191 = [v34 topAnchor];
        v189 = [v193 constraintEqualToAnchor:v191];
        v212[0] = v189;
        v187 = [v34 bottomAnchor];
        double v185 = [v76 bottomAnchor];
        double v183 = [v187 constraintEqualToAnchor:v185 constant:-30.0];
        v212[1] = v183;
        double v182 = [v76 leftAnchor];
        CGFloat v80 = [v5 view];
        double v81 = [v80 leftAnchor];
        [v182 constraintEqualToAnchor:v81 constant:80.0];
        CGFloat v82 = v195 = v76;
        v212[2] = v82;
        double v83 = [v5 view];
        CGFloat v84 = [v83 rightAnchor];
        double v85 = [v76 rightAnchor];
        [v84 constraintEqualToAnchor:v85 constant:80.0];
        v87 = CGFloat v86 = v34;
        v212[3] = v87;
        double v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v212 count:4];
        objc_msgSend(v5, "set_scopeBarConstraints:", v88);

        id v34 = v86;
        double v89 = (void *)MEMORY[0x1E4F5B268];
        double v90 = [v5 _scopeBarConstraints];
        [v89 activateConstraints:v90];

        [v86 frame];
        double MidY = CGRectGetMidY(v217);
        double v61 = v74 + -30.0 + -80.0;
        v218.origin.x = v74;
        v218.origin.y = v40;
        v218.size.width = v73;
        v218.size.height = v69;
        CGFloat v92 = CGRectGetMaxX(v218) + 30.0;
        double v93 = [v5 view];
        [v93 frame];
        CGFloat v94 = CGRectGetMaxX(v219) + -80.0 - v92;

        v64 = rect;
        objc_msgSend(rect, "setFrame:", v92, MidY, v94, 1.0);
        v95 = [v5 view];
        [v95 addSubview:rect];

        id v10 = v206;
        v7 = v208;
        double v52 = v202;
        double v32 = v204;
        v63 = v200;
        double v56 = 1.0;
        double v62 = v197;
      }
      else
      {
        double v96 = [v5 _scopeBarConstraints];

        if (v96)
        {
          double v97 = (void *)MEMORY[0x1E4F5B268];
          double v98 = [v5 _scopeBarConstraints];
          [v97 deactivateConstraints:v98];
        }
        [v34 removeFromSuperview];
        double v99 = [v5 _leftDividerView];
        objc_msgSend(v99, "setFrame:", 80.0, v40, v55, 1.0);

        double v100 = [v5 _rightDividerView];
        [v100 removeFromSuperview];

        double MidY = v40;
      }
      objc_msgSend(v63, "setFrame:", 80.0, MidY, v61, v56);
      double v101 = [v5 view];
      double v102 = [v5 _leftDividerView];
      [v101 addSubview:v102];

      double v103 = [v5 _resultsControllerViewContainer];
      double v104 = [v103 superview];
      [v104 bounds];
      double v106 = v105;
      double v108 = v107;

      double v109 = [v5 view];
      [v109 frame];
      double v111 = v110 - (v62 + 30.0);

      v112 = [v5 _resultsControllerViewContainer];
      objc_msgSend(v112, "setFrame:", v106, v62 + 30.0, v108, v111);
    }
    else
    {
      if ([v7 resolvedKeyboardStyle] != 2)
      {
LABEL_43:
        double v178 = [v7 view];
        double v179 = [v178 superview];
        double v180 = [v7 view];
        [v179 bringSubviewToFront:v180];

        goto LABEL_44;
      }
      double v43 = [v7 view];
      [v43 frame];
      if (v37)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v44);
        v49 = [v5 view];
        [v49 frame];
        BOOL v50 = MaxX < CGRectGetMaxX(v214);
      }
      else
      {
        BOOL v50 = v44 > 0.0;
      }

      v220.origin.x = v23;
      v220.origin.y = v25;
      v220.size.width = v27;
      v220.size.height = v29;
      double v113 = CGRectGetMaxY(v220);
      CGFloat v114 = [v5 view];
      [v114 frame];
      double v116 = v115 + -270.0;

      v117 = &qword_186B94000;
      double v118 = 190.0;
      if (v50)
      {
        uint64_t v119 = [v7 view];
        [v119 frame];
        double v116 = v116 - (v120 + 70.0);

        if ((v37 & 1) == 0)
        {
          v121 = [v7 view];
          [v121 frame];
          double v118 = v122 + 70.0 + 190.0;
        }
      }
      double v123 = v113 + 34.5;
      if (v34
        && ([v5 searchBar],
            v124 = objc_claimAutoreleasedReturnValue(),
            int v125 = [v124 showsScopeBar],
            v124,
            v125))
      {
        BOOL v201 = v50;
        char v203 = v37;
        double v205 = v32;
        double v207 = v10;
        v126 = [v5 searchBar];
        [v126 _scopeBarHeight];
        double v128 = v127;

        v129 = [v5 searchBar];
        v130 = [v129 _scopeBar];
        objc_msgSend(v130, "sizeThatFits:", 10000.0, 10000.0);
        double v132 = v131;

        double v133 = v118 + (v116 - v132) * 0.5;
        objc_msgSend(v34, "setFrame:", v133, v123, v132, v128);
        [v34 setAlpha:1.0];
        v134 = [v5 view];
        [v134 addSubview:v34];

        double v135 = [v5 _scopeBarFocusContainerGuide];
        double v136 = [v5 _scopeBarConstraints];

        if (v136)
        {
          v137 = (void *)MEMORY[0x1E4F5B268];
          double v138 = [v5 _scopeBarConstraints];
          [v137 deactivateConstraints:v138];
        }
        double v139 = v128 + 30.0;
        double v196 = [v135 topAnchor];
        double v194 = [v34 topAnchor];
        double v192 = [v196 constraintEqualToAnchor:v194];
        v211[0] = v192;
        double v190 = [v34 bottomAnchor];
        v188 = [v135 bottomAnchor];
        v186 = [v190 constraintEqualToAnchor:v188 constant:-30.0];
        v211[1] = v186;
        double v184 = [v135 leadingAnchor];
        v140 = [v7 view];
        [v140 trailingAnchor];
        v37 = double v198 = v135;
        v141 = [v184 constraintEqualToAnchor:v37 constant:70.0];
        v211[2] = v141;
        [v5 view];
        double v142 = v209 = v7;
        double v143 = [v142 trailingAnchor];
        v144 = [v135 trailingAnchor];
        double v145 = [v143 constraintEqualToAnchor:v144];
        v211[3] = v145;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v211 count:4];
        v147 = double v146 = v34;
        objc_msgSend(v5, "set_scopeBarConstraints:", v147);

        id v34 = v146;
        v7 = v209;

        v148 = (void *)MEMORY[0x1E4F5B268];
        v149 = [v5 _scopeBarConstraints];
        [v148 activateConstraints:v149];

        [v146 frame];
        double v150 = CGRectGetMidY(v221);
        double v151 = v133 + -30.0 - v118;
        v152 = [v5 _leftDividerView];
        objc_msgSend(v152, "setFrame:", v118, v150, v151, 1.0);

        v222.origin.x = v133;
        v222.origin.y = v123;
        v222.size.width = v132;
        v222.size.height = v128;
        CGFloat v153 = CGRectGetMaxX(v222) + 30.0;
        v154 = [v5 _rightDividerView];
        objc_msgSend(v154, "setFrame:", v153, v150, v151, 1.0);

        v155 = [v5 view];
        v156 = [v5 _rightDividerView];
        [v155 addSubview:v156];

        double v32 = v205;
        id v10 = v207;
        LOBYTE(v37) = v203;
        BOOL v50 = v201;
        v117 = &qword_186B94000;
      }
      else
      {
        v157 = [v5 _scopeBarConstraints];

        if (v157)
        {
          v158 = (void *)MEMORY[0x1E4F5B268];
          v159 = [v5 _scopeBarConstraints];
          [v158 deactivateConstraints:v159];
        }
        [v34 removeFromSuperview];
        v160 = [v5 _leftDividerView];
        objc_msgSend(v160, "setFrame:", v118, v123, v116, 1.0);

        v161 = [v5 _rightDividerView];
        [v161 removeFromSuperview];

        double v139 = 30.0;
      }
      double v162 = v123 + v139;
      v163 = [v5 view];
      CGFloat v164 = [v5 _leftDividerView];
      [v163 addSubview:v164];

      v165 = [v5 _resultsControllerViewContainer];
      double v166 = [v165 superview];
      [v166 bounds];

      double v167 = [v5 view];
      [v167 frame];
      double v169 = v168;

      if (v50)
      {
        v170 = [v7 view];
        [v170 frame];
        double v172 = *((double *)v117 + 485);
        double v169 = v169 - (v171 + 70.0 + v172 + 80.0);

        if ((v37 & 1) == 0)
        {
          v173 = [v7 view];
          [v173 frame];
          double v172 = v174 + 70.0 + *((double *)v117 + 485);
        }
      }
      else
      {
        double v172 = 0.0;
      }
      v175 = [v5 view];
      [v175 frame];
      double v177 = v176 - v162;

      double v52 = [v5 _resultsControllerViewContainer];
      objc_msgSend(v52, "setFrame:", v172, v162, v169, v177);
    }

    goto LABEL_43;
  }
LABEL_44:
}

- (void)didFocusSearchBarForController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _systemInputViewControllerAfterUpdate:0];
  v6 = [v5 alignmentConstraintForAxis:0];
  v7 = [v4 searchBar];
  v8 = [v4 _suggestionView];
  v9 = [v4 _leftDividerView];
  CGFloat v114 = [v4 _rightDividerView];
  id v10 = 0;
  if ([v7 showsScopeBar])
  {
    v11 = [v7 _scopeBarContainerView];
    if (v11)
    {
      id v10 = [v7 _scopeBarContainerView];
    }
    else
    {
      id v10 = 0;
    }
  }
  if ([v5 resolvedKeyboardStyle] != 1) {
    goto LABEL_31;
  }
  double v12 = [v5 view];
  double v13 = v12;
  if (v12) {
    [v12 transform];
  }
  else {
    memset(&v172, 0, sizeof(v172));
  }
  BOOL IsIdentity = CGAffineTransformIsIdentity(&v172);

  if (!IsIdentity)
  {
    CGFloat v23 = [v4 _searchPresentationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      double v91 = [MEMORY[0x1E4F28B00] currentHandler];
      [v91 handleFailureInMethod:a2 object:self file:@"_UISearchControllerATVSearchAnimatorLegacy.m" lineNumber:661 description:@"UISearchBar's presentation controller must be of type _UISearchATVPresentationController."];
    }
    double v25 = [v5 view];
    [v25 bounds];
    double v27 = v26;

    double v28 = [v5 view];
    memset(&v171, 0, sizeof(v171));
    CGAffineTransformMakeTranslation(&v171, 0.0, v27 * -0.5 + -1.0);
    CGAffineTransform v169 = v171;
    CGAffineTransformScale(&v170, &v169, 1.0, 1.0 / v27);
    CGAffineTransform v171 = v170;
    CGAffineTransform v168 = v170;
    CGFloat v29 = [v5 view];
    CGAffineTransform v167 = v168;
    [v29 setTransform:&v167];

    [v28 setAlpha:0.0];
    double v30 = v27 + 34.5;
    if (v8)
    {
      [v8 frame];
      uint64_t v108 = v33;
      uint64_t v110 = v32;
      uint64_t v106 = v34;
    }
    else
    {
      double v31 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      uint64_t v108 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
      uint64_t v110 = *MEMORY[0x1E4F1DB28];
      uint64_t v106 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    }
    double v105 = v30 + v31;
    if (v9)
    {
      [v9 frame];
      uint64_t v101 = v71;
      uint64_t v103 = v70;
      uint64_t v99 = v72;
    }
    else
    {
      double v69 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      uint64_t v101 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
      uint64_t v103 = *MEMORY[0x1E4F1DB28];
      uint64_t v99 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    }
    double v73 = v30 + v69;
    [v10 frame];
    uint64_t v95 = v75;
    uint64_t v97 = v74;
    uint64_t v77 = v76;
    double v79 = v30 + v78;
    CGFloat v80 = [v4 _resultsControllerViewContainer];
    [v80 frame];
    double v82 = v81;
    double v84 = v83;
    uint64_t v86 = v85;
    double v88 = v87;

    v144[0] = MEMORY[0x1E4F143A8];
    v144[1] = 3221225472;
    v144[2] = __80___UISearchControllerATVSearchBarAnimatorLegacy_didFocusSearchBarForController___block_invoke;
    v144[3] = &unk_1E52EC750;
    id v145 = v5;
    id v146 = v8;
    uint64_t v151 = v110;
    double v152 = v105;
    uint64_t v153 = v108;
    uint64_t v154 = v106;
    id v147 = v9;
    uint64_t v155 = v103;
    double v156 = v73;
    uint64_t v157 = v101;
    uint64_t v158 = v99;
    id v148 = v10;
    uint64_t v159 = v97;
    double v160 = v79;
    uint64_t v161 = v77;
    uint64_t v162 = v95;
    double v163 = v82 + 0.0;
    double v164 = v30 + v84;
    uint64_t v165 = v86;
    double v166 = v88 - v30;
    id v149 = v4;
    id v150 = v28;
    id v89 = v28;
    double v90 = _Block_copy(v144);
    [(_UISearchControllerAnimator *)self transitionDuration:0];
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2048, v90, 0);
  }
  else
  {
LABEL_31:
    if ([v5 resolvedKeyboardStyle] == 2)
    {
      [v6 constant];
      double v16 = v15;
      double v17 = [v4 view];
      [v17 frame];
      double MinX = CGRectGetMinX(v173);

      if (v16 < MinX)
      {
        double v19 = [v4 view];
        char v20 = [v19 _shouldReverseLayoutDirection];

        if (v20)
        {
          double v21 = 190.0;
          double v22 = 80.0;
        }
        else
        {
          v35 = [v5 view];
          [v35 frame];
          double v22 = 190.0;
          double v21 = v36 + 70.0 + 190.0;
        }
        double v92 = v22;
        uint64_t v37 = [v4 view];
        [v37 frame];
        double v39 = v38;
        double v40 = [v5 view];
        [v40 frame];
        double v42 = v39 - v41 + -70.0 - v22;

        double v43 = [v8 superview];
        [v43 frame];
        uint64_t v109 = v45;
        uint64_t v111 = v44;
        uint64_t v107 = v46;

        [v10 frame];
        CGFloat v48 = v47;
        CGFloat v50 = v49;
        CGFloat v52 = v51;
        [v9 frame];
        uint64_t v98 = v53;
        uint64_t v100 = v54;
        double v55 = (v21 + v42) * 0.5 + -30.0 - v21;
        if (!v10) {
          double v55 = v42;
        }
        double v93 = v55;
        [v114 frame];
        uint64_t v102 = v56;
        uint64_t v104 = v57;
        v174.origin.x = (v21 + v42) * 0.5;
        v174.origin.y = v48;
        v174.size.width = v50;
        v174.size.height = v52;
        CGFloat v58 = CGRectGetMaxX(v174) + 30.0;
        v59 = [v4 _resultsControllerViewContainer];
        [v59 frame];
        uint64_t v94 = v60;
        uint64_t v96 = v61;

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __80___UISearchControllerATVSearchBarAnimatorLegacy_didFocusSearchBarForController___block_invoke_2;
        aBlock[3] = &unk_1E52EC778;
        double v113 = v9;
        double v62 = v8;
        v63 = v6;
        id v116 = v6;
        double v123 = v92;
        id v117 = v62;
        double v124 = v21;
        uint64_t v125 = v111;
        uint64_t v126 = v109;
        uint64_t v127 = v107;
        id v118 = v113;
        double v128 = v21;
        uint64_t v129 = v98;
        double v130 = v93;
        uint64_t v131 = v100;
        id v119 = v10;
        double v132 = (v21 + v42) * 0.5;
        CGFloat v133 = v48;
        CGFloat v134 = v50;
        CGFloat v135 = v52;
        id v120 = v114;
        CGFloat v136 = v58;
        uint64_t v137 = v102;
        double v138 = v21 + v42 - v58;
        uint64_t v139 = v104;
        id v121 = v4;
        double v140 = v21;
        uint64_t v141 = v94;
        double v142 = v42;
        uint64_t v143 = v96;
        id v122 = v5;
        v64 = _Block_copy(aBlock);
        v65 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 150.0, 24.0, 0.0, 0.0);
        int v66 = [UIViewPropertyAnimator alloc];
        id v67 = objc_alloc_init(MEMORY[0x1E4F39C90]);
        [v67 settlingDuration];
        double v68 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v66, "initWithDuration:timingParameters:", v65);

        v6 = v63;
        v8 = v62;
        v9 = v113;
        [(UIViewPropertyAnimator *)v68 addAnimations:v64];
        [(UIViewPropertyAnimator *)v68 startAnimation];
      }
    }
  }
}

- (void)didUnfocusSearchBarForController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _systemInputViewControllerAfterUpdate:0];
  v6 = [v5 alignmentConstraintForAxis:0];
  v7 = [v4 searchBar];
  v8 = [v4 _suggestionView];
  v9 = [v4 _leftDividerView];
  id v120 = [v4 _rightDividerView];
  id v10 = 0;
  if ([v7 showsScopeBar])
  {
    v11 = [v7 _scopeBarContainerView];
    if (v11)
    {
      id v10 = [v7 _scopeBarContainerView];
    }
    else
    {
      id v10 = 0;
    }
  }
  if ([v5 resolvedKeyboardStyle] == 1)
  {
    double v12 = [v5 view];
    double v13 = v12;
    if (v12) {
      [v12 transform];
    }
    else {
      memset(&v178, 0, sizeof(v178));
    }
    BOOL IsIdentity = CGAffineTransformIsIdentity(&v178);

    if (IsIdentity)
    {
      double v15 = [v5 view];
      double v16 = [v5 view];
      [v16 bounds];
      uint64_t v18 = v17;
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      double v24 = v23;

      double v25 = [v5 view];
      long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v177[0] = *MEMORY[0x1E4F1DAB8];
      v177[1] = v26;
      v177[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v25 setTransform:v177];

      [v15 setAlpha:1.0];
      double v27 = v24 + 34.5;
      if (v8)
      {
        [v8 frame];
        uint64_t v101 = v30;
        uint64_t v103 = v29;
        uint64_t v99 = v31;
      }
      else
      {
        double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        uint64_t v101 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
        uint64_t v103 = *MEMORY[0x1E4F1DB28];
        uint64_t v99 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
      }
      id v119 = v6;
      uint64_t v116 = v20;
      uint64_t v118 = v18;
      double v112 = v24;
      uint64_t v114 = v22;
      double v110 = v28 - v27;
      if (v9)
      {
        [v9 frame];
        uint64_t v97 = v56;
        uint64_t v98 = v55;
        uint64_t v96 = v57;
      }
      else
      {
        double v54 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        uint64_t v97 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
        uint64_t v98 = *MEMORY[0x1E4F1DB28];
        uint64_t v96 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
      }
      double v58 = v54 - v27;
      [v10 frame];
      uint64_t v105 = v60;
      uint64_t v108 = v59;
      uint64_t v62 = v61;
      double v64 = v63 - v27;
      v65 = [v4 _resultsControllerViewContainer];
      [v65 frame];
      double v67 = v66;
      double v69 = v68;
      uint64_t v71 = v70;
      double v73 = v72;

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __82___UISearchControllerATVSearchBarAnimatorLegacy_didUnfocusSearchBarForController___block_invoke;
      aBlock[3] = &unk_1E52E78B0;
      uint64_t v157 = v118;
      uint64_t v158 = v116;
      uint64_t v159 = v114;
      double v160 = v112;
      id v151 = v5;
      id v152 = v8;
      uint64_t v161 = v103;
      double v162 = v110;
      uint64_t v163 = v101;
      uint64_t v164 = v99;
      id v153 = v9;
      uint64_t v165 = v98;
      double v166 = v58;
      uint64_t v167 = v97;
      uint64_t v168 = v96;
      id v154 = v10;
      uint64_t v169 = v108;
      double v170 = v64;
      uint64_t v171 = v105;
      uint64_t v172 = v62;
      double v173 = v67 + 0.0;
      double v174 = v69 - v27;
      uint64_t v175 = v71;
      double v176 = v73 - (0.0 - v27);
      id v155 = v4;
      id v156 = v15;
      id v74 = v15;
      uint64_t v75 = _Block_copy(aBlock);
      [(_UISearchControllerAnimator *)self transitionDuration:0];
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2048, v75, 0);

LABEL_24:
      v6 = v119;
      goto LABEL_25;
    }
  }
  if ([v5 resolvedKeyboardStyle] == 2)
  {
    [v6 constant];
    double v33 = v32;
    [v4 view];
    uint64_t v34 = v119 = v6;
    [v34 frame];
    double MinX = CGRectGetMinX(v179);

    v6 = v119;
    if (v33 >= MinX)
    {
      double v36 = [v4 view];
      [v36 _shouldReverseLayoutDirection];

      uint64_t v37 = [v5 view];
      [v37 frame];
      double v117 = -v38;

      double v39 = [v8 superview];
      [v39 frame];
      uint64_t v113 = v41;
      uint64_t v115 = v40;
      uint64_t v111 = v42;

      [v10 frame];
      CGFloat v44 = v43;
      double v46 = v45;
      CGFloat v48 = v47;
      double v49 = [v4 view];
      [v49 center];
      double v51 = v50 + v46 * -0.5;

      [v9 frame];
      uint64_t v107 = v52;
      uint64_t v109 = v53;
      if (v10)
      {
        double v102 = v51 + -30.0 + -190.0;
      }
      else
      {
        uint64_t v76 = [v4 view];
        [v76 frame];
        double v102 = v77 + -270.0;
      }
      [v120 frame];
      uint64_t v104 = v78;
      uint64_t v106 = v79;
      v180.origin.x = v51;
      v180.origin.y = v44;
      v180.size.width = v46;
      v180.size.height = v48;
      CGFloat v80 = CGRectGetMaxX(v180) + 30.0;
      double v81 = [v4 view];
      [v81 frame];
      double v100 = v82 + -80.0 - v80;

      double v83 = [v4 _resultsControllerViewContainer];
      [v83 frame];
      uint64_t v85 = v84;
      uint64_t v87 = v86;

      double v88 = [v4 view];
      [v88 frame];
      uint64_t v90 = v89;

      v121[0] = MEMORY[0x1E4F143A8];
      v121[1] = 3221225472;
      v121[2] = __82___UISearchControllerATVSearchBarAnimatorLegacy_didUnfocusSearchBarForController___block_invoke_2;
      v121[3] = &unk_1E52EC778;
      id v122 = v119;
      double v129 = v117;
      id v123 = v8;
      uint64_t v130 = 0;
      uint64_t v131 = v115;
      uint64_t v132 = v113;
      uint64_t v133 = v111;
      id v124 = v9;
      uint64_t v134 = 0x4067C00000000000;
      uint64_t v135 = v107;
      double v136 = v102;
      uint64_t v137 = v109;
      id v125 = v10;
      double v138 = v51;
      CGFloat v139 = v44;
      double v140 = v46;
      CGFloat v141 = v48;
      id v126 = v120;
      CGFloat v142 = v80;
      uint64_t v143 = v104;
      double v144 = v100;
      uint64_t v145 = v106;
      id v127 = v4;
      uint64_t v146 = 0;
      uint64_t v147 = v85;
      uint64_t v148 = v90;
      uint64_t v149 = v87;
      id v128 = v5;
      double v91 = _Block_copy(v121);
      double v92 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 150.0, 24.0, 0.0, 0.0);
      double v93 = [UIViewPropertyAnimator alloc];
      id v94 = objc_alloc_init(MEMORY[0x1E4F39C90]);
      [v94 settlingDuration];
      uint64_t v95 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v93, "initWithDuration:timingParameters:", v92);

      [(UIViewPropertyAnimator *)v95 addAnimations:v91];
      [(UIViewPropertyAnimator *)v95 startAnimation];

      id v74 = v122;
      goto LABEL_24;
    }
  }
LABEL_25:
}

- (void)willFocusOffscreenViewForController:(id)a3 withHeading:(unint64_t)a4
{
  unsigned int v135 = a4;
  id v6 = a3;
  v7 = [v6 _systemInputViewControllerAfterUpdate:0];
  v8 = [v6 _searchPresentationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v101 = [MEMORY[0x1E4F28B00] currentHandler];
    [v101 handleFailureInMethod:a2 object:self file:@"_UISearchControllerATVSearchAnimatorLegacy.m" lineNumber:842 description:@"UISearchBar's presentation controller must be of type _UISearchATVPresentationController."];
  }
  id v10 = [v6 presentationController];
  v11 = [v10 presentingViewController];
  double v12 = [v11 view];
  int v13 = [v12 _shouldReverseLayoutDirection];

  double v14 = [v7 view];
  [v14 frame];
  if (v13)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v15);
    uint64_t v20 = [v7 view];
    uint64_t v21 = [v20 superview];
    [v21 bounds];
    BOOL v22 = MaxX < CGRectGetMaxX(v183);
  }
  else
  {
    BOOL v22 = v15 > 0.0;
  }

  if ([v7 resolvedKeyboardStyle] != 2 || !v22)
  {
    double v23 = [v6 presentingViewController];
    double v24 = [v23 tabBarController];
    double v25 = [v24 tabBar];

    if ([v25 _displayStyle] != 1)
    {

      double v25 = 0;
    }
    long long v26 = [v6 searchBar];
    double v27 = [v26 superview];
    double v28 = [v6 _suggestionView];
    if ([v26 showsScopeBar])
    {
      uint64_t v29 = [v26 _scopeBarContainerView];
      if (v29)
      {
        uint64_t v30 = [v26 _scopeBarContainerView];
      }
      else
      {
        uint64_t v30 = 0;
      }
    }
    else
    {
      uint64_t v30 = 0;
    }
    uint64_t v31 = [v6 _leftDividerView];
    double v138 = [v6 _rightDividerView];
    uint64_t v137 = [v6 _resultsControllerViewContainer];
    id v128 = [v7 alignmentConstraintForAxis:1];
    [v128 constant];
    id v127 = v26;
    double v121 = v32;
    if (v25)
    {
      [v25 frame];
      uint64_t v117 = v33;
      uint64_t v118 = v34;
      uint64_t v116 = v35;
    }
    else
    {
      uint64_t v117 = *MEMORY[0x1E4F1DB28];
      uint64_t v118 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
      uint64_t v116 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    }
    double v36 = [v7 view];
    [v36 frame];
    uint64_t v38 = v37;
    double v40 = v39;
    uint64_t v42 = v41;
    uint64_t v44 = v43;

    double v45 = [v31 superview];
    if (v45)
    {
      [v31 frame];
      CGFloat v47 = v46;
      double v49 = v48;
      CGFloat v129 = v51;
      CGFloat v130 = v50;
    }
    else
    {
      CGFloat v47 = *MEMORY[0x1E4F1DB28];
      double v49 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v129 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      CGFloat v130 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    }

    uint64_t v52 = [v138 superview];
    if (v52)
    {
      [v138 frame];
      uint64_t v114 = v54;
      uint64_t v115 = v53;
      double v105 = v55;
      uint64_t v113 = v56;
    }
    else
    {
      double v105 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      uint64_t v114 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
      uint64_t v115 = *MEMORY[0x1E4F1DB28];
      uint64_t v113 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    }

    [v27 frame];
    CGFloat v132 = v58;
    CGFloat v133 = v57;
    double v60 = v59;
    CGFloat rect = v61;
    if (v28)
    {
      [v28 frame];
      uint64_t v111 = v63;
      uint64_t v112 = v62;
      uint64_t v102 = v64;
      uint64_t v110 = v65;
    }
    else
    {
      uint64_t v102 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
      uint64_t v111 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
      uint64_t v112 = *MEMORY[0x1E4F1DB28];
      uint64_t v110 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    }
    uint64_t v125 = v42;
    uint64_t v126 = v38;
    uint64_t v124 = v44;
    if (v30)
    {
      [v30 frame];
      uint64_t v108 = v67;
      uint64_t v109 = v66;
      double v69 = v68;
      uint64_t v107 = v70;
    }
    else
    {
      double v69 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      uint64_t v108 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
      uint64_t v109 = *MEMORY[0x1E4F1DB28];
      uint64_t v107 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    }
    uint64_t v134 = v31;
    [v137 frame];
    double v119 = v71;
    uint64_t v120 = v72;
    double v74 = v73;
    double v76 = v75;
    double v77 = dbl_186B94F50[v25 == 0];
    CGFloat v123 = v47;
    v184.origin.x = v47;
    v184.origin.y = v49;
    v184.size.height = v129;
    v184.size.width = v130;
    double MaxY = CGRectGetMaxY(v184);
    v185.size.width = v132;
    v185.origin.x = v133;
    v185.origin.y = v60;
    v185.size.height = rect;
    double v79 = v77 + MaxY - CGRectGetMinY(v185) + 30.0;
    CGFloat v80 = v30;
    if ([v7 resolvedKeyboardStyle] == 2)
    {
      double v81 = v28;
      double v82 = v27;
      double v83 = self;
    }
    else
    {
      uint64_t v84 = [v7 view];
      uint64_t v85 = v84;
      double v81 = v28;
      double v82 = v27;
      double v83 = self;
      if (v84) {
        [v84 transform];
      }
      else {
        memset(&v182, 0, sizeof(v182));
      }
      BOOL IsIdentity = CGAffineTransformIsIdentity(&v182);

      if (IsIdentity)
      {
        uint64_t v87 = [v7 view];
        [v87 frame];
        double v79 = v79 - (v88 + 34.5);
      }
    }
    uint64_t v89 = objc_msgSend(v6, "searchResultsToHiddenKeyboardFocusGuide", v102);
    uint64_t v90 = (v60 >= 0.0) & (v135 >> 1);
    if (v90 == 1)
    {
      double v122 = v121 - v79;
      double v136 = v40 - v79;
      double v91 = -v79;
      double v92 = v60 - v79;
      double v93 = v103 - v79;
      double v94 = v49 - v79;
      double v95 = v69 - v79;
      double v104 = v105 - v79;
      double v106 = v74 - v79;
      double v96 = v76 - (0.0 - v79);
      uint64_t v97 = [v7 view];

      if (!v97) {
        goto LABEL_45;
      }
    }
    else
    {
      uint64_t v98 = v128;
      if ((v135 & 1) == 0 || v60 >= 0.0) {
        goto LABEL_46;
      }
      double v122 = v121 + v79;
      double v136 = v40 + v79;
      double v92 = v60 + v79;
      double v93 = v103 + v79;
      double v94 = v49 + v79;
      double v95 = v69 + v79;
      double v104 = v105 + v79;
      double v106 = v74 + v79;
      double v91 = 0.0;
      double v96 = v76 - (v79 + 0.0);
    }
    objc_msgSend(v89, "setEnabled:", v90, *(void *)&v104);
LABEL_45:
    [(_UISearchControllerAnimator *)v83 transitionDuration:0];
    double v100 = v99;
    v139[0] = MEMORY[0x1E4F143A8];
    v139[1] = 3221225472;
    v139[2] = __97___UISearchControllerATVSearchBarAnimatorLegacy_willFocusOffscreenViewForController_withHeading___block_invoke;
    v139[3] = &unk_1E52EC7A0;
    id v140 = v25;
    uint64_t v149 = v117;
    double v150 = v91;
    uint64_t v151 = v118;
    uint64_t v152 = v116;
    id v141 = v82;
    CGFloat v153 = v133;
    double v154 = v92;
    CGFloat v155 = v132;
    CGFloat v156 = rect;
    id v142 = v81;
    uint64_t v157 = v112;
    double v158 = v93;
    uint64_t v159 = v111;
    uint64_t v160 = v110;
    id v143 = v134;
    CGFloat v161 = v123;
    double v162 = v94;
    CGFloat v163 = v130;
    CGFloat v164 = v129;
    id v144 = v138;
    uint64_t v165 = v115;
    double v166 = v104;
    uint64_t v167 = v114;
    uint64_t v168 = v113;
    id v145 = v80;
    uint64_t v169 = v109;
    double v170 = v95;
    uint64_t v171 = v108;
    uint64_t v172 = v107;
    id v146 = v137;
    double v173 = v119 + 0.0;
    double v174 = v106;
    uint64_t v175 = v120;
    double v176 = v96;
    uint64_t v98 = v128;
    id v147 = v128;
    double v177 = v122;
    id v148 = v7;
    uint64_t v178 = v126;
    double v179 = v136;
    uint64_t v180 = v125;
    uint64_t v181 = v124;
    +[UIView animateWithDuration:v139 animations:0 completion:v100];

LABEL_46:
  }
}

- (BOOL)collapesKeyboardWhenNotFocused
{
  return 1;
}

@end