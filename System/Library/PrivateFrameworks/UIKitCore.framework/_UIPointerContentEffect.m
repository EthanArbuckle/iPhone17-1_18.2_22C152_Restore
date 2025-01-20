@interface _UIPointerContentEffect
- (BOOL)_monitorsView:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)sourceViewDidAllowEdgeAntialiasing;
- (CGPoint)initialEffectPlatterPosition;
- (NSMutableArray)completions;
- (UIPointerInteractionAnimator)entranceAnimator;
- (UIPointerInteractionAnimator)exitAnimator;
- (UIPointerRegion)region;
- (UIPointerStyle)style;
- (UIView)boundsObservationView;
- (UIView)lumaSamplingBackdrop;
- (UIView)pointerPortal;
- (UIView)positionReferenceView;
- (UIView)sublayerObservationView;
- (UIViewFloatAnimatableProperty)liftProgressProperty;
- (UIWindow)subtreeMonitoredWindow;
- (_UIPointerContentEffect)initWithStyle:(id)a3 region:(id)a4;
- (_UIPointerEffectPlatterView)platterView;
- (double)liftProgress;
- (id)_positionReferenceViewForPreview:(id)a3;
- (id)previewForContinuingToEffectWithPreview:(id)a3;
- (int64_t)state;
- (unint64_t)animationCount;
- (unint64_t)hash;
- (void)_anchorPlatterView:(id)a3 toPreview:(id)a4 updateBounds:(BOOL)a5;
- (void)_cleanUpObservation;
- (void)_commitPointerStyleToArbiterWithCompletion:(id)a3;
- (void)_createAndInstallPlatterView;
- (void)_ensureRelativeEffectViewOrderInContainer;
- (void)_modifyEffectContainerViewHierarchy:(id)a3 waitForCACommit:(BOOL)a4;
- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5;
- (void)_setStyle:(id)a3 andRegion:(id)a4;
- (void)_tearDownPlatterView;
- (void)_updateFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)_updatePlatterView:(id)a3 forStyle:(id)a4;
- (void)addCompletion:(id)a3;
- (void)begin;
- (void)dealloc;
- (void)end:(BOOL)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnimationCount:(unint64_t)a3;
- (void)setBoundsObservationView:(id)a3;
- (void)setDescriptor:(id)a3 andKey:(id)a4;
- (void)setEntranceAnimator:(id)a3;
- (void)setExitAnimator:(id)a3;
- (void)setInitialEffectPlatterPosition:(CGPoint)a3;
- (void)setLiftProgress:(double)a3;
- (void)setLiftProgressProperty:(id)a3;
- (void)setLumaSamplingBackdrop:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setPointerPortal:(id)a3;
- (void)setPositionReferenceView:(id)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setRegion:(id)a3;
- (void)setSourceViewDidAllowEdgeAntialiasing:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setStyle:(id)a3;
- (void)setSublayerObservationView:(id)a3;
- (void)setSubtreeMonitoredWindow:(id)a3;
@end

@implementation _UIPointerContentEffect

- (_UIPointerContentEffect)initWithStyle:(id)a3 region:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    if ([v7 type] != 1
      || ([v7 targetedPreview], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = [v7 type];
      v12 = [v7 targetedPreview];
      [v10 handleFailureInMethod:a2, self, @"_UIPointerContentEffect.m", 110, @"Attempting to create a _UIPointerContentEffect with an incompatible style! type: %lu, preview: %@", v11, v12 object file lineNumber description];
    }
    [(_UIPointerContentEffect *)self _setStyle:v7 andRegion:v8];
    v13 = objc_opt_new();
    [(_UIPointerContentEffect *)self setLiftProgressProperty:v13];

    v14 = [(_UIPointerContentEffect *)self liftProgressProperty];
    [v14 setValue:1.0];

    objc_initWeak(&location, self);
    v15 = [(_UIPointerContentEffect *)self liftProgressProperty];
    v21[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48___UIPointerContentEffect_initWithStyle_region___block_invoke;
    v18[3] = &unk_1E52DC308;
    objc_copyWeak(&v19, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:v16 presentationValueChangedCallback:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return self;
}

- (void)dealloc
{
  [(_UIPointerContentEffect *)self _cleanUpObservation];
  v3.receiver = self;
  v3.super_class = (Class)_UIPointerContentEffect;
  [(_UIPointerContentEffect *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 region];
    v6 = [(_UIPointerContentEffect *)self region];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(_UIPointerContentEffect *)self region];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)_setStyle:(id)a3 andRegion:(id)a4
{
  id v6 = a4;
  [(_UIPointerContentEffect *)self setStyle:a3];
  [(_UIPointerContentEffect *)self setRegion:v6];

  if ([(_UIPointerContentEffect *)self state] == 1)
  {
    [(_UIPointerContentEffect *)self _commitPointerStyleToArbiterWithCompletion:0];
  }
}

- (void)setStyle:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_style] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    v5 = [(_UIPointerContentEffect *)self platterView];
    [(_UIPointerContentEffect *)self _updatePlatterView:v5 forStyle:self->_style];
  }
}

