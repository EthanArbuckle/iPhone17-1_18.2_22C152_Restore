@interface NTKBackgroundImageFaceView
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_shouldAdjustLayoutForTimeTravel;
- (BOOL)_shouldFadeToTransitionView;
- (BOOL)_timeLabelUsesLegibility;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGPoint)timeViewZoomEndingCenter;
- (CGRect)maskZoomStartingBounds;
- (CGRect)vignetteZoomStartingBounds;
- (UIImageView)zoomVignette;
- (UIView)backgroundContainerView;
- (UIView)borrowedCircleView;
- (UIView)borrowedTimeView;
- (UIView)zoomMaskView;
- (double)_backgroundImageAlphaForEditMode:(int64_t)a3;
- (double)_parallaxScaleFactor;
- (double)_timeLabelAlphaForEditMode:(int64_t)a3;
- (double)_timeTravelYAdjustment;
- (id)_animationImageView;
- (id)_complicationDisplayWrapperForTouch:(id)a3;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (id)_selectedContentView;
- (id)_updateFontInStyle:(id)a3 monospace:(BOOL)a4;
- (id)_viewForEditOption:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyScaleTransform:(id)a3;
- (void)_applyShowContentForUnadornedSnapshot;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_removeAllSubviewsFrom:(id)a3;
- (void)_scrubToDate:(id)a3 animated:(BOOL)a4;
- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_unloadSnapshotContentViews;
- (void)setBorrowedCircleView:(id)a3;
- (void)setBorrowedTimeView:(id)a3;
- (void)setMaskZoomStartingBounds:(CGRect)a3;
- (void)setTimeViewZoomEndingCenter:(CGPoint)a3;
- (void)setViewMode:(int64_t)a3;
- (void)setVignetteZoomStartingBounds:(CGRect)a3;
- (void)setZoomMaskView:(id)a3;
- (void)setZoomVignette:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation NTKBackgroundImageFaceView

- (void)_loadSnapshotContentViews
{
  v20.receiver = self;
  v20.super_class = (Class)NTKBackgroundImageFaceView;
  [(NTKDigitalFaceView *)&v20 _loadSnapshotContentViews];
  v3 = [(NTKFaceView *)self timeView];
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setTextColor:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(NTKBackgroundImageFaceView *)self bounds];
  v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = v6;

  [(UIView *)self->_backgroundContainerView setAutoresizingMask:18];
  v8 = [(NTKFaceView *)self contentView];
  v9 = self->_backgroundContainerView;
  v10 = [(NTKFaceView *)self foregroundContainerView];
  [v8 insertSubview:v9 belowSubview:v10];

  v11 = [(NTKBackgroundImageFaceView *)self _selectedContentView];
  selectedContentView = self->_selectedContentView;
  self->_selectedContentView = v11;

  [(UIView *)self->_backgroundContainerView addSubview:self->_selectedContentView];
  v13 = self->_selectedContentView;
  [(NTKBackgroundImageFaceView *)self bounds];
  -[UIView setFrame:](v13, "setFrame:");
  [(UIView *)self->_selectedContentView setAutoresizingMask:18];
  id v14 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(NTKBackgroundImageFaceView *)self bounds];
  v15 = (UIView *)objc_msgSend(v14, "initWithFrame:");
  transitionDimmingView = self->_transitionDimmingView;
  self->_transitionDimmingView = v15;

  [(UIView *)self->_transitionDimmingView setAutoresizingMask:18];
  v17 = self->_transitionDimmingView;
  v18 = [MEMORY[0x1E4FB1618] blackColor];
  [(UIView *)v17 setBackgroundColor:v18];

  [(UIView *)self->_transitionDimmingView setAlpha:0.0];
  v19 = [(NTKFaceView *)self contentView];
  [v19 addSubview:self->_transitionDimmingView];

  self->_breathScaleModifier = 1.0;
  self->_rubberBandScaleModifier = 1.0;
}

