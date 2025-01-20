@interface BCCardStackTransitionAnimator
+ (BOOL)_isSlowModeEnabled;
- (BCCardStackTransitionAnimator)initWithType:(int64_t)a3 allowsCardExpansion:(BOOL)a4;
- (BOOL)_prefersCrossfade;
- (BOOL)prefersCrossfade;
- (CGAffineTransform)_translationForTitleLabel:(SEL)a3 cardSuperview:(id)a4 cardCurrentFrame:(id)a5 cardTargetFrame:(CGRect)a6;
- (CGVector)_dismissSpringVelocityWithFromFrame:(CGRect)a3 toFrame:(CGRect)a4;
- (NSArray)cardMoveItems;
- (NSArray)cardSlideItems;
- (NSArray)coverFadeItems;
- (NSArray)coverMoveItems;
- (NSDictionary)coverControllers;
- (NSMutableArray)viewsToBeCleanedUp;
- (double)_adjustDuration:(double)a3;
- (double)_debugDragCoefficient;
- (double)_insetPercentageForAbsoluteCoverRect:(CGRect)a3;
- (double)transitionDuration:(id)a3;
- (double)velocityForPop;
- (id)_addCoverForCoverMove:(id)a3 inView:(id)a4 isDismiss:(BOOL)a5 fromFrame:(CGRect *)a6 toFrame:(CGRect *)a7;
- (id)_addCoverForCoverSource:(id)a3 inView:(id)a4;
- (id)_adjustSpring:(id)a3;
- (id)_cardSlideDownSpringWithVelocity:(CGVector)a3;
- (id)_coverScaleSpring;
- (id)_coverSpring;
- (id)_coverSpringForDismissWithVelocity:(CGVector)a3 isCompact:(BOOL)a4;
- (id)_customCurve;
- (int64_t)animationType;
- (void)_animatePopByCoverTransitioning:(id)a3;
- (void)_animatePopByCrossfading:(id)a3;
- (void)_animatePopBySliding:(id)a3;
- (void)_animatePushByCoverTransitioning:(id)a3;
- (void)_animatePushByCrossfading:(id)a3;
- (void)_animatePushBySliding:(id)a3;
- (void)_clearTranslationForView:(id)a3;
- (void)_prepareCardForCardMove:(id)a3 isDismiss:(BOOL)a4 fromFrame:(CGRect *)a5 toFrame:(CGRect *)a6;
- (void)addAnimations:(id)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)setAnimationType:(int64_t)a3;
- (void)setCardMoveItems:(id)a3;
- (void)setCardSlideItems:(id)a3;
- (void)setCoverControllers:(id)a3;
- (void)setCoverFadeItems:(id)a3;
- (void)setCoverMoveItems:(id)a3;
- (void)setPrefersCrossfade:(BOOL)a3;
- (void)setVelocityForPop:(double)a3;
- (void)setViewsToBeCleanedUp:(id)a3;
@end

@implementation BCCardStackTransitionAnimator

- (BCCardStackTransitionAnimator)initWithType:(int64_t)a3 allowsCardExpansion:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)BCCardStackTransitionAnimator;
  v6 = [(BCCardStackTransitionAnimator *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_animationType = a3;
    uint64_t v8 = objc_opt_new();
    additionalAnimations = v7->_additionalAnimations;
    v7->_additionalAnimations = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableArray array];
    viewsToBeCleanedUp = v7->_viewsToBeCleanedUp;
    v7->_viewsToBeCleanedUp = (NSMutableArray *)v10;

    v7->_cardsCanExpand = a4;
  }
  return v7;
}

- (void)addAnimations:(id)a3
{
  additionalAnimations = self->_additionalAnimations;
  id v4 = objc_retainBlock(a3);
  [(NSMutableArray *)additionalAnimations addObject:v4];
}

- (double)transitionDuration:(id)a3
{
  id v4 = a3;
  if ([(BCCardStackTransitionAnimator *)self _prefersCrossfade])
  {
    [(BCCardStackTransitionAnimator *)self _adjustDuration:0.3];
    double v6 = v5;
  }
  else
  {
    switch(self->_animationType)
    {
      case 0:
        v7 = [(BCCardStackTransitionAnimator *)self _cardSlideUpSpring];
        goto LABEL_8;
      case 1:
        v7 = [(BCCardStackTransitionAnimator *)self _coverSpring];
        goto LABEL_8;
      case 2:
        v7 = -[BCCardStackTransitionAnimator _cardSlideDownSpringWithVelocity:](self, "_cardSlideDownSpringWithVelocity:", 0.0, 0.0);
LABEL_8:
        uint64_t v8 = v7;
        [v7 settlingDuration];
        double v6 = v9;

        break;
      case 3:
        uint64_t v10 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
        v11 = -[BCCardStackTransitionAnimator _coverSpringForDismissWithVelocity:isCompact:](self, "_coverSpringForDismissWithVelocity:isCompact:", objc_msgSend(v10, "im_isCompactWidth"), 0.0, 0.0);
        [v11 settlingDuration];
        double v6 = v12;

        break;
      default:
        double v6 = 0.0;
        break;
    }
  }

  return v6;
}

- (void)animateTransition:(id)a3
{
  id v8 = a3;
  switch(self->_animationType)
  {
    case 0:
      unsigned int v4 = [(BCCardStackTransitionAnimator *)self _prefersCrossfade];
      id v5 = v8;
      if (v4) {
        goto LABEL_9;
      }
      [(BCCardStackTransitionAnimator *)self _animatePushBySliding:v8];
      break;
    case 1:
      unsigned int v6 = [(BCCardStackTransitionAnimator *)self _prefersCrossfade];
      id v5 = v8;
      if (v6) {
LABEL_9:
      }
        [(BCCardStackTransitionAnimator *)self _animatePushByCrossfading:v5];
      else {
        [(BCCardStackTransitionAnimator *)self _animatePushByCoverTransitioning:v8];
      }
      break;
    case 2:
      if ([(BCCardStackTransitionAnimator *)self _prefersCrossfade]) {
        goto LABEL_7;
      }
      [(BCCardStackTransitionAnimator *)self _animatePopBySliding:v8];
      break;
    case 3:
      if ([(BCCardStackTransitionAnimator *)self _prefersCrossfade]) {
LABEL_7:
      }
        [(BCCardStackTransitionAnimator *)self _animatePopByCrossfading:v8];
      else {
        [(BCCardStackTransitionAnimator *)self _animatePopByCoverTransitioning:v8];
      }
      break;
    default:
      break;
  }
  v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"BCCardStackTransitionTestAnimationWillBeginNotification" object:self];
}

- (void)animationEnded:(BOOL)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v4 = [(BCCardStackTransitionAnimator *)self viewsToBeCleanedUp];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) removeFromSuperview];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  double v9 = [(BCCardStackTransitionAnimator *)self viewsToBeCleanedUp];
  [v9 removeAllObjects];

  [(BCCardStackTransitionAnimator *)self setCoverControllers:0];
}

- (BOOL)_prefersCrossfade
{
  if ([(BCCardStackTransitionAnimator *)self prefersCrossfade]) {
    return 1;
  }

  return UIAccessibilityIsReduceMotionEnabled();
}

