@interface NUModel
+ (BOOL)validateArray:(id)a3 error:(id *)a4;
+ (BOOL)validateBool:(id)a3 error:(id *)a4;
+ (BOOL)validateIdentifier:(id)a3 error:(id *)a4;
+ (BOOL)validateName:(id)a3 error:(id *)a4;
+ (BOOL)validateNumber:(id)a3 error:(id *)a4;
+ (BOOL)validatePattern:(id)a3 error:(id *)a4;
+ (BOOL)validatePropertyName:(id)a3 error:(id *)a4;
+ (BOOL)validateString:(id)a3 error:(id *)a4;
+ (BOOL)validateStringArray:(id)a3 error:(id *)a4;
+ (id)_deserializeObjectOfClass:(Class)a3 fromDictionary:(id)a4 key:(id)a5 error:(id *)a6;
+ (id)deserializeArrayFromDictionary:(id)a3 key:(id)a4 error:(id *)a5;
+ (id)deserializeAttribute:(id)a3 value:(id)a4 error:(id *)a5;
+ (id)deserializeDictionaryFromDictionary:(id)a3 key:(id)a4 error:(id *)a5;
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
+ (id)deserializeStringFromDictionary:(id)a3 key:(id)a4 error:(id *)a5;
+ (id)requiredAttributes;
+ (id)reservedPropertyNames;
+ (id)supportedAttributes;
- (BOOL)isValid:(id *)a3;
- (BOOL)serializeAttribute:(id)a3 value:(id)a4 intoDictionary:(id)a5 error:(id *)a6;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)validate:(id)a3 error:(id *)a4;
- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)validateAttributes:(id *)a3;
- (NSDictionary)attributes;
- (NUModel)init;
- (NUModel)initWithAttributes:(id)a3;
- (id)copy:(id)a3;
- (id)deserialize:(id)a3 error:(id *)a4;
- (id)modelForProperty:(id)a3;
- (id)serialize:(id)a3 error:(id *)a4;
- (id)serializeAsDictionary:(id *)a3;
@end

@implementation NUModel

+ (id)deserializeAttribute:(id)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v11 = NUAssertLogger_6305();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v44 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_6305();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v25;
        __int16 v45 = 2114;
        v46 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel deserializeAttribute:value:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 429, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"identifier != nil");
  }
  if (!a5)
  {
    v18 = NUAssertLogger_6305();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v44 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_6305();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v34;
        __int16 v45 = 2114;
        v46 = v38;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel deserializeAttribute:value:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 430, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"error != NULL");
  }
  v9 = v8;
  *a5 = +[NUError invalidError:@"Unsupported attribute" object:v7];

  return 0;
}

+ (id)deserializeDictionaryFromDictionary:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [a1 _deserializeObjectOfClass:objc_opt_class() fromDictionary:v9 key:v8 error:a5];

  return v10;
}

+ (id)deserializeArrayFromDictionary:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [a1 _deserializeObjectOfClass:objc_opt_class() fromDictionary:v9 key:v8 error:a5];

  return v10;
}

+ (id)deserializeStringFromDictionary:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [a1 _deserializeObjectOfClass:objc_opt_class() fromDictionary:v9 key:v8 error:a5];

  return v10;
}

