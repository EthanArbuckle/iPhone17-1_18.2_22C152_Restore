@interface SBHWidgetConfigurationFlipAnimator
- (BOOL)hasPerformedAnyTransition;
- (CGRect)homeScreenContentFrame;
- (CGRect)sourceContentFrame;
- (CGRect)sourceContentFrameInMatchMoveViewSpace;
- (CGRect)targetContentFrame;
- (CGRect)targetContentFrameInMatchMoveViewSpace;
- (SBHTouchPassThroughView)matchMoveView;
- (SBHWidgetConfigurationFlipAnimator)init;
- (SBHWidgetConfigurationTransformView)sourceContainerView;
- (SBHWidgetSettings)widgetSettings;
- (UIView)targetSuperview;
- (UIViewFloatAnimatableProperty)flipAnimatableProperty;
- (double)endingFlipFraction;
- (double)endingRotationAngle;
- (double)startingFlipFraction;
- (double)startingRotationAngle;
- (int64_t)currentEndpoint;
- (void)_configureForEndpoint:(int64_t)a3 context:(id)a4 inMode:(int64_t)a5 completion:(id)a6;
- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)iconViewDidBecomeWindowless:(id)a3;
- (void)iconViewWasDiscarded:(id)a3;
- (void)iconViewWasRecycled:(id)a3;
- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)setCurrentEndpoint:(int64_t)a3;
- (void)setEndingFlipFraction:(double)a3;
- (void)setEndingRotationAngle:(double)a3;
- (void)setFlipAnimatableProperty:(id)a3;
- (void)setHasPerformedAnyTransition:(BOOL)a3;
- (void)setHomeScreenContentFrame:(CGRect)a3;
- (void)setMatchMoveView:(id)a3;
- (void)setSourceContainerView:(id)a3;
- (void)setSourceContentFrame:(CGRect)a3;
- (void)setSourceContentFrameInMatchMoveViewSpace:(CGRect)a3;
- (void)setStartingFlipFraction:(double)a3;
- (void)setStartingRotationAngle:(double)a3;
- (void)setTargetContentFrame:(CGRect)a3;
- (void)setTargetContentFrameInMatchMoveViewSpace:(CGRect)a3;
- (void)setTargetSuperview:(id)a3;
@end

@implementation SBHWidgetConfigurationFlipAnimator

- (SBHWidgetConfigurationFlipAnimator)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBHWidgetConfigurationFlipAnimator;
  v2 = [(SBHWidgetConfigurationFlipAnimator *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentEndpoint = -1;
    v4 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v5 = [v4 widgetSettings];
    widgetSettings = v3->_widgetSettings;
    v3->_widgetSettings = (SBHWidgetSettings *)v5;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(SBHWidgetConfigurationFlipAnimator *)self flipAnimatableProperty];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetConfigurationFlipAnimator;
  [(SBHWidgetConfigurationFlipAnimator *)&v4 dealloc];
}

- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4
{
  v120[1] = *MEMORY[0x1E4F143B8];
  id v76 = a4;
  v93 = [v76 userInfo];
  v91 = [v93 containerView];
  id val = [v93 sourceView];
  [val iconContentScale];
  v78 = v5;
  v89 = [v93 targetView];
  [v93 sourceContentFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double rect = v12;
  -[SBHWidgetConfigurationFlipAnimator setSourceContentFrame:](self, "setSourceContentFrame:");
  v80 = [v93 homeScreenContentView];
  [v80 bounds];
  objc_msgSend(v80, "convertRect:toView:", v91);
  -[SBHWidgetConfigurationFlipAnimator setHomeScreenContentFrame:](self, "setHomeScreenContentFrame:");
  [v93 contentBoundingRect];
  v17 = -[SBHTouchPassThroughView initWithFrame:]([SBHTouchPassThroughView alloc], "initWithFrame:", v13, v14, v15, v16);
  [(SBHWidgetConfigurationFlipAnimator *)self setMatchMoveView:v17];
  v90 = v17;
  [v91 addSubview:v17];
  [v93 targetContentFrame];
  v85 = v19;
  v86 = v18;
  v87 = v21;
  v88 = v20;
  -[SBHWidgetConfigurationFlipAnimator setTargetContentFrame:](self, "setTargetContentFrame:");
  v22 = [v91 traitCollection];
  [v22 displayScale];
  v84 = v23;

  objc_msgSend(v91, "convertRect:toView:", v17, *(double *)&v86, *(double *)&v85, *(double *)&v88, *(double *)&v87);
  -[SBHWidgetConfigurationFlipAnimator setTargetContentFrameInMatchMoveViewSpace:](self, "setTargetContentFrameInMatchMoveViewSpace:");
  v121.origin.x = v7;
  v121.origin.y = v9;
  v121.size.width = rect;
  v121.size.height = v11;
  double Width = CGRectGetWidth(v121);
  *(void *)&v122.origin.x = v86;
  *(void *)&v122.origin.y = v85;
  *(void *)&v122.size.width = v88;
  *(void *)&v122.size.height = v87;
  double v25 = CGRectGetWidth(v122);
  if (Width >= v25) {
    double v26 = Width;
  }
  else {
    double v26 = v25;
  }
  v79 = [(SBHWidgetConfigurationFlipAnimator *)self widgetSettings];
  objc_msgSend(v91, "convertRect:toView:", v17, v7, v9, rect, v11);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  -[SBHWidgetConfigurationFlipAnimator setSourceContentFrameInMatchMoveViewSpace:](self, "setSourceContentFrameInMatchMoveViewSpace:");
  v92 = -[SBHWidgetConfigurationTransformView initWithFrame:]([SBHWidgetConfigurationTransformView alloc], "initWithFrame:", v28, v30, v32, v34);
  -[SBHWidgetConfigurationFlipAnimator setSourceContainerView:](self, "setSourceContainerView:");
  if ([v79 configurationEqualizesMinCardToCameraDistance])
  {
    [v79 configurationMinCardToCameraDistance];
    double v36 = -(v26 + v35);
  }
  else
  {
    [v79 configurationPerspectiveCameraDistance];
    double v36 = v37;
  }
  v38 = [(SBHWidgetConfigurationTransformView *)v92 layer];
  long long v39 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v112 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v113 = v39;
  long long v114 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  uint64_t v115 = *(void *)(MEMORY[0x1E4F39B10] + 80);
  long long v40 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)location = *MEMORY[0x1E4F39B10];
  long long v111 = v40;
  double v116 = 1.0 / v36;
  long long v41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v117 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v118 = v41;
  [v38 setSublayerTransform:location];

  [(SBHWidgetConfigurationTransformView *)v92 addSubview:val];
  BSRectWithSize();
  objc_msgSend(val, "setFrame:");
  [(SBHTouchPassThroughView *)v17 addSubview:v92];
  UICeilToScale();
  double v43 = v42;
  v44 = [(SBHWidgetConfigurationTransformView *)v92 layer];
  [v44 setZPosition:v43 + 1.0];

  v45 = [v89 superview];
  [(SBHWidgetConfigurationFlipAnimator *)self setTargetSuperview:v45];

  [v89 frame];
  double v47 = v46;
  double v49 = v48;
  id v50 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  BSRectWithSize();
  v81 = objc_msgSend(v50, "initWithFrame:");
  [v81 addSubview:v89];
  objc_msgSend(v89, "setFrame:", -*(double *)&v86, -*(double *)&v85, v47, v49);
  [val prepareToCrossfadeImageWithView:v81 options:5];
  [val setIconLabelAlpha:0.0];
  recta = [v93 referenceView];
  [recta addObserver:self];
  [recta bounds];
  objc_msgSend(val, "convertRect:toView:", v91);
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  v59 = [MEMORY[0x1E4F39C00] animation];
  v60 = [recta layer];
  [v59 setSourceLayer:v60];

  [v59 setDuration:INFINITY];
  [v59 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v59 setRemovedOnCompletion:0];
  [v59 setAppliesY:1];
  [v59 setAppliesX:1];
  UIRectGetCenter();
  UIPointRoundToScale();
  double v62 = v61;
  double v64 = v63;
  v123.origin.x = v52;
  v123.origin.y = v54;
  v123.size.width = v56;
  v123.size.height = v58;
  double MinX = CGRectGetMinX(v123);
  v124.origin.x = v52;
  v124.origin.y = v54;
  v124.size.width = v56;
  v124.size.height = v58;
  v109[0] = v62 - MinX;
  v109[1] = v64 - CGRectGetMinY(v124);
  v66 = [MEMORY[0x1E4F29238] valueWithBytes:v109 objCType:"{CGPoint=dd}"];
  v120[0] = v66;
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:1];
  [v59 setSourcePoints:v67];

  v68 = [(SBHTouchPassThroughView *)v90 layer];
  v69 = [v68 animationForKey:@"SBHWidgetConfigurationFlipMatchMoveAnimation"];

  if (v69) {
    [v68 removeAnimationForKey:@"SBHWidgetConfigurationFlipMatchMoveAnimation"];
  }
  [v68 addAnimation:v59 forKey:@"SBHWidgetConfigurationFlipMatchMoveAnimation"];
  id v70 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
  [(SBHWidgetConfigurationFlipAnimator *)self setFlipAnimatableProperty:v70];
  objc_initWeak(location, self);
  objc_initWeak(&from, v70);
  objc_initWeak(&v107, val);
  v71 = (void *)MEMORY[0x1E4FB1EB0];
  id v119 = v70;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v103[3] = &unk_1E6AAED80;
  objc_copyWeak(&v104, location);
  objc_copyWeak(&v105, &from);
  v106[1] = v78;
  v106[2] = v84;
  v106[3] = v86;
  v106[4] = v85;
  v106[5] = v88;
  v106[6] = v87;
  objc_copyWeak(v106, &v107);
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_2;
  v99[3] = &unk_1E6AAED80;
  objc_copyWeak(&v100, location);
  objc_copyWeak(&v101, &from);
  v102[1] = v78;
  v102[2] = v84;
  v102[3] = v86;
  v102[4] = v85;
  v102[5] = v88;
  v102[6] = v87;
  objc_copyWeak(v102, &v107);
  [v71 _createTransformerWithInputAnimatableProperties:v72 modelValueSetter:v103 presentationValueSetter:v99];

  v73 = (void *)MEMORY[0x1E4FB1EB0];
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_3;
  v95[3] = &unk_1E6AAEDA8;
  v95[4] = self;
  id v74 = v70;
  id v96 = v74;
  int64_t v98 = a3;
  id v75 = v93;
  id v97 = v75;
  [v73 performWithoutAnimation:v95];

  objc_destroyWeak(v102);
  objc_destroyWeak(&v101);
  objc_destroyWeak(&v100);
  objc_destroyWeak(v106);
  objc_destroyWeak(&v105);
  objc_destroyWeak(&v104);
  objc_destroyWeak(&v107);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

