@interface NUCompositionSchema
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
+ (id)supportedAttributes;
- (BOOL)deserializeContents:(id)a3 fromDictionary:(id)a4 error:(id *)a5;
- (BOOL)isValid:(id *)a3;
- (BOOL)itemIsResolved:(id)a3;
- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5;
- (BOOL)serializeContents:(id)a3 intoDictionary:(id)a4 error:(id *)a5;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)validate:(id)a3 error:(id *)a4;
- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)validateComposition:(id)a3 error:(id *)a4;
- (BOOL)validateContents:(id *)a3;
- (BOOL)validateContents:(id)a3 error:(id *)a4;
- (BOOL)validatePropertyArray:(id)a3 error:(id *)a4;
- (NSDictionary)contents;
- (NSSet)requiredContents;
- (NUCompositionSchema)initWithIdentifier:(id)a3 attributes:(id)a4;
- (NUCompositionSchema)initWithIdentifier:(id)a3 contents:(id)a4 attributes:(id)a5;
- (id)copy:(id)a3;
- (id)copyComposition:(id)a3;
- (id)deserialize:(id)a3 error:(id *)a4;
- (id)deserializeComposition:(id)a3 error:(id *)a4;
- (id)modelForProperty:(id)a3;
- (id)schemaDependencies;
- (id)serialize:(id)a3 error:(id *)a4;
- (id)serializeComposition:(id)a3 error:(id *)a4;
- (int64_t)type;
@end

@implementation NUCompositionSchema

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);

  objc_storeStrong((id *)&self->_requiredContents, 0);
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v44 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = NUAssertLogger_16790();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[object isKindOfClass:NUComposition.class]");
      *(_DWORD *)buf = 138543362;
      v52 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_16790();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v52 = v32;
        __int16 v53 = 2114;
        v54 = v36;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v52 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema resolveItem:resolver:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2391, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"[object isKindOfClass:NUComposition.class]");
  }
  id v9 = v8;
  +[NUSchemaRegistry sharedRegistry];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v43 = long long v49 = 0u;
  obj = self->_contents;
  uint64_t v10 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v41 = a5;
    uint64_t v12 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v15 = [v9 objectForKeyedSubscript:v14];
        if (v15)
        {
          v16 = (void *)v15;
          v17 = self;
          v18 = [(NSDictionary *)self->_contents objectForKeyedSubscript:v14];
          v19 = [v43 schemaWithIdentifier:v18];
          id v45 = 0;
          char v20 = [v19 resolveItem:v16 resolver:v44 error:&v45];
          id v21 = v45;
          v22 = v21;
          if ((v20 & 1) == 0)
          {
            id *v41 = +[NUError errorWithCode:1 reason:@"Failed to resolve composition contents" object:v16 underlyingError:v21];

            BOOL v23 = 0;
            goto LABEL_14;
          }

          self = v17;
        }
      }
      uint64_t v11 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v23 = 1;
LABEL_14:

  return v23;
}

