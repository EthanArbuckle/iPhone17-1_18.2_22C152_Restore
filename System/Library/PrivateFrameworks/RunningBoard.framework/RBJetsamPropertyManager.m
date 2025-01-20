@interface RBJetsamPropertyManager
+ (id)testJetsamProperties;
+ (id)unmanagedJetsamProperties;
+ (int)testTaskLimitForPid:(int)a3;
+ (uint64_t)_taskLimit;
- (BOOL)_isNotValidProperties:(BOOL)a1;
- (RBJetsamPropertyManager)initWithEntitlementManager:(id)a3;
- (RBJetsamPropertyManager)initWithEntitlementManager:(id)a3 properties:(id)a4;
- (__CFString)_jetsamTargetType;
- (id)_encodedValue:(uint64_t)a1;
- (id)_jetsamPropertiesForAngelProcess:(uint64_t)a1 identity:(uint64_t)a2 bundleProperties:(void *)a3;
- (id)_jetsamPropertiesForAppProcess:(uint64_t)a3 identity:(void *)a4 bundleProperties:(int)a5 isPlatformBinary:;
- (id)_jetsamPropertiesForDaemonProcess:(uint64_t)a1 identity:(uint64_t)a2 bundleProperties:(void *)a3;
- (id)_jetsamPropertiesForExtensionProcess:(void *)a3 identity:(void *)a4 bundleProperties:;
- (id)_jetsamPropertiesForProcess:(void *)a3 identifier:(void *)a4 properties:(void *)a5 global:;
- (id)_jetsamPropertiesForServiceProcess:(uint64_t)a3 identity:(void *)a4 bundleProperties:(int)a5 isPlatformBinary:;
- (id)_jetsamPropertiesWithTaskLimit:(void *)a1;
- (id)_jetsamTryBasePath:(void *)a3 target:(void *)a4 extension:;
- (id)_jetsamTryPath:(void *)a3 target:(void *)a4 extension:;
- (id)_loadJetsamProperties;
- (id)jetsamPropertiesForProcess:(int)a3 identity:(id)a4 bundleProperties:(id)a5 isPlatformBinary:(BOOL)a6;
- (uint64_t)_taskLimitForProcess:(uint64_t)a1;
- (uint64_t)_unLimitForProcess:(uint64_t)a1;
- (void)_addJetsamValuesForSection:(void *)a3 fromPlist:(void *)a4 toDatabase:;
- (void)_jetsamTargetType;
- (void)_loadJetsamProperties;
- (void)_prepareJetsamData:(id *)a1;
@end

@implementation RBJetsamPropertyManager

- (id)jetsamPropertiesForProcess:(int)a3 identity:(id)a4 bundleProperties:(id)a5 isPlatformBinary:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  if (os_variant_has_internal_content())
  {
    v12 = [v10 embeddedApplicationIdentifier];
    if ([v12 isEqualToString:@"com.apple.runningboard.test.limePuppet"])
    {
      v13 = +[RBJetsamPropertyManager testJetsamProperties];

      goto LABEL_19;
    }
  }
  if ([v10 isApplication])
  {
    uint64_t v15 = -[RBJetsamPropertyManager _jetsamPropertiesForAppProcess:identity:bundleProperties:isPlatformBinary:]((uint64_t)self, v8, v14, v11, v6);
  }
  else if ([v10 osServiceType] == 2)
  {
    uint64_t v15 = -[RBJetsamPropertyManager _jetsamPropertiesForDaemonProcess:identity:bundleProperties:]((uint64_t)self, v8, v10);
  }
  else if ([v10 osServiceType] == 3)
  {
    uint64_t v15 = -[RBJetsamPropertyManager _jetsamPropertiesForAngelProcess:identity:bundleProperties:]((uint64_t)self, v8, v10);
  }
  else if ([v10 isExtension])
  {
    uint64_t v15 = -[RBJetsamPropertyManager _jetsamPropertiesForExtensionProcess:identity:bundleProperties:]((uint64_t)self, v8, v10, v11);
  }
  else if ([v10 isXPCService])
  {
    uint64_t v15 = -[RBJetsamPropertyManager _jetsamPropertiesForServiceProcess:identity:bundleProperties:isPlatformBinary:]((uint64_t)self, v8, v16, v11, v6);
  }
  else
  {
    v17 = rbs_jetsam_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[RBJetsamPropertyManager jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:]();
    }

    uint64_t v18 = -[RBJetsamPropertyManager _taskLimitForProcess:]((uint64_t)self);
    uint64_t v15 = -[RBJetsamPropertyManager _jetsamPropertiesWithTaskLimit:](self, v18);
  }
  v13 = (void *)v15;