- (void)_animatePushBySliding:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  id v6 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  uint64_t v7 = [v4 viewForKey:@"BCUITransitionContextBackgroundViewKey"];
  id v8 = [v4 viewForKey:@"BCUITransitionContextTitleLabelKey"];
  if (self->_cardsCanExpand || !v6)
  {
    double v9 = [v4 containerView];
    [v9 addSubview:v7];

    long long v10 = [v4 containerView];
    [v10 addSubview:v8];
  }
  v46 = v6;
  if ([v6 expanded])
  {
    [v7 setAlpha:0.0];
    [v8 setAlpha:0.0];
  }
  long long v11 = [v4 containerView];
  long long v12 = [v5 view];
  [v11 addSubview:v12];

  [v4 initialFrameForViewController:v5];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [v5 view];
  [v21 setFrame:v14, v16, v18, v20];

  v22 = objc_alloc_init(BCViewPropertyAnimatorCounter);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_B3718;
  v58[3] = &unk_2C3C50;
  id v23 = v4;
  id v59 = v23;
  [(BCViewPropertyAnimatorCounter *)v22 setAnimationDidEnd:v58];
  id v24 = objc_alloc((Class)UIViewPropertyAnimator);
  [(BCCardStackTransitionAnimator *)self _adjustDuration:0.13];
  double v26 = v25;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_B3724;
  v56[3] = &unk_2C3C50;
  id v45 = v7;
  id v57 = v45;
  id v44 = [v24 initWithDuration:0 curve:v56 animations:v26];
  -[BCViewPropertyAnimatorCounter animate:](v22, "animate:");
  id v27 = objc_alloc((Class)UIViewPropertyAnimator);
  [(BCCardStackTransitionAnimator *)self _adjustDuration:0.18];
  double v29 = v28;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_B3730;
  v54[3] = &unk_2C3C50;
  id v30 = v8;
  id v55 = v30;
  id v31 = [v27 initWithDuration:0 curve:v54 animations:v29];
  [(BCViewPropertyAnimatorCounter *)v22 animate:v31];
  id v32 = objc_alloc((Class)UIViewPropertyAnimator);
  v33 = [(BCCardStackTransitionAnimator *)self _cardSlideUpSpring];
  id v34 = [v32 initWithDuration:v33 timingParameters:0.0];

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_B373C;
  v51[3] = &unk_2C3AF8;
  id v35 = v5;
  id v52 = v35;
  id v36 = v23;
  id v53 = v36;
  [v34 addAnimations:v51];
  [(BCViewPropertyAnimatorCounter *)v22 animate:v34];
  [(BCCardStackTransitionAnimator *)self _adjustDuration:0.5];
  double v38 = v37;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v39 = self->_additionalAnimations;
  id v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v48;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v48 != v42) {
          objc_enumerationMutation(v39);
        }
        (*(void (**)(double))(*(void *)(*((void *)&v47 + 1) + 8 * i) + 16))(v38);
      }
      id v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v41);
  }
}

- (id)_cardSlideDownSpringWithVelocity:(CGVector)a3
{
  id v4 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:350.0 damping:30.0 initialVelocity:a3.dx, a3.dy];
  id v5 = [(BCCardStackTransitionAnimator *)self _adjustSpring:v4];

  return v5;
}

- (CGAffineTransform)_translationForTitleLabel:(SEL)a3 cardSuperview:(id)a4 cardCurrentFrame:(id)a5 cardTargetFrame:(CGRect)a6
{
  double width = a7.size.width;
  double height = a7.size.height;
  double y = a7.origin.y;
  double x = a7.origin.x;
  double v7 = a6.size.height;
  double v8 = a6.size.width;
  double v9 = a6.origin.y;
  double v10 = a6.origin.x;
  id v13 = a5;
  id v14 = a4;
  [v14 frame];
  id v34 = [v14 superview];

  CGRectGetCenterNoRounding();
  [v34 convertRect:v13 fromView:v10, v9, v8, v7];
  CGFloat v15 = v36.origin.x;
  CGFloat v16 = v36.origin.y;
  CGFloat v17 = v36.size.width;
  CGFloat v18 = v36.size.height;
  CGRectGetMidX(v36);
  v37.origin.double x = v15;
  v37.origin.double y = v16;
  v37.size.double width = v17;
  v37.size.double height = v18;
  CGRectGetMinY(v37);
  CGRectGetCenterNoRounding();
  CGPointSubtract();
  [v34 convertRect:v13 fromView:x, y, width, height];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  v38.origin.double x = v20;
  v38.origin.double y = v22;
  v38.size.double width = v24;
  v38.size.double height = v26;
  CGRectGetMidX(v38);
  v39.origin.double x = v20;
  v39.origin.double y = v22;
  v39.size.double width = v24;
  v39.size.double height = v26;
  CGRectGetMinY(v39);
  CGPointAdd();
  CGPointSubtract();
  CGAffineTransformMakeTranslation(retstr, v27, v28);

  return result;
}

- (void)_animatePopBySliding:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  uint64_t v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  v87 = [v4 viewForKey:@"BCUITransitionContextBackgroundViewKey"];
  id obj = v4;
  v91 = [v4 viewForKey:@"BCUITransitionContextTitleLabelKey"];
  v89 = (void *)v6;
  BOOL v8 = self->_cardsCanExpand || v6 == 0;
  BOOL v97 = v8;
  double v9 = [v5 view];
  [v9 bounds];
  double MaxY = CGRectGetMaxY(v146);

  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v140.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v140.c = v10;
  *(_OWORD *)&v140.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v11 = [(BCCardStackTransitionAnimator *)self cardSlideItems];
  id v12 = [v11 countByEnumeratingWithState:&v136 objects:v145 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v137;
    double v93 = 0.0;
    double v95 = 0.0;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v137 != v14) {
          objc_enumerationMutation(v11);
        }
        CGFloat v16 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        CGFloat v17 = [v16 card];
        CGFloat v18 = [v17 cardStackTransitioningCardView];

        double v19 = [v18 superview];
        [(BCCardStackTransitionAnimator *)self _clearTranslationForView:v18];
        [v18 frame];
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        CGFloat v28 = [v5 view];
        [v19 convertPoint:v28 fromView:0.0, MaxY];
        double v30 = v29;

        v147.origin.double x = v21;
        v147.origin.double y = v23;
        v147.size.double width = v25;
        v147.size.double height = v27;
        CGFloat v31 = v30 - CGRectGetMinY(v147);
        v148.origin.double x = v21;
        v148.origin.double y = v23;
        v148.size.double width = v25;
        v148.size.double height = v27;
        CGRect v149 = CGRectOffset(v148, 0.0, v31);
        double x = v149.origin.x;
        double y = v149.origin.y;
        double width = v149.size.width;
        double height = v149.size.height;
        CGRectGetCenterNoRounding();
        [v16 setCardToCenter:];
        if ([v16 isFocusedCard])
        {
          -[BCCardStackTransitionAnimator _dismissSpringVelocityWithFromFrame:toFrame:](self, "_dismissSpringVelocityWithFromFrame:toFrame:", v21, v23, v25, v27, x, y, width, height);
          double v93 = v36;
          double v95 = v37;
          if (v97)
          {
            memset(&v135, 0, sizeof(v135));
            -[BCCardStackTransitionAnimator _translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:](self, "_translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:", v91, v19, v21, v23, v25, v27, x, y, width, height);
            if (v91) {
              [v91 transform];
            }
            else {
              memset(&t2, 0, sizeof(t2));
            }
            CGAffineTransform t1 = v135;
            CGAffineTransformConcat(&v140, &t1, &t2);
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v136 objects:v145 count:16];
    }
    while (v13);
  }
  else
  {
    double v93 = 0.0;
    double v95 = 0.0;
  }
  v90 = v5;

  v101 = +[NSMutableDictionary dictionary];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  CGRect v38 = [(BCCardStackTransitionAnimator *)self coverFadeItems];
  id v39 = [v38 countByEnumeratingWithState:&v129 objects:v144 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v130;
    do
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(void *)v130 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v129 + 1) + 8 * (void)j);
        id v44 = [v43 key];
        id v45 = [obj viewForKey:@"BCUITransitionContextClippedCoverContainerViewKey"];
        v46 = [v43 coverSource];
        long long v47 = [(BCCardStackTransitionAnimator *)self _addCoverForCoverSource:v46 inView:v45];
        [v101 setObject:v47 forKeyedSubscript:v44];
      }
      id v40 = [v38 countByEnumeratingWithState:&v129 objects:v144 count:16];
    }
    while (v40);
  }

  long long v48 = objc_alloc_init(BCViewPropertyAnimatorCounter);
  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472;
  v124[2] = sub_B4494;
  v124[3] = &unk_2C7E88;
  id v49 = v89;
  id v125 = v49;
  id v50 = v87;
  id v126 = v50;
  id v51 = v91;
  id v127 = v51;
  id v52 = obj;
  id v128 = v52;
  [(BCViewPropertyAnimatorCounter *)v48 setAnimationDidEnd:v124];
  id v53 = -[BCCardStackTransitionAnimator _cardSlideDownSpringWithVelocity:](self, "_cardSlideDownSpringWithVelocity:", v93, v95);
  [v53 settlingDuration];
  double v55 = v54 * 0.9;
  v94 = v53;
  id v56 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v53 timingParameters:v54 * 0.9];
  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472;
  v120[2] = sub_B4540;
  v120[3] = &unk_2C8380;
  v120[4] = self;
  BOOL v123 = v97;
  id v96 = v51;
  id v121 = v96;
  CGAffineTransform v122 = v140;
  [v56 addAnimations:v120];
  v92 = v56;
  [(BCViewPropertyAnimatorCounter *)v48 animate:v56];
  id v57 = [(BCCardStackTransitionAnimator *)self coverFadeItems];
  id v58 = [v57 count];

  if (v58)
  {
    id v85 = v52;
    id v86 = v50;
    id v88 = v49;
    id v59 = objc_alloc((Class)UIViewPropertyAnimator);
    [(BCCardStackTransitionAnimator *)self _adjustDuration:0.3];
    id v60 = [v59 initWithDuration:0 curve:0 animations:];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id obja = [(BCCardStackTransitionAnimator *)self coverFadeItems];
    id v61 = [obja countByEnumeratingWithState:&v116 objects:v143 count:16];
    if (v61)
    {
      id v62 = v61;
      uint64_t v63 = *(void *)v117;
      do
      {
        for (k = 0; k != v62; k = (char *)k + 1)
        {
          if (*(void *)v117 != v63) {
            objc_enumerationMutation(obja);
          }
          v65 = [*(id *)(*((void *)&v116 + 1) + 8 * (void)k) key];
          v66 = [v101 objectForKeyedSubscript:v65];
          v67 = [v66 coverView];

          [v67 setAlpha:0.0];
          v114[0] = _NSConcreteStackBlock;
          v114[1] = 3221225472;
          v114[2] = sub_B46A4;
          v114[3] = &unk_2C3C50;
          id v115 = v67;
          id v68 = v67;
          [v60 addAnimations:v114];
        }
        id v62 = [obja countByEnumeratingWithState:&v116 objects:v143 count:16];
      }
      while (v62);
    }

    [(BCViewPropertyAnimatorCounter *)v48 animate:v60];
    id v50 = v86;
    id v49 = v88;
    id v52 = v85;
  }
  if (v97)
  {
    id v69 = objc_alloc((Class)UIViewPropertyAnimator);
    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472;
    v112[2] = sub_B46B0;
    v112[3] = &unk_2C3C50;
    id v113 = v50;
    id v70 = [v69 initWithDuration:0 curve:v112 animations:v55];
    [(BCViewPropertyAnimatorCounter *)v48 animate:v70];

    id v71 = objc_alloc((Class)UIViewPropertyAnimator);
    [(BCCardStackTransitionAnimator *)self _adjustDuration:0.18];
    if (v55 >= v72) {
      double v73 = v72;
    }
    else {
      double v73 = v55;
    }
    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472;
    v110[2] = sub_B46BC;
    v110[3] = &unk_2C3C50;
    id v111 = v96;
    id v74 = [v71 initWithDuration:0 curve:v110 animations:v73];
    [(BCViewPropertyAnimatorCounter *)v48 animate:v74];
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v75 = [v101 allValues];
  id v76 = [v75 countByEnumeratingWithState:&v106 objects:v142 count:16];
  if (v76)
  {
    id v77 = v76;
    uint64_t v78 = *(void *)v107;
    do
    {
      for (m = 0; m != v77; m = (char *)m + 1)
      {
        if (*(void *)v107 != v78) {
          objc_enumerationMutation(v75);
        }
        [*(id *)(*((void *)&v106 + 1) + 8 * (void)m) setCounter:v48];
      }
      id v77 = [v75 countByEnumeratingWithState:&v106 objects:v142 count:16];
    }
    while (v77);
  }

  [(BCCardStackTransitionAnimator *)self setCoverControllers:v101];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v80 = self->_additionalAnimations;
  id v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v102 objects:v141 count:16];
  if (v81)
  {
    id v82 = v81;
    uint64_t v83 = *(void *)v103;
    do
    {
      for (n = 0; n != v82; n = (char *)n + 1)
      {
        if (*(void *)v103 != v83) {
          objc_enumerationMutation(v80);
        }
        (*(void (**)(double))(*(void *)(*((void *)&v102 + 1) + 8 * (void)n) + 16))(v55);
      }
      id v82 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v102 objects:v141 count:16];
    }
    while (v82);
  }
}

