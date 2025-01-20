@interface _UISystemInputActivityInteraction
- (BSInvalidatable)_systemInputActivityToken;
- (UIView)view;
- (UIWindowScene)_windowScene;
- (void)_teardown;
- (void)_updateSystemInputActivityIfNeeded;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)setView:(id)a3;
- (void)set_systemInputActivityToken:(id)a3;
- (void)set_windowScene:(id)a3;
@end

@implementation _UISystemInputActivityInteraction

- (void)_updateSystemInputActivityIfNeeded
{
  id v9 = [(_UISystemInputActivityInteraction *)self _windowScene];
  v3 = [(_UISystemInputActivityInteraction *)self view];
  v4 = [v3 window];

  id v5 = [v4 windowScene];
  if (v5 != v9)
  {
    [(_UISystemInputActivityInteraction *)self _teardown];
    if (v5)
    {
      v6 = [v5 _systemInputActivityManager];
      v7 = [v6 beginTrackingSystemInputActivity];
      [(_UISystemInputActivityInteraction *)self set_systemInputActivityToken:v7];

      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:self selector:sel__updateSystemInputActivityIfNeeded name:0x1ED1601E0 object:v4];

      [(_UISystemInputActivityInteraction *)self set_windowScene:v5];
    }
  }
}

- (void)_teardown
{
  [(_UISystemInputActivityInteraction *)self set_windowScene:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(_UISystemInputActivityInteraction *)self _systemInputActivityToken];
  [v4 invalidate];

  [(_UISystemInputActivityInteraction *)self set_systemInputActivityToken:0];
}

- (void)dealloc
{
  [(_UISystemInputActivityInteraction *)self _teardown];
  v3.receiver = self;
  v3.super_class = (Class)_UISystemInputActivityInteraction;
  [(_UISystemInputActivityInteraction *)&v3 dealloc];
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  [(_UISystemInputActivityInteraction *)self _updateSystemInputActivityIfNeeded];
}

- (BSInvalidatable)_systemInputActivityToken
{
  return self->__systemInputActivityToken;
}

- (void)set_systemInputActivityToken:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (UIWindowScene)_windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__windowScene);
  return (UIWindowScene *)WeakRetained;
}

- (void)set_windowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__windowScene);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->__systemInputActivityToken, 0);
}

@end