LABEL_19:

  return v13;
}

- (id)_jetsamPropertiesForDaemonProcess:(uint64_t)a1 identity:(uint64_t)a2 bundleProperties:(void *)a3
{
  if (a1)
  {
    v5 = [a3 consistentLaunchdJobLabel];
    BOOL v6 = -[RBJetsamPropertyManager _jetsamPropertiesForProcess:identifier:properties:global:](a1, a2, v5, *(void **)(a1 + 112), *(void **)(a1 + 120));
  }
  else
  {
    BOOL v6 = 0;
  }
  return v6;
}

- (id)_jetsamPropertiesForProcess:(void *)a3 identifier:(void *)a4 properties:(void *)a5 global:
{
  if (a1)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    uint64_t v11 = -[RBJetsamPropertyManager _taskLimitForProcess:](a1);
    uint64_t v12 = -[RBJetsamPropertyManager _unLimitForProcess:](a1);
    v13 = [v9 valueForKey:v10];

    uint64_t v14 = (void *)[v13 copy];
    uint64_t v15 = +[RBJetsamProperties jetsamPropertiesForProperties:v14 globalProperties:v8 taskLimit:v11 unLimit:v12];
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (uint64_t)_taskLimitForProcess:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = memorystatus_control();
  if ((int)v1 <= 0)
  {
    v2 = rbs_jetsam_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[RBJetsamPropertyManager _taskLimitForProcess:]();
    }

    return +[RBJetsamPropertyManager _taskLimit]();
  }
  return v1;
}

- (uint64_t)_unLimitForProcess:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = memorystatus_control();
  if ((int)v1 <= 0)
  {
    v2 = rbs_jetsam_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[RBJetsamPropertyManager _unLimitForProcess:]();
    }

    return +[RBJetsamPropertyManager _taskLimit]();
  }
  return v1;
}

