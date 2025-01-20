@interface PXSharedLibraryAssistantRulesViewController
- (NSString)footerText;
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXSharedLibraryAssistantRulesViewController)initWithViewModel:(id)a3;
- (PXSharedLibraryAssistantViewModel)viewModel;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_continueWithPhotosPicker;
- (void)_continueWithPolicy:(int64_t)a3;
- (void)_handlePickerResults:(id)a3;
- (void)_updateIcon;
- (void)continueAndSkipMovingItems;
- (void)continueWithSelectedRuleType;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryAssistantRulesViewController

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __112__PXSharedLibraryAssistantRulesViewController_Internal_PHPickerViewControllerDelegate__picker_didFinishPicking___block_invoke;
  v8[3] = &unk_1E5DD32A8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 dismissViewControllerAnimated:1 completion:v8];
}

uint64_t __112__PXSharedLibraryAssistantRulesViewController_Internal_PHPickerViewControllerDelegate__picker_didFinishPicking___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePickerResults:*(void *)(a1 + 40)];
}

- (void)_handlePickerResults:(id)a3
{
}

uint64_t __78__PXSharedLibraryAssistantRulesViewController_Internal___handlePickerResults___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAssetLocalIdentifiers:*(void *)(a1 + 32)];
}

uint64_t __78__PXSharedLibraryAssistantRulesViewController_Internal___handlePickerResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetIdentifier];
}

- (void)_continueWithPhotosPicker
{
  v3 = [(PXSharedLibraryAssistantRulesViewController *)self viewModel];
  v4 = [v3 sourceLibraryInfo];
  id v10 = [v4 pickerConfiguration];

  [v10 setSelectionLimit:0];
  v5 = [(PXSharedLibraryAssistantRulesViewController *)self viewModel];
  uint64_t v6 = [v5 assetLocalIdentifiers];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
  }
  [v10 setPreselectedAssetIdentifiers:v8];

  [v10 setDisabledCapabilities:16];
  [v10 _setDisabledPrivateCapabilities:7];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v10];
  [v9 setDelegate:self];
  [(PXSharedLibraryAssistantRulesViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_continueWithPolicy:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = [(PXSharedLibraryAssistantRulesViewController *)self viewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PXSharedLibraryAssistantRulesViewController_Internal___continueWithPolicy___block_invoke;
  v7[3] = &__block_descriptor_40_e52_v16__0___PXSharedLibraryAssistantMutableViewModel__8l;
  v7[4] = a3;
  [v5 performChanges:v7];

  uint64_t v6 = [(PXSharedLibraryAssistantRulesViewController *)self assistantViewControllerDelegate];
  if (!v6) {
    PXAssertGetLog();
  }
  [v6 stepForwardInAssistantForAssistantViewController:self];
}

uint64_t __77__PXSharedLibraryAssistantRulesViewController_Internal___continueWithPolicy___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAutoSharePolicy:*(void *)(a1 + 32)];
}

- (NSString)footerText
{
  v2 = [(PXSharedLibraryAssistantRulesViewController *)self viewModel];
  uint64_t v3 = [v2 selectedRuleType];

  if ((unint64_t)(v3 - 1) >= 2) {
    v4 = @"PXSharedLibraryAssistant_Rules_Footer_PreviewBefore";
  }
  else {
    v4 = @"PXSharedLibraryAssistant_Rules_Footer_AlbumsNotIncluded_And_PreviewBefore";
  }
  v5 = PXLocalizedSharedLibraryString(v4);
  return (NSString *)v5;
}

- (void)continueWithSelectedRuleType
{
  id v7 = [(PXSharedLibraryAssistantRulesViewController *)self viewModel];
  uint64_t v4 = [v7 selectedRuleType];
  v5 = &__block_literal_global_198_77409;
  switch(v4)
  {
    case 0:
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", &__block_literal_global_198_77409);
      [v6 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantRulesViewController+Internal.m" lineNumber:44 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      goto LABEL_3;
    case 2:
      v5 = &__block_literal_global_200;
LABEL_3:
      [v7 performChanges:v5];
      goto LABEL_5;
    case 3:
      [v7 performChanges:&__block_literal_global_202_77408];
      [(PXSharedLibraryAssistantRulesViewController *)self _continueWithPhotosPicker];
      goto LABEL_7;
    default:
      uint64_t v4 = 0;
LABEL_5:
      [(PXSharedLibraryAssistantRulesViewController *)self _continueWithPolicy:v4];
LABEL_7:

      return;
  }
}

void __85__PXSharedLibraryAssistantRulesViewController_Internal__continueWithSelectedRuleType__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setStartDate:0];
  uint64_t v2 = MEMORY[0x1E4F1CBF0];
  [v3 setPersonUUIDs:MEMORY[0x1E4F1CBF0]];
  [v3 setAssetLocalIdentifiers:v2];
}

uint64_t __85__PXSharedLibraryAssistantRulesViewController_Internal__continueWithSelectedRuleType__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAssetLocalIdentifiers:MEMORY[0x1E4F1CBF0]];
}

void __85__PXSharedLibraryAssistantRulesViewController_Internal__continueWithSelectedRuleType__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setStartDate:0];
  [v2 setPersonUUIDs:MEMORY[0x1E4F1CBF0]];
}

- (void)continueAndSkipMovingItems
{
  id v3 = [(PXSharedLibraryAssistantRulesViewController *)self viewModel];
  [v3 performChanges:&__block_literal_global_77416];

  [(PXSharedLibraryAssistantRulesViewController *)self _continueWithPolicy:0];
}

