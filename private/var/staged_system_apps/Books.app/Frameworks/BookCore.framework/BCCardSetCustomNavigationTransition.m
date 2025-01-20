@interface BCCardSetCustomNavigationTransition
- (BCCardSetNavigationSource)cardSetViewController;
- (BOOL)afterScreenUpdates;
- (BOOL)animatorInitialized;
- (CGAffineTransform)startingTransform;
- (CGAffineTransform)targetTransform;
- (CGPoint)snapshotAnchorPoint;
- (CGRect)endingRect;
- (CGRect)offScreen;
- (CGRect)onScreen;
- (CGRect)snapshotFrame;
- (CGRect)startingRect;
- (UIView)fromView;
- (UIView)snapshotContainerView;
- (UIView)toView;
- (UIView)viewToHide;
- (UIView)viewToSlide;
- (UIView)viewToSnapshot;
- (UIViewController)toViewController;
- (UIViewControllerContextTransitioning)transitioningContext;
- (UIViewPropertyAnimator)animator;
- (double)gripperEndingAlpha;
- (double)gripperStartingAlpha;
- (double)transitionDuration:(id)a3;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (void)animateTransition:(id)a3;
- (void)animationCompleteWithFinished:(BOOL)a3;
- (void)createAnimator;
- (void)initalizeAnimation;
- (void)setAfterScreenUpdates:(BOOL)a3;
- (void)setAnimator:(id)a3;
- (void)setAnimatorInitialized:(BOOL)a3;
- (void)setCardSetViewController:(id)a3;
- (void)setEndingRect:(CGRect)a3;
- (void)setFromView:(id)a3;
- (void)setGripperEndingAlpha:(double)a3;
- (void)setGripperStartingAlpha:(double)a3;
- (void)setOffScreen:(CGRect)a3;
- (void)setOnScreen:(CGRect)a3;
- (void)setSnapshotAnchorPoint:(CGPoint)a3;
- (void)setSnapshotContainerView:(id)a3;
- (void)setSnapshotFrame:(CGRect)a3;
- (void)setStartingRect:(CGRect)a3;
- (void)setStartingTransform:(CGAffineTransform *)a3;
- (void)setTargetTransform:(CGAffineTransform *)a3;
- (void)setToView:(id)a3;
- (void)setToViewController:(id)a3;
- (void)setTransitioningContext:(id)a3;
- (void)setViewToHide:(id)a3;
- (void)setViewToSlide:(id)a3;
- (void)setViewToSnapshot:(id)a3;
- (void)setup;
- (void)updateAnimator;
@end

@implementation BCCardSetCustomNavigationTransition

- (void)animateTransition:(id)a3
{
  id v3 = [(BCCardSetCustomNavigationTransition *)self interruptibleAnimatorForTransition:a3];
  [v3 startAnimation];
}

