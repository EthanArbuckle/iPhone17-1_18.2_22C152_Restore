@interface NUArraySchema
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
+ (id)deserializePatternFromDictionary:(id)a3 error:(id *)a4;
+ (id)supportedAttributes;
+ (int64_t)deserializeContentTypeFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)isValid:(id *)a3;
- (BOOL)itemIsResolved:(id)a3;
- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)validate:(id)a3 error:(id *)a4;
- (BOOL)validateArray:(id)a3 error:(id *)a4;
- (BOOL)validateArrayContents:(id)a3 error:(id *)a4;
- (BOOL)validateArrayOrder:(id)a3 error:(id *)a4;
- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)validateAttributes:(id *)a3;
- (BOOL)validateContents:(id *)a3;
- (BOOL)validateDefaultArray:(id)a3 error:(id *)a4;
- (NSArray)defaultArray;
- (NSDictionary)contents;
- (NUArraySchema)initWithIdentifier:(id)a3 attributes:(id)a4;
- (NUArraySchema)initWithIdentifier:(id)a3 contentType:(int64_t)a4 contents:(id)a5 pattern:(id)a6 attributes:(id)a7;
- (NUPattern)pattern;
- (id)copy:(id)a3;
- (id)copyArray:(id)a3;
- (id)deserialize:(id)a3 error:(id *)a4;
- (id)deserializeArray:(id)a3 error:(id *)a4;
- (id)schemaDependencies;
- (id)serialize:(id)a3 error:(id *)a4;
- (id)serializeArray:(id)a3 error:(id *)a4;
- (int64_t)contentType;
- (int64_t)type;
@end

@implementation NUArraySchema

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_identifierToAlias, 0);

  objc_storeStrong((id *)&self->_aliasToIdentifier, 0);
}

- (NUPattern)pattern
{
  return self->_pattern;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (NSDictionary)contents
{
  return self->_aliasToIdentifier;
}

- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = NUAssertLogger_16790();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[object isKindOfClass:NSArray.class]");
      *(_DWORD *)buf = 138543362;
      v47 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v26 = NUAssertLogger_16790();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v30;
        __int16 v48 = 2114;
        v49 = v34;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema resolveItem:resolver:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1493, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"[object isKindOfClass:NSArray.class]");
  }
  v9 = +[NUSchemaRegistry sharedRegistry];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v39 = a5;
    uint64_t v13 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v16 = [v15 identifier];
        v17 = [v9 schemaWithIdentifier:v16];

        id v40 = 0;
        char v18 = [v17 resolveItem:v15 resolver:v8 error:&v40];
        id v19 = v40;
        v20 = v19;
        if ((v18 & 1) == 0)
        {
          id *v39 = +[NUError errorWithCode:1 reason:@"Failed to resolve array contents" object:v15 underlyingError:v19];

          BOOL v21 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v21 = 1;
LABEL_12:

  return v21;
}

