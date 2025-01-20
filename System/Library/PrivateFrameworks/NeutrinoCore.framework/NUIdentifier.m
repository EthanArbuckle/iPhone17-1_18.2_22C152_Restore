@interface NUIdentifier
+ (BOOL)validateIdentifierString:(id)a3 error:(id *)a4;
+ (BOOL)validateIdentifierString:(id)a3 namespace:(id *)a4 name:(id *)a5 version:(id *)a6;
+ (BOOL)validateName:(id)a3;
+ (BOOL)validateNamespace:(id)a3;
+ (NUIdentifier)identifierWithString:(id)a3 error:(id *)a4;
+ (id)defaultNamespace;
+ (id)defaultVersion;
+ (id)identifierRegularExpression;
+ (id)latestIdentifierWithName:(id)a3;
+ (id)latestIdentifierWithNamespace:(id)a3 name:(id)a4;
+ (id)validNameRegularExpression;
+ (id)validNameSpaceRegularExpression;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentifier:(id)a3;
- (NSString)name;
- (NSString)namespace;
- (NSString)stringRepresentation;
- (NUIdentifier)identifierWithVersion:(id)a3;
- (NUIdentifier)init;
- (NUIdentifier)initWithName:(id)a3;
- (NUIdentifier)initWithName:(id)a3 version:(id)a4;
- (NUIdentifier)initWithNamespace:(id)a3 name:(id)a4 version:(id)a5;
- (NUVersion)version;
- (id)debugDescription;
- (unint64_t)hash;
@end

@implementation NUIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_namespace, 0);
}

- (NUVersion)version
{
  return (NUVersion *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)namespace
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqualToIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NUIdentifier *)self namespace];
  v6 = [v4 namespace];
  int v7 = [v5 isEqualToString:v6];

  if (v7
    && ([(NUIdentifier *)self name],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 name],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        v10))
  {
    v11 = [(NUIdentifier *)self version];
    v12 = [v4 version];
    char v13 = [v11 isEqualToVersion:v12];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUIdentifier *)self isEqualToIdentifier:v4];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = 0x1891E4D530AE31 * [(NSString *)self->_namespace hash];
  NSUInteger v4 = 0x10E270B8F4A859 * [(NSString *)self->_name hash];
  return v4 ^ v3 ^ (0x17A9B71420B2E9 * [(NUVersion *)self->_version hash]);
}

- (NUIdentifier)identifierWithVersion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v11 = NUAssertLogger_20854();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "version != nil");
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_20854();
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
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier identifierWithVersion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 78, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"version != nil");
  }
  BOOL v5 = v4;
  v6 = [NUIdentifier alloc];
  int v7 = [(NUIdentifier *)self namespace];
  v8 = [(NUIdentifier *)self name];
  v9 = [(NUIdentifier *)v6 initWithNamespace:v7 name:v8 version:v5];

  return v9;
}

- (NSString)stringRepresentation
{
  NSUInteger v3 = NSString;
  id v4 = [(NUIdentifier *)self namespace];
  BOOL v5 = [(NUIdentifier *)self name];
  v6 = [(NUIdentifier *)self version];
  int v7 = [v6 stringRepresentation];
  v8 = [v3 stringWithFormat:@"%@:%@~%@", v4, v5, v7];

  return (NSString *)v8;
}

- (id)debugDescription
{
  NSUInteger v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(NUIdentifier *)self namespace];
  v6 = [(NUIdentifier *)self name];
  int v7 = [(NUIdentifier *)self version];
  v8 = [v3 stringWithFormat:@"%@ ns:%@ name:%@ version:%@>", v4, v5, v6, v7];

  return v8;
}

