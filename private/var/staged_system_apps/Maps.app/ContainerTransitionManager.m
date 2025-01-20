@interface ContainerTransitionManager
- (BOOL)containerReadyToInsert;
- (BOOL)dequeueWaitingContainees;
- (BOOL)hasWaitingTransitionForViewController:(id)a3;
- (ContaineeProtocol)currentOrPendingViewController;
- (ContainerTransitionManager)initWithContainer:(id)a3;
- (NSArray)visibleViewControllers;
- (double)initialVelocity;
- (id)_currentCardContaineeController;
- (void)_addTheModalPresenter;
- (void)_setupConstraintsForViewController:(id)a3;
- (void)didPerformUnmanagedDismissOfViewController:(id)a3 revealingViewController:(id)a4;
- (void)presentViewController:(id)a3 isAlreadyInStack:(BOOL)a4 layout:(unint64_t)a5 animated:(BOOL)a6 preprocess:(id)a7 postprocess:(id)a8 completion:(id)a9;
- (void)presentViewController:(id)a3 layout:(unint64_t)a4 transition:(unint64_t)a5 animated:(BOOL)a6 postprocess:(id)a7 completion:(id)a8;
- (void)replaceCurrentWithViewController:(id)a3 isAlreadyInStack:(BOOL)a4 layout:(unint64_t)a5 animated:(BOOL)a6 postprocess:(id)a7;
- (void)setContainerReadyToInsert:(BOOL)a3;
- (void)setInitialVelocity:(double)a3;
- (void)setupTransitionForViewController:(id)a3;
- (void)styleDidChange;
@end

@implementation ContainerTransitionManager

