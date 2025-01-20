@interface PFPosterPath
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)_temporaryDirectoryURLWithContainerPath:(void *)a3 basenamePrefix:;
+ (id)debugDescription;
+ (id)temporaryDescriptorPathWithIdentifier:(id)a3 role:(id)a4;
+ (id)temporaryPathForRole:(id)a3;
+ (id)temporaryPathForTask:(id)a3 role:(id)a4;
+ (id)temporaryPathForURL:(id)a3 role:(id)a4;
+ (uint64_t)_reportSandboxExtensionError:(uint64_t)a3 withCode:(void *)a4 reason:(uint64_t)a5;
+ (void)_setDisableUniquing:(BOOL)a3;
- (BOOL)copyContentsOfPath:(id)a3 error:(id *)a4;
- (BOOL)ensureContentsURLIsReachableAndReturnError:(id *)a3;
- (BOOL)isServerPosterPath;
- (BOOL)storeUserInfo:(id)a3 error:(id *)a4;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)descriptorIdentifier;
- (NSString)role;
- (NSURL)containerURL;
- (NSURL)contentsURL;
- (PFPosterPath)init;
- (PFPosterPath)initWithBSXPCCoder:(id)a3;
- (PFPosterPath)initWithCoder:(id)a3;
- (PFServerPosterIdentity)serverIdentity;
- (id)extendContentsReadAccessToAuditToken:(id)a3 error:(id *)a4;
- (id)extendValidityForReason:(id)a3;
- (id)loadUserInfoWithError:(id *)a3;
- (int64_t)compareDescriptorIdentifiers:(id)a3;
- (uint64_t)_initDecodedWithContentsURL:(void *)a3 role:(void *)a4 serverIdentity:(void *)a5 descriptorIdentifier:(uint64_t)a6 sandboxExtensionHandle:;
- (uint64_t)_isEqualToPersistable:(uint64_t)a1;
- (uint64_t)_isPersistable;
- (uint64_t)_sandboxExtensionLevel;
- (unsigned)_lock_descriptionWithDebugInfo:(const os_unfair_lock *)a1;
- (void)_extendReadAccessForURL:(void *)a3 toAuditToken:(void *)a4 error:;
- (void)_initWithContentsURL:(void *)a3 role:(char)a4 options:(void *)a5 serverIdentity:(void *)a6 descriptorIdentifier:(uint64_t)a7 sandboxExtensionHandle:(void *)a8 sandboxExtensionURL:(void *)a9 sandboxExtensionAuditToken:;
- (void)_invalidate;
- (void)_lock_purgeIfPossible;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
@end

@implementation PFPosterPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionAuditToken, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionURL, 0);
  objc_storeStrong((id *)&self->_lock_allExtensions, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
  objc_storeStrong((id *)&self->_serverIdentity, 0);
  objc_storeStrong((id *)&self->_contentsURL, 0);
}

- (uint64_t)_initDecodedWithContentsURL:(void *)a3 role:(void *)a4 serverIdentity:(void *)a5 descriptorIdentifier:(uint64_t)a6 sandboxExtensionHandle:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!a1) {
    goto LABEL_7;
  }
  if (PFPosterRoleIsValid(v12))
  {
    uint64_t v15 = objc_opt_class();
    if (v11)
    {
      if (v15 == objc_opt_class())
      {
        if (!v13 || v14) {
          goto LABEL_6;
        }
        if (a6 == -1)
        {
          uint64_t v18 = +[PFServerPosterPath _cachedPathWithContentsURL:identity:allocedInstance:]((uint64_t)PFServerPosterPath, v11, v13, a1);

          goto LABEL_14;
        }
        -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](a1, v11, v12, 2, v13, 0, a6, 0, 0);
      }
      else
      {
        if (v13) {
          goto LABEL_6;
        }
        -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](a1, v11, v12, 2, 0, v14, a6, 0, 0);
      }
      uint64_t v18 = v19;
      goto LABEL_14;
    }
LABEL_6:
    -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](a1, 0, v12, 2, 0, 0, -1, 0, 0);
    v17 = (void *)v16;
    -[PFPosterPath _invalidate](v16);

LABEL_7:
    uint64_t v18 = 0;
LABEL_14:

    return v18;
  }
  v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid(role)"];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    -[PFPosterPath _initDecodedWithContentsURL:role:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:]();
  }
  [v21 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)extendValidityForReason:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  int lock_validityExtensions = self->_lock_validityExtensions;
  if (self->_lock_invalidated && lock_validityExtensions == 0)
  {
    v21 = NSString;
    v22 = -[PFPosterPath _lock_descriptionWithDebugInfo:]((const os_unfair_lock *)self, 1);
    v20 = [v21 stringWithFormat:@"cannot extend validity after invalidation of %@", v22];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFPosterPath extendValidityForReason:]();
    }
LABEL_24:
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A086C20);
  }
  if (lock_validityExtensions == 255)
  {
    uint64_t v18 = NSString;
    uint64_t v19 = -[PFPosterPath _lock_descriptionWithDebugInfo:]((const os_unfair_lock *)self, 1);
    v20 = [v18 stringWithFormat:@"validity overflow of %@", v19];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFPosterPath extendValidityForReason:]();
    }
    goto LABEL_24;
  }
  if (self->_lock_sandboxExtensionHandle == -1 && (self->_options & 3) == 2)
  {
    id v12 = 0;
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x263F29CD8]);
    v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __40__PFPosterPath_extendValidityForReason___block_invoke;
    v23[3] = &unk_26546F038;
    v23[4] = self;
    v23[5] = a2;
    id v12 = (void *)[v9 initWithIdentifier:v11 forReason:v5 invalidationBlock:v23];

    unsigned __int8 v13 = self->_lock_validityExtensions + 1;
    self->_int lock_validityExtensions = v13;
    if (self->_lock_validityExtensionsHigh < v13) {
      self->_lock_validityExtensionsHigh = v13;
    }
    lock_allExtensions = self->_lock_allExtensions;
    if (!lock_allExtensions)
    {
      uint64_t v15 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      uint64_t v16 = self->_lock_allExtensions;
      self->_lock_allExtensions = v15;

      lock_allExtensions = self->_lock_allExtensions;
    }
    [(NSHashTable *)lock_allExtensions addObject:v12];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v12;
}

