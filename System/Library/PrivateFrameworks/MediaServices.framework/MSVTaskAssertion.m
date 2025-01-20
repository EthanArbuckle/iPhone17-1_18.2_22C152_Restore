@interface MSVTaskAssertion
- (BOOL)acquire;
- (BOOL)isAcquired;
- (BOOL)isValid;
- (MSVTaskAssertion)init;
- (MSVTaskAssertion)initWithName:(id)a3 bundleID:(id)a4 subsystem:(id)a5 reason:(unint64_t)a6 flags:(unint64_t)a7;
- (MSVTaskAssertion)initWithName:(id)a3 pid:(int)a4 bundleID:(id)a5 subsystem:(id)a6 reason:(unint64_t)a7 flags:(unint64_t)a8;
- (MSVTaskAssertion)initWithName:(id)a3 pid:(int)a4 subsystem:(id)a5 reason:(unint64_t)a6 flags:(unint64_t)a7;
- (NSString)bundleID;
- (NSString)name;
- (id)_initWithName:(id)a3 bundleID:(id)a4 pid:(int)a5 subsystem:(id)a6 reason:(unint64_t)a7 flags:(unint64_t)a8;
- (id)description;
- (id)invalidationHandler;
- (unsigned)_BSKFlagsForMSVFlags:(unint64_t)a3;
- (unsigned)_BSKReasonForMSVReason:(unint64_t)a3;
- (void)_cancelInvalidationTimerWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateOnDate:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation MSVTaskAssertion

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unsigned)_BSKReasonForMSVReason:(unint64_t)a3
{
  if (a3 < 3) {
    return dword_1A312BB00[a3];
  }
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"MSVTaskAssertion.m" lineNumber:233 description:@"Attempting to convert a non-existing MSVProcessAssertionReason value!"];

  return result;
}

- (unsigned)_BSKFlagsForMSVFlags:(unint64_t)a3
{
  return a3 & 3;
}

- (void)_cancelInvalidationTimerWithCompletion:(id)a3
{
  v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__MSVTaskAssertion__cancelInvalidationTimerWithCompletion___block_invoke;
  v6[3] = &unk_1E5ADAA50;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __59__MSVTaskAssertion__cancelInvalidationTimerWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (BOOL)isValid
{
  processAssertion = self->_processAssertion;
  if (processAssertion) {
    LOBYTE(processAssertion) = [(BKSProcessAssertion *)processAssertion valid];
  }
  return (char)processAssertion;
}

- (void)invalidateOnDate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__MSVTaskAssertion_invalidateOnDate___block_invoke;
  v6[3] = &unk_1E5ADAA78;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MSVTaskAssertion *)self _cancelInvalidationTimerWithCompletion:v6];
}

void __37__MSVTaskAssertion_invalidateOnDate___block_invoke(uint64_t a1)
{
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  dispatch_time_t v6 = dispatch_time(0, 1000000000 * (unint64_t)v5);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 40), v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__MSVTaskAssertion_invalidateOnDate___block_invoke_2;
  v8[3] = &unk_1E5ADA968;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__MSVTaskAssertion_invalidateOnDate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_DEBUG, "Invalidating task assertion: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(BKSProcessAssertion *)self->_processAssertion invalidate];
  [(MSVTaskAssertion *)self _cancelInvalidationTimerWithCompletion:0];
  invalidationHandler = (void (**)(id, MSVTaskAssertion *))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, self);
    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;
  }
}

- (BOOL)acquire
{
  return self->_acquired;
}

- (BOOL)isAcquired
{
  return self->_acquired;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t pid = self->_pid;
  bundleID = self->_bundleID;
  subsystem = self->_subsystem;
  name = self->_name;
  uuid = self->_uuid;
  BOOL v10 = [(MSVTaskAssertion *)self isValid];
  v11 = @"NO";
  if (v10) {
    v11 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"%@ %p, bundleID = %@, uint64_t pid = %lu, subsystem = %@, name = %@, uuid = %@, valid = %@>", v4, self, bundleID, pid, subsystem, name, uuid, v11];
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_INFO, "Invalidating task assertion: %{public}@ (dealloc)", buf, 0xCu);
  }

  [(BKSProcessAssertion *)self->_processAssertion invalidate];
  invalidationTimer = self->_invalidationTimer;
  if (invalidationTimer) {
    dispatch_source_cancel(invalidationTimer);
  }
  v5.receiver = self;
  v5.super_class = (Class)MSVTaskAssertion;
  [(MSVTaskAssertion *)&v5 dealloc];
}