- (double)_insetPercentageForAbsoluteCoverRect:(CGRect)a3
{
  CGSizeScaleThatFitsInCGSize();
  return dbl_2A23B0[v3 >= 1.0];
}

- (id)_coverSpring
{
  id v3 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:350.0 damping:30.0 initialVelocity:0.0];
  id v4 = [(BCCardStackTransitionAnimator *)self _adjustSpring:v3];

  return v4;
}

- (id)_coverSpringForDismissWithVelocity:(CGVector)a3 isCompact:(BOOL)a4
{
  BOOL v4 = a4;
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  id v8 = objc_alloc((Class)UISpringTimingParameters);
  if (v4) {
    double v9 = 30.0;
  }
  else {
    double v9 = 33.0;
  }
  id v10 = [v8 initWithMass:1.0 stiffness:350.0 damping:v9 initialVelocity:dx, dy];
  long long v11 = [(BCCardStackTransitionAnimator *)self _adjustSpring:v10];

  return v11;
}

- (id)_coverScaleSpring
{
  id v3 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:350.0 damping:28.0 initialVelocity:0.0];
  BOOL v4 = [(BCCardStackTransitionAnimator *)self _adjustSpring:v3];

  return v4;
}

- (id)_customCurve
{
  LODWORD(v2) = 1051260355;
  LODWORD(v3) = 1045220557;
  LODWORD(v4) = 1.0;
  id v5 = +[CAMediaTimingFunction functionWithControlPoints:v2 :0.0 :v3 :v4];
  id v6 = [objc_alloc((Class)UICubicTimingParameters) initWithCustomCurve:v5];

  return v6;
}

