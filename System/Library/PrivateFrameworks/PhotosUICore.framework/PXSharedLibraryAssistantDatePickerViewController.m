@interface PXSharedLibraryAssistantDatePickerViewController
- (BOOL)hasCustomDate;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSDate)pickedDate;
- (OBBoldTrayButton)titleButton;
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXSharedLibraryAssistantDatePickerViewController)initWithViewModel:(id)a3;
- (PXSharedLibraryAssistantViewModel)viewModel;
- (UIDatePicker)datePicker;
- (id)_datePickerCellForTableView:(id)a3;
- (id)_startDateCellForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_continueAssistant;
- (void)_datePickerDidChange:(id)a3;
- (void)_resetPickerWithDate:(id)a3;
- (void)_updateFooterText;
- (void)_updateHeaderText;
- (void)_updateStartDateCell;
- (void)_updateViewModelForStartDate:(id)a3 completionHandler:(id)a4;
- (void)continueButtonTapped:(id)a3;
- (void)footerTextWithCompletion:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)resetPickerDate;
- (void)restorePickerDate;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)setHasCustomDate:(BOOL)a3;
- (void)setPickedDate:(id)a3;
- (void)skipPickedDateAndContinue;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)truncateAndSetPickedDate:(id)a3;
- (void)usePickedDateAndContinueWithCompletionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryAssistantDatePickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickedDate, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_cachedFooterText, 0);
  objc_storeStrong((id *)&self->_countsCell, 0);
  objc_storeStrong((id *)&self->_datePickerCell, 0);
  objc_storeStrong((id *)&self->_startDateCell, 0);
}

- (void)setPickedDate:(id)a3
{
}

- (NSDate)pickedDate
{
  return self->_pickedDate;
}

- (void)setHasCustomDate:(BOOL)a3
{
  self->_hasCustomDate = a3;
}

- (BOOL)hasCustomDate
{
  return self->_hasCustomDate;
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (OBBoldTrayButton)titleButton
{
  return self->_titleButton;
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

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 0x2088) != 0 && PXSharedLibraryAssistantDatePickerViewModelObservationContext == (void)a5)
  {
    [(PXSharedLibraryAssistantDatePickerViewController *)self resetPickerDate];
    [(PXSharedLibraryAssistantDatePickerViewController *)self _updateStartDateCell];
    [(PXSharedLibraryAssistantDatePickerViewController *)self _updateFooterText];
    [(PXSharedLibraryAssistantDatePickerViewController *)self _updateHeaderText];
  }
}

- (void)continueButtonTapped:(id)a3
{
  v4 = [(OBBaseWelcomeController *)self navigationItem];
  v5 = [(PXSharedLibraryAssistantDatePickerViewController *)self titleButton];
  [v4 setHidesBackButton:1];
  [v5 setEnabled:0];
  [v5 showsBusyIndicator];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PXSharedLibraryAssistantDatePickerViewController_continueButtonTapped___block_invoke;
  v8[3] = &unk_1E5DD32A8;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(PXSharedLibraryAssistantDatePickerViewController *)self usePickedDateAndContinueWithCompletionHandler:v8];
}

uint64_t __73__PXSharedLibraryAssistantDatePickerViewController_continueButtonTapped___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) hidesBusyIndicator];
  [*(id *)(a1 + 32) setEnabled:1];
  v2 = *(void **)(a1 + 40);
  return [v2 setHidesBackButton:0];
}

- (void)_updateHeaderText
{
  v3 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_DateSelection_Title");
  uint64_t v9 = 0;
  v4 = [(PXSharedLibraryAssistantDatePickerViewController *)self viewModel];
  v5 = [v4 localizedSelectedPeopleWithAdditionalPeopleCount:&v9];

  id v6 = PXSharedLibraryAssistantDateSelectionSubtitle(v5, v9);
  id v7 = [(PXSharedLibraryAssistantDatePickerViewController *)self headerView];
  [v7 setTitle:v3];

  v8 = [(PXSharedLibraryAssistantDatePickerViewController *)self headerView];
  [v8 setDetailText:v6];
}

- (void)_updateFooterText
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __69__PXSharedLibraryAssistantDatePickerViewController__updateFooterText__block_invoke;
  v2[3] = &unk_1E5DD2D18;
  v2[4] = self;
  [(PXSharedLibraryAssistantDatePickerViewController *)self footerTextWithCompletion:v2];
}

