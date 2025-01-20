@interface STStatusBarOverridesStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)editedIdentifiers;
- (NSSet)editedKeys;
- (NSSet)suppressedBackgroundActivityIdentifiers;
- (NSString)description;
- (STListData)suppressedBackgroundActivityIdentifierListData;
- (STStatusBarData)customOverrides;
- (STStatusBarOverridesStatusDomainData)init;
- (STStatusBarOverridesStatusDomainData)initWithCoder:(id)a3;
- (STStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3;
- (STStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3 suppressedBackgroundActivityIdentifierListData:(id)a4;
- (STStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3 suppressedBackgroundActivityIdentifiers:(id)a4;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)_initWithCustomOverrides:(void *)a3 suppressedBackgroundActivityIdentifierListData:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithData:(void *)a1;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarOverridesStatusDomainData

- (STStatusBarOverridesStatusDomainData)init
{
  v3 = objc_opt_new();
  v4 = [(STStatusBarOverridesStatusDomainData *)self initWithCustomOverrides:v3];

  return v4;
}

- (STStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STStatusBarOverridesStatusDomainData;
  v5 = [(STStatusBarOverridesStatusDomainData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 immutableCopy];
    customOverrides = v5->_customOverrides;
    v5->_customOverrides = (STStatusBarData *)v6;
  }
  v8 = [MEMORY[0x1E4F1CAD0] set];
  v9 = [(STStatusBarOverridesStatusDomainData *)v5 initWithCustomOverrides:v4 suppressedBackgroundActivityIdentifiers:v8];

  return v9;
}

- (STStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3 suppressedBackgroundActivityIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [STListData alloc];
  v9 = [v6 allObjects];

  v10 = [(STListData *)v8 initWithObjects:v9];
  objc_super v11 = [(STStatusBarOverridesStatusDomainData *)self initWithCustomOverrides:v7 suppressedBackgroundActivityIdentifierListData:v10];

  return v11;
}

- (id)initWithData:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id v4 = [v3 customOverrides];
    v5 = [v3 suppressedBackgroundActivityIdentifierListData];

    id v2 = (id)[v2 initWithCustomOverrides:v4 suppressedBackgroundActivityIdentifierListData:v5];
  }
  return v2;
}

- (STStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3 suppressedBackgroundActivityIdentifierListData:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a4 copy];
  v8 = (STStatusBarOverridesStatusDomainData *)-[STStatusBarOverridesStatusDomainData _initWithCustomOverrides:suppressedBackgroundActivityIdentifierListData:]((id *)&self->super.isa, v6, v7);

  return v8;
}

- (id)_initWithCustomOverrides:(void *)a3 suppressedBackgroundActivityIdentifierListData:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)STStatusBarOverridesStatusDomainData;
    a1 = (id *)objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 immutableCopy];
      id v8 = a1[2];
      a1[2] = (id)v7;

      objc_storeStrong(a1 + 1, a3);
    }
  }

  return a1;
}

- (NSSet)suppressedBackgroundActivityIdentifiers
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(STListData *)self->_suppressedBackgroundActivityIdentifierListData objects];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  uint64_t v7 = [(STStatusBarOverridesStatusDomainData *)self customOverrides];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__STStatusBarOverridesStatusDomainData_isEqual___block_invoke;
  v19[3] = &unk_1E6B64258;
  id v8 = v6;
  id v20 = v8;
  id v9 = (id)[v5 appendObject:v7 counterpart:v19];

  objc_super v10 = [(STStatusBarOverridesStatusDomainData *)self suppressedBackgroundActivityIdentifierListData];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __48__STStatusBarOverridesStatusDomainData_isEqual___block_invoke_2;
  v17 = &unk_1E6B64280;
  id v18 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendObject:v10 counterpart:&v14];

  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);
  return (char)v10;
}

uint64_t __48__STStatusBarOverridesStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) customOverrides];
}

uint64_t __48__STStatusBarOverridesStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) suppressedBackgroundActivityIdentifierListData];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STStatusBarOverridesStatusDomainData *)self customOverrides];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(STStatusBarOverridesStatusDomainData *)self suppressedBackgroundActivityIdentifierListData];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = [(STStatusBarOverridesStatusDomainData *)self editedKeys];
  id v9 = (id)[v3 appendObject:v8];

  objc_super v10 = [(STStatusBarOverridesStatusDomainData *)self editedIdentifiers];
  id v11 = (id)[v3 appendObject:v10];

  unint64_t v12 = [v3 hash];
  return v12;
}

- (NSString)description
{
  return (NSString *)[(STStatusBarOverridesStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableStatusBarOverridesStatusDomainData allocWithZone:a3];

  return -[STStatusBarOverridesStatusDomainData initWithData:](v4, self);
}

- (id)succinctDescription
{
  id v2 = [(STStatusBarOverridesStatusDomainData *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STStatusBarOverridesStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STStatusBarOverridesStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__STStatusBarOverridesStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E6B63080;
    id v7 = v6;
    id v10 = v7;
    id v11 = v3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v9];

    id v3 = v7;
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusBarOverridesStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __88__STStatusBarOverridesStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) customOverrides];
  id v4 = (id)[v2 appendObject:v3 withName:@"customOverrides" skipIfNil:1];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) editedKeys];
  id v7 = (id)[v5 appendObject:v6 withName:@"editedKeys" skipIfNil:1];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) editedIdentifiers];
  id v10 = (id)[v8 appendObject:v9 withName:@"editedIdentifiers" skipIfNil:1];

  id v11 = *(void **)(a1 + 32);
  id v14 = [*(id *)(a1 + 40) suppressedBackgroundActivityIdentifierListData];
  unint64_t v12 = [v14 objects];
  v13 = [*(id *)(a1 + 32) activeMultilinePrefix];
  [v11 appendArraySection:v12 withName:@"suppressedBackgroundActivityIdentifiers" multilinePrefix:v13 skipIfEmpty:1 objectTransformer:&__block_literal_global_17];
}

__CFString *__88__STStatusBarOverridesStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2(uint64_t a1, void *a2)
{
  return STBackgroundActivityIdentifierDescription(a2);
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STStatusBarOverridesStatusDomainDataDiff diffFromData:v4 toData:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEmpty])
    {
      id v5 = (void *)[(STStatusBarOverridesStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STStatusBarOverridesStatusDomainData *)self mutableCopy];
      [v4 applyToMutableData:v5];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSSet)editedKeys
{
  return 0;
}

- (NSSet)editedIdentifiers
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STStatusBarOverridesStatusDomainData *)self customOverrides];
  [v4 encodeObject:v5 forKey:@"customOverrides"];

  id v6 = [(STStatusBarOverridesStatusDomainData *)self suppressedBackgroundActivityIdentifierListData];
  [v4 encodeObject:v6 forKey:@"suppressedBackgroundActivityIdentifierListData"];
}

- (STStatusBarOverridesStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customOverrides"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suppressedBackgroundActivityIdentifierListData"];

  id v7 = [(STStatusBarOverridesStatusDomainData *)self initWithCustomOverrides:v5 suppressedBackgroundActivityIdentifierListData:v6];
  return v7;
}

- (STListData)suppressedBackgroundActivityIdentifierListData
{
  return self->_suppressedBackgroundActivityIdentifierListData;
}

- (STStatusBarData)customOverrides
{
  return self->_customOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customOverrides, 0);

  objc_storeStrong((id *)&self->_suppressedBackgroundActivityIdentifierListData, 0);
}

@end