@interface PFServerPosterPath
+ (id)_cachedPathWithContentsURL:(void *)a3 identity:(void *)a4 allocedInstance:;
+ (id)pathWithContainerURL:(id)a3 identity:(id)a4;
+ (id)pathWithProviderURL:(id)a3 identity:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPersistable:(id)a3;
- (BOOL)isServerPosterPath;
- (NSString)identityPathComponent;
- (NSString)stablePersistenceIdentifier;
- (NSURL)identifierURL;
- (NSURL)instanceURL;
- (NSURL)providerURL;
- (NSURL)supplementURL;
- (NSURL)typeURL;
- (NSURL)versionsURL;
- (PFServerPosterIdentity)identity;
- (id)containerURL;
- (id)extendContentsReadAccessToAuditToken:(id)a3 error:(id *)a4;
- (id)extendInstanceReadAccessToAuditToken:(id)a3 error:(id *)a4;
@end

@implementation PFServerPosterPath

+ (id)_cachedPathWithContentsURL:(void *)a3 identity:(void *)a4 allocedInstance:
{
  id v6 = a2;
  id v7 = a3;
  v8 = a4;
  self;
  if (!v6)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"contentsURL"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath _cachedPathWithContentsURL:identity:allocedInstance:]();
    }
LABEL_29:
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A099828);
  }
  if (!v7)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath _cachedPathWithContentsURL:identity:allocedInstance:]();
    }
    goto LABEL_29;
  }
  if (__disableUniquing_0)
  {
    if (!v8) {
      v8 = [PFServerPosterPath alloc];
    }
    v9 = v8;
    v10 = [v7 role];
    -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v9, v6, v10, 2, v7, 0, -1, 0, 0);
    v12 = v11;
  }
  else
  {
    os_unfair_lock_lock(&__cachedServerPathsByIdentityByURLLock);
    v13 = [(id)__cachedServerPathsByIdentityByURL objectForKey:v6];
    v12 = [v13 objectForKey:v7];

    if (v12)
    {
      v9 = v8;
      v14 = [v7 role];
      -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v9, 0, v14, 2, 0, 0, -1, 0, 0);
      v16 = (void *)v15;
      -[PFPosterPath _invalidate](v15);
    }
    else
    {
      v17 = [(id)__cachedServerPathsByIdentityByURL objectForKey:v6];
      v14 = v17;
      if (v17)
      {
        v18 = [v17 objectEnumerator];
        v19 = [v18 nextObject];

        if (v19)
        {
          uint64_t v20 = [v19 contentsURL];

          id v6 = (id)v20;
        }
      }
      if (!v8) {
        v8 = [PFServerPosterPath alloc];
      }
      v9 = v8;
      v21 = [v7 role];
      -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v9, v6, v21, 2, v7, 0, -1, 0, 0);
      v12 = v22;

      if (!v14)
      {
        if (!__cachedServerPathsByIdentityByURL)
        {
          uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
          v24 = (void *)__cachedServerPathsByIdentityByURL;
          __cachedServerPathsByIdentityByURL = v23;
        }
        v14 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:5];
        v25 = (void *)__cachedServerPathsByIdentityByURL;
        v26 = [v12 contentsURL];
        [v25 setObject:v14 forKey:v26];
      }
      v16 = [v12 identity];
      [v14 setObject:v12 forKey:v16];
    }

    os_unfair_lock_unlock(&__cachedServerPathsByIdentityByURLLock);
  }

  return v12;
}

+ (id)pathWithContainerURL:(id)a3 identity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v8)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath pathWithContainerURL:identity:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09A588);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath pathWithContainerURL:identity:]();
    }
LABEL_16:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09A524);
  }

  if (![v8 isFileURL] || (objc_msgSend(v8, "hasDirectoryPath") & 1) == 0)
  {
    v13 = [NSString stringWithFormat:@"containerURL must be a fileURL directory : %@", v8];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath pathWithContainerURL:identity:]();
    }
    goto LABEL_16;
  }
  v9 = [v7 provider];
  v10 = [v8 URLByAppendingPathComponent:v9 isDirectory:1];

  v11 = [a1 pathWithProviderURL:v10 identity:v7];

  return v11;
}

+ (id)pathWithProviderURL:(id)a3 identity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v7)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath pathWithProviderURL:identity:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09A808);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath pathWithProviderURL:identity:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09A86CLL);
  }

  if (![v7 isFileURL] || (objc_msgSend(v7, "hasDirectoryPath") & 1) == 0)
  {
    v16 = [NSString stringWithFormat:@"providerURL must be a fileURL directory : %@", v7];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath pathWithProviderURL:identity:].cold.5();
    }
