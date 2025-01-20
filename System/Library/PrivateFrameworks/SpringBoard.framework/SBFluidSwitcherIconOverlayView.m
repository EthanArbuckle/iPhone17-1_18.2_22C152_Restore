@interface SBFluidSwitcherIconOverlayView
- (CGRect)crossfadeViewFrame;
- (SBFluidSwitcherIconOverlayView)initWithIconView:(id)a3 crossfadeViews:(id)a4 crossfadeViewFrame:(CGRect)a5 contentOrientation:(int64_t)a6 containerOrientation:(int64_t)a7;
- (SBSwitcherIconZooming)iconView;
- (double)_currentFadeValue;
- (double)_iconOverlayScale;
- (double)cornerRadius;
- (void)_applyIconOverlayViewOverlayScaleProperties;
- (void)_setCrossfadeViewsAlpha:(double)a3;
- (void)_setUpIconCrossfadeAnimatableProperty;
- (void)_setUpIconCrossfadeView;
- (void)dealloc;
- (void)invalidate;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
@end

@implementation SBFluidSwitcherIconOverlayView

void __71__SBFluidSwitcherIconOverlayView__setUpIconCrossfadeAnimatableProperty__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[68];
    if (v3)
    {
      v6 = v2;
      [v3 value];
      double v5 = v4;
      objc_msgSend(v6, "_setCrossfadeViewsAlpha:");
      [v6[55] setAlpha:1.0 - v5];
      v2 = v6;
    }
  }
}

void __71__SBFluidSwitcherIconOverlayView__setUpIconCrossfadeAnimatableProperty__block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 134);
    id v4 = *(id *)&v3[136]._os_unfair_lock_opaque;
    id v5 = *(id *)&v3[124]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v3 + 134);
    if (v4)
    {
      [v4 value];
      double v7 = v6;
      [v4 presentationValue];
      if (v7 == 0.0) {
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 440), "adjustedCrossfadeProgressForCrossfadeProgress:");
      }
      else {
        double v9 = fmin(fmax((v8 + -0.15) / 0.45 + 0.0, 0.0), 1.0);
      }
      *(float *)&double v9 = v9;
      [*(id *)&v3[138]._os_unfair_lock_opaque _solveForInput:v9];
      double v11 = 1.0 - v10;
      v12 = *(void **)&v3[110]._os_unfair_lock_opaque;
      v13 = [NSNumber numberWithDouble:v11];
      [v12 _setPresentationValue:v13 forKey:@"opacity"];

      if (v5)
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v5 = v5;
        uint64_t v14 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          double v16 = fmin(fmax((v11 + -0.9) / -0.1 + 1.0, 0.0), 1.0);
          uint64_t v17 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v5);
              }
              v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              v20 = objc_msgSend(NSNumber, "numberWithDouble:", v16, (void)v21);
              [v19 _setPresentationValue:v20 forKey:@"opacity"];
            }
            uint64_t v15 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v15);
        }
      }
    }
  }
  else
  {
    id v4 = 0;
    id v5 = 0;
  }
}

- (void)_setCrossfadeViewsAlpha:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_crossfadeViews;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setAlpha:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

uint64_t __48__SBFluidSwitcherIconOverlayView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 544) setValue:*(double *)(a1 + 40)];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(SBFluidSwitcherIconOverlayView *)self _applyIconOverlayViewOverlayScaleProperties];
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SBFluidSwitcherIconOverlayView;
  [(BSUIOrientationTransformWrapperView *)&v19 layoutSubviews];
  [(SBFluidSwitcherIconOverlayView *)self _applyIconOverlayViewOverlayScaleProperties];
  [(SBFluidSwitcherIconOverlayView *)self _currentFadeValue];
  double v4 = v3;
  -[SBSwitcherIconZooming setMorphFraction:](self->_iconOverlayView, "setMorphFraction:");
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__SBFluidSwitcherIconOverlayView_layoutSubviews__block_invoke;
  v18[3] = &unk_1E6AF4A70;
  v18[4] = self;
  *(double *)&v18[5] = v4;
  LODWORD(v5) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
  LODWORD(v6) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v18, COERCE_DOUBLE((unint64_t)*MEMORY[0x1E4F39AF0]), v5, v6);
  [(SBSwitcherIconZooming *)self->_iconOverlayView sizeToFit];
  [(UIView *)self->_iconOverlayContainerView bounds];
  UIRectGetCenter();
  double v8 = v7;
  double v10 = v9;
  [(SBSwitcherIconZooming *)self->_iconOverlayView bounds];
  double v12 = (v11 - self->_initialIconOverlayViewBounds.size.height) * 0.5;
  uint64_t v13 = [(SBSwitcherIconZooming *)self->_iconOverlayView iconImageAlignment];
  double v14 = -v12;
  double v15 = 0.0;
  if (v13) {
    double v15 = v12;
  }
  if (v13 == 2) {
    double v16 = -v12;
  }
  else {
    double v16 = v15;
  }
  [(SBFluidSwitcherIconOverlayView *)self _iconOverlayScale];
  -[SBSwitcherIconZooming setCenter:](self->_iconOverlayView, "setCenter:", v8, v10 + (1.0 - v4) * (v16 * v17));
}

