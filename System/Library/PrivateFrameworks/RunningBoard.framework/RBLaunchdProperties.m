@interface RBLaunchdProperties
+ (id)_instanceWithProperties:(id)a3;
+ (id)processIdentityForEndpoint:(id)a3;
+ (id)propertiesForJob:(id)a3;
+ (id)propertiesForLabel:(id)a3 error:(id *)a4;
+ (id)propertiesForPid:(int)a3;
- (BOOL)doesOverrideManagement;
- (BOOL)hasBackoff;
- (BOOL)hasVariableEUID;
- (BOOL)isAngel;
- (BOOL)isDaemon;
- (BOOL)isMultiInstance;
- (BOOL)isXPCService;
- (NSDictionary)managedEndpointByLaunchIdentifier;
- (NSString)beforeTranslocationBundlePath;
- (NSString)executablePath;
- (NSString)homeDirectory;
- (NSString)jobLabel;
- (NSString)tmpDirectory;
- (NSString)underlyingAssertion;
- (NSUUID)uuid;
- (RBSProcessIdentity)specifiedIdentity;
- (id)_configureAppWithProperties:(id)a3;
- (id)_configureDaemonOrAngelWithProperties:(id)a3 path:(id)a4 isAngel:(BOOL)a5;
- (id)_configureXPCServiceWithProperties:(id)a3;
- (id)_initWithProperties:(id)a3;
- (id)resolvedIdentity;
- (id)resolvedIdentityWithPid:(int)a3 auid:(unsigned int)a4;
- (int)hostPid;
- (unsigned)overrideManageFlags;
- (void)_parseAdditionalProperties:(id)a3;
- (void)_parseEndpoints:(id)a3 withAdditionalProperties:(id)a4;
- (void)_parseLASSProperties:(id)a3;
@end

@implementation RBLaunchdProperties

- (int)hostPid
{
  return self->_hostPid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_tmpDirectory, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_beforeTranslocationBundlePath, 0);
  objc_storeStrong((id *)&self->_specifiedIdentity, 0);
  objc_storeStrong((id *)&self->_underlyingAssertion, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_jobLabel, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)underlyingAssertion
{
  return self->_underlyingAssertion;
}

- (NSString)tmpDirectory
{
  return self->_tmpDirectory;
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (NSString)homeDirectory
{
  return self->_homeDirectory;
}

- (BOOL)doesOverrideManagement
{
  return self->_doesOverrideManagement;
}

- (NSString)beforeTranslocationBundlePath
{
  return self->_beforeTranslocationBundlePath;
}

- (unsigned)overrideManageFlags
{
  return self->_overrideManageFlags;
}

+ (id)propertiesForPid:(int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v10 = 0;
  v5 = [MEMORY[0x263F25298] propertiesForPid:*(void *)&a3 error:&v10];
  id v6 = v10;
  if (v6)
  {
    v7 = rbs_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v12 = a3;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_DEFAULT, "Launchd didn't have information for pid %d, reason: %{public}@", buf, 0x12u);
    }

    v8 = 0;
  }
  else
  {
    v8 = [a1 _instanceWithProperties:v5];
  }

  return v8;
}

