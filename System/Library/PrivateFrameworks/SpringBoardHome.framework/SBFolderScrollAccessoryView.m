@interface SBFolderScrollAccessoryView
- (CGSize)intrinsicContentSize;
- (SBFFluidBehaviorSettings)auxiliaryViewFadeInSettings;
- (SBFFluidBehaviorSettings)pageControlFadeInSettings;
- (SBFolder)folder;
- (SBFolderScrollAccessoryView)initWithFolder:(id)a3 pageControl:(id)a4;
- (SBIconListPageControl)pageControl;
- (UIPageControl)layoutPageControl;
- (UIView)auxiliaryView;
- (UIView)backgroundView;
- (UIViewFloatAnimatableProperty)modeAnimatableProperty;
- (id)_layoutPageControlConfiguredForNumberOfPages:(int64_t)a3;
- (id)_layoutPageControlMatchingPageControl:(id)a3;
- (id)_pageIndicatorsView;
- (int64_t)_numberOfPagesForWidth:(double)a3 maxPageCount:(unint64_t)a4;
- (int64_t)mode;
- (void)_applyCurrentMode;
- (void)_applyMatchingAnimationsForAuxiliaryViewMatchingContentView:(id)a3;
- (void)_clearMatchingAnimationsForAuxiliaryView;
- (void)_getCustomPaddingForNumberOfPages:(unint64_t)a3 backgroundViewSize:(CGSize)a4 horizontalPadding:(double *)a5 verticalPadding:(double *)a6 layoutPageControl:(id *)a7;
- (void)_setUpAnimation;
- (void)_updateForModePropertyChanged;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAuxiliaryView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setLayoutPageControl:(id)a3;
- (void)setMode:(int64_t)a3;
@end

@implementation SBFolderScrollAccessoryView

- (void)_getCustomPaddingForNumberOfPages:(unint64_t)a3 backgroundViewSize:(CGSize)a4 horizontalPadding:(double *)a5 verticalPadding:(double *)a6 layoutPageControl:(id *)a7
{
  double height = a4.height;
  double width = a4.width;
  id v26 = [(SBFolderScrollAccessoryView *)self _layoutPageControlConfiguredForNumberOfPages:"_layoutPageControlConfiguredForNumberOfPages:"];
  [v26 _indicatorFrameForPage:0];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [v26 _indicatorFrameForPage:a3 - 1];
  v30.origin.x = v21;
  v30.origin.y = v22;
  v30.size.double width = v23;
  v30.size.double height = v24;
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.double width = v18;
  v28.size.double height = v20;
  CGRect v29 = CGRectUnion(v28, v30);
  if (a5) {
    *a5 = (width - v29.size.width) * 0.5;
  }
  if (a6) {
    *a6 = (height - v29.size.height) * 0.5;
  }
  v25 = v26;
  if (a7)
  {
    *a7 = v26;
    v25 = v26;
  }
}

- (id)_layoutPageControlConfiguredForNumberOfPages:(int64_t)a3
{
  v4 = [(SBFolderScrollAccessoryView *)self layoutPageControl];
  if ([v4 numberOfPages] != a3
    || ([v4 _customHorizontalPadding], !BSFloatIsZero())
    || ([v4 _customVerticalPadding], (BSFloatIsZero() & 1) == 0))
  {
    [v4 setNumberOfPages:a3];
    [v4 _setCustomIndicatorSpacing:6.0];
    [v4 _setCustomHorizontalPadding:0.0];
    [v4 _setCustomVerticalPadding:0.0];
    [v4 intrinsicContentSize];
    BSRectWithSize();
    objc_msgSend(v4, "setFrame:");
    [v4 setNeedsLayout];
    [v4 layoutIfNeeded];
  }
  return v4;
}

