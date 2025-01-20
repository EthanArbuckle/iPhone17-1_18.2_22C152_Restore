@interface STTelephonyStatusDomainSIMInfoDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromInfo:(id)a3 toInfo:(id)a4;
+ (void)_resolveCombinedChanges:(uint64_t)a3 forObjectEntry:(void *)a4 baseChanges:;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STTelephonyStatusDomainSIMInfoDiff)init;
- (STTelephonyStatusDomainSIMInfoDiff)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffByApplyingDiff:(id)a3;
- (id)infoByApplyingToInfo:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)applyToMutableInfo:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initWithChanges:(void *)a1;
@end

@implementation STTelephonyStatusDomainSIMInfoDiff

+ (id)diffFromInfo:(id)a3 toInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  int v8 = [v6 isSIMPresent];
  if (v8 != [v5 isSIMPresent]) {
    [v7 setFlag:BSSettingFlagForBool() forSetting:0];
  }
  int v9 = [v6 isBootstrap];
  if (v9 != [v5 isBootstrap]) {
    [v7 setFlag:BSSettingFlagForBool() forSetting:1];
  }
  uint64_t v10 = [v6 label];
  v11 = [v5 label];
  if (([v11 isEqualToString:v10] & 1) == 0)
  {
    if (v10)
    {
      [v7 setObject:v10 forSetting:2];
    }
    else if (v11)
    {
      [v7 setFlag:0 forSetting:2];
    }
  }
  v12 = [v6 shortLabel];
  v13 = [v5 shortLabel];
  if (([v13 isEqualToString:v12] & 1) == 0)
  {
    if (v12)
    {
      [v7 setObject:v12 forSetting:3];
    }
    else if (v13)
    {
      [v7 setFlag:0 forSetting:3];
    }
  }
  v37 = v11;
  uint64_t v14 = [v6 signalStrengthBars];
  if ([v5 signalStrengthBars] != v14)
  {
    v15 = [NSNumber numberWithUnsignedInteger:v14];
    [v7 setObject:v15 forSetting:4];
  }
  uint64_t v16 = [v6 maxSignalStrengthBars];
  if ([v5 maxSignalStrengthBars] != v16)
  {
    v17 = [NSNumber numberWithUnsignedInteger:v16];
    [v7 setObject:v17 forSetting:5];
  }
  uint64_t v18 = [v6 serviceState];
  if ([v5 serviceState] != v18)
  {
    v19 = [NSNumber numberWithUnsignedInteger:v18];
    [v7 setObject:v19 forSetting:6];
  }
  uint64_t v20 = [v6 cellularServiceState];
  if ([v5 cellularServiceState] != v20)
  {
    v21 = [NSNumber numberWithUnsignedInteger:v20];
    [v7 setObject:v21 forSetting:7];
  }
  v22 = [v6 serviceDescription];
  v23 = [v5 serviceDescription];
  if (([v23 isEqualToString:v22] & 1) == 0)
  {
    if (v22)
    {
      [v7 setObject:v22 forSetting:8];
    }
    else if (v23)
    {
      [v7 setFlag:0 forSetting:8];
    }
  }
  v24 = [v6 secondaryServiceDescription];
  v25 = [v5 secondaryServiceDescription];
  if (([v25 isEqualToString:v24] & 1) == 0)
  {
    if (v24)
    {
      [v7 setObject:v24 forSetting:9];
    }
    else if (v25)
    {
      [v7 setFlag:0 forSetting:9];
    }
  }
  uint64_t v35 = v10;
  v26 = v13;
  uint64_t v27 = objc_msgSend(v6, "dataNetworkType", v35);
  if ([v5 dataNetworkType] != v27)
  {
    v28 = [NSNumber numberWithUnsignedInteger:v27];
    [v7 setObject:v28 forSetting:10];
  }
  int v29 = [v6 isProvidingDataConnection];
  if (v29 != [v5 isProvidingDataConnection]) {
    [v7 setFlag:BSSettingFlagForBool() forSetting:11];
  }
  int v30 = [v6 isPreferredForDataConnections];
  if (v30 != [v5 isPreferredForDataConnections]) {
    [v7 setFlag:BSSettingFlagForBool() forSetting:12];
  }
  int v31 = [v6 isRegisteredWithoutCellular];
  if (v31 != [v5 isRegisteredWithoutCellular]) {
    [v7 setFlag:BSSettingFlagForBool() forSetting:13];
  }
  int v32 = [v6 isCallForwardingEnabled];
  if (v32 != [v5 isCallForwardingEnabled]) {
    [v7 setFlag:BSSettingFlagForBool() forSetting:14];
  }
  v33 = -[STTelephonyStatusDomainSIMInfoDiff initWithChanges:]([STTelephonyStatusDomainSIMInfoDiff alloc], v7);

  return v33;
}

