@interface SCLCustomDayViewController
- (SCLCustomDayViewController)initWithViewModel:(id)a3 title:(id)a4;
- (SCLCustomDayViewControllerDelegate)delegate;
- (SCLSettingsViewModel)viewModel;
- (void)loadSpecifierSource;
- (void)setDelegate:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SCLCustomDayViewController

- (SCLCustomDayViewController)initWithViewModel:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCLCustomDayViewController;
  v9 = [(SCLListViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    [(SCLListViewController *)v10 setWantsEditingMode:1];
    [(SCLCustomDayViewController *)v10 setTitle:v8];
  }

  return v10;
}

- (void)loadSpecifierSource
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 1;
  v3 = [(SCLCustomDayViewController *)self viewModel];
  [v3 repeatSchedule];
  SCLEnumerateDaysInRepeatSchedule();

  v4 = [SCLCustomDayEditorSource alloc];
  v5 = [(SCLCustomDayViewController *)self viewModel];
  uint64_t v6 = v10[3];
  id v7 = [(SCLCustomDayViewController *)self title];
  id v8 = [(SCLCustomDayEditorSource *)v4 initWithListController:self viewModel:v5 day:v6 title:v7];

  [(SCLSpecifierDataSource *)v8 setActive:1];
  [(SCLListViewController *)self setSpecifierSource:v8];

  _Block_object_dispose(&v9, 8);
}

uint64_t __49__SCLCustomDayViewController_loadSpecifierSource__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCLCustomDayViewController;
  -[SCLCustomDayViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (!a3)
  {
    v5 = [(SCLCustomDayViewController *)self delegate];
    [v5 customDayViewControllerWillDismiss:self];
  }
}

- (SCLSettingsViewModel)viewModel
{
  return self->_viewModel;
}

- (SCLCustomDayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCLCustomDayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end