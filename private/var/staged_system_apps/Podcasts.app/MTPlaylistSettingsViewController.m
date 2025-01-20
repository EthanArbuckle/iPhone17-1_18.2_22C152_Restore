@interface MTPlaylistSettingsViewController
+ (CGSize)podcastImageSize;
+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4;
- (BOOL)isPresentedModally;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)userDriven;
- (MTLibrary)library;
- (MTPlaylistSettingsViewController)initWithPlaylistUuid:(id)a3 library:(id)a4;
- (MTPlaylistSettingsViewControllerDelegate)delegate;
- (NSIndexPath)appearanceSelectedPath;
- (NSString)playlistUuid;
- (UIAlertController)deleteStationAlertController;
- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4;
- (id)addPodcastsViewController;
- (id)deletePlaylistBlock;
- (id)metricDataSource;
- (id)metricsName;
- (id)newSettingsController;
- (id)titleForCurrentPodcasts;
- (void)_updateUngroupedListSetting:(BOOL)a3;
- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6;
- (void)deletePlaylist:(id)a3;
- (void)removePodcastAtIndex:(unint64_t)a3;
- (void)saveNewPlaylists;
- (void)selectAppearancePathIfNecessary;
- (void)setAddPodcastsViewController:(id)a3;
- (void)setAppearanceSelectedPath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeletePlaylistBlock:(id)a3;
- (void)setDeleteStationAlertController:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setPlaylistUuid:(id)a3;
- (void)setUserDriven:(BOOL)a3;
- (void)showAddPodcastsSheet;
- (void)sourceList:(id)a3 didSelectItemUuid:(id)a4 atIndexPath:(id)a5;
- (void)syncControllerOperationCompleted:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)updateContainerOrder:(int)a3;
- (void)updatePodcastCount;
- (void)updateSetting:(id)a3 value:(id)a4;
- (void)updateShowSetting:(int64_t)a3 forSettings:(id)a4;
- (void)updateTitle:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTPlaylistSettingsViewController

- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"podcasts"] && !isTV())
  {
    double v9 = 50.0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MTPlaylistSettingsViewController;
    [(MTGenericSettingsViewController *)&v11 heightForRowWithDescription:v6 inGroupWithIdentifier:v7];
    double v9 = v8;
  }

  return v9;
}

