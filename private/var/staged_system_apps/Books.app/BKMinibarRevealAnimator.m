@interface BKMinibarRevealAnimator
- (BKMinibarRevealAnimator)initWithOpening:(BOOL)a3;
- (BOOL)interactive;
- (BOOL)opening;
- (IMViewState)contentViewState;
- (IMViewState)minibarViewState;
- (IMViewState)tabBarViewState;
- (UIView)blackBottomView;
- (UIView)clipView;
- (UIView)containerView;
- (UIView)contentView;
- (UIView)minibarView;
- (UIView)tabBarView;
- (UIViewController)fromViewController;
- (UIViewController)toViewController;
- (UIViewControllerContextTransitioning)transitionContext;
- (double)duration;
- (double)transitionDuration:(id)a3;
- (id)minifiedBarAnimator;
- (void)_animationDidFinish;
- (void)_loadStateFromContext:(id)a3;
- (void)_setupViews;
- (void)_teardownViews:(BOOL)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)setBlackBottomView:(id)a3;
- (void)setClipView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewState:(id)a3;
- (void)setFromViewController:(id)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setMinibarView:(id)a3;
- (void)setMinibarViewState:(id)a3;
- (void)setOpening:(BOOL)a3;
- (void)setTabBarView:(id)a3;
- (void)setTabBarViewState:(id)a3;
- (void)setToViewController:(id)a3;
- (void)setTransitionContext:(id)a3;
@end

@implementation BKMinibarRevealAnimator

- (BKMinibarRevealAnimator)initWithOpening:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKMinibarRevealAnimator;
  result = [(BKMinibarRevealAnimator *)&v5 init];
  if (result) {
    result->_opening = a3;
  }
  return result;
}

- (double)duration
{
  unsigned int v2 = [(BKMinibarRevealAnimator *)self interactive];
  double result = 0.7;
  if (!v2) {
    return 0.5;
  }
  return result;
}

- (void)_loadStateFromContext:(id)a3
{
  id v4 = a3;
  [(BKMinibarRevealAnimator *)self setTransitionContext:v4];
  objc_super v5 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  [(BKMinibarRevealAnimator *)self setFromViewController:v5];

  v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  [(BKMinibarRevealAnimator *)self setToViewController:v6];

  v7 = [v4 containerView];
  [(BKMinibarRevealAnimator *)self setContainerView:v7];

  id v8 = [v4 isInteractive];

  [(BKMinibarRevealAnimator *)self setInteractive:v8];
}

- (double)transitionDuration:(id)a3
{
  [(BKMinibarRevealAnimator *)self _loadStateFromContext:a3];

  [(BKMinibarRevealAnimator *)self duration];
  return result;
}