- (void)presentViewController:(id)a3 layout:(unint64_t)a4 transition:(unint64_t)a5 animated:(BOOL)a6 postprocess:(id)a7 completion:(id)a8
{
  BOOL v153 = a6;
  id v12 = a3;
  id v13 = a7;
  v14 = (id *)a8;
  if (!-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    locationa = v14;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    uint64_t v27 = [WeakRetained view];

    v28 = [(ContainerTransitionManager *)self _currentCardContaineeController];
    v29 = [(NSMapTable *)self->_layoutCardsInfo objectForKey:v28];
    id v30 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v147 = v29;
    [v29 setBackgroundLayout:[v30 containeeLayout]];

    id v31 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v32 = [v31 cardForViewController:v28];

    [v32 setUserInteractionEnabled:0];
    [v28 setEditing:0];
    v33 = [v28 view];
    [v33 setUserInteractionEnabled:0];

    [v28 didResignCurrent];
    id v34 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v34 setTransitioning:1];

    v151 = v13;
    v140 = (void *)v27;
    if (v12)
    {
      v35 = [(NSMapTable *)self->_layoutCardsInfo objectForKey:v12];
      if (!v35)
      {
        v35 = objc_opt_new();
        [(NSMapTable *)self->_layoutCardsInfo setObject:v35 forKey:v12];
      }
      id v36 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v37 = [v36 cardForViewController:v12];

      [(ContainerTransitionManager *)self setupTransitionForViewController:v12];
      [v12 didBecomeCurrent];
      v38 = [v12 view];
      [v38 setUserInteractionEnabled:1];
    }
    else
    {
      v38 = objc_loadWeakRetained((id *)&self->_containerViewController);
      [v38 setCurrentViewController:0];
      v37 = 0;
      v35 = 0;
    }

    uint64_t v39 = [v147 modalPresenter];
    v145 = [v35 modalPresenter];
    v40 = [v12 cardPresentationController];
    unsigned int v143 = [v40 presentedModally];

    BOOL v41 = v39 != 0;
    v137 = v35;
    v139 = (void *)v39;
    BOOL v42 = (id)v39 == v12 && v39 != 0;
    BOOL v136 = v42;
    if ((id)v39 == v12) {
      BOOL v41 = 0;
    }
    BOOL v134 = v41;
    if (v41)
    {
      id v43 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v44 = [v43 cardForViewController:v39];

      [v44 setAlpha:0.0];
      [v44 removeFromSuperview];
      long long v45 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v217[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v217[1] = v45;
      v217[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [v44 setTransform:v217];
      [v139 removeFromParentViewController];
    }
    v152 = v12;
    if (v143)
    {
      v46 = [v35 modalPresenter];
      BOOL v133 = v46 != 0;
    }
    else
    {
      BOOL v133 = 0;
    }
    id v47 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v47 setPreventEdgeInsetsUpdate:1];

    id v48 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v48 setLayoutIfSupported:a4 animated:0];

    id v49 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v49 setPreventEdgeInsetsUpdate:0];

    id v50 = objc_loadWeakRetained((id *)&self->_containerViewController);
    uint64_t v51 = [v50 cardForViewController:v145];

    [v37 bounds];
    double v53 = v52;
    [v32 bounds];
    double v55 = v54;
    v130 = +[AnimationSlideParameters defaultParameters];
    v56 = +[UIApplication sharedApplication];
    BOOL v57 = [v56 userInterfaceLayoutDirection] == (id)1;

    id v58 = objc_loadWeakRetained((id *)&self->_containerViewController);
    unsigned int v59 = [v58 stackOnOppositeSide];

    int v60 = v57 ^ v59;
    double initialVelocity = self->_initialVelocity;
    BOOL v63 = a5 == 4 || (a5 & 0xFFFFFFFFFFFFFFFDLL) == 1;
    v64 = "GEOAPSessionSpecificDataSource" + 16;
    v135 = (void *)v51;
    BOOL v131 = v63;
    switch(a5)
    {
      case 0uLL:
        double v65 = 1.0;
        if (v53 + v55 != 0.0) {
          double v65 = v53 + v55;
        }
        CGAffineTransformMakeTranslation(&v216, 0.0, v65);
        CGAffineTransform v215 = v216;
        [v37 setTransform:&v215];
        unint64_t v66 = a5;
        if (v55 <= v53 + 30.0)
        {
          v67 = v130;
        }
        else
        {
          v67 = +[AnimationSlideParameters presentSmallerParameters];
        }
        [v37 showShadow:0 animated:0];
        v78 = v32;
        [v32 showShadow:1 animated:1];
        goto LABEL_77;
      case 1uLL:
        v78 = v32;
        [v140 insertSubview:v37 belowSubview:v32];
        if (v51)
        {
          v212[0] = _NSConcreteStackBlock;
          v212[1] = 3221225472;
          v212[2] = sub_1009AB46C;
          v212[3] = &unk_1012E5D08;
          v212[4] = self;
          +[UIView performWithoutAnimation:v212];
        }
        unint64_t v66 = a5;
        if (v136) {
          goto LABEL_69;
        }
        double v79 = vabdd_f64(v53, v55);
        if (initialVelocity != 0.0) {
          double v79 = v53;
        }
        double v80 = 1.0;
        if (v79 != 0.0) {
          double v80 = v79;
        }
        CGAffineTransformMakeTranslation(&v211, 0.0, v80);
        CGAffineTransform v210 = v211;
        v81 = &v210;
LABEL_68:
        [v37 setTransform:v81];
LABEL_69:
        [v37 showShadow:0 animated:1];
        v84 = v78;
        uint64_t v85 = 0;
        uint64_t v86 = 0;
LABEL_70:
        [v84 showShadow:v85 animated:v86];
        v67 = v130;
LABEL_77:
        v64 = "ificDataSource";
LABEL_78:
        v202 = _NSConcreteStackBlock;
        uint64_t v203 = *((void *)v64 + 438);
        uint64_t v98 = v203;
        v204 = sub_1009AB474;
        v205 = &unk_1012E5D58;
        id v99 = v37;
        id v206 = v99;
        v207 = self;
        v100 = objc_retainBlock(&v202);
        v193[0] = _NSConcreteStackBlock;
        v193[1] = v98;
        v193[2] = sub_1009AB4D8;
        v193[3] = &unk_101312D78;
        unint64_t v101 = v66;
        unint64_t v197 = v66;
        id v102 = v78;
        id v194 = v102;
        id v142 = v67;
        id v195 = v142;
        double v198 = v55;
        double v199 = v53;
        char v200 = v143;
        id v103 = v28;
        id v196 = v103;
        char v201 = v60;
        v104 = objc_retainBlock(v193);
        v105 = dispatch_group_create();
        dispatch_group_enter(v105);
        v187[0] = _NSConcreteStackBlock;
        v187[1] = v98;
        v187[2] = sub_1009AB638;
        v187[3] = &unk_101312DA0;
        id v188 = v152;
        v189 = self;
        unint64_t v192 = a4;
        id v155 = v99;
        id v190 = v155;
        v106 = v105;
        v191 = v106;
        v107 = objc_retainBlock(v187);
        dispatch_group_enter(v106);
        v174[0] = _NSConcreteStackBlock;
        v174[1] = v98;
        v174[2] = sub_1009AB6D8;
        v174[3] = &unk_101312DC8;
        char v182 = v143;
        BOOL v183 = v131;
        id v132 = v145;
        id v175 = v132;
        id v144 = v137;
        id v176 = v144;
        id v146 = v103;
        id v177 = v146;
        id v138 = v102;
        id v178 = v138;
        v179 = self;
        BOOL v184 = v136;
        BOOL v185 = v134;
        id v97 = v147;
        id v180 = v97;
        BOOL v186 = initialVelocity != 0.0;
        v108 = v106;
        v181 = v108;
        v109 = objc_retainBlock(v174);
        v169[0] = _NSConcreteStackBlock;
        v169[1] = v98;
        v169[2] = sub_1009AB970;
        v169[3] = &unk_101312DF0;
        BOOL v172 = v133;
        v169[4] = self;
        id v170 = v151;
        BOOL v173 = v153;
        v171 = locationa;
        block[0] = _NSConcreteStackBlock;
        block[1] = v98;
        block[2] = sub_1009ABB34;
        block[3] = &unk_1012E9AD0;
        BOOL v168 = v153;
        v167 = objc_retainBlock(v169);
        v110 = v167;
        dispatch_group_notify(v108, (dispatch_queue_t)&_dispatch_main_q, block);
        if (v153)
        {
          if (v101 <= 1)
          {
            v111 = v142;
            [v142 parametersIn];
            double v113 = v112;
            [v142 parametersIn];
            double v115 = v114;
            [v142 parametersIn];
            double v117 = v116;
            [v142 parametersIn];
            double v119 = v118;
            v164[0] = _NSConcreteStackBlock;
            v164[1] = v98;
            v164[2] = sub_1009ABB50;
            v164[3] = &unk_1012E5F78;
            v164[4] = self;
            v165 = v100;
            +[UIView _animateUsingSpringWithDuration:0 delay:v164 options:v107 mass:v113 stiffness:0.0 damping:v115 initialVelocity:v117 animations:v119 completion:0.0];
            [v142 parametersOut];
            double v121 = v120;
            [v142 parametersOut];
            double v123 = v122;
            [v142 parametersOut];
            double v125 = v124;
            [v142 parametersOut];
            double v127 = v126;
            double v128 = self->_initialVelocity;
            v162[0] = _NSConcreteStackBlock;
            v162[1] = v98;
            v162[2] = sub_1009ABBF0;
            v162[3] = &unk_1012E5F78;
            double v129 = v128 / v55;
            v162[4] = self;
            v163 = v104;
            +[UIView _animateUsingSpringWithDuration:0 delay:v162 options:v109 mass:v121 stiffness:0.0 damping:v123 initialVelocity:v125 animations:v127 completion:v129];

            goto LABEL_84;
          }
          v159[0] = _NSConcreteStackBlock;
          v159[1] = v98;
          v159[2] = sub_1009ABC28;
          v159[3] = &unk_101312E18;
          v160 = v100;
          v161 = v104;
          v159[4] = self;
          v156[0] = _NSConcreteStackBlock;
          v156[1] = v98;
          v156[2] = sub_1009ABCA8;
          v156[3] = &unk_1012E8D90;
          v157 = v109;
          v158 = v107;
          +[UIView animateWithDuration:v159 animations:v156 completion:0.25];
        }
        else
        {
          ((void (*)(void *))v104[2])(v104);
          ((void (*)(void ***))v100[2])(v100);
          ((void (*)(void *, uint64_t))v107[2])(v107, 1);
          ((void (*)(void *, uint64_t))v109[2])(v109, 1);
          v110[2](v110);
        }
        v111 = v142;
LABEL_84:

        id v13 = v151;
        id v12 = v152;
        v14 = locationa;
        id v15 = v140;
        v17 = v146;
        break;
      case 2uLL:
        unint64_t v66 = a5;
        [v37 frame];
        double v83 = -v82;
        if (v60) {
          double v83 = v82;
        }
        CGAffineTransformMakeTranslation(&v214, v83, 0.0);
        CGAffineTransform v213 = v214;
        [v37 setTransform:&v213];
        [v37 showShadow:0 animated:0];
        v78 = v32;
        v84 = v32;
        uint64_t v85 = 1;
        uint64_t v86 = 1;
        goto LABEL_70;
      case 3uLL:
        unint64_t v66 = a5;
        v78 = v32;
        [v140 insertSubview:v37 belowSubview:v32];
        if (v51) {
          [v140 insertSubview:v51 belowSubview:v37];
        }
        CGAffineTransformMakeScale(&v209, 0.970000029, 0.970000029);
        CGAffineTransform v208 = v209;
        v81 = &v208;
        goto LABEL_68;
      default:
        unint64_t v66 = a5;
        v78 = v32;
        v67 = v130;
        goto LABEL_78;
    }
    goto LABEL_85;
  }
  id v15 = [(ContainerTransitionManager *)self _currentCardContaineeController];
  [v15 setEditing:0];
  [v15 didResignCurrent];
  id v16 = v12;
  v17 = v16;
  if (!v16)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v17 = [v18 rootPresentingViewController];
  }
  location = (id *)&self->_containerViewController;
  id v19 = objc_loadWeakRetained((id *)&self->_containerViewController);
  [v19 setCurrentViewController:v16];

  uint64_t v20 = [v17 presentingViewController];
  if (!v20)
  {
    if (a5 > 4) {
      goto LABEL_47;
    }
LABEL_40:
    if (((1 << a5) & 0x1A) == 0) {
      goto LABEL_47;
    }
    goto LABEL_41;
  }
  v21 = (void *)v20;
  id v22 = v15;
  v23 = [v17 presentedViewController];

  if (!v23)
  {
    id v15 = v22;
    if (a5 > 4) {
      goto LABEL_47;
    }
    goto LABEL_40;
  }
  id v15 = v22;
  if (a5 > 4 || ((1 << a5) & 0x1A) == 0)
  {
    v24 = sub_1000BF6B8();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      id v25 = objc_loadWeakRetained(location);
      *(_DWORD *)buf = 138412802;
      v229 = self;
      __int16 v230 = 2112;
      id v231 = v25;
      __int16 v232 = 2112;
      v233 = v17;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "%@ for %@: view controller %@ does not have a dismiss transition style but appears to require a dismiss.", buf, 0x20u);

      id v15 = v22;
    }
  }
