@interface CollectionHandler
+ (CGSize)photoSize;
+ (id)addToCollection;
+ (id)collection;
+ (id)collectionAllSavedPlaces;
+ (id)collectionWithCollection:(id)a3;
+ (id)collectionWithCollectionHandler:(id)a3;
+ (id)collectionWithMapsSyncCachedCuratedCollection:(id)a3;
+ (id)collectionWithMapsSyncCollection:(id)a3;
+ (id)collectionWithStorage:(id)a3;
+ (id)existingCollectionItemForMapItem:(id)a3 error:(id)a4;
+ (id)favoriteCollection;
+ (id)mspArrayForCollectionHandlers:(id)a3;
- (BOOL)beingModified;
- (BOOL)canAddContent;
- (BOOL)canDelete;
- (BOOL)canDeleteContent;
- (BOOL)canEditImage;
- (BOOL)canEditTitle;
- (BOOL)canShare;
- (BOOL)containsItem:(id)a3;
- (BOOL)hasBeenModified;
- (BOOL)hasDefaultImage;
- (BOOL)isEmpty;
- (BOOL)isFavoriteCollection;
- (BOOL)loadingData;
- (BOOL)updateImage:(id)a3;
- (BOOL)updateTitle:(id)a3;
- (CollectionHandler)init;
- (CollectionHandler)initWithCollection:(id)a3;
- (CollectionManagerOperation)collectionOperation;
- (MapsSyncCollectionLike)collection;
- (NSArray)content;
- (NSArray)originalContent;
- (NSMapTable)mapping;
- (NSString)debugString;
- (NSString)description;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)sharingURL;
- (UIImage)badgeImage;
- (UIImage)cachedImage;
- (UIImage)glyphImage;
- (UIImage)image;
- (UIImage)stagedImage;
- (id)itemForMapItem:(id)a3;
- (id)placeItemMatchingMapItem:(id)a3;
- (id)sharingURLFromContainedMapItems;
- (int)showAction;
- (int64_t)contentType;
- (int64_t)handlerType;
- (int64_t)sortType;
- (unint64_t)bucketedNumberOfItems;
- (unint64_t)numberOfItems;
- (void)_loadSortType;
- (void)_storeSortType;
- (void)addObserver:(id)a3;
- (void)createCollection:(id)a3;
- (void)deleteCollection:(id)a3;
- (void)initContent;
- (void)loadDefaultImage;
- (void)loadImage;
- (void)notifyObserversContentUpdated;
- (void)notifyObserversInfoUpdated;
- (void)rebuildContent:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCachedImage:(id)a3;
- (void)setCollection:(id)a3;
- (void)setCollectionOperation:(id)a3;
- (void)setContent:(id)a3;
- (void)setDebugString:(id)a3;
- (void)setHasBeenModified:(BOOL)a3;
- (void)setHasDefaultImage:(BOOL)a3;
- (void)setMapping:(id)a3;
- (void)setOriginalContent:(id)a3;
- (void)setSortType:(int64_t)a3;
- (void)setStagedImage:(id)a3;
- (void)touch;
- (void)updateCollection:(id)a3;
- (void)updateSorting;
@end

@implementation CollectionHandler

- (NSString)description
{
  v3 = [(CollectionHandler *)self identifier];
  v4 = [(CollectionHandler *)self content];
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
  v6 = +[NSString stringWithFormat:@"<%p %@ %@ places", self, v3, v5];

  return (NSString *)v6;
}

- (MapsSyncCollectionLike)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (CollectionHandler)initWithCollection:(id)a3
{
  id v5 = a3;
  v6 = [(CollectionHandler *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    [(CollectionHandler *)v7 _loadSortType];
  }

  return v7;
}

- (CollectionHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)CollectionHandler;
  v2 = [(CollectionHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v2->_sortType = 0;
  }
  return v2;
}

- (void)_loadSortType
{
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v3 objectForKey:@"__internal_CollectionSortStorage"];

  v4 = [(CollectionHandler *)self identifier];
  id v5 = [v7 objectForKeyedSubscript:v4];

  if (v5) {
    id v6 = [v5 integerValue];
  }
  else {
    id v6 = 0;
  }
  self->_sortType = (int64_t)v6;
}

+ (id)collectionWithMapsSyncCollection:(id)a3
{
  return +[CollectionHandler collectionWithCollection:a3];
}