- (MTPlaylistSettingsViewController)initWithPlaylistUuid:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTPlaylistSettingsViewController;
  double v9 = [(MTGenericSettingsViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_userDriven = 1;
    objc_storeStrong((id *)&v9->_playlistUuid, a3);
    objc_storeStrong((id *)&v10->_library, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MTPlaylistSettingsViewController;
  [(MTGenericSettingsViewController *)&v4 viewDidLoad];
  id v3 = [(MTPlaylistSettingsViewController *)self newSettingsController];
  [(MTGenericSettingsViewController *)self setSettingsController:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTPlaylistSettingsViewController;
  [(MTGenericSettingsViewController *)&v4 viewWillAppear:a3];
  [(MTPlaylistSettingsViewController *)self selectAppearancePathIfNecessary];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTPlaylistSettingsViewController;
  -[MTPlaylistSettingsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v5 = [(MTPlaylistSettingsViewController *)self deleteStationAlertController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)selectAppearancePathIfNecessary
{
  id v3 = [(MTPlaylistSettingsViewController *)self appearanceSelectedPath];

  if (v3)
  {
    [(MTPlaylistSettingsViewController *)self setUserDriven:0];
    objc_super v4 = [(MTPlaylistSettingsViewController *)self tableView];
    v5 = [(MTPlaylistSettingsViewController *)self appearanceSelectedPath];
    [(MTGenericSettingsViewController *)self tableView:v4 didSelectRowAtIndexPath:v5];

    [(MTPlaylistSettingsViewController *)self setUserDriven:1];
    [(MTPlaylistSettingsViewController *)self setAppearanceSelectedPath:0];
  }
}

- (BOOL)isPresentedModally
{
  id v3 = [(MTPlaylistSettingsViewController *)self presentingViewController];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(MTPlaylistSettingsViewController *)self navigationController];
    objc_super v6 = [v5 presentingViewController];
    id v7 = [v6 presentedViewController];
    id v8 = [(MTPlaylistSettingsViewController *)self navigationController];
    BOOL v4 = v7 == v8;
  }
  return v4;
}

- (void)deletePlaylist:(id)a3
{
  id v4 = a3;
  v5 = +[MTDB sharedInstance];
  objc_super v6 = [v5 mainQueueContext];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1000570BC;
  v27 = sub_100057328;
  id v28 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100122580;
  v19[3] = &unk_10054E280;
  v22 = &v23;
  id v7 = v6;
  id v20 = v7;
  v21 = self;
  [v7 performBlockAndWait:v19];
  LOBYTE(v6) = [(MTPlaylistSettingsViewController *)self isPresentedModally];
  objc_initWeak(&location, self);
  uint64_t v8 = v24[5];
  double v9 = [(MTPlaylistSettingsViewController *)self library];
  objc_super v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1001225F0;
  v15 = &unk_100552370;
  char v17 = (char)v6;
  objc_copyWeak(&v16, &location);
  v10 = +[UIAlertController controllerForDeletingStation:v8 fromLibrary:v9 deletionCompletion:&v12];
  -[MTPlaylistSettingsViewController setDeleteStationAlertController:](self, "setDeleteStationAlertController:", v10, v12, v13, v14, v15);

  objc_super v11 = [(MTPlaylistSettingsViewController *)self deleteStationAlertController];
  [(MTPlaylistSettingsViewController *)self presentViewController:v11 animated:1 completion:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v23, 8);
}

+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 5 && [v6 isEqualToString:@"podcasts"])
  {
    isTV();
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___MTPlaylistSettingsViewController;
    uint64_t v9 = [super cellClassForSettingType:a3 inGroupWithIdentifier:v7];
  }
  v10 = (void *)v9;

  return v10;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MTPlaylistSettingsViewController;
  id v12 = a6;
  [(MTiOSGenericSettingsViewController *)&v24 configureCell:v10 atIndexPath:a4 withDescription:v11 inGroupWithIdentifier:v12];
  LODWORD(a4) = [v12 isEqualToString:@"podcasts"];

  if (a4 && [v11 type] == (id)5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v11 identifier];
      v14 = [v10 artworkView];
      [v14 setArtworkKey:v13];
    }
    else
    {
      [(id)objc_opt_class() podcastImageSize];
      double v16 = v15;
      double v18 = v17;
      uint64_t v13 = [v11 identifier];
      v19 = +[MTImageStore defaultStore];
      v14 = [v19 imageForKey:v13 size:v16];

      if (!v14)
      {
        id v20 = +[MTImageStore defaultStore];
        v14 = [v20 imageForKey:kMTLibraryDefaultImageKey size:v16 v18];
      }
      v21 = [v10 imageView];
      [v21 setImage:v14];
    }
  }
  v22 = [v11 identifier];
  unsigned int v23 = [v22 isEqualToString:@"add"];

  if (v23) {
    [v10 setAccessoryType:1];
  }
}

- (id)newSettingsController
{
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainQueueContext];

  v5 = objc_alloc_init(MTSettingsController);
  objc_initWeak(&location, self);
  id v6 = +[NSMutableDictionary dictionary];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100122AF8;
  v11[3] = &unk_1005524A8;
  id v7 = v4;
  id v12 = v7;
  uint64_t v13 = self;
  objc_copyWeak(&v15, &location);
  id v8 = v6;
  id v14 = v8;
  [v7 performBlockAndWait:v11];
  [(MTSettingsController *)v5 setGroups:v8];
  v17[0] = @"station";
  v17[1] = @"include";
  v17[2] = @"podcasts";
  uint64_t v9 = +[NSArray arrayWithObjects:v17 count:3];
  [(MTSettingsController *)v5 setOrder:v9];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v5;
}

- (id)titleForCurrentPodcasts
{
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainOrPrivateContext];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001241D4;
  v14[3] = &unk_10054E410;
  id v5 = v4;
  id v15 = v5;
  double v16 = self;
  double v17 = &v28;
  double v18 = &v24;
  v19 = &v20;
  [v5 performBlockAndWait:v14];
  if (*((unsigned char *)v29 + 24))
  {
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"PODCAST_ALL" value:&stru_10056A8A0 table:0];
  }
  else
  {
    id v8 = +[NSBundle mainBundle];
    id v6 = [v8 localizedStringForKey:@"%@ of %@" value:&stru_10056A8A0 table:0];

    uint64_t v9 = +[NSNumber numberWithUnsignedInteger:v25[3]];
    id v10 = IMAccessibilityLocalizedNumber();
    id v11 = +[NSNumber numberWithUnsignedInteger:v21[3]];
    id v12 = IMAccessibilityLocalizedNumber();
    id v7 = +[NSString stringWithValidatedFormat:v6, @"%@ %@", 0, v10, v12 validFormatSpecifiers error];
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v7;
}

