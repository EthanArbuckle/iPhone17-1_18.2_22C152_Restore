@interface BKBookSlideOpenAnimator
- (UIView)contentClipView;
- (UIView)contentContainerView;
- (UIView)contentSnapshot;
- (UIView)contentTintView;
- (UIView)fullBookSnapshot;
- (double)accessoryFadeDuration;
- (double)contentTintFadeDuration;
- (double)duration;
- (double)minSecondHalfDelayOnClose;
- (double)minSecondHalfDelayOnOpen;
- (double)minibarSlideDuration;
- (double)revealDuration;
- (double)zoomDuration;
- (double)zoomedContentScale;
- (void)_teardownContentViews;
- (void)animateRevealWithCompletion:(id)a3;
- (void)animateZoomWithCompletion:(id)a3;
- (void)setContentClipView:(id)a3;
- (void)setContentContainerView:(id)a3;
- (void)setContentSnapshot:(id)a3;
- (void)setContentTintView:(id)a3;
- (void)setFullBookSnapshot:(id)a3;
- (void)setupViewsForReveal;
- (void)setupViewsForZoom;
- (void)teardownViews:(BOOL)a3;
@end

@implementation BKBookSlideOpenAnimator

- (double)duration
{
  [(BKBookSlideOpenAnimator *)self zoomDuration];
  double v4 = v3;
  [(BKBookSlideOpenAnimator *)self revealDuration];
  double v6 = v4 + v5;
  [(BKBookSlideOpenAnimator *)self accessoryFadeDuration];
  return v6 + v7;
}

- (double)zoomDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.65;
}

- (double)revealDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.65;
}

- (double)accessoryFadeDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.3;
}

- (double)minibarSlideDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.2;
}

- (double)zoomedContentScale
{
  [(BKBookOpenAnimator *)self zoomedCoverFrame];
  double Height = CGRectGetHeight(v7);
  double v4 = [(BKBookOpenAnimator *)self containerView];
  [v4 bounds];
  double v5 = Height / CGRectGetHeight(v8);

  return v5;
}

- (double)contentTintFadeDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.5;
}

- (double)minSecondHalfDelayOnOpen
{
  return 0.4;
}

- (double)minSecondHalfDelayOnClose
{
  return 0.0;
}

- (void)_teardownContentViews
{
  double v3 = [(BKBookSlideOpenAnimator *)self fullBookSnapshot];
  [v3 removeFromSuperview];

  [(BKBookSlideOpenAnimator *)self setFullBookSnapshot:0];
  double v4 = [(BKBookSlideOpenAnimator *)self contentTintView];
  [v4 removeFromSuperview];

  [(BKBookSlideOpenAnimator *)self setContentTintView:0];
  double v5 = [(BKBookSlideOpenAnimator *)self contentSnapshot];
  [v5 removeFromSuperview];

  [(BKBookSlideOpenAnimator *)self setContentSnapshot:0];
  double v6 = [(BKBookSlideOpenAnimator *)self contentContainerView];
  [v6 removeFromSuperview];

  [(BKBookSlideOpenAnimator *)self setContentContainerView:0];
  CGRect v7 = [(BKBookSlideOpenAnimator *)self contentClipView];
  [v7 removeFromSuperview];

  [(BKBookSlideOpenAnimator *)self setContentClipView:0];
}

- (void)teardownViews:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKBookSlideOpenAnimator *)self _teardownContentViews];
  v5.receiver = self;
  v5.super_class = (Class)BKBookSlideOpenAnimator;
  [(BKBookZoomRevealOpenAnimator *)&v5 teardownViews:v3];
}

- (void)setupViewsForZoom
{
  [(BKBookSlideOpenAnimator *)self _teardownContentViews];
  BOOL v3 = [(BKBookOpenAnimator *)self bookContainerView];
  [v3 setAlpha:0.0];

  id v5 = [(BKBookOpenAnimator *)self containerView];
  double v4 = [(BKBookOpenAnimator *)self coverContainerView];
  [v5 addSubview:v4];
}

