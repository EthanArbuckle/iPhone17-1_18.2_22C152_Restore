@interface PLAssetContainerListChangeNotification
+ (id)notificationWithContainerList:(id)a3 snapshot:(id)a4 changedContainers:(id)a5;
- (id)_contentRelationshipName;
- (id)description;
- (id)name;
- (id)userInfo;
@end

@implementation PLAssetContainerListChangeNotification

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v5 = objc_opt_class();
  v6 = [(PLAssetContainerListChangeNotification *)self albumList];
  v7 = [(PLAssetContainerListChangeNotification *)self albumList];
  v8 = [v7 _typeDescription];
  v9 = [(PLContainerChangeNotification *)self snapshot];
  v10 = [v4 stringWithFormat:@"<%@: %p> container list: %p (%@), snapshot: %p", v5, self, v6, v8, v9];

  v11 = [(PLContainerChangeNotification *)self _diffDescription];
  [v10 appendString:v11];

  return v10;
}

- (id)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [(PLContainerChangeNotification *)self deletedIndexes];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = [(PLContainerChangeNotification *)self deletedIndexes];
      [(NSDictionary *)v4 setObject:v7 forKey:@"DeletedItemsIndexesKey"];
    }
    v8 = [(PLContainerChangeNotification *)self insertedIndexes];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = [(PLContainerChangeNotification *)self insertedIndexes];
      [(NSDictionary *)v4 setObject:v10 forKey:@"AddedItemsIndexesKey"];
    }
    v11 = [(PLContainerChangeNotification *)self changedIndexes];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      v13 = [(PLContainerChangeNotification *)self changedIndexes];
      [(NSDictionary *)v4 setObject:v13 forKey:@"ChangedItemsIndexesKey"];
    }
    v14 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (id)name
{
  v2 = @"PLAssetContainerListDidChangeNotification";
  return @"PLAssetContainerListDidChangeNotification";
}

- (id)_contentRelationshipName
{
  v2 = [(PLAssetContainerListChangeNotification *)self assetContainerList];
  v3 = [v2 containersRelationshipName];

  return v3;
}

+ (id)notificationWithContainerList:(id)a3 snapshot:(id)a4 changedContainers:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) _initWithObject:v10 snapshot:v9 changedObjects:v8];

  return v11;
}

@end