- (NSString)descriptorIdentifier
{
  descriptorIdentifier = [(PFServerPosterIdentity *)self->_serverIdentity descriptorIdentifier];
  v4 = descriptorIdentifier;
  if (!descriptorIdentifier) {
    descriptorIdentifier = self->_descriptorIdentifier;
  }
  id v5 = descriptorIdentifier;

  return v5;
}

- (PFPosterPath)initWithBSXPCCoder:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  if (v5 == (objc_class *)objc_opt_class() || v5 == (objc_class *)objc_opt_class())
  {
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"c"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"r"];
    unsigned __int8 v13 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8798] forKey:@"t"];
    if (!v13)
    {
      uint64_t v14 = -1;
LABEL_21:
      v8 = (PFPosterPath *)-[PFPosterPath _initDecodedWithContentsURL:role:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:](self, v9, v12, v10, v11, v14);

      goto LABEL_22;
    }
    v38 = v9;
    *__error() = 0;
    xpc_string_get_string_ptr(v13);
    uint64_t v14 = sandbox_extension_consume();
    uint64_t v15 = [v10 descriptorIdentifier];
    uint64_t v16 = (void *)v15;
    if (v15) {
      v17 = (void *)v15;
    }
    else {
      v17 = v11;
    }
    id v18 = v17;

    if (v14 != -1)
    {
      uint64_t v19 = PFLogPosterContents();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v18)
      {
        if (v20)
        {
          v21 = NSStringFromClass(v5);
          *(_DWORD *)__strerrbuf = 138413058;
          v52 = v13;
          __int16 v53 = 2114;
          v54 = v21;
          __int16 v55 = 2114;
          id v56 = v18;
          __int16 v57 = 2114;
          v58 = v38;
          v22 = "consumed bsxpc decoded sandboxToken %@ : <%{public}@ %{public}@ path=%{public}@>";
          v23 = v19;
          uint32_t v24 = 42;
LABEL_24:
          _os_log_debug_impl(&dword_25A085000, v23, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)__strerrbuf, v24);
        }
      }
      else if (v20)
      {
        v21 = NSStringFromClass(v5);
        *(_DWORD *)__strerrbuf = 138412802;
        v52 = v13;
        __int16 v53 = 2114;
        v54 = v21;
        __int16 v55 = 2114;
        id v56 = v38;
        v22 = "consumed bsxpc decoded sandboxToken %@ : <%{public}@ path=%{public}@>";
        v23 = v19;
        uint32_t v24 = 32;
        goto LABEL_24;
      }

LABEL_20:
      id v9 = v38;
      goto LABEL_21;
    }
    v25 = __error();
    strerror_r(*v25, __strerrbuf, 0x100uLL);
    v26 = PFLogPosterContents();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v27)
      {
        id v37 = v18;
        v28 = v26;
        int v29 = *__error();
        v30 = NSStringFromClass(v5);
        *(_DWORD *)buf = 138413570;
        v40 = v13;
        __int16 v41 = 1024;
        int v42 = v29;
        v26 = v28;
        id v18 = v37;
        __int16 v43 = 2082;
        v44 = __strerrbuf;
        __int16 v45 = 2114;
        v46 = v30;
        __int16 v47 = 2114;
        id v48 = v37;
        __int16 v49 = 2114;
        v50 = v38;
        v31 = "failed to consume sandboxToken %@ from bsxpc with errno=%i (%{public}s) : <%{public}@ %{public}@ path=%{public}@>";
        v32 = v26;
        uint32_t v33 = 58;
LABEL_26:
        _os_log_error_impl(&dword_25A085000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
      }
    }
    else if (v27)
    {
      v35 = v26;
      int v36 = *__error();
      v30 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138413314;
      v40 = v13;
      __int16 v41 = 1024;
      int v42 = v36;
      v26 = v35;
      __int16 v43 = 2082;
      v44 = __strerrbuf;
      __int16 v45 = 2114;
      v46 = v30;
      __int16 v47 = 2114;
      id v18 = 0;
      id v48 = v38;
      v31 = "failed to consume sandboxToken %@ from bsxpc with errno=%i (%{public}s) : <%{public}@ path=%{public}@>";
      v32 = v26;
      uint32_t v33 = 48;
      goto LABEL_26;
    }

    goto LABEL_20;
  }
  -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](self, 0, 0, 2, 0, 0, -1, 0, 0);
  v7 = (void *)v6;
  -[PFPosterPath _invalidate](v6);

  v8 = 0;
LABEL_22:

  return v8;
}

- (void)_initWithContentsURL:(void *)a3 role:(char)a4 options:(void *)a5 serverIdentity:(void *)a6 descriptorIdentifier:(uint64_t)a7 sandboxExtensionHandle:(void *)a8 sandboxExtensionURL:(void *)a9 sandboxExtensionAuditToken:
{
  id v16 = a2;
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  if (!a1)
  {
LABEL_11:

    return;
  }
  v40.receiver = a1;
  v40.super_class = (Class)PFPosterPath;
  id v22 = objc_msgSendSuper2(&v40, sel_init);
  if (v22)
  {
    uint64_t v23 = (uint64_t)v22;
    uint64_t v24 = [v16 copy];
    v25 = *(void **)(v23 + 8);
    *(void *)(v23 + 8) = v24;

    *(unsigned char *)(v23 + 76) = a4;
    uint64_t v26 = [v17 copy];
    BOOL v27 = *(void **)(v23 + 32);
    *(void *)(v23 + 32) = v26;

    uint64_t v28 = [v18 copy];
    int v29 = *(void **)(v23 + 16);
    *(void *)(v23 + 16) = v28;

    uint64_t v30 = [v19 copy];
    v31 = *(void **)(v23 + 24);
    *(void *)(v23 + 24) = v30;

    *(_DWORD *)(v23 + 72) = 0;
    *(void *)(v23 + 64) = a7;
    uint64_t v32 = [v20 copy];
    uint32_t v33 = *(void **)(v23 + 48);
    *(void *)(v23 + 48) = v32;

    uint64_t v34 = [v21 copy];
    v35 = *(void **)(v23 + 56);
    *(void *)(v23 + 56) = v34;

    if (*(void *)(v23 + 8))
    {
      os_unfair_lock_lock(&__allPathsLock);
      int v36 = (void *)__allPaths;
      if (!__allPaths)
      {
        uint64_t v37 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
        v38 = (void *)__allPaths;
        __allPaths = v37;

        int v36 = (void *)__allPaths;
      }
      [v36 addObject:v23];
      os_unfair_lock_unlock(&__allPathsLock);
    }
    if (*(unsigned char *)(v23 + 76))
    {
      v39 = PFLogPosterContents();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v23, v39);
      }
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](sel__initWithContentsURL_role_options_serverIdentity_descriptorIdentifier_sandboxExtensionHandle_sandboxExtensionURL_sandboxExtensionAuditToken_);
  }
  __break(0);
}