- (void)_updatePlatterView:(id)a3 forStyle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v6 targetedPreview];
  [v5 setTargetedPreview:v7];
  if (([v6 options] & 0x400) != 0)
  {
    [v7 _frame];
    double v8 = -CGRectGetMinX(v29);
    [v7 _frame];
    double v9 = -CGRectGetMinY(v30);
    v10 = [v6 pointerShape];
    uint64_t v11 = [v10 path];

    if (v11)
    {
      v12 = [v10 path];
      v13 = (void *)[v12 copy];

      CGAffineTransformMakeTranslation(&v28, v8, v9);
      [v13 applyTransform:&v28];
      v14 = +[UIPointerShape shapeWithPath:v13];
    }
    else
    {
      [v10 rect];
      CGRect v32 = CGRectOffset(v31, v8, v9);
      double x = v32.origin.x;
      double y = v32.origin.y;
      double width = v32.size.width;
      double height = v32.size.height;
      [v10 cornerRadius];
      v14 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v19);
    }
    [v5 setTintViewShape:v14];
  }
  v20 = [v6 pointerEffect];
  v21 = [v20 tintColorMatrixProvider];
  [v5 setTintColorMatrixProvider:v21];

  if (([v6 options] & 4) != 0)
  {
    uint64_t v22 = 1;
  }
  else
  {
    if (([v6 options] & 8) == 0) {
      goto LABEL_11;
    }
    uint64_t v22 = 2;
  }
  [v5 setTintMode:v22];
LABEL_11:
  int v23 = [v6 _suppressesMirroring];
  v24 = [v5 layer];
  v25 = v24;
  if (v23) {
    uint64_t v26 = 18;
  }
  else {
    uint64_t v26 = 0;
  }
  [v24 setDisableUpdateMask:v26];

  v27 = [v6 pointerEffect];
  objc_msgSend(v5, "setUseSoftShadow:", objc_msgSend(v27, "useSoftShadow"));
}

- (void)begin
{
  int64_t v3 = [(_UIPointerContentEffect *)self state];
  [(_UIPointerContentEffect *)self setState:1];
  int64_t v4 = [(_UIPointerContentEffect *)self state];
  [(_UIPointerContentEffect *)self _updateFromState:v3 toState:v4];
}

- (void)end:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(_UIPointerContentEffect *)self state];
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 0;
  }
  [(_UIPointerContentEffect *)self setState:v6];
  int64_t v7 = [(_UIPointerContentEffect *)self state];
  [(_UIPointerContentEffect *)self _updateFromState:v5 toState:v7];
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_pressed != a3)
  {
    BOOL v4 = a4;
    self->_pressed = a3;
    int64_t v7 = [(_UIPointerContentEffect *)self platterView];

    if (v7)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __47___UIPointerContentEffect_setPressed_animated___block_invoke;
      v10[3] = &unk_1E52D9FC0;
      v10[4] = self;
      BOOL v11 = a3;
      double v8 = _Block_copy(v10);
      double v9 = v8;
      if (v4) {
        +[UIView animateWithDuration:v8 animations:0.2];
      }
      else {
        (*((void (**)(void *))v8 + 2))(v8);
      }
    }
  }
}

- (void)setLiftProgress:(double)a3
{
  if (vabdd_f64(a3, self->_liftProgress) > 2.22044605e-16)
  {
    self->_liftProgress = a3;
    int64_t v5 = [(_UIPointerContentEffect *)self style];
    uint64_t v6 = [v5 pointerEffect];
    int64_t v7 = [v6 liftProgressSpring];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43___UIPointerContentEffect_setLiftProgress___block_invoke;
    v8[3] = &unk_1E52D9CD0;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    +[UIView _animateUsingSpringBehavior:v7 tracking:0 animations:v8 completion:0];
  }
}

