@interface REMDataAccessBehaviorManager
- (BOOL)_getBoolForKey:(id)a3 withDefaultValue:(BOOL)a4;
- (BOOL)isBabySitterEnabled;
- (BOOL)isDataAccessEnabled;
- (REMDataAccessBehaviorManager)init;
- (REMDataAccessBehaviorManager)initWithDaemonController:(id)a3;
- (REMXPCDaemonController)daemonController;
- (id)_debugPerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)fetchStatusReportsWithError:(id *)a3;
- (int64_t)_getIntegerForKey:(id)a3 withDefaultValue:(int64_t)a4;
- (int64_t)changeTrackingBehaviors;
- (void)_crashDaemonWithMessage:(id)a3;
- (void)_setBoolValue:(BOOL)a3 forBehaviorKey:(id)a4;
- (void)_setIntegerValue:(int64_t)a3 forBehaviorKey:(id)a4;
- (void)applyChangeTrackingBehavior:(int64_t)a3;
- (void)disableBabySitter;
- (void)disableDataAccess;
- (void)enableBabySitter;
- (void)enableDataAccess;
- (void)setDaemonController:(id)a3;
- (void)unapplyChangeTrackingBehavior:(int64_t)a3;
@end

@implementation REMDataAccessBehaviorManager

- (REMDataAccessBehaviorManager)init
{
  v3 = +[REMXPCDaemonController weakSharedInstance];
  v4 = [(REMDataAccessBehaviorManager *)self initWithDaemonController:v3];

  return v4;
}

- (REMDataAccessBehaviorManager)initWithDaemonController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMDataAccessBehaviorManager;
  v6 = [(REMDataAccessBehaviorManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_daemonController, a3);
  }

  return v7;
}

- (id)fetchStatusReportsWithError:(id *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  id v20 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke;
  v8[3] = &unk_1E61DC1F8;
  v8[4] = &v9;
  v4 = [(REMDataAccessBehaviorManager *)self _debugPerformerWithReason:@"DA_statusReports" errorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_2;
  v7[3] = &unk_1E61DCA38;
  v7[4] = &v15;
  v7[5] = &v9;
  [v4 dataAccessStatusReports:v7];
  if (a3) {
    *a3 = (id) v10[5];
  }
  id v5 = (id)v16[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[REMLog dataAccess];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = +[REMLog dataAccess];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_2_cold_1();
    }

    uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v10 = a3;
  }
  else
  {
    uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v10 = a2;
  }
  objc_storeStrong(v9, v10);
}

- (BOOL)isDataAccessEnabled
{
  return [(REMDataAccessBehaviorManager *)self _getBoolForKey:@"DataAccessEnabled" withDefaultValue:1];
}

- (void)enableDataAccess
{
  [(REMDataAccessBehaviorManager *)self _setBoolValue:1 forBehaviorKey:@"DataAccessEnabled"];

  [(REMDataAccessBehaviorManager *)self _crashDaemonWithMessage:@"Enable DataAccess"];
}

- (void)disableDataAccess
{
  [(REMDataAccessBehaviorManager *)self _setBoolValue:0 forBehaviorKey:@"DataAccessEnabled"];

  [(REMDataAccessBehaviorManager *)self _crashDaemonWithMessage:@"Disable DataAccess"];
}

- (BOOL)isBabySitterEnabled
{
  return [(REMDataAccessBehaviorManager *)self _getBoolForKey:@"BabysitterEnabled" withDefaultValue:1];
}

- (void)enableBabySitter
{
  [(REMDataAccessBehaviorManager *)self _setBoolValue:1 forBehaviorKey:@"BabysitterEnabled"];

  [(REMDataAccessBehaviorManager *)self _crashDaemonWithMessage:@"Enable Babysitter"];
}

- (void)disableBabySitter
{
  [(REMDataAccessBehaviorManager *)self _setBoolValue:0 forBehaviorKey:@"BabysitterEnabled"];

  [(REMDataAccessBehaviorManager *)self _crashDaemonWithMessage:@"Disable Babysitter"];
}

- (int64_t)changeTrackingBehaviors
{
  return [(REMDataAccessBehaviorManager *)self _getIntegerForKey:@"DADREMChangeTrackingBehaviors" withDefaultValue:0];
}

- (void)applyChangeTrackingBehavior:(int64_t)a3
{
  [(REMDataAccessBehaviorManager *)self _setIntegerValue:[(REMDataAccessBehaviorManager *)self changeTrackingBehaviors] | a3 forBehaviorKey:@"DADREMChangeTrackingBehaviors"];

  notify_post("com.apple.dataaccess.BehaviorOptionsChanged");
}