- (double)_iconOverlayScale
{
  [(UIView *)self->_iconOverlayContainerView bounds];
  [(SBFluidSwitcherIconOverlayView *)self _currentFadeValue];
  iconOverlayView = self->_iconOverlayView;
  -[SBSwitcherIconZooming scaleForFadeValue:originalSize:containerSize:](iconOverlayView, "scaleForFadeValue:originalSize:containerSize:");
  return result;
}

- (double)_currentFadeValue
{
  [(SBFluidSwitcherIconOverlayView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double width = self->_initialIconOverlayViewBounds.size.width;
  double height = self->_initialIconOverlayViewBounds.size.height;
  int64_t v9 = [(BSUIOrientationTransformWrapperView *)self containerOrientation];
  int v10 = ((unint64_t)(v9 - 1) < 2) ^ ((unint64_t)([(BSUIOrientationTransformWrapperView *)self contentOrientation]- 1) < 2);
  if (v10) {
    double v11 = width;
  }
  else {
    double v11 = height;
  }
  if (v10) {
    double v12 = height;
  }
  else {
    double v12 = width;
  }
  double v13 = v12 / v11;
  double v14 = 1.0;
  if (v11 == 0.0) {
    double v15 = 1.0;
  }
  else {
    double v15 = v13;
  }
  double v16 = self->_crossfadeViewFrame.size.height;
  if (v16 == 0.0) {
    double v17 = 1.0;
  }
  else {
    double v17 = self->_crossfadeViewFrame.size.width / v16;
  }
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    double v18 = v4 / v6;
    if (v6 == 0.0) {
      double v18 = v15;
    }
    return (v18 - v15) / (v17 - v15) + 0.0;
  }
  return v14;
}

- (void)_applyIconOverlayViewOverlayScaleProperties
{
  [(SBFluidSwitcherIconOverlayView *)self _iconOverlayScale];
  double v4 = v3;
  iconOverlayView = self->_iconOverlayView;
  CGAffineTransformMakeScale(&v7, v3, v3);
  [(SBSwitcherIconZooming *)iconOverlayView setTransform:&v7];
  [(SBSwitcherIconZooming *)self->_iconOverlayView setCrossfadeCornerRadius:self->_cornerRadius / v4];
  if ([(SBSwitcherIconZooming *)self->_iconOverlayView shouldClipToBoundsWhenSizeChanges])
  {
    [(SBSwitcherIconZooming *)self->_iconOverlayView iconImageFrame];
    uint64_t v6 = BSSizeEqualToSize() ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(SBFluidSwitcherIconOverlayView *)self setClipsToBounds:v6];
  [(SBFluidSwitcherIconOverlayView *)self _setContinuousCornerRadius:self->_cornerRadius];
}

- (SBFluidSwitcherIconOverlayView)initWithIconView:(id)a3 crossfadeViews:(id)a4 crossfadeViewFrame:(CGRect)a5 contentOrientation:(int64_t)a6 containerOrientation:(int64_t)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v17 = a3;
  id v18 = a4;
  objc_super v19 = v18;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"SBFluidSwitcherIconOverlayView.m", 43, @"Invalid parameter not satisfying: %@", @"iconView" object file lineNumber description];

    if (v19) {
      goto LABEL_3;
    }
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"SBFluidSwitcherIconOverlayView.m", 44, @"Invalid parameter not satisfying: %@", @"crossfadeViews" object file lineNumber description];

LABEL_3:
  v38.receiver = self;
  v38.super_class = (Class)SBFluidSwitcherIconOverlayView;
  v20 = [(SBFluidSwitcherIconOverlayView *)&v38 init];
  long long v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_iconOverlayView, a3);
    [v17 bounds];
    v21->_initialIconOverlayViewBounds.origin.CGFloat x = v22;
    v21->_initialIconOverlayViewBounds.origin.CGFloat y = v23;
    v21->_initialIconOverlayViewBounds.size.CGFloat width = v24;
    v21->_initialIconOverlayViewBounds.size.CGFloat height = v25;
    uint64_t v26 = [v19 copy];
    crossfadeViews = v21->_crossfadeViews;
    v21->_crossfadeViews = (NSArray *)v26;

    v21->_crossfadeViewFrame.origin.CGFloat x = x;
    v21->_crossfadeViewFrame.origin.CGFloat y = y;
    v21->_crossfadeViewFrame.size.CGFloat width = width;
    v21->_crossfadeViewFrame.size.CGFloat height = height;
    v37.receiver = v21;
    v37.super_class = (Class)SBFluidSwitcherIconOverlayView;
    [(BSUIOrientationTransformWrapperView *)&v37 setContentOrientation:a6];
    v36.receiver = v21;
    v36.super_class = (Class)SBFluidSwitcherIconOverlayView;
    [(BSUIOrientationTransformWrapperView *)&v36 setContainerOrientation:a7];
    [(SBFluidSwitcherIconOverlayView *)v21 setUserInteractionEnabled:0];
    v21->_iconCrossfadeC2ThreadLock._os_unfair_lock_opaque = 0;
    id v28 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBFluidSwitcherIconOverlayView *)v21 bounds];
    uint64_t v29 = objc_msgSend(v28, "initWithFrame:");
    iconOverlayContainerView = v21->_iconOverlayContainerView;
    v21->_iconOverlayContainerView = (UIView *)v29;

    [(UIView *)v21->_iconOverlayContainerView setUserInteractionEnabled:0];
    [(BSUIOrientationTransformWrapperView *)v21 addContentView:v21->_iconOverlayContainerView];
    [(SBFluidSwitcherIconOverlayView *)v21 _setUpIconCrossfadeView];
    uint64_t v31 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    iconCrossfadeTimingFunction = v21->_iconCrossfadeTimingFunction;
    v21->_iconCrossfadeTimingFunction = (CAMediaTimingFunction *)v31;

    [(SBFluidSwitcherIconOverlayView *)v21 _setUpIconCrossfadeAnimatableProperty];
  }

  return v21;
}