- (void)_unloadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKBackgroundImageFaceView;
  [(NTKDigitalFaceView *)&v5 _unloadSnapshotContentViews];
  [(UIView *)self->_backgroundContainerView removeFromSuperview];
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = 0;

  [(UIView *)self->_selectedContentView removeFromSuperview];
  selectedContentView = self->_selectedContentView;
  self->_selectedContentView = 0;
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  v6 = [v5 view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = 0;
  }
  else
  {
    v8 = [(NTKBackgroundImageFaceView *)self _complicationDisplayWrapperForTouch:v5];
    BOOL v7 = v8 == 0;
  }
  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return ![(NTKFaceView *)self timeScrubbing];
}

- (id)_complicationDisplayWrapperForTouch:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__13;
  id v14 = __Block_byref_object_dispose__13;
  id v15 = 0;
  [v4 locationInView:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__NTKBackgroundImageFaceView__complicationDisplayWrapperForTouch___block_invoke;
  v9[3] = &unk_1E62C30F0;
  v9[6] = v5;
  v9[7] = v6;
  v9[4] = self;
  v9[5] = &v10;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __66__NTKBackgroundImageFaceView__complicationDisplayWrapperForTouch___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  int v5 = [v8 isUserInteractionEnabled];
  uint64_t v6 = v8;
  if (v5)
  {
    id v7 = [v8 display];
    [v7 bounds];
    objc_msgSend(v7, "convertRect:toView:", *(void *)(a1 + 32));
    CGRect v11 = CGRectInset(v10, -10.0, -10.0);
    if (CGRectContainsPoint(v11, *(CGPoint *)(a1 + 48))) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    }

    uint64_t v6 = v8;
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  int v5 = [a3 anyObject];
  uint64_t v6 = [(NTKBackgroundImageFaceView *)self _complicationDisplayWrapperForTouch:v5];
  touchWrapper = self->_touchWrapper;
  self->_touchWrapper = v6;

  id v8 = self->_touchWrapper;
  if (v8)
  {
    id v9 = [(NTKComplicationDisplayWrapperView *)v8 display];
    [v9 setHighlighted:1];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  int v5 = [a3 anyObject];
  id obj = [(NTKBackgroundImageFaceView *)self _complicationDisplayWrapperForTouch:v5];

  uint64_t v6 = obj;
  p_touchWrapper = (id *)&self->_touchWrapper;
  id v8 = *p_touchWrapper;
  if (obj != *p_touchWrapper)
  {
    if (v8)
    {
      id v9 = [v8 display];
      [v9 setHighlighted:0];

      uint64_t v6 = obj;
    }
    if (v6)
    {
      CGRect v10 = [v6 display];
      [v10 setHighlighted:1];
    }
    objc_storeStrong(p_touchWrapper, obj);
    uint64_t v6 = obj;
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  touchWrapper = self->_touchWrapper;
  if (touchWrapper)
  {
    uint64_t v6 = [(NTKComplicationDisplayWrapperView *)touchWrapper display];
    [v6 setHighlighted:0];

    if ([(NTKComplicationDisplayWrapperView *)self->_touchWrapper tapEnabled])
    {
      id v7 = [(NTKComplicationDisplayWrapperView *)self->_touchWrapper touchUpInsideHandler];

      if (v7)
      {
        id v8 = [(NTKComplicationDisplayWrapperView *)self->_touchWrapper touchUpInsideHandler];
        id v9 = [(NTKComplicationDisplayWrapperView *)self->_touchWrapper display];
        ((void (**)(void, void *))v8)[2](v8, v9);
      }
    }
    CGRect v10 = self->_touchWrapper;
    self->_touchWrapper = 0;
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  touchWrapper = self->_touchWrapper;
  if (touchWrapper)
  {
    uint64_t v6 = [(NTKComplicationDisplayWrapperView *)touchWrapper display];
    [v6 setHighlighted:0];

    id v7 = self->_touchWrapper;
    self->_touchWrapper = 0;
  }
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  [(NTKBackgroundImageFaceView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(NTKFaceView *)self device];
  double v14 = NTKDigitalTimeLabelStyleWideRightSideMargin(v13);
  id v15 = [(NTKFaceView *)self device];
  v16 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 1, v15, v6, v8, v10, v12, v14);

  return v16;
}

- (id)_updateFontInStyle:(id)a3 monospace:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = v5;
  if (v4)
  {
    id v7 = (id)[v5 copy];
    double v8 = (void *)MEMORY[0x1E4F19A50];
    double v9 = [v6 threeDigitFont];
    [v9 pointSize];
    double v10 = objc_msgSend(v8, "systemFontOfSize:");
    double v11 = [v10 CLKFontWithMonospacedNumbers];

    [v7 setFourDigitFont:v11];
    [v7 setThreeDigitFont:v11];
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (unint64_t)a4 > 1;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKBackgroundImageFaceView _backgroundImageAlphaForEditMode:](self, "_backgroundImageAlphaForEditMode:");
  [(NTKBackgroundImageFaceView *)self _backgroundImageAlphaForEditMode:a5];
  double v8 = [(NTKBackgroundImageFaceView *)self _selectedContentView];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  [(NTKBackgroundImageFaceView *)self _timeLabelAlphaForEditMode:a4];
  [(NTKBackgroundImageFaceView *)self _timeLabelAlphaForEditMode:a5];
  id v9 = [(NTKFaceView *)self timeView];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");
}

- (void)_configureForEditMode:(int64_t)a3
{
  id v5 = [(NTKBackgroundImageFaceView *)self _selectedContentView];
  [(NTKBackgroundImageFaceView *)self _backgroundImageAlphaForEditMode:a3];
  objc_msgSend(v5, "setAlpha:");

  id v6 = [(NTKFaceView *)self timeView];
  [(NTKBackgroundImageFaceView *)self _timeLabelAlphaForEditMode:a3];
  objc_msgSend(v6, "setAlpha:");
}

- (double)_backgroundImageAlphaForEditMode:(int64_t)a3
{
  double result = 0.4;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_timeLabelAlphaForEditMode:(int64_t)a3
{
  double result = 0.2;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (id)_animationImageView
{
  return 0;
}

- (double)_parallaxScaleFactor
{
  return 1.0;
}

- (void)_prepareForEditing
{
  v6.receiver = self;
  v6.super_class = (Class)NTKBackgroundImageFaceView;
  [(NTKFaceView *)&v6 _prepareForEditing];
  v3 = [(NTKFaceView *)self device];
  [v3 screenCornerRadius];
  double v5 = v4;

  NTKApplyViewCornerRadius(self->_backgroundContainerView, v5);
}

- (void)_cleanupAfterEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKBackgroundImageFaceView;
  [(NTKFaceView *)&v3 _cleanupAfterEditing];
  NTKApplyViewCornerRadius(self->_backgroundContainerView, 0.0);
}

- (void)setViewMode:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKBackgroundImageFaceView;
  [(NTKDigitalFaceView *)&v3 setViewMode:a3];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  if ([v11 isEqual:v12])
  {
    if ([v12 isEqual:self->_editOptionFrom])
    {
      transitionViewFrom = self->_transitionViewFrom;
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v50 = *MEMORY[0x1E4F1DAB8];
      long long v51 = v14;
      long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)transitionViewFrom setTransform:&v50];
      uint64_t v15 = 888;
LABEL_13:
      [*(id *)((char *)&self->super.super.super.super.super.isa + v15) setHidden:1];
      goto LABEL_14;
    }
    if ([v12 isEqual:self->_editOptionTo])
    {
      transitionViewTo = self->_transitionViewTo;
      long long v47 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v50 = *MEMORY[0x1E4F1DAB8];
      long long v51 = v47;
      long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)transitionViewTo setTransform:&v50];
      uint64_t v15 = 872;
      goto LABEL_13;
    }
  }
  else
  {
    v16 = [(NTKFaceView *)self device];
    [v16 screenCornerRadius];
    double v18 = v17;

    [(UIView *)self->_transitionViewFrom setHidden:0];
    [(UIView *)self->_transitionViewTo setHidden:0];
    [(NTKBackgroundImageFaceView *)self _beginTransitionToOption];
    if (([(NTKEditOption *)self->_editOptionTo isEqual:v12] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_editOptionTo, a5);
      [(UIView *)self->_transitionViewTo removeFromSuperview];
      v19 = [(NTKBackgroundImageFaceView *)self _viewForEditOption:v12];
      objc_super v20 = self->_transitionViewTo;
      self->_transitionViewTo = v19;

      v21 = self->_transitionViewTo;
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v50 = *MEMORY[0x1E4F1DAB8];
      long long v51 = v22;
      long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)v21 setTransform:&v50];
      v23 = self->_transitionViewTo;
      [(NTKBackgroundImageFaceView *)self bounds];
      -[UIView setFrame:](v23, "setFrame:");
      NTKApplyViewCornerRadius(self->_transitionViewTo, v18);
      [(UIView *)self->_backgroundContainerView addSubview:self->_transitionViewTo];
    }
    if ([(NTKBackgroundImageFaceView *)self _shouldFadeToTransitionView])
    {
      v24 = self->_transitionViewTo;
      CLKCompressFraction();
      -[UIView setAlpha:](v24, "setAlpha:");
    }
    if (([(NTKEditOption *)self->_editOptionFrom isEqual:v11] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_editOptionFrom, a4);
      [(UIView *)self->_transitionViewFrom removeFromSuperview];
      v25 = [(NTKBackgroundImageFaceView *)self _viewForEditOption:v11];
      v26 = self->_transitionViewFrom;
      self->_transitionViewFrom = v25;

      v27 = self->_transitionViewFrom;
      long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v50 = *MEMORY[0x1E4F1DAB8];
      long long v51 = v28;
      long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)v27 setTransform:&v50];
      v29 = self->_transitionViewFrom;
      [(NTKBackgroundImageFaceView *)self bounds];
      -[UIView setFrame:](v29, "setFrame:");
      NTKApplyViewCornerRadius(self->_transitionViewFrom, v18);
      [(UIView *)self->_backgroundContainerView addSubview:self->_transitionViewFrom];
    }
    v30 = self->_transitionViewFrom;
    [(NTKBackgroundImageFaceView *)self bounds];
    CGAffineTransformMakeTranslation(&v49, 0.0, -(a3 * v31));
    uint64_t v32 = [(UIView *)v30 setTransform:&v49];
    v33.f64[0] = 0.0;
    v34.f64[0] = 0.0;
    v35.f64[0] = 1.0;
    double v44 = NTKFindCubicBezierPoint(a3, v33, 0.0, v34, 0.0, v35, 0.0, v32, v36, v37, v38, v39, v40, v41, v42, v43);
    v45 = self->_transitionViewTo;
    CGAffineTransformMakeScale(&v48, (1.0 - v44) * -0.1 + 1.0, (1.0 - v44) * -0.1 + 1.0);
    -[UIView setTransform:](v45, "setTransform:", &v48, 0x3FF0000000000000, 0);
  }