- (id)_jetsamPropertiesForServiceProcess:(uint64_t)a3 identity:(void *)a4 bundleProperties:(int)a5 isPlatformBinary:
{
  if (a1)
  {
    id v8 = [a4 bundleIdentifier];
    id v9 = (void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 32) valueForKey:v8];

    if (v10)
    {
      uint64_t v11 = 40;
    }
    else
    {
      uint64_t v12 = [*(id *)(a1 + 16) valueForKey:v8];

      uint64_t v11 = 24;
      if (a5) {
        v13 = (void **)(a1 + 32);
      }
      else {
        v13 = (void **)(a1 + 16);
      }
      uint64_t v14 = 24;
      if (a5) {
        uint64_t v14 = 40;
      }
      if (v12) {
        id v9 = (void **)(a1 + 16);
      }
      else {
        id v9 = v13;
      }
      if (!v12) {
        uint64_t v11 = v14;
      }
    }
    uint64_t v15 = -[RBJetsamPropertyManager _jetsamPropertiesForProcess:identifier:properties:global:](a1, a2, v8, *v9, *(void **)(a1 + v11));
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)_jetsamPropertiesForAppProcess:(uint64_t)a3 identity:(void *)a4 bundleProperties:(int)a5 isPlatformBinary:
{
  if (a1)
  {
    id v8 = [a4 bundleIdentifier];
    id v9 = (void **)(a1 + 96);
    id v10 = [*(id *)(a1 + 96) valueForKey:v8];

    if (v10)
    {
      uint64_t v11 = 104;
    }
    else
    {
      uint64_t v12 = [*(id *)(a1 + 80) valueForKey:v8];

      uint64_t v11 = 88;
      if (a5) {
        v13 = (void **)(a1 + 96);
      }
      else {
        v13 = (void **)(a1 + 80);
      }
      uint64_t v14 = 88;
      if (a5) {
        uint64_t v14 = 104;
      }
      if (v12) {
        id v9 = (void **)(a1 + 80);
      }
      else {
        id v9 = v13;
      }
      if (!v12) {
        uint64_t v11 = v14;
      }
    }
    uint64_t v15 = -[RBJetsamPropertyManager _jetsamPropertiesForProcess:identifier:properties:global:](a1, a2, v8, *v9, *(void **)(a1 + v11));
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)_jetsamPropertiesForExtensionProcess:(void *)a3 identity:(void *)a4 bundleProperties:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    int v9 = [v7 isExternal];
    id v10 = [v8 extensionPointIdentifier];
    uint64_t v11 = 48;
    if (v9) {
      uint64_t v11 = 64;
    }
    uint64_t v12 = 56;
    if (v9) {
      uint64_t v12 = 72;
    }
    v13 = -[RBJetsamPropertyManager _jetsamPropertiesForProcess:identifier:properties:global:](a1, a2, v10, *(void **)(a1 + v11), *(void **)(a1 + v12));
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_jetsamPropertiesWithTaskLimit:(void *)a1
{
  if (a1)
  {
    a1 = +[RBJetsamProperties jetsamPropertiesForProperties:&unk_26DAB1318 globalProperties:MEMORY[0x263EFFA78] taskLimit:a2 unLimit:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)_taskLimit
{
  if (_taskLimit_onceToken != -1) {
    dispatch_once(&_taskLimit_onceToken, &__block_literal_global_10);
  }
  return _taskLimit_taskLimit;
}

void __37__RBJetsamPropertyManager__taskLimit__block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = 0;
  size_t v3 = 4;
  int v0 = sysctlbyname("kern.max_task_pmem", &v4, &v3, 0, 0);
  uint64_t v1 = rbs_jetsam_log();
  uint64_t v2 = v1;
  if (v0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __37__RBJetsamPropertyManager__taskLimit__block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v6 = v4;
    _os_log_impl(&dword_226AB3000, v2, OS_LOG_TYPE_DEFAULT, "Jetsam database _kern_max_task_pmem=%d", buf, 8u);
  }

  _taskLimit_taskLimit = v4;
}

- (__CFString)_jetsamTargetType
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    int v6 = 0;
    goto LABEL_26;
  }
  size_t size = 16;
  int v1 = sysctlbyname("hw.targettype", v18, &size, 0, 0);
  if (v1)
  {
    uint64_t v2 = rbs_jetsam_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(RBJetsamPropertyManager *)(uint64_t *)&size _jetsamTargetType];
    }
  }
  if (size)
  {
    if (!v1) {
      goto LABEL_10;
    }
LABEL_16:
    int v6 = &stru_26DA9D688;
    goto LABEL_26;
  }
  size_t size = 16;
  *__error() = 12;
  if (v1) {
    goto LABEL_16;
  }
  if (size != 16 || *__error() != 12) {
    goto LABEL_23;
  }
LABEL_10:
  int v3 = sysctlbyname("hw.targettype", 0, &size, 0, 0);
  if (v3)
  {
    int v4 = v3;
    v5 = rbs_jetsam_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(RBJetsamPropertyManager *)(uint64_t *)&size _jetsamTargetType];
    }

    goto LABEL_16;
  }
  if (size >= 0x11)
  {
    uint64_t v7 = malloc_type_malloc(size, 0xCCB9267FuLL);
    int v8 = sysctlbyname("hw.targettype", v7, &size, 0, 0);
    if (v8)
    {
      int v9 = v8;
      id v10 = rbs_jetsam_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v15 = v9;
        __int16 v16 = 2048;
        size_t v17 = size;
        _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "SyscallError: getJetsamPriorityBandFromSystem getJetsamPropertyInfo sysctlbyname try 3 -> %d, %zu", buf, 0x12u);
      }
    }
    uint64_t v11 = v7;
  }
  else
  {
LABEL_23:
    uint64_t v7 = 0;
    uint64_t v11 = v18;
  }
  int v6 = (__CFString *)[[NSString alloc] initWithUTF8String:v11];
  if (v7) {
    free(v7);
  }
LABEL_26:
  return v6;
}