- (UIPageControl)layoutPageControl
{
  return self->_layoutPageControl;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(SBFolderScrollAccessoryView *)self auxiliaryView];
  v4 = v3;
  if (v3)
  {
    [v3 intrinsicContentSize];
    double v6 = v5;
    double v8 = v7;
    v9 = [(SBFolderScrollAccessoryView *)self folder];
    int64_t v10 = -[SBFolderScrollAccessoryView _numberOfPagesForWidth:maxPageCount:](self, "_numberOfPagesForWidth:maxPageCount:", [v9 maxListCount], v6);

    v11 = [(SBFolderScrollAccessoryView *)self pageControl];
    uint64_t v12 = [v11 numberOfPages];

    double v22 = 0.0;
    double v23 = 0.0;
    if (v12 >= v10) {
      int64_t v13 = v10;
    }
    else {
      int64_t v13 = v12;
    }
    id v21 = 0;
    -[SBFolderScrollAccessoryView _getCustomPaddingForNumberOfPages:backgroundViewSize:horizontalPadding:verticalPadding:layoutPageControl:](self, "_getCustomPaddingForNumberOfPages:backgroundViewSize:horizontalPadding:verticalPadding:layoutPageControl:", v13, &v23, &v22, &v21, v6, v8);
    id v14 = v21;
    [v14 _setCustomHorizontalPadding:v23];
    [v14 _setCustomVerticalPadding:v22];
    [v14 sizeForNumberOfPages:v13];
  }
  else
  {
    id v14 = [(SBFolderScrollAccessoryView *)self pageControl];
    [v14 intrinsicContentSize];
  }
  double v17 = v15;
  double v18 = v16;

  double v19 = v17;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (SBIconListPageControl)pageControl
{
  return self->_pageControl;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (int64_t)_numberOfPagesForWidth:(double)a3 maxPageCount:(unint64_t)a4
{
  double v7 = [(SBFolderScrollAccessoryView *)self auxiliaryView];

  if (!v7) {
    return a4;
  }
  double v8 = [(SBFolderScrollAccessoryView *)self traitCollection];
  [v8 displayScale];
  BSFloatRoundForScale();
  double v10 = v9;

  unint64_t v11 = vcvtmd_s64_f64((a3 - v10 - v10 + 7.5) / 14.0);
  if (v11 >= a4) {
    return a4;
  }
  else {
    return v11;
  }
}

- (UIView)auxiliaryView
{
  return self->_auxiliaryView;
}

- (SBFolderScrollAccessoryView)initWithFolder:(id)a3 pageControl:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBFolderScrollAccessoryView;
  double v9 = [(SBFolderScrollAccessoryView *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folder, a3);
    objc_storeStrong((id *)&v10->_pageControl, a4);
    [(SBFolderScrollAccessoryView *)v10 addSubview:v8];
    [(SBFolderScrollAccessoryView *)v10 _setUpAnimation];
  }

  return v10;
}

- (void)dealloc
{
  v3 = [(SBFolderScrollAccessoryView *)self modeAnimatableProperty];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SBFolderScrollAccessoryView;
  [(SBFolderScrollAccessoryView *)&v4 dealloc];
}

- (void)setAuxiliaryView:(id)a3
{
  double v5 = (UIView *)a3;
  if (self->_auxiliaryView != v5)
  {
    id v14 = v5;
    [(SBFolderScrollAccessoryView *)self _clearMatchingAnimationsForAuxiliaryView];
    [(UIView *)self->_auxiliaryView removeFromSuperview];
    objc_storeStrong((id *)&self->_auxiliaryView, a3);
    double v6 = [(SBFolderScrollAccessoryView *)self pageControl];
    id v7 = v6;
    if (v14)
    {
      -[SBFolderScrollAccessoryView addSubview:](self, "addSubview:");
      id v8 = (void *)MEMORY[0x1E4FB1818];
      double v9 = [MEMORY[0x1E4FB1830] configurationWithPointSize:11.0];
      double v10 = [v8 systemImageNamed:@"circlebadge.fill" withConfiguration:v9];

      [v7 setPreferredIndicatorImage:v10];
      unint64_t v11 = [v7 subviews];
      objc_super v12 = [v11 firstObject];

      if (v12) {
        [(SBFolderScrollAccessoryView *)self _applyMatchingAnimationsForAuxiliaryViewMatchingContentView:v12];
      }
      [(UIView *)v14 setUserInteractionEnabled:0];
      [(SBFolderScrollAccessoryView *)self _updateForModePropertyChanged];
      int64_t v13 = [(SBFolderScrollAccessoryView *)self _layoutPageControlMatchingPageControl:v7];
      [(SBFolderScrollAccessoryView *)self setLayoutPageControl:v13];
    }
    else
    {
      objc_msgSend(v6, "setPreferredIndicatorImage:");
      [(SBFolderScrollAccessoryView *)self setLayoutPageControl:0];
    }

    double v5 = v14;
  }
}

