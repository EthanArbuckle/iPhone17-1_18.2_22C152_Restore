@interface SBHPeopleWidgetPersonDetailZoomAnimator
- (CGRect)sourceContentFrameInMatchMoveViewSpace;
- (CGRect)targetContentFrameInMatchMoveViewSpace;
- (SBHPeopleWidgetPersonDetailInteractionSettings)settings;
- (SBHPeopleWidgetPersonDetailZoomAnimator)init;
- (SBHTouchPassThroughView)matchMoveView;
- (SBHTouchPassThroughView)sourceContainerView;
- (int64_t)currentEndpoint;
- (void)_configureForEndpoint:(int64_t)a3 context:(id)a4 inMode:(int64_t)a5 completion:(id)a6;
- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5;
- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4;
- (void)setCurrentEndpoint:(int64_t)a3;
- (void)setMatchMoveView:(id)a3;
- (void)setSourceContainerView:(id)a3;
- (void)setSourceContentFrameInMatchMoveViewSpace:(CGRect)a3;
- (void)setTargetContentFrameInMatchMoveViewSpace:(CGRect)a3;
@end

@implementation SBHPeopleWidgetPersonDetailZoomAnimator

- (SBHPeopleWidgetPersonDetailZoomAnimator)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBHPeopleWidgetPersonDetailZoomAnimator;
  v2 = [(SBHPeopleWidgetPersonDetailZoomAnimator *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentEndpoint = -1;
    v4 = +[SBHHomeScreenDomain rootSettings];
    v5 = [v4 widgetSettings];
    uint64_t v6 = [v5 personDetailInteractionSettings];
    settings = v3->_settings;
    v3->_settings = (SBHPeopleWidgetPersonDetailInteractionSettings *)v6;
  }
  return v3;
}

- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4
{
  v80[1] = *MEMORY[0x1E4F143B8];
  v5 = [a4 userInfo];
  uint64_t v6 = [v5 containerView];
  v7 = [v5 sourceView];
  v8 = [v5 targetView];
  [v5 sourceContentFrame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v5 homeScreenContentFrame];
  v21 = -[SBHTouchPassThroughView initWithFrame:]([SBHTouchPassThroughView alloc], "initWithFrame:", v17, v18, v19, v20);
  [(SBHPeopleWidgetPersonDetailZoomAnimator *)self setMatchMoveView:v21];
  [v6 addSubview:v21];
  [v5 targetContentFrame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [v6 traitCollection];
  [v30 displayScale];
  uint64_t v72 = v31;

  objc_msgSend(v6, "convertRect:toView:", v21, v23, v25, v27, v29);
  -[SBHPeopleWidgetPersonDetailZoomAnimator setTargetContentFrameInMatchMoveViewSpace:](self, "setTargetContentFrameInMatchMoveViewSpace:");
  objc_msgSend(v6, "convertRect:toView:", v21, v10, v12, v14, v16);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  -[SBHPeopleWidgetPersonDetailZoomAnimator setSourceContentFrameInMatchMoveViewSpace:](self, "setSourceContentFrameInMatchMoveViewSpace:");
  v40 = -[SBHTouchPassThroughView initWithFrame:]([SBHTouchPassThroughView alloc], "initWithFrame:", v33, v35, v37, v39);
  v73 = self;
  [(SBHPeopleWidgetPersonDetailZoomAnimator *)self setSourceContainerView:v40];
  v41 = [v5 platterView];
  BSRectWithSize();
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  objc_msgSend(v41, "setFrame:");
  [(SBHTouchPassThroughView *)v40 addSubview:v41];
  [v41 addSubview:v7];
  objc_msgSend(v7, "setFrame:", v43, v45, v47, v49);
  [v5 sourceContentCornerRadius];
  objc_msgSend(v41, "_setContinuousCornerRadius:");
  [(SBHTouchPassThroughView *)v21 addSubview:v40];
  BSRectWithSize();
  objc_msgSend(v8, "setFrame:");
  [v8 _setContinuousCornerRadius:0.0];
  v75 = v8;
  [v7 prepareToCrossfadeImageWithView:v8 options:2];
  [v7 setIconLabelAlpha:0.0];
  v50 = [v5 referenceView];
  [v50 setIconImageAlpha:0.0];
  [v50 bounds];
  objc_msgSend(v7, "convertRect:toView:", v6);
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  v59 = [MEMORY[0x1E4F39C00] animation];
  v60 = [v50 layer];
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
  v81.origin.x = v52;
  v81.origin.y = v54;
  v81.size.width = v56;
  v81.size.height = v58;
  double v65 = v62 - CGRectGetMinX(v81);
  v82.origin.x = v52;
  v82.origin.y = v54;
  v82.size.width = v56;
  v82.size.height = v58;
  *(double *)v79 = v65;
  *(double *)&v79[1] = v64 - CGRectGetMinY(v82);
  v66 = [MEMORY[0x1E4F29238] valueWithBytes:v79 objCType:"{CGPoint=dd}"];
  v80[0] = v66;
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
  [v59 setSourcePoints:v67];

  v68 = [(SBHTouchPassThroughView *)v21 layer];
  v69 = [v68 animationForKey:@"SBHPersonDetailZoomMatchMoveAnimation"];

  if (v69) {
    [v68 removeAnimationForKey:@"SBHPersonDetailZoomMatchMoveAnimation"];
  }
  objc_msgSend(v68, "addAnimation:forKey:", v59, @"SBHPersonDetailZoomMatchMoveAnimation", v72);
  v70 = (void *)MEMORY[0x1E4FB1EB0];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __84__SBHPeopleWidgetPersonDetailZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v76[3] = &unk_1E6AADF50;
  id v77 = v5;
  int64_t v78 = a3;
  v76[4] = v73;
  id v71 = v5;
  [v70 performWithoutAnimation:v76];
}

uint64_t __84__SBHPeopleWidgetPersonDetailZoomAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 48) context:*(void *)(a1 + 40) inMode:1 completion:0];
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  double v10 = [v9 userInfo];
  int v11 = [v9 wantsAnimation];

  if (v11)
  {
    [(SBHPeopleWidgetPersonDetailZoomAnimator *)self _configureForEndpoint:a3 context:v10 inMode:3 completion:v8];
  }
  else
  {
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__SBHPeopleWidgetPersonDetailZoomAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v13[3] = &unk_1E6AAE698;
    v13[4] = self;
    int64_t v16 = a3;
    id v14 = v10;
    id v15 = v8;
    [v12 performWithoutAnimation:v13];
  }
}