- (void)animateZoomWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BKBookOpenAnimator *)self opening];
  [(BKBookOpenAnimator *)self closedCoverFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(BKBookOpenAnimator *)self zoomedCoverFrame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(BKBookSlideOpenAnimator *)self zoomDuration];
  [(BKBookOpenAnimator *)self animateNavigationBarWithDuration:v22 * 0.5 delay:0.0];
  if (v5)
  {
    double v41 = v15;
    uint64_t v42 = 0x3FA999999999999ALL;
    double v37 = v11;
    double v38 = v13;
    double v23 = v17;
    double v17 = v9;
    double v15 = v7;
    double v40 = 0.0;
    double v39 = 1.0;
    double v11 = v19;
    double v24 = v23;
    unsigned int v25 = [(BKBookOpenAnimator *)self fadeInCover];
  }
  else
  {
    uint64_t v42 = 0;
    double v37 = v19;
    double v38 = v21;
    double v39 = 0.0;
    double v40 = 0.05;
    double v41 = v7;
    double v24 = v9;
    double v21 = v13;
    unsigned int v25 = [(BKBookOpenAnimator *)self fadeInCover];
  }
  double v26 = 0.0;
  if ((v25 & v5) != 0) {
    double v27 = 0.0;
  }
  else {
    double v27 = 1.0;
  }
  if (([(BKBookOpenAnimator *)self fadeInCover] & (v5 ^ 1)) == 0) {
    double v26 = 1.0;
  }
  v28 = [(BKBookOpenAnimator *)self coverContainerView];
  [v28 setAlpha:v27];

  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", v15, v17, v37, v38);
  v29 = [(BKBookOpenAnimator *)self bookshelfTintView];
  [v29 setAlpha:v40];

  [(BKBookOpenAnimator *)self setBookshelfAlpha:v39];
  [(BKBookSlideOpenAnimator *)self zoomDuration];
  double v31 = v30;
  [(BKBookSlideOpenAnimator *)self minibarSlideDuration];
  [(BKBookOpenAnimator *)self minibarKeyFrameAnimationWithDuration:0 hide:v31 show:v32 completion:-1.0];
  [(BKBookSlideOpenAnimator *)self zoomDuration];
  double v34 = v33;
  v35 = [(BKBookZoomRevealOpenAnimator *)self zoomTimingFunction];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100115548;
  v44[3] = &unk_100A46AC0;
  v44[4] = self;
  *(double *)&v44[5] = v26;
  *(double *)&v44[6] = v41;
  *(double *)&v44[7] = v24;
  *(double *)&v44[8] = v11;
  *(double *)&v44[9] = v21;
  v44[10] = v42;
  v44[11] = v36;
  +[UIView animateWithDuration:v35 delay:0 timingFunction:v44 options:v4 animations:v34 completion:0.0];

  [(BKBookSlideOpenAnimator *)self zoomDuration];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001155D8;
  v43[3] = &unk_100A43D60;
  v43[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v43);
}