- (void)updatePodcastCount
{
  id v4 = [(MTGenericSettingsViewController *)self settingsController];
  id v3 = [(MTPlaylistSettingsViewController *)self titleForCurrentPodcasts];
  [v4 setValue:v3 forSettingWithIdentifier:@"add" inGroup:@"podcasts"];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MTGenericSettingsViewController *)self settingsController];
  id v7 = [v6 order];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  uint64_t v9 = [(MTGenericSettingsViewController *)self settingsController];
  id v10 = [v9 groups];
  id v11 = [v10 objectForKeyedSubscript:v8];

  if ([v8 isEqualToString:@"podcasts"])
  {
    id v12 = [v11 groupSettings];
    uint64_t v13 = [v12 objectAtIndexedSubscript:[v5 row]];

    id v14 = [v13 identifier];
    unsigned __int8 v15 = [v14 isEqualToString:@"add"];

    char v16 = v15 ^ 1;
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v7 = [a5 row] - 1;
    [(MTPlaylistSettingsViewController *)self removePodcastAtIndex:v7];
  }
}

- (void)removePodcastAtIndex:(unint64_t)a3
{
  uint64_t v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001245C0;
  v11[3] = &unk_10054D8F0;
  id v12 = v6;
  uint64_t v13 = self;
  unint64_t v14 = a3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v11];
  id v8 = +[SyncKeysRepository shared];
  [v8 setIsPlaylistSyncDirty:1];

  uint64_t v9 = [(MTGenericSettingsViewController *)self settingsController];
  [v9 removeSettingAtIndex:a3 + 1 fromGroupWithIdentifier:@"podcasts"];

  [(MTPlaylistSettingsViewController *)self updatePodcastCount];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettingsDidChangeSetting:self];
}

- (void)updateShowSetting:(int64_t)a3 forSettings:(id)a4
{
  id v6 = a4;
  id v7 = +[MTDB sharedInstance];
  id v8 = [v7 mainOrPrivateContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100124790;
  v13[3] = &unk_10054D8F0;
  id v14 = v8;
  id v15 = v6;
  int64_t v16 = a3;
  id v9 = v6;
  id v10 = v8;
  [v10 performBlockAndWaitWithSave:v13];
  id v11 = +[SyncKeysRepository shared];
  [v11 setIsPlaylistSyncDirty:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettingsDidChangeSetting:self];
}

- (void)updateSetting:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MTDB sharedInstance];
  id v9 = [v8 mainOrPrivateContext];

  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  double v17 = sub_100124990;
  double v18 = &unk_10054DFE8;
  id v19 = v9;
  uint64_t v20 = self;
  id v21 = v7;
  id v22 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v9;
  [v12 performBlockAndWaitWithSave:&v15];
  uint64_t v13 = +[SyncKeysRepository shared];
  [v13 setIsPlaylistSyncDirty:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettingsDidChangeSetting:self];
}

- (void)updateContainerOrder:(int)a3
{
  uint64_t v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100124B9C;
  v10[3] = &unk_10054EA58;
  id v11 = v6;
  id v12 = self;
  int v13 = a3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v10];
  id v8 = +[SyncKeysRepository shared];
  [v8 setIsPlaylistSyncDirty:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettingsDidChangeSetting:self];
}