- (void)_animatePushByCoverTransitioning:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  uint64_t v6 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  uint64_t v7 = [v4 viewForKey:@"BCUITransitionContextBackgroundViewKey"];
  id v8 = [v4 viewForKey:@"BCUITransitionContextTitleLabelKey"];
  v133 = (void *)v6;
  BOOL v9 = self->_cardsCanExpand || v6 == 0;
  int v10 = !v9;
  int v142 = v10;
  if (v9)
  {
    long long v11 = [v4 containerView];
    [v11 bringSubviewToFront:v7];

    id v12 = [v4 containerView];
    [v12 bringSubviewToFront:v8];
  }
  long long v136 = (void *)v7;
  id v13 = [v4 containerView];
  [v13 layoutIfNeeded];

  [v4 finalFrameForViewController:v5];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = [v5 view];
  [v22 setFrame:v15, v17, v19, v21];

  double v23 = [v4 containerView];
  double v24 = [v5 view];
  [v23 addSubview:v24];

  v134 = v5;
  double v25 = [v5 view];
  [v25 layoutIfNeeded];

  +[NSMutableDictionary dictionary];
  v145 = v144 = self;
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  double v26 = [(BCCardStackTransitionAnimator *)self cardMoveItems];
  id v27 = [v26 countByEnumeratingWithState:&v208 objects:v220 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v209;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v209 != v29) {
          objc_enumerationMutation(v26);
        }
        CGFloat v31 = *(void **)(*((void *)&v208 + 1) + 8 * i);
        id v32 = [v31 card];
        [v32 cardStackTransitioningCardExtraXOffset];
        double v34 = v33;
        id v35 = [v31 coverSource];
        [v35 setCardStackTransitioningCoverSourceExtraXOffset:v34];
      }
      id v28 = [v26 countByEnumeratingWithState:&v208 objects:v220 count:16];
    }
    while (v28);
  }

  long long v207 = 0u;
  long long v206 = 0u;
  long long v205 = 0u;
  long long v204 = 0u;
  double v36 = [(BCCardStackTransitionAnimator *)v144 coverMoveItems];
  id v37 = [v36 countByEnumeratingWithState:&v204 objects:v219 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v205;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v205 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void **)(*((void *)&v204 + 1) + 8 * (void)j);
        uint64_t v42 = [v4 containerView];
        v43 = [(BCCardStackTransitionAnimator *)v144 _addCoverForCoverMove:v41 inView:v42 isDismiss:0 fromFrame:0 toFrame:0];
        id v44 = [v41 key];
        [v145 setObject:v43 forKeyedSubscript:v44];
      }
      id v38 = [v36 countByEnumeratingWithState:&v204 objects:v219 count:16];
    }
    while (v38);
  }

  long long v203 = 0u;
  long long v202 = 0u;
  long long v201 = 0u;
  long long v200 = 0u;
  id v45 = [(BCCardStackTransitionAnimator *)v144 cardMoveItems];
  id v46 = [v45 countByEnumeratingWithState:&v200 objects:v218 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v201;
    do
    {
      id v49 = 0;
      long long v50 = 0uLL;
      do
      {
        if (*(void *)v201 != v48)
        {
          objc_enumerationMutation(v45);
          long long v50 = 0uLL;
        }
        id v51 = *(void **)(*((void *)&v200 + 1) + 8 * (void)v49);
        long long v199 = v50;
        long long v198 = v50;
        long long v197 = v50;
        long long v196 = v50;
        [(BCCardStackTransitionAnimator *)v144 _prepareCardForCardMove:v51 isDismiss:0 fromFrame:&v198 toFrame:&v196];
        if (((v142 | [v51 isFocusedCard] ^ 1) & 1) == 0)
        {
          memset(&v195, 0, sizeof(v195));
          id v52 = [v51 card];
          id v53 = [v52 cardStackTransitioningCardView];
          double v54 = [v53 superview];
          -[BCCardStackTransitionAnimator _translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:](v144, "_translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:", v8, v54, v196, v197, v198, v199);

          if (v8) {
            [v8 transform];
          }
          else {
            memset(&t2, 0, sizeof(t2));
          }
          CGAffineTransform t1 = v195;
          CGAffineTransformConcat(&v194, &t1, &t2);
          CGAffineTransform v191 = v194;
          [v8 setTransform:&v191];
        }
        id v49 = (char *)v49 + 1;
        long long v50 = 0uLL;
      }
      while (v47 != v49);
      id v47 = [v45 countByEnumeratingWithState:&v200 objects:v218 count:16];
    }
    while (v47);
  }
  long long v137 = v8;

  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  double v55 = [(BCCardStackTransitionAnimator *)v144 coverFadeItems];
  id v56 = [v55 countByEnumeratingWithState:&v187 objects:v217 count:16];
  if (v56)
  {
    id v57 = v56;
    uint64_t v58 = *(void *)v188;
    do
    {
      for (k = 0; k != v57; k = (char *)k + 1)
      {
        if (*(void *)v188 != v58) {
          objc_enumerationMutation(v55);
        }
        id v60 = *(void **)(*((void *)&v187 + 1) + 8 * (void)k);
        id v61 = [v60 key];
        id v62 = [v4 viewForKey:@"BCUITransitionContextClippedCoverContainerViewKey"];
        uint64_t v63 = [v60 coverSource];
        v64 = [(BCCardStackTransitionAnimator *)v144 _addCoverForCoverSource:v63 inView:v62];
        [v145 setObject:v64 forKeyedSubscript:v61];
      }
      id v57 = [v55 countByEnumeratingWithState:&v187 objects:v217 count:16];
    }
    while (v57);
  }

  v65 = objc_alloc_init(BCViewPropertyAnimatorCounter);
  v185[0] = _NSConcreteStackBlock;
  v185[1] = 3221225472;
  v185[2] = sub_B5918;
  v185[3] = &unk_2C3C50;
  id v132 = v4;
  id v186 = v132;
  [(BCViewPropertyAnimatorCounter *)v65 setAnimationDidEnd:v185];
  double v66 = 0.0;
  if (v142) {
    double v66 = 1.0;
  }
  [v136 setAlpha:v66];
  CGAffineTransform v135 = v65;
  if (v142)
  {
    [v137 setAlpha:1.0];
    v67 = v144;
  }
  else
  {
    id v68 = objc_alloc((Class)UIViewPropertyAnimator);
    v67 = v144;
    [(BCCardStackTransitionAnimator *)v144 _adjustDuration:0.13];
    double v70 = v69;
    v183[0] = _NSConcreteStackBlock;
    v183[1] = 3221225472;
    v183[2] = sub_B5924;
    v183[3] = &unk_2C3C50;
    id v184 = v136;
    id v71 = [v68 initWithDuration:0 curve:v183 animations:v70];
    [(BCViewPropertyAnimatorCounter *)v65 animate:v71];

    [v137 setAlpha:0.0];
    id v72 = objc_alloc((Class)UIViewPropertyAnimator);
    [(BCCardStackTransitionAnimator *)v144 _adjustDuration:0.18];
    double v74 = v73;
    v181[0] = _NSConcreteStackBlock;
    v181[1] = 3221225472;
    v181[2] = sub_B5930;
    v181[3] = &unk_2C3C50;
    id v182 = v137;
    id v75 = [v72 initWithDuration:0 curve:v181 animations:v74];
    [(BCViewPropertyAnimatorCounter *)v65 animate:v75];
  }
  id v76 = objc_alloc((Class)UIViewPropertyAnimator);
  id v77 = [(BCCardStackTransitionAnimator *)v67 _coverSpring];
  id v143 = [v76 initWithDuration:v77 timingParameters:0.0];

  id v78 = objc_alloc((Class)UIViewPropertyAnimator);
  v79 = [(BCCardStackTransitionAnimator *)v67 _coverScaleSpring];
  id v141 = [v78 initWithDuration:v79 timingParameters:0.0];

  id v80 = objc_alloc((Class)UIViewPropertyAnimator);
  [(BCCardStackTransitionAnimator *)v67 _adjustDuration:0.05];
  double v82 = v81;
  uint64_t v83 = [(BCCardStackTransitionAnimator *)v67 _customCurve];
  id v140 = [v80 initWithDuration:v83 timingParameters:v82];

  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  id obj = [(BCCardStackTransitionAnimator *)v67 coverMoveItems];
  id v84 = [obj countByEnumeratingWithState:&v177 objects:v216 count:16];
  if (v84)
  {
    id v85 = v84;
    uint64_t v86 = *(void *)v178;
    do
    {
      for (m = 0; m != v85; m = (char *)m + 1)
      {
        if (*(void *)v178 != v86) {
          objc_enumerationMutation(obj);
        }
        id v88 = *(void **)(*((void *)&v177 + 1) + 8 * (void)m);
        v89 = [v88 key];
        v90 = [v145 objectForKeyedSubscript:v89];
        v91 = [v90 coverView];

        v174[0] = _NSConcreteStackBlock;
        v174[1] = 3221225472;
        v174[2] = sub_B593C;
        v174[3] = &unk_2C3AF8;
        id v92 = v91;
        id v175 = v92;
        v176 = v88;
        [v143 addAnimations:v174];
        v171[0] = _NSConcreteStackBlock;
        v171[1] = 3221225472;
        v171[2] = sub_B5978;
        v171[3] = &unk_2C3AF8;
        id v172 = v92;
        v173 = v88;
        id v93 = v92;
        [v141 addAnimations:v171];
      }
      id v85 = [obj countByEnumeratingWithState:&v177 objects:v216 count:16];
    }
    while (v85);
  }

  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id obja = [(BCCardStackTransitionAnimator *)v144 cardMoveItems];
  id v94 = [obja countByEnumeratingWithState:&v167 objects:v215 count:16];
  if (v94)
  {
    id v95 = v94;
    uint64_t v96 = *(void *)v168;
    do
    {
      for (n = 0; n != v95; n = (char *)n + 1)
      {
        if (*(void *)v168 != v96) {
          objc_enumerationMutation(obja);
        }
        v98 = *(void **)(*((void *)&v167 + 1) + 8 * (void)n);
        v99 = [v98 card];
        v164[0] = _NSConcreteStackBlock;
        v164[1] = 3221225472;
        v164[2] = sub_B59DC;
        v164[3] = &unk_2C3AF8;
        id v100 = v99;
        id v165 = v100;
        v166 = v98;
        [v143 addAnimations:v164];
        [v100 setCardStackTransitioningCardContentAlpha:1.0];
        v162[0] = _NSConcreteStackBlock;
        v162[1] = 3221225472;
        v162[2] = sub_B5AB0;
        v162[3] = &unk_2C3C50;
        id v163 = v100;
        id v101 = v100;
        [(BCCardStackTransitionAnimator *)v144 _adjustDuration:0.08];
        double v103 = v102;
        [v140 duration];
        [v140 addAnimations:v162 delayFactor:v103 / v104];
      }
      id v95 = [obja countByEnumeratingWithState:&v167 objects:v215 count:16];
    }
    while (v95);
  }

  long long v105 = v137;
  if ((v142 & 1) == 0)
  {
    v160[0] = _NSConcreteStackBlock;
    v160[1] = 3221225472;
    v160[2] = sub_B5ABC;
    v160[3] = &unk_2C3C50;
    id v161 = v137;
    [v143 addAnimations:v160];
  }
  long long v106 = v135;
  [(BCViewPropertyAnimatorCounter *)v135 animate:v143];
  [(BCViewPropertyAnimatorCounter *)v135 animate:v141];
  [(BCViewPropertyAnimatorCounter *)v135 animate:v140];
  long long v107 = [(BCCardStackTransitionAnimator *)v144 coverFadeItems];
  id v108 = [v107 count];

  if (v108)
  {
    id v109 = objc_alloc((Class)UIViewPropertyAnimator);
    [(BCCardStackTransitionAnimator *)v144 _adjustDuration:0.2];
    id v110 = [v109 initWithDuration:0 curve:0 animations:];
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id v111 = [(BCCardStackTransitionAnimator *)v144 coverFadeItems];
    id v112 = [v111 countByEnumeratingWithState:&v156 objects:v214 count:16];
    if (v112)
    {
      id v113 = v112;
      uint64_t v114 = *(void *)v157;
      do
      {
        for (ii = 0; ii != v113; ii = (char *)ii + 1)
        {
          if (*(void *)v157 != v114) {
            objc_enumerationMutation(v111);
          }
          long long v116 = [*(id *)(*((void *)&v156 + 1) + 8 * (void)ii) key];
          long long v117 = [v145 objectForKeyedSubscript:v116];
          long long v118 = [v117 coverView];

          [v118 setAlpha:1.0];
          v154[0] = _NSConcreteStackBlock;
          v154[1] = 3221225472;
          v154[2] = sub_B5AFC;
          v154[3] = &unk_2C3C50;
          id v155 = v118;
          id v119 = v118;
          [v110 addAnimations:v154];
        }
        id v113 = [v111 countByEnumeratingWithState:&v156 objects:v214 count:16];
      }
      while (v113);
    }

    long long v106 = v135;
    [(BCViewPropertyAnimatorCounter *)v135 animate:v110];

    long long v105 = v137;
  }
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  v120 = [v145 allValues];
  id v121 = [v120 countByEnumeratingWithState:&v150 objects:v213 count:16];
  if (v121)
  {
    id v122 = v121;
    uint64_t v123 = *(void *)v151;
    do
    {
      for (jj = 0; jj != v122; jj = (char *)jj + 1)
      {
        if (*(void *)v151 != v123) {
          objc_enumerationMutation(v120);
        }
        [*(id *)(*((void *)&v150 + 1) + 8 * (void)jj) setCounter:v106];
      }
      id v122 = [v120 countByEnumeratingWithState:&v150 objects:v213 count:16];
    }
    while (v122);
  }

  [(BCCardStackTransitionAnimator *)v144 setCoverControllers:v145];
  [(BCCardStackTransitionAnimator *)v144 _adjustDuration:0.5];
  double v126 = v125;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id v127 = v144->_additionalAnimations;
  id v128 = [(NSMutableArray *)v127 countByEnumeratingWithState:&v146 objects:v212 count:16];
  if (v128)
  {
    id v129 = v128;
    uint64_t v130 = *(void *)v147;
    do
    {
      for (kk = 0; kk != v129; kk = (char *)kk + 1)
      {
        if (*(void *)v147 != v130) {
          objc_enumerationMutation(v127);
        }
        (*(void (**)(double))(*(void *)(*((void *)&v146 + 1) + 8 * (void)kk) + 16))(v126);
      }
      id v129 = [(NSMutableArray *)v127 countByEnumeratingWithState:&v146 objects:v212 count:16];
    }
    while (v129);
  }
}

