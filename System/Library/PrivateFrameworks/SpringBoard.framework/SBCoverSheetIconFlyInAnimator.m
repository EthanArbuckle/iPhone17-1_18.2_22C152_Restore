@interface SBCoverSheetIconFlyInAnimator
- (CAMediaTimingFunction)timingFunction;
- (SBCoverSheetIconFlyInAnimator)initWithFolderController:(id)a3;
- (UIPageControl)pageControl;
- (UIViewFloatAnimatableProperty)labelAlphaDrivingProgressAnimatableProperty;
- (double)_functionWithProgress:(double)a3 distance:(double)a4;
- (double)_labelAlphaForFraction:(double)a3;
- (double)_zPositionForPoint:(CGPoint)a3 center:(CGPoint)a4 andFraction:(double)a5;
- (double)_zPositionForView:(id)a3 center:(CGPoint)a4 andFraction:(double)a5;
- (void)_cleanupAnimation;
- (void)_createAnimatableProperties;
- (void)_prepareAnimation;
- (void)_setAnimationFraction:(double)a3 withCenter:(CGPoint)a4;
- (void)_updateDockForFraction:(double)a3;
- (void)_updateLabelAlphaForPresentationValue:(BOOL)a3;
- (void)_updateWithSettings:(id)a3;
- (void)setLabelAlphaDrivingProgressAnimatableProperty:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation SBCoverSheetIconFlyInAnimator

- (SBCoverSheetIconFlyInAnimator)initWithFolderController:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBCoverSheetIconFlyInAnimator;
  v3 = [(SBCenterIconZoomAnimator *)&v11 initWithFolderController:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F5E408] rootSettings];
    v5 = [v4 coverSheetTransitionsSettings];
    v6 = [v5 flyInSettings];

    [v6 addKeyObserver:v3];
    [(SBCoverSheetIconFlyInAnimator *)v3 _updateWithSettings:v6];
    [(SBCoverSheetIconFlyInAnimator *)v3 _createAnimatableProperties];
    uint64_t v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    timingFunction = v3->_timingFunction;
    v3->_timingFunction = (CAMediaTimingFunction *)v7;

    v9 = SBLogCoverSheet();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SBCoverSheetIconFlyInAnimator initWithFolderController:]((uint64_t)v3, v9);
    }
  }
  return v3;
}

- (void)_prepareAnimation
{
  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetIconFlyInAnimator;
  [(SBCenterIconZoomAnimator *)&v5 _prepareAnimation];
  v3 = [(SBCenterIconZoomAnimator *)self folderController];
  v4 = [v3 pageControl];
  [(SBCoverSheetIconFlyInAnimator *)self setPageControl:v4];
}

- (void)_setAnimationFraction:(double)a3 withCenter:(CGPoint)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SBCoverSheetIconFlyInAnimator;
  -[SBCenterIconZoomAnimator _setAnimationFraction:withCenter:](&v10, sel__setAnimationFraction_withCenter_, a3, a4.x, a4.y);
  v6 = SBLogCoverSheet();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v12 = a3;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "set icon animator fraction: %.2f", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SBCoverSheetIconFlyInAnimator__setAnimationFraction_withCenter___block_invoke;
  v9[3] = &unk_1E6AF4A70;
  v9[4] = self;
  *(double *)&v9[5] = a3;
  LODWORD(v7) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
  LODWORD(v8) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v9, COERCE_DOUBLE((unint64_t)*MEMORY[0x1E4F39AF0]), v7, v8);
}

void __66__SBCoverSheetIconFlyInAnimator__setAnimationFraction_withCenter___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) labelAlphaDrivingProgressAnimatableProperty];
  [v2 setValue:*(double *)(a1 + 40)];
}

- (void)_updateDockForFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetIconFlyInAnimator;
  [(SBCenterIconZoomAnimator *)&v5 _updateDockForFraction:a3 * 4.0];
  v4 = [(SBCenterIconZoomAnimator *)self dockOffscreenFractionModifier];
  [v4 layoutIfNeededForDockOffscreenFractionChanged];
}