- (BOOL)itemIsResolved:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[object isKindOfClass:NUComposition.class]");
      *(_DWORD *)buf = 138543362;
      v41 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v20 = NUAssertLogger_16790();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v41 = v24;
        __int16 v42 = 2114;
        v43 = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema itemIsResolved:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2371, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"[object isKindOfClass:NUComposition.class]");
  }
  id v5 = v4;
  id v34 = +[NUSchemaRegistry sharedRegistry];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obj = self->_contents;
  uint64_t v6 = [(NSDictionary *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        if (v11)
        {
          uint64_t v12 = [(NSDictionary *)self->_contents objectForKeyedSubscript:v10];
          v13 = [v34 schemaWithIdentifier:v12];
          char v14 = [v13 itemIsResolved:v11];

          if ((v14 & 1) == 0)
          {

            BOOL v15 = 0;
            goto LABEL_13;
          }
        }
      }
      uint64_t v7 = [(NSDictionary *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_13:

  return v15;
}

- (id)schemaDependencies
{
  return [(NSDictionary *)self->_contents allValues];
}

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v19 = NUAssertLogger_16790();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      char v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_16790();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        id v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        uint64_t v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v26;
        __int16 v45 = 2114;
        long long v46 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2306, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"error != NULL");
  }
  long long v35 = a4;
  long long v36 = v6;
  [v6 setObject:@"Composition" forKeyedSubscript:@"isa"];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_contents, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v8 = self->_contents;
  uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        char v14 = [(NSDictionary *)self->_contents objectForKeyedSubscript:v13];
        BOOL v15 = [v14 stringRepresentation];
        [v7 setObject:v15 forKeyedSubscript:v13];
      }
      uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v10);
  }

  [v36 setObject:v7 forKeyedSubscript:@"contents"];
  v16 = [(NSDictionary *)self->super.super._attributes objectForKeyedSubscript:@"required"];
  [v36 setObject:v16 forKeyedSubscript:@"required"];

  v37.receiver = self;
  v37.super_class = (Class)NUCompositionSchema;
  BOOL v17 = [(NUSchema *)&v37 serializeIntoDictionary:v36 error:v35];

  return v17;
}