- (void)_setUpIconCrossfadeView
{
  [(SBSwitcherIconZooming *)self->_iconOverlayView setEnabled:0];
  [(UIView *)self->_iconOverlayContainerView addSubview:self->_iconOverlayView];
  double x = self->_crossfadeViewFrame.origin.x;
  double y = self->_crossfadeViewFrame.origin.y;
  double width = self->_crossfadeViewFrame.size.width;
  double height = self->_crossfadeViewFrame.size.height;
  int64_t v7 = [(BSUIOrientationTransformWrapperView *)self containerOrientation];
  int v8 = ((unint64_t)(v7 - 1) < 2) ^ ((unint64_t)([(BSUIOrientationTransformWrapperView *)self contentOrientation]- 1) < 2);
  if (v8) {
    double v9 = width;
  }
  else {
    double v9 = height;
  }
  if (v8) {
    double width = height;
  }
  int v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", x, y, width, v9);
  iconCrossfadeView = self->_iconCrossfadeView;
  self->_iconCrossfadeView = v10;

  [(SBSwitcherIconZooming *)self->_iconOverlayView sizeToFit];
  iconOverlayView = self->_iconOverlayView;
  double v13 = self->_iconCrossfadeView;
  [(SBSwitcherIconZooming *)iconOverlayView prepareToCrossfadeImageWithView:v13];
}

- (void)_setUpIconCrossfadeAnimatableProperty
{
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  CGFloat v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  iconCrossfadeAnimatablePropertdouble y = self->_iconCrossfadeAnimatableProperty;
  self->_iconCrossfadeAnimatablePropertdouble y = v3;

  double v5 = (void *)MEMORY[0x1E4F42FF0];
  v12[0] = self->_iconCrossfadeAnimatableProperty;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SBFluidSwitcherIconOverlayView__setUpIconCrossfadeAnimatableProperty__block_invoke;
  v9[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v10, &location);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SBFluidSwitcherIconOverlayView__setUpIconCrossfadeAnimatableProperty__block_invoke_2;
  v7[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  [v5 _createTransformerWithInputAnimatableProperties:v6 modelValueSetter:v9 presentationValueSetter:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  [(SBFluidSwitcherIconOverlayView *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherIconOverlayView;
  [(SBFluidSwitcherIconOverlayView *)&v3 dealloc];
}

- (void)invalidate
{
  iconCrossfadeAnimatablePropertdouble y = self->_iconCrossfadeAnimatableProperty;
  if (iconCrossfadeAnimatableProperty)
  {
    [(UIViewFloatAnimatableProperty *)iconCrossfadeAnimatableProperty invalidate];
    os_unfair_lock_lock(&self->_iconCrossfadeC2ThreadLock);
    double v4 = self->_iconCrossfadeAnimatableProperty;
    self->_iconCrossfadeAnimatablePropertdouble y = 0;

    os_unfair_lock_unlock(&self->_iconCrossfadeC2ThreadLock);
  }
  [(SBSwitcherIconZooming *)self->_iconOverlayView cleanUpAfterCrossfadeCompletion];
  [(SBFluidSwitcherIconOverlayView *)self _setCrossfadeViewsAlpha:1.0];
  os_unfair_lock_lock(&self->_iconCrossfadeC2ThreadLock);
  crossfadeViews = self->_crossfadeViews;
  self->_crossfadeViews = 0;

  os_unfair_lock_unlock(&self->_iconCrossfadeC2ThreadLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconCrossfadeTimingFunction, 0);
  objc_storeStrong((id *)&self->_iconCrossfadeAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_crossfadeViews, 0);
  objc_storeStrong((id *)&self->_iconOverlayContainerView, 0);
  objc_storeStrong((id *)&self->_iconCrossfadeView, 0);
  objc_storeStrong((id *)&self->_iconOverlayView, 0);
}

- (CGRect)crossfadeViewFrame
{
  double x = self->_crossfadeViewFrame.origin.x;
  double y = self->_crossfadeViewFrame.origin.y;
  double width = self->_crossfadeViewFrame.size.width;
  double height = self->_crossfadeViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (SBSwitcherIconZooming)iconView
{
  return self->_iconOverlayView;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end