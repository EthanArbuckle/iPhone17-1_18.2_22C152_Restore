@interface UIWindowSceneActivationInteraction
- (BOOL)_canAnimateSceneActivationWithConfiguration:(id)a3;
- (BOOL)_shouldActivateForEndingPinch:(id)a3;
- (BOOL)_supportsAssociation;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (UIPinchGestureRecognizer)pinchGR;
- (UIView)view;
- (UIWindowSceneActivationConfiguration)activeConfiguration;
- (UIWindowSceneActivationInteraction)initWithConfigurationProvider:(UIWindowSceneActivationInteractionConfigurationProvider)configurationProvider errorHandler:(void *)errorHandler;
- (_UIDoubleTapInteraction)doubleTapInteraction;
- (_UIWindowSceneActivationAnimator)animator;
- (_UIWindowSceneActivationEffect)activeEffect;
- (id)_requestConfigurationForLocation:(CGPoint)a3;
- (id)_targetedPreviewForContinuingEffectWithPreview:(id)a3;
- (id)configurationProvider;
- (id)errorHandler;
- (void)_animateExpansionWithVelocity:(double)a3;
- (void)_cancelInteraction;
- (void)_endEffectWithVelocity:(double)a3 forActiveConfigurationWithCompletionStatus:(BOOL)a4;
- (void)_handlePinchGesture:(id)a3;
- (void)_prepareEffectForActiveConfigurationAtLocation:(CGPoint)a3 completion:(id)a4;
- (void)_prepareSceneActivationConfiguration:(id)a3;
- (void)_prewarmAnimationWithCompletion:(id)a3;
- (void)_requestSceneActivationWithConfiguration:(id)a3 animated:(BOOL)a4 sender:(id)a5 errorHandler:(id)a6;
- (void)didMoveToView:(id)a3;
- (void)setActiveConfiguration:(id)a3;
- (void)setActiveEffect:(id)a3;
- (void)setAnimator:(id)a3;
- (void)setConfigurationProvider:(id)a3;
- (void)setDoubleTapInteraction:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setPinchGR:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UIWindowSceneActivationInteraction

- (UIWindowSceneActivationInteraction)initWithConfigurationProvider:(UIWindowSceneActivationInteractionConfigurationProvider)configurationProvider errorHandler:(void *)errorHandler
{
  UIWindowSceneActivationInteractionConfigurationProvider v6 = configurationProvider;
  v7 = errorHandler;
  v11.receiver = self;
  v11.super_class = (Class)UIWindowSceneActivationInteraction;
  v8 = [(UIWindowSceneActivationInteraction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(UIWindowSceneActivationInteraction *)v8 setConfigurationProvider:v6];
    [(UIWindowSceneActivationInteraction *)v9 setErrorHandler:v7];
  }

  return v9;
}

- (void)willMoveToView:(id)a3
{
  v4 = [(UIWindowSceneActivationInteraction *)self pinchGR];
  v5 = [v4 view];
  UIWindowSceneActivationInteractionConfigurationProvider v6 = [(UIWindowSceneActivationInteraction *)self pinchGR];
  [v5 removeGestureRecognizer:v6];

  v7 = [(UIWindowSceneActivationInteraction *)self doubleTapInteraction];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v9 = [(UIWindowSceneActivationInteraction *)self doubleTapInteraction];
    [WeakRetained removeInteraction:v9];
  }
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_view, v4);
  if ([(id)UIApp supportsMultipleScenes])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

    if (WeakRetained)
    {
      UIWindowSceneActivationInteractionConfigurationProvider v6 = [(UIWindowSceneActivationInteraction *)self pinchGR];

      if (!v6)
      {
        v7 = [(UIGestureRecognizer *)[UIPinchGestureRecognizer alloc] initWithTarget:self action:sel__handlePinchGesture_];
        [(UIWindowSceneActivationInteraction *)self setPinchGR:v7];

        v8 = [(UIWindowSceneActivationInteraction *)self pinchGR];
        [v8 setName:@"com.apple.UIKit.UIWindowSceneActivationInteraction.pinch"];

        v9 = [(UIWindowSceneActivationInteraction *)self pinchGR];
        [v9 setDelegate:self];
      }
      id v10 = objc_loadWeakRetained((id *)&self->_view);
      objc_super v11 = [(UIWindowSceneActivationInteraction *)self pinchGR];
      [v10 addGestureRecognizer:v11];

      v12 = [(UIWindowSceneActivationInteraction *)self doubleTapInteraction];

      if (!v12)
      {
        v13 = objc_opt_new();
        [(UIWindowSceneActivationInteraction *)self setDoubleTapInteraction:v13];

        objc_initWeak(&location, self);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke;
        v23[3] = &unk_1E5308020;
        objc_copyWeak(&v24, &location);
        v14 = [(UIWindowSceneActivationInteraction *)self doubleTapInteraction];
        [v14 setShouldContinueProcessingSecondTap:v23];

        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_2;
        v21[3] = &unk_1E5308048;
        objc_copyWeak(&v22, &location);
        v15 = [(UIWindowSceneActivationInteraction *)self doubleTapInteraction];
        [v15 setDidDoubleTap:v21];

        uint64_t v19 = MEMORY[0x1E4F143A8];
        objc_copyWeak(&v20, &location);
        v16 = [(UIWindowSceneActivationInteraction *)self doubleTapInteraction];
        [v16 setDidTimeOut:&v19];

        objc_destroyWeak(&v20);
        objc_destroyWeak(&v22);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      id v17 = objc_loadWeakRetained((id *)&self->_view);
      v18 = [(UIWindowSceneActivationInteraction *)self doubleTapInteraction];
      [v17 addInteraction:v18];
    }
  }
}