- (BOOL)deserializeContents:(id)a3 fromDictionary:(id)a4 error:(id *)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    char v20 = NUAssertLogger_16790();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      v78 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v23 = NUAssertLogger_16790();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        long long v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        uint64_t v44 = [v42 callStackSymbols];
        __int16 v45 = [v44 componentsJoinedByString:@"\n"];
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
      id v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserializeContents:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2280, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"composition != nil");
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    v27 = NUAssertLogger_16790();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      v78 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v30 = NUAssertLogger_16790();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        __int16 v53 = [v51 callStackSymbols];
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
      uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserializeContents:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2281, @"Invalid parameter not satisfying: %s", v55, v56, v57, v58, (uint64_t)"dictionary != nil");
  }
  if (!a5)
  {
    uint64_t v34 = NUAssertLogger_16790();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      long long v35 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v78 = v35;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    objc_super v37 = NUAssertLogger_16790();
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
      long long v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v40 = [v39 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v40;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserializeContents:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2282, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"error != NULL");
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obj = self->_contents;
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
        BOOL v15 = [(NSDictionary *)self->_contents objectForKeyedSubscript:v14];
        v16 = [v9 objectForKeyedSubscript:v14];
        if (v16)
        {
          id v71 = 0;
          BOOL v17 = +[NUSchema deserializeItem:v16 schemaIdentifier:v15 error:&v71];
          id v18 = v71;
          if (!v17)
          {
            id *v68 = +[NUError errorWithCode:1 reason:@"Failed to deserialize content" object:v14 underlyingError:v18];

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

- (BOOL)serializeContents:(id)a3 intoDictionary:(id)a4 error:(id *)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v75 = v8;
  if (!v8)
  {
    BOOL v24 = NUAssertLogger_16790();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "contents != nil");
      *(_DWORD *)buf = 138543362;
      v83 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_16790();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        __int16 v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        uint64_t v48 = [v46 callStackSymbols];
        uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v83 = v45;
        __int16 v84 = 2114;
        v85 = v49;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v83 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeContents:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2248, @"Invalid parameter not satisfying: %s", v50, v51, v52, v53, (uint64_t)"contents != nil");
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    BOOL v31 = NUAssertLogger_16790();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      v83 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v34 = NUAssertLogger_16790();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = v54;
        uint64_t v57 = [v55 callStackSymbols];
        uint64_t v58 = [v57 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v83 = v54;
        __int16 v84 = 2114;
        v85 = v58;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      long long v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      objc_super v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v83 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeContents:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2249, @"Invalid parameter not satisfying: %s", v59, v60, v61, v62, (uint64_t)"dictionary != nil");
  }
  if (!a5)
  {
    BOOL v38 = NUAssertLogger_16790();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      long long v39 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v83 = v39;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v41 = NUAssertLogger_16790();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v42)
      {
        v63 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v64 = (void *)MEMORY[0x1E4F29060];
        id v65 = v63;
        uint64_t v66 = [v64 callStackSymbols];
        uint64_t v67 = [v66 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v83 = v63;
        __int16 v84 = 2114;
        v85 = v67;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v42)
    {
      id v43 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v83 = v44;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeContents:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2250, @"Invalid parameter not satisfying: %s", v68, v69, v70, v71, (uint64_t)"error != NULL");
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obj = self->_contents;
  uint64_t v11 = [(NSDictionary *)obj countByEnumeratingWithState:&v77 objects:v81 count:16];
  if (!v11)
  {
    BOOL v22 = 1;
    goto LABEL_21;
  }
  uint64_t v12 = v11;
  long long v72 = a5;
  long long v74 = v10;
  uint64_t v13 = *(void *)v78;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v78 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(*((void *)&v77 + 1) + 8 * i);
      v16 = [(NSDictionary *)self->_contents objectForKeyedSubscript:v15];
      BOOL v17 = [v75 objectForKeyedSubscript:v15];
      if (v17)
      {
        id v76 = 0;
        id v18 = +[NUSchema serializeItem:v17 schemaIdentifier:v16 error:&v76];
        id v19 = v76;
        if (v18)
        {
          [v74 setObject:v18 forKeyedSubscript:v15];

          goto LABEL_13;
        }
        *long long v72 = +[NUError errorWithCode:1 reason:@"Failed to serialize content" object:v15 underlyingError:v19];

LABEL_19:
        BOOL v22 = 0;
        goto LABEL_20;
      }
      char v20 = [(NUCompositionSchema *)self requiredContents];
      int v21 = [v20 containsObject:v15];

      if (v21)
      {
        +[NUError missingError:@"Missing required content" object:v15];
        BOOL v17 = 0;
        *long long v72 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
LABEL_13:
    }
    uint64_t v12 = [(NSDictionary *)obj countByEnumeratingWithState:&v77 objects:v81 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  BOOL v22 = 1;
LABEL_20:
  uint64_t v10 = v74;
LABEL_21:

  return v22;
}

- (id)deserializeComposition:(id)a3 error:(id *)a4
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
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        uint64_t v32 = [v30 callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v29;
        __int16 v51 = 2114;
        uint64_t v52 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      char v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserializeComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2217, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    BOOL v22 = NUAssertLogger_16790();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
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
        long long v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        long long v41 = [v39 callStackSymbols];
        BOOL v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v38;
        __int16 v51 = 2114;
        uint64_t v52 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserializeComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2218, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v48 = 0;
  BOOL v8 = [(NUSchema *)self deserializeIdentifierFromDictionary:v6 error:&v48];
  id v9 = v48;
  if (v8)
  {
    uint64_t v10 = [[NUGenericComposition alloc] initWithCompositionSchema:self];
    [(NUComposition *)v10 setMediaType:+[NUSchema deserializeMediaTypeFromDictionary:v7]];
    id v47 = 0;
    BOOL v11 = [(NUCompositionSchema *)self deserializeContents:v10 fromDictionary:v7 error:&v47];
    id v12 = v47;

    if (v11)
    {
      uint64_t v13 = v10;
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to deserialize contents" object:v7 underlyingError:v12];
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

- (id)serializeComposition:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v24 = NUAssertLogger_16790();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_16790();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        BOOL v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        long long v41 = [v39 callStackSymbols];
        BOOL v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v60 = v38;
        __int16 v61 = 2114;
        uint64_t v62 = v42;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2188, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"composition != nil");
  }
  if (!a4)
  {
    id v31 = NUAssertLogger_16790();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v34 = NUAssertLogger_16790();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        id v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        uint64_t v50 = [v48 callStackSymbols];
        __int16 v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v60 = v47;
        __int16 v61 = 2114;
        uint64_t v62 = v51;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      uint64_t v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2189, @"Invalid parameter not satisfying: %s", v52, v53, v54, v55, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  BOOL v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_contents, "count") + 1);
  id v9 = [v7 identifier];
  id v58 = 0;
  BOOL v10 = [(NUSchema *)self serializeIdentifier:v9 intoDictionary:v8 error:&v58];
  id v11 = v58;

  if (v10)
  {
    id v57 = 0;
    BOOL v12 = +[NUSchema serializeMediaType:intoDictionary:error:](NUSchema, "serializeMediaType:intoDictionary:error:", [v7 mediaType], v8, &v57);
    id v13 = v57;

    if (v12)
    {
      uint64_t v14 = [v7 contents];
      id v56 = 0;
      BOOL v15 = [(NUCompositionSchema *)self serializeContents:v14 intoDictionary:v8 error:&v56];
      id v16 = v56;

      if (v15)
      {
        id v17 = v8;
      }
      else
      {
        int v21 = [v7 contents];
        *a4 = +[NUError errorWithCode:1 reason:@"Failed to serialize contents" object:v21 underlyingError:v16];

        id v17 = 0;
      }
      id v13 = v16;
    }
    else
    {
      unint64_t v19 = [v7 mediaType];
      if (v19 > 3) {
        char v20 = @"Invalid";
      }
      else {
        char v20 = off_1E5D94158[v19];
      }
      BOOL v22 = v20;
      *a4 = +[NUError errorWithCode:1 reason:@"Failed to serialize mediaType" object:v22 underlyingError:v13];

      id v17 = 0;
    }
  }
  else
  {
    id v18 = [v7 identifier];
    *a4 = +[NUError errorWithCode:1 reason:@"Failed to serialize identifier" object:v18 underlyingError:v11];

    id v17 = 0;
    id v13 = v11;
  }

  return v17;
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
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2174, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
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
    unint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v20 = NUAssertLogger_16790();
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
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2175, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUCompositionSchema *)self deserializeComposition:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not a composition" object:v7];
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
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2160, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
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
    unint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v20 = NUAssertLogger_16790();
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
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2161, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUCompositionSchema *)self serializeComposition:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not a composition" object:v7];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)modelForProperty:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    BOOL v12 = NUAssertLogger_16790();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v15 = NUAssertLogger_16790();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        unint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        char v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        BOOL v22 = [v20 callStackSymbols];
        BOOL v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v19;
        __int16 v30 = 2114;
        uint64_t v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema modelForProperty:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2146, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"name != nil");
  }
  id v5 = v4;
  id v6 = [(NSDictionary *)self->_contents objectForKeyedSubscript:v4];
  if (v6)
  {
    id v7 = +[NUSchemaRegistry sharedRegistry];
    BOOL v8 = [v7 schemaWithIdentifier:v6];
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_557);
    }
    id v9 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      contents = self->_contents;
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v5;
      __int16 v30 = 2112;
      uint64_t v31 = contents;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "failure in [NUCompositionSchema modelForProperty]. name \"%@\" does not exist in _contents: %@", buf, 0x16u);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyComposition:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    BOOL v28 = NUAssertLogger_16790();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
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
        uint64_t v53 = v39;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v51 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema copyComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2106, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"composition != nil");
  }
  id v5 = v4;
  id v6 = [v4 identifier];
  id v7 = [(NUSchema *)self identifier];
  char v8 = [v6 isEqualToIdentifier:v7];

  if (v8)
  {
    id v9 = [[NUGenericComposition alloc] initWithCompositionSchema:self];
    -[NUComposition setMediaType:](v9, "setMediaType:", [v5 mediaType]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obj = self->_contents;
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
          BOOL v15 = [v5 valueForKey:v14];
          if (v15)
          {
            BOOL v16 = v5;
            id v17 = self;
            id v18 = [(NSDictionary *)self->_contents objectForKeyedSubscript:v14];
            id v19 = +[NUSchema copyItem:v15 schemaIdentifier:v18];
            if (!v19)
            {
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_557);
              }
              id v5 = v16;
              BOOL v23 = _NULogger;
              if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                __int16 v51 = v18;
                __int16 v52 = 2112;
                uint64_t v53 = v15;
                _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "failure in [NUCompositionSchema copyComposition]. cannot copy item with identifier \"%@\". item: %@", buf, 0x16u);
              }

              id v21 = 0;
              goto LABEL_25;
            }
            char v20 = v19;

            self = v17;
            id v5 = v16;
          }
          else
          {
            char v20 = 0;
          }
          [(NUGenericComposition *)v9 setValue:v20 forKey:v14];
        }
        uint64_t v11 = [(NSDictionary *)obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v21 = v9;
LABEL_25:
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_557);
    }
    BOOL v22 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = v22;
      uint64_t v26 = [v5 identifier];
      uint64_t v27 = [(NUSchema *)self identifier];
      *(_DWORD *)buf = 138412546;
      __int16 v51 = v26;
      __int16 v52 = 2112;
      uint64_t v53 = v27;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "failure in [NUCompositionSchema copyComposition]. composition.identifier \"%@\" is not equal to self.identifier \"%@\"", buf, 0x16u);
    }
    id v21 = 0;
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
      uint64_t v26 = v10;
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
        char v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        BOOL v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema copy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2093, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"object != nil");
  }
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(NUCompositionSchema *)self copyComposition:v5];
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
      uint64_t v26 = v5;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "failure in [NUCompositionSchema copy]. object is not a NUComposition: %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (BOOL)validateContents:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  if (!v56)
  {
    uint64_t v21 = NUAssertLogger_16790();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "contents != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v64 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_16790();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        id v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        uint64_t v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v64 = v35;
        __int16 v65 = 2114;
        uint64_t v66 = v39;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v64 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validateContents:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2050, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"contents != nil");
  }
  if (!a4)
  {
    BOOL v28 = NUAssertLogger_16790();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v64 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger_16790();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        __int16 v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        long long v47 = [v45 callStackSymbols];
        long long v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v64 = v44;
        __int16 v65 = 2114;
        uint64_t v66 = v48;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v64 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validateContents:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2051, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"error != NULL");
  }
  uint64_t v53 = a4;
  id v5 = (void *)[v56 mutableCopy];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obj = self->_contents;
  uint64_t v6 = [(NSDictionary *)obj countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v59;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v59 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v58 + 1) + 8 * v9);
      uint64_t v11 = [v56 objectForKeyedSubscript:v10];
      if (v11)
      {
        uint64_t v12 = [(NSDictionary *)self->_contents objectForKeyedSubscript:v10];
        BOOL v13 = +[NUSchemaRegistry sharedRegistry];
        uint64_t v14 = [v13 schemaWithIdentifier:v12];

        id v57 = 0;
        char v15 = [v14 validate:v11 error:&v57];
        id v16 = v57;
        if ((v15 & 1) == 0)
        {
          *uint64_t v53 = +[NUError errorWithCode:2 reason:@"Invalid property" object:v10 underlyingError:v16];

LABEL_18:
          BOOL v19 = 0;
          goto LABEL_19;
        }
      }
      else
      {
        id v17 = [(NUCompositionSchema *)self requiredContents];
        int v18 = [v17 containsObject:v10];

        if (v18)
        {
          +[NUError missingError:@"Missing required property" object:v10];
          uint64_t v11 = 0;
          *uint64_t v53 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
      }
      [v5 removeObjectForKey:v10];

      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSDictionary *)obj countByEnumeratingWithState:&v58 objects:v62 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if ([v5 count])
  {
    +[NUError invalidError:@"Extra contents" object:v5];
    BOOL v19 = 0;
    *uint64_t v53 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v19 = 1;
  }
