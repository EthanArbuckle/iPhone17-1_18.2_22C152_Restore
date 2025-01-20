@interface URLCollectionHandler
- (BOOL)loadingData;
- (URLCollectionHandler)initWithStorage:(id)a3 collectionOperation:(id)a4;
- (id)identifier;
- (id)title;
- (int)showAction;
- (int64_t)contentType;
- (int64_t)handlerType;
- (void)_resolvePlaces;
- (void)createCollection:(id)a3;
- (void)rebuildContent:(id)a3;
@end

@implementation URLCollectionHandler

- (URLCollectionHandler)initWithStorage:(id)a3 collectionOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)URLCollectionHandler;
  v9 = [(CollectionHandler *)&v17 init];
  v10 = v9;
  if (v9)
  {
    [(CollectionHandler *)v9 setCollectionOperation:v8];
    objc_storeStrong((id *)&v10->_collectionStorage, a3);
    v11 = +[NSUUID UUID];
    uint64_t v12 = [v11 UUIDString];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    v10->_isRefining = 0;
    v14 = +[MKLocationManager sharedLocationManager];
    if ([v14 isAuthorizedForPreciseLocation]) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2;
    }
    [(CollectionHandler *)v10 setSortType:v15];

    [(URLCollectionHandler *)v10 _resolvePlaces];
  }

  return v10;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)title
{
  return [(GEOURLCollectionStorage *)self->_collectionStorage name];
}

- (void)_resolvePlaces
{
  if (!self->_isRefining)
  {
    self->_isRefining = 1;
    v3 = (MKCollectionStorageRefiner *)[objc_alloc((Class)MKCollectionStorageRefiner) initWithCollectionStorage:self->_collectionStorage];
    storageRefiner = self->_storageRefiner;
    self->_storageRefiner = v3;

    objc_initWeak(&location, self);
    v5 = self->_storageRefiner;
    objc_copyWeak(&v9, &location);
    v6 = [(CollectionHandler *)self collectionOperation];
    id v7 = [v6 newTraits];
    [(MKCollectionStorageRefiner *)v5 fetchMapItems:&v8 traits:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (BOOL)loadingData
{
  return self->_isRefining;
}

- (void)rebuildContent:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  v25 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v10);
        if (v11)
        {
          id v12 = objc_alloc((Class)MSCollectionPlaceItem);
          v13 = [(CollectionHandler *)self collection];
          id v14 = [v12 initWithCollection:v13];

          uint64_t v15 = [v11 name];
          [v14 setCustomName:v15];

          v16 = [v11 _geoMapItem];
          objc_super v17 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v16];
          [v14 setMapItemStorage:v17];

          [v25 addObject:v14];
        }
        [v5 addObject:v11];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  v18 = [(CollectionHandler *)self collection];
  v19 = [(URLCollectionHandler *)self title];
  [v18 setTitle:v19];

  id v20 = [v5 copy];
  [(CollectionHandler *)self setContent:v20];

  v21 = [(CollectionHandler *)self content];
  id v22 = [v21 copy];
  [(CollectionHandler *)self setOriginalContent:v22];

  v23 = (NSArray *)[v25 copy];
  unsavedContent = self->_unsavedContent;
  self->_unsavedContent = v23;

  [(CollectionHandler *)self updateSorting];
  [(CollectionHandler *)self loadImage];
}

- (void)createCollection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10040C5DC;
  v7[3] = &unk_1012E9690;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)URLCollectionHandler;
  [(CollectionHandler *)&v6 createCollection:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)handlerType
{
  return 3;
}

- (int64_t)contentType
{
  return 1;
}

- (int)showAction
{
  return 2067;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsavedContent, 0);
  objc_storeStrong((id *)&self->_storageRefiner, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_collectionStorage, 0);
}

@end