void __69__PXSharedLibraryAssistantDatePickerViewController__updateFooterText__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1264), a2);
  id v4 = a2;
  id v5 = [*(id *)(a1 + 32) tableView];

  [v5 reloadData];
}

- (void)_updateStartDateCell
{
  id v8 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  v3 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_DateSelection_PickerDetail");
  [v8 setText:v3];

  id v4 = [(PXSharedLibraryAssistantDatePickerViewController *)self pickedDate];
  id v5 = PXSharedLibraryAssistantCustomizeRulesExcludingFromStartDate((uint64_t)v4);
  [v8 setSecondaryText:v5];

  id v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
  id v7 = [v8 secondaryTextProperties];
  [v7 setColor:v6];

  [(UITableViewCell *)self->_startDateCell setContentConfiguration:v8];
}

- (void)_datePickerDidChange:(id)a3
{
  id v4 = [a3 date];
  [(PXSharedLibraryAssistantDatePickerViewController *)self truncateAndSetPickedDate:v4];

  [(PXSharedLibraryAssistantDatePickerViewController *)self setHasCustomDate:1];
  [(PXSharedLibraryAssistantDatePickerViewController *)self _updateStartDateCell];
  [(PXSharedLibraryAssistantDatePickerViewController *)self _updateFooterText];
}

- (id)_datePickerCellForTableView:(id)a3
{
  v28[4] = *MEMORY[0x1E4F143B8];
  datePickerCell = self->_datePickerCell;
  if (!datePickerCell)
  {
    id v5 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
    id v6 = self->_datePickerCell;
    self->_datePickerCell = v5;

    id v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(UITableViewCell *)self->_datePickerCell setBackgroundColor:v7];

    id v8 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4FB16B0]);
    datePicker = self->_datePicker;
    self->_datePicker = v8;

    [(UIDatePicker *)self->_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDatePicker *)self->_datePicker _setCustomFontDesign:*MEMORY[0x1E4FB0938]];
    [(UIDatePicker *)self->_datePicker setDatePickerMode:1];
    [(UIDatePicker *)self->_datePicker setPreferredDatePickerStyle:3];
    id v10 = [(PXSharedLibraryAssistantDatePickerViewController *)self pickedDate];
    [(UIDatePicker *)self->_datePicker setDate:v10];

    v11 = [MEMORY[0x1E4F1C9C8] date];
    [(UIDatePicker *)self->_datePicker setMaximumDate:v11];

    [(UIDatePicker *)self->_datePicker addTarget:self action:sel__datePickerDidChange_ forControlEvents:4096];
    v12 = [(UITableViewCell *)self->_datePickerCell contentView];
    [v12 addSubview:self->_datePicker];
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(UIDatePicker *)self->_datePicker topAnchor];
    v26 = [v12 topAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v28[0] = v25;
    v24 = [(UIDatePicker *)self->_datePicker leadingAnchor];
    v23 = [v12 leadingAnchor];
    v21 = [v24 constraintEqualToAnchor:v23];
    v28[1] = v21;
    v13 = [(UIDatePicker *)self->_datePicker bottomAnchor];
    v14 = [v12 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v28[2] = v15;
    v16 = [(UIDatePicker *)self->_datePicker trailingAnchor];
    v17 = [v12 trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v28[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v22 activateConstraints:v19];

    datePickerCell = self->_datePickerCell;
  }
  return datePickerCell;
}

- (id)_startDateCellForTableView:(id)a3
{
  startDateCell = self->_startDateCell;
  if (!startDateCell)
  {
    id v5 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:0];
    id v6 = self->_startDateCell;
    self->_startDateCell = v5;

    id v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(UITableViewCell *)self->_startDateCell setBackgroundColor:v7];

    [(PXSharedLibraryAssistantDatePickerViewController *)self _updateStartDateCell];
    startDateCell = self->_startDateCell;
  }
  return startDateCell;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  uint64_t v8 = [v7 row];

  if (!v8)
  {
    BOOL isShowingFullPicker = self->_isShowingFullPicker;
    self->_BOOL isShowingFullPicker = !isShowingFullPicker;
    uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:0];
    v11 = (void *)v10;
    if (isShowingFullPicker)
    {
      uint64_t v13 = v10;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      [v6 deleteRowsAtIndexPaths:v12 withRowAnimation:100];
    }
    else
    {
      v14[0] = v10;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [v6 insertRowsAtIndexPaths:v12 withRowAnimation:100];
    }
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "row", a3) == 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return self->_cachedFooterText;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 item];
  if (v9 == 1)
  {
    uint64_t v10 = [(PXSharedLibraryAssistantDatePickerViewController *)self _datePickerCellForTableView:v7];
  }
  else
  {
    if (v9)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantDatePickerViewController+iOS.m" lineNumber:106 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v10 = [(PXSharedLibraryAssistantDatePickerViewController *)self _startDateCellForTableView:v7];
  }
  v11 = (void *)v10;

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_isShowingFullPicker) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)PXSharedLibraryAssistantDatePickerViewController;
  [(OBTableWelcomeController *)&v15 viewDidLoad];
  [(PXSharedLibraryAssistantDatePickerViewController *)self restorePickerDate];
  [(PXSharedLibraryAssistantDatePickerViewController *)self _updateHeaderText];
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  [v4 setDataSource:self];
  [v4 setDelegate:self];
  [(OBTableWelcomeController *)self setTableView:v4];
  id v6 = [MEMORY[0x1E4F83A80] boldButton];
  titleButton = self->_titleButton;
  self->_titleButton = v6;

  id v8 = self->_titleButton;
  uint64_t v9 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ButtonTitle_Continue");
  [(OBBoldTrayButton *)v8 setTitle:v9 forState:0];

  [(OBBoldTrayButton *)self->_titleButton addTarget:self action:sel_continueButtonTapped_ forControlEvents:0x2000];
  uint64_t v10 = [(PXSharedLibraryAssistantDatePickerViewController *)self buttonTray];
  [v10 addButton:self->_titleButton];

  v11 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_continueButtonTapped_];
  [(PXSharedLibraryAssistantDatePickerViewController *)self addKeyCommand:v11];

  v12 = [MEMORY[0x1E4F83AB8] linkButton];
  uint64_t v13 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ButtonTitle_Skip");
  [v12 setTitle:v13 forState:0];

  [v12 addTarget:self action:sel_skipButtonTapped_ forControlEvents:0x2000];
  v14 = [(PXSharedLibraryAssistantDatePickerViewController *)self buttonTray];
  [v14 addButton:v12];

  [(PXSharedLibraryAssistantDatePickerViewController *)self _updateFooterText];
}

