@interface PBFConfigViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3;
- (id)_posterConfigurationAtIndexPath:(id)a3;
- (id)_posterPathAtIndexPath:(id)a3;
- (id)_previewForPathAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_presentPath:(id)a3 mode:(int64_t)a4;
- (void)_reloadData;
- (void)_selectConfiguration:(id)a3;
- (void)_toggleEdit:(id)a3;
- (void)_updateEditing:(BOOL)a3;
- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)posterExtensionDataStore:(id)a3 didUpdateSelectedConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6;
- (void)posterExtensionDataStoreDidUpdateConfigurations:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PBFConfigViewController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PBFConfigViewController;
  [(PBFConfigViewController *)&v10 viewDidLoad];
  v3 = [(PBFConfigViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"LOL"];

  if (!self->_glue)
  {
    v4 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
    glue = self->_glue;
    self->_glue = v4;

    v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
    [v6 addObserver:self];

    v7 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
    v8 = [v7 switcherConfiguration];
    switcherConfiguration = self->_switcherConfiguration;
    self->_switcherConfiguration = v8;
  }
  [(PBFConfigViewController *)self _updateEditing:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBFConfigViewController;
  [(PBFConfigViewController *)&v4 viewWillAppear:a3];
  [(PBFConfigViewController *)self _reloadData];
}

- (void)_toggleEdit:(id)a3
{
  objc_super v4 = [(PBFConfigViewController *)self tableView];
  v5 = [(PBFConfigViewController *)self tableView];
  objc_msgSend(v4, "setEditing:", objc_msgSend(v5, "isEditing") ^ 1);

  id v6 = [(PBFConfigViewController *)self tableView];
  -[PBFConfigViewController _updateEditing:](self, "_updateEditing:", [v6 isEditing]);
}

- (void)_updateEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  if (v3) {
    id v6 = @"Done";
  }
  else {
    id v6 = @"Edit";
  }
  id v8 = (id)[v5 initWithTitle:v6 style:2 target:self action:sel__toggleEdit_];
  v7 = [(PBFConfigViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v8];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_configurations count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FB1D08];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithStyle:3 reuseIdentifier:@"LOL"];
  id v8 = [(PBFConfigViewController *)self _posterPathAtIndexPath:v6];
  v9 = [v8 identity];
  objc_super v10 = [v9 posterUUID];
  v11 = [v10 UUIDString];

  v12 = [v7 textLabel];
  [v12 setText:v11];

  v13 = [v7 detailTextLabel];
  v14 = NSNumber;
  v15 = [v8 identity];
  v16 = objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v15, "version"));
  v17 = [v16 description];
  [v13 setText:v17];

  v18 = [(PBFConfigViewController *)self _posterConfigurationAtIndexPath:v6];

  v19 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
  v20 = [(UIViewController *)self pbf_displayContext];
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __59__PBFConfigViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v31 = &unk_1E6983A98;
  id v21 = v7;
  id v32 = v21;
  id v22 = v11;
  id v33 = v22;
  [v19 fetchSwitcherSnapshotForConfiguration:v18 context:v20 completion:&v28];

  v23 = [(PRSwitcherConfiguration *)self->_switcherConfiguration selectedConfiguration];
  LODWORD(v11) = [v18 isEqual:v23];

  if (v11)
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v24 setText:@"⭐️"];
    [v24 sizeToFit];
    [v21 setAccessoryView:v24];
  }
  else
  {
    [v21 setAccessoryView:0];
  }
  v25 = v33;
  id v26 = v21;

  return v26;
}

void __59__PBFConfigViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PBFConfigViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_1E6981338;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__PBFConfigViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v8 = [*(id *)(a1 + 40) imageView];
    v2 = [v8 image];
    if (v2)
    {
    }
    else
    {
      id v3 = [*(id *)(a1 + 40) textLabel];
      id v4 = [v3 text];
      int v5 = [v4 isEqualToString:*(void *)(a1 + 48)];

      if (v5)
      {
        id v6 = [*(id *)(a1 + 40) imageView];
        [v6 setImage:*(void *)(a1 + 32)];

        [*(id *)(a1 + 40) setNeedsLayout];
        id v7 = *(void **)(a1 + 40);
        [v7 layoutIfNeeded];
      }
    }
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return @"Configurations";
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PBFConfigViewController *)self _posterPathAtIndexPath:v6];
  [(PBFConfigViewController *)self _presentPath:v8 mode:2];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E4FB1678];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v17[3] = &unk_1E6983AC0;
  objc_copyWeak(&v19, &location);
  id v10 = v8;
  id v18 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v14[3] = &unk_1E6983B10;
  objc_copyWeak(&v16, &location);
  id v11 = v10;
  id v15 = v11;
  v12 = [v9 configurationWithIdentifier:@"LOL" previewProvider:v17 actionProvider:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v12;
}

