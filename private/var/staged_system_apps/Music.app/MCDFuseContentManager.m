@interface MCDFuseContentManager
- (BOOL)limitedUI;
- (BOOL)offlineMode;
- (BOOL)tableView:(id)a3 shouldUpdateFocusInContext:(id)a4;
- (BOOL)wantsGridCellAtIndexPath:(id)a3;
- (BOOL)wantsTallCellAtIndexPath:(id)a3;
- (MCDFuseContentManager)initWithDataSource:(id)a3 delegate:(id)a4 viewController:(id)a5 playbackManager:(id)a6 limitedUI:(BOOL)a7;
- (MCDFuseContentManager)initWithDataSource:(id)a3 delegate:(id)a4 viewController:(id)a5 playbackManager:(id)a6 limitedUI:(BOOL)a7 contentResults:(id)a8;
- (MCDFuseContentManagerDataSource)dataSource;
- (MCDFuseContentManagerDelegate)delegate;
- (MCDStorePlaybackManager)playbackManager;
- (MPModelResponse)lastReceivedResponse;
- (MPSectionedCollection)contentResults;
- (MPWeakTimer)loadingTimer;
- (NSIndexPath)selectedIndexPath;
- (NSOperationQueue)operationQueue;
- (SiriDirectActionSource)siriDirectActionSource;
- (UITableView)tableView;
- (UIView)placeholderView;
- (UIViewController)viewController;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_modelRequest;
- (id)_queueName;
- (id)artworksWithTitlesAtIndexPath:(id)a3;
- (id)cellTitleAtIndexPath:(id)a3;
- (id)childrenOfItemAtIndexPath:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)prefixSections;
- (id)tableCellConfigurationBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)transformedResponse:(id)a3;
- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4;
- (int64_t)maximumNumberOfItemsForDisplay;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_initiatePlaybackForItem:(id)a3;
- (void)_invalidateLoadingTimer;
- (void)_networkConditionsDidChange:(id)a3;
- (void)_processResponse:(id)a3 error:(id)a4;
- (void)_replacePlaceholderViewWithView:(id)a3;
- (void)_updateViewForNetwork;
- (void)clearActivityIndicatorForSelectedIndexPath;
- (void)dealloc;
- (void)decorateRequest:(id)a3;
- (void)displayPlaceholderViewIfNeeded;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)modelResponseDidInvalidate:(id)a3;
- (void)performRequest;
- (void)setContentResults:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastReceivedResponse:(id)a3;
- (void)setLimitedUI:(BOOL)a3;
- (void)setLoadingTimer:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setPlaybackManager:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSiriDirectActionSource:(id)a3;
- (void)setTableCellConfigurationBlock:(id)a3;
- (void)setTableView:(id)a3;
- (void)setViewController:(id)a3;
- (void)showContentScreen;
- (void)showErrorScreen;
- (void)showLoadingScreen;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updatePlaceholderViewFrameIfNeeded;
@end

@implementation MCDFuseContentManager

- (id)prefixSections
{
  return &__NSArray0__struct;
}

- (id)transformedResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 results];
  id v6 = [v5 mutableCopy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = [(MCDFuseContentManager *)self prefixSections];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        [v6 insertSection:*(void *)(*((void *)&v15 + 1) + 8 * i) atIndex:(char *)i + v10];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      v10 += (uint64_t)i;
    }
    while (v9);
  }

  id v13 = [v6 copy];
  [v4 setResults:v13];

  return v4;
}

- (MCDFuseContentManager)initWithDataSource:(id)a3 delegate:(id)a4 viewController:(id)a5 playbackManager:(id)a6 limitedUI:(BOOL)a7
{
  return [(MCDFuseContentManager *)self initWithDataSource:a3 delegate:a4 viewController:a5 playbackManager:a6 limitedUI:a7 contentResults:0];
}