- (BOOL)itemIsResolved:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = NUAssertLogger_16790();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[object isKindOfClass:NSArray.class]");
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v18 = NUAssertLogger_16790();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v22;
        __int16 v38 = 2114;
        v39 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema itemIsResolved:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1479, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"[object isKindOfClass:NSArray.class]");
  }
  v4 = +[NUSchemaRegistry sharedRegistry];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        uint64_t v12 = [v4 schemaWithIdentifier:v11];

        LODWORD(v10) = [v12 itemIsResolved:v10];
        if (!v10)
        {
          BOOL v13 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (id)schemaDependencies
{
  return [(NSDictionary *)self->_aliasToIdentifier allValues];
}

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    BOOL v21 = NUAssertLogger_16790();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v63 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v24 = NUAssertLogger_16790();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        long long v31 = [v29 callStackSymbols];
        long long v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = v28;
        __int16 v64 = 2114;
        v65 = v32;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema serializeIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1327, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"error != NULL");
  }
  v54 = a4;
  v55 = v6;
  [v6 setObject:@"Array" forKeyedSubscript:@"isa"];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_aliasToIdentifier, "count"));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v8 = self->_aliasToIdentifier;
  uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        v14 = [(NSDictionary *)self->_aliasToIdentifier objectForKeyedSubscript:v13];
        v15 = [v14 stringRepresentation];
        [v7 setObject:v15 forKeyedSubscript:v13];
      }
      uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v10);
  }

  [v55 setObject:v7 forKeyedSubscript:@"contents"];
  v16 = [(NUArraySchema *)self pattern];
  v17 = [v16 stringRepresentation];
  [v55 setObject:v17 forKeyedSubscript:@"pattern"];

  switch([(NUArraySchema *)self contentType])
  {
    case 0:
      uint64_t v37 = NUAssertLogger_16790();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v38 = [NSString stringWithFormat:@"Invalid content type"];
        *(_DWORD *)buf = 138543362;
        v63 = v38;
        _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v40 = NUAssertLogger_16790();
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
      if (v39)
      {
        if (v41)
        {
          long long v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v45 = (void *)MEMORY[0x1E4F29060];
          id v46 = v44;
          v47 = [v45 callStackSymbols];
          __int16 v48 = [v47 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v63 = v44;
          __int16 v64 = 2114;
          v65 = v48;
          _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v41)
      {
        long long v42 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v63 = v43;
        _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUArraySchema serializeIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1361, @"Invalid content type", v49, v50, v51, v52, v53);
    case 1:
      char v18 = @"Adjustment";
      break;
    case 2:
      char v18 = @"Array";
      break;
    case 3:
      char v18 = @"Source";
      break;
    case 4:
      char v18 = @"Composition";
      break;
    default:
      char v18 = 0;
      break;
  }
  [v55 setObject:v18 forKeyedSubscript:@"content-type"];
  v56.receiver = self;
  v56.super_class = (Class)NUArraySchema;
  BOOL v19 = [(NUSchema *)&v56 serializeIntoDictionary:v55 error:v54];

  return v19;
}

- (id)deserializeArray:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v21 = NUAssertLogger_16790();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "array != nil");
      *(_DWORD *)buf = 138543362;
      v62 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v24 = NUAssertLogger_16790();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        __int16 v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v35;
        __int16 v63 = 2114;
        __int16 v64 = v39;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema deserializeArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1295, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"array != nil");
  }
  if (!a4)
  {
    uint64_t v28 = NUAssertLogger_16790();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v62 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v31 = NUAssertLogger_16790();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        long long v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v47 = [v45 callStackSymbols];
        __int16 v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v44;
        __int16 v63 = 2114;
        __int16 v64 = v48;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema deserializeArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1296, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  uint64_t v53 = self;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        id v55 = 0;
        v15 = +[NUSchema deserializeIdentifiableItem:v14 error:&v55];
        id v16 = v55;
        if (!v15)
        {
          *a4 = +[NUError errorWithCode:1 reason:@"Failed to deserialize item" object:v14 underlyingError:v16];

          id v17 = 0;
          goto LABEL_15;
        }
        [v8 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v54 = 0;
  if ([(NUArraySchema *)v53 validateArrayOrder:v8 error:&v54])
  {
    id v17 = v8;
  }
  else
  {
    id v18 = v54;
    id v19 = +[NUError errorWithCode:2 reason:@"Invalid array order" object:v9 underlyingError:v18];

    id v17 = 0;
    *a4 = v19;
  }
LABEL_15:

  return v17;
}

- (id)serializeArray:(id)a3 error:(id *)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v21 = NUAssertLogger_16790();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "array != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v63 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v24 = NUAssertLogger_16790();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        __int16 v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v63 = v35;
        __int16 v64 = 2114;
        uint64_t v65 = v39;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v63 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema serializeArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1264, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"array != nil");
  }
  if (!a4)
  {
    uint64_t v28 = NUAssertLogger_16790();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      __int16 v63 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v31 = NUAssertLogger_16790();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        long long v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v47 = [v45 callStackSymbols];
        __int16 v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v63 = v44;
        __int16 v64 = 2114;
        uint64_t v65 = v48;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v63 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema serializeArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1265, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  id v60 = 0;
  BOOL v8 = [(NUArraySchema *)self validateArrayOrder:v6 error:&v60];
  id v9 = v60;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v54 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v53 = a4;
      uint64_t v14 = *(void *)v57;
      while (2)
      {
        uint64_t v15 = 0;
        id v16 = v9;
        do
        {
          if (*(void *)v57 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v56 + 1) + 8 * v15);
          id v55 = 0;
          id v18 = +[NUSchema serializeIdentifiableItem:v17 error:&v55];
          id v9 = v55;

          if (!v18)
          {
            *uint64_t v53 = +[NUError errorWithCode:1 reason:@"Failed to serialize item" object:v17 underlyingError:v9];

            id v19 = 0;
            goto LABEL_15;
          }
          [v10 addObject:v18];

          ++v15;
          id v16 = v9;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v56 objects:v61 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v19 = v10;
LABEL_15:

    uint64_t v7 = v54;
  }
  else
  {
    +[NUError errorWithCode:2 reason:@"Invalid array order" object:v7 underlyingError:v9];
    id v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)deserialize:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = NUAssertLogger_16790();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        id v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v24;
        __int16 v44 = 2114;
        v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1250, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    uint64_t v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_16790();
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
        v45 = v37;
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
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1251, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUArraySchema *)self deserializeArray:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not an array" object:v7];
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
    uint64_t v10 = NUAssertLogger_16790();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        id v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v24;
        __int16 v44 = 2114;
        v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1236, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    uint64_t v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_16790();
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
        v45 = v37;
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
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1237, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUArraySchema *)self serializeArray:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not an array" object:v7];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)copyArray:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v18 = NUAssertLogger_16790();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "array != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v21 = NUAssertLogger_16790();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        BOOL v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v28 = [v26 callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v40 = v25;
        __int16 v41 = 2114;
        uint64_t v42 = v29;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema copyArray:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1208, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"array != nil");
  }
  v4 = v3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v35 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
      if (([v11 conformsToProtocol:&unk_1F004E6F0] & 1) == 0) {
        break;
      }
      id v12 = +[NUSchema copyIdentifiableItem:v11];
      if (!v12)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_557);
        }
        uint64_t v15 = _NULogger;
        if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v11;
        id v16 = "failure in [NUArraySchema copyArray]. could not copy sub object: %@";