- (id)_addCoverForCoverSource:(id)a3 inView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 cardStackTransitioningCoverSourceFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 cardStackTransitioningCoverSourceReferenceView];
  [v6 convertRect:v16 fromView:v9];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = -[BCCardStackTransitionCoverView initWithFrame:]([BCCardStackTransitionCoverView alloc], "initWithFrame:", v18, v20, v22, v24);
  [v6 addSubview:v25];

  double v26 = [(BCCardStackTransitionAnimator *)self viewsToBeCleanedUp];
  [v26 addObject:v25];

  id v27 = objc_alloc_init(_BCCardStackTransitionCoverController);
  [(_BCCardStackTransitionCoverController *)v27 setupWithCoverSource:v7 coverView:v25];

  return v27;
}

- (id)_addCoverForCoverMove:(id)a3 inView:(id)a4 isDismiss:(BOOL)a5 fromFrame:(CGRect *)a6 toFrame:(CGRect *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  double v14 = [v12 coverSource];
  double v15 = [v12 cardCoverSource];
  [v14 cardStackTransitioningCoverSourceFrame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v24 = [v14 cardStackTransitioningCoverSourceReferenceView];
  [v13 convertRect:v24 fromView:v17];
  double x = v25;
  double y = v27;
  double width = v29;
  double height = v31;

  [v15 cardStackTransitioningCoverSourceFrame];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  uint64_t v41 = [v15 cardStackTransitioningCoverSourceReferenceView];
  [v13 convertRect:v41 fromView:v34];
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;

  if (v9) {
    CGFloat v50 = v47;
  }
  else {
    CGFloat v50 = width;
  }
  if (v9) {
    CGFloat v51 = v49;
  }
  else {
    CGFloat v51 = height;
  }
  double v62 = v51;
  double v63 = v50;
  if (v9) {
    CGFloat v52 = v45;
  }
  else {
    CGFloat v52 = y;
  }
  if (v9) {
    CGFloat v53 = v43;
  }
  else {
    CGFloat v53 = x;
  }
  double v60 = v53;
  double v61 = v52;
  if (!v9)
  {
    [v14 cardStackTransitioningCoverSourceExtraXOffset];
    CGFloat v55 = v54;
    v67.origin.double x = v43;
    v67.origin.double y = v45;
    v67.size.double width = v47;
    v67.size.double height = v49;
    CGRect v68 = CGRectOffset(v67, v55, 0.0);
    double x = v68.origin.x;
    double y = v68.origin.y;
    double width = v68.size.width;
    double height = v68.size.height;
  }
  id v56 = -[BCCardStackTransitionCoverView initWithFrame:]([BCCardStackTransitionCoverView alloc], "initWithFrame:", v60, v61, v63, v62);
  [v13 addSubview:v56];
  id v57 = [(BCCardStackTransitionAnimator *)self viewsToBeCleanedUp];
  [v57 addObject:v56];

  CGRectGetCenterNoRounding();
  [v12 setCoverToCenter:];
  sub_B5EF4(&v65, v60, v61, v63, v62, x, y, width, height);
  CGAffineTransform v64 = v65;
  [v12 setCoverToTransform:&v64];
  if (a6)
  {
    a6->origin.double x = v60;
    a6->origin.double y = v61;
    a6->size.double width = v63;
    a6->size.double height = v62;
  }
  if (a7)
  {
    a7->origin.double x = x;
    a7->origin.double y = y;
    a7->size.double width = width;
    a7->size.double height = height;
  }
  uint64_t v58 = objc_alloc_init(_BCCardStackTransitionCoverController);
  [(_BCCardStackTransitionCoverController *)v58 setupWithCoverSource:v14 cardCoverSource:v15 coverView:v56 isDismiss:v9];

  return v58;
}

- (void)_clearTranslationForView:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  if (v3) {
    [v3 transform];
  }
  [v4 center];
  CGPointAdd();
  [v4 setCenter:];
  long long v8 = 0uLL;
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = 0uLL;
  [v4 setTransform:v5];
}

