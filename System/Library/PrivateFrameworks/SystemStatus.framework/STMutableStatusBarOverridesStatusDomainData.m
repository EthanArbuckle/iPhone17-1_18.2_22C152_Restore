@interface STMutableStatusBarOverridesStatusDomainData
- (BOOL)applyDiff:(id)a3;
- (NSSet)editedIdentifiers;
- (NSSet)editedKeys;
- (STMutableListData)suppressedBackgroundActivityIdentifierListData;
- (STMutableStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3 suppressedBackgroundActivityIdentifierListData:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)_addEditedIdentifier:(uint64_t)a1;
- (void)setEntry:(id)a3 forKey:(id)a4;
- (void)stopSuppressingBackgroundActivityWithIdentifier:(id)a3;
- (void)suppressBackgroundActivityWithIdentifier:(id)a3;
@end

@implementation STMutableStatusBarOverridesStatusDomainData

- (STMutableStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3 suppressedBackgroundActivityIdentifierListData:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 mutableCopy];
  v8 = (STMutableStatusBarOverridesStatusDomainData *)-[STStatusBarOverridesStatusDomainData _initWithCustomOverrides:suppressedBackgroundActivityIdentifierListData:]((id *)&self->super.super.isa, v6, v7);

  return v8;
}

- (void)setEntry:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = v6;
  if (self)
  {
    editedKeys = self->_editedKeys;
    if (!editedKeys)
    {
      v10 = [MEMORY[0x1E4F1CA80] set];
      v11 = self->_editedKeys;
      self->_editedKeys = v10;

      editedKeys = self->_editedKeys;
    }
    [(NSMutableSet *)editedKeys addObject:v8];
  }

  v12 = [(STStatusBarData *)self->super._customOverrides dataByReplacingEntry:v7 forKey:v8];

  customOverrides = self->super._customOverrides;
  self->super._customOverrides = v12;
}

- (void)suppressBackgroundActivityWithIdentifier:(id)a3
{
  id v7 = a3;
  -[STMutableStatusBarOverridesStatusDomainData _addEditedIdentifier:]((uint64_t)self, v7);
  suppressedBackgroundActivityIdentifierListData = self->super._suppressedBackgroundActivityIdentifierListData;
  if (!suppressedBackgroundActivityIdentifierListData)
  {
    v5 = objc_alloc_init(STMutableListData);
    id v6 = self->super._suppressedBackgroundActivityIdentifierListData;
    self->super._suppressedBackgroundActivityIdentifierListData = &v5->super;

    suppressedBackgroundActivityIdentifierListData = self->super._suppressedBackgroundActivityIdentifierListData;
  }
  [(STListData *)suppressedBackgroundActivityIdentifierListData addObject:v7];
}

- (uint64_t)_addEditedIdentifier:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
      id v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)stopSuppressingBackgroundActivityWithIdentifier:(id)a3
{
  id v7 = a3;
  -[STMutableStatusBarOverridesStatusDomainData _addEditedIdentifier:]((uint64_t)self, v7);
  suppressedBackgroundActivityIdentifierListData = self->super._suppressedBackgroundActivityIdentifierListData;
  if (!suppressedBackgroundActivityIdentifierListData)
  {
    v5 = objc_alloc_init(STMutableListData);
    uint64_t v6 = self->super._suppressedBackgroundActivityIdentifierListData;
    self->super._suppressedBackgroundActivityIdentifierListData = &v5->super;

    suppressedBackgroundActivityIdentifierListData = self->super._suppressedBackgroundActivityIdentifierListData;
  }
  [(STListData *)suppressedBackgroundActivityIdentifierListData removeObject:v7];
}

- (NSSet)editedKeys
{
  return (NSSet *)self->_editedKeys;
}

- (NSSet)editedIdentifiers
{
  return (NSSet *)self->_editedIdentifiers;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[STStatusBarOverridesStatusDomainData allocWithZone:a3];

  return -[STStatusBarOverridesStatusDomainData initWithData:](v4, self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [v4 applyToMutableData:self];
  }

  return isKindOfClass & 1;
}

- (STMutableListData)suppressedBackgroundActivityIdentifierListData
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableStatusBarOverridesStatusDomainData;
  v2 = [(STStatusBarOverridesStatusDomainData *)&v4 suppressedBackgroundActivityIdentifierListData];

  return (STMutableListData *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editedIdentifiers, 0);

  objc_storeStrong((id *)&self->_editedKeys, 0);
}

@end