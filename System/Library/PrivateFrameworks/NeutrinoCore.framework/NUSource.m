@interface NUSource
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSource:(id)a3;
- (BOOL)isResolved;
- (BOOL)resolve:(id)a3 error:(id *)a4;
- (NSDictionary)settings;
- (NSString)assetIdentifier;
- (NSString)description;
- (NUIdentifier)identifier;
- (NUSource)init;
- (NUSource)initWithIdentifier:(id)a3;
- (NUSource)initWithSourceSchema:(id)a3;
- (NUSourceDefinition)definition;
- (NUSourceSchema)schema;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForKey:(id)a3;
- (unint64_t)hash;
- (void)setAssetIdentifier:(id)a3;
- (void)setDefinition:(id)a3;
- (void)setSettings:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation NUSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_schema, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)setDefinition:(id)a3
{
}

- (NUSourceDefinition)definition
{
  return (NUSourceDefinition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSettings:(id)a3
{
}

- (NSDictionary)settings
{
  return &self->_settings->super;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NUSourceSchema)schema
{
  return self->_schema;
}

- (BOOL)resolve:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v11 = NUAssertLogger_7993();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "resolver != nil");
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_7993();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        __int16 v29 = 2114;
        v30 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSource resolve:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 496, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"resolver != nil");
  }
  v7 = v6;
  if (![(NUSource *)self isResolved])
  {
    v8 = [v7 resolveSource:self error:a4];
    [(NUSource *)self setDefinition:v8];
  }
  BOOL v9 = [(NUSource *)self isResolved];

  return v9;
}

- (BOOL)isResolved
{
  v2 = [(NUSource *)self definition];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isEqualToSource:(id)a3
{
  id v4 = a3;
  v5 = [(NUSource *)self identifier];
  id v6 = [v4 identifier];
  int v7 = [v5 isEqualToIdentifier:v6];

  if (v7
    && ([(NUSource *)self assetIdentifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 assetIdentifier],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqual:v9],
        v9,
        v8,
        v10))
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 1;
    v11 = [(NUSource *)self schema];
    v12 = [v11 settings];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __28__NUSource_isEqualToSource___block_invoke;
    v15[3] = &unk_1E5D94DD8;
    v15[4] = self;
    id v16 = v4;
    v17 = &v18;
    [v12 enumerateKeysAndObjectsUsingBlock:v15];

    BOOL v13 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __28__NUSource_isEqualToSource___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v15 = a3;
  int v7 = *(void **)(a1 + 32);
  id v8 = a2;
  BOOL v9 = [v7 valueForKey:v8];
  int v10 = [*(id *)(a1 + 40) valueForKey:v8];

  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10 == 0;
  }
  if (!v11)
  {
    v12 = [v15 defaultValue];
    BOOL v13 = v10;
    goto LABEL_9;
  }
  if (v9 && !v10)
  {
    v12 = [v15 defaultValue];
    BOOL v13 = v9;
LABEL_9:
    char v14 = [v13 isEqual:v12];

    if (v14) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v9 && v10 && ([v9 isEqual:v10] & 1) == 0)
  {
LABEL_10:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_11:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUSource *)self isEqualToSource:v4];

  return v5;
}

- (unint64_t)hash
{
  BOOL v3 = [(NUSource *)self identifier];
  uint64_t v4 = 0x192B6B3B458B45 * [v3 hash];

  BOOL v5 = [(NUSource *)self assetIdentifier];
  uint64_t v6 = 0xA084B4AF59895 * [v5 hash];

  return v6 ^ v4;
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(NUSource *)self identifier];
  uint64_t v6 = [(NUSource *)self assetIdentifier];
  int v7 = [(NUSource *)self settings];
  id v8 = [(NUSource *)self definition];
  BOOL v9 = [v3 stringWithFormat:@"<%@:%p id=%@ assetIdentifier=%@ settings=%@ definition=%@>", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  objc_storeStrong((id *)(v4 + 16), self->_schema);
  uint64_t v5 = [(NSString *)self->_assetIdentifier copy];
  uint64_t v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  uint64_t v7 = [(NSMutableDictionary *)self->_settings mutableCopy];
  id v8 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v7;

  objc_storeStrong((id *)(v4 + 32), self->_definition);
  return (id)v4;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  settings = self->_settings;
  if (a3) {
    [(NSMutableDictionary *)settings setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)settings removeObjectForKey:a4];
  }
}

- (id)valueForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_settings objectForKey:a3];
}

- (NUIdentifier)identifier
{
  return [(NUSchema *)self->_schema identifier];
}

- (NUSource)initWithIdentifier:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    int v10 = NUAssertLogger_7993();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v59 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v13 = NUAssertLogger_7993();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v59 = v31;
        __int16 v60 = 2114;
        v61 = v35;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      id v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v59 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSource initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 401, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"identifier != nil");
  }
  uint64_t v5 = v4;
  uint64_t v6 = +[NUSchemaRegistry sharedRegistry];
  uint64_t v7 = [v6 schemaWithIdentifier:v5];

  if (!v7)
  {
    v17 = NUAssertLogger_7993();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [NSString stringWithFormat:@"Unable to instantiate source with unregistered identifier %@", v5];
      *(_DWORD *)buf = 138543362;
      v59 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_7993();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v59 = v40;
        __int16 v60 = 2114;
        v61 = v44;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v59 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSource initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 404, @"Unable to instantiate source with unregistered identifier %@", v45, v46, v47, v48, (uint64_t)v5);
  }
  if ([v7 type] != 3)
  {
    uint64_t v24 = NUAssertLogger_7993();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [NSString stringWithFormat:@"Attempted to instantiate source with invalid schema type %@", v7];
      *(_DWORD *)buf = 138543362;
      v59 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_7993();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v59 = v49;
        __int16 v60 = 2114;
        v61 = v53;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      __int16 v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v59 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSource initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 405, @"Attempted to instantiate source with invalid schema type %@", v54, v55, v56, v57, (uint64_t)v7);
  }
  id v8 = [(NUSource *)self initWithSourceSchema:v7];

  return v8;
}

- (NUSource)initWithSourceSchema:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (NUSourceSchema *)a3;
  if (!v4)
  {
    BOOL v14 = NUAssertLogger_7993();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sourceSchema != nil");
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_7993();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        BOOL v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        __int16 v33 = 2114;
        v34 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSource initWithSourceSchema:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 393, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"sourceSchema != nil");
  }
  uint64_t v5 = v4;
  v30.receiver = self;
  v30.super_class = (Class)NUSource;
  uint64_t v6 = [(NUSource *)&v30 init];
  schema = v6->_schema;
  v6->_schema = v5;
  id v8 = v5;

  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  int v10 = [(NUSourceSchema *)v8 settings];
  uint64_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));
  settings = v6->_settings;
  v6->_settings = (NSMutableDictionary *)v11;

  return v6;
}

- (NUSource)init
{
  BOOL v3 = +[NUSourceSchema sharedSourceSchema];
  id v4 = [(NUSource *)self initWithSourceSchema:v3];

  return v4;
}

@end