LABEL_19:

  return v19;
}

- (BOOL)validateComposition:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    int v18 = NUAssertLogger_16790();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      BOOL v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v19;
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
        uint64_t v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        id v35 = [v33 callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v53 = v32;
        __int16 v54 = 2114;
        uint64_t v55 = v36;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validateComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2029, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"composition != nil");
  }
  if (!a4)
  {
    BOOL v25 = NUAssertLogger_16790();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v28 = NUAssertLogger_16790();
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
        uint64_t v53 = v41;
        __int16 v54 = 2114;
        uint64_t v55 = v45;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      __int16 v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validateComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2030, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 identifier];
  id v51 = 0;
  BOOL v9 = [(NUSchema *)self validateIdentifier:v8 error:&v51];
  id v10 = v51;

  if (!v9)
  {
    char v15 = [v7 debugDescription];
    id v16 = +[NUError errorWithCode:2 reason:@"Invalid composition identifier" object:v15];
    id v13 = v10;
LABEL_8:
    *a4 = v16;

    BOOL v14 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = [v7 contents];
  id v50 = 0;
  BOOL v12 = [(NUCompositionSchema *)self validateContents:v11 error:&v50];
  id v13 = v50;

  if (!v12)
  {
    char v15 = [v7 debugDescription];
    id v16 = +[NUError errorWithCode:2 reason:@"Invalid composition contents" object:v15 underlyingError:v13];
    goto LABEL_8;
  }
  BOOL v14 = 1;
LABEL_9:

  return v14;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v10 = NUAssertLogger_16790();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      id v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v13 = NUAssertLogger_16790();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        __int16 v27 = [v25 callStackSymbols];
        BOOL v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v43 = v24;
        __int16 v44 = 2114;
        long long v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      char v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2015, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    id v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v20 = NUAssertLogger_16790();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v43 = v33;
        __int16 v44 = 2114;
        long long v45 = v37;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2016, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(NUCompositionSchema *)self validateComposition:v7 error:a4];
  }
  else
  {
    +[NUError mismatchError:@"Not a composition" object:v7];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)validateContents:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_contents;
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
        id *v17 = +[NUError errorWithCode:2 reason:@"Invalid property name" object:v9 underlyingError:v11];
