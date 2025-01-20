@interface SBBannerPoofTransitionAnimator
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

@implementation SBBannerPoofTransitionAnimator

+ (id)settings
{
  if (settings_onceToken_1 != -1) {
    dispatch_once(&settings_onceToken_1, &__block_literal_global_75);
  }
  v2 = (void *)settings_settings_0;
  return v2;
}

void __42__SBBannerPoofTransitionAnimator_settings__block_invoke()
{
  uint64_t v0 = +[SBBannerTransitionDomain rootSettings];
  v1 = (void *)settings_settings_0;
  settings_settings_0 = v0;
}

+ (void)performAnimationsForTransition:(id)a3 completion:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F42FF0];
  id v7 = a4;
  id v8 = a3;
  id v10 = [a1 settings];
  v9 = [v10 customBannerTransitionStylePoof];
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
  if ([(BNBannerTransitionAnimator *)self isPresenting])
  {
    v6 = [(SBBannerPoofTransitionAnimator *)self settings];
    [v6 poofInitialBlurRadius];
    -[SBBannerPoofTransitionAnimator _addGaussianBlurToViewIfNeeded:inputRadius:](self, "_addGaussianBlurToViewIfNeeded:inputRadius:", v5);
  }
  else
  {
    [(SBBannerPoofTransitionAnimator *)self _addGaussianBlurToViewIfNeeded:v5 inputRadius:0.0];
  }

  if ([(BNBannerTransitionAnimator *)self isPresenting])
  {
    id v7 = [v4 transitionView];
    [v7 frame];
    BOOL IsEmpty = CGRectIsEmpty(v29);

    if (IsEmpty)
    {
      v9 = [(SBBannerPoofTransitionAnimator *)self settings];
      [v9 poofInitialScale];
      CGFloat v11 = v10;

      [v4 finalFrame];
      double v13 = v12;
      [v4 finalContentFrame];
      UIRectGetCenter();
      double v15 = v14;
      v16 = [v4 transitionView];
      [v4 finalFrame];
      objc_msgSend(v16, "setFrame:");

      v17 = [v4 transitionView];
      [v17 setAlpha:0.0];

      v18 = [v4 transitionView];
      CGAffineTransformMakeScale(&v28, v11, v11);
      [v18 setTransform:&v28];

      [(UIViewFloatAnimatableProperty *)self->_blurProgressProperty setValue:1.0];
      v19 = [v4 transitionView];
      [v19 frame];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;

      v26 = [v4 transitionView];
      objc_msgSend(v26, "setFrame:", v21, v13 + v15 * (1.0 - v11), v23, v25);
    }
  }
  v27 = [v4 transitionView];
  [v27 setClipsToBounds:0];
}

- (void)performActionsForTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 transitionView];
  if ([(BNBannerTransitionAnimator *)self isPresenting])
  {
    [v5 setAlpha:1.0];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v32[0] = *MEMORY[0x1E4F1DAB8];
    v32[1] = v6;
    v32[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v5 setTransform:v32];
    [v4 finalFrame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    objc_msgSend(v5, "setFrame:", v8, v10, v12, v14);
    double v15 = [v5 layer];
    [v15 setValue:&unk_1F3348AE8 forKeyPath:@"filters.gaussianBlur.inputRadius"];

    [(UIViewFloatAnimatableProperty *)self->_blurProgressProperty setValue:0.0];
  }
  else
  {
    v16 = [(SBBannerPoofTransitionAnimator *)self settings];
    [v16 poofDismissedScale];
    CGFloat v18 = v17;

    [v4 initialFrame];
    [v4 initialContentFrame];
    UIRectGetCenter();
    [v4 initialFrame];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    objc_msgSend(v5, "setFrame:", v20, v22, v24, v26);
    [v5 setAlpha:0.0];
    CGAffineTransformMakeScale(&v31, v18, v18);
    [v5 setTransform:&v31];
    v27 = [v5 layer];
    CGAffineTransform v28 = NSNumber;
    CGRect v29 = [(SBBannerPoofTransitionAnimator *)self settings];
    [v29 poofDismissedBlurRadius];
    v30 = objc_msgSend(v28, "numberWithDouble:");
    [v27 setValue:v30 forKeyPath:@"filters.gaussianBlur.inputRadius"];

    [v5 frame];
    objc_msgSend(v5, "setFrame:");
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
  if (![(SBBannerPoofTransitionAnimator *)self _viewHasGaussianBlurFilter:v6])
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
    CGFloat v18 = (void *)MEMORY[0x1E4F42FF0];
    double v26 = *p_blurProgressProperty;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__SBBannerPoofTransitionAnimator__addGaussianBlurToViewIfNeeded_inputRadius___block_invoke;
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

void __77__SBBannerPoofTransitionAnimator__addGaussianBlurToViewIfNeeded_inputRadius___block_invoke(uint64_t a1)
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