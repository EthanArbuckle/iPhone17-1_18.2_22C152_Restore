@interface SBDashBoardHomeAffordanceControllerClientBridge
- (SBDashBoardHomeAffordanceControllerClientBridge)initWithCoverSheetHomeGestureParticipant:(id)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBDashBoardHomeAffordanceControllerClientBridge

- (SBDashBoardHomeAffordanceControllerClientBridge)initWithCoverSheetHomeGestureParticipant:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDashBoardHomeAffordanceControllerClientBridge;
  v5 = [(SBDashBoardHomeAffordanceControllerClientBridge *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_coverSheetHomeGestureParticipant, v4);
  }

  return v6;
}

- (void)zStackParticipantDidChange:(id)a3
{
  p_coverSheetHomeGestureParticipant = &self->_coverSheetHomeGestureParticipant;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_coverSheetHomeGestureParticipant);
  objc_msgSend(WeakRetained, "homeGestureParticipantOwningHomeGestureDidChange:ownsHomeGesture:", v4, objc_msgSend(v4, "ownsHomeGesture"));
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
}

- (void).cxx_destruct
{
}

@end