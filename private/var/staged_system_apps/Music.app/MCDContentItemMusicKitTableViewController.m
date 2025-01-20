@interface MCDContentItemMusicKitTableViewController
- (BOOL)useRadioDomain;
- (MCDContentItemMusicKitTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 radioDomain:(BOOL)a5;
- (MPModelStoreBrowseSection)parentSection;
- (MPSectionedCollection)contentResults;
- (id)_contentManager;
- (void)setContentResults:(id)a3;
- (void)setParentSection:(id)a3;
- (void)setUseRadioDomain:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MCDContentItemMusicKitTableViewController

- (MCDContentItemMusicKitTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 radioDomain:(BOOL)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCDContentItemMusicKitTableViewController;
  v10 = [(MCDFuseTableViewController *)&v15 initWithLimitedUI:v6];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parentSection, a3);
    v11->_useRadioDomain = a5;
    v12 = [v9 title];
    if (v12)
    {
      [(MCDContentItemMusicKitTableViewController *)v11 setTitle:v12];
    }
    else
    {
      v13 = [(MCDContentItemMusicKitTableViewController *)v11 title];
      [(MCDContentItemMusicKitTableViewController *)v11 setTitle:v13];
    }
    [(MCDContentItemMusicKitTableViewController *)v11 setPlayActivityFeatureName:@"grouping"];
  }

  return v11;
}

- (id)_contentManager
{
  if ([(MCDContentItemMusicKitTableViewController *)self useRadioDomain]) {
    v3 = MCDRadioGenresDataSource;
  }
  else {
    v3 = MCDBrowseDataSource;
  }
  id v4 = [v3 alloc];
  v5 = [(MCDContentItemMusicKitTableViewController *)self parentSection];
  id v6 = [v4 initWithParentSection:v5];

  v7 = [MCDBrowseItemsMusicKitContentManager alloc];
  v8 = [(MCDFuseTableViewController *)self playbackManager];
  BOOL v9 = [(MCDTableViewController *)self limitedUI];
  v10 = [(MCDContentItemMusicKitTableViewController *)self contentResults];
  v11 = [(MCDFuseContentManager *)v7 initWithDataSource:v6 delegate:self viewController:self playbackManager:v8 limitedUI:v9 contentResults:v10];

  return v11;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MCDContentItemMusicKitTableViewController;
  [(MCDFuseTableViewController *)&v7 viewDidLoad];
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = [(MCDFuseTableViewController *)self contentManager];
  [v3 setTableCellConfigurationBlock:&v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
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

- (BOOL)useRadioDomain
{
  return self->_useRadioDomain;
}

- (void)setUseRadioDomain:(BOOL)a3
{
  self->_useRadioDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSection, 0);

  objc_storeStrong((id *)&self->_contentResults, 0);
}

@end