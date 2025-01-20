@interface BKAudiobookOpenAnimator
- (BKAudiobookOpenTransitioning)audiobookViewController;
- (BOOL)animatesCoverBounds;
- (BOOL)contentLoaded;
- (BOOL)useLegacyTiming;
- (BOOL)waitingForContentLoaded;
- (CAMediaTimingFunction)fadeTimingFunction;
- (CAMediaTimingFunction)zoomTimingFunction;
- (CGAffineTransform)audiobookToTransform;
- (CGPoint)audiobookToCenter;
- (CGRect)coverToFrame;
- (UIImageView)backgroundView;
- (UIView)coverControlView;
- (double)animationScale;
- (double)backgroundToAlpha;
- (double)bookContainerToAlpha;
- (double)controlsFadeDuration;
- (double)controlsFadeInDelay;
- (double)controlsToAlpha;
- (double)coverShadowToAlpha;
- (double)coverToAlpha;
- (double)coverToCornerRadius;
- (double)duration;
- (double)toolbarFadeDuration;
- (double)toolbarToAlpha;
- (double)zoomDuration;
- (float)coverControlViewToShadowOpacity;
- (id)_customTimingFunction;
- (id)_zoomSpring;
- (int64_t)coverContentMode;
- (void)_setControlsAlpha:(double)a3;
- (void)_setLayerShadowOpacity:(float)a3;
- (void)_setToolbarAlpha:(double)a3;
- (void)_setupViews;
- (void)_teardownLocalViews;
- (void)animateNonInteractive;
- (void)animationsDidFinish;
- (void)bookContentDidLoad;
- (void)setAudiobookToCenter:(CGPoint)a3;
- (void)setAudiobookToTransform:(CGAffineTransform *)a3;
- (void)setBackgroundToAlpha:(double)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBookContainerToAlpha:(double)a3;
- (void)setContentLoaded:(BOOL)a3;
- (void)setControlsToAlpha:(double)a3;
- (void)setCoverControlView:(id)a3;
- (void)setCoverControlViewToShadowOpacity:(float)a3;
- (void)setCoverShadowToAlpha:(double)a3;
- (void)setCoverToAlpha:(double)a3;
- (void)setCoverToCornerRadius:(double)a3;
- (void)setCoverToFrame:(CGRect)a3;
- (void)setToolbarToAlpha:(double)a3;
- (void)setUseLegacyTiming:(BOOL)a3;
- (void)setWaitingForContentLoaded:(BOOL)a3;
- (void)teardownViews:(BOOL)a3;
@end

@implementation BKAudiobookOpenAnimator

- (id)_zoomSpring
{
  id v3 = objc_alloc((Class)UISpringTimingParameters);
  if ([(BKBookOpenAnimator *)self opening]) {
    double v4 = 300.0;
  }
  else {
    double v4 = 325.0;
  }
  if ([(BKBookOpenAnimator *)self opening]) {
    double v5 = 35.0;
  }
  else {
    double v5 = 30.0;
  }
  id v6 = [v3 initWithMass:1.0 stiffness:v4 damping:v5 initialVelocity:0.0];
  v7 = [(BKBookOpenAnimator *)self adjustSpring:v6];

  return v7;
}

- (id)_customTimingFunction
{
  LODWORD(v2) = 1051371084;
  LODWORD(v3) = 1045220557;
  LODWORD(v4) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints:v2 :0.0 :v3 :v4];
}

- (double)duration
{
  [(BKAudiobookOpenAnimator *)self zoomDuration];
  double v4 = v3;
  [(BKAudiobookOpenAnimator *)self controlsFadeInDelay];
  double v6 = v5;
  [(BKAudiobookOpenAnimator *)self controlsFadeDuration];
  double v8 = v6 + v7;
  if ([(BKAudiobookOpenAnimator *)self useLegacyTiming] && v4 < v8) {
    double v4 = v8;
  }
  [(BKAudiobookOpenAnimator *)self toolbarFadeDuration];
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:");
  return v9 + v4;
}

