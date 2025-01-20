@interface STPlaygroundsStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STPlaygroundsStatusDomainDataDiff)init;
- (STPlaygroundsStatusDomainDataDiff)initWithCoder:(id)a3;
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
- (void)initWithPlaygroundsActiveChangedValue:(void *)a1;
@end

@implementation STPlaygroundsStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 isPlaygroundsActive];
  int v7 = [v5 isPlaygroundsActive];

  if (v6 == v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = [NSNumber numberWithBool:v6];
  }
  v9 = -[STPlaygroundsStatusDomainDataDiff initWithPlaygroundsActiveChangedValue:]([STPlaygroundsStatusDomainDataDiff alloc], v8);

  return v9;
}

- (void)initWithPlaygroundsActiveChangedValue:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)STPlaygroundsStatusDomainDataDiff;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      id v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

- (STPlaygroundsStatusDomainDataDiff)init
{
  return (STPlaygroundsStatusDomainDataDiff *)-[STPlaygroundsStatusDomainDataDiff initWithPlaygroundsActiveChangedValue:](self, 0);
}

- (id)dataByApplyingToData:(id)a3
{
  uint64_t v4 = (void *)[a3 mutableCopy];
  [(STPlaygroundsStatusDomainDataDiff *)self applyToMutableData:v4];

  return v4;
}

- (void)applyToMutableData:(id)a3
{
  id v6 = a3;
  if (self)
  {
    uint64_t v4 = self->_playgroundsActiveChangedValue;
    if (v4)
    {
      id v5 = v4;
      objc_msgSend(v6, "setPlaygroundsActive:", -[NSNumber BOOLValue](v4, "BOOLValue"));
    }
  }
}

- (BOOL)isEmpty
{
  if (self) {
    playgroundsActiveChangedValue = self->_playgroundsActiveChangedValue;
  }
  else {
    playgroundsActiveChangedValue = 0;
  }
  return playgroundsActiveChangedValue == 0;
}

- (id)diffByApplyingDiff:(id)a3
{
  uint64_t v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v4 || (id v5 = (NSNumber *)v4[1]) == 0)
    {
      if (self) {
        playgroundsActiveChangedValue = self->_playgroundsActiveChangedValue;
      }
      else {
        playgroundsActiveChangedValue = 0;
      }
      id v5 = playgroundsActiveChangedValue;
    }
    objc_super v7 = -[STPlaygroundsStatusDomainDataDiff initWithPlaygroundsActiveChangedValue:]([STPlaygroundsStatusDomainDataDiff alloc], v5);
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STPlaygroundsStatusDomainDataDiff *)self isEmpty]) {
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
    self = (STPlaygroundsStatusDomainDataDiff *)self->_playgroundsActiveChangedValue;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__STPlaygroundsStatusDomainDataDiff_isEqual___block_invoke;
  v10[3] = &unk_1E6B63058;
  id v11 = v4;
  id v6 = v4;
  id v7 = (id)[v5 appendObject:self counterpart:v10];
  char v8 = [v5 isEqual];

  return v8;
}

id __45__STPlaygroundsStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
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
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = v3;
  if (self) {
    playgroundsActiveChangedValue = self->_playgroundsActiveChangedValue;
  }
  else {
    playgroundsActiveChangedValue = 0;
  }
  id v6 = (id)[v3 appendObject:playgroundsActiveChangedValue];
  unint64_t v7 = [v4 hash];

  return v7;
}

- (NSString)description
{
  return (NSString *)[(STPlaygroundsStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self) {
    playgroundsActiveChangedValue = self->_playgroundsActiveChangedValue;
  }
  else {
    playgroundsActiveChangedValue = 0;
  }
  [a3 encodeObject:playgroundsActiveChangedValue forKey:@"playgroundsActiveChangedValue"];
}

- (STPlaygroundsStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playgroundsActiveChangedValue"];

  id v6 = (STPlaygroundsStatusDomainDataDiff *)-[STPlaygroundsStatusDomainDataDiff initWithPlaygroundsActiveChangedValue:](self, v5);
  return v6;
}

- (id)succinctDescription
{
  v2 = [(STPlaygroundsStatusDomainDataDiff *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STPlaygroundsStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STPlaygroundsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __85__STPlaygroundsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STPlaygroundsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __85__STPlaygroundsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1) {
    uint64_t v1 = (void *)v1[1];
  }
  id v4 = v1;
  id v3 = (id)objc_msgSend(v2, "appendBool:withName:", objc_msgSend(v4, "BOOLValue"), @"playgroundsActiveChanged");
}

- (void).cxx_destruct
{
}

@end