- (void)_updateFromState:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v8 = [(_UIPointerContentEffect *)self platterView];
  double v9 = (void *)v8;
  if (a4 != 1 || v8)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
  }
  else
  {
    [(_UIPointerContentEffect *)self _createAndInstallPlatterView];
    double v9 = [(_UIPointerContentEffect *)self platterView];
  }
  self->_flags.stopViewOrderPreservation = 0;
LABEL_6:
  v10 = [(_UIPointerContentEffect *)self style];
  [(_UIPointerContentEffect *)self setAnimationCount:[(_UIPointerContentEffect *)self animationCount] + 1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52___UIPointerContentEffect__updateFromState_toState___block_invoke;
  aBlock[3] = &unk_1E52E9D28;
  aBlock[4] = self;
  id v11 = v10;
  id v49 = v11;
  int64_t v51 = a4;
  int64_t v52 = a3;
  id v39 = v9;
  id v50 = v39;
  int64_t v40 = a3;
  v12 = _Block_copy(aBlock);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __52___UIPointerContentEffect__updateFromState_toState___block_invoke_2;
  v47[3] = &unk_1E52E69E0;
  v47[4] = self;
  v47[5] = a2;
  v13 = _Block_copy(v47);
  v14 = objc_opt_new();
  v15 = [v11 pointerEffect];
  [v15 scaleUpAnimationDampingRatio];
  double v17 = v16;
  v18 = [v11 pointerEffect];
  [v18 scaleUpAnimationResponse];
  [v14 setDampingRatio:v17 response:v19];

  v38 = v14;
  v20 = v14;
  int64_t v21 = a4;
  +[UIView _animateUsingSpringBehavior:v20 tracking:0 animations:v12 completion:v13];
  uint64_t v22 = objc_opt_new();
  int v23 = [v11 pointerEffect];
  [v23 dampedAnimationDampingRatio];
  double v25 = v24;
  uint64_t v26 = [v11 pointerEffect];
  [v26 dampedAnimationResponse];
  [v22 setDampingRatio:v25 response:v27];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __52___UIPointerContentEffect__updateFromState_toState___block_invoke_4;
  v43[3] = &unk_1E52ED900;
  v43[4] = self;
  int64_t v46 = a4;
  id v28 = v11;
  id v44 = v28;
  id v29 = v39;
  id v45 = v29;
  +[UIView _animateUsingSpringBehavior:v22 tracking:0 animations:v43 completion:v13];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __52___UIPointerContentEffect__updateFromState_toState___block_invoke_5;
  v41[3] = &unk_1E52DA040;
  id v30 = v13;
  id v42 = v30;
  CGRect v31 = (void (**)(void))_Block_copy(v41);
  CGRect v32 = [(_UIPointerContentEffect *)self region];
  v33 = [v32 referenceView];
  v34 = [v33 _window];
  if (v34)
  {

    int64_t v35 = v40;
    if (v40 != 1 && v21 == 1)
    {
      [(_UIPointerContentEffect *)self _commitPointerStyleToArbiterWithCompletion:v31];
      goto LABEL_15;
    }
  }
  else
  {

    int64_t v35 = v40;
  }
  if (v35 != 1 || v21 == 1)
  {
    v31[2](v31);
  }
  else
  {
    v36 = +[_UIPointerArbiter sharedArbiter];
    v37 = [(_UIPointerContentEffect *)self region];
    [v36 exitRegion:v37 removeStyle:v21 == 0 completion:v31];
  }
LABEL_15:
}

- (void)_commitPointerStyleToArbiterWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  int64_t v5 = [(_UIPointerContentEffect *)self style];
  if (([v5 options] & 0x8000) != 0)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v6 = +[_UIPointerArbiter sharedArbiter];
    int64_t v7 = [(_UIPointerContentEffect *)self region];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70___UIPointerContentEffect__commitPointerStyleToArbiterWithCompletion___block_invoke;
    v8[3] = &unk_1E5309178;
    objc_copyWeak(&v10, &location);
    id v9 = v5;
    [v6 applyStyle:v9 forRegion:v7 effectSourceHandler:v8 completion:v4];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_createAndInstallPlatterView
{
  BOOL v3 = [(_UIPointerContentEffect *)self style];
  BOOL v4 = [v3 targetedPreview];
  int64_t v5 = [[_UIPointerEffectPlatterView alloc] initWithTargetedPreview:v4];
  uint64_t v6 = [v4 view];
  uint64_t v7 = [v6 _window];
  if (!v7)
  {

    goto LABEL_6;
  }
  uint64_t v8 = (void *)v7;
  int v9 = [v4 _isVisible];

  if (!v9)
  {
LABEL_6:
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke_3;
    v38[3] = &unk_1E52D9F98;
    id v23 = v4;
    id v39 = v23;
    double v24 = v5;
    int64_t v40 = v24;
    [(_UIPointerContentEffect *)self _modifyEffectContainerViewHierarchy:v38 waitForCACommit:0];
    double v25 = [v23 target];
    [v25 center];
    -[_UIPointerEffectPlatterView setCenter:](v24, "setCenter:");

    [(UIView *)v24 center];
    -[_UIPointerContentEffect setInitialEffectPlatterPosition:](self, "setInitialEffectPlatterPosition:");

    id v10 = v39;
    goto LABEL_11;
  }
  id v10 = [v4 view];
  id v11 = [(_UIPointerContentEffect *)self _positionReferenceViewForPreview:v4];
  v12 = [v4 target];
  v13 = [v12 container];

  if (v11)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke;
    v44[3] = &unk_1E52DCB30;
    id v45 = v13;
    v14 = v5;
    int64_t v46 = v14;
    id v15 = v11;
    id v47 = v15;
    [(_UIPointerContentEffect *)self _modifyEffectContainerViewHierarchy:v44 waitForCACommit:0];
    double v16 = v11;
    double v17 = v13;
    v18 = objc_opt_new();
    double v19 = [v15 layer];
    [v18 setSourceLayer:v19];

    [v18 setKeyPath:@"zPosition"];
    [v18 setDuration:INFINITY];
    v20 = [(UIView *)v14 layer];
    [v20 addAnimation:v18 forKey:@"_UIPointerContentEffect.sourceViewZPositionMatchProperty"];

    int64_t v21 = &v45;
    v13 = v17;
    id v11 = v16;
    uint64_t v22 = (id *)&v46;
  }
  else
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke_2;
    v41[3] = &unk_1E52D9F98;
    int64_t v21 = &v42;
    id v42 = v13;
    uint64_t v22 = (id *)&v43;
    v43 = v5;
    [(_UIPointerContentEffect *)self _modifyEffectContainerViewHierarchy:v41 waitForCACommit:0];
  }

  [(_UIPointerContentEffect *)self setPositionReferenceView:v11];
  [(_UIPointerContentEffect *)self setSublayerObservationView:v13];
  uint64_t v26 = [(_UIPointerContentEffect *)self sublayerObservationView];
  double v27 = [v26 layer];
  [v27 addObserver:self forKeyPath:@"sublayers" options:0 context:0];

  id v28 = [v10 _window];
  [(_UIPointerContentEffect *)self setSubtreeMonitoredWindow:v28];

  id v29 = [(_UIPointerContentEffect *)self subtreeMonitoredWindow];
  [v29 _registerSubtreeMonitor:self];

  -[_UIPointerContentEffect setInitialEffectPlatterPosition:](self, "setInitialEffectPlatterPosition:", 1.79769313e308, 1.79769313e308);
  [(_UIPointerContentEffect *)self _anchorPlatterView:v5 toPreview:v4 updateBounds:0];
  id v30 = [v4 parameters];
  CGRect v31 = [v30 visiblePath];

  if (!v31)
  {
    [(_UIPointerContentEffect *)self setBoundsObservationView:v10];
    CGRect v32 = [(_UIPointerContentEffect *)self boundsObservationView];
    v33 = [v32 layer];
    [v33 addObserver:self forKeyPath:@"bounds" options:1 context:0];
  }
LABEL_11:

  [(_UIPointerContentEffect *)self _updatePlatterView:v5 forStyle:v3];
  [(_UIPointerEffectPlatterView *)v5 setGeometryFrozen:1];
  [(_UIPointerEffectPlatterView *)v5 setPressed:self->_pressed];
  v34 = [v4 view];
  int64_t v35 = [v34 layer];
  uint64_t v36 = [v35 flipsHorizontalAxis];
  v37 = [(UIView *)v5 layer];
  [v37 setFlipsHorizontalAxis:v36];

  [(_UIPointerContentEffect *)self setPlatterView:v5];
}

- (void)_tearDownPlatterView
{
  [(_UIPointerContentEffect *)self _cleanUpObservation];
  BOOL v3 = [(_UIPointerContentEffect *)self platterView];
  [v3 removeFromSuperview];

  [(_UIPointerContentEffect *)self setPlatterView:0];
}