id __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _previewForPathAtIndexPath:*(void *)(a1 + 32)];

  return v3;
}

id __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1, void *a2)
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v15 = (void *)MEMORY[0x1E4FB1970];
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  id v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.pencil"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_3;
  v23[3] = &unk_1E6983AE8;
  objc_copyWeak(&v25, (id *)(a1 + 40));
  id v24 = *(id *)(a1 + 32);
  id v4 = [v3 actionWithTitle:@"Edit" image:v16 identifier:@"EDIT" handler:v23];
  v26[0] = v4;
  int v5 = (void *)MEMORY[0x1E4FB13F0];
  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"wand.and.stars.inverse"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_4;
  v20[3] = &unk_1E6983AE8;
  objc_copyWeak(&v22, (id *)(a1 + 40));
  id v21 = *(id *)(a1 + 32);
  id v7 = [v5 actionWithTitle:@"Render" image:v6 identifier:@"RENDER" handler:v20];
  v26[1] = v7;
  id v8 = (void *)MEMORY[0x1E4FB13F0];
  v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star.fill"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_5;
  v17[3] = &unk_1E6983AE8;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  id v18 = *(id *)(a1 + 32);
  id v10 = [v8 actionWithTitle:@"Select" image:v9 identifier:@"SELECT" handler:v17];
  v26[2] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  v12 = [v15 menuWithTitle:@"MAIN MENU" children:v11];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v25);
  return v12;
}

void __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = WeakRetained;
  id v4 = [v5 _posterPathAtIndexPath:v3];
  [v5 _presentPath:v4 mode:2];
}

void __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = WeakRetained;
  id v4 = [v5 _posterPathAtIndexPath:v3];
  [v5 _presentPath:v4 mode:1];
}

void __85__PBFConfigViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = WeakRetained;
  id v4 = [v5 _posterConfigurationAtIndexPath:v3];
  [v5 _selectConfiguration:v4];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v10 = [(PBFConfigViewController *)self _posterConfigurationAtIndexPath:a5];
    id v7 = (void *)[(PRSwitcherConfiguration *)self->_switcherConfiguration mutableCopy];
    [v7 removeConfiguration:v10];
    id v8 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
    id v9 = (id)[v8 updateDataStoreForSwitcherConfiguration:v7 reason:@"PBFConfigViewController commit editing style" error:0];
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  switcherConfiguration = self->_switcherConfiguration;
  id v19 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[(PRSwitcherConfiguration *)switcherConfiguration mutableCopy];
  v12 = [v11 configurations];
  v13 = (void *)[v12 mutableCopy];

  v20 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v9, "row"));
  objc_msgSend(v13, "removeObjectAtIndex:", objc_msgSend(v9, "row"));
  objc_msgSend(v13, "insertObject:atIndex:", v20, objc_msgSend(v19, "row"));
  [v11 setConfigurations:v13];
  id v14 = self->_glue;
  id v15 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)v14 dataStore];
  id v21 = 0;
  id v16 = [v15 updateDataStoreForSwitcherConfiguration:v11 reason:@"PBFConfigViewController moveRowAtIndexPath" error:&v21];
  id v17 = v21;

  id v18 = self->_switcherConfiguration;
  self->_switcherConfiguration = v16;

  [v10 beginUpdates];
  [v10 moveRowAtIndexPath:v9 toIndexPath:v19];

  [v10 endUpdates];
}

- (void)_selectConfiguration:(id)a3
{
  switcherConfiguration = self->_switcherConfiguration;
  id v5 = a3;
  id v8 = (id)[(PRSwitcherConfiguration *)switcherConfiguration mutableCopy];
  [v8 setSelectedConfiguration:v5];

  id v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
  id v7 = (id)[v6 updateDataStoreForSwitcherConfiguration:v8 reason:@"PBFConfigViewController selectConfiguration" error:0];

  [(PBFConfigViewController *)self _reloadData];
}

- (id)_posterPathAtIndexPath:(id)a3
{
  uint64_t v3 = -[NSArray objectAtIndex:](self->_configurations, "objectAtIndex:", [a3 row]);
  id v4 = [v3 _path];

  return v4;
}

- (id)_posterConfigurationAtIndexPath:(id)a3
{
  configurations = self->_configurations;
  uint64_t v4 = [a3 row];
  return [(NSArray *)configurations objectAtIndex:v4];
}

