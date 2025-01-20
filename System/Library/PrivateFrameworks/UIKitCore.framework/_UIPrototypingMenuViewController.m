@interface _UIPrototypingMenuViewController
- (NSArray)allSettings;
- (NSString)domain;
- (UITableView)tableView;
- (_UIContentUnavailableView)noContentView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadSettings:(id)a3;
- (void)_resetSettings:(id)a3;
- (void)loadView;
- (void)setAllSettings:(id)a3;
- (void)setDomain:(id)a3;
- (void)setNoContentView:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _UIPrototypingMenuViewController

- (void)loadView
{
  v3 = [UITableView alloc];
  v5 = -[UITableView initWithFrame:style:](v3, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UITableView *)v5 setDelegate:self];
  [(UITableView *)v5 setDataSource:self];
  [(UIScrollView *)v5 setContentInsetAdjustmentBehavior:3];
  [(_UIPrototypingMenuViewController *)self setTableView:v5];
  v4 = [(_UIPrototypingMenuViewController *)self tableView];
  [(UIViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_UIPrototypingMenuViewController;
  [(UIViewController *)&v10 viewDidLoad];
  v3 = [(_UIPrototypingMenuViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"kNumberSettingCell"];

  v4 = [(_UIPrototypingMenuViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"kBoolSettingCell"];

  v5 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:13 target:self action:sel__reloadSettings_];
  v6 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:16 target:self action:sel__resetSettings_];
  v7 = +[UIColor systemRedColor];
  [(UIBarButtonItem *)v6 setTintColor:v7];

  v11[0] = v6;
  v11[1] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v9 = [(UIViewController *)self navigationItem];
  [v9 setRightBarButtonItems:v8];
}

- (void)_reloadSettings:(id)a3
{
  allSettings = self->_allSettings;
  self->_allSettings = 0;

  id v5 = [(_UIPrototypingMenuViewController *)self tableView];
  [v5 reloadData];
}

- (void)_resetSettings:(id)a3
{
  v4 = +[UIAlertController alertControllerWithTitle:@"Delete Settings" message:@"Warning: This will delete all persisted prototyping settings and their values from this app's domain." preferredStyle:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___UIPrototypingMenuViewController__resetSettings___block_invoke;
  v8[3] = &unk_1E52DC290;
  v8[4] = self;
  id v5 = +[UIAlertAction actionWithTitle:@"Delete All Settings" style:2 handler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___UIPrototypingMenuViewController__resetSettings___block_invoke_2;
  v7[3] = &unk_1E52DC290;
  v7[4] = self;
  v6 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:v7];
  [v4 addAction:v5];
  [v4 addAction:v6];
  [(UIViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPrototypingMenuViewController;
  [(UIViewController *)&v7 viewWillAppear:a3];
  v4 = +[_UIPrototypingSettingsManager sharedManager];
  [v4 synchronizeStoredSettings];

  allSettings = self->_allSettings;
  self->_allSettings = 0;

  v6 = [(_UIPrototypingMenuViewController *)self tableView];
  [v6 reloadData];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPrototypingMenuViewController;
  [(UIViewController *)&v4 viewDidDisappear:a3];
  v3 = +[_UIPrototypingSettingsManager sharedManager];
  [v3 synchronizeStoredSettings];
}

- (NSArray)allSettings
{
  allSettings = self->_allSettings;
  if (!allSettings)
  {
    objc_super v4 = +[_UIPrototypingSettingsManager sharedManager];
    id v5 = [v4 allSettings];
    v6 = self->_allSettings;
    self->_allSettings = v5;

    allSettings = self->_allSettings;
  }
  return allSettings;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(_UIPrototypingMenuViewController *)self allSettings];
  uint64_t v6 = [v5 count];

  objc_super v7 = [(_UIPrototypingMenuViewController *)self noContentView];
  v8 = v7;
  if (v6)
  {
    [v7 removeFromSuperview];
  }
  else
  {

    if (v8)
    {
      v9 = [(UIViewController *)self view];
      [v9 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = [(_UIPrototypingMenuViewController *)self noContentView];
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
    }
    else
    {
      v19 = [_UIContentUnavailableView alloc];
      v20 = [(UIViewController *)self view];
      [v20 bounds];
      v21 = -[_UIContentUnavailableView initWithFrame:title:style:](v19, "initWithFrame:title:style:", @"No Settings", 0);
      [(_UIPrototypingMenuViewController *)self setNoContentView:v21];

      v9 = [(_UIPrototypingMenuViewController *)self noContentView];
      [v9 setAutoresizingMask:18];
    }

    v8 = [(UIViewController *)self view];
    v22 = [(_UIPrototypingMenuViewController *)self noContentView];
    [v8 addSubview:v22];
  }
  v23 = [(_UIPrototypingMenuViewController *)self allSettings];
  int64_t v24 = [v23 count];

  return v24;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_UIPrototypingMenuViewController *)self allSettings];
  v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  unint64_t v10 = [v9 type];
  if (v10 > 2) {
    double v11 = 0;
  }
  else {
    double v11 = off_1E530CC50[v10];
  }
  double v12 = [v7 dequeueReusableCellWithIdentifier:v11 forIndexPath:v6];

  [v12 setPrototypingSetting:v9];
  return v12;
}

- (void)setAllSettings:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (_UIContentUnavailableView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_allSettings, 0);
}

@end