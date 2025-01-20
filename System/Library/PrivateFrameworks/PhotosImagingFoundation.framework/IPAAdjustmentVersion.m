@interface IPAAdjustmentVersion
+ (id)validatePlatformString:(id)a3;
+ (id)versionForMajor:(unint64_t)a3 minor:(unint64_t)a4;
+ (id)versionForMajor:(unint64_t)a3 minor:(unint64_t)a4 platform:(id)a5;
+ (id)versionFromArchivalRepresentation:(id)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAdjustmentVersion:(id)a3;
- (IPAAdjustmentVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 platform:(id)a5;
- (NSString)platform;
- (id)archivalRepresentation;
- (id)debugDescription;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (void)setMinorVersion:(unint64_t)a3;
@end

@implementation IPAAdjustmentVersion

- (void).cxx_destruct
{
}

- (NSString)platform
{
  return self->_platform;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (id)debugDescription
{
  v2 = NSString;
  v3 = [(IPAAdjustmentVersion *)self archivalRepresentation];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)isEqualToAdjustmentVersion:(id)a3
{
  id v4 = a3;
  v5 = [(IPAAdjustmentVersion *)self archivalRepresentation];
  v6 = [v4 archivalRepresentation];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(IPAAdjustmentVersion *)self isEqualToAdjustmentVersion:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(IPAAdjustmentVersion *)self archivalRepresentation];
  if (v2)
  {
    v3 = v2;
    unint64_t v4 = [v2 hash];

    return v4;
  }
  else
  {
    v6 = (IPAAdjustmentVersion *)_PFAssertFailHandler();
    [(IPAAdjustmentVersion *)v6 setMinorVersion:v8];
  }
  return result;
}

- (void)setMinorVersion:(unint64_t)a3
{
  if (a3 >= 0x3E8)
  {
    v3 = (IPAAdjustmentVersion *)_PFAssertFailHandler();
    [(IPAAdjustmentVersion *)v3 compare:v5];
  }
  else
  {
    self->_minorVersion = a3;
  }
}

- (int64_t)compare:(id)a3
{
  int64_t v3 = self->_minorVersion + 1000 * self->_majorVersion;
  id v4 = a3;
  uint64_t v5 = [v4 majorVersion];
  uint64_t v6 = [v4 minorVersion];

  int64_t v7 = v6 + 1000 * v5;
  BOOL v8 = v3 < v7;
  int64_t v9 = v3 != v7;
  if (v8) {
    return -1;
  }
  else {
    return v9;
  }
}

- (id)archivalRepresentation
{
  unint64_t minorVersion = self->_minorVersion;
  platform = self->_platform;
  if (minorVersion)
  {
    if (!platform)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu.%lu", self->_majorVersion, minorVersion, v6);
      id v4 = LABEL_6:;
      goto LABEL_7;
    }
LABEL_5:
    [NSString stringWithFormat:@"%lu.%lu.%@", self->_majorVersion, self->_minorVersion, platform];
    goto LABEL_6;
  }
  if (platform) {
    goto LABEL_5;
  }
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_majorVersion];
LABEL_7:
  return v4;
}