- (double)_zPositionForView:(id)a3 center:(CGPoint)a4 andFraction:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  objc_super v10 = [(SBIconZoomAnimator *)self iconListView];
  [v9 center];
  double v12 = v11;
  double v14 = v13;
  v15 = [v9 superview];
  objc_msgSend(v10, "convertPoint:fromView:", v15, v12, v14);
  objc_msgSend(v10, "fractionalCoordinateAtPoint:");
  double v17 = v16;
  double v19 = v18;

  -[SBCoverSheetIconFlyInAnimator _zPositionForPoint:center:andFraction:](self, "_zPositionForPoint:center:andFraction:", v17, v19, x, y, a5);
  double v21 = v20;
  v22 = SBLogCoverSheet();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 138413058;
    id v25 = v9;
    __int16 v26 = 2048;
    double v27 = v17;
    __int16 v28 = 2048;
    double v29 = v19;
    __int16 v30 = 2048;
    double v31 = v21;
    _os_log_debug_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEBUG, "extraView: %@, viewCenter: (%.2f, %.2f), zPosition: %.2f", (uint8_t *)&v24, 0x2Au);
  }

  return v21;
}

- (double)_zPositionForPoint:(CGPoint)a3 center:(CGPoint)a4 andFraction:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  double v11 = [(SBIconZoomAnimator *)self iconListView];
  if (x == *(double *)&SBCoverSheetIconFlyInDefaultCenter && y == unk_1EA8AEAB8)
  {
    [(SBCenterIconZoomAnimator *)self centerCol];
    double x = v13;
    [(SBCenterIconZoomAnimator *)self centerRow];
    double y = v14;
  }
  double v15 = sqrt((v8 - y) * (v8 - y) + (v9 - x) * (v9 - x));
  unint64_t v16 = [v11 iconRowsForCurrentOrientation];
  double v17 = (double)v16 * (double)v16;
  unint64_t v18 = [v11 iconColumnsForCurrentOrientation];
  [(SBCoverSheetIconFlyInAnimator *)self _functionWithProgress:1.0 distance:sqrt(v17 + (double)v18 * (double)v18)];
  double v20 = v19;
  double effectMultiplier = self->_effectMultiplier;
  [(SBCoverSheetIconFlyInAnimator *)self _functionWithProgress:a5 distance:v15];
  double v23 = effectMultiplier * v22 / v20;

  return v23;
}

- (void)_cleanupAnimation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetIconFlyInAnimator;
  [(SBCenterIconZoomAnimator *)&v5 _cleanupAnimation];
  v3 = SBLogCoverSheet();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v7 = self;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "icon animator: %p cleanup animation", buf, 0xCu);
  }

  v4 = [(SBCoverSheetIconFlyInAnimator *)self labelAlphaDrivingProgressAnimatableProperty];
  [v4 setValue:0.0];

  [(SBCoverSheetIconFlyInAnimator *)self setLabelAlphaDrivingProgressAnimatableProperty:0];
}

- (void)_createAnimatableProperties
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  labelAlphaDrivingProgressAnimatablePropertdouble y = self->_labelAlphaDrivingProgressAnimatableProperty;
  self->_labelAlphaDrivingProgressAnimatablePropertdouble y = v3;

  objc_initWeak(&location, self);
  objc_super v5 = (void *)MEMORY[0x1E4F42FF0];
  v12[0] = self->_labelAlphaDrivingProgressAnimatableProperty;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SBCoverSheetIconFlyInAnimator__createAnimatableProperties__block_invoke;
  v9[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v10, &location);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SBCoverSheetIconFlyInAnimator__createAnimatableProperties__block_invoke_2;
  v7[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v8, &location);
  [v5 _createTransformerWithInputAnimatableProperties:v6 modelValueSetter:v9 presentationValueSetter:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__SBCoverSheetIconFlyInAnimator__createAnimatableProperties__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLabelAlphaForPresentationValue:0];
}

void __60__SBCoverSheetIconFlyInAnimator__createAnimatableProperties__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLabelAlphaForPresentationValue:1];
}

- (void)_updateLabelAlphaForPresentationValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(SBCenterIconZoomAnimator *)self animatingIcons])
  {
    objc_super v5 = [(SBCoverSheetIconFlyInAnimator *)self labelAlphaDrivingProgressAnimatableProperty];
    v6 = v5;
    if (v3)
    {
      [v5 presentationValue];
      double v8 = v7;

      [(SBCoverSheetIconFlyInAnimator *)self _labelAlphaForFraction:v8];
      double v10 = v9;
      double v11 = SBLogCoverSheet();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        double v27 = self;
        __int16 v28 = 2048;
        double v29 = v8;
        __int16 v30 = 2048;
        double v31 = v10;
        _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "icon animator: %p fractionPresentationValue:\t%.2f\tlabelAlpha: %2f", buf, 0x20u);
      }

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __71__SBCoverSheetIconFlyInAnimator__updateLabelAlphaForPresentationValue___block_invoke;
      v25[3] = &__block_descriptor_40_e34_v28__0__SBIcon_8__SBIconView_16B24l;
      *(double *)&v25[4] = v10;
      [(SBIconZoomAnimator *)self enumerateIconsAndIconViewsWithHandler:v25];
      id v12 = [(SBCoverSheetIconFlyInAnimator *)self pageControl];
      double v13 = [NSNumber numberWithDouble:v10];
      [v12 _setPresentationValue:v13 forKey:@"opacity"];
    }
    else
    {
      [v5 value];
      double v15 = v14;

      [(SBCoverSheetIconFlyInAnimator *)self _labelAlphaForFraction:v15];
      double v17 = v16;
      unint64_t v18 = SBLogCoverSheet();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        double v27 = self;
        __int16 v28 = 2048;
        double v29 = v15;
        __int16 v30 = 2048;
        double v31 = v17;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "icon animator: %p fractionModelValue:\t\t%.2f\tlabelAlpha: %2f", buf, 0x20u);
      }

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __71__SBCoverSheetIconFlyInAnimator__updateLabelAlphaForPresentationValue___block_invoke_16;
      v24[3] = &__block_descriptor_40_e34_v28__0__SBIcon_8__SBIconView_16B24l;
      *(double *)&v24[4] = v17;
      [(SBIconZoomAnimator *)self enumerateIconsAndIconViewsWithHandler:v24];
      double v19 = [(SBCenterIconZoomAnimator *)self folderController];
      uint64_t v20 = objc_opt_class();
      id v12 = v19;
      if (v20)
      {
        if (objc_opt_isKindOfClass()) {
          double v21 = v12;
        }
        else {
          double v21 = 0;
        }
      }
      else
      {
        double v21 = 0;
      }
      id v22 = v21;

      char v23 = [v22 isPageManagementUIVisible];
      if (v23) {
        goto LABEL_16;
      }
      double v13 = [(SBCoverSheetIconFlyInAnimator *)self pageControl];
      [v13 setAlpha:v17];
    }

LABEL_16:
  }
}

void __71__SBCoverSheetIconFlyInAnimator__updateLabelAlphaForPresentationValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  [v8 effectiveIconLabelAlpha];
  if ((BSFloatIsZero() & 1) == 0)
  {
    v4 = [v8 labelView];
    objc_super v5 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    [v4 _setPresentationValue:v5 forKey:@"opacity"];

    v6 = [v8 labelAccessoryView];
    double v7 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    [v6 _setPresentationValue:v7 forKey:@"opacity"];
  }
}

void __71__SBCoverSheetIconFlyInAnimator__updateLabelAlphaForPresentationValue___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [v6 effectiveIconLabelAlpha];
  if ((BSFloatIsZero() & 1) == 0)
  {
    v4 = [v6 labelView];
    [v4 setAlpha:*(double *)(a1 + 32)];

    objc_super v5 = [v6 labelAccessoryView];
    [v5 setAlpha:*(double *)(a1 + 32)];
  }
}

- (double)_labelAlphaForFraction:(double)a3
{
  BSIntervalSubIntervalValueForValue();
  *(float *)&double v4 = v4;
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:", v4, 0, 1, 0x3FF0000000000000, 1, 0, 1, 0x3FC999999999999ALL, 1, 0, 1, 0x3FF0000000000000, 1);
  return 1.0 - v5;
}

- (void)_updateWithSettings:(id)a3
{
  id v4 = a3;
  [v4 baselineDistance];
  self->_baselineDistance = v5;
  [v4 effectMultiplier];
  self->_double effectMultiplier = v6;
  [v4 distanceExponent];
  double v8 = v7;

  self->_distanceExponent = v8;
}

- (double)_functionWithProgress:(double)a3 distance:(double)a4
{
  long double v6 = exp(a3) + -1.0;
  double baselineDistance = self->_baselineDistance;
  return v6 * (baselineDistance + pow(a4, self->_distanceExponent));
}

- (UIViewFloatAnimatableProperty)labelAlphaDrivingProgressAnimatableProperty
{
  return self->_labelAlphaDrivingProgressAnimatableProperty;
}

- (void)setLabelAlphaDrivingProgressAnimatableProperty:(id)a3
{
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong((id *)&self->_labelAlphaDrivingProgressAnimatableProperty, 0);
}

- (void)initWithFolderController:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "icon animator: %p init", (uint8_t *)&v2, 0xCu);
}

@end