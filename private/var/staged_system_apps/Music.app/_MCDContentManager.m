@interface _MCDContentManager
- (BOOL)itemIsPlayable:(id)a3;
- (BOOL)limitedUI;
- (BOOL)showFavoriteContent;
- (BOOL)showLocalContent;
- (BOOL)showShuffleAll;
- (BOOL)showSiriCellInLimitedUI;
- (BOOL)showsMediaCell;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (Class)tableCellClass;
- (MCDContentManagerDataSource)dataSource;
- (MCDContentManagerDelegate)delegate;
- (MCDPlayableProvider)playbackManager;
- (MPModelResponse)lastReceivedResponse;
- (NSOperationQueue)operationQueue;
- (SiriDirectActionSource)siriDirectActionSource;
- (UITableView)tableView;
- (UIViewController)viewController;
- (_MCDContentManager)initWithDataSource:(id)a3 delegate:(id)a4;
- (_MCDContentManager)initWithDataSource:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5 delegate:(id)a6 playbackManager:(id)a7;
- (_MCDContentManager)initWithDataSource:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5 delegate:(id)a6 viewController:(id)a7 playbackManager:(id)a8 shouldPerformRequestImmediately:(BOOL)a9;
- (double)_heightForHeaderView;
- (double)_tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_modelRequest;
- (id)_operationForRequest:(id)a3;
- (id)_textForHeaderView;
- (id)itemAtIndexPath:(id)a3;
- (id)itemsInSectionAtIndex:(int64_t)a3;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableCellConfigurationBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)_initiatePlaybackForItem:(id)a3 shuffled:(BOOL)a4;
- (void)_performRequest;
- (void)_processResponse:(id)a3 error:(id)a4;
- (void)_setupOperationQueue;
- (void)dealloc;
- (void)modelResponseDidInvalidate:(id)a3;
- (void)performRequest:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastReceivedResponse:(id)a3;
- (void)setLimitedUI:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
- (void)setShowFavoriteContent:(BOOL)a3;
- (void)setShowLocalContent:(BOOL)a3;
- (void)setShowShuffleAll:(BOOL)a3;
- (void)setShowSiriCellInLimitedUI:(BOOL)a3;
- (void)setShowsMediaCell:(BOOL)a3;
- (void)setSiriDirectActionSource:(id)a3;
- (void)setTableCellClass:(Class)a3;
- (void)setTableCellConfigurationBlock:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
@end

@implementation _MCDContentManager

- (_MCDContentManager)initWithDataSource:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5 delegate:(id)a6 viewController:(id)a7 playbackManager:(id)a8 shouldPerformRequestImmediately:(BOOL)a9
{
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_MCDContentManager;
  v19 = [(_MCDContentManager *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_dataSource, v15);
    objc_storeWeak((id *)&v20->_delegate, v16);
    v21 = objc_opt_class();
    objc_storeWeak((id *)&v20->_tableCellClass, v21);
    v20->_limitedUI = a4;
    v20->_showLocalContent = v12;
    v20->_showFavoriteContent = 0;
    objc_storeStrong((id *)&v20->_playbackManager, a8);
    [(MCDPlayableProvider *)v20->_playbackManager setLocalContentOnly:v12];
    [(MCDPlayableProvider *)v20->_playbackManager setFavoriteContentOnly:0];
    *(_WORD *)&v20->_showSiriCellInLimitedUI = 0;
    v20->_showsMediaCell = 0;
    objc_storeWeak((id *)&v20->_viewController, v17);
    v22 = (SiriDirectActionSource *)[objc_alloc((Class)SiriDirectActionSource) initWithDelegate:0];
    siriDirectActionSource = v20->_siriDirectActionSource;
    v20->_siriDirectActionSource = v22;

    [(_MCDContentManager *)v20 _setupOperationQueue];
    if (a9) {
      [(_MCDContentManager *)v20 _performRequest];
    }
  }

  return v20;
}

- (_MCDContentManager)initWithDataSource:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5 delegate:(id)a6 playbackManager:(id)a7
{
  LOBYTE(v8) = 1;
  return [(_MCDContentManager *)self initWithDataSource:a3 limitedUI:a4 showLocalContent:a5 delegate:a6 viewController:0 playbackManager:a7 shouldPerformRequestImmediately:v8];
}