void __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v4 = v3;
  if (WeakRetained && v3)
  {
    [WeakRetained endingFlipFraction];
    double v6 = v5;
    [v4 value];
    double v8 = v7;
    if (v6 != v7)
    {
      [v4 presentationValue];
      double v10 = v9;
      [WeakRetained startingFlipFraction];
      double v12 = v11;
      [WeakRetained startingRotationAngle];
      double v14 = v13;
      [WeakRetained endingRotationAngle];
      double v16 = v14 + (v10 - v12) * (v15 - v14) / (v6 - v12);
      if (v14 >= v16) {
        double v16 = v14;
      }
      if (v15 <= v16) {
        double v17 = v15;
      }
      else {
        double v17 = v16;
      }
      double v18 = v15 + 3.14159265;
      if (BSFloatGreaterThanFloat()) {
        double v18 = v18 + -3.14159265 + -3.14159265;
      }
      [WeakRetained setStartingFlipFraction:v10];
      [WeakRetained setEndingFlipFraction:v8];
      [WeakRetained setStartingRotationAngle:v17];
      [WeakRetained setEndingRotationAngle:v18];
    }
    memset(&v31, 0, sizeof(v31));
    [WeakRetained endingRotationAngle];
    CATransform3DMakeRotation(&v31, v19, 0.0, 1.0, 0.0);
    [WeakRetained sourceContentFrame];
    SBHSizeScaled(v20, v21, *(double *)(a1 + 56));
    UISizeRoundToScale();
    double v23 = *(double *)(a1 + 88) / v22;
    double v25 = *(double *)(a1 + 96) / v24;
    if (v23 > v25) {
      double v23 = v25;
    }
    memset(&v30, 0, sizeof(v30));
    CATransform3DMakeScale(&v30, 1.0 - v8 * (1.0 - v23), 1.0 - v8 * (1.0 - v23), 1.0);
    id v26 = objc_loadWeakRetained((id *)(a1 + 48));
    CATransform3D a = v30;
    CATransform3D v27 = v31;
    CATransform3DConcat(&v29, &a, &v27);
    [v26 setTransform3D:&v29];
  }
}