+ (id)_deserializeObjectOfClass:(Class)a3 fromDictionary:(id)a4 key:(id)a5 error:(id *)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    v17 = NUAssertLogger_6305();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      v66 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_6305();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        uint64_t v41 = [v39 callStackSymbols];
        uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v38;
        __int16 v67 = 2114;
        v68 = v42;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel _deserializeObjectOfClass:fromDictionary:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 382, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"dictionary != nil");
  }
  v11 = v10;
  if (!v10)
  {
    v24 = NUAssertLogger_6305();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)buf = 138543362;
      v66 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v27 = NUAssertLogger_6305();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        uint64_t v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        v50 = [v48 callStackSymbols];
        v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v47;
        __int16 v67 = 2114;
        v68 = v51;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel _deserializeObjectOfClass:fromDictionary:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 383, @"Invalid parameter not satisfying: %s", v52, v53, v54, v55, (uint64_t)"key != nil");
  }
  if (!a6)
  {
    uint64_t v31 = NUAssertLogger_6305();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v66 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v34 = NUAssertLogger_6305();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v57 = (void *)MEMORY[0x1E4F29060];
        id v58 = v56;
        v59 = [v57 callStackSymbols];
        v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v56;
        __int16 v67 = 2114;
        v68 = v60;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      id v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel _deserializeObjectOfClass:fromDictionary:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 384, @"Invalid parameter not satisfying: %s", v61, v62, v63, v64, (uint64_t)"error != NULL");
  }
  v12 = [v9 objectForKeyedSubscript:v10];
  if (v12)
  {
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      goto LABEL_10;
    }
    BOOL v15 = [NSString stringWithFormat:@"in [NUModel _deserializeObjectOfClass] Key:%@ is not Class:%@", v11, a3];
    *a6 = +[NUError mismatchError:v15 object:v12];
  }
  else
  {
    v14 = [NSString stringWithFormat:@"in [NUModel _deserializeObjectOfClass] Missing Key:%@", v11];
    *a6 = +[NUError missingError:v14 object:v9];
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

+ (id)reservedPropertyNames
{
  if (reservedPropertyNames_onceToken != -1) {
    dispatch_once(&reservedPropertyNames_onceToken, &__block_literal_global_6345);
  }
  v2 = (void *)reservedPropertyNames_names;

  return v2;
}

uint64_t __32__NUModel_reservedPropertyNames__block_invoke()
{
  reservedPropertyNames_names = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F004A610];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)validatePropertyName:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v12 = NUAssertLogger_6305();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v15 = NUAssertLogger_6305();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
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
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validatePropertyName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 349, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v19 = NUAssertLogger_6305();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_6305();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        BOOL v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
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
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validatePropertyName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 350, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  if ([a1 validateName:v6 error:a4])
  {
    id v8 = [a1 reservedPropertyNames];
    int v9 = [v8 containsObject:v7];

    if (v9)
    {
      +[NUError invalidError:@"Reserved keyword" object:v7];
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)validatePattern:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([a1 validateString:v6 error:a4])
  {
    id v7 = +[NUPattern patternWithString:v6 error:a4];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)validateIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([a1 validateString:v6 error:a4]) {
    BOOL v7 = +[NUIdentifier validateIdentifierString:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)validateName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([a1 validateString:v6 error:a4])
  {
    if (+[NUIdentifier validateName:v6])
    {
      BOOL v7 = 1;
    }
    else
    {
      +[NUError invalidError:@"Invalid name" object:v6];
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)validateStringArray:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v19 = NUAssertLogger_6305();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      id v58 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_6305();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        id v36 = [v34 callStackSymbols];
        id v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v58 = v33;
        __int16 v59 = 2114;
        v60 = v37;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v58 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validateStringArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 279, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v26 = NUAssertLogger_6305();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v58 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v29 = NUAssertLogger_6305();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        uint64_t v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        uint64_t v45 = [v43 callStackSymbols];
        __int16 v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v58 = v42;
        __int16 v59 = 2114;
        v60 = v46;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v58 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validateStringArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 280, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"error != NULL");
  }
  BOOL v7 = v6;
  if ([a1 validateArray:v6 error:a4])
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          id v51 = 0;
          char v14 = [a1 validateString:v13 error:&v51];
          id v15 = v51;
          BOOL v16 = v15;
          if ((v14 & 1) == 0)
          {
            *a4 = +[NUError errorWithCode:5 reason:@"Not a string array" object:v8 underlyingError:v15];

            BOOL v17 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v56 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v17 = 1;
LABEL_15:
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)validateArray:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = NUAssertLogger_6305();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_6305();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        id v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v23;
        __int16 v43 = 2114;
        id v44 = v27;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      char v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validateArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 265, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    BOOL v16 = NUAssertLogger_6305();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_6305();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        id v35 = [v33 callStackSymbols];
        id v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v32;
        __int16 v43 = 2114;
        id v44 = v36;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validateArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 266, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    *a4 = +[NUError mismatchError:@"Not an array" object:v6];
  }

  return isKindOfClass & 1;
}

