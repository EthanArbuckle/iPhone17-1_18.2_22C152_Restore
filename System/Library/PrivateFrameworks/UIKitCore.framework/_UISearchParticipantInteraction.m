@interface _UISearchParticipantInteraction
- (BSInvalidatable)_searchParticipantToken;
- (UIView)view;
- (UIWindowScene)_windowScene;
- (void)_teardown;
- (void)_updateActiveSearchParticipationIfNeeded;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)setView:(id)a3;
- (void)set_searchParticipantToken:(id)a3;
- (void)set_windowScene:(id)a3;
@end

@implementation _UISearchParticipantInteraction

- (void)_updateActiveSearchParticipationIfNeeded
{
  id v10 = [(_UISearchParticipantInteraction *)self _windowScene];
  v3 = [(_UISearchParticipantInteraction *)self view];
  v4 = [v3 window];

  id v5 = [v4 windowScene];
  if (v5 != v10)
  {
    [(_UISearchParticipantInteraction *)self _teardown];
    if (v5)
    {
      v6 = [v5 _searchActivityManager];
      v7 = [(_UISearchParticipantInteraction *)self view];
      v8 = [v6 beginTrackingActiveSearchParticipant:v7];
      [(_UISearchParticipantInteraction *)self set_searchParticipantToken:v8];

      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel__updateActiveSearchParticipationIfNeeded name:0x1ED1601E0 object:v4];

      [(_UISearchParticipantInteraction *)self set_windowScene:v5];
    }
  }
}

- (void)_teardown
{
  [(_UISearchParticipantInteraction *)self set_windowScene:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(_UISearchParticipantInteraction *)self _searchParticipantToken];
  [v4 invalidate];

  [(_UISearchParticipantInteraction *)self set_searchParticipantToken:0];
}

- (void)dealloc
{
  [(_UISearchParticipantInteraction *)self _teardown];
  v3.receiver = self;
  v3.super_class = (Class)_UISearchParticipantInteraction;
  [(_UISearchParticipantInteraction *)&v3 dealloc];
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  [(_UISearchParticipantInteraction *)self _updateActiveSearchParticipationIfNeeded];
}

- (BSInvalidatable)_searchParticipantToken
{
  return self->__searchParticipantToken;
}

- (void)set_searchParticipantToken:(id)a3
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
  objc_storeStrong((id *)&self->__searchParticipantToken, 0);
}

@end