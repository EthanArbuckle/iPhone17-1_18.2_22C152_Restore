@interface SBDashBoardIdleTimerController
- (BOOL)handleEvent:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (NSString)coverSheetIdentifier;
- (SBDashBoardIdleTimerController)initWithCoverSheetViewController:(id)a3;
- (SBIdleTimerCoordinating)idleTimerCoordinator;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)dashBoardIdleTimerProvider:(id)a3 didProposeBehavior:(id)a4 reason:(id)a5;
- (id)requestIdleTimerBehaviorForReason:(id)a3;
- (int64_t)participantState;
- (void)addIdleTimerDisabledAssertionReason:(id)a3;
- (void)dealloc;
- (void)idleTimerDidChange:(id)a3;
- (void)idleTimerDidExpire:(id)a3;
- (void)idleTimerDidRefresh:(id)a3;
- (void)idleTimerDidWarn:(id)a3;
- (void)idleTimerWillRefresh:(id)a3;
- (void)removeIdleTimerDisabledAssertionReason:(id)a3;
- (void)resetIdleTimerIfTopMost;
- (void)setIdleTimerCoordinator:(id)a3;
@end

@implementation SBDashBoardIdleTimerController

- (SBDashBoardIdleTimerController)initWithCoverSheetViewController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardIdleTimerController;
  v6 = [(SBDashBoardIdleTimerController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
    v8 = [[SBDashBoardIdleTimerProvider alloc] initWithDelegate:v7];
    dashBoardIdleTimerProvider = v7->_dashBoardIdleTimerProvider;
    v7->_dashBoardIdleTimerProvider = v8;

    [(CSCoverSheetViewController *)v7->_coverSheetViewController registerExternalEventHandler:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalEventHandler:self];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardIdleTimerController;
  [(SBDashBoardIdleTimerController *)&v3 dealloc];
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  char v6 = 0;
  if (v5 <= 23)
  {
    switch(v5)
    {
      case 2:
        dashBoardIdleTimerProvider = self->_dashBoardIdleTimerProvider;
        v12 = [(CSCoverSheetViewController *)self->_coverSheetViewController activeBehavior];
        [(SBDashBoardIdleTimerProvider *)dashBoardIdleTimerProvider updateIdleTimerWithIdleDimProvider:v12 reason:@"BehaviorChanged"];

        goto LABEL_18;
      case 7:
        v9 = self->_dashBoardIdleTimerProvider;
        v10 = @"SBDashBoardIsDeactivated";
        goto LABEL_17;
      case 8:
        v7 = self->_dashBoardIdleTimerProvider;
        v8 = @"SBDashBoardIsDeactivated";
LABEL_14:
        [(SBDashBoardIdleTimerProvider *)v7 removeDisabledIdleTimerAssertionReason:v8];
LABEL_18:
        char v6 = [v4 isConsumable];
        break;
    }
  }
  else
  {
    if (v5 <= 37)
    {
      if (v5 != 24)
      {
        if (v5 != 25) {
          goto LABEL_19;
        }
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    if (v5 == 38)
    {
LABEL_13:
      v7 = self->_dashBoardIdleTimerProvider;
      v8 = @"SBDashBoardScreenOff";
      goto LABEL_14;
    }
    if (v5 == 39)
    {
LABEL_12:
      v9 = self->_dashBoardIdleTimerProvider;
      v10 = @"SBDashBoardScreenOff";
LABEL_17:
      [(SBDashBoardIdleTimerProvider *)v9 addDisabledIdleTimerAssertionReason:v10];
      goto LABEL_18;
    }
  }
LABEL_19:

  return v6;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return [(SBDashBoardIdleTimerController *)self requestIdleTimerBehaviorForReason:@"IdleTimerCoordinatorRequested"];
}

- (void)resetIdleTimerIfTopMost
{
  objc_super v3 = +[SBWorkspace mainWorkspace];
  id v4 = [v3 transientOverlayPresentationManager];
  char v5 = [v4 hasActivePresentation];

  if (v5)
  {
    char v6 = [MEMORY[0x1E4F5E408] rootSettings];
    v7 = [v6 idleTimerSettings];
    int v8 = [v7 increaseNotificationScrollLogging];

    if (v8)
    {
      v9 = SBLogIdleTimer();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v11 = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[IdleTimerController] Not frontmost, not resetting", v11, 2u);
      }
    }
  }
  else
  {
    dashBoardIdleTimerProvider = self->_dashBoardIdleTimerProvider;
    [(SBDashBoardIdleTimerProvider *)dashBoardIdleTimerProvider resetIdleTimer];
  }
}

- (void)idleTimerDidRefresh:(id)a3
{
}

- (void)idleTimerDidExpire:(id)a3
{
}

- (void)idleTimerDidWarn:(id)a3
{
}

- (void)idleTimerDidChange:(id)a3
{
}

- (void)idleTimerWillRefresh:(id)a3
{
}

- (id)dashBoardIdleTimerProvider:(id)a3 didProposeBehavior:(id)a4 reason:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(SBDashBoardIdleTimerController *)self idleTimerCoordinator];
  v10 = v9;
  if (v9)
  {
    objc_super v11 = [v9 idleTimerProvider:self didProposeBehavior:v7 forReason:v8];
  }
  else
  {
    objc_super v11 = objc_alloc_init(SBDisabledIdleTimer);
  }
  v12 = v11;

  return v12;
}

- (id)requestIdleTimerBehaviorForReason:(id)a3
{
  return [(SBDashBoardIdleTimerProvider *)self->_dashBoardIdleTimerProvider effectiveIdleTimerBehavior];
}

- (void)addIdleTimerDisabledAssertionReason:(id)a3
{
}

- (void)removeIdleTimerDisabledAssertionReason:(id)a3
{
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  return (SBIdleTimerCoordinating *)WeakRetained;
}

- (void)setIdleTimerCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_dashBoardIdleTimerProvider, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end