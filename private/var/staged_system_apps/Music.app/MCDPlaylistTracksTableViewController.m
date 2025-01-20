@interface MCDPlaylistTracksTableViewController
- (MCDPlaylistTracksTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (MCDPlaylistTracksTableViewController)initWithPlaylist:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (id)shuffleContainerForContentManager:(id)a3;
- (id)sortingPreferenceKey;
- (id)textForHeaderViewInContentManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDPlaylistTracksTableViewController

- (MCDPlaylistTracksTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MCDLibraryDataSource *)[MCDPlaylistTracksDataSource alloc] initWithLimitedUI:v6];
  v12.receiver = self;
  v12.super_class = (Class)MCDPlaylistTracksTableViewController;
  v10 = [(MCDLibraryTableViewController *)&v12 initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  if (v10) {
    [(MCDPlaylistTracksTableViewController *)v10 setPlayActivityFeatureName:@"playlist_detail"];
  }
  return v10;
}

- (MCDPlaylistTracksTableViewController)initWithPlaylist:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [[MCDPlaylistTracksDataSource alloc] initWithLimitedUI:v6 playlist:v8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  v10 = (uint64_t *)qword_1010D6D88;
  uint64_t v21 = qword_1010D6D88;
  if (!qword_1010D6D88)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000923F4;
    v17[3] = &unk_100FC34A0;
    v17[4] = &v18;
    sub_1000923F4((uint64_t)v17);
    v10 = (uint64_t *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v10)
  {
    v15 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v15);
  }
  uint64_t v11 = *v10;
  v16.receiver = self;
  v16.super_class = (Class)MCDPlaylistTracksTableViewController;
  objc_super v12 = [(MCDLibraryTableViewController *)&v16 initWithIdentifier:v11 limitedUI:v6 showLocalContent:v5 dataSource:v9];
  if (v12)
  {
    v13 = [v8 name];
    [(MCDPlaylistTracksTableViewController *)v12 setTitle:v13];

    [(MCDPlaylistTracksTableViewController *)v12 setPlayActivityFeatureName:@"playlist_detail"];
  }

  return v12;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)MCDPlaylistTracksTableViewController;
  [(MCDLibraryTableViewController *)&v9 viewDidLoad];
  v3 = [(MCDLibraryTableViewController *)self contentManager];
  [v3 setShowShuffleAll:1];

  v4 = [(MCDLibraryTableViewController *)self contentManager];
  [v4 setShowSiriCellInLimitedUI:1];

  objc_initWeak(&location, self);
  objc_copyWeak(&v7, &location);
  BOOL v5 = [(MCDLibraryTableViewController *)self contentManager];
  [v5 setTableCellConfigurationBlock:&v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)shuffleContainerForContentManager:(id)a3
{
  v3 = [(MCDLibraryTableViewController *)self dataSource];
  v4 = [v3 containerObject];

  return v4;
}

- (id)sortingPreferenceKey
{
  v2 = [(MCDLibraryTableViewController *)self dataSource];
  v3 = [v2 containerObject];

  v4 = [v3 sortStorageKeyDomain];
  if ([v4 length])
  {
    BOOL v5 = [@"playlistDetailSortType-" stringByAppendingString:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  if ([(MCDLibraryTableViewController *)self showLocalContent])
  {
    v3 = +[NSString downloadedOnlyMessage];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end