@interface STStewieStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STStewieStatusDomainDataDiff)init;
- (STStewieStatusDomainDataDiff)initWithCoder:(id)a3;
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
- (void)initWithStewieActiveChangedValue:(void *)a3 stewieConnectedChangedValue:;
@end

@implementation STStewieStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 isStewieActive];
  if (v7 == [v5 isStewieActive])
  {
    v8 = 0;
  }
  else
  {
    v8 = [NSNumber numberWithBool:v7];
  }
  uint64_t v9 = [v6 isStewieConnected];
  if (v9 == [v5 isStewieConnected])
  {
    v10 = 0;
  }
  else
  {
    v10 = [NSNumber numberWithBool:v9];
  }
  v11 = -[STStewieStatusDomainDataDiff initWithStewieActiveChangedValue:stewieConnectedChangedValue:]([STStewieStatusDomainDataDiff alloc], v8, v10);

  return v11;
}

- (void)initWithStewieActiveChangedValue:(void *)a3 stewieConnectedChangedValue:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)STStewieStatusDomainDataDiff;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      v8 = (void *)a1[1];
      a1[1] = v7;

      uint64_t v9 = [v6 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (STStewieStatusDomainDataDiff)init
{
  return (STStewieStatusDomainDataDiff *)-[STStewieStatusDomainDataDiff initWithStewieActiveChangedValue:stewieConnectedChangedValue:](self, 0, 0);
}

- (id)dataByApplyingToData:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  [(STStewieStatusDomainDataDiff *)self applyToMutableData:v4];

  return v4;
}

- (void)applyToMutableData:(id)a3
{
  id v8 = a3;
  if (self)
  {
    v4 = self->_stewieActiveChangedValue;
    id v5 = v4;
    if (v4) {
      objc_msgSend(v8, "setStewieActive:", -[NSNumber BOOLValue](v4, "BOOLValue"));
    }
    id v6 = self->_stewieConnectedChangedValue;
    if (v6)
    {
      uint64_t v7 = v6;
      objc_msgSend(v8, "setStewieConnected:", -[NSNumber BOOLValue](v6, "BOOLValue"));
    }
  }
  else
  {
    id v5 = 0;
  }
}

- (BOOL)isEmpty
{
  if (!self)
  {
    stewieConnectedChangedValue = 0;
    goto LABEL_5;
  }
  v3 = self->_stewieActiveChangedValue;
  if (!v3)
  {
    stewieConnectedChangedValue = self->_stewieConnectedChangedValue;
LABEL_5:
    v3 = 0;
    BOOL v4 = stewieConnectedChangedValue == 0;
    goto LABEL_6;
  }
  BOOL v4 = 0;
LABEL_6:

  return v4;
}

- (id)diffByApplyingDiff:(id)a3
{
  BOOL v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((!v4 || (id v5 = (NSNumber *)v4[1]) == 0)
      && (!self ? (stewieActiveChangedValue = 0) : (stewieActiveChangedValue = self->_stewieActiveChangedValue),
          id v5 = stewieActiveChangedValue,
          !v4)
      || (uint64_t v7 = (NSNumber *)v4[2]) == 0)
    {
      if (self) {
        stewieConnectedChangedValue = self->_stewieConnectedChangedValue;
      }
      else {
        stewieConnectedChangedValue = 0;
      }
      uint64_t v7 = stewieConnectedChangedValue;
    }
    uint64_t v9 = -[STStewieStatusDomainDataDiff initWithStewieActiveChangedValue:stewieConnectedChangedValue:]([STStewieStatusDomainDataDiff alloc], v5, v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STStewieStatusDomainDataDiff *)self isEmpty]) {
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
    stewieActiveChangedValue = self->_stewieActiveChangedValue;
  }
  else {
    stewieActiveChangedValue = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__STStewieStatusDomainDataDiff_isEqual___block_invoke;
  v18[3] = &unk_1E6B63058;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:stewieActiveChangedValue counterpart:v18];
  if (self) {
    self = (STStewieStatusDomainDataDiff *)self->_stewieConnectedChangedValue;
  }
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __40__STStewieStatusDomainDataDiff_isEqual___block_invoke_2;
  v16 = &unk_1E6B63058;
  id v17 = v7;
  id v9 = v7;
  id v10 = (id)[v5 appendObject:self counterpart:&v13];
  char v11 = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return v11;
}

id __40__STStewieStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 8);
  }
  else {
    return 0;
  }
}

id __40__STStewieStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
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
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = v3;
  if (self)
  {
    id v5 = (id)[v3 appendObject:self->_stewieActiveChangedValue];
    stewieConnectedChangedValue = self->_stewieConnectedChangedValue;
  }
  else
  {
    id v10 = (id)[v3 appendObject:0];
    stewieConnectedChangedValue = 0;
  }
  id v7 = (id)[v4 appendObject:stewieConnectedChangedValue];
  unint64_t v8 = [v4 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(STStewieStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_stewieActiveChangedValue forKey:@"stewieActiveChangedValue"];
    stewieConnectedChangedValue = self->_stewieConnectedChangedValue;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"stewieActiveChangedValue"];
    stewieConnectedChangedValue = 0;
  }
  [a3 encodeObject:stewieConnectedChangedValue forKey:@"stewieConnectedChangedValue"];
}

- (STStewieStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stewieActiveChangedValue"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stewieConnectedChangedValue"];

  id v7 = (STStewieStatusDomainDataDiff *)-[STStewieStatusDomainDataDiff initWithStewieActiveChangedValue:stewieConnectedChangedValue:](self, v5, v6);
  return v7;
}

- (id)succinctDescription
{
  v2 = [(STStewieStatusDomainDataDiff *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STStewieStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STStewieStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __80__STStewieStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STStewieStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __80__STStewieStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2) {
    v2 = (void *)v2[1];
  }
  id v4 = v2;
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(v4, "BOOLValue"), @"stewieActiveChanged");

  id v7 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  if (v6) {
    id v6 = (void *)v6[2];
  }
  id v9 = v6;
  id v8 = (id)objc_msgSend(v7, "appendBool:withName:", objc_msgSend(v9, "BOOLValue"), @"stewieConnectedChanged");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stewieConnectedChangedValue, 0);

  objc_storeStrong((id *)&self->_stewieActiveChangedValue, 0);
}

@end