- (PXSharedLibraryAssistantDatePickerViewController)initWithViewModel:(id)a3
{
  id v5 = a3;
  id v6 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_DateSelection_Title");
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantDatePickerViewController;
  id v7 = [(OBTableWelcomeController *)&v10 initWithTitle:v6 detailText:0 icon:0 adoptTableViewScrollView:1];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewModel, a3);
    id v8 = [(PXSharedLibraryAssistantViewModel *)v7->_viewModel startDate];

    if (v8) {
      [(PXSharedLibraryAssistantDatePickerViewController *)v7 setHasCustomDate:1];
    }
    [v5 registerChangeObserver:v7 context:PXSharedLibraryAssistantDatePickerViewModelObservationContext];
  }

  return v7;
}

- (void)_continueAssistant
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXSharedLibraryAssistantDatePickerViewController *)self assistantViewControllerDelegate];
  if (!v3) {
    PXAssertGetLog();
  }
  [v3 stepForwardInAssistantForAssistantViewController:self];
}

- (void)_updateViewModelForStartDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXSharedLibraryAssistantDatePickerViewController *)self viewModel];
  uint64_t v9 = [v8 personUUIDs];
  objc_super v10 = v9;
  if (v6) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 2 * ([v9 count] != 0);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__PXSharedLibraryAssistantDatePickerViewController_Internal___updateViewModelForStartDate_completionHandler___block_invoke;
  v13[3] = &unk_1E5DCC308;
  id v14 = v6;
  uint64_t v15 = v11;
  id v12 = v6;
  [v8 performChanges:v13 shareCountsCompletionHandler:v7];
}

void __109__PXSharedLibraryAssistantDatePickerViewController_Internal___updateViewModelForStartDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setStartDate:v3];
  [v4 setAutoSharePolicy:*(void *)(a1 + 40)];
}