- (id)_jetsamTryPath:(void *)a3 target:(void *)a4 extension:
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v6 = (objc_class *)NSString;
    id v7 = a4;
    id v8 = a3;
    id v9 = a2;
    id v10 = (void *)[[v6 alloc] initWithFormat:@"%@.%@.%@", v9, v8, v7];

    uint64_t v11 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v10];
    if (v11)
    {
      uint64_t v12 = rbs_jetsam_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v15 = v10;
        _os_log_impl(&dword_226AB3000, v12, OS_LOG_TYPE_DEFAULT, "Loaded jetsamproperties from %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)_jetsamTryBasePath:(void *)a3 target:(void *)a4 extension:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id v9 = -[RBJetsamPropertyManager _jetsamTryPath:target:extension:](a1, v7, a3, v8);
    if (!v9)
    {
      id v9 = -[RBJetsamPropertyManager _jetsamTryPath:target:extension:](a1, v7, @"NonUI", v8);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_loadJetsamProperties
{
  if (a1)
  {
    uint64_t v2 = -[RBJetsamPropertyManager _jetsamTargetType](a1);
    int is_darwinos = os_variant_is_darwinos();
    int v4 = @"plist";
    if (is_darwinos) {
      int v4 = @"darwin.plist";
    }
    v5 = v4;
    if (!os_variant_has_internal_content()
      || (-[RBJetsamPropertyManager _jetsamTryBasePath:target:extension:](a1, @"/AppleInternal/Library/LaunchDaemons/com.apple.jetsamproperties", v2, v5), (int v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      int v6 = -[RBJetsamPropertyManager _jetsamTryBasePath:target:extension:](a1, @"/System/Library/LaunchDaemons/com.apple.jetsamproperties", v2, v5);
      if (!v6)
      {
        id v7 = rbs_jetsam_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(RBJetsamPropertyManager *)(uint64_t)v2 _loadJetsamProperties];
        }

        int v6 = 0;
      }
    }
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (BOOL)_isNotValidProperties:(BOOL)a1
{
  id v3 = a2;
  int v4 = v3;
  if (a1)
  {
    if (v3 && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || [v4 count]))
    {
      objc_opt_class();
      a1 = (objc_opt_isKindOfClass() & 1) != 0 && [v4 unsignedLongLongValue] == 0;
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

- (void)_prepareJetsamData:(id *)a1
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    id v69 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v68 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v70 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v3)
    {
      id v9 = RBSDictionaryForKey();

      if (v9)
      {
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, @"Extension", v9, v5);
        uint64_t v10 = [v5 objectForKeyedSubscript:@"Global"];
        id v11 = a1[7];
        a1[7] = (id)v10;

        uint64_t v12 = v68;
        if (-[RBJetsamPropertyManager _isNotValidProperties:]((BOOL)a1, a1[7]))
        {
          id v13 = a1[7];
          a1[7] = &unk_26DAB12F0;
        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, @"ExternalExtension", v9, v6);
        uint64_t v14 = [v6 objectForKeyedSubscript:@"Global"];
        id v15 = a1[9];
        a1[9] = (id)v14;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((BOOL)a1, a1[9]))
        {
          id v16 = a1[9];
          a1[9] = &unk_26DAB12F0;
        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, @"XPCService", v9, v69);
        uint64_t v17 = [v69 objectForKeyedSubscript:@"Global"];
        id v18 = a1[3];
        a1[3] = (id)v17;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((BOOL)a1, a1[3]))
        {
          id v19 = a1[3];
          a1[3] = &unk_26DAB12F0;
        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, @"SystemXPCService", v9, v4);
        uint64_t v20 = [v4 objectForKeyedSubscript:@"Global"];
        id v21 = a1[5];
        a1[5] = (id)v20;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((BOOL)a1, a1[5]))
        {
          id v22 = a1[5];
          a1[5] = &unk_26DAB12F0;
        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, @"App", v9, v7);
        uint64_t v23 = [v7 objectForKeyedSubscript:@"Global"];
        id v24 = a1[11];
        a1[11] = (id)v23;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((BOOL)a1, a1[11]))
        {
          id v25 = a1[11];
          a1[11] = &unk_26DAB12F0;
        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, @"SystemApp", v9, v8);
        uint64_t v26 = [v8 objectForKeyedSubscript:@"Global"];
        id v27 = a1[13];
        a1[13] = (id)v26;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((BOOL)a1, a1[13]))
        {
          id v28 = a1[13];
          a1[13] = &unk_26DAB12F0;
        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, @"Angel", v9, v68);
        uint64_t v29 = [v68 objectForKeyedSubscript:@"Global"];
        id v30 = a1[17];
        a1[17] = (id)v29;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((BOOL)a1, a1[17]))
        {
          id v31 = a1[17];
          a1[17] = &unk_26DAB12F0;
        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, @"Daemon", v9, v70);
        uint64_t v32 = [v70 objectForKeyedSubscript:@"Global"];
        id v33 = a1[15];
        a1[15] = (id)v32;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((BOOL)a1, a1[15]))
        {
          id v34 = a1[15];
          a1[15] = &unk_26DAB12F0;
        }
        uint64_t v35 = [v69 copy];
        id v36 = a1[2];
        a1[2] = (id)v35;

        uint64_t v37 = [v4 copy];
        id v38 = a1[4];
        a1[4] = (id)v37;

        uint64_t v39 = [v5 copy];
        id v40 = a1[6];
        a1[6] = (id)v39;

        uint64_t v41 = [v6 copy];
        id v42 = a1[8];
        a1[8] = (id)v41;

        uint64_t v43 = [v7 copy];
        id v44 = a1[10];
        a1[10] = (id)v43;

        uint64_t v45 = [v8 copy];
        id v46 = a1[12];
        a1[12] = (id)v45;

        uint64_t v47 = [v68 copy];
        id v48 = a1[16];
        a1[16] = (id)v47;

        uint64_t v49 = [v70 copy];
        id v50 = a1[14];
        a1[14] = (id)v49;

        v51 = rbs_jetsam_log();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v67 = [a1[2] count];
          uint64_t v66 = [a1[4] count];
          uint64_t v65 = [a1[6] count];
          uint64_t v64 = [a1[8] count];
          uint64_t v63 = [a1[10] count];
          uint64_t v62 = [a1[12] count];
          uint64_t v61 = [a1[16] count];
          uint64_t v60 = [a1[14] count];
          uint64_t v52 = [a1[2] count];
          uint64_t v53 = [a1[4] count] + v52;
          uint64_t v54 = [a1[6] count];
          uint64_t v55 = v53 + v54 + [a1[8] count];
          uint64_t v56 = [a1[10] count];
          uint64_t v57 = v56 + [a1[12] count];
          uint64_t v58 = v55 + v57 + [a1[16] count];
          uint64_t v59 = v58 + [a1[14] count];
          uint64_t v12 = v68;
          *(_DWORD *)buf = 134220288;
          uint64_t v72 = v67;
          __int16 v73 = 2048;
          uint64_t v74 = v66;
          __int16 v75 = 2048;
          uint64_t v76 = v65;
          __int16 v77 = 2048;
          uint64_t v78 = v64;
          __int16 v79 = 2048;
          uint64_t v80 = v63;
          __int16 v81 = 2048;
          uint64_t v82 = v62;
          __int16 v83 = 2048;
          uint64_t v84 = 0;
          __int16 v85 = 2048;
          uint64_t v86 = v61;
          __int16 v87 = 2048;
          uint64_t v88 = v60;
          __int16 v89 = 2048;
          uint64_t v90 = v59;
          _os_log_impl(&dword_226AB3000, v51, OS_LOG_TYPE_DEFAULT, "Jetsam Properties Loaded x:%lu xs:%lu e:%lu ee:%lu a:%lu as:%lu ai:%lu g:%lu d:%lu T:%lu", buf, 0x66u);
        }
      }
      else
      {
        v51 = rbs_jetsam_log();
        uint64_t v12 = v68;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
          -[RBJetsamPropertyManager _prepareJetsamData:](v51);
        }
        id v9 = 0;
      }
    }
    else
    {
      v51 = rbs_jetsam_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        -[RBJetsamPropertyManager _prepareJetsamData:](v51);
      }
      id v9 = 0;
      uint64_t v12 = v68;
    }

    id v3 = v9;
  }
}