- (BOOL)animatesCoverBounds
{
  return 1;
}

- (double)zoomDuration
{
  if ([(BKAudiobookOpenAnimator *)self useLegacyTiming])
  {
    [(BKBookOpenAnimator *)self adjustDuration:0.7];
  }
  else
  {
    double v4 = [(BKAudiobookOpenAnimator *)self _zoomSpring];
    [v4 settlingDuration];
    double v6 = v5;

    return v6;
  }
  return result;
}

- (double)controlsFadeInDelay
{
  if (![(BKAudiobookOpenAnimator *)self useLegacyTiming]) {
    return 0.0;
  }

  [(BKBookOpenAnimator *)self adjustDuration:0.23];
  return result;
}

- (double)controlsFadeDuration
{
  if ([(BKAudiobookOpenAnimator *)self useLegacyTiming])
  {
    unsigned int v3 = [(BKBookOpenAnimator *)self opening];
    double v4 = 0.2;
    if (v3) {
      double v4 = 0.47;
    }
  }
  else
  {
    double v4 = 0.16;
  }

  [(BKBookOpenAnimator *)self adjustDuration:v4];
  return result;
}

- (double)toolbarFadeDuration
{
  unsigned int v3 = [(BKBookOpenAnimator *)self opening];
  double v4 = 0.1;
  if (v3) {
    double v4 = 0.5;
  }

  [(BKBookOpenAnimator *)self adjustDuration:v4];
  return result;
}

- (BKAudiobookOpenTransitioning)audiobookViewController
{
  if ([(BKBookOpenAnimator *)self opening]) {
    [(BKBookOpenAnimator *)self toViewController];
  }
  else {
  unsigned int v3 = [(BKBookOpenAnimator *)self fromViewController];
  }
  double v4 = [v3 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAudiobookOpenTransitioning];
  objc_opt_class();
  double v5 = BUClassAndProtocolCast();

  return (BKAudiobookOpenTransitioning *)v5;
}

- (double)animationScale
{
  unsigned int v3 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
  [v3 transitionCoverFrame];

  [(BKBookOpenAnimator *)self closedCoverFrame];

  CGSizeScaleThatFitsInCGSize();
  return result;
}

- (CAMediaTimingFunction)zoomTimingFunction
{
  LODWORD(v2) = 1052602532;
  LODWORD(v3) = 1041865114;
  LODWORD(v4) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints:v2 :0.0 :v3 :v4];
}

- (CAMediaTimingFunction)fadeTimingFunction
{
  return +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
}

- (void)_setControlsAlpha:(double)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
  double v5 = [v4 transitionControlsViews];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setAlpha:a3];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_setLayerShadowOpacity:(float)a3
{
  double v4 = [(BKAudiobookOpenAnimator *)self coverControlView];
  id v7 = [v4 layer];

  *(float *)&double v5 = a3;
  id v6 = +[NSNumber numberWithFloat:v5];
  [v7 setValue:v6 forKeyPath:@"shadowOpacity"];
}

