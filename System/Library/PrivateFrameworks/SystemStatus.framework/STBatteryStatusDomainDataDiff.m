@interface STBatteryStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STBatteryStatusDomainDataDiff)init;
- (STBatteryStatusDomainDataDiff)initWithCoder:(id)a3;
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

@implementation STBatteryStatusDomainDataDiff

- (BOOL)isEmpty
{
  if (self) {
    self = (STBatteryStatusDomainDataDiff *)self->_changes;
  }
  return [(STBatteryStatusDomainDataDiff *)self isEmpty];
}

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  uint64_t v8 = [v6 chargingState];
  if ([v5 chargingState] != v8)
  {
    v9 = [NSNumber numberWithUnsignedInteger:v8];
    [v7 setObject:v9 forSetting:0];
  }
  uint64_t v10 = [v6 percentCharge];
  if ([v5 percentCharge] != v10)
  {
    v11 = [NSNumber numberWithUnsignedInteger:v10];
    [v7 setObject:v11 forSetting:1];
  }
  int v12 = [v6 isBatterySaverModeActive];
  if (v12 != [v5 isBatterySaverModeActive]) {
    [v7 setFlag:BSSettingFlagForBool() forSetting:2];
  }
  v13 = [v6 chargingDescription];
  v14 = [v5 chargingDescription];
  if (([v14 isEqualToString:v13] & 1) == 0)
  {
    if (v13)
    {
      [v7 setObject:v13 forSetting:3];
    }
    else if (v14)
    {
      [v7 setFlag:0 forSetting:3];
    }
  }
  uint64_t v15 = [v6 chargingDescriptionType];
  if ([v5 chargingDescriptionType] != v15)
  {
    v16 = [NSNumber numberWithUnsignedInteger:v15];
    [v7 setObject:v16 forSetting:4];
  }
  v17 = -[STBatteryStatusDomainDataDiff initWithChanges:]([STBatteryStatusDomainDataDiff alloc], v7);

  return v17;
}

- (STBatteryStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changes"];

  id v6 = (STBatteryStatusDomainDataDiff *)-[STBatteryStatusDomainDataDiff initWithChanges:](self, v5);
  return v6;
}

- (void)initWithChanges:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)STBatteryStatusDomainDataDiff;
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

uint64_t __52__STBatteryStatusDomainDataDiff_applyToMutableData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  switch(a2)
  {
    case 0:
      id v8 = v5;
      id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "setChargingState:", objc_msgSend(v5, "unsignedIntegerValue"));
      goto LABEL_6;
    case 1:
      id v8 = v5;
      id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "setPercentCharge:", objc_msgSend(v5, "unsignedIntegerValue"));
      goto LABEL_6;
    case 3:
      id v8 = v5;
      id v5 = (id)[*(id *)(a1 + 32) setChargingDescription:v5];
      goto LABEL_6;
    case 4:
      id v8 = v5;
      id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "setChargingDescriptionType:", objc_msgSend(v5, "unsignedIntegerValue"));
LABEL_6:
      id v6 = v8;
      break;
    default:
      break;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

- (void).cxx_destruct
{
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
  v11[2] = __52__STBatteryStatusDomainDataDiff_applyToMutableData___block_invoke;
  v11[3] = &unk_1E6B632F8;
  id v6 = v4;
  id v12 = v6;
  objc_super v7 = changes;
  [(BSSettings *)v7 enumerateFlagsWithBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__STBatteryStatusDomainDataDiff_applyToMutableData___block_invoke_2;
  v9[3] = &unk_1E6B63030;
  id v10 = v6;
  id v8 = v6;
  [(BSSettings *)v7 enumerateObjectsWithBlock:v9];
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
    id v6 = changes;
    objc_super v7 = (void *)[(BSSettings *)v6 mutableCopy];
    if (v4) {
      id v8 = (void *)v4[1];
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    [v7 applySettings:v9];
    id v10 = v7;
    v11 = v6;
    self;
    if (![v10 flagForSetting:3])
    {
      v14 = [v10 objectForSetting:3];

      if (v14)
      {
        if ([(BSSettings *)v11 flagForSetting:3]) {
          [v10 setObject:0 forSetting:3];
        }
        else {
          [v10 setFlag:0x7FFFFFFFFFFFFFFFLL forSetting:3];
        }
      }
    }

    id v12 = -[STBatteryStatusDomainDataDiff initWithChanges:]([STBatteryStatusDomainDataDiff alloc], v10);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STBatteryStatusDomainDataDiff)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  id v4 = (STBatteryStatusDomainDataDiff *)-[STBatteryStatusDomainDataDiff initWithChanges:](self, v3);

  return v4;
}

- (id)dataByApplyingToData:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  [(STBatteryStatusDomainDataDiff *)self applyToMutableData:v4];

  return v4;
}

