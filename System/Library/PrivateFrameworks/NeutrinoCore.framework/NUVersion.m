@interface NUVersion
+ (BOOL)validateVersionString:(id)a3;
+ (BOOL)validateVersionString:(id)a3 major:(int64_t *)a4 minor:(int64_t *)a5;
+ (NUVersion)versionWithPackedUInt32:(unsigned int)a3;
+ (NUVersion)versionWithString:(id)a3;
+ (id)regularExpression;
+ (id)versionOne;
+ (id)versionZero;
- (BOOL)atLeastMajor:(int64_t)a3 minor:(int64_t)a4;
- (BOOL)isCompatibleWithVersion:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVersion:(id)a3;
- (NSString)stringRepresentation;
- (NUVersion)init;
- (NUVersion)initWithMajor:(int64_t)a3 minor:(int64_t)a4;
- (id)debugDescription;
- (int64_t)compare:(id)a3;
- (int64_t)major;
- (int64_t)minor;
- (unint64_t)hash;
@end

@implementation NUVersion

- (int64_t)minor
{
  return self->_minor;
}

- (int64_t)major
{
  return self->_major;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@:%p major:%d minor:%d>", objc_opt_class(), self, -[NUVersion major](self, "major"), -[NUVersion minor](self, "minor")];
}

- (BOOL)isCompatibleWithVersion:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NUVersion *)self major];
  uint64_t v6 = [v4 major];

  return v5 <= v6;
}

- (BOOL)isEqualToVersion:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NUVersion *)self major];
  if (v5 == [v4 major])
  {
    int64_t v6 = [(NUVersion *)self minor];
    BOOL v7 = v6 == [v4 minor];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUVersion *)self isEqualToVersion:v4];

  return v5;
}

- (unint64_t)hash
{
  return (0x519FB2067FF05 * self->_minor) ^ (0x1BF7361969823BLL * self->_major);
}

- (BOOL)atLeastMajor:(int64_t)a3 minor:(int64_t)a4
{
  BOOL v5 = [[NUVersion alloc] initWithMajor:a3 minor:a4];
  BOOL v6 = [(NUVersion *)self compare:v5] != -1;

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t major = self->_major;
  if (major == [v4 major])
  {
    int64_t minor = self->_minor;
    if (minor == [v4 minor])
    {
      int64_t v7 = 0;
      goto LABEL_9;
    }
    int64_t v8 = self->_minor;
    uint64_t v9 = [v4 minor];
  }
  else
  {
    int64_t v8 = self->_major;
    uint64_t v9 = [v4 major];
  }
  if (v8 > v9) {
    int64_t v7 = 1;
  }
  else {
    int64_t v7 = -1;
  }
LABEL_9:

  return v7;
}

- (NSString)stringRepresentation
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%d.%d", -[NUVersion major](self, "major"), -[NUVersion minor](self, "minor"));
}

- (NUVersion)initWithMajor:(int64_t)a3 minor:(int64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 0x3B9AC9FF)
  {
    id v4 = NUAssertLogger_28614();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "major >= 0 && major <= kMajorVersionLimit");
      *(_DWORD *)buf = 138543362;
      v37 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v7 = NUAssertLogger_28614();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v37 = v18;
        __int16 v38 = 2114;
        v39 = v22;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v37 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVersion initWithMajor:minor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUVersion.m", 32, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"major >= 0 && major <= kMajorVersionLimit");
  }
  if ((unint64_t)a4 > 0x3B9AC9FF)
  {
    v11 = NUAssertLogger_28614();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "minor >= 0 && minor <= kMinorVersionLimit");
      *(_DWORD *)buf = 138543362;
      v37 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_28614();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        __int16 v38 = 2114;
        v39 = v31;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v37 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVersion initWithMajor:minor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUVersion.m", 33, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"minor >= 0 && minor <= kMinorVersionLimit");
  }
  self->_int64_t major = a3;
  self->_int64_t minor = a4;
  return self;
}

- (NUVersion)init
{
  return [(NUVersion *)self initWithMajor:1 minor:0];
}

+ (id)regularExpression
{
  if (regularExpression_onceToken != -1) {
    dispatch_once(&regularExpression_onceToken, &__block_literal_global_28646);
  }
  v2 = (void *)regularExpression_formatVersionRegex;

  return v2;
}

void __30__NUVersion_regularExpression__block_invoke()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^([0-9]|[1-9][0-9]{0,8})\\.([0-9]|[1-9][0-9]{0,8})$" options:0 error:&v19];
  id v1 = v19;
  v2 = (void *)regularExpression_formatVersionRegex;
  regularExpression_formatVersionRegex = v0;

  if (!regularExpression_formatVersionRegex)
  {
    v3 = NUAssertLogger_28614();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [NSString stringWithFormat:@"unable to create regex for pattern: %@", @"^([0-9]|[1-9][0-9]{0,8})\\.([0-9]|[1-9][0-9]{0,8})$"];
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v6 = NUAssertLogger_28614();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        v13 = [v11 callStackSymbols];
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
      BOOL v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVersion regularExpression]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUVersion.m", 175, @"unable to create regex for pattern: %@", v15, v16, v17, v18, @"^([0-9]|[1-9][0-9]{0,8})\\.([0-9]|[1-9][0-9]{0,8})$");
  }
}

+ (BOOL)validateVersionString:(id)a3 major:(int64_t *)a4 minor:(int64_t *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 length];
  uint64_t v9 = +[NUVersion regularExpression];
  v10 = objc_msgSend(v9, "firstMatchInString:options:range:", v7, 0, 0, v8);

  if (v10 && ([v10 rangeAtIndex:0], v8 == v11))
  {
    BOOL v12 = 1;
    if (a4 && a5)
    {
      BOOL v12 = 1;
      uint64_t v13 = [v10 rangeAtIndex:1];
      uint64_t v15 = objc_msgSend(v7, "substringWithRange:", v13, v14);
      *a4 = [v15 integerValue];

      uint64_t v16 = [v10 rangeAtIndex:2];
      uint64_t v18 = objc_msgSend(v7, "substringWithRange:", v16, v17);
      *a5 = [v18 integerValue];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)validateVersionString:(id)a3
{
  return [a1 validateVersionString:a3 major:0 minor:0];
}

+ (NUVersion)versionWithString:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v9 = NUAssertLogger_28614();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "string != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v12 = NUAssertLogger_28614();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        uint64_t v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        id v19 = [v17 callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v16;
        __int16 v27 = 2114;
        v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVersion versionWithString:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUVersion.m", 48, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"string != nil");
  }
  BOOL v5 = v4;
  uint64_t v25 = 0;
  *(void *)buf = 0;
  BOOL v6 = 0;
  if ([a1 validateVersionString:v4 major:buf minor:&v25])
  {
    id v7 = objc_alloc((Class)a1);
    BOOL v6 = (void *)[v7 initWithMajor:*(void *)buf minor:v25];
  }

  return (NUVersion *)v6;
}

+ (NUVersion)versionWithPackedUInt32:(unsigned int)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithMajor:HIWORD(a3) minor:(unsigned __int16)a3];

  return (NUVersion *)v3;
}

+ (id)versionOne
{
  v2 = (void *)[objc_alloc((Class)a1) initWithMajor:1 minor:0];

  return v2;
}

+ (id)versionZero
{
  v2 = (void *)[objc_alloc((Class)a1) initWithMajor:0 minor:0];

  return v2;
}

@end