+ (id)_instanceWithProperties:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[RBLaunchdProperties alloc] _initWithProperties:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_initWithProperties:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    -[RBLaunchdProperties _initWithProperties:](&v29, buf);
  }
  v5 = v4;
  v28.receiver = self;
  v28.super_class = (Class)RBLaunchdProperties;
  id v6 = [(RBLaunchdProperties *)&v28 init];
  if (v6)
  {
    v7 = [v5 path];
    char v8 = [v5 xpcBundle];
    if (v8)
    {
      char v9 = 0;
      char v10 = 0;
    }
    else
    {
      int v12 = [v7 pathExtension];
      char v9 = [v12 isEqualToString:@"plist"];

      char v10 = v9 ^ 1;
    }
    uint64_t v13 = [v5 label];
    p_jobLabel = (uint64_t *)&v6->_jobLabel;
    jobLabel = v6->_jobLabel;
    v6->_jobLabel = (NSString *)v13;

    [(RBLaunchdProperties *)v6 _parseLASSProperties:v5];
    switch([v5 serviceType])
    {
      case 1:
      case 2:
        if ((v9 & 1) == 0)
        {
          uint64_t v15 = rbs_process_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _initWithProperties:].cold.5();
          }
        }
        v16 = v6;
        v17 = v5;
        v18 = v7;
        uint64_t v19 = 0;
        goto LABEL_28;
      case 3:
        if ((v9 & 1) == 0)
        {
          v23 = rbs_process_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _initWithProperties:].cold.4();
          }
        }
        if (!v6->_doesOverrideHasBackoff) {
          v6->_hasBackoff = 1;
        }
        v16 = v6;
        v17 = v5;
        v18 = v7;
        uint64_t v19 = 1;
LABEL_28:
        uint64_t v21 = [(RBLaunchdProperties *)v16 _configureDaemonOrAngelWithProperties:v17 path:v18 isAngel:v19];
        goto LABEL_29;
      case 4:
        if (v6->_specifiedIdentity)
        {
          if ((v10 & 1) == 0)
          {
            v25 = rbs_process_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
              -[RBLaunchdProperties _initWithProperties:]();
            }
          }
          uint64_t v21 = [(RBLaunchdProperties *)v6 _configureAppWithProperties:v5];
LABEL_29:
          p_jobLabel = (uint64_t *)v21;
        }
        else
        {
          v26 = rbs_process_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = *p_jobLabel;
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v27;
            _os_log_impl(&dword_226AB3000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: RunningBoard doesn't recognize submitted process - treating as a anonymous process", buf, 0xCu);
          }

          p_jobLabel = 0;
        }
LABEL_30:

        break;
      case 5:
      case 6:
        if ((v8 & 1) == 0)
        {
          v20 = rbs_process_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _initWithProperties:].cold.6();
          }
        }
        uint64_t v21 = [(RBLaunchdProperties *)v6 _configureXPCServiceWithProperties:v5];
        goto LABEL_29;
      default:
        v22 = rbs_process_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          -[RBLaunchdProperties _initWithProperties:]((uint64_t)&v6->_jobLabel, v5);
        }

        goto LABEL_30;
    }
  }
  else
  {
    p_jobLabel = 0;
  }

  return p_jobLabel;
}

- (void)_parseLASSProperties:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 instance];
  uuid = self->_uuid;
  self->_uuid = v5;

  self->_BOOL multiInstance = self->_uuid != 0;
  v7 = rbs_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL multiInstance = self->_multiInstance;
    int v19 = 67109120;
    LODWORD(v20) = multiInstance;
    _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_INFO, "_BOOL multiInstance = %d", (uint8_t *)&v19, 8u);
  }

  char v9 = [v4 program];
  executablePath = self->_executablePath;
  self->_executablePath = v9;

  v11 = rbs_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = self->_executablePath;
    int v19 = 138543362;
    v20 = v12;
    _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_INFO, "_executablePath = %{public}@", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v13 = [v4 additionalProperties];
  id v14 = (void *)v13;
  if (v13 && MEMORY[0x22A661A50](v13) == MEMORY[0x263EF8708])
  {
    v17 = rbs_general_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      [(RBLaunchdProperties *)(uint64_t)self _parseLASSProperties:v17];
    }

    [(RBLaunchdProperties *)self _parseAdditionalProperties:v14];
    uint64_t v18 = [v4 endpoints];
    uint64_t v15 = v18;
    if (v18 && MEMORY[0x22A661A50](v18) == MEMORY[0x263EF86D8] && xpc_array_get_count(v15)) {
      [(RBLaunchdProperties *)self _parseEndpoints:v15 withAdditionalProperties:v14];
    }
  }
  else
  {
    uint64_t v15 = rbs_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      jobLabel = self->_jobLabel;
      int v19 = 138412290;
      v20 = jobLabel;
      _os_log_impl(&dword_226AB3000, v15, OS_LOG_TYPE_INFO, "no additional launch properties found for %@", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (RBSProcessIdentity)specifiedIdentity
{
  return self->_specifiedIdentity;
}

- (BOOL)isXPCService
{
  return self->_type == 3;
}

- (BOOL)hasVariableEUID
{
  return self->_variableEUID;
}

- (id)_configureDaemonOrAngelWithProperties:(id)a3 path:(id)a4 isAngel:(BOOL)a5
{
  BOOL v6 = a5;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v22 = rbs_general_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:](v22);
    }
    goto LABEL_21;
  }
  v11 = [v9 label];
  uint64_t v12 = [v11 length];

  if (!v12)
  {
    v22 = rbs_general_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:]();
    }
