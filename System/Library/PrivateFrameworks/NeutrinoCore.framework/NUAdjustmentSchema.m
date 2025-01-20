@interface NUAdjustmentSchema
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)deserializeSettings:(id)a3 fromDictionary:(id)a4 error:(id *)a5;
- (BOOL)isValid:(id *)a3;
- (BOOL)itemIsResolved:(id)a3;
- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)serializeSettings:(id)a3 intoDictionary:(id)a4 error:(id *)a5;
- (BOOL)validate:(id)a3 error:(id *)a4;
- (BOOL)validateAdjustment:(id)a3 error:(id *)a4;
- (BOOL)validateSettings:(id *)a3;
- (BOOL)validateSettings:(id)a3 error:(id *)a4;
- (NSDictionary)settings;
- (NUAdjustmentSchema)initWithIdentifier:(id)a3 attributes:(id)a4;
- (NUAdjustmentSchema)initWithIdentifier:(id)a3 settings:(id)a4;
- (id)copy:(id)a3;
- (id)copyAdjustment:(id)a3;
- (id)deserialize:(id)a3 error:(id *)a4;
- (id)deserializeAdjustment:(id)a3 error:(id *)a4;
- (id)modelForProperty:(id)a3;
- (id)schemaDependencies;
- (id)serialize:(id)a3 error:(id *)a4;
- (id)serializeAdjustment:(id)a3 error:(id *)a4;
- (int64_t)type;
- (void)enumerateProperties:(id)a3;
@end

@implementation NUAdjustmentSchema

- (void).cxx_destruct
{
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)itemIsResolved:(id)a3
{
  return 1;
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
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
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
        v32 = [v30 callStackSymbols];
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
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema serializeIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 857, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    v22 = NUAssertLogger_16790();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_16790();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        v41 = [v39 callStackSymbols];
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
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema serializeIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 858, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  v7 = v6;
  [v6 setObject:@"Adjustment" forKeyedSubscript:@"isa"];
  settings = self->_settings;
  id v48 = 0;
  if (+[NUSetting serializeSettings:settings intoDictionary:v7 key:@"settings" error:&v48])
  {
    v47.receiver = self;
    v47.super_class = (Class)NUAdjustmentSchema;
    id v9 = v48;
    BOOL v10 = [(NUSchema *)&v47 serializeIntoDictionary:v7 error:a4];
  }
  else
  {
    v11 = self->_settings;
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
    v20 = NUAssertLogger_16790();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "adjustment != nil");
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
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
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
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema deserializeSettings:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 830, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"adjustment != nil");
  }
  id v9 = v8;
  if (!v8)
  {
    v27 = NUAssertLogger_16790();
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
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema deserializeSettings:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 831, @"Invalid parameter not satisfying: %s", v55, v56, v57, v58, (uint64_t)"dictionary != nil");
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
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema deserializeSettings:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 832, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"error != NULL");
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
        v16 = [v9 objectForKeyedSubscript:v14];
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
    v22 = NUAssertLogger_16790();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "adjustment != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_16790();
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
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema serializeSettings:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 798, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"adjustment != nil");
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
    v32 = NUAssertLogger_16790();
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
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema serializeSettings:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 799, @"Invalid parameter not satisfying: %s", v57, v58, v59, v60, (uint64_t)"dictionary != nil");
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
      v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = v42;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema serializeSettings:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 800, @"Invalid parameter not satisfying: %s", v66, v67, v68, v69, (uint64_t)"error != NULL");
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
      v16 = [(NSDictionary *)self->_settings objectForKeyedSubscript:v15];
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