BOOL __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  UIWindowSceneActivationInteractionConfigurationProvider v6 = objc_msgSend(WeakRetained, "_requestConfigurationForLocation:", a2, a3);
  BOOL v7 = v6 != 0;

  return v7;
}

void __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_2(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  UIWindowSceneActivationInteractionConfigurationProvider v6 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v7 = [WeakRetained view];
    v8 = [v7 _viewControllerForAncestor];
    v9 = [v8 transitionCoordinator];

    if (!v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_3;
      v10[3] = &unk_1E52D9F70;
      v10[4] = v6;
      objc_msgSend(v6, "_prepareEffectForActiveConfigurationAtLocation:completion:", v10, a2, a3);
    }
  }
}

uint64_t __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endEffectWithVelocity:1 forActiveConfigurationWithCompletionStatus:0.0];
}

void __52__UIWindowSceneActivationInteraction_didMoveToView___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setActiveConfiguration:0];
}

- (BOOL)_supportsAssociation
{
  return 1;
}

- (id)_targetedPreviewForContinuingEffectWithPreview:(id)a3
{
  id v3 = a3;
  id v4 = +[_UIWindowSceneActivationEffectDescriptor descriptorWithPreview:v3];
  v5 = +[_UIContentEffectManager sharedManager];
  UIWindowSceneActivationInteractionConfigurationProvider v6 = [v5 compatibleEffectForDescriptor:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [v6 previewForContinuingToEffectWithPreview:v3];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_handlePinchGesture:(id)a3
{
  id v12 = a3;
  if ([v12 state] == 1)
  {
    id v4 = [(UIWindowSceneActivationInteraction *)self view];
    [v12 locationInView:v4];
    double v6 = v5;
    double v8 = v7;

    id v9 = -[UIWindowSceneActivationInteraction _requestConfigurationForLocation:](self, "_requestConfigurationForLocation:", v6, v8);
    -[UIWindowSceneActivationInteraction _prepareEffectForActiveConfigurationAtLocation:completion:](self, "_prepareEffectForActiveConfigurationAtLocation:completion:", 0, v6, v8);
  }
  else if ([v12 state] == 2)
  {
    id v10 = [(UIWindowSceneActivationInteraction *)self activeEffect];
    [v12 scale];
    objc_msgSend(v10, "advanceToScale:");
  }
  else if ([v12 state] >= 3)
  {
    BOOL v11 = [(UIWindowSceneActivationInteraction *)self _shouldActivateForEndingPinch:v12];
    [v12 velocity];
    -[UIWindowSceneActivationInteraction _endEffectWithVelocity:forActiveConfigurationWithCompletionStatus:](self, "_endEffectWithVelocity:forActiveConfigurationWithCompletionStatus:", v11);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v4 = objc_msgSend(a4, "name", a3);
  char v5 = [v4 hasPrefix:@"com.apple.UIKit.multi-select"];

  return v5;
}

- (BOOL)_shouldActivateForEndingPinch:(id)a3
{
  id v3 = a3;
  id v4 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
  [v4 pinchEndingProjectionDuration];
  double v6 = v5;

  double v7 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
  [v7 pinchActivationScaleThreshold];
  double v9 = v8;

  [v3 scale];
  double v11 = v10;
  [v3 velocity];
  double v13 = v11 + v6 * v12;
  uint64_t v14 = [v3 state];

  return v13 > v9 && v14 == 3;
}

- (void)_cancelInteraction
{
  id v3 = [(UIWindowSceneActivationInteraction *)self pinchGR];
  [v3 setEnabled:0];

  id v4 = [(UIWindowSceneActivationInteraction *)self pinchGR];
  [v4 setEnabled:1];
}

- (void)_prewarmAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [_UIWindowSceneActivationAnimator alloc];
  double v6 = [(UIWindowSceneActivationInteraction *)self activeConfiguration];
  double v7 = [(_UIWindowSceneActivationAnimator *)v5 initWithConfiguration:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__UIWindowSceneActivationInteraction__prewarmAnimationWithCompletion___block_invoke;
  v10[3] = &unk_1E5308070;
  v10[4] = self;
  double v11 = v7;
  id v12 = v4;
  id v8 = v4;
  double v9 = v7;
  [(_UIWindowSceneActivationAnimator *)v9 prewarmWithCompletion:v10];
  [(UIWindowSceneActivationInteraction *)self setAnimator:v9];
}

void __70__UIWindowSceneActivationInteraction__prewarmAnimationWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a3;
    double v6 = [v4 activeEffect];
    id v9 = [v6 platterContainer];

    double v7 = [v9 superview];
    [v9 center];
    objc_msgSend(v7, "convertPoint:toView:", v5);
    objc_msgSend(v9, "setCenter:");

    [v5 addSubview:v9];
    [*(id *)(a1 + 40) deparent];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
  }
}

- (id)_requestConfigurationForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UIWindowSceneActivationInteraction *)self activeConfiguration];

  if (!v6)
  {
    double v7 = [(UIWindowSceneActivationInteraction *)self configurationProvider];
    uint64_t v8 = ((void (**)(void, UIWindowSceneActivationInteraction *, double, double))v7)[2](v7, self, x, y);

    if (v8)
    {
      id v9 = (void *)[v8 copy];

      double v10 = [(UIWindowSceneActivationInteraction *)self view];
      double v11 = [v10 window];
      id v12 = [v11 windowScene];

      double v13 = [(UIWindowSceneActivationInteraction *)self view];
      _UIWindowSceneActivationPrepareConfiguration(v9, v13, self, v12, &__block_literal_global_510);
    }
  }
  return [(UIWindowSceneActivationInteraction *)self activeConfiguration];
}

