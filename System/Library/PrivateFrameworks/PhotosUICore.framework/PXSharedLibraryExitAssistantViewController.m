@interface PXSharedLibraryExitAssistantViewController
- (BOOL)disableControlsWithBusyIndicator;
- (PXSharedLibraryExitAssistantViewController)initWithOwnerAsCurrentUser:(BOOL)a3 keepAllCountsString:(id)a4 contributedOnlyCountsString:(id)a5;
- (PXSharedLibraryExitAssistantViewControllerDelegate)delegate;
- (UIPopoverPresentationControllerSourceItem)exitButtonSourceItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)exitRetentionPolicy;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateCancelButton;
- (void)_updateExitButton;
- (void)_updateIcon;
- (void)_updateTableView;
- (void)cancelButtonTapped:(id)a3;
- (void)exitButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableControlsWithBusyIndicator:(BOOL)a3;
- (void)setExitRetentionPolicy:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryExitAssistantViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contributedOnlyCountsString, 0);
  objc_storeStrong((id *)&self->_keepAllCountsString, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_exitButton, 0);
}

- (int64_t)exitRetentionPolicy
{
  return self->_exitRetentionPolicy;
}

- (BOOL)disableControlsWithBusyIndicator
{
  return self->_disableControlsWithBusyIndicator;
}

- (void)setDelegate:(id)a3
{
}

- (PXSharedLibraryExitAssistantViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSharedLibraryExitAssistantViewControllerDelegate *)WeakRetained;
}

- (void)setExitRetentionPolicy:(int64_t)a3
{
  if (self->_exitRetentionPolicy != a3)
  {
    self->_exitRetentionPolicy = a3;
    [(PXSharedLibraryExitAssistantViewController *)self _updateTableView];
    [(PXSharedLibraryExitAssistantViewController *)self _updateExitButton];
  }
}

- (void)_updateCancelButton
{
  uint64_t v3 = [(PXSharedLibraryExitAssistantViewController *)self disableControlsWithBusyIndicator] ^ 1;
  cancelButton = self->_cancelButton;
  [(OBLinkTrayButton *)cancelButton setEnabled:v3];
}

- (void)_updateExitButton
{
  [(OBBoldTrayButton *)self->_exitButton setEnabled:self->_exitRetentionPolicy != 0];
  BOOL v3 = [(PXSharedLibraryExitAssistantViewController *)self disableControlsWithBusyIndicator];
  exitButton = self->_exitButton;
  if (v3)
  {
    [(OBBoldTrayButton *)exitButton showsBusyIndicator];
  }
  else
  {
    [(OBBoldTrayButton *)exitButton hidesBusyIndicator];
  }
}

- (void)_updateTableView
{
  id v2 = [(OBTableWelcomeController *)self tableView];
  [v2 reloadData];
}

- (void)_updateIcon
{
  if (self->_currentUserIsOwner) {
    id v2 = @"xmark.circle.fill";
  }
  else {
    id v2 = @"minus.circle.fill";
  }
  PXSharedLibraryCreatePlatterImage(@"person.2.fill", v2);
}

- (void)cancelButtonTapped:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4 = [(PXSharedLibraryExitAssistantViewController *)self delegate];
  if (!v4) {
    PXAssertGetLog();
  }
  [v4 cancelExitAssistantViewController:self];
}

- (void)exitButtonTapped:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4 = [(PXSharedLibraryExitAssistantViewController *)self delegate];
  if (!v4) {
    PXAssertGetLog();
  }
  objc_msgSend(v4, "completeExitAssistantViewController:withExitRetentionPolicy:", self, -[PXSharedLibraryExitAssistantViewController exitRetentionPolicy](self, "exitRetentionPolicy"));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  int v7 = [v6 item];
  if (v7) {
    uint64_t v8 = v7 == 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [(PXSharedLibraryExitAssistantViewController *)self setExitRetentionPolicy:v8];
  [v9 deselectRowAtIndexPath:v6 animated:1];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(PXSharedLibraryExitAssistantViewController *)self disableControlsWithBusyIndicator])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"CellIdentifier"];
  if (!v7)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"CellIdentifier"];
    [v7 setSelectionStyle:0];
  }
  BOOL v8 = [(PXSharedLibraryExitAssistantViewController *)self disableControlsWithBusyIndicator];
  int v9 = [v6 item];

  if (!v9)
  {
    v10 = &OBJC_IVAR___PXSharedLibraryExitAssistantViewController__keepAllCountsString;
    uint64_t v11 = 2;
    v12 = @"PXSharedLibraryExitAssistant_ExitRetentionPolicy_KeepAll_iOS";
LABEL_7:
    v13 = PXLocalizedSharedLibraryString(v12);
    id v14 = *(id *)((char *)&self->super.super.super.super.super.super.isa + *v10);
    if (self->_exitRetentionPolicy == v11) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
    goto LABEL_11;
  }
  if (v9 == 1)
  {
    v10 = &OBJC_IVAR___PXSharedLibraryExitAssistantViewController__contributedOnlyCountsString;
    uint64_t v11 = 1;
    v12 = @"PXSharedLibraryExitAssistant_ExitRetentionPolicy_ContributedOnly_iOS";
    goto LABEL_7;
  }
  id v14 = 0;
  uint64_t v15 = 0;
  v13 = 0;