+ (id)collectionWithCollection:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = &off_1012D2720;
  if ((isKindOfClass & 1) == 0) {
    id v5 = off_1012D4AF8;
  }
  id v6 = [objc_alloc(*v5) initWithCollection:v3];
  id v7 = +[CollectionManager sharedManager];
  [v6 setCollectionOperation:v7];

  return v6;
}

- (void)setCollectionOperation:(id)a3
{
}

- (void)rebuildContent:(id)a3
{
  id v4 = a3;
  v34 = +[NSMutableArray array];
  id v5 = +[NSMapTable strongToStrongObjectsMapTable];
  mapping = self->_mapping;
  v33 = self;
  self->_mapping = v5;

  v31 = v4;
  [v4 sortedArrayUsingComparator:&stru_1013159E0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    v10 = GEOResultRefinementSort_ptr;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = v10;
          id v15 = v12;
          v16 = [v15 mapItemStorage];
          id v17 = +[MKMapItem _itemWithGeoMapItem:v16];

          v18 = [v15 customName];
          [v17 setName:v18];

          [v34 addObject:v17];
          v19 = v33->_mapping;
          v20 = [v15 identifier];
          [(NSMapTable *)v19 setObject:v15 forKey:v20];

          v21 = v33->_mapping;
          v22 = [v17 _geoMapItem];
          id v23 = [v22 _identifier];
          [(NSMapTable *)v21 setObject:v15 forKey:v23];

          v10 = v14;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          id v23 = v12;
          id v24 = objc_alloc((Class)MSPTransitStorageLine);
          v25 = [v23 transitLineStorage];
          id v26 = [v24 initWithData:v25];

          id v17 = v26;
          [v34 addObject:v17];
          [(NSMapTable *)v33->_mapping setObject:v23 forKey:v17];
          v27 = v33->_mapping;
          v22 = [v17 name];

          [(NSMapTable *)v27 setObject:v23 forKey:v22];
        }

LABEL_11:
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  id v28 = [v34 copy];
  [(CollectionHandler *)v33 setContent:v28];

  v29 = [(CollectionHandler *)v33 content];
  id v30 = [v29 copy];
  [(CollectionHandler *)v33 setOriginalContent:v30];

  [(CollectionHandler *)v33 loadImage];
  [(CollectionHandler *)v33 updateSorting];
}

- (NSArray)content
{
  return self->_content;
}

- (void)setOriginalContent:(id)a3
{
}

- (void)setContent:(id)a3
{
}

- (void)loadImage
{
  objc_initWeak(&location, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000DE694;
  v28[3] = &unk_1012E7298;
  objc_copyWeak(&v29, &location);
  id v3 = objc_retainBlock(v28);
  id v4 = [(CollectionHandler *)self collection];
  id v5 = [(CollectionHandler *)self stagedImage];

  if (v5)
  {
    id v6 = [(CollectionHandler *)self stagedImage];
    ((void (*)(void *, void *))v3[2])(v3, v6);
  }
  else
  {
    id v7 = [v4 image];

    if (!v7)
    {
      if ((id)[(CollectionHandler *)self contentType] == (id)1)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v9 = [(CollectionHandler *)self originalContent];
        id v10 = [v9 countByEnumeratingWithState:&v24 objects:v31 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v25;
          while (2)
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v9);
              }
              v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) _geoMapItem];
              v14 = [v13 _photos];
              [(id)objc_opt_class() photoSize];
              id v15 = [v14 _geo_firstPhotoOfAtLeastSize:];

              if (v15)
              {
                id v6 = [v15 url];

                goto LABEL_20;
              }
            }
            id v10 = [v9 countByEnumeratingWithState:&v24 objects:v31 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        v16 = [(CollectionHandler *)self collection];
        id v17 = [v16 imageUrl];

        if (v17)
        {
          uint64_t v9 = [v4 imageUrl];
          id v6 = +[NSURL URLWithString:v9];
LABEL_20:

          if (v6)
          {
            v18 = [(CollectionHandler *)self cachedImage];
            BOOL v19 = v18 == 0;

            if (v19) {
              [(CollectionHandler *)self loadDefaultImage];
            }
            v20 = +[MKAppImageManager sharedCollectionCoverImageManager];
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_100105410;
            v21[3] = &unk_1013159A0;
            v22 = v3;
            objc_copyWeak(&v23, &location);
            [v20 loadAppImageAtURL:v6 completionHandler:v21];

            objc_destroyWeak(&v23);
            goto LABEL_5;
          }
        }
      }
      [(CollectionHandler *)self loadDefaultImage];
      goto LABEL_6;
    }
    id v8 = [v4 image];
    id v6 = +[UIImage imageWithData:v8];

    ((void (*)(void *, void *))v3[2])(v3, v6);
  }