- (void)animateTransition:(id)a3
{
  [(BKMinibarRevealAnimator *)self _loadStateFromContext:a3];
  [(BKMinibarRevealAnimator *)self _setupViews];
  id v4 = [(BKMinibarRevealAnimator *)self tabBarView];
  [v4 frame];
  uint64_t v115 = v5;
  uint64_t v116 = v6;
  double v8 = v7;
  uint64_t v117 = v9;

  if ([(BKMinibarRevealAnimator *)self opening])
  {
    v10 = [(BKMinibarRevealAnimator *)self minibarView];
    [v10 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v19 = [(BKMinibarRevealAnimator *)self containerView];
    [v19 bounds];
    uint64_t v113 = v21;
    uint64_t v114 = v20;
    double v23 = v22;
    double v25 = v24;

    v120.origin.x = v12;
    v120.origin.y = v14;
    v120.size.width = v16;
    v120.size.height = v18;
    double v112 = v23 - CGRectGetHeight(v120);
    v121.origin.x = v12;
    v121.origin.y = v14;
    v121.size.width = v16;
    v121.size.height = v18;
    double v26 = v25 + CGRectGetHeight(v121);
    v27 = [(BKMinibarRevealAnimator *)self contentView];
    [v27 frame];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;

    v34 = [(BKMinibarRevealAnimator *)self minibarView];
    [v34 frame];
    double MaxY = CGRectGetMaxY(v122);

    v36 = [(BKMinibarRevealAnimator *)self contentView];
    [v36 setFrame:v29 MaxY:v31 v33];

    v37 = [(BKMinibarRevealAnimator *)self blackBottomView];
    [v37 frame];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;

    v123.origin.x = v29;
    v123.origin.y = MaxY;
    v123.size.width = v31;
    v123.size.height = v33;
    double v44 = CGRectGetMaxY(v123);
    v45 = [(BKMinibarRevealAnimator *)self blackBottomView];
    [v45 setFrame:v39, v44, v41, v43];

    v124.origin.x = v39;
    v124.origin.y = v44;
    v124.size.width = v41;
    v124.size.height = v43;
    double v46 = v26 + CGRectGetHeight(v124);
    v47 = [(BKMinibarRevealAnimator *)self containerView];
    [v47 bounds];
    CGFloat Height = CGRectGetHeight(v125);
  }
  else
  {
    v49 = [(BKMinibarRevealAnimator *)self minifiedBarAnimator];
    v50 = [(BKMinibarRevealAnimator *)self toViewController];
    [v49 minifiedBarAnimatorAnimateShowIfNeededToViewController:v50 force:1];

    v51 = [(BKMinibarRevealAnimator *)self minifiedBarAnimator];
    v52 = [v51 minifiedBarAnimatorContainerView];
    [v52 frame];
    uint64_t v113 = v54;
    uint64_t v114 = v53;
    double v112 = v55;
    double v110 = v56;

    v57 = [(BKMinibarRevealAnimator *)self contentView];
    [v57 frame];
    double v111 = v8;
    double v59 = v58;
    double v109 = v60;
    double v62 = v61;
    double v64 = v63;

    v65 = [(BKMinibarRevealAnimator *)self minibarView];
    [v65 frame];
    double v67 = v66;
    CGFloat v106 = v68;
    CGFloat v107 = v66;
    double v69 = v68;
    double v71 = v70;

    v72 = [(BKMinibarRevealAnimator *)self minibarView];
    [v72 setFrame:v67, 0.0, v69, v71];

    v126.origin.y = 0.0;
    v126.origin.x = v67;
    v126.size.width = v69;
    v126.size.height = v71;
    double v73 = CGRectGetHeight(v126);
    v74 = [(BKMinibarRevealAnimator *)self contentView];
    double v108 = v59;
    double v75 = v62;
    CGFloat v76 = v62;
    double v104 = v64;
    double v105 = v62;
    CGFloat v77 = v64;
    [v74 setFrame:v59, v73, v75, v64];

    v78 = [(BKMinibarRevealAnimator *)self blackBottomView];
    [v78 frame];
    double v80 = v79;
    double v82 = v81;
    double v84 = v83;

    v127.origin.x = v59;
    v127.origin.y = v73;
    v127.size.width = v76;
    v127.size.height = v77;
    double v85 = CGRectGetMaxY(v127);
    v86 = [(BKMinibarRevealAnimator *)self blackBottomView];
    CGFloat v87 = v82;
    [v86 setFrame:v80, v85, v82, v84];

    v128.origin.y = 0.0;
    v128.origin.x = v107;
    v128.size.width = v106;
    v128.size.height = v71;
    double v88 = v109 - CGRectGetHeight(v128);
    v129.origin.y = 0.0;
    v129.origin.x = v107;
    v129.size.width = v106;
    v129.size.height = v71;
    double v89 = v104 + CGRectGetHeight(v129);
    v130.origin.x = v80;
    v130.origin.y = v85;
    v130.size.width = v87;
    v130.size.height = v84;
    double v90 = v89 + CGRectGetHeight(v130);
    v91 = [(BKMinibarRevealAnimator *)self clipView];
    [v91 setFrame:v108, v88, v105, v90];

    v92 = [(BKMinibarRevealAnimator *)self tabBarView];
    [v92 frame];
    double v94 = v93;
    double v96 = v95;
    double v98 = v97;

    v99 = [(BKMinibarRevealAnimator *)self containerView];
    [v99 bounds];
    double v100 = CGRectGetHeight(v131);

    v47 = [(BKMinibarRevealAnimator *)self tabBarView];
    double v101 = v96;
    double v102 = v98;
    double v46 = v110;
    CGFloat Height = v111;
    [v47 setFrame:v94, v100, v101, v102];
  }

  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472;
  v119[2] = sub_1000B588C;
  v119[3] = &unk_100A44268;
  v119[4] = self;
  v103 = +[IMAnimationTracker animationTrackerWithCompletion:v119];
  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_1000B5908;
  v118[3] = &unk_100A44F18;
  v118[4] = self;
  v118[5] = v114;
  *(double *)&v118[6] = v112;
  v118[7] = v113;
  *(double *)&v118[8] = v46;
  v118[9] = v115;
  *(CGFloat *)&v118[10] = Height;
  v118[11] = v117;
  v118[12] = v116;
  [v103 addAnimationWithBlock:v118];
}

- (void)_animationDidFinish
{
  v3 = [(BKMinibarRevealAnimator *)self toViewController];
  BUProtocolCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_opt_respondsToSelector())
  {
    id v4 = [(BKMinibarRevealAnimator *)self containerView];
    [v7 transitionContextWillCompleteTransitionInContainerView:v4];
  }
  uint64_t v5 = [(BKMinibarRevealAnimator *)self transitionContext];
  uint64_t v6 = [(BKMinibarRevealAnimator *)self transitionContext];
  [v5 completeTransition:[v6 transitionWasCancelled] ^ 1];
}

