@interface STBatteryStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isBatterySaverModeActive;
- (BOOL)isEqual:(id)a3;
- (NSString)chargingDescription;
- (NSString)description;
- (STBatteryStatusDomainData)init;
- (STBatteryStatusDomainData)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)chargingDescriptionType;
- (unint64_t)chargingState;
- (unint64_t)hash;
- (unint64_t)percentCharge;
- (void)encodeWithCoder:(id)a3;
- (void)initWithChargingState:(uint64_t)a3 percentCharge:(char)a4 batterySaverModeActive:(void *)a5 chargingDescription:(uint64_t)a6 chargingDescriptionType:;
- (void)initWithData:(void *)a1;
@end

@implementation STBatteryStatusDomainData

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[STMutableBatteryStatusDomainData allocWithZone:a3];

  return -[STBatteryStatusDomainData initWithData:](v4, self);
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = +[STBatteryStatusDomainDataDiff diffFromData:v4 toData:self];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t v6 = [(STBatteryStatusDomainData *)self chargingState];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __37__STBatteryStatusDomainData_isEqual___block_invoke;
  v30[3] = &unk_1E6B63670;
  id v7 = v4;
  id v31 = v7;
  id v8 = (id)[v5 appendUnsignedInteger:v6 counterpart:v30];
  unint64_t v9 = [(STBatteryStatusDomainData *)self percentCharge];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __37__STBatteryStatusDomainData_isEqual___block_invoke_2;
  v28[3] = &unk_1E6B63670;
  id v10 = v7;
  id v29 = v10;
  id v11 = (id)[v5 appendUnsignedInteger:v9 counterpart:v28];
  BOOL v12 = [(STBatteryStatusDomainData *)self isBatterySaverModeActive];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __37__STBatteryStatusDomainData_isEqual___block_invoke_3;
  v26[3] = &unk_1E6B630D0;
  id v13 = v10;
  id v27 = v13;
  id v14 = (id)[v5 appendBool:v12 counterpart:v26];
  v15 = [(STBatteryStatusDomainData *)self chargingDescription];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __37__STBatteryStatusDomainData_isEqual___block_invoke_4;
  v24[3] = &unk_1E6B630A8;
  id v16 = v13;
  id v25 = v16;
  id v17 = (id)[v5 appendString:v15 counterpart:v24];

  unint64_t v18 = [(STBatteryStatusDomainData *)self chargingDescriptionType];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __37__STBatteryStatusDomainData_isEqual___block_invoke_5;
  v22[3] = &unk_1E6B63670;
  id v23 = v16;
  id v19 = v16;
  id v20 = (id)[v5 appendUnsignedInteger:v18 counterpart:v22];
  LOBYTE(v18) = [v5 isEqual];

  return v18;
}

- (void)initWithData:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = [v3 chargingState];
    uint64_t v5 = [v3 percentCharge];
    char v6 = [v3 isBatterySaverModeActive];
    id v7 = [v3 chargingDescription];
    uint64_t v8 = [v3 chargingDescriptionType];

    v2 = -[STBatteryStatusDomainData initWithChargingState:percentCharge:batterySaverModeActive:chargingDescription:chargingDescriptionType:](v2, v4, v5, v6, v7, v8);
  }
  return v2;
}

- (unint64_t)percentCharge
{
  return self->_percentCharge;
}

- (unint64_t)chargingState
{
  return self->_chargingState;
}

- (BOOL)isBatterySaverModeActive
{
  return self->_batterySaverModeActive;
}

- (NSString)chargingDescription
{
  return self->_chargingDescription;
}

- (unint64_t)chargingDescriptionType
{
  return self->_chargingDescriptionType;
}