LABEL_21:

    v23 = 0;
    goto LABEL_69;
  }
  objc_storeStrong((id *)&self->_path, a4);
  BOOL explicitAngelFlag = self->_explicitAngelFlag;
  if (self->_explicitAngelFlag || v6)
  {
    self->_type = 4;
    if (self->_overrideManageFlags != 255)
    {
      v24 = rbs_general_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.9();
      }

      self->_overrideManageFlags = -1;
      BOOL explicitAngelFlag = self->_explicitAngelFlag;
    }
    if (explicitAngelFlag)
    {
      v25 = rbs_general_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.8();
      }
    }
    if ([v9 processType] != 256)
    {
      v26 = rbs_general_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.7((uint64_t)self, v9);
      }
    }
    if ([v9 keepAlive])
    {
      uint64_t v27 = rbs_general_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.6();
      }
    }
    if ([v9 runAtLoad])
    {
      objc_super v28 = rbs_general_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.5();
      }
    }
    if ([v9 enableTransactions])
    {
      uint64_t v29 = rbs_general_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.4();
      }
    }
    if ([v9 enablePressuredExit])
    {
      v30 = rbs_general_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:]();
      }
    }
    id v14 = [v9 endpoints];
    if (!xpc_array_get_count(v14) || !xpc_array_get_count(v14)) {
      goto LABEL_68;
    }
    id v42 = v10;
    id v43 = v9;
    size_t v31 = 0;
    do
    {
      v32 = xpc_array_get_value(v14, v31);
      string = xpc_dictionary_get_string(v32, "XPCServiceEndpointName");
      v34 = rbs_general_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        jobLabel = self->_jobLabel;
        if (string)
        {
          v5 = [NSString stringWithUTF8String:string];
          v36 = v5;
        }
        else
        {
          v36 = @"<NO-NAME>";
        }
        *(_DWORD *)buf = 138543618;
        v45 = jobLabel;
        __int16 v46 = 2114;
        v47 = v36;
        _os_log_impl(&dword_226AB3000, v34, OS_LOG_TYPE_INFO, "Checking angel %{public}@ for mach service with name %{public}@", buf, 0x16u);
        if (string) {
      }
        }
      if (!xpc_dictionary_get_BOOL(v32, "XPCServiceEndpointNonLaunching"))
      {
        v37 = rbs_general_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          v38 = self->_jobLabel;
          v39 = @"<NO-NAME>";
          if (string)
          {
            v41 = [NSString stringWithUTF8String:string];
            v39 = v41;
          }
          *(_DWORD *)buf = 138543618;
          v45 = v38;
          __int16 v46 = 2114;
          v47 = v39;
          _os_log_fault_impl(&dword_226AB3000, v37, OS_LOG_TYPE_FAULT, "Angel %{public}@ has the unsupported launching mach service with name %{public}@", buf, 0x16u);
          if (string) {
        }
          }
      }

      ++v31;
    }
    while (xpc_array_get_count(v14) > v31);
  }
  else
  {
    self->_type = 2;
    id v14 = [v9 endpoints];
    if (!xpc_array_get_count(v14) || !xpc_array_get_count(v14)) {
      goto LABEL_68;
    }
    id v42 = v10;
    id v43 = v9;
    size_t v15 = 0;
    do
    {
      v16 = xpc_array_get_value(v14, v15);
      v17 = xpc_dictionary_get_string(v16, "XPCServiceEndpointName");
      if (v17)
      {
        uint64_t v18 = v17;
        if (!strcmp(v17, "com.apple.frontboard.workspace") || !strcmp(v18, "com.apple.frontboard.systemappservices"))
        {
          int v19 = rbs_general_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = self->_jobLabel;
            uint64_t v21 = [NSString stringWithUTF8String:v18];
            *(_DWORD *)buf = 138543618;
            v45 = v20;
            __int16 v46 = 2114;
            v47 = v21;
            _os_log_impl(&dword_226AB3000, v19, OS_LOG_TYPE_DEFAULT, "Found FrontBoard mach service for daemon %{public}@ with name %{public}@", buf, 0x16u);
          }
          if (!self->_doesOverrideManagement)
          {
            self->_doesOverrideManagement = 1;
            self->_overrideManageFlags = 2;
          }
        }
      }

      ++v15;
    }
    while (xpc_array_get_count(v14) > v15);
  }
  id v10 = v42;
  id v9 = v43;
