@interface PRSPosterUpdateResult
+ (BOOL)supportsSecureCoding;
+ (id)failedUpdateResultForUpdate:(id)a3 error:(id)a4;
+ (id)successfulUpdateResultForUpdate:(id)a3;
- (NSError)error;
- (PRSPosterUpdate)update;
- (PRSPosterUpdateResult)initWithCoder:(id)a3;
- (PRSPosterUpdateResult)initWithUpdate:(id)a3;
- (id)description;
- (id)initialValue;
- (id)requestedValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterUpdateResult

- (PRSPosterUpdateResult)initWithUpdate:(id)a3
{
  id v5 = a3;
  NSClassFromString(&cfstr_Prsposterupdat_20.isa);
  if (!v5)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateResult initWithUpdate:]();
    }
LABEL_11:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D6E0CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateResult initWithUpdate:]();
    }
    goto LABEL_11;
  }

  v10.receiver = self;
  v10.super_class = (Class)PRSPosterUpdateResult;
  v6 = [(PRSPosterUpdateResult *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_update, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterUpdateResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRSPosterUpdateResult;
  id v5 = [(PRSPosterUpdateResult *)&v13 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"_error"];
    error = v5->_error;
    v5->_error = (NSError *)v7;

    v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"_update"];
    update = v5->_update;
    v5->_update = (PRSPosterUpdate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  update = self->_update;
  id v5 = a3;
  [v5 encodeObject:update forKey:@"_update"];
  [v5 encodeObject:self->_error forKey:@"_error"];
}

+ (id)successfulUpdateResultForUpdate:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Prsposterupdat_20.isa);
  if (!v3)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdateResult successfulUpdateResultForUpdate:]();
    }
LABEL_11:
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D70B8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdateResult successfulUpdateResultForUpdate:]();
    }
    goto LABEL_11;
  }

  id v4 = [[PRSPosterUpdateResult alloc] initWithUpdate:v3];
  return v4;
}

+ (id)failedUpdateResultForUpdate:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  NSClassFromString(&cfstr_Prsposterupdat_20.isa);
  if (!v7)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdateResult failedUpdateResultForUpdate:error:]();
    }
LABEL_19:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D7264);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdateResult failedUpdateResultForUpdate:error:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D72C8);
  }

  v8 = (NSError *)v6;
  NSClassFromString(&cfstr_Nserror.isa);
  if (!v8)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdateResult failedUpdateResultForUpdate:error:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D732CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSErrorClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdateResult failedUpdateResultForUpdate:error:]();
    }
    goto LABEL_19;
  }

  v9 = [[PRSPosterUpdateResult alloc] initWithUpdate:v7];
  error = v9->_error;
  v9->_error = v8;

  return v9;
}

- (id)requestedValue
{
  v2 = [(PRSPosterUpdate *)self->_update payload];
  id v3 = [v2 rawValue];

  return v3;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_error withName:@"error"];
  id v5 = (id)[v3 appendObject:self->_update withName:@"update"];
  id v6 = [v3 build];

  return v6;
}

- (PRSPosterUpdate)update
{
  return self->_update;
}

- (NSError)error
{
  return self->_error;
}

- (id)initialValue
{
  return self->_initialValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_update, 0);
}

- (void)initWithUpdate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)successfulUpdateResultForUpdate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)failedUpdateResultForUpdate:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)failedUpdateResultForUpdate:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end