- (MCDFuseContentManager)initWithDataSource:(id)a3 delegate:(id)a4 viewController:(id)a5 playbackManager:(id)a6 limitedUI:(BOOL)a7 contentResults:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)MCDFuseContentManager;
  v20 = [(MCDFuseContentManager *)&v32 init];
  if (v20)
  {
    id v30 = v18;
    id v31 = v15;
    v21 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v20->_operationQueue;
    v20->_operationQueue = v21;

    [(NSOperationQueue *)v20->_operationQueue setMaxConcurrentOperationCount:4];
    [(NSOperationQueue *)v20->_operationQueue setQualityOfService:25];
    v23 = v20->_operationQueue;
    v24 = [(MCDFuseContentManager *)v20 _queueName];
    [(NSOperationQueue *)v23 setName:v24];

    objc_storeStrong((id *)&v20->_dataSource, a3);
    objc_storeWeak((id *)&v20->_delegate, v16);
    objc_storeWeak((id *)&v20->_viewController, v17);
    objc_storeStrong((id *)&v20->_playbackManager, a6);
    v20->_limitedUI = a7;
    objc_storeStrong((id *)&v20->_contentResults, a8);
    v25 = (SiriDirectActionSource *)[objc_alloc((Class)SiriDirectActionSource) initWithDelegate:0];
    siriDirectActionSource = v20->_siriDirectActionSource;
    v20->_siriDirectActionSource = v25;

    if (v20->_contentResults)
    {
      v27 = objc_opt_new();
      [v27 setLoadAdditionalContentURL:0];
      id v28 = [objc_alloc((Class)MPModelStoreBrowseResponse) initWithRequest:v27];
      [v28 setResults:v20->_contentResults];
      [(MCDFuseContentManager *)v20 _processResponse:v28 error:0];
    }
    else
    {
      [(MCDFuseContentManager *)v20 performRequest];
    }
    id v18 = v30;
    id v15 = v31;
  }

  return v20;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(MCDFuseContentManager *)self siriDirectActionSource];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)MCDFuseContentManager;
  [(MCDFuseContentManager *)&v5 dealloc];
}

- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4
{
  return 1;
}

- (void)decorateRequest:(id)a3
{
  id v16 = a3;
  id v4 = [v16 clientVersion];

  if (!v4) {
    [v16 setClientVersion:@"2.0"];
  }
  objc_super v5 = [(MCDFuseContentManager *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MCDFuseContentManager *)self dataSource];
    [v7 timeoutInterval];
    [v16 setTimeoutInterval:];
  }
  id v8 = [(MCDFuseContentManager *)self dataSource];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(MCDFuseContentManager *)self dataSource];
    uint64_t v11 = [v10 itemProperties];
    [v16 setItemProperties:v11];
  }
  v12 = [(MCDFuseContentManager *)self dataSource];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = [(MCDFuseContentManager *)self dataSource];
    id v15 = [v14 sectionProperties];
    [v16 setSectionProperties:v15];
  }
}

- (void)performRequest
{
  v3 = [(MCDFuseContentManager *)self contentResults];

  if (!v3)
  {
    id v4 = [(MCDFuseContentManager *)self _modelRequest];
    [(MCDFuseContentManager *)self decorateRequest:v4];
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = sub_10009B89C;
    v8[4] = sub_10009B8AC;
    char v9 = self;
    operationQueue = v9->_operationQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009B8B4;
    v7[3] = &unk_100FC3B10;
    v7[4] = v8;
    id v6 = [v4 newOperationWithResponseHandler:v7];
    [(NSOperationQueue *)operationQueue addOperation:v6];

    _Block_object_dispose(v8, 8);
  }
}

- (id)_queueName
{
  return &stru_101023248;
}

- (id)_modelRequest
{
  return 0;
}

- (void)_initiatePlaybackForItem:(id)a3
{
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MCDFuseContentManager *)self lastReceivedResponse];
  id v6 = [v5 results];
  id v7 = [v4 section];

  id v8 = [v6 sectionAtIndex:v7];

  return v8;
}

