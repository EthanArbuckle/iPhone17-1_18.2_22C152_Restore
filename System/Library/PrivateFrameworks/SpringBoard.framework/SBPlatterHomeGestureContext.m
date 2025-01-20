@interface SBPlatterHomeGestureContext
- (BOOL)ownsHomeGesture;
- (BOOL)wantsToBeActiveAffordance;
- (SBPlatterHomeGestureContext)initWithParticipant:(id)a3 participantIdentifier:(int64_t)a4 windowScene:(id)a5;
- (SBPlatterHomeGestureContextDelegate)delegate;
- (SBUIPresentableHomeGestureParticipant)participant;
- (id)hideAnimationSettingsForBarSwipeAffordanceView:(id)a3;
- (id)keyboardHomeAffordanceAssertionForBarSwipeAffordanceControlling:(id)a3;
- (id)platterBarSwipeAffordanceViewForParticipant:(id)a3;
- (id)unhideAnimationSettingsForBarSwipeAffordanceView:(id)a3;
- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4;
- (void)_setOwnsHomeGesture:(BOOL)a3;
- (void)becomeActiveAffordanceIfPossible:(BOOL)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setWantsHomeGesture:(BOOL)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBPlatterHomeGestureContext

- (SBPlatterHomeGestureContext)initWithParticipant:(id)a3 participantIdentifier:(int64_t)a4 windowScene:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBPlatterHomeGestureContext.m", 37, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBPlatterHomeGestureContext.m", 38, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)SBPlatterHomeGestureContext;
  v11 = [(SBPlatterHomeGestureContext *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_participant, v9);
    v13 = [[SBBarSwipeAffordanceController alloc] initWithZStackParticipantIdentifier:a4 windowScene:v10];
    barSwipeAffordanceController = v12->_barSwipeAffordanceController;
    v12->_barSwipeAffordanceController = v13;

    [(SBBarSwipeAffordanceController *)v12->_barSwipeAffordanceController setDelegate:v12];
  }

  return v12;
}

- (void)dealloc
{
  [(SBPlatterHomeGestureContext *)self becomeActiveAffordanceIfPossible:0];
  v3 = [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController barSwipeAffordanceView];
  [v3 removeFromSuperview];

  [(BSInvalidatable *)self->_gestureRecognizerPriorityAssertion invalidate];
  gestureRecognizerPriorityAssertion = self->_gestureRecognizerPriorityAssertion;
  self->_gestureRecognizerPriorityAssertion = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBPlatterHomeGestureContext;
  [(SBPlatterHomeGestureContext *)&v5 dealloc];
}

- (void)becomeActiveAffordanceIfPossible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController wantsToBeActiveAffordance] != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
    v6 = SBLogBanners();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = @"relinquish";
      if (v3) {
        v7 = @"obtain";
      }
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 2114;
      id v12 = WeakRetained;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Banner participant asked to %{public}@ home gesture: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (!v3)
    {
      v8 = [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController barSwipeAffordanceView];
      [v8 setDelegate:0];
    }
    [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController setWantsToBeActiveAffordance:v3];
  }
}

- (BOOL)ownsHomeGesture
{
  v2 = [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController zStackParticipant];
  char v3 = [v2 ownsHomeGesture];

  return v3;
}

- (void)setWantsHomeGesture:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_wantsToBeActiveAffordance != a3)
  {
    self->_wantsToBeActiveAffordance = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
    objc_super v5 = SBLogBanners();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = @"obtain";
      if (!self->_wantsToBeActiveAffordance) {
        v6 = @"relinquish";
      }
      int v8 = 138543618;
      int v9 = v6;
      __int16 v10 = 2114;
      id v11 = WeakRetained;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Banner participant wants to %{public}@ home gesture: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [v7 wantsHomeGestureDidChangeForBannerManagerHomeGestureContext:self];
    }
  }
}

- (id)platterBarSwipeAffordanceViewForParticipant:(id)a3
{
  return [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController barSwipeAffordanceView];
}

