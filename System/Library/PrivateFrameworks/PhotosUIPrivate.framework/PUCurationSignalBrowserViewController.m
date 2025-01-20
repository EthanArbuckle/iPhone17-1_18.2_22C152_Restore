@interface PUCurationSignalBrowserViewController
- (NSArray)availableScoreConfiguration;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAvailableScoreConfiguration:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUCurationSignalBrowserViewController

- (void).cxx_destruct
{
}

- (void)setAvailableScoreConfiguration:(id)a3
{
}

- (NSArray)availableScoreConfiguration
{
  return self->_availableScoreConfiguration;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(PUCurationSignalBrowserViewController *)self availableScoreConfiguration];
  uint64_t v7 = [v5 row];

  id v13 = [v6 objectAtIndex:v7];

  uint64_t v8 = [v13 themeType];
  if (v8)
  {
    if (v8 != 1) {
      goto LABEL_7;
    }
    v9 = off_1E5F1EBC0;
  }
  else
  {
    v9 = off_1E5F1EBC8;
  }
  uint64_t v10 = [objc_alloc(*v9) initWithScoreConfiguration:v13];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [(PUCurationSignalBrowserViewController *)self navigationController];
    [v12 pushViewController:v11 animated:1];
  }
LABEL_7:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"scoreConfigurationCellIdentifier" forIndexPath:v6];
  uint64_t v8 = [(PUCurationSignalBrowserViewController *)self availableScoreConfiguration];
  uint64_t v9 = [v6 row];

  uint64_t v10 = [v8 objectAtIndex:v9];

  v11 = [v10 name];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(PUCurationSignalBrowserViewController *)self availableScoreConfiguration];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)viewDidLoad
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PUCurationSignalBrowserViewController;
  [(PUCurationSignalBrowserViewController *)&v9 viewDidLoad];
  v3 = [(PUCurationSignalBrowserViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"scoreConfigurationCellIdentifier"];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F8E840]) initWithScoreConfigurationDataType:0 scoreConfigurationThemeType:0];
  v10[0] = v4;
  int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F8E840]) initWithScoreConfigurationDataType:1 scoreConfigurationThemeType:0];
  v10[1] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F8E840]) initWithScoreConfigurationDataType:1 scoreConfigurationThemeType:1];
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  availableScoreConfiguration = self->_availableScoreConfiguration;
  self->_availableScoreConfiguration = v7;
}

@end