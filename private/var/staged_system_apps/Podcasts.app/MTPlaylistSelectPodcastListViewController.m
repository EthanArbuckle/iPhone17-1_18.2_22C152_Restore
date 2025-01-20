@interface MTPlaylistSelectPodcastListViewController
- (BOOL)allPodcastsSelected;
- (MTPlaylistSelectPodcastListViewControllerSaveDelegate)saveDelegate;
- (NSMutableSet)podcastUuids;
- (NSString)playlistName;
- (NSString)playlistUuid;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
- (void)setAllPodcastsSelected:(BOOL)a3;
- (void)setPlaylistName:(id)a3;
- (void)setPlaylistUuid:(id)a3;
- (void)setPodcastUuids:(id)a3;
- (void)setSaveDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)togglePodcastUuid:(id)a3;
- (void)updateAllPodcastsTo:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTPlaylistSelectPodcastListViewController

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)MTPlaylistSelectPodcastListViewController;
  [(MTBasePodcastListViewController *)&v19 viewDidLoad];
  v3 = [(MTBasePodcastListViewController *)self tableView];
  [v3 bounds];

  +[MTTableViewCell rowHeight];
  v4 = [MTPodcastPlaylistSheetHeaderView alloc];
  v5 = [(MTPlaylistSelectPodcastListViewController *)self view];
  [v5 bounds];
  double Width = CGRectGetWidth(v20);
  +[MTTableViewCell rowHeight];
  v8 = -[MTPodcastPlaylistSheetHeaderView initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, Width, v7);

  [(MTPodcastPlaylistSheetHeaderView *)v8 setOn:[(MTPlaylistSelectPodcastListViewController *)self allPodcastsSelected]];
  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1000EA0A4;
  v16 = &unk_1005511B0;
  objc_copyWeak(&v17, &location);
  [(MTPodcastPlaylistSheetHeaderView *)v8 setAction:&v13];
  v9 = [(MTBasePodcastListViewController *)self tableView];
  [v9 setTableHeaderView:v8];

  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Add Podcasts" value:&stru_10056A8A0 table:0];
  [(MTPlaylistSelectPodcastListViewController *)self setTitle:v11];

  v12 = [(MTPlaylistSelectPodcastListViewController *)self navigationItem];
  [v12 setLargeTitleDisplayMode:2];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTPlaylistSelectPodcastListViewController;
  [(MTBasePodcastListViewController *)&v5 viewWillDisappear:a3];
  v4 = [(MTPlaylistSelectPodcastListViewController *)self saveDelegate];
  [v4 saveNewPlaylists];
}

- (void)updateAllPodcastsTo:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[MTDB sharedInstance];
  v6 = [v5 mainQueueContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000EA234;
  v9[3] = &unk_10054EA08;
  BOOL v12 = v3;
  id v10 = v6;
  v11 = self;
  id v7 = v6;
  [v7 performBlockAndWait:v9];
  v8 = [(MTBasePodcastListViewController *)self tableView];
  [v8 reloadData];

  [(MTPlaylistSelectPodcastListViewController *)self setAllPodcastsSelected:v3];
}

- (void)togglePodcastUuid:(id)a3
{
  id v4 = a3;
  podcastUuids = self->_podcastUuids;
  id v10 = v4;
  if (!podcastUuids)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    id v7 = self->_podcastUuids;
    self->_podcastUuids = v6;

    id v4 = v10;
    podcastUuids = self->_podcastUuids;
  }
  unsigned int v8 = [(NSMutableSet *)podcastUuids containsObject:v4];
  v9 = self->_podcastUuids;
  if (v8) {
    [(NSMutableSet *)v9 removeObject:v10];
  }
  else {
    [(NSMutableSet *)v9 addObject:v10];
  }
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v10 = a3;
  [v10 updateWithObject:v7];
  podcastUuids = self->_podcastUuids;
  v9 = [v7 uuid];

  [v10 setAdded:[podcastUuids containsObject:v9]];
  [v10 setEnabled:[self allPodcastsSelected] ^ 1];
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[MTPodcastPlaylistCell alloc] initWithStyle:0 reuseIdentifier:v3];

  return v4;
}

- (id)reuseIdentifierForRow:(id)a3
{
  return @"MTPodcastPlaylistCell";
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTPlaylistSelectPodcastListViewController;
  id v5 = a4;
  id v6 = a3;
  [(MTBasePodcastListViewController *)&v8 tableView:v6 didSelectRowAtIndexPath:v5];
  id v7 = [v6 cellForRowAtIndexPath:v5, v8.receiver, v8.super_class];
  [v7 setAdded:[v7 isAdded] ^ 1];
  [v6 deselectRowAtIndexPath:v5 animated:1];
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (void)setPlaylistName:(id)a3
{
}

- (NSMutableSet)podcastUuids
{
  return self->_podcastUuids;
}

- (void)setPodcastUuids:(id)a3
{
}

- (BOOL)allPodcastsSelected
{
  return self->_allPodcastsSelected;
}

- (void)setAllPodcastsSelected:(BOOL)a3
{
  self->_allPodcastsSelected = a3;
}

- (NSString)playlistUuid
{
  return self->_playlistUuid;
}

- (void)setPlaylistUuid:(id)a3
{
}

- (MTPlaylistSelectPodcastListViewControllerSaveDelegate)saveDelegate
{
  return (MTPlaylistSelectPodcastListViewControllerSaveDelegate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSaveDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveDelegate, 0);
  objc_storeStrong((id *)&self->_playlistUuid, 0);
  objc_storeStrong((id *)&self->_podcastUuids, 0);

  objc_storeStrong((id *)&self->_playlistName, 0);
}

@end