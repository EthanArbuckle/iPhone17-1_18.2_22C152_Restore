@interface MTiOSPlaylistSettingsViewController
- (UIButton)deleteButton;
- (void)addDeleteButtonInFooter;
- (void)setDeleteButton:(id)a3;
- (void)updateTitle:(id)a3;
- (void)viewDidLoad;
@end

@implementation MTiOSPlaylistSettingsViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)MTiOSPlaylistSettingsViewController;
  [(MTPlaylistSettingsViewController *)&v6 viewDidLoad];
  [(MTiOSPlaylistSettingsViewController *)self addDeleteButtonInFooter];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Station Settings" value:&stru_10056A8A0 table:0];
  [(MTiOSPlaylistSettingsViewController *)self setTitle:v4];

  v5 = [(MTiOSPlaylistSettingsViewController *)self navigationItem];
  [v5 setLargeTitleDisplayMode:2];
}

- (void)addDeleteButtonInFooter
{
  v3 = +[UIButton buttonWithType:1];
  [(MTiOSPlaylistSettingsViewController *)self setDeleteButton:v3];

  v4 = [(MTiOSPlaylistSettingsViewController *)self deleteButton];
  v5 = +[UIColor redColor];
  [v4 setTintColor:v5];

  objc_super v6 = [(MTiOSPlaylistSettingsViewController *)self deleteButton];
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Delete Station" value:&stru_10056A8A0 table:0];
  [v6 setTitle:v8 forState:0];

  v9 = [(MTiOSPlaylistSettingsViewController *)self deleteButton];
  v10 = [v9 titleLabel];
  v11 = +[UIFont buttonFont];
  [v10 setFont:v11];

  v12 = [(MTiOSPlaylistSettingsViewController *)self deleteButton];
  [v12 addTarget:self action:"deletePlaylist:" forControlEvents:64];

  v13 = [(MTiOSPlaylistSettingsViewController *)self deleteButton];
  [v13 setFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];

  v14 = [(MTiOSPlaylistSettingsViewController *)self deleteButton];
  [v14 setAutoresizingMask:2];

  id v17 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 320.0, 64.0];
  v15 = [(MTiOSPlaylistSettingsViewController *)self deleteButton];
  [v17 addSubview:v15];

  v16 = [(MTiOSPlaylistSettingsViewController *)self tableView];
  [v16 setTableFooterView:v17];
}

- (void)updateTitle:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTiOSPlaylistSettingsViewController;
  [(MTPlaylistSettingsViewController *)&v7 updateTitle:a3];
  v4 = +[MTCoreSpotlightController sharedInstance];
  v5 = [(MTPlaylistSettingsViewController *)self playlistUuid];
  objc_super v6 = +[NSSet setWithObject:v5];
  [v4 updateStationsWithUUIDs:v6];
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end