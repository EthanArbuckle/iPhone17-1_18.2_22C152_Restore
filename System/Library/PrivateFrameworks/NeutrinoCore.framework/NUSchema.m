@interface NUSchema
+ (BOOL)serializeMediaType:(int64_t)a3 intoDictionary:(id)a4 error:(id *)a5;
+ (BOOL)validateIdentifiable:(id)a3 error:(id *)a4;
+ (BOOL)validateIdentifiable:(id)a3 type:(int64_t)a4 error:(id *)a5;
+ (BOOL)validateSchemaIdentifier:(id)a3 type:(int64_t)a4 error:(id *)a5;
+ (BOOL)validateSchemaType:(id)a3 error:(id *)a4;
+ (id)copyIdentifiableItem:(id)a3;
+ (id)copyItem:(id)a3 schemaIdentifier:(id)a4;
+ (id)deserializeContentsFromDictionary:(id)a3 error:(id *)a4;
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
+ (id)deserializeIdentifiableItem:(id)a3 error:(id *)a4;
+ (id)deserializeIdentifierFromDictionary:(id)a3 error:(id *)a4;
+ (id)deserializeItem:(id)a3 schemaIdentifier:(id)a4 error:(id *)a5;
+ (id)deserializeSchemaFromArray:(id)a3 error:(id *)a4;
+ (id)reservedPropertyNames;
+ (id)serializeIdentifiableItem:(id)a3 error:(id *)a4;
+ (id)serializeItem:(id)a3 schemaIdentifier:(id)a4 error:(id *)a5;
+ (int64_t)deserializeMediaTypeFromDictionary:(id)a3;
+ (int64_t)schemaTypeFromString:(id)a3 error:(id *)a4;
- (BOOL)deserializeIdentifierFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSchema:(id)a3;
- (BOOL)isValid:(id *)a3;
- (BOOL)itemIsResolved:(id)a3;
- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5;
- (BOOL)serializeIdentifier:(id)a3 intoDictionary:(id)a4 error:(id *)a5;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)validateIdentifier:(id)a3 error:(id *)a4;
- (NUIdentifier)identifier;
- (NUSchema)initWithAttributes:(id)a3;
- (NUSchema)initWithIdentifier:(id)a3 attributes:(id)a4;
- (id)description;
- (id)schemaDependencies;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation NUSchema

- (void).cxx_destruct
{
}

- (NUIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
  }
  v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v9 = NSString;
    v10 = v8;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v9 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v12];
    *(_DWORD *)buf = 138543362;
    v33 = v13;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v14 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v14 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
      }
      goto LABEL_8;
    }
    if (v14 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v15 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v16 = (void *)MEMORY[0x1E4F29060];
    v17 = v15;
    v18 = [v16 callStackSymbols];
    v19 = [v18 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v33 = v19;
    _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v20 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v22 = (void *)MEMORY[0x1E4F29060];
  id v23 = specific;
  v17 = v20;
  v24 = [v22 callStackSymbols];
  v25 = [v24 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v33 = specific;
  __int16 v34 = 2114;
  v35 = v25;
  _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v26 = (objc_class *)objc_opt_class();
  uint64_t v27 = NSStringFromClass(v26);
  _NUAssertFailHandler((uint64_t)"-[NUSchema resolveItem:resolver:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 520, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v28, v29, v30, v31, v27);
}

- (BOOL)itemIsResolved:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
  }
  v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v5 = NSString;
    id v6 = v4;
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    uint64_t v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  _NUAssertFailHandler((uint64_t)"-[NUSchema itemIsResolved:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 516, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v24, v25, v26, v27, v23);
}

- (id)schemaDependencies
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSString;
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F29060];
    v11 = v9;
    v12 = [v10 callStackSymbols];
    v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  v11 = v14;
  v18 = [v16 callStackSymbols];
  id v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v27 = specific;
  __int16 v28 = 2114;
  uint64_t v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUSchema schemaDependencies]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 512, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(NUSchema *)self identifier];
  id v7 = [v6 stringRepresentation];
  [v5 setObject:v7 forKeyedSubscript:@"identifier"];

  return 1;
}