LABEL_14:
}

- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  [(UIView *)self->_transitionViewFrom removeFromSuperview];
  [(UIView *)self->_transitionViewTo removeFromSuperview];
  editOptionFrom = self->_editOptionFrom;
  self->_editOptionFrom = 0;

  transitionViewFrom = self->_transitionViewFrom;
  self->_transitionViewFrom = 0;

  editOptionTo = self->_editOptionTo;
  self->_editOptionTo = 0;

  transitionViewTo = self->_transitionViewTo;
  self->_transitionViewTo = 0;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  self->_breathScaleModifier = NTKLargeElementScaleForBreathingFraction(a3);
  backgroundContainerView = self->_backgroundContainerView;

  [(NTKBackgroundImageFaceView *)self _applyScaleTransform:backgroundContainerView];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v8 = NTKScaleForRubberBandingFraction(a3);
  double v9 = NTKAlphaForRubberBandingFraction(a3);
  [(NTKBackgroundImageFaceView *)self _backgroundImageAlphaForEditMode:a4];
  double v11 = v9 * v10;
  self->_rubberBandScaleModifier = v8;
  [(NTKBackgroundImageFaceView *)self _applyScaleTransform:self->_backgroundContainerView];
  transitionDimmingView = self->_transitionDimmingView;

  [(UIView *)transitionDimmingView setAlpha:1.0 - v11];
}