void __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v4 = v3;
  if (WeakRetained && v3)
  {
    [v3 presentationValue];
    double v6 = v5;
    [WeakRetained startingRotationAngle];
    double v8 = v7;
    [WeakRetained endingRotationAngle];
    double v10 = v9;
    [WeakRetained startingFlipFraction];
    double v12 = (v10 - v8) * (v6 - v11);
    [WeakRetained endingFlipFraction];
    double v14 = v13;
    [WeakRetained startingFlipFraction];
    double v16 = v8 + v12 / (v14 - v15);
    if (v8 >= v16) {
      double v16 = v8;
    }
    memset(&v30.m21, 0, 96);
    if (v10 <= v16) {
      double v16 = v10;
    }
    memset(&v30, 0, 32);
    CATransform3DMakeRotation(&v30, v16, 0.0, 1.0, 0.0);
    [WeakRetained sourceContentFrame];
    SBHSizeScaled(v17, v18, *(double *)(a1 + 56));
    UISizeRoundToScale();
    double v20 = *(double *)(a1 + 88) / v19;
    double v22 = *(double *)(a1 + 96) / v21;
    if (v20 > v22) {
      double v20 = v22;
    }
    memset(&v29, 0, sizeof(v29));
    CATransform3DMakeScale(&v29, 1.0 - v6 * (1.0 - v20), 1.0 - v6 * (1.0 - v20), 1.0);
    id v23 = objc_loadWeakRetained((id *)(a1 + 48));
    double v24 = (void *)MEMORY[0x1E4F29238];
    CATransform3D a = v29;
    CATransform3D v26 = v30;
    CATransform3DConcat(&v28, &a, &v26);
    double v25 = [v24 valueWithCATransform3D:&v28];
    [v23 _setPresentationValue:v25 forKey:@"transform"];
  }
}

uint64_t __79__SBHWidgetConfigurationFlipAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke_3(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasPerformedAnyTransition] & 1) == 0)
  {
    [*(id *)(a1 + 32) setHasPerformedAnyTransition:1];
    [*(id *)(a1 + 40) setValue:0.0];
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  return [v2 _configureForEndpoint:v3 context:v4 inMode:1 completion:0];
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  double v10 = [v9 userInfo];
  int v11 = [v9 wantsAnimation];

  if (v11)
  {
    [(SBHWidgetConfigurationFlipAnimator *)self _configureForEndpoint:a3 context:v10 inMode:3 completion:v8];
  }
  else
  {
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__SBHWidgetConfigurationFlipAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v13[3] = &unk_1E6AAE698;
    v13[4] = self;
    int64_t v16 = a3;
    id v14 = v10;
    id v15 = v8;
    [v12 performWithoutAnimation:v13];
  }
}