- (BOOL)isEqualToSchema:(id)a3
{
  id v4 = a3;
  id v5 = [(NUSchema *)self identifier];
  id v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToIdentifier:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUSchema *)self isEqualToSchema:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(NUSchema *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_identifier];
}

- (BOOL)deserializeIdentifierFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = +[NUSchema deserializeIdentifierFromDictionary:error:](NUSchema, "deserializeIdentifierFromDictionary:error:", a3);
  if (v6) {
    BOOL v7 = [(NUSchema *)self validateIdentifier:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)serializeIdentifier:(id)a3 intoDictionary:(id)a4 error:(id *)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v14 = NUAssertLogger_16790();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v63 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v17 = NUAssertLogger_16790();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = v35;
        __int16 v64 = 2114;
        v65 = v39;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchema serializeIdentifier:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 230, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"identifier != nil");
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v21 = NUAssertLogger_16790();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      v63 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_16790();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v47 = [v45 callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = v44;
        __int16 v64 = 2114;
        v65 = v48;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchema serializeIdentifier:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 231, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"dictionary != nil");
  }
  if (!a5)
  {
    __int16 v28 = NUAssertLogger_16790();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v63 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger_16790();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        v56 = [v54 callStackSymbols];
        v57 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = v53;
        __int16 v64 = 2114;
        v65 = v57;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchema serializeIdentifier:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 232, @"Invalid parameter not satisfying: %s", v58, v59, v60, v61, (uint64_t)"error != NULL");
  }
  BOOL v11 = [(NUSchema *)self validateIdentifier:v8 error:a5];
  if (v11)
  {
    v12 = [v8 stringRepresentation];
    [v10 setObject:v12 forKeyedSubscript:@"identifier"];
  }
  return v11;
}

- (BOOL)validateIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v11 = NUAssertLogger_16790();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v44 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_16790();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        BOOL v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        __int16 v28 = [v26 callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v25;
        __int16 v45 = 2114;
        id v46 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchema validateIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 149, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"identifier != nil");
  }
  if (!a4)
  {
    BOOL v18 = NUAssertLogger_16790();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v44 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_16790();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        __int16 v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        id v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v34;
        __int16 v45 = 2114;
        id v46 = v38;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchema validateIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 150, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"error != NULL");
  }
  BOOL v7 = v6;
  id v8 = [(NUSchema *)self identifier];
  char v9 = [v7 isEqualToIdentifier:v8];

  if ((v9 & 1) == 0)
  {
    *a4 = +[NUError mismatchError:@"Identifier mismatch" object:v7];
  }

  return v9;
}

- (BOOL)isValid:(id *)a3
{
  id v9 = 0;
  BOOL v5 = [(NUModel *)self validateAttributes:&v9];
  if (!v5)
  {
    id v6 = v9;
    id v7 = +[NUError errorWithCode:2 reason:@"Invalid attributes" object:self underlyingError:v6];

    *a3 = v7;
  }
  return v5;
}

- (NUSchema)initWithIdentifier:(id)a3 attributes:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = (NUIdentifier *)a3;
  id v7 = a4;
  if (!v6)
  {
    v12 = NUAssertLogger_16790();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v15 = NUAssertLogger_16790();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        id v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        BOOL v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v19;
        __int16 v31 = 2114;
        uint64_t v32 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSchema initWithIdentifier:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 49, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"identifier != nil");
  }
  id v8 = v7;
  v28.receiver = self;
  v28.super_class = (Class)NUSchema;
  id v9 = [(NUModel *)&v28 initWithAttributes:v7];
  identifier = v9->_identifier;
  v9->_identifier = v6;

  return v9;
}

