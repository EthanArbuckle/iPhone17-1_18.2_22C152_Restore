@interface PRUISModalEntryPointEditing
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)extensionIdentifier;
- (PFServerPosterPath)serverPosterPath;
- (PRMutablePosterConfiguration)configuration;
- (PRSPosterConfiguration)_serviceConfiguration;
- (PRSPosterUpdateSessionInfo)updateSessionInfo;
- (PRUISModalEntryPointEditing)init;
- (PRUISModalEntryPointEditing)initWithBSXPCCoder:(id)a3;
- (PRUISModalEntryPointEditing)initWithExtensionIdentifier:(id)a3 configuration:(id)a4;
- (PRUISModalEntryPointEditing)initWithServiceConfiguration:(id)a3;
- (PRUISModalEntryPointEditing)initWithServiceConfiguration:(id)a3 updateSessionInfo:(id)a4;
- (PRUISModalEntryPointEditing)initWithType:(int64_t)a3 extensionIdentifier:(id)a4 configuration:(id)a5 updateSessionInfo:(id)a6;
- (id)_BSXPCSecureCodingEntryPointTypeString;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)editingType;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRUISModalEntryPointEditing

- (PRUISModalEntryPointEditing)init
{
  return [(PRUISModalEntryPointEditing *)self initWithType:0 extensionIdentifier:0 configuration:0 updateSessionInfo:0];
}

- (PRUISModalEntryPointEditing)initWithExtensionIdentifier:(id)a3 configuration:(id)a4
{
  return [(PRUISModalEntryPointEditing *)self initWithType:1 extensionIdentifier:a3 configuration:a4 updateSessionInfo:0];
}

- (PRUISModalEntryPointEditing)initWithType:(int64_t)a3 extensionIdentifier:(id)a4 configuration:(id)a5 updateSessionInfo:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PRUISModalEntryPointEditing;
  v13 = [(PRUISModalEntryPointEditing *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_editingType = a3;
    uint64_t v15 = [v10 copy];
    extensionIdentifier = v14->_extensionIdentifier;
    v14->_extensionIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v14->_configuration, a5);
    objc_storeStrong((id *)&v14->_updateSessionInfo, a6);
    v17 = PRUISLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v11 _path];
      v19 = [v18 contentsURL];
      *(_DWORD *)buf = 138412290;
      v24 = v19;
      _os_log_impl(&dword_25A03F000, v17, OS_LOG_TYPE_DEFAULT, "PRUISModalEntryPointEditing: creating with poster path: %@", buf, 0xCu);
    }
    v20 = v14;
  }

  return v14;
}

- (PRUISModalEntryPointEditing)initWithServiceConfiguration:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PRUISModalEntryPointEditing;
  v6 = [(PRUISModalEntryPointEditing *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_editingType = 2;
    v8 = [v5 _path];
    v9 = [v8 serverIdentity];
    uint64_t v10 = [v9 provider];
    extensionIdentifier = v7->_extensionIdentifier;
    v7->_extensionIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v7->_serviceConfiguration, a3);
    id v12 = PRUISLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v5 _path];
      v14 = [v13 contentsURL];
      *(_DWORD *)buf = 138412290;
      v19 = v14;
      _os_log_impl(&dword_25A03F000, v12, OS_LOG_TYPE_DEFAULT, "PRUISModalEntryPointEditing: editing with poster path: %@", buf, 0xCu);
    }
    uint64_t v15 = v7;
  }

  return v7;
}

