@interface SBSLockScreenService
- (SBSLockScreenService)init;
- (id)preventPasscodeLockWithReason:(id)a3;
- (id)preventSpuriousScreenUndimWithReason:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)launchEmergencyDialerWithCompletion:(id)a3;
- (void)lockDeviceAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)migrateIncomingNotificationsToHistory;
- (void)requestPasscodeCheckUIWithOptions:(id)a3 withCompletion:(id)a4;
- (void)requestPasscodeUnlockUIWithOptions:(id)a3 withCompletion:(id)a4;
@end

@implementation SBSLockScreenService

- (SBSLockScreenService)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBSLockScreenService;
  v2 = [(SBSLockScreenService *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    lock_connection = v3->_lock_connection;
    v3->_lock_connection = (SBSLockScreenServiceConnection *)v4;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_lock_connection)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBSLockScreenService.m" lineNumber:238 description:@"invalidate not called before dealloc"];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBSLockScreenService;
  [(SBSLockScreenService *)&v5 dealloc];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_connection = self->_lock_connection;
  self->_lock_connection = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)launchEmergencyDialerWithCompletion:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_super v5 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBSLockScreenService.m" lineNumber:254 description:@"called launchEmergencyDialerWithCompletion: after invalidation"];
  }
  [(SBSLockScreenServiceConnection *)v5 launchEmergencyDialerWithCompletion:v7];
}

- (void)requestPasscodeUnlockUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBSLockScreenService.m" lineNumber:263 description:@"called requestPasscodeUnlockUIWithOptions:withCompletion: after invalidation"];
  }
  [(SBSLockScreenServiceConnection *)v8 requestPasscodeUnlockUIWithOptions:v10 withCompletion:v7];
}

- (void)requestPasscodeCheckUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBSLockScreenService.m" lineNumber:272 description:@"called requestPasscodeCheckUIWithOptions:withCompletion: after invalidation"];
  }
  [(SBSLockScreenServiceConnection *)v8 requestPasscodeCheckUIWithOptions:v10 withCompletion:v7];
}

- (id)preventPasscodeLockWithReason:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBSLockScreenService.m" lineNumber:281 description:@"called preventPasscodeLockWithReason: after invalidation"];
  }
  id v7 = (void *)[v5 copy];
  v8 = [(SBSLockScreenServiceConnection *)v6 preventPasscodeLockWithReason:v7];

  return v8;
}

- (id)preventSpuriousScreenUndimWithReason:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBSLockScreenService.m" lineNumber:290 description:@"called preventSpuriousScreenUndimWithReason: after invalidation"];
  }
  id v7 = (void *)[v5 copy];
  v8 = [(SBSLockScreenServiceConnection *)v6 preventSpuriousScreenUndimWithReason:v7];

  return v8;
}

- (void)lockDeviceAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v7 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBSLockScreenService.m" lineNumber:299 description:@"called lockDeviceAnimated:withCompletion: after invalidation"];
  }
  [(SBSLockScreenServiceConnection *)v7 lockDeviceAnimated:v4 withCompletion:v9];
}

- (void)migrateIncomingNotificationsToHistory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = self->_lock_connection;
  os_unfair_lock_unlock(p_lock);
  id v5 = v7;
  if (!v7)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBSLockScreenService.m" lineNumber:308 description:@"called migrateIncomingNotificationsToHistory after invalidation"];

    id v5 = 0;
  }
  [(SBSLockScreenServiceConnection *)v5 migrateIncomingNotificationsToHistory];
}

- (void).cxx_destruct
{
}

@end