@interface STExecutableIdentity
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)hasAuditToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemExecutable;
- (BOOL)matchesExecutableIdentity:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)description;
- (NSString)executablePath;
- (NSString)personaUniqueString;
- (STExecutableIdentity)initWithApplicationBundleIdentifier:(id)a3;
- (STExecutableIdentity)initWithApplicationBundleIdentifier:(id)a3 personaUniqueString:(id)a4;
- (STExecutableIdentity)initWithAuditToken:(id *)a3;
- (STExecutableIdentity)initWithAuditToken:(id *)a3 bundlePath:(id)a4 executablePath:(id)a5 bundleIdentifier:(id)a6 personaUniqueString:(id)a7 systemExecutable:(BOOL)a8;
- (STExecutableIdentity)initWithAuditToken:(id *)a3 bundlePath:(id)a4 executablePath:(id)a5 systemExecutable:(BOOL)a6;
- (STExecutableIdentity)initWithBundlePath:(id)a3;
- (STExecutableIdentity)initWithCoder:(id)a3;
- (STExecutableIdentity)initWithExecutablePath:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithBSAuditToken:(void *)a3 bundlePath:(void *)a4 executablePath:(void *)a5 bundleIdentifier:(void *)a6 personaUniqueString:(char)a7 systemExecutable:;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STExecutableIdentity

- (STExecutableIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bsAuditToken"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundlePath"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executablePath"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueString"];
  char v10 = [v4 decodeBoolForKey:@"systemExecutable"];

  v11 = (STExecutableIdentity *)-[STExecutableIdentity initWithBSAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, v5, v6, v7, v8, v9, v10);
  return v11;
}

- (id)initWithBSAuditToken:(void *)a3 bundlePath:(void *)a4 executablePath:(void *)a5 bundleIdentifier:(void *)a6 personaUniqueString:(char)a7 systemExecutable:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (a1)
  {
    v29.receiver = a1;
    v29.super_class = (Class)STExecutableIdentity;
    a1 = objc_msgSendSuper2(&v29, sel_init);
    if (a1)
    {
      uint64_t v18 = [v13 copy];
      v19 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v18;

      uint64_t v20 = [v14 copy];
      v21 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v20;

      uint64_t v22 = [v15 copy];
      v23 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v22;

      uint64_t v24 = [v16 copy];
      v25 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v24;

      uint64_t v26 = [v17 copy];
      v27 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v26;

      *((unsigned char *)a1 + 8) = a7;
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(STExecutableIdentity *)self executablePath];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __32__STExecutableIdentity_isEqual___block_invoke;
  v38[3] = &unk_1E6B630A8;
  id v7 = v4;
  id v39 = v7;
  id v8 = (id)[v5 appendString:v6 counterpart:v38];

  v9 = [(STExecutableIdentity *)self bundlePath];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __32__STExecutableIdentity_isEqual___block_invoke_2;
  v36[3] = &unk_1E6B630A8;
  id v10 = v7;
  id v37 = v10;
  id v11 = (id)[v5 appendString:v9 counterpart:v36];

  if (self) {
    bsAuditToken = self->_bsAuditToken;
  }
  else {
    bsAuditToken = 0;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __32__STExecutableIdentity_isEqual___block_invoke_3;
  v34[3] = &unk_1E6B63058;
  id v13 = v10;
  id v35 = v13;
  id v14 = (id)[v5 appendObject:bsAuditToken counterpart:v34];
  id v15 = [(STExecutableIdentity *)self bundleIdentifier];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __32__STExecutableIdentity_isEqual___block_invoke_4;
  v32[3] = &unk_1E6B630A8;
  id v16 = v13;
  id v33 = v16;
  id v17 = (id)[v5 appendString:v15 counterpart:v32];

  uint64_t v18 = [(STExecutableIdentity *)self personaUniqueString];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __32__STExecutableIdentity_isEqual___block_invoke_5;
  v30[3] = &unk_1E6B630A8;
  id v19 = v16;
  id v31 = v19;
  id v20 = (id)[v5 appendString:v18 counterpart:v30];

  uint64_t v21 = [(STExecutableIdentity *)self isSystemExecutable];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __32__STExecutableIdentity_isEqual___block_invoke_6;
  v28 = &unk_1E6B630D0;
  id v29 = v19;
  id v22 = v19;
  id v23 = (id)[v5 appendBool:v21 counterpart:&v25];
  LOBYTE(v21) = objc_msgSend(v5, "isEqual", v25, v26, v27, v28);

  return v21;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STExecutableIdentity *)self executablePath];
  id v5 = (id)[v3 appendString:v4];

  v6 = [(STExecutableIdentity *)self bundlePath];
  id v7 = (id)[v3 appendString:v6];

  if (self) {
    bsAuditToken = self->_bsAuditToken;
  }
  else {
    bsAuditToken = 0;
  }
  id v9 = (id)[v3 appendObject:bsAuditToken];
  id v10 = [(STExecutableIdentity *)self bundleIdentifier];
  id v11 = (id)[v3 appendString:v10];

  v12 = [(STExecutableIdentity *)self personaUniqueString];
  id v13 = (id)[v3 appendString:v12];

  id v14 = (id)objc_msgSend(v3, "appendBool:", -[STExecutableIdentity isSystemExecutable](self, "isSystemExecutable"));
  unint64_t v15 = [v3 hash];

  return v15;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isSystemExecutable
{
  return self->_systemExecutable;
}

