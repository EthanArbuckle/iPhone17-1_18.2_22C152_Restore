@interface SBIdleTimerPolicyAggregator
- (SBBacklightController)_backlightController;
- (SBDeviceUnlockAggdLogger)_logger;
- (SBIdleTimer)idleTimer;
- (SBIdleTimerPolicyAggregator)initWithBacklightController:(id)a3 proximitySensorManager:(id)a4 idleEventHandler:(id)a5;
- (id)_initWithBacklightController:(id)a3 proximitySensorManager:(id)a4 idleEventHandler:(id)a5 globalStateMonitor:(id)a6 unlockLogger:(id)a7;
- (void)_setIdleTimer:(id)a3;
- (void)idleTimerDidExpire:(id)a3;
- (void)idleTimerDidRefresh:(id)a3;
- (void)idleTimerDidResetForUserAttention:(id)a3;
- (void)idleTimerDidWarn:(id)a3;
- (void)idleTimerGlobalCoordinator:(id)a3 didActivateIdleTimer:(id)a4;
@end

@implementation SBIdleTimerPolicyAggregator

- (SBIdleTimerPolicyAggregator)initWithBacklightController:(id)a3 proximitySensorManager:(id)a4 idleEventHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[SBIdleTimerGlobalStateMonitor sharedInstance];
  v12 = objc_alloc_init(SBDeviceUnlockAggdLogger);
  v13 = [(SBIdleTimerPolicyAggregator *)self _initWithBacklightController:v10 proximitySensorManager:v9 idleEventHandler:v8 globalStateMonitor:v11 unlockLogger:v12];

  return v13;
}

- (id)_initWithBacklightController:(id)a3 proximitySensorManager:(id)a4 idleEventHandler:(id)a5 globalStateMonitor:(id)a6 unlockLogger:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBIdleTimerPolicyAggregator;
  v17 = [(SBIdleTimerPolicyAggregator *)&v21 init];
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_backlightController, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 5, a6);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 7, a7);
  }

  return p_isa;
}

- (void)idleTimerDidRefresh:(id)a3
{
  if ([(SBBacklightController *)self->_backlightController screenIsDim])
  {
    id v4 = [(SBIdleTimerPolicyAggregator *)self _backlightController];
    [v4 _undimFromSource:8];
  }
}

- (void)idleTimerDidExpire:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(SBIdleTimerIdleEventHandler *)self->_idleEventHandler handleIdleTimerDidExpire] & 1) == 0)
  {
    _SBSAutolockTimerPostExternalChangeNotification();
    id v4 = [(SBIdleTimerPolicyAggregator *)self _backlightController];
    [v4 _startFadeOutAnimationFromLockSource:15];
  }
}

- (void)idleTimerDidResetForUserAttention:(id)a3
{
  if (((objc_opt_respondsToSelector() & 1) == 0
     || ([(SBIdleTimerIdleEventHandler *)self->_idleEventHandler handleIdleTimerUserAttentionDidReset] & 1) == 0)&& [(SBBacklightController *)self->_backlightController screenIsDim])
  {
    id v4 = [(SBIdleTimerPolicyAggregator *)self _backlightController];
    [v4 _undimFromSource:8];

    id v5 = [(SBIdleTimerPolicyAggregator *)self _logger];
    [v5 logUserResetIdleTimer];
  }
}

- (void)idleTimerDidWarn:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(SBIdleTimerIdleEventHandler *)self->_idleEventHandler handleIdleTimerDidWarn] & 1) == 0)
  {
    BOOL v4 = [(SBProximitySensorManager *)self->_proximitySensorManager isObjectInProximity];
    int64_t v5 = [(SBBacklightController *)self->_backlightController backlightState];
    if (!v4 && v5 == 1)
    {
      [(SBBacklightController *)self->_backlightController setBacklightState:2 source:8 animated:1 completion:0];
      v6 = [(SBIdleTimerPolicyAggregator *)self _logger];
      [v6 logIdleTimerScreenDimWarning];

      _SBSAutolockTimerPostExternalChangeNotification();
    }
  }
}

- (void)idleTimerGlobalCoordinator:(id)a3 didActivateIdleTimer:(id)a4
{
  [(SBIdleTimerPolicyAggregator *)self _setIdleTimer:a4];
  int64_t v5 = +[SBScreenLongevityController sharedInstanceIfExists];
  [v5 evaluateEnablement];

  if ([(SBBacklightController *)self->_backlightController screenIsDim])
  {
    id v6 = [(SBIdleTimerPolicyAggregator *)self _backlightController];
    [v6 _undimFromSource:8];
  }
}

- (void)_setIdleTimer:(id)a3
{
  BOOL v4 = (SBIdleTimer *)a3;
  [(SBIdleTimer *)self->_idleTimer removeIdleTimerObserver:self];
  idleTimer = self->_idleTimer;
  self->_idleTimer = v4;
  id v6 = v4;

  [(SBIdleTimer *)v6 addIdleTimerObserver:self];
}

- (SBDeviceUnlockAggdLogger)_logger
{
  return self->_logger;
}

- (SBBacklightController)_backlightController
{
  return self->_backlightController;
}

- (SBIdleTimer)idleTimer
{
  return self->_idleTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_globalStateMonitor, 0);
  objc_storeStrong((id *)&self->_idleEventHandler, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
}

@end