LABEL_68:

  v23 = self;
LABEL_69:

  return v23;
}

- (id)resolvedIdentityWithPid:(int)a3 auid:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if ([(RBLaunchdProperties *)self isDaemon])
  {
    v7 = (void *)MEMORY[0x263F64598];
    char v8 = [(RBLaunchdProperties *)self jobLabel];
    id v9 = objc_msgSend(v7, "identityForLaunchdJobLabel:isMultiInstance:pid:auid:", v8, -[RBLaunchdProperties isMultiInstance](self, "isMultiInstance"), v5, v4);

    goto LABEL_10;
  }
  if ([(RBLaunchdProperties *)self isAngel])
  {
    id v10 = [(RBLaunchdProperties *)self jobLabel];

    if (v10)
    {
      v11 = (void *)MEMORY[0x263F64598];
      uint64_t v12 = [(RBLaunchdProperties *)self jobLabel];
      id v9 = [v11 identityForAngelJobLabel:v12];

      goto LABEL_10;
    }
    uint64_t v13 = rbs_general_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchdProperties resolvedIdentityWithPid:auid:](v13);
    }
  }
  id v9 = 0;
LABEL_10:
  return v9;
}

- (BOOL)isDaemon
{
  return self->_type == 2;
}

- (NSString)jobLabel
{
  return self->_jobLabel;
}

- (BOOL)isMultiInstance
{
  return self->_multiInstance;
}