uint64_t __32__STExecutableIdentity_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) executablePath];
}

uint64_t __32__STExecutableIdentity_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundlePath];
}

uint64_t __32__STExecutableIdentity_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) isSystemExecutable];
}

uint64_t __32__STExecutableIdentity_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) personaUniqueString];
}

uint64_t __32__STExecutableIdentity_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleIdentifier];
}

id __32__STExecutableIdentity_isEqual___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 48);
  }
  else {
    return 0;
  }
}

void __62__STExecutableIdentity_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) bundleIdentifier];
  [v2 appendString:v3 withName:@"bundleIdentifier" skipIfEmpty:1];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) personaUniqueString];
  [v4 appendString:v5 withName:@"personaUniqueString" skipIfEmpty:1];

  v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) bundlePath];
  [v6 appendString:v7 withName:@"bundlePath" skipIfEmpty:1];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) executablePath];
  [v8 appendString:v9 withName:@"executablePath" skipIfEmpty:1];

  if ([*(id *)(a1 + 40) hasAuditToken])
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      uint64_t v11 = *(void *)(v10 + 48);
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = (id)[*(id *)(a1 + 32) appendObject:v11 withName:@"auditToken"];
  }
  id v13 = *(void **)(a1 + 32);
  MEMORY[0x1E01640E0]([*(id *)(a1 + 40) isSystemExecutable]);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v13 appendString:v14 withName:@"isSystemExecutable"];
}

- (BOOL)hasAuditToken
{
  [(STExecutableIdentity *)self auditToken];
  return (v3 & v4 & v5 & v6) != -1;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  if (self && (self = ($115C4C562B26FF47E01F9F4EA65B5887 *)*(id *)&self[1].var0[4]) != 0)
  {
    uint64_t v4 = self;
    [($115C4C562B26FF47E01F9F4EA65B5887 *)self realToken];
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if (self) {
    bsAuditToken = self->_bsAuditToken;
  }
  else {
    bsAuditToken = 0;
  }
  id v9 = a3;
  [v9 encodeObject:bsAuditToken forKey:@"bsAuditToken"];
  uint64_t v5 = [(STExecutableIdentity *)self bundlePath];
  [v9 encodeObject:v5 forKey:@"bundlePath"];

  uint64_t v6 = [(STExecutableIdentity *)self executablePath];
  [v9 encodeObject:v6 forKey:@"executablePath"];

  id v7 = [(STExecutableIdentity *)self bundleIdentifier];
  [v9 encodeObject:v7 forKey:@"bundleIdentifier"];

  id v8 = [(STExecutableIdentity *)self personaUniqueString];
  [v9 encodeObject:v8 forKey:@"personaUniqueString"];

  objc_msgSend(v9, "encodeBool:forKey:", -[STExecutableIdentity isSystemExecutable](self, "isSystemExecutable"), @"systemExecutable");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STExecutableIdentity *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STExecutableIdentity *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__STExecutableIdentity_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B63080;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (STExecutableIdentity)initWithExecutablePath:(id)a3
{
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  v5[0] = v3;
  v5[1] = v3;
  return [(STExecutableIdentity *)self initWithAuditToken:v5 bundlePath:0 executablePath:a3 bundleIdentifier:0 personaUniqueString:0 systemExecutable:0];
}

- (STExecutableIdentity)initWithAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  return [(STExecutableIdentity *)self initWithAuditToken:v5 bundlePath:0 executablePath:0 bundleIdentifier:0 personaUniqueString:0 systemExecutable:0];
}

- (STExecutableIdentity)initWithApplicationBundleIdentifier:(id)a3
{
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  v5[0] = v3;
  v5[1] = v3;
  return [(STExecutableIdentity *)self initWithAuditToken:v5 bundlePath:0 executablePath:0 bundleIdentifier:a3 personaUniqueString:0 systemExecutable:0];
}

- (STExecutableIdentity)initWithAuditToken:(id *)a3 bundlePath:(id)a4 executablePath:(id)a5 bundleIdentifier:(id)a6 personaUniqueString:(id)a7 systemExecutable:(BOOL)a8
{
  id v14 = (objc_class *)MEMORY[0x1E4F4F6A8];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = [v14 alloc];
  long long v20 = *(_OWORD *)&a3->var0[4];
  v24[0] = *(_OWORD *)a3->var0;
  v24[1] = v20;
  uint64_t v21 = (void *)[v19 initWithAuditToken:v24];
  id v22 = (STExecutableIdentity *)-[STExecutableIdentity initWithBSAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, v21, v18, v17, v16, v15, a8);

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bsAuditToken, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);

  objc_storeStrong((id *)&self->_bundlePath, 0);
}

