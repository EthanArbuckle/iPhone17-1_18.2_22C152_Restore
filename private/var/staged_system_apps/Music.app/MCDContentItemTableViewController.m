@interface MCDContentItemTableViewController
- (BOOL)customListForPlayback;
- (BOOL)displayRankings;
- (BOOL)queueListForPlayback;
- (BOOL)useMusicKit;
- (BOOL)useRadioDomain;
- (MCDContentItemTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 showRankedList:(BOOL)a5 queueListForPlayback:(BOOL)a6 radioDomain:(BOOL)a7;
- (MCDContentItemTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 showRankedList:(BOOL)a5 queueListForPlayback:(BOOL)a6 radioDomain:(BOOL)a7 musicKit:(BOOL)a8;
- (MPModelStoreBrowseSection)parentSection;
- (MPSectionedCollection)contentResults;
- (id)_contentManager;
- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5;
- (void)setContentResults:(id)a3;
- (void)setCustomListForPlayback:(BOOL)a3;
- (void)setDisplayRankings:(BOOL)a3;
- (void)setParentSection:(id)a3;
- (void)setUseMusicKit:(BOOL)a3;
- (void)setUseRadioDomain:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MCDContentItemTableViewController

- (MCDContentItemTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 showRankedList:(BOOL)a5 queueListForPlayback:(BOOL)a6 radioDomain:(BOOL)a7
{
  return [(MCDContentItemTableViewController *)self initWithSectionItem:a3 limitedUI:a4 showRankedList:a5 queueListForPlayback:a6 radioDomain:a7 musicKit:0];
}

- (MCDContentItemTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 showRankedList:(BOOL)a5 queueListForPlayback:(BOOL)a6 radioDomain:(BOOL)a7 musicKit:(BOOL)a8
{
  BOOL v12 = a4;
  id v15 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCDContentItemTableViewController;
  v16 = [(MCDFuseTableViewController *)&v21 initWithLimitedUI:v12];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parentSection, a3);
    v17->_displayRankings = a5;
    v17->_customListForPlayback = a6;
    v17->_useRadioDomain = a7;
    v17->_useMusicKit = a8;
    [(MCDContentItemTableViewController *)v17 setPlayActivityFeatureName:@"grouping"];
    v18 = [v15 title];
    if (v18)
    {
      [(MCDContentItemTableViewController *)v17 setTitle:v18];
    }
    else
    {
      v19 = [(MCDContentItemTableViewController *)v17 title];
      [(MCDContentItemTableViewController *)v17 setTitle:v19];
    }
  }

  return v17;
}

- (id)_contentManager
{
  if ([(MCDContentItemTableViewController *)self useRadioDomain]) {
    v3 = MCDRadioGenresDataSource;
  }
  else {
    v3 = MCDBrowseDataSource;
  }
  id v4 = [v3 alloc];
  v5 = [(MCDContentItemTableViewController *)self parentSection];
  id v6 = [v4 initWithParentSection:v5];

  [(MCDContentItemTableViewController *)self useMusicKit];
  v7 = [MCDBrowseItemsContentManager alloc];
  v8 = [(MCDFuseTableViewController *)self playbackManager];
  BOOL v9 = [(MCDTableViewController *)self limitedUI];
  v10 = [(MCDContentItemTableViewController *)self contentResults];
  v11 = [(MCDFuseContentManager *)v7 initWithDataSource:v6 delegate:self viewController:self playbackManager:v8 limitedUI:v9 contentResults:v10];

  return v11;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MCDContentItemTableViewController;
  [(MCDFuseTableViewController *)&v7 viewDidLoad];
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = [(MCDFuseTableViewController *)self contentManager];
  [v3 setTableCellConfigurationBlock:&v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)queueListForPlayback
{
  return [(MCDContentItemTableViewController *)self customListForPlayback];
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v6 = a4;
  if ([v6 itemType] == (id)3)
  {
    objc_super v7 = [MCDCuratedPlaylistsTableViewController alloc];
    v8 = [v6 curator];
    BOOL v9 = [(MCDCuratedPlaylistsTableViewController *)v7 initWithCurator:v8 limitedUI:[(MCDTableViewController *)self limitedUI]];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (MPSectionedCollection)contentResults
{
  return self->_contentResults;
}

- (void)setContentResults:(id)a3
{
}

- (MPModelStoreBrowseSection)parentSection
{
  return self->_parentSection;
}

- (void)setParentSection:(id)a3
{
}

- (BOOL)displayRankings
{
  return self->_displayRankings;
}

- (void)setDisplayRankings:(BOOL)a3
{
  self->_displayRankings = a3;
}

- (BOOL)customListForPlayback
{
  return self->_customListForPlayback;
}

- (void)setCustomListForPlayback:(BOOL)a3
{
  self->_customListForPlayback = a3;
}

- (BOOL)useRadioDomain
{
  return self->_useRadioDomain;
}

- (void)setUseRadioDomain:(BOOL)a3
{
  self->_useRadioDomain = a3;
}

- (BOOL)useMusicKit
{
  return self->_useMusicKit;
}

- (void)setUseMusicKit:(BOOL)a3
{
  self->_useMusicKit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSection, 0);

  objc_storeStrong((id *)&self->_contentResults, 0);
}

@end