- (id)_positionReferenceViewForPreview:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 _sourceViewIsInViewHierarchy])
  {
    BOOL v4 = [v3 view];
    if (v4)
    {
      while (1)
      {
        int64_t v5 = [v4 superview];
        uint64_t v6 = [v3 target];
        uint64_t v7 = [v6 container];

        if (v5 == v7) {
          break;
        }

        BOOL v4 = v5;
        if (!v5) {
          goto LABEL_18;
        }
      }

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v8 = objc_msgSend(v3, "_accessoryViews", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (v13
              && -[UIView _viewOrderRelativeToView:requireIntersection:](*(void **)(*((void *)&v16 + 1) + 8 * i), v4, 1) == -2)
            {
              id v14 = v13;

              BOOL v4 = v14;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
LABEL_18:

  return v4;
}

- (void)_anchorPlatterView:(id)a3 toPreview:(id)a4 updateBounds:(BOOL)a5
{
  BOOL v5 = a5;
  v95[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [v8 setGeometryFrozen:0];
  uint64_t v10 = [v9 view];
  [v9 size];
  double v13 = v11;
  double v14 = v12;
  if (!v5)
  {
    if ([v9 hasCustomTarget])
    {
      id v28 = [v9 target];
      [v28 center];
      double v30 = v29;
      double v32 = v31;
      v33 = [v9 target];
      v34 = [v33 container];
      objc_msgSend(v10, "convertPoint:fromView:", v34, v30, v32);
      double v23 = v35;
      double v25 = v36;
    }
    else
    {
      v37 = [v9 parameters];
      v38 = [v37 visiblePath];

      if (!v38)
      {
        [v10 bounds];
        double v23 = v85 + v84 * 0.5;
        double v25 = v87 + v86 * 0.5;
        goto LABEL_8;
      }
      id v28 = [v9 parameters];
      v33 = [v28 visiblePath];
      [v33 bounds];
      double v23 = v40 + v39 * 0.5;
      double v25 = v42 + v41 * 0.5;
    }

LABEL_8:
    double v27 = 0.0;
    double v26 = 0.0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v11, v12);
  [v8 layoutIfNeeded];
  id v15 = [v9 target];
  long long v16 = [v15 container];
  [(_UIPointerContentEffect *)self initialEffectPlatterPosition];
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v9 view];
  objc_msgSend(v16, "convertPoint:toView:", v21, v18, v20);
  double v23 = v22;
  double v25 = v24;

  double v26 = v13 * 0.5 + 0.0 - v23;
  double v27 = v14 * 0.5 + 0.0 - v25;
LABEL_9:
  v43 = [v9 target];
  id v44 = [v43 container];
  [v44 _currentScreenScale];
  double v88 = v23;
  UIRectCenteredAboutPointScale(0.0, 0.0, v13, v14, v23, v25, v45);
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  CGFloat v51 = v50;
  CGFloat v53 = v52;

  v96.origin.CGFloat x = v47;
  v96.origin.CGFloat y = v49;
  v96.size.CGFloat width = v51;
  v96.size.CGFloat height = v53;
  CGRect v97 = CGRectOffset(v96, v26, v27);
  CGFloat x = v97.origin.x;
  CGFloat v89 = v97.origin.x;
  CGFloat y = v97.origin.y;
  CGFloat width = v97.size.width;
  CGFloat height = v97.size.height;
  [v10 bounds];
  CGFloat v59 = v58;
  CGFloat rect = v60;
  CGFloat v62 = v61;
  CGFloat v64 = v63;
  CGFloat v90 = v63;
  v98.origin.CGFloat x = x;
  v98.origin.CGFloat y = y;
  v98.size.CGFloat width = width;
  v98.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v98);
  v99.origin.CGFloat x = v59;
  v99.origin.CGFloat y = rect;
  v99.size.CGFloat width = v62;
  v99.size.CGFloat height = v64;
  double v93 = MinX / CGRectGetWidth(v99);
  v100.origin.CGFloat x = v89;
  v100.origin.CGFloat y = y;
  v100.size.CGFloat width = width;
  v100.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v100);
  v101.origin.CGFloat x = v59;
  v101.origin.CGFloat y = rect;
  v101.size.CGFloat width = v62;
  v101.size.CGFloat height = v90;
  double v92 = MinY / CGRectGetHeight(v101);
  v102.origin.CGFloat x = v89;
  v102.origin.CGFloat y = y;
  v102.size.CGFloat width = width;
  v102.size.CGFloat height = height;
  double v67 = CGRectGetWidth(v102);
  v103.origin.CGFloat x = v59;
  v103.origin.CGFloat y = rect;
  v103.size.CGFloat width = v62;
  v103.size.CGFloat height = v90;
  double v91 = v67 / CGRectGetWidth(v103);
  v104.origin.CGFloat x = v89;
  v104.origin.CGFloat y = y;
  v104.size.CGFloat width = width;
  v104.size.CGFloat height = height;
  double v68 = CGRectGetHeight(v104);
  v105.origin.CGFloat x = v59;
  v105.origin.CGFloat y = rect;
  v105.size.CGFloat width = v62;
  v105.size.CGFloat height = v90;
  double v69 = v92 + v68 / CGRectGetHeight(v105);
  v70 = objc_opt_new();
  v71 = [v10 layer];
  [v70 setSourceLayer:v71];

  [v70 setDuration:INFINITY];
  [v70 setAdditive:1];
  [v70 setUsesNormalizedCoordinates:1];
  v72 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v93, v92);
  v95[0] = v72;
  v73 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v93 + v91, v92);
  v95[1] = v73;
  v74 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v93 + v91, v69);
  v95[2] = v74;
  v75 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v93, v69);
  v95[3] = v75;
  v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:4];
  [v70 setSourcePoints:v76];

  v77 = [v8 layer];
  [v77 removeAnimationForKey:@"_UIPointerContentEffect.sourceViewMatchMove"];

  v78 = [v8 layer];
  [v78 addAnimation:v70 forKey:@"_UIPointerContentEffect.sourceViewMatchMove"];

  objc_msgSend(v8, "setCenter:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(_UIPointerContentEffect *)self initialEffectPlatterPosition];
  if (v80 == 1.79769313e308 && v79 == 1.79769313e308)
  {
    v81 = [v9 view];
    v82 = [v9 target];
    v83 = [v82 container];
    objc_msgSend(v81, "convertPoint:toView:", v83, v88, v25);
    -[_UIPointerContentEffect setInitialEffectPlatterPosition:](self, "setInitialEffectPlatterPosition:");
  }
  objc_msgSend(v8, "setGeometryFrozen:", 1, *(void *)&v25, *(void *)&v88);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(_UIPointerContentEffect *)self style];
  double v11 = [v10 targetedPreview];

  double v12 = [v11 target];
  double v13 = [v12 container];

  double v14 = [v11 view];
  id v15 = [(_UIPointerContentEffect *)self sublayerObservationView];
  long long v16 = [(_UIPointerContentEffect *)self boundsObservationView];
  if (v15 && ([v15 layer], id v17 = (id)objc_claimAutoreleasedReturnValue(), v17, v17 == v8))
  {
    if (!self->_flags.isRearrangingEffectViews && !self->_flags.stopViewOrderPreservation)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __74___UIPointerContentEffect_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v36[3] = &unk_1E52D9F70;
      v36[4] = self;
      [(_UIPointerContentEffect *)self _modifyEffectContainerViewHierarchy:v36 waitForCACommit:1];
    }
  }
  else if (v16)
  {
    id v18 = [v16 layer];

    if (v18 == v8)
    {
      double v19 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      [v19 CGRectValue];
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;

      id v28 = [(_UIPointerContentEffect *)self platterView];
      [v28 bounds];
      v38.origin.CGFloat x = v29;
      v38.origin.CGFloat y = v30;
      v38.size.CGFloat width = v31;
      v38.size.CGFloat height = v32;
      v37.origin.CGFloat x = v21;
      v37.origin.CGFloat y = v23;
      v37.size.CGFloat width = v25;
      v37.size.CGFloat height = v27;
      BOOL v33 = CGRectEqualToRect(v37, v38);

      if (!v33)
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __74___UIPointerContentEffect_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v34[3] = &unk_1E52D9F98;
        v34[4] = self;
        id v35 = v11;
        [(_UIPointerContentEffect *)self _modifyEffectContainerViewHierarchy:v34 waitForCACommit:1];
      }
    }
  }
}