uint64_t __83__PXSharedLibraryAssistantRulesViewController_Internal__continueAndSkipMovingItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAssetLocalIdentifiers:MEMORY[0x1E4F1CBF0]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_listViewItems, 0);
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
  return (PXAssistantViewControllerDelegate *)WeakRetained;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(OBTableWelcomeController *)self tableView];
  id v7 = [v6 cellForRowAtIndexPath:v5];

  [v7 setAccessoryType:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  continueButton = self->_continueButton;
  id v6 = a4;
  [(OBBoldTrayButton *)continueButton setEnabled:1];
  id v7 = -[NSArray objectAtIndexedSubscript:](self->_listViewItems, "objectAtIndexedSubscript:", [v6 row]);
  viewModel = self->_viewModel;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__PXSharedLibraryAssistantRulesViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v13[3] = &unk_1E5DD07C0;
  id v14 = v7;
  id v9 = v7;
  [(PXSharedLibraryAssistantViewModel *)viewModel performChanges:v13];
  id v10 = [(OBTableWelcomeController *)self tableView];
  v11 = [v10 cellForRowAtIndexPath:v6];

  [v11 setAccessoryType:3];
  v12 = [(OBTableWelcomeController *)self tableView];
  [v12 reloadData];
}

void __81__PXSharedLibraryAssistantRulesViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setSelectedRuleType:", objc_msgSend(v2, "tag"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"PXSharedLibraryRulesTableViewCellReuseIdentifier"];
  if (v8)
  {
    id v9 = v8;
    id v10 = [v8 contentConfiguration];
  }
  else
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"PXSharedLibraryRulesTableViewCellReuseIdentifier"];
    id v10 = [v9 defaultContentConfiguration];
    v11 = [v10 textProperties];
    [v11 setAdjustsFontForContentSizeCategory:1];

    v12 = [v10 secondaryTextProperties];
    [v12 setAdjustsFontForContentSizeCategory:1];

    v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    id v14 = [v10 secondaryTextProperties];
    [v14 setColor:v13];

    v15 = [MEMORY[0x1E4FB1498] listPlainCellConfiguration];
    v16 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v15 setBackgroundColor:v16];

    [v9 setBackgroundConfiguration:v15];
  }
  v17 = -[NSArray objectAtIndexedSubscript:](self->_listViewItems, "objectAtIndexedSubscript:", [v7 row]);
  v18 = [v17 systemImageName];
  v19 = PXSharedLibraryCellSystemImageNamed(v18);
  [v10 setImage:v19];

  v20 = [v17 title];
  [v10 setText:v20];

  [v9 setContentConfiguration:v10];
  uint64_t v21 = [v17 tag];
  if (v21 == [(PXSharedLibraryAssistantViewModel *)self->_viewModel selectedRuleType])
  {
    [v9 setAccessoryType:3];
    if (([v9 isSelected] & 1) == 0) {
      [v6 selectRowAtIndexPath:v7 animated:0 scrollPosition:0];
    }
  }
  else
  {
    [v9 setAccessoryType:0];
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_listViewItems count];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryAssistantRulesViewController;
  id v4 = a3;
  [(PXSharedLibraryAssistantRulesViewController *)&v8 traitCollectionDidChange:v4];
  id v5 = [(PXSharedLibraryAssistantRulesViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(PXSharedLibraryAssistantRulesViewController *)self _updateIcon];
  }
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryAssistantRulesViewController;
  [(OBTableWelcomeController *)&v16 viewDidLoad];
  [(PXSharedLibraryAssistantRulesViewController *)self _updateIcon];
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  [v4 setDelegate:self];
  [v4 setDataSource:self];
  [v4 setAllowsSelection:1];
  [v4 setAllowsMultipleSelection:0];
  [(OBTableWelcomeController *)self setTableView:v4];
  uint64_t v6 = [MEMORY[0x1E4F83A80] boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v6;

  objc_super v8 = self->_continueButton;
  id v9 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ButtonTitle_Continue");
  [(OBBoldTrayButton *)v8 setTitle:v9 forState:0];

  [(OBBoldTrayButton *)self->_continueButton addTarget:self action:sel_continueButtonTapped_ forControlEvents:0x2000];
  id v10 = [(PXSharedLibraryAssistantRulesViewController *)self viewModel];
  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", [v10 selectedRuleType] != 0);

  v11 = [(PXSharedLibraryAssistantRulesViewController *)self buttonTray];
  [v11 addButton:self->_continueButton];

  v12 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_continueButtonTapped_];
  [(PXSharedLibraryAssistantRulesViewController *)self addKeyCommand:v12];

  v13 = [MEMORY[0x1E4F83AB8] linkButton];
  id v14 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ButtonTitle_MoveLater");
  [v13 setTitle:v14 forState:0];

  [v13 addTarget:self action:sel_addLaterButtonTapped_ forControlEvents:0x2000];
  v15 = [(PXSharedLibraryAssistantRulesViewController *)self buttonTray];
  [v15 addButton:v13];
}

- (void)_updateIcon
{
}

- (PXSharedLibraryAssistantRulesViewController)initWithViewModel:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantRulesViewController+iOS.m", 40, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  uint64_t v7 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Rules_Title");
  objc_super v8 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Rules_Subtitle");
  v15.receiver = self;
  v15.super_class = (Class)PXSharedLibraryAssistantRulesViewController;
  id v9 = [(OBTableWelcomeController *)&v15 initWithTitle:v7 detailText:v8 icon:0 adoptTableViewScrollView:1];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    uint64_t v11 = PXSharedLibraryAssistantRulesListViewItems([(PXSharedLibraryAssistantViewModel *)v10->_viewModel shouldShowPeopleState] == 1);
    listViewItems = v10->_listViewItems;
    v10->_listViewItems = (NSArray *)v11;
  }
  return v10;
}

@end