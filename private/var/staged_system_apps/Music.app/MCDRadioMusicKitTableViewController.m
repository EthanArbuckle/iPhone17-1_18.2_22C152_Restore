@interface MCDRadioMusicKitTableViewController
- (MCDRadioMusicKitTableViewController)initWithLimitedUI:(BOOL)a3;
- (MSVTimer)showsUpdateTimer;
- (id)_contentManager;
- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5;
- (id)dateIntervalFormatter;
- (void)_resetTimerForShowsUpdate;
- (void)_updateRadioShowCells;
- (void)setHasLoadedStoreContent:(BOOL)a3;
- (void)setShowsUpdateTimer:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MCDRadioMusicKitTableViewController

- (MCDRadioMusicKitTableViewController)initWithLimitedUI:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCDRadioMusicKitTableViewController;
  v3 = [(MCDFuseTableViewController *)&v6 initWithLimitedUI:a3];
  v4 = v3;
  if (v3) {
    [(MCDRadioMusicKitTableViewController *)v3 setPlayActivityFeatureName:@"radio"];
  }
  return v4;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MCDRadioMusicKitTableViewController;
  [(MCDContentItemTableViewController *)&v7 viewDidLoad];
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = [(MCDFuseTableViewController *)self contentManager];
  [v3 setTableCellConfigurationBlock:&v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCDRadioMusicKitTableViewController;
  [(MCDFuseTableViewController *)&v4 viewWillAppear:a3];
  [(MCDRadioMusicKitTableViewController *)self _resetTimerForShowsUpdate];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCDRadioMusicKitTableViewController;
  [(MCDTableViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(MCDRadioMusicKitTableViewController *)self showsUpdateTimer];
  [v4 invalidate];

  [(MCDRadioMusicKitTableViewController *)self setShowsUpdateTimer:0];
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if ([v11 hasLoadedValueForKey:MPModelStoreBrowseSectionRelationshipRadioStation])
  {
    v12 = 0;
    goto LABEL_33;
  }
  v13 = [v11 loadAdditionalContentURL];
  if (v13)
  {
  }
  else if ([v11 sectionType] == (id)8 || objc_msgSend(v11, "sectionType") == (id)11)
  {
    v12 = [[MCDRadioMusicKitTableViewController alloc] initWithLimitedUI:[(MCDTableViewController *)self limitedUI]];
    v25 = objc_opt_new();
    v26 = [v8 contentResults];
    v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      v29 = [v8 lastReceivedResponse];
      uint64_t v30 = [v29 results];

      id v28 = (id)v30;
    }

    id v31 = [v28 numberOfSections];
    v41 = v28;
    if ((uint64_t)v31 <= (uint64_t)[v10 section])
    {
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x2020000000;
      v37 = (void (*)(void))off_1010D6C30;
      v50 = off_1010D6C30;
      if (!off_1010D6C30)
      {
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100087D10;
        v46[3] = &unk_100FC34A0;
        v46[4] = &v47;
        sub_100087D10((uint64_t)v46);
        v37 = (void (*)(void))v48[3];
      }
      _Block_object_dispose(&v47, 8);
      if (!v37)
      {
        sub_100D691B8();
        __break(1u);
      }
      v32 = v37();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_100D691DC(v10, (uint64_t)v28, v32);
      }
    }
    else
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v32 = [v28 itemsInSectionAtIndex:[v10 section]];
      id v33 = [v32 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v43;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v43 != v34) {
              objc_enumerationMutation(v32);
            }
            uint64_t v36 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            [v25 appendSection:v36];
            [v25 appendItem:v36];
          }
          id v33 = [v32 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v33);
      }
    }

    [(MCDContentItemTableViewController *)v12 setContentResults:v25];
    goto LABEL_32;
  }
  v12 = [[MCDContentItemMusicKitTableViewController alloc] initWithSectionItem:v11 limitedUI:[(MCDTableViewController *)self limitedUI] radioDomain:1];
  v14 = [v11 loadAdditionalContentURL];

  if (!v14)
  {
    v15 = objc_opt_new();
    [v15 appendSection:v11];
    v16 = [v8 contentResults];

    if (v16)
    {
      v17 = [v8 contentResults];
      id v18 = [v17 firstSection];
      BOOL v19 = v18 == v11;

      v20 = [v8 contentResults];
      v21 = v20;
      if (v19)
      {
        v23 = [v20 itemsInSectionAtIndex:[v10 row]];
        [v15 appendItems:v23];
      }
      else
      {
        v22 = [v20 itemsInSectionAtIndex:0];

        v23 = objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
        v24 = [v23 itemsInSectionAtIndex:0];
        [v15 appendItems:v24];

        v21 = v22;
      }
    }
    else
    {
      v21 = [v8 lastReceivedResponse];
      v23 = [v21 results];
      v38 = [v23 itemsInSectionAtIndex:[v10 section]];
      [v15 appendItems:v38];
    }
    [(MCDContentItemTableViewController *)v12 setContentResults:v15];
  }
