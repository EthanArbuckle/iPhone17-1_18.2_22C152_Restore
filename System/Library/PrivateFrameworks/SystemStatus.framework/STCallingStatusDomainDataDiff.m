@interface STCallingStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STCallingStatusDomainDataDiff)init;
- (STCallingStatusDomainDataDiff)initWithCallDescriptorListDataDiff:(id)a3;
- (STCallingStatusDomainDataDiff)initWithCoder:(id)a3;
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
@end

@implementation STCallingStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5 = a4;
  v6 = [a3 callDescriptorListData];
  v7 = [v5 callDescriptorListData];

  v8 = +[STListDataDiff diffFromListData:v6 toListData:v7];

  v9 = [[STCallingStatusDomainDataDiff alloc] initWithCallDescriptorListDataDiff:v8];

  return v9;
}

- (STCallingStatusDomainDataDiff)init
{
  v3 = objc_alloc_init(STListDataDiff);
  v4 = [(STCallingStatusDomainDataDiff *)self initWithCallDescriptorListDataDiff:v3];

  return v4;
}

- (STCallingStatusDomainDataDiff)initWithCallDescriptorListDataDiff:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STCallingStatusDomainDataDiff;
  id v5 = [(STCallingStatusDomainDataDiff *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    callDescriptorListDataDiff = v5->_callDescriptorListDataDiff;
    v5->_callDescriptorListDataDiff = (STListDataDiff *)v6;
  }
  return v5;
}

- (id)dataByApplyingToData:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  [(STCallingStatusDomainDataDiff *)self applyToMutableData:v4];

  return v4;
}

- (void)applyToMutableData:(id)a3
{
  if (self) {
    callDescriptorListDataDiff = self->_callDescriptorListDataDiff;
  }
  else {
    callDescriptorListDataDiff = 0;
  }
  id v5 = callDescriptorListDataDiff;
  id v6 = [a3 callDescriptorListData];
  [(STListDataDiff *)v5 applyToMutableListData:v6];
}

- (BOOL)isEmpty
{
  if (self) {
    self = (STCallingStatusDomainDataDiff *)self->_callDescriptorListDataDiff;
  }
  return [(STCallingStatusDomainDataDiff *)self isEmpty];
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (uint64_t *)v4;
    id v6 = v5;
    if (self)
    {
      callDescriptorListDataDiff = self->_callDescriptorListDataDiff;
      if (v5)
      {
LABEL_4:
        uint64_t v8 = v5[1];
LABEL_5:
        objc_super v9 = callDescriptorListDataDiff;
        v10 = [(STListDataDiff *)v9 diffByApplyingDiff:v8];

        v11 = [[STCallingStatusDomainDataDiff alloc] initWithCallDescriptorListDataDiff:v10];
        goto LABEL_7;
      }
    }
    else
    {
      callDescriptorListDataDiff = 0;
      if (v5) {
        goto LABEL_4;
      }
    }
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STCallingStatusDomainDataDiff *)self isEmpty]) {
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
  if (self) {
    self = (STCallingStatusDomainDataDiff *)self->_callDescriptorListDataDiff;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__STCallingStatusDomainDataDiff_isEqual___block_invoke;
  v10[3] = &unk_1E6B63058;
  id v11 = v4;
  id v6 = v4;
  id v7 = (id)[v5 appendObject:self counterpart:v10];
  char v8 = [v5 isEqual];

  return v8;
}

id __41__STCallingStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 8);
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = v3;
  if (self) {
    callDescriptorListDataDiff = self->_callDescriptorListDataDiff;
  }
  else {
    callDescriptorListDataDiff = 0;
  }
  id v6 = (id)[v3 appendObject:callDescriptorListDataDiff];
  unint64_t v7 = [v4 hash];

  return v7;
}

- (NSString)description
{
  return (NSString *)[(STCallingStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self) {
    callDescriptorListDataDiff = self->_callDescriptorListDataDiff;
  }
  else {
    callDescriptorListDataDiff = 0;
  }
  [a3 encodeObject:callDescriptorListDataDiff forKey:@"callDescriptorListDataDiff"];
}

- (STCallingStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callDescriptorListDataDiff"];

  if (v5)
  {
    self = [(STCallingStatusDomainDataDiff *)self initWithCallDescriptorListDataDiff:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)succinctDescription
{
  v2 = [(STCallingStatusDomainDataDiff *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STCallingStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STCallingStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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

    unint64_t v7 = [v6 activeMultilinePrefix];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__STCallingStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STCallingStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __81__STCallingStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:0 skipIfNil:1];
}

- (void).cxx_destruct
{
}

@end