- (NUSchema)initWithAttributes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
  }
  BOOL v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    id v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    BOOL v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    __int16 v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F29060];
    BOOL v15 = v13;
    BOOL v16 = [v14 callStackSymbols];
    id v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    __int16 v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  BOOL v15 = v18;
  BOOL v22 = [v20 callStackSymbols];
  uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  __int16 v31 = specific;
  __int16 v32 = 2114;
  uint64_t v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUSchema initWithAttributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 44, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (int64_t)type
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    unint64_t v3 = NSString;
    id v4 = v2;
    BOOL v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F29060];
    BOOL v11 = v9;
    uint64_t v12 = [v10 callStackSymbols];
    v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  BOOL v11 = v14;
  BOOL v18 = [v16 callStackSymbols];
  id v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v27 = specific;
  __int16 v28 = 2114;
  uint64_t v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUSchema type]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 39, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

+ (id)deserializeSchemaFromArray:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v19 = NUAssertLogger_16790();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "array != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_16790();
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
        uint64_t v59 = v33;
        __int16 v60 = 2114;
        uint64_t v61 = v37;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeSchemaFromArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 483, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"array != nil");
  }
  if (!a4)
  {
    uint64_t v26 = NUAssertLogger_16790();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v29 = NUAssertLogger_16790();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        uint64_t v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        __int16 v45 = [v43 callStackSymbols];
        id v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v59 = v42;
        __int16 v60 = 2114;
        uint64_t v61 = v46;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      __int16 v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeSchemaFromArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 484, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  uint64_t v51 = a4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v54;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v54 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v53 + 1) + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v52 = 0;
      BOOL v15 = [a1 deserializeFromDictionary:v14 error:&v52];
      id v16 = v52;
      if (!v15)
      {
        *uint64_t v51 = +[NUError errorWithCode:1 reason:@"Failed to deserialize schema" object:v14 underlyingError:v16];

        goto LABEL_15;
      }
      [v8 addObject:v15];

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v53 objects:v57 count:16];
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    *uint64_t v51 = +[NUError mismatchError:@"Not a dictionary" object:v14];
LABEL_15:

    id v17 = 0;
    goto LABEL_16;
  }
LABEL_12:

  id v17 = v8;