+ (BOOL)validateString:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = NUAssertLogger_6305();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_6305();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        id v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v23;
        __int16 v43 = 2114;
        id v44 = v27;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      char v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validateString:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 251, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    BOOL v16 = NUAssertLogger_6305();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_6305();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        id v35 = [v33 callStackSymbols];
        id v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v32;
        __int16 v43 = 2114;
        id v44 = v36;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validateString:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 252, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    *a4 = +[NUError mismatchError:@"Not a string" object:v6];
  }

  return isKindOfClass & 1;
}

+ (BOOL)validateNumber:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = NUAssertLogger_6305();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      id v44 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v14 = NUAssertLogger_6305();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        id v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v28 = [v26 callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v44 = v25;
        __int16 v45 = 2114;
        __int16 v46 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v44 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validateNumber:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 222, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v18 = NUAssertLogger_6305();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v44 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v21 = NUAssertLogger_6305();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        id v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        uint64_t v37 = [v35 callStackSymbols];
        uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v44 = v34;
        __int16 v45 = 2114;
        __int16 v46 = v38;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      BOOL v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v44 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validateNumber:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 223, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if (objc_msgSend(v7, "nu_isNaN"))
    {
      id v8 = @"Number is NaN";
    }
    else
    {
      if (!objc_msgSend(v7, "nu_isInfinite"))
      {
        BOOL v9 = 1;
        goto LABEL_11;
      }
      id v8 = @"Number is infinite";
    }
    +[NUError rangeError:v8 object:v7];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  +[NUError mismatchError:@"Not a number" object:v6];
  BOOL v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v9;
}

+ (BOOL)validateBool:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = NUAssertLogger_6305();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v13 = NUAssertLogger_6305();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        id v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v43 = v24;
        __int16 v44 = 2114;
        __int16 v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validateBool:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 201, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    BOOL v17 = NUAssertLogger_6305();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      __int16 v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v20 = NUAssertLogger_6305();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        id v36 = [v34 callStackSymbols];
        uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v43 = v33;
        __int16 v44 = 2114;
        __int16 v45 = v37;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel validateBool:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 202, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    char v8 = objc_msgSend(v7, "nu_isBoolean");
    if ((v8 & 1) == 0)
    {
      *a4 = +[NUError mismatchError:@"Not a BOOLean" object:v7];
    }
  }
  else
  {
    +[NUError mismatchError:@"Not a BOOLean" object:v6];
    char v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)requiredAttributes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)supportedAttributes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    BOOL v9 = NUAssertLogger_6305();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_6305();
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
        id v26 = v16;
        __int16 v27 = 2114;
        uint64_t v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      BOOL v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUModel deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 121, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  *a4 = +[NUError unsupportedError:@"Abstract model" object:a1];

  return 0;
}

- (void).cxx_destruct
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (BOOL)serializeAttribute:(id)a3 value:(id)a4 intoDictionary:(id)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    BOOL v14 = NUAssertLogger_6305();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v17 = NUAssertLogger_6305();
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
        uint64_t v47 = v28;
        __int16 v48 = 2114;
        uint64_t v49 = v32;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUModel serializeAttribute:value:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 420, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"identifier != nil");
  }
  if (!a6)
  {
    uint64_t v21 = NUAssertLogger_6305();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_6305();
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
        uint64_t v47 = v37;
        __int16 v48 = 2114;
        uint64_t v49 = v41;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      id v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUModel serializeAttribute:value:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 421, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"error != NULL");
  }
  v12 = v11;
  *a6 = +[NUError invalidError:@"Unsupported attribute" object:v9];

  return 0;
}

- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a5)
  {
    id v11 = NUAssertLogger_6305();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v14 = NUAssertLogger_6305();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        BOOL v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        uint64_t v21 = [v19 callStackSymbols];
        uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v18;
        __int16 v29 = 2114;
        id v30 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUModel validateAttribute:value:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 193, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  id v9 = v8;
  *a5 = +[NUError invalidError:@"Unsupported attribute" object:v7];

  return 0;
}

