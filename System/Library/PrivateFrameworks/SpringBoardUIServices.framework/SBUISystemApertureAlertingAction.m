@interface SBUISystemApertureAlertingAction
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (void)invalidateWithReason:(id)a3;
@end

@implementation SBUISystemApertureAlertingAction

- (void)invalidateWithReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    v9 = self;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Alerting action invalidated with reason: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
  }

  if ([(SBUISystemApertureAlertingAction *)self canSendResponse])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    [v6 setObject:v4 forSetting:0];
    v7 = [MEMORY[0x1E4F4F678] responseWithInfo:v6];
    [(SBUISystemApertureAlertingAction *)self sendResponse:v7];
  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"invalidation reason";
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6 = a4;
  v7 = v6;
  if (a5) {
    id v8 = 0;
  }
  else {
    id v8 = v6;
  }

  return v8;
}

@end