- (void)_prepareCardForCardMove:(id)a3 isDismiss:(BOOL)a4 fromFrame:(CGRect *)a5 toFrame:(CGRect *)a6
{
  id v10 = a3;
  double v11 = [v10 card];
  id v12 = [v10 coverSource];
  id v13 = [v11 cardStackTransitioningCardView];
  double v14 = [v13 superview];
  [v11 cardStackTransitioningCardFinalFrame];
  CGFloat v58 = v16;
  CGFloat v59 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [v12 cardStackTransitioningCoverSourceFrame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v29 = [v12 cardStackTransitioningCoverSourceReferenceView];
  [v14 convertRect:v29 fromView:v22];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  [v14 convertRect:0 toView:v31];
  -[BCCardStackTransitionAnimator _insetPercentageForAbsoluteCoverRect:](self, "_insetPercentageForAbsoluteCoverRect:");
  double v39 = v38;
  v72.origin.double x = v31;
  v72.origin.double y = v33;
  v72.size.double width = v35;
  v72.size.double height = v37;
  CGFloat Width = CGRectGetWidth(v72);
  CGFloat v41 = v39 * Width + v39 * Width;
  v73.origin.double x = v31;
  v73.origin.double y = v33;
  v73.size.double width = v35;
  v73.size.double height = v37;
  CGFloat Height = CGRectGetHeight(v73);
  CGFloat v43 = v39 * Height + v39 * Height;
  v74.origin.double x = v31;
  v74.origin.double y = v33;
  v74.size.double width = v35;
  v74.size.double height = v37;
  CGRectInset(v74, v41, v43);
  CGRectMakeWithSize();
  CGRectFitRectInRectAbsoluteNoRounding();
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  CGFloat v51 = v50;
  [(BCCardStackTransitionAnimator *)self _clearTranslationForView:v13];
  CGRectGetCenterNoRounding();
  double v53 = v52;
  double v55 = v54;
  memset(&v71, 0, sizeof(v71));
  sub_B5EF4(&t1, v59, v58, v18, v20, v45, v47, v49, v51);
  if (v13) {
    [v13 transform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransformConcat(&v71, &t1, &t2);
  if (a4)
  {
    [v10 setCardToCenter:v53, v55];
    CGAffineTransform v68 = v71;
    [v10 setCardToTransform:&v68];
    long long v56 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v67[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v67[1] = v56;
    v67[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v10 setCardSuperviewToTransform:v67];
    if (a5)
    {
      a5->origin.double x = v59;
      a5->origin.double y = v58;
      a5->size.double width = v18;
      a5->size.double height = v20;
    }
    CGFloat v18 = v49;
    CGFloat v20 = v51;
    if (!a6) {
      goto LABEL_16;
    }
LABEL_15:
    a6->origin.double x = v45;
    a6->origin.double y = v47;
    a6->size.double width = v18;
    a6->size.double height = v20;
    goto LABEL_16;
  }
  [v13 center];
  [v10 setCardToCenter:];
  if (v13)
  {
    [v13 transform];
  }
  else
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v64 = 0u;
  }
  v63[0] = v64;
  v63[1] = v65;
  v63[2] = v66;
  [v10 setCardToTransform:v63];
  [v11 cardStackTransitioningCardExtraXOffset];
  CGAffineTransformMakeTranslation(&v62, v57, 0.0);
  CGAffineTransform v61 = v62;
  [v10 setCardSuperviewToTransform:&v61];
  [v13 setCenter:v53, v55];
  CGAffineTransform v60 = v71;
  [v13 setTransform:&v60];
  if (a5)
  {
    a5->origin.double x = v45;
    a5->origin.double y = v47;
    a5->size.double width = v49;
    a5->size.double height = v51;
  }
  CGFloat v47 = v58;
  CGFloat v45 = v59;
  if (a6) {
    goto LABEL_15;
  }
LABEL_16:
}

- (CGVector)_dismissSpringVelocityWithFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MidY = CGRectGetMidY(a4);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v10 = MidY - CGRectGetMidY(v18);
  double v11 = fmin(v10, -1.0);
  double v12 = fmax(v10, 1.0);
  if (v10 >= 0.0) {
    double v13 = v12;
  }
  else {
    double v13 = v11;
  }
  [(BCCardStackTransitionAnimator *)self velocityForPop];
  double v15 = fmin(fmax(v14 / v13, -35.0), 35.0);
  double v16 = 0.0;
  result.dCGFloat y = v15;
  result.dCGFloat x = v16;
  return result;
}

- (void)_animatePopByCoverTransitioning:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  id v122 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  id v129 = [v4 viewForKey:@"BCUITransitionContextBackgroundViewKey"];
  [v4 viewForKey:@"BCUITransitionContextTitleLabelKey"];
  v133 = long long v131 = (void *)v5;
  BOOL v7 = self->_cardsCanExpand || v5 == 0;
  BOOL v124 = v7;
  long long v136 = +[NSMutableDictionary dictionary];
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v206.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v206.c = v8;
  *(_OWORD *)&v206.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  BOOL v9 = [(BCCardStackTransitionAnimator *)self coverMoveItems];
  id v10 = [v9 countByEnumeratingWithState:&v202 objects:v214 count:16];
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  CGAffineTransform v135 = self;
  if (v10)
  {
    id v14 = v10;
    uint64_t v15 = *(void *)v203;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v203 != v15) {
          objc_enumerationMutation(v9);
        }
        double v17 = *(void **)(*((void *)&v202 + 1) + 8 * i);
        if ([v17 animatesInInnerContainerView]) {
          [v4 viewForKey:@"BCUITransitionContextClippedCoverContainerViewKey"];
        }
        else {
        CGRect v18 = [v4 containerView];
        }
        memset(&v193, 0, 32);
        memset(&t1, 0, 32);
        double v19 = [(BCCardStackTransitionAnimator *)self _addCoverForCoverMove:v17 inView:v18 isDismiss:1 fromFrame:&v193 toFrame:&t1];
        CGFloat v20 = [v17 key];
        [v136 setObject:v19 forKeyedSubscript:v20];

        self = v135;
        if ([v17 isFocusedCover])
        {
          -[BCCardStackTransitionAnimator _dismissSpringVelocityWithFromFrame:toFrame:](v135, "_dismissSpringVelocityWithFromFrame:toFrame:", *(_OWORD *)&v193.a, *(_OWORD *)&v193.c, t1.a, t1.b, t1.c, t1.d);
          double v13 = v21;
          double v12 = v22;
        }
      }
      id v14 = [v9 countByEnumeratingWithState:&v202 objects:v214 count:16];
    }
    while (v14);
  }

  long long v201 = 0u;
  long long v200 = 0u;
  long long v199 = 0u;
  long long v198 = 0u;
  double v23 = [(BCCardStackTransitionAnimator *)self cardMoveItems];
  id v24 = [v23 countByEnumeratingWithState:&v198 objects:v213 count:16];
  double v25 = 0.0;
  if (v24)
  {
    id v26 = v24;
    uint64_t v27 = *(void *)v199;
    double v11 = 0.0;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v199 != v27) {
          objc_enumerationMutation(v23);
        }
        double v29 = *(void **)(*((void *)&v198 + 1) + 8 * (void)j);
        long long v197 = 0u;
        long long v196 = 0u;
        long long v195 = 0u;
        long long v194 = 0u;
        [(BCCardStackTransitionAnimator *)self _prepareCardForCardMove:v29 isDismiss:1 fromFrame:&v196 toFrame:&v194];
        if ([v29 isFocusedCard])
        {
          -[BCCardStackTransitionAnimator _dismissSpringVelocityWithFromFrame:toFrame:](self, "_dismissSpringVelocityWithFromFrame:toFrame:", v196, v197, v194, v195);
          double v25 = v30;
          double v11 = v31;
          if (v124)
          {
            memset(&v193, 0, sizeof(v193));
            double v32 = [v29 card];
            double v33 = [v32 cardStackTransitioningCardView];
            uint64_t v34 = [v33 superview];
            double v35 = self;
            double v36 = (void *)v34;
            -[BCCardStackTransitionAnimator _translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:](v35, "_translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:", v133, v34, v196, v197, v194, v195);

            if (v133) {
              [v133 transform];
            }
            else {
              memset(&t2, 0, sizeof(t2));
            }
            CGAffineTransform t1 = v193;
            CGAffineTransformConcat(&v206, &t1, &t2);
            self = v135;
          }
        }
      }
      id v26 = [v23 countByEnumeratingWithState:&v198 objects:v213 count:16];
    }
    while (v26);
  }

  long long v190 = 0u;
  long long v189 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  double v37 = [(BCCardStackTransitionAnimator *)self coverFadeItems];
  id v38 = [v37 countByEnumeratingWithState:&v187 objects:v212 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v188;
    do
    {
      for (k = 0; k != v39; k = (char *)k + 1)
      {
        if (*(void *)v188 != v40) {
          objc_enumerationMutation(v37);
        }
        double v42 = *(void **)(*((void *)&v187 + 1) + 8 * (void)k);
        CGFloat v43 = [v42 key];
        double v44 = [v4 viewForKey:@"BCUITransitionContextClippedCoverContainerViewKey"];
        CGFloat v45 = [v42 coverSource];
        double v46 = [(BCCardStackTransitionAnimator *)v135 _addCoverForCoverSource:v45 inView:v44];
        [v136 setObject:v46 forKeyedSubscript:v43];
      }
      id v39 = [v37 countByEnumeratingWithState:&v187 objects:v212 count:16];
    }
    while (v39);
  }

  CGFloat v47 = objc_alloc_init(BCViewPropertyAnimatorCounter);
  v182[0] = _NSConcreteStackBlock;
  v182[1] = 3221225472;
  v182[2] = sub_B75D4;
  v182[3] = &unk_2C7E88;
  id v119 = v131;
  id v183 = v119;
  id v48 = v129;
  id v184 = v48;
  id v121 = v133;
  id v185 = v121;
  id v117 = v4;
  id v186 = v117;
  [(BCViewPropertyAnimatorCounter *)v47 setAnimationDidEnd:v182];
  if (v124)
  {
    id v49 = objc_alloc((Class)UIViewPropertyAnimator);
    [(BCCardStackTransitionAnimator *)v135 _adjustDuration:0.17];
    double v51 = v50;
    v180[0] = _NSConcreteStackBlock;
    v180[1] = 3221225472;
    v180[2] = sub_B7680;
    v180[3] = &unk_2C3C50;
    id v181 = v48;
    id v52 = [v49 initWithDuration:0 curve:v180 animations:v51];
    [(BCViewPropertyAnimatorCounter *)v47 animate:v52];

    id v53 = objc_alloc((Class)UIViewPropertyAnimator);
    [(BCCardStackTransitionAnimator *)v135 _adjustDuration:0.18];
    double v55 = v54;
    v178[0] = _NSConcreteStackBlock;
    v178[1] = 3221225472;
    v178[2] = sub_B768C;
    v178[3] = &unk_2C3C50;
    id v179 = v121;
    id v56 = [v53 initWithDuration:0 curve:v178 animations:v55];
    [(BCViewPropertyAnimatorCounter *)v47 animate:v56];
  }
  long long v118 = v48;
  v120 = v47;
  id v57 = [v122 im_isCompactWidth];
  id v58 = objc_alloc((Class)UIViewPropertyAnimator);
  CGFloat v59 = -[BCCardStackTransitionAnimator _coverSpringForDismissWithVelocity:isCompact:](v135, "_coverSpringForDismissWithVelocity:isCompact:", v57, v13, v12);
  id v130 = [v58 initWithDuration:v59 timingParameters:0.0];

  id v60 = objc_alloc((Class)UIViewPropertyAnimator);
  CGAffineTransform v61 = -[BCCardStackTransitionAnimator _coverSpringForDismissWithVelocity:isCompact:](v135, "_coverSpringForDismissWithVelocity:isCompact:", v57, v25, v11);
  id v132 = [v60 initWithDuration:v61 timingParameters:0.0];

  id v62 = objc_alloc((Class)UIViewPropertyAnimator);
  double v63 = -[BCCardStackTransitionAnimator _coverSpringForDismissWithVelocity:isCompact:](v135, "_coverSpringForDismissWithVelocity:isCompact:", v57, 0.0, 0.0);
  id v134 = [v62 initWithDuration:v63 timingParameters:0.0];

  id v64 = objc_alloc((Class)UIViewPropertyAnimator);
  [(BCCardStackTransitionAnimator *)v135 _adjustDuration:0.15];
  double v66 = v65;
  CGRect v67 = [(BCCardStackTransitionAnimator *)v135 _customCurve];
  id v128 = [v64 initWithDuration:v67 timingParameters:v66];

  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id obj = [(BCCardStackTransitionAnimator *)v135 coverMoveItems];
  id v68 = [obj countByEnumeratingWithState:&v174 objects:v211 count:16];
  if (v68)
  {
    id v69 = v68;
    id v70 = 0;
    id v126 = *(id *)v175;
    do
    {
      for (m = 0; m != v69; m = (char *)m + 1)
      {
        if (*(id *)v175 != v126) {
          objc_enumerationMutation(obj);
        }
        CGRect v72 = *(void **)(*((void *)&v174 + 1) + 8 * (void)m);
        CGRect v73 = [v72 key];
        CGRect v74 = [v136 objectForKeyedSubscript:v73];
        id v75 = [v74 coverView];

        v171[0] = _NSConcreteStackBlock;
        v171[1] = 3221225472;
        v171[2] = sub_B7698;
        v171[3] = &unk_2C3AF8;
        id v76 = v75;
        id v172 = v76;
        v173 = v72;
        [v130 addAnimations:v171];
        v168[0] = _NSConcreteStackBlock;
        v168[1] = 3221225472;
        v168[2] = sub_B76D4;
        v168[3] = &unk_2C3AF8;
        id v77 = v76;
        id v169 = v77;
        long long v170 = v72;
        [v134 addAnimations:v168];
        if ([v72 needsFadeInOnDismiss])
        {
          if (!v70)
          {
            id v78 = objc_alloc((Class)UIViewPropertyAnimator);
            [(BCCardStackTransitionAnimator *)v135 _adjustDuration:0.15];
            id v70 = [v78 initWithDuration:0 curve:0 animations:];
          }
          [v77 setAlpha:0.0];
          v166[0] = _NSConcreteStackBlock;
          v166[1] = 3221225472;
          v166[2] = sub_B7738;
          v166[3] = &unk_2C3C50;
          id v167 = v77;
          [v70 addAnimations:v166];
        }
      }
      id v69 = [obj countByEnumeratingWithState:&v174 objects:v211 count:16];
    }
    while (v69);
  }
  else
  {
    id v70 = 0;
  }
  id v123 = v70;

  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id v127 = [(BCCardStackTransitionAnimator *)v135 cardMoveItems];
  id v79 = [v127 countByEnumeratingWithState:&v162 objects:v210 count:16];
  if (v79)
  {
    id v80 = v79;
    uint64_t v81 = *(void *)v163;
    do
    {
      for (n = 0; n != v80; n = (char *)n + 1)
      {
        if (*(void *)v163 != v81) {
          objc_enumerationMutation(v127);
        }
        uint64_t v83 = *(void **)(*((void *)&v162 + 1) + 8 * (void)n);
        id v84 = [v83 card];
        id v85 = [v84 cardStackTransitioningCardView];

        v159[0] = _NSConcreteStackBlock;
        v159[1] = 3221225472;
        v159[2] = sub_B7744;
        v159[3] = &unk_2C3AF8;
        id v86 = v85;
        id v160 = v86;
        id v161 = v83;
        [v132 addAnimations:v159];
        v156[0] = _NSConcreteStackBlock;
        v156[1] = 3221225472;
        v156[2] = sub_B7780;
        v156[3] = &unk_2C3AF8;
        id v87 = v86;
        id v157 = v87;
        long long v158 = v83;
        [v134 addAnimations:v156];
        v154[0] = _NSConcreteStackBlock;
        v154[1] = 3221225472;
        v154[2] = sub_B77E4;
        v154[3] = &unk_2C3C50;
        id v155 = v87;
        id v88 = v87;
        [v128 addAnimations:v154];
      }
      id v80 = [v127 countByEnumeratingWithState:&v162 objects:v210 count:16];
    }
    while (v80);
  }

  if (v124)
  {
    v151[0] = _NSConcreteStackBlock;
    v151[1] = 3221225472;
    v151[2] = sub_B77F0;
    v151[3] = &unk_2C83A8;
    id v152 = v121;
    CGAffineTransform v153 = v206;
    [v132 addAnimations:v151];
  }
  v89 = v120;
  [(BCViewPropertyAnimatorCounter *)v120 animate:v130];
  [(BCViewPropertyAnimatorCounter *)v120 animate:v132];
  [(BCViewPropertyAnimatorCounter *)v120 animate:v134];
  [(BCViewPropertyAnimatorCounter *)v120 animate:v128];
  p_isa = (id *)&v135->super.isa;
  v91 = v70;
  if (v70)
  {
    [(BCCardStackTransitionAnimator *)v135 _adjustDuration:0.1];
    -[BCViewPropertyAnimatorCounter animate:afterDelay:](v120, "animate:afterDelay:", v70);
  }
  id v92 = [(BCCardStackTransitionAnimator *)v135 coverFadeItems];
  id v93 = [v92 count];

  if (v93)
  {
    id v94 = objc_alloc((Class)UIViewPropertyAnimator);
    [(BCCardStackTransitionAnimator *)v135 _adjustDuration:0.3];
    id v95 = [v94 initWithDuration:0 curve:0 animations:];
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    uint64_t v96 = [(BCCardStackTransitionAnimator *)v135 coverFadeItems];
    id v97 = [v96 countByEnumeratingWithState:&v147 objects:v209 count:16];
    if (v97)
    {
      id v98 = v97;
      uint64_t v99 = *(void *)v148;
      do
      {
        for (ii = 0; ii != v98; ii = (char *)ii + 1)
        {
          if (*(void *)v148 != v99) {
            objc_enumerationMutation(v96);
          }
          id v101 = [*(id *)(*((void *)&v147 + 1) + 8 * (void)ii) key];
          double v102 = [v136 objectForKeyedSubscript:v101];
          double v103 = [v102 coverView];

          [v103 setAlpha:0.0];
          v145[0] = _NSConcreteStackBlock;
          v145[1] = 3221225472;
          v145[2] = sub_B782C;
          v145[3] = &unk_2C3C50;
          id v146 = v103;
          id v104 = v103;
          [v95 addAnimations:v145];
        }
        id v98 = [v96 countByEnumeratingWithState:&v147 objects:v209 count:16];
      }
      while (v98);
    }

    v89 = v120;
    [(BCViewPropertyAnimatorCounter *)v120 animate:v95];

    p_isa = (id *)&v135->super.isa;
    v91 = v123;
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v105 = [v136 allValues];
  id v106 = [v105 countByEnumeratingWithState:&v141 objects:v208 count:16];
  if (v106)
  {
    id v107 = v106;
    uint64_t v108 = *(void *)v142;
    do
    {
      for (jj = 0; jj != v107; jj = (char *)jj + 1)
      {
        if (*(void *)v142 != v108) {
          objc_enumerationMutation(v105);
        }
        [*(id *)(*((void *)&v141 + 1) + 8 * (void)jj) setCounter:v89];
      }
      id v107 = [v105 countByEnumeratingWithState:&v141 objects:v208 count:16];
    }
    while (v107);
  }

  [p_isa setCoverControllers:v136];
  [p_isa _adjustDuration:0.5];
  double v111 = v110;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v112 = p_isa[1];
  id v113 = [v112 countByEnumeratingWithState:&v137 objects:v207 count:16];
  if (v113)
  {
    id v114 = v113;
    uint64_t v115 = *(void *)v138;
    do
    {
      for (kk = 0; kk != v114; kk = (char *)kk + 1)
      {
        if (*(void *)v138 != v115) {
          objc_enumerationMutation(v112);
        }
        (*(void (**)(double))(*(void *)(*((void *)&v137 + 1) + 8 * (void)kk) + 16))(v111);
      }
      id v114 = [v112 countByEnumeratingWithState:&v137 objects:v207 count:16];
    }
    while (v114);
  }
}