- (id)childrenOfItemAtIndexPath:(id)a3
{
  return 0;
}

- (id)artworksWithTitlesAtIndexPath:(id)a3
{
  return &__NSArray0__struct;
}

- (id)cellTitleAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)wantsTallCellAtIndexPath:(id)a3
{
  return 0;
}

- (int64_t)maximumNumberOfItemsForDisplay
{
  if ([(MCDFuseContentManager *)self limitedUI]) {
    return 12;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)_processResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_10009B89C;
  v15[4] = sub_10009B8AC;
  id v16 = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009BB1C;
  v10[3] = &unk_100FC3BC8;
  id v11 = v6;
  id v12 = v7;
  char v13 = v16;
  v14 = v15;
  id v8 = v7;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  _Block_object_dispose(v15, 8);
}

- (void)clearActivityIndicatorForSelectedIndexPath
{
  v3 = [(MCDFuseContentManager *)self selectedIndexPath];

  if (v3)
  {
    id v4 = [(MCDFuseContentManager *)self tableView];
    objc_super v5 = [(MCDFuseContentManager *)self selectedIndexPath];
    id v6 = [v4 cellForRowAtIndexPath:v5];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setLoading:0];
    }
  }
}

- (void)setLimitedUI:(BOOL)a3
{
  if (self->_limitedUI != a3)
  {
    self->_limitedUI = a3;
    id v3 = [(MCDFuseContentManager *)self tableView];
    [v3 reloadData];
  }
}