- (void)_addJetsamValuesForSection:(void *)a3 fromPlist:(void *)a4 toDatabase:
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v26 = a2;
  id v7 = a3;
  id v25 = a4;
  if (a1)
  {
    if (!v7)
    {
      id v21 = [MEMORY[0x263F08690] currentHandler];
      [v21 handleFailureInMethod:sel__addJetsamValuesForSection_fromPlist_toDatabase_, a1, @"RBJetsamPropertyManager.m", 401, @"Invalid parameter not satisfying: %@", @"plist != nil" object file lineNumber description];
    }
    if (!v25)
    {
      id v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:sel__addJetsamValuesForSection_fromPlist_toDatabase_, a1, @"RBJetsamPropertyManager.m", 402, @"Invalid parameter not satisfying: %@", @"database != nil" object file lineNumber description];
    }
    id v8 = RBSDictionaryForKey();
    if ([v8 count])
    {
      id v9 = RBSDictionaryForKey();
      if ([v9 count])
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v23 = v9;
          id v24 = v8;
          uint64_t v13 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v33 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              id v16 = RBSDictionaryForKey();
              if (v16)
              {
                id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                v27[0] = MEMORY[0x263EF8330];
                v27[1] = 3221225472;
                v27[2] = __75__RBJetsamPropertyManager__addJetsamValuesForSection_fromPlist_toDatabase___block_invoke;
                v27[3] = &unk_2647C8608;
                id v18 = v16;
                id v28 = v18;
                id v19 = v17;
                uint64_t v29 = v19;
                id v30 = v26;
                uint64_t v31 = v15;
                [v18 enumerateKeysAndObjectsUsingBlock:v27];
                if ([v19 count])
                {
                  uint64_t v20 = -[RBJetsamPropertyManager _encodedValue:](a1, v19);
                  [v25 setValue:v20 forKey:v15];
                }
              }
              else
              {
                id v19 = rbs_jetsam_log();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v37 = v15;
                  _os_log_error_impl(&dword_226AB3000, v19, OS_LOG_TYPE_ERROR, "Jetsam database entry for %@ not a dictionary, skipping", buf, 0xCu);
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v38 count:16];
          }
          while (v12);
          id v8 = v24;
          id v9 = v23;
        }
      }
      else
      {
        uint64_t v10 = rbs_jetsam_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:](v10);
        }
      }
    }
    else
    {
      id v9 = rbs_jetsam_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]();
      }
    }
  }
}