void __40__PFPosterPath_extendValidityForReason___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = (uint64_t *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 72));
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 77))
  {
    *(unsigned char *)(v4 + 77) = *(unsigned char *)(*(void *)(a1 + 32) + 77) - 1;
    [*(id *)(*v3 + 40) removeObject:v9];
    if (![*(id *)(*v3 + 40) count])
    {
      id v5 = *(void **)(*v3 + 40);
      *(void *)(*v3 + 40) = 0;
    }
    -[PFPosterPath _lock_purgeIfPossible](*v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(*v3 + 72));
  }
  else
  {
    uint64_t v6 = NSString;
    v7 = -[PFPosterPath _lock_descriptionWithDebugInfo:]((const os_unfair_lock *)v4, 1);
    v8 = [v6 stringWithFormat:@"validity underflow of %@", v7];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __40__PFPosterPath_extendValidityForReason___block_invoke_cold_1();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_purgeIfPossible
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v6 = *__error();
  uint64_t v7 = -[PFPosterPath _lock_descriptionWithDebugInfo:](a2, 1);
  v8[0] = 67109634;
  v8[1] = v6;
  __int16 v9 = 2082;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  id v12 = v7;
  _os_log_error_impl(&dword_25A085000, a3, OS_LOG_TYPE_ERROR, "failed to release sandboxExtensionHandle with errno=%i (%{public}s) : %{public}@", (uint8_t *)v8, 0x1Cu);
}

- (void)_invalidate
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 72);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if (!*(unsigned char *)(a1 + 79))
    {
      *(unsigned char *)(a1 + 79) = 1;
      -[PFPosterPath _lock_purgeIfPossible](a1);
    }
    os_unfair_lock_unlock(v2);
  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PFPosterPath)init
{
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  int v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v4 stringWithFormat:@"%@ is not allowed on %@", v5, v7];

  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = NSStringFromSelector(a2);
    uint64_t v10 = (objc_class *)objc_opt_class();
    __int16 v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    id v16 = v11;
    __int16 v17 = 2048;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = @"PFPosterPath.m";
    __int16 v21 = 1024;
    int v22 = 119;
    __int16 v23 = 2114;
    uint64_t v24 = v8;
    _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  uint64_t result = (PFPosterPath *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)_temporaryDirectoryURLWithContainerPath:(void *)a3 basenamePrefix:
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  self;
  id v6 = v4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A096F80);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A096FE4);
  }

  id v7 = v5;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v7)
  {
    BOOL v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A097048);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0970ACLL);
  }

  if (![v7 length])
  {
    int v29 = [NSString stringWithFormat:@"basenamePrefix must not be empty"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A097104);
  }
  uint64_t v8 = (void *)MEMORY[0x25A2F4780]();
  uint64_t v9 = [NSString stringWithFormat:@"%@-XXXXXX", v7];
  if (!v9)
  {
    uint64_t v30 = [NSString stringWithFormat:@"failed to make temp directory basenameTemplate"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.4();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A097158);
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [v6 stringByAppendingPathComponent:v9];
  if (!v11)
  {
    v31 = [NSString stringWithFormat:@"failed to make temp directory template"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.5();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0971ACLL);
  }
  id v12 = (void *)v11;
  *__error() = 0;
  id v13 = v12;
  uint64_t v14 = strdup((const char *)[v13 fileSystemRepresentation]);
  if (!v14)
  {
    uint32_t v33 = __error();
    strerror_r(*v33, __strerrbuf, 0x100uLL);
    uint64_t v34 = [NSString stringWithFormat:@"failed to make templateUTF8String with errno=%i (%s) : template='%@'", *__error(), __strerrbuf, v13];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.6();
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A097290);
  }
  __int16 v15 = v14;
  *__error() = 0;
  id v16 = mkdtemp(v15);
  if (v16 != v15)
  {
    v35 = v16;
    int v36 = __error();
    strerror_r(*v36, __strerrbuf, 0x100uLL);
    uint64_t v37 = [NSString stringWithFormat:@"unexpected mkdtemp result with errno=%i (%s) : template(%p)=%@ result=%p", *__error(), __strerrbuf, v15, v13, v35];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.9();
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A097324);
  }
  __int16 v17 = objc_opt_new();
  uint64_t v18 = [v17 stringWithFileSystemRepresentation:v15 length:strlen(v15)];
  if (!v18)
  {
    uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"failed to wrap pathUTF8String : pathUTF8String=%s", v15);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.7();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A097208);
  }
  __int16 v19 = (void *)v18;
  free(v15);
  id v20 = PFPosterPathFileAttributes();
  id v39 = 0;
  char v21 = [v17 setAttributes:v20 ofItemAtPath:v19 error:&v39];
  id v22 = v39;

  if ((v21 & 1) == 0)
  {
    v38 = [NSString stringWithFormat:@"failed to set necessary attributes of path=%@ : error=%@", v19, v22];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.8();
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09737CLL);
  }

  __int16 v23 = [NSURL fileURLWithPath:v19 isDirectory:1];

  return v23;
}

+ (uint64_t)_reportSandboxExtensionError:(uint64_t)a3 withCode:(void *)a4 reason:(uint64_t)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = (objc_class *)self;
  if (![v11 length])
  {
    __int16 v19 = NSString;
    id v20 = NSStringFromSelector(sel__reportSandboxExtensionError_withCode_reason_);
    char v21 = [v19 stringWithFormat:@"bad format string for %@", v20];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath _reportSandboxExtensionError:withCode:reason:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09759CLL);
  }
  id v13 = NSStringFromClass(v12);
  uint64_t v14 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
  __int16 v15 = PFLogPosterContents();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v13;
    __int16 v26 = 2048;
    uint64_t v27 = a3;
    __int16 v28 = 2114;
    int v29 = v14;
    _os_log_error_impl(&dword_25A085000, v15, OS_LOG_TYPE_ERROR, "SandboxExtensionError: domain=%{publid}@ code=%lli reason=%{public}@", buf, 0x20u);
  }

  if (a2)
  {
    id v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08338];
    __int16 v23 = v14;
    __int16 v17 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    *a2 = [v16 errorWithDomain:v13 code:a3 userInfo:v17];
  }
  return 0;
}

