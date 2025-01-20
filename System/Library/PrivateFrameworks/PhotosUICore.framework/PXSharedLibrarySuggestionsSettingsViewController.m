@interface PXSharedLibrarySuggestionsSettingsViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)sections;
- (PXSharedLibrarySuggestionsSettingsViewController)initWithSharedLibraryStatusProvider:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addSectionWithConfigurationHandler:(id)a3;
- (void)_handleDoneAction:(id)a3;
- (void)_update;
- (void)_updateCollectionViewCell:(id)a3 forRulePerson:(id)a4;
- (void)_updateSections;
- (void)addOtherPeople:(id)a3;
- (void)loadView;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)removePerson:(id)a3;
- (void)sharedLibraryRulePeopleControllerDidChangeCurrentSnapshot:(id)a3;
- (void)suggestionsEnabledChanged:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXSharedLibrarySuggestionsSettingsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleDataManager, 0);
  objc_storeStrong((id *)&self->_peopleCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_peopleCollectionView, 0);
  objc_storeStrong((id *)&self->_suggestionsEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
}

- (NSArray)sections
{
  return &self->_sections->super;
}

- (void)sharedLibraryRulePeopleControllerDidChangeCurrentSnapshot:(id)a3
{
  peopleCollectionViewDataSource = self->_peopleCollectionViewDataSource;
  id v5 = a3;
  v6 = [(UICollectionViewDiffableDataSource *)peopleCollectionViewDataSource snapshot];
  BOOL v7 = [v6 numberOfItems] < 1;

  v8 = self->_peopleCollectionViewDataSource;
  v9 = [v5 currentSnapshot];

  [(UICollectionViewDiffableDataSource *)v8 applySnapshot:v9 animatingDifferences:1];
  v10 = [(UICollectionViewDiffableDataSource *)self->_peopleCollectionViewDataSource snapshot];
  LODWORD(v5) = [v10 numberOfItems] > 0;

  if (((v7 ^ v5) & 1) == 0)
  {
    [(PXSharedLibrarySuggestionsSettingsViewController *)self _update];
  }
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PXSharedLibrarySuggestionsSettingsViewController_picker_didFinishPicking___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  id v8 = v5;
  v9 = self;
  id v6 = v5;
  [(PXSharedLibrarySuggestionsSettingsViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

void __76__PXSharedLibrarySuggestionsSettingsViewController_picker_didFinishPicking___block_invoke()
{
}

void __76__PXSharedLibrarySuggestionsSettingsViewController_picker_didFinishPicking___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Error adding person to Shared Library rule: %@", (uint8_t *)&v10, 0xCu);
    }

    BOOL v7 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySharingSuggestionAddPeopleFailureAlertTitle");
    id v8 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");
    v9 = +[PXViewControllerPresenter defaultPresenterWithViewController:*(void *)(a1 + 32)];
    PXPresentFailureWithLocalizedTitle(v7, v8, 0, v5, v9, 0);
  }
}