- (void)initalizeAnimation
{
  id v3 = [(BCCardSetCustomNavigationTransition *)self transitioningContext];
  v4 = [v3 viewForKey:UITransitionContextFromViewKey];
  [(BCCardSetCustomNavigationTransition *)self setFromView:v4];

  v5 = [v3 viewForKey:UITransitionContextToViewKey];
  [(BCCardSetCustomNavigationTransition *)self setToView:v5];

  v6 = [v3 viewControllerForKey:UITransitionContextToViewControllerKey];
  [(BCCardSetCustomNavigationTransition *)self setToViewController:v6];

  v7 = [v3 viewControllerForKey:UITransitionContextFromViewControllerKey];
  [v3 initialFrameForViewController:v7];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  -[BCCardSetCustomNavigationTransition setOnScreen:](self, "setOnScreen:");
  v16 = [v7 traitCollection];
  v17 = (char *)[v16 layoutDirection];

  v156.origin.x = v9;
  v156.origin.double y = v11;
  v156.size.width = v13;
  v156.size.height = v15;
  double MinX = CGRectGetMinX(v156);
  v157.origin.x = v9;
  v157.origin.double y = v11;
  v157.size.width = v13;
  v157.size.height = v15;
  CGFloat Width = CGRectGetWidth(v157);
  double v20 = MinX - Width + -1.0;
  double v21 = MinX + Width + 1.0;
  if (v17 == (unsigned char *)&def_7D91C + 1) {
    double v22 = v20;
  }
  else {
    double v22 = v21;
  }
  v158.origin.x = v9;
  v158.origin.double y = v11;
  v158.size.width = v13;
  v158.size.height = v15;
  double MinY = CGRectGetMinY(v158);
  v159.origin.x = v9;
  v159.origin.double y = v11;
  v159.size.width = v13;
  v159.size.height = v15;
  double v24 = CGRectGetWidth(v159);
  v160.origin.x = v9;
  v160.origin.double y = v11;
  v160.size.width = v13;
  v160.size.height = v15;
  -[BCCardSetCustomNavigationTransition setOffScreen:](self, "setOffScreen:", v22, MinY, v24, CGRectGetHeight(v160));
  -[BCCardSetCustomNavigationTransition setSnapshotFrame:](self, "setSnapshotFrame:", v9, v11, v13, v15);
  id v25 = [objc_alloc((Class)UIView) initWithFrame:v9, v11, v13, v15];
  [(BCCardSetCustomNavigationTransition *)self setSnapshotContainerView:v25];

  [(BCCardSetCustomNavigationTransition *)self setup];
  v26 = [v3 containerView];
  v27 = [(BCCardSetCustomNavigationTransition *)self toView];
  [v26 addSubview:v27];

  v28 = [(BCCardSetCustomNavigationTransition *)self viewToSnapshot];
  [v28 frame];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  [(BCCardSetCustomNavigationTransition *)self snapshotFrame];
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  v45 = [(BCCardSetCustomNavigationTransition *)self viewToSnapshot];
  [v45 setFrame:v38, v40, v42, v44];

  objc_opt_class();
  v46 = [(BCCardSetCustomNavigationTransition *)self viewToSnapshot];
  v47 = BUDynamicCast();

  [v47 contentOffset];
  double v49 = v48;
  double v51 = v50;
  double y = CGPointZero.y;
  [v47 setContentOffset:CGPointZero.x, y];
  v53 = [(BCCardSetCustomNavigationTransition *)self viewToSnapshot];
  v54 = [v53 snapshotViewAfterScreenUpdates:[self afterScreenUpdates]];

  v135 = v47;
  [v47 setContentOffset:v49, v51];
  v55 = [(BCCardSetCustomNavigationTransition *)self viewToSnapshot];
  [v55 setFrame:v30, v32, v34, v36];

  v56 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v57 = [v56 currentCardViewController];

  v58 = [v57 auxiliaryNavigationBarView];
  [v58 setHidden:1];

  v59 = +[UIColor bc_booksBackground];
  [v54 setBackgroundColor:v59];

  v136 = v7;
  if (_os_feature_enabled_impl())
  {
    v60 = [v57 auxiliaryNavigationBarViewForAnimation];
    [v54 addSubview:v60];
    [v57 anchorAuxiliaryNavigationBarView:v60 toView:v54];
  }
  else
  {
    v60 = +[BCCardGripperView cardGripperViewWithStyle:0];
    [v54 addSubview:v60];
    [v57 anchorGripperView:v60 toView:v54];
  }
  [(BCCardSetCustomNavigationTransition *)self gripperStartingAlpha];
  [v60 setAlpha:];
  v61 = [(BCCardSetCustomNavigationTransition *)self viewToHide];
  [v61 setAlpha:0.0];

  v62 = [(BCCardSetCustomNavigationTransition *)self viewToSlide];
  id v63 = objc_alloc((Class)UIView);
  [(BCCardSetCustomNavigationTransition *)self startingRect];
  id v64 = [v63 initWithFrame:];
  [v64 bounds];
  [v62 setFrame:];
  v134 = v62;
  [v64 addSubview:v62];
  long long v65 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v155[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v66 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v155[1] = v65;
  v155[2] = v66;
  [v54 setTransform:v155];
  [(BCCardSetCustomNavigationTransition *)self snapshotAnchorPoint];
  if (v68 != CGPointZero.x || v67 != y)
  {
    [(BCCardSetCustomNavigationTransition *)self snapshotAnchorPoint];
    double v70 = v69;
    double v72 = v71;
    v73 = [v54 layer];
    [v73 setAnchorPoint:v70, v72];
  }
  [(BCCardSetCustomNavigationTransition *)self snapshotFrame];
  [v54 setFrame:];
  [v57 setRoundedCorners:1];
  v74 = [v57 cardView];
  [v74 _cornerRadius];
  [v54 _setContinuousCornerRadius:];

  [v54 setClipsToBounds:1];
  [(BCCardSetCustomNavigationTransition *)self startingTransform];
  v75 = [(BCCardSetCustomNavigationTransition *)self snapshotContainerView];
  v154[0] = v154[3];
  v154[1] = v154[4];
  v154[2] = v154[5];
  [v75 setTransform:v154];

  v76 = [(BCCardSetCustomNavigationTransition *)self snapshotContainerView];
  [v76 addSubview:v54];

  v77 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v78 = (char *)[v77 focusedIndex];

  v79 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v80 = (char *)[v79 cardCount];

  if (v78)
  {
    v81 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    v82 = [v81 cardViewControllerAtIndex:v78 - 1];
    v137 = [v82 cardView];
  }
  else
  {
    v137 = 0;
  }
  if (v78 >= v80)
  {
    v85 = 0;
  }
  else
  {
    v83 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    v84 = [v83 cardViewControllerAtIndex:v78 + 1];
    v85 = [v84 cardView];
  }
  if (v137)
  {
    v86 = [v137 snapshotViewAfterScreenUpdates:[self afterScreenUpdates]];
    [(BCCardSetCustomNavigationTransition *)self snapshotFrame];
    double v88 = v87;
    double v90 = v89;
    double v92 = v91;
    double v94 = v93;
    [(BCCardSetCustomNavigationTransition *)self snapshotFrame];
    double v96 = v95;
    v97 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    [v97 _cardSeparation];
    double v99 = v88 - (v96 + v98);

    [v86 setFrame:v99, v90, v92, v94];
    v100 = [(BCCardSetCustomNavigationTransition *)self snapshotContainerView];
    [v100 addSubview:v86];
  }
  if (v85)
  {
    v101 = [v85 snapshotViewAfterScreenUpdates:[self afterScreenUpdates]];
    [(BCCardSetCustomNavigationTransition *)self snapshotFrame];
    double v103 = v102;
    double v105 = v104;
    double v107 = v106;
    double v109 = v108;
    [(BCCardSetCustomNavigationTransition *)self snapshotFrame];
    double v111 = v110;
    v112 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
    [v112 _cardSeparation];
    double v114 = v103 + v111 + v113;

    [v101 setFrame:v114, v105, v107, v109];
    v115 = [(BCCardSetCustomNavigationTransition *)self snapshotContainerView];
    [v115 addSubview:v101];
  }
  v116 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v117 = [v116 navigationSkrimView];
  [v117 removeFromSuperview];

  v118 = [v3 containerView];
  v119 = [(BCCardSetCustomNavigationTransition *)self snapshotContainerView];
  [v118 addSubview:v119];

  v120 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  [v120 navigationSkrimView];
  v121 = v133 = v85;
  [v118 addSubview:v121];

  [v118 addSubview:v64];
  v122 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  v123 = [v122 delegate];
  v124 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  [v123 cardSetViewController:v124 prepareForNavigationTransitionWithContext:v3];

  [(BCCardSetCustomNavigationTransition *)self updateAnimator];
  long long v153 = 0u;
  long long v152 = 0u;
  long long v151 = 0u;
  [(BCCardSetCustomNavigationTransition *)self targetTransform];
  v125 = [(BCCardSetCustomNavigationTransition *)self animator];
  v144[0] = _NSConcreteStackBlock;
  v144[1] = 3221225472;
  v144[2] = sub_9F6B8;
  v144[3] = &unk_2C7F48;
  id v126 = v64;
  id v145 = v126;
  v146 = self;
  long long v148 = v151;
  long long v149 = v152;
  long long v150 = v153;
  id v147 = v60;
  id v127 = v60;
  [v125 addAnimations:v144];
  v138[0] = _NSConcreteStackBlock;
  v138[1] = 3221225472;
  v138[2] = sub_9F730;
  v138[3] = &unk_2C7F70;
  v138[4] = self;
  id v139 = v118;
  id v140 = v134;
  id v141 = v126;
  id v142 = v3;
  id v143 = v57;
  id v128 = v57;
  id v129 = v3;
  id v130 = v126;
  id v131 = v134;
  id v132 = v118;
  [v125 addCompletion:v138];
  [(BCCardSetCustomNavigationTransition *)self setAnimatorInitialized:1];
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id v4 = a3;
  v5 = [(BCCardSetCustomNavigationTransition *)self animator];

  if (!v5)
  {
    [(BCCardSetCustomNavigationTransition *)self setTransitioningContext:v4];
    [(BCCardSetCustomNavigationTransition *)self createAnimator];
  }
  if (![(BCCardSetCustomNavigationTransition *)self animatorInitialized]) {
    [(BCCardSetCustomNavigationTransition *)self initalizeAnimation];
  }
  v6 = [(BCCardSetCustomNavigationTransition *)self animator];

  return v6;
}

- (void)createAnimator
{
  id v3 = [(BCCardSetCustomNavigationTransition *)self cardSetViewController];
  id v4 = [v3 percentDrivenInteractiveTransition];
  if (v4) {
    id v5 = [objc_alloc((Class)UICubicTimingParameters) initWithAnimationCurve:3];
  }
  else {
    id v5 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:250.0 damping:35.0 initialVelocity:0.0];
  }
  id v7 = v5;

  id v6 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v7 timingParameters:0.35];
  [(BCCardSetCustomNavigationTransition *)self setAnimator:v6];
}