- (void)_extendReadAccessForURL:(void *)a3 toAuditToken:(void *)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  if (!a1)
  {
LABEL_8:

    return a1;
  }
  if (v7)
  {
    if (v8 && [v8 isInvalid])
    {
      uint64_t v14 = +[PFPosterPath _reportSandboxExtensionError:1, @"cannot extend access of %@ with invalid auditToken %@", v10, v11, v12, v13, (uint64_t)a1 withCode reason];
    }
    else
    {
      id v15 = objc_alloc((Class)objc_opt_class());
      -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v15, a1[1], a1[4], 2, a1[2], a1[3], -1, v7, v9);
    }
    a1 = (void **)v14;
    goto LABEL_8;
  }
  __int16 v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extensionURL"];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    -[PFPosterPath _extendReadAccessForURL:toAuditToken:error:]();
  }
  [v17 UTF8String];
  uint64_t result = (void **)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (unsigned)_lock_descriptionWithDebugInfo:(const os_unfair_lock *)a1
{
  v2 = (unsigned __int8 *)a1;
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (!a1) {
    goto LABEL_28;
  }
  os_unfair_lock_assert_owner(a1 + 18);
  id v4 = &stru_2707FB7C8;
  if (v2[80]) {
    id v5 = @":purged";
  }
  else {
    id v5 = &stru_2707FB7C8;
  }
  id v6 = v5;
  id v7 = &stru_2707FB7C8;
  if (a2)
  {
    if (*((void *)v2 + 8) == -1)
    {
      if (!*((void *)v2 + 6))
      {
        id v7 = &stru_2707FB7C8;
LABEL_9:
        if (v2[78])
        {
          id v39 = v7;
          objc_super v40 = v6;
          id v8 = [MEMORY[0x263EFF9A0] dictionary];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v9 = *((id *)v2 + 5);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v46 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = [*(id *)(*((void *)&v45 + 1) + 8 * i) reason];
                id v15 = NSNumber;
                id v16 = [v8 objectForKey:v14];
                __int16 v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") + 1);
                [v8 setObject:v17 forKey:v14];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v49 count:16];
            }
            while (v11);
          }

          uint64_t v18 = [v8 allKeys];
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __47__PFPosterPath__lock_descriptionWithDebugInfo___block_invoke;
          v43[3] = &unk_26546EF58;
          id v19 = v8;
          id v44 = v19;
          id v20 = [v18 sortedArrayUsingComparator:v43];

          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __47__PFPosterPath__lock_descriptionWithDebugInfo___block_invoke_2;
          v41[3] = &unk_26546EF80;
          id v42 = v19;
          id v21 = v19;
          uint64_t v22 = objc_msgSend(v20, "bs_map:", v41);
          __int16 v23 = (void *)MEMORY[0x263F089D8];
          uint64_t v24 = v2[77];
          uint64_t v25 = v2[78];
          __int16 v26 = [v22 componentsJoinedByString:@","];
          [v23 stringWithFormat:@" eCount=%u(%u) eReasons=%@", v24, v25, v26];
          id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

          id v7 = v39;
          id v6 = v40;
        }
        goto LABEL_18;
      }
      uint64_t v35 = *((void *)v2 + 7);
      if (v35) {
        [NSString stringWithFormat:@" sURL=%@ sDest=%@", *((void *)v2 + 6), v35];
      }
      else {
        [NSString stringWithFormat:@" sURL=%@", *((void *)v2 + 6), v37];
      }
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @" sHandle=%lli", *((void *)v2 + 8), v37);
    }
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_18:
  if (*((void *)v2 + 2))
  {
    uint64_t v27 = NSString;
    __int16 v28 = (objc_class *)objc_opt_class();
    int v29 = NSStringFromClass(v28);
    v2 = [v27 stringWithFormat:@"<%@:%p%@ %@%@%@>", v29, v2, v6, *((void *)v2 + 2), v7, v4];
  }
  else
  {
    int v29 = [v2 descriptorIdentifier];
    uint64_t v30 = NSString;
    v31 = (objc_class *)objc_opt_class();
    uint64_t v32 = NSStringFromClass(v31);
    uint64_t v33 = *((void *)v2 + 4);
    uint64_t v34 = [*((id *)v2 + 1) fileSystemRepresentation];
    if (v29) {
      [v30 stringWithFormat:@"<%@:%p%@ descriptor='%@' role='%@' contents='%s'%@%@>", v32, v2, v6, v29, v33, v34, v7, v4];
    }
    else {
      [v30 stringWithFormat:@"<%@:%p%@ role='%@' contents='%s'%@%@>", v32, v2, v6, v33, v34, v7, v4, v38];
    }
    v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  }
LABEL_28:
  return v2;
}

- (uint64_t)_isPersistable
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (*(void *)(a1 + 8)
      && *(void *)(a1 + 16)
      && *(unsigned char *)(a1 + 76) == 2
      && !*(void *)(a1 + 48)
      && !*(void *)(a1 + 56))
    {
      v3 = (os_unfair_lock_s *)(a1 + 72);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
      uint64_t v1 = !*(unsigned char *)(v1 + 79) && !*(unsigned char *)(v1 + 80) && *(void *)(v1 + 64) == -1;
      os_unfair_lock_unlock(v3);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)_isEqualToPersistable:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (!-[PFPosterPath _isPersistable](a1)) {
      goto LABEL_9;
    }
    if ((id)a1 == v3)
    {
      a1 = 1;
      goto LABEL_17;
    }
    if (-[PFPosterPath _isPersistable]((uint64_t)v3))
    {
      id v4 = [(id)a1 contentsURL];
      id v5 = [v3 contentsURL];
      if (BSEqualObjects())
      {
        id v6 = [(id)a1 role];
        id v7 = [v3 role];
        if (BSEqualObjects())
        {
          id v8 = [(id)a1 serverIdentity];
          id v9 = [v3 serverIdentity];
          if (BSEqualObjects())
          {
            uint64_t v10 = [(id)a1 descriptorIdentifier];
            uint64_t v11 = [v3 descriptorIdentifier];
            a1 = BSEqualObjects();
          }
          else
          {
            a1 = 0;
          }
        }
        else
        {
          a1 = 0;
        }
      }
      else
      {
        a1 = 0;
      }
    }
    else
    {
LABEL_9:
      a1 = 0;
    }
  }