- (BOOL)validateAttributes:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v19 = NUAssertLogger_6305();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_6305();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        __int16 v29 = [v27 callStackSymbols];
        id v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v26;
        __int16 v45 = 2114;
        uint64_t v46 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUModel validateAttributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 152, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"error != NULL");
  }
  v4 = (void *)[(NSDictionary *)self->_attributes mutableCopy];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [(id)objc_opt_class() requiredAttributes];
  uint64_t v36 = [v5 setWithArray:v6];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = [(id)objc_opt_class() supportedAttributes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v39 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * v11);
      BOOL v13 = [v4 objectForKeyedSubscript:v12];
      if (v13)
      {
        id v37 = 0;
        BOOL v14 = [(NUModel *)self validateAttribute:v12 value:v13 error:&v37];
        id v15 = v37;
        BOOL v16 = v15;
        if (!v14)
        {
          *a3 = +[NUError errorWithCode:2 reason:@"Invalid attribute" object:v12 underlyingError:v15];

LABEL_17:
          BOOL v17 = 0;
          goto LABEL_18;
        }
      }
      else if ([v36 containsObject:v12])
      {
        +[NUError missingError:@"Missing required attribute" object:v12];
        BOOL v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      [v4 removeObjectForKey:v12];

      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v9) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  if ([v4 count])
  {
    +[NUError extraError:@"Extra attributes" object:v4];
    BOOL v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_18:

  return v17;
}

- (id)deserialize:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    uint64_t v9 = NUAssertLogger_6305();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_6305();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        id v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      BOOL v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUModel deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 135, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  *a4 = +[NUError unsupportedError:@"Abstract model" object:self];

  return 0;
}

- (id)serialize:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    uint64_t v9 = NUAssertLogger_6305();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_6305();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        id v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      BOOL v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUModel serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 128, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  *a4 = +[NUError unsupportedError:@"Abstract model" object:self];

  return 0;
}

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    uint64_t v9 = NUAssertLogger_6305();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_6305();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        id v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      BOOL v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUModel serializeIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 114, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  *a4 = +[NUError unsupportedError:@"Abstract model" object:self];

  return 0;
}

- (id)serializeAsDictionary:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NUModel *)self serializeIntoDictionary:v5 error:a3]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)modelForProperty:(id)a3
{
  return 0;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    uint64_t v9 = NUAssertLogger_6305();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_6305();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        id v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      BOOL v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUModel validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 85, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  *a4 = +[NUError unsupportedError:@"Abstract model" object:self];

  return 0;
}

- (BOOL)isValid:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v5 = NUAssertLogger_6305();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v8 = NUAssertLogger_6305();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        uint64_t v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        id v15 = [v13 callStackSymbols];
        BOOL v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v12;
        __int16 v23 = 2114;
        uint64_t v24 = v16;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUModel isValid:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 78, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"error != NULL");
  }
  *a3 = +[NUError unsupportedError:@"Abstract model" object:self];
  return 0;
}

- (id)copy:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_192_6326);
  }
  v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSString;
    id v6 = v4;
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    BOOL v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_192_6326);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_192_6326);
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
    BOOL v13 = v11;
    id v14 = [v12 callStackSymbols];
    id v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  BOOL v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  _NUAssertFailHandler((uint64_t)"-[NUModel copy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 73, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v24, v25, v26, v27, v23);
}

- (NUModel)initWithAttributes:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    BOOL v9 = NUAssertLogger_6305();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "attributes != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_6305();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        id v19 = [v17 callStackSymbols];
        uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        id v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUModel initWithAttributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUModel.m", 64, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"attributes != nil");
  }
  id v5 = v4;
  id v6 = (NSDictionary *)[v4 copy];
  attributes = self->_attributes;
  self->_attributes = v6;

  return self;
}

- (NUModel)init
{
  return [(NUModel *)self initWithAttributes:MEMORY[0x1E4F1CC08]];
}

@end