- (id)deserializeAdjustment:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v15 = NUAssertLogger_16790();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v18 = NUAssertLogger_16790();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        BOOL v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v29;
        __int16 v51 = 2114;
        id v52 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      BOOL v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema deserializeAdjustment:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 771, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    v22 = NUAssertLogger_16790();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_16790();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        BOOL v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        v41 = [v39 callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v38;
        __int16 v51 = 2114;
        id v52 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema deserializeAdjustment:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 772, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v48 = 0;
  BOOL v8 = [(NUSchema *)self deserializeIdentifierFromDictionary:v6 error:&v48];
  id v9 = v48;
  if (v8)
  {
    uint64_t v10 = [[NUGenericAdjustment alloc] initWithAdjustmentSchema:self];
    id v47 = 0;
    BOOL v11 = [(NUAdjustmentSchema *)self deserializeSettings:v10 fromDictionary:v7 error:&v47];
    id v12 = v47;

    if (v11)
    {
      uint64_t v13 = v10;
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to deserialize settings" object:v7 underlyingError:v12];
      uint64_t v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to deserialize identifier" object:v7 underlyingError:v9];
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v9;
  }

  return v13;
}

- (id)serializeAdjustment:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "adjustment != nil");
      *(_DWORD *)buf = 138543362;
      id v52 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v20 = NUAssertLogger_16790();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        id v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v52 = v31;
        __int16 v53 = 2114;
        id v54 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v52 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema serializeAdjustment:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 748, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"adjustment != nil");
  }
  if (!a4)
  {
    BOOL v24 = NUAssertLogger_16790();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v52 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_16790();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        id v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v52 = v40;
        __int16 v53 = 2114;
        id v54 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v52 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema serializeAdjustment:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 749, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  BOOL v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_settings, "count") + 1);
  id v9 = [v7 identifier];
  id v50 = 0;
  BOOL v10 = [(NUSchema *)self serializeIdentifier:v9 intoDictionary:v8 error:&v50];
  id v11 = v50;

  if (v10)
  {
    id v49 = 0;
    BOOL v12 = [(NUAdjustmentSchema *)self serializeSettings:v7 intoDictionary:v8 error:&v49];
    id v13 = v49;

    if (v12)
    {
      id v14 = v8;
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to serialize settings" object:v7 underlyingError:v13];
      id v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v11 = v13;
  }
  else
  {
    uint64_t v15 = [v7 identifier];
    *a4 = +[NUError errorWithCode:1 reason:@"Failed to serialize identifier" object:v15 underlyingError:v11];

    id v14 = 0;
  }

  return v14;
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
    id v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        BOOL v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        BOOL v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v24;
        __int16 v44 = 2114;
        uint64_t v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 734, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
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
        id v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v33;
        __int16 v44 = 2114;
        uint64_t v45 = v37;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 735, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUAdjustmentSchema *)self deserializeAdjustment:v7 error:a4];
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
    id v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        BOOL v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        BOOL v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v24;
        __int16 v44 = 2114;
        uint64_t v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 720, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
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
        id v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v33;
        __int16 v44 = 2114;
        uint64_t v45 = v37;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 721, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUAdjustmentSchema *)self serializeAdjustment:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not an adjustment" object:v7];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)modelForProperty:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    BOOL v8 = NUAssertLogger_16790();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v11 = NUAssertLogger_16790();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        uint64_t v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        id v18 = [v16 callStackSymbols];
        BOOL v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema modelForProperty:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 713, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"name != nil");
  }
  v5 = v4;
  id v6 = [(NSDictionary *)self->_settings objectForKeyedSubscript:v4];

  return v6;
}

- (void)enumerateProperties:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v7 = NUAssertLogger_16790();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v10 = NUAssertLogger_16790();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        id v17 = [v15 callStackSymbols];
        id v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v26 = v14;
        __int16 v27 = 2114;
        uint64_t v28 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      BOOL v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema enumerateProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 704, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"block != nil");
  }
  settings = self->_settings;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __42__NUAdjustmentSchema_enumerateProperties___block_invoke;
  v23[3] = &unk_1E5D956C8;
  id v24 = v4;
  id v6 = v4;
  [(NSDictionary *)settings enumerateKeysAndObjectsUsingBlock:v23];
}