- (id)_encodedValue:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 count];
    id v6 = [v4 valueForKey:@"ActiveHardMemoryLimit"];
    uint64_t v7 = v5 - (v6 != 0);
    id v8 = [v4 valueForKey:@"ActiveSoftMemoryLimit"];
    uint64_t v9 = v7 - (v8 != 0);
    uint64_t v10 = [v4 valueForKey:@"InactiveHardMemoryLimit"];
    uint64_t v11 = v9 - (v10 != 0);
    uint64_t v12 = [v4 valueForKey:@"InactiveSoftMemoryLimit"];
    if (v11 == (v12 != 0))
    {
      if (!v6 || v8)
      {
        if (v6 || !v8)
        {
          unint64_t v13 = 0;
          if (v6 && v8) {
            goto LABEL_21;
          }
        }
        else
        {
          unint64_t v13 = (([v8 unsignedLongLongValue] & 0x3FFFFFFF) << 32) | 0x8000000000000000;
        }
      }
      else
      {
        unint64_t v13 = ([v6 unsignedLongLongValue] << 32) | 0xC000000000000000;
      }
      if (v10 && !v12)
      {
        uint64_t v14 = 3221225472;
        uint64_t v15 = v10;
LABEL_17:
        uint64_t v16 = [v15 unsignedLongLongValue] & 0x3FFFFFFF | v14;
LABEL_18:
        uint64_t v17 = [NSNumber numberWithUnsignedLongLong:v16 | v13];
LABEL_22:
        id v18 = (void *)v17;

        goto LABEL_23;
      }
      if (!v10 && v12)
      {
        uint64_t v14 = 0x80000000;
        uint64_t v15 = v12;
        goto LABEL_17;
      }
      uint64_t v16 = 0;
      if (!v10 || !v12) {
        goto LABEL_18;
      }
    }