LABEL_17:

  return a1;
}

uint64_t __47__PFPosterPath__lock_descriptionWithDebugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKey:v5];
  unint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = [*(id *)(a1 + 32) objectForKey:v6];
  unint64_t v10 = [v9 unsignedIntegerValue];

  if (v8 == v10)
  {
    uint64_t v11 = [v5 compare:v6];
  }
  else if (v8 < v10)
  {
    uint64_t v11 = -1;
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

id __47__PFPosterPath__lock_descriptionWithDebugInfo___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKey:v4];
  id v6 = [v2 stringWithFormat:@"%@:%lu", v4, objc_msgSend(v5, "unsignedIntegerValue")];

  return v6;
}

+ (id)debugDescription
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x25A2F4780](a1, a2);
  os_unfair_lock_lock(&__allPathsLock);
  id v3 = [MEMORY[0x263EFF9C0] set];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v4 = [(id)__cachedServerPathsByIdentityByURL objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        unint64_t v10 = [v9 objectEnumerator];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v63 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v53 != v13) {
                objc_enumerationMutation(v10);
              }
              [v3 addObject:*(void *)(*((void *)&v52 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v63 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v6);
  }

  id v15 = [v3 allObjects];
  id v16 = [v15 sortedArrayUsingComparator:&__block_literal_global_116];

  __int16 v17 = [MEMORY[0x263EFF980] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v18 = (id)__allPaths;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v49 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v48 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 containsObject:v23] & 1) == 0) {
          [v17 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v20);
  }

  [v17 sortUsingComparator:&__block_literal_global_121];
  os_unfair_lock_unlock(&__allPathsLock);
  uint64_t v24 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"cachedServerPaths = %llu {", objc_msgSend(v16, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v25 = v16;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v61 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void **)(*((void *)&v44 + 1) + 8 * m);
        [v24 appendString:@"\n\t"];
        v31 = [v30 debugDescription];
        [v24 appendString:v31];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v61 count:16];
    }
    while (v27);
  }

  objc_msgSend(v24, "appendFormat:", @"\n}\notherPaths = %llu {", objc_msgSend(v17, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v32 = v17;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v40 objects:v60 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v41;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void **)(*((void *)&v40 + 1) + 8 * n);
        [v24 appendString:@"\n\t"];
        uint64_t v38 = [v37 debugDescription];
        [v24 appendString:v38];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v40 objects:v60 count:16];
    }
    while (v34);
  }

  [v24 appendString:@"\n}"];
  return v24;
}

uint64_t __32__PFPosterPath_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 identity];
  uint64_t v6 = [v4 identity];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __32__PFPosterPath_debugDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 serverIdentity];
  uint64_t v7 = [v5 serverIdentity];
  unint64_t v8 = (void *)v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(id)v6 compare:v7];
    uint64_t v10 = -1;
    if (v4 >= v5) {
      uint64_t v10 = 1;
    }
    if (v4 == v5) {
      uint64_t v10 = 0;
    }
    if (v9) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v10;
    }
  }
  else
  {
    if (v6) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = 1;
    }
    if (!(v6 | v7))
    {
      uint64_t v12 = [v4 contentsURL];
      uint64_t v13 = [v12 absoluteString];
      uint64_t v14 = [v5 contentsURL];
      id v15 = [v14 absoluteString];
      uint64_t v11 = [v13 compare:v15];

      if (!v11)
      {
        if (v4 == v5)
        {
          uint64_t v11 = 0;
        }
        else if (v4 < v5)
        {
          uint64_t v11 = -1;
        }
        else
        {
          uint64_t v11 = 1;
        }
      }
    }
  }

  return v11;
}

+ (id)temporaryDescriptorPathWithIdentifier:(id)a3 role:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v7)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath temporaryDescriptorPathWithIdentifier:role:]();
    }
LABEL_15:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A098670);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath temporaryDescriptorPathWithIdentifier:role:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0986D4);
  }

  if ((PFPosterRoleIsValid(v6) & 1) == 0)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid(role)"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath temporaryDescriptorPathWithIdentifier:role:]();
    }
    goto LABEL_15;
  }
  unint64_t v8 = [PFPosterPath alloc];
  uint64_t v9 = PFTemporaryDirectoryCreatingIfItDoesntExist();
  uint64_t v10 = +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:]((uint64_t)PFPosterPath, v9, @"com.apple.posterkit.provider.path.descriptor");
  -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v8, v10, v6, 1, 0, v7, -1, 0, 0);
  uint64_t v12 = v11;

  return v12;
}

+ (id)temporaryPathForRole:(id)a3
{
  id v3 = a3;
  if (PFPosterRoleIsValid(v3))
  {
    id v4 = [PFPosterPath alloc];
    id v5 = PFTemporaryDirectoryCreatingIfItDoesntExist();
    id v6 = +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:]((uint64_t)PFPosterPath, v5, @"com.apple.posterkit.provider.path.generic");
    -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v4, v6, v3, 1, 0, 0, -1, 0, 0);
    unint64_t v8 = v7;

    return v8;
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid(role)"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath temporaryPathForRole:]();
    }
    [v10 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)temporaryPathForTask:(id)a3 role:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = a4;
  if (PFPosterRoleIsValid(v6))
  {
    if (![(__CFString *)v5 length])
    {

      id v5 = @"com.apple.posterkit.provider.path.task";
    }
    id v7 = [PFPosterPath alloc];
    unint64_t v8 = PFTemporaryDirectoryCreatingIfItDoesntExist();
    uint64_t v9 = +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:]((uint64_t)PFPosterPath, v8, v5);
    -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v7, v9, v6, 1, 0, 0, -1, 0, 0);
    uint64_t v11 = v10;

    return v11;
  }
  else
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid(role)"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFPosterPath temporaryPathForTask:role:]();
    }
    [v13 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)temporaryPathForURL:(id)a3 role:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:]([PFPosterPath alloc], v6, v5, 0, 0, 0, -1, 0, 0);
  unint64_t v8 = v7;

  return v8;
}