LABEL_5:

LABEL_6:
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)updateSorting
{
  id v3 = [(CollectionHandler *)self originalContent];
  id v4 = [v3 copy];

  int64_t sortType = self->_sortType;
  if (sortType == 2)
  {
    id v6 = [v4 sortedArrayUsingComparator:&stru_101315978];
    id v7 = (NSArray *)[v6 copy];
  }
  else
  {
    if (sortType == 1)
    {
      uint64_t v9 = +[MKLocationManager sharedLocationManager];
      id v6 = [v9 lastLocation];

      [v6 coordinate];
      uint64_t v11 = v10;
      [v6 coordinate];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100A6A694;
      v25[3] = &unk_101315958;
      v25[4] = v11;
      v25[5] = v12;
      v13 = [v4 sortedArrayUsingComparator:v25];
      v14 = (NSArray *)[v13 copy];
      content = self->_content;
      self->_content = v14;

      goto LABEL_8;
    }
    if (sortType) {
      goto LABEL_9;
    }
    id v6 = [v4 reverseObjectEnumerator];
    id v7 = [v6 allObjects];
  }
  id v8 = self->_content;
  self->_content = v7;

LABEL_8:
LABEL_9:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = [(NSHashTable *)self->_observers copy];
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v20) collectionHandlerContentUpdated:self];
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v18);
  }

  [(CollectionHandler *)self notifyObserversInfoUpdated];
}

- (NSArray)originalContent
{
  return self->_originalContent;
}

- (void)notifyObserversInfoUpdated
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008DDF4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (UIImage)stagedImage
{
  return self->_stagedImage;
}

- (void)loadDefaultImage
{
  if (![(CollectionHandler *)self hasDefaultImage])
  {
    id v3 = +[UIScreen mainScreen];
    [v3 scale];
    double v5 = v4;

    id v6 = +[UIDevice currentDevice];
    id v7 = [v6 userInterfaceIdiom];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000DE720;
    v13[3] = &unk_1012F3FB8;
    v13[4] = self;
    id v8 = objc_retainBlock(v13);
    if (v7 == (id)5)
    {
      uint64_t v9 = [(CollectionHandler *)self originalContent];
      if ([v9 count]) {
        CFStringRef v10 = @"NoImageGuideIcon";
      }
      else {
        CFStringRef v10 = @"NewGuideIcon";
      }
      uint64_t v11 = +[UIImage imageNamed:v10];
    }
    else
    {
      uint64_t v9 = +[UIImage maps_emptyImageScale:v5];
      uint64_t v12 = +[UIColor whiteColor];
      uint64_t v11 = [v9 imageWithTintColor:v12];
    }
    ((void (*)(void *, void *))v8[2])(v8, v11);
  }
}

- (BOOL)hasDefaultImage
{
  return self->_hasDefaultImage;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

+ (CGSize)photoSize
{
  double v2 = 70.0;
  double v3 = 70.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setHasDefaultImage:(BOOL)a3
{
  self->_hasDefaultImage = a3;
}

- (void)setCachedImage:(id)a3
{
}

- (BOOL)isEmpty
{
  return [(NSArray *)self->_content count] == 0;
}

+ (id)favoriteCollection
{
  double v2 = objc_alloc_init(_TtC4Maps25FavoriteCollectionHandler);

  return v2;
}

+ (id)collectionAllSavedPlaces
{
  double v2 = objc_alloc_init(AllPlacesCollectionHandler);

  return v2;
}

- (unint64_t)numberOfItems
{
  double v2 = [(CollectionHandler *)self content];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

+ (id)addToCollection
{
  return +[PlaceholderCollectionHandler sharedInstance];
}

+ (id)collection
{
  id v2 = objc_alloc_init((Class)MSCollection);
  id v3 = [[UserCollectionHandler alloc] initWithCollection:v2];
  double v4 = +[CollectionManager sharedManager];
  [(CollectionHandler *)v3 setCollectionOperation:v4];

  [(UserCollectionHandler *)v3 setNeedsToBePersisted:1];

  return v3;
}

+ (id)collectionWithMapsSyncCachedCuratedCollection:(id)a3
{
  return +[CollectionHandler collectionWithCollection:a3];
}

+ (id)collectionWithStorage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MSCollection);
  double v5 = [URLCollectionHandler alloc];
  id v6 = +[CollectionManager sharedManager];
  id v7 = [(URLCollectionHandler *)v5 initWithStorage:v3 collectionOperation:v6];

  [(CollectionHandler *)v7 setCollection:v4];

  return v7;
}

+ (id)collectionWithCollectionHandler:(id)a3
{
  id v3 = [a3 collection];
  id v4 = +[CollectionHandler collectionWithCollection:v3];

  return v4;
}

+ (id)mspArrayForCollectionHandlers:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 collection:v15];

        if (v11)
        {
          uint64_t v12 = [v10 collection];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];

  return v13;
}