- (void)_setToolbarAlpha:(double)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
  double v5 = [v4 transitionToolbarViews];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setAlpha:a3];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_setupViews
{
  unsigned int v3 = [(BKBookOpenAnimator *)self opening];
  double v4 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
  double v5 = v4;
  if (v3)
  {
    id v6 = [v4 view];
    id v7 = [v6 snapshotViewAfterScreenUpdates:0];

    double v8 = 0.0;
    double v9 = 1.0;
  }
  else
  {
    double v8 = 1.0;
    double v9 = 0.0;
  }
  long long v10 = [v5 transitionBackgroundImageView];
  id v11 = objc_alloc((Class)UIImageView);
  long long v12 = [v10 superview];
  [v10 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(BKBookOpenAnimator *)self containerView];
  [v12 convertRect:v21 toView:v14];
  id v22 = [v11 initWithFrame:];
  [(BKAudiobookOpenAnimator *)self setBackgroundView:v22];

  v23 = +[UIColor bc_booksBackground];
  v24 = [(BKAudiobookOpenAnimator *)self backgroundView];
  [v24 setBackgroundColor:v23];

  id v25 = [v10 contentMode];
  v26 = [(BKAudiobookOpenAnimator *)self backgroundView];
  [v26 setContentMode:v25];

  v27 = [v10 image];
  v28 = [(BKAudiobookOpenAnimator *)self backgroundView];
  [v28 setImage:v27];

  [v10 setAlpha:0.0];
  v29 = [(BKBookOpenAnimator *)self containerView];
  v30 = [(BKAudiobookOpenAnimator *)self backgroundView];
  [v29 addSubview:v30];

  v31 = [(BKBookOpenAnimator *)self containerView];
  v32 = [(BKBookOpenAnimator *)self bookContainerView];
  [v31 addSubview:v32];

  v33 = [(BKBookOpenAnimator *)self containerView];
  v34 = [(BKBookOpenAnimator *)self coverContainerView];
  [v33 addSubview:v34];

  v35 = [(BKAudiobookOpenAnimator *)self backgroundView];
  double v120 = v8;
  [v35 setAlpha:v8];

  double v119 = v9;
  [(BKAudiobookOpenAnimator *)self setBackgroundToAlpha:v9];
  [v5 transitionCoverFrame];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  v44 = [(BKBookOpenAnimator *)self coverContainerView];
  v45 = [v44 superview];
  v46 = [v5 view];
  [v45 convertRect:v46 fromView:v37];
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;

  [(BKBookOpenAnimator *)self closedCoverFrame];
  double v57 = v55;
  double v58 = v56;
  double v60 = v59;
  double v62 = v61;
  if (!v3)
  {
    double v55 = v48;
    double v56 = v50;
  }
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", v55, v56);
  double v63 = v52;
  double v64 = v50;
  double v65 = v48;
  double v66 = v54;
  if ((v3 & 1) == 0)
  {
    double v63 = v60;
    double v64 = v58;
    double v65 = v57;
    double v66 = v62;
  }
  -[BKAudiobookOpenAnimator setCoverToFrame:](self, "setCoverToFrame:", v65, v64, v63, v66);
  CGRectGetCenterNoRounding();
  double v68 = v67;
  double v70 = v69;
  CGRectGetCenterNoRounding();
  v71 = [v5 view];
  [v71 frame];

  CGRectGetCenterNoRounding();
  double v73 = v72;
  double v75 = v74;
  v76 = [v5 view];
  v77 = [v76 superview];
  v78 = [(BKBookOpenAnimator *)self coverContainerView];
  v79 = [v78 superview];
  [v77 convertPoint:v79 toView:v73];
  CGPointSubtract();

  [(BKAudiobookOpenAnimator *)self animationScale];
  CGFloat v81 = v80;
  CGPointMultiply();
  v82 = [v5 view];
  v83 = [v82 superview];
  v84 = [(BKBookOpenAnimator *)self coverContainerView];
  v85 = [v84 superview];
  [v83 convertPoint:v85 fromView:v68];
  CGPointAdd();
  double v87 = v86;
  double v89 = v88;

  v90 = [v5 view];
  v91 = v90;
  if (v3) {
    double v92 = v89;
  }
  else {
    double v92 = v75;
  }
  if (v3) {
    double v93 = v87;
  }
  else {
    double v93 = v73;
  }
  if (v3)
  {
    double v89 = v75;
    double v87 = v73;
  }
  [v90 setCenter:v93, v92];

  -[BKAudiobookOpenAnimator setAudiobookToCenter:](self, "setAudiobookToCenter:", v87, v89);
  memset(&v132, 0, sizeof(v132));
  v94 = [v5 view];
  v95 = v94;
  if (v94) {
    [v94 transform];
  }
  else {
    memset(&v132, 0, sizeof(v132));
  }

  memset(&v131, 0, sizeof(v131));
  CGAffineTransformMakeScale(&t2, v81, v81);
  CGAffineTransform t1 = v132;
  CGAffineTransformConcat(&v131, &t1, &t2);
  if (v3) {
    v96 = &v131;
  }
  else {
    v96 = &v132;
  }
  long long v97 = *(_OWORD *)&v96->c;
  long long v126 = *(_OWORD *)&v96->a;
  long long v127 = v97;
  long long v128 = *(_OWORD *)&v96->tx;
  if (v3) {
    v98 = &v132;
  }
  else {
    v98 = &v131;
  }
  v99 = [v5 view];
  v125[0] = v126;
  v125[1] = v127;
  v125[2] = v128;
  [v99 setTransform:v125];

  long long v100 = *(_OWORD *)&v98->c;
  long long v122 = *(_OWORD *)&v98->a;
  long long v123 = v100;
  long long v124 = *(_OWORD *)&v98->tx;
  v121[0] = v122;
  v121[1] = v100;
  v121[2] = v124;
  [(BKAudiobookOpenAnimator *)self setAudiobookToTransform:v121];
  double v101 = 1.0;
  double v102 = 1.0;
  if ([(BKBookOpenAnimator *)self opening])
  {
    if ([(BKBookOpenAnimator *)self fadeInCover]) {
      double v102 = 0.0;
    }
    else {
      double v102 = 1.0;
    }
  }
  v103 = [(BKBookOpenAnimator *)self bookContainerView];
  [v103 setAlpha:v102];

  if (![(BKBookOpenAnimator *)self opening])
  {
    if ([(BKBookOpenAnimator *)self fadeInCover]) {
      double v101 = 0.0;
    }
    else {
      double v101 = 1.0;
    }
  }
  [(BKAudiobookOpenAnimator *)self setBookContainerToAlpha:v101];
  [(BKAudiobookOpenAnimator *)self _setControlsAlpha:v120];
  [(BKAudiobookOpenAnimator *)self setControlsToAlpha:v119];
  if (v3)
  {
    double v104 = 0.0;
    [(BKAudiobookOpenAnimator *)self _setToolbarAlpha:0.0];
    v105 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
    [v105 transitionToolbarAlpha];
    -[BKAudiobookOpenAnimator setToolbarToAlpha:](self, "setToolbarToAlpha:");

    if ([(BKBookOpenAnimator *)self fadeInCover]) {
      double v106 = 0.0;
    }
    else {
      double v106 = 1.0;
    }
    v107 = [(BKBookOpenAnimator *)self coverContainerView];
    [v107 setAlpha:v106];

    v108 = [(BKBookOpenAnimator *)self coverImageView];
    [v108 _setContinuousCornerRadius:0.0];

    [v5 coverCornerRadius];
    -[BKAudiobookOpenAnimator setCoverToCornerRadius:](self, "setCoverToCornerRadius:");
  }
  else
  {
    v109 = [v5 transitionCoverImagePlayControl];
    [(BKAudiobookOpenAnimator *)self setCoverControlView:v109];

    v110 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
    [v110 transitionCoverImagePlayControlShadowOpacityValue];
    *(float *)&double v111 = v111;
    [(BKAudiobookOpenAnimator *)self _setLayerShadowOpacity:v111];

    [(BKAudiobookOpenAnimator *)self setCoverControlViewToShadowOpacity:0.0];
    v112 = [(BKAudiobookOpenAnimator *)self coverControlView];
    [v112 addAnimatablePropertyWithKey:@"shadowOpacity"];

    v113 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
    [v113 transitionToolbarAlpha];
    -[BKAudiobookOpenAnimator _setToolbarAlpha:](self, "_setToolbarAlpha:");

    [(BKAudiobookOpenAnimator *)self setToolbarToAlpha:0.0];
    v114 = [(BKBookOpenAnimator *)self coverContainerView];
    [v114 setAlpha:0.0];

    [v5 coverCornerRadius];
    double v116 = v115;
    v117 = [(BKBookOpenAnimator *)self coverImageView];
    [v117 _setContinuousCornerRadius:v116];

    [(BKAudiobookOpenAnimator *)self setCoverToCornerRadius:0.0];
    if ([(BKBookOpenAnimator *)self fadeInCover]) {
      double v104 = 0.0;
    }
    else {
      double v104 = 1.0;
    }
  }
  [(BKAudiobookOpenAnimator *)self setCoverToAlpha:v104];
  if (([v5 transitionHasCustomArtwork] & 1) == 0)
  {
    v118 = [(BKBookOpenAnimator *)self coverShadowView];
    [v118 setAlpha:v119];

    [(BKAudiobookOpenAnimator *)self setCoverShadowToAlpha:v120];
  }
}

