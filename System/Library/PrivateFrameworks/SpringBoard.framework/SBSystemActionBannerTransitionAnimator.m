@interface SBSystemActionBannerTransitionAnimator
+ (id)settings;
+ (void)performAnimationsForTransition:(id)a3 completion:(id)a4;
- (BOOL)_viewHasGaussianBlurFilter:(id)a3;
- (UIViewFloatAnimatableProperty)blurProgressProperty;
- (id)settings;
- (void)_addGaussianBlurToViewIfNeeded:(id)a3 inputRadius:(double)a4;
- (void)_removeBlurFilterFromView:(id)a3;
- (void)performActionsForTransition:(id)a3;
- (void)prepareForTransition:(id)a3;
- (void)setBlurProgressProperty:(id)a3;
@end

@implementation SBSystemActionBannerTransitionAnimator

+ (id)settings
{
  if (settings_onceToken != -1) {
    dispatch_once(&settings_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)settings_settings;
  return v2;
}

void __50__SBSystemActionBannerTransitionAnimator_settings__block_invoke()
{
  uint64_t v0 = +[SBBannerTransitionDomain rootSettings];
  v1 = (void *)settings_settings;
  settings_settings = v0;
}

+ (void)performAnimationsForTransition:(id)a3 completion:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F42FF0];
  id v7 = a4;
  id v8 = a3;
  id v10 = [a1 settings];
  v9 = [v10 customBannerTransitionStyleSystemAction];
  objc_msgSend(v6, "sb_animateWithSettings:mode:animations:completion:", v9, 3, v8, v7);
}

- (id)settings
{
  v2 = objc_opt_class();
  return (id)[v2 settings];
}

- (void)prepareForTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 transitionView];
  BOOL v6 = [(BNBannerTransitionAnimator *)self isPresenting];
  double v7 = 0.0;
  if (v6) {
    double v7 = 20.0;
  }
  [(SBSystemActionBannerTransitionAnimator *)self _addGaussianBlurToViewIfNeeded:v5 inputRadius:v7];

  if ([(BNBannerTransitionAnimator *)self isPresenting])
  {
    id v8 = [v4 transitionView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v13 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

    if (v10 == v13 && v12 == v14)
    {
      [v4 finalContentFrame];
      double v17 = v16;
      [v4 finalFrame];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24 - v17;
      v26 = [v4 transitionView];
      objc_msgSend(v26, "setFrame:", v19, v25, v21, v23);

      v27 = [v4 transitionView];
      [v27 setAlpha:0.0];

      v28 = [v4 transitionView];
      CGAffineTransformMakeScale(&v30, 0.6, 0.6);
      [v28 setTransform:&v30];

      [(UIViewFloatAnimatableProperty *)self->_blurProgressProperty setValue:1.0];
    }
  }
  v29 = [v4 transitionView];
  [v29 setClipsToBounds:0];
}

- (void)performActionsForTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 transitionView];
  if ([(BNBannerTransitionAnimator *)self isPresenting])
  {
    [v5 setAlpha:1.0];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v28[0] = *MEMORY[0x1E4F1DAB8];
    v28[1] = v6;
    v28[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v5 setTransform:v28];
    [v4 finalFrame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    objc_msgSend(v5, "setFrame:", v8, v10, v12, v14);
    v15 = [v5 layer];
    [v15 setValue:&unk_1F3348A38 forKeyPath:@"filters.gaussianBlur.inputRadius"];

    [(UIViewFloatAnimatableProperty *)self->_blurProgressProperty setValue:0.0];
  }
  else
  {
    [v4 initialContentFrame];
    double v17 = v16;
    [v4 initialFrame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    objc_msgSend(v5, "setFrame:", v19, v21 - v17, v23, v25);
    [v5 setAlpha:0.0];
    CGAffineTransformMakeScale(&v27, 0.6, 0.6);
    [v5 setTransform:&v27];
    v26 = [v5 layer];
    [v26 setValue:&unk_1F3348A48 forKeyPath:@"filters.gaussianBlur.inputRadius"];
  }
}

- (BOOL)_viewHasGaussianBlurFilter:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = objc_msgSend(a3, "layer", 0);
  id v4 = [v3 filters];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4F3A0D0];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) name];
        char v11 = [v10 isEqualToString:v8];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)_addGaussianBlurToViewIfNeeded:(id)a3 inputRadius:(double)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(SBSystemActionBannerTransitionAnimator *)self _viewHasGaussianBlurFilter:v6])
  {
    uint64_t v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v7 setName:@"gaussianBlur"];
    [v7 setValue:@"default" forKey:@"inputQuality"];
    [v7 setValue:@"default" forKey:@"inputIntermediateBitDepth"];
    uint64_t v8 = [NSNumber numberWithDouble:a4];
    [v7 setValue:v8 forKey:@"inputRadius"];

    uint64_t v9 = MEMORY[0x1E4F1CC28];
    [v7 setValue:MEMORY[0x1E4F1CC28] forKey:@"inputNormalizeEdges"];
    [v7 setValue:v9 forKey:@"inputHardEdges"];
    double v10 = [v6 layer];
    char v11 = [v10 filters];
    BOOL v12 = (void *)[v11 mutableCopy];

    [v12 addObject:v7];
    double v13 = [v6 layer];
    v27[0] = v7;
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [v13 setFilters:v14];
  }
  if ([(BNBannerTransitionAnimator *)self isPresenting])
  {
    if (!self->_blurProgressProperty)
    {
      long long v15 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
      blurProgressProperty = self->_blurProgressProperty;
      self->_blurProgressProperty = v15;
    }
    objc_initWeak(&location, self);
    p_blurProgressProperty = &self->_blurProgressProperty;
    objc_initWeak(&from, *p_blurProgressProperty);
    double v18 = (void *)MEMORY[0x1E4F42FF0];
    v26 = *p_blurProgressProperty;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__SBSystemActionBannerTransitionAnimator__addGaussianBlurToViewIfNeeded_inputRadius___block_invoke;
    v20[3] = &unk_1E6AF4BB0;
    objc_copyWeak(&v22, &from);
    objc_copyWeak(&v23, &location);
    id v21 = v6;
    [v18 _createTransformerWithInputAnimatableProperties:v19 presentationValueChangedCallback:v20];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __85__SBSystemActionBannerTransitionAnimator__addGaussianBlurToViewIfNeeded_inputRadius___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    char v4 = [WeakRetained isInvalidated];
    [v7 presentationValue];
    int v5 = BSFloatLessThanOrEqualToFloat();
    v3 = v7;
    if (v5)
    {
      if ((v4 & 1) == 0)
      {
        id v6 = objc_loadWeakRetained((id *)(a1 + 48));
        [v6 _removeBlurFilterFromView:*(void *)(a1 + 32)];

        [v7 invalidate];
        v3 = v7;
      }
    }
  }
}

- (void)_removeBlurFilterFromView:(id)a3
{
  id v3 = [a3 layer];
  [v3 setFilters:0];
}

- (UIViewFloatAnimatableProperty)blurProgressProperty
{
  return self->_blurProgressProperty;
}

- (void)setBlurProgressProperty:(id)a3
{
}

- (void).cxx_destruct
{
}

@end