LABEL_16:

  return v17;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v13 = NUAssertLogger_16790();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      id v46 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v16 = NUAssertLogger_16790();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        BOOL v30 = [v28 callStackSymbols];
        __int16 v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v46 = v27;
        __int16 v47 = 2114;
        uint64_t v48 = v31;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      BOOL v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v46 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 441, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    v20 = NUAssertLogger_16790();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v46 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v23 = NUAssertLogger_16790();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24)
      {
        id v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        uint64_t v39 = [v37 callStackSymbols];
        uint64_t v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v46 = v36;
        __int16 v47 = 2114;
        uint64_t v48 = v40;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v46 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 442, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  id v7 = [v5 objectForKeyedSubscript:@"isa"];
  if (!v7)
  {
    uint64_t v10 = +[NUError missingError:@"Missing schema type" object:v6];
LABEL_9:
    uint64_t v11 = 0;
    *a4 = v10;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = +[NUError invalidError:@"Invalid schema type" object:v7];
    goto LABEL_9;
  }
  id v8 = v7;
  if ([v8 isEqualToString:@"Adjustment"])
  {
    id v9 = NUAdjustmentSchema;
  }
  else if ([v8 isEqualToString:@"Array"])
  {
    id v9 = NUArraySchema;
  }
  else if ([v8 isEqualToString:@"Composition"])
  {
    id v9 = NUCompositionSchema;
  }
  else
  {
    if (![v8 isEqualToString:@"Source"])
    {
      +[NUError unknownError:@"Unknown schema type" object:v8];
      uint64_t v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    id v9 = NUSourceSchema;
  }
  uint64_t v11 = [(__objc2_class *)v9 deserializeFromDictionary:v6 error:a4];
LABEL_17:

LABEL_18:

  return v11;
}

+ (id)deserializeItem:(id)a3 schemaIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    BOOL v15 = NUAssertLogger_16790();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v18 = NUAssertLogger_16790();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        id v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        uint64_t v32 = [v30 callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v29;
        __int16 v49 = 2114;
        uint64_t v50 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeItem:schemaIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 398, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"object != nil");
  }
  if (!a5)
  {
    uint64_t v22 = NUAssertLogger_16790();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger_16790();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        id v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
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
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeItem:schemaIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 399, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  id v9 = v8;
  uint64_t v10 = +[NUSchemaRegistry sharedRegistry];
  uint64_t v11 = [v10 schemaWithIdentifier:v9];
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 deserialize:v7 error:a5];
  }
  else
  {
    +[NUError unknownError:@"Unknown identifier" object:v9];
    uint64_t v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)serializeItem:(id)a3 schemaIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    BOOL v19 = NUAssertLogger_16790();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "item != nil");
      *(_DWORD *)buf = 138543362;
      v69 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_16790();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        id v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v40;
        __int16 v70 = 2114;
        v71 = v44;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      BOOL v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema serializeItem:schemaIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 373, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"item != nil");
  }
  id v9 = v8;
  if (!v8)
  {
    BOOL v26 = NUAssertLogger_16790();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v69 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v29 = NUAssertLogger_16790();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        __int16 v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        id v52 = [v50 callStackSymbols];
        long long v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v49;
        __int16 v70 = 2114;
        v71 = v53;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      id v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema serializeItem:schemaIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 374, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"identifier != nil");
  }
  if (!a5)
  {
    uint64_t v33 = NUAssertLogger_16790();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v69 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v36 = NUAssertLogger_16790();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        uint64_t v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v59 = (void *)MEMORY[0x1E4F29060];
        id v60 = v58;
        uint64_t v61 = [v59 callStackSymbols];
        uint64_t v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v58;
        __int16 v70 = 2114;
        v71 = v62;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      id v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema serializeItem:schemaIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 375, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)"error != NULL");
  }
  uint64_t v10 = +[NUSchemaRegistry sharedRegistry];
  uint64_t v11 = [v10 schemaWithIdentifier:v9];
  uint64_t v12 = v11;
  if (v11)
  {
    id v67 = 0;
    uint64_t v13 = [v11 serialize:v7 error:&v67];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v16 = v67;
      id v17 = +[NUError errorWithCode:1 reason:@"Failed to serialize item" object:v7 underlyingError:v16];

      *a5 = v17;
    }
  }
  else
  {
    +[NUError unknownError:@"Unknown identifier" object:v9];
    uint64_t v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (id)deserializeIdentifiableItem:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = NUAssertLogger_16790();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v15 = NUAssertLogger_16790();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        BOOL v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        id v29 = [v27 callStackSymbols];
        BOOL v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v26;
        __int16 v47 = 2114;
        uint64_t v48 = v30;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeIdentifiableItem:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 351, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    BOOL v19 = NUAssertLogger_16790();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_16790();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        id v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v35;
        __int16 v47 = 2114;
        uint64_t v48 = v39;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      BOOL v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeIdentifiableItem:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 352, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = 0;
    id v8 = [a1 deserializeIdentifierFromDictionary:v7 error:&v44];
    id v9 = v44;
    if (v8)
    {
      uint64_t v10 = +[NUSchema deserializeItem:v7 schemaIdentifier:v8 error:a4];
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to deserialize identifier" object:v7 underlyingError:v9];
      uint64_t v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError mismatchError:@"Not a dictionary" object:v7];
    uint64_t v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)serializeIdentifiableItem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 identifier];
  id v7 = +[NUSchema serializeItem:v5 schemaIdentifier:v6 error:a4];

  return v7;
}

