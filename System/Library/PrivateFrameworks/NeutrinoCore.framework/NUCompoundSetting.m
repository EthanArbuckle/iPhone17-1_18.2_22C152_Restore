@interface NUCompoundSetting
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
+ (id)supportedAttributes;
- (BOOL)isValid:(id *)a3;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)validate:(id)a3 error:(id *)a4;
- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5;
- (NSDictionary)properties;
- (NUCompoundSetting)init;
- (NUCompoundSetting)initWithAttributes:(id)a3;
- (NUCompoundSetting)initWithProperties:(id)a3 attributes:(id)a4;
- (id)copy:(id)a3;
- (id)description;
- (id)deserialize:(id)a3 error:(id *)a4;
- (id)modelForProperty:(id)a3;
- (id)serialize:(id)a3 error:(id *)a4;
- (int64_t)type;
- (void)enumerateProperties:(id)a3;
@end

@implementation NUCompoundSetting

- (void).cxx_destruct
{
}

- (NSDictionary)properties
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 setObject:@"compound" forKeyedSubscript:@"isa"];
  properties = self->_properties;
  id v13 = 0;
  BOOL v8 = +[NUSetting serializeSettings:properties intoDictionary:v6 key:@"properties" error:&v13];
  id v9 = v13;
  if (v8)
  {
    if ([(NUSetting *)self serializeAttributesIntoDictionary:v6 error:a4])
    {
      BOOL v10 = 1;
    }
    else
    {
      v11 = [(NUModel *)self attributes];
      *a4 = +[NUError errorWithCode:1 reason:@"Failed to serialize attributes" object:v11 underlyingError:v9];

      BOOL v10 = 0;
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to serialize properties" object:self->_properties underlyingError:v9];
    BOOL v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)deserialize:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v20 = NUAssertLogger_22888();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v64 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v23 = NUAssertLogger_22888();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v64 = v34;
        __int16 v65 = 2114;
        v66 = v38;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v64 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 908, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v27 = NUAssertLogger_22888();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v64 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v30 = NUAssertLogger_22888();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v46 = [v44 callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v64 = v43;
        __int16 v65 = 2114;
        v66 = v47;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v64 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 909, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"error != NULL");
  }
  v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = a4;
    v53 = v7;
    id v56 = v7;
    v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_properties, "count"));
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obj = self->_properties;
    uint64_t v8 = [(NSDictionary *)obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v59;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v59 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          id v13 = [(NSDictionary *)self->_properties objectForKeyedSubscript:v12];
          v14 = [v56 objectForKeyedSubscript:v12];
          if (v14)
          {
            id v57 = 0;
            v15 = [v13 deserialize:v14 error:&v57];
            id v16 = v57;
            if (!v15)
            {
              id *v52 = +[NUError errorWithCode:1 reason:@"Failed to deserialized property" object:v12 underlyingError:v16];

              id v18 = 0;
              v17 = v55;
              goto LABEL_17;
            }
            [v55 setObject:v15 forKeyedSubscript:v12];
          }
        }
        uint64_t v9 = [(NSDictionary *)obj countByEnumeratingWithState:&v58 objects:v62 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    v17 = v55;
    id v18 = v55;
LABEL_17:

    v7 = v53;
  }
  else
  {
    +[NUError mismatchError:@"Not a dictionary" object:v7];
    id v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)serialize:(id)a3 error:(id *)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v20 = NUAssertLogger_22888();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v63 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v23 = NUAssertLogger_22888();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = v34;
        __int16 v64 = 2114;
        __int16 v65 = v38;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 858, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v27 = NUAssertLogger_22888();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v63 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v30 = NUAssertLogger_22888();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v46 = [v44 callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = v43;
        __int16 v64 = 2114;
        __int16 v65 = v47;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 859, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"error != NULL");
  }
  v52 = a4;
  id v7 = v6;
  v55 = v6;
  if (objc_opt_respondsToSelector())
  {
    v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_properties, "count"));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obj = self->_properties;
    uint64_t v8 = [(NSDictionary *)obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v58;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v57 + 1) + 8 * v10);
        uint64_t v12 = [v55 valueForKey:v11];
        id v13 = [(NSDictionary *)self->_properties objectForKeyedSubscript:v11];
        v14 = v13;
        if (v12)
        {
          id v56 = 0;
          v15 = [v13 serialize:v12 error:&v56];
          id v16 = v56;
          if (!v15)
          {
            id *v52 = +[NUError errorWithCode:2 reason:@"Failed to serialize property" object:v11 underlyingError:v16];

LABEL_19:
            id v18 = 0;
            v17 = v54;
            goto LABEL_20;
          }
          [v54 setObject:v15 forKeyedSubscript:v11];
        }
        else if ([v13 isRequired])
        {
          +[NUError missingError:@"Missing required setting" object:v11];
          uint64_t v12 = 0;
          id *v52 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }

        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSDictionary *)obj countByEnumeratingWithState:&v57 objects:v61 count:16];
          if (v8) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    v17 = v54;
    id v18 = v54;