- (void)setBackgroundView:(id)a3
{
  double v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    double v9 = v5;
    objc_storeStrong((id *)&self->_backgroundView, a3);
    char v7 = [MEMORY[0x1E4FA6010] isRunningXCTest];
    double v5 = v9;
    if ((v7 & 1) == 0)
    {
      id v8 = [(SBFolderScrollAccessoryView *)self pageControl];
      [v8 _setPlatterBackgroundView:*p_backgroundView];

      double v5 = v9;
    }
  }
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(SBFolderScrollAccessoryView *)self _applyCurrentMode];
  }
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)SBFolderScrollAccessoryView;
  [(SBFolderScrollAccessoryView *)&v33 layoutSubviews];
  [(SBFolderScrollAccessoryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(SBFolderScrollAccessoryView *)self pageControl];
  objc_super v12 = [(SBFolderScrollAccessoryView *)self auxiliaryView];
  int64_t v13 = [(SBFolderScrollAccessoryView *)self folder];
  uint64_t v14 = [v13 maxListCount];

  double v15 = [(SBFolderScrollAccessoryView *)self traitCollection];
  [v15 displayScale];
  uint64_t v17 = v16;

  if (v12)
  {
    [v12 intrinsicContentSize];
    double v19 = v18;
    double v21 = v20;
    int64_t v22 = -[SBFolderScrollAccessoryView _numberOfPagesForWidth:maxPageCount:](self, "_numberOfPagesForWidth:maxPageCount:", v14);
    double v23 = [v12 superview];
    [v23 bounds];

    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    BSRectWithSize();
    [v12 setBounds:v17];
    UIRectGetCenter();
    objc_msgSend(v12, "setCenter:");
    [v11 _setCustomIndicatorSpacing:6.0];
    [v11 _setPreferredNumberOfVisibleIndicators:v22];
    uint64_t v24 = [v11 numberOfPages];
    if (v24 < v22) {
      int64_t v22 = v24;
    }
    double v31 = 0.0;
    double v32 = 0.0;
    -[SBFolderScrollAccessoryView _getCustomPaddingForNumberOfPages:backgroundViewSize:horizontalPadding:verticalPadding:layoutPageControl:](self, "_getCustomPaddingForNumberOfPages:backgroundViewSize:horizontalPadding:verticalPadding:layoutPageControl:", v22, &v32, &v31, 0, v19, v21);
    [v11 _setCustomHorizontalPadding:v32];
    [v11 _setCustomVerticalPadding:v31];
    [v11 sizeForNumberOfPages:v22];
    BSRectWithSize();
    uint64_t v30 = v17;
    UIRectCenteredIntegralRectScale();
    CGRect v29 = v11;
  }
  else
  {
    [v11 _setPreferredNumberOfVisibleIndicators:v14];
    CGRect v29 = v11;
    double v25 = v4;
    double v26 = v6;
    double v27 = v8;
    double v28 = v10;
  }
  objc_msgSend(v29, "setFrame:", v25, v26, v27, v28, v30);
}