- (BOOL)beingModified
{
  return 0;
}

- (void)touch
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionOperation);
  id v3 = [(CollectionHandler *)self collection];
  [WeakRetained touchCollection:v3];
}

- (void)setSortType:(int64_t)a3
{
  if (self->_sortType != a3)
  {
    self->_int64_t sortType = a3;
    [(CollectionHandler *)self _storeSortType];
    [(CollectionHandler *)self updateSorting];
  }
}

- (void)_storeSortType
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [v3 objectForKey:@"__internal_CollectionSortStorage"];
  id v5 = (void *)v4;
  id v6 = &__NSDictionary0__struct;
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  id v12 = [v7 mutableCopy];
  uint64_t v8 = +[NSNumber numberWithInteger:self->_sortType];
  uint64_t v9 = [(CollectionHandler *)self identifier];
  [v12 setObject:v8 forKeyedSubscript:v9];

  CFStringRef v10 = +[NSUserDefaults standardUserDefaults];
  id v11 = [v12 copy];
  [v10 setObject:v11 forKey:@"__internal_CollectionSortStorage"];
}

- (void)initContent
{
  [(CollectionHandler *)self updateSorting];

  [(CollectionHandler *)self loadImage];
}

- (NSURL)sharingURL
{
  return 0;
}

- (int)showAction
{
  return 17099;
}

- (unint64_t)bucketedNumberOfItems
{
  unint64_t result = [(CollectionHandler *)self numberOfItems];
  if (result >= 5)
  {
    if (result <= 0xE)
    {
      int v3 = result - 5 * (result / 5u);
LABEL_4:
      result -= v3;
      return result;
    }
    if (result >= 0x19)
    {
      if (result >= 0x28)
      {
        if (result <= 0x63)
        {
          int v3 = result - 20 * (result / 0x14u);
          goto LABEL_4;
        }
        return 100 * (result / 0x64);
      }
      else
      {
        return 25;
      }
    }
    else
    {
      return 15;
    }
  }
  return result;
}

- (int64_t)contentType
{
  return 0;
}

- (int64_t)handlerType
{
  return 0;
}

- (void)createCollection:(id)a3
{
  id v4 = a3;
  id v6 = [(CollectionHandler *)self collectionOperation];
  id v5 = [(CollectionHandler *)self collection];
  [v6 createCollection:v5 completion:v4];
}

- (void)updateCollection:(id)a3
{
  id v6 = a3;
  if ([(CollectionHandler *)self hasBeenModified])
  {
    [(CollectionHandler *)self setHasBeenModified:0];
    id v4 = [(CollectionHandler *)self collectionOperation];
    id v5 = [(CollectionHandler *)self collection];
    [v4 saveCollection:v5 completion:v6];
  }
}

- (void)deleteCollection:(id)a3
{
  id v4 = a3;
  id v6 = [(CollectionHandler *)self collectionOperation];
  id v5 = [(CollectionHandler *)self collection];
  [v6 deleteCollection:v5 completion:v4];
}

- (BOOL)updateTitle:(id)a3
{
  return [a3 length] != 0;
}

- (BOOL)updateImage:(id)a3
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)&stru_101324E70;
}

- (NSString)title
{
  return (NSString *)&stru_101324E70;
}

- (NSString)subtitle
{
  int v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"[Collections] subtitle" value:@"localized string not found" table:0];
  id v5 = [(CollectionHandler *)self content];
  id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, [v5 count]);

  return (NSString *)v6;
}

- (UIImage)image
{
  int v3 = [(CollectionHandler *)self cachedImage];

  if (v3)
  {
    id v4 = [(CollectionHandler *)self cachedImage];
  }
  else
  {
    id v4 = 0;
  }

  return (UIImage *)v4;
}

- (UIImage)glyphImage
{
  return 0;
}

