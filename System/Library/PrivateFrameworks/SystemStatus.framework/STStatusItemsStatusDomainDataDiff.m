@interface STStatusItemsStatusDomainDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromData:(id)a3 toData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STStatusItemsStatusDomainDataDiff)init;
- (STStatusItemsStatusDomainDataDiff)initWithChanges:(id)a3 statusItemsAttributionListDataDiff:(id)a4 visualDescriptorsByIdentifierDictionaryDataDiff:(id)a5;
- (STStatusItemsStatusDomainDataDiff)initWithCoder:(id)a3;
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

@implementation STStatusItemsStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = [v7 statusItemsAttributionListData];
  v10 = [v6 statusItemsAttributionListData];
  v11 = +[STListDataDiff diffFromListData:v9 toListData:v10];

  v12 = [v7 visualDescriptorsByIdentifierDictionaryData];

  v13 = [v6 visualDescriptorsByIdentifierDictionaryData];

  v14 = +[STDictionaryDataDiff diffFromDictionaryData:v12 toDictionaryData:v13];

  v15 = [[STStatusItemsStatusDomainDataDiff alloc] initWithChanges:v8 statusItemsAttributionListDataDiff:v11 visualDescriptorsByIdentifierDictionaryDataDiff:v14];

  return v15;
}

- (STStatusItemsStatusDomainDataDiff)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  v4 = objc_alloc_init(STListDataDiff);
  v5 = objc_alloc_init(STDictionaryDataDiff);
  id v6 = [(STStatusItemsStatusDomainDataDiff *)self initWithChanges:v3 statusItemsAttributionListDataDiff:v4 visualDescriptorsByIdentifierDictionaryDataDiff:v5];

  return v6;
}

- (STStatusItemsStatusDomainDataDiff)initWithChanges:(id)a3 statusItemsAttributionListDataDiff:(id)a4 visualDescriptorsByIdentifierDictionaryDataDiff:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STStatusItemsStatusDomainDataDiff;
  v11 = [(STStatusItemsStatusDomainDataDiff *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    changes = v11->_changes;
    v11->_changes = (BSSettings *)v12;

    uint64_t v14 = [v9 copy];
    statusItemsAttributionListDataDiff = v11->_statusItemsAttributionListDataDiff;
    v11->_statusItemsAttributionListDataDiff = (STListDataDiff *)v14;

    uint64_t v16 = [v10 copy];
    visualDescriptorsByIdentifierDictionaryDataDiff = v11->_visualDescriptorsByIdentifierDictionaryDataDiff;
    v11->_visualDescriptorsByIdentifierDictionaryDataDiff = (STDictionaryDataDiff *)v16;
  }
  return v11;
}

- (id)dataByApplyingToData:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  [(STStatusItemsStatusDomainDataDiff *)self applyToMutableData:v4];

  return v4;
}

- (void)applyToMutableData:(id)a3
{
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  v13 = changes;
  id v6 = a3;
  [(BSSettings *)v13 enumerateObjectsWithBlock:&__block_literal_global_13];
  if (self)
  {
    id v7 = self->_statusItemsAttributionListDataDiff;
    id v8 = [v6 statusItemsAttributionListData];
    [(STListDataDiff *)v7 applyToMutableListData:v8];

    visualDescriptorsByIdentifierDictionaryDataDiff = self->_visualDescriptorsByIdentifierDictionaryDataDiff;
  }
  else
  {
    uint64_t v12 = [v6 statusItemsAttributionListData];
    [0 applyToMutableListData:v12];

    visualDescriptorsByIdentifierDictionaryDataDiff = 0;
  }
  id v10 = visualDescriptorsByIdentifierDictionaryDataDiff;
  v11 = [v6 visualDescriptorsByIdentifierDictionaryData];

  [(STDictionaryDataDiff *)v10 applyToMutableDictionaryData:v11];
}