id __76__PXSharedLibrarySuggestionsSettingsViewController_picker_didFinishPicking___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F391F0];
  v3 = [a2 itemIdentifier];
  v4 = [v2 uuidFromLocalIdentifier:v3];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [v13 deselectRowAtIndexPath:v6 animated:1];
  BOOL v7 = [(PXSharedLibrarySuggestionsSettingsViewController *)self sections];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = [v8 items];
  int v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

  if ([v10 action])
  {
    id v11 = [v13 cellForRowAtIndexPath:v6];
    uint64_t v12 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v12, "sendAction:to:from:forEvent:", objc_msgSend(v10, "action"), self, v11, 0);
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PXSharedLibrarySuggestionsSettingsViewController *)self sections];
  BOOL v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  id v8 = [v7 items];
  v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));

  if ([v9 refusesSelection]) {
    int v10 = 0;
  }
  else {
    int v10 = v5;
  }
  id v11 = v10;

  return v11;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PXSharedLibrarySuggestionsSettingsViewController *)self sections];
  BOOL v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  id v8 = [v7 items];
  uint64_t v9 = [v5 item];

  int v10 = [v8 objectAtIndexedSubscript:v9];

  LOBYTE(v6) = [v10 refusesSelection] ^ 1;
  return (char)v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = [(PXSharedLibrarySuggestionsSettingsViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  BOOL v7 = [v6 caption];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(PXSharedLibrarySuggestionsSettingsViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  BOOL v7 = [v6 title];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v44[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXSharedLibrarySuggestionsSettingsViewController *)self sections];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  int v10 = [v9 items];
  id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

  uint64_t v12 = [v11 customView];
  if (v12) {
    id v13 = @"CustomCell";
  }
  else {
    id v13 = @"DefaultCell";
  }
  v14 = [v6 dequeueReusableCellWithIdentifier:v13 forIndexPath:v7];

  if (v12)
  {
    v15 = [v14 viewWithTag:999];
    if (v15 != v12)
    {
      id v43 = v15;
      [v15 removeFromSuperview];
      [v12 setTag:999];
      v16 = [v14 contentView];
      [v16 addSubview:v12];

      v34 = (void *)MEMORY[0x1E4F28DC8];
      v41 = [v14 contentView];
      v40 = [v41 leadingAnchor];
      v39 = [v12 leadingAnchor];
      v38 = [v40 constraintEqualToAnchor:v39];
      v44[0] = v38;
      v37 = [v14 contentView];
      v36 = [v37 topAnchor];
      v35 = [v12 topAnchor];
      v33 = [v36 constraintEqualToAnchor:v35];
      v44[1] = v33;
      v32 = [v14 contentView];
      v31 = [v32 trailingAnchor];
      v17 = [v12 trailingAnchor];
      v18 = [v31 constraintEqualToAnchor:v17];
      v44[2] = v18;
      [v14 contentView];
      v19 = id v42 = v6;
      v20 = [v19 bottomAnchor];
      v21 = [v12 bottomAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      v44[3] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
      [v34 activateConstraints:v23];

      id v6 = v42;
      v15 = v43;
    }
  }
  else
  {
    v24 = [v14 defaultContentConfiguration];
    v25 = [v11 image];
    [v24 setImage:v25];

    v26 = [v11 title];
    [v24 setText:v26];

    if ([v11 action])
    {
      v27 = [v6 tintColor];
      v28 = [v24 textProperties];
      [v28 setColor:v27];
    }
    [v14 setContentConfiguration:v24];
    v29 = [v11 accessoryView];
    [v14 setAccessoryView:v29];
  }
  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(PXSharedLibrarySuggestionsSettingsViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 items];
  int64_t v8 = [v7 count];

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(PXSharedLibrarySuggestionsSettingsViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)_handleDoneAction:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibrarySuggestionsSettingsViewController;
  [(PXSharedLibrarySuggestionsSettingsViewController *)&v12 viewWillAppear:a3];
  int64_t v4 = [(PXSharedLibrarySuggestionsSettingsViewController *)self navigationController];
  id v5 = [v4 viewControllers];
  id v6 = [v5 firstObject];
  if (v6 == self)
  {
    int64_t v8 = [v4 presentingViewController];
    uint64_t v9 = [v8 presentedViewController];

    if (v9 != v4) {
      goto LABEL_5;
    }
    id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v5 = PXLocalizedStringFromTable(@"PXDone", @"PhotosUICore");
    id v7 = (PXSharedLibrarySuggestionsSettingsViewController *)[v10 initWithTitle:v5 style:2 target:self action:sel__handleDoneAction_];
    id v11 = [(PXSharedLibrarySuggestionsSettingsViewController *)self navigationItem];
    [v11 setRightBarButtonItem:v7];
  }
  else
  {
    id v7 = v6;
  }

LABEL_5:
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibrarySuggestionsSettingsViewController;
  [(PXSharedLibrarySuggestionsSettingsViewController *)&v7 viewDidLoad];
  v3 = [[PXSharedLibraryRulePeopleDataManager alloc] initWithSharedLibraryStatusProvider:self->_sharedLibraryStatusProvider];
  peopleDataManager = self->_peopleDataManager;
  self->_peopleDataManager = v3;

  [(PXSharedLibraryRulePeopleDataManager *)self->_peopleDataManager setDelegate:self];
  peopleCollectionViewDataSource = self->_peopleCollectionViewDataSource;
  id v6 = [(PXSharedLibraryRulePeopleDataManager *)self->_peopleDataManager currentSnapshot];
  [(UICollectionViewDiffableDataSource *)peopleCollectionViewDataSource applySnapshot:v6 animatingDifferences:0];

  [(PXSharedLibrarySuggestionsSettingsViewController *)self _update];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  int64_t v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setLayoutMarginsFollowReadableWidth:1];
  [(UITableView *)self->_tableView _setSectionContentInsetFollowsLayoutMargins:1];
  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"DefaultCell"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"CustomCell"];
  id v6 = self->_tableView;
  [(PXSharedLibrarySuggestionsSettingsViewController *)self setView:v6];
}

