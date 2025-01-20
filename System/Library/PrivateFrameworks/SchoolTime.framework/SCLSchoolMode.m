@interface SCLSchoolMode
- (BOOL)isLoaded;
- (NSString)identifier;
- (SCLScheduleSettings)scheduleSettings;
- (SCLSchoolMode)init;
- (SCLSchoolMode)initWithConfiguration:(id)a3;
- (SCLSchoolMode)initWithIdentifier:(id)a3;
- (SCLSchoolMode)initWithIdentifier:(id)a3 delegate:(id)a4;
- (SCLSchoolMode)initWithIdentifier:(id)a3 pairingID:(id)a4 delegate:(id)a5;
- (SCLState)state;
- (id)delegate;
- (unint64_t)resumeState;
- (void)_assertQueueIfReady;
- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4;
- (void)applyScheduleSettings:(id)a3 completion:(id)a4;
- (void)client:(id)a3 didLoadScheduleSettings:(id)a4;
- (void)client:(id)a3 didUpdateScheduleSettings:(id)a4;
- (void)client:(id)a3 didUpdateToState:(id)a4 fromState:(id)a5;
- (void)clientDidChangeUnlockHistory:(id)a3;
- (void)dealloc;
- (void)deleteHistoryWithCompletion:(id)a3;
- (void)dumpState;
- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3;
- (void)noteSignificantUserInteraction;
- (void)resume;
- (void)setActive:(BOOL)a3 completion:(id)a4;
- (void)setResumeState:(unint64_t)a3;
- (void)triggerRemoteSync;
@end

@implementation SCLSchoolMode

- (SCLSchoolMode)init
{
}

- (SCLSchoolMode)initWithIdentifier:(id)a3
{
  return [(SCLSchoolMode *)self initWithIdentifier:a3 delegate:0];
}

- (SCLSchoolMode)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = SCLAutoUpdatingPairingID();
  v9 = [(SCLSchoolMode *)self initWithIdentifier:v7 pairingID:v8 delegate:v6];

  return v9;
}

- (SCLSchoolMode)initWithIdentifier:(id)a3 pairingID:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(SCLSchoolModeConfiguration);
  [(SCLSchoolModeConfiguration *)v11 setIdentifier:v10];

  [(SCLSchoolModeConfiguration *)v11 setPairingID:v9];
  [(SCLSchoolModeConfiguration *)v11 setDelegate:v8];

  v12 = [(SCLSchoolMode *)self initWithConfiguration:v11];
  [(SCLSchoolMode *)v12 resume];

  return v12;
}

- (SCLSchoolMode)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCLSchoolMode;
  v5 = [(SCLSchoolMode *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (SCLSchoolModeConfiguration *)v6;

    id v8 = [(SCLSchoolModeConfiguration *)v5->_configuration targetQueue];

    if (!v8)
    {
      id v9 = v5->_configuration;
      id v10 = [v4 identifier];
      dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 cStringUsingEncoding:4], 0);
      [(SCLSchoolModeConfiguration *)v9 setTargetQueue:v11];
    }
    v5->_lock._os_unfair_lock_opaque = 0;
    v12 = [[SCLSchoolModeXPCClient alloc] initWithDelegate:v5 configuration:v5->_configuration];
    xpcClient = v5->_xpcClient;
    v5->_xpcClient = v12;
  }
  return v5;
}

- (void)dealloc
{
  [(SCLSchoolModeXPCClient *)self->_xpcClient invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SCLSchoolMode;
  [(SCLSchoolMode *)&v3 dealloc];
}

- (NSString)identifier
{
  return [(SCLSchoolModeConfiguration *)self->_configuration identifier];
}

- (id)delegate
{
  return [(SCLSchoolModeConfiguration *)self->_configuration delegate];
}

- (SCLState)state
{
  return [(SCLSchoolModeXPCClient *)self->_xpcClient state];
}

- (SCLScheduleSettings)scheduleSettings
{
  return [(SCLSchoolModeXPCClient *)self->_xpcClient scheduleSettings];
}

- (BOOL)isLoaded
{
  return [(SCLSchoolModeXPCClient *)self->_xpcClient isLoaded];
}

- (void)resume
{
  if ([(SCLSchoolMode *)self resumeState])
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488], @"SCLSchoolMode was resumed more than once %@", self format];
  }
  else
  {
    [(SCLSchoolMode *)self setResumeState:1];
    [(SCLSchoolModeXPCClient *)self->_xpcClient resume];
    [(SCLSchoolMode *)self setResumeState:2];
  }
}