uint64_t __79__SBHWidgetConfigurationFlipAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 56) context:*(void *)(a1 + 40) inMode:1 completion:*(void *)(a1 + 48)];
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  double v6 = [a4 userInfo];
  double v7 = [v6 sourceView];
  id v8 = [(SBHWidgetConfigurationFlipAnimator *)self flipAnimatableProperty];
  [v8 invalidate];

  [(SBHWidgetConfigurationFlipAnimator *)self setFlipAnimatableProperty:0];
  [v7 cleanupAfterCrossfade];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v18[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v18[5] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v18[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v18[7] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v18[0] = *MEMORY[0x1E4F39B10];
  v18[1] = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v18[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v18[3] = v12;
  [v7 setTransform3D:v18];
  if (!a3)
  {
    [v7 setIcon:0];
    [v7 removeFromSuperview];
  }
  double v13 = [v6 targetView];
  id v14 = [(SBHWidgetConfigurationFlipAnimator *)self targetSuperview];
  [v14 addSubview:v13];

  [v13 frame];
  BSRectWithSize();
  objc_msgSend(v13, "setFrame:");
  [(SBHWidgetConfigurationFlipAnimator *)self setTargetSuperview:0];
  id v15 = [(SBHWidgetConfigurationFlipAnimator *)self matchMoveView];
  int64_t v16 = [v15 layer];
  [v16 removeAnimationForKey:@"SBHWidgetConfigurationFlipMatchMoveAnimation"];

  double v17 = [(SBHWidgetConfigurationFlipAnimator *)self matchMoveView];
  [v17 removeFromSuperview];

  [(SBHWidgetConfigurationFlipAnimator *)self setMatchMoveView:0];
}

- (void)_configureForEndpoint:(int64_t)a3 context:(id)a4 inMode:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  long long v11 = (void (**)(void))a6;
  if ([(SBHWidgetConfigurationFlipAnimator *)self currentEndpoint] == a3)
  {
    if (v11) {
      v11[2](v11);
    }
  }
  else
  {
    [(SBHWidgetConfigurationFlipAnimator *)self setCurrentEndpoint:a3];
    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    [v12 setDampingRatio:1.0];
    [v12 setResponse:0.55];
    CAFrameRateRange v20 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v12, "setFrameRateRange:highFrameRateReason:", 1114120, *(double *)&v20.minimum, *(double *)&v20.maximum, *(double *)&v20.preferred);
    double v13 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__SBHWidgetConfigurationFlipAnimator__configureForEndpoint_context_inMode_completion___block_invoke;
    v16[3] = &unk_1E6AADF50;
    int64_t v19 = a3;
    id v17 = v10;
    double v18 = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__SBHWidgetConfigurationFlipAnimator__configureForEndpoint_context_inMode_completion___block_invoke_2;
    v14[3] = &unk_1E6AAE760;
    id v15 = v11;
    objc_msgSend(v13, "sb_animateWithSettings:mode:animations:completion:", v12, a5, v16, v14);
  }
}

