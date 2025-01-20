@interface PXSharedLibraryAssistantParticipantViewController
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXSharedLibraryAssistantParticipantViewController)initWithAssistantViewModel:(id)a3 participantViewModel:(id)a4;
- (PXSharedLibraryAssistantParticipantViewModel)participantViewModel;
- (PXSharedLibraryAssistantViewModel)assistantViewModel;
- (void)_continueAssistant;
- (void)_updateButtonsAppearance;
- (void)_updateIcon;
- (void)_updateTableViewLayoutConstraints;
- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 forSharedLibraryParticipantTableViewController:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 forSharedLibraryParticipantTableViewController:(id)a5;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryAssistantParticipantViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantViewModel, 0);
  objc_storeStrong((id *)&self->_assistantViewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_addLaterButton, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_tableViewLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
}

- (PXSharedLibraryAssistantParticipantViewModel)participantViewModel
{
  return self->_participantViewModel;
}

- (PXSharedLibraryAssistantViewModel)assistantViewModel
{
  return self->_assistantViewModel;
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
  return (PXAssistantViewControllerDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 0x20) != 0 && (void *)PXSharedLibraryAssistantViewModelObservationContext == a5) {
    [(PXSharedLibraryAssistantParticipantViewController *)self _updateButtonsAppearance];
  }
}

- (void)_continueAssistant
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3 = [(PXSharedLibraryAssistantParticipantViewController *)self assistantViewControllerDelegate];
  if (!v3) {
    PXAssertGetLog();
  }
  [v3 stepForwardInAssistantForAssistantViewController:self];
}

- (void)_updateIcon
{
}

- (void)_updateButtonsAppearance
{
  v3 = [(PXSharedLibraryAssistantParticipantViewController *)self assistantViewModel];
  id v7 = [v3 participantDataSource];

  uint64_t v4 = [v7 emailAddresses];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [v7 phoneNumbers];
    BOOL v5 = [v6 count] != 0;
  }
  [(OBTrayButton *)self->_titleButton setEnabled:v5];
  [(OBLinkTrayButton *)self->_addLaterButton setEnabled:v5 ^ 1];
}

- (void)_updateTableViewLayoutConstraints
{
  v10[1] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_tableViewLayoutConstraints];
  [(PXSharedLibraryParticipantTableViewController *)self->_tableViewController tableViewHeight];
  double v4 = v3;
  BOOL v5 = [(PXSharedLibraryParticipantTableViewController *)self->_tableViewController tableView];
  v6 = [v5 heightAnchor];
  id v7 = [v6 constraintEqualToConstant:v4];
  v10[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  tableViewLayoutConstraints = self->_tableViewLayoutConstraints;
  self->_tableViewLayoutConstraints = v8;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_tableViewLayoutConstraints];
}

- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 forSharedLibraryParticipantTableViewController:(id)a4
{
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 forSharedLibraryParticipantTableViewController:(id)a5
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryAssistantParticipantViewController;
  id v4 = a3;
  [(PXSharedLibraryAssistantParticipantViewController *)&v8 traitCollectionDidChange:v4];
  BOOL v5 = [(PXSharedLibraryAssistantParticipantViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(PXSharedLibraryAssistantParticipantViewController *)self _updateIcon];
  }
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)PXSharedLibraryAssistantParticipantViewController;
  [(OBTableWelcomeController *)&v21 viewDidLoad];
  double v3 = [(PXSharedLibraryAssistantParticipantViewController *)self assistantViewModel];
  [v3 registerChangeObserver:self context:PXSharedLibraryAssistantViewModelObservationContext];
  id v4 = [PXSharedLibraryParticipantTableViewController alloc];
  BOOL v5 = [v3 participantDataSourceManager];
  uint64_t v6 = [(PXSharedLibraryParticipantTableViewController *)v4 initWithDataSourceManager:v5];
  tableViewController = self->_tableViewController;
  self->_tableViewController = v6;

  [(PXSharedLibraryParticipantTableViewController *)self->_tableViewController setDelegate:self];
  objc_super v8 = [(PXSharedLibraryParticipantTableViewController *)self->_tableViewController tableView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v8 setBackgroundColor:v9];

  [(OBTableWelcomeController *)self setTableView:v8];
  v10 = [MEMORY[0x1E4F83A80] boldButton];
  v11 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ButtonTitle_Continue");
  [v10 setTitle:v11 forState:0];

  [v10 addTarget:self action:sel_continueButtonTapped_ forControlEvents:0x2000];
  v12 = [(PXSharedLibraryAssistantParticipantViewController *)self buttonTray];
  [v12 addButton:v10];

  v13 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_continueButtonTapped_];
  [(PXSharedLibraryAssistantParticipantViewController *)self addKeyCommand:v13];

  titleButton = self->_titleButton;
  self->_titleButton = (OBTrayButton *)v10;
  id v15 = v10;

  v16 = [MEMORY[0x1E4F83AB8] linkButton];
  addLaterButton = self->_addLaterButton;
  self->_addLaterButton = v16;

  v18 = self->_addLaterButton;
  v19 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Participants_AddLater");
  [(OBLinkTrayButton *)v18 setTitle:v19 forState:0];

  [(OBLinkTrayButton *)self->_addLaterButton addTarget:self action:sel_addLaterButtonTapped_ forControlEvents:0x2000];
  v20 = [(PXSharedLibraryAssistantParticipantViewController *)self buttonTray];
  [v20 addButton:self->_addLaterButton];

  [(PXSharedLibraryAssistantParticipantViewController *)self _updateButtonsAppearance];
  [(PXSharedLibraryAssistantParticipantViewController *)self _updateIcon];
}

- (PXSharedLibraryAssistantParticipantViewController)initWithAssistantViewModel:(id)a3 participantViewModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 title];
  v10 = [v8 subtitle];
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryAssistantParticipantViewController;
  v11 = [(OBTableWelcomeController *)&v14 initWithTitle:v9 detailText:v10 icon:0 adoptTableViewScrollView:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assistantViewModel, a3);
    objc_storeStrong((id *)&v12->_participantViewModel, a4);
  }

  return v12;
}

@end