- (void)modelResponseDidInvalidate:(id)a3
{
  objc_super v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_10009BFA0;
  id v8 = &unk_100FC3BF0;
  id v9 = self;
  id v3 = a3;
  id v10 = v3;
  id v4 = objc_retainBlock(&v5);
  if (+[NSThread isMainThread]) {
    ((void (*)(void ***))v4[2])(v4);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6 = [(MCDFuseContentManager *)self lastReceivedResponse];
  id v7 = [v6 results];
  id v8 = [v7 sectionAtIndex:a4];

  if (v8 == @"siri_action_section")
  {
    int64_t v10 = 1;
  }
  else
  {
    id v9 = [(MCDFuseContentManager *)self lastReceivedResponse];
    int64_t v10 = [(MCDFuseContentManager *)self allowedNumberOfItemsForDisplayWithResponse:v9 inSection:a4];
  }
  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = [(MCDFuseContentManager *)self lastReceivedResponse];
  objc_super v5 = [v4 results];
  if (v5)
  {
    uint64_t v6 = [(MCDFuseContentManager *)self lastReceivedResponse];
    id v7 = [v6 results];
    id v8 = [v7 numberOfSections];
  }
  else
  {
    id v8 = 0;
  }

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v38 = a3;
  id v6 = a4;
  id v7 = [(MCDFuseContentManager *)self lastReceivedResponse];
  id v8 = [v7 results];
  [v8 sectionAtIndex:[v6 section]];
  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v39 == @"siri_action_section")
  {
    id v37 = +[_MCDReusableCell cellForTableView:v38 indexPath:v6];
  }
  else
  {
    id v9 = [(MCDFuseContentManager *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(MCDFuseContentManager *)self delegate];
      unsigned __int8 v12 = [v11 showRankedList];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
    v36 = [(MCDFuseContentManager *)self itemAtIndexPath:v6];
    if ([(MCDFuseContentManager *)self wantsGridCellAtIndexPath:v6])
    {
      id v37 = +[CPUIImageRowCell cellForTableView:v38];
      v34 = [(MCDFuseContentManager *)self childrenOfItemAtIndexPath:v6];
      char v13 = [(MCDFuseContentManager *)self artworksWithTitlesAtIndexPath:v6];
      v14 = objc_opt_new();
      id v15 = objc_opt_new();
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v16 = v13;
      id v17 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v48;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v48 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v21 = [v20 first];
            [v14 addObject:v21];

            v22 = [v20 second];
            [v15 addObject:v22];
          }
          id v17 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v17);
      }

      v23 = [(MCDFuseContentManager *)self cellTitleAtIndexPath:v6];
      objc_initWeak(&location, self);
      id v24 = [v14 copy];
      id v25 = [v15 copy];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10009C6D0;
      v43[3] = &unk_100FC3C18;
      objc_copyWeak(&v45, &location);
      id v35 = v34;
      id v44 = v35;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10009C740;
      v40[3] = &unk_100FC3950;
      objc_copyWeak(&v42, &location);
      id v41 = v6;
      LOBYTE(v33) = 1;
      v26 = +[CPUIImageRowCellConfiguration configurationWithText:v23 artworkCatalogs:v24 imageTitles:v25 selectGridItemBlock:v43 selectTitleBlock:v40 showActivityIndicator:0 enabled:v33];

      [v37 applyConfiguration:v26];
      objc_destroyWeak(&v42);

      objc_destroyWeak(&v45);
      objc_destroyWeak(&location);
    }
    else
    {
      if (v12)
      {
        v27 = off_100FBB6D8;
      }
      else
      {
        id v28 = [(MCDFuseContentManager *)self viewController];
        if ([(id)objc_opt_class() wantsTallCells])
        {

          v27 = &off_100FBB6E8;
        }
        else
        {
          unsigned int v29 = [(MCDFuseContentManager *)self wantsTallCellAtIndexPath:v6];

          v27 = off_100FBB6E0;
          if (v29) {
            v27 = &off_100FBB6E8;
          }
        }
      }
      id v37 = [(__objc2_class *)*v27 cellForTableView:v38 indexPath:v6];
      id v30 = [(MCDFuseContentManager *)self tableCellConfigurationBlock];

      if (v30)
      {
        id v31 = [(MCDFuseContentManager *)self tableCellConfigurationBlock];
        ((void (**)(void, id, __CFString *, void *, id, id))v31)[2](v31, v37, v39, v36, v38, v6);
      }
    }
  }

  return v37;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  objc_super v5 = [(MCDFuseContentManager *)self lastReceivedResponse];
  id v6 = [v5 results];
  id v7 = [v6 sectionAtIndex:a4];

  if (v7 == @"siri_action_section") {
    return @" ";
  }
  else {
    return 0;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MCDFuseContentManager *)self lastReceivedResponse];
  id v9 = [v8 results];
  [v9 sectionAtIndex:[v7 section]];
  char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v11 = [(MCDFuseContentManager *)self tableView];
  unsigned __int8 v12 = v11;
  if (v10 == @"siri_action_section")
  {
    [v11 deselectRowAtIndexPath:v7 animated:1];

    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2020000000;
    id v19 = (void *)qword_1010D6E78;
    uint64_t v30 = qword_1010D6E78;
    if (!qword_1010D6E78)
    {
      v20 = (void *)sub_100029970();
      v28[3] = (uint64_t)dlsym(v20, "MCDMusicBundleIdentifier");
      qword_1010D6E78 = v28[3];
      id v19 = (void *)v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (!v19)
    {
      v26 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v27, 8);
      _Unwind_Resume(v26);
    }
    char v13 = +[SiriDirectActionContext musicSearchDirectActionWithAppBundleId:*v19];
    v21 = [(MCDFuseContentManager *)self siriDirectActionSource];
    [v21 activateWithContext:v13 completion:&stru_100FC3C58];
  }
  else
  {
    char v13 = [v11 cellForRowAtIndexPath:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v13 setLoading:1];
    }
    v14 = [(MCDFuseContentManager *)self itemAtIndexPath:v7];
    [(MCDFuseContentManager *)self setSelectedIndexPath:v7];
    id v15 = [(MCDFuseContentManager *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = [(MCDFuseContentManager *)self delegate];
      uint64_t v18 = [v17 contentManager:self viewControllerForItem:v14 indexPath:v7];
    }
    else
    {
      uint64_t v18 = 0;
    }
    v22 = [(MCDFuseContentManager *)self viewController];
    [v18 setPlayActivityFeatureNameSourceViewController:v22];

    if (v18)
    {
      v23 = [(MCDFuseContentManager *)self delegate];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        id v25 = [(MCDFuseContentManager *)self delegate];
        [v25 contentManager:self shouldDisplayViewController:v18];
      }
    }
    else
    {
      [(MCDFuseContentManager *)self _initiatePlaybackForItem:v14];
    }
  }
}