- (void)initWithChanges:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)STTelephonyStatusDomainSIMInfoDiff;
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

- (void).cxx_destruct
{
}

- (BOOL)isEmpty
{
  if (self) {
    self = (STTelephonyStatusDomainSIMInfoDiff *)self->_changes;
  }
  return [(STTelephonyStatusDomainSIMInfoDiff *)self isEmpty];
}

- (STTelephonyStatusDomainSIMInfoDiff)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  uint64_t v4 = (STTelephonyStatusDomainSIMInfoDiff *)-[STTelephonyStatusDomainSIMInfoDiff initWithChanges:](self, v3);

  return v4;
}

- (id)infoByApplyingToInfo:(id)a3
{
  uint64_t v4 = (void *)[a3 mutableCopy];
  [(STTelephonyStatusDomainSIMInfoDiff *)self applyToMutableInfo:v4];

  return v4;
}

- (void)applyToMutableInfo:(id)a3
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
  v11[2] = __57__STTelephonyStatusDomainSIMInfoDiff_applyToMutableInfo___block_invoke;
  v11[3] = &unk_1E6B632F8;
  id v6 = v4;
  id v12 = v6;
  objc_super v7 = changes;
  [(BSSettings *)v7 enumerateFlagsWithBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__STTelephonyStatusDomainSIMInfoDiff_applyToMutableInfo___block_invoke_2;
  v9[3] = &unk_1E6B63030;
  id v10 = v6;
  id v8 = v6;
  [(BSSettings *)v7 enumerateObjectsWithBlock:v9];
}

