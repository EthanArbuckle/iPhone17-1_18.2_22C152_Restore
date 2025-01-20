@interface PUPhotoEditCopyEditsViewController
+ (BOOL)shouldPresentForCopyingFromCompositionController:(id)a3 asset:(id)a4;
+ (id)_sectionsForConfiguration:(id)a3;
- (NSArray)sections;
- (PEAsset)asset;
- (PECopyEditsConfiguration)configuration;
- (PUPhotoEditCopyEditsViewController)initWithCompositionController:(id)a3 asset:(id)a4;
- (UISwitch)smartSwitch;
- (id)completionHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_finish;
- (void)setCompletionHandler:(id)a3;
- (void)setSmartSwitch:(id)a3;
- (void)switchControlDidSwitch:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PUPhotoEditCopyEditsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartSwitch, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setSmartSwitch:(id)a3
{
}

- (UISwitch)smartSwitch
{
  return self->_smartSwitch;
}

- (NSArray)sections
{
  return self->_sections;
}

- (PEAsset)asset
{
  return self->_asset;
}

- (PECopyEditsConfiguration)configuration
{
  return self->_configuration;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)_finish
{
  v3 = [(PUPhotoEditCopyEditsViewController *)self configuration];
  id v12 = [v3 result];

  v4 = [v12 compositionController];
  uint64_t v5 = [MEMORY[0x1E4F91160] hasValidAdjustmentsInCompositionController:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F910D8] sharedPresetManager];
    v7 = [(PUPhotoEditCopyEditsViewController *)self asset];
    uint64_t v8 = [v12 smartCopyEnabled];
    v9 = [v12 analyticsPayload];
    [v6 copyPresetFromCompositionController:v4 sourceAsset:v7 smartCopyEnabled:v8 configurationAnalyticsPayload:v9];
  }
  v10 = [(PUPhotoEditCopyEditsViewController *)self completionHandler];

  if (v10)
  {
    v11 = [(PUPhotoEditCopyEditsViewController *)self completionHandler];
    v11[2](v11, v5);
  }
}

- (void)switchControlDidSwitch:(id)a3
{
  id v4 = a3;
  [v4 tag];
  uint64_t v5 = [(PUPhotoEditCopyEditsViewController *)self configuration];
  v6 = [v5 settings];
  v7 = PFFind();

  objc_msgSend(v7, "setEnabled:", objc_msgSend(v7, "enabled") ^ 1);
  if ([v7 identifier] == 2)
  {
    uint64_t v8 = [(PUPhotoEditCopyEditsViewController *)self configuration];
    v9 = [v8 settings];
    v10 = PFFind();

    if (([v4 isOn] & 1) == 0)
    {
      [v10 setEnabled:0];
      v11 = [(PUPhotoEditCopyEditsViewController *)self smartSwitch];
      [v11 setOn:0];
    }
    uint64_t v12 = [v4 isOn];
    v13 = [(PUPhotoEditCopyEditsViewController *)self smartSwitch];
    [v13 setEnabled:v12];
  }
}

BOOL __61__PUPhotoEditCopyEditsViewController_switchControlDidSwitch___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier] == *(void *)(a1 + 32);
}

BOOL __61__PUPhotoEditCopyEditsViewController_switchControlDidSwitch___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier] == 6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v5 = [(PUPhotoEditCopyEditsViewController *)self sections];
  v6 = [v5 objectAtIndex:a4];
  v7 = [v6 footer];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5 = [(PUPhotoEditCopyEditsViewController *)self sections];
  v6 = [v5 objectAtIndex:a4];
  v7 = [v6 header];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUPhotoEditCopyEditsViewController *)self sections];
  v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v10 = [v9 items];
  v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));

  uint64_t v12 = [v7 dequeueReusableCellWithIdentifier:@"PUPhotoEditCopyEditsViewControllerCellReuseIdentifier" forIndexPath:v6];

  id v13 = [v12 accessoryView];
  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    [v13 addTarget:self action:sel_switchControlDidSwitch_ forControlEvents:4096];
    [v12 setAccessoryView:v13];
    if ([v11 identifier] == 6) {
      [(PUPhotoEditCopyEditsViewController *)self setSmartSwitch:v13];
    }
  }
  v14 = [v11 localizedTitle];
  v15 = [v12 textLabel];
  [v15 setText:v14];

  objc_msgSend(v13, "setTag:", objc_msgSend(v11, "identifier"));
  objc_msgSend(v13, "setOn:", objc_msgSend(v11, "enabled"));

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = [(PUPhotoEditCopyEditsViewController *)self sections];
  id v6 = [v5 objectAtIndex:a4];
  id v7 = [v6 items];
  int64_t v8 = [v7 count];

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(PUPhotoEditCopyEditsViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)viewDidLayoutSubviews
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)PUPhotoEditCopyEditsViewController;
  [(PUPhotoEditCopyEditsViewController *)&v28 viewDidLayoutSubviews];
  v3 = [(PUPhotoEditCopyEditsViewController *)self tableView];
  int64_t v4 = [v3 visibleCells];
  uint64_t v5 = [v4 firstObject];
  id v6 = [v5 textLabel];
  id v7 = [v6 font];

  if (v7)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int64_t v8 = [(PUPhotoEditCopyEditsViewController *)self configuration];
    v9 = [v8 settings];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      uint64_t v13 = *MEMORY[0x1E4FB06F8];
      double v14 = *MEMORY[0x1E4F1DB30];
      double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v16 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          v18 = [*(id *)(*((void *)&v24 + 1) + 8 * i) localizedTitle];
          uint64_t v29 = v13;
          v30 = v7;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          objc_msgSend(v18, "boundingRectWithSize:options:attributes:context:", 0, v19, 0, v14, v15);
          double v21 = v20;

          if (v21 > v16) {
            double v16 = v21;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v31 count:16];
      }
      while (v11);
    }
    else
    {
      double v16 = 0.0;
    }
  }
  else
  {
    double v16 = 0.0;
  }
  if (v16 + 150.0 >= 300.0) {
    double v22 = v16 + 150.0;
  }
  else {
    double v22 = 300.0;
  }
  v23 = [(PUPhotoEditCopyEditsViewController *)self tableView];
  [v23 contentSize];
  [(PUPhotoEditCopyEditsViewController *)self setPreferredContentSize:v22];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditCopyEditsViewController;
  [(PUPhotoEditCopyEditsViewController *)&v4 viewDidDisappear:a3];
  [(PUPhotoEditCopyEditsViewController *)self _finish];
}