- (void)_updateCollectionViewCell:(id)a3 forRulePerson:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [v7 minusButton];
  [v8 setHidden:0];

  [v7 setRemoveTarget:self];
  [v7 setRemoveAction:sel_removePerson_];
  uint64_t v9 = [v6 person];
  [v7 setImagePerson:v9];

  id v11 = [v6 displayName];

  id v10 = [v7 nameLabel];

  [v10 setText:v11];
}

- (void)_update
{
  [(PXSharedLibrarySuggestionsSettingsViewController *)self _updateSections];
  tableView = self->_tableView;
  [(UITableView *)tableView reloadData];
}

- (void)_updateSections
{
  [(NSMutableArray *)self->_sections removeAllObjects];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke;
  v7[3] = &unk_1E5DB3F30;
  void v7[4] = self;
  [(PXSharedLibrarySuggestionsSettingsViewController *)self _addSectionWithConfigurationHandler:v7];
  if ([(UISwitch *)self->_suggestionsEnabledSwitch isOn])
  {
    if ([(UICollectionView *)self->_peopleCollectionView numberOfSections] < 1
      || [(UICollectionView *)self->_peopleCollectionView numberOfItemsInSection:0] < 1)
    {
      char v3 = 0;
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_3;
      v6[3] = &unk_1E5DB3F30;
      v6[4] = self;
      [(PXSharedLibrarySuggestionsSettingsViewController *)self _addSectionWithConfigurationHandler:v6];
      char v3 = 1;
    }
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_5;
    v4[3] = &__block_descriptor_33_e41_v16__0___PXSharedLibrarySettingsSection_8l;
    char v5 = v3;
    [(PXSharedLibrarySuggestionsSettingsViewController *)self _addSectionWithConfigurationHandler:v4];
  }
}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_2;
  v4[3] = &unk_1E5DB3F08;
  void v4[4] = *(void *)(a1 + 32);
  id v2 = a2;
  [v2 addItemWithConfigurationHandler:v4];
  char v3 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_SuggestionsToggle_Footer");
  [v2 setCaption:v3];
}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_SuggestionsPeople_Title");
  [v3 setTitle:v4];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_4;
  v5[3] = &unk_1E5DB3F08;
  v5[4] = *(void *)(a1 + 32);
  [v3 addItemWithConfigurationHandler:v5];
}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_5(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_6;
  v4[3] = &__block_descriptor_33_e38_v16__0___PXSharedLibrarySettingsItem_8l;
  char v5 = *(unsigned char *)(a1 + 32);
  id v2 = a2;
  [v2 addItemWithConfigurationHandler:v4];
  id v3 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_PeopleSelection_ButtonFooter");
  [v2 setCaption:v3];
}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_6(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    id v2 = @"PXSharedLibraryAssistant_PeopleSelection_ButtonTitle_AddOthers";
  }
  else {
    id v2 = @"PXSharedLibraryAssistant_PeopleSelection_ButtonTitle_Add";
  }
  id v5 = a2;
  id v3 = PXLocalizedSharedLibraryString(v2);
  [v5 setTitle:v3];

  int64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
  [v5 setImage:v4];

  [v5 setAction:sel_addOtherPeople_];
}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1008);
  id v3 = a2;
  [v3 setCustomView:v2];
  [v3 setRefusesSelection:1];
}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_SuggestionsToggle_Title");
  [v4 setTitle:v3];

  [v4 setAccessoryView:*(void *)(*(void *)(a1 + 32) + 1000)];
  [v4 setRefusesSelection:1];
}