- (PRUISModalEntryPointEditing)initWithServiceConfiguration:(id)a3 updateSessionInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"serviceConfiguration != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointEditing initWithServiceConfiguration:updateSessionInfo:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A062074);
  }
  v9 = v8;
  if (!v8)
  {
    objc_super v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sessionInfo != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointEditing initWithServiceConfiguration:updateSessionInfo:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0620D8);
  }
  v23.receiver = self;
  v23.super_class = (Class)PRUISModalEntryPointEditing;
  uint64_t v10 = [(PRUISModalEntryPointEditing *)&v23 init];
  id v11 = v10;
  if (v10)
  {
    v10->_editingType = 3;
    id v12 = [v7 _path];
    v13 = [v12 serverIdentity];
    uint64_t v14 = [v13 provider];
    extensionIdentifier = v11->_extensionIdentifier;
    v11->_extensionIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_serviceConfiguration, a3);
    objc_storeStrong((id *)&v11->_updateSessionInfo, a4);
    v16 = PRUISLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v17 = [v7 _path];
      v18 = [v17 contentsURL];
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v18;
      _os_log_impl(&dword_25A03F000, v16, OS_LOG_TYPE_DEFAULT, "PRUISModalEntryPointEditing: editing with poster path: %@", buf, 0xCu);
    }
    v19 = v11;
  }

  return v11;
}

- (PFServerPosterPath)serverPosterPath
{
  serviceConfiguration = self->_serviceConfiguration;
  if (serviceConfiguration)
  {
    serviceConfiguration = [serviceConfiguration _path];
  }

  return (PFServerPosterPath *)serviceConfiguration;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  int64_t editingType = self->_editingType;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __39__PRUISModalEntryPointEditing_isEqual___block_invoke;
  v31[3] = &unk_26546BEC8;
  id v8 = v6;
  id v32 = v8;
  id v9 = (id)[v5 appendInteger:editingType counterpart:v31];
  extensionIdentifier = self->_extensionIdentifier;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __39__PRUISModalEntryPointEditing_isEqual___block_invoke_2;
  v29[3] = &unk_26546BE78;
  id v11 = v8;
  id v30 = v11;
  id v12 = (id)[v5 appendObject:extensionIdentifier counterpart:v29];
  serviceConfiguration = self->_serviceConfiguration;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __39__PRUISModalEntryPointEditing_isEqual___block_invoke_3;
  v27[3] = &unk_26546BEF0;
  id v14 = v11;
  id v28 = v14;
  id v15 = (id)[v5 appendObject:serviceConfiguration counterpart:v27];
  configuration = self->_configuration;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __39__PRUISModalEntryPointEditing_isEqual___block_invoke_4;
  v25[3] = &unk_26546BF18;
  id v17 = v14;
  id v26 = v17;
  id v18 = (id)[v5 appendObject:configuration counterpart:v25];
  updateSessionInfo = self->_updateSessionInfo;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __39__PRUISModalEntryPointEditing_isEqual___block_invoke_5;
  v23[3] = &unk_26546BF40;
  id v24 = v17;
  id v20 = v17;
  id v21 = (id)[v5 appendObject:updateSessionInfo counterpart:v23];
  LOBYTE(updateSessionInfo) = [v5 isEqual];

  return (char)updateSessionInfo;
}

uint64_t __39__PRUISModalEntryPointEditing_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) editingType];
}

uint64_t __39__PRUISModalEntryPointEditing_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) extensionIdentifier];
}

uint64_t __39__PRUISModalEntryPointEditing_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceConfiguration];
}

uint64_t __39__PRUISModalEntryPointEditing_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) configuration];
}

uint64_t __39__PRUISModalEntryPointEditing_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSessionInfo];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendInteger:self->_editingType];
  id v5 = (id)[v3 appendObject:self->_extensionIdentifier];
  id v6 = (id)[v3 appendObject:self->_serviceConfiguration];
  id v7 = (id)[v3 appendObject:self->_configuration];
  id v8 = (id)[v3 appendObject:self->_updateSessionInfo];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t editingType = self->_editingType;
  if (editingType == 2)
  {
    id v9 = objc_alloc((Class)objc_opt_class());
    serviceConfiguration = self->_serviceConfiguration;
    return (id)[v9 initWithServiceConfiguration:serviceConfiguration];
  }
  else if (editingType == 3)
  {
    id v5 = objc_alloc((Class)objc_opt_class());
    id v6 = self->_serviceConfiguration;
    updateSessionInfo = self->_updateSessionInfo;
    return (id)[v5 initWithServiceConfiguration:v6 updateSessionInfo:updateSessionInfo];
  }
  else
  {
    id v11 = objc_alloc((Class)objc_opt_class());
    int64_t v12 = self->_editingType;
    extensionIdentifier = self->_extensionIdentifier;
    configuration = self->_configuration;
    id v15 = self->_updateSessionInfo;
    return (id)[v11 initWithType:v12 extensionIdentifier:extensionIdentifier configuration:configuration updateSessionInfo:v15];
  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointEditing)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"editingType"];
  if (v5 == 3)
  {
    uint64_t v12 = [v4 decodeStringForKey:@"extensionIdentifier"];
    if (!v12)
    {
      id v8 = PRUISLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      goto LABEL_38;
    }
    id v8 = v12;
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"posterPath"];
    if (!v13)
    {
      id v14 = PRUISLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
LABEL_32:
      }
        -[PRUISModalEntryPointEditing initWithBSXPCCoder:]();
