@interface STTelephonyStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STTelephonyStatusDomainDataDiff)init;
- (STTelephonyStatusDomainDataDiff)initWithCoder:(id)a3;
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
- (void)initWithSIMOneInfoDiff:(void *)a3 SIMTwoInfoDiff:(void *)a4 changes:;
@end

@implementation STTelephonyStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 SIMOneInfo];
  v8 = [v6 SIMOneInfo];
  v9 = +[STTelephonyStatusDomainSIMInfoDiff diffFromInfo:v7 toInfo:v8];

  v10 = [v5 SIMTwoInfo];
  v11 = [v6 SIMTwoInfo];
  v12 = +[STTelephonyStatusDomainSIMInfoDiff diffFromInfo:v10 toInfo:v11];

  id v13 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  LODWORD(v11) = [v6 isCellularRadioCapabilityEnabled];
  if (v11 != [v5 isCellularRadioCapabilityEnabled]) {
    [v13 setFlag:BSSettingFlagForBool() forSetting:0];
  }
  int v14 = [v6 isDualSIMEnabled];
  if (v14 != [v5 isDualSIMEnabled]) {
    [v13 setFlag:BSSettingFlagForBool() forSetting:1];
  }
  int v15 = [v6 isRadioModuleDead];
  if (v15 != [v5 isRadioModuleDead]) {
    [v13 setFlag:BSSettingFlagForBool() forSetting:2];
  }
  int v16 = [v6 isUsingStewieForSOS];
  if (v16 != [v5 isUsingStewieForSOS]) {
    [v13 setFlag:BSSettingFlagForBool() forSetting:3];
  }
  int v17 = [v6 isInactiveSOSEnabled];
  if (v17 != [v5 isInactiveSOSEnabled]) {
    [v13 setFlag:BSSettingFlagForBool() forSetting:4];
  }
  int v18 = [v6 isUsingStewieConnection];
  if (v18 != [v5 isUsingStewieConnection]) {
    [v13 setFlag:BSSettingFlagForBool() forSetting:5];
  }
  v19 = -[STTelephonyStatusDomainDataDiff initWithSIMOneInfoDiff:SIMTwoInfoDiff:changes:]([STTelephonyStatusDomainDataDiff alloc], v9, v12, v13);

  return v19;
}

- (BOOL)isEmpty
{
  if (self) {
    SIMOneInfoDiff = self->_SIMOneInfoDiff;
  }
  else {
    SIMOneInfoDiff = 0;
  }
  v4 = SIMOneInfoDiff;
  if ([(STTelephonyStatusDomainSIMInfoDiff *)v4 isEmpty])
  {
    if (self) {
      SIMTwoInfoDiff = self->_SIMTwoInfoDiff;
    }
    else {
      SIMTwoInfoDiff = 0;
    }
    id v6 = SIMTwoInfoDiff;
    if ([(STTelephonyStatusDomainSIMInfoDiff *)v6 isEmpty])
    {
      if (self) {
        changes = self->_changes;
      }
      else {
        changes = 0;
      }
      char v8 = [(BSSettings *)changes isEmpty];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)initWithSIMOneInfoDiff:(void *)a3 SIMTwoInfoDiff:(void *)a4 changes:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)STTelephonyStatusDomainDataDiff;
    a1 = objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      uint64_t v10 = [v7 copy];
      v11 = (void *)a1[1];
      a1[1] = v10;

      uint64_t v12 = [v8 copy];
      id v13 = (void *)a1[2];
      a1[2] = v12;

      uint64_t v14 = [v9 copy];
      int v15 = (void *)a1[3];
      a1[3] = v14;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_SIMTwoInfoDiff, 0);

  objc_storeStrong((id *)&self->_SIMOneInfoDiff, 0);
}

- (STTelephonyStatusDomainDataDiff)init
{
  v3 = objc_alloc_init(STTelephonyStatusDomainSIMInfoDiff);
  id v4 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  id v5 = (STTelephonyStatusDomainDataDiff *)-[STTelephonyStatusDomainDataDiff initWithSIMOneInfoDiff:SIMTwoInfoDiff:changes:](self, v3, v3, v4);

  return v5;
}