LABEL_41:
  v68 = [v17 presentedViewController];

  if (v68)
  {
    if (a4 != 5)
    {
      v69 = [v16 cardPresentationController];
      [v69 wantsLayout:a4 animated:0];
    }
    v70 = [v15 cardPresentationController];
    [v15 setModalTransitionStyle:[v70 modalDismissStyle]];

    v71 = v15;
    v72 = [v15 cardPresentationController];
    unsigned int v73 = [v72 shouldHidePreviousCards];

    if (v73)
    {
      id v74 = objc_loadWeakRetained(location);
      [v74 setContaineesHidden:0];
    }
    v223[0] = _NSConcreteStackBlock;
    v223[1] = 3221225472;
    v223[2] = sub_1009AB16C;
    v223[3] = &unk_101312D50;
    v223[4] = self;
    id v224 = v16;
    id v15 = v71;
    id v225 = v71;
    id v226 = v13;
    v227 = v14;
    [v17 dismissViewControllerAnimated:v153 completion:v223];
  }
LABEL_47:
  if (v16)
  {
    v75 = [v16 presentingViewController];

    if (!v75)
    {
      v141 = v15;
      uint64_t v148 = [(NSMapTable *)self->_layoutCardsInfo objectForKey:v16];
      if (!v148)
      {
        uint64_t v148 = objc_opt_new();
        -[NSMapTable setObject:forKey:](self->_layoutCardsInfo, "setObject:forKey:");
      }
      v76 = [v16 cardPresentationController];
      unsigned int v77 = [v76 wantsFullscreen];

      if (v77)
      {
        [v16 setModalPresentationStyle:0];
      }
      else
      {
        v87 = [v16 cardPresentationController];
        id v88 = objc_loadWeakRetained(location);
        [v87 configureForSheetPresentationWithContainer:v88 layout:a4];
      }
      v89 = v14;
      v90 = [v16 cardPresentationController];
      unsigned int v91 = [v90 shouldHidePreviousCards];

      if (v91)
      {
        id v92 = objc_loadWeakRetained(location);
        [v92 setContaineesHidden:1];
      }
      id v93 = objc_loadWeakRetained(location);
      v94 = [v93 view];
      v95 = [v94 window];
      [v95 endEditing:1];

      id v96 = objc_loadWeakRetained(location);
      v218[0] = _NSConcreteStackBlock;
      v218[1] = 3221225472;
      v218[2] = sub_1009AB26C;
      v218[3] = &unk_101312D50;
      v218[4] = self;
      id v219 = v16;
      id v15 = v141;
      id v220 = v15;
      id v221 = v13;
      v14 = v89;
      v222 = v89;
      [v96 _maps_topMostPresentViewController:v219 animated:v153 completion:v218];

      id v97 = (id)v148;
LABEL_85:
    }
  }
}