+ (id)deserializeContentsFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v23 = NUAssertLogger_16790();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      BOOL v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v26 = NUAssertLogger_16790();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        id v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        uint64_t v40 = [v38 callStackSymbols];
        uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v66 = v37;
        __int16 v67 = 2114;
        v68 = v41;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      id v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeContentsFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 310, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    BOOL v30 = NUAssertLogger_16790();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v33 = NUAssertLogger_16790();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        uint64_t v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v47 = (void *)MEMORY[0x1E4F29060];
        id v48 = v46;
        uint64_t v49 = [v47 callStackSymbols];
        uint64_t v50 = [v49 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v66 = v46;
        __int16 v67 = 2114;
        v68 = v50;
        _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      uint64_t v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = v36;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeContentsFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 311, @"Invalid parameter not satisfying: %s", v51, v52, v53, v54, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v63 = 0;
  id v8 = [a1 deserializeDictionaryFromDictionary:v6 key:@"contents" error:&v63];
  id v9 = v63;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v55 = a4;
      uint64_t v56 = v8;
      uint64_t v14 = *(void *)v60;
      uint64_t v57 = v7;
LABEL_6:
      uint64_t v15 = 0;
      BOOL v16 = v9;
      while (1)
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v59 + 1) + 8 * v15);
        BOOL v18 = [v11 objectForKeyedSubscript:v17];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v58 = 0;
        BOOL v19 = +[NUIdentifier identifierWithString:v18 error:&v58];
        id v9 = v58;

        if (!v19)
        {
          uint64_t v21 = +[NUError errorWithCode:1 reason:@"Failed to parse identifier" object:v17 underlyingError:v9];
          BOOL v16 = v9;
          goto LABEL_17;
        }
        [v10 setObject:v19 forKeyedSubscript:v17];

        ++v15;
        BOOL v16 = v9;
        if (v13 == v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v59 objects:v64 count:16];
          id v8 = v56;
          id v7 = v57;
          if (v13) {
            goto LABEL_6;
          }
          goto LABEL_13;
        }
      }
      uint64_t v21 = +[NUError invalidError:@"Not an identifier string" object:v17];
LABEL_17:
      *uint64_t v55 = v21;

      id v20 = 0;
      id v9 = v16;
      id v8 = v56;
      id v7 = v57;
      goto LABEL_18;
    }
LABEL_13:

    id v20 = v10;
LABEL_18:
  }
  else
  {
    +[NUError errorWithCode:2 reason:@"Invalid contents dictionary" object:v7 underlyingError:v9];
    id v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (BOOL)serializeMediaType:(int64_t)a3 intoDictionary:(id)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    uint64_t v12 = NUAssertLogger_16790();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v15 = NUAssertLogger_16790();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        BOOL v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        id v29 = [v27 callStackSymbols];
        BOOL v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v26;
        __int16 v46 = 2114;
        __int16 v47 = v30;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema serializeMediaType:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 297, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"dictionary != nil");
  }
  if (!a5)
  {
    BOOL v19 = NUAssertLogger_16790();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_16790();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        id v38 = [v36 callStackSymbols];
        id v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v35;
        __int16 v46 = 2114;
        __int16 v47 = v39;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      BOOL v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema serializeMediaType:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 298, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  id v8 = v7;
  if (a3)
  {
    if ((unint64_t)a3 > 3) {
      id v9 = @"Invalid";
    }
    else {
      id v9 = off_1E5D94158[a3];
    }
    uint64_t v10 = v9;
    [v8 setObject:v10 forKeyedSubscript:@"media-type"];
  }
  return 1;
}

+ (int64_t)deserializeMediaTypeFromDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v10 = NUAssertLogger_16790();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      id v28 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        id v20 = [v18 callStackSymbols];
        uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v28 = v17;
        __int16 v29 = 2114;
        BOOL v30 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v28 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeMediaTypeFromDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 281, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"dictionary != nil");
  }
  id v5 = v4;
  uint64_t v26 = 0;
  id v6 = [a1 deserializeStringFromDictionary:v4 key:@"media-type" error:&v26];
  id v7 = v6;
  if (v6) {
    int64_t v8 = mediaTypeFromString(v6);
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

+ (id)deserializeIdentifierFromDictionary:(id)a3 error:(id *)a4
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
      uint64_t v49 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger_16790();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        id v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        uint64_t v31 = [v29 callStackSymbols];
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
      id v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeIdentifierFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 246, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    uint64_t v21 = NUAssertLogger_16790();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_16790();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        id v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v38 = (void *)MEMORY[0x1E4F29060];
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
      BOOL v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema deserializeIdentifierFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 247, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v47 = 0;
  int64_t v8 = [a1 deserializeStringFromDictionary:v6 key:@"identifier" error:&v47];
  id v9 = v47;
  if (v8)
  {
    id v46 = 0;
    uint64_t v10 = +[NUIdentifier identifierWithString:v8 error:&v46];
    id v11 = v46;

    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      *a4 = +[NUError failureError:@"Malformed identifier" object:v8];
    }

    id v9 = v11;
  }
  else
  {
    +[NUError errorWithCode:2 reason:@"Invalid identifier" object:v7 underlyingError:v9];
    uint64_t v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)copyItem:(id)a3 schemaIdentifier:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    uint64_t v13 = NUAssertLogger_16790();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      BOOL v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "item != nil");
      *(_DWORD *)buf = 138543362;
      id v46 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v16 = NUAssertLogger_16790();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        BOOL v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        id v30 = [v28 callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v46 = v27;
        __int16 v47 = 2114;
        uint64_t v48 = v31;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      BOOL v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v46 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema copyItem:schemaIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 214, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"item != nil");
  }
  id v7 = v6;
  if (!v6)
  {
    id v20 = NUAssertLogger_16790();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      id v46 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v23 = NUAssertLogger_16790();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24)
      {
        uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        id v39 = [v37 callStackSymbols];
        uint64_t v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v46 = v36;
        __int16 v47 = 2114;
        uint64_t v48 = v40;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      BOOL v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v46 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema copyItem:schemaIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 215, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"identifier != nil");
  }
  int64_t v8 = +[NUSchemaRegistry sharedRegistry];
  id v9 = [v8 schemaWithIdentifier:v7];

  if (v9)
  {
    uint64_t v10 = (void *)[v9 copy:v5];
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_557);
    }
    id v11 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v7;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "failure in [NUSchema copyItem]. identifier \"%@\" not found in schema", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)copyIdentifiableItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = (void *)[a1 copyItem:v4 schemaIdentifier:v5];

  return v6;
}