- (void)_animatePushByCrossfading:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  long long v6 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  BOOL v7 = [v4 viewForKey:@"BCUITransitionContextBackgroundViewKey"];
  BOOL cardsCanExpand = self->_cardsCanExpand;
  [v4 finalFrameForViewController:v5];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [v5 view];
  [v17 setFrame:v10, v12, v14, v16];

  CGRect v18 = [v4 containerView];
  double v19 = [v5 view];
  [v18 addSubview:v19];

  if (v6) {
    BOOL v20 = !cardsCanExpand;
  }
  else {
    BOOL v20 = 0;
  }
  double v21 = 1.0;
  if (!v20) {
    double v21 = 0.0;
  }
  [v7 setAlpha:v21];
  [(BCCardStackTransitionAnimator *)self _adjustDuration:0.3];
  double v23 = v22;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_B7B54;
  v40[3] = &unk_2C3AF8;
  id v24 = v7;
  id v41 = v24;
  id v25 = v5;
  id v42 = v25;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_B7BB4;
  v38[3] = &unk_2C5968;
  id v26 = v4;
  id v39 = v26;
  +[UIView animateWithDuration:v40 animations:v38 completion:v23];
  [(BCCardStackTransitionAnimator *)self _adjustDuration:0.3];
  double v28 = v27;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  double v29 = self->_additionalAnimations;
  id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v35;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(v29);
        }
        (*(void (**)(double))(*(void *)(*((void *)&v34 + 1) + 8 * i) + 16))(v28);
      }
      id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v31);
  }
}