- (ContainerTransitionManager)initWithContainer:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ContainerTransitionManager;
  v5 = [(ContainerTransitionManager *)&v11 init];
  if (v5)
  {
    if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0)
    {
      uint64_t v6 = +[NSMapTable strongToStrongObjectsMapTable];
      layoutCardsInfo = v5->_layoutCardsInfo;
      v5->_layoutCardsInfo = (NSMapTable *)v6;
    }
    v5->_containerReadyToInsert = 0;
    uint64_t v8 = +[NSMutableArray array];
    waitingTransitions = v5->_waitingTransitions;
    v5->_waitingTransitions = (NSMutableArray *)v8;

    objc_storeWeak((id *)&v5->_containerViewController, v4);
  }

  return v5;
}

- (void)presentViewController:(id)a3 isAlreadyInStack:(BOOL)a4 layout:(unint64_t)a5 animated:(BOOL)a6 preprocess:(id)a7 postprocess:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  BOOL v13 = a4;
  id v32 = a3;
  id v15 = (void (**)(void))a7;
  id v16 = a8;
  id v17 = a9;
  if (!self->_containerReadyToInsert || self->_viewcontrollerTransitioning) {
    goto LABEL_3;
  }
  unint64_t v31 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v20 = [WeakRetained viewIfLoaded];
  if (!v20)
  {

    goto LABEL_3;
  }
  v21 = (void *)v20;
  location = (id *)&self->_containerViewController;
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    id v29 = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v22 = [v29 topMostPresentedViewController];
    v23 = [v22 transitionCoordinator];

    if (!v23) {
      goto LABEL_13;
    }
