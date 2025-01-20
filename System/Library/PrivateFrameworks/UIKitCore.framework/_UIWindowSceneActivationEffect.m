@interface _UIWindowSceneActivationEffect
- (NSMutableArray)completions;
- (UITargetedPreview)handOffPreview;
- (UIView)platterContainer;
- (_UIContentEffectDescriptor)descriptor;
- (_UIHighlightPlatterView)platterView;
- (_UIWindowSceneActivationEffect)initWithDescriptor:(id)a3;
- (double)currentScale;
- (id)_interactiveScaleBehavior;
- (id)_settlingBehavior;
- (id)_shadowBehavior;
- (id)previewForContinuingToEffectWithPreview:(id)a3;
- (int64_t)state;
- (void)_performAllCompletionBlocks;
- (void)addCompletion:(id)a3;
- (void)advanceToScale:(double)a3;
- (void)begin;
- (void)endExpanded:(BOOL)a3 withVelocity:(double)a4;
- (void)setCurrentScale:(double)a3;
- (void)setDescriptor:(id)a3 andKey:(id)a4;
- (void)setPlatterView:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _UIWindowSceneActivationEffect

- (_UIWindowSceneActivationEffect)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneActivationEffect;
  v6 = [(_UIWindowSceneActivationEffect *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_descriptor, a3);
  }

  return v7;
}

- (UITargetedPreview)handOffPreview
{
  v3 = [(_UIWindowSceneActivationEffect *)self descriptor];
  v4 = [v3 targetedPreview];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  id v5 = [(_UIWindowSceneActivationEffect *)self platterView];
  v6 = [v5 layer];
  v7 = [v6 presentationLayer];
  v8 = v7;
  if (v7)
  {
    [v7 affineTransform];
  }
  else
  {
    objc_super v9 = [(_UIWindowSceneActivationEffect *)self platterView];
    v10 = [v9 layer];
    v11 = v10;
    if (v10)
    {
      [v10 affineTransform];
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v29 = 0u;
    }
  }
  v12 = [(_UIWindowSceneActivationEffect *)self platterContainer];
  v13 = [v4 target];
  [v13 center];
  double v15 = v14;
  double v17 = v16;
  v18 = [v4 target];
  v19 = [v18 container];
  objc_msgSend(v12, "convertPoint:fromView:", v19, v15, v17);
  double v21 = v20;
  double v23 = v22;

  v24 = [UIPreviewTarget alloc];
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v31;
  v25 = -[UIPreviewTarget initWithContainer:center:transform:](v24, "initWithContainer:center:transform:", v12, v28, v21, v23);
  v26 = [v4 retargetedPreviewWithTarget:v25];

  return (UITargetedPreview *)v26;
}

- (void)begin
{
  [(_UIWindowSceneActivationEffect *)self setState:1];
  v3 = [(_UIWindowSceneActivationEffect *)self descriptor];
  id v28 = [v3 targetedPreview];

  v4 = [(_UIWindowSceneActivationEffect *)self platterView];

  if (!v4)
  {
    id v5 = [[_UIHighlightPlatterView alloc] initWithTargetedPreview:v28];
    [(_UIWindowSceneActivationEffect *)self setPlatterView:v5];
  }
  v6 = [v28 target];
  v7 = [v6 container];

  v8 = [UIView alloc];
  [v7 bounds];
  objc_super v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
  platterContainer = self->_platterContainer;
  self->_platterContainer = v9;

  v11 = [(_UIWindowSceneActivationEffect *)self platterContainer];
  v12 = [(_UIWindowSceneActivationEffect *)self platterView];
  [v11 addSubview:v12];

  v13 = [v28 view];
  double v14 = [v13 superview];

  double v15 = [(_UIWindowSceneActivationEffect *)self platterContainer];
  if (v14 == v7)
  {
    double v16 = [v28 view];
    [v7 insertSubview:v15 aboveSubview:v16];
  }
  else
  {
    [v7 addSubview:v15];
  }

  double v17 = [v28 target];
  [v17 center];
  double v19 = v18;
  double v21 = v20;
  double v22 = [(_UIWindowSceneActivationEffect *)self platterContainer];
  objc_msgSend(v7, "convertPoint:toView:", v22, v19, v21);
  double v24 = v23;
  double v26 = v25;
  v27 = [(_UIWindowSceneActivationEffect *)self platterView];
  objc_msgSend(v27, "setCenter:", v24, v26);
}

