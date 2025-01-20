@interface MCDCuratedPlaylistsTableViewController
- (MCDCuratedPlaylistsTableViewController)initWithCurator:(id)a3 limitedUI:(BOOL)a4;
- (MPModelCurator)curator;
- (id)_contentManager;
- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5;
- (void)setCurator:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDCuratedPlaylistsTableViewController

- (MCDCuratedPlaylistsTableViewController)initWithCurator:(id)a3 limitedUI:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCDCuratedPlaylistsTableViewController;
  v8 = [(MCDFuseTableViewController *)&v11 initWithLimitedUI:v4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_curator, a3);
  }

  return v9;
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  return 0;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)MCDCuratedPlaylistsTableViewController;
  [(MCDContentItemTableViewController *)&v16 viewDidLoad];
  v3 = [(MCDCuratedPlaylistsTableViewController *)self curator];
  BOOL v4 = [v3 shortName];
  BOOL v5 = [v4 length] == 0;
  v6 = [(MCDCuratedPlaylistsTableViewController *)self curator];
  id v7 = v6;
  if (v5) {
    [v6 name];
  }
  else {
  v8 = [v6 shortName];
  }
  [(MCDCuratedPlaylistsTableViewController *)self setTitle:v8];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v9 = (void (*)(void))off_1010D6C18;
  v20 = off_1010D6C18;
  if (!off_1010D6C18)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v22 = sub_100086D64;
    v23 = &unk_100FC34A0;
    v24 = &v17;
    v10 = (void *)sub_100029070();
    objc_super v11 = dlsym(v10, "MCDMusicGeneralLogging");
    *(void *)(v24[1] + 24) = v11;
    off_1010D6C18 = *(_UNKNOWN **)(v24[1] + 24);
    v9 = (void (*)(void))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v9)
  {
    sub_100D691B8();
    __break(1u);
  }
  v12 = v9();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(MCDCuratedPlaylistsTableViewController *)self title];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loading content item view, title: %@", (uint8_t *)&buf, 0xCu);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100086AC4;
  v15[3] = &unk_100FC35A8;
  v15[4] = self;
  v14 = [(MCDFuseTableViewController *)self contentManager];
  [v14 setTableCellConfigurationBlock:v15];
}

- (id)_contentManager
{
  v3 = [MCDCuratedPlaylistsContentManager alloc];
  BOOL v4 = [MCDCuratedPlaylistsDataSource alloc];
  BOOL v5 = [(MCDCuratedPlaylistsTableViewController *)self curator];
  v6 = [(MCDCuratedPlaylistsDataSource *)v4 initWithCurator:v5];
  id v7 = [(MCDFuseTableViewController *)self playbackManager];
  v8 = [(MCDFuseContentManager *)v3 initWithDataSource:v6 delegate:self viewController:self playbackManager:v7 limitedUI:[(MCDTableViewController *)self limitedUI]];

  return v8;
}

- (MPModelCurator)curator
{
  return self->_curator;
}

- (void)setCurator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end