- (void)_parseAdditionalProperties:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v4 = xpc_dictionary_get_value(a3, "RunningBoard");
  uint64_t v5 = (void *)v4;
  if (v4 && MEMORY[0x22A661A50](v4) == MEMORY[0x263EF8708])
  {
    uint64_t v7 = xpc_dictionary_get_value(v5, "Managed");
    BOOL v6 = v7;
    uint64_t v8 = MEMORY[0x263EF86E0];
    if (v7)
    {
      if (MEMORY[0x22A661A50](v7) == v8)
      {
        self->_BOOL doesOverrideManagement = 1;
        if (xpc_BOOL_get_value(v6)) {
          self->_int overrideManageFlags = -1;
        }
      }
    }
    uint64_t v9 = xpc_dictionary_get_value(v5, "Reported");
    id v10 = (void *)v9;
    if (v9)
    {
      if (MEMORY[0x22A661A50](v9) == v8)
      {
        self->_BOOL doesOverrideManagement = 1;
        if (xpc_BOOL_get_value(v10)) {
          self->_overrideManageFlags |= 2u;
        }
      }
    }
    uint64_t v48 = v10;
    uint64_t v11 = xpc_dictionary_get_value(v5, "ExplicitAng");
    uint64_t v12 = (void *)v11;
    if (v11 && MEMORY[0x22A661A50](v11) == v8) {
      self->_BOOL explicitAngelFlag = xpc_BOOL_get_value(v12);
    }
    v47 = v12;
    uint64_t v13 = xpc_dictionary_get_value(v5, "UnderlyingAssertion");
    id v14 = (void *)v13;
    uint64_t v15 = MEMORY[0x263EF8798];
    if (v13 && MEMORY[0x22A661A50](v13) == v15)
    {
      v16 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v14)];
      underlyingAssertion = self->_underlyingAssertion;
      self->_underlyingAssertion = v16;
    }
    __int16 v46 = v14;
    uint64_t v18 = xpc_dictionary_get_value(v5, "VariableEUID");
    int v19 = (void *)v18;
    if (v18 && MEMORY[0x22A661A50](v18) == v8) {
      self->_BOOL variableEUID = xpc_BOOL_get_value(v19);
    }
    uint64_t v20 = xpc_dictionary_get_value(v5, "Backoff");
    uint64_t v21 = (void *)v20;
    if (v20 && MEMORY[0x22A661A50](v20) == v8)
    {
      self->_doesOverrideHasBackoff = 1;
      self->_hasBackoff = xpc_BOOL_get_value(v21);
    }
    v22 = xpc_dictionary_get_value(v5, "RunningBoardLaunchedIdentity");
    if (v22)
    {
      v23 = (void *)MEMORY[0x263F64598];
      v24 = [(RBLaunchdProperties *)self uuid];
      v25 = [v23 decodeFromJob:v22 uuid:v24];
      specifiedIdentity = self->_specifiedIdentity;
      self->_specifiedIdentity = v25;
    }
    uint64_t v27 = xpc_dictionary_get_value(v5, "BeforeTranslocationBundlePath");
    objc_super v28 = (void *)v27;
    if (v27 && MEMORY[0x22A661A50](v27) == v15)
    {
      uint64_t v29 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v28)];
      beforeTranslocationBundlePath = self->_beforeTranslocationBundlePath;
      self->_beforeTranslocationBundlePath = v29;
    }
    uint64_t v31 = xpc_dictionary_get_value(v5, "HOME");
    v32 = (void *)v31;
    if (v31 && MEMORY[0x22A661A50](v31) == v15)
    {
      v33 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v32)];
      homeDirectory = self->_homeDirectory;
      self->_homeDirectory = v33;
    }
    uint64_t v35 = xpc_dictionary_get_value(v5, "TMPDIR");
    v36 = (void *)v35;
    if (v35 && MEMORY[0x22A661A50](v35) == v15)
    {
      v37 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v36)];
      tmpDirectory = self->_tmpDirectory;
      self->_tmpDirectory = v37;
    }
    v39 = rbs_general_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      BOOL doesOverrideManagement = self->_doesOverrideManagement;
      int overrideManageFlags = self->_overrideManageFlags;
      BOOL variableEUID = self->_variableEUID;
      id v43 = self->_underlyingAssertion;
      v44 = self->_specifiedIdentity;
      v45 = self->_beforeTranslocationBundlePath;
      *(_DWORD *)buf = 67110402;
      BOOL v50 = doesOverrideManagement;
      __int16 v51 = 1024;
      int v52 = overrideManageFlags;
      __int16 v53 = 2114;
      v54 = v43;
      __int16 v55 = 1024;
      BOOL v56 = variableEUID;
      __int16 v57 = 2114;
      v58 = v44;
      __int16 v59 = 2114;
      v60 = v45;
      _os_log_impl(&dword_226AB3000, v39, OS_LOG_TYPE_INFO, "_BOOL doesOverrideManagement = %d, _overrideManageFlags = %d, _underlyingAssertion = %{public}@, _variableEUID = %d, _specifiedIdenity = %{public}@ _beforeTranslocationBundlePath = %{public}@", buf, 0x32u);
    }
  }
  else
  {
    BOOL v6 = rbs_general_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226AB3000, v6, OS_LOG_TYPE_INFO, "_parseAdditionalProperties no RBProperties", buf, 2u);
    }
  }
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)_configureXPCServiceWithProperties:(id)a3
{
  self->_hostPid = [a3 hostPID];
  self->_type = 3;
  return self;
}

