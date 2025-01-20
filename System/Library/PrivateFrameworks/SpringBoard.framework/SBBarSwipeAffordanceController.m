@interface SBBarSwipeAffordanceController
- (BOOL)suppressAffordance;
- (BOOL)wantsToBeActiveAffordance;
- (SBBarSwipeAffordanceController)initWithZStackParticipantIdentifier:(int64_t)a3 windowScene:(id)a4;
- (SBBarSwipeAffordanceControllingDelegate)delegate;
- (SBBarSwipeAffordanceView)barSwipeAffordanceView;
- (SBFZStackParticipant)zStackParticipant;
- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate;
- (SBWindowScene)windowScene;
- (int64_t)activationPolicyForParticipantsBelow;
- (void)_beginTryingToBecomeActiveAffordance;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_setKeyboardHomeAffordanceVisible:(BOOL)a3;
- (void)_stopTryingToBecomeActiveAffordance;
- (void)_updateActiveState;
- (void)dealloc;
- (void)setActivationPolicyForParticipantsBelow:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPointerClickDelegate:(id)a3;
- (void)setSuppressAffordance:(BOOL)a3;
- (void)setWantsToBeActiveAffordance:(BOOL)a3;
- (void)setWindowScene:(id)a3;
- (void)setZStackParticipant:(id)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBBarSwipeAffordanceController

- (void)setWantsToBeActiveAffordance:(BOOL)a3
{
  if (self->_wantsToBeActiveAffordance != a3)
  {
    self->_wantsToBeActiveAffordance = a3;
    if (a3) {
      [(SBBarSwipeAffordanceController *)self _beginTryingToBecomeActiveAffordance];
    }
    else {
      [(SBBarSwipeAffordanceController *)self _stopTryingToBecomeActiveAffordance];
    }
  }
}

- (SBBarSwipeAffordanceController)initWithZStackParticipantIdentifier:(int64_t)a3 windowScene:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBBarSwipeAffordanceController;
  v7 = [(SBBarSwipeAffordanceController *)&v17 init];
  v8 = v7;
  if (v7)
  {
    v7->_zStackParticipantIdentifier = a3;
    if (!v6)
    {
      v9 = [(id)SBApp windowSceneManager];
      id v6 = [v9 embeddedDisplayWindowScene];
    }
    objc_storeWeak((id *)&v8->_windowScene, v6);
    v10 = [v6 systemGestureManager];
    v11 = [SBBarSwipeAffordanceView alloc];
    uint64_t v12 = -[SBBarSwipeAffordanceView initWithFrame:systemGestureManager:enableGestures:](v11, "initWithFrame:systemGestureManager:enableGestures:", v10, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    barSwipeAffordanceView = v8->_barSwipeAffordanceView;
    v8->_barSwipeAffordanceView = (SBBarSwipeAffordanceView *)v12;

    v8->_activationPolicyForParticipantsBelow = 1;
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v8 selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4F43AC8] object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v8 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43AC8] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F43B80] object:0];

  v5.receiver = self;
  v5.super_class = (Class)SBBarSwipeAffordanceController;
  [(SBBarSwipeAffordanceController *)&v5 dealloc];
}

- (void)setSuppressAffordance:(BOOL)a3
{
  if (self->_suppressAffordance != a3)
  {
    self->_suppressAffordance = a3;
    [(SBBarSwipeAffordanceController *)self _updateActiveState];
  }
}

- (void)setActivationPolicyForParticipantsBelow:(int64_t)a3
{
  if (self->_activationPolicyForParticipantsBelow != a3)
  {
    self->_activationPolicyForParticipantsBelow = a3;
    [(SBFZStackParticipant *)self->_zStackParticipant setNeedsUpdatePreferencesWithReason:@"activationPolicyForParticipantsBelow changed"];
  }
}

- (void)zStackParticipantDidChange:(id)a3
{
  id v5 = a3;
  [(SBBarSwipeAffordanceController *)self _updateActiveState];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained zStackParticipantDidChange:v5];
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained zStackParticipant:v8 updatePreferences:v6];
  }
  else {
    [v6 setActivationPolicyForParticipantsBelow:self->_activationPolicyForParticipantsBelow];
  }
}

- (void)_beginTryingToBecomeActiveAffordance
{
  if (!self->_zStackParticipant && self->_zStackParticipantIdentifier != 31)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    v4 = [WeakRetained zStackResolver];
    id v5 = [v4 acquireParticipantWithIdentifier:self->_zStackParticipantIdentifier delegate:self];
    zStackParticipant = self->_zStackParticipant;
    self->_zStackParticipant = v5;

    [(SBBarSwipeAffordanceController *)self zStackParticipantDidChange:self->_zStackParticipant];
    barSwipeAffordanceView = self->_barSwipeAffordanceView;
    id v8 = objc_loadWeakRetained((id *)&self->_pointerClickDelegate);
    [(SBBarSwipeAffordanceView *)barSwipeAffordanceView setPointerClickDelegate:v8];
  }
}

- (void)_stopTryingToBecomeActiveAffordance
{
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant)
  {
    [(SBFZStackParticipant *)zStackParticipant invalidate];
    v4 = self->_zStackParticipant;
    self->_zStackParticipant = 0;
  }
}

- (void)_updateActiveState
{
  if ([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture]) {
    uint64_t v3 = [(SBBarSwipeAffordanceController *)self suppressAffordance] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  barSwipeAffordanceView = self->_barSwipeAffordanceView;
  [(SBBarSwipeAffordanceView *)barSwipeAffordanceView setActive:v3];
}

- (void)_keyboardDidShow:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v5 CGRectValue];
  BOOL IsEmpty = CGRectIsEmpty(v8);

  if (!IsEmpty)
  {
    [(SBBarSwipeAffordanceController *)self _setKeyboardHomeAffordanceVisible:1];
  }
}

- (void)_keyboardWillHide:(id)a3
{
}

- (void)_setKeyboardHomeAffordanceVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBBarSwipeAffordanceView *)self->_barSwipeAffordanceView keyboardHomeAffordanceAssertion];

  if (v3)
  {
    if (!v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        barSwipeAffordanceView = self->_barSwipeAffordanceView;
        v7 = [WeakRetained keyboardHomeAffordanceAssertionForBarSwipeAffordanceControlling:self];
        [(SBBarSwipeAffordanceView *)barSwipeAffordanceView setKeyboardHomeAffordanceAssertion:v7];
      }
    }
  }
  else if (v5)
  {
    CGRect v8 = self->_barSwipeAffordanceView;
    [(SBBarSwipeAffordanceView *)v8 setKeyboardHomeAffordanceAssertion:0];
  }
}

- (SBBarSwipeAffordanceControllingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBBarSwipeAffordanceControllingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBBarSwipeAffordanceView)barSwipeAffordanceView
{
  return self->_barSwipeAffordanceView;
}

- (BOOL)wantsToBeActiveAffordance
{
  return self->_wantsToBeActiveAffordance;
}

- (BOOL)suppressAffordance
{
  return self->_suppressAffordance;
}

- (int64_t)activationPolicyForParticipantsBelow
{
  return self->_activationPolicyForParticipantsBelow;
}

- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerClickDelegate);
  return (SBHomeGrabberPointerClickDelegate *)WeakRetained;
}

- (void)setPointerClickDelegate:(id)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_destroyWeak((id *)&self->_pointerClickDelegate);
  objc_storeStrong((id *)&self->_barSwipeAffordanceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end