LABEL_32:
  v39 = [v11 title];
  [(MCDRadioMusicKitTableViewController *)v12 setTitle:v39];

LABEL_33:

  return v12;
}

- (id)_contentManager
{
  v3 = [MCDRadioMusicKitContentManager alloc];
  objc_super v4 = objc_opt_new();
  objc_super v5 = [(MCDFuseTableViewController *)self playbackManager];
  BOOL v6 = [(MCDTableViewController *)self limitedUI];
  objc_super v7 = [(MCDContentItemTableViewController *)self contentResults];
  id v8 = [(MCDFuseContentManager *)v3 initWithDataSource:v4 delegate:self viewController:self playbackManager:v5 limitedUI:v6 contentResults:v7];

  return v8;
}

- (void)setHasLoadedStoreContent:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCDRadioMusicKitTableViewController;
  [(MCDFuseTableViewController *)&v4 setHasLoadedStoreContent:a3];
  [(MCDRadioMusicKitTableViewController *)self _resetTimerForShowsUpdate];
}

- (id)dateIntervalFormatter
{
  if (qword_1010D6C28 != -1) {
    dispatch_once(&qword_1010D6C28, &stru_100FC3600);
  }
  v2 = (void *)qword_1010D6C20;

  return v2;
}

- (void)_resetTimerForShowsUpdate
{
  v3 = [(MCDRadioMusicKitTableViewController *)self showsUpdateTimer];
  [v3 invalidate];

  if ([(MCDFuseTableViewController *)self hasLoadedStoreContent])
  {
    objc_super v4 = [(MCDRadioMusicKitTableViewController *)self _radioContentManager];
    objc_super v5 = [v4 nextUpcomingShowStartTime];

    if (v5)
    {
      objc_initWeak(&location, self);
      [v5 timeIntervalSinceNow];
      double v7 = v6;
      id v8 = &_dispatch_main_q;
      id v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      v12 = sub_100087C14;
      v13 = &unk_100FC3628;
      objc_copyWeak(&v14, &location);
      id v9 = +[MSVTimer timerWithInterval:&_dispatch_main_q queue:&v10 block:v7];
      -[MCDRadioMusicKitTableViewController setShowsUpdateTimer:](self, "setShowsUpdateTimer:", v9, v10, v11, v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_updateRadioShowCells
{
  id v5 = [(MCDRadioMusicKitTableViewController *)self tableView];
  v3 = [(MCDRadioMusicKitTableViewController *)self tableView];
  objc_super v4 = [v3 indexPathsForVisibleRows];
  [v5 reloadRowsAtIndexPaths:v4 withRowAnimation:100];
}

- (MSVTimer)showsUpdateTimer
{
  return self->_showsUpdateTimer;
}

- (void)setShowsUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end