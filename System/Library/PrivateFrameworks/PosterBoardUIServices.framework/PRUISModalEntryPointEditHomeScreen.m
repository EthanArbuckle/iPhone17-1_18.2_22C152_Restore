@interface PRUISModalEntryPointEditHomeScreen
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PFServerPosterPath)serverPosterPath;
- (PRUISModalEntryPointEditHomeScreen)initWithBSXPCCoder:(id)a3;
- (PRUISModalEntryPointEditHomeScreen)initWithServiceConfiguration:(id)a3;
- (id)_BSXPCSecureCodingEntryPointTypeString;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRUISModalEntryPointEditHomeScreen

- (PRUISModalEntryPointEditHomeScreen)initWithServiceConfiguration:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Prsposterconfi.isa);
  if (!v4)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointEditHomeScreen initWithServiceConfiguration:]();
    }
LABEL_11:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A062D68);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointEditHomeScreen initWithServiceConfiguration:]();
    }
    goto LABEL_11;
  }

  v10.receiver = self;
  v10.super_class = (Class)PRUISModalEntryPointEditHomeScreen;
  v5 = [(PRUISModalEntryPointEditHomeScreen *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 _path];
    serverPosterPath = v5->_serverPosterPath;
    v5->_serverPosterPath = (PFServerPosterPath *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  serverPosterPath = self->_serverPosterPath;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__PRUISModalEntryPointEditHomeScreen_isEqual___block_invoke;
  v10[3] = &unk_26546BF68;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:serverPosterPath counterpart:v10];
  LOBYTE(serverPosterPath) = [v5 isEqual];

  return (char)serverPosterPath;
}

uint64_t __46__PRUISModalEntryPointEditHomeScreen_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) serverPosterPath];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_serverPosterPath];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F5F350]) _initWithPath:self->_serverPosterPath];
  uint64_t v6 = (void *)[v4 initWithServiceConfiguration:v5];

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointEditHomeScreen)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serverPosterPath"];

  if (v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F5F350]) _initWithPath:v5];
    self = [(PRUISModalEntryPointEditHomeScreen *)self initWithServiceConfiguration:v6];

    id v7 = self;
  }
  else
  {
    id v8 = PRUISLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointEditing initWithBSXPCCoder:]();
    }

    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  serverPosterPath = self->_serverPosterPath;
  id v9 = 0;
  uint64_t v6 = [(PFServerPosterPath *)serverPosterPath extendContentsReadAccessToAuditToken:0 error:&v9];
  id v7 = v9;
  if (!v6)
  {
    id v8 = PRUISLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointEditHomeScreen encodeWithBSXPCCoder:]();
    }
  }
  [v4 encodeObject:v6 forKey:@"_serverPosterPath"];
}

- (id)_BSXPCSecureCodingEntryPointTypeString
{
  return @"EditHomeScreen";
}

- (PFServerPosterPath)serverPosterPath
{
  return self->_serverPosterPath;
}

- (void).cxx_destruct
{
}

- (void)initWithServiceConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)encodeWithBSXPCCoder:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_25A03F000, v0, v1, "PRUISModalEntryPointEditing: could not obtain poster path with sandbox extension: %@", v2, v3, v4, v5, v6);
}

@end