@interface NSUserActivity(NSUserActivityInternalDelegateCalls)
- (BOOL)doSaveUserActivityWithTimeout:()NSUserActivityInternalDelegateCalls isCurrent:withCompletionHandler:;
- (uint64_t)_supportsSynchronizeActivityWithTimeout;
@end

@implementation NSUserActivity(NSUserActivityInternalDelegateCalls)

- (uint64_t)_supportsSynchronizeActivityWithTimeout
{
  v3 = [a1 delegate];
  if (v3)
  {
    v1 = [a1 delegate];
    if (objc_opt_respondsToSelector())
    {
      char v4 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  v5 = [a1 _frameworkDelegate];
  if (v5)
  {
    v6 = [a1 _frameworkDelegate];
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
  }

  if (v3) {
    goto LABEL_8;
  }
LABEL_9:

  return v4 & 1;
}

- (BOOL)doSaveUserActivityWithTimeout:()NSUserActivityInternalDelegateCalls isCurrent:withCompletionHandler:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [a1 _internalUserActivity];
    v11 = [v10 uniqueIdentifier];
    v12 = [v11 UUIDString];
    *(_DWORD *)buf = 138543874;
    v41 = v12;
    __int16 v42 = 2050;
    double v43 = a2;
    __int16 v44 = 1024;
    int v45 = a4;
    _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_DEBUG, "userActivity=%{public}@ timeout=%{public}f isCurrent=%{BOOL}d", buf, 0x1Cu);
  }
  if (v8)
  {
    v13 = [a1 _frameworkDelegate];
    v14 = [a1 delegate];
    if (v14)
    {
      if (objc_opt_respondsToSelector())
      {
        v15 = [MEMORY[0x1E4F1C9C8] now];
        v16 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v29 = [a1 _internalUserActivity];
          v17 = [v29 uniqueIdentifier];
          v18 = [v17 UUIDString];
          *(_DWORD *)buf = 138543362;
          v41 = v18;
          _os_log_impl(&dword_1B3DF6000, v16, OS_LOG_TYPE_DEBUG, "userActivity=%{public}@ delegate supports _userActivityWillSave:... so calling that.", buf, 0xCu);
        }
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke;
        v34[3] = &unk_1E6083A28;
        v34[4] = a1;
        char v39 = a4;
        double v38 = a2;
        id v35 = v13;
        id v36 = v15;
        id v37 = v8;
        id v19 = v15;
        [v14 _userActivityWillSave:a1 isCurrent:a4 timeout:v34 withCompletionHandler:a2];

        goto LABEL_23;
      }
      if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_opt_respondsToSelector()) {
          [v14 userActivityWillSave:a1];
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (!v13)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F29230]);
        v26 = [a1 _internalUserActivity];
        v27 = (void *)[v26 copyWithNewUUID:0];
        v24 = (void *)[v25 initWithInternalUserActivity:v27];

        goto LABEL_22;
      }
      if (objc_opt_respondsToSelector())
      {
LABEL_16:
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_2;
        v32[3] = &unk_1E6083A00;
        id v33 = v8;
        [v13 _userActivityWillSave:a1 isCurrent:a4 timeout:v32 withCompletionHandler:a2];
        v20 = v33;
LABEL_20:

LABEL_23:
        goto LABEL_24;
      }
    }
    if (![MEMORY[0x1E4F29060] isMainThread])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_3;
      block[3] = &unk_1E6083820;
      block[4] = a1;
      id v31 = v8;
      dispatch_async(MEMORY[0x1E4F14428], block);
      v20 = v31;
      goto LABEL_20;
    }
    [a1 willSynchronizeActivity];
    id v21 = objc_alloc(MEMORY[0x1E4F29230]);
    v22 = [a1 _internalUserActivity];
    v23 = (void *)[v22 copyWithNewUUID:0];
    v24 = (void *)[v21 initWithInternalUserActivity:v23];

    [a1 didSynchronizeActivity];
LABEL_22:
    (*((void (**)(id, void *, void))v8 + 2))(v8, v24, 0);

    goto LABEL_23;
  }
LABEL_24:

  return v8 != 0;
}

@end