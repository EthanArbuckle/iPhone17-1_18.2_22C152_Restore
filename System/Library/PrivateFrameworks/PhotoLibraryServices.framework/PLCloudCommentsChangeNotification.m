@interface PLCloudCommentsChangeNotification
+ (id)notificationWithAsset:(id)a3 snapshot:(id)a4;
- (id)_contentRelationshipName;
- (id)description;
- (id)name;
- (id)userInfo;
@end

@implementation PLCloudCommentsChangeNotification

+ (id)notificationWithAsset:(id)a3 snapshot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithObject:v7 snapshot:v6 changedObjects:0];

  return v8;
}

- (void).cxx_destruct
{
}

- (id)_contentRelationshipName
{
  return @"orderedCloudComments";
}

- (id)description
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v5 = objc_opt_class();
  id v6 = [(PLCloudCommentsChangeNotification *)self asset];
  id v7 = [(PLContainerChangeNotification *)self snapshot];
  v8 = [v4 stringWithFormat:@"<%@: %p> asset: %p, snapshot: %p", v5, self, v6, v7];

  v9 = [(PLContainerChangeNotification *)self _diffDescription];
  [v8 appendString:v9];

  return v8;
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
      id v7 = [(PLContainerChangeNotification *)self deletedIndexes];
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
  v2 = @"PLCloudCommentsDidChangeNotification";
  return @"PLCloudCommentsDidChangeNotification";
}

@end