- (void)initWithChargingState:(uint64_t)a3 percentCharge:(char)a4 batterySaverModeActive:(void *)a5 chargingDescription:(uint64_t)a6 chargingDescriptionType:
{
  id v12 = a5;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)STBatteryStatusDomainData;
    id v13 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v13;
    if (v13)
    {
      *((void *)v13 + 1) = a2;
      *((void *)v13 + 2) = a3;
      *((unsigned char *)v13 + 24) = a4;
      objc_storeStrong((id *)v13 + 4, a5);
      a1[5] = a6;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
}

uint64_t __37__STBatteryStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) percentCharge];
}

uint64_t __37__STBatteryStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) chargingState];
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEmpty])
    {
      uint64_t v5 = (void *)[(STBatteryStatusDomainData *)self copy];
    }
    else
    {
      uint64_t v5 = (void *)[(STBatteryStatusDomainData *)self mutableCopy];
      [v4 applyToMutableData:v5];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (STBatteryStatusDomainData)init
{
  return (STBatteryStatusDomainData *)-[STBatteryStatusDomainData initWithData:](self, 0);
}

uint64_t __37__STBatteryStatusDomainData_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isBatterySaverModeActive];
}

uint64_t __37__STBatteryStatusDomainData_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) chargingDescription];
}

uint64_t __37__STBatteryStatusDomainData_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) chargingDescriptionType];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STBatteryStatusDomainData chargingState](self, "chargingState"));
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STBatteryStatusDomainData percentCharge](self, "percentCharge"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[STBatteryStatusDomainData isBatterySaverModeActive](self, "isBatterySaverModeActive"));
  id v7 = [(STBatteryStatusDomainData *)self chargingDescription];
  id v8 = (id)[v3 appendString:v7];

  id v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STBatteryStatusDomainData chargingDescriptionType](self, "chargingDescriptionType"));
  unint64_t v10 = [v3 hash];

  return v10;
}

- (NSString)description
{
  return (NSString *)[(STBatteryStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STBatteryStatusDomainData *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STBatteryStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STBatteryStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __77__STBatteryStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STBatteryStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

uint64_t __77__STBatteryStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) chargingState];
  if (v3 > 2) {
    id v4 = @"(unknown)";
  }
  else {
    id v4 = off_1E6B64408[v3];
  }
  [v2 appendString:v4 withName:@"chargingState"];
  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "percentCharge"), @"percentCharge");
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isBatterySaverModeActive"), @"batterySaverModeActive");
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) chargingDescription];
  [v7 appendString:v8 withName:@"chargingDescription"];

  id v9 = *(void **)(a1 + 32);
  unint64_t v10 = [*(id *)(a1 + 40) chargingDescriptionType];
  if (v10 > 2) {
    id v11 = @"(unknown)";
  }
  else {
    id v11 = off_1E6B64420[v10];
  }

  return [v9 appendString:v11 withName:@"chargingDescriptionType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[STBatteryStatusDomainData chargingState](self, "chargingState"), @"chargingState");
  objc_msgSend(v5, "encodeInteger:forKey:", -[STBatteryStatusDomainData percentCharge](self, "percentCharge"), @"percentCharge");
  objc_msgSend(v5, "encodeBool:forKey:", -[STBatteryStatusDomainData isBatterySaverModeActive](self, "isBatterySaverModeActive"), @"batterySaverModeActive");
  id v4 = [(STBatteryStatusDomainData *)self chargingDescription];
  [v5 encodeObject:v4 forKey:@"chargingDescription"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[STBatteryStatusDomainData chargingDescriptionType](self, "chargingDescriptionType"), @"chargingDescriptionType");
}

- (STBatteryStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"chargingState"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"percentCharge"];
  char v7 = [v4 decodeBoolForKey:@"batterySaverModeActive"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chargingDescription"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"chargingDescriptionType"];

  unint64_t v10 = (STBatteryStatusDomainData *)-[STBatteryStatusDomainData initWithChargingState:percentCharge:batterySaverModeActive:chargingDescription:chargingDescriptionType:](self, v5, v6, v7, v8, v9);
  return v10;
}

@end