- (void)_cleanUpObservation
{
  id v7 = [(_UIPointerContentEffect *)self subtreeMonitoredWindow];
  if (v7)
  {
    [(_UIPointerContentEffect *)self setSubtreeMonitoredWindow:0];
    [v7 _unregisterSubtreeMonitor:self];
  }
  id v3 = [(_UIPointerContentEffect *)self sublayerObservationView];
  if (v3)
  {
    [(_UIPointerContentEffect *)self setSublayerObservationView:0];
    BOOL v4 = [v3 layer];
    [v4 removeObserver:self forKeyPath:@"sublayers"];
  }
  BOOL v5 = [(_UIPointerContentEffect *)self boundsObservationView];
  if (v5)
  {
    [(_UIPointerContentEffect *)self setBoundsObservationView:0];
    uint64_t v6 = [v5 layer];
    [v6 removeObserver:self forKeyPath:@"bounds"];
  }
}

- (void)_modifyEffectContainerViewHierarchy:(id)a3 waitForCACommit:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  double v12 = __79___UIPointerContentEffect__modifyEffectContainerViewHierarchy_waitForCACommit___block_invoke;
  double v13 = &unk_1E52DA160;
  double v14 = self;
  id v7 = v6;
  id v15 = v7;
  id v8 = _Block_copy(&v10);
  id v9 = v8;
  if (v4) {
    objc_msgSend(MEMORY[0x1E4F39CF8], "addCommitHandler:forPhase:", v8, 1, v10, v11, v12, v13, v14);
  }
  else {
    (*((void (**)(void *))v8 + 2))(v8);
  }
}

