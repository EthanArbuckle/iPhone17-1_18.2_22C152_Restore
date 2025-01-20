@interface _PGBackgroundPIPServiceConnectionTarget
- (BOOL)isConnectionActive;
- (NSString)activitySessionIdentifier;
- (NSString)bundleIdentifier;
- (NSString)description;
- (_PGBackgroundPIPServiceConnectionTarget)initWithConnection:(id)a3 delegate:(id)a4;
- (_PGBackgroundPIPServiceConnectionTargetDelegate)delegate;
- (int64_t)state;
- (void)grantAuthorizationForActivitySessionWithIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (void)invalidate;
- (void)revokeAuthorization;
- (void)setDelegate:(id)a3;
- (void)transitionToStateIfPossible:(int64_t)a3;
@end

@implementation _PGBackgroundPIPServiceConnectionTarget

- (_PGBackgroundPIPServiceConnectionTarget)initWithConnection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PGBackgroundPIPServiceConnectionTarget;
  v9 = [(_PGBackgroundPIPServiceConnectionTarget *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (NSString)activitySessionIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_activitySessionIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)bundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_bundleIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_state = self->_lock_state;
  os_unfair_lock_unlock(p_lock);
  return lock_state;
}

- (void)transitionToStateIfPossible:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromPGBackgroundPIPAuthorizationState(a3);
    int v12 = 136315650;
    v13 = "-[_PGBackgroundPIPServiceConnectionTarget transitionToStateIfPossible:]";
    __int16 v14 = 2114;
    v15 = v6;
    __int16 v16 = 2114;
    v17 = self;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s requestedState: %{public}@ for %{public}@", (uint8_t *)&v12, 0x20u);
  }
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_state = self->_lock_state;
  if (lock_state >= a3)
  {
    os_unfair_lock_unlock(&self->_lock);
    if (lock_state <= a3) {
      return;
    }
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = NSStringFromPGBackgroundPIPAuthorizationState(a3);
      int v12 = 136315650;
      v13 = "-[_PGBackgroundPIPServiceConnectionTarget transitionToStateIfPossible:]";
      __int16 v14 = 2114;
      v15 = v9;
      __int16 v16 = 2114;
      v17 = self;
      _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%s Refusing requestedState: %{public}@ for %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    self->_int64_t lock_state = a3;
    os_unfair_lock_unlock(&self->_lock);
    if (a3 == 5)
    {
      if ([(_PGBackgroundPIPServiceConnectionTarget *)self isConnectionActive]) {
        [(BSServiceConnection *)self->_connection invalidate];
      }
      id v8 = [(_PGBackgroundPIPServiceConnectionTarget *)self delegate];
      [v8 backgroundPIPTargetDidInvalidate:self];
    }
    else
    {
      v10 = [(BSServiceConnection *)self->_connection remoteTarget];
      v11 = [NSNumber numberWithInteger:a3];
      [v10 transitionToState:v11];

      if (a3 != 1) {
        return;
      }
      id v8 = [(_PGBackgroundPIPServiceConnectionTarget *)self delegate];
      [v8 backgroundPIPTargetRequestsAuthorization:self];
    }
  }
}

- (BOOL)isConnectionActive
{
  v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)grantAuthorizationForActivitySessionWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_state)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_activitySessionIdentifier, a3);
    objc_storeStrong((id *)&self->_lock_bundleIdentifier, a4);
    os_unfair_lock_unlock(&self->_lock);
    [(_PGBackgroundPIPServiceConnectionTarget *)self transitionToStateIfPossible:1];
  }
}

- (void)revokeAuthorization
{
}

- (void)invalidate
{
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_state = self->_lock_state;
  v5 = self->_lock_activitySessionIdentifier;
  v6 = NSStringFromPGBackgroundPIPAuthorizationState(lock_state);
  id v7 = self->_lock_bundleIdentifier;
  os_unfair_lock_unlock(p_lock);
  id v8 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)_PGBackgroundPIPServiceConnectionTarget;
  v9 = [(_PGBackgroundPIPServiceConnectionTarget *)&v12 description];
  v10 = [v8 stringWithFormat:@"%@ cxn: %@ activitySessionIdentifier: %@ bundleId: %@ state: %@", v9, self->_connection, v5, v7, v6];

  return (NSString *)v10;
}

- (_PGBackgroundPIPServiceConnectionTargetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_PGBackgroundPIPServiceConnectionTargetDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lock_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_lock_activitySessionIdentifier, 0);
}

@end