@interface NUSourceSchema
+ (NUIdentifier)identifier;
+ (NUSourceSchema)sharedSourceSchema;
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
+ (id)requiredAttributes;
+ (id)supportedAttributes;
- (BOOL)deserializeSettings:(id)a3 fromDictionary:(id)a4 error:(id *)a5;
- (BOOL)itemIsResolved:(id)a3;
- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5;
- (BOOL)serializeAssetIdentifier:(id)a3 intoDictionary:(id)a4 error:(id *)a5;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)serializeSettings:(id)a3 intoDictionary:(id)a4 error:(id *)a5;
- (BOOL)validate:(id)a3 error:(id *)a4;
- (BOOL)validateAssetIdentifier:(id)a3 error:(id *)a4;
- (BOOL)validateSettings:(id)a3 error:(id *)a4;
- (BOOL)validateSource:(id)a3 error:(id *)a4;
- (NSDictionary)settings;
- (NUSourceSchema)initWithIdentifier:(id)a3 attributes:(id)a4;
- (NUSourceSchema)initWithIdentifier:(id)a3 settings:(id)a4;
- (id)copy:(id)a3;
- (id)deserialize:(id)a3 error:(id *)a4;
- (id)deserializeAssetIdentifierFromDictionary:(id)a3 error:(id *)a4;
- (id)deserializeSource:(id)a3 error:(id *)a4;
- (id)schemaDependencies;
- (id)serialize:(id)a3 error:(id *)a4;
- (id)serializeSource:(id)a3 error:(id *)a4;
- (int64_t)type;
@end

@implementation NUSourceSchema

- (void).cxx_destruct
{
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v16 = NUAssertLogger_16790();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "resolver != nil");
      *(_DWORD *)buf = 138543362;
      v50 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_16790();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v30;
        __int16 v51 = 2114;
        v52 = v34;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema resolveItem:resolver:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1870, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"resolver != nil");
  }
  v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = NUAssertLogger_16790();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[object isKindOfClass:NUSource.class]");
      *(_DWORD *)buf = 138543362;
      v50 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v26 = NUAssertLogger_16790();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v39;
        __int16 v51 = 2114;
        v52 = v43;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema resolveItem:resolver:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1871, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"[object isKindOfClass:NUSource.class]");
  }
  id v10 = v7;
  v11 = [v10 definition];

  if (v11)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    id v48 = 0;
    v13 = [v9 resolveSource:v10 error:&v48];
    id v14 = v48;
    BOOL v12 = v13 != 0;
    if (v13)
    {
      [v10 setDefinition:v13];
    }
    else
    {
      *a5 = +[NUError errorWithCode:1 reason:@"Failed to resolve source" object:v10 underlyingError:v14];
    }
  }
  return v12;
}

