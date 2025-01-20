@interface SBDashBoardModalHomeAffordanceController
- (BOOL)ownsHomeGesture;
- (BOOL)registerHomeGestureParticipant:(id)a3;
- (SBDashBoardModalHomeAffordanceController)init;
- (UIScreenEdgePanGestureRecognizer)homeGestureRecognizer;
- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3;
- (void)setHomeGestureRecognizer:(id)a3;
- (void)setNeedsUpdateZStackPreferencesWithReason:(id)a3;
- (void)unregisterHomeGestureParticipant;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBDashBoardModalHomeAffordanceController

- (SBDashBoardModalHomeAffordanceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardModalHomeAffordanceController;
  v2 = [(SBDashBoardModalHomeAffordanceController *)&v6 init];
  if (v2)
  {
    v3 = [(id)SBApp windowSceneManager];
    v4 = [v3 embeddedDisplayWindowScene];
    objc_storeWeak((id *)&v2->_windowScene, v4);
  }
  return v2;
}

- (BOOL)registerHomeGestureParticipant:(id)a3
{
  zStackParticipant = self->_zStackParticipant;
  if (!zStackParticipant)
  {
    p_windowScene = &self->_windowScene;
    id v6 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_windowScene);
    v8 = [WeakRetained zStackResolver];
    v9 = [v8 acquireParticipantWithIdentifier:10 delegate:self];
    v10 = self->_zStackParticipant;
    self->_zStackParticipant = v9;

    v11 = objc_alloc_init(SBHomeGrabberView);
    [(SBHomeGrabberView *)v11 setDelegate:self];
    [(SBHomeGrabberView *)v11 setAutoHides:1];
    [(SBHomeGrabberView *)v11 setHomeAffordanceInteractionEnabled:[(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture]];
    objc_storeWeak((id *)&self->_homeGrabberView, v11);
    [v6 addGrabberView:v11];
    objc_storeWeak((id *)&self->_homeGestureParticipant, v6);
  }
  return zStackParticipant == 0;
}

- (void)unregisterHomeGestureParticipant
{
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant)
  {
    [(SBFZStackParticipant *)zStackParticipant invalidate];
    v4 = self->_zStackParticipant;
    self->_zStackParticipant = 0;
  }
}

- (BOOL)ownsHomeGesture
{
  return [(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture];
}

- (void)setHomeGestureRecognizer:(id)a3
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v6 = [WeakRetained systemGestureManager];

  homeGestureRecognizer = self->_homeGestureRecognizer;
  p_homeGestureRecognizer = &self->_homeGestureRecognizer;
  v7 = homeGestureRecognizer;
  if (v11)
  {
    if (!v7)
    {
      objc_storeStrong((id *)p_homeGestureRecognizer, a3);
      [v6 addGestureRecognizer:*p_homeGestureRecognizer withType:93];
    }
  }
  else
  {
    [v6 removeGestureRecognizer:v7];
    v10 = *p_homeGestureRecognizer;
    *p_homeGestureRecognizer = 0;
  }
}

- (void)setNeedsUpdateZStackPreferencesWithReason:(id)a3
{
}

- (void)zStackParticipantDidChange:(id)a3
{
  p_homeGestureParticipant = &self->_homeGestureParticipant;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_homeGestureParticipant);
  objc_msgSend(WeakRetained, "homeGestureParticipantOwningHomeGestureDidChange:", objc_msgSend(v5, "ownsHomeGesture"));

  id v8 = objc_loadWeakRetained((id *)&self->_homeGrabberView);
  uint64_t v7 = [v5 ownsHomeGesture];

  [v8 setHomeAffordanceInteractionEnabled:v7];
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [v6 setActivationPolicyForParticipantsBelow:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureParticipant);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained homeGestureParticipantUpdateZStackPreferences:v6 forZStackParticipant:v8];
  }
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureParticipant);
  double v6 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained additionalEdgeSpacingForGrabberView:v4];
    double v6 = v7;
  }

  return v6;
}

- (UIScreenEdgePanGestureRecognizer)homeGestureRecognizer
{
  return self->_homeGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_homeGrabberView);
  objc_destroyWeak((id *)&self->_homeGestureParticipant);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_destroyWeak((id *)&self->_windowScene);
}

@end