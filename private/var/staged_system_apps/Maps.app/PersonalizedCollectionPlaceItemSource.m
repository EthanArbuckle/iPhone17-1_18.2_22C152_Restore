@interface PersonalizedCollectionPlaceItemSource
- (NSArray)storeSubscriptionTypes;
- (PersonalizedCollectionPlaceItemSource)init;
- (id)allItems;
- (unint64_t)_libraryBadgeTypeFromPlaceItem:(id)a3;
- (void)_reloadCollectionPlaceItems;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)userDefaultsDidChange:(id)a3;
@end

@implementation PersonalizedCollectionPlaceItemSource

- (void)storeDidChangeWithTypes:(id)a3
{
  objc_initWeak(&location, self);
  placesQueryQueue = self->_placesQueryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035968;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(placesQueryQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (PersonalizedCollectionPlaceItemSource)init
{
  v22.receiver = self;
  v22.super_class = (Class)PersonalizedCollectionPlaceItemSource;
  v2 = [(PersonalizedCollectionPlaceItemSource *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("PersonalizedCollectionPlaceItemSource", v3);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("PersonalizedCollectionPlaceItem.lock", v6);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("PersonalizedCollectionPlaceItemSource.placesQuery", v9);
    placesQueryQueue = v2->_placesQueryQueue;
    v2->_placesQueryQueue = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v2);
    v12 = v2->_placesQueryQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100038DF0;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v20, &location);
    v13 = v2;
    v19 = v13;
    dispatch_async(v12, block);
    v14 = +[NSUserDefaults standardUserDefaults];
    [v14 registerDefaults:&off_1013AE9C0];

    v15 = +[NSUserDefaults standardUserDefaults];
    byte_10160EA68 = [v15 BOOLForKey:@"__personalizedMapsShowFavorites"];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v13 selector:"userDefaultsDidChange:" name:NSUserDefaultsDidChangeNotification object:0];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)userDefaultsDidChange:(id)a3
{
  dispatch_queue_t v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"__personalizedMapsShowFavorites"];

  if (byte_10160EA68 != v5)
  {
    byte_10160EA68 = v5;
    updateQueue = self->_updateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003A9630;
    block[3] = &unk_1012E5D08;
    void block[4] = self;
    dispatch_async(updateQueue, block);
  }
}

- (void)_reloadCollectionPlaceItems
{
  if (byte_10160EA68)
  {
    v3 = self->_queryContents;
    v21 = +[NSMutableArray arrayWithCapacity:[(NSArray *)v3 count]];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    dispatch_queue_t v4 = v3;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v27;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          dispatch_queue_t v10 = [v9 updatedMapItemStorage];
          id v11 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v10 isPlaceHolderPlace:0];
          v12 = v11;
          if (v11)
          {
            v13 = [v11 _styleAttributes];
            unsigned __int8 v14 = [v13 isLabelPOI];

            if ((v14 & 1) == 0)
            {
              v15 = [v9 customName];

              if (v15)
              {
                v16 = [v9 customName];
                [v12 setName:v16];
              }
              else
              {
                v16 = [v12 name];
              }
              v17 = [[PersonalizedCollectionPlaceItem alloc] initWithMapItem:v12 title:v16 libraryBadgeType:[(PersonalizedCollectionPlaceItemSource *)self _libraryBadgeTypeFromPlaceItem:v9]];
              [v21 addObject:v17];
            }
          }
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v6);
    }

    lockQueue = self->_lockQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100107BF4;
    block[3] = &unk_1012E5D58;
    void block[4] = self;
    id v25 = v21;
    id v19 = v21;
    dispatch_sync(lockQueue, block);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100107BEC;
    v23[3] = &unk_1012E5D08;
    v23[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);
  }
  else
  {
    id v20 = self->_lockQueue;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1003A9638;
    v31[3] = &unk_1012E5D08;
    v31[4] = self;
    dispatch_sync(v20, v31);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1003A9658;
    v30[3] = &unk_1012E5D08;
    v30[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);
  }
}

- (unint64_t)_libraryBadgeTypeFromPlaceItem:(id)a3
{
  id v3 = a3;
  if ([v3 type])
  {
    unint64_t v6 = 4;
  }
  else
  {
    dispatch_queue_t v4 = [v3 fetchCollections];
    id v5 = [v4 count];

    if (v5) {
      unint64_t v6 = 5;
    }
    else {
      unint64_t v6 = 6;
    }
  }

  return v6;
}

- (id)allItems
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100103B1C;
  dispatch_queue_t v10 = sub_100104618;
  id v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D320;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_placesQueryQueue, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);

  objc_storeStrong((id *)&self->_queryContents, 0);
}

@end