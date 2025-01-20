@interface STAttributedEntity
+ (BOOL)supportsSecureCoding;
+ (id)genericSystemServicesEntity;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemService;
- (BOOL)matchesAttributedEntity:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)executablePath;
- (NSString)localizedDisplayName;
- (NSString)localizedExecutableDisplayName;
- (NSString)website;
- (STAttributedEntity)initWithAuditToken:(id *)a3;
- (STAttributedEntity)initWithBundlePath:(id)a3;
- (STAttributedEntity)initWithCoder:(id)a3;
- (STAttributedEntity)initWithExecutableIdentity:(id)a3;
- (STAttributedEntity)initWithExecutableIdentity:(id)a3 systemService:(BOOL)a4;
- (STAttributedEntity)initWithExecutableIdentity:(id)a3 website:(id)a4;
- (STAttributedEntity)initWithExecutableIdentity:(id)a3 website:(id)a4 systemService:(BOOL)a5;
- (STAttributedEntity)initWithExecutableIdentity:(id)a3 website:(id)a4 systemService:(BOOL)a5 localizedDisplayName:(id)a6 localizedExecutableDisplayName:(id)a7;
- (STAttributedEntity)initWithExecutablePath:(id)a3;
- (STExecutableIdentity)executableIdentity;
- (STUserIdentity)userIdentity;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STAttributedEntity

- (STAttributedEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executableIdentity"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"website"];
  uint64_t v7 = [v4 decodeBoolForKey:@"systemService"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDisplayName"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedExecutableDisplayName"];

  if (v5)
  {
    self = [(STAttributedEntity *)self initWithExecutableIdentity:v5 website:v6 systemService:v7 localizedDisplayName:v8 localizedExecutableDisplayName:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (STAttributedEntity)initWithExecutableIdentity:(id)a3 website:(id)a4 systemService:(BOOL)a5 localizedDisplayName:(id)a6 localizedExecutableDisplayName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (self)
  {
    v25.receiver = self;
    v25.super_class = (Class)STAttributedEntity;
    self = [(STAttributedEntity *)&v25 init];
    if (self)
    {
      v16 = (STExecutableIdentity *)[v12 copy];
      executableIdentity = self->_executableIdentity;
      self->_executableIdentity = v16;

      v18 = (NSString *)[v13 copy];
      website = self->_website;
      self->_website = v18;

      self->_systemService = a5;
      v20 = (NSString *)[v14 copy];
      localizedDisplayName = self->_localizedDisplayName;
      self->_localizedDisplayName = v20;

      v22 = (NSString *)[v15 copy];
      localizedExecutableDisplayName = self->_localizedExecutableDisplayName;
      self->_localizedExecutableDisplayName = v22;
    }
  }

  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(STAttributedEntity *)self executableIdentity];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __30__STAttributedEntity_isEqual___block_invoke;
  v30[3] = &unk_1E6B63058;
  id v7 = v4;
  id v31 = v7;
  id v8 = (id)[v5 appendObject:v6 counterpart:v30];

  v9 = [(STAttributedEntity *)self website];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __30__STAttributedEntity_isEqual___block_invoke_2;
  v28[3] = &unk_1E6B630A8;
  id v10 = v7;
  id v29 = v10;
  id v11 = (id)[v5 appendString:v9 counterpart:v28];

  BOOL v12 = [(STAttributedEntity *)self isSystemService];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __30__STAttributedEntity_isEqual___block_invoke_3;
  v26[3] = &unk_1E6B630D0;
  id v13 = v10;
  id v27 = v13;
  id v14 = (id)[v5 appendBool:v12 counterpart:v26];
  id v15 = [(STAttributedEntity *)self localizedDisplayName];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __30__STAttributedEntity_isEqual___block_invoke_4;
  v24[3] = &unk_1E6B630A8;
  id v16 = v13;
  id v25 = v16;
  id v17 = (id)[v5 appendString:v15 counterpart:v24];

  v18 = [(STAttributedEntity *)self localizedExecutableDisplayName];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __30__STAttributedEntity_isEqual___block_invoke_5;
  v22[3] = &unk_1E6B630A8;
  id v23 = v16;
  id v19 = v16;
  id v20 = (id)[v5 appendString:v18 counterpart:v22];

  LOBYTE(v18) = [v5 isEqual];
  return (char)v18;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STAttributedEntity *)self executableIdentity];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(STAttributedEntity *)self website];
  id v7 = (id)[v3 appendString:v6];

  id v8 = (id)objc_msgSend(v3, "appendBool:", -[STAttributedEntity isSystemService](self, "isSystemService"));
  v9 = [(STAttributedEntity *)self localizedDisplayName];
  id v10 = (id)[v3 appendString:v9];

  id v11 = [(STAttributedEntity *)self localizedExecutableDisplayName];
  id v12 = (id)[v3 appendString:v11];

  unint64_t v13 = [v3 hash];
  return v13;
}