- (BOOL)tableView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  id v5 = a4;
  if ([(MCDFuseContentManager *)self offlineMode])
  {
    id v6 = [v5 nextFocusedItem];
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v7 = 1;
  }

  return v7 & 1;
}

- (void)setTableView:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_tableView, v4);
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = +[_MCDReusableCell reuseIdentifier];
    [v4 registerClass:v5 forCellReuseIdentifier:v6];

    uint64_t v7 = objc_opt_class();
    id v8 = +[_MCDReusableCell reuseIdentifier];
    [v4 registerClass:v7 forCellReuseIdentifier:v8];

    uint64_t v9 = objc_opt_class();
    char v10 = +[_MCDReusableCell reuseIdentifier];
    [v4 registerClass:v9 forCellReuseIdentifier:v10];

    uint64_t v11 = objc_opt_class();
    unsigned __int8 v12 = +[_MCDReusableCell reuseIdentifier];
    [v4 registerClass:v11 forCellReuseIdentifier:v12];

    [v4 setRowHeight:UITableViewAutomaticDimension];
    [v4 setEstimatedRowHeight:UITableViewAutomaticDimension];
    [v4 setDataSource:self];
    [v4 setDelegate:self];
    char v13 = +[NSNotificationCenter defaultCenter];
    uint64_t v14 = MPNetworkObserverIsMusicCellularStreamingAllowedDidChangeNotification;
    id v15 = +[MPNetworkObserver sharedNetworkObserver];
    [v13 addObserver:self selector:"_networkConditionsDidChange:" name:v14 object:v15];

    char v16 = +[ICEnvironmentMonitor sharedMonitor];
    [v16 registerObserver:self];

    id v17 = [(MCDFuseContentManager *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v18 = [(MCDFuseContentManager *)self delegate];
      unsigned __int8 v19 = [v18 hasLoadedStoreContent];

      if (v19) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10009CFBC;
    v22[3] = &unk_100FC3628;
    objc_copyWeak(&v23, &location);
    v20 = +[MPWeakTimer timerWithInterval:0 repeats:v22 block:2.0];
    loadingTimer = self->_loadingTimer;
    self->_loadingTimer = v20;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
LABEL_7:
  }
}

- (void)showLoadingScreen
{
  id v3 = [(MCDFuseContentManager *)self contentResults];

  if (!v3)
  {
    id v4 = sub_10009BCA4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing loading view", v6, 2u);
    }

    [(MCDFuseContentManager *)self _invalidateLoadingTimer];
    uint64_t v5 = +[CarPlayInformationView loading];
    [(MCDFuseContentManager *)self _replacePlaceholderViewWithView:v5];
  }
}