- (void)animateNonInteractive
{
  unsigned int v3 = [(BKBookOpenAnimator *)self opening];
  if (v3 && ![(BKAudiobookOpenAnimator *)self contentLoaded])
  {
    [(BKAudiobookOpenAnimator *)self setWaitingForContentLoaded:1];
  }
  else
  {
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    v51[3] = 0;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10010899C;
    v50[3] = &unk_100A44688;
    v50[4] = v51;
    double v4 = objc_retainBlock(v50);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1001089B4;
    v48[3] = &unk_100A473F0;
    v48[4] = self;
    v48[5] = v51;
    char v49 = v3;
    double v5 = objc_retainBlock(v48);
    [(BKAudiobookOpenAnimator *)self _setupViews];
    id v6 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
    unsigned __int8 v36 = [v6 transitionHasCustomArtwork];
    [(BKAudiobookOpenAnimator *)self zoomDuration];
    double v8 = v7;
    [(BKAudiobookOpenAnimator *)self toolbarFadeDuration];
    double v10 = v9;
    [(BKAudiobookOpenAnimator *)self controlsFadeInDelay];
    double v12 = v11;
    [(BKAudiobookOpenAnimator *)self controlsFadeDuration];
    double v14 = v13;
    if (v3) {
      double v15 = 0.0;
    }
    else {
      double v15 = v10;
    }
    if ([(BKAudiobookOpenAnimator *)self useLegacyTiming]) {
      [(BKAudiobookOpenAnimator *)self zoomTimingFunction];
    }
    else {
    double v16 = [(BKAudiobookOpenAnimator *)self _customTimingFunction];
    }
    [(BKBookOpenAnimator *)self animateNavigationBarPrepare];
    double v17 = v8 * 0.25;
    if (v3) {
      double v17 = 0.0;
    }
    [(BKBookOpenAnimator *)self animateNavigationBarWithDuration:v8 * 0.5 delay:v17];
    ((void (*)(void *))v4[2])(v4);
    unsigned __int8 v18 = [(BKAudiobookOpenAnimator *)self useLegacyTiming];
    double v19 = v8;
    if ((v18 & 1) == 0) {
      [(BKBookOpenAnimator *)self adjustDuration:0.3];
    }
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100108A94;
    v47[3] = &unk_100A43D60;
    v47[4] = self;
    +[UIView animateWithDuration:v16 delay:0 timingFunction:v47 options:v5 animations:v19 completion:v15];
    ((void (*)(void *))v4[2])(v4);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100108AFC;
    v45[3] = &unk_100A43DD8;
    v45[4] = self;
    id v20 = v6;
    id v46 = v20;
    v21 = objc_retainBlock(v45);
    if ([(BKAudiobookOpenAnimator *)self useLegacyTiming])
    {
      id v22 = [(BKAudiobookOpenAnimator *)self zoomTimingFunction];
      +[UIView animateWithDuration:v22 delay:0 timingFunction:v21 options:v5 animations:v8 completion:v15];
    }
    else
    {
      id v22 = [(BKAudiobookOpenAnimator *)self _zoomSpring];
      [v22 mass];
      double v24 = v23;
      [v22 stiffness];
      double v26 = v25;
      [v22 damping];
      +[UIView _animateUsingSpringWithDuration:0 delay:v21 options:v5 mass:v8 stiffness:v15 damping:v24 initialVelocity:v26 animations:v27 completion:0.0];
    }

    ((void (*)(void *))v4[2])(v4);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100108BBC;
    v42[3] = &unk_100A449C8;
    v42[4] = self;
    unsigned __int8 v43 = v36;
    char v44 = v3;
    +[UIView animateWithDuration:v16 delay:0 timingFunction:v42 options:v5 animations:v8 completion:v15];
    ((void (*)(void *))v4[2])(v4);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100108CC8;
    v41[3] = &unk_100A43D60;
    v41[4] = self;
    +[UIView animateWithDuration:v16 delay:0 timingFunction:v41 options:v5 animations:v8 completion:v15];
    ((void (*)(void *))v4[2])(v4);
    if (v3) {
      double v28 = v12;
    }
    else {
      double v28 = v10;
    }
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100108D30;
    v40[3] = &unk_100A43D60;
    v40[4] = self;
    +[UIView animateWithDuration:v16 delay:0 timingFunction:v40 options:v5 animations:v14 completion:v28];
    ((void (*)(void *))v4[2])(v4);
    double v29 = 0.0;
    if (v3)
    {
      unsigned int v30 = [(BKAudiobookOpenAnimator *)self useLegacyTiming];
      double v31 = 0.7;
      if (v30) {
        double v31 = 1.0;
      }
      double v29 = v8 * v31;
    }
    unsigned int v32 = [(BKAudiobookOpenAnimator *)self useLegacyTiming];
    v33 = v16;
    if (v32)
    {
      v33 = [(BKAudiobookOpenAnimator *)self fadeTimingFunction];
    }
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100108D6C;
    v38[3] = &unk_100A44E60;
    unsigned __int8 v39 = v36;
    v38[4] = self;
    +[UIView animateWithDuration:v33 delay:0 timingFunction:v38 options:v5 animations:v10 completion:v29];
    if (v32) {

    }
    ((void (*)(void *))v4[2])(v4);
    [(BKBookOpenAnimator *)self minibarKeyFrameAnimationWithDuration:v5 hide:v8 show:0.2 completion:0.2];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100108DE4;
    v37[3] = &unk_100A43D60;
    v37[4] = self;
    +[UIView animateWithDuration:v37 animations:v8];
    v34 = +[AETestDriver shared];
    [v34 postEvent:kBETestDriverOpenAnimationSetupEnd sender:self];

    v35 = +[AETestDriver shared];
    [v35 postEvent:kBETestDriverOpenAnimationZoomStart sender:self];

    kdebug_trace();
    _Block_object_dispose(v51, 8);
  }
}