LABEL_11:
  v16 = [v7 textLabel];
  [v16 setText:v13];
  if (v8) {
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else {
  v17 = [MEMORY[0x1E4FB1618] labelColor];
  }
  [v16 setTextColor:v17];

  [v16 setNumberOfLines:0];
  [v16 setLineBreakMode:0];
  v18 = [v7 detailTextLabel];
  [v18 setText:v14];
  v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v18 setTextColor:v19];

  [v7 setAccessoryType:v15];
  v20 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v7 setBackgroundColor:v20];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryExitAssistantViewController;
  id v4 = a3;
  [(PXSharedLibraryExitAssistantViewController *)&v8 traitCollectionDidChange:v4];
  id v5 = [(PXSharedLibraryExitAssistantViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(PXSharedLibraryExitAssistantViewController *)self _updateIcon];
  }
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryExitAssistantViewController;
  [(OBTableWelcomeController *)&v16 viewDidLoad];
  [(PXSharedLibraryExitAssistantViewController *)self _updateIcon];
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setDelegate:self];
  [v4 setDataSource:self];
  id v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  [(OBTableWelcomeController *)self setTableView:v4];
  uint64_t v6 = PXSharedLibraryExitAssistantViewButtonTitle(self->_currentUserIsOwner);
  uint64_t v7 = [MEMORY[0x1E4F83A80] boldButton];
  exitButton = self->_exitButton;
  self->_exitButton = v7;

  [(OBBoldTrayButton *)self->_exitButton setTitle:v6 forState:0];
  [(OBBoldTrayButton *)self->_exitButton addTarget:self action:sel_exitButtonTapped_ forControlEvents:0x2000];
  int v9 = [(PXSharedLibraryExitAssistantViewController *)self buttonTray];
  [v9 addButton:self->_exitButton];

  v10 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_exitButtonTapped_];
  [(PXSharedLibraryExitAssistantViewController *)self addKeyCommand:v10];

  [(PXSharedLibraryExitAssistantViewController *)self _updateExitButton];
  uint64_t v11 = [MEMORY[0x1E4F83AB8] linkButton];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v11;

  v13 = self->_cancelButton;
  id v14 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  [(OBLinkTrayButton *)v13 setTitle:v14 forState:0];

  [(OBLinkTrayButton *)self->_cancelButton addTarget:self action:sel_cancelButtonTapped_ forControlEvents:0x2000];
  uint64_t v15 = [(PXSharedLibraryExitAssistantViewController *)self buttonTray];
  [v15 addButton:self->_cancelButton];

  [(PXSharedLibraryExitAssistantViewController *)self _updateCancelButton];
}

- (UIPopoverPresentationControllerSourceItem)exitButtonSourceItem
{
  return self->_exitButton;
}

- (void)setDisableControlsWithBusyIndicator:(BOOL)a3
{
  if (self->_disableControlsWithBusyIndicator != a3)
  {
    self->_disableControlsWithBusyIndicator = a3;
    [(PXSharedLibraryExitAssistantViewController *)self _updateTableView];
    [(PXSharedLibraryExitAssistantViewController *)self _updateExitButton];
    [(PXSharedLibraryExitAssistantViewController *)self _updateCancelButton];
  }
}

- (PXSharedLibraryExitAssistantViewController)initWithOwnerAsCurrentUser:(BOOL)a3 keepAllCountsString:(id)a4 contributedOnlyCountsString:(id)a5
{
  BOOL v7 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = PXSharedLibraryExitAssistantViewTitle(v7);
  v12 = PXSharedLibraryExitAssistantViewSubtitle(v7);
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryExitAssistantViewController;
  v13 = [(OBTableWelcomeController *)&v16 initWithTitle:v11 detailText:v12 icon:0 adoptTableViewScrollView:1];
  id v14 = v13;
  if (v13)
  {
    v13->_exitRetentionPolicy = 0;
    v13->_currentUserIsOwner = v7;
    objc_storeStrong((id *)&v13->_keepAllCountsString, a4);
    objc_storeStrong((id *)&v14->_contributedOnlyCountsString, a5);
  }

  return v14;
}

@end