UIWindowSceneProminentPlacement *__71__UIWindowSceneActivationInteraction__requestConfigurationForLocation___block_invoke()
{
  return +[UIWindowSceneProminentPlacement prominentPlacement];
}

- (void)_prepareEffectForActiveConfigurationAtLocation:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(UIWindowSceneActivationInteraction *)self activeConfiguration];
  if (v8
    && (id v9 = (void *)v8,
        [(UIWindowSceneActivationInteraction *)self activeConfiguration],
        double v10 = objc_claimAutoreleasedReturnValue(),
        int IsAnimatable = _UIWindowSceneActivationIsAnimatable(v10),
        v10,
        v9,
        IsAnimatable))
  {
    id v12 = [(UIWindowSceneActivationInteraction *)self view];
    double v13 = +[_UIWindowSceneActivationIdentifier identifierWithLocation:inView:](_UIWindowSceneActivationIdentifier, "identifierWithLocation:inView:", v12, x, y);

    uint64_t v14 = [(UIWindowSceneActivationInteraction *)self activeConfiguration];
    v15 = [v14 preview];

    v16 = +[_UIWindowSceneActivationEffectDescriptor descriptorWithPreview:v15];
    id v17 = +[_UIContentEffectManager sharedManager];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __96__UIWindowSceneActivationInteraction__prepareEffectForActiveConfigurationAtLocation_completion___block_invoke;
    v21[3] = &unk_1E5308098;
    id v22 = v16;
    id v18 = v16;
    uint64_t v19 = [v17 compatibleEffectForKey:v13 descriptor:v18 constructor:v21];
    [(UIWindowSceneActivationInteraction *)self setActiveEffect:v19];

    id v20 = [(UIWindowSceneActivationInteraction *)self activeEffect];
    [v20 begin];

    [(UIWindowSceneActivationInteraction *)self _prewarmAnimationWithCompletion:v7];
  }
  else
  {
    [(UIWindowSceneActivationInteraction *)self _cancelInteraction];
  }
}