- (void)animationsDidFinish
{
  unsigned int v3 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
  double v4 = [v3 transitionBackgroundImageView];
  [v4 setAlpha:1.0];

  double v5 = [v3 view];
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v5 setTransform:v8];

  [(BKAudiobookOpenAnimator *)self _setControlsAlpha:1.0];
  [(BKAudiobookOpenAnimator *)self toolbarToAlpha];
  -[BKAudiobookOpenAnimator _setToolbarAlpha:](self, "_setToolbarAlpha:");
  v7.receiver = self;
  v7.super_class = (Class)BKAudiobookOpenAnimator;
  [(BKBookOpenAnimator *)&v7 animationsDidFinish];
}

- (void)_teardownLocalViews
{
  unsigned int v3 = [(BKAudiobookOpenAnimator *)self backgroundView];
  [v3 removeFromSuperview];

  [(BKAudiobookOpenAnimator *)self setBackgroundView:0];
}

- (void)teardownViews:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKAudiobookOpenAnimator *)self _teardownLocalViews];
  v5.receiver = self;
  v5.super_class = (Class)BKAudiobookOpenAnimator;
  [(BKBookOpenAnimator *)&v5 teardownViews:v3];
}

- (int64_t)coverContentMode
{
  BOOL v3 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
  if (v3)
  {
    double v4 = [(BKAudiobookOpenAnimator *)self audiobookViewController];
    int64_t v5 = (int64_t)[v4 coverContentMode];
  }
  else
  {
    int64_t v5 = 2;
  }

  return v5;
}