void __86__SBHWidgetConfigurationFlipAnimator__configureForEndpoint_context_inMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) sourceView];
  uint64_t v4 = [*(id *)(a1 + 32) referenceView];
  double v5 = [v3 traitCollection];
  [v5 displayScale];

  double v6 = 0.0;
  double v7 = *(void **)(a1 + 40);
  if (v2 == 1) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  if (v2 == 1)
  {
    [v7 targetContentFrameInMatchMoveViewSpace];
    UIRectGetCenter();
    UIPointRoundToScale();
    double v10 = v9;
    double v12 = v11;
    double v13 = [*(id *)(a1 + 40) sourceContainerView];
    objc_msgSend(v13, "setCenter:", v10, v12);

    id v14 = [*(id *)(a1 + 40) flipAnimatableProperty];
    [v14 setValue:1.0];

    [v3 setCrossfadeCornerRadius:21.0];
  }
  else
  {
    id v15 = [v7 flipAnimatableProperty];
    [v15 setValue:0.0];

    [*(id *)(a1 + 40) sourceContentFrameInMatchMoveViewSpace];
    UIRectGetCenter();
    UIPointRoundToScale();
    double v17 = v16;
    double v19 = v18;
    CAFrameRateRange v20 = [*(id *)(a1 + 40) sourceContainerView];
    objc_msgSend(v20, "setCenter:", v17, v19);

    double v21 = [v3 customIconImageViewController];
    [v21 continuousCornerRadius];
    objc_msgSend(v3, "setCrossfadeCornerRadius:");

    double v6 = 1.0;
  }
  [v4 setIconLabelAlpha:v6];
  double v22 = [*(id *)(a1 + 32) backgroundView];
  [v22 setWeighting:v8];

  id v23 = [*(id *)(a1 + 32) backgroundTintView];
  [v23 setAlpha:v8];

  [v3 setMorphFraction:v8];
  double v24 = [*(id *)(a1 + 40) widgetSettings];
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v46.CATransform3D a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v46.c = v25;
  *(_OWORD *)&v46.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CATransform3D v26 = [*(id *)(a1 + 32) homeScreenContentView];
  double v27 = 1.0;
  if (v2 == 1)
  {
    [v24 configurationHomeScreenScale];
    memset(&v45, 0, sizeof(v45));
    CGAffineTransformMakeScale(&v45, v28, v28);
    [*(id *)(a1 + 40) homeScreenContentFrame];
    UIRectGetCenter();
    UIPointRoundToScale();
    double v30 = v29;
    double v32 = v31;
    [*(id *)(a1 + 32) contentBoundingRect];
    UIRectGetCenter();
    UIPointRoundToScale();
    double v34 = v33;
    double v36 = v35;
    if (BSPointEqualToPoint())
    {
      CGAffineTransform v46 = v45;
    }
    else
    {
      CGFloat v37 = v34 - v30;
      CGFloat v38 = v36 - v32;
      memset(&v44, 0, sizeof(v44));
      CGAffineTransformMakeTranslation(&v44, v37, v38);
      memset(&v43, 0, sizeof(v43));
      CGAffineTransformMakeTranslation(&v43, -v37, -v38);
      CGAffineTransform t1 = v45;
      CGAffineTransform v40 = v44;
      CGAffineTransformConcat(&t2, &t1, &v40);
      CGAffineTransform t1 = v43;
      CGAffineTransformConcat(&v46, &t1, &t2);
    }
    [v24 configurationHomeScreenAlpha];
    double v27 = v39;
  }
  CGAffineTransform v45 = v46;
  [v26 setTransform:&v45];
  [v26 setAlpha:v27];
}

uint64_t __86__SBHWidgetConfigurationFlipAnimator__configureForEndpoint_context_inMode_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)iconViewWasRecycled:(id)a3
{
  id v3 = [(SBHWidgetConfigurationFlipAnimator *)self matchMoveView];
  [v3 setHidden:1];
}

- (void)iconViewDidBecomeWindowless:(id)a3
{
  id v3 = [(SBHWidgetConfigurationFlipAnimator *)self matchMoveView];
  [v3 setHidden:1];
}

