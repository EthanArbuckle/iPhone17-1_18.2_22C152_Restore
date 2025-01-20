@interface RBContainerManager
- (BOOL)containerRequiredForServiceDict:(id)a3;
- (OptionalUID)_fetchCacheUIDChoice:(id)a3;
- (RBContainerManager)initWithPersonaManager:(id)a3;
- (id)_allowedContainerOverrideIdentifiers;
- (id)_lookupContainerPathForIdentity:(id)a3 context:(id)a4 persona:(id)a5 containerIdentifier:(id)a6 retry:(BOOL)a7 error:(id *)a8;
- (id)_retryLookupAfterCacheMissForIdentity:(id)a3 context:(id)a4 persona:(id)a5 containerIdentifier:(id)a6;
- (id)_sandboxContainerURLForExtensionContext:(id)a3 containerOverrideIdentifier:(id)a4;
- (id)containerPathForIdentity:(id)a3 context:(id)a4 persona:(id)a5 error:(id *)a6;
- (id)sandboxContainerURLForExtensionContext:(id)a3 containerOverrideIdentifier:(id)a4;
- (void)_fetchCache:(id)a3;
- (void)_probeCache:(const void *)a3 withContainerIdentifier:(id)a4 persona:(id)a5 completionHandler:(id)a6;
- (void)_probeCacheSubqueryIterationEvaluate:(container_object_s *)a3 withAccummulatedState:(ProbeCacheSubqueryIterationAccumulatedState *)a4;
- (void)dealloc;
@end

@implementation RBContainerManager

- (BOOL)containerRequiredForServiceDict:(id)a3
{
  id v3 = a3;
  v4 = xpc_dictionary_get_value(v3, "_SandboxContainer");
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = xpc_dictionary_get_value(v3, "_MultipleInstances");
    BOOL v5 = v6 == 0;
  }
  return v5;
}

- (RBContainerManager)initWithPersonaManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBContainerManager;
  v6 = [(RBContainerManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_personaManager, a3);
  }

  return v7;
}

- (OptionalUID)_fetchCacheUIDChoice:(id)a3
{
  uint64_t foreground_uid = xpc_user_sessions_enabled();
  if (foreground_uid)
  {
    uint64_t foreground_uid = xpc_user_sessions_get_foreground_uid();
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (OptionalUID)(v4 | (foreground_uid << 32));
}

- (void)_fetchCache:(id)a3
{
  OptionalUID v4 = [(RBContainerManager *)self _fetchCacheUIDChoice:a3];
  unsigned int v5 = *(_DWORD *)&v4.set;
  unint64_t v6 = HIDWORD(*(unint64_t *)&v4);
  BOOL set = v4.set;
  BOOL v9 = self->_queryUID.set && set && self->_queryUID.uid != v4.uid;
  if (self->_queryUID.set != set || v9)
  {
    container_query_free();
    self->_queryForApps = 0;
    container_query_free();
    self->_queryForPlugins = 0;
    v11 = rbs_job_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_DEFAULT, "Discarded container cache on UID change", v12, 2u);
    }
  }
  if (!self->_queryForApps)
  {
    self->_queryForApps = (container_query_s *)container_query_create();
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    if (set) {
      container_query_set_uid();
    }
    self->_queryUID.BOOL set = v5;
    *(&self->_queryUID.set + 3) = HIBYTE(v5);
    *(_WORD *)(&self->_queryUID.set + 1) = v5 >> 8;
    self->_queryUID.uid = v6;
  }
}

- (id)_retryLookupAfterCacheMissForIdentity:(id)a3 context:(id)a4 persona:(id)a5 containerIdentifier:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [a5 UTF8String];
  container_query_create();
  container_query_set_class();
  container_query_operation_set_flags();
  container_query_set_include_other_owners();
  if (xpc_user_sessions_enabled())
  {
    *(_DWORD *)v23 = 0;
    xpc_user_sessions_get_foreground_uid();
    container_query_set_uid();
  }
  id v14 = v12;
  xpc_object_t v15 = xpc_string_create((const char *)[v14 UTF8String]);
  container_query_set_identifiers();
  if (v13) {
    container_query_set_persona_unique_string();
  }
  objc_msgSend(v10, "platform", *(void *)v23);
  container_query_operation_set_platform();
  if (container_query_get_single_result() && (uint64_t path = container_get_path()) != 0)
  {
    uint64_t v17 = path;
    container_query_free();
    self->_queryForApps = 0;
    container_query_free();
    self->_queryForPlugins = 0;
    v18 = rbs_job_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_226AB3000, v18, OS_LOG_TYPE_DEFAULT, "Discarded container cache after retry", v23, 2u);
    }

    v19 = [NSString stringWithUTF8String:v17];
  }
  else
  {
    v20 = rbs_job_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v11 bundleIdentifier];
      *(_DWORD *)v23 = 138543874;
      *(void *)&v23[4] = v10;
      __int16 v24 = 2114;
      id v25 = v14;
      __int16 v26 = 2114;
      v27 = v21;
      _os_log_impl(&dword_226AB3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Container path could not be computed for identifier '%{public}@', will not be passed to launch of %{public}@", v23, 0x20u);
    }
    v19 = 0;
  }
  container_query_free();

  return v19;
}

