@interface STLocationStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)attributions;
- (NSArray)locationAttributions;
- (NSString)debugDescription;
- (NSString)description;
- (STListData)locationAttributionListData;
- (STLocationStatusDomainData)init;
- (STLocationStatusDomainData)initWithCoder:(id)a3;
- (STLocationStatusDomainData)initWithData:(id)a3;
- (STLocationStatusDomainData)initWithLocationAttributionListData:(id)a3 activeDisplayModes:(unint64_t)a4;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)_initWithLocationAttributionListData:(id)a3 activeDisplayModes:(unint64_t)a4;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)activeDisplayModes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STLocationStatusDomainData

- (void).cxx_destruct
{
}

uint64_t __38__STLocationStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) locationAttributionListData];
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = +[STLocationStatusDomainDataDiff diffFromData:v4 toData:self];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEmpty])
    {
      v5 = (void *)[(STLocationStatusDomainData *)self copy];
    }
    else
    {
      v5 = (void *)[(STLocationStatusDomainData *)self mutableCopy];
      [v4 applyToMutableData:v5];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableLocationStatusDomainData allocWithZone:a3];

  return [(STLocationStatusDomainData *)v4 initWithData:self];
}

- (STLocationStatusDomainData)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 locationAttributionListData];
  uint64_t v6 = [v4 activeDisplayModes];

  v7 = [(STLocationStatusDomainData *)self initWithLocationAttributionListData:v5 activeDisplayModes:v6];
  return v7;
}

- (unint64_t)activeDisplayModes
{
  return self->_activeDisplayModes;
}

- (NSArray)attributions
{
  v2 = [(STLocationStatusDomainData *)self locationAttributionListData];
  v3 = [v2 objects];

  return (NSArray *)v3;
}

- (STListData)locationAttributionListData
{
  return self->_locationAttributionListData;
}

- (id)_initWithLocationAttributionListData:(id)a3 activeDisplayModes:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STLocationStatusDomainData;
  v8 = [(STLocationStatusDomainData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationAttributionListData, a3);
    v9->_activeDisplayModes = a4;
  }

  return v9;
}

- (STLocationStatusDomainData)initWithLocationAttributionListData:(id)a3 activeDisplayModes:(unint64_t)a4
{
  uint64_t v6 = (void *)[a3 copy];
  id v7 = [(STLocationStatusDomainData *)self _initWithLocationAttributionListData:v6 activeDisplayModes:a4];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = [(STLocationStatusDomainData *)self locationAttributionListData];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __38__STLocationStatusDomainData_isEqual___block_invoke;
  v18[3] = &unk_1E6B63058;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:v6 counterpart:v18];

  unint64_t v9 = [(STLocationStatusDomainData *)self activeDisplayModes];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __38__STLocationStatusDomainData_isEqual___block_invoke_2;
  v16 = &unk_1E6B63670;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendUnsignedInteger:v9 counterpart:&v13];
  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return v9;
}

- (STLocationStatusDomainData)init
{
  v3 = objc_alloc_init(STListData);
  id v4 = [(STLocationStatusDomainData *)self initWithLocationAttributionListData:v3 activeDisplayModes:0];

  return v4;
}

- (NSArray)locationAttributions
{
  v2 = [(STLocationStatusDomainData *)self attributions];
  v3 = objc_msgSend(v2, "bs_filter:", &__block_literal_global_5);
  id v4 = objc_msgSend(v3, "bs_map:", &__block_literal_global_7);

  return (NSArray *)v4;
}

BOOL __50__STLocationStatusDomainData_locationAttributions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationState] == 1;
}

uint64_t __50__STLocationStatusDomainData_locationAttributions__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 activityAttribution];
}

uint64_t __38__STLocationStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activeDisplayModes];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STLocationStatusDomainData *)self locationAttributionListData];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STLocationStatusDomainData activeDisplayModes](self, "activeDisplayModes"));
  unint64_t v7 = [v3 hash];

  return v7;
}

- (NSString)description
{
  return (NSString *)[(STLocationStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STLocationStatusDomainData *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STLocationStatusDomainData *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STLocationStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STLocationStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__STLocationStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STLocationStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __78__STLocationStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) locationAttributionListData];
  id v4 = (id)[v2 appendObject:v3 withName:0];

  id v5 = *(void **)(a1 + 32);
  STLocationStatusDomainLocationAttributionDisplayModeMaskDescription([*(id *)(a1 + 40) activeDisplayModes]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 appendString:v6 withName:@"activeDisplayModes"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(STLocationStatusDomainData *)self locationAttributionListData];
  [v5 encodeObject:v4 forKey:@"locationAttributions"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[STLocationStatusDomainData activeDisplayModes](self, "activeDisplayModes"), @"activeDisplayModes");
}

- (STLocationStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationAttributions"];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__STLocationStatusDomainData_initWithCoder___block_invoke_2;
  v10[3] = &unk_1E6B63698;
  v10[4] = &v11;
  [v5 enumerateObjectsUsingBlock:v10];
  if (*((unsigned char *)v12 + 24)) {
    id v6 = 0;
  }
  else {
    id v6 = v5;
  }
  _Block_object_dispose(&v11, 8);

  uint64_t v7 = [v4 decodeIntegerForKey:@"activeDisplayModes"];
  if (v6)
  {
    self = [(STLocationStatusDomainData *)self initWithLocationAttributionListData:v6 activeDisplayModes:v7];
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __44__STLocationStatusDomainData_initWithCoder___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

@end