LABEL_14:

        BOOL v15 = 0;
        goto LABEL_15;
      }
      BOOL v12 = [(NSDictionary *)self->_contents objectForKeyedSubscript:v9];
      id v19 = 0;
      BOOL v13 = +[NUSchema validateSchemaIdentifier:v12 type:0 error:&v19];
      id v14 = v19;

      if (!v13)
      {
        id *v17 = +[NUError errorWithCode:2 reason:@"Invalid schema identifier" object:v12 underlyingError:v14];

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

- (BOOL)validatePropertyArray:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v17 = NUAssertLogger_16790();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v18;
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
        id v34 = [v32 callStackSymbols];
        id v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v55 = v31;
        __int16 v56 = 2114;
        id v57 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      long long v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validatePropertyArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1968, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    long long v24 = NUAssertLogger_16790();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      BOOL v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v27 = NUAssertLogger_16790();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        id v43 = [v41 callStackSymbols];
        __int16 v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v55 = v40;
        __int16 v56 = 2114;
        id v57 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validatePropertyArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1969, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  if (+[NUModel validateStringArray:v6 error:a4])
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          id v14 = [(NSDictionary *)self->_contents objectForKey:v13];

          if (!v14)
          {
            +[NUError unknownError:@"Unknown required property" object:v13];
            BOOL v15 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v15 = 1;
LABEL_15:
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"required"])
  {
    unsigned __int8 v10 = [(NUCompositionSchema *)self validatePropertyArray:v9 error:a5];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NUCompositionSchema;
    unsigned __int8 v10 = [(NUModel *)&v13 validateAttribute:v8 value:v9 error:a5];
  }
  BOOL v11 = v10;

  return v11;
}