- (void)_setUpAnimation
{
  v17[1] = *MEMORY[0x1E4F143B8];
  double v3 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E4FA5F08]);
  pageControlFadeInSettings = self->_pageControlFadeInSettings;
  self->_pageControlFadeInSettings = v3;

  [(SBFFluidBehaviorSettings *)self->_pageControlFadeInSettings setDampingRatio:0.6529];
  [(SBFFluidBehaviorSettings *)self->_pageControlFadeInSettings setResponse:0.4558];
  double v5 = self->_pageControlFadeInSettings;
  CAFrameRateRange v18 = CAFrameRateRangeMake(20.0, 120.0, 30.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v5, "setFrameRateRange:highFrameRateReason:", 1114139, *(double *)&v18.minimum, *(double *)&v18.maximum, *(double *)&v18.preferred);
  double v6 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E4FA5F08]);
  auxiliaryViewFadeInSettings = self->_auxiliaryViewFadeInSettings;
  self->_auxiliaryViewFadeInSettings = v6;

  [(SBFFluidBehaviorSettings *)self->_auxiliaryViewFadeInSettings setDampingRatio:1.2883];
  [(SBFFluidBehaviorSettings *)self->_auxiliaryViewFadeInSettings setResponse:0.3598];
  double v8 = self->_auxiliaryViewFadeInSettings;
  CAFrameRateRange v19 = CAFrameRateRangeMake(20.0, 120.0, 30.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v8, "setFrameRateRange:highFrameRateReason:", 1114139, *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
  double v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4FB1ED0]);
  p_modeAnimatableProperty = &self->_modeAnimatableProperty;
  modeAnimatableProperty = self->_modeAnimatableProperty;
  self->_modeAnimatableProperty = v9;

  [(UIViewFloatAnimatableProperty *)self->_modeAnimatableProperty setValue:0.0];
  objc_initWeak(&location, self);
  objc_super v12 = (void *)MEMORY[0x1E4FB1EB0];
  v17[0] = *p_modeAnimatableProperty;
  int64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__SBFolderScrollAccessoryView__setUpAnimation__block_invoke;
  v14[3] = &unk_1E6AB0278;
  objc_copyWeak(&v15, &location);
  [v12 _createTransformerWithInputAnimatableProperties:v13 presentationValueChangedCallback:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __46__SBFolderScrollAccessoryView__setUpAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateForModePropertyChanged];
}

- (void)_applyCurrentMode
{
  int64_t v3 = [(SBFolderScrollAccessoryView *)self mode];
  if (v3) {
    [(SBFolderScrollAccessoryView *)self auxiliaryViewFadeInSettings];
  }
  else {
  double v4 = [(SBFolderScrollAccessoryView *)self pageControlFadeInSettings];
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SBFolderScrollAccessoryView__applyCurrentMode__block_invoke;
  v5[3] = &unk_1E6AAD728;
  BOOL v6 = v3 == 0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "sb_animateWithSettings:mode:animations:completion:", v4, 3, v5, 0);
}

void __48__SBFolderScrollAccessoryView__applyCurrentMode__block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = [*(id *)(a1 + 32) modeAnimatableProperty];
  id v4 = v2;
  double v3 = 0.0;
  if (!v1) {
    double v3 = 1.0;
  }
  [v2 setValue:v3];
}

- (void)_updateForModePropertyChanged
{
  double v3 = [(SBFolderScrollAccessoryView *)self modeAnimatableProperty];
  [v3 presentationValue];
  long long v25 = v4;

  if ([(SBFolderScrollAccessoryView *)self mode])
  {
    v5.f64[0] = *(double *)&v25 * 0.02;
    *(void *)&v5.f64[1] = v25;
    __asm { FMOV            V1.2D, #1.0 }
    float64x2_t sx = vminnmq_f64(vmaxnmq_f64(vaddq_f64(vdivq_f64(v5, (float64x2_t)vdupq_n_s64(0xBFD6666666666666)), _Q1), (float64x2_t)xmmword_1D81E5400), _Q1);
    double v11 = *(double *)&v25 + -0.3;
    double v12 = 0.7;
    double v13 = (*(double *)&v25 + -0.3) / 0.7 + 0.0;
    double v14 = 0.98;
  }
  else
  {
    v15.f64[0] = (*(double *)&v25 + -0.7) * 0.02;
    v15.f64[1] = *(double *)&v25 + -0.7;
    float64x2_t v16 = vmaxnmq_f64(vaddq_f64(vdivq_f64(v15, (float64x2_t)vdupq_n_s64(0xBFE6666666666666)), (float64x2_t)xmmword_1D81E5400), (float64x2_t)xmmword_1D81E5400);
    __asm { FMOV            V1.2D, #1.0 }
    float64x2_t sx = vminnmq_f64(v16, _Q1);
    double v11 = *(double *)&v25 + -1.0;
    double v12 = 0.35;
    double v14 = 1.0;
    double v13 = (*(double *)&v25 + -1.0) / 0.35 + 1.0;
  }
  double v18 = fmin(fmax(v13, 0.0), 1.0);
  double v19 = fmin(fmax(v11 * 0.02 / v12 + v14, 0.98), 1.0);
  double v20 = [(SBFolderScrollAccessoryView *)self pageControl];
  [v20 _setIndicatorOpacity:sx.f64[1]];
  memset(&v29, 0, sizeof(v29));
  if (BSFloatEqualToFloat())
  {
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v29.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v29.c = v21;
    *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v29, sx.f64[0], sx.f64[0]);
  }
  int64_t v22 = [(SBFolderScrollAccessoryView *)self _pageIndicatorsView];
  CGAffineTransform v28 = v29;
  [v22 setTransform:&v28];

  double v23 = [(SBFolderScrollAccessoryView *)self auxiliaryView];
  [v23 setAlpha:v18];
  memset(&v28, 0, sizeof(v28));
  if (BSFloatEqualToFloat())
  {
    long long v24 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v28.c = v24;
    *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v28, v19, v19);
  }
  CGAffineTransform v27 = v28;
  [v23 setTransform:&v27];
}

