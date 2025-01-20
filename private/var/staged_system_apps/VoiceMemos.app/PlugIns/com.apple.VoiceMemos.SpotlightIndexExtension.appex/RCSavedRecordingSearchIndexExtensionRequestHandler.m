@interface RCSavedRecordingSearchIndexExtensionRequestHandler
- (id)container;
- (void)index:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
- (void)reindexAllSearchableItemsForIndex:(id)a3 acknowledgementHandler:(id)a4;
@end

@implementation RCSavedRecordingSearchIndexExtensionRequestHandler

- (id)container
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_container)
  {
    id v3 = objc_alloc((Class)RCPersistentContainer);
    v4 = RCCloudRecordingsStoreURL();
    v5 = (RCPersistentContainer *)[v3 initWithURL:v4];
    container = v2->_container;
    v2->_container = v5;
  }
  objc_sync_exit(v2);

  v7 = v2->_container;

  return v7;
}

- (void)reindexAllSearchableItemsForIndex:(id)a3 acknowledgementHandler:(id)a4
{
  id v4 = a4;
  v5 = +[RCSSavedRecordingService sharedService];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004970;
  v7[3] = &unk_100008300;
  id v8 = v4;
  id v6 = v4;
  [v5 reloadExistingSearchMetadataWithCompletionBlock:v7];
}

- (void)index:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = dispatch_queue_create(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004AE4;
  block[3] = &unk_100008350;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(v9, block);
}

- (void).cxx_destruct
{
}

@end