@interface STStatusItemsStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)attributions;
- (NSSet)activeStatusItems;
- (NSSet)statusItemsWithVisualDescriptors;
- (NSString)debugDescription;
- (NSString)description;
- (STDictionaryData)visualDescriptorsByIdentifierDictionaryData;
- (STListData)statusItemsAttributionListData;
- (STStatusItemsStatusDomainData)init;
- (STStatusItemsStatusDomainData)initWithCoder:(id)a3;
- (STStatusItemsStatusDomainData)initWithData:(id)a3;
- (STStatusItemsStatusDomainData)initWithStatusItemsAttributionListData:(id)a3 visualDescriptorsByIdentifierDictionaryData:(id)a4;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)_initWithStatusItemsAttributionListData:(id)a3 visualDescriptorsByIdentifierDictionaryData:(id)a4;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)visualDescriptorForStatusItemWithIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusItemsStatusDomainData

- (STStatusItemsStatusDomainData)init
{
  v3 = objc_alloc_init(STListData);
  v4 = objc_alloc_init(STDictionaryData);
  v5 = [(STStatusItemsStatusDomainData *)self initWithStatusItemsAttributionListData:v3 visualDescriptorsByIdentifierDictionaryData:v4];

  return v5;
}

- (STStatusItemsStatusDomainData)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 statusItemsAttributionListData];
  v6 = [v4 visualDescriptorsByIdentifierDictionaryData];

  v7 = [(STStatusItemsStatusDomainData *)self initWithStatusItemsAttributionListData:v5 visualDescriptorsByIdentifierDictionaryData:v6];
  return v7;
}

- (STStatusItemsStatusDomainData)initWithStatusItemsAttributionListData:(id)a3 visualDescriptorsByIdentifierDictionaryData:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a3 copy];
  v8 = (void *)[v6 copy];

  v9 = [(STStatusItemsStatusDomainData *)self _initWithStatusItemsAttributionListData:v7 visualDescriptorsByIdentifierDictionaryData:v8];
  return v9;
}

- (id)_initWithStatusItemsAttributionListData:(id)a3 visualDescriptorsByIdentifierDictionaryData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STStatusItemsStatusDomainData;
  v9 = [(STStatusItemsStatusDomainData *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_statusItemsAttributionListData, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (NSArray)attributions
{
  v2 = [(STStatusItemsStatusDomainData *)self statusItemsAttributionListData];
  v3 = [v2 objects];

  return (NSArray *)v3;
}

- (NSSet)activeStatusItems
{
  v2 = [(STStatusItemsStatusDomainData *)self attributions];
  v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_19);

  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  return (NSSet *)v4;
}

uint64_t __50__STStatusItemsStatusDomainData_activeStatusItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 statusItemIdentifier];
}

- (id)visualDescriptorForStatusItemWithIdentifier:(id)a3
{
  return [(STDictionaryData *)self->_visualDescriptorsByIdentifierDictionaryData objectForKey:a3];
}

- (NSSet)statusItemsWithVisualDescriptors
{
  v2 = [(STStatusItemsStatusDomainData *)self visualDescriptorsByIdentifierDictionaryData];
  v3 = [v2 allKeys];

  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  return (NSSet *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  id v7 = [(STStatusItemsStatusDomainData *)self statusItemsAttributionListData];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__STStatusItemsStatusDomainData_isEqual___block_invoke;
  v19[3] = &unk_1E6B63058;
  id v8 = v6;
  id v20 = v8;
  id v9 = (id)[v5 appendObject:v7 counterpart:v19];

  v10 = [(STStatusItemsStatusDomainData *)self visualDescriptorsByIdentifierDictionaryData];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __41__STStatusItemsStatusDomainData_isEqual___block_invoke_2;
  v17 = &unk_1E6B63058;
  id v18 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendObject:v10 counterpart:&v14];

  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);
  return (char)v10;
}

uint64_t __41__STStatusItemsStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) statusItemsAttributionListData];
}

uint64_t __41__STStatusItemsStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) visualDescriptorsByIdentifierDictionaryData];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STStatusItemsStatusDomainData *)self statusItemsAttributionListData];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(STStatusItemsStatusDomainData *)self visualDescriptorsByIdentifierDictionaryData];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (NSString)description
{
  return (NSString *)[(STStatusItemsStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STStatusItemsStatusDomainData *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableStatusItemsStatusDomainData allocWithZone:a3];

  return [(STStatusItemsStatusDomainData *)v4 initWithData:self];
}

- (id)succinctDescription
{
  v2 = [(STStatusItemsStatusDomainData *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STStatusItemsStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STStatusItemsStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __81__STStatusItemsStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STStatusItemsStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __81__STStatusItemsStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) statusItemsAttributionListData];
  id v4 = (id)[v2 appendObject:v3 withName:@"statusItems"];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) visualDescriptorsByIdentifierDictionaryData];
  id v6 = (id)[v5 appendObject:v7 withName:@"visualDescriptors"];
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STStatusItemsStatusDomainDataDiff diffFromData:v4 toData:self];
  }
  else
  {
    id v5 = 0;
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
      id v5 = (void *)[(STStatusItemsStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STStatusItemsStatusDomainData *)self mutableCopy];
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
  id v5 = [(STStatusItemsStatusDomainData *)self statusItemsAttributionListData];
  [v4 encodeObject:v5 forKey:@"statusItemAttributions"];

  id v6 = [(STStatusItemsStatusDomainData *)self visualDescriptorsByIdentifierDictionaryData];
  [v4 encodeObject:v6 forKey:@"visualDescriptorsByIdentifier"];
}

- (STStatusItemsStatusDomainData)initWithCoder:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusItemAttributions"];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__STStatusItemsStatusDomainData_initWithCoder___block_invoke_2;
  v14[3] = &unk_1E6B64460;
  v14[4] = &v15;
  [v5 enumerateObjectsUsingBlock:v14];
  if (*((unsigned char *)v16 + 24)) {
    id v6 = 0;
  }
  else {
    id v6 = v5;
  }
  _Block_object_dispose(&v15, 8);

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visualDescriptorsByIdentifier"];

  v20[0] = objc_opt_class();
  unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v19 = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  int v10 = [v7 validateObjectsAndKeysWithValidObjectClasses:v8 keyClasses:v9];

  if (v6) {
    int v11 = v10;
  }
  else {
    int v11 = 0;
  }
  if (v11 == 1)
  {
    self = [(STStatusItemsStatusDomainData *)self initWithStatusItemsAttributionListData:v6 visualDescriptorsByIdentifierDictionaryData:v7];
    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __47__STStatusItemsStatusDomainData_initWithCoder___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
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

- (STListData)statusItemsAttributionListData
{
  return self->_statusItemsAttributionListData;
}

- (STDictionaryData)visualDescriptorsByIdentifierDictionaryData
{
  return self->_visualDescriptorsByIdentifierDictionaryData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualDescriptorsByIdentifierDictionaryData, 0);

  objc_storeStrong((id *)&self->_statusItemsAttributionListData, 0);
}

@end