- (STExecutableIdentity)executableIdentity
{
  return self->_executableIdentity;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (BOOL)isSystemService
{
  return self->_systemService;
}

- (NSString)website
{
  return self->_website;
}

- (NSString)localizedExecutableDisplayName
{
  return self->_localizedExecutableDisplayName;
}

uint64_t __30__STAttributedEntity_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) executableIdentity];
}

uint64_t __30__STAttributedEntity_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) localizedExecutableDisplayName];
}

uint64_t __30__STAttributedEntity_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) localizedDisplayName];
}

uint64_t __30__STAttributedEntity_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isSystemService];
}

uint64_t __30__STAttributedEntity_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) website];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedExecutableDisplayName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_executableIdentity, 0);
}

- (NSString)bundleIdentifier
{
  v2 = [(STAttributedEntity *)self executableIdentity];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

void __70__STAttributedEntity__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) executableIdentity];
  id v4 = (id)[v2 appendObject:v3 withName:@"executableIdentity"];

  int v5 = *(unsigned __int8 *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) website];
  id v8 = (void *)v7;
  if (v5) {
    [v6 appendString:v7 withName:@"website" skipIfEmpty:1];
  }
  else {
    id v9 = (id)[v6 appendBool:v7 != 0 withName:@"websiteNonNil"];
  }

  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSystemService"), @"systemService");
  id v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) localizedDisplayName];
  [v11 appendString:v12 withName:@"localizedDisplayName" skipIfEmpty:1];

  unint64_t v13 = *(void **)(a1 + 32);
  id v14 = [*(id *)(a1 + 40) localizedExecutableDisplayName];
  [v13 appendString:v14 withName:@"localizedExecutableDisplayName" skipIfEmpty:1];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [(STAttributedEntity *)self executableIdentity];
  [v4 encodeObject:v5 forKey:@"executableIdentity"];

  v6 = [(STAttributedEntity *)self website];
  [v4 encodeObject:v6 forKey:@"website"];

  objc_msgSend(v4, "encodeBool:forKey:", -[STAttributedEntity isSystemService](self, "isSystemService"), @"systemService");
  uint64_t v7 = [(STAttributedEntity *)self localizedDisplayName];
  [v4 encodeObject:v7 forKey:@"localizedDisplayName"];

  id v8 = [(STAttributedEntity *)self localizedExecutableDisplayName];
  [v4 encodeObject:v8 forKey:@"localizedExecutableDisplayName"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STAttributedEntity *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STAttributedEntity _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  if (a1)
  {
    id v5 = a2;
    v6 = [a1 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__STAttributedEntity__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v10[3] = &unk_1E6B632B0;
    id v7 = v6;
    id v11 = v7;
    id v12 = a1;
    char v13 = a3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (STAttributedEntity)initWithAuditToken:(id *)a3
{
  id v5 = [STExecutableIdentity alloc];
  long long v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  id v7 = [(STExecutableIdentity *)v5 initWithAuditToken:v10];
  id v8 = [(STAttributedEntity *)self initWithExecutableIdentity:v7];

  return v8;
}

- (STAttributedEntity)initWithExecutablePath:(id)a3
{
  id v4 = a3;
  id v5 = [[STExecutableIdentity alloc] initWithExecutablePath:v4];

  long long v6 = [(STAttributedEntity *)self initWithExecutableIdentity:v5];
  return v6;
}

- (STAttributedEntity)initWithExecutableIdentity:(id)a3 website:(id)a4 systemService:(BOOL)a5
{
  return [(STAttributedEntity *)self initWithExecutableIdentity:a3 website:a4 systemService:a5 localizedDisplayName:0 localizedExecutableDisplayName:0];
}

- (STAttributedEntity)initWithExecutableIdentity:(id)a3
{
  return [(STAttributedEntity *)self initWithExecutableIdentity:a3 website:0 systemService:0];
}

- (NSString)bundlePath
{
  v2 = [(STAttributedEntity *)self executableIdentity];
  v3 = [v2 bundlePath];

  return (NSString *)v3;
}

+ (id)genericSystemServicesEntity
{
  v3 = [STExecutableIdentity alloc];
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  v8[0] = v4;
  v8[1] = v4;
  id v5 = [(STExecutableIdentity *)v3 initWithAuditToken:v8 bundlePath:0 executablePath:0 systemExecutable:0];
  long long v6 = (void *)[objc_alloc((Class)a1) initWithExecutableIdentity:v5 systemService:1];

  return v6;
}

- (STAttributedEntity)initWithBundlePath:(id)a3
{
  id v4 = a3;
  id v5 = [[STExecutableIdentity alloc] initWithBundlePath:v4];

  long long v6 = [(STAttributedEntity *)self initWithExecutableIdentity:v5];
  return v6;
}

- (STAttributedEntity)initWithExecutableIdentity:(id)a3 website:(id)a4
{
  return [(STAttributedEntity *)self initWithExecutableIdentity:a3 website:a4 systemService:0];
}

- (STAttributedEntity)initWithExecutableIdentity:(id)a3 systemService:(BOOL)a4
{
  return [(STAttributedEntity *)self initWithExecutableIdentity:a3 website:0 systemService:a4];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  id v4 = [(STAttributedEntity *)self executableIdentity];
  if (v4)
  {
    long long v6 = v4;
    [v4 auditToken];
    id v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (NSString)executablePath
{
  v2 = [(STAttributedEntity *)self executableIdentity];
  v3 = [v2 executablePath];

  return (NSString *)v3;
}

- (BOOL)matchesAttributedEntity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STAttributedEntity *)self website];
  uint64_t v6 = [v4 website];
  if ((!(v5 | v6) || [(id)v5 isEqualToString:v6])
    && (int v7 = [(STAttributedEntity *)self isSystemService],
        v7 == [v4 isSystemService]))
  {
    uint64_t v9 = [(STAttributedEntity *)self localizedDisplayName];
    uint64_t v10 = [v4 localizedDisplayName];
    if (v9 | v10 && ![(id)v9 isEqualToString:v10])
    {
      char v8 = 0;
    }
    else
    {
      uint64_t v11 = [(STAttributedEntity *)self localizedExecutableDisplayName];
      uint64_t v12 = [v4 localizedExecutableDisplayName];
      if (v11 | v12 && ![(id)v11 isEqualToString:v12])
      {
        char v8 = 0;
      }
      else
      {
        char v13 = [(STAttributedEntity *)self executableIdentity];
        id v14 = [v4 executableIdentity];
        char v8 = [v13 matchesExecutableIdentity:v14];
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)[(STAttributedEntity *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STAttributedEntity *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STAttributedEntity *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STAttributedEntity _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STUserIdentity)userIdentity
{
  return self->_userIdentity;
}

@end