- (BOOL)itemIsResolved:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = NUAssertLogger_16790();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[object isKindOfClass:NUSource.class]");
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v10 = NUAssertLogger_16790();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        id v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        __int16 v25 = 2114;
        v26 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      BOOL v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema itemIsResolved:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1863, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"[object isKindOfClass:NUSource.class]");
  }
  v4 = [v3 definition];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)schemaDependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v15 = NUAssertLogger_16790();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      v50 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_16790();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        id v32 = [v30 callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v29;
        __int16 v51 = 2114;
        v52 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serializeIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1816, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    uint64_t v22 = NUAssertLogger_16790();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v25 = NUAssertLogger_16790();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        id v41 = [v39 callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v38;
        __int16 v51 = 2114;
        v52 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serializeIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1817, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  [v6 setObject:@"Source" forKeyedSubscript:@"isa"];
  settings = self->_settings;
  id v48 = 0;
  if (+[NUSetting serializeSettings:settings intoDictionary:v7 key:@"settings" error:&v48])
  {
    v47.receiver = self;
    v47.super_class = (Class)NUSourceSchema;
    id v9 = v48;
    BOOL v10 = [(NUSchema *)&v47 serializeIntoDictionary:v7 error:a4];
  }
  else
  {
    BOOL v11 = self->_settings;
    id v12 = v48;
    id v13 = +[NUError errorWithCode:1 reason:@"Failed to serialize settings" object:v11 underlyingError:v12];

    BOOL v10 = 0;
    *a4 = v13;
  }

  return v10;
}

- (BOOL)deserializeSettings:(id)a3 fromDictionary:(id)a4 error:(id *)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v20 = NUAssertLogger_16790();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "source != nil");
      *(_DWORD *)buf = 138543362;
      v78 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v23 = NUAssertLogger_16790();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        id v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        uint64_t v44 = [v42 callStackSymbols];
        uint64_t v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v41;
        __int16 v79 = 2114;
        v80 = v45;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      __int16 v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema deserializeSettings:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1792, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"source != nil");
  }
  id v9 = v8;
  if (!v8)
  {
    uint64_t v27 = NUAssertLogger_16790();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      v78 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v30 = NUAssertLogger_16790();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        uint64_t v53 = [v51 callStackSymbols];
        v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v50;
        __int16 v79 = 2114;
        v80 = v54;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      id v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema deserializeSettings:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1793, @"Invalid parameter not satisfying: %s", v55, v56, v57, v58, (uint64_t)"dictionary != nil");
  }
  if (!a5)
  {
    uint64_t v34 = NUAssertLogger_16790();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v78 = v35;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v37 = NUAssertLogger_16790();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        v62 = [v60 callStackSymbols];
        v63 = [v62 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v59;
        __int16 v79 = 2114;
        v80 = v63;
        _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v38)
    {
      v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v40 = [v39 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v40;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema deserializeSettings:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1794, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"error != NULL");
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obj = self->_settings;
  uint64_t v10 = [(NSDictionary *)obj countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v68 = a5;
    uint64_t v12 = *(void *)v73;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v73 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        v15 = [(NSDictionary *)self->_settings objectForKeyedSubscript:v14];
        id v16 = [v9 objectForKeyedSubscript:v14];
        if (v16)
        {
          id v71 = 0;
          v17 = [v15 deserialize:v16 error:&v71];
          id v18 = v71;
          if (!v17)
          {
            id *v68 = +[NUError errorWithCode:1 reason:@"Failed to deserialize setting" object:v14 underlyingError:v18];

            goto LABEL_16;
          }
          [v7 setObject:v17 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [(NSDictionary *)obj countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v17) = 1;
LABEL_16:

  return (char)v17;
}

- (BOOL)serializeSettings:(id)a3 intoDictionary:(id)a4 error:(id *)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v73 = v8;
  if (!v8)
  {
    uint64_t v22 = NUAssertLogger_16790();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "source != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v25 = NUAssertLogger_16790();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        id v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        uint64_t v46 = [v44 callStackSymbols];
        uint64_t v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v81 = v43;
        __int16 v82 = 2114;
        v83 = v47;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serializeSettings:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1765, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"source != nil");
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    v29 = NUAssertLogger_16790();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v32 = NUAssertLogger_16790();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        id v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v53 = (void *)MEMORY[0x1E4F29060];
        id v54 = v52;
        uint64_t v55 = [v53 callStackSymbols];
        uint64_t v56 = [v55 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v81 = v52;
        __int16 v82 = 2114;
        v83 = v56;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      uint64_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serializeSettings:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1766, @"Invalid parameter not satisfying: %s", v57, v58, v59, v60, (uint64_t)"dictionary != nil");
  }
  if (!a5)
  {
    uint64_t v36 = NUAssertLogger_16790();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = v37;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v39 = NUAssertLogger_16790();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        id v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v62 = (void *)MEMORY[0x1E4F29060];
        id v63 = v61;
        uint64_t v64 = [v62 callStackSymbols];
        uint64_t v65 = [v64 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v81 = v61;
        __int16 v82 = 2114;
        v83 = v65;
        _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v40)
    {
      id v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = v42;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serializeSettings:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1767, @"Invalid parameter not satisfying: %s", v66, v67, v68, v69, (uint64_t)"error != NULL");
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obj = self->_settings;
  uint64_t v11 = [(NSDictionary *)obj countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (!v11)
  {
    BOOL v20 = 1;
    goto LABEL_21;
  }
  uint64_t v12 = v11;
  v70 = a5;
  long long v72 = v10;
  uint64_t v13 = *(void *)v76;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v76 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(*((void *)&v75 + 1) + 8 * i);
      id v16 = [(NSDictionary *)self->_settings objectForKeyedSubscript:v15];
      v17 = [v73 objectForKeyedSubscript:v15];
      if (v17)
      {
        id v74 = 0;
        id v18 = [v16 serialize:v17 error:&v74];
        id v19 = v74;
        if (v18)
        {
          [v72 setObject:v18 forKeyedSubscript:v15];

          goto LABEL_13;
        }
        id *v70 = +[NUError errorWithCode:1 reason:@"Failed to serialize setting" object:v15 underlyingError:v19];

LABEL_19:
        BOOL v20 = 0;
        goto LABEL_20;
      }
      if ([v16 isRequired])
      {
        +[NUError missingError:@"Missing required setting" object:v15];
        v17 = 0;
        id *v70 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
LABEL_13:
    }
    uint64_t v12 = [(NSDictionary *)obj countByEnumeratingWithState:&v75 objects:v79 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  BOOL v20 = 1;
LABEL_20:
  uint64_t v10 = v72;
LABEL_21:

  return v20;
}

- (id)deserializeAssetIdentifierFromDictionary:(id)a3 error:(id *)a4
{
  v4 = +[NUModel deserializeStringFromDictionary:a3 key:@"input" error:a4];
  BOOL v5 = v4;
  if (v4) {
    id v6 = v4;
  }

  return v5;
}

- (BOOL)serializeAssetIdentifier:(id)a3 intoDictionary:(id)a4 error:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v11 = NUAssertLogger_16790();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "assetIdentifier != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_16790();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        id v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        uint64_t v35 = [v33 callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v60 = v32;
        __int16 v61 = 2114;
        v62 = v36;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serializeAssetIdentifier:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1745, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"assetIdentifier != nil");
  }
  id v9 = v8;
  if (!v8)
  {
    id v18 = NUAssertLogger_16790();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_16790();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        id v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        uint64_t v44 = [v42 callStackSymbols];
        id v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v60 = v41;
        __int16 v61 = 2114;
        v62 = v45;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serializeAssetIdentifier:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1746, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"dictionary != nil");
  }
  if (!a5)
  {
    __int16 v25 = NUAssertLogger_16790();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      BOOL v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_16790();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        uint64_t v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        uint64_t v53 = [v51 callStackSymbols];
        id v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v60 = v50;
        __int16 v61 = 2114;
        v62 = v54;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serializeAssetIdentifier:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1747, @"Invalid parameter not satisfying: %s", v55, v56, v57, v58, (uint64_t)"error != NULL");
  }
  [v8 setObject:v7 forKeyedSubscript:@"input"];

  return 1;
}