- (void)usePickedDateAndContinueWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSharedLibraryAssistantDatePickerViewController *)self pickedDate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __108__PXSharedLibraryAssistantDatePickerViewController_Internal__usePickedDateAndContinueWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5DD3280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PXSharedLibraryAssistantDatePickerViewController *)self _updateViewModelForStartDate:v5 completionHandler:v7];
}

uint64_t __108__PXSharedLibraryAssistantDatePickerViewController_Internal__usePickedDateAndContinueWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 _continueAssistant];
}

- (void)skipPickedDateAndContinue
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __87__PXSharedLibraryAssistantDatePickerViewController_Internal__skipPickedDateAndContinue__block_invoke;
  v2[3] = &unk_1E5DD36F8;
  v2[4] = self;
  [(PXSharedLibraryAssistantDatePickerViewController *)self _updateViewModelForStartDate:0 completionHandler:v2];
}

uint64_t __87__PXSharedLibraryAssistantDatePickerViewController_Internal__skipPickedDateAndContinue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continueAssistant];
}

- (void)_resetPickerWithDate:(id)a3
{
  id v4 = a3;
  [(PXSharedLibraryAssistantDatePickerViewController *)self truncateAndSetPickedDate:v4];
  id v5 = [(PXSharedLibraryAssistantDatePickerViewController *)self datePicker];
  [v5 setDate:v4];
}

- (void)resetPickerDate
{
  id v4 = [(PXSharedLibraryAssistantDatePickerViewController *)self viewModel];
  uint64_t v3 = [v4 suggestedStartDate];
  if (![(PXSharedLibraryAssistantDatePickerViewController *)self hasCustomDate] && v3)
  {
    [v4 performChanges:&__block_literal_global_255928];
    [(PXSharedLibraryAssistantDatePickerViewController *)self _resetPickerWithDate:v3];
  }
}

uint64_t __77__PXSharedLibraryAssistantDatePickerViewController_Internal__resetPickerDate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStartDate:0];
}

- (void)restorePickerDate
{
  uint64_t v3 = [(PXSharedLibraryAssistantDatePickerViewController *)self viewModel];
  id v4 = [v3 startDate];

  if (v4) {
    [(PXSharedLibraryAssistantDatePickerViewController *)self _resetPickerWithDate:v4];
  }
  else {
    [(PXSharedLibraryAssistantDatePickerViewController *)self resetPickerDate];
  }
}

- (void)truncateAndSetPickedDate:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantDatePickerViewController+Internal.m", 53, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = objc_msgSend(v8, "px_dateTruncatedToCalendarUnit:calendar:", 16, v5);

  [(PXSharedLibraryAssistantDatePickerViewController *)self setPickedDate:v6];
}

- (void)footerTextWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantDatePickerViewController+Internal.m", 23, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = [(PXSharedLibraryAssistantDatePickerViewController *)self viewModel];
  id v7 = [v6 sourceLibraryInfo];
  id v8 = [(PXSharedLibraryAssistantDatePickerViewController *)self pickedDate];
  uint64_t v9 = [v6 personUUIDs];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PXSharedLibraryAssistantDatePickerViewController_Internal__footerTextWithCompletion___block_invoke;
  v13[3] = &unk_1E5DCC2C0;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v5;
  id v10 = v5;
  id v11 = v6;
  [v7 fetchEstimatedAssetsCountsForStartDate:v8 personUUIDs:v9 completion:v13];
}

void __87__PXSharedLibraryAssistantDatePickerViewController_Internal__footerTextWithCompletion___block_invoke(uint64_t a1, long long *a2)
{
  if (*(void *)a2 == 0x7FFFFFFFFFFFFFFFLL
    || *((void *)a2 + 1) == 0x7FFFFFFFFFFFFFFFLL
    || *((void *)a2 + 2) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    id v6 = [*(id *)(a1 + 32) localizedSelectedPeopleWithAdditionalPeopleCount:&v12];
    uint64_t v7 = v12;
    int v8 = [*(id *)(a1 + 40) hasCustomDate];
    long long v10 = *a2;
    uint64_t v11 = *((void *)a2 + 2);
    uint64_t v9 = PXSharedLibraryAssistantDateSelectionFooter((uint64_t *)&v10, v6, v7, v8 ^ 1);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end