LABEL_44:
      v19 = 0;
LABEL_49:

      goto LABEL_50;
    }
    id v14 = [objc_alloc(MEMORY[0x263F5F350]) _initWithPath:v13];
    if (v14)
    {
      uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionInfo"];
      if (v15)
      {
        v16 = v15;
        id v17 = [(PRUISModalEntryPointEditing *)self initWithType:3 extensionIdentifier:v8 configuration:0 updateSessionInfo:v15];
        id v18 = v17;
        if (v17) {
          objc_storeStrong((id *)&v17->_serviceConfiguration, v14);
        }
        self = v18;
        v19 = self;
        goto LABEL_48;
      }
      v16 = PRUISLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PRUISModalEntryPointEditing initWithBSXPCCoder:]0();
      }
    }
    else
    {
      v16 = PRUISLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PRUISModalEntryPointEditing initWithBSXPCCoder:]();
      }
    }
    v19 = 0;
LABEL_48:

    goto LABEL_49;
  }
  uint64_t v6 = v5;
  if (v5 == 2)
  {
    uint64_t v20 = [v4 decodeStringForKey:@"extensionIdentifier"];
    if (!v20)
    {
      id v8 = PRUISLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
LABEL_28:
      }
        -[PRUISModalEntryPointEditing initWithBSXPCCoder:]();
LABEL_38:
      v19 = 0;
      goto LABEL_50;
    }
    id v8 = v20;
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"posterPath"];
    if (v13)
    {
      id v14 = [objc_alloc(MEMORY[0x263F5F350]) _initWithPath:v13];
      if (v14)
      {
        id v21 = [(PRUISModalEntryPointEditing *)self initWithType:2 extensionIdentifier:v8 configuration:0 updateSessionInfo:0];
        objc_super v22 = v21;
        if (v21) {
          objc_storeStrong((id *)&v21->_serviceConfiguration, v14);
        }
        self = v22;
        v19 = self;
        goto LABEL_49;
      }
      id v24 = PRUISLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[PRUISModalEntryPointEditing initWithBSXPCCoder:]();
      }

      goto LABEL_44;
    }
    id v14 = PRUISLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    goto LABEL_44;
  }
  if (v5 != 1)
  {
    id v11 = 0;
    id v8 = 0;
    goto LABEL_22;
  }
  uint64_t v7 = [v4 decodeStringForKey:@"extensionIdentifier"];
  if (!v7)
  {
    id v8 = PRUISLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    goto LABEL_38;
  }
  id v8 = v7;
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"posterPath"];
  if (!v9)
  {
    objc_super v23 = PRUISLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointEditing initWithBSXPCCoder:]();
    }
    goto LABEL_37;
  }
  uint64_t v10 = [objc_alloc(MEMORY[0x263F5F4B8]) _initWithPath:v9];
  if (!v10)
  {
    objc_super v23 = PRUISLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[PRUISModalEntryPointEditing initWithBSXPCCoder:]();
    }
LABEL_37:

    goto LABEL_38;
  }
  id v11 = (void *)v10;

LABEL_22:
  self = [(PRUISModalEntryPointEditing *)self initWithType:v6 extensionIdentifier:v8 configuration:v11 updateSessionInfo:0];

  v19 = self;