uint64_t __84__SBHPeopleWidgetPersonDetailZoomAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureForEndpoint:*(void *)(a1 + 56) context:*(void *)(a1 + 40) inMode:1 completion:*(void *)(a1 + 48)];
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  uint64_t v6 = [a4 userInfo];
  v7 = [v6 sourceView];
  [v7 cleanupAfterCrossfade];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v15[0] = *MEMORY[0x1E4F1DAB8];
  v15[1] = v8;
  v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v7 setTransform:v15];
  id v9 = [v6 platterView];
  double v10 = [v6 targetView];
  if (a3)
  {
    int v11 = [v6 containerView];
    [v11 addSubview:v9];

    [v6 targetContentFrame];
    objc_msgSend(v9, "setFrame:");
    [v9 addSubview:v10];
    [v9 bounds];
    objc_msgSend(v10, "setFrame:");
    [v6 targetContentCornerRadius];
    objc_msgSend(v9, "_setContinuousCornerRadius:");
  }
  else
  {
    [v7 setIcon:0];
    [v10 removeFromSuperview];
    [v9 removeFromSuperview];
  }
  [v7 removeFromSuperview];
  double v12 = [(SBHPeopleWidgetPersonDetailZoomAnimator *)self matchMoveView];
  double v13 = [v12 layer];
  [v13 removeAnimationForKey:@"SBHPersonDetailZoomMatchMoveAnimation"];

  id v14 = [(SBHPeopleWidgetPersonDetailZoomAnimator *)self matchMoveView];
  [v14 removeFromSuperview];

  [(SBHPeopleWidgetPersonDetailZoomAnimator *)self setMatchMoveView:0];
}

- (void)_configureForEndpoint:(int64_t)a3 context:(id)a4 inMode:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  int v11 = (void (**)(void))a6;
  if ([(SBHPeopleWidgetPersonDetailZoomAnimator *)self currentEndpoint] == a3)
  {
    if (v11) {
      v11[2](v11);
    }
  }
  else
  {
    [(SBHPeopleWidgetPersonDetailZoomAnimator *)self setCurrentEndpoint:a3];
    double v12 = [(SBHPeopleWidgetPersonDetailZoomAnimator *)self settings];
    double v13 = [v12 zoomAnimationSettings];
    id v14 = [v12 fadeOutAnimationSettings];
    CAFrameRateRange v29 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v13, "setFrameRateRange:highFrameRateReason:", 1114121, *(double *)&v29.minimum, *(double *)&v29.maximum, *(double *)&v29.preferred);
    CAFrameRateRange v30 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v14, "setFrameRateRange:highFrameRateReason:", 1114121, *(double *)&v30.minimum, *(double *)&v30.maximum, *(double *)&v30.preferred);
    id v15 = (void *)MEMORY[0x1E4FA5E48];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke;
    v21[3] = &unk_1E6AAE738;
    int64_t v27 = a3;
    id v22 = v10;
    id v23 = v13;
    double v24 = self;
    id v25 = v12;
    int64_t v28 = a5;
    id v26 = v14;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_6;
    v19[3] = &unk_1E6AAE760;
    double v20 = v11;
    id v16 = v14;
    id v17 = v12;
    id v18 = v13;
    [v15 perform:v21 finalCompletion:v19];
  }
}