LABEL_22:
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
LABEL_19:

        id v14 = 0;
        goto LABEL_20;
      }
      uint64_t v13 = v12;
      [v5 addObject:v12];

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_11;
      }
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_557);
    }
    uint64_t v15 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = v11;
    id v16 = "failure in [NUArraySchema copyArray]. object does not conform to NUIdentifiable: %@";
    goto LABEL_22;
  }
LABEL_11:

  id v14 = v5;
LABEL_20:

  return v14;
}

- (id)copy:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v9 = NUAssertLogger_16790();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      id v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v12 = NUAssertLogger_16790();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        id v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        id v19 = [v17 callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v26 = v16;
        __int16 v27 = 2114;
        uint64_t v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema copy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1195, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"object != nil");
  }
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(NUArraySchema *)self copyArray:v5];
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_557);
    }
    uint64_t v7 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "failure in [NUArraySchema copy]. object is not of type NSArray: %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (NSArray)defaultArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDictionary *)self->super.super._attributes objectForKeyedSubscript:@"default"];
  if (!v3)
  {
    id v4 = [(NUArraySchema *)self pattern];
    id v3 = [v4 shortestMatch];
  }
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[NSDictionary objectForKeyedSubscript:](self->_aliasToIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (BOOL)validateArrayContents:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        int64_t v12 = [(NUArraySchema *)self contentType];
        id v18 = 0;
        BOOL v13 = +[NUSchema validateIdentifiable:v11 type:v12 error:&v18];
        id v14 = v18;
        long long v15 = v14;
        if (!v13)
        {
          *a4 = +[NUError errorWithCode:2 reason:@"Not a valid item" object:v11 underlyingError:v14];

          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

- (BOOL)validateArrayOrder:(id)a3 error:(id *)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v25 = NUAssertLogger_16790();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "array != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v28 = NUAssertLogger_16790();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        uint64_t v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        uint64_t v42 = [v40 callStackSymbols];
        uint64_t v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v65 = v39;
        __int16 v66 = 2114;
        v67 = v43;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema validateArrayOrder:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1119, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"array != nil");
  }
  if (!a4)
  {
    uint64_t v32 = NUAssertLogger_16790();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v35 = NUAssertLogger_16790();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        __int16 v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        uint64_t v51 = [v49 callStackSymbols];
        uint64_t v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v65 = v48;
        __int16 v66 = 2114;
        v67 = v52;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      long long v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema validateArrayOrder:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1120, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  long long v57 = a4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v60;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v60 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v59 + 1) + 8 * v13);
      id v58 = 0;
      BOOL v15 = +[NUSchema validateIdentifiable:v14 error:&v58];
      id v16 = v58;
      if (!v15) {
        break;
      }
      id v17 = v14;
      identifierToAlias = self->_identifierToAlias;
      long long v19 = [v17 identifier];
      long long v20 = [(NSDictionary *)identifierToAlias objectForKeyedSubscript:v19];

      if (!v20)
      {
        *long long v57 = +[NUError unknownError:@"Unknown item identifier (no mapping for the given identifier)" object:v17];

        goto LABEL_16;
      }
      [v8 addObject:v20];

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v59 objects:v63 count:16];
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    *long long v57 = +[NUError errorWithCode:2 reason:@"Not a valid item" object:v14 underlyingError:v16];
LABEL_16:

    BOOL v23 = 0;
    goto LABEL_18;
  }