- (void)showAddPodcastsSheet
{
  id v3 = objc_opt_new();
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000570BC;
  uint64_t v30 = sub_100057328;
  id v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v4 = +[MTDB sharedInstance];
  uint64_t v5 = [v4 mainOrPrivateContext];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100124F04;
  v16[3] = &unk_100551848;
  id v6 = v5;
  id v17 = v6;
  double v18 = self;
  uint64_t v20 = &v26;
  id v21 = &v22;
  id v7 = v3;
  id v19 = v7;
  [v6 performBlockAndWait:v16];
  id v8 = +[MTPodcast sortDescriptorsForAllPodcasts];
  id v9 = [MTPlaylistSelectPodcastListViewController alloc];
  id v10 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  id v11 = [(MTFetchedTableViewController *)v9 initWithEntityName:kMTPodcastEntityName predicate:v10 sortDescriptors:v8];

  [(MTPlaylistSelectPodcastListViewController *)v11 setSaveDelegate:self];
  [(MTPlaylistSelectPodcastListViewController *)v11 setPlaylistName:v27[5]];
  [(MTBasePodcastListViewController *)v11 setDelegate:self];
  [(MTPlaylistSelectPodcastListViewController *)v11 setPodcastUuids:v7];
  [(MTPlaylistSelectPodcastListViewController *)v11 setAllPodcastsSelected:*((unsigned __int8 *)v23 + 24)];
  id v12 = [(MTPlaylistSettingsViewController *)self playlistUuid];
  [(MTPlaylistSelectPodcastListViewController *)v11 setPlaylistUuid:v12];

  int v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"Podcasts Header" value:&stru_10056A8A0 table:0];
  [(MTPlaylistSelectPodcastListViewController *)v11 setTitle:v14];

  id v15 = [(MTPlaylistSettingsViewController *)self navigationController];
  [v15 pushViewController:v11 animated:[self userDriven]];

  [(MTPlaylistSettingsViewController *)self setAddPodcastsViewController:v11];
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

- (void)saveNewPlaylists
{
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainOrPrivateContext];

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100125188;
  v6[3] = &unk_10054F658;
  id v5 = v4;
  id v7 = v5;
  id v8 = self;
  objc_copyWeak(&v9, &location);
  [v5 performBlock:v6];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)sourceList:(id)a3 didSelectItemUuid:(id)a4 atIndexPath:(id)a5
{
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void)_updateUngroupedListSetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100125604;
  v10[3] = &unk_10054EA08;
  id v11 = v6;
  id v12 = self;
  BOOL v13 = v3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v10];
  id v8 = +[SyncKeysRepository shared];
  [v8 setIsPlaylistSyncDirty:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettings:self didChangeLayout:!v3];
}

- (id)metricsName
{
  return @"PlaylistSettings";
}

- (id)metricDataSource
{
  BOOL v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainOrPrivateContext];

  id v5 = [(MTPlaylistSettingsViewController *)self playlistUuid];
  id v6 = [v4 playlistForUuid:v5];

  return v6;
}

- (void)syncControllerOperationCompleted:(id)a3
{
  id v4 = [(MTPlaylistSettingsViewController *)self newSettingsController];
  [(MTGenericSettingsViewController *)self setSettingsController:v4];
}

- (void)updateTitle:(id)a3
{
  id v4 = a3;
  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001258B4;
  v11[3] = &unk_10054E708;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v4;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlockAndWaitWithSave:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettingsDidChangeSetting:self];

  id v10 = +[SyncKeysRepository shared];
  [v10 setIsPlaylistSyncDirty:1];
}

+ (CGSize)podcastImageSize
{
  double v2 = 30.0;
  double v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MTPlaylistSettingsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTPlaylistSettingsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)playlistUuid
{
  return self->_playlistUuid;
}

- (void)setPlaylistUuid:(id)a3
{
}

- (id)deletePlaylistBlock
{
  return self->_deletePlaylistBlock;
}

- (void)setDeletePlaylistBlock:(id)a3
{
}

- (BOOL)userDriven
{
  return self->_userDriven;
}

- (void)setUserDriven:(BOOL)a3
{
  self->_userDriven = a3;
}

- (NSIndexPath)appearanceSelectedPath
{
  return self->_appearanceSelectedPath;
}

- (void)setAppearanceSelectedPath:(id)a3
{
}

- (MTLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (id)addPodcastsViewController
{
  return self->_addPodcastsViewController;
}

- (void)setAddPodcastsViewController:(id)a3
{
}

- (UIAlertController)deleteStationAlertController
{
  return self->_deleteStationAlertController;
}

- (void)setDeleteStationAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteStationAlertController, 0);
  objc_storeStrong(&self->_addPodcastsViewController, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_appearanceSelectedPath, 0);
  objc_storeStrong(&self->_deletePlaylistBlock, 0);
  objc_storeStrong((id *)&self->_playlistUuid, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end