- (_MCDContentManager)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MCDContentManager;
  uint64_t v8 = [(_MCDContentManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    [(_MCDContentManager *)v9 _setupOperationQueue];
    [(_MCDContentManager *)v9 _performRequest];
  }

  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(_MCDContentManager *)self siriDirectActionSource];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)_MCDContentManager;
  [(_MCDContentManager *)&v5 dealloc];
}

- (void)_setupOperationQueue
{
  v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  operationQueue = self->_operationQueue;
  self->_operationQueue = v3;

  [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:4];
  [(NSOperationQueue *)self->_operationQueue setQualityOfService:25];
  objc_super v5 = self->_operationQueue;

  [(NSOperationQueue *)v5 setName:@"com.apple.MusicCarDisplayUI.MCDContentManager.operationQueue"];
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_MCDContentManager *)self lastReceivedResponse];
  id v6 = [v5 results];
  id v7 = [v6 itemAtIndexPath:v4];

  return v7;
}

- (id)itemsInSectionAtIndex:(int64_t)a3
{
  id v4 = [(_MCDContentManager *)self lastReceivedResponse];
  objc_super v5 = [v4 results];
  id v6 = [v5 itemsInSectionAtIndex:a3];

  return v6;
}

- (BOOL)itemIsPlayable:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 song];

    id v4 = (id)v5;
  }
  if ([(_MCDContentManager *)self limitedUI]) {
    goto LABEL_8;
  }
  id v6 = [(_MCDContentManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_8;
  }
  id v7 = [(_MCDContentManager *)self delegate];
  unsigned __int8 v8 = [v7 contentManager:self canDrillIntoItem:v4];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    BOOL v9 = +[CarPlayPlayabilityStatusService isModelObjectPlayable:v4];
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (void)setLimitedUI:(BOOL)a3
{
  if (self->_limitedUI != a3)
  {
    BOOL v3 = a3;
    self->_limitedUI = a3;
    uint64_t v5 = [(_MCDContentManager *)self dataSource];
    [v5 setLimitedUI:v3];

    [(_MCDContentManager *)self setLastReceivedResponse:0];
    [(_MCDContentManager *)self _performRequest];
  }
}

- (void)setShowSiriCellInLimitedUI:(BOOL)a3
{
  if (self->_showSiriCellInLimitedUI != a3)
  {
    self->_showSiriCellInLimitedUI = a3;
    id v3 = [(_MCDContentManager *)self tableView];
    [v3 reloadData];
  }
}

- (void)setShowShuffleAll:(BOOL)a3
{
  if (self->_showShuffleAll != a3)
  {
    self->_showShuffleAll = a3;
    id v3 = [(_MCDContentManager *)self tableView];
    [v3 reloadData];
  }
}

- (void)setShowsMediaCell:(BOOL)a3
{
  if (self->_showsMediaCell != a3)
  {
    self->_showsMediaCell = a3;
    id v3 = [(_MCDContentManager *)self tableView];
    [v3 reloadData];
  }
}

- (void)modelResponseDidInvalidate:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(_MCDContentManager *)self lastReceivedResponse];
  unsigned int v5 = [v7 isEqual:v4];

  if (v5)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:MPModelResponseDidInvalidateNotification object:0];

    [(_MCDContentManager *)self _performRequest];
  }
}