- (id)dataByApplyingToData:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  [(STTelephonyStatusDomainDataDiff *)self applyToMutableData:v4];

  return v4;
}

- (void)applyToMutableData:(id)a3
{
  id v4 = a3;
  if (self)
  {
    id v5 = self->_SIMOneInfoDiff;
    id v6 = v5;
    if (v5)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke;
      v15[3] = &unk_1E6B64190;
      int v16 = v5;
      [v4 updateSIMOneInfoWithBlock:v15];
    }
    id v7 = self->_SIMTwoInfoDiff;
    id v8 = v7;
    if (v7)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke_2;
      v13[3] = &unk_1E6B64190;
      uint64_t v14 = v7;
      [v4 updateSIMTwoInfoWithBlock:v13];
    }
    self = (STTelephonyStatusDomainDataDiff *)self->_changes;
  }
  else
  {
    id v6 = 0;
    id v8 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke_3;
  v11[3] = &unk_1E6B632F8;
  id v12 = v4;
  id v9 = v4;
  uint64_t v10 = self;
  [(STTelephonyStatusDomainDataDiff *)v10 enumerateFlagsWithBlock:v11];
}

uint64_t __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) applyToMutableInfo:a2];
}

uint64_t __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) applyToMutableInfo:a2];
}

uint64_t __54__STTelephonyStatusDomainDataDiff_applyToMutableData___block_invoke_3(uint64_t result, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      v2 = *(void **)(result + 32);
      uint64_t IsYes = BSSettingFlagIsYes();
      result = [v2 setCellularRadioCapabilityEnabled:IsYes];
      break;
    case 1:
      id v4 = *(void **)(result + 32);
      uint64_t v5 = BSSettingFlagIsYes();
      result = [v4 setDualSIMEnabled:v5];
      break;
    case 2:
      id v6 = *(void **)(result + 32);
      uint64_t v7 = BSSettingFlagIsYes();
      result = [v6 setRadioModuleDead:v7];
      break;
    case 3:
      id v8 = *(void **)(result + 32);
      uint64_t v9 = BSSettingFlagIsYes();
      result = [v8 setUsingStewieForSOS:v9];
      break;
    case 4:
      uint64_t v10 = *(void **)(result + 32);
      uint64_t v11 = BSSettingFlagIsYes();
      result = [v10 setInactiveSOSEnabled:v11];
      break;
    case 5:
      id v12 = *(void **)(result + 32);
      uint64_t v13 = BSSettingFlagIsYes();
      result = [v12 setUsingStewieConnection:v13];
      break;
    default:
      return result;
  }
  return result;
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    id v6 = v5;
    if (self)
    {
      SIMOneInfoDiff = self->_SIMOneInfoDiff;
      if (v5)
      {
LABEL_4:
        uint64_t v8 = v5[1];
        goto LABEL_5;
      }
    }
    else
    {
      SIMOneInfoDiff = 0;
      if (v5) {
        goto LABEL_4;
      }
    }
    uint64_t v8 = 0;