LABEL_12:

  long long v21 = [(NUArraySchema *)self pattern];
  char v22 = [v21 match:v8];

  if (v22)
  {
    BOOL v23 = 1;
  }
  else
  {
    +[NUError mismatchError:@"Pattern does not match" object:v8];
    BOOL v23 = 0;
    *long long v57 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:

  return v23;
}

- (BOOL)validateArray:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v15 = NUAssertLogger_16790();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "array != nil");
      *(_DWORD *)buf = 138543362;
      id v50 = v16;
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
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v50 = v29;
        __int16 v51 = 2114;
        uint64_t v52 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      long long v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v50 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema validateArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1098, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"array != nil");
  }
  if (!a4)
  {
    char v22 = NUAssertLogger_16790();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v25 = NUAssertLogger_16790();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        id v41 = [v39 callStackSymbols];
        uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v50 = v38;
        __int16 v51 = 2114;
        uint64_t v52 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      __int16 v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v50 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema validateArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1099, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  id v48 = 0;
  BOOL v8 = [(NUArraySchema *)self validateArrayOrder:v6 error:&v48];
  id v9 = v48;
  if (!v8)
  {
    uint64_t v13 = +[NUError errorWithCode:2 reason:@"Invalid array order" object:v7 underlyingError:v9];
    id v11 = v9;
LABEL_8:
    BOOL v12 = 0;
    *a4 = v13;
    goto LABEL_9;
  }
  id v47 = 0;
  BOOL v10 = [(NUArraySchema *)self validateArrayContents:v7 error:&v47];
  id v11 = v47;

  if (!v10)
  {
    uint64_t v13 = +[NUError errorWithCode:2 reason:@"Invalid array contents" object:v7 underlyingError:v11];
    goto LABEL_8;
  }
  BOOL v12 = 1;
LABEL_9:

  return v12;
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
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        __int16 v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
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
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1084, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
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
    BOOL v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v20 = NUAssertLogger_16790();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
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
      char v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1085, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUArraySchema *)self validateArray:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not an array" object:v7];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)validateContents:(id *)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v29 = NUAssertLogger_16790();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v61 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v32 = NUAssertLogger_16790();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        uint64_t v39 = [v37 callStackSymbols];
        uint64_t v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v61 = v36;
        __int16 v62 = 2114;
        __int16 v63 = v40;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      uint64_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v61 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema validateContents:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1038, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"error != NULL");
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v5 = self->_aliasToIdentifier;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v54;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = [(NSDictionary *)self->_aliasToIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v53 + 1) + 8 * i)];
        BOOL v11 = +[NUSchema validateSchemaIdentifier:v10 type:[(NUArraySchema *)self contentType] error:a3];

        if (!v11)
        {
LABEL_30:
          BOOL v27 = 0;
          goto LABEL_31;
        }
      }
      uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = [(NUArraySchema *)self pattern];
  uint64_t v13 = [v12 tokens];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v5 = v13;
  uint64_t v14 = [(NSDictionary *)v5 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v50;
    while (2)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(v5);
        }
        uint64_t v18 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        BOOL v19 = [(NSDictionary *)self->_aliasToIdentifier objectForKeyedSubscript:v18];

        if (!v19)
        {
          *a3 = +[NUError unknownError:@"Unknown alias" object:v18];

          goto LABEL_30;
        }
      }
      uint64_t v15 = [(NSDictionary *)v5 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v20 = self->_aliasToIdentifier;
  uint64_t v21 = [(NSDictionary *)v20 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v46;
    while (2)
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * k);
        if (([(NSDictionary *)v5 containsObject:v25] & 1) == 0)
        {
          *a3 = +[NUError missingError:@"Alias not in pattern" object:v25];

          goto LABEL_30;
        }
      }
      uint64_t v22 = [(NSDictionary *)v20 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  NSUInteger v26 = [(NSDictionary *)self->_aliasToIdentifier count];
  if (v26 == [(NSDictionary *)self->_identifierToAlias count])
  {
    BOOL v27 = 1;
  }
  else
  {
    +[NUError invalidError:@"Duplicate identifiers" object:self->_aliasToIdentifier];
    BOOL v27 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_31:

  return v27;
}

- (BOOL)validateDefaultArray:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v12 = NUAssertLogger_16790();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
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
        NSUInteger v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        uint64_t v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v45 = v26;
        __int16 v46 = 2114;
        long long v47 = v30;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v45 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema validateDefaultArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1018, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    BOOL v19 = NUAssertLogger_16790();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v45 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_16790();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        id v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        id v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v45 = v35;
        __int16 v46 = 2114;
        long long v47 = v39;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v45 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema validateDefaultArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1019, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  if (+[NUModel validateStringArray:v6 error:a4])
  {
    uint64_t v8 = [(NUArraySchema *)self pattern];
    char v9 = [v8 match:v7];

    if (v9)
    {
      BOOL v10 = 1;
    }
    else
    {
      +[NUError invalidError:@"Invalid default array" object:v7];
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"default"])
  {
    unsigned __int8 v10 = [(NUArraySchema *)self validateDefaultArray:v9 error:a5];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NUArraySchema;
    unsigned __int8 v10 = [(NUModel *)&v13 validateAttribute:v8 value:v9 error:a5];
  }
  BOOL v11 = v10;

  return v11;
}