LABEL_3:
    id v18 = objc_alloc_init(WaitingTransition);
    [(WaitingTransition *)v18 setViewController:v32];
    [(WaitingTransition *)v18 setAnimated:v11];
    [(WaitingTransition *)v18 setCompletion:v17];
    [(WaitingTransition *)v18 setIsAlreadyInStack:v13];
    [(NSMutableArray *)self->_waitingTransitions addObject:v18];
    goto LABEL_4;
  }

LABEL_13:
  if (v15) {
    v15[2](v15);
  }
  self->_viewcontrollerTransitioning = 1;
  [v32 loadViewIfNeeded];
  id v18 = [(ContainerTransitionManager *)self _currentCardContaineeController];
  id v24 = objc_loadWeakRetained(location);
  id v25 = [v24 transitionFrom:v18 to:v32];

  id v26 = objc_loadWeakRetained(location);
  [v26 willResignContainee:v18 animated:v11];

  [(WaitingTransition *)v18 willResignCurrent:v11];
  id v27 = objc_loadWeakRetained(location);
  [v27 willPresentContainee:v32 animated:v11];

  [v32 willBecomeCurrent:v11];
  [(ContainerTransitionManager *)self presentViewController:v32 layout:v31 transition:v25 animated:v11 postprocess:v16 completion:v17];
  id v28 = objc_loadWeakRetained(location);
  [v28 transitionAlongsideContainee:v32 animated:v11];

LABEL_4:
}

- (void)setContainerReadyToInsert:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_1000BF6B8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v7 = @"NO";
    if (v3) {
      v7 = @"YES";
    }
    uint64_t v8 = v7;
    int v9 = 138412802;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = WeakRetained;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ for %@ setContainerReadyToInsert: %@", (uint8_t *)&v9, 0x20u);
  }
  self->_containerReadyToInsert = v3;
}

- (BOOL)containerReadyToInsert
{
  return self->_containerReadyToInsert;
}