- (id)deserializeSource:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v16 = NUAssertLogger_16790();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      id v52 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v19 = NUAssertLogger_16790();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        BOOL v33 = [v31 callStackSymbols];
        id v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v52 = v30;
        __int16 v53 = 2114;
        id v54 = v34;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v52 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema deserializeSource:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1710, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    v23 = NUAssertLogger_16790();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      BOOL v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v52 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v26 = NUAssertLogger_16790();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        uint64_t v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        id v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v52 = v39;
        __int16 v53 = 2114;
        id v54 = v43;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v52 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema deserializeSource:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1711, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v50 = 0;
  BOOL v8 = [(NUSchema *)self deserializeIdentifierFromDictionary:v6 error:&v50];
  id v9 = v50;
  if (v8)
  {
    id v49 = 0;
    uint64_t v10 = [(NUSourceSchema *)self deserializeAssetIdentifierFromDictionary:v7 error:&v49];
    id v11 = v49;

    if (v10)
    {
      uint64_t v12 = [[NUSource alloc] initWithSourceSchema:self];
      [(NUSource *)v12 setAssetIdentifier:v10];
      id v48 = 0;
      BOOL v13 = [(NUSourceSchema *)self deserializeSettings:v12 fromDictionary:v7 error:&v48];
      id v9 = v48;

      if (v13)
      {
        uint64_t v14 = v12;
      }
      else
      {
        +[NUError errorWithCode:1 reason:@"Failed to deserialize settings" object:v7 underlyingError:v9];
        uint64_t v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to deserialize assetIdentifier" object:v7 underlyingError:v11];
      uint64_t v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = v11;
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to deserialize identifier" object:v7 underlyingError:v9];
    uint64_t v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)serializeSource:(id)a3 error:(id *)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v21 = NUAssertLogger_16790();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "source != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v57 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v24 = NUAssertLogger_16790();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        uint64_t v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v57 = v35;
        __int16 v58 = 2114;
        uint64_t v59 = v39;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      BOOL v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v57 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serializeSource:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1673, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"source != nil");
  }
  if (!a4)
  {
    v28 = NUAssertLogger_16790();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      BOOL v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v57 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v31 = NUAssertLogger_16790();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        uint64_t v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        uint64_t v47 = [v45 callStackSymbols];
        id v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v57 = v44;
        __int16 v58 = 2114;
        uint64_t v59 = v48;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      BOOL v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v57 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serializeSource:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1674, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  id v9 = [v7 identifier];
  id v55 = 0;
  BOOL v10 = [(NUSchema *)self serializeIdentifier:v9 intoDictionary:v8 error:&v55];
  id v11 = v55;

  if (!v10)
  {
    uint64_t v12 = [v7 identifier];
    v17 = @"Failed to serialize identifier";
    id v18 = v12;
LABEL_9:
    id v19 = +[NUError errorWithCode:1 reason:v17 object:v18 underlyingError:v11];
LABEL_11:
    id v16 = 0;
    *a4 = v19;
    goto LABEL_12;
  }
  uint64_t v12 = [v7 assetIdentifier];
  if (!v12)
  {
    id v19 = +[NUError missingError:@"Missing assetIdentifier" object:v7];
    goto LABEL_11;
  }
  id v54 = 0;
  BOOL v13 = [(NUSourceSchema *)self serializeAssetIdentifier:v12 intoDictionary:v8 error:&v54];
  id v14 = v54;

  if (v13)
  {
    id v53 = 0;
    BOOL v15 = [(NUSourceSchema *)self serializeSettings:v7 intoDictionary:v8 error:&v53];
    id v11 = v53;

    if (v15)
    {
      id v16 = v8;
      goto LABEL_12;
    }
    v17 = @"Failed to serialize settings";
    id v18 = v7;
    goto LABEL_9;
  }
  +[NUError errorWithCode:1 reason:@"Failed to serialize assetIdentifier" object:v12 underlyingError:v14];
  id v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v14;
LABEL_12:

  return v16;
}

