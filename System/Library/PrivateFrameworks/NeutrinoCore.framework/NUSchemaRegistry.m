@interface NUSchemaRegistry
+ (id)sharedRegistry;
- (BOOL)_registerSchema:(id)a3 error:(id *)a4;
- (BOOL)_registerVersion:(id)a3 withOriginalIdentifier:(id)a4 error:(id *)a5;
- (BOOL)registerSchema:(id)a3 error:(id *)a4;
- (BOOL)registerSchemas:(id)a3 error:(id *)a4;
- (NUSchemaRegistry)init;
- (id)_allVersionsWithOriginalIdentifier:(id)a3 upToVersion:(id)a4;
- (id)_latestVersionWithOriginalIdentifier:(id)a3;
- (id)_schemaWithIdentifier:(id)a3;
- (id)latestVersionWithNamespace:(id)a3 name:(id)a4;
- (id)schemaWithIdentifier:(id)a3;
- (id)versionsCompatibleWithIdentifier:(id)a3;
- (void)_registerBuiltInSchemas;
@end

@implementation NUSchemaRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_schemas, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_allVersionsWithOriginalIdentifier:(id)a3 upToVersion:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v12 = NUAssertLogger_17959();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v45 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_17959();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v26;
        __int16 v46 = 2114;
        v47 = v30;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _allVersionsWithOriginalIdentifier:upToVersion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 291, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"identifier != nil");
  }
  v8 = v7;
  if (!v7)
  {
    v19 = NUAssertLogger_17959();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "version != nil");
      *(_DWORD *)buf = 138543362;
      v45 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_17959();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v35;
        __int16 v46 = 2114;
        v47 = v39;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _allVersionsWithOriginalIdentifier:upToVersion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 292, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"version != nil");
  }
  v9 = [(NSMutableDictionary *)self->_versions objectForKeyedSubscript:v6];
  v10 = objc_msgSend(v9, "subarrayWithRange:", 0, objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(v9, "count"), 1024, &__block_literal_global_48_17973));

  return v10;
}

uint64_t __67__NUSchemaRegistry__allVersionsWithOriginalIdentifier_upToVersion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)versionsCompatibleWithIdentifier:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v13 = NUAssertLogger_17959();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v16 = NUAssertLogger_17959();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        BOOL v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry versionsCompatibleWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 274, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"identifier");
  }
  v5 = v4;
  id v6 = +[NUVersion versionZero];
  id v7 = [v5 identifierWithVersion:v6];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__17988;
  v35 = __Block_byref_object_dispose__17989;
  id v36 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NUSchemaRegistry_versionsCompatibleWithIdentifier___block_invoke;
  block[3] = &unk_1E5D95EE0;
  block[4] = self;
  id v30 = v7;
  id v31 = v5;
  uint64_t v32 = buf;
  id v9 = v5;
  id v10 = v7;
  dispatch_sync(queue, block);
  id v11 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v11;
}

void __53__NUSchemaRegistry_versionsCompatibleWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) version];
  uint64_t v4 = [v2 _allVersionsWithOriginalIdentifier:v3 upToVersion:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_latestVersionWithOriginalIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v9 = NUAssertLogger_17959();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_17959();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        uint64_t v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _latestVersionWithOriginalIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 263, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"identifier != nil");
  }
  uint64_t v5 = v4;
  id v6 = [(NSMutableDictionary *)self->_versions objectForKeyedSubscript:v4];
  id v7 = [v6 lastObject];

  return v7;
}