- (UIImage)badgeImage
{
  return 0;
}

- (BOOL)isFavoriteCollection
{
  return 0;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)itemForMapItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSUUID);
  id v6 = [v4 _geoMapItem];
  id v7 = [v6 _clientAttributes];
  uint64_t v8 = [v7 mapsSyncAttributes];
  uint64_t v9 = [v8 mapsSyncIdentifier];
  id v10 = [v5 initWithUUIDString:v9];

  id v11 = [(NSMapTable *)self->_mapping objectForKey:v10];
  if (!v11)
  {
    mapping = self->_mapping;
    id v13 = [v4 _geoMapItem];
    v14 = [v13 _identifier];
    id v11 = [(NSMapTable *)mapping objectForKey:v14];
  }

  return v11;
}

- (BOOL)containsItem:(id)a3
{
  return 0;
}

- (id)placeItemMatchingMapItem:(id)a3
{
  id v4 = a3;
  if ((id)[(CollectionHandler *)self contentType] == (id)1)
  {
    id v5 = [(CollectionHandler *)self itemForMapItem:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)canShare
{
  if (!GEOConfigGetBOOL() || [(CollectionHandler *)self isEmpty]) {
    return 0;
  }
  id v4 = [(CollectionHandler *)self sharingURL];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)canEditImage
{
  return 0;
}

- (BOOL)canEditTitle
{
  return 0;
}

- (BOOL)canAddContent
{
  return 0;
}

- (BOOL)canDeleteContent
{
  return 0;
}

- (BOOL)loadingData
{
  return 0;
}

- (void)notifyObserversContentUpdated
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A6AF28;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(CollectionHandler *)self notifyObserversInfoUpdated];
}

+ (id)existingCollectionItemForMapItem:(id)a3 error:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = a3;
    id v7 = objc_alloc((Class)_TtC8MapsSync22MapsSyncQueryPredicate);
    uint64_t v8 = [v6 _geoMapItem];
    uint64_t v9 = [v6 _geoMapItemStorageForPersistence];

    id v10 = [v9 userValues];
    id v11 = [v10 name];
    id v12 = [v7 initWithMapItem:v8 customName:v11];

    id v13 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v12 sortDescriptors:0 range:0];
    id v14 = objc_alloc_init((Class)MSCollectionPlaceItemRequest);
    id v19 = v5;
    long long v15 = [v14 fetchSyncWithOptions:v13 error:&v19];
    id v16 = v19;

    long long v17 = [v15 firstObject];

    id v5 = v16;
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (id)sharingURLFromContainedMapItems
{
  id v3 = objc_alloc_init((Class)GEOURLCollectionStorage);
  id v4 = [(CollectionHandler *)self title];
  [v3 setName:v4];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(CollectionHandler *)self content];
  id v6 = [v5 copy];

  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = objc_alloc_init((Class)GEOCollectionPlace);
        if ([v11 _hasMUID])
        {
          [v12 setMuid:[v11 _muid]];
          if ([v11 _hasResultProviderID]) {
            [v12 setProviderId:[v11 _resultProviderID]];
          }
        }
        else
        {
          id v13 = [v11 _addressFormattedAsSinglelineAddress];
          id v14 = objc_alloc_init((Class)GEOLatLng);
          [v11 _coordinate];
          [v14 setLat:];
          [v11 _coordinate];
          [v14 setLng:v15];
          [v12 setAddress:v13];
          [v12 setCoordinate:v14];
          id v16 = [v11 name];
          [v12 setName:v16];
        }
        [v3 addPlace:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  long long v17 = +[_MKURLBuilder URLForCollectionStorage:v3];

  return v17;
}

- (int64_t)sortType
{
  return self->_sortType;
}

- (NSString)debugString
{
  return self->_debugString;
}

- (void)setDebugString:(id)a3
{
}

- (CollectionManagerOperation)collectionOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionOperation);

  return (CollectionManagerOperation *)WeakRetained;
}

- (BOOL)hasBeenModified
{
  return self->_hasBeenModified;
}

- (void)setHasBeenModified:(BOOL)a3
{
  self->_hasBeenModified = a3;
}

- (void)setStagedImage:(id)a3
{
}

- (NSMapTable)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);
  objc_storeStrong((id *)&self->_originalContent, 0);
  objc_storeStrong((id *)&self->_stagedImage, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_destroyWeak((id *)&self->_collectionOperation);
  objc_storeStrong((id *)&self->_debugString, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end