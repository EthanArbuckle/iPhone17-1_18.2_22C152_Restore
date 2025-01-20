@interface PRSMutablePosterConfiguration
+ (id)mutableConfiguration;
+ (id)mutableConfigurationWithRole:(id)a3;
- (BOOL)storeUserInfo:(id)a3 error:(id *)a4;
@end

@implementation PRSMutablePosterConfiguration

+ (id)mutableConfiguration
{
  v3 = PFPosterRoleDefaultRoleForCurrentExtensionProcess();
  v4 = [a1 mutableConfigurationWithRole:v3];

  return v4;
}

+ (id)mutableConfigurationWithRole:(id)a3
{
  id v5 = a3;
  if (PFPosterRoleIsValid())
  {
    v6 = [MEMORY[0x1E4F924B8] temporaryPathForRole:v5];
    id v7 = [(PRSPosterConfiguration *)[PRSMutablePosterConfiguration alloc] _initWithPath:v6];
    [v6 invalidate];

    return v7;
  }
  else
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid(role)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSMutablePosterConfiguration mutableConfigurationWithRole:(uint64_t)v9];
    }
    [v9 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRSPosterConfiguration *)self _path];
  LOBYTE(a4) = [v7 storeUserInfo:v6 error:a4];

  return (char)a4;
}

+ (void)mutableConfigurationWithRole:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  v9 = @"PRSPosterConfiguration.m";
  __int16 v10 = 1024;
  int v11 = 272;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1A78AC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end