- (void)setTableView:(id)a3
{
  id v10 = a3;
  objc_storeWeak((id *)&self->_tableView, v10);
  if (v10)
  {
    id v4 = [(_MCDContentManager *)self tableCellClass];
    unsigned int v5 = NSStringFromClass([(_MCDContentManager *)self tableCellClass]);
    [v10 registerClass:v4 forCellReuseIdentifier:v5];

    uint64_t v6 = objc_opt_class();
    id v7 = +[_MCDReusableCell reuseIdentifier];
    [v10 registerClass:v6 forCellReuseIdentifier:v7];

    uint64_t v8 = objc_opt_class();
    BOOL v9 = +[_MCDReusableCell reuseIdentifier];
    [v10 registerClass:v8 forCellReuseIdentifier:v9];

    [v10 setRowHeight:UITableViewAutomaticDimension];
    [v10 setEstimatedRowHeight:UITableViewAutomaticDimension];
    [v10 setDataSource:self];
    [v10 setDelegate:self];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(_MCDContentManager *)self lastReceivedResponse];
  id v4 = [v3 results];
  id v5 = [v4 numberOfSections];

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6 = [(_MCDContentManager *)self lastReceivedResponse];
  id v7 = [v6 results];
  id v8 = [v7 numberOfSections];

  if ((uint64_t)v8 <= a4) {
    return 0;
  }
  BOOL v9 = [(_MCDContentManager *)self lastReceivedResponse];
  id v10 = [v9 results];
  int64_t v11 = (int64_t)[v10 numberOfItemsInSection:a4];

  if (!a4)
  {
    unsigned int v12 = [(_MCDContentManager *)self showShuffleAll];
    if (v11 > 0) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    v11 += v13;
  }
  unsigned int v14 = [(_MCDContentManager *)self limitedUI];
  int64_t v15 = 12;
  if (v11 < 12) {
    int64_t v15 = v11;
  }
  if (v14) {
    return v15;
  }
  else {
    return v11;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(objc_class *)[(_MCDContentManager *)self tableCellClass] cellForTableView:v6 indexPath:v7];
  if ([(_MCDContentManager *)self showSiriCellInLimitedUI]
    && [(_MCDContentManager *)self limitedUI]
    && [v7 row] == (id)11)
  {
    id v9 = +[_MCDReusableCell cellForTableView:v6 indexPath:v7];
    goto LABEL_17;
  }
  if (!-[_MCDContentManager showShuffleAll](self, "showShuffleAll") || [v7 section]) {
    goto LABEL_9;
  }
  if ([v7 row])
  {
    uint64_t v10 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v7 row] - 1, [v7 section]);

    id v7 = (id)v10;
LABEL_9:
    int64_t v11 = [(_MCDContentManager *)self itemAtIndexPath:v7];
    unsigned int v12 = [(_MCDContentManager *)self tableCellConfigurationBlock];

    if (v12)
    {
      uint64_t v13 = [(_MCDContentManager *)self tableCellConfigurationBlock];
      ((void (**)(void, void *, void, void *, id, id))v13)[2](v13, v8, 0, v11, v6, v7);
    }
    [v8 setAccessoryType:0];
    if (![(_MCDContentManager *)self limitedUI])
    {
      unsigned int v14 = [(_MCDContentManager *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        int64_t v15 = [(_MCDContentManager *)self delegate];
        unsigned int v16 = [v15 contentManager:self canDrillIntoItem:v11];

        if (v16) {
          [v8 setAccessoryType:1];
        }
      }
      else
      {
      }
    }
    id v9 = v8;

    goto LABEL_17;
  }
  id v9 = +[_MCDReusableCell cellForTableView:v6 indexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 sizeForArtwork];
    [v9 setSizeForArtwork:];
  }