- (void)bookContentDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BKAudiobookOpenAnimator;
  [(BKBookOpenAnimator *)&v3 bookContentDidLoad];
  if (![(BKAudiobookOpenAnimator *)self contentLoaded])
  {
    [(BKAudiobookOpenAnimator *)self setContentLoaded:1];
    if ([(BKAudiobookOpenAnimator *)self waitingForContentLoaded])
    {
      [(BKAudiobookOpenAnimator *)self setWaitingForContentLoaded:0];
      [(BKAudiobookOpenAnimator *)self animateNonInteractive];
    }
  }
}

- (BOOL)useLegacyTiming
{
  return self->_useLegacyTiming;
}

- (void)setUseLegacyTiming:(BOOL)a3
{
  self->_useLegacyTiming = a3;
}

- (BOOL)contentLoaded
{
  return self->_contentLoaded;
}

- (void)setContentLoaded:(BOOL)a3
{
  self->_contentLoaded = a3;
}

- (BOOL)waitingForContentLoaded
{
  return self->_waitingForContentLoaded;
}

- (void)setWaitingForContentLoaded:(BOOL)a3
{
  self->_waitingForContentLoaded = a3;
}

- (UIImageView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)coverControlView
{
  return self->_coverControlView;
}

- (void)setCoverControlView:(id)a3
{
}