- (BOOL)validateAttributes:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v9 = NUAssertLogger_16790();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v28 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v12 = NUAssertLogger_16790();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        BOOL v19 = [v17 callStackSymbols];
        long long v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v28 = v16;
        __int16 v29 = 2114;
        uint64_t v30 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v28 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema validateAttributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 987, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  v26.receiver = self;
  v26.super_class = (Class)NUArraySchema;
  BOOL v5 = -[NUModel validateAttributes:](&v26, sel_validateAttributes_);
  if (v5)
  {
    id v6 = [(NUArraySchema *)self pattern];
    if ([v6 isFixedOrder])
    {

LABEL_6:
      LOBYTE(v5) = 1;
      return v5;
    }
    uint64_t v7 = [(NSDictionary *)self->super.super._attributes objectForKeyedSubscript:@"default"];

    if (v7) {
      goto LABEL_6;
    }
    id v8 = +[NUError missingError:@"Missing default array" object:self->super.super._attributes];
    LOBYTE(v5) = 0;
    *a3 = v8;
  }
  return v5;
}

- (BOOL)isValid:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v12 = NUAssertLogger_16790();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v15 = NUAssertLogger_16790();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        BOOL v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        uint64_t v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v19;
        __int16 v32 = 2114;
        uint64_t v33 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema isValid:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 961, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"error != NULL");
  }
  id v29 = 0;
  BOOL v5 = [(NUArraySchema *)self validateAttributes:&v29];
  id v6 = v29;
  if (!v5)
  {
    unsigned __int8 v10 = +[NUError errorWithCode:2 reason:@"Invalid attributes" object:self underlyingError:v6];
    id v8 = v6;
LABEL_7:
    BOOL v9 = 0;
    *a3 = v10;
    goto LABEL_8;
  }
  id v28 = 0;
  BOOL v7 = [(NUArraySchema *)self validateContents:&v28];
  id v8 = v28;

  if (!v7)
  {
    unsigned __int8 v10 = +[NUError errorWithCode:2 reason:@"Invalid contents" object:self underlyingError:v8];
    goto LABEL_7;
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (NUArraySchema)initWithIdentifier:(id)a3 contentType:(int64_t)a4 contents:(id)a5 pattern:(id)a6 attributes:(id)a7
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = (NUPattern *)a6;
  id v15 = a7;
  if (!v13)
  {
    __int16 v32 = NUAssertLogger_16790();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "contents != nil");
      *(_DWORD *)buf = 138543362;
      v89 = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v35 = NUAssertLogger_16790();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        long long v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        long long v56 = [v54 callStackSymbols];
        long long v57 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v89 = v53;
        __int16 v90 = 2114;
        v91 = v57;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      id v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v89 = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema initWithIdentifier:contentType:contents:pattern:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 936, @"Invalid parameter not satisfying: %s", v58, v59, v60, v61, (uint64_t)"contents != nil");
  }
  if (!v14)
  {
    uint64_t v39 = NUAssertLogger_16790();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pattern != nil");
      *(_DWORD *)buf = 138543362;
      v89 = v40;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v42 = NUAssertLogger_16790();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (v41)
    {
      if (v43)
      {
        __int16 v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v63 = (void *)MEMORY[0x1E4F29060];
        id v64 = v62;
        uint64_t v65 = [v63 callStackSymbols];
        __int16 v66 = [v65 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v89 = v62;
        __int16 v90 = 2114;
        v91 = v66;
        _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v43)
    {
      uint64_t v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v89 = v45;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema initWithIdentifier:contentType:contents:pattern:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 937, @"Invalid parameter not satisfying: %s", v67, v68, v69, v70, (uint64_t)"pattern != nil");
  }
  if (!a4)
  {
    __int16 v46 = NUAssertLogger_16790();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      long long v47 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "contentType != NUSchemaTypeUnknown");
      *(_DWORD *)buf = 138543362;
      v89 = v47;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v49 = NUAssertLogger_16790();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v71 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v72 = (void *)MEMORY[0x1E4F29060];
        id v73 = v71;
        v74 = [v72 callStackSymbols];
        v75 = [v74 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v89 = v71;
        __int16 v90 = 2114;
        v91 = v75;
        _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v50)
    {
      long long v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v52 = [v51 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v89 = v52;
      _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUArraySchema initWithIdentifier:contentType:contents:pattern:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 938, @"Invalid parameter not satisfying: %s", v76, v77, v78, v79, (uint64_t)"contentType != NUSchemaTypeUnknown");
  }
  BOOL v16 = v15;
  int64_t v80 = a4;
  v81 = v12;
  v86.receiver = self;
  v86.super_class = (Class)NUArraySchema;
  id v17 = [(NUSchema *)&v86 initWithIdentifier:v12 attributes:v15];
  id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v19 = v13;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v82 objects:v87 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v83 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v82 + 1) + 8 * i);
        uint64_t v25 = [v19 objectForKeyedSubscript:v24];
        [v18 setObject:v24 forKeyedSubscript:v25];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v82 objects:v87 count:16];
    }
    while (v21);
  }

  uint64_t v26 = [v19 copy];
  aliasToIdentifier = v17->_aliasToIdentifier;
  v17->_aliasToIdentifier = (NSDictionary *)v26;

  uint64_t v28 = [v18 copy];
  identifierToAlias = v17->_identifierToAlias;
  v17->_identifierToAlias = (NSDictionary *)v28;

  v17->_contentType = v80;
  pattern = v17->_pattern;
  v17->_pattern = v14;

  return v17;
}