- (void)_probeCacheSubqueryIterationEvaluate:(container_object_s *)a3 withAccummulatedState:(ProbeCacheSubqueryIterationAccumulatedState *)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  ++a4->var2;
  if (a4->var0) {
    return;
  }
  uint64_t path = (const char *)container_get_path();
  uint64_t v6 = container_copy_sandbox_token();
  v7 = (void *)v6;
  if (path && v6)
  {
    uint64_t v8 = sandbox_extension_consume();
    uint64_t v9 = *__error();
    free(v7);
    if ((v8 & 0x8000000000000000) == 0)
    {
      if (access(path, 0))
      {
        if (*__error() == 2 || a4->var1)
        {
LABEL_19:
          MEMORY[0x270EDB2D8](v8);
          return;
        }
        uint64_t v10 = *__error();
        id v11 = [NSString stringWithFormat:@"access test failed while computing process container path"];
        id v12 = _posixErrorWithCodeAndDescription(v10, v11);
        id var1 = a4->var1;
        a4->id var1 = v12;
      }
      else
      {
        id v11 = [MEMORY[0x263F08850] defaultManager];
        v27 = [v11 stringWithFileSystemRepresentation:path length:strlen(path)];
        id var1 = a4->var0;
        a4->var0 = v27;
      }

      goto LABEL_19;
    }
    if (!a4->var1)
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Container token could not be consumed: errno %d", v9);
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08438];
      uint64_t v28 = *MEMORY[0x263F08320];
      v29[0] = v21;
      __int16 v24 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v25 = [v22 errorWithDomain:v23 code:22 userInfo:v24];

      id v26 = a4->var1;
      a4->id var1 = v25;
    }
  }
  else
  {
    if (!a4->var1)
    {
      id v14 = "path";
      if (path) {
        id v14 = "token";
      }
      xpc_object_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Container did not have a %s", v14);
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F08438];
      uint64_t v28 = *MEMORY[0x263F08320];
      v29[0] = v15;
      v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      v19 = [v16 errorWithDomain:v17 code:22 userInfo:v18];

      id v20 = a4->var1;
      a4->id var1 = v19;
    }
    free(v7);
  }
}

- (void)_probeCache:(const void *)a3 withContainerIdentifier:(id)a4 persona:(id)a5 completionHandler:(id)a6
{
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(id, void, void *))a6;
  container_query_create();
  id v11 = v8;
  xpc_object_t v12 = xpc_string_create((const char *)[v11 UTF8String]);
  container_query_set_identifiers();
  id v13 = v9;
  if ([v13 UTF8String]) {
    container_query_set_persona_unique_string();
  }
  v22 = 0;
  if ((container_query_iterate_results_with_subquery_sync() & 1) == 0)
  {
    container_query_get_last_error();
    id v14 = (void *)container_error_copy_unlocalized_description();
    xpc_object_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"container_query_iterate_results_with_subquery_sync failed. Container Manager error = %s", v14);
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08320];
    v24[0] = v15;
    uint64_t v17 = NSDictionary;
    id v18 = v15;
    v19 = [v17 dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v20 = [v16 errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v19];

    v22 = (void *)v20;
    free(v14);
  }
  container_query_free();
  if (v22)
  {

    v21 = v22;
  }
  else
  {
    v21 = 0;
  }
  v10[2](v10, 0, v21);
}