- (NUIdentifier)initWithNamespace:(id)a3 name:(id)a4 version:(id)a5
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (NUVersion *)a5;
  if (!v8)
  {
    v19 = NUAssertLogger_20854();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "namespace != nil");
      *(_DWORD *)buf = 138543362;
      v101 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_20854();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = v54;
        v57 = [v55 callStackSymbols];
        v58 = [v57 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v101 = v54;
        __int16 v102 = 2114;
        v103 = v58;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v101 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier initWithNamespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 43, @"Invalid parameter not satisfying: %s", v59, v60, v61, v62, (uint64_t)"namespace != nil");
  }
  if (!v9)
  {
    uint64_t v26 = NUAssertLogger_20854();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v101 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v29 = NUAssertLogger_20854();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v63 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v64 = (void *)MEMORY[0x1E4F29060];
        id v65 = v63;
        v66 = [v64 callStackSymbols];
        v67 = [v66 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v101 = v63;
        __int16 v102 = 2114;
        v103 = v67;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v101 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier initWithNamespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 44, @"Invalid parameter not satisfying: %s", v68, v69, v70, v71, (uint64_t)"name != nil");
  }
  v11 = v10;
  if (!v10)
  {
    v33 = NUAssertLogger_20854();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "version != nil");
      *(_DWORD *)buf = 138543362;
      v101 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v36 = NUAssertLogger_20854();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v72 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v73 = (void *)MEMORY[0x1E4F29060];
        id v74 = v72;
        v75 = [v73 callStackSymbols];
        v76 = [v75 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v101 = v72;
        __int16 v102 = 2114;
        v103 = v76;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v101 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier initWithNamespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 45, @"Invalid parameter not satisfying: %s", v77, v78, v79, v80, (uint64_t)"version != nil");
  }
  if (([(id)objc_opt_class() validateNamespace:v8] & 1) == 0)
  {
    v40 = NUAssertLogger_20854();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = [NSString stringWithFormat:@"Invalid namespace: %@", v8];
      *(_DWORD *)buf = 138543362;
      v101 = v41;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v43 = NUAssertLogger_20854();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (v42)
    {
      if (v44)
      {
        v81 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v82 = (void *)MEMORY[0x1E4F29060];
        id v83 = v81;
        v84 = [v82 callStackSymbols];
        v85 = [v84 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v101 = v81;
        __int16 v102 = 2114;
        v103 = v85;
        _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v44)
    {
      v45 = [MEMORY[0x1E4F29060] callStackSymbols];
      v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v101 = v46;
      _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier initWithNamespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 48, @"Invalid namespace: %@", v86, v87, v88, v89, (uint64_t)v8);
  }
  if (([(id)objc_opt_class() validateName:v9] & 1) == 0)
  {
    v47 = NUAssertLogger_20854();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = [NSString stringWithFormat:@"Invalid name: %@", v9];
      *(_DWORD *)buf = 138543362;
      v101 = v48;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v50 = NUAssertLogger_20854();
    BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (v49)
    {
      if (v51)
      {
        v90 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v91 = (void *)MEMORY[0x1E4F29060];
        id v92 = v90;
        v93 = [v91 callStackSymbols];
        v94 = [v93 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v101 = v90;
        __int16 v102 = 2114;
        v103 = v94;
        _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v51)
    {
      v52 = [MEMORY[0x1E4F29060] callStackSymbols];
      v53 = [v52 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v101 = v53;
      _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier initWithNamespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 49, @"Invalid name: %@", v95, v96, v97, v98, (uint64_t)v9);
  }
  v99.receiver = self;
  v99.super_class = (Class)NUIdentifier;
  v12 = [(NUIdentifier *)&v99 init];
  uint64_t v13 = [v8 copy];
  v14 = v12->_namespace;
  v12->_namespace = (NSString *)v13;

  uint64_t v15 = [v9 copy];
  name = v12->_name;
  v12->_name = (NSString *)v15;

  version = v12->_version;
  v12->_version = v11;

  return v12;
}

- (NUIdentifier)initWithName:(id)a3 version:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() defaultNamespace];
  id v9 = [(NUIdentifier *)self initWithNamespace:v8 name:v7 version:v6];

  return v9;
}

- (NUIdentifier)initWithName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(id)objc_opt_class() defaultVersion];
  id v6 = [(NUIdentifier *)self initWithName:v4 version:v5];

  return v6;
}

- (NUIdentifier)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_132_20868);
  }
  NSUInteger v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    BOOL v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    id v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    __int16 v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_132_20868);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_132_20868);
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
    uint64_t v13 = v11;
    v14 = [v12 callStackSymbols];
    uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    __int16 v29 = v15;
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
  uint64_t v13 = v16;
  id v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  __int16 v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUIdentifier init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 28, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (id)validNameRegularExpression
{
  if (validNameRegularExpression_onceToken != -1) {
    dispatch_once(&validNameRegularExpression_onceToken, &__block_literal_global_75_20926);
  }
  v2 = (void *)validNameRegularExpression_regex;

  return v2;
}

void __42__NUIdentifier_validNameRegularExpression__block_invoke()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[a-zA-Z][a-zA-Z0-9_]*" options:0 error:&v19];
  id v1 = v19;
  v2 = (void *)validNameRegularExpression_regex;
  validNameRegularExpression_regex = v0;

  if (!validNameRegularExpression_regex)
  {
    NSUInteger v3 = NUAssertLogger_20854();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [NSString stringWithFormat:@"Failed to create regular expression: %@", v1];
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v6 = NUAssertLogger_20854();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        uint64_t v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        uint64_t v13 = [v11 callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v21 = v10;
        __int16 v22 = 2114;
        uint64_t v23 = v14;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      id v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validNameRegularExpression]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 275, @"Failed to create regular expression: %@", v15, v16, v17, v18, (uint64_t)v1);
  }
}

