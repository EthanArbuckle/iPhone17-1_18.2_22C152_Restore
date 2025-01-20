@interface LibraryMapItemLookupResult
- (CollectionHandler)collectionHandler;
- (LibraryMapItemLookupResult)initWithPlaceItem:(id)a3 collectionHandler:(id)a4;
- (MSCollectionPlaceItem)placeItem;
@end

@implementation LibraryMapItemLookupResult

- (LibraryMapItemLookupResult)initWithPlaceItem:(id)a3 collectionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LibraryMapItemLookupResult;
  v9 = [(LibraryMapItemLookupResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeItem, a3);
    objc_storeStrong((id *)&v10->_collectionHandler, a4);
  }

  return v10;
}

- (MSCollectionPlaceItem)placeItem
{
  return self->_placeItem;
}

- (CollectionHandler)collectionHandler
{
  return self->_collectionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionHandler, 0);

  objc_storeStrong((id *)&self->_placeItem, 0);
}

@end