- (void)unapplyChangeTrackingBehavior:(int64_t)a3
{
  [(REMDataAccessBehaviorManager *)self _setIntegerValue:[(REMDataAccessBehaviorManager *)self changeTrackingBehaviors] & ~a3 forBehaviorKey:@"DADREMChangeTrackingBehaviors"];

  notify_post("com.apple.dataaccess.BehaviorOptionsChanged");
}

- (void)_setBoolValue:(BOOL)a3 forBehaviorKey:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = (void *)CFPreferencesCopyAppValue(@"BehaviorOptions", @"com.apple.DataAccess.BehaviorOptions");
  id v10 = v6;
  if (v6) {
    id v7 = (id)[v6 mutableCopy];
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v8 = v7;
  uint64_t v9 = [NSNumber numberWithBool:v4];
  [v8 setObject:v9 forKeyedSubscript:v5];

  CFPreferencesSetAppValue(@"BehaviorOptions", v8, @"com.apple.DataAccess.BehaviorOptions");
}

- (BOOL)_getBoolForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  id v5 = a3;
  id v6 = (void *)CFPreferencesCopyAppValue(@"BehaviorOptions", @"com.apple.DataAccess.BehaviorOptions");
  if (v6)
  {
    id v7 = (void *)CFPreferencesCopyAppValue(@"BehaviorOptions", @"com.apple.DataAccess.BehaviorOptions");
    v8 = [v7 objectForKeyedSubscript:v5];
    if (objc_opt_respondsToSelector()) {
      a4 = [v8 BOOLValue];
    }
  }
  return a4;
}

- (void)_setIntegerValue:(int64_t)a3 forBehaviorKey:(id)a4
{
  id v5 = a4;
  id v6 = (void *)CFPreferencesCopyAppValue(@"BehaviorOptions", @"com.apple.DataAccess.BehaviorOptions");
  id v10 = v6;
  if (v6) {
    id v7 = (id)[v6 mutableCopy];
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v8 = v7;
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  [v8 setObject:v9 forKeyedSubscript:v5];

  CFPreferencesSetAppValue(@"BehaviorOptions", v8, @"com.apple.DataAccess.BehaviorOptions");
}

- (int64_t)_getIntegerForKey:(id)a3 withDefaultValue:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)CFPreferencesCopyAppValue(@"BehaviorOptions", @"com.apple.DataAccess.BehaviorOptions");
  if (v6)
  {
    id v7 = (void *)CFPreferencesCopyAppValue(@"BehaviorOptions", @"com.apple.DataAccess.BehaviorOptions");
    v8 = [v7 objectForKeyedSubscript:v5];
    if (objc_opt_respondsToSelector()) {
      a4 = [v8 integerValue];
    }
  }
  return a4;
}

- (void)_crashDaemonWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(REMDataAccessBehaviorManager *)self _debugPerformerWithReason:@"DA_crashDaemon" errorHandler:&__block_literal_global_33];
  [v5 crashDaemonWithMessage:v4];
}

void __56__REMDataAccessBehaviorManager__crashDaemonWithMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLog dataAccess];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56__REMDataAccessBehaviorManager__crashDaemonWithMessage___block_invoke_cold_1();
  }
}

- (id)_debugPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(REMDataAccessBehaviorManager *)self daemonController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__REMDataAccessBehaviorManager__debugPerformerWithReason_errorHandler___block_invoke;
  v12[3] = &unk_1E61DC3F8;
  id v13 = v6;
  id v9 = v6;
  id v10 = [v8 syncDebugPerformerWithReason:v7 errorHandler:v12];

  return v10;
}

void __71__REMDataAccessBehaviorManager__debugPerformerWithReason_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLog dataAccess];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__REMDataAccessBehaviorManager__debugPerformerWithReason_errorHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (REMXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
}

- (void).cxx_destruct
{
}

void __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error while fetching status reports {error: %@}", v2, v3, v4, v5, v6);
}

void __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Error getting DataAccess status reports {error: %@}", v2, v3, v4, v5, v6);
}

void __56__REMDataAccessBehaviorManager__crashDaemonWithMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "xpc error while trying to carsh daemon {error: %@}", v2, v3, v4, v5, v6);
}

void __71__REMDataAccessBehaviorManager__debugPerformerWithReason_errorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "xpc error while using xpcPerformer {error: %{public}@}", v2, v3, v4, v5, v6);
}

@end