- (double)transitionDuration:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardSetCustomNavigationTransition *)self animator];

  if (!v5)
  {
    [(BCCardSetCustomNavigationTransition *)self setTransitioningContext:v4];
    [(BCCardSetCustomNavigationTransition *)self createAnimator];
  }
  id v6 = [(BCCardSetCustomNavigationTransition *)self animator];
  [v6 duration];
  double v8 = v7;

  return v8;
}

- (void)updateAnimator
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"must override %s", "-[BCCardSetCustomNavigationTransition updateAnimator]");
  id v3 = +[NSException exceptionWithName:@"abstract base class" reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (void)animationCompleteWithFinished:(BOOL)a3
{
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"must override %s", "-[BCCardSetCustomNavigationTransition animationCompleteWithFinished:]");
  id v4 = +[NSException exceptionWithName:@"abstract base class" reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)setup
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"must override %s", "-[BCCardSetCustomNavigationTransition setup]");
  id v3 = +[NSException exceptionWithName:@"abstract base class" reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (BCCardSetNavigationSource)cardSetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardSetViewController);

  return (BCCardSetNavigationSource *)WeakRetained;
}

- (void)setCardSetViewController:(id)a3
{
}

- (UIViewControllerContextTransitioning)transitioningContext
{
  return self->_transitioningContext;
}