uint64_t __57__STTelephonyStatusDomainSIMInfoDiff_applyToMutableInfo___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  switch(a2)
  {
    case 0:
      id v3 = *(void **)(result + 32);
      uint64_t IsYes = BSSettingFlagIsYes();
      result = [v3 setSIMPresent:IsYes];
      break;
    case 1:
      id v5 = *(void **)(result + 32);
      uint64_t v6 = BSSettingFlagIsYes();
      result = [v5 setBootstrap:v6];
      break;
    case 2:
      result = BSSettingFlagIsExplicitNo();
      if (result)
      {
        objc_super v7 = *(void **)(v2 + 32);
        result = [v7 setLabel:0];
      }
      break;
    case 3:
      result = BSSettingFlagIsExplicitNo();
      if (result)
      {
        id v8 = *(void **)(v2 + 32);
        result = [v8 setShortLabel:0];
      }
      break;
    case 8:
      result = BSSettingFlagIsExplicitNo();
      if (result)
      {
        int v9 = *(void **)(v2 + 32);
        result = [v9 setServiceDescription:0];
      }
      break;
    case 9:
      result = BSSettingFlagIsExplicitNo();
      if (result)
      {
        id v10 = *(void **)(v2 + 32);
        result = [v10 setSecondaryServiceDescription:0];
      }
      break;
    case 11:
      v11 = *(void **)(result + 32);
      uint64_t v12 = BSSettingFlagIsYes();
      result = [v11 setProvidingDataConnection:v12];
      break;
    case 12:
      v13 = *(void **)(result + 32);
      uint64_t v14 = BSSettingFlagIsYes();
      result = [v13 setPreferredForDataConnections:v14];
      break;
    case 13:
      v15 = *(void **)(result + 32);
      uint64_t v16 = BSSettingFlagIsYes();
      result = [v15 setRegisteredWithoutCellular:v16];
      break;
    case 14:
      v17 = *(void **)(result + 32);
      uint64_t v18 = BSSettingFlagIsYes();
      result = [v17 setCallForwardingEnabled:v18];
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __57__STTelephonyStatusDomainSIMInfoDiff_applyToMutableInfo___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  id v8 = v5;
  switch(a2)
  {
    case 2:
      id v5 = (id)[*(id *)(a1 + 32) setLabel:v5];
      goto LABEL_11;
    case 3:
      id v5 = (id)[*(id *)(a1 + 32) setShortLabel:v5];
      goto LABEL_11;
    case 4:
      id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "setSignalStrengthBars:", objc_msgSend(v5, "unsignedIntegerValue"));
      goto LABEL_11;
    case 5:
      id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "setMaxSignalStrengthBars:", objc_msgSend(v5, "unsignedIntegerValue"));
      goto LABEL_11;
    case 6:
      id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "setServiceState:", objc_msgSend(v5, "unsignedIntegerValue"));
      goto LABEL_11;
    case 7:
      id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "setCellularServiceState:", objc_msgSend(v5, "unsignedIntegerValue"));
      goto LABEL_11;
    case 8:
      id v5 = (id)[*(id *)(a1 + 32) setServiceDescription:v5];
      goto LABEL_11;
    case 9:
      id v5 = (id)[*(id *)(a1 + 32) setSecondaryServiceDescription:v5];
      goto LABEL_11;
    case 10:
      id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "setDataNetworkType:", objc_msgSend(v5, "unsignedIntegerValue"));
LABEL_11:
      id v6 = v8;
      break;
    default:
      break;
  }

  return MEMORY[0x1F41817F8](v5, v6);
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
    +[STTelephonyStatusDomainSIMInfoDiff _resolveCombinedChanges:forObjectEntry:baseChanges:]((uint64_t)STTelephonyStatusDomainSIMInfoDiff, v7, 2, v6);
    +[STTelephonyStatusDomainSIMInfoDiff _resolveCombinedChanges:forObjectEntry:baseChanges:]((uint64_t)STTelephonyStatusDomainSIMInfoDiff, v7, 3, v6);
    +[STTelephonyStatusDomainSIMInfoDiff _resolveCombinedChanges:forObjectEntry:baseChanges:]((uint64_t)STTelephonyStatusDomainSIMInfoDiff, v7, 8, v6);
    +[STTelephonyStatusDomainSIMInfoDiff _resolveCombinedChanges:forObjectEntry:baseChanges:]((uint64_t)STTelephonyStatusDomainSIMInfoDiff, v7, 9, v6);

    id v10 = -[STTelephonyStatusDomainSIMInfoDiff initWithChanges:]([STTelephonyStatusDomainSIMInfoDiff alloc], v7);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (void)_resolveCombinedChanges:(uint64_t)a3 forObjectEntry:(void *)a4 baseChanges:
{
  id v8 = a2;
  id v6 = a4;
  self;
  if (![v8 flagForSetting:a3])
  {
    objc_super v7 = [v8 objectForSetting:a3];

    if (v7)
    {
      if ([v6 flagForSetting:a3]) {
        [v8 setObject:0 forSetting:a3];
      }
      else {
        [v8 setFlag:0x7FFFFFFFFFFFFFFFLL forSetting:a3];
      }
    }
  }
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STTelephonyStatusDomainSIMInfoDiff *)self isEmpty]) {
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
    self = (STTelephonyStatusDomainSIMInfoDiff *)self->_changes;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__STTelephonyStatusDomainSIMInfoDiff_isEqual___block_invoke;
  v10[3] = &unk_1E6B63058;
  id v11 = v4;
  id v6 = v4;
  id v7 = (id)[v5 appendObject:self counterpart:v10];
  char v8 = [v5 isEqual];

  return v8;
}

