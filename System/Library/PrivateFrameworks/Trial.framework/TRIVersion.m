@interface TRIVersion
+ (id)parseVersionFromString:(id)a3 withPrefix:(id)a4;
+ (id)versionWithMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVersion:(id)a3;
- (NSNumber)majorVersion;
- (NSNumber)minorVersion;
- (NSNumber)patchVersion;
- (TRIVersion)initWithMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5;
- (id)copyWithReplacementMajorVersion:(id)a3;
- (id)copyWithReplacementMinorVersion:(id)a3;
- (id)copyWithReplacementPatchVersion:(id)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation TRIVersion

+ (id)parseVersionFromString:(id)a3 withPrefix:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"TRIVersion+Factory.m", 18, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  id v9 = v7;
  v10 = v9;
  if (v8)
  {
    v10 = v9;
    if ([v8 length])
    {
      if (([v9 hasPrefix:v8] & 1) == 0)
      {
        v18 = [[TRIVersion alloc] initWithMajorVersion:&unk_1EEFCBEB8 minorVersion:&unk_1EEFCBEB8 patchVersion:&unk_1EEFCBEB8];
        v10 = v9;
        goto LABEL_18;
      }
      v10 = objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v8, "length"));

      if (!v10)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2 object:a1 file:@"TRIVersion+Factory.m" lineNumber:27 description:@"expected version string to be not nil"];

        v10 = 0;
      }
    }
  }
  v11 = [v10 componentsSeparatedByString:@"."];
  v12 = v11;
  if (v11)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __57__TRIVersion_Factory__parseVersionFromString_withPrefix___block_invoke;
    v25[3] = &unk_1E596B600;
    id v26 = v11;
    v13 = (uint64_t (**)(void, void, void))MEMORY[0x19F3AD290](v25);
    char v24 = 1;
    v14 = [TRIVersion alloc];
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", ((uint64_t (**)(void, void, char *))v13)[2](v13, 0, &v24));
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", ((uint64_t (**)(void, uint64_t, char *))v13)[2](v13, 1, &v24));
    v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", ((uint64_t (**)(void, uint64_t, char *))v13)[2](v13, 2, &v24));
    v18 = [(TRIVersion *)v14 initWithMajorVersion:v15 minorVersion:v16 patchVersion:v17];

    if (!v24)
    {
      v19 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v9;
        _os_log_impl(&dword_19D909000, v19, OS_LOG_TYPE_DEFAULT, "error in parsing version string %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v20 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_impl(&dword_19D909000, v20, OS_LOG_TYPE_DEFAULT, "could not parse version string %@", buf, 0xCu);
    }

    v18 = [[TRIVersion alloc] initWithMajorVersion:&unk_1EEFCBEB8 minorVersion:&unk_1EEFCBEB8 patchVersion:&unk_1EEFCBEB8];
  }

LABEL_18:
  return v18;
}

uint64_t __57__TRIVersion_Factory__parseVersionFromString_withPrefix___block_invoke(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  if (!*a3 || [*(id *)(a1 + 32) count] <= a2) {
    return 0;
  }
  v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v9 = -1;
  if (!+[TRIMisc convertFromString:v6 usingBase:10 toI64:&v9]|| (uint64_t v7 = v9, v9 < 0))
  {
    uint64_t v7 = 0;
    *a3 = 0;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(TRIVersion *)self majorVersion];
  v6 = [v4 majorVersion];
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    id v8 = [(TRIVersion *)self minorVersion];
    uint64_t v9 = [v4 minorVersion];
    int64_t v7 = [v8 compare:v9];

    if (!v7)
    {
      v10 = [(TRIVersion *)self patchVersion];
      v11 = [v4 patchVersion];
      int64_t v7 = [v10 compare:v11];
    }
  }

  return v7;
}

- (TRIVersion)initWithMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 310, @"Invalid parameter not satisfying: %@", @"minorVersion != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 309, @"Invalid parameter not satisfying: %@", @"majorVersion != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 311, @"Invalid parameter not satisfying: %@", @"patchVersion != nil" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)TRIVersion;
  v13 = [(TRIVersion *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_majorVersion, a3);
    objc_storeStrong((id *)&v14->_minorVersion, a4);
    objc_storeStrong((id *)&v14->_patchVersion, a5);
  }

  return v14;
}

+ (id)versionWithMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithMajorVersion:v10 minorVersion:v9 patchVersion:v8];

  return v11;
}

- (id)copyWithReplacementMajorVersion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMajorVersion:v4 minorVersion:self->_minorVersion patchVersion:self->_patchVersion];

  return v5;
}

- (id)copyWithReplacementMinorVersion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMajorVersion:self->_majorVersion minorVersion:v4 patchVersion:self->_patchVersion];

  return v5;
}

- (id)copyWithReplacementPatchVersion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMajorVersion:self->_majorVersion minorVersion:self->_minorVersion patchVersion:v4];

  return v5;
}

- (BOOL)isEqualToVersion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = self->_majorVersion != 0;
  int64_t v7 = [v4 majorVersion];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_11;
  }
  majorVersion = self->_majorVersion;
  if (majorVersion)
  {
    id v10 = [v5 majorVersion];
    int v11 = [(NSNumber *)majorVersion isEqual:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  int v12 = self->_minorVersion != 0;
  v13 = [v5 minorVersion];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_11;
  }
  minorVersion = self->_minorVersion;
  if (minorVersion)
  {
    v16 = [v5 minorVersion];
    int v17 = [(NSNumber *)minorVersion isEqual:v16];

    if (!v17) {
      goto LABEL_11;
    }
  }
  int v18 = self->_patchVersion != 0;
  objc_super v19 = [v5 patchVersion];
  int v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    char v23 = 0;
  }
  else
  {
    patchVersion = self->_patchVersion;
    if (patchVersion)
    {
      v22 = [v5 patchVersion];
      char v23 = [(NSNumber *)patchVersion isEqual:v22];
    }
    else
    {
      char v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIVersion *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIVersion *)self isEqualToVersion:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_majorVersion hash];
  uint64_t v4 = [(NSNumber *)self->_minorVersion hash] - v3 + 32 * v3;
  return [(NSNumber *)self->_patchVersion hash] - v4 + 32 * v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIVersion | majorVersion:%@ minorVersion:%@ patchVersion:%@>", self->_majorVersion, self->_minorVersion, self->_patchVersion];
  return v2;
}

- (NSNumber)majorVersion
{
  return self->_majorVersion;
}

- (NSNumber)minorVersion
{
  return self->_minorVersion;
}

- (NSNumber)patchVersion
{
  return self->_patchVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patchVersion, 0);
  objc_storeStrong((id *)&self->_minorVersion, 0);
  objc_storeStrong((id *)&self->_majorVersion, 0);
}

@end