- (void)showErrorScreen
{
  [(MCDFuseContentManager *)self _invalidateLoadingTimer];
  if ([(MCDFuseContentManager *)self offlineMode])
  {
    [(MCDFuseContentManager *)self _updateViewForNetwork];
  }
  else
  {
    id v3 = sub_10009BCA4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Showing error view", buf, 2u);
    }

    id v4 = sub_10009D25C();
    uint64_t v5 = [v4 localizedStringForKey:@"FUSE_TIMEOUT_TITLE" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    id v6 = sub_10009D25C();
    uint64_t v7 = [v6 localizedStringForKey:@"Try Again" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10009D368;
    v9[3] = &unk_100FC3900;
    v9[4] = self;
    id v8 = +[CarPlayInformationView errorWithTitle:v5 buttonText:v7 buttonAction:v9];

    [(MCDFuseContentManager *)self _replacePlaceholderViewWithView:v8];
  }
}

- (void)showContentScreen
{
  [(MCDFuseContentManager *)self _invalidateLoadingTimer];
  if ([(MCDFuseContentManager *)self offlineMode])
  {
    [(MCDFuseContentManager *)self _updateViewForNetwork];
  }
  else
  {
    id v3 = sub_10009BCA4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Showing content view", v5, 2u);
    }

    [(MCDFuseContentManager *)self _replacePlaceholderViewWithView:0];
    id v4 = [(MCDFuseContentManager *)self tableView];
    [v4 reloadData];
  }
}

- (void)displayPlaceholderViewIfNeeded
{
  id v3 = [(MCDFuseContentManager *)self placeholderView];

  if (v3)
  {
    id v4 = [(MCDFuseContentManager *)self placeholderView];
    [(MCDFuseContentManager *)self _replacePlaceholderViewWithView:v4];
  }
}

- (void)updatePlaceholderViewFrameIfNeeded
{
  id v3 = [(MCDFuseContentManager *)self placeholderView];
  id v4 = [v3 superview];

  if (v4)
  {
    id v23 = [(MCDFuseContentManager *)self tableView];
    [v23 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    char v13 = [(MCDFuseContentManager *)self tableView];
    [v13 safeAreaInsets];
    double v15 = v6 + v14;
    double v17 = v8 + v16;
    double v19 = v10 - (v14 + v18);
    double v21 = v12 - (v16 + v20);
    v22 = [(MCDFuseContentManager *)self placeholderView];
    [v22 setFrame:v15, v17, v19, v21];
  }
}

- (void)_replacePlaceholderViewWithView:(id)a3
{
  id v34 = a3;
  id v4 = [(MCDFuseContentManager *)self placeholderView];
  double v5 = [v4 superview];

  if (v5)
  {
    double v6 = [(MCDFuseContentManager *)self placeholderView];
    [v6 removeFromSuperview];
  }
  [(MCDFuseContentManager *)self setPlaceholderView:v34];
  double v7 = [(MCDFuseContentManager *)self placeholderView];
  double v8 = [(MCDFuseContentManager *)self tableView];
  [v8 setScrollEnabled:v7 == 0];

  double v9 = [(MCDFuseContentManager *)self placeholderView];
  double v10 = [(MCDFuseContentManager *)self tableView];
  [v10 setHidden:v9 != 0];

  double v11 = [(MCDFuseContentManager *)self placeholderView];

  if (v11)
  {
    double v12 = [(MCDFuseContentManager *)self tableView];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = [(MCDFuseContentManager *)self tableView];
    [v21 safeAreaInsets];
    double v23 = v14 + v22;
    double v25 = v16 + v24;
    double v27 = v18 - (v22 + v26);
    double v29 = v20 - (v24 + v28);

    uint64_t v30 = [(MCDFuseContentManager *)self placeholderView];
    [v30 setFrame:v23, v25, v27, v29];

    id v31 = [(MCDFuseContentManager *)self tableView];
    objc_super v32 = [v31 superview];
    uint64_t v33 = [(MCDFuseContentManager *)self placeholderView];
    [v32 addSubview:v33];
  }
}

- (void)_invalidateLoadingTimer
{
  [(MPWeakTimer *)self->_loadingTimer invalidate];
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = 0;
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
}

- (void)_networkConditionsDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D8A4;
  block[3] = &unk_100FC3900;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)offlineMode
{
  v2 = +[ICEnvironmentMonitor sharedMonitor];
  id v3 = [v2 networkType];

  if (!sub_10009D918((uint64_t)v3)) {
    return 1;
  }

  return sub_10009DA20((uint64_t)v3);
}