LABEL_17:

  return v9;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v4 = [(_MCDContentManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_MCDContentManager *)self delegate];
    id v7 = [v6 sectionIndexTitlesForContentManager:self];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a4;
  id v8 = [(_MCDContentManager *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(_MCDContentManager *)self delegate];
    a5 = (int64_t)[v10 sectionForSectionIndexTitle:v7 atIndex:a5 contentManager:self];
  }
  return a5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 copy];
  if ([(_MCDContentManager *)self showSiriCellInLimitedUI]
    && [(_MCDContentManager *)self limitedUI]
    && [v7 row] == (id)11)
  {
    char v9 = [(_MCDContentManager *)self tableView];
    [v9 deselectRowAtIndexPath:v7 animated:1];

    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v10 = (void *)qword_1010D6F48;
    uint64_t v33 = qword_1010D6F48;
    if (!qword_1010D6F48)
    {
      int64_t v11 = (void *)sub_100029E70();
      v31[3] = (uint64_t)dlsym(v11, "MCDMusicBundleIdentifier");
      qword_1010D6F48 = v31[3];
      uint64_t v10 = (void *)v31[3];
    }
    _Block_object_dispose(&v30, 8);
    if (!v10)
    {
      v29 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v30, 8);
      _Unwind_Resume(v29);
    }
    unsigned int v12 = +[SiriDirectActionContext musicSearchDirectActionWithAppBundleId:*v10];
    uint64_t v13 = [(_MCDContentManager *)self siriDirectActionSource];
    [v13 activateWithContext:v12 completion:&stru_100FC3D50];
    goto LABEL_18;
  }
  if (-[_MCDContentManager showShuffleAll](self, "showShuffleAll") && ![v7 section])
  {
    if (![v7 row])
    {
      v27 = [(_MCDContentManager *)self delegate];
      char v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) == 0)
      {
        [(_MCDContentManager *)self _initiatePlaybackForItem:0 shuffled:1];
        goto LABEL_31;
      }
      unsigned int v12 = [(_MCDContentManager *)self delegate];
      id v18 = [v12 shuffleContainerForContentManager:self];
      v23 = self;
      v24 = v18;
      uint64_t v25 = 1;
      goto LABEL_28;
    }
    uint64_t v14 = [NSIndexPath indexPathForRow:((char *)[v7 row] - 1) inSection:[v7 section]];

    id v8 = (id)v14;
  }
  unsigned int v12 = [(_MCDContentManager *)self itemAtIndexPath:v8];
  if (![(_MCDContentManager *)self limitedUI])
  {
    int64_t v15 = [(_MCDContentManager *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = [(_MCDContentManager *)self delegate];
      id v18 = [v17 contentManager:self viewControllerForItem:v12];
    }
    else
    {
      id v18 = 0;
    }
    v19 = [(_MCDContentManager *)self viewController];
    [v18 setPlayActivityFeatureNameSourceViewController:v19];

    if (v18)
    {
      v20 = [(_MCDContentManager *)self delegate];
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        v22 = [(_MCDContentManager *)self delegate];
        [v22 contentManager:self shouldDisplayViewController:v18];
      }
      goto LABEL_29;
    }
    if (![(_MCDContentManager *)self itemIsPlayable:v12])
    {
      v26 = [(_MCDContentManager *)self tableView];
      [v26 deselectRowAtIndexPath:v7 animated:1];

LABEL_29:
      goto LABEL_30;
    }
    v23 = self;
    v24 = v12;
    uint64_t v25 = 0;
LABEL_28:
    [(_MCDContentManager *)v23 _initiatePlaybackForItem:v24 shuffled:v25];
    goto LABEL_29;
  }
  if (![(_MCDContentManager *)self itemIsPlayable:v12])
  {
    uint64_t v13 = [(_MCDContentManager *)self tableView];
    [v13 deselectRowAtIndexPath:v7 animated:1];
LABEL_18:

    goto LABEL_30;
  }
  [(_MCDContentManager *)self _initiatePlaybackForItem:v12 shuffled:0];
LABEL_30:

LABEL_31:
}

- (double)_tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if ([(_MCDContentManager *)self limitedUI]
    || [(_MCDContentManager *)self showLocalContent])
  {
    char v5 = [(_MCDContentManager *)self _textForHeaderView];
    double v6 = 27.0;
    if (!v5)
    {
      [(_MCDContentManager *)self _heightForHeaderView];
      double v6 = v7;
    }

    return v6;
  }
  else
  {
    [(_MCDContentManager *)self _heightForHeaderView];
  }
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  [(_MCDContentManager *)self _tableView:a3 heightForHeaderInSection:a4];
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  [(_MCDContentManager *)self _tableView:a3 heightForHeaderInSection:a4];
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  char v5 = [(_MCDContentManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(_MCDContentManager *)self delegate];
    id v8 = [v7 viewForHeaderViewInContentManager:self];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  char v9 = [(_MCDContentManager *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0
    && (uint64_t)[v7 numberOfSections] <= 1
    && ([(_MCDContentManager *)self limitedUI]
     || [(_MCDContentManager *)self showLocalContent]))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v8;
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x2020000000;
      unsigned int v12 = (void (*)(id))off_1010D6F60;
      v20 = off_1010D6F60;
      if (!off_1010D6F60)
      {
        uint64_t v13 = (void *)sub_100029E70();
        v18[3] = (uint64_t)dlsym(v13, "MCDSetupTableHeaderView");
        off_1010D6F60 = (_UNKNOWN *)v18[3];
        unsigned int v12 = (void (*)(id))v18[3];
      }
      _Block_object_dispose(&v17, 8);
      if (!v12)
      {
        char v16 = (_Unwind_Exception *)sub_100D691B8();
        _Block_object_dispose(&v17, 8);
        _Unwind_Resume(v16);
      }
      v12(v11);

      uint64_t v14 = [(_MCDContentManager *)self _textForHeaderView];
      int64_t v15 = [v11 textLabel];
      [v15 setText:v14];
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 scrollViewDidScroll:v8];
  }
}