- (BOOL)copyContentsOfPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x263F08850] defaultManager];
  unint64_t v8 = [v6 role];
  uint64_t v9 = +[PFPosterPath temporaryPathForRole:v8];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __41__PFPosterPath_copyContentsOfPath_error___block_invoke;
  v20[3] = &unk_26546F010;
  id v10 = v7;
  id v21 = v10;
  uint64_t v11 = (void *)MEMORY[0x25A2F49C0](v20);
  uint64_t v12 = (uint64_t (*)(void *, id, void *, id *))v11[2];
  id v19 = 0;
  int v13 = v12(v11, v6, v9, &v19);
  id v14 = v19;
  id v15 = v14;
  if (v13 && !v14)
  {
    id v18 = 0;
    LOBYTE(v13) = ((uint64_t (*)(void *, id, PFPosterPath *, id *))v11[2])(v11, v6, self, &v18);
    id v15 = v18;
  }
  [v9 invalidate];
  if (a4 && v15) {
    *a4 = v15;
  }
  if (v15) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v13;
  }

  return v16;
}

uint64_t __41__PFPosterPath_copyContentsOfPath_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  int v29 = a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v31 = a3;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  long long v41 = __Block_byref_object_copy__0;
  long long v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  id v7 = *(void **)(a1 + 32);
  uint64_t v30 = v6;
  unint64_t v8 = [v6 contentsURL];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __41__PFPosterPath_copyContentsOfPath_error___block_invoke_146;
  v37[3] = &unk_26546EFE8;
  v37[4] = &v38;
  uint64_t v9 = [v7 enumeratorAtURL:v8 includingPropertiesForKeys:0 options:17 errorHandler:v37];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v10);
        }
        if (v39[5]) {
          goto LABEL_18;
        }
        id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v15 = NSURL;
        BOOL v16 = [v14 relativePath];
        __int16 v17 = [v31 contentsURL];
        id v18 = [v15 fileURLWithPath:v16 relativeToURL:v17];
        id v19 = [v18 absoluteURL];

        if ([v19 checkResourceIsReachableAndReturnError:0]) {
          [*(id *)(a1 + 32) removeItemAtURL:v19 error:0];
        }
        uint64_t v20 = *(void **)(a1 + 32);
        id v32 = 0;
        char v21 = objc_msgSend(v20, "copyItemAtURL:toURL:error:", v14, v19, &v32, v29);
        id v22 = v32;
        uint64_t v23 = v22;
        if ((v21 & 1) == 0)
        {
          if (v22)
          {
            *int v29 = v22;
          }
          else
          {
            id v25 = (void *)MEMORY[0x263F087E8];
            uint64_t v44 = *MEMORY[0x263F08338];
            long long v45 = @"Unable to copy files";
            uint64_t v26 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
            objc_msgSend(v25, "pf_errorWithCode:userInfo:", 1, v26);
            id v27 = objc_claimAutoreleasedReturnValue();
            *int v29 = v27;
          }
LABEL_18:
          uint64_t v24 = 0;
          goto LABEL_19;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v46 count:16];
      uint64_t v24 = 1;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v24 = 1;
  }
LABEL_19:

  _Block_object_dispose(&v38, 8);
  return v24;
}

uint64_t __41__PFPosterPath_copyContentsOfPath_error___block_invoke_146(uint64_t a1, int a2, id obj)
{
  return 0;
}

- (NSURL)containerURL
{
  return [(NSURL *)self->_contentsURL URLByDeletingLastPathComponent];
}

- (NSString)role
{
  role = [(PFServerPosterIdentity *)self->_serverIdentity role];
  id v4 = role;
  if (!role) {
    role = self->_role;
  }
  id v5 = role;

  return v5;
}

- (BOOL)ensureContentsURLIsReachableAndReturnError:(id *)a3
{
  id v5 = objc_opt_new();
  contentsURL = self->_contentsURL;
  id v16 = 0;
  BOOL v7 = [(NSURL *)contentsURL checkResourceIsReachableAndReturnError:&v16];
  id v8 = v16;
  if (v7)
  {
    char v9 = 1;
  }
  else
  {
    id v10 = self->_contentsURL;
    uint64_t v11 = PFPosterPathFileAttributes();
    id v15 = 0;
    char v9 = [v5 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v11 error:&v15];
    id v12 = v15;

    if ((v9 & 1) == 0 && a3)
    {
      if (v12) {
        int v13 = v12;
      }
      else {
        int v13 = v8;
      }
      *a3 = v13;
    }
  }
  return v9;
}

- (int64_t)compareDescriptorIdentifiers:(id)a3
{
  uint64_t v4 = [a3 descriptorIdentifier];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_2707FB7C8;
  }
  uint64_t v7 = [(PFPosterPath *)self descriptorIdentifier];
  id v8 = (void *)v7;
  if (v7) {
    char v9 = (__CFString *)v7;
  }
  else {
    char v9 = &stru_2707FB7C8;
  }
  int64_t v10 = [(__CFString *)v6 compare:v9];

  return v10;
}

