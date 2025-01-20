@interface STActivityAttribution
+ (BOOL)supportsSecureCoding;
+ (STActivityAttribution)attributionWithAuditToken:(id *)a3;
+ (STActivityAttribution)attributionWithPID:(int)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)_isEquivalentForBookkeepingPurposesToActivityAttribution:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSUUID)UUID;
- (STActivityAttribution)initWithAttributedEntity:(id)a3;
- (STActivityAttribution)initWithAttributedEntity:(id)a3 activeEntity:(id)a4;
- (STActivityAttribution)initWithAuditToken:(id *)a3;
- (STActivityAttribution)initWithCoder:(id)a3;
- (STActivityAttribution)initWithPID:(int)a3;
- (STAttributedEntity)activeEntity;
- (STAttributedEntity)attributedEntity;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)_initWithAttributedEntity:(id)a3 activeEntity:(id)a4 UUID:(id)a5;
- (id)copyReplacingAttributedEntity:(id)a3 activeEntity:(id)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STActivityAttribution

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v4 = [(STActivityAttribution *)self attributedEntity];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(STActivityAttribution *)self activeEntity];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (STAttributedEntity)activeEntity
{
  activeEntity = self->_activeEntity;
  if (activeEntity)
  {
    v3 = activeEntity;
  }
  else
  {
    v3 = [(STActivityAttribution *)self attributedEntity];
  }

  return v3;
}

- (STAttributedEntity)attributedEntity
{
  return self->_attributedEntity;
}

uint64_t __33__STActivityAttribution_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) attributedEntity];
}

uint64_t __33__STActivityAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activeEntity];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedEntity, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_activeEntity, 0);
}

void __73__STActivityAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) attributedEntity];
  id v2 = [*(id *)(a1 + 32) activeEntity];
  id v3 = (id)[*(id *)(a1 + 40) appendObject:v11 withName:@"attributedEntity"];
  if (v2 != v11)
  {
    v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) activeEntity];
    id v6 = (id)[v4 appendObject:v5 withName:@"activeEntity" skipIfNil:1];
  }
  id v7 = *(void **)(a1 + 40);
  unint64_t v8 = [*(id *)(a1 + 32) UUID];
  v9 = [v8 UUIDString];
  id v10 = (id)[v7 appendObject:v9 withName:@"UUID"];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STActivityAttribution *)self attributedEntity];
  [v4 encodeObject:v5 forKey:@"attributedEntity"];

  id v6 = [(STActivityAttribution *)self activeEntity];
  [v4 encodeObject:v6 forKey:@"activeEntity"];

  id v7 = [(STActivityAttribution *)self UUID];
  [v4 encodeObject:v7 forKey:@"uuid"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STActivityAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STActivityAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__STActivityAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v10[3] = &unk_1E6B63080;
    v10[4] = v3;
    id v7 = v6;
    id v11 = v7;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

    unint64_t v8 = v11;
    id v3 = v7;
  }

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

+ (STActivityAttribution)attributionWithAuditToken:(id *)a3
{
  id v4 = objc_alloc((Class)a1);
  long long v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  id v6 = (void *)[v4 initWithAuditToken:v8];

  return (STActivityAttribution *)v6;
}

- (STActivityAttribution)initWithAuditToken:(id *)a3
{
  long long v5 = [STAttributedEntity alloc];
  long long v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  id v7 = [(STAttributedEntity *)v5 initWithAuditToken:v10];
  unint64_t v8 = [(STActivityAttribution *)self initWithAttributedEntity:v7];

  return v8;
}

- (STActivityAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributedEntity"];
  long long v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeEntity"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];

  unint64_t v8 = [(STActivityAttribution *)self _initWithAttributedEntity:v5 activeEntity:v6 UUID:v7];
  return v8;
}

- (STActivityAttribution)initWithAttributedEntity:(id)a3 activeEntity:(id)a4
{
  long long v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 UUID];
  id v10 = [(STActivityAttribution *)self _initWithAttributedEntity:v8 activeEntity:v7 UUID:v9];

  return v10;
}

- (STActivityAttribution)initWithAttributedEntity:(id)a3
{
  return [(STActivityAttribution *)self initWithAttributedEntity:a3 activeEntity:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  long long v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  long long v6 = [(STActivityAttribution *)self attributedEntity];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __33__STActivityAttribution_isEqual___block_invoke;
  v18[3] = &unk_1E6B63058;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:v6 counterpart:v18];

  v9 = [(STActivityAttribution *)self activeEntity];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __33__STActivityAttribution_isEqual___block_invoke_2;
  v16 = &unk_1E6B63058;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:v9 counterpart:&v13];

  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);
  return (char)v9;
}

+ (STActivityAttribution)attributionWithPID:(int)a3
{
  id v3 = (void *)[objc_alloc((Class)a1) initWithPID:*(void *)&a3];

  return (STActivityAttribution *)v3;
}

- (STActivityAttribution)initWithPID:(int)a3
{
  v4[0] = -1;
  v4[1] = -1;
  int v5 = -1;
  int v6 = a3;
  uint64_t v7 = -1;
  return [(STActivityAttribution *)self initWithAuditToken:v4];
}

- (id)_initWithAttributedEntity:(id)a3 activeEntity:(id)a4 UUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STActivityAttribution;
  id v11 = [(STActivityAttribution *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    attributedEntity = v11->_attributedEntity;
    v11->_attributedEntity = (STAttributedEntity *)v12;

    if (([v8 isEqual:v9] & 1) == 0)
    {
      uint64_t v14 = [v9 copy];
      activeEntity = v11->_activeEntity;
      v11->_activeEntity = (STAttributedEntity *)v14;
    }
    uint64_t v16 = [v10 copy];
    UUID = v11->_UUID;
    v11->_UUID = (NSUUID *)v16;
  }
  return v11;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  id v4 = [(STActivityAttribution *)self attributedEntity];
  if (v4)
  {
    int v6 = v4;
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

- (int)pid
{
  return BSPIDForAuditToken();
}

- (id)copyReplacingAttributedEntity:(id)a3 activeEntity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)objc_opt_class());
  id v9 = [(STActivityAttribution *)self UUID];
  id v10 = (void *)[v8 _initWithAttributedEntity:v7 activeEntity:v6 UUID:v9];

  return v10;
}

- (BOOL)_isEquivalentForBookkeepingPurposesToActivityAttribution:(id)a3
{
  id v4 = a3;
  int v5 = [(STActivityAttribution *)self UUID];
  id v6 = [v4 UUID];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (NSString)description
{
  return (NSString *)[(STActivityAttribution *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STActivityAttribution *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(STActivityAttribution *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STActivityAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

@end