void __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 72);
  BOOL v4 = v3 == 1;
  BOOL v31 = v3 == 1;
  if (v3 == 1) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  v7 = a2;
  long long v8 = [v6 sourceView];
  id v9 = [*(id *)(a1 + 32) platterView];
  id v10 = [*(id *)(a1 + 32) referenceView];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_2;
  aBlock[3] = &unk_1E6AAE6C0;
  id v11 = v8;
  id v55 = v11;
  double v12 = _Block_copy(aBlock);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_3;
  v52[3] = &unk_1E6AAE6C0;
  id v13 = v11;
  id v53 = v13;
  id v14 = _Block_copy(v52);
  uint64_t v29 = *(void *)(a1 + 40);
  CAFrameRateRange v30 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v15 = *(void *)(a1 + 80);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_4;
  v41[3] = &unk_1E6AAE6E8;
  uint64_t v16 = *(void *)(a1 + 48);
  id v42 = v13;
  uint64_t v43 = v16;
  BOOL v51 = v4;
  id v44 = *(id *)(a1 + 32);
  id v45 = v9;
  id v17 = v14;
  id v48 = v17;
  double v50 = v5;
  id v18 = v10;
  id v46 = v18;
  id v19 = v12;
  id v49 = v19;
  id v47 = *(id *)(a1 + 56);
  double v20 = (void (*)(void *, __CFString *))v7[2];
  id v34 = v9;
  id v33 = v13;
  v21 = v20(v7, @"zoom");
  objc_msgSend(v30, "sb_animateWithSettings:mode:animations:completion:", v29, v15, v41, v21);

  id v22 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v23 = *(void *)(a1 + 64);
  uint64_t v24 = *(void *)(a1 + 80);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_5;
  v35[3] = &unk_1E6AAE710;
  BOOL v40 = v31;
  double v39 = v5;
  id v36 = v18;
  id v37 = v19;
  id v38 = v17;
  id v25 = (void (*)(void *, __CFString *))v7[2];
  id v26 = v17;
  id v32 = v18;
  id v27 = v19;
  int64_t v28 = v25(v7, @"fadeOut");

  objc_msgSend(v22, "sb_animateWithSettings:mode:animations:completion:", v23, v24, v35, v28);
}

uint64_t __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconFadeFraction:");
}

uint64_t __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCrossfadeViewFadeFraction:");
}

