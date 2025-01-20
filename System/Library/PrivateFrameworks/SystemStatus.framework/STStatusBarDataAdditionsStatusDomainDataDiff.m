@interface STStatusBarDataAdditionsStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STStatusBarDataAdditionsStatusDomainDataDiff)init;
- (STStatusBarDataAdditionsStatusDomainDataDiff)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingToData:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffByApplyingDiff:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)applyToMutableData:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initWithChanges:(void *)a3 entryDictionaryDataDiff:;
@end

@implementation STStatusBarDataAdditionsStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = [v7 entryDictionaryData];

  v10 = [v6 entryDictionaryData];

  v11 = +[STDictionaryDataDiff diffFromDictionaryData:v9 toDictionaryData:v10];

  v12 = -[STStatusBarDataAdditionsStatusDomainDataDiff initWithChanges:entryDictionaryDataDiff:]([STStatusBarDataAdditionsStatusDomainDataDiff alloc], v8, v11);

  return v12;
}

- (void)initWithChanges:(void *)a3 entryDictionaryDataDiff:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)STStatusBarDataAdditionsStatusDomainDataDiff;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      id v8 = (void *)a1[1];
      a1[1] = v7;

      uint64_t v9 = [v6 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (STStatusBarDataAdditionsStatusDomainDataDiff)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  v4 = objc_alloc_init(STDictionaryDataDiff);
  id v5 = (STStatusBarDataAdditionsStatusDomainDataDiff *)-[STStatusBarDataAdditionsStatusDomainDataDiff initWithChanges:entryDictionaryDataDiff:](self, v3, v4);

  return v5;
}

- (id)dataByApplyingToData:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  [(STStatusBarDataAdditionsStatusDomainDataDiff *)self applyToMutableData:v4];

  return v4;
}

- (void)applyToMutableData:(id)a3
{
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  v10 = changes;
  id v6 = a3;
  [(BSSettings *)v10 isEmpty];
  if (self) {
    entryDictionaryDataDiff = self->_entryDictionaryDataDiff;
  }
  else {
    entryDictionaryDataDiff = 0;
  }
  id v8 = entryDictionaryDataDiff;
  uint64_t v9 = [v6 entryDictionaryData];

  [(STDictionaryDataDiff *)v8 applyToMutableDictionaryData:v9];
}

- (BOOL)isEmpty
{
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  v4 = changes;
  if ([(BSSettings *)v4 isEmpty])
  {
    if (self) {
      entryDictionaryDataDiff = self->_entryDictionaryDataDiff;
    }
    else {
      entryDictionaryDataDiff = 0;
    }
    BOOL v6 = [(STDictionaryDataDiff *)entryDictionaryDataDiff isEmpty];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (self) {
      changes = self->_changes;
    }
    else {
      changes = 0;
    }
    uint64_t v7 = (void *)[(BSSettings *)changes mutableCopy];
    if (v5) {
      id v8 = (void *)v5[1];
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    [v7 applySettings:v9];
    if (self)
    {
      entryDictionaryDataDiff = self->_entryDictionaryDataDiff;
      if (v5)
      {
LABEL_8:
        uint64_t v11 = v5[2];
LABEL_9:
        objc_super v12 = entryDictionaryDataDiff;
        v13 = [(STDictionaryDataDiff *)v12 diffByApplyingDiff:v11];

        v14 = -[STStatusBarDataAdditionsStatusDomainDataDiff initWithChanges:entryDictionaryDataDiff:]([STStatusBarDataAdditionsStatusDomainDataDiff alloc], v7, v13);
        goto LABEL_11;
      }
    }
    else
    {
      entryDictionaryDataDiff = 0;
      if (v5) {
        goto LABEL_8;
      }
    }
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STStatusBarDataAdditionsStatusDomainDataDiff *)self isEmpty]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEmpty];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__STStatusBarDataAdditionsStatusDomainDataDiff_isEqual___block_invoke;
  v19[3] = &unk_1E6B63058;
  id v8 = v6;
  id v20 = v8;
  id v9 = (id)[v5 appendObject:changes counterpart:v19];
  if (self) {
    self = (STStatusBarDataAdditionsStatusDomainDataDiff *)self->_entryDictionaryDataDiff;
  }
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __56__STStatusBarDataAdditionsStatusDomainDataDiff_isEqual___block_invoke_2;
  v17 = &unk_1E6B63058;
  id v18 = v8;
  id v10 = v8;
  id v11 = (id)[v5 appendObject:self counterpart:&v14];
  char v12 = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v12;
}

id __56__STStatusBarDataAdditionsStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 8);
  }
  else {
    return 0;
  }
}

id __56__STStatusBarDataAdditionsStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 16);
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = v3;
  if (self)
  {
    id v5 = (id)[v3 appendObject:self->_changes];
    entryDictionaryDataDiff = self->_entryDictionaryDataDiff;
  }
  else
  {
    id v10 = (id)[v3 appendObject:0];
    entryDictionaryDataDiff = 0;
  }
  id v7 = (id)[v4 appendObject:entryDictionaryDataDiff];
  unint64_t v8 = [v4 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(STStatusBarDataAdditionsStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_changes forKey:@"changes"];
    entryDictionaryDataDiff = self->_entryDictionaryDataDiff;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"changes"];
    entryDictionaryDataDiff = 0;
  }
  [a3 encodeObject:entryDictionaryDataDiff forKey:@"entryDictionaryDataDiff"];
}

- (STStatusBarDataAdditionsStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changes"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entryDictionaryDataDiff"];

  id v7 = (STStatusBarDataAdditionsStatusDomainDataDiff *)-[STStatusBarDataAdditionsStatusDomainDataDiff initWithChanges:entryDictionaryDataDiff:](self, v5, v6);
  return v7;
}

- (id)succinctDescription
{
  v2 = [(STStatusBarDataAdditionsStatusDomainDataDiff *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STStatusBarDataAdditionsStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STStatusBarDataAdditionsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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

    id v7 = [v6 activeMultilinePrefix];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __96__STStatusBarDataAdditionsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v10[3] = &unk_1E6B63080;
    id v8 = v6;
    id v11 = v8;
    id v12 = v3;
    [v8 appendBodySectionWithName:0 multilinePrefix:v7 block:v10];

    id v3 = v8;
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusBarDataAdditionsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __96__STStatusBarDataAdditionsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:0 skipIfNil:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryDictionaryDataDiff, 0);

  objc_storeStrong((id *)&self->_changes, 0);
}

@end