@interface STLocationStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STLocationStatusDomainDataDiff)init;
- (STLocationStatusDomainDataDiff)initWithChanges:(id)a3 locationAttributionListDataDiff:(id)a4;
- (STLocationStatusDomainDataDiff)initWithCoder:(id)a3;
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

@implementation STLocationStatusDomainDataDiff

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAttributionListDataDiff, 0);

  objc_storeStrong((id *)&self->_changes, 0);
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if (self) {
      changes = self->_changes;
    }
    else {
      changes = 0;
    }
    v7 = changes;
    v8 = (void *)[(BSSettings *)v7 mutableCopy];
    if (v5) {
      v9 = (void *)v5[1];
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
    [v8 applySettings:v10];
    if (self)
    {
      locationAttributionListDataDiff = self->_locationAttributionListDataDiff;
      if (v5)
      {
LABEL_8:
        uint64_t v12 = v5[2];
LABEL_9:
        v13 = locationAttributionListDataDiff;
        v14 = [(STListDataDiff *)v13 diffByApplyingDiff:v12];

        v15 = [[STLocationStatusDomainDataDiff alloc] initWithChanges:v8 locationAttributionListDataDiff:v14];
        goto LABEL_11;
      }
    }
    else
    {
      locationAttributionListDataDiff = 0;
      if (v5) {
        goto LABEL_8;
      }
    }
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)isEmpty
{
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  id v4 = changes;
  if ([(BSSettings *)v4 isEmpty])
  {
    if (self) {
      locationAttributionListDataDiff = self->_locationAttributionListDataDiff;
    }
    else {
      locationAttributionListDataDiff = 0;
    }
    BOOL v6 = [(STListDataDiff *)locationAttributionListDataDiff isEmpty];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
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
  v11[2] = __53__STLocationStatusDomainDataDiff_applyToMutableData___block_invoke;
  v11[3] = &unk_1E6B63030;
  id v12 = v4;
  id v6 = v4;
  v7 = changes;
  [(BSSettings *)v7 enumerateObjectsWithBlock:v11];
  if (self) {
    locationAttributionListDataDiff = self->_locationAttributionListDataDiff;
  }
  else {
    locationAttributionListDataDiff = 0;
  }
  v9 = locationAttributionListDataDiff;
  id v10 = [v6 locationAttributionListData];
  [(STListDataDiff *)v9 applyToMutableListData:v10];
}

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  uint64_t v8 = [v6 activeDisplayModes];
  if ([v5 activeDisplayModes] != v8)
  {
    v9 = [NSNumber numberWithUnsignedInteger:v8];
    [v7 setObject:v9 forSetting:0];
  }
  id v10 = [v5 locationAttributionListData];
  v11 = [v6 locationAttributionListData];
  id v12 = +[STListDataDiff diffFromListData:v10 toListData:v11];

  v13 = [[STLocationStatusDomainDataDiff alloc] initWithChanges:v7 locationAttributionListDataDiff:v12];

  return v13;
}

- (STLocationStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changes"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationAttributionListDataDiff"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    self = [(STLocationStatusDomainDataDiff *)self initWithChanges:v5 locationAttributionListDataDiff:v6];
    uint64_t v8 = self;
  }

  return v8;
}

- (STLocationStatusDomainDataDiff)initWithChanges:(id)a3 locationAttributionListDataDiff:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STLocationStatusDomainDataDiff;
  uint64_t v8 = [(STLocationStatusDomainDataDiff *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    changes = v8->_changes;
    v8->_changes = (BSSettings *)v9;

    uint64_t v11 = [v7 copy];
    locationAttributionListDataDiff = v8->_locationAttributionListDataDiff;
    v8->_locationAttributionListDataDiff = (STListDataDiff *)v11;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_changes forKey:@"changes"];
    locationAttributionListDataDiff = self->_locationAttributionListDataDiff;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"changes"];
    locationAttributionListDataDiff = 0;
  }
  [a3 encodeObject:locationAttributionListDataDiff forKey:@"locationAttributionListDataDiff"];
}

uint64_t __53__STLocationStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  if (!a2)
  {
    id v4 = *(void **)(result + 32);
    uint64_t v5 = [a3 unsignedIntegerValue];
    return [v4 setActiveDisplayModes:v5];
  }
  return result;
}

- (STLocationStatusDomainDataDiff)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  id v4 = objc_alloc_init(STListDataDiff);
  uint64_t v5 = [(STLocationStatusDomainDataDiff *)self initWithChanges:v3 locationAttributionListDataDiff:v4];

  return v5;
}

- (id)dataByApplyingToData:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  [(STLocationStatusDomainDataDiff *)self applyToMutableData:v4];

  return v4;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STLocationStatusDomainDataDiff *)self isEmpty]) {
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
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__STLocationStatusDomainDataDiff_isEqual___block_invoke;
  v18[3] = &unk_1E6B63058;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:changes counterpart:v18];
  if (self) {
    self = (STLocationStatusDomainDataDiff *)self->_locationAttributionListDataDiff;
  }
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __42__STLocationStatusDomainDataDiff_isEqual___block_invoke_2;
  v16 = &unk_1E6B63058;
  id v17 = v7;
  id v9 = v7;
  id v10 = (id)[v5 appendObject:self counterpart:&v13];
  char v11 = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return v11;
}

id __42__STLocationStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 8);
  }
  else {
    return 0;
  }
}

id __42__STLocationStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
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
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = v3;
  if (self)
  {
    id v5 = (id)[v3 appendObject:self->_changes];
    locationAttributionListDataDiff = self->_locationAttributionListDataDiff;
  }
  else
  {
    id v10 = (id)[v3 appendObject:0];
    locationAttributionListDataDiff = 0;
  }
  id v7 = (id)[v4 appendObject:locationAttributionListDataDiff];
  unint64_t v8 = [v4 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(STLocationStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)succinctDescription
{
  v2 = [(STLocationStatusDomainDataDiff *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STLocationStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STLocationStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 1);
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

    id v7 = [v6 activeMultilinePrefix];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __82__STLocationStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v16 = &unk_1E6B63080;
    id v8 = v6;
    id v17 = v8;
    v18 = a1;
    [v8 appendBodySectionWithName:0 multilinePrefix:v7 block:&v13];

    id v9 = objc_msgSend(a1[1], "objectForSetting:", 0, v13, v14, v15, v16);
    if (!v9)
    {
      id v10 = STLocationStatusDomainLocationAttributionDisplayModeMaskDescription([0 unsignedIntegerValue]);
      [v8 appendString:v10 withName:@"activeDisplayModes"];
    }
    id v11 = v8;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STLocationStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 0);
}

id __82__STLocationStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:0 skipIfNil:1];
}

@end