- (void)setActive:(BOOL)a3 completion:(id)a4
{
}

- (void)applyScheduleSettings:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_22B7B4000, "ApplyScheduleSettings", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  id v9 = scl_framework_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_22B7B4000, v9, OS_LOG_TYPE_DEFAULT, "Apply schedule settings: %{public}@", buf, 0xCu);
  }

  [(SCLSchoolModeXPCClient *)self->_xpcClient applyScheduleSettings:v6 completion:v7];
  os_activity_scope_leave(&v10);
}

- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3
{
}

- (void)_assertQueueIfReady
{
  unint64_t v3 = [(SCLSchoolMode *)self resumeState];
  if (v3 != 2)
  {
    if (v3 != 1)
    {
      if (!v3) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Got delegate callback but not resumed: %@", self format];
      }
      return;
    }
    if ([(SCLSchoolModeConfiguration *)self->_configuration loadsSynchronously]) {
      return;
    }
  }
  id v4 = [(SCLSchoolModeConfiguration *)self->_configuration targetQueue];
  dispatch_assert_queue_V2(v4);
}

- (void)client:(id)a3 didUpdateToState:(id)a4 fromState:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  [(SCLSchoolMode *)self _assertQueueIfReady];
  id v8 = [(SCLSchoolMode *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    os_activity_scope_state_s v10 = [(SCLSchoolMode *)self delegate];
    [v10 schoolMode:self didUpdateState:v11 fromState:v7];
  }
}

- (void)client:(id)a3 didUpdateScheduleSettings:(id)a4
{
  id v8 = a4;
  [(SCLSchoolMode *)self _assertQueueIfReady];
  v5 = [(SCLSchoolMode *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SCLSchoolMode *)self delegate];
    [v7 schoolMode:self didUpdateScheduleSettings:v8];
  }
}

- (void)clientDidChangeUnlockHistory:(id)a3
{
  [(SCLSchoolMode *)self _assertQueueIfReady];
  id v4 = [(SCLSchoolMode *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SCLSchoolMode *)self delegate];
    [v6 schoolModeDidUpdateUnlockHistory:self];
  }
}

- (void)client:(id)a3 didLoadScheduleSettings:(id)a4
{
  id v11 = a4;
  [(SCLSchoolMode *)self _assertQueueIfReady];
  char v5 = [(SCLSchoolMode *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SCLSchoolMode *)self delegate];
    [v7 schoolMode:self didLoadScheduleSettings:v11];
  }
  id v8 = [(SCLSchoolMode *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    os_activity_scope_state_s v10 = [(SCLSchoolMode *)self delegate];
    [v10 schoolModeDidLoad:self];
  }
}

- (unint64_t)resumeState
{
  return self->_resumeState;
}

- (void)setResumeState:(unint64_t)a3
{
  self->_resumeState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4
{
}

- (void)deleteHistoryWithCompletion:(id)a3
{
}

- (void)noteSignificantUserInteraction
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v3 = _os_activity_create(&dword_22B7B4000, "NoteSignificantUserInteraction", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  id v4 = scl_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl(&dword_22B7B4000, v4, OS_LOG_TYPE_DEFAULT, "NoteSignificantUserInteraction for %@", buf, 0xCu);
  }

  [(SCLSchoolModeXPCClient *)self->_xpcClient noteSignificantUserInteraction];
  os_activity_scope_leave(&v5);
}

- (void)dumpState
{
}

- (void)triggerRemoteSync
{
}

@end