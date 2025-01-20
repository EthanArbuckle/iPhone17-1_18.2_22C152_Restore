@interface PLPowerAssertion
+ (unsigned)takePowerAssertionWithName:(id)a3 humanReadableReason:(id)a4 timeout:(double)a5 timeoutAction:(__CFString *)a6;
+ (void)performNoTimeoutPowerAssertionTaskWithName:(id)a3 humanReadableReason:(id)a4 block:(id)a5;
+ (void)performPowerAssertionTaskWithName:(id)a3 humanReadableReason:(id)a4 timeout:(double)a5 timeoutAction:(__CFString *)a6 block:(id)a7;
+ (void)removePowerAssertionForAssertionID:(unsigned int)a3;
@end

@implementation PLPowerAssertion

+ (void)removePowerAssertionForAssertionID:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      int v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_INFO, "%{public}@ Removing power assertion: -🔌", (uint8_t *)&v10, 0xCu);
    }
    IOReturn v7 = IOPMAssertionRelease(a3);
    if (v7)
    {
      IOReturn v8 = v7;
      v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 67109120;
        LODWORD(v11) = v8;
        _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "Failed to release power assertion for migration. Result code: %d", (uint8_t *)&v10, 8u);
      }
    }
  }
}

+ (unsigned)takePowerAssertionWithName:(id)a3 humanReadableReason:(id)a4 timeout:(double)a5 timeoutAction:(__CFString *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  IOPMAssertionID AssertionID = 0;
  v9 = (__CFString *)a4;
  int v10 = (__CFString *)a3;
  v11 = PLBackendGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138543362;
    v20 = v13;
    _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_INFO, "%{public}@ taking power assertion: +🔌", buf, 0xCu);
  }
  v14 = PLBundleIdentifier();
  IOReturn v15 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", v10, v14, v9, 0, a5, a6, &AssertionID);

  if (v15)
  {
    v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v15;
      _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_ERROR, "Failed to create power assertion for migration. Result code: %d", buf, 8u);
    }
  }
  return AssertionID;
}

+ (void)performPowerAssertionTaskWithName:(id)a3 humanReadableReason:(id)a4 timeout:(double)a5 timeoutAction:(__CFString *)a6 block:(id)a7
{
  uint64_t v12 = (void (**)(void))a7;
  uint64_t v13 = [a1 takePowerAssertionWithName:a3 humanReadableReason:a4 timeout:a6 timeoutAction:a5];
  v12[2](v12);

  [a1 removePowerAssertionForAssertionID:v13];
}

+ (void)performNoTimeoutPowerAssertionTaskWithName:(id)a3 humanReadableReason:(id)a4 block:(id)a5
{
  IOReturn v8 = (void (**)(void))a5;
  uint64_t v9 = [a1 takePowerAssertionWithName:a3 humanReadableReason:a4 timeout:@"TimeoutActionLog" timeoutAction:0.0];
  v8[2](v8);

  [a1 removePowerAssertionForAssertionID:v9];
}

@end