- (void)iconViewWasDiscarded:(id)a3
{
  id v3 = [(SBHWidgetConfigurationFlipAnimator *)self matchMoveView];
  [v3 setHidden:1];
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (SBHTouchPassThroughView)matchMoveView
{
  return self->_matchMoveView;
}

- (void)setMatchMoveView:(id)a3
{
}

- (SBHWidgetConfigurationTransformView)sourceContainerView
{
  return self->_sourceContainerView;
}

- (void)setSourceContainerView:(id)a3
{
}

- (UIView)targetSuperview
{
  return self->_targetSuperview;
}

- (void)setTargetSuperview:(id)a3
{
}

- (CGRect)sourceContentFrame
{
  double x = self->_sourceContentFrame.origin.x;
  double y = self->_sourceContentFrame.origin.y;
  double width = self->_sourceContentFrame.size.width;
  double height = self->_sourceContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceContentFrame:(CGRect)a3
{
  self->_sourceContentFrame = a3;
}

- (CGRect)targetContentFrame
{
  double x = self->_targetContentFrame.origin.x;
  double y = self->_targetContentFrame.origin.y;
  double width = self->_targetContentFrame.size.width;
  double height = self->_targetContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetContentFrame:(CGRect)a3
{
  self->_targetContentFrame = a3;
}

- (CGRect)homeScreenContentFrame
{
  double x = self->_homeScreenContentFrame.origin.x;
  double y = self->_homeScreenContentFrame.origin.y;
  double width = self->_homeScreenContentFrame.size.width;
  double height = self->_homeScreenContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHomeScreenContentFrame:(CGRect)a3
{
  self->_homeScreenContentFrame = a3;
}

- (CGRect)sourceContentFrameInMatchMoveViewSpace
{
  double x = self->_sourceContentFrameInMatchMoveViewSpace.origin.x;
  double y = self->_sourceContentFrameInMatchMoveViewSpace.origin.y;
  double width = self->_sourceContentFrameInMatchMoveViewSpace.size.width;
  double height = self->_sourceContentFrameInMatchMoveViewSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceContentFrameInMatchMoveViewSpace:(CGRect)a3
{
  self->_sourceContentFrameInMatchMoveViewSpace = a3;
}

- (CGRect)targetContentFrameInMatchMoveViewSpace
{
  double x = self->_targetContentFrameInMatchMoveViewSpace.origin.x;
  double y = self->_targetContentFrameInMatchMoveViewSpace.origin.y;
  double width = self->_targetContentFrameInMatchMoveViewSpace.size.width;
  double height = self->_targetContentFrameInMatchMoveViewSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetContentFrameInMatchMoveViewSpace:(CGRect)a3
{
  self->_targetContentFrameInMatchMoveViewSpace = a3;
}

- (int64_t)currentEndpoint
{
  return self->_currentEndpoint;
}

- (void)setCurrentEndpoint:(int64_t)a3
{
  self->_currentEndpoint = a3;
}

- (double)startingFlipFraction
{
  return self->_startingFlipFraction;
}

- (void)setStartingFlipFraction:(double)a3
{
  self->_startingFlipFraction = a3;
}

- (double)endingFlipFraction
{
  return self->_endingFlipFraction;
}

- (void)setEndingFlipFraction:(double)a3
{
  self->_endingFlipFraction = a3;
}

- (double)startingRotationAngle
{
  return self->_startingRotationAngle;
}

- (void)setStartingRotationAngle:(double)a3
{
  self->_startingRotationAngle = a3;
}

- (double)endingRotationAngle
{
  return self->_endingRotationAngle;
}

- (void)setEndingRotationAngle:(double)a3
{
  self->_endingRotationAngle = a3;
}

- (UIViewFloatAnimatableProperty)flipAnimatableProperty
{
  return self->_flipAnimatableProperty;
}

- (void)setFlipAnimatableProperty:(id)a3
{
}

- (BOOL)hasPerformedAnyTransition
{
  return self->_hasPerformedAnyTransition;
}

- (void)setHasPerformedAnyTransition:(BOOL)a3
{
  self->_hasPerformedAnyTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flipAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_targetSuperview, 0);
  objc_storeStrong((id *)&self->_sourceContainerView, 0);
  objc_storeStrong((id *)&self->_matchMoveView, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
}

@end