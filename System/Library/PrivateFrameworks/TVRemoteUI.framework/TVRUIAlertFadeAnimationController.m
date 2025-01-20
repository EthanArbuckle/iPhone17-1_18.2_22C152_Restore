@interface TVRUIAlertFadeAnimationController
- (TVRUIAlertFadeAnimationController)initWithAnimationType:(int64_t)a3 visualStyle:(id)a4;
- (TVRemoteAlertVisualStyleProviding)visualStyle;
- (double)transitionDuration:(id)a3;
- (int64_t)animationType;
- (void)_runDismissalAnimationWithTransition:(id)a3;
- (void)_runPresentationAnimationWithTransition:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation TVRUIAlertFadeAnimationController

- (TVRUIAlertFadeAnimationController)initWithAnimationType:(int64_t)a3 visualStyle:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TVRUIAlertFadeAnimationController;
  v8 = [(TVRUIAlertFadeAnimationController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_visualStyle, a4);
    v9->_animationType = a3;
  }

  return v9;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  if ([(TVRUIAlertFadeAnimationController *)self animationType]) {
    [(TVRUIAlertFadeAnimationController *)self _runDismissalAnimationWithTransition:v4];
  }
  else {
    [(TVRUIAlertFadeAnimationController *)self _runPresentationAnimationWithTransition:v4];
  }
}

- (double)transitionDuration:(id)a3
{
  v3 = [(TVRUIAlertFadeAnimationController *)self visualStyle];
  [v3 crossfadeDuration];
  double v5 = v4;

  return v5;
}

- (void)_runPresentationAnimationWithTransition:(id)a3
{
  id v4 = a3;
  double v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "#TVRUIAlertFadeAnimationController - Animate transition: presenting", buf, 2u);
  }

  v6 = [v4 viewForKey:*MEMORY[0x263F83C18]];
  id v7 = [v4 viewForKey:*MEMORY[0x263F83C08]];
  [v6 setAlpha:0.0];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");
  [(TVRUIAlertFadeAnimationController *)self transitionDuration:v4];
  double v9 = v8;
  id v10 = objc_alloc(MEMORY[0x263F82E30]);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __77__TVRUIAlertFadeAnimationController__runPresentationAnimationWithTransition___block_invoke;
  v19[3] = &unk_2647FFF70;
  id v20 = v6;
  id v11 = v6;
  v12 = (void *)[v10 initWithDuration:0 curve:v19 animations:v9];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __77__TVRUIAlertFadeAnimationController__runPresentationAnimationWithTransition___block_invoke_2;
  v17 = &unk_264800688;
  id v18 = v4;
  id v13 = v4;
  [v12 addCompletion:&v14];
  objc_msgSend(v12, "startAnimation", v14, v15, v16, v17);
}

uint64_t __77__TVRUIAlertFadeAnimationController__runPresentationAnimationWithTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __77__TVRUIAlertFadeAnimationController__runPresentationAnimationWithTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (void)_runDismissalAnimationWithTransition:(id)a3
{
  id v4 = a3;
  double v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "#TVRUIAlertFadeAnimationController - Animate transition: dismissing", buf, 2u);
  }

  v6 = [v4 viewForKey:*MEMORY[0x263F83C08]];
  id v7 = [v4 viewForKey:*MEMORY[0x263F83C18]];
  [v6 setAlpha:1.0];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");
  [(TVRUIAlertFadeAnimationController *)self transitionDuration:v4];
  double v9 = v8;
  id v10 = objc_alloc(MEMORY[0x263F82E30]);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__TVRUIAlertFadeAnimationController__runDismissalAnimationWithTransition___block_invoke;
  v19[3] = &unk_2647FFF70;
  id v20 = v6;
  id v11 = v6;
  v12 = (void *)[v10 initWithDuration:0 curve:v19 animations:v9];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __74__TVRUIAlertFadeAnimationController__runDismissalAnimationWithTransition___block_invoke_2;
  v17 = &unk_264800688;
  id v18 = v4;
  id v13 = v4;
  [v12 addCompletion:&v14];
  objc_msgSend(v12, "startAnimation", v14, v15, v16, v17);
}

uint64_t __74__TVRUIAlertFadeAnimationController__runDismissalAnimationWithTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __74__TVRUIAlertFadeAnimationController__runDismissalAnimationWithTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (TVRemoteAlertVisualStyleProviding)visualStyle
{
  return self->_visualStyle;
}

- (void).cxx_destruct
{
}

@end