- (BOOL)dequeueWaitingContainees
{
  if (!self->_containerReadyToInsert) {
    return 0;
  }
  if ([(NSMutableArray *)self->_waitingTransitions count])
  {
    BOOL v3 = [(NSMutableArray *)self->_waitingTransitions objectAtIndexedSubscript:0];
    [(NSMutableArray *)self->_waitingTransitions removeObjectAtIndex:0];
    if (![v3 switchContext]) {
      goto LABEL_6;
    }
    uint64_t v4 = [v3 oldViewController];
    if (!v4) {
      goto LABEL_6;
    }
    v5 = (void *)v4;
    uint64_t v6 = [v3 oldViewController];
    v7 = [(ContainerTransitionManager *)self _currentCardContaineeController];

    if (v6 == v7)
    {
      id WeakRetained = [v3 viewController];
      id v13 = [v3 isAlreadyInStack];
      id v14 = [v3 layout];
      int v9 = [v3 postProcess];
      [(ContainerTransitionManager *)self replaceCurrentWithViewController:WeakRetained isAlreadyInStack:v13 layout:v14 animated:1 postprocess:v9];
    }
    else
    {
LABEL_6:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      int v9 = [v3 viewController];
      id v10 = [v3 animated];
      __int16 v11 = [v3 completion];
      [WeakRetained presentController:v9 animated:v10 completion:v11];
    }
    return 0;
  }
  return 1;
}

- (NSArray)visibleViewControllers
{
  BOOL v3 = [(ContainerTransitionManager *)self _currentCardContaineeController];
  uint64_t v4 = [(NSMapTable *)self->_layoutCardsInfo objectForKey:v3];
  v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 modalPresenter];

    if (v6)
    {
      v11[0] = v3;
      v7 = [v5 modalPresenter];
      v11[1] = v7;
      uint64_t v8 = +[NSArray arrayWithObjects:v11 count:2];
    }
    else
    {
      id v10 = v3;
      uint64_t v8 = +[NSArray arrayWithObjects:&v10 count:1];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (NSArray *)v8;
}

- (id)_currentCardContaineeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  BOOL v3 = [WeakRetained currentViewControllerWithPresentationStyle:0];

  return v3;
}

- (void)styleDidChange
{
  if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0)
  {
    id v5 = [(ContainerTransitionManager *)self _currentCardContaineeController];
    [(ContainerTransitionManager *)self _setupConstraintsForViewController:v5];
    BOOL v3 = [(NSMapTable *)self->_layoutCardsInfo objectForKey:v5];
    uint64_t v4 = [v3 modalPresenter];
    if (v4) {
      [(ContainerTransitionManager *)self _setupConstraintsForViewController:v4];
    }
  }
}

- (ContaineeProtocol)currentOrPendingViewController
{
  BOOL v3 = [(NSMutableArray *)self->_waitingTransitions lastObject];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 viewController];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v5 = [WeakRetained currentViewController];
  }

  return (ContaineeProtocol *)v5;
}

- (BOOL)hasWaitingTransitionForViewController:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_waitingTransitions;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 viewController:v13];
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v10 == v4)
        {
          unsigned __int8 v11 = [v9 isAlreadyInStack];

          if ((v11 & 1) == 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v6;
}

- (void)setupTransitionForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ContainerTransitionManager *)self _currentCardContaineeController];
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v8 = [WeakRetained cardForViewController:v5];

  BOOL v41 = self;
  id v43 = (void *)v5;
  int v9 = [(NSMapTable *)self->_layoutCardsInfo objectForKey:v5];
  id v10 = [v9 modalPresenter];
  if (v10)
  {
    id v11 = [v9 modalPresenter];
    BOOL v12 = v11 == v4;
  }
  else
  {
    BOOL v12 = 0;
  }
  BOOL v42 = v9;

  id v13 = objc_loadWeakRetained((id *)p_containerViewController);
  long long v14 = [v13 containerView];

  id v15 = objc_loadWeakRetained((id *)p_containerViewController);
  long long v16 = [v15 cardForViewController:v4];

  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setUserInteractionEnabled:0];
  id v17 = objc_loadWeakRetained((id *)p_containerViewController);
  [v17 addChildViewController:v4];

  id v18 = v8;
  v38 = v18;
  if (!v18)
  {
    id v19 = objc_loadWeakRetained((id *)p_containerViewController);
    id v18 = [v19 containerView];
  }
  id v20 = objc_loadWeakRetained((id *)p_containerViewController);
  v21 = [v20 view];
  v37 = v18;
  [v21 insertSubview:v16 aboveSubview:v18];

  if (!v12)
  {
    id v22 = objc_loadWeakRetained((id *)p_containerViewController);
    [v4 willChangeContainerStyle:[v22 containerStyle]];
  }
  v23 = [v16 leadingAnchor];
  id v24 = [v14 leadingAnchor];
  id v25 = [v23 constraintEqualToAnchor:v24];
  v44[0] = v25;
  uint64_t v39 = v16;
  id v26 = [v16 trailingAnchor];
  v40 = v14;
  id v27 = [v14 trailingAnchor];
  [v26 constraintEqualToAnchor:v27];
  v29 = id v28 = v4;
  v44[1] = v29;
  id v30 = +[NSArray arrayWithObjects:v44 count:2];
  id v31 = [v30 mutableCopy];

  [(ContainerTransitionManager *)v41 _setupConstraintsForViewController:v28];
  id v32 = objc_loadWeakRetained((id *)p_containerViewController);
  [v32 setCurrentViewController:v28];

  id v33 = objc_loadWeakRetained((id *)p_containerViewController);
  id v34 = [v33 containerStyle];

  if (v34 != (id)6)
  {
    v35 = [v42 topToTopContentConstraint];
    LODWORD(v36) = 1148813312;
    [v35 setPriority:v36];
  }
  +[NSLayoutConstraint activateConstraints:v31];
}

