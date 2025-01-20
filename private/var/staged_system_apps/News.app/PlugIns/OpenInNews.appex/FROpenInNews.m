@interface FROpenInNews
- (FCCoreConfigurationManager)configurationManager;
- (NSExtensionContext)extensionContext;
- (NSURL)archiveFileURL;
- (NSURL)cachesDirectory;
- (void)_openNewsArticleWithURL:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)setArchiveFileURL:(id)a3;
- (void)setCachesDirectory:(id)a3;
- (void)setConfigurationManager:(id)a3;
@end

@implementation FROpenInNews

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v17 = a3;
  objc_storeStrong((id *)&self->_extensionContext, a3);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = sub_10000228C;
  v43[4] = sub_10000229C;
  id v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_10000228C;
  v41[4] = sub_10000229C;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_10000228C;
  v39[4] = sub_10000229C;
  id v40 = 0;
  v4 = dispatch_group_create();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = [v17 inputItems];
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v46 count:16];
  id obj = v5;
  if (v6)
  {
    uint64_t v19 = *(void *)v36;
    do
    {
      uint64_t v7 = 0;
      id v20 = v6;
      do
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v35 + 1) + 8 * v7);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v9 = [v8 attachments];
        id v10 = [v9 countByEnumeratingWithState:&v31 objects:v45 count:16];
        uint64_t v21 = v7;
        if (v10)
        {
          uint64_t v11 = *(void *)v32;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v32 != v11) {
                objc_enumerationMutation(v9);
              }
              v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if ([v13 hasItemConformingToTypeIdentifier:kUTTypeURL])
              {
                dispatch_group_enter(v4);
                v29[0] = _NSConcreteStackBlock;
                v29[1] = 3221225472;
                v29[2] = sub_1000022A4;
                v29[3] = &unk_100008328;
                v30[1] = v41;
                v30[0] = v4;
                [v13 loadItemForTypeIdentifier:kUTTypeURL options:0 completionHandler:v29];
                v14 = (id *)v30;
              }
              else if ([v13 hasItemConformingToTypeIdentifier:kUTTypePlainText])
              {
                dispatch_group_enter(v4);
                v27[0] = _NSConcreteStackBlock;
                v27[1] = 3221225472;
                v27[2] = sub_100002324;
                v27[3] = &unk_100008350;
                v28[1] = v43;
                v28[0] = v4;
                [v13 loadItemForTypeIdentifier:kUTTypePlainText options:0 completionHandler:v27];
                v14 = (id *)v28;
              }
              else
              {
                if (![v13 hasItemConformingToTypeIdentifier:@"FRRSSFeedURL"]) {
                  continue;
                }
                dispatch_group_enter(v4);
                v25[0] = _NSConcreteStackBlock;
                v25[1] = 3221225472;
                v25[2] = sub_1000023A4;
                v25[3] = &unk_100008328;
                v26[1] = v39;
                v26[0] = v4;
                [v13 loadItemForTypeIdentifier:@"FRRSSFeedURL" options:0 completionHandler:v25];
                v14 = (id *)v26;
              }
            }
            id v10 = [v9 countByEnumeratingWithState:&v31 objects:v45 count:16];
          }
          while (v10);
        }

        uint64_t v7 = v21 + 1;
      }
      while ((id)(v21 + 1) != v20);
      id v6 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v6);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002424;
  block[3] = &unk_100008378;
  v24 = v41;
  block[4] = self;
  id v23 = v17;
  id v15 = v17;
  dispatch_group_notify(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
}

- (FCCoreConfigurationManager)configurationManager
{
  FCURLForContainerizedUserAccountCachesDirectory();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000025A4;
  block[3] = &unk_1000083A0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = qword_10000D788;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10000D788, block);
  }
  objc_storeStrong((id *)&self->_configurationManager, (id)qword_10000D780);
  v5 = self->_configurationManager;

  return v5;
}

- (void)_openNewsArticleWithURL:(id)a3
{
  id v4 = a3;
  v5 = [FROpenInNewsManager alloc];
  id v6 = [(FROpenInNews *)self configurationManager];
  uint64_t v7 = +[FCNetworkReachability sharedNetworkReachability];
  id v8 = [(FROpenInNewsManager *)v5 initWithConfigurationManager:v6 networkReachability:v7];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000273C;
  v9[3] = &unk_1000083A0;
  v9[4] = self;
  [(FROpenInNewsManager *)v8 openArticleWithURL:v4 completion:v9];
}

- (void)setConfigurationManager:(id)a3
{
}

- (NSURL)cachesDirectory
{
  return self->_cachesDirectory;
}

- (void)setCachesDirectory:(id)a3
{
}

- (NSURL)archiveFileURL
{
  return self->_archiveFileURL;
}

- (void)setArchiveFileURL:(id)a3
{
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_archiveFileURL, 0);
  objc_storeStrong((id *)&self->_cachesDirectory, 0);

  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end