- (void)_ensureRelativeEffectViewOrderInContainer
{
  v24[5] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    if (!self->_flags.isRearrangingEffectViews)
    {
      double v22 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v24[0]) = 0;
        _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "Called _ensureRelativeEffectViewOrderInContainer without pausing sublayer observation!", (uint8_t *)v24, 2u);
      }
    }
  }
  else if (!self->_flags.isRearrangingEffectViews)
  {
    CGFloat v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_ensureRelativeEffectViewOrderInContainer___s_category)
                       + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24[0]) = 0;
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Called _ensureRelativeEffectViewOrderInContainer without pausing sublayer observation!", (uint8_t *)v24, 2u);
    }
  }
  id v3 = [(_UIPointerContentEffect *)self style];
  BOOL v4 = [(_UIPointerContentEffect *)self platterView];
  BOOL v5 = [v3 targetedPreview];
  id v6 = [v5 target];
  id v7 = [v6 container];

  id v8 = [(_UIPointerContentEffect *)self positionReferenceView];
  id v9 = [v7 layer];
  uint64_t v10 = [v9 sublayers];

  if (!v10) {
    goto LABEL_5;
  }
  uint64_t v11 = [v7 layer];
  double v12 = [v11 sublayers];
  double v13 = [v8 layer];
  uint64_t v14 = [v12 indexOfObject:v13];

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:

    id v15 = [v7 subviews];
    uint64_t v14 = [v15 count];

    id v8 = 0;
  }
  if ([(_UIPointerContentEffect *)self state] != 1)
  {
    id v18 = 0;
LABEL_14:
    CGFloat v21 = 0;
    goto LABEL_17;
  }
  long long v16 = [(_UIPointerContentEffect *)self lumaSamplingBackdrop];
  id v17 = [v16 superview];
  if (v17 == v7)
  {
    id v18 = [(_UIPointerContentEffect *)self lumaSamplingBackdrop];
  }
  else
  {
    id v18 = 0;
  }

  if (![v3 pointerUnderlapsContent]) {
    goto LABEL_14;
  }
  double v19 = [(_UIPointerContentEffect *)self pointerPortal];
  double v20 = [v19 superview];
  if (v20 == v7)
  {
    CGFloat v21 = [(_UIPointerContentEffect *)self pointerPortal];
  }
  else
  {
    CGFloat v21 = 0;
  }

LABEL_17:
  v24[0] = v18;
  v24[1] = v8;
  v24[2] = v21;
  v24[3] = v4;
  [v7 _ensureViewsAreInstalledInRelativeOrder:v24 viewCount:4 insertionStartIndex:v14];
}

- (BOOL)_monitorsView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIPointerContentEffect *)self style];
  id v6 = [v5 targetedPreview];
  id v7 = [v6 view];
  char v8 = [v4 containsView:v7];

  return v8;
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(_UIPointerContentEffect *)self style];
  uint64_t v10 = [v9 targetedPreview];
  uint64_t v11 = [v10 view];

  int v12 = [v11 isDescendantOfView:v7];
  if (v12)
  {
    uint64_t v10 = [v8 _window];
    if (!v10) {
      goto LABEL_7;
    }
  }
  double v13 = [(_UIPointerContentEffect *)self platterView];
  int v14 = [v7 containsView:v13];

  if (v12)
  {

    if ((v14 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v14)
  {
LABEL_7:
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76___UIPointerContentEffect__monitoredView_willMoveFromSuperview_toSuperview___block_invoke;
    v15[3] = &unk_1E52D9F70;
    v15[4] = self;
    [(_UIPointerContentEffect *)self _modifyEffectContainerViewHierarchy:v15 waitForCACommit:1];
  }
LABEL_8:
}

- (void)setDescriptor:(id)a3 andKey:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UIPointerContentEffect.m", 848, @"Attempting to configure pointer effect with incorrect descriptor type %@", v10 object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIPointerContentEffect.m", 849, @"Attempting to configure pointer effect with incorrect key type %@", v7 object file lineNumber description];
  }
  [(_UIPointerContentEffect *)self _setStyle:v10 andRegion:v7];
}