- (double)backgroundToAlpha
{
  return self->_backgroundToAlpha;
}

- (void)setBackgroundToAlpha:(double)a3
{
  self->_backgroundToAlpha = a3;
}

- (CGRect)coverToFrame
{
  double x = self->_coverToFrame.origin.x;
  double y = self->_coverToFrame.origin.y;
  double width = self->_coverToFrame.size.width;
  double height = self->_coverToFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCoverToFrame:(CGRect)a3
{
  self->_coverToFrame = a3;
}

- (CGPoint)audiobookToCenter
{
  double x = self->_audiobookToCenter.x;
  double y = self->_audiobookToCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAudiobookToCenter:(CGPoint)a3
{
  self->_audiobookToCenter = a3;
}

- (CGAffineTransform)audiobookToTransform
{
  long long v3 = *(_OWORD *)&self[7].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[8].b;
  return self;
}

- (void)setAudiobookToTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_audiobookToTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_audiobookToTransform.c = v4;
  *(_OWORD *)&self->_audiobookToTransform.tdouble x = v3;
}

- (double)controlsToAlpha
{
  return self->_controlsToAlpha;
}

- (void)setControlsToAlpha:(double)a3
{
  self->_controlsToAlpha = a3;
}

- (float)coverControlViewToShadowOpacity
{
  return self->_coverControlViewToShadowOpacity;
}

- (void)setCoverControlViewToShadowOpacity:(float)a3
{
  self->_coverControlViewToShadowOpacitdouble y = a3;
}

- (double)toolbarToAlpha
{
  return self->_toolbarToAlpha;
}

- (void)setToolbarToAlpha:(double)a3
{
  self->_toolbarToAlpha = a3;
}

- (double)coverToAlpha
{
  return self->_coverToAlpha;
}

- (void)setCoverToAlpha:(double)a3
{
  self->_coverToAlpha = a3;
}

- (double)coverToCornerRadius
{
  return self->_coverToCornerRadius;
}

- (void)setCoverToCornerRadius:(double)a3
{
  self->_coverToCornerRadius = a3;
}

- (double)coverShadowToAlpha
{
  return self->_coverShadowToAlpha;
}

- (void)setCoverShadowToAlpha:(double)a3
{
  self->_coverShadowToAlpha = a3;
}

- (double)bookContainerToAlpha
{
  return self->_bookContainerToAlpha;
}

- (void)setBookContainerToAlpha:(double)a3
{
  self->_bookContainerToAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverControlView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end