- (BOOL)isValid:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v12 = NUAssertLogger_16790();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v13;
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
        id v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        long long v22 = [v20 callStackSymbols];
        long long v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v19;
        __int16 v32 = 2114;
        id v33 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema isValid:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1930, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"error != NULL");
  }
  id v29 = 0;
  BOOL v5 = [(NUModel *)self validateAttributes:&v29];
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
  BOOL v7 = [(NUCompositionSchema *)self validateContents:&v28];
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

- (NSSet)requiredContents
{
  return self->_requiredContents;
}

- (NUCompositionSchema)initWithIdentifier:(id)a3 contents:(id)a4 attributes:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v19 = NUAssertLogger_16790();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "contents != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v22 = NUAssertLogger_16790();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        id v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v26;
        __int16 v38 = 2114;
        uint64_t v39 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema initWithIdentifier:contents:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1911, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"contents != nil");
  }
  BOOL v11 = v10;
  v35.receiver = self;
  v35.super_class = (Class)NUCompositionSchema;
  BOOL v12 = [(NUSchema *)&v35 initWithIdentifier:v8 attributes:v10];
  uint64_t v13 = [v9 copy];
  contents = v12->_contents;
  v12->_contents = (NSDictionary *)v13;

  BOOL v15 = [(NSDictionary *)v12->super.super._attributes objectForKeyedSubscript:@"required"];
  uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
  requiredContents = v12->_requiredContents;
  v12->_requiredContents = (NSSet *)v16;

  return v12;
}