- (void)_addSectionWithConfigurationHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (id)objc_opt_new();
  v4[2](v4, v5);

  [(NSMutableArray *)self->_sections addObject:v5];
}

- (void)addOtherPeople:(id)a3
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F399B0]);
  id v4 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_PeopleSelection_PickerTitle_AddOthers");
  [v10 setPurpose:v4];

  [v10 setAllowsEditingCollection:1];
  id v5 = [(PXSharedLibraryRulePeopleDataManager *)self->_peopleDataManager currentPersonIdentifiers];
  [v10 setDisabledIdentifiers:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F39930]);
  id v7 = [(PXSharedLibraryStatusProvider *)self->_sharedLibraryStatusProvider photoLibrary];
  int64_t v8 = (void *)[v6 initWithPhotoLibrary:v7];

  [v8 setSelectionLimit:0];
  [v8 _setSourceType:1];
  [v8 _setPeopleConfiguration:v10];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v8];
  [v9 setDelegate:self];
  [(PXSharedLibrarySuggestionsSettingsViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)removePerson:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibrarySuggestionsSettingsViewController.m", 160, @"%@ should be an instance inheriting from %@, but it is %@", @"sender", v14, v16 object file lineNumber description];
  }
  else
  {
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibrarySuggestionsSettingsViewController.m", 160, @"%@ should be an instance inheriting from %@, but it is nil", @"sender", v14 object file lineNumber description];
  }

LABEL_3:
  id v6 = [(UICollectionView *)self->_peopleCollectionView indexPathForCell:v5];
  id v7 = [(UICollectionViewDiffableDataSource *)self->_peopleCollectionViewDataSource itemIdentifierForIndexPath:v6];
  int64_t v8 = [v7 person];
  if (v8)
  {
    uint64_t v9 = [(PXSharedLibraryStatusProvider *)self->_sharedLibraryStatusProvider sharedLibrary];
    id v10 = [v8 uuid];
    v18[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__PXSharedLibrarySuggestionsSettingsViewController_removePerson___block_invoke;
    v17[3] = &unk_1E5DD3158;
    v17[4] = self;
    [v9 removePersonUUIDsFromPersonCondition:v11 completion:v17];
  }
}

void __65__PXSharedLibrarySuggestionsSettingsViewController_removePerson___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Error removing person from Shared Library rule: %@", (uint8_t *)&v10, 0xCu);
    }

    id v7 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySharingSuggestionRemovePeopleFailureAlertTitle");
    int64_t v8 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");
    uint64_t v9 = +[PXViewControllerPresenter defaultPresenterWithViewController:*(void *)(a1 + 32)];
    PXPresentFailureWithLocalizedTitle(v7, v8, 0, v5, v9, 0);
  }
}

- (void)suggestionsEnabledChanged:(id)a3
{
  [(UISwitch *)self->_suggestionsEnabledSwitch isOn];
  PXPreferencesSetSharedLibrarySuggestionsEnabled();
  [(PXSharedLibrarySuggestionsSettingsViewController *)self _update];
}