uint64_t __42__NUAdjustmentSchema_enumerateProperties___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyAdjustment:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v28 = NUAssertLogger_16790();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "adjustment != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v51 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger_16790();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        id v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        uint64_t v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v51 = v35;
        __int16 v52 = 2114;
        __int16 v53 = v39;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      id v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v51 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema copyAdjustment:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 667, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"adjustment != nil");
  }
  v5 = v4;
  id v6 = [v4 identifier];
  id v7 = [(NUSchema *)self identifier];
  char v8 = [v6 isEqualToIdentifier:v7];

  if (v8)
  {
    id v9 = [[NUGenericAdjustment alloc] initWithAdjustmentSchema:self];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obj = self->_settings;
    uint64_t v10 = [(NSDictionary *)obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v15 = [v5 valueForKey:v14];
          if (v15)
          {
            id v16 = v5;
            id v17 = self;
            id v18 = [(NSDictionary *)self->_settings objectForKeyedSubscript:v14];
            uint64_t v19 = [v18 copy:v15];
            if (!v19)
            {
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_557);
              }
              v5 = v16;
              uint64_t v23 = _NULogger;
              if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                __int16 v51 = v18;
                __int16 v52 = 2112;
                __int16 v53 = v15;
                _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "failure in [NUAdjustment copyAdjustment]. [setting copy:value] returned nil. setting:%@ value:%@ ", buf, 0x16u);
              }

              uint64_t v21 = 0;
              goto LABEL_25;
            }
            uint64_t v20 = (void *)v19;

            self = v17;
            v5 = v16;
          }
          else
          {
            uint64_t v20 = 0;
          }
          [(NUGenericAdjustment *)v9 setValue:v20 forKey:v14];
        }
        uint64_t v11 = [(NSDictionary *)obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v21 = v9;
LABEL_25:
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_557);
    }
    uint64_t v22 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v25 = v22;
      __int16 v26 = [v5 identifier];
      __int16 v27 = [(NUSchema *)self identifier];
      *(_DWORD *)buf = 138412546;
      __int16 v51 = v26;
      __int16 v52 = 2112;
      __int16 v53 = v27;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "failure in [NUAdjustment copyAdjustment]. %@ != %@", buf, 0x16u);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)copy:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v9 = NUAssertLogger_16790();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_16790();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        id v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v26 = v16;
        __int16 v27 = 2114;
        uint64_t v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema copy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 654, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"object != nil");
  }
  v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(NUAdjustmentSchema *)self copyAdjustment:v5];
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_557);
    }
    id v7 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v26 = v5;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "failure in [NUAdjustment copy]. object is not an NUAdjustment: %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
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
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "adjustment != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_16790();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        BOOL v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v33 = (void *)MEMORY[0x1E4F29060];
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
      uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema validateSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 625, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"adjustment != nil");
  }
  if (!a4)
  {
    v25 = NUAssertLogger_16790();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v28 = NUAssertLogger_16790();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        uint64_t v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        __int16 v44 = [v42 callStackSymbols];
        long long v45 = [v44 componentsJoinedByString:@"\n"];
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
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema validateSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 626, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"error != NULL");
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
    id v50 = a4;
    uint64_t v8 = *(void *)v55;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v55 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v54 + 1) + 8 * v9);
      uint64_t v11 = [(NSDictionary *)self->_settings objectForKeyedSubscript:v10];
      uint64_t v12 = [v52 objectForKeyedSubscript:v10];
      if (v12)
      {
        id v53 = 0;
        char v13 = [v11 validate:v12 error:&v53];
        id v14 = v53;
        uint64_t v15 = v14;
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

- (BOOL)validateAdjustment:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = NUAssertLogger_16790();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "adjustment != nil");
      *(_DWORD *)buf = 138543362;
      long long v45 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v15 = NUAssertLogger_16790();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        __int16 v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        BOOL v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v45 = v26;
        __int16 v46 = 2114;
        uint64_t v47 = v30;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v45 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema validateAdjustment:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 605, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"adjustment != nil");
  }
  if (!a4)
  {
    uint64_t v19 = NUAssertLogger_16790();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v45 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_16790();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        id v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        uint64_t v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v45 = v35;
        __int16 v46 = 2114;
        uint64_t v47 = v39;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v45 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema validateAdjustment:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 606, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 identifier];
  BOOL v9 = [(NUSchema *)self validateIdentifier:v8 error:a4];

  BOOL v10 = v9 && [(NUAdjustmentSchema *)self validateSettings:v7 error:a4];
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
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        __int16 v27 = [v25 callStackSymbols];
        id v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v24;
        __int16 v44 = 2114;
        long long v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 591, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    id v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_16790();
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
        long long v45 = v37;
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
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 592, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUAdjustmentSchema *)self validateAdjustment:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not an adjustment" object:v7];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)validateSettings:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_settings;
  uint64_t v5 = [(NSDictionary *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v5)
  {
    BOOL v15 = 1;
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  id v17 = a3;
  uint64_t v7 = *(void *)v22;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v22 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
      id v20 = 0;
      BOOL v10 = +[NUModel validatePropertyName:error:](NUSchema, "validatePropertyName:error:", v9, &v20, v17);
      id v11 = v20;
      if (!v10)
      {
        id *v17 = +[NUError errorWithCode:2 reason:@"Invalid setting name" object:v9 underlyingError:v11];
LABEL_14:

        BOOL v15 = 0;
        goto LABEL_15;
      }
      uint64_t v12 = [(NSDictionary *)self->_settings objectForKeyedSubscript:v9];
      id v19 = 0;
      char v13 = [v12 isValid:&v19];
      id v14 = v19;

      if ((v13 & 1) == 0)
      {
        id *v17 = +[NUError errorWithCode:2 reason:@"Invalid setting" object:v9 underlyingError:v14];

        id v11 = v14;
        goto LABEL_14;
      }
    }
    uint64_t v6 = [(NSDictionary *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    BOOL v15 = 1;
    if (v6) {
      continue;
    }
    break;
  }
LABEL_15:

  return v15;
}

- (BOOL)isValid:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v9 = NUAssertLogger_16790();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_16790();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        id v19 = [v17 callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v27 = v16;
        __int16 v28 = 2114;
        uint64_t v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema isValid:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 552, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  id v25 = 0;
  BOOL v5 = [(NUAdjustmentSchema *)self validateSettings:&v25];
  if (!v5)
  {
    id v6 = v25;
    id v7 = +[NUError errorWithCode:2 reason:@"Invalid settings" object:self underlyingError:v6];

    *a3 = v7;
  }
  return v5;
}

- (NUAdjustmentSchema)initWithIdentifier:(id)a3 settings:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    BOOL v13 = NUAssertLogger_16790();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settings != nil");
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
        id v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        uint64_t v23 = [v21 callStackSymbols];
        uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
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
      id v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema initWithIdentifier:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 541, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"settings != nil");
  }
  BOOL v8 = v7;
  v29.receiver = self;
  v29.super_class = (Class)NUAdjustmentSchema;
  uint64_t v9 = [(NUSchema *)&v29 initWithIdentifier:v6 attributes:MEMORY[0x1E4F1CC08]];
  uint64_t v10 = [v8 copy];
  settings = v9->_settings;
  v9->_settings = (NSDictionary *)v10;

  return v9;
}

- (NUAdjustmentSchema)initWithIdentifier:(id)a3 attributes:(id)a4
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
    uint64_t v9 = NSString;
    uint64_t v10 = v8;
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    BOOL v13 = NSStringFromSelector(a2);
    id v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
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
    id v19 = [v17 callStackSymbols];
    id v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v23 = (void *)MEMORY[0x1E4F29060];
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
  _NUAssertFailHandler((uint64_t)"-[NUAdjustmentSchema initWithIdentifier:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 536, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- (int64_t)type
{
  return 1;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v14 = NUAssertLogger_16790();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v15;
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
        uint64_t v49 = v28;
        __int16 v50 = 2114;
        __int16 v51 = v32;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUAdjustmentSchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 874, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    uint64_t v21 = NUAssertLogger_16790();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
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
        uint64_t v49 = v37;
        __int16 v50 = 2114;
        __int16 v51 = v41;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUAdjustmentSchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 875, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"error != NULL");
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
      +[NUError errorWithCode:1 reason:@"Failed to deserialize adjustment settings" object:v7 underlyingError:v11];
      uint64_t v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to deserialize adjustment identifier" object:v7 underlyingError:v9];
    uint64_t v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v9;
  }

  return v12;
}

@end