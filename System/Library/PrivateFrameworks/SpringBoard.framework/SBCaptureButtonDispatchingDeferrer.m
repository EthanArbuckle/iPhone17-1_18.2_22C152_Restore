@interface SBCaptureButtonDispatchingDeferrer
- (SBCaptureButtonDispatchingDeferrer)initWithZStackResolver:(id)a3 restrictionCoordinator:(id)a4;
- (void)_deferCaptureButtonEventsToSceneWithIdentityToken:(id)a3 PID:(int)a4;
- (void)_processZStackParticipantSettings:(id)a3;
- (void)_stopDeferringCaptureButtonEvents;
- (void)_updateCaptureButtonDispatchingDeferringTarget;
- (void)captureButtonRestrictionChangedTo:(BOOL)a3;
- (void)dealloc;
- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4;
- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4;
@end

@implementation SBCaptureButtonDispatchingDeferrer

- (SBCaptureButtonDispatchingDeferrer)initWithZStackResolver:(id)a3 restrictionCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBCaptureButtonDispatchingDeferrer;
  v9 = [(SBCaptureButtonDispatchingDeferrer *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F4F2A0] sharedInstance];
    deliveryManager = v9->_deliveryManager;
    v9->_deliveryManager = (BKSHIDEventDeliveryManager *)v10;

    objc_storeStrong((id *)&v9->_zStackResolver, a3);
    uint64_t v12 = [v8 addObserver:v9];
    inhibitionObservation = v9->_inhibitionObservation;
    v9->_inhibitionObservation = (BSInvalidatable *)v12;

    v9->_inhibitedDueToRestrictionCoordinator = [v8 isCaptureButtonActionInhibited:0];
    v14 = [(SBFZStackResolver *)v9->_zStackResolver addObserver:v9 ofParticipantWithIdentifier:30];
    [(SBCaptureButtonDispatchingDeferrer *)v9 _processZStackParticipantSettings:v14];
    [(SBCaptureButtonDispatchingDeferrer *)v9 _updateCaptureButtonDispatchingDeferringTarget];
  }
  return v9;
}

- (void)dealloc
{
  [(SBFZStackResolver *)self->_zStackResolver removeObserver:self ofParticipantWithIdentifier:30];
  zStackResolver = self->_zStackResolver;
  self->_zStackResolver = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBCaptureButtonDispatchingDeferrer;
  [(SBCaptureButtonDispatchingDeferrer *)&v4 dealloc];
}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4
{
}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4
{
}

- (void)captureButtonRestrictionChangedTo:(BOOL)a3
{
  self->_inhibitedDueToRestrictionCoordinator = a3;
  [(SBCaptureButtonDispatchingDeferrer *)self _updateCaptureButtonDispatchingDeferringTarget];
}

- (void)_processZStackParticipantSettings:(id)a3
{
  id v6 = [a3 captureButtonFullFidelityEventRequestingScenes];
  objc_super v4 = [v6 lastObject];
  if ((BSEqualObjects() & 1) == 0)
  {
    [(FBScene *)self->_targetScene removeObserver:self];
    objc_storeStrong((id *)&self->_targetScene, v4);
    targetScene = self->_targetScene;
    if (targetScene) {
      [(FBScene *)targetScene addObserver:self];
    }
    [(SBCaptureButtonDispatchingDeferrer *)self _updateCaptureButtonDispatchingDeferringTarget];
  }
}

- (void)_updateCaptureButtonDispatchingDeferringTarget
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Selected scene requesting full-fidelity capture button events: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_deferCaptureButtonEventsToSceneWithIdentityToken:(id)a3 PID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self->_currentDeferralTargetPid != v4)
  {
    id v8 = SBLogCameraCaptureOverlay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = BSProcessDescriptionForPID();
      int v19 = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Deferring full-fidelity capture button events to: %@", (uint8_t *)&v19, 0xCu);
    }
    [(BSInvalidatable *)self->_deferringRuleAssertion invalidate];
    deferringRuleAssertion = self->_deferringRuleAssertion;
    self->_deferringRuleAssertion = 0;

    v11 = (void *)[MEMORY[0x1E4F4F358] new];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F4F280], "ui_cameraCaptureButtonEnvironment");
    [v11 setEnvironment:v12];
    v13 = (void *)[MEMORY[0x1E4F4F368] new];
    [v13 setPid:v4];
    v14 = (void *)MEMORY[0x1E4F4F290];
    v15 = [v7 stringRepresentation];
    objc_super v16 = [v14 tokenForString:v15];

    if (v16) {
      [v13 setToken:v16];
    }
    v17 = [(BKSHIDEventDeliveryManager *)self->_deliveryManager deferEventsMatchingPredicate:v11 toTarget:v13 withReason:@"Entitled Capture Button Consumer Active"];
    v18 = self->_deferringRuleAssertion;
    self->_deferringRuleAssertion = v17;

    self->_currentDeferralTargetPid = v4;
    objc_storeStrong((id *)&self->_currentDeferralSceneIdentityToken, a3);
  }
}

- (void)_stopDeferringCaptureButtonEvents
{
  if (self->_deferringRuleAssertion)
  {
    int v3 = SBLogCameraCaptureOverlay();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "No longer deferring full-fidelity capture button events.", v5, 2u);
    }

    [(BSInvalidatable *)self->_deferringRuleAssertion invalidate];
    deferringRuleAssertion = self->_deferringRuleAssertion;
    self->_deferringRuleAssertion = 0;

    self->_currentDeferralTargetPid = -1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inhibitionObservation, 0);
  objc_storeStrong((id *)&self->_deferringRuleAssertion, 0);
  objc_storeStrong((id *)&self->_targetScene, 0);
  objc_storeStrong((id *)&self->_currentDeferralSceneIdentityToken, 0);
  objc_storeStrong((id *)&self->_zStackResolver, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
}

@end