- (id)deserialize:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v10 = NUAssertLogger_16790();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        BOOL v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        BOOL v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v24;
        __int16 v44 = 2114;
        uint64_t v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1659, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v20 = NUAssertLogger_16790();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        BOOL v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        id v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v33;
        __int16 v44 = 2114;
        uint64_t v45 = v37;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1660, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUSourceSchema *)self deserializeSource:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not a dictionary" object:v7];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)serialize:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v10 = NUAssertLogger_16790();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        BOOL v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        BOOL v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v24;
        __int16 v44 = 2114;
        uint64_t v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1645, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v20 = NUAssertLogger_16790();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        BOOL v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        id v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v33;
        __int16 v44 = 2114;
        uint64_t v45 = v37;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1646, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUSourceSchema *)self serializeSource:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not a source" object:v7];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)copy:(id)a3
{
  return (id)[a3 copy];
}

- (BOOL)validateSettings:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  if (!v52)
  {
    id v18 = NUAssertLogger_16790();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "source != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v21 = NUAssertLogger_16790();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        id v35 = [v33 callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v60 = v32;
        __int16 v61 = 2114;
        v62 = v36;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema validateSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1615, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"source != nil");
  }
  if (!a4)
  {
    BOOL v25 = NUAssertLogger_16790();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_16790();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        uint64_t v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        __int16 v44 = [v42 callStackSymbols];
        uint64_t v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v60 = v41;
        __int16 v61 = 2114;
        v62 = v45;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema validateSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1616, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"error != NULL");
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obj = self->_settings;
  uint64_t v6 = [(NSDictionary *)obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v50 = a4;
    uint64_t v8 = *(void *)v55;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v55 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v54 + 1) + 8 * v9);
      id v11 = [(NSDictionary *)self->_settings objectForKeyedSubscript:v10];
      uint64_t v12 = [v52 objectForKeyedSubscript:v10];
      if (v12)
      {
        id v53 = 0;
        char v13 = [v11 validate:v12 error:&v53];
        id v14 = v53;
        BOOL v15 = v14;
        if ((v13 & 1) == 0)
        {
          id *v50 = +[NUError errorWithCode:2 reason:@"Invalid setting" object:v10 underlyingError:v14];

LABEL_17:
          BOOL v16 = 0;
          goto LABEL_18;
        }
      }
      else if ([v11 isRequired])
      {
        +[NUError missingError:@"Missing required setting" object:v10];
        uint64_t v12 = 0;
        id *v50 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSDictionary *)obj countByEnumeratingWithState:&v54 objects:v58 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)validateAssetIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    BOOL v15 = NUAssertLogger_16790();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "source != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v18 = NUAssertLogger_16790();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        BOOL v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        uint64_t v32 = [v30 callStackSymbols];
        BOOL v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v29;
        __int16 v49 = 2114;
        uint64_t v50 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      BOOL v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema validateAssetIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1593, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"source != nil");
  }
  if (!a4)
  {
    BOOL v22 = NUAssertLogger_16790();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v25 = NUAssertLogger_16790();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        uint64_t v41 = [v39 callStackSymbols];
        uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v38;
        __int16 v49 = 2114;
        uint64_t v50 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      BOOL v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema validateAssetIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1594, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v5 assetIdentifier];

  if (v7)
  {
    uint64_t v8 = [v6 assetIdentifier];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [v6 assetIdentifier];
      int v11 = [v10 isEqualToString:&stru_1F0017700];

      if (!v11)
      {
        BOOL v13 = 1;
        goto LABEL_9;
      }
    }
    uint64_t v12 = +[NUError invalidError:@"Invalid asset identifier" object:v6];
  }
  else
  {
    uint64_t v12 = +[NUError missingError:@"Missing asset identifier" object:v6];
  }
  BOOL v13 = 0;
  *a4 = v12;