LABEL_28:
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09A7A4);
  }
  id v8 = v6;
  NSClassFromString(&cfstr_Pfserverposter_4.isa);
  if (!v8)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath pathWithProviderURL:identity:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09A8D0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath pathWithProviderURL:identity:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09A934);
  }

  uint64_t v9 = [v8 type];
  uint64_t v10 = [v8 version];
  v11 = [v8 posterUUID];
  v12 = objc_msgSend(NSURL, "pf_posterPathContentsURLForProviderURL:type:posterUUID:version:", v7, v9, v11, v10);
  if (!v12)
  {
    v16 = [NSString stringWithFormat:@"failed to construct contentsURL from '%@' and %@", v7, v8];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterPath pathWithProviderURL:identity:]();
    }
    goto LABEL_28;
  }
  v13 = v12;
  v14 = +[PFServerPosterPath _cachedPathWithContentsURL:identity:allocedInstance:]((uint64_t)PFServerPosterPath, v12, v8, 0);

  return v14;
}

- (PFServerPosterIdentity)identity
{
  return self->super._serverIdentity;
}

- (id)containerURL
{
  v2 = [(PFServerPosterPath *)self providerURL];
  v3 = [v2 URLByDeletingLastPathComponent];

  return v3;
}

- (NSURL)providerURL
{
  v2 = [(PFServerPosterPath *)self typeURL];
  v3 = [v2 URLByDeletingLastPathComponent];

  return (NSURL *)v3;
}

- (NSURL)typeURL
{
  v2 = [(PFServerPosterPath *)self identifierURL];
  v3 = [v2 URLByDeletingLastPathComponent];

  return (NSURL *)v3;
}

- (NSURL)identifierURL
{
  v2 = [(PFServerPosterPath *)self versionsURL];
  v3 = [v2 URLByDeletingLastPathComponent];

  return (NSURL *)v3;
}

- (NSURL)versionsURL
{
  v2 = [(PFServerPosterPath *)self instanceURL];
  v3 = [v2 URLByDeletingLastPathComponent];

  return (NSURL *)v3;
}

- (NSURL)instanceURL
{
  return [(NSURL *)self->super._contentsURL URLByDeletingLastPathComponent];
}

- (NSURL)supplementURL
{
  v3 = NSURL;
  v4 = [(PFServerPosterPath *)self instanceURL];
  id v5 = objc_msgSend(v3, "pf_posterPathSupplementURLForInstanceURL:supplement:", v4, -[PFServerPosterIdentity supplement](self->super._serverIdentity, "supplement"));

  return (NSURL *)v5;
}

- (NSString)identityPathComponent
{
  v2 = NSURL;
  v3 = self->super._serverIdentity;
  v4 = [(PFServerPosterIdentity *)v3 provider];
  id v5 = [v2 URLWithString:v4];

  uint64_t v6 = [(PFServerPosterIdentity *)v3 type];
  uint64_t v7 = [(PFServerPosterIdentity *)v3 version];
  id v8 = [(PFServerPosterIdentity *)v3 posterUUID];

  uint64_t v9 = objc_msgSend(NSURL, "pf_posterPathInstanceURLForProviderURL:type:posterUUID:version:", v5, v6, v8, v7);
  uint64_t v10 = [v9 path];

  return (NSString *)v10;
}

- (NSString)stablePersistenceIdentifier
{
  return [(PFServerPosterIdentity *)self->super._serverIdentity stablePersistenceIdentifier];
}

- (id)extendInstanceReadAccessToAuditToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PFServerPosterPath *)self instanceURL];
  id v8 = -[PFPosterPath _extendReadAccessForURL:toAuditToken:error:]((void **)&self->super.super.isa, v7, v6, a4);

  return v8;
}

- (id)extendContentsReadAccessToAuditToken:(id)a3 error:(id *)a4
{
  return -[PFPosterPath _extendReadAccessForURL:toAuditToken:error:]((void **)&self->super.super.isa, self->super._contentsURL, a3, a4);
}

- (BOOL)isEqualToPersistable:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v5 = -[PFPosterPath _isEqualToPersistable:]((uint64_t)self, v4);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isServerPosterPath
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

+ (void)_cachedPathWithContentsURL:identity:allocedInstance:.cold.1()
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

+ (void)_cachedPathWithContentsURL:identity:allocedInstance:.cold.2()
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

+ (void)pathWithContainerURL:identity:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pathWithContainerURL:identity:.cold.2()
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

+ (void)pathWithProviderURL:identity:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pathWithProviderURL:identity:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pathWithProviderURL:identity:.cold.3()
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

+ (void)pathWithProviderURL:identity:.cold.5()
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

@end