- (id)_configureAppWithProperties:(id)a3
{
  *((void *)self + 1) = 1;
  return self;
}

- (void)_parseEndpoints:(id)a3 withAdditionalProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (xpc_array_get_count(v5))
  {
    xpc_object_t xdict = v6;
    id v37 = v5;
    size_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = "XPCServiceEndpointName";
    id v10 = "XPCServiceEndpointNonLaunching";
    uint64_t v11 = "XPCServiceEndpointPort";
    do
    {
      uint64_t v12 = xpc_array_get_dictionary(v5, v7);
      string = xpc_dictionary_get_string(v12, v9);
      BOOL v14 = xpc_dictionary_get_BOOL(v12, v10);
      uint64_t v15 = xpc_dictionary_get_value(v12, v11);
      v16 = (void *)v15;
      if (string && v15)
      {
        v17 = v11;
        uint64_t v18 = v10;
        int v19 = v9;
        id v20 = objc_alloc(MEMORY[0x263F64500]);
        uint64_t v21 = [NSString stringWithUTF8String:string];
        v22 = (void *)[v20 _initWithName:v21 nonLaunching:v14 port:v16];

        if (v8)
        {
          v23 = [v22 name];
          [v8 setObject:v22 forKey:v23];
        }
        else
        {
          v24 = (void *)MEMORY[0x263EFF9A0];
          v23 = [v22 name];
          uint64_t v8 = [v24 dictionaryWithObject:v22 forKey:v23];
        }
        uint64_t v9 = v19;
        id v10 = v18;
        uint64_t v11 = v17;
        id v5 = v37;
      }
      ++v7;
    }
    while (xpc_array_get_count(v5) > v7);
    id v6 = xdict;
    if (v8)
    {
      uint64_t v25 = xpc_dictionary_get_dictionary(xdict, "RunningBoard");
      v26 = (void *)v25;
      if (v25)
      {
        uint64_t v27 = MEMORY[0x22A661A50](v25);
        uint64_t v28 = MEMORY[0x263EF8708];
        if (v27 == MEMORY[0x263EF8708])
        {
          uint64_t v29 = xpc_dictionary_get_dictionary(v26, "LaunchRequestEndpointIdentifiers");
          v30 = (void *)v29;
          if (v29 && MEMORY[0x22A661A50](v29) == v28)
          {
            uint64_t v31 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:xpc_dictionary_get_count(v30)];
            applier[0] = MEMORY[0x263EF8330];
            applier[1] = 3221225472;
            applier[2] = __64__RBLaunchdProperties__parseEndpoints_withAdditionalProperties___block_invoke;
            applier[3] = &unk_2647C89D8;
            id v39 = v8;
            v40 = self;
            id v32 = v31;
            id v41 = v32;
            if (xpc_dictionary_apply(v30, applier) && [v32 count])
            {
              v33 = (NSDictionary *)[v32 copy];
              managedEndpointByLaunchIdentifier = self->_managedEndpointByLaunchIdentifier;
              self->_managedEndpointByLaunchIdentifier = v33;
            }
          }
        }
      }
    }
  }
}

- (BOOL)isAngel
{
  return self->_type == 4;
}

- (BOOL)hasBackoff
{
  return self->_hasBackoff;
}