- (void)advanceToScale:(double)a3
{
  id v5 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
  [v5 pinchActivationScaleThreshold];
  double v7 = v6 + -1.0;

  double v8 = a3 + -1.0;
  if (a3 + -1.0 <= 0.0)
  {
    if (a3 + -1.0 < 0.0) {
      double v8 = -((1.0 - 1.0 / (v8 / v7 * -0.55 + 1.0)) * v7);
    }
  }
  else
  {
    double v8 = v7 * (1.0 - 1.0 / (v8 / v7 * 0.55 + 1.0));
  }
  double v9 = v8 + 1.0;
  v10 = [(_UIWindowSceneActivationEffect *)self _interactiveScaleBehavior];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49___UIWindowSceneActivationEffect_advanceToScale___block_invoke;
  v13[3] = &unk_1E52D9CD0;
  v13[4] = self;
  *(double *)&v13[5] = v9;
  +[UIView _animateUsingSpringBehavior:v10 tracking:0 animations:v13 completion:0];

  v11 = [(_UIWindowSceneActivationEffect *)self _shadowBehavior];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49___UIWindowSceneActivationEffect_advanceToScale___block_invoke_2;
  v12[3] = &unk_1E52D9F70;
  v12[4] = self;
  +[UIView _animateUsingSpringBehavior:v11 tracking:0 animations:v12 completion:0];
}

- (void)endExpanded:(BOOL)a3 withVelocity:(double)a4
{
  BOOL v5 = a3;
  [(_UIWindowSceneActivationEffect *)self setState:0];
  double v7 = [(_UIWindowSceneActivationEffect *)self platterView];
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  int v82 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke;
  aBlock[3] = &unk_1E530F8D0;
  aBlock[4] = self;
  aBlock[5] = &v79;
  double v8 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  if (+[UIView areAnimationsEnabled])
  {
    double v9 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
    [v9 pinchEndingProjectionDuration];
    double v11 = v10 * a4;

    double v12 = fabs(v11);
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 24);
    long long v69 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 8);
    long long v70 = v13;
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v74 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v75 = v14;
    uint64_t v76 = *(void *)(MEMORY[0x1E4F39B10] + 112);
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v73 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v72 = v15;
    double v16 = *(double *)(MEMORY[0x1E4F39B10] + 120);
    if (v11 < 0.0) {
      double v16 = NAN;
    }
    double v68 = v12;
    double v71 = v12;
    double v77 = v16;
    double v17 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v68];
    [v7 _setVelocity:v17 forKey:@"transform"];

    double v18 = [(_UIWindowSceneActivationEffect *)self descriptor];
    double v19 = [v18 targetedPreview];

    double v20 = [v19 target];
    [v20 center];
    double v22 = v21;
    double v24 = v23;

    if (v5)
    {
      double v25 = [v7 window];
      double v26 = [v25 screen];

      v27 = [v26 coordinateSpace];
      [v26 bounds];
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      v36 = [v7 superview];
      objc_msgSend(v27, "convertPoint:toCoordinateSpace:", v36, v29 + v33 * 0.5, v31 + v35 * 0.5);
      double v22 = v37;
      double v24 = v38;
    }
    else
    {
      if (![v19 _sourceViewIsInViewHierarchy])
      {
LABEL_10:
        [v7 center];
        double v47 = v46;
        double v49 = v48;
        v50 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
        [v50 pinchEndPlatterVelocityMultiplier];
        double v52 = v51;

        v53 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
        [v53 pinchEndPlatterVelocityMultiplier];
        double v55 = (v24 - v49) * v54;

        v56 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", (v22 - v47) * v52, v55);
        [v7 _setVelocity:v56 forKey:@"position"];

        v57 = [(_UIWindowSceneActivationEffect *)self _settlingBehavior];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke_2;
        v63[3] = &unk_1E52EE808;
        v65 = &v79;
        id v58 = v7;
        id v64 = v58;
        double v66 = v22;
        double v67 = v24;
        +[UIView _animateUsingSpringBehavior:v57 tracking:0 animations:v63 completion:v8];

        v59 = [(_UIWindowSceneActivationEffect *)self _shadowBehavior];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke_3;
        v60[3] = &unk_1E52E3210;
        v62 = &v79;
        id v61 = v58;
        +[UIView _animateUsingSpringBehavior:v59 tracking:0 animations:v60 completion:v8];

        goto LABEL_11;
      }
      double v26 = [v19 view];
      v27 = [v26 superview];
      v36 = [v19 view];
      [v36 center];
      double v40 = v39;
      double v42 = v41;
      v43 = [v7 superview];
      objc_msgSend(v27, "convertPoint:toView:", v43, v40, v42);
      double v22 = v44;
      double v24 = v45;
    }
    goto LABEL_10;
  }
  *((_DWORD *)v80 + 6) = 1;
  v8[2](v8, 1, 0);