- (id)previewForContinuingToEffectWithPreview:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIPointerContentEffect *)self platterView];
  if ([(_UIPointerContentEffect *)self state] != 1) {
    goto LABEL_4;
  }
  uint64_t v6 = [v5 window];
  if (!v6) {
    goto LABEL_4;
  }
  id v7 = (void *)v6;
  id v8 = [v5 targetedPreview];
  id v9 = [v8 view];
  id v10 = [v4 view];

  if (v9 == v10)
  {
    self->_flags.stopViewOrderPreservation = 1;
    uint64_t v11 = [[UITargetedPreview alloc] initWithView:v5];
    [(UITargetedPreview *)v11 set_matchableProperties:&unk_1ED3F13C0];
  }
  else
  {
LABEL_4:
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  completions = self->_completions;
  aBlock = v4;
  if (!completions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_completions;
    self->_completions = v6;

    id v4 = aBlock;
    completions = self->_completions;
  }
  id v8 = _Block_copy(v4);
  [(NSMutableArray *)completions addObject:v8];
}

- (UIPointerRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (UIPointerStyle)style
{
  return self->_style;
}

- (UIPointerInteractionAnimator)entranceAnimator
{
  return self->_entranceAnimator;
}

- (void)setEntranceAnimator:(id)a3
{
}

- (UIPointerInteractionAnimator)exitAnimator
{
  return self->_exitAnimator;
}

- (void)setExitAnimator:(id)a3
{
}

- (double)liftProgress
{
  return self->_liftProgress;
}

- (_UIPointerEffectPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIView)lumaSamplingBackdrop
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lumaSamplingBackdrop);
  return (UIView *)WeakRetained;
}

- (void)setLumaSamplingBackdrop:(id)a3
{
}

- (UIView)pointerPortal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerPortal);
  return (UIView *)WeakRetained;
}

- (void)setPointerPortal:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (unint64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(unint64_t)a3
{
  self->_animationCount = a3;
}

- (UIView)positionReferenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_positionReferenceView);
  return (UIView *)WeakRetained;
}

- (void)setPositionReferenceView:(id)a3
{
}

- (UIWindow)subtreeMonitoredWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtreeMonitoredWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setSubtreeMonitoredWindow:(id)a3
{
}

- (UIView)sublayerObservationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sublayerObservationView);
  return (UIView *)WeakRetained;
}

- (void)setSublayerObservationView:(id)a3
{
}

- (UIView)boundsObservationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_boundsObservationView);
  return (UIView *)WeakRetained;
}

- (void)setBoundsObservationView:(id)a3
{
}

- (CGPoint)initialEffectPlatterPosition
{
  double x = self->_initialEffectPlatterPosition.x;
  double y = self->_initialEffectPlatterPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialEffectPlatterPosition:(CGPoint)a3
{
  self->_initialEffectPlatterPosition = a3;
}

- (BOOL)sourceViewDidAllowEdgeAntialiasing
{
  return self->_sourceViewDidAllowEdgeAntialiasing;
}

- (void)setSourceViewDidAllowEdgeAntialiasing:(BOOL)a3
{
  self->_sourceViewDidAllowEdgeAntialiasing = a3;
}

- (UIViewFloatAnimatableProperty)liftProgressProperty
{
  return self->_liftProgressProperty;
}

- (void)setLiftProgressProperty:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftProgressProperty, 0);
  objc_destroyWeak((id *)&self->_boundsObservationView);
  objc_destroyWeak((id *)&self->_sublayerObservationView);
  objc_destroyWeak((id *)&self->_subtreeMonitoredWindow);
  objc_destroyWeak((id *)&self->_positionReferenceView);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_destroyWeak((id *)&self->_pointerPortal);
  objc_destroyWeak((id *)&self->_lumaSamplingBackdrop);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_exitAnimator, 0);
  objc_storeStrong((id *)&self->_entranceAnimator, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end