uint64_t __84__RBContainerManager__probeCache_withContainerIdentifier_persona_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)_lookupContainerPathForIdentity:(id)a3 context:(id)a4 persona:(id)a5 containerIdentifier:(id)a6 retry:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v37 = 0;
  v38[0] = &v37;
  v38[1] = 0x3032000000;
  v38[2] = __Block_byref_object_copy__3;
  v38[3] = __Block_byref_object_dispose__3;
  id v39 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  id v36 = 0;
  queryForApps = self->_queryForApps;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke;
  v30[3] = &unk_2647C8680;
  v30[4] = &v31;
  v30[5] = &v37;
  [(RBContainerManager *)self _probeCache:queryForApps withContainerIdentifier:v17 persona:v16 completionHandler:v30];
  uint64_t v19 = v38[0];
  if (!v32[5] && !*(void *)(v38[0] + 40) && self->_queryForPlugins)
  {
    uint64_t v20 = rbs_job_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v41 = v14;
      __int16 v42 = 2114;
      id v43 = v17;
      _os_log_impl(&dword_226AB3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Attempting lookup in plugin cache of container path for container identifier (%{public}@)", buf, 0x16u);
    }

    queryForPlugins = self->_queryForPlugins;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    void v29[2] = __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke_15;
    v29[3] = &unk_2647C8680;
    v29[4] = &v31;
    v29[5] = &v37;
    [(RBContainerManager *)self _probeCache:queryForPlugins withContainerIdentifier:v17 persona:v16 completionHandler:v29];
    uint64_t v19 = v38[0];
  }
  if (*(void *)(v19 + 40))
  {
    v22 = rbs_job_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[RBContainerManager _lookupContainerPathForIdentity:context:persona:containerIdentifier:retry:error:]((uint64_t)v14, (uint64_t)v38, v22);
    }
    id v23 = 0;
    goto LABEL_11;
  }
  v27 = (void *)v32[5];
  if (v27)
  {
    id v23 = v27;
    v22 = rbs_job_log();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543618;
    id v41 = v14;
    __int16 v42 = 2114;
    id v43 = v23;
    uint64_t v28 = "%{public}@ Found container path (%{public}@)";
    goto LABEL_23;
  }
  if (!v9)
  {
    id v23 = 0;
    if (!a8) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v23 = [(RBContainerManager *)self _retryLookupAfterCacheMissForIdentity:v14 context:v15 persona:v16 containerIdentifier:v17];
  v22 = rbs_job_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v41 = v14;
    __int16 v42 = 2114;
    id v43 = v23;
    uint64_t v28 = "%{public}@ Found container path on retry (%{public}@)";
LABEL_23:
    _os_log_impl(&dword_226AB3000, v22, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
  }
LABEL_11:

  if (!a8) {
    goto LABEL_14;
  }
LABEL_12:
  __int16 v24 = *(void **)(v38[0] + 40);
  if (v24) {
    *a8 = v24;
  }
LABEL_14:
  id v25 = v23;
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v25;
}

void __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)containerPathForIdentity:(id)a3 context:(id)a4 persona:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v10 = (char *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 containerIdentifier];
  if (v13 || ([v11 bundleIdentifier], (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v14 = rbs_job_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v25 = v10;
      __int16 v26 = 2114;
      double v27 = *(double *)&v12;
      __int16 v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_226AB3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Looking up container path with persona %{public}@ using container identifier '%{public}@'", buf, 0x20u);
    }

    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if (v12 && [(RBPersonaManager *)self->_personaManager isConcretePersona:v12]) {
        goto LABEL_13;
      }
      id v15 = rbs_job_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v25 = v10;
        __int16 v26 = 2114;
        double v27 = *(double *)&v12;
        _os_log_impl(&dword_226AB3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Persona (%{public}@) for launch context is not a concrete persona - converting to Personal", buf, 0x16u);
      }

      uint64_t v16 = [(RBPersonaManager *)self->_personaManager personalPersonaUniqueString];

      id v12 = (id)v16;
    }
    if (!v12)
    {
      id v17 = 0;
      id v18 = 0;
      if ([(RBPersonaManager *)self->_personaManager personasAreSupported])
      {
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_13:
    double Current = CFAbsoluteTimeGetCurrent();
    [(RBContainerManager *)self _fetchCache:v11];
    id v23 = 0;
    id v18 = [(RBContainerManager *)self _lookupContainerPathForIdentity:v10 context:v11 persona:v12 containerIdentifier:v13 retry:1 error:&v23];
    id v17 = v23;
    [(RBContainerManager *)self _clearCache];
    double v20 = CFAbsoluteTimeGetCurrent();
    v21 = rbs_job_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "-[RBContainerManager containerPathForIdentity:context:persona:error:]";
      __int16 v26 = 2048;
      double v27 = v20 - Current;
      _os_log_impl(&dword_226AB3000, v21, OS_LOG_TYPE_DEFAULT, "%s: containermanager query required %f seconds wall clock time.", buf, 0x16u);
    }

    if (a6 && v17)
    {
      id v17 = v17;
      *a6 = v17;
    }
    goto LABEL_18;
  }
  id v13 = rbs_job_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = v10;
    __int16 v26 = 2114;
    double v27 = *(double *)&v12;
    _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing container identifier during container path look up, persona %{public}@", buf, 0x16u);
  }
  id v18 = 0;