- (id)_pageIndicatorsView
{
  v2 = [(SBFolderScrollAccessoryView *)self pageControl];
  double v3 = [v2 subviews];
  long long v4 = [v3 firstObject];

  if (v4
    && ([v4 subviews],
        float64x2_t v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 >= 2))
  {
    double v7 = [v4 subviews];
    double v8 = [v7 objectAtIndex:1];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)_layoutPageControlMatchingPageControl:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x1E4FB1A40];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setHidden:1];
  unint64_t v6 = [v4 preferredIndicatorImage];
  [v5 setPreferredIndicatorImage:v6];

  uint64_t v7 = [v4 backgroundStyle];
  [v5 setBackgroundStyle:v7];
  [v5 _setCustomHorizontalPadding:0.0];
  [v5 _setCustomVerticalPadding:0.0];
  return v5;
}

- (void)_clearMatchingAnimationsForAuxiliaryView
{
  v2 = [(SBFolderScrollAccessoryView *)self auxiliaryView];
  id v3 = [v2 layer];

  [v3 removeAnimationForKey:@"SBFolderScrollAccessoryAuxiliaryViewMatchMoveAnimation"];
  [v3 removeAnimationForKey:@"SBFolderScrollAccessoryAuxiliaryViewScaleAnimation"];
}

- (void)_applyMatchingAnimationsForAuxiliaryViewMatchingContentView:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBFolderScrollAccessoryView *)self auxiliaryView];
  unint64_t v6 = [v5 layer];

  uint64_t v7 = [v4 layer];

  id v8 = objc_alloc_init(MEMORY[0x1E4F39C00]);
  [v8 setSourceLayer:v7];
  [v8 setUsesNormalizedCoordinates:1];
  double v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.5, 0.5);
  v12[0] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v8 setSourcePoints:v10];

  [v8 setDuration:INFINITY];
  [v8 setRemovedOnCompletion:0];
  [v6 addAnimation:v8 forKey:@"SBFolderScrollAccessoryAuxiliaryViewMatchMoveAnimation"];
  id v11 = objc_alloc_init(MEMORY[0x1E4F39C08]);
  [v11 setSourceLayer:v7];
  [v11 setKeyPath:@"transform"];
  [v11 setAdditive:1];
  [v11 setDuration:INFINITY];
  [v11 setRemovedOnCompletion:0];
  [v6 addAnimation:v11 forKey:@"SBFolderScrollAccessoryAuxiliaryViewScaleAnimation"];
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setLayoutPageControl:(id)a3
{
}

- (UIViewFloatAnimatableProperty)modeAnimatableProperty
{
  return self->_modeAnimatableProperty;
}

- (SBFFluidBehaviorSettings)pageControlFadeInSettings
{
  return self->_pageControlFadeInSettings;
}

- (SBFFluidBehaviorSettings)auxiliaryViewFadeInSettings
{
  return self->_auxiliaryViewFadeInSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryViewFadeInSettings, 0);
  objc_storeStrong((id *)&self->_pageControlFadeInSettings, 0);
  objc_storeStrong((id *)&self->_modeAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_layoutPageControl, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_auxiliaryView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end