_UIWindowSceneActivationEffect *__96__UIWindowSceneActivationInteraction__prepareEffectForActiveConfigurationAtLocation_completion___block_invoke(uint64_t a1)
{
  v1 = [[_UIWindowSceneActivationEffect alloc] initWithDescriptor:*(void *)(a1 + 32)];
  return v1;
}

- (void)_endEffectWithVelocity:(double)a3 forActiveConfigurationWithCompletionStatus:(BOOL)a4
{
  if (a4)
  {
    id v5 = [(UIWindowSceneActivationInteraction *)self activeConfiguration];
    double v6 = [(UIWindowSceneActivationInteraction *)self errorHandler];
    _UIWindowSceneActivateConfiguration(v5, 0, v6);
  }
  else
  {
    uint64_t v8 = [(UIWindowSceneActivationInteraction *)self activeEffect];
    [v8 endExpanded:0 withVelocity:a3];

    id v9 = [(UIWindowSceneActivationInteraction *)self animator];
    [v9 reparent];
    double v10 = [(UIWindowSceneActivationInteraction *)self activeEffect];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __104__UIWindowSceneActivationInteraction__endEffectWithVelocity_forActiveConfigurationWithCompletionStatus___block_invoke;
    v11[3] = &unk_1E53080C0;
    id v12 = v9;
    id v5 = v9;
    [v10 addCompletion:v11];
  }
  [(UIWindowSceneActivationInteraction *)self setActiveConfiguration:0];
  [(UIWindowSceneActivationInteraction *)self setActiveEffect:0];
  [(UIWindowSceneActivationInteraction *)self setAnimator:0];
}

uint64_t __104__UIWindowSceneActivationInteraction__endEffectWithVelocity_forActiveConfigurationWithCompletionStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)_animateExpansionWithVelocity:(double)a3
{
  id v5 = [(UIWindowSceneActivationInteraction *)self animator];
  double v6 = [(UIWindowSceneActivationInteraction *)self activeEffect];
  id v7 = [v6 handOffPreview];
  int v8 = [v5 animateWithSourcePreview:v7 velocity:a3];

  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__UIWindowSceneActivationInteraction__animateExpansionWithVelocity___block_invoke;
    v10[3] = &unk_1E52D9F70;
    v10[4] = self;
    +[UIView performWithoutAnimation:v10];
  }
  else
  {
    id v9 = [(UIWindowSceneActivationInteraction *)self activeEffect];
    [v9 endExpanded:0 withVelocity:a3];
  }
}

void __68__UIWindowSceneActivationInteraction__animateExpansionWithVelocity___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activeEffect];
  [v1 endExpanded:0 withVelocity:0.0];
}

- (void)_prepareSceneActivationConfiguration:(id)a3
{
  id v4 = a3;
  [v4 _setAnimationSource:2];
  [(UIWindowSceneActivationInteraction *)self setActiveConfiguration:v4];
}

- (BOOL)_canAnimateSceneActivationWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(UIWindowSceneActivationInteraction *)self activeConfiguration];

  return v5 == v4;
}

- (void)_requestSceneActivationWithConfiguration:(id)a3 animated:(BOOL)a4 sender:(id)a5 errorHandler:(id)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v8)
  {
    id v12 = [(UIWindowSceneActivationInteraction *)self pinchGR];
    [v12 velocity];
    -[UIWindowSceneActivationInteraction _animateExpansionWithVelocity:](self, "_animateExpansionWithVelocity:");
  }
  [(id)UIApp _requestSceneActivationWithConfiguration:v13 animated:0 sender:v10 errorHandler:v11];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (id)configurationProvider
{
  return self->_configurationProvider;
}

- (void)setConfigurationProvider:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (UIWindowSceneActivationConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
}

- (_UIWindowSceneActivationEffect)activeEffect
{
  return self->_activeEffect;
}

- (void)setActiveEffect:(id)a3
{
}

- (_UIWindowSceneActivationAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchGR
{
  return self->_pinchGR;
}

- (void)setPinchGR:(id)a3
{
}

- (_UIDoubleTapInteraction)doubleTapInteraction
{
  return self->_doubleTapInteraction;
}

- (void)setDoubleTapInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapInteraction, 0);
  objc_storeStrong((id *)&self->_pinchGR, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_activeEffect, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_configurationProvider, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end