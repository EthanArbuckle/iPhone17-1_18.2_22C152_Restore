@interface STDynamicActivityAttribution
+ (BOOL)supportsSecureCoding;
+ (id)attributionForClientAuditToken:(id *)a3 clientExecutablePath:(id)a4 bundleID:(id)a5 localizationKey:(id)a6;
+ (id)attributionForClientAuditToken:(id *)a3 maskingClientAuditToken:(id *)a4 clientExecutablePath:(id)a5 maskingClientExecutablePath:(id)a6 localizationKey:(id)a7;
+ (id)attributionForClientAuditToken:(id *)a3 maskingClientAuditToken:(id *)a4 clientExecutablePath:(id)a5 maskingClientExecutablePath:(id)a6 stringWithFormat:(id)a7;
+ (id)attributionForClientAuditToken:(id *)a3 maskingClientAuditToken:(id *)a4 clientExecutablePath:(id)a5 maskingClientExecutablePath:(id)a6 website:(id)a7;
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- ($115C4C562B26FF47E01F9F4EA65B5887)maskingClientAuditToken;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)clientExecutablePath;
- (NSString)formattedString;
- (NSString)localizationKey;
- (NSString)maskingClientExecutablePath;
- (NSString)website;
- (STDynamicActivityAttribution)initWithCoder:(id)a3;
- (id)description;
- (void)_initWithClientAuditToken:(void *)a3 clientExecutablePath:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STDynamicActivityAttribution

- (NSString)clientExecutablePath
{
  return self->_clientExecutablePath;
}

+ (id)attributionForClientAuditToken:(id *)a3 clientExecutablePath:(id)a4 bundleID:(id)a5 localizationKey:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v23 = NSStringFromSelector(a2);
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = a1;
        __int16 v31 = 2114;
        v32 = @"STDynamicActivityAttribution.m";
        __int16 v33 = 1024;
        int v34 = 17;
        __int16 v35 = 2114;
        v36 = v22;
        _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v22 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D954F0BCLL);
    }

    if (!v12) {
      goto LABEL_8;
    }
  }
  else if (!v12)
  {
    v16 = 0;
    goto LABEL_11;
  }
  NSClassFromString(&cfstr_Nsstring.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v27 = NSStringFromSelector(a2);
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = a1;
      __int16 v31 = 2114;
      v32 = @"STDynamicActivityAttribution.m";
      __int16 v33 = 1024;
      int v34 = 18;
      __int16 v35 = 2114;
      v36 = v26;
      _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D954F1B4);
  }

LABEL_8:
  v14 = [STDynamicActivityAttribution alloc];
  long long v15 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v15;
  v16 = -[STDynamicActivityAttribution _initWithClientAuditToken:clientExecutablePath:](v14, (long long *)buf, v11);
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    v18 = (void *)v16[1];
    v16[1] = v17;

    uint64_t v19 = [v13 copy];
    v20 = (void *)v16[2];
    v16[2] = v19;
  }
LABEL_11:

  return v16;
}

- (void)_initWithClientAuditToken:(void *)a3 clientExecutablePath:
{
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [a1 init];
    a1 = (void *)v7;
    if (v7)
    {
      long long v8 = *a2;
      *(_OWORD *)(v7 + 72) = a2[1];
      *(_OWORD *)(v7 + 56) = v8;
      objc_storeStrong((id *)(v7 + 40), a3);
    }
  }

  return a1;
}