- (STExecutableIdentity)initWithBundlePath:(id)a3
{
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  v5[0] = v3;
  v5[1] = v3;
  return [(STExecutableIdentity *)self initWithAuditToken:v5 bundlePath:a3 executablePath:0 bundleIdentifier:0 personaUniqueString:0 systemExecutable:0];
}

- (STExecutableIdentity)initWithApplicationBundleIdentifier:(id)a3 personaUniqueString:(id)a4
{
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  v6[0] = v4;
  v6[1] = v4;
  return [(STExecutableIdentity *)self initWithAuditToken:v6 bundlePath:0 executablePath:0 bundleIdentifier:a3 personaUniqueString:a4 systemExecutable:0];
}

- (STExecutableIdentity)initWithAuditToken:(id *)a3 bundlePath:(id)a4 executablePath:(id)a5 systemExecutable:(BOOL)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4F4F6A8];
  id v11 = a5;
  id v12 = a4;
  id v13 = [v10 alloc];
  long long v14 = *(_OWORD *)&a3->var0[4];
  v18[0] = *(_OWORD *)a3->var0;
  v18[1] = v14;
  id v15 = (void *)[v13 initWithAuditToken:v18];
  id v16 = (STExecutableIdentity *)-[STExecutableIdentity initWithBSAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, v15, v12, v11, 0, 0, a6);

  return v16;
}

- (BOOL)matchesExecutableIdentity:(id)a3
{
  long long v4 = a3;
  int v5 = [(STExecutableIdentity *)self isSystemExecutable];
  if (v5 == [v4 isSystemExecutable])
  {
    uint64_t v7 = [(STExecutableIdentity *)self personaUniqueString];
    uint64_t v8 = [v4 personaUniqueString];
    if (v7 | v8 && ![(id)v7 isEqualToString:v8])
    {
      char v6 = 0;
    }
    else
    {
      id v9 = [(STExecutableIdentity *)self bundleIdentifier];
      uint64_t v10 = [v4 bundleIdentifier];
      id v11 = (void *)v10;
      if (v9 && v10)
      {
        char v6 = [v9 isEqualToString:v10];
      }
      else
      {
        id v12 = [(STExecutableIdentity *)self executablePath];
        uint64_t v13 = [v4 executablePath];
        long long v14 = (void *)v13;
        if (v12 && v13)
        {
          char v6 = [v12 isEqualToString:v13];
        }
        else
        {
          id v15 = [(STExecutableIdentity *)self bundlePath];
          uint64_t v16 = [v4 bundlePath];
          id v17 = (void *)v16;
          if (v15 && v16)
          {
            char v6 = [v15 isEqualToString:v16];
          }
          else
          {
            if (self) {
              bsAuditToken = self->_bsAuditToken;
            }
            else {
              bsAuditToken = 0;
            }
            id v22 = v15;
            if (v4) {
              uint64_t v19 = v4[6];
            }
            else {
              uint64_t v19 = 0;
            }
            long long v20 = bsAuditToken;
            char v6 = [(BSAuditToken *)v20 isEqual:v19];

            id v15 = v22;
          }
        }
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(STExecutableIdentity *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STExecutableIdentity *)self succinctDescriptionBuilder];
  long long v3 = [v2 build];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end