- (id)latestVersionWithNamespace:(id)a3 name:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    BOOL v16 = NUAssertLogger_17959();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "namespace != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_17959();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        id v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        uint64_t v33 = [v31 callStackSymbols];
        uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v34;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry latestVersionWithNamespace:name:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 245, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"namespace != nil");
  }
  v8 = v7;
  if (!v7)
  {
    uint64_t v23 = NUAssertLogger_17959();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v26 = NUAssertLogger_17959();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        uint64_t v42 = [v40 callStackSymbols];
        uint64_t v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v39;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v43;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      uint64_t v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry latestVersionWithNamespace:name:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 246, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"name != nil");
  }
  id v9 = [NUIdentifier alloc];
  id v10 = +[NUVersion versionZero];
  id v11 = [(NUIdentifier *)v9 initWithNamespace:v6 name:v8 version:v10];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v52 = __Block_byref_object_copy__17988;
  v53 = __Block_byref_object_dispose__17989;
  id v54 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NUSchemaRegistry_latestVersionWithNamespace_name___block_invoke;
  block[3] = &unk_1E5D959D8;
  v49 = v11;
  v50 = buf;
  block[4] = self;
  BOOL v13 = v11;
  dispatch_sync(queue, block);
  id v14 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v14;
}

uint64_t __52__NUSchemaRegistry_latestVersionWithNamespace_name___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _latestVersionWithOriginalIdentifier:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

- (id)_schemaWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_schemas objectForKey:a3];
}

- (id)schemaWithIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v9 = NUAssertLogger_17959();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_17959();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        BOOL v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry schemaWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 226, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"identifier != NULL");
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__17988;
  id v30 = __Block_byref_object_dispose__17989;
  id v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__NUSchemaRegistry_schemaWithIdentifier___block_invoke;
  block[3] = &unk_1E5D959D8;
  id v26 = v4;
  BOOL v27 = buf;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v7;
}

uint64_t __41__NUSchemaRegistry_schemaWithIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _schemaWithIdentifier:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)registerSchemas:(id)a3 error:(id *)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v35 = NUAssertLogger_17959();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "schemas != nil");
      *(_DWORD *)buf = 138543362;
      v83 = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v38 = NUAssertLogger_17959();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v83 = v49;
        __int16 v84 = 2114;
        v85 = v53;
        _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      uint64_t v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v83 = v41;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry registerSchemas:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 153, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"schemas != nil");
  }
  if (!a4)
  {
    uint64_t v42 = NUAssertLogger_17959();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v83 = v43;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v45 = NUAssertLogger_17959();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      if (v46)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = (void *)MEMORY[0x1E4F29060];
        id v60 = v58;
        v61 = [v59 callStackSymbols];
        v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v83 = v58;
        __int16 v84 = 2114;
        v85 = v62;
        _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v46)
    {
      uint64_t v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v48 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v83 = v48;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry registerSchemas:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 154, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  v68 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v76 objects:v81 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v77 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        BOOL v16 = [v15 identifier];
        [v7 addObject:v16];

        BOOL v17 = [v15 identifier];
        [v8 setObject:v15 forKeyedSubscript:v17];

        id v18 = [v15 schemaDependencies];
        v19 = [v15 identifier];
        [v9 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v76 objects:v81 count:16];
    }
    while (v12);
  }

  v69 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  if ([v7 count])
  {
    unint64_t v20 = 0x1E4F1C000uLL;
    while (2)
    {
      uint64_t v21 = [v7 anyObject];
      uint64_t v22 = (void *)[objc_alloc(*(Class *)(v20 + 2672)) initWithObject:v21];
      do
      {
        uint64_t v23 = [v9 objectForKeyedSubscript:v21];
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __42__NUSchemaRegistry_registerSchemas_error___block_invoke;
        v74[3] = &unk_1E5D95138;
        id v24 = v7;
        id v75 = v24;
        uint64_t v25 = [v23 indexOfObjectPassingTest:v74];

        if (v25 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v69 addObject:v21];
          [v24 removeObject:v21];
          [v22 removeObject:v21];
          uint64_t v26 = [v22 lastObject];

          uint64_t v21 = (void *)v26;
        }
        else
        {
          BOOL v27 = [v9 objectForKeyedSubscript:v21];
          id v28 = [v27 objectAtIndexedSubscript:v25];

          if ([v22 containsObject:v28])
          {
            id *v68 = +[NUError failureError:@"Cyclic schema dependency detected" object:v28];

            LOBYTE(v22) = 0;
            goto LABEL_30;
          }
          [v22 addObject:v28];
          uint64_t v21 = v28;
        }
      }
      while ([v22 count]);

      unint64_t v20 = 0x1E4F1C000;
      if ([v24 count]) {
        continue;
      }
      break;
    }
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v28 = v69;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v71;
LABEL_21:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v71 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v70 + 1) + 8 * v32)];
      LODWORD(v22) = [(NUSchemaRegistry *)self registerSchema:v33 error:v68];

      if (!v22) {
        break;
      }
      if (v30 == ++v32)
      {
        uint64_t v30 = [v28 countByEnumeratingWithState:&v70 objects:v80 count:16];
        LOBYTE(v22) = 1;
        if (v30) {
          goto LABEL_21;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v22) = 1;
  }
