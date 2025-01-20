@interface FRArticleEditorialItemDownloader
- (FCArticleController)articleController;
- (FRArticleEditorialItemDownloader)initWithArticleController:(id)a3 dataProviderFactory:(id)a4 articleEditorialItemProvider:(id)a5 editorialItemEntryManager:(id)a6 thumbnailCreator:(id)a7 editorialItemCreator:(id)a8;
- (FRArticleEditorialItemProvider)articleEditorialItemProvider;
- (FREditorialItemCreator)editorialItemCreator;
- (FREditorialItemEntryManager)editorialItemEntryManager;
- (FREditorialItemThumbnailCreator)thumbnailCreator;
- (FRFlintDataProviderFactory)flintDataProviderFactory;
- (void)downloadArticleWithArticleID:(id)a3 editorialItemFromCache:(id)a4 completion:(id)a5;
- (void)downloadEditorialItemWithIDs:(id)a3 completion:(id)a4;
- (void)loadArticleMetadataWithHeadline:(id)a3 editorialItemFromCache:(id)a4 content:(id)a5 articleModifiedDate:(id)a6 completion:(id)a7;
@end

@implementation FRArticleEditorialItemDownloader

- (FRArticleEditorialItemDownloader)initWithArticleController:(id)a3 dataProviderFactory:(id)a4 articleEditorialItemProvider:(id)a5 editorialItemEntryManager:(id)a6 thumbnailCreator:(id)a7 editorialItemCreator:(id)a8
{
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id obj = a7;
  id v18 = a7;
  id v24 = a8;
  id v19 = a8;
  if (!v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100077EC4();
    if (v17) {
      goto LABEL_6;
    }
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100077E00();
  }
LABEL_6:
  if (!v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100077D3C();
    if (v18) {
      goto LABEL_11;
    }
  }
  else if (v18)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100077C78();
  }
LABEL_11:
  if (!v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100077BB4();
  }
  v26.receiver = self;
  v26.super_class = (Class)FRArticleEditorialItemDownloader;
  v20 = [(FRArticleEditorialItemDownloader *)&v26 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_articleController, a3);
    objc_storeStrong((id *)&v21->_flintDataProviderFactory, a4);
    objc_storeStrong((id *)&v21->_articleEditorialItemProvider, a5);
    objc_storeStrong((id *)&v21->_editorialItemEntryManager, a6);
    objc_storeStrong((id *)&v21->_thumbnailCreator, obj);
    objc_storeStrong((id *)&v21->_editorialItemCreator, v24);
  }

  return v21;
}

- (void)downloadEditorialItemWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v20 = v6;
  if ([v6 count])
  {
    id v19 = v7;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = sub_100018B30;
    v32[4] = sub_100018A20;
    id v33 = +[NSMutableDictionary dictionary];
    v8 = dispatch_group_create();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v29;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v13 = [(FRArticleEditorialItemDownloader *)self editorialItemEntryManager];
          v14 = [v13 editorialItemsByID];
          id v15 = [v14 objectForKey:v12];

          dispatch_group_enter(v8);
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_1000536BC;
          v25[3] = &unk_1000C8F20;
          v27 = v32;
          objc_super v26 = v8;
          [(FRArticleEditorialItemDownloader *)self downloadArticleWithArticleID:v12 editorialItemFromCache:v15 completion:v25];
        }
        id v9 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
      }
      while (v9);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000537E8;
    block[3] = &unk_1000C8520;
    id v23 = v19;
    id v24 = v32;
    id v16 = v19;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v32, 8);
  }
  else
  {
    v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472;
    v36 = sub_10005369C;
    v37 = &unk_1000C6E28;
    id v38 = v7;
    if (v7)
    {
      id v17 = (void (*)(void))v7[2];
      id v18 = v7;
      v17();
    }
  }
}

- (void)downloadArticleWithArticleID:(id)a3 editorialItemFromCache:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(FRArticleEditorialItemDownloader *)self articleController];
  uint64_t v12 = [v11 articleWithID:v8 forceArticleUpdate:1 qualityOfService:25 relativePriority:1];

  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000539E0;
  v17[3] = &unk_1000C8F98;
  objc_copyWeak(&v22, &location);
  id v13 = v12;
  id v18 = v13;
  id v14 = v10;
  id v21 = v14;
  id v15 = v9;
  id v19 = v15;
  id v16 = v8;
  id v20 = v16;
  [v13 performBlockWhenContentIsLoaded:v17];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)loadArticleMetadataWithHeadline:(id)a3 editorialItemFromCache:(id)a4 content:(id)a5 articleModifiedDate:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a3;
  id v17 = [v16 articleID];
  id v18 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ToC Editorial Manager: Download flint data initiated for articleID: %{public}@", buf, 0xCu);
  }
  id v19 = [(FRArticleEditorialItemDownloader *)self flintDataProviderFactory];
  id v20 = [v15 anfContent];

  id v21 = [v19 flintDataProviderForANFContent:v20 headline:v16];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100054118;
  v28[3] = &unk_1000C9038;
  v28[4] = self;
  id v29 = v17;
  id v30 = v12;
  id v31 = v13;
  id v32 = v21;
  id v33 = v14;
  id v22 = v21;
  id v23 = v13;
  id v24 = v12;
  id v25 = v14;
  id v26 = v17;
  id v27 = [v22 loadContextWithCompletionBlock:v28];
}

- (FRFlintDataProviderFactory)flintDataProviderFactory
{
  return self->_flintDataProviderFactory;
}

- (FCArticleController)articleController
{
  return self->_articleController;
}

- (FREditorialItemEntryManager)editorialItemEntryManager
{
  return self->_editorialItemEntryManager;
}

- (FRArticleEditorialItemProvider)articleEditorialItemProvider
{
  return self->_articleEditorialItemProvider;
}

- (FREditorialItemThumbnailCreator)thumbnailCreator
{
  return self->_thumbnailCreator;
}

- (FREditorialItemCreator)editorialItemCreator
{
  return self->_editorialItemCreator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialItemCreator, 0);
  objc_storeStrong((id *)&self->_thumbnailCreator, 0);
  objc_storeStrong((id *)&self->_articleEditorialItemProvider, 0);
  objc_storeStrong((id *)&self->_editorialItemEntryManager, 0);
  objc_storeStrong((id *)&self->_articleController, 0);

  objc_storeStrong((id *)&self->_flintDataProviderFactory, 0);
}

@end