- (void)_addTheModalPresenter
{
  BOOL v3 = [(ContainerTransitionManager *)self _currentCardContaineeController];
  id v4 = [(NSMapTable *)self->_layoutCardsInfo objectForKey:v3];
  uint64_t v5 = [v4 modalPresenter];
  if (v5)
  {
    id v30 = [(NSMapTable *)self->_layoutCardsInfo objectForKey:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    uint64_t v7 = [WeakRetained containerView];

    id v8 = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v29 = [v8 cardForViewController:v3];

    id v9 = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v10 = [v9 cardForViewController:v5];

    [v10 setAlpha:1.0];
    long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v32[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v32[1] = v11;
    v32[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v10 setTransform:v32];
    id v12 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v10 setLayoutStyle:[v12 containerStyle]];

    id v13 = [v5 cardPresentationController];
    [v13 updateHeightForLayout:[v30 backgroundLayout]];

    id v14 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v14 addChildViewController:v5];

    id v15 = objc_loadWeakRetained((id *)&self->_containerViewController);
    long long v16 = [v15 view];
    [v16 insertSubview:v10 belowSubview:v29];

    id v27 = [v10 leadingAnchor];
    id v28 = v7;
    id v17 = [v7 leadingAnchor];
    id v18 = [v27 constraintEqualToAnchor:v17];
    v33[0] = v18;
    id v19 = [v10 trailingAnchor];
    [v7 trailingAnchor];
    v21 = id v20 = v4;
    [v19 constraintEqualToAnchor:v21];
    id v22 = v31 = v3;
    v33[1] = v22;
    +[NSArray arrayWithObjects:v33 count:2];
    id v24 = v23 = self;
    +[NSLayoutConstraint activateConstraints:v24];

    id v4 = v20;
    [(ContainerTransitionManager *)v23 _setupConstraintsForViewController:v5];
    id v25 = [v30 topToTopContentConstraint];
    LODWORD(v26) = 1148813312;
    [v25 setPriority:v26];

    BOOL v3 = v31;
  }
}