LABEL_5:
    uint64_t v9 = SIMOneInfoDiff;
    uint64_t v10 = [(STTelephonyStatusDomainSIMInfoDiff *)v9 diffByApplyingDiff:v8];

    if (self)
    {
      SIMTwoInfoDiff = self->_SIMTwoInfoDiff;
      if (v6)
      {
LABEL_7:
        uint64_t v12 = v6[2];
LABEL_8:
        uint64_t v13 = SIMTwoInfoDiff;
        uint64_t v14 = [(STTelephonyStatusDomainSIMInfoDiff *)v13 diffByApplyingDiff:v12];

        if (self) {
          changes = self->_changes;
        }
        else {
          changes = 0;
        }
        int v16 = (void *)[(BSSettings *)changes mutableCopy];
        objc_super v17 = v16;
        if (v6) {
          uint64_t v18 = v6[3];
        }
        else {
          uint64_t v18 = 0;
        }
        [v16 applySettings:v18];
        v19 = -[STTelephonyStatusDomainDataDiff initWithSIMOneInfoDiff:SIMTwoInfoDiff:changes:]([STTelephonyStatusDomainDataDiff alloc], v10, v14, v17);

        goto LABEL_14;
      }
    }
    else
    {
      SIMTwoInfoDiff = 0;
      if (v6) {
        goto LABEL_7;
      }
    }
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STTelephonyStatusDomainDataDiff *)self isEmpty]) {
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
    SIMOneInfoDiff = self->_SIMOneInfoDiff;
  }
  else {
    SIMOneInfoDiff = 0;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke;
  v20[3] = &unk_1E6B63058;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendObject:SIMOneInfoDiff counterpart:v20];
  if (self) {
    SIMTwoInfoDiff = self->_SIMTwoInfoDiff;
  }
  else {
    SIMTwoInfoDiff = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke_2;
  v18[3] = &unk_1E6B63058;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:SIMTwoInfoDiff counterpart:v18];
  if (self) {
    self = (STTelephonyStatusDomainDataDiff *)self->_changes;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke_3;
  v16[3] = &unk_1E6B63058;
  id v17 = v10;
  id v12 = v10;
  id v13 = (id)[v5 appendObject:self counterpart:v16];
  char v14 = [v5 isEqual];

  return v14;
}

id __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 8);
  }
  else {
    return 0;
  }
}

id __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 16);
  }
  else {
    return 0;
  }
}

id __43__STTelephonyStatusDomainDataDiff_isEqual___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 24);
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
    id v5 = (id)[v3 appendObject:self->_SIMOneInfoDiff];
    SIMTwoInfoDiff = self->_SIMTwoInfoDiff;
  }
  else
  {
    id v12 = (id)[v3 appendObject:0];
    SIMTwoInfoDiff = 0;
  }
  id v7 = (id)[v4 appendObject:SIMTwoInfoDiff];
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  id v9 = (id)[v4 appendObject:changes];
  unint64_t v10 = [v4 hash];

  return v10;
}

- (NSString)description
{
  return (NSString *)[(STTelephonyStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeObject:self->_SIMOneInfoDiff forKey:@"SIMOneInfoDiff"];
    [v5 encodeObject:self->_SIMTwoInfoDiff forKey:@"SIMTwoInfoDiff"];
    changes = self->_changes;
  }
  else
  {
    [v5 encodeObject:0 forKey:@"SIMOneInfoDiff"];
    [v5 encodeObject:0 forKey:@"SIMTwoInfoDiff"];
    changes = 0;
  }
  [v5 encodeObject:changes forKey:@"changes"];
}

- (STTelephonyStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SIMOneInfoDiff"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SIMTwoInfoDiff"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changes"];

  id v8 = (STTelephonyStatusDomainDataDiff *)-[STTelephonyStatusDomainDataDiff initWithSIMOneInfoDiff:SIMTwoInfoDiff:changes:](self, v5, v6, v7);
  return v8;
}

- (id)succinctDescription
{
  v2 = [(STTelephonyStatusDomainDataDiff *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STTelephonyStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STTelephonyStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __83__STTelephonyStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STTelephonyStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __83__STTelephonyStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = (id)[v2 appendObject:v4 withName:@"simOne" skipIfNil:1];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)[*(id *)(a1 + 32) appendObject:v7 withName:@"simTwo" skipIfNil:1];
  id v9 = *(void **)(a1 + 40);
  if (v9) {
    id v9 = (void *)v9[3];
  }
  int v16 = v9;
  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 0), @"cellularRadioCapabilityEnabled", 1);
  id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 1), @"dualSIMEnabled", 1);
  id v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 2), @"radioModuleDead", 1);
  id v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 3), @"usingStewieForSOS", 1);
  id v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 4), @"inactiveSOSEnabled", 1);
  id v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFlag:withName:skipIfNotSet:", objc_msgSend(v16, "flagForSetting:", 5), @"usingStewieConnection", 1);
}

@end