+ (BOOL)validateIdentifiable:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    BOOL v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "item != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v51 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v20 = NUAssertLogger_16790();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = v31;
        __int16 v52 = 2114;
        uint64_t v53 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v51 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema validateIdentifiable:type:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 178, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"item != nil");
  }
  if (!a5)
  {
    BOOL v24 = NUAssertLogger_16790();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      BOOL v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v51 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v27 = NUAssertLogger_16790();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = v40;
        __int16 v52 = 2114;
        uint64_t v53 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      id v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v51 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema validateIdentifiable:type:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 179, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  int64_t v8 = v7;
  id v9 = +[NUSchemaRegistry sharedRegistry];
  uint64_t v10 = [v8 identifier];
  id v11 = [v9 schemaWithIdentifier:v10];

  if (v11)
  {
    if ([v11 type] == a4)
    {
      id v49 = 0;
      if ([v11 validate:v8 error:&v49])
      {
        BOOL v12 = 1;
      }
      else
      {
        id v14 = v49;
        id v15 = +[NUError errorWithCode:2 reason:@"Failed to validate item" object:v8 underlyingError:v14];

        BOOL v12 = 0;
        *a5 = v15;
      }
    }
    else
    {
      +[NUError mismatchError:@"Wrong schema type" object:v8];
      BOOL v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v13 = [v8 identifier];
    *a5 = +[NUError unknownError:@"Unknown schema identifier" object:v13];

    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)validateIdentifiable:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = NUAssertLogger_16790();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      id v42 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v12 = NUAssertLogger_16790();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        uint64_t v26 = [v24 callStackSymbols];
        BOOL v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v42 = v23;
        __int16 v43 = 2114;
        uint64_t v44 = v27;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v42 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema validateIdentifiable:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 164, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    BOOL v16 = NUAssertLogger_16790();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v42 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v19 = NUAssertLogger_16790();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        uint64_t v35 = [v33 callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v42 = v32;
        __int16 v43 = 2114;
        uint64_t v44 = v36;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v42 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema validateIdentifiable:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 165, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  char v7 = [v5 conformsToProtocol:&unk_1F004E6F0];
  if ((v7 & 1) == 0)
  {
    *a4 = +[NUError mismatchError:@"Object is not identifiable" object:v6];
  }

  return v7;
}

+ (int64_t)schemaTypeFromString:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = NUAssertLogger_16790();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "string != nil");
      *(_DWORD *)buf = 138543362;
      id v42 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v12 = NUAssertLogger_16790();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        uint64_t v26 = [v24 callStackSymbols];
        BOOL v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v42 = v23;
        __int16 v43 = 2114;
        uint64_t v44 = v27;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v42 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema schemaTypeFromString:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 121, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"string != nil");
  }
  if (!a4)
  {
    BOOL v16 = NUAssertLogger_16790();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v42 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v19 = NUAssertLogger_16790();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        uint64_t v35 = [v33 callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v42 = v32;
        __int16 v43 = 2114;
        uint64_t v44 = v36;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v42 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema schemaTypeFromString:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 122, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  if ([v5 isEqualToString:@"Adjustment"])
  {
    int64_t v7 = 1;
  }
  else if ([v6 isEqualToString:@"Composition"])
  {
    int64_t v7 = 4;
  }
  else if ([v6 isEqualToString:@"Source"])
  {
    int64_t v7 = 3;
  }
  else if ([v6 isEqualToString:@"Array"])
  {
    int64_t v7 = 2;
  }
  else
  {
    +[NUError unknownError:@"Unknown schema type" object:v6];
    int64_t v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (BOOL)validateSchemaType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[NUModel validateString:v6 error:a4]) {
    BOOL v7 = [a1 schemaTypeFromString:v6 error:a4] != 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)validateSchemaIdentifier:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v15 = NUAssertLogger_16790();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v18 = NUAssertLogger_16790();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        uint64_t v32 = [v30 callStackSymbols];
        id v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v29;
        __int16 v49 = 2114;
        __int16 v50 = v33;
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
    _NUAssertFailHandler((uint64_t)"+[NUSchema validateSchemaIdentifier:type:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 84, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"identifier != nil");
  }
  if (!a5)
  {
    uint64_t v22 = NUAssertLogger_16790();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v25 = NUAssertLogger_16790();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        uint64_t v41 = [v39 callStackSymbols];
        id v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v38;
        __int16 v49 = 2114;
        __int16 v50 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      BOOL v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSchema validateSchemaIdentifier:type:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 85, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  int64_t v8 = v7;
  id v9 = +[NUSchemaRegistry sharedRegistry];
  uint64_t v10 = [v9 schemaWithIdentifier:v8];
  id v11 = v10;
  if (!v10)
  {
    BOOL v13 = +[NUError unknownError:@"Unknown schema" object:v8];
LABEL_9:
    BOOL v12 = 0;
    *a5 = v13;
    goto LABEL_10;
  }
  if (a4 && [v10 type] != a4)
  {
    BOOL v13 = +[NUError mismatchError:@"Wrong schema type" object:v8];
    goto LABEL_9;
  }
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

+ (id)reservedPropertyNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__NUSchema_reservedPropertyNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reservedPropertyNames_onceToken_17332 != -1) {
    dispatch_once(&reservedPropertyNames_onceToken_17332, block);
  }
  v2 = (void *)reservedPropertyNames_names_17333;

  return v2;
}

void __33__NUSchema_reservedPropertyNames__block_invoke(uint64_t a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"identifier";
  v7[1] = @"media-type";
  v7[2] = @"contents";
  v7[3] = @"settings";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___NUSchema;
  unint64_t v3 = objc_msgSendSuper2(&v6, sel_reservedPropertyNames);
  uint64_t v4 = [v3 setByAddingObjectsFromArray:v2];
  id v5 = (void *)reservedPropertyNames_names_17333;
  reservedPropertyNames_names_17333 = v4;
}

@end