LABEL_19:

  return v18;
}

- (id)_sandboxContainerURLForExtensionContext:(id)a3 containerOverrideIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = (char)[(RBContainerManager *)self _fetchCacheUIDChoice:v6];
  container_query_create();
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [v6 identity];
    id v9 = [v10 xpcServiceIdentifier];
  }
  id v11 = [v6 identity];
  id v12 = [v11 personaString];

  if (v12)
  {
    id v13 = [v6 identity];
    id v14 = [v13 personaString];
    [v14 UTF8String];
    container_query_set_persona_unique_string();
  }
  id v15 = v9;
  xpc_object_t v16 = xpc_string_create((const char *)[v15 UTF8String]);
  container_query_set_identifiers();

  container_query_set_class();
  container_query_set_include_other_owners();
  container_query_operation_set_flags();
  dyld_get_active_platform();
  container_query_operation_set_platform();
  if (v8) {
    container_query_set_uid();
  }
  if (container_query_get_single_result())
  {
    id v17 = (void *)[objc_alloc(NSURL) initFileURLWithFileSystemRepresentation:container_get_path() isDirectory:1 relativeToURL:0];
  }
  else
  {
    container_query_get_last_error();
    id v18 = (void *)container_error_copy_unlocalized_description();
    uint64_t v19 = rbs_job_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[RBContainerManager _sandboxContainerURLForExtensionContext:containerOverrideIdentifier:]((uint64_t)v18, v19);
    }

    free(v18);
    id v17 = 0;
  }
  container_query_free();

  return v17;
}

- (id)_allowedContainerOverrideIdentifiers
{
  if (_allowedContainerOverrideIdentifiers_onceToken != -1) {
    dispatch_once(&_allowedContainerOverrideIdentifiers_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)_allowedContainerOverrideIdentifiers_allowed;
  return v2;
}

uint64_t __58__RBContainerManager__allowedContainerOverrideIdentifiers__block_invoke()
{
  _allowedContainerOverrideIdentifiers_allowed = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26DAB16B0];
  return MEMORY[0x270F9A758]();
}

- (id)sandboxContainerURLForExtensionContext:(id)a3 containerOverrideIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ([(RBContainerManager *)self _allowedContainerOverrideIdentifiers],
        char v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 containsObject:v7],
        v8,
        (v9 & 1) == 0))
  {
    id v11 = rbs_job_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[RBContainerManager sandboxContainerURLForExtensionContext:containerOverrideIdentifier:]((uint64_t)v7, v11);
    }

    uint64_t v10 = 0;
  }
  else
  {
    voucher_adopt();
    uint64_t v10 = [(RBContainerManager *)self _sandboxContainerURLForExtensionContext:v6 containerOverrideIdentifier:v7];
  }
  return v10;
}

- (void)dealloc
{
  container_query_free();
  container_query_free();
  v3.receiver = self;
  v3.super_class = (Class)RBContainerManager;
  [(RBContainerManager *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

- (void)_fetchCacheUIDChoice:.cold.1()
{
  xpc_strerror();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_7_0(&dword_226AB3000, v0, v1, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", v2, v3, v4, v5, v6);
}

- (void)_lookupContainerPathForIdentity:(os_log_t)log context:persona:containerIdentifier:retry:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "%{public}@ Error during container manager lookup: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_sandboxContainerURLForExtensionContext:(uint64_t)a1 containerOverrideIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Failed to get container path; error = %s",
    (uint8_t *)&v2,
    0xCu);
}

- (void)sandboxContainerURLForExtensionContext:(uint64_t)a1 containerOverrideIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "container-required entitlement value not allowed (%@) please use a group container instead", (uint8_t *)&v2, 0xCu);
}

@end