- (NUArraySchema)initWithIdentifier:(id)a3 attributes:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16761);
  }
  id v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    BOOL v9 = NSString;
    unsigned __int8 v10 = v8;
    BOOL v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
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
    id v17 = (void *)MEMORY[0x1E4F29060];
    id v18 = v16;
    id v19 = [v17 callStackSymbols];
    uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
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
  BOOL v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUArraySchema initWithIdentifier:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 931, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- (int64_t)type
{
  return 2;
}

+ (id)deserializePatternFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v13 = NUAssertLogger_16790();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v16 = NUAssertLogger_16790();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        uint64_t v30 = [v28 callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v27;
        __int16 v49 = 2114;
        BOOL v50 = v31;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUArraySchema deserializePatternFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1451, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    uint64_t v20 = NUAssertLogger_16790();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v23 = NUAssertLogger_16790();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24)
      {
        BOOL v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        uint64_t v39 = [v37 callStackSymbols];
        uint64_t v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v36;
        __int16 v49 = 2114;
        BOOL v50 = v40;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUArraySchema deserializePatternFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1452, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  id v46 = 0;
  id v7 = +[NUModel deserializeStringFromDictionary:v5 key:@"pattern" error:&v46];
  id v8 = v46;
  if (v7)
  {
    id v45 = 0;
    BOOL v9 = +[NUPattern patternWithString:v7 error:&v45];
    id v10 = v45;

    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      *a4 = +[NUError errorWithCode:2 reason:@"Failed to parse pattern" object:v7 underlyingError:v10];
    }
  }
  else
  {
    +[NUError errorWithCode:2 reason:@"Invalid pattern" object:v6 underlyingError:v8];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v8;
  }

  return v9;
}