LABEL_30:

  return (char)v22;
}

uint64_t __42__NUSchemaRegistry_registerSchemas_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (BOOL)_registerVersion:(id)a3 withOriginalIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    unint64_t v20 = NUAssertLogger_17959();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "version != nil");
      *(_DWORD *)buf = 138543362;
      v69 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v23 = NUAssertLogger_17959();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        id v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        uint64_t v44 = [v42 callStackSymbols];
        uint64_t v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v41;
        __int16 v70 = 2114;
        long long v71 = v45;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerVersion:withOriginalIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 112, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"version != nil");
  }
  id v10 = v9;
  if (!v9)
  {
    BOOL v27 = NUAssertLogger_17959();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v69 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v30 = NUAssertLogger_17959();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        v53 = [v51 callStackSymbols];
        uint64_t v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v50;
        __int16 v70 = 2114;
        long long v71 = v54;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerVersion:withOriginalIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 113, @"Invalid parameter not satisfying: %s", v55, v56, v57, v58, (uint64_t)"identifier != nil");
  }
  if (!a5)
  {
    uint64_t v34 = NUAssertLogger_17959();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v69 = v35;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v37 = NUAssertLogger_17959();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        v62 = [v60 callStackSymbols];
        uint64_t v63 = [v62 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v59;
        __int16 v70 = 2114;
        long long v71 = v63;
        _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v38)
    {
      BOOL v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v40 = [v39 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v40;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerVersion:withOriginalIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 114, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"error != nil");
  }
  uint64_t v11 = [(NSMutableDictionary *)self->_versions objectForKeyedSubscript:v9];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_18034);
    uint64_t v14 = v13;
    if (v13)
    {
      v15 = [v12 objectAtIndexedSubscript:v13 - 1];
    }
    else
    {
      v15 = 0;
    }
    [v12 insertObject:v8 atIndex:v14];
    if ([v8 minor] <= 0) {
      goto LABEL_14;
    }
    if (v15)
    {
      uint64_t v16 = [v15 major];
      if (v16 == [v8 major])
      {
        uint64_t v17 = [v15 minor];
        if (v17 == [v8 minor] - 1) {
          goto LABEL_14;
        }
      }
    }
LABEL_15:
    +[NUError missingError:@"Previous minor version is not registered" object:v8];
    BOOL v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v12 addObject:v8];
  [(NSMutableDictionary *)self->_versions setObject:v12 forKeyedSubscript:v10];
  v15 = 0;
  if ([v8 minor] > 0) {
    goto LABEL_15;
  }
LABEL_14:
  BOOL v18 = 1;
LABEL_16:

  return v18;
}

