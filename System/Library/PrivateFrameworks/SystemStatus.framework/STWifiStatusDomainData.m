@interface STWifiStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isAssociatedToIOSHotspot;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWifiActive;
- (NSString)description;
- (STWifiStatusDomainData)init;
- (STWifiStatusDomainData)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithData:(id)result;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)signalStrengthBars;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STWifiStatusDomainData

- (id)initWithData:(id)result
{
  if (result)
  {
    v2 = result;
    id v3 = a2;
    char v4 = [v3 isWifiActive];
    uint64_t v5 = [v3 signalStrengthBars];
    char v6 = [v3 isAssociatedToIOSHotspot];

    v7.receiver = v2;
    v7.super_class = (Class)STWifiStatusDomainData;
    result = objc_msgSendSuper2(&v7, sel_init);
    if (result)
    {
      *((unsigned char *)result + 8) = v4;
      *((void *)result + 2) = v5;
      *((unsigned char *)result + 24) = v6;
    }
  }
  return result;
}

- (BOOL)isWifiActive
{
  return self->_wifiActive;
}

- (unint64_t)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (BOOL)isAssociatedToIOSHotspot
{
  return self->_associatedToIOSHotspot;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  char v4 = +[STMutableWifiStatusDomainData allocWithZone:a3];

  return -[STWifiStatusDomainData initWithData:](v4, self);
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = +[STWifiStatusDomainDataDiff diffFromData:v4 toData:self];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (STWifiStatusDomainData)init
{
  return (STWifiStatusDomainData *)-[STWifiStatusDomainData initWithData:](self, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL v6 = [(STWifiStatusDomainData *)self isWifiActive];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __34__STWifiStatusDomainData_isEqual___block_invoke;
  v20[3] = &unk_1E6B630D0;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendBool:v6 counterpart:v20];
  unint64_t v9 = [(STWifiStatusDomainData *)self signalStrengthBars];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __34__STWifiStatusDomainData_isEqual___block_invoke_2;
  v18[3] = &unk_1E6B63670;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendUnsignedInteger:v9 counterpart:v18];
  uint64_t v12 = [(STWifiStatusDomainData *)self isAssociatedToIOSHotspot];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __34__STWifiStatusDomainData_isEqual___block_invoke_3;
  v16[3] = &unk_1E6B630D0;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendBool:v12 counterpart:v16];
  LOBYTE(v12) = [v5 isEqual];

  return v12;
}

uint64_t __34__STWifiStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isWifiActive];
}

uint64_t __34__STWifiStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalStrengthBars];
}

uint64_t __34__STWifiStatusDomainData_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isAssociatedToIOSHotspot];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[STWifiStatusDomainData isWifiActive](self, "isWifiActive"));
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STWifiStatusDomainData signalStrengthBars](self, "signalStrengthBars"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[STWifiStatusDomainData isAssociatedToIOSHotspot](self, "isAssociatedToIOSHotspot"));
  unint64_t v7 = [v3 hash];

  return v7;
}

- (NSString)description
{
  return (NSString *)[(STWifiStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STWifiStatusDomainData *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STWifiStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STWifiStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __74__STWifiStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STWifiStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __74__STWifiStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isWifiActive"), @"wifiActive");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "signalStrengthBars"), @"signalStrengthBars");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isAssociatedToIOSHotspot"), @"associatedToIOSHotspot");
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEmpty])
    {
      id v5 = (void *)[(STWifiStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STWifiStatusDomainData *)self mutableCopy];
      [v4 applyToMutableData:v5];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[STWifiStatusDomainData isWifiActive](self, "isWifiActive"), @"wifiActive");
  objc_msgSend(v4, "encodeInteger:forKey:", -[STWifiStatusDomainData signalStrengthBars](self, "signalStrengthBars"), @"signalStrengthBars");
  objc_msgSend(v4, "encodeBool:forKey:", -[STWifiStatusDomainData isAssociatedToIOSHotspot](self, "isAssociatedToIOSHotspot"), @"associatedToIOSHotspot");
}

- (STWifiStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeBoolForKey:@"wifiActive"];
  unint64_t v6 = [v4 decodeIntegerForKey:@"signalStrengthBars"];
  char v7 = [v4 decodeBoolForKey:@"associatedToIOSHotspot"];

  if (!self) {
    return 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)STWifiStatusDomainData;
  result = [(STWifiStatusDomainData *)&v9 init];
  if (result)
  {
    result->_wifiActive = v5;
    result->_signalStrengthBars = v6;
    result->_associatedToIOSHotspot = v7;
  }
  return result;
}

@end