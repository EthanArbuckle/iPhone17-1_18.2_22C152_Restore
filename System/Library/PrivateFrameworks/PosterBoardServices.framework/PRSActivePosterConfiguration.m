@interface PRSActivePosterConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (PRSActivePosterConfiguration)initWithBSXPCCoder:(id)a3;
- (PRSActivePosterConfiguration)initWithCoder:(id)a3;
- (PRSActivePosterConfiguration)initWithLockScreenPosterConfiguration:(id)a3 homeScreenPosterConfiguration:(id)a4;
- (PRSPosterConfiguration)homeScreenPosterConfiguration;
- (PRSPosterConfiguration)lockScreenPosterConfiguration;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSActivePosterConfiguration

- (PRSActivePosterConfiguration)initWithLockScreenPosterConfiguration:(id)a3 homeScreenPosterConfiguration:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  NSClassFromString(&cfstr_Prsposterconfi_1.isa);
  if (!v10)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSActivePosterConfiguration initWithLockScreenPosterConfiguration:homeScreenPosterConfiguration:](a2);
    }
LABEL_16:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E6C40);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSActivePosterConfiguration initWithLockScreenPosterConfiguration:homeScreenPosterConfiguration:](a2);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E6CA4);
  }

  id v11 = v9;
  if (v11)
  {
    NSClassFromString(&cfstr_Prsposterconfi_1.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSActivePosterConfiguration initWithLockScreenPosterConfiguration:homeScreenPosterConfiguration:](a2);
      }
      goto LABEL_16;
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)PRSActivePosterConfiguration;
  v12 = [(PRSActivePosterConfiguration *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lockScreenPosterConfiguration, a3);
    objc_storeStrong((id *)&v13->_homeScreenPosterConfiguration, a4);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSActivePosterConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSActivePosterConfiguration;
  v5 = [(PRSActivePosterConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lockScreenPosterConfiguration"];
    lockScreenPosterConfiguration = v5->_lockScreenPosterConfiguration;
    v5->_lockScreenPosterConfiguration = (PRSPosterConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeScreenPosterConfiguration"];
    homeScreenPosterConfiguration = v5->_homeScreenPosterConfiguration;
    v5->_homeScreenPosterConfiguration = (PRSPosterConfiguration *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  lockScreenPosterConfiguration = self->_lockScreenPosterConfiguration;
  id v5 = a3;
  [v5 encodeObject:lockScreenPosterConfiguration forKey:@"_lockScreenPosterConfiguration"];
  [v5 encodeObject:self->_homeScreenPosterConfiguration forKey:@"_homeScreenPosterConfiguration"];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  lockScreenPosterConfiguration = self->_lockScreenPosterConfiguration;
  id v5 = a3;
  [v5 encodeObject:lockScreenPosterConfiguration forKey:@"_lockScreenPosterConfiguration"];
  [v5 encodeObject:self->_homeScreenPosterConfiguration forKey:@"_homeScreenPosterConfiguration"];
}

- (PRSActivePosterConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSActivePosterConfiguration;
  id v5 = [(PRSActivePosterConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lockScreenPosterConfiguration"];
    lockScreenPosterConfiguration = v5->_lockScreenPosterConfiguration;
    v5->_lockScreenPosterConfiguration = (PRSPosterConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeScreenPosterConfiguration"];
    homeScreenPosterConfiguration = v5->_homeScreenPosterConfiguration;
    v5->_homeScreenPosterConfiguration = (PRSPosterConfiguration *)v8;
  }
  return v5;
}

- (PRSPosterConfiguration)lockScreenPosterConfiguration
{
  return self->_lockScreenPosterConfiguration;
}

- (PRSPosterConfiguration)homeScreenPosterConfiguration
{
  return self->_homeScreenPosterConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_lockScreenPosterConfiguration, 0);
}

- (void)initWithLockScreenPosterConfiguration:(const char *)a1 homeScreenPosterConfiguration:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithLockScreenPosterConfiguration:(const char *)a1 homeScreenPosterConfiguration:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end