+ (id)attributionForClientAuditToken:(id *)a3 maskingClientAuditToken:(id *)a4 clientExecutablePath:(id)a5 maskingClientExecutablePath:(id)a6 localizationKey:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v27 = NSStringFromSelector(a2);
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = a1;
        __int16 v31 = 2114;
        v32 = @"STDynamicActivityAttribution.m";
        __int16 v33 = 1024;
        int v34 = 32;
        __int16 v35 = 2114;
        v36 = v26;
        _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D954F45CLL);
    }

    v16 = [STDynamicActivityAttribution alloc];
    long long v17 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf[16] = v17;
    v18 = (char *)-[STDynamicActivityAttribution _initWithClientAuditToken:clientExecutablePath:](v16, (long long *)buf, v13);
    uint64_t v19 = v18;
    if (v18)
    {
      long long v20 = *(_OWORD *)a4->var0;
      *(_OWORD *)(v18 + 104) = *(_OWORD *)&a4->var0[4];
      *(_OWORD *)(v18 + 88) = v20;
      uint64_t v21 = [v14 copy];
      v22 = (void *)v19[6];
      v19[6] = v21;

      uint64_t v23 = [v15 copy];
      v24 = (void *)v19[2];
      v19[2] = v23;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

+ (id)attributionForClientAuditToken:(id *)a3 maskingClientAuditToken:(id *)a4 clientExecutablePath:(id)a5 maskingClientExecutablePath:(id)a6 stringWithFormat:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v27 = NSStringFromSelector(a2);
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = a1;
        __int16 v31 = 2114;
        v32 = @"STDynamicActivityAttribution.m";
        __int16 v33 = 1024;
        int v34 = 47;
        __int16 v35 = 2114;
        v36 = v26;
        _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D954F698);
    }

    v16 = [STDynamicActivityAttribution alloc];
    long long v17 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf[16] = v17;
    v18 = (char *)-[STDynamicActivityAttribution _initWithClientAuditToken:clientExecutablePath:](v16, (long long *)buf, v13);
    uint64_t v19 = v18;
    if (v18)
    {
      long long v20 = *(_OWORD *)a4->var0;
      *(_OWORD *)(v18 + 104) = *(_OWORD *)&a4->var0[4];
      *(_OWORD *)(v18 + 88) = v20;
      uint64_t v21 = [v14 copy];
      v22 = (void *)v19[6];
      v19[6] = v21;

      uint64_t v23 = [v15 copy];
      v24 = (void *)v19[3];
      v19[3] = v23;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

+ (id)attributionForClientAuditToken:(id *)a3 maskingClientAuditToken:(id *)a4 clientExecutablePath:(id)a5 maskingClientExecutablePath:(id)a6 website:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v27 = NSStringFromSelector(a2);
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = a1;
        __int16 v31 = 2114;
        v32 = @"STDynamicActivityAttribution.m";
        __int16 v33 = 1024;
        int v34 = 62;
        __int16 v35 = 2114;
        v36 = v26;
        _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D954F8D4);
    }

    v16 = [STDynamicActivityAttribution alloc];
    long long v17 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf[16] = v17;
    v18 = (char *)-[STDynamicActivityAttribution _initWithClientAuditToken:clientExecutablePath:](v16, (long long *)buf, v13);
    uint64_t v19 = v18;
    if (v18)
    {
      long long v20 = *(_OWORD *)a4->var0;
      *(_OWORD *)(v18 + 104) = *(_OWORD *)&a4->var0[4];
      *(_OWORD *)(v18 + 88) = v20;
      uint64_t v21 = [v14 copy];
      v22 = (void *)v19[6];
      v19[6] = v21;

      uint64_t v23 = [v15 copy];
      v24 = (void *)v19[4];
      v19[4] = v23;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v4 = BSVersionedPIDForAuditToken(), v4 == BSVersionedPIDForAuditToken())
    && (uint64_t v5 = BSVersionedPIDForAuditToken(), v5 == BSVersionedPIDForAuditToken())
    && BSEqualStrings()
    && BSEqualStrings()
    && BSEqualStrings()
    && BSEqualStrings()
    && BSEqualStrings())
  {
    char v6 = BSEqualStrings();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  uint64_t v2 = (uint64_t)self;
  if (self)
  {
    id v3 = NSString;
    uint64_t v4 = [(NSString *)self->_clientExecutablePath lastPathComponent];
    uint64_t v5 = [v3 stringWithFormat:@"%@:%d", v4, BSPIDForAuditToken()];

    char v6 = NSString;
    uint64_t v7 = [*(id *)(v2 + 48) lastPathComponent];
    long long v8 = [v6 stringWithFormat:@"%@:%d", v7, BSPIDForAuditToken()];

    v9 = [MEMORY[0x1E4F4F718] builderWithObject:v2];
    id v10 = (id)[v9 appendObject:v5 withName:@"client"];
    id v11 = (id)[v9 appendObject:v8 withName:@"maskingClient"];
    id v12 = (id)[v9 appendObject:*(void *)(v2 + 8) withName:@"bundleID" skipIfNil:1];
    id v13 = (id)[v9 appendObject:*(void *)(v2 + 16) withName:@"locKey" skipIfNil:1];
    id v14 = (id)[v9 appendObject:*(void *)(v2 + 24) withName:@"formattedString" skipIfNil:1];
    if (*(void *)(v2 + 32)) {
      id v15 = @"YES";
    }
    else {
      id v15 = 0;
    }
    id v16 = (id)[v9 appendObject:v15 withName:@"websiteNonNil" skipIfNil:1];

    uint64_t v2 = [v9 build];
  }

  return (id)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F4F6A8];
  long long v5 = *(_OWORD *)&self->_clientAuditToken.val[4];
  long long v10 = *(_OWORD *)self->_clientAuditToken.val;
  long long v11 = v5;
  id v6 = a3;
  uint64_t v7 = [v4 tokenFromAuditToken:&v10];
  objc_msgSend(v6, "encodeObject:forKey:", v7, @"_clientAuditToken", v10, v11);

  [v6 encodeObject:self->_clientExecutablePath forKey:@"_clientExecutablePath"];
  long long v8 = *(_OWORD *)&self->_maskingClientAuditToken.val[4];
  long long v10 = *(_OWORD *)self->_maskingClientAuditToken.val;
  long long v11 = v8;
  v9 = [MEMORY[0x1E4F4F6A8] tokenFromAuditToken:&v10];
  [v6 encodeObject:v9 forKey:@"_maskingClientAuditToken"];

  [v6 encodeObject:self->_maskingClientExecutablePath forKey:@"_maskingClientExecutablePath"];
  [v6 encodeObject:self->_bundleIdentifier forKey:@"_bundleIdentifier"];
  [v6 encodeObject:self->_localizationKey forKey:@"_localizationKey"];
  [v6 encodeObject:self->_formattedString forKey:@"_formattedString"];
  [v6 encodeObject:self->_website forKey:@"_website"];
}

