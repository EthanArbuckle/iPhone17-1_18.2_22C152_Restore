@interface STUIDataAccessStatusDomainData
- (BOOL)isEqual:(id)a3;
- (NSArray)dataAccessAttributions;
- (NSSet)attributedEntities;
- (NSSet)executableIdentities;
- (NSSet)userIdentities;
- (NSString)description;
- (STListData)attributionListData;
- (STUIDataAccessStatusDomainData)_dataWithAttributionFilter:(void *)a1;
- (STUIDataAccessStatusDomainData)activeAttributionData;
- (STUIDataAccessStatusDomainData)dataWithAccessType:(unint64_t)a3;
- (STUIDataAccessStatusDomainData)dataWithAttributedEntity:(id)a3;
- (STUIDataAccessStatusDomainData)dataWithEntitiesThatAreSystemServices:(BOOL)a3;
- (STUIDataAccessStatusDomainData)dataWithExecutableIdentity:(id)a3;
- (STUIDataAccessStatusDomainData)init;
- (STUIDataAccessStatusDomainData)initWithAttributionListData:(id)a3;
- (STUIDataAccessStatusDomainData)initWithData:(id)a3;
- (STUIDataAccessStatusDomainData)recentAttributionData;
- (id)_allEntities;
- (id)_initWithAttributionListData:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation STUIDataAccessStatusDomainData

uint64_t __55__STUIDataAccessStatusDomainData_activeAttributionData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRecent] ^ 1;
}

- (STUIDataAccessStatusDomainData)initWithData:(id)a3
{
  v4 = [a3 attributionListData];
  v5 = [(STUIDataAccessStatusDomainData *)self initWithAttributionListData:v4];

  return v5;
}

uint64_t __54__STUIDataAccessStatusDomainData__sortedAttributions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isRecent];
  int v7 = [v5 isRecent];
  if (!v6 || v7)
  {
    if ((v6 | v7 ^ 1) == 1)
    {
      if ((v6 | v7))
      {
        v9 = [v5 accessEndDate];
        [v4 accessEndDate];
      }
      else
      {
        v9 = [v5 accessStartDate];
        [v4 accessStartDate];
      v10 = };
      uint64_t v8 = [v9 compare:v10];
    }
    else
    {
      uint64_t v8 = -1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (STUIDataAccessStatusDomainData)_dataWithAttributionFilter:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    id v4 = [a1 dataAccessAttributions];
    id v5 = objc_msgSend(v4, "bs_filter:", v3);

    int v6 = [STUIDataAccessStatusDomainData alloc];
    if (v6)
    {
      int v7 = (objc_class *)MEMORY[0x1E4FA9400];
      id v8 = v5;
      id v9 = objc_alloc_init(v7);
      v10 = [v8 sortedArrayUsingComparator:&__block_literal_global_24];

      [v9 setObjects:v10];
      int v6 = [(STUIDataAccessStatusDomainData *)v6 initWithAttributionListData:v9];
    }
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (STUIDataAccessStatusDomainData)initWithAttributionListData:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = [(STUIDataAccessStatusDomainData *)self _initWithAttributionListData:v4];

  return v5;
}

- (id)_initWithAttributionListData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUIDataAccessStatusDomainData;
  int v6 = [(STUIDataAccessStatusDomainData *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributionListData, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int v6 = [(STUIDataAccessStatusDomainData *)self attributionListData];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__STUIDataAccessStatusDomainData_isEqual___block_invoke;
  v10[3] = &unk_1E6AA3CF8;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:v6 counterpart:v10];

  LOBYTE(v6) = [v5 isEqual];
  return (char)v6;
}

- (NSArray)dataAccessAttributions
{
  v2 = [(STUIDataAccessStatusDomainData *)self attributionListData];
  id v3 = [v2 objects];

  return (NSArray *)v3;
}

- (STListData)attributionListData
{
  return self->_attributionListData;
}

- (STUIDataAccessStatusDomainData)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA93A8]);
  id v4 = [(STUIDataAccessStatusDomainData *)self initWithAttributionListData:v3];

  return v4;
}

uint64_t __42__STUIDataAccessStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) attributionListData];
}

uint64_t __55__STUIDataAccessStatusDomainData_recentAttributionData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRecent];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionListData, 0);
  objc_storeStrong((id *)&self->_userIdentities, 0);
}