- (void)_initiatePlaybackForItem:(id)a3 shuffled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    id v8 = (void (*)(id))off_1010D6F68;
    v22 = off_1010D6F68;
    if (!off_1010D6F68)
    {
      char v9 = (void *)sub_100029E70();
      v20[3] = (uint64_t)dlsym(v9, "MCDMPModelObjectForGenericObject");
      off_1010D6F68 = (_UNKNOWN *)v20[3];
      id v8 = (void (*)(id))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v8)
    {
      id v18 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v19, 8);
      _Unwind_Resume(v18);
    }
    v8(v7);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v6
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v10 = [(_MCDContentManager *)self dataSource];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      unsigned int v12 = [(_MCDContentManager *)self dataSource];
      id v13 = [v12 forceScopingToResponseResults];

      if (!v6) {
        goto LABEL_14;
      }
    }
    else
    {
      id v13 = 0;
      if (!v6) {
        goto LABEL_14;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v14 = [(_MCDContentManager *)self playbackManager];
      int64_t v15 = [(_MCDContentManager *)self lastReceivedResponse];
      char v16 = [(_MCDContentManager *)self viewController];
      uint64_t v17 = [v16 combinedPlayActivityFeatureName];
      [v14 initiatePlaybackForPlaylistEntry:v6 lastResponse:v15 shuffled:v4 forceScopingToResponseResults:v13 playActivityFeatureName:v17];
      goto LABEL_24;
    }
LABEL_14:
    uint64_t v14 = [(_MCDContentManager *)self playbackManager];
    int64_t v15 = [(_MCDContentManager *)self lastReceivedResponse];
    char v16 = [(_MCDContentManager *)self viewController];
    uint64_t v17 = [v16 combinedPlayActivityFeatureName];
    [v14 initiatePlaybackForSong:v6 lastResponse:v15 shuffled:v4 forceScopingToResponseResults:v13 playActivityFeatureName:v17];
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [(_MCDContentManager *)self playbackManager];
    int64_t v15 = [(_MCDContentManager *)self lastReceivedResponse];
    char v16 = [(_MCDContentManager *)self viewController];
    uint64_t v17 = [v16 combinedPlayActivityFeatureName];
    [v14 initiatePlaybackForPlaylist:v6 lastResponse:v15 shuffled:v4 playActivityFeatureName:v17];
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [(_MCDContentManager *)self playbackManager];
    int64_t v15 = [(_MCDContentManager *)self lastReceivedResponse];
    char v16 = [(_MCDContentManager *)self viewController];
    uint64_t v17 = [v16 combinedPlayActivityFeatureName];
    [v14 initiatePlaybackForGenre:v6 lastResponse:v15 shuffled:v4 playActivityFeatureName:v17];
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [(_MCDContentManager *)self playbackManager];
    int64_t v15 = [(_MCDContentManager *)self lastReceivedResponse];
    char v16 = [(_MCDContentManager *)self viewController];
    uint64_t v17 = [v16 combinedPlayActivityFeatureName];
    [v14 initiatePlaybackForAlbum:v6 lastResponse:v15 shuffled:v4 playActivityFeatureName:v17];
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [(_MCDContentManager *)self playbackManager];
    int64_t v15 = [(_MCDContentManager *)self lastReceivedResponse];
    char v16 = [(_MCDContentManager *)self viewController];
    uint64_t v17 = [v16 combinedPlayActivityFeatureName];
    [v14 initiatePlaybackForPerson:v6 lastResponse:v15 shuffled:v4 playActivityFeatureName:v17];
    goto LABEL_24;
  }
LABEL_25:
}

