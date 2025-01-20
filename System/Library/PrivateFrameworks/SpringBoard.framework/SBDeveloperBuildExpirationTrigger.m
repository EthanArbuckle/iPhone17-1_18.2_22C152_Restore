@interface SBDeveloperBuildExpirationTrigger
- (SBDeveloperBuildExpirationTrigger)initWithAlertItemsController:(id)a3 eventSource:(id)a4;
- (id)_initWithAlertItemsController:(id)a3 eventSource:(id)a4 expirationDate:(id)a5;
- (void)_coverSheetDidDismiss:(id)a3;
- (void)dealloc;
- (void)eventSource:(id)a3 didFinishTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7;
- (void)showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:(BOOL)a3 toLauncher:(BOOL)a4;
@end

@implementation SBDeveloperBuildExpirationTrigger

- (id)_initWithAlertItemsController:(id)a3 eventSource:(id)a4 expirationDate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (!v12)
    {
LABEL_8:
      v16 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBDeveloperBuildExpirationTrigger.m", 38, @"Invalid parameter not satisfying: %@", @"alertItemsController" object file lineNumber description];

    if (!v13) {
      goto LABEL_8;
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SBDeveloperBuildExpirationTrigger;
  v14 = [(SBDeveloperBuildExpirationTrigger *)&v19 init];
  self = v14;
  if (!v14) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v14->_expirationDate, a5);
  objc_storeStrong((id *)&self->_alertItemsController, a3);
  if (v11)
  {
    objc_storeStrong((id *)&self->_eventSource, a4);
    [(SBAppInteractionEventSourceProviding *)self->_eventSource addObserver:self];
  }
  v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 addObserver:self selector:sel__coverSheetDidDismiss_ name:@"SBCoverSheetDidDismissNotification" object:0];

  self = self;
  v16 = self;
LABEL_9:

  return v16;
}

- (SBDeveloperBuildExpirationTrigger)initWithAlertItemsController:(id)a3 eventSource:(id)a4
{
  return (SBDeveloperBuildExpirationTrigger *)[(SBDeveloperBuildExpirationTrigger *)self _initWithAlertItemsController:a3 eventSource:a4 expirationDate:0];
}

- (void)dealloc
{
  eventSource = self->_eventSource;
  if (eventSource) {
    [(SBAppInteractionEventSourceProviding *)eventSource removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBDeveloperBuildExpirationTrigger;
  [(SBDeveloperBuildExpirationTrigger *)&v4 dealloc];
}

- (void)showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:(BOOL)a3 toLauncher:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = v7;
  if (self->_expirationDate)
  {
    v25 = v7;
    int v9 = objc_msgSend(v7, "isAfterDate:");
    if ((v9 & 1) != 0 || !v4)
    {
      v8 = v25;
      if ((v9 & v5) == 1)
      {
        objc_super v19 = objc_alloc_init(SBDeveloperBuildExpirationAlert);
        v8 = v25;
        v18 = v19;
        if (v19)
        {
LABEL_30:
          [(SBAlertItemsController *)self->_alertItemsController deactivateAlertItemsOfClass:objc_opt_class()];
          [(SBAlertItemsController *)self->_alertItemsController activateAlertItem:v18];

          v8 = v25;
        }
      }
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v11 = [v10 timeZone];
      double v12 = (double)[v11 secondsFromGMT];

      v13 = [(NSDate *)self->_expirationDate dateByAddingTimeInterval:-v12];
      uint64_t v14 = +[SBDefaults localDefaults];
      v15 = [(id)v14 softwareUpdateDefaults];

      LOBYTE(v14) = [v15 hasDeveloperInstallBrickAlertShown7DayWarning];
      char v16 = [v15 hasDeveloperInstallBrickAlertShown3DayWarning];
      char v17 = [v15 hasDeveloperInstallBrickAlertShownTomorrowWarning];
      if (v14)
      {
        v18 = 0;
      }
      else
      {
        v20 = objc_msgSend(v25, "bs_dateByAddingDays:", 7);
        if ([v10 date:v20 isSameDayAsDate:v13])
        {
          v18 = objc_alloc_init(SBDeveloperBuildExpirationAlert);
          [v15 setDeveloperInstallBrickAlertShown7DayWarning:1];
        }
        else
        {
          v18 = 0;
        }
      }
      if (v18) {
        char v21 = 1;
      }
      else {
        char v21 = v16;
      }
      if ((v21 & 1) == 0)
      {
        v22 = objc_msgSend(v25, "bs_dateByAddingDays:", 3);
        if ([v10 date:v22 isSameDayAsDate:v13])
        {
          v18 = objc_alloc_init(SBDeveloperBuildExpirationAlert);
          [v15 setDeveloperInstallBrickAlertShown3DayWarning:1];
        }
        else
        {
          v18 = 0;
        }
      }
      if (v18) {
        char v23 = 1;
      }
      else {
        char v23 = v17;
      }
      if ((v23 & 1) == 0)
      {
        v24 = objc_msgSend(v25, "bs_dateByAddingDays:", 1);
        if ([v10 date:v24 isSameDayAsDate:v13])
        {
          v18 = objc_alloc_init(SBDeveloperBuildExpirationAlert);
          [v15 setDeveloperInstallBrickAlertShownTomorrowWarning:1];
        }
        else
        {
          v18 = 0;
        }
      }
      v8 = v25;
      if (v18) {
        goto LABEL_30;
      }
    }
  }
}

- (void)eventSource:(id)a3 didFinishTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7
{
  if (a4 == 1) {
    -[SBDeveloperBuildExpirationTrigger showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:toLauncher:](self, "showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:toLauncher:", 0, 1, a5, a6, a7);
  }
}

- (void)_coverSheetDidDismiss:(id)a3
{
  id v4 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
  -[SBDeveloperBuildExpirationTrigger showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:toLauncher:](self, "showDeveloperBuildExpirationAlertIfNecessaryFromLockscreen:toLauncher:", 1, [v4 unlockedEnvironmentMode] == 3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_eventSource, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
}

@end