- (IPAAdjustmentVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 platform:(id)a5
{
  if (a4 < 0x3E8)
  {
    uint64_t v10 = +[IPAAdjustmentVersion validatePlatformString:a5];
    v11 = (void *)v10;
    if (!a5 || v10)
    {
      v14.receiver = self;
      v14.super_class = (Class)IPAAdjustmentVersion;
      v12 = [(IPAAdjustmentVersion *)&v14 init];
      uint64_t v6 = v12;
      if (v12)
      {
        v12->_majorVersion = a3;
        v12->_unint64_t minorVersion = a4;
        objc_storeStrong((id *)&v12->_platform, v11);
      }
    }
    else
    {

      uint64_t v6 = 0;
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

+ (id)versionFromArchivalRepresentation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[IPAAdjustmentVersion versionForMajor:minor:](IPAAdjustmentVersion, "versionForMajor:minor:", [v3 unsignedIntegerValue], 0);
    id v4 = (IPAAdjustmentVersion *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = [v3 lowercaseString];
  uint64_t v6 = [v5 length];
  int64_t v7 = objc_msgSend((id)s_platformFormatVersionRegex, "firstMatchInString:options:range:", v5, 0, 0, v6);
  if (v7)
  {
    BOOL v8 = v7;
    uint64_t v9 = [v7 rangeAtIndex:1];
    v11 = objc_msgSend(v5, "substringWithRange:", v9, v10);
    uint64_t v12 = [v11 integerValue];

    uint64_t v13 = [v8 rangeAtIndex:2];
    v15 = objc_msgSend(v5, "substringWithRange:", v13, v14);
    uint64_t v16 = [v15 integerValue];

    uint64_t v17 = [v8 rangeAtIndex:3];
    v19 = objc_msgSend(v5, "substringWithRange:", v17, v18);
  }
  else
  {
    v20 = objc_msgSend((id)s_formatVersionRegex, "firstMatchInString:options:range:", v5, 0, 0, v6);
    if (v20)
    {
      BOOL v8 = v20;
      uint64_t v21 = [v20 rangeAtIndex:1];
      v23 = objc_msgSend(v5, "substringWithRange:", v21, v22);
      uint64_t v12 = [v23 integerValue];

      uint64_t v24 = [v8 rangeAtIndex:2];
      v26 = objc_msgSend(v5, "substringWithRange:", v24, v25);
      uint64_t v16 = [v26 integerValue];

      v19 = 0;
    }
    else
    {
      v27 = objc_msgSend((id)s_formatVersionSimpleRegex, "firstMatchInString:options:range:", v5, 0, 0, v6);
      if (!v27)
      {
        id v4 = 0;
        goto LABEL_12;
      }
      BOOL v8 = v27;
      uint64_t v28 = [v27 rangeAtIndex:1];
      v30 = objc_msgSend(v5, "substringWithRange:", v28, v29);
      uint64_t v12 = [v30 integerValue];

      v19 = 0;
      uint64_t v16 = 0;
    }
  }
  id v4 = [[IPAAdjustmentVersion alloc] initWithMajor:v12 minor:v16 platform:v19];

LABEL_12:
LABEL_13:

  return v4;
}

+ (id)versionForMajor:(unint64_t)a3 minor:(unint64_t)a4
{
  return (id)[a1 versionForMajor:a3 minor:a4 platform:0];
}

+ (id)versionForMajor:(unint64_t)a3 minor:(unint64_t)a4 platform:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithMajor:a3 minor:a4 platform:v8];

  return v9;
}

+ (id)validatePlatformString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = (id)s_validPlatforms;
    id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (!objc_msgSend(v3, "compare:options:", v8, 3, (void)v10))
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (void)initialize
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!s_formatVersionRegex)
  {
    id v20 = 0;
    uint64_t v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^([0-9]+)\\.([0-9]+)$" options:0 error:&v20];
    id v3 = v20;
    id v4 = (void *)s_formatVersionRegex;
    s_formatVersionRegex = v2;

    if (!s_formatVersionRegex)
    {
      id v5 = IPAAdjustmentGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = @"^([0-9]+)\\.([0-9]+)$";
        _os_log_impl(&dword_1DD3FD000, v5, OS_LOG_TYPE_ERROR, "unable to create regex for pattern: %@", buf, 0xCu);
      }
    }
    id v19 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^([0-9]+)\\.([0-9]+)\\.(osx|ios)$" options:0 error:&v19];
    id v7 = v19;
    id v8 = (void *)s_platformFormatVersionRegex;
    s_platformFormatVersionRegex = v6;

    if (!s_platformFormatVersionRegex)
    {
      uint64_t v9 = IPAAdjustmentGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = @"^([0-9]+)\\.([0-9]+)\\.(osx|ios)$";
        _os_log_impl(&dword_1DD3FD000, v9, OS_LOG_TYPE_ERROR, "unable to create regex for pattern: %@", buf, 0xCu);
      }
    }
    id v18 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^([0-9]+)$" options:0 error:&v18];
    id v11 = v18;
    long long v12 = (void *)s_formatVersionSimpleRegex;
    s_formatVersionSimpleRegex = v10;

    if (!s_formatVersionSimpleRegex)
    {
      long long v13 = IPAAdjustmentGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = @"^([0-9]+)$";
        _os_log_impl(&dword_1DD3FD000, v13, OS_LOG_TYPE_ERROR, "unable to create regex for pattern: %@", buf, 0xCu);
      }
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = @"OSX";
    v21[1] = @"iOS";
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    uint64_t v16 = [v14 setWithArray:v15];
    uint64_t v17 = (void *)s_validPlatforms;
    s_validPlatforms = v16;
  }
}

@end