@interface MCDBrowseTableViewController
- (MCDBrowseTableViewController)initWithLimitedUI:(BOOL)a3;
- (MPSectionedCollection)contentResults;
- (id)_contentManager;
- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5;
- (void)setContentResults:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDBrowseTableViewController

- (MCDBrowseTableViewController)initWithLimitedUI:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCDBrowseTableViewController;
  v3 = [(MCDFuseTableViewController *)&v6 initWithLimitedUI:a3];
  v4 = v3;
  if (v3) {
    [(MCDBrowseTableViewController *)v3 setPlayActivityFeatureName:@"new"];
  }
  return v4;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MCDBrowseTableViewController;
  [(MCDFuseTableViewController *)&v7 viewDidLoad];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v3 = (void (*)(void))off_1010D6CB0;
  v16 = off_1010D6CB0;
  if (!off_1010D6CB0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    v10 = sub_10008C468;
    v11 = &unk_100FC34A0;
    v12 = &v13;
    sub_10008C468((uint64_t)buf);
    v3 = (void (*)(void))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v3)
  {
    objc_super v6 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v6);
  }
  v4 = v3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loading view for Browse", buf, 2u);
  }

  v5 = [(MCDFuseTableViewController *)self contentManager];
  [v5 setTableCellConfigurationBlock:&stru_100FC37B0];
}

- (id)_contentManager
{
  v3 = [MCDBrowseContentManager alloc];
  v4 = objc_opt_new();
  v5 = [(MCDFuseTableViewController *)self playbackManager];
  BOOL v6 = [(MCDTableViewController *)self limitedUI];
  objc_super v7 = [(MCDBrowseTableViewController *)self contentResults];
  v8 = [(MCDFuseContentManager *)v3 initWithDataSource:v4 delegate:self viewController:self playbackManager:v5 limitedUI:v6 contentResults:v7];

  return v8;
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = (unint64_t)[v10 sectionType] - 1;
  BOOL v14 = (v12 & 7) == 0 && v12 < 3;
  uint64_t v15 = [v10 loadAdditionalContentURL];
  if (v15)
  {

    goto LABEL_15;
  }
  if ([v10 sectionType] != (id)8)
  {
LABEL_15:
    v17 = [[MCDContentItemTableViewController alloc] initWithSectionItem:v10 limitedUI:[(MCDTableViewController *)self limitedUI] showRankedList:v12 < 3 queueListForPlayback:v14 radioDomain:0];
    v21 = [v10 loadAdditionalContentURL];

    if (v21)
    {
      v16 = 0;
    }
    else
    {
      v22 = objc_opt_new();
      [v22 appendSection:v10];
      v23 = [v9 contentResults];

      if (v23)
      {
        v24 = [v9 contentResults];
        id v25 = [v24 firstSection];

        v26 = [v9 contentResults];
        v27 = [v26 itemsInSectionAtIndex:[v11 row]];
        if (v25 == v10)
        {
          [v22 appendItems:v27];
          v28 = v27;
        }
        else
        {

          v28 = [v27 objectAtIndexedSubscript:[v11 row]];
          v29 = [v28 itemsInSectionAtIndex:0];
          [v22 appendItems:v29];

          v26 = v27;
        }
      }
      else
      {
        v26 = [v9 lastReceivedResponse];
        v28 = [v26 results];
        v30 = [v28 itemsInSectionAtIndex:[v11 section]];
        [v22 appendItems:v30];
      }
      [(MCDContentItemTableViewController *)v17 setContentResults:v22];
      v17 = v17;

      v16 = (MCDBrowseTableViewController *)v17;
    }
    goto LABEL_23;
  }
  v16 = [[MCDBrowseTableViewController alloc] initWithLimitedUI:[(MCDTableViewController *)self limitedUI]];
  v17 = (MCDContentItemTableViewController *)objc_opt_new();
  [(MCDContentItemTableViewController *)v17 appendSection:v10];
  v18 = [v9 contentResults];
  v19 = v18;
  if (!v18)
  {
    v5 = [v9 lastReceivedResponse];
    v19 = [v5 results];
  }
  v20 = [v19 itemsInSectionAtIndex:[v11 row]];
  [(MCDContentItemTableViewController *)v17 appendItems:v20];

  if (!v18)
  {
  }
  [(MCDBrowseTableViewController *)v16 setContentResults:v17];
LABEL_23:

  v31 = [v10 title];
  [(MCDBrowseTableViewController *)v16 setTitle:v31];

  return v16;
}

- (MPSectionedCollection)contentResults
{
  return self->_contentResults;
}

- (void)setContentResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end