- (void)_updateViewForNetwork
{
  if ([(MCDFuseContentManager *)self offlineMode])
  {
    id v3 = +[ICEnvironmentMonitor sharedMonitor];
    id v4 = [v3 networkType];

    if (sub_10009D918((uint64_t)v4))
    {
      if (sub_10009DA20((uint64_t)v4))
      {
        double v5 = sub_10009D25C();
        double v6 = [v5 localizedStringForKey:@"FUSE_CELLULAR_DATA_RESTRICTED_TITLE" value:&stru_101023248 table:@"MusicCarDisplayUI"];
        double v7 = +[NSBundle mainBundle];
        double v8 = [v7 localizedStringForKey:@"Turn On" value:&stru_101023248 table:0];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10009DE34;
        v21[3] = &unk_100FC3900;
        v21[4] = self;
        double v9 = +[CarPlayInformationView errorWithTitle:v6 buttonText:v8 buttonAction:v21];

        double v10 = sub_10009BCA4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Showing cellular data restricted view", buf, 2u);
        }

        [(MCDFuseContentManager *)self _replacePlaceholderViewWithView:v9];
      }
    }
    else
    {
      unsigned int v12 = +[DeviceCapabilities hasWAPICapability];
      double v13 = +[NSBundle mainBundle];
      double v14 = v13;
      if (v12) {
        CFStringRef v15 = @"Turn off Airplane Mode or connect to WLAN.";
      }
      else {
        CFStringRef v15 = @"Turn off Airplane Mode or connect to Wi-Fi.";
      }
      double v16 = [v13 localizedStringForKey:v15 value:&stru_101023248 table:0];

      double v17 = sub_10009BCA4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Showing offline view", buf, 2u);
      }

      double v18 = +[NSBundle mainBundle];
      double v19 = [v18 localizedStringForKey:@"You’re Offline" value:&stru_101023248 table:0];
      double v20 = +[CarPlayInformationView noContentWithTitle:v19 subtitle:v16 buttonText:0 buttonAction:0];

      [(MCDFuseContentManager *)self _replacePlaceholderViewWithView:v20];
    }
  }
  else
  {
    double v11 = [(MCDFuseContentManager *)self placeholderView];

    if (v11) {
      [(MCDFuseContentManager *)self showLoadingScreen];
    }
    [(MCDFuseContentManager *)self performRequest];
  }
}

- (MPModelResponse)lastReceivedResponse
{
  return self->_lastReceivedResponse;
}

- (void)setLastReceivedResponse:(id)a3
{
}

- (MPSectionedCollection)contentResults
{
  return self->_contentResults;
}

- (void)setContentResults:(id)a3
{
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (MCDFuseContentManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (MCDFuseContentManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MCDFuseContentManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)limitedUI
{
  return self->_limitedUI;
}

- (id)tableCellConfigurationBlock
{
  return self->_tableCellConfigurationBlock;
}

- (void)setTableCellConfigurationBlock:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
}

- (MPWeakTimer)loadingTimer
{
  return self->_loadingTimer;
}

- (void)setLoadingTimer:(id)a3
{
}

- (SiriDirectActionSource)siriDirectActionSource
{
  return self->_siriDirectActionSource;
}

- (void)setSiriDirectActionSource:(id)a3
{
}

- (MCDStorePlaybackManager)playbackManager
{
  return self->_playbackManager;
}

- (void)setPlaybackManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_storeStrong((id *)&self->_siriDirectActionSource, 0);
  objc_storeStrong((id *)&self->_loadingTimer, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong(&self->_tableCellConfigurationBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_contentResults, 0);

  objc_storeStrong((id *)&self->_lastReceivedResponse, 0);
}

@end