+ (BOOL)validateName:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v14 = NUAssertLogger_20854();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "string != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger_20854();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v21;
        __int16 v32 = 2114;
        v33 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validateName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 259, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"string != nil");
  }
  BOOL v5 = v4;
  uint64_t v6 = [v4 length];
  BOOL v7 = [a1 validNameRegularExpression];
  uint64_t v8 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v5, 4, 0, v6);
  uint64_t v10 = v9;

  if (v8) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v10 == v6;
  }
  BOOL v12 = v11;

  return v12;
}

+ (id)validNameSpaceRegularExpression
{
  if (validNameSpaceRegularExpression_onceToken != -1) {
    dispatch_once(&validNameSpaceRegularExpression_onceToken, &__block_literal_global_70_20942);
  }
  v2 = (void *)validNameSpaceRegularExpression_regex;

  return v2;
}

void __47__NUIdentifier_validNameSpaceRegularExpression__block_invoke()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[a-zA-Z][a-zA-Z0-9\\-]*(?:\\.[a-zA-Z][a-zA-Z0-9\\-]*){2,}" options:0 error:&v19];
  id v1 = v19;
  v2 = (void *)validNameSpaceRegularExpression_regex;
  validNameSpaceRegularExpression_regex = v0;

  if (!validNameSpaceRegularExpression_regex)
  {
    NSUInteger v3 = NUAssertLogger_20854();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [NSString stringWithFormat:@"Failed to create regular expression: %@", v1];
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v6 = NUAssertLogger_20854();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        uint64_t v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        uint64_t v13 = [v11 callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v21 = v10;
        __int16 v22 = 2114;
        id v23 = v14;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validNameSpaceRegularExpression]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 252, @"Failed to create regular expression: %@", v15, v16, v17, v18, (uint64_t)v1);
  }
}

+ (BOOL)validateNamespace:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v14 = NUAssertLogger_20854();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "string != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger_20854();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v21;
        __int16 v32 = 2114;
        v33 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validateNamespace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 237, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"string != nil");
  }
  BOOL v5 = v4;
  uint64_t v6 = [v4 length];
  BOOL v7 = [a1 validNameSpaceRegularExpression];
  uint64_t v8 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v5, 4, 0, v6);
  uint64_t v10 = v9;

  if (v8) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v10 == v6;
  }
  BOOL v12 = v11;

  return v12;
}

+ (id)identifierRegularExpression
{
  if (identifierRegularExpression_onceToken != -1) {
    dispatch_once(&identifierRegularExpression_onceToken, &__block_literal_global_20953);
  }
  v2 = (void *)identifierRegularExpression_regex;

  return v2;
}

void __43__NUIdentifier_identifierRegularExpression__block_invoke()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(?:([A-Za-z.0-9]+):)?([A-Za-z0-9_]+)(?:~([0-9.]+))?" options:0 error:&v19];
  id v1 = v19;
  v2 = (void *)identifierRegularExpression_regex;
  identifierRegularExpression_regex = v0;

  if (!identifierRegularExpression_regex)
  {
    NSUInteger v3 = NUAssertLogger_20854();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [NSString stringWithFormat:@"Failed to create regular expression: %@", v1];
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v6 = NUAssertLogger_20854();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        uint64_t v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        uint64_t v13 = [v11 callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v21 = v10;
        __int16 v22 = 2114;
        id v23 = v14;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier identifierRegularExpression]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 230, @"Failed to create regular expression: %@", v15, v16, v17, v18, (uint64_t)v1);
  }
}