- (NUCompositionSchema)initWithIdentifier:(id)a3 attributes:(id)a4
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
    id v9 = NSString;
    id v10 = v8;
    BOOL v11 = (objc_class *)objc_opt_class();
    BOOL v12 = NSStringFromClass(v11);
    uint64_t v13 = NSStringFromSelector(a2);
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
    uint64_t v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v17 = (void *)MEMORY[0x1E4F29060];
    int v18 = v16;
    id v19 = [v17 callStackSymbols];
    id v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  int v18 = v21;
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
  _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema initWithIdentifier:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1906, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- (int64_t)type
{
  return 4;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    int v18 = NUAssertLogger_16790();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v54 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v21 = NUAssertLogger_16790();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        __int16 v35 = [v33 callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v54 = v32;
        __int16 v55 = 2114;
        __int16 v56 = v36;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      BOOL v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v54 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUCompositionSchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2328, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    uint64_t v25 = NUAssertLogger_16790();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      __int16 v54 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v28 = NUAssertLogger_16790();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        uint64_t v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        __int16 v44 = [v42 callStackSymbols];
        uint64_t v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v54 = v41;
        __int16 v55 = 2114;
        __int16 v56 = v45;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v54 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUCompositionSchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2329, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v52 = 0;
  id v8 = [a1 deserializeIdentifierFromDictionary:v6 error:&v52];
  id v9 = v52;
  if (!v8)
  {
    +[NUError errorWithCode:1 reason:@"Failed to deserialize composition identifier" object:v7 underlyingError:v9];
    uint64_t v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  id v51 = 0;
  id v10 = [a1 deserializeContentsFromDictionary:v7 error:&v51];
  id v11 = v51;

  if (v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v13 = [v7 objectForKeyedSubscript:@"required"];

    if (v13)
    {
      id v50 = 0;
      id v14 = [a1 deserializeArrayFromDictionary:v7 key:@"required" error:&v50];
      id v15 = v50;

      if (!v14)
      {
        +[NUError errorWithCode:1 reason:@"Failed to deserialize required contents" object:v7 underlyingError:v15];
        uint64_t v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      [v12 setObject:v14 forKeyedSubscript:@"required"];
    }
    else
    {
      id v15 = v11;
    }
    uint64_t v16 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v8 contents:v10 attributes:v12];
LABEL_13:

    id v11 = v15;
    goto LABEL_14;
  }
  +[NUError errorWithCode:1 reason:@"Failed to deserialize composition contents" object:v7 underlyingError:v11];
  uint64_t v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  id v9 = v11;
LABEL_15:

  return v16;
}

+ (id)supportedAttributes
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NUCompositionSchema;
  v2 = objc_msgSendSuper2(&v6, sel_supportedAttributes);
  v7[0] = @"required";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

@end