- (id)loadUserInfoWithError:(id *)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  userInfo = v4->_userInfo;
  if (userInfo)
  {
    id v6 = userInfo;
  }
  else
  {
    uint64_t v7 = [(NSURL *)v4->_contentsURL URLByAppendingPathComponent:@"com.apple.posterkit.provider.contents.userInfo" isDirectory:0];
    id v8 = objc_msgSend(v7, "pf_loadFromPlistWithError:", a3);
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    int v13 = v4->_userInfo;
    v4->_userInfo = v12;

    id v6 = v4->_userInfo;
  }
  objc_sync_exit(v4);

  return v6;
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    NSClassFromString(&cfstr_Nsdictionary.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[PFPosterPath storeUserInfo:error:](a2);
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x25A0994A0);
    }
  }

  id v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(NSURL *)v8->_contentsURL URLByAppendingPathComponent:@"com.apple.posterkit.provider.contents.userInfo" isDirectory:0];
  if (v7)
  {
    if (-[PFPosterPath ensureContentsURLIsReachableAndReturnError:](v8, "ensureContentsURLIsReachableAndReturnError:", a4)&& objc_msgSend(v9, "pf_storeToPlist:error:", v7, a4))
    {
      uint64_t v10 = [v7 copy];
      userInfo = v8->_userInfo;
      v8->_userInfo = (NSDictionary *)v10;

      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    int v13 = objc_opt_new();
    int v12 = [v13 removeItemAtURL:v9 error:a4];

    id v14 = v8->_userInfo;
    v8->_userInfo = 0;

    id v15 = PFLogPosterContents();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v16 = *a4;
      }
      else {
        id v16 = 0;
      }
      *(_DWORD *)buf = 67240706;
      int v20 = v12;
      __int16 v21 = 2114;
      id v22 = v16;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_impl(&dword_25A085000, v15, OS_LOG_TYPE_DEFAULT, "erasing userInfo: %{public}i %{public}@ (path=%@)", buf, 0x1Cu);
    }
  }
  objc_sync_exit(v8);

  return v12;
}

- (id)extendContentsReadAccessToAuditToken:(id)a3 error:(id *)a4
{
  return -[PFPosterPath _extendReadAccessForURL:toAuditToken:error:]((void **)&self->super.isa, self->_contentsURL, a3, a4);
}

+ (void)_setDisableUniquing:(BOOL)a3
{
  __disableUniquing_0 = a3;
}

- (BOOL)isServerPosterPath
{
  return 0;
}

- (uint64_t)_sandboxExtensionLevel
{
  if (a1) {
    return *MEMORY[0x263EF8000];
  }
  else {
    return 0;
  }
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 encodeObject:self->_contentsURL forKey:@"c"];
  [v4 encodeObject:self->_serverIdentity forKey:@"i"];
  [v4 encodeObject:self->_descriptorIdentifier forKey:@"d"];
  [v4 encodeObject:self->_role forKey:@"r"];
  if (self->_sandboxExtensionURL)
  {
    *__error() = 0;
    sandboxExtensionAuditTokeuint64_t n = self->_sandboxExtensionAuditToken;
    [(NSURL *)self->_sandboxExtensionURL fileSystemRepresentation];
    if (sandboxExtensionAuditToken)
    {
      id v6 = self->_sandboxExtensionAuditToken;
      if (v6) {
        [(BSAuditToken *)v6 realToken];
      }
      id v7 = (const char *)sandbox_extension_issue_file_to_process();
    }
    else
    {
      id v7 = (const char *)sandbox_extension_issue_file();
    }
    id v8 = (char *)v7;
    if (v7)
    {
      xpc_object_t v9 = xpc_string_create(v7);
      free(v8);
      [v4 encodeXPCObject:v9 forKey:@"t"];
      uint64_t v10 = PFLogPosterContents();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PFPosterPath encodeWithBSXPCCoder:]();
      }
    }
    else
    {
      uint64_t v11 = __error();
      strerror_r(*v11, __strerrbuf, 0x100uLL);
      __error();
      id v16 = (id)+[PFPosterPath _reportSandboxExtensionError:2, @"cannot extend access of %@ due to sandbox errno=%i (%s)", v12, v13, v14, v15, (uint64_t)self withCode reason];
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0 && (-[PFPosterPath _isPersistable]((uint64_t)self) & 1) == 0)
  {
    uint64_t v26 = NSString;
    id v27 = (objc_class *)objc_opt_class();
    uint64_t v28 = NSStringFromClass(v27);
    int v29 = (objc_class *)objc_opt_class();
    uint64_t v30 = NSStringFromClass(v29);
    id v31 = (objc_class *)objc_opt_class();
    id v32 = NSStringFromClass(v31);
    long long v33 = [v26 stringWithFormat:@"<%@:%p> can only be encoded by %@ rather than %@ : %@", v28, self, v30, v32, self];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFPosterPath encodeWithCoder:]();
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A099E30);
  }
  [v4 encodeObject:self->_contentsURL forKey:@"c"];
  [v4 encodeObject:self->_serverIdentity forKey:@"i"];
  [v4 encodeObject:self->_descriptorIdentifier forKey:@"d"];
  [v4 encodeObject:self->_role forKey:@"r"];
  if (self->_sandboxExtensionURL)
  {
    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v18 = NSString;
      id v19 = (objc_class *)objc_opt_class();
      int v20 = NSStringFromClass(v19);
      __int16 v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      __int16 v23 = (objc_class *)objc_opt_class();
      uint64_t v24 = NSStringFromClass(v23);
      uint64_t v25 = [v18 stringWithFormat:@"<%@:%p> requires %@ rather than %@ : %@", v20, self, v22, v24, self];

      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[PFPosterPath encodeWithCoder:]();
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x25A099D80);
    }
    *__error() = 0;
    sandboxExtensionAuditTokeuint64_t n = self->_sandboxExtensionAuditToken;
    [(NSURL *)self->_sandboxExtensionURL fileSystemRepresentation];
    if (sandboxExtensionAuditToken)
    {
      id v7 = self->_sandboxExtensionAuditToken;
      if (v7) {
        [(BSAuditToken *)v7 realToken];
      }
      id v8 = (const char *)sandbox_extension_issue_file_to_process();
    }
    else
    {
      id v8 = (const char *)sandbox_extension_issue_file();
    }
    xpc_object_t v9 = (char *)v8;
    if (v8)
    {
      xpc_object_t v10 = xpc_string_create(v8);
      free(v9);
      [v4 encodeXPCObject:v10 forKey:@"t"];
      uint64_t v11 = PFLogPosterContents();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PFPosterPath encodeWithCoder:]();
      }
    }
    else
    {
      uint64_t v12 = __error();
      strerror_r(*v12, __strerrbuf, 0x100uLL);
      __error();
      id v17 = (id)+[PFPosterPath _reportSandboxExtensionError:2, @"cannot extend access of %@ due to sandbox errno=%i (%s)", v13, v14, v15, v16, (uint64_t)self withCode reason];
    }
  }
}

- (PFPosterPath)initWithCoder:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  if (v5 == (objc_class *)objc_opt_class() || v5 == (objc_class *)objc_opt_class())
  {
    xpc_object_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"c"];
    xpc_object_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"r"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v14 = -1;