- (void)setupViewsForReveal
{
  if ([(BKBookOpenAnimator *)self opening]
    && ![(BKBookZoomRevealOpenAnimator *)self contentLoaded])
  {
    BCReportAssertionFailureWithMessage();
  }
  [(BKBookOpenAnimator *)self rightToLeft];
  [(BKBookOpenAnimator *)self setBookshelfAlpha:0.0];
  id v62 = [(BKBookOpenAnimator *)self bookViewController];
  BOOL v3 = [v62 transitionContentView];
  if (!v3) {
    BCReportAssertionFailureWithMessage();
  }
  id v4 = [(BKBookOpenAnimator *)self containerView];
  [v4 bounds];

  [(BKBookOpenAnimator *)self coverAspectRatio];
  unsigned int v5 = [(BKBookOpenAnimator *)self containerView];
  [v3 frame];
  double v7 = v6;
  double v9 = v8;
  double v10 = [v62 view];
  [v5 convertPoint:v10 fromView:v7];

  id v11 = objc_alloc((Class)UIView);
  CGRectMakeWithOriginSize();
  double v12 = (UIView *)[v11 initWithFrame:];
  contentClipView = self->_contentClipView;
  self->_contentClipView = v12;

  [(UIView *)self->_contentClipView setClipsToBounds:1];
  double v14 = [(BKBookOpenAnimator *)self containerView];
  double v15 = [(BKBookSlideOpenAnimator *)self contentClipView];
  double v16 = [(BKBookOpenAnimator *)self bookshelfTintView];
  [v14 insertSubview:v15 aboveSubview:v16];

  id v17 = objc_alloc((Class)UIView);
  CGRectMakeWithOriginSize();
  double v18 = [v17 initWithFrame:];
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v18;

  [(UIView *)self->_contentClipView addSubview:self->_contentContainerView];
  double v20 = self->_contentContainerView;
  [v3 frame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [v3 superview];
  -[UIView convertRect:fromView:](v20, "convertRect:fromView:", v29, v22, v24, v26, v28);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  double v38 = [v3 snapshotViewAfterScreenUpdates:0];
  contentSnapshot = self->_contentSnapshot;
  self->_contentSnapshot = v38;

  -[UIView setFrame:](self->_contentSnapshot, "setFrame:", v31, v33, v35, v37);
  [(UIView *)self->_contentContainerView addSubview:self->_contentSnapshot];
  id v40 = objc_alloc((Class)UIView);
  [(UIView *)self->_contentSnapshot bounds];
  double v41 = [v40 initWithFrame:];
  contentTintView = self->_contentTintView;
  self->_contentTintView = v41;

  v43 = +[UIColor blackColor];
  [(UIView *)self->_contentTintView setBackgroundColor:v43];

  [(UIView *)self->_contentSnapshot addSubview:self->_contentTintView];
  [(UIView *)self->_contentTintView setAutoresizingMask:18];
  if (objc_opt_respondsToSelector())
  {
    v44 = [v62 transitionContentBackgroundColor];
    [(UIView *)self->_contentContainerView setBackgroundColor:v44];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v62 transitionContentViewIsFullBookView] & 1) == 0)
  {
    v45 = [v62 view];
    v46 = [v45 snapshotViewAfterScreenUpdates:0];
    fullBookSnapshot = self->_fullBookSnapshot;
    self->_fullBookSnapshot = v46;

    v48 = [v62 view];
    [v48 frame];
    -[UIView setFrame:](self->_fullBookSnapshot, "setFrame:");

    v49 = [(BKBookOpenAnimator *)self containerView];
    [v49 addSubview:self->_fullBookSnapshot];

    unsigned int v50 = [(BKBookOpenAnimator *)self opening];
    double v51 = 1.0;
    if (v50) {
      double v51 = 0.0;
    }
    [(UIView *)self->_fullBookSnapshot setAlpha:v51];
  }
  v52 = [(BKBookOpenAnimator *)self bookContainerView];
  [v52 setAlpha:0.0];

  v53 = [(BKBookOpenAnimator *)self containerView];
  [v3 frame];
  double v55 = v54;
  double v57 = v56;
  v58 = [v62 view];
  v59 = [v58 superview];
  [v53 convertPoint:v59 fromView:v55];

  CGRectMakeWithOriginSize();
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:");
  v60 = [(BKBookOpenAnimator *)self containerView];
  v61 = [(BKBookOpenAnimator *)self coverContainerView];
  [v60 addSubview:v61];
}

