@interface CollectionActivityProvider
- (CollectionActivityProvider)initWithCollectionHandlerInfo:(id)a3;
- (CollectionHandlerInfo)collectionInfo;
- (NSArray)mapItems;
- (void)setMapItems:(id)a3;
@end

@implementation CollectionActivityProvider

- (CollectionActivityProvider)initWithCollectionHandlerInfo:(id)a3
{
  id v5 = a3;
  if ([v5 canShare])
  {
    v13.receiver = self;
    v13.super_class = (Class)CollectionActivityProvider;
    v6 = [(CollectionActivityProvider *)&v13 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_collectionInfo, a3);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v5;
        if ([v8 contentType] == (id)1)
        {
          uint64_t v9 = [v8 content];
          mapItems = v7->_mapItems;
          v7->_mapItems = (NSArray *)v9;
        }
      }
    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CollectionHandlerInfo)collectionInfo
{
  return self->_collectionInfo;
}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (void)setMapItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItems, 0);

  objc_storeStrong((id *)&self->_collectionInfo, 0);
}

@end