- (void)viewDidLoad
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PUPhotoEditCopyEditsViewController;
  [(PUPhotoEditCopyEditsViewController *)&v21 viewDidLoad];
  v3 = PULocalizedString(@"PHOTOEDIT_COPY_EDITS_MENU_TITLE");
  [(PUPhotoEditCopyEditsViewController *)self setTitle:v3];

  objc_initWeak(&location, self);
  objc_super v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v5 = PULocalizedString(@"PHOTOEDIT_COPY_EDITS_MENU_ACTION");
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __49__PUPhotoEditCopyEditsViewController_viewDidLoad__block_invoke;
  v18 = &unk_1E5F2E7A8;
  objc_copyWeak(&v19, &location);
  id v6 = [v4 actionWithTitle:v5 image:0 identifier:0 handler:&v15];

  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  int64_t v8 = objc_msgSend(v7, "initWithPrimaryAction:", v6, v15, v16, v17, v18);
  [v8 setStyle:2];
  v9 = [v8 creatingFixedGroup];
  v22[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  uint64_t v11 = [(PUPhotoEditCopyEditsViewController *)self navigationItem];
  [v11 setTrailingItemGroups:v10];

  uint64_t v12 = [(PUPhotoEditCopyEditsViewController *)self tableView];
  [v12 registerClass:objc_opt_class() forCellReuseIdentifier:@"PUPhotoEditCopyEditsViewControllerCellReuseIdentifier"];

  uint64_t v13 = [(PUPhotoEditCopyEditsViewController *)self tableView];
  [v13 setAllowsSelection:0];

  double v14 = [(PUPhotoEditCopyEditsViewController *)self tableView];
  [v14 setAlwaysBounceVertical:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __49__PUPhotoEditCopyEditsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:&__block_literal_global_73627];
}

- (PUPhotoEditCopyEditsViewController)initWithCompositionController:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditCopyEditsViewController;
  int64_t v8 = [(PUPhotoEditCopyEditsViewController *)&v14 initWithStyle:2];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F91130]) initWithCompositionController:v6 asset:v7];
    configuration = v8->_configuration;
    v8->_configuration = (PECopyEditsConfiguration *)v9;

    objc_storeStrong((id *)&v8->_asset, a4);
    uint64_t v11 = +[PUPhotoEditCopyEditsViewController _sectionsForConfiguration:v8->_configuration];
    sections = v8->_sections;
    v8->_sections = (NSArray *)v11;
  }
  return v8;
}

+ (id)_sectionsForConfiguration:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [v3 settings];
  id v6 = PFFilter();

  if ([v6 count])
  {
    id v7 = [[PUCopyEditsSettingSection alloc] initWithItems:v6 header:0 footer:0];
    [v4 addObject:v7];
  }
  int64_t v8 = [v3 settings];
  uint64_t v9 = PFFind();

  if (v9)
  {
    uint64_t v10 = [PUCopyEditsSettingSection alloc];
    v15[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    uint64_t v12 = PELocalizedString();
    uint64_t v13 = [(PUCopyEditsSettingSection *)v10 initWithItems:v11 header:0 footer:v12];

    [v4 addObject:v13];
  }

  return v4;
}

BOOL __64__PUPhotoEditCopyEditsViewController__sectionsForConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier] == 6;
}

BOOL __64__PUPhotoEditCopyEditsViewController__sectionsForConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier] != 6;
}

+ (BOOL)shouldPresentForCopyingFromCompositionController:(id)a3 asset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PUPhotoEditProtoSettings sharedInstance];
  int v8 = [v7 enableSelectiveCopyEdits];

  if (v8)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F91130]) initWithCompositionController:v5 asset:v6];
    uint64_t v10 = +[PUPhotoEditCopyEditsViewController _sectionsForConfiguration:v9];
    BOOL v11 = [v10 count] != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

@end