- (MSVTaskAssertion)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  objc_super v5 = NSStringFromSelector(a2);
  int v6 = NSStringFromSelector(sel_initWithName_bundleID_subsystem_reason_flags_);
  id v7 = NSStringFromSelector(sel_initWithName_pid_subsystem_reason_flags_);
  [v3 raise:v4, @"%@ is invalid. You must provide bundleID with %@ or a PID with %@.", v5, v6, v7 format];

  return 0;
}

- (MSVTaskAssertion)initWithName:(id)a3 bundleID:(id)a4 subsystem:(id)a5 reason:(unint64_t)a6 flags:(unint64_t)a7
{
  return (MSVTaskAssertion *)[(MSVTaskAssertion *)self _initWithName:a3 bundleID:a4 pid:0 subsystem:a5 reason:a6 flags:a7];
}

- (MSVTaskAssertion)initWithName:(id)a3 pid:(int)a4 bundleID:(id)a5 subsystem:(id)a6 reason:(unint64_t)a7 flags:(unint64_t)a8
{
  return (MSVTaskAssertion *)[(MSVTaskAssertion *)self _initWithName:a3 bundleID:a5 pid:*(void *)&a4 subsystem:a6 reason:a7 flags:a8];
}

- (MSVTaskAssertion)initWithName:(id)a3 pid:(int)a4 subsystem:(id)a5 reason:(unint64_t)a6 flags:(unint64_t)a7
{
  return (MSVTaskAssertion *)[(MSVTaskAssertion *)self _initWithName:a3 bundleID:0 pid:*(void *)&a4 subsystem:a5 reason:a6 flags:a7];
}

- (id)_initWithName:(id)a3 bundleID:(id)a4 pid:(int)a5 subsystem:(id)a6 reason:(unint64_t)a7 flags:(unint64_t)a8
{
  uint64_t v11 = *(void *)&a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v43.receiver = self;
  v43.super_class = (Class)MSVTaskAssertion;
  v17 = [(MSVTaskAssertion *)&v43 init];
  if (!v17) {
    goto LABEL_15;
  }
  v18 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v19 = [v18 UUIDString];
  uuid = v17->_uuid;
  v17->_uuid = (NSString *)v19;

  uint64_t v21 = [v16 copy];
  subsystem = v17->_subsystem;
  v17->_subsystem = (NSString *)v21;

  uint64_t v23 = [v15 copy];
  bundleID = v17->_bundleID;
  v17->_bundleID = (NSString *)v23;

  v17->_uint64_t pid = v11;
  uint64_t v25 = [v14 copy];
  name = v17->_name;
  v17->_name = (NSString *)v25;

  uint64_t v27 = [(MSVTaskAssertion *)v17 _BSKFlagsForMSVFlags:a8];
  uint64_t v28 = [(MSVTaskAssertion *)v17 _BSKReasonForMSVReason:a7];
  v29 = [NSString stringWithFormat:@"%@ %@ %@", v16, v17->_uuid, v14];
  if (v11)
  {
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F4E280]) initWithPID:v11 flags:v27 reason:v28 name:v29];
    processAssertion = v17->_processAssertion;
    v17->_processAssertion = (BKSProcessAssertion *)v30;

    if (!v17->_bundleID)
    {
      uint64_t v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"FallbackIdentifier-%d", v11);
      v33 = v17->_bundleID;
      v17->_bundleID = (NSString *)v32;
LABEL_7:
    }
  }
  else if (v15)
  {
    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F4E280]) initWithBundleIdentifier:v15 flags:v27 reason:v28 name:v29];
    v33 = v17->_processAssertion;
    v17->_processAssertion = (BKSProcessAssertion *)v34;
    goto LABEL_7;
  }
  objc_initWeak(&location, v17);
  v35 = v17->_processAssertion;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __70__MSVTaskAssertion__initWithName_bundleID_pid_subsystem_reason_flags___block_invoke;
  v40[3] = &unk_1E5ADA968;
  objc_copyWeak(&v41, &location);
  [(BKSProcessAssertion *)v35 setInvalidationHandler:v40];
  char v36 = [(BKSProcessAssertion *)v17->_processAssertion acquire];
  v17->_acquired = v36;
  if ((v36 & 1) == 0)
  {
    v37 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v17;
      _os_log_impl(&dword_1A30CD000, v37, OS_LOG_TYPE_ERROR, "Failed to acquire process assertion for task %@", buf, 0xCu);
    }
  }
  v38 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v17;
    _os_log_impl(&dword_1A30CD000, v38, OS_LOG_TYPE_INFO, "Began task assertion: %@", buf, 0xCu);
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

LABEL_15:
  return v17;
}

void __70__MSVTaskAssertion__initWithName_bundleID_pid_subsystem_reason_flags___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_source_t v2 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1A30CD000, v2, OS_LOG_TYPE_DEFAULT, "Task assertion %@ was invalidated.", (uint8_t *)&v3, 0xCu);
    }
  }
}

@end