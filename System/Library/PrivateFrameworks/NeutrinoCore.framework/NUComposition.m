@interface NUComposition
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToComposition:(id)a3;
- (BOOL)isResolved;
- (BOOL)resolve:(id)a3 error:(id *)a4;
- (NSDictionary)contents;
- (NSString)debugDescription;
- (NSString)description;
- (NUComposition)init;
- (NUComposition)initWithCompositionSchema:(id)a3;
- (NUComposition)initWithIdentifier:(id)a3;
- (NUCompositionSchema)schema;
- (NUIdentifier)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)mediaType;
- (unint64_t)hash;
- (void)setMediaType:(int64_t)a3;
@end

@implementation NUComposition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NUCompositionSchema)schema
{
  return self->_schema;
}

- (BOOL)resolve:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v11 = NUAssertLogger_70();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "resolver != nil");
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_70();
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
    _NUAssertFailHandler((uint64_t)"-[NUComposition resolve:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 181, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"resolver != nil");
  }
  v7 = v6;
  v8 = [(NUComposition *)self schema];
  char v9 = [v8 resolveItem:self resolver:v7 error:a4];

  return v9;
}

- (BOOL)isResolved
{
  v2 = self;
  v3 = [(NUComposition *)self schema];
  LOBYTE(v2) = [v3 itemIsResolved:v2];

  return (char)v2;
}

- (BOOL)isEqualToComposition:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v25 = NUAssertLogger_70();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      *(_DWORD *)buf = 138543362;
      v66 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_70();
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
        v66 = v32;
        __int16 v67 = 2114;
        v68 = v36;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUComposition isEqualToComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 144, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"other != nil");
  }
  v5 = v4;
  id v6 = [(NUComposition *)self identifier];
  v7 = [v5 identifier];
  int v8 = [v6 isEqualToIdentifier:v7];

  if (!v8)
  {
    BOOL v23 = 0;
    goto LABEL_31;
  }
  char v9 = [(NUComposition *)self schema];
  if (!v9)
  {
    v41 = NUAssertLogger_70();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = NSString;
      v43 = [(NUComposition *)self identifier];
      v44 = [v42 stringWithFormat:@"No schema registered for identifier '%@'", v43];
      *(_DWORD *)buf = 138543362;
      v66 = v44;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v46 = NUAssertLogger_70();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (v45)
    {
      if (v47)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        v53 = [v51 callStackSymbols];
        v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v50;
        __int16 v67 = 2114;
        v68 = v54;
        _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v47)
    {
      v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      v49 = [v48 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v49;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v55 = [(NUComposition *)self identifier];
    _NUAssertFailHandler((uint64_t)"-[NUComposition isEqualToComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 156, @"No schema registered for identifier '%@'", v56, v57, v58, v59, v55);
  }
  v10 = v9;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v11 = [v9 contents];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (!v12)
  {
    BOOL v23 = 1;
    goto LABEL_30;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v61;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v61 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void *)(*((void *)&v60 + 1) + 8 * i);
      v17 = [(NUComposition *)self valueForKey:v16];
      uint64_t v18 = [v5 valueForKey:v16];
      v19 = (void *)v18;
      if (v17) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v18 == 0;
      }
      if (!v20)
      {
        v17 = 0;
LABEL_29:

        BOOL v23 = 0;
        goto LABEL_30;
      }
      if (v17) {
        BOOL v21 = v18 == 0;
      }
      else {
        BOOL v21 = 0;
      }
      if (v21)
      {
        v19 = 0;
        goto LABEL_29;
      }
      if (v17) {
        BOOL v22 = v18 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (!v22 && ([v17 isEqual:v18] & 1) == 0) {
        goto LABEL_29;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v60 objects:v64 count:16];
    BOOL v23 = 1;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_30:

LABEL_31:
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUComposition *)self isEqualToComposition:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(NUComposition *)self identifier];
  unint64_t v3 = 0x100FC8C025E859 * [v2 hash];

  return v3;
}

- (NUIdentifier)identifier
{
  v2 = [(NUComposition *)self schema];
  unint64_t v3 = [v2 identifier];

  return (NUIdentifier *)v3;
}