- (void)setTransitioningContext:(id)a3
{
}

- (UIViewPropertyAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
}

- (UIView)toView
{
  return self->_toView;
}

- (void)setToView:(id)a3
{
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
}

- (UIView)fromView
{
  return self->_fromView;
}

- (void)setFromView:(id)a3
{
}

- (CGRect)onScreen
{
  double x = self->_onScreen.origin.x;
  double y = self->_onScreen.origin.y;
  double width = self->_onScreen.size.width;
  double height = self->_onScreen.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOnScreen:(CGRect)a3
{
  self->_onScreen = a3;
}

- (CGRect)offScreen
{
  double x = self->_offScreen.origin.x;
  double y = self->_offScreen.origin.y;
  double width = self->_offScreen.size.width;
  double height = self->_offScreen.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOffScreen:(CGRect)a3
{
  self->_offScreen = a3;
}

- (CGRect)snapshotFrame
{
  double x = self->_snapshotFrame.origin.x;
  double y = self->_snapshotFrame.origin.y;
  double width = self->_snapshotFrame.size.width;
  double height = self->_snapshotFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSnapshotFrame:(CGRect)a3
{
  self->_snapshotFrame = a3;
}

- (CGPoint)snapshotAnchorPoint
{
  double x = self->_snapshotAnchorPoint.x;
  double y = self->_snapshotAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSnapshotAnchorPoint:(CGPoint)a3
{
  self->_snapshotAnchorPoint = a3;
}

- (UIView)viewToSlide
{
  return self->_viewToSlide;
}

- (void)setViewToSlide:(id)a3
{
}

- (CGRect)startingRect
{
  double x = self->_startingRect.origin.x;
  double y = self->_startingRect.origin.y;
  double width = self->_startingRect.size.width;
  double height = self->_startingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStartingRect:(CGRect)a3
{
  self->_startingRect = a3;
}

- (CGRect)endingRect
{
  double x = self->_endingRect.origin.x;
  double y = self->_endingRect.origin.y;
  double width = self->_endingRect.size.width;
  double height = self->_endingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEndingRect:(CGRect)a3
{
  self->_endingRect = a3;
}

- (UIView)snapshotContainerView
{
  return self->_snapshotContainerView;
}

- (void)setSnapshotContainerView:(id)a3
{
}

- (UIView)viewToSnapshot
{
  return self->_viewToSnapshot;
}

- (void)setViewToSnapshot:(id)a3
{
}

- (UIView)viewToHide
{
  return self->_viewToHide;
}

- (void)setViewToHide:(id)a3
{
}

- (CGAffineTransform)startingTransform
{
  long long v3 = *(_OWORD *)&self[6].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[6].tx;
  return self;
}

- (void)setStartingTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_startingTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_startingTransform.tdouble x = v4;
  *(_OWORD *)&self->_startingTransform.a = v3;
}

- (CGAffineTransform)targetTransform
{
  long long v3 = *(_OWORD *)&self[7].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[7].tx;
  return self;
}

- (void)setTargetTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_targetTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_targetTransform.tdouble x = v4;
  *(_OWORD *)&self->_targetTransform.a = v3;
}

- (double)gripperStartingAlpha
{
  return self->_gripperStartingAlpha;
}

- (void)setGripperStartingAlpha:(double)a3
{
  self->_gripperStartingAlpha = a3;
}

- (double)gripperEndingAlpha
{
  return self->_gripperEndingAlpha;
}

- (void)setGripperEndingAlpha:(double)a3
{
  self->_gripperEndingAlpha = a3;
}

- (BOOL)animatorInitialized
{
  return self->_animatorInitialized;
}

- (void)setAnimatorInitialized:(BOOL)a3
{
  self->_animatorInitialized = a3;
}

- (BOOL)afterScreenUpdates
{
  return self->_afterScreenUpdates;
}

- (void)setAfterScreenUpdates:(BOOL)a3
{
  self->_afterScreenUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewToHide, 0);
  objc_storeStrong((id *)&self->_viewToSnapshot, 0);
  objc_storeStrong((id *)&self->_snapshotContainerView, 0);
  objc_storeStrong((id *)&self->_viewToSlide, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_toView, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_transitioningContext, 0);

  objc_destroyWeak((id *)&self->_cardSetViewController);
}

@end