+ (int64_t)deserializeContentTypeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v12 = NUAssertLogger_16790();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      id v46 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v15 = NUAssertLogger_16790();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        id v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v46 = v26;
        __int16 v47 = 2114;
        uint64_t v48 = v30;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      BOOL v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v46 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUArraySchema deserializeContentTypeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1415, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    id v19 = NUAssertLogger_16790();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v46 = v20;
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
        BOOL v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        id v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v46 = v35;
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
      id v46 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUArraySchema deserializeContentTypeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1416, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  id v44 = 0;
  id v7 = +[NUModel deserializeStringFromDictionary:v5 key:@"content-type" error:&v44];
  id v8 = v44;
  if (!v7)
  {
    id v10 = +[NUError errorWithCode:2 reason:@"Invalid content type" object:v6 underlyingError:v8];
LABEL_7:
    int64_t v9 = 0;
    *a4 = v10;
    goto LABEL_14;
  }
  if (([v7 isEqualToString:@"Adjustment"] & 1) == 0)
  {
    if ([v7 isEqualToString:@"Source"])
    {
      int64_t v9 = 3;
      goto LABEL_14;
    }
    if ([v7 isEqualToString:@"Array"])
    {
      int64_t v9 = 2;
      goto LABEL_14;
    }
    if ([v7 isEqualToString:@"Composition"])
    {
      int64_t v9 = 4;
      goto LABEL_14;
    }
    id v10 = +[NUError unknownError:@"Unknown content type" object:v7];
    goto LABEL_7;
  }
  int64_t v9 = 1;
LABEL_14:

  return v9;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v18 = NUAssertLogger_16790();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      id v55 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_16790();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        uint64_t v35 = [v33 callStackSymbols];
        BOOL v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v55 = v32;
        __int16 v56 = 2114;
        long long v57 = v36;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      BOOL v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v55 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUArraySchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1371, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    uint64_t v25 = NUAssertLogger_16790();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v55 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v28 = NUAssertLogger_16790();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        uint64_t v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        id v44 = [v42 callStackSymbols];
        id v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v55 = v41;
        __int16 v56 = 2114;
        long long v57 = v45;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v55 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUArraySchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1372, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v53 = 0;
  id v8 = [a1 deserializeIdentifierFromDictionary:v6 error:&v53];
  id v9 = v53;
  if (v8)
  {
    id v52 = 0;
    uint64_t v10 = [a1 deserializeContentTypeFromDictionary:v7 error:&v52];
    id v11 = v52;

    if (v10)
    {
      id v51 = 0;
      id v12 = [a1 deserializeContentsFromDictionary:v7 error:&v51];
      id v13 = v51;

      if (v12)
      {
        id v50 = 0;
        uint64_t v14 = [a1 deserializePatternFromDictionary:v7 error:&v50];
        id v9 = v50;

        if (v14)
        {
          id v15 = objc_alloc((Class)a1);
          BOOL v16 = (void *)[v15 initWithIdentifier:v8 contentType:v10 contents:v12 pattern:v14 attributes:MEMORY[0x1E4F1CC08]];
        }
        else
        {
          +[NUError errorWithCode:1 reason:@"Failed to deserialize array pattern" object:v7 underlyingError:v9];
          BOOL v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        +[NUError errorWithCode:1 reason:@"Failed to deserialize array contents" object:v7 underlyingError:v13];
        BOOL v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        id v9 = v13;
      }
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to deserialize content type" object:v7 underlyingError:v11];
      BOOL v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = v11;
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to deserialize array identifier" object:v7 underlyingError:v9];
    BOOL v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)supportedAttributes
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NUArraySchema;
  v2 = objc_msgSendSuper2(&v6, sel_supportedAttributes);
  v7[0] = @"default";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

@end