LABEL_11:

  _Block_object_dispose(&v79, 8);
}

- (id)_interactiveScaleBehavior
{
  v2 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
  v3 = [v2 pinchInteractiveScale];
  v4 = [v3 springAnimationBehavior];

  return v4;
}

- (id)_settlingBehavior
{
  v2 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
  v3 = [v2 pinchSettle];
  v4 = [v3 springAnimationBehavior];

  return v4;
}

- (id)_shadowBehavior
{
  v2 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
  v3 = [v2 pinchShadow];
  v4 = [v3 springAnimationBehavior];

  return v4;
}

- (void)setDescriptor:(id)a3 andKey:(id)a4
{
}

- (id)previewForContinuingToEffectWithPreview:(id)a3
{
  v3 = [(_UIWindowSceneActivationEffect *)self platterView];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  v4 = [v3 layer];
  BOOL v5 = [v4 presentationLayer];
  double v6 = v5;
  if (v5)
  {
    [v5 affineTransform];
  }
  else
  {
    double v7 = [v3 layer];
    double v8 = v7;
    if (v7)
    {
      [v7 affineTransform];
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
    }
  }
  double v9 = [UIPreviewTarget alloc];
  double v10 = [v3 superview];
  [v3 center];
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  double v11 = -[UIPreviewTarget initWithContainer:center:transform:](v9, "initWithContainer:center:transform:", v10, v16);

  double v12 = objc_opt_new();
  long long v13 = +[UIColor clearColor];
  [v12 setBackgroundColor:v13];

  long long v14 = [[UITargetedPreview alloc] initWithView:v3 parameters:v12 target:v11];
  return v14;
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  completions = self->_completions;
  aBlock = v4;
  if (!completions)
  {
    double v6 = [MEMORY[0x1E4F1CA48] array];
    double v7 = self->_completions;
    self->_completions = v6;

    id v4 = aBlock;
    completions = self->_completions;
  }
  double v8 = _Block_copy(v4);
  [(NSMutableArray *)completions addObject:v8];
}

- (void)_performAllCompletionBlocks
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(_UIWindowSceneActivationEffect *)self completions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (_UIContentEffectDescriptor)descriptor
{
  return self->_descriptor;
}

- (UIView)platterContainer
{
  return self->_platterContainer;
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (_UIHighlightPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(double)a3
{
  self->_currentScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_platterContainer, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end