- (void)_animatePopByCrossfading:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  long long v6 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  BOOL v7 = [v4 viewForKey:@"BCUITransitionContextBackgroundViewKey"];
  BOOL v9 = self->_cardsCanExpand || v5 == 0;
  [(BCCardStackTransitionAnimator *)self _adjustDuration:0.3];
  double v11 = v10;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_B7E58;
  v28[3] = &unk_2C40C0;
  BOOL v31 = v9;
  id v12 = v7;
  id v29 = v12;
  id v13 = v6;
  id v30 = v13;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_B7EC0;
  v26[3] = &unk_2C5968;
  id v14 = v4;
  id v27 = v14;
  +[UIView animateWithDuration:v28 animations:v26 completion:v11];
  [(BCCardStackTransitionAnimator *)self _adjustDuration:0.3];
  double v16 = v15;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v17 = self->_additionalAnimations;
  id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      double v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        (*(void (**)(double))(*(void *)(*((void *)&v22 + 1) + 8 * (void)v21) + 16))(v16);
        double v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v19);
  }
}

+ (BOOL)_isSlowModeEnabled
{
  double v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BCCardStackTransitionAnimatorSlowModeEnabled"];

  return v3;
}

- (double)_debugDragCoefficient
{
  if ([(id)objc_opt_class() _isSlowModeEnabled]) {
    double v2 = 3.0;
  }
  else {
    double v2 = 1.0;
  }
  UIAnimationDragCoefficient();
  return v2 * v3;
}

- (double)_adjustDuration:(double)a3
{
  [(BCCardStackTransitionAnimator *)self _debugDragCoefficient];
  return v4 * a3;
}

- (id)_adjustSpring:(id)a3
{
  id v4 = a3;
  [(BCCardStackTransitionAnimator *)self _debugDragCoefficient];
  double v6 = v5;
  id v7 = objc_alloc((Class)UISpringTimingParameters);
  [v4 mass];
  double v9 = v8;
  [v4 stiffness];
  double v11 = v10 / (v6 * v6);
  [v4 damping];
  double v13 = v12 / v6;
  [v4 initialVelocity];
  double v15 = v14;
  double v17 = v16;

  id v18 = [v7 initWithMass:v9 stiffness:v11 damping:v13 initialVelocity:v15];

  return v18;
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(int64_t)a3
{
  self->_animationType = a3;
}

- (BOOL)prefersCrossfade
{
  return self->_prefersCrossfade;
}

- (void)setPrefersCrossfade:(BOOL)a3
{
  self->_prefersCrossfade = a3;
}

- (NSArray)coverMoveItems
{
  return self->_coverMoveItems;
}

- (void)setCoverMoveItems:(id)a3
{
}

- (NSArray)cardMoveItems
{
  return self->_cardMoveItems;
}

- (void)setCardMoveItems:(id)a3
{
}

- (NSArray)cardSlideItems
{
  return self->_cardSlideItems;
}

- (void)setCardSlideItems:(id)a3
{
}

- (NSArray)coverFadeItems
{
  return self->_coverFadeItems;
}

- (void)setCoverFadeItems:(id)a3
{
}

- (double)velocityForPop
{
  return self->_velocityForPop;
}

- (void)setVelocityForPop:(double)a3
{
  self->_velocityForPop = a3;
}

- (NSMutableArray)viewsToBeCleanedUp
{
  return self->_viewsToBeCleanedUp;
}

- (void)setViewsToBeCleanedUp:(id)a3
{
}

- (NSDictionary)coverControllers
{
  return self->_coverControllers;
}

- (void)setCoverControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverControllers, 0);
  objc_storeStrong((id *)&self->_viewsToBeCleanedUp, 0);
  objc_storeStrong((id *)&self->_coverFadeItems, 0);
  objc_storeStrong((id *)&self->_cardSlideItems, 0);
  objc_storeStrong((id *)&self->_cardMoveItems, 0);
  objc_storeStrong((id *)&self->_coverMoveItems, 0);

  objc_storeStrong((id *)&self->_additionalAnimations, 0);
}

@end