LABEL_21:
    uint64_t v17 = [v4 copy];
    goto LABEL_22;
  }
  id v18 = 0;
LABEL_23:

  return v18;
}

void __75__RBJetsamPropertyManager__addJetsamValuesForSection_fromPlist_toDatabase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 hasSuffix:@"MemoryLimit"])
  {
    id v4 = RBSNumberForKey();
    if (v4)
    {
      [*(id *)(a1 + 40) setValue:v4 forKey:v3];
      uint64_t v5 = rbs_jetsam_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v7 = *(void *)(a1 + 56);
        int v13 = 138413058;
        uint64_t v14 = v6;
        __int16 v15 = 2112;
        id v16 = v3;
        __int16 v17 = 2112;
        uint64_t v18 = v7;
        __int16 v19 = 2112;
        uint64_t v20 = v4;
        _os_log_debug_impl(&dword_226AB3000, v5, OS_LOG_TYPE_DEBUG, "In %@ Setting %@ for %@ to %@", (uint8_t *)&v13, 0x2Au);
      }
    }
    else
    {
      uint64_t v5 = rbs_jetsam_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __75__RBJetsamPropertyManager__addJetsamValuesForSection_fromPlist_toDatabase___block_invoke_cold_1();
      }
    }

LABEL_11:
    goto LABEL_12;
  }
  if ([v3 isEqualToString:@"FreezerEligible"])
  {
    uint64_t v8 = RBSBoolForKey();
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [NSNumber numberWithBool:v8];
    [v9 setValue:v10 forKey:v3];

    id v4 = rbs_jetsam_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      int v13 = 138413058;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 1024;
      LODWORD(v20) = v8;
      _os_log_debug_impl(&dword_226AB3000, v4, OS_LOG_TYPE_DEBUG, "In %@ Setting %@ for %@ to %hhd", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (RBJetsamPropertyManager)initWithEntitlementManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[RBJetsamPropertyManager _loadJetsamProperties]((uint64_t)self);
  uint64_t v6 = [(RBJetsamPropertyManager *)self initWithEntitlementManager:v4 properties:v5];

  return v6;
}

- (RBJetsamPropertyManager)initWithEntitlementManager:(id)a3 properties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RBJetsamPropertyManager;
  uint64_t v9 = [(RBJetsamPropertyManager *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entitlementManager, a3);
    -[RBJetsamPropertyManager _prepareJetsamData:]((id *)&v10->super.isa, v8);
  }

  return v10;
}