- (void)_reloadData
{
  if (MEMORY[0x1D9433950]("-[PBFConfigViewController _reloadData]", a2))
  {
    uint64_t v3 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
    uint64_t v4 = [v3 switcherConfiguration];
    switcherConfiguration = self->_switcherConfiguration;
    self->_switcherConfiguration = v4;

    id v6 = [(PRSwitcherConfiguration *)self->_switcherConfiguration configurations];
    configurations = self->_configurations;
    self->_configurations = v6;

    id v8 = [(PBFConfigViewController *)self tableView];
    [v8 reloadData];
  }
}

- (void)_presentPath:(id)a3 mode:(int64_t)a4
{
  id v13 = a3;
  id v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
  id v7 = [v6 providerForPath:v13];

  if (v13 && v7)
  {
    id v8 = (void *)MEMORY[0x1E4F924A8];
    id v9 = [v7 identity];
    id v10 = [MEMORY[0x1E4F29128] UUID];
    id v11 = [v8 extensionInstanceForIdentity:v9 instanceIdentifier:v10];

    if (a4 == 2)
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F925A8]) initWithProvider:v11 contents:v13];
      [v12 setDelegate:self];
    }
    else
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F92708]) initWithProvider:v11 contents:v13 previewing:a4 == 1];
    }

    [v12 setModalPresentationStyle:0];
    [(PBFConfigViewController *)self presentViewController:v12 animated:1 completion:0];
  }
}

- (id)_previewForPathAtIndexPath:(id)a3
{
  uint64_t v4 = [(PBFConfigViewController *)self _posterPathAtIndexPath:a3];
  id v5 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
  id v6 = [v5 providerForPath:v4];

  id v7 = (void *)MEMORY[0x1E4F924A8];
  id v8 = [v6 identity];
  id v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = [v7 extensionInstanceForIdentity:v8 instanceIdentifier:v9];

  id v11 = 0;
  if (v4 && v10) {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F92708]) initWithProvider:v10 contents:v4 previewing:1];
  }

  return v11;
}

- (void)posterExtensionDataStoreDidUpdateConfigurations:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PBFConfigViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke;
  block[3] = &unk_1E69808C0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__PBFConfigViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadData];
}

- (void)posterExtensionDataStore:(id)a3 didUpdateSelectedConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__PBFConfigViewController_posterExtensionDataStore_didUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke;
  block[3] = &unk_1E69808C0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __114__PBFConfigViewController_posterExtensionDataStore_didUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadData];
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  id v5 = [(PBFConfigViewController *)self view];
  id v6 = [v5 window];
  id v7 = [v6 windowScene];
  id v8 = [v7 _FBSScene];
  id v18 = [v8 settings];

  objc_msgSend(v18, "prui_leadingTopButtonFrame");
  retstr->leadingTopButtonFrame.origin.x = v9;
  retstr->leadingTopButtonFrame.origin.y = v10;
  retstr->leadingTopButtonFrame.size.width = v11;
  retstr->leadingTopButtonFrame.size.height = v12;
  objc_msgSend(v18, "prui_trailingTopButtonFrame");
  retstr->trailingTopButtonFrame.origin.x = v13;
  retstr->trailingTopButtonFrame.origin.y = v14;
  retstr->trailingTopButtonFrame.size.width = v15;
  retstr->trailingTopButtonFrame.size.height = v16;

  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a4 == 1)
  {
    CGFloat v16 = [v12 contentsIdentity];
    id v17 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
    id v18 = objc_alloc(MEMORY[0x1E4F925C0]);
    id v19 = [v13 _path];
    v20 = (void *)[v18 initWithNewPath:v19 destinationPosterUUID:0 sourceIdentity:v16 configuredProperties:v14 attributes:0];

    id v21 = [v17 switcherConfiguration];
    id v22 = (void *)[v21 mutableCopy];

    [v22 ingestNewPosterConfiguration:v20];
    id v30 = 0;
    id v23 = (id)[v17 updateDataStoreForSwitcherConfiguration:v22 reason:@"PBFConfigViewController ingest new poster" error:&v30];
    id v24 = v30;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __139__PBFConfigViewController_editingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke;
    v26[3] = &unk_1E6983A18;
    id v27 = v12;
    id v28 = v24;
    id v29 = v15;
    id v25 = v24;
    dispatch_async(MEMORY[0x1E4F14428], v26);
  }
  else
  {
    [v12 dismissViewControllerAnimated:1 completion:0];
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
}

uint64_t __139__PBFConfigViewController_editingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_switcherConfiguration, 0);
  objc_storeStrong((id *)&self->_glue, 0);
}

@end