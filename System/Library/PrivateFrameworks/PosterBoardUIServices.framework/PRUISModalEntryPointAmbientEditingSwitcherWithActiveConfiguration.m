@interface PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PFServerPosterPath)serverPosterPath;
- (PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration)initWithActiveConfiguration:(id)a3;
- (PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration)initWithActiveConfiguration:(id)a3 transitionOverlayRenderId:(unint64_t)a4 transitionOverlayContextId:(unsigned int)a5;
- (PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration)initWithBSXPCCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)transitionOverlayRenderId;
- (unsigned)transitionOverlayContextId;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration

- (PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration)initWithActiveConfiguration:(id)a3
{
  return [(PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration *)self initWithActiveConfiguration:a3 transitionOverlayRenderId:0 transitionOverlayContextId:0];
}

- (PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration)initWithActiveConfiguration:(id)a3 transitionOverlayRenderId:(unint64_t)a4 transitionOverlayContextId:(unsigned int)a5
{
  id v8 = a3;
  NSClassFromString(&cfstr_Prsposterconfi.isa);
  if (!v8)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:]();
    }
LABEL_11:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0632C0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:]();
    }
    goto LABEL_11;
  }

  v14.receiver = self;
  v14.super_class = (Class)PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration;
  v9 = [(PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v8 _path];
    serverPosterPath = v9->_serverPosterPath;
    v9->_serverPosterPath = (PFServerPosterPath *)v10;

    v9->_transitionOverlayRenderId = a4;
    v9->_transitionOverlayContextId = a5;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  serverPosterPath = self->_serverPosterPath;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke;
  v21[3] = &unk_26546BF68;
  id v8 = v6;
  id v22 = v8;
  id v9 = (id)[v5 appendObject:serverPosterPath counterpart:v21];
  unint64_t transitionOverlayRenderId = self->_transitionOverlayRenderId;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke_2;
  v19[3] = &unk_26546BEC8;
  id v11 = v8;
  id v20 = v11;
  id v12 = (id)[v5 appendInt64:transitionOverlayRenderId counterpart:v19];
  uint64_t transitionOverlayContextId = self->_transitionOverlayContextId;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke_3;
  v17[3] = &unk_26546BEC8;
  id v18 = v11;
  id v14 = v11;
  id v15 = (id)[v5 appendInt64:transitionOverlayContextId counterpart:v17];
  LOBYTE(transitionOverlayContextId) = [v5 isEqual];

  return transitionOverlayContextId;
}

uint64_t __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) serverPosterPath];
}

uint64_t __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionOverlayRenderId];
}

uint64_t __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionOverlayContextId];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_serverPosterPath];
  id v5 = (id)[v3 appendInt64:self->_transitionOverlayRenderId];
  id v6 = (id)[v3 appendInt64:self->_transitionOverlayContextId];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = (void *)[objc_alloc(MEMORY[0x263F5F350]) _initWithPath:self->_serverPosterPath];
  id v6 = (void *)[v4 initWithActiveConfiguration:v5 transitionOverlayRenderId:self->_transitionOverlayRenderId transitionOverlayContextId:self->_transitionOverlayContextId];

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serverPosterPath"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeUInt64ForKey:@"_transitionOverlayRenderId"];
    uint64_t v7 = [v4 decodeUInt64ForKey:@"_transitionOverlayContextId"];
    id v8 = (void *)[objc_alloc(MEMORY[0x263F5F350]) _initWithPath:v5];
    self = [(PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration *)self initWithActiveConfiguration:v8 transitionOverlayRenderId:v6 transitionOverlayContextId:v7];

    id v9 = self;
  }
  else
  {
    uint64_t v10 = PRUISLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration initWithBSXPCCoder:]();
    }

    id v9 = 0;
  }

  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  serverPosterPath = self->_serverPosterPath;
  id v9 = 0;
  id v5 = a3;
  uint64_t v6 = [(PFServerPosterPath *)serverPosterPath extendContentsReadAccessToAuditToken:0 error:&v9];
  id v7 = v9;
  if (!v6)
  {
    id v8 = PRUISLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration encodeWithBSXPCCoder:]();
    }
  }
  [v5 encodeObject:v6 forKey:@"_serverPosterPath"];
  [v5 encodeUInt64:self->_transitionOverlayRenderId forKey:@"_transitionOverlayRenderId"];
  [v5 encodeUInt64:self->_transitionOverlayContextId forKey:@"_transitionOverlayContextId"];
}

- (unint64_t)transitionOverlayRenderId
{
  return self->_transitionOverlayRenderId;
}

- (unsigned)transitionOverlayContextId
{
  return self->_transitionOverlayContextId;
}

- (PFServerPosterPath)serverPosterPath
{
  return self->_serverPosterPath;
}

- (void).cxx_destruct
{
}

- (void)initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:.cold.1()
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

- (void)initWithBSXPCCoder:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_25A03F000, v0, v1, "PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration: could not decode poster path", v2, v3, v4, v5, v6);
}

- (void)encodeWithBSXPCCoder:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_25A03F000, v0, OS_LOG_TYPE_FAULT, "PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration: could not obtain poster path with sandbox extension: %@", v1, 0xCu);
}

@end