- (void)zStackParticipantDidChange:(id)a3
{
  BOOL v4 = [(SBPlatterHomeGestureContext *)self ownsHomeGesture];
  [(SBPlatterHomeGestureContext *)self _setOwnsHomeGesture:v4];
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
}

- (id)keyboardHomeAffordanceAssertionForBarSwipeAffordanceControlling:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (![(SBPlatterHomeGestureContext *)self wantsToBeActiveAffordance]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    goto LABEL_11;
  }
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI]) {
    goto LABEL_12;
  }
  objc_super v5 = [MEMORY[0x1E4F62490] keyboardScene];
  if (!v5) {
    goto LABEL_12;
  }
  v6 = v5;
  id v7 = [v5 clientSettings];
  int v8 = [v7 preferredSceneHostIdentity];
  id v9 = objc_loadWeakRetained((id *)&self->_participant);
  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10) {
    id v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  v14 = [v13 scene];

  v15 = [v14 identityToken];
  char v16 = [v8 isEqual:v15];

  if ((v16 & 1) == 0)
  {
LABEL_12:
    v17 = [WeakRetained keyboardHomeAffordanceAssertionForBannerManagerHomeGestureContext:self];
  }
  else
  {
LABEL_11:
    v17 = 0;
  }

  return v17;
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 3) {
    return 0;
  }
  else {
    return a4 + 110;
  }
}

- (id)hideAnimationSettingsForBarSwipeAffordanceView:(id)a3
{
  char v3 = objc_msgSend(MEMORY[0x1E4FA5F28], "rootSettings", a3);
  BOOL v4 = [v3 hideForHomeGestureOwnershipAnimationSettings];
  objc_super v5 = [v4 BSAnimationSettings];

  return v5;
}

- (id)unhideAnimationSettingsForBarSwipeAffordanceView:(id)a3
{
  char v3 = objc_msgSend(MEMORY[0x1E4FA5F28], "rootSettings", a3);
  BOOL v4 = [v3 unhideForHomeGestureOwnershipAnimationSettings];
  objc_super v5 = [v4 BSAnimationSettings];

  return v5;
}

- (void)_setOwnsHomeGesture:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController barSwipeAffordanceView];
  v6 = v5;
  if (v3) {
    id v7 = self;
  }
  else {
    id v7 = 0;
  }
  [v5 setDelegate:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  id v9 = SBLogBanners();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"relinquish";
    if (v3) {
      uint64_t v10 = @"obtain";
    }
    int v15 = 138543618;
    char v16 = v10;
    __int16 v17 = 2114;
    id v18 = WeakRetained;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Banner participant did %{public}@ home gesture: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  if (objc_opt_respondsToSelector()) {
    [WeakRetained homeGestureOwnershipDidChange:v3];
  }
  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [v11 bannerManagerHomeGestureContext:self homeGestureOwnershipDidChange:v3];
  }
  gestureRecognizerPriorityAssertion = self->_gestureRecognizerPriorityAssertion;
  if (v3)
  {
    if (!gestureRecognizerPriorityAssertion && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v13 = [v11 gestureRecognizerPriorityAssertionForBannerManagerHomeGestureContext:self];
LABEL_18:
      v14 = self->_gestureRecognizerPriorityAssertion;
      self->_gestureRecognizerPriorityAssertion = v13;
    }
  }
  else if (gestureRecognizerPriorityAssertion)
  {
    [(BSInvalidatable *)gestureRecognizerPriorityAssertion invalidate];
    id v13 = 0;
    goto LABEL_18;
  }
}

- (SBPlatterHomeGestureContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPlatterHomeGestureContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBUIPresentableHomeGestureParticipant)participant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  return (SBUIPresentableHomeGestureParticipant *)WeakRetained;
}

- (BOOL)wantsToBeActiveAffordance
{
  return self->_wantsToBeActiveAffordance;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_participant);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gestureRecognizerPriorityAssertion, 0);
  objc_storeStrong((id *)&self->_barSwipeAffordanceController, 0);
}

@end