- (NSDictionary)contents
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NUComposition *)self schema];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v5 = objc_msgSend(v3, "contents", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          v11 = [(NUComposition *)self valueForKey:v10];
          if (v11) {
            [v4 setObject:v11 forKeyedSubscript:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)debugDescription
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"{\n"];
  BOOL v21 = self;
  id v4 = [(NUComposition *)self contents];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v11 = [v4 objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 debugDescription];
        [v3 appendFormat:@"\t%@ = %@,\n", v10, v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  [v3 appendString:@"}"];
  long long v13 = NSString;
  uint64_t v14 = objc_opt_class();
  long long v15 = [(NUComposition *)v21 identifier];
  unint64_t v16 = [(NUComposition *)v21 mediaType];
  if (v16 > 3) {
    v17 = @"Invalid";
  }
  else {
    v17 = off_1E5D94158[v16];
  }
  uint64_t v18 = v17;
  v19 = [v13 stringWithFormat:@"<%@:%p id=%@ mediaType=%@ contents=%@>", v14, v21, v15, v18, v3];

  return (NSString *)v19;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(NUComposition *)self identifier];
  unint64_t v6 = [(NUComposition *)self mediaType];
  if (v6 > 3) {
    uint64_t v7 = @"Invalid";
  }
  else {
    uint64_t v7 = off_1E5D94158[v6];
  }
  uint64_t v8 = v7;
  char v9 = [(NUComposition *)self contents];
  uint64_t v10 = [v3 stringWithFormat:@"<%@:%p id=%@ mediaType=%@ contents=%@>", v4, self, v5, v8, v9];

  return (NSString *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NUComposition *)self schema];
  if (!v4)
  {
    char v9 = NUAssertLogger_70();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = NSString;
      v11 = [(NUComposition *)self identifier];
      uint64_t v12 = [v10 stringWithFormat:@"No schema registered for identifier '%@'", v11];
      *(_DWORD *)buf = 138543362;
      v45 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_70();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        long long v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        BOOL v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v25;
        __int16 v46 = 2114;
        BOOL v47 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      unint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v30 = [(NUComposition *)self identifier];
    _NUAssertFailHandler((uint64_t)"-[NUComposition copyWithZone:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 61, @"No schema registered for identifier '%@'", v31, v32, v33, v34, v30);
  }
  BOOL v5 = v4;
  uint64_t v6 = [v4 copyComposition:self];
  if (!v6)
  {
    uint64_t v18 = NUAssertLogger_70();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [NSString stringWithFormat:@"[NUComposition copy] failed. check logs for more details. composition: %@", self];
      *(_DWORD *)buf = 138543362;
      v45 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v21 = NUAssertLogger_70();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        uint64_t v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v35;
        __int16 v46 = 2114;
        BOOL v47 = v39;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      long long v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUComposition copyWithZone:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 65, @"[NUComposition copy] failed. check logs for more details. composition: %@", v40, v41, v42, v43, (uint64_t)self);
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (NUComposition)initWithIdentifier:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v12 = NUAssertLogger_70();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v78 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v15 = NUAssertLogger_70();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v40;
        __int16 v79 = 2114;
        v80 = v44;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUComposition initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 44, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"identifier != nil");
  }
  BOOL v5 = v4;
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v19 = NUAssertLogger_70();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = [NSString stringWithFormat:@"Unable to instantiate abstract class %@", objc_opt_class()];
      *(_DWORD *)buf = 138543362;
      v78 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_70();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        id v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v49;
        __int16 v79 = 2114;
        v80 = v53;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      long long v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v54 = objc_opt_class();
    _NUAssertFailHandler((uint64_t)"-[NUComposition initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 45, @"Unable to instantiate abstract class %@", v55, v56, v57, v58, v54);
  }
  uint64_t v7 = +[NUSchemaRegistry sharedRegistry];
  uint64_t v8 = [v7 schemaWithIdentifier:v5];
  if (!v8)
  {
    uint64_t v26 = NUAssertLogger_70();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = [NSString stringWithFormat:@"Unable to instantiate composition with invalid identifier %@", v5];
      *(_DWORD *)buf = 138543362;
      v78 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v29 = NUAssertLogger_70();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        uint64_t v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        long long v62 = [v60 callStackSymbols];
        long long v63 = [v62 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v59;
        __int16 v79 = 2114;
        v80 = v63;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUComposition initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 49, @"Unable to instantiate composition with invalid identifier %@", v64, v65, v66, v67, (uint64_t)v5);
  }
  char v9 = v8;
  if ([v8 type] != 4)
  {
    uint64_t v33 = NUAssertLogger_70();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = [NSString stringWithFormat:@"Attempted to instantiate composition with invalid schema type %@", v9];
      *(_DWORD *)buf = 138543362;
      v78 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v36 = NUAssertLogger_70();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v69 = (void *)MEMORY[0x1E4F29060];
        id v70 = v68;
        v71 = [v69 callStackSymbols];
        v72 = [v71 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v68;
        __int16 v79 = 2114;
        v80 = v72;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      uint64_t v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUComposition initWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 50, @"Attempted to instantiate composition with invalid schema type %@", v73, v74, v75, v76, (uint64_t)v9);
  }
  uint64_t v10 = [(NUComposition *)self initWithCompositionSchema:v9];

  return v10;
}

- (NUComposition)initWithCompositionSchema:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (NUCompositionSchema *)a3;
  if (!v4)
  {
    char v9 = NUAssertLogger_70();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "compositionSchema != nil");
      *(_DWORD *)buf = 138543362;
      id v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_70();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        BOOL v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v27 = v16;
        __int16 v28 = 2114;
        BOOL v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUComposition initWithCompositionSchema:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 33, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"compositionSchema != nil");
  }
  BOOL v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)NUComposition;
  uint64_t v6 = [(NUComposition *)&v25 init];
  schema = v6->_schema;
  v6->_schema = v5;

  return v6;
}

- (NUComposition)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_78);
  }
  unint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    BOOL v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    char v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_78);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_78);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    BOOL v13 = v11;
    uint64_t v14 = [v12 callStackSymbols];
    BOOL v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  BOOL v13 = v16;
  BOOL v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  BOOL v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUComposition init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 28, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end