- (void)animationEnded:(BOOL)a3
{
}

- (void)_setupViews
{
  if ([(BKMinibarRevealAnimator *)self opening]) {
    [(BKMinibarRevealAnimator *)self toViewController];
  }
  else {
  v3 = [(BKMinibarRevealAnimator *)self fromViewController];
  }
  id v4 = [v3 view];
  [(BKMinibarRevealAnimator *)self setContentView:v4];

  uint64_t v5 = [(BKMinibarRevealAnimator *)self contentView];
  uint64_t v6 = +[IMViewState saveStateForView:v5 flags:8];
  [(BKMinibarRevealAnimator *)self setContentViewState:v6];

  id v7 = [(BKMinibarRevealAnimator *)self contentView];
  [v7 setAutoresizingMask:0];

  double v8 = [(BKMinibarRevealAnimator *)self containerView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [(BKMinibarRevealAnimator *)self contentView];
  [v17 setFrame:v10, v12, v14, v16];

  id v44 = [(BKMinibarRevealAnimator *)self minifiedBarAnimator];
  CGFloat v18 = [v44 minifiedBarAnimatorContainerView];
  v19 = [v44 minifiedBarAnimatorMinibarView];
  [(BKMinibarRevealAnimator *)self setMinibarView:v19];

  uint64_t v20 = [(BKMinibarRevealAnimator *)self minibarView];
  uint64_t v21 = +[IMViewState saveStateForView:v20 flags:1];
  [(BKMinibarRevealAnimator *)self setMinibarViewState:v21];

  double v22 = [v44 minifiedBarAnimatorTabBarView];
  [(BKMinibarRevealAnimator *)self setTabBarView:v22];

  double v23 = [(BKMinibarRevealAnimator *)self tabBarView];
  double v24 = +[IMViewState saveStateForView:v23 flags:16];
  [(BKMinibarRevealAnimator *)self setTabBarViewState:v24];

  id v25 = objc_alloc((Class)UIView);
  [v18 frame];
  id v26 = [v25 initWithFrame:];
  [(BKMinibarRevealAnimator *)self setClipView:v26];

  v27 = [(BKMinibarRevealAnimator *)self clipView];
  [v27 setClipsToBounds:1];

  if (![(BKMinibarRevealAnimator *)self opening])
  {
    double v28 = [(BKMinibarRevealAnimator *)self containerView];
    double v29 = [(BKMinibarRevealAnimator *)self toViewController];
    double v30 = [v29 view];
    [v28 addSubview:v30];
  }
  double v31 = [(BKMinibarRevealAnimator *)self containerView];
  double v32 = [(BKMinibarRevealAnimator *)self clipView];
  [v31 addSubview:v32];

  id v33 = objc_alloc((Class)UIView);
  v34 = [(BKMinibarRevealAnimator *)self containerView];
  [v34 frame];
  id v35 = [v33 initWithFrame:0.0, 0.0];
  [(BKMinibarRevealAnimator *)self setBlackBottomView:v35];

  v36 = +[UIColor blackColor];
  v37 = [(BKMinibarRevealAnimator *)self blackBottomView];
  [v37 setBackgroundColor:v36];

  double v38 = [(BKMinibarRevealAnimator *)self clipView];
  double v39 = [(BKMinibarRevealAnimator *)self minibarView];
  [v38 addSubview:v39];

  double v40 = [(BKMinibarRevealAnimator *)self clipView];
  double v41 = [(BKMinibarRevealAnimator *)self contentView];
  [v40 addSubview:v41];

  double v42 = [(BKMinibarRevealAnimator *)self clipView];
  double v43 = [(BKMinibarRevealAnimator *)self blackBottomView];
  [v42 addSubview:v43];
}

- (void)_teardownViews:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(BKMinibarRevealAnimator *)self contentViewState];
  [v5 restore];

  uint64_t v6 = [(BKMinibarRevealAnimator *)self minibarViewState];
  [v6 restore];

  id v7 = [(BKMinibarRevealAnimator *)self tabBarViewState];
  [v7 restore];

  double v8 = [(BKMinibarRevealAnimator *)self containerView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [(BKMinibarRevealAnimator *)self contentView];
  [v17 setFrame:v10, v12, v14, v16];

  CGFloat v18 = [(BKMinibarRevealAnimator *)self containerView];
  if (v3)
  {
    v19 = [(BKMinibarRevealAnimator *)self toViewController];
    uint64_t v20 = [v19 view];
    [v18 addSubview:v20];

    [(BKMinibarRevealAnimator *)self fromViewController];
  }
  else
  {
    uint64_t v21 = [(BKMinibarRevealAnimator *)self fromViewController];
    double v22 = [v21 view];
    [v18 addSubview:v22];

    [(BKMinibarRevealAnimator *)self toViewController];
  double v23 = };
  double v24 = [v23 view];
  [v24 removeFromSuperview];

  id v25 = [(BKMinibarRevealAnimator *)self clipView];
  [v25 removeFromSuperview];
}

