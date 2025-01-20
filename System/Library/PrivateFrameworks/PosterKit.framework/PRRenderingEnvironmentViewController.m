@interface PRRenderingEnvironmentViewController
- (PRPosterEnvironmentImpl)currentEnvironment;
- (PRRenderingEnvironmentViewController)initWithEnvironment:(id)a3 delegate:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cell:(id)a3 presentViewController:(id)a4;
- (void)cell:(id)a3 valueChanged:(id)a4;
- (void)viewDidLoad;
@end

@implementation PRRenderingEnvironmentViewController

- (PRRenderingEnvironmentViewController)initWithEnvironment:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PRRenderingEnvironmentViewController *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_environment, a3);
    uint64_t v11 = objc_opt_new();
    settings = v10->_settings;
    v10->_settings = (FBSMutableSceneSettings *)v11;

    [(PRPosterEnvironmentImpl *)v10->_environment _applyToSceneSettings:v10->_settings];
  }

  return v10;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PRRenderingEnvironmentViewController;
  [(PRRenderingEnvironmentViewController *)&v9 viewDidLoad];
  v3 = [(PRRenderingEnvironmentViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4FB1D00]);
  [v3 bounds];
  v5 = objc_msgSend(v4, "initWithFrame:style:", 0);
  [v5 setDelegate:self];
  [v5 setDataSource:self];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"switch"];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"segment"];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"color"];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"slider"];
  [v5 setAutoresizingMask:18];
  v6 = [(PRRenderingEnvironmentViewController *)self view];
  id v7 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v6 setBackgroundColor:v7];

  id v8 = [(PRRenderingEnvironmentViewController *)self view];
  [v8 addSubview:v5];

  [v5 reloadData];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (tableView_cellForRowAtIndexPath__onceToken != -1) {
    dispatch_once(&tableView_cellForRowAtIndexPath__onceToken, &__block_literal_global_19);
  }
  uint64_t v8 = [v7 row];
  objc_super v9 = [(id)tableView_cellForRowAtIndexPath__keys objectAtIndex:v8];
  uint64_t v10 = [v9 integerValue];
  uint64_t v11 = [(id)tableView_cellForRowAtIndexPath__dixt objectForKey:v9];
  v12 = [v6 dequeueReusableCellWithIdentifier:v11 forIndexPath:v7];

  [v12 setTag:v10];
  [v12 _configure];
  v13 = [(FBSMutableSceneSettings *)self->_settings otherSettings];
  v14 = [v13 objectForSetting:v10];
  [v12 _setCurrentValue:v14];

  if (v10 == 20492 || v10 == 20664 || v10 == 20562)
  {
    v15 = [(PRPosterEnvironmentImpl *)self->_environment caseColor];
    [v12 _setCurrentValue:v15];
  }
  return v12;
}

void __72__PRRenderingEnvironmentViewController_tableView_cellForRowAtIndexPath___block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)tableView_cellForRowAtIndexPath__keys;
  tableView_cellForRowAtIndexPath__keys = (uint64_t)&unk_1ED9EF028;

  v3[0] = &unk_1ED9EED40;
  v3[1] = &unk_1ED9EED58;
  v4[0] = @"segment";
  v4[1] = @"slider";
  v3[2] = &unk_1ED9EED70;
  v4[2] = @"color";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  v2 = (void *)tableView_cellForRowAtIndexPath__dixt;
  tableView_cellForRowAtIndexPath__dixt = v1;
}

- (void)cell:(id)a3 valueChanged:(id)a4
{
  id v16 = a4;
  uint64_t v6 = [a3 tag];
  switch(v6)
  {
    case 20664:
      settings = self->_settings;
      [v16 floatValue];
      [(FBSMutableSceneSettings *)settings pr_setUnlockProgress:v8];
      break;
    case 20562:
      objc_super v9 = self->_settings;
      uint64_t v10 = [v16 BSColor];
      [(FBSMutableSceneSettings *)v9 pr_setCaseColor:v10];

      break;
    case 20492:
      -[FBSMutableSceneSettings pui_setMode:](self->_settings, "pui_setMode:", [v16 integerValue]);
      break;
  }
  uint64_t v11 = [(PRRenderingEnvironmentViewController *)self view];
  v12 = [v11 traitCollection];

  v13 = [[PRPosterEnvironmentImpl alloc] initWithSceneSettings:self->_settings traitCollection:v12 targetConfig:0 extensionBundleURL:0];
  environment = self->_environment;
  self->_environment = v13;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained environmentViewController:self didUpdateEnvironment:self->_environment];
}

- (void)cell:(id)a3 presentViewController:(id)a4
{
}

- (PRPosterEnvironmentImpl)currentEnvironment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end