- (void)_setupConstraintsForViewController:(id)a3
{
  p_containerViewController = &self->_containerViewController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  uint64_t v7 = [WeakRetained containerView];

  id v8 = objc_loadWeakRetained((id *)p_containerViewController);
  id v9 = [v8 cardForViewController:v5];

  id v10 = objc_loadWeakRetained((id *)p_containerViewController);
  [v9 setLayoutStyle:[v10 containerStyle]];

  long long v11 = [(NSMapTable *)self->_layoutCardsInfo objectForKey:v5];

  if (v9)
  {
    id v12 = [v9 superview];
    if (!v12 || !v7)
    {
LABEL_12:

      goto LABEL_13;
    }
    id v13 = [v9 window];
    id v14 = [v7 window];

    if (v13 == v14 && v11)
    {
      id v15 = [v11 topToTopContentConstraint];

      if (v15)
      {
        long long v16 = [v11 topToTopContentConstraint];
        v32[0] = v16;
        id v17 = [v11 bottomToBottomContentConstraint];
        v32[1] = v17;
        id v18 = +[NSArray arrayWithObjects:v32 count:2];
        +[NSLayoutConstraint deactivateConstraints:v18];
      }
      id v19 = objc_loadWeakRetained((id *)p_containerViewController);
      id v20 = [v19 containerStyle];

      v21 = [v7 topAnchor];
      id v22 = [v9 topAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      [v11 setTopToTopContentConstraint:v23];

      if (v20 == (id)6)
      {
        id v24 = [v9 bottomAnchor];
        id v25 = [v7 bottomAnchor];
        [v24 constraintLessThanOrEqualToAnchor:v25];
      }
      else
      {
        double v26 = [v11 topToTopContentConstraint];
        LODWORD(v27) = 1148829696;
        [v26 setPriority:v27];

        id v24 = [v9 bottomAnchor];
        id v25 = [v7 bottomAnchor];
        [v24 constraintEqualToAnchor:v25];
      id v28 = };
      [v11 setBottomToBottomContentConstraint:v28];

      id v12 = [v11 topToTopContentConstraint];
      v31[0] = v12;
      id v29 = [v11 bottomToBottomContentConstraint];
      v31[1] = v29;
      id v30 = +[NSArray arrayWithObjects:v31 count:2];
      +[NSLayoutConstraint activateConstraints:v30];

      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)replaceCurrentWithViewController:(id)a3 isAlreadyInStack:(BOOL)a4 layout:(unint64_t)a5 animated:(BOOL)a6 postprocess:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v24 = a3;
  id v12 = a7;
  if (!self->_containerReadyToInsert || self->_viewcontrollerTransitioning) {
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v16 = [WeakRetained viewIfLoaded];
  if (!v16)
  {

    goto LABEL_3;
  }
  id v17 = (void *)v16;
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    id v23 = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v18 = [v23 topMostPresentedViewController];
    id v19 = [v18 transitionCoordinator];

    if (!v19) {
      goto LABEL_13;
    }
LABEL_3:
    id v13 = objc_alloc_init(WaitingTransition);
    [(WaitingTransition *)v13 setViewController:v24];
    [(WaitingTransition *)v13 setAnimated:v8];
    [(WaitingTransition *)v13 setSwitchContext:1];
    id v14 = [(ContainerTransitionManager *)self _currentCardContaineeController];
    [(WaitingTransition *)v13 setOldViewController:v14];

    [(WaitingTransition *)v13 setLayout:a5];
    [(WaitingTransition *)v13 setPostProcess:v12];
    [(WaitingTransition *)v13 setIsAlreadyInStack:v10];
    [(NSMutableArray *)self->_waitingTransitions addObject:v13];
    goto LABEL_4;
  }

LABEL_13:
  self->_viewcontrollerTransitioning = 1;
  id v13 = [(ContainerTransitionManager *)self _currentCardContaineeController];
  id v20 = objc_loadWeakRetained((id *)&self->_containerViewController);
  [v20 willResignContainee:v13 animated:v8];

  [(WaitingTransition *)v13 willResignCurrent:v8];
  id v21 = objc_loadWeakRetained((id *)&self->_containerViewController);
  [v21 willPresentContainee:v24 animated:v8];

  [v24 willBecomeCurrent:v8];
  [(ContainerTransitionManager *)self presentViewController:v24 layout:a5 transition:4 animated:v8 postprocess:v12 completion:0];
  id v22 = objc_loadWeakRetained((id *)&self->_containerViewController);
  [v22 transitionAlongsideContainee:v24 animated:v8];

LABEL_4:
}

- (void)didPerformUnmanagedDismissOfViewController:(id)a3 revealingViewController:(id)a4
{
  p_containerViewController = &self->_containerViewController;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  [WeakRetained willResignContainee:v8 animated:1];

  [v8 willResignCurrent:1];
  id v10 = objc_loadWeakRetained((id *)p_containerViewController);
  [v10 willPresentContainee:v7 animated:1];

  [v7 willBecomeCurrent:1];
  [v8 setEditing:0];
  long long v11 = [v7 view];
  [v11 setUserInteractionEnabled:1];

  id v12 = objc_loadWeakRetained((id *)p_containerViewController);
  [v12 didResignContainee:v8 finished:1];

  [v8 didResignCurrent];
  id v13 = objc_loadWeakRetained((id *)p_containerViewController);
  [v13 didPresentContainee:v7 finished:1];

  [v7 didBecomeCurrent];
  [(NSMapTable *)self->_layoutCardsInfo removeObjectForKey:v8];

  id v14 = objc_loadWeakRetained((id *)p_containerViewController);
  [v14 setCurrentViewController:v7];

  [(ContainerTransitionManager *)self dequeueWaitingContainees];
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (void)setInitialVelocity:(double)a3
{
  self->_double initialVelocity = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_waitingTransitions, 0);

  objc_storeStrong((id *)&self->_layoutCardsInfo, 0);
}

@end