- (PXSharedLibrarySuggestionsSettingsViewController)initWithSharedLibraryStatusProvider:(id)a3
{
  location[1] = *(id *)MEMORY[0x1E4F143B8];
  id v39 = a3;
  if (!v39)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PXSharedLibrarySuggestionsSettingsViewController.m", 122, @"Invalid parameter not satisfying: %@", @"sharedLibraryStatusProvider" object file lineNumber description];
  }
  v44.receiver = self;
  v44.super_class = (Class)PXSharedLibrarySuggestionsSettingsViewController;
  id v6 = [(PXSharedLibrarySuggestionsSettingsViewController *)&v44 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharedLibraryStatusProvider, a3);
    uint64_t v8 = objc_opt_new();
    sections = v7->_sections;
    v7->_sections = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    suggestionsEnabledSwitch = v7->_suggestionsEnabledSwitch;
    v7->_suggestionsEnabledSwitch = (UISwitch *)v10;

    [(UISwitch *)v7->_suggestionsEnabledSwitch setOn:PLIsSharedLibrarySuggestionsEnabled()];
    [(UISwitch *)v7->_suggestionsEnabledSwitch addTarget:v7 action:sel_suggestionsEnabledChanged_ forControlEvents:4096];
    v38 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v37 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
    uint64_t v12 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v38 heightDimension:v37];
    id v13 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v12];
    v14 = [MEMORY[0x1E4FB1308] absoluteDimension:92.0];
    v15 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v14 heightDimension:v14];
    v16 = (void *)MEMORY[0x1E4FB1318];
    location[0] = v13;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:location count:1];
    v18 = [v16 horizontalGroupWithLayoutSize:v15 subitems:v17];

    v19 = [MEMORY[0x1E4FB1330] sectionWithGroup:v18];
    [v19 setInterGroupSpacing:12.0];
    objc_msgSend(v19, "setContentInsets:", 18.0, 18.0, 32.0, 18.0);
    v20 = objc_opt_new();
    [v20 setScrollDirection:1];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSection:v19 configuration:v20];
    id v22 = objc_alloc(MEMORY[0x1E4FB1568]);
    uint64_t v23 = objc_msgSend(v22, "initWithFrame:collectionViewLayout:", v21, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

    peopleCollectionView = v7->_peopleCollectionView;
    v7->_peopleCollectionView = (UICollectionView *)v23;

    [(UICollectionView *)v7->_peopleCollectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v7->_peopleCollectionView setBackgroundColor:v25];

    [(UICollectionView *)v7->_peopleCollectionView setDelegate:v7];
    v26 = [(UICollectionView *)v7->_peopleCollectionView heightAnchor];
    v27 = [v26 constraintEqualToConstant:150.0];
    [v27 setActive:1];

    objc_initWeak(location, v7);
    v28 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v29 = objc_opt_class();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __88__PXSharedLibrarySuggestionsSettingsViewController_initWithSharedLibraryStatusProvider___block_invoke;
    v42[3] = &unk_1E5DB3EB8;
    objc_copyWeak(&v43, location);
    v30 = [v28 registrationWithCellClass:v29 configurationHandler:v42];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__PXSharedLibrarySuggestionsSettingsViewController_initWithSharedLibraryStatusProvider___block_invoke_2;
    aBlock[3] = &unk_1E5DB3EE0;
    id v31 = v30;
    id v41 = v31;
    v32 = _Block_copy(aBlock);
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4FB1598]) initWithCollectionView:v7->_peopleCollectionView cellProvider:v32];
    peopleCollectionViewDataSource = v7->_peopleCollectionViewDataSource;
    v7->_peopleCollectionViewDataSource = (UICollectionViewDiffableDataSource *)v33;

    objc_destroyWeak(&v43);
    objc_destroyWeak(location);
  }

  return v7;
}

void __88__PXSharedLibrarySuggestionsSettingsViewController_initWithSharedLibraryStatusProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _updateCollectionViewCell:v7 forRulePerson:v6];
}

uint64_t __88__PXSharedLibrarySuggestionsSettingsViewController_initWithSharedLibraryStatusProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

@end