uint64_t __64__RBLaunchdProperties__parseEndpoints_withAdditionalProperties___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (MEMORY[0x22A661A50]() != MEMORY[0x263EF86E0])
  {
    if (MEMORY[0x22A661A50](v5) != MEMORY[0x263EF8798])
    {
      id v6 = rbs_process_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      goto LABEL_12;
    }
    id v10 = [NSString stringWithUTF8String:a2];
    uint64_t v11 = (void *)a1[4];
    uint64_t v12 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v5)];
    id v6 = [v11 objectForKey:v12];

    if (v6)
    {
      uint64_t v9 = (void *)a1[6];
      if (v10)
      {
        [v9 setObject:v6 forKey:v10];
LABEL_14:
        uint64_t v13 = 1;
        goto LABEL_15;
      }
LABEL_13:
      BOOL v14 = [v6 name];
      [v9 setObject:v6 forKey:v14];

      id v10 = 0;
      goto LABEL_14;
    }
    goto LABEL_18;
  }
  if (xpc_BOOL_get_value(v5))
  {
    size_t v7 = (void *)a1[4];
    uint64_t v8 = [NSString stringWithUTF8String:a2];
    id v6 = [v7 objectForKey:v8];

    if (v6)
    {
      uint64_t v9 = (void *)a1[6];
      goto LABEL_13;
    }
    id v10 = 0;
LABEL_18:
    uint64_t v13 = 1;
    goto LABEL_16;
  }
  id v6 = rbs_process_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
LABEL_19:
    uint64_t v16 = *(void *)(a1[5] + 32);
    v17 = [v5 debugDescription];
    int v18 = 138543874;
    uint64_t v19 = v16;
    __int16 v20 = 2080;
    uint64_t v21 = a2;
    __int16 v22 = 2112;
    v23 = v17;
    _os_log_error_impl(&dword_226AB3000, v6, OS_LOG_TYPE_ERROR, "%{public}@: LaunchRequestEndpointIdentifiers entry (%s) is malformed (expect only true or string mappings) - ignoring %@", (uint8_t *)&v18, 0x20u);
  }
LABEL_12:
  id v10 = 0;
  uint64_t v13 = 0;
LABEL_15:

LABEL_16:
  return v13;
}

+ (id)propertiesForJob:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  id v5 = [MEMORY[0x263F25298] propertiesForJob:v4 error:&v10];
  id v6 = v10;
  if (v5)
  {
    size_t v7 = [a1 _instanceWithProperties:v5];
  }
  else
  {
    uint64_t v8 = rbs_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[RBLaunchdProperties propertiesForJob:]();
    }

    size_t v7 = 0;
  }

  return v7;
}

+ (id)propertiesForLabel:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F252A8];
  id v6 = (void *)MEMORY[0x263F252A0];
  id v7 = a3;
  uint64_t v8 = [v6 currentDomain];
  uint64_t v9 = (void *)[v5 copyJobWithLabel:v7 domain:v8];

  if (v9)
  {
    uint64_t v10 = +[RBLaunchdProperties propertiesForJob:v9];
    uint64_t v11 = (void *)v10;
    if (a4 && !v10)
    {
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F646B8];
      uint64_t v19 = *MEMORY[0x263F08338];
      __int16 v20 = @"Launchd did not have information on this label";
      BOOL v14 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v15 = [v12 errorWithDomain:v13 code:4 userInfo:v14];
LABEL_7:
      *a4 = v15;
    }
  }
  else
  {
    if (a4)
    {
      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F646B8];
      uint64_t v21 = *MEMORY[0x263F08338];
      v22[0] = @"Could not find launchd job for label";
      BOOL v14 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v15 = [v16 errorWithDomain:v17 code:4 userInfo:v14];
      uint64_t v11 = 0;
      goto LABEL_7;
    }
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)processIdentityForEndpoint:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14[0] = 0;
  v14[1] = 0;
  if (xpc_endpoint_get_bs_job_handle())
  {
    id v5 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v14];
    id v6 = (void *)[MEMORY[0x263F252A8] copyJobWithHandle:v5];
    if (v6)
    {
      id v7 = [a1 propertiesForJob:v6];
      uint64_t v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 specifiedIdentity];
        uint64_t v10 = v9;
        if (v9)
        {
          uint64_t v11 = v9;
          uint64_t v10 = v11;
        }
        else
        {
          uint64_t v11 = [v8 resolvedIdentity];
        }
        uint64_t v12 = v11;
      }
      else
      {
        uint64_t v10 = rbs_general_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          +[RBLaunchdProperties processIdentityForEndpoint:]();
        }
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v8 = rbs_general_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[RBLaunchdProperties processIdentityForEndpoint:]();
      }
      uint64_t v12 = 0;
    }
  }
  else
  {
    id v5 = rbs_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[RBLaunchdProperties processIdentityForEndpoint:]();
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)resolvedIdentity
{
  return [(RBLaunchdProperties *)self resolvedIdentityWithPid:0 auid:0];
}