LABEL_9:

  return v13;
}

- (BOOL)validateSource:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = NUAssertLogger_16790();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "source != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v15 = NUAssertLogger_16790();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        BOOL v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        BOOL v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v26;
        __int16 v46 = 2114;
        uint64_t v47 = v30;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema validateSource:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1574, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"source != nil");
  }
  if (!a4)
  {
    BOOL v19 = NUAssertLogger_16790();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_16790();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        uint64_t v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v35;
        __int16 v46 = 2114;
        uint64_t v47 = v39;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      BOOL v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema validateSource:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1575, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 identifier];
  BOOL v9 = [(NUSchema *)self validateIdentifier:v8 error:a4];

  BOOL v10 = v9
     && [(NUSourceSchema *)self validateAssetIdentifier:v7 error:a4]
     && [(NUSourceSchema *)self validateSettings:v7 error:a4];

  return v10;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v10 = NUAssertLogger_16790();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        BOOL v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        BOOL v27 = [v25 callStackSymbols];
        id v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v24;
        __int16 v44 = 2114;
        uint64_t v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1560, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v20 = NUAssertLogger_16790();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        id v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v33;
        __int16 v44 = 2114;
        uint64_t v45 = v37;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1561, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUSourceSchema *)self validateSource:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not an adjustment source" object:v7];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NUSourceSchema)initWithIdentifier:(id)a3 settings:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    BOOL v13 = NUAssertLogger_16790();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      BOOL v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settings != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v16 = NUAssertLogger_16790();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        BOOL v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        BOOL v23 = [v21 callStackSymbols];
        BOOL v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v20;
        __int16 v32 = 2114;
        uint64_t v33 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceSchema initWithIdentifier:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1549, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"settings != nil");
  }
  BOOL v8 = v7;
  v29.receiver = self;
  v29.super_class = (Class)NUSourceSchema;
  BOOL v9 = [(NUSchema *)&v29 initWithIdentifier:v6 attributes:MEMORY[0x1E4F1CC08]];
  uint64_t v10 = [v8 copy];
  settings = v9->_settings;
  v9->_settings = (NSDictionary *)v10;

  return v9;
}