id __46__STTelephonyStatusDomainSIMInfoDiff_isEqual___block_invoke(uint64_t a1)
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
  return (NSString *)[(STTelephonyStatusDomainSIMInfoDiff *)self descriptionWithMultilinePrefix:0];
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

- (STTelephonyStatusDomainSIMInfoDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changes"];

  id v6 = (STTelephonyStatusDomainSIMInfoDiff *)-[STTelephonyStatusDomainSIMInfoDiff initWithChanges:](self, v5);
  return v6;
}

- (id)succinctDescription
{
  uint64_t v2 = [(STTelephonyStatusDomainSIMInfoDiff *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STTelephonyStatusDomainSIMInfoDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STTelephonyStatusDomainSIMInfoDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v10[3] = &unk_1E6B63080;
    void v10[4] = v3;
    id v7 = v6;
    id v11 = v7;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

    char v8 = v11;
    id v3 = v7;
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STTelephonyStatusDomainSIMInfoDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 8);
  }
  else {
    id v3 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2;
  v7[3] = &unk_1E6B632F8;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  [v4 enumerateFlagsWithBlock:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_3;
  v5[3] = &unk_1E6B63030;
  id v6 = *(id *)(a1 + 40);
  [v4 enumerateObjectsWithBlock:v5];
}

id *__86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2(id *result, unint64_t a2, uint64_t a3)
{
  if (a2 <= 0xE && ((0x7803u >> a2) & 1) != 0) {
    return (id *)(id)objc_msgSend(result[4], "appendFlag:withName:", a3, off_1E6B63318[a2], v3, v4);
  }
  return result;
}

uint64_t __86__STTelephonyStatusDomainSIMInfoDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  id v16 = v5;
  switch(a2)
  {
    case 2:
      id v5 = (id)[*(id *)(a1 + 32) appendObject:v5 withName:@"label"];
      goto LABEL_13;
    case 4:
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = [v5 unsignedIntegerValue];
      id v9 = @"signalStrengthBars";
      goto LABEL_5;
    case 5:
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = [v5 unsignedIntegerValue];
      id v9 = @"maxignalStrengthBars";
LABEL_5:
      id v5 = (id)[v7 appendUnsignedInteger:v8 withName:v9];
      goto LABEL_13;
    case 6:
      id v10 = *(void **)(a1 + 32);
      id v11 = STDescriptionForServiceState([v5 unsignedIntegerValue]);
      uint64_t v12 = @"serviceState";
      goto LABEL_12;
    case 7:
      id v10 = *(void **)(a1 + 32);
      id v11 = STDescriptionForServiceState([v5 unsignedIntegerValue]);
      uint64_t v12 = @"cellServiceState";
      goto LABEL_12;
    case 8:
      v13 = *(void **)(a1 + 32);
      uint64_t v14 = @"serviceDescription";
      goto LABEL_10;
    case 9:
      v13 = *(void **)(a1 + 32);
      uint64_t v14 = @"secondaryServiceDescription";
LABEL_10:
      id v5 = (id)[v13 appendString:v16 withName:v14];
      goto LABEL_13;
    case 10:
      id v10 = *(void **)(a1 + 32);
      id v11 = STDescriptionForDataNetworkType([v5 unsignedIntegerValue]);
      uint64_t v12 = @"dataNetworkType";
LABEL_12:
      [v10 appendString:v11 withName:v12];

LABEL_13:
      id v6 = v16;
      break;
    default:
      break;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

@end