- (void)_applyScaleTransform:(id)a3
{
  CGFloat v3 = self->_breathScaleModifier * self->_rubberBandScaleModifier;
  id v4 = a3;
  CGAffineTransformMakeScale(&v5, v3, v3);
  [v4 setTransform:&v5];
}

- (BOOL)_shouldFadeToTransitionView
{
  return 0;
}

- (double)_timeTravelYAdjustment
{
  v2 = [(NTKFaceView *)self device];
  if ([v2 sizeClass]) {
    double v3 = 13.5;
  }
  else {
    double v3 = 12.5;
  }

  return v3;
}

- (BOOL)_shouldAdjustLayoutForTimeTravel
{
  return self->_shouldAdjustLayoutForTimeTravel;
}

- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKBackgroundImageFaceView;
  [(NTKFaceView *)&v15 _startScrubbingAnimated:a3 withCompletion:a4];
  self->_shouldAdjustLayoutForTimeTravel = 1;
  [(NTKFaceView *)self _loadLayoutRules];
  objc_super v6 = [(NTKFaceView *)self foregroundContainerView];
  [v6 setNeedsLayout];

  timeTravelDimmingOverlayView = self->_timeTravelDimmingOverlayView;
  if (!timeTravelDimmingOverlayView)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKBackgroundImageFaceView *)self bounds];
    double v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
    double v10 = self->_timeTravelDimmingOverlayView;
    self->_timeTravelDimmingOverlayView = v9;

    double v11 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)self->_timeTravelDimmingOverlayView setBackgroundColor:v11];

    timeTravelDimmingOverlayView = self->_timeTravelDimmingOverlayView;
  }
  [(UIView *)timeTravelDimmingOverlayView setAlpha:0.0];
  id v12 = self->_timeTravelDimmingOverlayView;
  v13 = [(NTKFaceView *)self foregroundContainerView];
  [(NTKBackgroundImageFaceView *)self insertSubview:v12 belowSubview:v13];

  if (v4)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__NTKBackgroundImageFaceView__startScrubbingAnimated_withCompletion___block_invoke;
    v14[3] = &unk_1E62BFF20;
    v14[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v14 animations:0.3];
  }
}