+ (BOOL)validateIdentifierString:(id)a3 namespace:(id *)a4 name:(id *)a5 version:(id *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10)
  {
    uint64_t v24 = NUAssertLogger_20854();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "string != nil");
      *(_DWORD *)buf = 138543362;
      v41 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v27 = NUAssertLogger_20854();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v41 = v31;
        __int16 v42 = 2114;
        v43 = v35;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validateIdentifierString:namespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 189, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"string != nil");
  }
  BOOL v11 = v10;
  uint64_t v12 = [v10 length];
  uint64_t v13 = [a1 identifierRegularExpression];
  v14 = objc_msgSend(v13, "firstMatchInString:options:range:", v11, 0, 0, v12);

  if (v14 && ([v14 range], v12 == v15) && objc_msgSend(v14, "numberOfRanges") == 4)
  {
    uint64_t v16 = [v14 rangeAtIndex:1];
    if (a4 && v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "substringWithRange:", v16, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v18 = [v14 rangeAtIndex:2];
    if (a5 && v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "substringWithRange:", v18, v19);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v20 = [v14 rangeAtIndex:3];
    BOOL v22 = 1;
    if (a6 && v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "substringWithRange:", v20, v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

+ (BOOL)validateIdentifierString:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v17 = NUAssertLogger_20854();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "string != nil");
      *(_DWORD *)buf = 138543362;
      v53 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_20854();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v31;
        __int16 v54 = 2114;
        v55 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validateIdentifierString:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 155, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"string != nil");
  }
  if (!a4)
  {
    uint64_t v24 = NUAssertLogger_20854();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v53 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v27 = NUAssertLogger_20854();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v40;
        __int16 v54 = 2114;
        v55 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validateIdentifierString:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 156, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  BOOL v7 = v6;
  id v50 = 0;
  id v51 = 0;
  id v49 = 0;
  char v8 = [a1 validateIdentifierString:v6 namespace:&v51 name:&v50 version:&v49];
  id v9 = v51;
  id v10 = v50;
  id v11 = v49;
  if ((v8 & 1) == 0)
  {
    uint64_t v13 = @"Malformed identifier string";
    id v14 = v7;
LABEL_13:
    uint64_t v15 = +[NUError invalidError:v13 object:v14];
LABEL_14:
    BOOL v12 = 0;
    *a4 = v15;
    goto LABEL_15;
  }
  if (v9 && ([a1 validateNamespace:v9] & 1) == 0)
  {
    uint64_t v13 = @"Malformed identifier namespace";
    id v14 = v9;
    goto LABEL_13;
  }
  if (!v10)
  {
    uint64_t v15 = +[NUError missingError:@"Missing identifier name" object:v7];
    goto LABEL_14;
  }
  if (([a1 validateName:v10] & 1) == 0)
  {
    uint64_t v15 = +[NUError mismatchError:@"Malformed identifier name" object:v10];
    goto LABEL_14;
  }
  if (v11 && !+[NUVersion validateVersionString:v11])
  {
    uint64_t v13 = @"Malformed identifier version";
    id v14 = v11;
    goto LABEL_13;
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

+ (NUIdentifier)identifierWithString:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v17 = NUAssertLogger_20854();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "string != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_20854();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v27 = [v25 callStackSymbols];
        BOOL v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v24;
        __int16 v38 = 2114;
        uint64_t v39 = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier identifierWithString:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 105, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"string != nil");
  }
  BOOL v7 = v6;
  id v34 = 0;
  id v35 = 0;
  id v33 = 0;
  char v8 = [a1 validateIdentifierString:v6 namespace:&v35 name:&v34 version:&v33];
  id v9 = v35;
  id v10 = v34;
  id v11 = v33;
  if ((v8 & 1) == 0)
  {
    uint64_t v13 = @"Invalid identifier string";
    id v14 = v7;
    goto LABEL_13;
  }
  if (v9 && ([a1 validateNamespace:v9] & 1) == 0)
  {
    uint64_t v13 = @"Invalid identifier namespace";
    id v14 = v9;
    goto LABEL_13;
  }
  if (!v10 || ([a1 validateName:v10] & 1) == 0)
  {
    uint64_t v13 = @"Invalid identifier name";
    id v14 = v10;
    goto LABEL_13;
  }
  if (v11)
  {
    BOOL v12 = +[NUVersion versionWithString:v11];
    if (!v12)
    {
      uint64_t v13 = @"Invalid identifier version";
      id v14 = v11;
LABEL_13:
      +[NUError invalidError:v13 object:v14];
      uint64_t v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  if (!v9)
  {
    id v9 = [a1 defaultNamespace];
  }
  if (!v12)
  {
    BOOL v12 = [a1 defaultVersion];
  }
  uint64_t v15 = (void *)[objc_alloc((Class)a1) initWithNamespace:v9 name:v10 version:v12];

LABEL_14:

  return (NUIdentifier *)v15;
}

+ (id)latestIdentifierWithNamespace:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[NUSchemaRegistry sharedRegistry];
  id v9 = [v8 latestVersionWithNamespace:v6 name:v7];

  if (v9) {
    id v10 = (void *)[objc_alloc((Class)a1) initWithNamespace:v6 name:v7 version:v9];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (id)latestIdentifierWithName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 defaultNamespace];
  id v6 = [a1 latestIdentifierWithNamespace:v5 name:v4];

  return v6;
}

+ (id)defaultVersion
{
  return +[NUVersion versionOne];
}

+ (id)defaultNamespace
{
  v2 = +[NUFactory sharedFactory];
  NSUInteger v3 = [v2 defaultNamespace];

  return v3;
}

@end