@interface PIPhotoEditAdjustmentsVersion
+ (id)versionFromString:(id)a3;
+ (id)versionWithMajor:(unint64_t)a3 minor:(unint64_t)a4 subMinor:(unint64_t)a5 platform:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAdjustmentVersion:(id)a3;
- (NSString)platform;
- (NSString)string;
- (PIPhotoEditAdjustmentsVersion)init;
- (PIPhotoEditAdjustmentsVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 subMinor:(unint64_t)a5;
- (PIPhotoEditAdjustmentsVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 subMinor:(unint64_t)a5 platform:(id)a6;
- (id)description;
- (int64_t)asOrderedInteger;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)subMinorVersion;
@end

@implementation PIPhotoEditAdjustmentsVersion

- (void).cxx_destruct
{
}

- (NSString)platform
{
  return self->_platform;
}

- (unint64_t)subMinorVersion
{
  return self->_subMinorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PIPhotoEditAdjustmentsVersion;
  v3 = [(PIPhotoEditAdjustmentsVersion *)&v7 description];
  v4 = [(PIPhotoEditAdjustmentsVersion *)self string];
  v5 = [v3 stringByAppendingFormat:@" %@", v4];

  return v5;
}

- (BOOL)isEqualToAdjustmentVersion:(id)a3
{
  id v4 = a3;
  v5 = [(PIPhotoEditAdjustmentsVersion *)self string];
  v6 = [v4 string];

  LOBYTE(v4) = [v5 caseInsensitiveCompare:v6] == 0;
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PIPhotoEditAdjustmentsVersion *)self isEqualToAdjustmentVersion:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(PIPhotoEditAdjustmentsVersion *)self string];
  unint64_t v3 = 0xAAAC9C5260601 * [v2 hash];

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PIPhotoEditAdjustmentsVersion *)self asOrderedInteger];
  uint64_t v6 = [v4 asOrderedInteger];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 != v6;
  }
}

- (int64_t)asOrderedInteger
{
  return 1000000 * self->_majorVersion + 1000 * self->_minorVersion + self->_subMinorVersion;
}

- (NSString)string
{
  unint64_t subMinorVersion = self->_subMinorVersion;
  if (subMinorVersion)
  {
    objc_msgSend(NSString, "stringWithFormat:", @".%lu", subMinorVersion);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &stru_1EFFD8610;
  }
  if (self->_platform)
  {
    int64_t v5 = [NSString stringWithFormat:@".%@", self->_platform];
  }
  else
  {
    int64_t v5 = &stru_1EFFD8610;
  }
  uint64_t v6 = [NSString stringWithFormat:@"%lu.%lu%@%@", self->_majorVersion, self->_minorVersion, v4, v5];

  return (NSString *)v6;
}

- (PIPhotoEditAdjustmentsVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 subMinor:(unint64_t)a5
{
  return [(PIPhotoEditAdjustmentsVersion *)self initWithMajor:a3 minor:a4 subMinor:a5 platform:0];
}

- (PIPhotoEditAdjustmentsVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 subMinor:(unint64_t)a5 platform:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PIPhotoEditAdjustmentsVersion;
  v11 = [(PIPhotoEditAdjustmentsVersion *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_majorVersion = a3;
    v11->_minorVersion = a4;
    v11->_unint64_t subMinorVersion = a5;
    uint64_t v13 = [v10 copy];
    platform = v12->_platform;
    v12->_platform = (NSString *)v13;
  }
  return v12;
}

- (PIPhotoEditAdjustmentsVersion)init
{
  return [(PIPhotoEditAdjustmentsVersion *)self initWithMajor:0 minor:0 subMinor:0];
}

+ (id)versionFromString:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    v22 = 0;
    goto LABEL_41;
  }
  int64_t v5 = [v3 componentsSeparatedByString:@"."];
  if (![v5 count])
  {
    v20 = 0;
LABEL_35:
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_7608);
    }
    v23 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "invalid format version: %@", buf, 0xCu);
    }
    v21 = 0;
    goto LABEL_40;
  }
  v25 = v4;
  v26 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = -1;
  char v8 = 1;
  uint64_t v9 = -1;
  uint64_t v10 = -1;
  do
  {
    v11 = objc_msgSend(v5, "objectAtIndexedSubscript:", v6, v25);
    v12 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    uint64_t v13 = [v12 invertedSet];

    if ([v11 length] && objc_msgSend(v11, "rangeOfCharacterFromSet:", v13) == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v14 = [v11 intValue];
      if (v6 == 1) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v9;
      }
      if (v6 == 1) {
        char v16 = (v14 >= 0) & v8;
      }
      else {
        char v16 = 0;
      }
      if (v6 == 2) {
        uint64_t v17 = v14;
      }
      else {
        uint64_t v17 = v10;
      }
      if (v6 == 2)
      {
        uint64_t v15 = v9;
        char v16 = (v14 >= 0) & v8;
      }
      if (v6)
      {
        uint64_t v10 = v17;
        uint64_t v9 = v15;
        char v8 = v16;
      }
      else
      {
        uint64_t v7 = v14;
        v8 &= v14 >= 0;
      }
    }
    else if (v6 == [v5 count] - 1 {
           && (([v11 isEqual:@"OSX"] & 1) != 0
    }
            || [v11 isEqual:@"iOS"]))
    {
      id v18 = v11;

      v26 = v18;
    }
    else
    {
      char v8 = 0;
    }

    ++v6;
  }
  while (v6 < [v5 count]);
  if ((v8 & (v7 >= 0)) != 1 || v9 < 0)
  {
    id v4 = v25;
    v20 = v26;
    goto LABEL_35;
  }
  if (v10 == -1) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v10;
  }
  v20 = v26;
  v21 = [[PIPhotoEditAdjustmentsVersion alloc] initWithMajor:v7 minor:v9 subMinor:v19 platform:v26];
  id v4 = v25;
LABEL_40:
  v22 = v21;

LABEL_41:
  return v22;
}

+ (id)versionWithMajor:(unint64_t)a3 minor:(unint64_t)a4 subMinor:(unint64_t)a5 platform:(id)a6
{
  id v10 = a6;
  v11 = (void *)[objc_alloc((Class)a1) initWithMajor:a3 minor:a4 subMinor:a5 platform:v10];

  return v11;
}

@end