LABEL_50:

  return v19;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  int64_t editingType = self->_editingType;
  switch(editingType)
  {
    case 3:
      uint64_t v10 = [(PRSPosterConfiguration *)self->_serviceConfiguration _path];
      id v16 = 0;
      uint64_t v7 = [v10 extendContentsReadAccessToAuditToken:0 error:&v16];
      id v8 = v16;

      if (!v7)
      {
        id v11 = PRUISLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[PRUISModalEntryPointEditing encodeWithBSXPCCoder:]();
        }
      }
      [v4 encodeObject:v7 forKey:@"posterPath"];
      updateSessionInfo = self->_updateSessionInfo;
      v13 = @"sessionInfo";
      id v14 = v4;
      goto LABEL_17;
    case 2:
      uint64_t v15 = [(PRSPosterConfiguration *)self->_serviceConfiguration _path];
      id v17 = 0;
      uint64_t v7 = [v15 extendContentsReadAccessToAuditToken:0 error:&v17];
      id v8 = v17;

      if (!v7)
      {
        id v9 = PRUISLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[PRUISModalEntryPointEditing encodeWithBSXPCCoder:]();
        }
        goto LABEL_15;
      }
LABEL_16:
      v13 = @"posterPath";
      id v14 = v4;
      updateSessionInfo = v7;
LABEL_17:
      [v14 encodeObject:updateSessionInfo forKey:v13];

      break;
    case 1:
      uint64_t v6 = [(PRMutablePosterConfiguration *)self->_configuration _path];
      id v18 = 0;
      uint64_t v7 = [v6 extendContentsReadAccessToAuditToken:0 error:&v18];
      id v8 = v18;

      if (!v7)
      {
        id v9 = PRUISLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[PRUISModalEntryPointEditing encodeWithBSXPCCoder:]();
        }
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_16;
  }
  [v4 encodeInt64:self->_editingType forKey:@"editingType"];
  [v4 encodeObject:self->_extensionIdentifier forKey:@"extensionIdentifier"];
}

- (id)_BSXPCSecureCodingEntryPointTypeString
{
  return @"Editing";
}

- (PRSPosterConfiguration)_serviceConfiguration
{
  return self->_serviceConfiguration;
}

- (int64_t)editingType
{
  return self->_editingType;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (PRMutablePosterConfiguration)configuration
{
  return self->_configuration;
}

- (PRSPosterUpdateSessionInfo)updateSessionInfo
{
  return self->_updateSessionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSessionInfo, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);

  objc_storeStrong((id *)&self->_serviceConfiguration, 0);
}

- (void)initWithServiceConfiguration:updateSessionInfo:.cold.1()
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

- (void)initWithServiceConfiguration:updateSessionInfo:.cold.2()
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
  OUTLINED_FUNCTION_1_4(&dword_25A03F000, v0, v1, "PRUISModalEntryPointEditing: could not decode extension identifier", v2, v3, v4, v5, v6);
}

- (void)initWithBSXPCCoder:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_25A03F000, v0, v1, "PRUISModalEntryPointEditing: could not decode poster path", v2, v3, v4, v5, v6);
}

- (void)initWithBSXPCCoder:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_25A03F000, v0, v1, "PRUISModalEntryPointEditing: could not create poster configuration", v2, v3, v4, v5, v6);
}

- (void)initWithBSXPCCoder:.cold.10()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_25A03F000, v0, v1, "PRUISModalEntryPointEditing: could not decode update session info", v2, v3, v4, v5, v6);
}

- (void)encodeWithBSXPCCoder:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_25A03F000, v0, v1, "PRUISModalEntryPointEditing: could not obtain poster path with sandbox extension for new poster from configuration: %@", v2, v3, v4, v5, v6);
}

- (void)encodeWithBSXPCCoder:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_25A03F000, v0, v1, "PRUISModalEntryPointEditing: could not obtain poster path with sandbox extension to edit existing configuration: %@", v2, v3, v4, v5, v6);
}

- (void)encodeWithBSXPCCoder:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_25A03F000, v0, v1, "PRUISModalEntryPointEditing: could not obtain poster path with sandbox extension to edit existing configuration with update session info: %@", v2, v3, v4, v5, v6);
}

@end