- (NUSourceSchema)initWithIdentifier:(id)a3 attributes:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
  }
  BOOL v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    BOOL v9 = NSString;
    uint64_t v10 = v8;
    int v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    BOOL v13 = NSStringFromSelector(a2);
    BOOL v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    BOOL v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    BOOL v17 = (void *)MEMORY[0x1E4F29060];
    id v18 = v16;
    BOOL v19 = [v17 callStackSymbols];
    BOOL v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  id v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v34 = specific;
  __int16 v35 = 2114;
  uint64_t v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUSourceSchema initWithIdentifier:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1544, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- (int64_t)type
{
  return 3;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v14 = NUAssertLogger_16790();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v49 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v17 = NUAssertLogger_16790();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        uint64_t v31 = [v29 callStackSymbols];
        uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v49 = v28;
        __int16 v50 = 2114;
        uint64_t v51 = v32;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      BOOL v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v49 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSourceSchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1833, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    BOOL v21 = NUAssertLogger_16790();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      __int16 v49 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v24 = NUAssertLogger_16790();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        uint64_t v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        uint64_t v40 = [v38 callStackSymbols];
        uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v49 = v37;
        __int16 v50 = 2114;
        uint64_t v51 = v41;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v49 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSourceSchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1834, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v47 = 0;
  BOOL v8 = [a1 deserializeIdentifierFromDictionary:v6 error:&v47];
  id v9 = v47;
  if (v8)
  {
    id v46 = 0;
    uint64_t v10 = +[NUSetting deserializeSettingsFromDictionary:v7 key:@"settings" error:&v46];
    id v11 = v46;

    if (v10)
    {
      uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v8 settings:v10];
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to deserialize source settings" object:v7 underlyingError:v11];
      uint64_t v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to deserialize source identifier" object:v7 underlyingError:v9];
    uint64_t v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v9;
  }

  return v12;
}

+ (id)requiredAttributes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)supportedAttributes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (NUSourceSchema)sharedSourceSchema
{
  v2 = [NUSourceSchema alloc];
  id v3 = +[NUSourceSchema identifier];
  v4 = [(NUSourceSchema *)v2 initWithIdentifier:v3 settings:MEMORY[0x1E4F1CC08]];

  return v4;
}

+ (NUIdentifier)identifier
{
  v2 = [NUIdentifier alloc];
  id v3 = +[NUVersion versionOne];
  v4 = [(NUIdentifier *)v2 initWithNamespace:@"com.apple.photo" name:@"Source" version:v3];

  return v4;
}

@end