- (void)_initWithProperties:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (void)_initWithProperties:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  [a2 serviceType];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_226AB3000, v2, v3, "%{public}@: Unrecognized launchd process type %d", v4, v5, v6, v7, v8);
}

- (void)_initWithProperties:.cold.3()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_3(&dword_226AB3000, v0, v1, "%{public}@: RunningBoard legacy process type resolved as %d, new system resolved as an app");
}

- (void)_initWithProperties:.cold.4()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_3(&dword_226AB3000, v0, v1, "%{public}@: RunningBoard legacy process type resolved as %d, new system resolved as an angel");
}

- (void)_initWithProperties:.cold.5()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_3(&dword_226AB3000, v0, v1, "%{public}@: RunningBoard legacy process type resolved as %d, new system resolved as a daemon");
}

- (void)_initWithProperties:.cold.6()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_3(&dword_226AB3000, v0, v1, "%{public}@: RunningBoard legacy process type resolved as %d, new system resolved as an XPC Service");
}

+ (void)propertiesForJob:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "Launchd didn't have information for job %{public}@, reason: %{public}@");
}

+ (void)processIdentityForEndpoint:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "no job for endpoint %@ from looked up handle=%@");
}

+ (void)processIdentityForEndpoint:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "no properties found for job %@", v2, v3, v4, v5, v6);
}

+ (void)processIdentityForEndpoint:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "no job handle found for endpoint %@", v2, v3, v4, v5, v6);
}

- (void)resolvedIdentityWithPid:(os_log_t)log auid:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "Resolved angel without job label", v1, 2u);
}

- (void)_parseLASSProperties:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 NSRepresentation];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_226AB3000, a3, OS_LOG_TYPE_DEBUG, "additional launch properties for %@: %@", (uint8_t *)&v6, 0x16u);
}

- (void)_configureDaemonOrAngelWithProperties:(os_log_t)log path:isAngel:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "attempted to create daemon with no path", v1, 2u);
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Ignoring invalid daemon defined at %{public}@ because it has no job label.", v2, v3, v4, v5, v6);
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.3()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "Angel %{public}@ has the unsupported key 'enablePressuredExit'", v2, v3, v4, v5, v6);
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.4()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "Angel %{public}@ has the unsupported key 'enableTransactions'", v2, v3, v4, v5, v6);
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.5()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "Angel %{public}@ has the unsupported key 'runAtLoad'", v2, v3, v4, v5, v6);
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.6()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "Angel %{public}@ has the unsupported key 'KeepAlive'", v2, v3, v4, v5, v6);
}

- (void)_configureDaemonOrAngelWithProperties:(uint64_t)a1 path:(void *)a2 isAngel:.cold.7(uint64_t a1, void *a2)
{
  [a2 processType];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_226AB3000, v2, v3, "Angel %{public}@ is using a ProcessType other than app: %d", v4, v5, v6, v7, v8);
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.8()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "Angel %{public}@ is using deprecated flag ExplicitAng - move plist to the correct location and remove this flag", v2, v3, v4, v5, v6);
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.9()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "Explicit ang %{public}@ doesn't explicitly state management", v2, v3, v4, v5, v6);
}

@end