uint64_t __69__NTKBackgroundImageFaceView__startScrubbingAnimated_withCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) foregroundContainerView];
  [v2 layoutIfNeeded];

  [*(id *)(a1 + 32) layoutComplicationViews];
  [*(id *)(*(void *)(a1 + 32) + 912) setAlpha:0.5];
  double v3 = *(void **)(a1 + 32);

  return [v3 _startScrubbingAnimationFromUIViewAnimateWithDuration];
}

- (void)_scrubToDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NTKBackgroundImageFaceView;
  id v6 = a3;
  [(NTKFaceView *)&v10 _scrubToDate:v6 animated:v4];
  id v7 = [(NTKFaceView *)self timeView];
  id v8 = v7;
  double v9 = 0.3;
  if (!v4) {
    double v9 = 0.0;
  }
  [v7 setOverrideDate:v6 duration:v9];
}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(NTKFaceView *)self timeView];
  id v8 = v7;
  double v9 = 0.0;
  if (v4) {
    double v9 = 0.3;
  }
  [v7 setOverrideDate:0 duration:v9];

  self->_shouldAdjustLayoutForTimeTravel = 0;
  [(NTKFaceView *)self _loadLayoutRules];
  objc_super v10 = [(NTKFaceView *)self foregroundContainerView];
  [v10 setNeedsLayout];

  if (v4)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__NTKBackgroundImageFaceView__endScrubbingAnimated_withCompletion___block_invoke;
    v13[3] = &unk_1E62BFF20;
    v13[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__NTKBackgroundImageFaceView__endScrubbingAnimated_withCompletion___block_invoke_2;
    v12[3] = &unk_1E62C2648;
    v12[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v13 animations:v12 completion:0.3];
  }
  else
  {
    [(UIView *)self->_timeTravelDimmingOverlayView setAlpha:0.0];
    [(UIView *)self->_timeTravelDimmingOverlayView removeFromSuperview];
    [(NTKBackgroundImageFaceView *)self _endScrubbingAnimationFromUIViewAnimateWithDuration];
  }
  v11.receiver = self;
  v11.super_class = (Class)NTKBackgroundImageFaceView;
  [(NTKFaceView *)&v11 _endScrubbingAnimated:v4 withCompletion:v6];
}