- (double)_heightForHeaderView
{
  id v3 = [(_MCDContentManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0.0;
  }
  char v5 = [(_MCDContentManager *)self delegate];
  [v5 heightForHeaderViewInContentManager:self];
  double v7 = v6;

  return v7;
}

- (id)_textForHeaderView
{
  id v3 = [(_MCDContentManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    double v6 = 0;
    goto LABEL_5;
  }
  char v4 = [(_MCDContentManager *)self tableView];
  id v5 = [v4 numberOfSections];

  if (v5 == (id)1)
  {
    id v3 = [(_MCDContentManager *)self delegate];
    double v6 = [v3 textForHeaderViewInContentManager:self];
LABEL_5:

    goto LABEL_7;
  }
  double v6 = 0;
LABEL_7:

  return v6;
}

- (id)_modelRequest
{
  return 0;
}

- (void)_performRequest
{
  id v3 = [(_MCDContentManager *)self lastReceivedResponse];

  if (v3)
  {
    char v4 = [(_MCDContentManager *)self lastReceivedResponse];
    id v5 = [v4 request];
  }
  else
  {
    id v5 = [(_MCDContentManager *)self _modelRequest];
  }
  double v6 = [(_MCDContentManager *)self _operationForRequest:v5];
  double v7 = sub_1000A3AC4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    if (v6) {
      int v8 = 89;
    }
    else {
      int v8 = 78;
    }
    id v13 = self;
    __int16 v14 = 2112;
    int64_t v15 = v5;
    __int16 v16 = 1024;
    int v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Performing request: %@, as operation: %c", buf, 0x1Cu);
  }

  if (v6)
  {
    char v9 = [(_MCDContentManager *)self operationQueue];
    [v9 addOperation:v6];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A4744;
    v10[3] = &unk_100FC3D78;
    objc_copyWeak(&v11, (id *)buf);
    [v5 performWithResponseHandler:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

- (void)performRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(_MCDContentManager *)self lastReceivedResponse];

  if (v5)
  {
    double v6 = [(_MCDContentManager *)self lastReceivedResponse];
    id v7 = [v6 request];
  }
  else
  {
    id v7 = [(_MCDContentManager *)self _modelRequest];
  }
  [v7 performWithResponseHandler:v4];
}

- (id)_operationForRequest:(id)a3
{
  return 0;
}

- (void)_processResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 request];
  char v9 = sub_1000A3AC4();
  char v10 = v9;
  if (!v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = self;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Processing response of request: %@", buf, 0x16u);
    }

    id v13 = (id *)v15;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A4AB8;
    v15[3] = &unk_100FC3BF0;
    v15[4] = self;
    __int16 v14 = v6;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100D695B4((uint64_t)self, (uint64_t)v8, v10);
  }

  id v11 = [(_MCDContentManager *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = (id *)v16;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A4A64;
    v16[3] = &unk_100FC3BF0;
    v16[4] = self;
    __int16 v14 = v7;
LABEL_9:
    v13[5] = v14;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (MCDContentManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MCDContentManagerDataSource *)WeakRetained;
}

- (MCDContentManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MCDContentManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MCDPlayableProvider)playbackManager
{
  return self->_playbackManager;
}

- (MPModelResponse)lastReceivedResponse
{
  return (MPModelResponse *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastReceivedResponse:(id)a3
{
}

- (Class)tableCellClass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableCellClass);

  return (Class)WeakRetained;
}

- (void)setTableCellClass:(Class)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (id)tableCellConfigurationBlock
{
  return self->_tableCellConfigurationBlock;
}

- (void)setTableCellConfigurationBlock:(id)a3
{
}

- (BOOL)limitedUI
{
  return self->_limitedUI;
}

- (BOOL)showSiriCellInLimitedUI
{
  return self->_showSiriCellInLimitedUI;
}

- (BOOL)showShuffleAll
{
  return self->_showShuffleAll;
}

- (BOOL)showsMediaCell
{
  return self->_showsMediaCell;
}

- (BOOL)showFavoriteContent
{
  return self->_showFavoriteContent;
}

- (void)setShowFavoriteContent:(BOOL)a3
{
  self->_showFavoriteContent = a3;
}

- (BOOL)showLocalContent
{
  return self->_showLocalContent;
}

- (void)setShowLocalContent:(BOOL)a3
{
  self->_showLocalContent = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (SiriDirectActionSource)siriDirectActionSource
{
  return self->_siriDirectActionSource;
}

- (void)setSiriDirectActionSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriDirectActionSource, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_tableCellConfigurationBlock, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_tableCellClass);
  objc_storeStrong((id *)&self->_lastReceivedResponse, 0);
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_destroyWeak((id *)&self->_viewController);
}

@end