- (BOOL)isEmpty
{
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  v4 = changes;
  if ([(BSSettings *)v4 isEmpty])
  {
    if (self) {
      statusItemsAttributionListDataDiff = self->_statusItemsAttributionListDataDiff;
    }
    else {
      statusItemsAttributionListDataDiff = 0;
    }
    id v6 = statusItemsAttributionListDataDiff;
    if ([(STListDataDiff *)v6 isEmpty])
    {
      if (self) {
        visualDescriptorsByIdentifierDictionaryDataDiff = self->_visualDescriptorsByIdentifierDictionaryDataDiff;
      }
      else {
        visualDescriptorsByIdentifierDictionaryDataDiff = 0;
      }
      BOOL v8 = [(STDictionaryDataDiff *)visualDescriptorsByIdentifierDictionaryDataDiff isEmpty];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
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
    id v7 = changes;
    BOOL v8 = (void *)[(BSSettings *)v7 mutableCopy];
    if (v5) {
      id v9 = (void *)v5[1];
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    [v8 applySettings:v10];
    if (self)
    {
      statusItemsAttributionListDataDiff = self->_statusItemsAttributionListDataDiff;
      if (v5)
      {
LABEL_8:
        uint64_t v12 = v5[2];
        goto LABEL_9;
      }
    }
    else
    {
      statusItemsAttributionListDataDiff = 0;
      if (v5) {
        goto LABEL_8;
      }
    }
    uint64_t v12 = 0;
LABEL_9:
    v13 = statusItemsAttributionListDataDiff;
    uint64_t v14 = [(STListDataDiff *)v13 diffByApplyingDiff:v12];

    if (self)
    {
      visualDescriptorsByIdentifierDictionaryDataDiff = self->_visualDescriptorsByIdentifierDictionaryDataDiff;
      if (v5)
      {
LABEL_11:
        uint64_t v16 = v5[3];
LABEL_12:
        v17 = visualDescriptorsByIdentifierDictionaryDataDiff;
        v18 = [(STDictionaryDataDiff *)v17 diffByApplyingDiff:v16];

        objc_super v19 = [[STStatusItemsStatusDomainDataDiff alloc] initWithChanges:v8 statusItemsAttributionListDataDiff:v14 visualDescriptorsByIdentifierDictionaryDataDiff:v18];
        goto LABEL_14;
      }
    }
    else
    {
      visualDescriptorsByIdentifierDictionaryDataDiff = 0;
      if (v5) {
        goto LABEL_11;
      }
    }
    uint64_t v16 = 0;
    goto LABEL_12;
  }
  objc_super v19 = 0;
LABEL_14:

  return v19;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STStatusItemsStatusDomainDataDiff *)self isEmpty]) {
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
  id v6 = v4;
  if (self) {
    changes = self->_changes;
  }
  else {
    changes = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke;
  v21[3] = &unk_1E6B63058;
  id v8 = v6;
  id v22 = v8;
  id v9 = (id)[v5 appendObject:changes counterpart:v21];
  if (self) {
    statusItemsAttributionListDataDiff = self->_statusItemsAttributionListDataDiff;
  }
  else {
    statusItemsAttributionListDataDiff = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke_2;
  v19[3] = &unk_1E6B63058;
  id v11 = v8;
  id v20 = v11;
  id v12 = (id)[v5 appendObject:statusItemsAttributionListDataDiff counterpart:v19];
  if (self) {
    self = (STStatusItemsStatusDomainDataDiff *)self->_visualDescriptorsByIdentifierDictionaryDataDiff;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke_3;
  v17[3] = &unk_1E6B63058;
  id v18 = v11;
  id v13 = v11;
  id v14 = (id)[v5 appendObject:self counterpart:v17];
  char v15 = [v5 isEqual];

  return v15;
}

id __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 8);
  }
  else {
    return 0;
  }
}

id __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 16);
  }
  else {
    return 0;
  }
}

id __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke_3(uint64_t a1)
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
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = v3;
  if (self)
  {
    id v5 = (id)[v3 appendObject:self->_changes];
    statusItemsAttributionListDataDiff = self->_statusItemsAttributionListDataDiff;
  }
  else
  {
    id v12 = (id)[v3 appendObject:0];
    statusItemsAttributionListDataDiff = 0;
  }
  id v7 = (id)[v4 appendObject:statusItemsAttributionListDataDiff];
  if (self) {
    visualDescriptorsByIdentifierDictionaryDataDiff = self->_visualDescriptorsByIdentifierDictionaryDataDiff;
  }
  else {
    visualDescriptorsByIdentifierDictionaryDataDiff = 0;
  }
  id v9 = (id)[v4 appendObject:visualDescriptorsByIdentifierDictionaryDataDiff];
  unint64_t v10 = [v4 hash];

  return v10;
}

- (NSString)description
{
  return (NSString *)[(STStatusItemsStatusDomainDataDiff *)self descriptionWithMultilinePrefix:0];
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
    [v5 encodeObject:self->_changes forKey:@"changes"];
    [v5 encodeObject:self->_statusItemsAttributionListDataDiff forKey:@"statusItemsAttributionListDataDiff"];
    visualDescriptorsByIdentifierDictionaryDataDiff = self->_visualDescriptorsByIdentifierDictionaryDataDiff;
  }
  else
  {
    [v5 encodeObject:0 forKey:@"changes"];
    [v5 encodeObject:0 forKey:@"statusItemsAttributionListDataDiff"];
    visualDescriptorsByIdentifierDictionaryDataDiff = 0;
  }
  [v5 encodeObject:visualDescriptorsByIdentifierDictionaryDataDiff forKey:@"visualDescriptorsByIdentifierDictionaryDataDiff"];
}

- (STStatusItemsStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changes"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusItemsAttributionListDataDiff"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visualDescriptorsByIdentifierDictionaryDataDiff"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    unint64_t v10 = 0;
  }
  else
  {
    self = [(STStatusItemsStatusDomainDataDiff *)self initWithChanges:v5 statusItemsAttributionListDataDiff:v6 visualDescriptorsByIdentifierDictionaryDataDiff:v7];
    unint64_t v10 = self;
  }

  return v10;
}

- (id)succinctDescription
{
  v2 = [(STStatusItemsStatusDomainDataDiff *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STStatusItemsStatusDomainDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STStatusItemsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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

    id v7 = [v6 activeMultilinePrefix];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__STStatusItemsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v15[3] = &unk_1E6B63080;
    id v8 = v6;
    id v16 = v8;
    id v17 = v3;
    [v8 appendBodySectionWithName:@"statusItemAttributions" multilinePrefix:v7 block:v15];

    id v9 = [v8 activeMultilinePrefix];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__STStatusItemsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2;
    v12[3] = &unk_1E6B63080;
    id v10 = v8;
    id v13 = v10;
    id v14 = v3;
    [v10 appendBodySectionWithName:@"visualDescriptors" multilinePrefix:v9 block:v12];

    id v3 = v10;
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusItemsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __85__STStatusItemsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:0 skipIfNil:1];
}

id __85__STStatusItemsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:0 skipIfNil:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualDescriptorsByIdentifierDictionaryDataDiff, 0);
  objc_storeStrong((id *)&self->_statusItemsAttributionListDataDiff, 0);

  objc_storeStrong((id *)&self->_changes, 0);
}

@end