uint64_t __67__NTKBackgroundImageFaceView__endScrubbingAnimated_withCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) foregroundContainerView];
  [v2 layoutIfNeeded];

  [*(id *)(*(void *)(a1 + 32) + 912) setAlpha:0.0];
  double v3 = *(void **)(a1 + 32);

  return [v3 _endScrubbingAnimationFromUIViewAnimateWithDuration];
}

uint64_t __67__NTKBackgroundImageFaceView__endScrubbingAnimated_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 912) removeFromSuperview];
}

- (BOOL)_timeLabelUsesLegibility
{
  return 0;
}

- (id)_selectedContentView
{
  return 0;
}

- (id)_viewForEditOption:(id)a3
{
  return 0;
}

- (void)_applyShowContentForUnadornedSnapshot
{
  id v3 = [(NTKFaceView *)self timeView];
  objc_msgSend(v3, "setHidden:", -[NTKFaceView showContentForUnadornedSnapshot](self, "showContentForUnadornedSnapshot"));
}

- (void)_removeAllSubviewsFrom:(id)a3
{
  id v3 = [a3 subviews];
  [v3 makeObjectsPerformSelector:sel_removeFromSuperview];
}

- (UIView)backgroundContainerView
{
  return self->_backgroundContainerView;
}

- (UIView)zoomMaskView
{
  return self->_zoomMaskView;
}

- (void)setZoomMaskView:(id)a3
{
}

- (UIImageView)zoomVignette
{
  return self->_zoomVignette;
}

- (void)setZoomVignette:(id)a3
{
}

- (CGPoint)timeViewZoomEndingCenter
{
  double x = self->_timeViewZoomEndingCenter.x;
  double y = self->_timeViewZoomEndingCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTimeViewZoomEndingCenter:(CGPoint)a3
{
  self->_timeViewZoomEndingCenter = a3;
}

- (CGRect)vignetteZoomStartingBounds
{
  double x = self->_vignetteZoomStartingBounds.origin.x;
  double y = self->_vignetteZoomStartingBounds.origin.y;
  double width = self->_vignetteZoomStartingBounds.size.width;
  double height = self->_vignetteZoomStartingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVignetteZoomStartingBounds:(CGRect)a3
{
  self->_vignetteZoomStartingBounds = a3;
}

- (CGRect)maskZoomStartingBounds
{
  double x = self->_maskZoomStartingBounds.origin.x;
  double y = self->_maskZoomStartingBounds.origin.y;
  double width = self->_maskZoomStartingBounds.size.width;
  double height = self->_maskZoomStartingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMaskZoomStartingBounds:(CGRect)a3
{
  self->_maskZoomStartingBounds = a3;
}

- (UIView)borrowedCircleView
{
  return self->_borrowedCircleView;
}

- (void)setBorrowedCircleView:(id)a3
{
}

- (UIView)borrowedTimeView
{
  return self->_borrowedTimeView;
}

- (void)setBorrowedTimeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borrowedTimeView, 0);
  objc_storeStrong((id *)&self->_borrowedCircleView, 0);
  objc_storeStrong((id *)&self->_zoomVignette, 0);
  objc_storeStrong((id *)&self->_zoomMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_touchWrapper, 0);
  objc_storeStrong((id *)&self->_selectedContentView, 0);
  objc_storeStrong((id *)&self->_timeTravelDimmingOverlayView, 0);
  objc_storeStrong((id *)&self->_transitionDimmingView, 0);
  objc_storeStrong((id *)&self->_transitionViewTo, 0);
  objc_storeStrong((id *)&self->_editOptionTo, 0);
  objc_storeStrong((id *)&self->_transitionViewFrom, 0);

  objc_storeStrong((id *)&self->_editOptionFrom, 0);
}

@end