@interface SBSLockScreenPluginService
- (id)_serializedDataForContext:(id)a3;
- (void)disableLockScreenBundle:(id)a3 withContext:(id)a4;
- (void)enableLockScreenBundle:(id)a3 withContext:(id)a4;
@end

@implementation SBSLockScreenPluginService

- (id)_serializedDataForContext:(id)a3
{
  if (a3)
  {
    v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:0];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)enableLockScreenBundle:(id)a3 withContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(SBSLockScreenPluginService *)self _serializedDataForContext:a4];
  uint64_t v8 = SBSSpringBoardServerPort();
  id v9 = v6;
  uint64_t v10 = [v9 UTF8String];
  id v11 = v7;
  mach_error_t v12 = SBEnableLockScreenBundle(v8, 1, v10, [v11 bytes], [v11 length]);
  if (v12)
  {
    mach_error_t v13 = v12;
    v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      v16 = self;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2082;
      v20 = mach_error_string(v13);
      _os_log_error_impl(&dword_18FBC5000, v14, OS_LOG_TYPE_ERROR, "%@: Unable to enable bundle name %{public}@: %{public}s", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)disableLockScreenBundle:(id)a3 withContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(SBSLockScreenPluginService *)self _serializedDataForContext:a4];
  uint64_t v8 = SBSSpringBoardServerPort();
  id v9 = v6;
  uint64_t v10 = [v9 UTF8String];
  id v11 = v7;
  mach_error_t v12 = SBEnableLockScreenBundle(v8, 0, v10, [v11 bytes], [v11 length]);
  if (v12)
  {
    mach_error_t v13 = v12;
    v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      v16 = self;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2082;
      v20 = mach_error_string(v13);
      _os_log_error_impl(&dword_18FBC5000, v14, OS_LOG_TYPE_ERROR, "%@ Unable to disable bundle name %{public}@: %{public}s", (uint8_t *)&v15, 0x20u);
    }
  }
}

@end