uint64_t __52__STBatteryStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  if (a2 == 3)
  {
    result = BSSettingFlagIsExplicitNo();
    if (result)
    {
      id v5 = *(void **)(v2 + 32);
      return [v5 setChargingDescription:0];
    }
  }
  else if (a2 == 2)
  {
    id v3 = *(void **)(result + 32);
    uint64_t IsYes = BSSettingFlagIsYes();
    return [v3 setBatterySaverModeActive:IsYes];
  }
  return result;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STBatteryStatusDomainDataDiff *)self isEmpty]) {
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
    self = (STBatteryStatusDomainDataDiff *)self->_changes;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__STBatteryStatusDomainDataDiff_isEqual___block_invoke;
  v10[3] = &unk_1E6B63058;
  id v11 = v4;
  id v6 = v4;
  id v7 = (id)[v5 appendObject:self counterpart:v10];
  char v8 = [v5 isEqual];

  return v8;
}

id __41__STBatteryStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
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
  return (NSString *)[(STBatteryStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(STBatteryStatusDomainDataDiff *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STBatteryStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STBatteryStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 1);
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

    id v7 = v3[1];
    id v3 = v6;
    if (([v7 isEmpty] & 1) == 0)
    {
      char v8 = [v3 activeMultilinePrefix];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __69__STBatteryStatusDomainDataDiff__appendChanges_toDescriptionBuilder___block_invoke;
      v10[3] = &unk_1E6B63080;
      id v11 = v3;
      id v12 = v7;
      [v11 appendBodySectionWithName:0 multilinePrefix:v8 block:v10];
    }
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STBatteryStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 0);
}

void __69__STBatteryStatusDomainDataDiff__appendChanges_toDescriptionBuilder___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(*(id *)(a1 + 40), "flagForSetting:", 2), @"batterySaverModeActive", 1);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__STBatteryStatusDomainDataDiff__appendChanges_toDescriptionBuilder___block_invoke_2;
  v4[3] = &unk_1E6B63030;
  id v3 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsWithBlock:v4];
}

uint64_t __69__STBatteryStatusDomainDataDiff__appendChanges_toDescriptionBuilder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  switch(a2)
  {
    case 0:
      id v7 = *(void **)(a1 + 32);
      id v11 = v5;
      char v8 = STBatteryStatusDomainChargingStateDescription([v5 unsignedIntegerValue]);
      id v9 = @"chargingState";
      goto LABEL_6;
    case 1:
      id v11 = v5;
      id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(v5, "unsignedIntegerValue"), @"percentCharge");
      goto LABEL_7;
    case 3:
      id v11 = v5;
      id v5 = (id)[*(id *)(a1 + 32) appendString:v5 withName:@"chargingDescription"];
      goto LABEL_7;
    case 4:
      id v7 = *(void **)(a1 + 32);
      id v11 = v5;
      char v8 = STBatteryStatusDomainChargingDescriptionTypeDescription([v5 unsignedIntegerValue]);
      id v9 = @"chargingDescriptionType";
LABEL_6:
      [v7 appendString:v8 withName:v9];

LABEL_7:
      id v6 = v11;
      break;
    default:
      break;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

@end