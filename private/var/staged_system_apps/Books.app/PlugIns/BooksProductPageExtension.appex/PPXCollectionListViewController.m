@interface PPXCollectionListViewController
- (BOOL)isAudiobook;
- (BOOL)isPurchased;
- (NSArray)collectionDetailsCache;
- (NSString)assetID;
- (PPXCollectionListViewController)initWithAssetID:(id)a3 isPurchased:(BOOL)a4 isAudiobook:(BOOL)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateCollections;
- (void)loadView;
- (void)setAssetID:(id)a3;
- (void)setCollectionDetailsCache:(id)a3;
- (void)setIsAudiobook:(BOOL)a3;
- (void)setIsPurchased:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PPXCollectionListViewController

- (PPXCollectionListViewController)initWithAssetID:(id)a3 isPurchased:(BOOL)a4 isAudiobook:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPXCollectionListViewController;
  v9 = [(PPXCollectionListViewController *)&v13 init];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    assetID = v9->_assetID;
    v9->_assetID = v10;

    v9->_isPurchased = a4;
    v9->_isAudiobook = a5;
  }

  return v9;
}

- (void)loadView
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Add to Collection" value:&stru_100031DD0 table:0];
  [(PPXCollectionListViewController *)self setTitle:v4];

  id v5 = objc_alloc_init((Class)UITableView);
  [v5 setDelegate:self];
  [v5 setDataSource:self];
  [(PPXCollectionListViewController *)self setView:v5];
  [(PPXCollectionListViewController *)self _updateCollections];
}

- (void)_updateCollections
{
  objc_initWeak(&location, self);
  v2 = +[BCCloudCollectionsManager sharedManager];
  v3 = [v2 collectionDetailManager];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000030F4;
  v4[3] = &unk_100031420;
  objc_copyWeak(&v5, &location);
  [v3 fetchCollectionDetailsIncludingDeleted:0 completion:v4];
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(PPXCollectionListViewController *)self collectionDetailsCache];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"PPXCollectionListCell"];
  if (!v7) {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"PPXCollectionListCell"];
  }
  id v8 = [v6 row];
  v9 = [(PPXCollectionListViewController *)self collectionDetailsCache];
  if (v8 >= [v9 count])
  {
    v10 = 0;
  }
  else
  {
    v10 = [v9 objectAtIndex:v8];
  }
  v11 = [v10 name];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PPXCollectionListViewController *)self assetID];
  if (v6)
  {
    id v7 = [v5 row];
    id v8 = [(PPXCollectionListViewController *)self collectionDetailsCache];
    if (v7 < [v8 count])
    {
      v9 = [v8 objectAtIndex:v7];
      v10 = [v9 collectionID];
      if (v10)
      {
        v11 = [(PPXCollectionListViewController *)self ba_effectiveAnalyticsTracker];
        objc_super v13 = _NSConcreteStackBlock;
        uint64_t v14 = 3221225472;
        v15 = sub_1000036E4;
        v16 = &unk_100031448;
        id v17 = v6;
        v18 = self;
        id v19 = v11;
        id v20 = v10;
        id v12 = v11;
        +[BDSServiceCenter addStoreID:v17 toCollectionID:v20 completion:&v13];
      }
    }
  }
  -[PPXCollectionListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v13, v14, v15, v16);
}

- (NSArray)collectionDetailsCache
{
  return self->_collectionDetailsCache;
}

- (void)setCollectionDetailsCache:(id)a3
{
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (BOOL)isPurchased
{
  return self->_isPurchased;
}

- (void)setIsPurchased:(BOOL)a3
{
  self->_isPurchased = a3;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_isAudiobook = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);

  objc_storeStrong((id *)&self->_collectionDetailsCache, 0);
}

@end