LABEL_24:
      id v8 = (PFPosterPath *)-[PFPosterPath _initDecodedWithContentsURL:role:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:](self, v9, v12, v10, v11, v14);

      goto LABEL_25;
    }
    uint64_t v13 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8798] forKey:@"t"];
    if (!v13)
    {
      uint64_t v14 = -1;
LABEL_23:

      goto LABEL_24;
    }
    *__error() = 0;
    uint64_t v38 = v13;
    xpc_string_get_string_ptr(v13);
    uint64_t v14 = sandbox_extension_consume();
    uint64_t v15 = [v10 descriptorIdentifier];
    uint64_t v16 = (void *)v15;
    if (v15) {
      id v17 = (void *)v15;
    }
    else {
      id v17 = v11;
    }
    id v18 = v17;

    if (v14 != -1)
    {
      id v19 = PFLogPosterContents();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v18)
      {
        if (v20)
        {
          __int16 v21 = NSStringFromClass(v5);
          *(_DWORD *)__strerrbuf = 138413058;
          long long v52 = v38;
          __int16 v53 = 2114;
          long long v54 = v21;
          __int16 v55 = 2114;
          id v56 = v18;
          __int16 v57 = 2114;
          long long v58 = v9;
          id v22 = "consumed nsxpc decoded sandboxToken %@ : <%{public}@ %{public}@ path=%{public}@>";
          __int16 v23 = v19;
          uint32_t v24 = 42;
LABEL_27:
          _os_log_debug_impl(&dword_25A085000, v23, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)__strerrbuf, v24);
        }
      }
      else if (v20)
      {
        __int16 v21 = NSStringFromClass(v5);
        *(_DWORD *)__strerrbuf = 138412802;
        long long v52 = v38;
        __int16 v53 = 2114;
        long long v54 = v21;
        __int16 v55 = 2114;
        id v56 = v9;
        id v22 = "consumed nsxpc decoded sandboxToken %@ : <%{public}@ path=%{public}@>";
        __int16 v23 = v19;
        uint32_t v24 = 32;
        goto LABEL_27;
      }

LABEL_22:
      uint64_t v13 = v38;
      goto LABEL_23;
    }
    uint64_t v25 = __error();
    strerror_r(*v25, __strerrbuf, 0x100uLL);
    uint64_t v26 = PFLogPosterContents();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v27)
      {
        id v37 = v18;
        uint64_t v28 = v26;
        int v29 = *__error();
        uint64_t v30 = NSStringFromClass(v5);
        *(_DWORD *)buf = 138413570;
        uint64_t v40 = v38;
        __int16 v41 = 1024;
        int v42 = v29;
        uint64_t v26 = v28;
        id v18 = v37;
        __int16 v43 = 2082;
        uint64_t v44 = __strerrbuf;
        __int16 v45 = 2114;
        long long v46 = v30;
        __int16 v47 = 2114;
        long long v48 = v37;
        __int16 v49 = 2114;
        long long v50 = v9;
        id v31 = "failed to consume sandboxToken %@ from nsxpc with errno=%i (%{public}s) : <%{public}@ %{public}@ path=%{public}@>";
        id v32 = v26;
        uint32_t v33 = 58;
LABEL_29:
        _os_log_error_impl(&dword_25A085000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
      }
    }
    else if (v27)
    {
      uint64_t v35 = v26;
      int v36 = *__error();
      uint64_t v30 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138413314;
      uint64_t v40 = v38;
      __int16 v41 = 1024;
      int v42 = v36;
      uint64_t v26 = v35;
      id v18 = 0;
      __int16 v43 = 2082;
      uint64_t v44 = __strerrbuf;
      __int16 v45 = 2114;
      long long v46 = v30;
      __int16 v47 = 2114;
      long long v48 = v9;
      id v31 = "failed to consume sandboxToken %@ from nsxpc with errno=%i (%{public}s) : <%{public}@ path=%{public}@>";
      id v32 = v26;
      uint32_t v33 = 48;
      goto LABEL_29;
    }

    goto LABEL_22;
  }
  -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](self, 0, 0, 2, 0, 0, -1, 0, 0);
  id v7 = (void *)v6;
  -[PFPosterPath _invalidate](v6);

  id v8 = 0;
LABEL_25:

  return v8;
}

- (void)invalidate
{
  if ((self->_options & 2) == 0) {
    -[PFPosterPath _invalidate]((uint64_t)self);
  }
}

- (NSString)description
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[PFPosterPath _lock_descriptionWithDebugInfo:]((const os_unfair_lock *)self, 0);
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (NSString)debugDescription
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[PFPosterPath _lock_descriptionWithDebugInfo:]((const os_unfair_lock *)self, 1);
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (PFServerPosterIdentity)serverIdentity
{
  return self->_serverIdentity;
}

- (NSURL)contentsURL
{
  return self->_contentsURL;
}

- (void)_initWithContentsURL:(const char *)a1 role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:.cold.1(const char *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  int v5 = 138413314;
  uint64_t v6 = v1;
  OUTLINED_FUNCTION_9();
  uint64_t v7 = 0;
  __int16 v8 = v4;
  xpc_object_t v9 = @"PFPosterPath.m";
  __int16 v10 = 1024;
  int v11 = 156;
  _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v5, 0x30u);
}

- (void)_initWithContentsURL:(uint64_t)a1 role:(NSObject *)a2 options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_25A085000, a2, OS_LOG_TYPE_DEBUG, "created purgeable contents=%{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.4()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.5()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.6()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.7()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.8()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.9()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_reportSandboxExtensionError:withCode:reason:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_extendReadAccessForURL:toAuditToken:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)temporaryDescriptorPathWithIdentifier:role:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)temporaryDescriptorPathWithIdentifier:role:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)temporaryPathForRole:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)temporaryPathForTask:role:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)storeUserInfo:(const char *)a1 error:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, 2u);
}

- (void)extendValidityForReason:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)extendValidityForReason:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __40__PFPosterPath_extendValidityForReason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 40));
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_initDecodedWithContentsURL:role:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)encodeWithBSXPCCoder:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_1(&dword_25A085000, v0, v1, "created and bsxpc encoded sandboxToken %@ : %@");
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_1(&dword_25A085000, v0, v1, "created and nsxpc encoded sandboxToken %@ : %@");
}

- (void)encodeWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)encodeWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end