- (STDynamicActivityAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientAuditToken"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientExecutablePath"];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    long long v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maskingClientAuditToken"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maskingClientExecutablePath"];
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      [v5 realToken];
      [v10 realToken];
      id v13 = v7;
      id v14 = v12;
      if (self)
      {
        id v15 = [(STDynamicActivityAttribution *)self init];
        self = v15;
        if (v15)
        {
          long long v16 = v27[5];
          *(_OWORD *)v15->_clientAuditToken.val = v27[4];
          *(_OWORD *)&v15->_clientAuditToken.val[4] = v16;
          objc_storeStrong((id *)&v15->_clientExecutablePath, v7);
          long long v17 = v27[3];
          *(_OWORD *)self->_maskingClientAuditToken.val = v27[2];
          *(_OWORD *)&self->_maskingClientAuditToken.val[4] = v17;
          objc_storeStrong((id *)&self->_maskingClientExecutablePath, v12);
        }
      }
    }
    else
    {
      [v5 realToken];
      self = (STDynamicActivityAttribution *)-[STDynamicActivityAttribution _initWithClientAuditToken:clientExecutablePath:](self, v27, v7);
    }
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v18;

    long long v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localizationKey"];
    localizationKey = self->_localizationKey;
    self->_localizationKey = v20;

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_formattedString"];
    formattedString = self->_formattedString;
    self->_formattedString = v22;

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_website"];
    website = self->_website;
    self->_website = v24;

    self = self;
    v9 = self;
  }

  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)localizationKey
{
  return self->_localizationKey;
}

- (NSString)formattedString
{
  return self->_formattedString;
}

- (NSString)website
{
  return self->_website;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  long long v3 = *(_OWORD *)&self[2].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)maskingClientAuditToken
{
  long long v3 = *(_OWORD *)&self[3].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSString)maskingClientExecutablePath
{
  return self->_maskingClientExecutablePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskingClientExecutablePath, 0);
  objc_storeStrong((id *)&self->_clientExecutablePath, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_formattedString, 0);
  objc_storeStrong((id *)&self->_localizationKey, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end