uint64_t __66__NUSchemaRegistry__registerVersion_withOriginalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)_registerSchema:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v16 = NUAssertLogger_17959();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "schema != nil");
      *(_DWORD *)buf = 138543362;
      v50 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_17959();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        uint64_t v33 = [v31 callStackSymbols];
        uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v30;
        __int16 v51 = 2114;
        id v52 = v34;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerSchema:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 84, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"schema != nil");
  }
  if (!a4)
  {
    uint64_t v23 = NUAssertLogger_17959();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      BOOL v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v50 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v26 = NUAssertLogger_17959();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        BOOL v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        uint64_t v42 = [v40 callStackSymbols];
        id v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v39;
        __int16 v51 = 2114;
        id v52 = v43;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      id v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerSchema:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 85, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v8 = [v6 identifier];
  id v9 = [(NSMutableDictionary *)self->_schemas objectForKey:v8];

  if (v9)
  {
    +[NUError duplicateError:@"Schema identifier already registered" object:v8];
    LOBYTE(v10) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = [v8 version];
    id v12 = +[NUVersion versionZero];
    uint64_t v13 = [v8 identifierWithVersion:v12];
    id v48 = 0;
    BOOL v10 = [(NUSchemaRegistry *)self _registerVersion:v11 withOriginalIdentifier:v13 error:&v48];
    id v14 = v48;

    if (v10)
    {
      [(NSMutableDictionary *)self->_schemas setObject:v7 forKey:v8];
    }
    else
    {
      *a4 = +[NUError errorWithCode:1 reason:@"Failed to register schema version" object:v7 underlyingError:v14];
    }
  }
  return v10;
}

- (BOOL)registerSchema:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v15 = NUAssertLogger_17959();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "schema != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v18 = NUAssertLogger_17959();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        id v32 = [v30 callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      BOOL v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry registerSchema:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 61, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"schema != nil");
  }
  if (!a4)
  {
    uint64_t v22 = NUAssertLogger_17959();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger_17959();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        id v41 = [v39 callStackSymbols];
        uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      BOOL v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry registerSchema:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 62, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v51 = 0;
  char v8 = [v6 isValid:&v51];
  id v9 = v51;
  if (v8)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v53 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__NUSchemaRegistry_registerSchema_error___block_invoke;
    block[3] = &unk_1E5D950F0;
    uint64_t v49 = buf;
    block[4] = self;
    id v48 = v7;
    v50 = a4;
    id v11 = v9;
    dispatch_sync(queue, block);
    BOOL v12 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v13 = v51;
    *a4 = +[NUError errorWithCode:2 reason:@"Schema is not valid" object:v7 underlyingError:v13];

    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __41__NUSchemaRegistry_registerSchema_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _registerSchema:*(void *)(a1 + 40) error:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_registerBuiltInSchemas
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[NUSourceSchema sharedSourceSchema];
  id v22 = 0;
  BOOL v4 = [(NUSchemaRegistry *)self _registerSchema:v3 error:&v22];
  id v5 = v22;

  if (!v4)
  {
    id v6 = NUAssertLogger_17959();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register builtin schema, error: %@", v5];
      *(_DWORD *)buf = 138543362;
      BOOL v24 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_17959();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        id v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v24 = v13;
        __int16 v25 = 2114;
        BOOL v26 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      id v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v24 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerBuiltInSchemas]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 56, @"Failed to register builtin schema, error: %@", v18, v19, v20, v21, (uint64_t)v5);
  }
}

- (NUSchemaRegistry)init
{
  v11.receiver = self;
  v11.super_class = (Class)NUSchemaRegistry;
  v2 = [(NUSchemaRegistry *)&v11 init];
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("NUSchemaRegistry", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  schemas = v2->_schemas;
  v2->_schemas = v6;

  char v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  versions = v2->_versions;
  v2->_versions = v8;

  [(NUSchemaRegistry *)v2 _registerBuiltInSchemas];
  return v2;
}

+ (id)sharedRegistry
{
  v2 = +[NUFactory sharedFactory];
  uint64_t v3 = [v2 schemaRegistry];

  return v3;
}

@end