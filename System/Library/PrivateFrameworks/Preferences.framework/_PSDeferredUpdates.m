@interface _PSDeferredUpdates
+ (id)deferredInvalidationUpdatesWithEntries:(id)a3;
+ (id)deferredUpdatesWithEntries:(id)a3 specifierUpdates:(id)a4;
- (BOOL)invalidatedSpecifiers;
- (NSMutableSet)searchEntries;
- (PSSpecifierUpdates)specifierUpdates;
- (_PSDeferredUpdates)initWithSearchEntries:(id)a3 specifierUpdates:(id)a4 invalidatedSpecifiers:(BOOL)a5;
- (void)setInvalidatedSpecifiers:(BOOL)a3;
- (void)setSearchEntries:(id)a3;
- (void)setSpecifierUpdates:(id)a3;
@end

@implementation _PSDeferredUpdates

+ (id)deferredUpdatesWithEntries:(id)a3 specifierUpdates:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithSearchEntries:v7 specifierUpdates:v6 invalidatedSpecifiers:0];

  return v8;
}

+ (id)deferredInvalidationUpdatesWithEntries:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSearchEntries:v4 specifierUpdates:0 invalidatedSpecifiers:1];

  return v5;
}

- (_PSDeferredUpdates)initWithSearchEntries:(id)a3 specifierUpdates:(id)a4 invalidatedSpecifiers:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PSDeferredUpdates;
  v10 = [(_PSDeferredUpdates *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v8];
    searchEntries = v10->_searchEntries;
    v10->_searchEntries = (NSMutableSet *)v11;

    objc_storeStrong((id *)&v10->_specifierUpdates, a4);
    v10->_invalidatedSpecifiers = a5;
  }

  return v10;
}

- (NSMutableSet)searchEntries
{
  return self->_searchEntries;
}

- (void)setSearchEntries:(id)a3
{
}

- (PSSpecifierUpdates)specifierUpdates
{
  return self->_specifierUpdates;
}

- (void)setSpecifierUpdates:(id)a3
{
}

- (BOOL)invalidatedSpecifiers
{
  return self->_invalidatedSpecifiers;
}

- (void)setInvalidatedSpecifiers:(BOOL)a3
{
  self->_invalidatedSpecifiers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierUpdates, 0);
  objc_storeStrong((id *)&self->_searchEntries, 0);
}

@end