LABEL_20:
  }
  else
  {
    +[NUError unsupportedError:@"Object is not KVC compliant" object:v7];
    id v18 = 0;
    id *v52 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (void)enumerateProperties:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v7 = NUAssertLogger_22888();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      v26 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v10 = NUAssertLogger_22888();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        id v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v26 = v14;
        __int16 v27 = 2114;
        v28 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting enumerateProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 848, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"block != nil");
  }
  properties = self->_properties;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __41__NUCompoundSetting_enumerateProperties___block_invoke;
  v23[3] = &unk_1E5D956C8;
  id v24 = v4;
  id v6 = v4;
  [(NSDictionary *)properties enumerateKeysAndObjectsUsingBlock:v23];
}

uint64_t __41__NUCompoundSetting_enumerateProperties___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)modelForProperty:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = NUAssertLogger_22888();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v11 = NUAssertLogger_22888();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        id v18 = [v16 callStackSymbols];
        uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        __int16 v26 = 2114;
        __int16 v27 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting modelForProperty:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 841, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"name != nil");
  }
  v5 = v4;
  id v6 = [(NSDictionary *)self->_properties objectForKeyedSubscript:v4];

  return v6;
}

- (id)copy:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v7 = NUAssertLogger_22888();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      id v24 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v10 = NUAssertLogger_22888();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        id v17 = [v15 callStackSymbols];
        id v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v24 = v14;
        __int16 v25 = 2114;
        __int16 v26 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      BOOL v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v24 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting copy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 832, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"object != nil");
  }
  id v4 = v3;
  v5 = (void *)[v3 copy];

  return v5;
}

- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"required"])
  {
    id v16 = 0;
    BOOL v10 = +[NUModel validateBool:v9 error:&v16];

    if (v10)
    {
      BOOL v11 = 1;
    }
    else
    {
      id v12 = v16;
      id v13 = +[NUError errorWithCode:2 reason:@"Invalid attribute value" object:v8 underlyingError:v12];

      BOOL v11 = 0;
      *a5 = v13;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NUCompoundSetting;
    BOOL v11 = [(NUSetting *)&v15 validateAttribute:v8 value:v9 error:a5];
  }
  return v11;
}

- (BOOL)isValid:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v19 = NUAssertLogger_22888();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v44 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_22888();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        __int16 v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        uint64_t v29 = [v27 callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v26;
        __int16 v45 = 2114;
        v46 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting isValid:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 774, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"error != NULL");
  }
  id v3 = a3;
  if (![(NSDictionary *)self->_properties count])
  {
    id v18 = +[NUError missingError:@"Missing properties" object:self];
    BOOL result = 0;
    *id v3 = v18;
    return result;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v5 = self->_properties;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v39;
  v35 = v3;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v39 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v38 + 1) + 8 * i);
      BOOL v11 = objc_opt_class();
      id v37 = 0;
      char v12 = [v11 validatePropertyName:v10 error:&v37];
      id v13 = v37;
      if ((v12 & 1) == 0)
      {
        id *v35 = +[NUError errorWithCode:2 reason:@"Invalid property name" object:self underlyingError:v13];
LABEL_16:

        return 0;
      }
      v14 = [(NSDictionary *)self->_properties objectForKeyedSubscript:v10];
      id v36 = 0;
      char v15 = [v14 isValid:&v36];
      id v16 = v36;

      if ((v15 & 1) == 0)
      {
        id *v35 = +[NUError errorWithCode:2 reason:@"Invalid property setting" object:self underlyingError:v16];

        id v13 = v16;
        goto LABEL_16;
      }
    }
    uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
    id v3 = v35;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_12:

  return [(NUModel *)self validateAttributes:v3];
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v20 = NUAssertLogger_22888();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v62 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v23 = NUAssertLogger_22888();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        id v37 = [v35 callStackSymbols];
        long long v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v34;
        __int16 v63 = 2114;
        __int16 v64 = v38;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      __int16 v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 731, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    uint64_t v27 = NUAssertLogger_22888();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v62 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v30 = NUAssertLogger_22888();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v46 = [v44 callStackSymbols];
        uint64_t v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v43;
        __int16 v63 = 2114;
        __int16 v64 = v47;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 732, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  v52 = a4;
  v54 = v6;
  if (objc_opt_respondsToSelector())
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    obj = self->_properties;
    uint64_t v8 = [(NSDictionary *)obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v57;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v57 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v56 + 1) + 8 * v10);
        char v12 = [v54 valueForKey:v11];
        id v13 = [(NSDictionary *)self->_properties objectForKeyedSubscript:v11];
        v14 = v13;
        if (v12)
        {
          id v55 = 0;
          char v15 = [v13 validate:v12 error:&v55];
          id v16 = v55;
          id v17 = v16;
          if ((v15 & 1) == 0)
          {
            id *v52 = +[NUError errorWithCode:2 reason:@"Invalid value for setting key" object:v11 underlyingError:v16];

LABEL_19:
            BOOL v18 = 0;
            goto LABEL_20;
          }
        }
        else if ([v13 isRequired])
        {
          +[NUError missingError:@"Missing required setting" object:v11];
          char v12 = 0;
          id *v52 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }

        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSDictionary *)obj countByEnumeratingWithState:&v56 objects:v60 count:16];
          if (v8) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
    BOOL v18 = 1;