void __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) traitCollection];
  [v2 displayScale];

  uint64_t v3 = [*(id *)(a1 + 40) sourceContainerView];
  BOOL v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 104))
  {
    [v4 targetContentFrameInMatchMoveViewSpace];
    double v6 = v5;
    double v8 = v7;
    [*(id *)(a1 + 48) sourceContentFrame];
    double v10 = v9;
    double v12 = v11;
    [*(id *)(a1 + 32) iconContentScale];
    SBHSizeScaled(v10, v12, v13);
    UISizeRoundToScale();
    double v15 = v6 / v14;
    double v17 = v8 / v16;
    if (v15 <= v17) {
      double v18 = v15;
    }
    else {
      double v18 = v17;
    }
    UIRectGetCenter();
    UIPointRoundToScale();
    objc_msgSend(v3, "setCenter:");
    [v3 bounds];
    UIRectGetCenter();
    UIPointRoundToScale();
    double v20 = v19;
    double v22 = v21;
    uint64_t v23 = *(void **)(a1 + 56);
    BSRectWithSize();
    objc_msgSend(v23, "setBounds:");
    objc_msgSend(*(id *)(a1 + 56), "setCenter:", v20, v22);
    uint64_t v24 = *(void **)(a1 + 56);
    [*(id *)(a1 + 48) targetContentCornerRadius];
    objc_msgSend(v24, "_setContinuousCornerRadius:");
    uint64_t v25 = a1 + 80;
  }
  else
  {
    [v4 sourceContentFrameInMatchMoveViewSpace];
    UIRectGetCenter();
    UIPointRoundToScale();
    objc_msgSend(v3, "setCenter:");
    [v3 bounds];
    UIRectGetCenter();
    UIPointRoundToScale();
    double v27 = v26;
    double v29 = v28;
    CAFrameRateRange v30 = *(void **)(a1 + 56);
    BSRectWithSize();
    objc_msgSend(v30, "setBounds:");
    objc_msgSend(*(id *)(a1 + 56), "setCenter:", v27, v29);
    BOOL v31 = *(void **)(a1 + 56);
    [*(id *)(a1 + 48) sourceContentCornerRadius];
    objc_msgSend(v31, "_setContinuousCornerRadius:");
    double v18 = 1.0;
    [*(id *)(a1 + 64) setIconLabelAlpha:1.0];
    uint64_t v25 = a1 + 88;
  }
  (*(void (**)(double))(*(void *)v25 + 16))(*(double *)(a1 + 96));
  memset(&v62, 0, sizeof(v62));
  CGAffineTransformMakeScale(&v62, v18, v18);
  id v32 = *(void **)(a1 + 32);
  CGAffineTransform v61 = v62;
  [v32 setTransform:&v61];
  id v33 = [*(id *)(a1 + 48) backgroundView];
  [v33 setWeighting:*(double *)(a1 + 96)];

  id v34 = [*(id *)(a1 + 48) backgroundTintView];
  [v34 setAlpha:*(double *)(a1 + 96)];

  [*(id *)(a1 + 32) setMorphFraction:*(double *)(a1 + 96)];
  [*(id *)(a1 + 56) bounds];
  UIRectGetCenter();
  UIPointRoundToScale();
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v61.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v61.c = v35;
  *(_OWORD *)&v61.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id v36 = [*(id *)(a1 + 48) homeScreenContentView];
  if (*(unsigned char *)(a1 + 104))
  {
    int v37 = [*(id *)(a1 + 72) usesCardStyle];
    id v38 = *(void **)(a1 + 72);
    if (v37) {
      [v38 cardStyleHomeScreenScale];
    }
    else {
      [v38 fullScreenHomeScreenScale];
    }
    memset(&v60, 0, sizeof(v60));
    CGAffineTransformMakeScale(&v60, v39, v39);
    v41 = [*(id *)(a1 + 48) homeScreenContentView];
    [v41 center];
    UIPointRoundToScale();
    double v43 = v42;
    double v45 = v44;

    [*(id *)(a1 + 48) homeScreenContentFrame];
    UIRectGetCenter();
    UIPointRoundToScale();
    double v47 = v46;
    double v49 = v48;
    if (BSPointEqualToPoint())
    {
      CGAffineTransform v61 = v60;
    }
    else
    {
      CGFloat v50 = v47 - v43;
      CGFloat v51 = v49 - v45;
      memset(&v59, 0, sizeof(v59));
      CGAffineTransformMakeTranslation(&v59, v50, v51);
      memset(&v58, 0, sizeof(v58));
      CGAffineTransformMakeTranslation(&v58, -v50, -v51);
      CGAffineTransform t1 = v60;
      CGAffineTransform v55 = v59;
      CGAffineTransformConcat(&t2, &t1, &v55);
      CGAffineTransform t1 = v58;
      CGAffineTransformConcat(&v61, &t1, &t2);
    }
    int v52 = [*(id *)(a1 + 72) usesCardStyle];
    id v53 = *(void **)(a1 + 72);
    if (v52) {
      [v53 cardStyleHomeScreenAlpha];
    }
    else {
      [v53 fullScreenHomeScreenAlpha];
    }
    double v40 = v54;
  }
  else
  {
    double v40 = 1.0;
  }
  CGAffineTransform v60 = v61;
  [v36 setTransform:&v60];
  [v36 setAlpha:v40];
}

uint64_t __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_5(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 56);
  if (*(unsigned char *)(a1 + 64))
  {
    (*(void (**)(double))(*(void *)(a1 + 40) + 16))(a2.n128_f64[0]);
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 setIconLabelAlpha:0.0];
  }
  else
  {
    double v5 = *(uint64_t (**)(__n128))(*(void *)(a1 + 48) + 16);
    return v5(a2);
  }
}

uint64_t __91__SBHPeopleWidgetPersonDetailZoomAnimator__configureForEndpoint_context_inMode_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (SBHPeopleWidgetPersonDetailInteractionSettings)settings
{
  return self->_settings;
}

- (SBHTouchPassThroughView)matchMoveView
{
  return self->_matchMoveView;
}

- (void)setMatchMoveView:(id)a3
{
}

- (SBHTouchPassThroughView)sourceContainerView
{
  return self->_sourceContainerView;
}

- (void)setSourceContainerView:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceContainerView, 0);
  objc_storeStrong((id *)&self->_matchMoveView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end