@interface WFConfiguredStaccatoAction(SBUtilities)
- (void)sb_configuredIntentAction;
@end

@implementation WFConfiguredStaccatoAction(SBUtilities)

- (void)sb_configuredIntentAction
{
  objc_msgSend(NSString, "stringWithFormat:", @"Only valid when this is an Intent action; %@ is not.",
  v4 = a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138544642;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = a1;
    __int16 v14 = 2114;
    v15 = @"SBLocalSystemActionUtilities.m";
    __int16 v16 = 1024;
    int v17 = 48;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

@end