- (id)minifiedBarAnimator
{
  unsigned int v2 = [(BKMinibarRevealAnimator *)self toViewController];
  BOOL v3 = [v2 im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKMinifiedBarAnimating];

  return v3;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (void)setFromViewController:(id)a3
{
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)opening
{
  return self->_opening;
}

- (void)setOpening:(BOOL)a3
{
  self->_opening = a3;
}

- (IMViewState)minibarViewState
{
  return self->_minibarViewState;
}

- (void)setMinibarViewState:(id)a3
{
}

- (IMViewState)contentViewState
{
  return self->_contentViewState;
}

- (void)setContentViewState:(id)a3
{
}

- (IMViewState)tabBarViewState
{
  return self->_tabBarViewState;
}

- (void)setTabBarViewState:(id)a3
{
}

- (UIView)clipView
{
  return self->_clipView;
}

- (void)setClipView:(id)a3
{
}

- (UIView)minibarView
{
  return self->_minibarView;
}

- (void)setMinibarView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)tabBarView
{
  return self->_tabBarView;
}

- (void)setTabBarView:(id)a3
{
}

- (UIView)blackBottomView
{
  return self->_blackBottomView;
}

- (void)setBlackBottomView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blackBottomView, 0);
  objc_storeStrong((id *)&self->_tabBarView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_minibarView, 0);
  objc_storeStrong((id *)&self->_clipView, 0);
  objc_storeStrong((id *)&self->_tabBarViewState, 0);
  objc_storeStrong((id *)&self->_contentViewState, 0);
  objc_storeStrong((id *)&self->_minibarViewState, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);

  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end