LABEL_20:
  }
  else
  {
    +[NUError unsupportedError:@"Object is not KVC compliant" object:v7];
    BOOL v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NUCompoundSetting *)self properties];
  id v6 = [(NUModel *)self attributes];
  id v7 = [v3 stringWithFormat:@"<%@ properties:%@ attributes:%@>", v4, v5, v6];

  return v7;
}

- (NUCompoundSetting)initWithProperties:(id)a3 attributes:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v13 = NUAssertLogger_22888();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "properties != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v31 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v16 = NUAssertLogger_22888();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        BOOL v23 = [v21 callStackSymbols];
        BOOL v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v31 = v20;
        __int16 v32 = 2114;
        uint64_t v33 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      BOOL v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v31 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting initWithProperties:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 715, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"properties != nil");
  }
  uint64_t v8 = v7;
  v29.receiver = self;
  v29.super_class = (Class)NUCompoundSetting;
  uint64_t v9 = [(NUModel *)&v29 initWithAttributes:v7];
  uint64_t v10 = [v6 copy];
  properties = v9->_properties;
  v9->_properties = (NSDictionary *)v10;

  return v9;
}

- (NUCompoundSetting)initWithAttributes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    id v7 = v5;
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    BOOL v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E4F29060];
    char v15 = v13;
    id v16 = [v14 callStackSymbols];
    BOOL v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  char v15 = v18;
  id v22 = [v20 callStackSymbols];
  BOOL v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  BOOL v31 = specific;
  __int16 v32 = 2114;
  uint64_t v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  BOOL v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting initWithAttributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 710, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUCompoundSetting)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
  }
  id v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    id v13 = v11;
    v14 = [v12 callStackSymbols];
    char v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  id v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  id v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  BOOL v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  id v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCompoundSetting init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 705, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (int64_t)type
{
  return 4;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v14 = NUAssertLogger_22888();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      char v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v17 = NUAssertLogger_22888();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        BOOL v31 = [v29 callStackSymbols];
        uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = v28;
        __int16 v50 = 2114;
        uint64_t v51 = v32;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUCompoundSetting deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 963, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    id v21 = NUAssertLogger_22888();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_22888();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        id v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        uint64_t v40 = [v38 callStackSymbols];
        uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = v37;
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
      uint64_t v49 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUCompoundSetting deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 964, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v47 = 0;
  uint64_t v8 = [a1 deserializeSettingsFromDictionary:v6 key:@"properties" error:&v47];
  id v9 = v47;
  if (v8)
  {
    id v46 = 0;
    uint64_t v10 = [a1 deserializeAttributesFromDictionary:v7 error:&v46];
    id v11 = v46;

    if (v10)
    {
      uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithProperties:v8 attributes:v10];
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to deserialize attributes" object:v7 underlyingError:v11];
      uint64_t v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to deserialize properties" object:v7 underlyingError:v9];
    uint64_t v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v9;
  }

  return v12;
}

+ (id)supportedAttributes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"required";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

@end