- (STUIDataAccessStatusDomainData)recentAttributionData
{
  return -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, &__block_literal_global_8);
}

- (STUIDataAccessStatusDomainData)activeAttributionData
{
  return -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, &__block_literal_global_6);
}

- (NSSet)attributedEntities
{
  v2 = -[STUIDataAccessStatusDomainData _allEntities](self);
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];

  return (NSSet *)v3;
}

- (id)_allEntities
{
  if (a1)
  {
    v1 = [a1 dataAccessAttributions];
    v2 = objc_msgSend(v1, "bs_map:", &__block_literal_global_21);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSSet)executableIdentities
{
  v2 = -[STUIDataAccessStatusDomainData _allEntities](self);
  id v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_4);

  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  return (NSSet *)v4;
}

uint64_t __54__STUIDataAccessStatusDomainData_executableIdentities__block_invoke(uint64_t a1, void *a2)
{
  return [a2 executableIdentity];
}

- (STUIDataAccessStatusDomainData)dataWithEntitiesThatAreSystemServices:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__STUIDataAccessStatusDomainData_dataWithEntitiesThatAreSystemServices___block_invoke;
  v5[3] = &__block_descriptor_33_e35_B16__0__STUIDataAccessAttribution_8l;
  BOOL v6 = a3;
  id v3 = -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, v5);
  return (STUIDataAccessStatusDomainData *)v3;
}

BOOL __72__STUIDataAccessStatusDomainData_dataWithEntitiesThatAreSystemServices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 attributedEntity];
  BOOL v4 = *(unsigned __int8 *)(a1 + 32) == [v3 isSystemService];

  return v4;
}

- (STUIDataAccessStatusDomainData)dataWithAttributedEntity:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__STUIDataAccessStatusDomainData_dataWithAttributedEntity___block_invoke;
  v8[3] = &unk_1E6AA40D0;
  id v9 = v4;
  id v5 = v4;
  BOOL v6 = -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, v8);

  return (STUIDataAccessStatusDomainData *)v6;
}

uint64_t __59__STUIDataAccessStatusDomainData_dataWithAttributedEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 attributedEntity];
  uint64_t v4 = [v3 matchesAttributedEntity:*(void *)(a1 + 32)];

  return v4;
}

- (STUIDataAccessStatusDomainData)dataWithExecutableIdentity:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__STUIDataAccessStatusDomainData_dataWithExecutableIdentity___block_invoke;
  v8[3] = &unk_1E6AA40D0;
  id v9 = v4;
  id v5 = v4;
  BOOL v6 = -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, v8);

  return (STUIDataAccessStatusDomainData *)v6;
}

uint64_t __61__STUIDataAccessStatusDomainData_dataWithExecutableIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 attributedEntity];
  id v4 = [v3 executableIdentity];
  uint64_t v5 = [v4 matchesExecutableIdentity:*(void *)(a1 + 32)];

  return v5;
}

- (STUIDataAccessStatusDomainData)dataWithAccessType:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__STUIDataAccessStatusDomainData_dataWithAccessType___block_invoke;
  v5[3] = &__block_descriptor_40_e35_B16__0__STUIDataAccessAttribution_8l;
  void v5[4] = a3;
  id v3 = -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, v5);
  return (STUIDataAccessStatusDomainData *)v3;
}

BOOL __53__STUIDataAccessStatusDomainData_dataWithAccessType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dataAccessType] == *(void *)(a1 + 32);
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STUIDataAccessStatusDomainData *)self attributionListData];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

- (NSString)description
{
  return (NSString *)[(STUIDataAccessStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STUIMutableDataAccessStatusDomainData allocWithZone:a3];
  return [(STUIDataAccessStatusDomainData *)v4 initWithData:self];
}

- (id)succinctDescription
{
  v2 = [(STUIDataAccessStatusDomainData *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STUIDataAccessStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(STUIDataAccessStatusDomainData *)self succinctDescriptionBuilder];
  id v5 = [(STUIDataAccessStatusDomainData *)self attributionListData];
  id v6 = (id)[v4 appendObject:v5 withName:@"attributions"];

  return v4;
}

uint64_t __46__STUIDataAccessStatusDomainData__allEntities__block_invoke(uint64_t a1, void *a2)
{
  return [a2 attributedEntity];
}

- (NSSet)userIdentities
{
  return self->_userIdentities;
}

@end