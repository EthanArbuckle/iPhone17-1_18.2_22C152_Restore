@interface STVoiceControlStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STVoiceControlStatusDomainDataDiff)init;
- (STVoiceControlStatusDomainDataDiff)initWithCoder:(id)a3;
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
- (void)initWithChanges:(void *)a1;
@end

@implementation STVoiceControlStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  int v8 = [v6 isVoiceControlActive];
  if (v8 != [v5 isVoiceControlActive]) {
    [v7 setFlag:BSSettingFlagForBool() forSetting:0];
  }
  uint64_t v9 = [v6 listeningState];
  if ([v5 listeningState] != v9)
  {
    v10 = [NSNumber numberWithUnsignedInteger:v9];
    [v7 setObject:v10 forSetting:1];
  }
  v11 = -[STVoiceControlStatusDomainDataDiff initWithChanges:]([STVoiceControlStatusDomainDataDiff alloc], v7);

  return v11;
}

- (void)initWithChanges:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)STVoiceControlStatusDomainDataDiff;
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

- (STVoiceControlStatusDomainDataDiff)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  uint64_t v4 = (STVoiceControlStatusDomainDataDiff *)-[STVoiceControlStatusDomainDataDiff initWithChanges:](self, v3);

  return v4;
}

- (id)dataByApplyingToData:(id)a3
{
  uint64_t v4 = (void *)[a3 mutableCopy];
  [(STVoiceControlStatusDomainDataDiff *)self applyToMutableData:v4];

  return v4;
}

- (void)applyToMutableData:(id)a3
{
  id v4 = a3;
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__STVoiceControlStatusDomainDataDiff_applyToMutableData___block_invoke;
  v11[3] = &unk_1E6B632F8;
  id v6 = v4;
  id v12 = v6;
  objc_super v7 = changes;
  [(BSSettings *)v7 enumerateFlagsWithBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__STVoiceControlStatusDomainDataDiff_applyToMutableData___block_invoke_2;
  v9[3] = &unk_1E6B63030;
  id v10 = v6;
  id v8 = v6;
  [(BSSettings *)v7 enumerateObjectsWithBlock:v9];
}

uint64_t __57__STVoiceControlStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    id v3 = *(void **)(result + 32);
    uint64_t IsYes = BSSettingFlagIsYes();
    return [v3 setVoiceControlActive:IsYes];
  }
  return result;
}

uint64_t __57__STVoiceControlStatusDomainDataDiff_applyToMutableData___block_invoke_2(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 == 1)
  {
    id v4 = *(void **)(result + 32);
    uint64_t v5 = [a3 unsignedIntegerValue];
    return [v4 setListeningState:v5];
  }
  return result;
}

- (BOOL)isEmpty
{
  if (self) {
    self = (STVoiceControlStatusDomainDataDiff *)self->_changes;
  }
  return [(STVoiceControlStatusDomainDataDiff *)self isEmpty];
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self) {
      changes = self->_changes;
    }
    else {
      changes = 0;
    }
    id v6 = (void *)[(BSSettings *)changes mutableCopy];
    objc_super v7 = v6;
    if (v4) {
      uint64_t v8 = v4[1];
    }
    else {
      uint64_t v8 = 0;
    }
    [v6 applySettings:v8];
    uint64_t v9 = -[STVoiceControlStatusDomainDataDiff initWithChanges:]([STVoiceControlStatusDomainDataDiff alloc], v7);
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
  if ([(STVoiceControlStatusDomainDataDiff *)self isEmpty]) {
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
    self = (STVoiceControlStatusDomainDataDiff *)self->_changes;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__STVoiceControlStatusDomainDataDiff_isEqual___block_invoke;
  v10[3] = &unk_1E6B63058;
  id v11 = v4;
  id v6 = v4;
  id v7 = (id)[v5 appendObject:self counterpart:v10];
  char v8 = [v5 isEqual];

  return v8;
}

id __46__STVoiceControlStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
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
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = v3;
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  id v6 = (id)[v3 appendObject:changes];
  unint64_t v7 = [v4 hash];

  return v7;
}

- (NSString)description
{
  return (NSString *)[(STVoiceControlStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  [a3 encodeObject:changes forKey:@"changes"];
}

- (STVoiceControlStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changes"];

  id v6 = (STVoiceControlStatusDomainDataDiff *)-[STVoiceControlStatusDomainDataDiff initWithChanges:](self, v5);
  return v6;
}

- (id)succinctDescription
{
  uint64_t v2 = [(STVoiceControlStatusDomainDataDiff *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STVoiceControlStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = -[STVoiceControlStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  if (a1)
  {
    id v5 = a2;
    id v6 = [a1 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];

    id v7 = a1[1];
    id v8 = (id)objc_msgSend(v6, "appendFlag:withName:skipIfNotSet:", objc_msgSend(v7, "flagForSetting:", 0), @"voiceControlActive", 1);
    uint64_t v9 = [v7 objectForSetting:1];

    if (v9)
    {
      id v10 = STVoiceControlStatusDomainListeningStateDescription([v9 unsignedIntegerValue]);
      [v6 appendString:v10 withName:@"listeningState"];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STVoiceControlStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 0);
}

- (void).cxx_destruct
{
}

@end