- (void)animateRevealWithCompletion:(id)a3
{
  id v4 = a3;
  v126[0] = 0;
  v126[1] = v126;
  v126[2] = 0x2020000000;
  v126[3] = 0;
  v125[0] = _NSConcreteStackBlock;
  v125[1] = 3221225472;
  v125[2] = sub_100116364;
  v125[3] = &unk_100A44688;
  v125[4] = v126;
  unsigned int v5 = objc_retainBlock(v125);
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = sub_10011637C;
  v122[3] = &unk_100A45740;
  v124 = v126;
  id v6 = v4;
  id v123 = v6;
  double v7 = objc_retainBlock(v122);
  unsigned int v8 = [(BKBookOpenAnimator *)self opening];
  unsigned int v9 = [(BKBookOpenAnimator *)self rightToLeft];
  [(BKBookSlideOpenAnimator *)self zoomedContentScale];
  CGFloat sx = v10;
  id v11 = [(BKBookOpenAnimator *)self coverContainerView];
  [v11 frame];
  IMActionSafeRectForRect();
  double v106 = v12;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  [(BKBookOpenAnimator *)self zoomedCoverFrame];
  CGFloat v23 = v19;
  CGFloat v24 = v20;
  CGFloat v25 = v21;
  CGFloat v26 = v22;
  if (v8) {
    double v27 = v19;
  }
  else {
    double v27 = v106;
  }
  if (v8) {
    double v28 = v20;
  }
  else {
    double v28 = v14;
  }
  double v96 = v28;
  double v97 = v27;
  if (v8) {
    double v29 = v21;
  }
  else {
    double v29 = v16;
  }
  if (v8) {
    double v30 = v22;
  }
  else {
    double v30 = v18;
  }
  double v94 = v30;
  double v95 = v29;
  if ((v8 & 1) == 0)
  {
    double v18 = v22;
    double v16 = v21;
    double v14 = v20;
    double v106 = v23;
  }
  double v91 = v14;
  double v92 = v16;
  [(UIView *)self->_contentClipView frame];
  double v102 = v32;
  double v104 = v31;
  double v98 = v34;
  double v100 = v33;
  [(UIView *)self->_contentContainerView frame];
  CGSizeScale();
  if (v9)
  {
    v127.origin.x = v23;
    v127.origin.y = v24;
    v127.size.width = v25;
    v127.size.height = v26;
    CGRectGetMaxX(v127);
  }
  CGRectMakeWithOriginSize();
  if (v8) {
    double v39 = v35;
  }
  else {
    double v39 = v104;
  }
  if (v8) {
    double v40 = v36;
  }
  else {
    double v40 = v102;
  }
  double v93 = v40;
  if (v8) {
    double v41 = v37;
  }
  else {
    double v41 = v100;
  }
  if (v8) {
    double v42 = v38;
  }
  else {
    double v42 = v98;
  }
  if (v8) {
    double v35 = v104;
  }
  double v105 = v35;
  if (v8) {
    double v43 = v102;
  }
  else {
    double v43 = v36;
  }
  if (v8) {
    double v44 = v100;
  }
  else {
    double v44 = v37;
  }
  double v101 = v44;
  double v103 = v43;
  if (v8) {
    double v45 = v98;
  }
  else {
    double v45 = v38;
  }
  double v99 = v45;
  CGRectGetCenterNoRounding();
  double v47 = v46;
  double v49 = v48;
  CGRectMakeWithOriginSize();
  CGRectGetCenterNoRounding();
  if (v8) {
    double v52 = v50;
  }
  else {
    double v52 = v47;
  }
  if (v8) {
    double v53 = v51;
  }
  else {
    double v53 = v49;
  }
  if (!v8) {
    double v47 = v50;
  }
  memset(&v121.c, 0, 32);
  if (!v8) {
    double v49 = v51;
  }
  *(_OWORD *)&v121.a = 0uLL;
  CGAffineTransformMakeScale(&v121, sx, sx);
  if (v8)
  {
    CGAffineTransform v120 = v121;
    double v54 = &CGAffineTransformIdentity;
  }
  else
  {
    long long v55 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v120.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v120.c = v55;
    *(_OWORD *)&v120.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    double v54 = &v121;
  }
  long long v56 = *(_OWORD *)&v54->c;
  long long v117 = *(_OWORD *)&v54->a;
  long long v118 = v56;
  long long v119 = *(_OWORD *)&v54->tx;
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", v97, v96, v95, v94, *(void *)&v18);
  -[UIView setFrame:](self->_contentClipView, "setFrame:", v39, v93, v41, v42);
  -[UIView setCenter:](self->_contentContainerView, "setCenter:", v52, v53);
  CGAffineTransform v116 = v120;
  [(UIView *)self->_contentContainerView setTransform:&v116];
  ((void (*)(void *))v5[2])(v5);
  [(BKBookSlideOpenAnimator *)self revealDuration];
  double v58 = v57;
  double v59 = 0.0;
  if ((v8 & 1) == 0)
  {
    [(BKBookSlideOpenAnimator *)self accessoryFadeDuration];
    double v59 = v60;
  }
  v61 = [(BKBookZoomRevealOpenAnimator *)self revealTimingFunction];
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472;
  v112[2] = sub_1001163B8;
  v112[3] = &unk_100A47618;
  v112[4] = self;
  *(double *)&v112[5] = v106;
  *(double *)&v112[6] = v91;
  *(double *)&v112[7] = v92;
  v112[8] = v90;
  *(double *)&v112[9] = v105;
  *(double *)&v112[10] = v103;
  *(double *)&v112[11] = v101;
  *(double *)&v112[12] = v99;
  *(double *)&v112[13] = v47;
  *(double *)&v112[14] = v49;
  long long v115 = v119;
  long long v114 = v118;
  long long v113 = v117;
  +[UIView animateWithDuration:v61 delay:0 timingFunction:v112 options:v7 animations:v58 completion:v59];

  fullBookSnapshot = self->_fullBookSnapshot;
  if (fullBookSnapshot)
  {
    if (v8) {
      double v63 = 0.0;
    }
    else {
      double v63 = 1.0;
    }
    if (v8) {
      double v64 = 1.0;
    }
    else {
      double v64 = 0.0;
    }
    [(UIView *)fullBookSnapshot setAlpha:v63];
    ((void (*)(void *))v5[2])(v5);
    [(BKBookSlideOpenAnimator *)self accessoryFadeDuration];
    double v66 = v65;
    double v67 = 0.0;
    if (v8)
    {
      [(BKBookSlideOpenAnimator *)self revealDuration];
      double v67 = v68;
    }
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_100116448;
    v111[3] = &unk_100A45768;
    v111[4] = self;
    *(double *)&v111[5] = v64;
    +[UIView animateWithDuration:0 delay:v111 options:v7 animations:v66 completion:v67];
  }
  if (v8) {
    double v69 = 0.7;
  }
  else {
    double v69 = 0.05;
  }
  v70 = [(BKBookOpenAnimator *)self bookshelfTintView];
  v71 = v70;
  if (v8) {
    double v72 = 0.05;
  }
  else {
    double v72 = 0.7;
  }
  [v70 setAlpha:v72];

  ((void (*)(void *))v5[2])(v5);
  [(BKBookSlideOpenAnimator *)self revealDuration];
  double v74 = v73;
  double v75 = 0.0;
  if ((v8 & 1) == 0)
  {
    [(BKBookSlideOpenAnimator *)self accessoryFadeDuration];
    double v75 = v76;
  }
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_100116460;
  v110[3] = &unk_100A45768;
  v110[4] = self;
  *(double *)&v110[5] = v69;
  +[UIView animateWithDuration:0 delay:v110 options:v7 animations:v74 completion:v75];
  if (v8) {
    double v77 = 0.25;
  }
  else {
    double v77 = 0.0;
  }
  if (v8) {
    double v78 = 0.0;
  }
  else {
    double v78 = 0.25;
  }
  [(UIView *)self->_contentTintView setAlpha:v77];
  ((void (*)(void *))v5[2])(v5);
  [(BKBookSlideOpenAnimator *)self contentTintFadeDuration];
  double v80 = v79;
  double v81 = 0.0;
  if ((v8 & 1) == 0)
  {
    [(BKBookSlideOpenAnimator *)self revealDuration];
    double v83 = v82;
    [(BKBookSlideOpenAnimator *)self accessoryFadeDuration];
    double v85 = v84;
    [(BKBookSlideOpenAnimator *)self contentTintFadeDuration];
    double v81 = v83 + v85 - v86;
  }
  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472;
  v109[2] = sub_1001164B4;
  v109[3] = &unk_100A45768;
  v109[4] = self;
  *(double *)&v109[5] = v78;
  +[UIView animateWithDuration:0 delay:v109 options:v7 animations:v80 completion:v81];
  ((void (*)(void *))v5[2])(v5);
  [(BKBookSlideOpenAnimator *)self revealDuration];
  double v88 = v87;
  [(BKBookSlideOpenAnimator *)self minibarSlideDuration];
  [(BKBookOpenAnimator *)self minibarKeyFrameAnimationWithDuration:v7 hide:v88 show:-1.0 completion:v89];
  [(BKBookSlideOpenAnimator *)self revealDuration];
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_1001164CC;
  v108[3] = &unk_100A43D60;
  v108[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v108);

  _Block_object_dispose(v126, 8);
}

- (UIView)contentSnapshot
{
  return self->_contentSnapshot;
}

- (void)setContentSnapshot:(id)a3
{
}

- (UIView)fullBookSnapshot
{
  return self->_fullBookSnapshot;
}

- (void)setFullBookSnapshot:(id)a3
{
}

- (UIView)contentClipView
{
  return self->_contentClipView;
}

- (void)setContentClipView:(id)a3
{
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
}

- (UIView)contentTintView
{
  return self->_contentTintView;
}

- (void)setContentTintView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTintView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_contentClipView, 0);
  objc_storeStrong((id *)&self->_fullBookSnapshot, 0);

  objc_storeStrong((id *)&self->_contentSnapshot, 0);
}

@end