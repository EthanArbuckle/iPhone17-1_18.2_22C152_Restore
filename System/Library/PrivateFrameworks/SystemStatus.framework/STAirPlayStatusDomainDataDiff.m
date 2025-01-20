@interface STAirPlayStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STAirPlayStatusDomainDataDiff)init;
- (STAirPlayStatusDomainDataDiff)initWithCoder:(id)a3;
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

@implementation STAirPlayStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  uint64_t v8 = [v6 airPlayState];
  if ([v5 airPlayState] != v8)
  {
    v9 = [NSNumber numberWithUnsignedInteger:v8];
    [v7 setObject:v9 forSetting:0];
  }
  v10 = [v6 bundleIdentifier];
  v11 = [v5 bundleIdentifier];
  if (([v11 isEqualToString:v10] & 1) == 0)
  {
    if (v10)
    {
      [v7 setObject:v10 forSetting:1];
    }
    else if (v11)
    {
      [v7 setFlag:0 forSetting:1];
    }
  }
  v12 = -[STAirPlayStatusDomainDataDiff initWithChanges:]([STAirPlayStatusDomainDataDiff alloc], v7);

  return v12;
}

- (void)initWithChanges:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)STAirPlayStatusDomainDataDiff;
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

- (STAirPlayStatusDomainDataDiff)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  uint64_t v4 = (STAirPlayStatusDomainDataDiff *)-[STAirPlayStatusDomainDataDiff initWithChanges:](self, v3);

  return v4;
}

- (id)dataByApplyingToData:(id)a3
{
  uint64_t v4 = (void *)[a3 mutableCopy];
  [(STAirPlayStatusDomainDataDiff *)self applyToMutableData:v4];

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
  v11[2] = __52__STAirPlayStatusDomainDataDiff_applyToMutableData___block_invoke;
  v11[3] = &unk_1E6B632F8;
  id v6 = v4;
  id v12 = v6;
  objc_super v7 = changes;
  [(BSSettings *)v7 enumerateFlagsWithBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__STAirPlayStatusDomainDataDiff_applyToMutableData___block_invoke_2;
  v9[3] = &unk_1E6B63030;
  id v10 = v6;
  id v8 = v6;
  [(BSSettings *)v7 enumerateObjectsWithBlock:v9];
}

uint64_t __52__STAirPlayStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
  {
    uint64_t v2 = result;
    result = BSSettingFlagIsExplicitNo();
    if (result)
    {
      id v3 = *(void **)(v2 + 32);
      return [v3 setBundleIdentifier:0];
    }
  }
  return result;
}

uint64_t __52__STAirPlayStatusDomainDataDiff_applyToMutableData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 == 1)
  {
    id v8 = v5;
    id v5 = (id)[*(id *)(a1 + 32) setBundleIdentifier:v5];
  }
  else
  {
    if (a2) {
      goto LABEL_6;
    }
    id v8 = v5;
    id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "setAirPlayState:", objc_msgSend(v5, "unsignedIntegerValue"));
  }
  id v6 = v8;
LABEL_6:

  return MEMORY[0x1F41817F8](v5, v6);
}

- (BOOL)isEmpty
{
  if (self) {
    self = (STAirPlayStatusDomainDataDiff *)self->_changes;
  }
  return [(STAirPlayStatusDomainDataDiff *)self isEmpty];
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
    +[STTelephonyStatusDomainSIMInfoDiff _resolveCombinedChanges:forObjectEntry:baseChanges:]((uint64_t)STAirPlayStatusDomainDataDiff, v7, 0, v6);
    +[STTelephonyStatusDomainSIMInfoDiff _resolveCombinedChanges:forObjectEntry:baseChanges:]((uint64_t)STAirPlayStatusDomainDataDiff, v7, 1, v6);

    id v10 = -[STAirPlayStatusDomainDataDiff initWithChanges:]([STAirPlayStatusDomainDataDiff alloc], v7);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STAirPlayStatusDomainDataDiff *)self isEmpty]) {
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
    self = (STAirPlayStatusDomainDataDiff *)self->_changes;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__STAirPlayStatusDomainDataDiff_isEqual___block_invoke;
  v10[3] = &unk_1E6B63058;
  id v11 = v4;
  id v6 = v4;
  id v7 = (id)[v5 appendObject:self counterpart:v10];
  char v8 = [v5 isEqual];

  return v8;
}

id __41__STAirPlayStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
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
  return (NSString *)[(STAirPlayStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
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

- (STAirPlayStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changes"];

  id v6 = (STAirPlayStatusDomainDataDiff *)-[STAirPlayStatusDomainDataDiff initWithChanges:](self, v5);
  return v6;
}

- (id)succinctDescription
{
  uint64_t v2 = [(STAirPlayStatusDomainDataDiff *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STAirPlayStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STAirPlayStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 1);
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
      v10[2] = __69__STAirPlayStatusDomainDataDiff__appendChanges_toDescriptionBuilder___block_invoke;
      v10[3] = &unk_1E6B63080;
      id v11 = v7;
      id v12 = v3;
      [v12 appendBodySectionWithName:0 multilinePrefix:v8 block:v10];
    }
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STAirPlayStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 0);
}

void __69__STAirPlayStatusDomainDataDiff__appendChanges_toDescriptionBuilder___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __69__STAirPlayStatusDomainDataDiff__appendChanges_toDescriptionBuilder___block_invoke_2;
  v2[3] = &unk_1E6B63030;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsWithBlock:v2];
}

uint64_t __69__STAirPlayStatusDomainDataDiff__appendChanges_toDescriptionBuilder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 == 1)
  {
    id v10 = v5;
    id v5 = (id)[*(id *)(a1 + 32) appendString:v5 withName:@"bundleIdentifier"];
  }
  else
  {
    if (a2) {
      goto LABEL_6;
    }
    id v7 = *(void **)(a1 + 32);
    id v10 = v5;
    char v8 = STAirPlayStatusDomainAirPlayStateDescription([v5 unsignedIntegerValue]);
    [v7 appendString:v8 withName:@"airPlayState"];
  }
  id v6 = v10;
LABEL_6:

  return MEMORY[0x1F41817F8](v5, v6);
}

- (void).cxx_destruct
{
}

@end