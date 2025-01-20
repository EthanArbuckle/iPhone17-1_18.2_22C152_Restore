@interface PRSMutablePosterDescriptor
+ (id)mutableDescriptorWithIdentifier:(id)a3;
+ (id)mutableDescriptorWithIdentifier:(id)a3 role:(id)a4;
- (BOOL)storeUserInfo:(id)a3 error:(id *)a4;
@end

@implementation PRSMutablePosterDescriptor

+ (id)mutableDescriptorWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = PFPosterRoleDefaultRoleForCurrentExtensionProcess();
  v6 = [a1 mutableDescriptorWithIdentifier:v4 role:v5];

  return v6;
}

+ (id)mutableDescriptorWithIdentifier:(id)a3 role:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v7)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSMutablePosterDescriptor mutableDescriptorWithIdentifier:role:]();
    }
LABEL_15:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78B2C04);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSMutablePosterDescriptor mutableDescriptorWithIdentifier:role:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78B2C68);
  }

  if ((PFPosterRoleIsValid() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid(role)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSMutablePosterDescriptor mutableDescriptorWithIdentifier:role:]();
    }
    goto LABEL_15;
  }
  v8 = [MEMORY[0x1E4F924B8] temporaryDescriptorPathWithIdentifier:v7 role:v6];
  id v9 = [(PRSPosterDescriptor *)[PRSMutablePosterDescriptor alloc] _initWithPath:v8];
  [v8 invalidate];

  return v9;
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRSPosterDescriptor *)self _path];
  LOBYTE(a4) = [v7 storeUserInfo:v6 error:a4];

  return (char)a4;
}

+ (void)mutableDescriptorWithIdentifier:role:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)mutableDescriptorWithIdentifier:role:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end