- (id)_jetsamPropertiesForAngelProcess:(uint64_t)a1 identity:(uint64_t)a2 bundleProperties:(void *)a3
{
  if (a1)
  {
    uint64_t v5 = [a3 consistentLaunchdJobLabel];
    uint64_t v6 = -[RBJetsamPropertyManager _jetsamPropertiesForProcess:identifier:properties:global:](a1, a2, v5, *(void **)(a1 + 128), *(void **)(a1 + 136));
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

+ (int)testTaskLimitForPid:(int)a3
{
  int v3 = memorystatus_control();
  if (v3 <= 0)
  {
    id v4 = rbs_jetsam_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[RBJetsamPropertyManager _taskLimitForProcess:]();
    }

    return +[RBJetsamPropertyManager _taskLimit]();
  }
  return v3;
}

+ (id)testJetsamProperties
{
  uint64_t v2 = +[RBJetsamPropertyManager _taskLimit]();
  uint64_t v3 = +[RBJetsamPropertyManager _taskLimit]();
  uint64_t v4 = MEMORY[0x263EFFA78];
  return +[RBJetsamProperties jetsamPropertiesForProperties:&unk_26DAB1340 globalProperties:v4 taskLimit:v2 unLimit:v3];
}

+ (id)unmanagedJetsamProperties
{
  uint64_t v2 = +[RBJetsamPropertyManager _taskLimit]();
  uint64_t v3 = +[RBJetsamPropertyManager _taskLimit]();
  uint64_t v4 = MEMORY[0x263EFFA78];
  return +[RBJetsamProperties jetsamPropertiesForProperties:&unk_26DAB1368 globalProperties:v4 taskLimit:v2 unLimit:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_angelsGlobal, 0);
  objc_storeStrong((id *)&self->_angels, 0);
  objc_storeStrong(&self->_daemonsGlobal, 0);
  objc_storeStrong((id *)&self->_daemons, 0);
  objc_storeStrong(&self->_applicationsSysGlobal, 0);
  objc_storeStrong((id *)&self->_applicationsSys, 0);
  objc_storeStrong(&self->_applicationsGlobal, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong(&self->_externalExtensionPointsGlobal, 0);
  objc_storeStrong((id *)&self->_externalExtensionPoints, 0);
  objc_storeStrong(&self->_extensionPointsGlobal, 0);
  objc_storeStrong((id *)&self->_extensionPoints, 0);
  objc_storeStrong(&self->_xpcServicesSysGlobal, 0);
  objc_storeStrong((id *)&self->_xpcServicesSys, 0);
  objc_storeStrong(&self->_xpcServicesGlobal, 0);
  objc_storeStrong((id *)&self->_xpcServices, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
}

void __37__RBJetsamPropertyManager__taskLimit__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  __error();
  int v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_226AB3000, v1, v2, "SyscallError: kern.max_task_pmem %d %d (%s)", v3, v4, v5, v6, v7);
}

- (void)_jetsamTargetType
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a1;
  int v6 = *__error();
  uint8_t v7 = __error();
  id v8 = strerror(*v7);
  v9[0] = 67109890;
  v9[1] = a2;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  __int16 v12 = 1024;
  int v13 = v6;
  __int16 v14 = 2080;
  __int16 v15 = v8;
  _os_log_error_impl(&dword_226AB3000, a3, OS_LOG_TYPE_ERROR, "SyscallError: getJetsamPriorityBandFromSystem getJetsamPropertyInfo sysctlbyname, try 1 -> %d, %zu, %d (%s)", (uint8_t *)v9, 0x22u);
}

- (void)_loadJetsamProperties
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int has_internal_content = os_variant_has_internal_content();
  uint8_t v7 = @"/System/Library/LaunchDaemons/com.apple.jetsamproperties";
  if (has_internal_content) {
    uint8_t v7 = @"/AppleInternal/Library/LaunchDaemons/com.apple.jetsamproperties";
  }
  id v8 = v7;
  OUTLINED_FUNCTION_1();
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_226AB3000, a3, OS_LOG_TYPE_ERROR, "Can't find jetsamproperties ('%@' | '%@' | '%@')", v9, 0x20u);
}

- (void)_prepareJetsamData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_226AB3000, log, OS_LOG_TYPE_FAULT, "Unable to load jetsam database!", v1, 2u);
}

- (void)_prepareJetsamData:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_226AB3000, log, OS_LOG_TYPE_FAULT, "Jetsam database parse error !(Version4)", v1, 2u);
}

- (void)_addJetsamValuesForSection:fromPlist:toDatabase:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_226AB3000, v0, OS_LOG_TYPE_ERROR, "Jetsam database parse error: no section found for %@", v1, 0xCu);
}

- (void)_addJetsamValuesForSection:(os_log_t)log fromPlist:toDatabase:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "Jetsam database parse error !(Override)", v1, 2u);
}

void __75__RBJetsamPropertyManager__addJetsamValuesForSection_fromPlist_toDatabase___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_226AB3000, v0, OS_LOG_TYPE_ERROR, "Jetsam database entry for %@ not a number, skipping", v1, 0xCu);
}

- (void)_taskLimitForProcess:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_226AB3000, v1, v2, "memorystatus_control error: MEMORYSTATUS_CMD_CONVERT_MEMLIMIT_MB(-1) returned %d %d (%s)", v3, v4, v5, v6, v7);
}

- (void)_unLimitForProcess:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_226AB3000, v1, v2, "memorystatus_control error: MEMORYSTATUS_CMD_CONVERT_MEMLIMIT_MB(0) returned %d %d (%s)", v3, v4, v5, v6, v7);
}

- (void)jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_226AB3000, v0, OS_LOG_TYPE_DEBUG, "Unknown process type for %@", v1, 0xCu);
}

@end