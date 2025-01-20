@interface NTKPeopleComplicationPickerViewController
- (BOOL)isFirstTimeVisible;
- (NSString)parentSectionName;
- (NTKComplicationPickerDetailViewConfiguration)configuration;
- (NTKPeopleComplicationPickerViewController)initWithDetailConfiguration:(id)a3;
- (NTKPeopleComplicationPickerViewControllerDelegate)delegate;
- (NTKPeopleDetailComplicationPickerDataSource)dataSource;
- (UITableView)tableView;
- (void)_didSelectItemAtIndexPath:(id)a3;
- (void)scrollToSelectedIdentifierAnimated:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsFirstTimeVisible:(BOOL)a3;
- (void)setParentSectionName:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NTKPeopleComplicationPickerViewController

- (NTKPeopleComplicationPickerViewController)initWithDetailConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKPeopleComplicationPickerViewController;
  v6 = [(NTKPeopleComplicationPickerViewController *)&v10 initWithNibName:0 bundle:0];
  if (v6)
  {
    uint64_t v7 = [v5 title];
    parentSectionName = v6->_parentSectionName;
    v6->_parentSectionName = (NSString *)v7;

    objc_storeStrong((id *)&v6->_configuration, a3);
    v6->_isFirstTimeVisible = 1;
  }

  return v6;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)NTKPeopleComplicationPickerViewController;
  [(NTKPeopleComplicationPickerViewController *)&v19 viewDidLoad];
  v3 = [(NTKPeopleComplicationPickerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:style:", 1, v5, v7, v9, v11);
  tableView = self->_tableView;
  self->_tableView = v12;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  v14 = [MEMORY[0x1E4FB1618] blackColor];
  [(UITableView *)self->_tableView setBackgroundColor:v14];

  [(UITableView *)self->_tableView setDelegate:self];
  v15 = [[NTKPeopleDetailComplicationPickerDataSource alloc] initWithTableView:self->_tableView detailConfiguration:self->_configuration];
  [(UITableView *)self->_tableView setDataSource:v15];
  v16 = [(NTKPeopleComplicationPickerViewController *)self view];
  [v16 addSubview:self->_tableView];

  dataSource = self->_dataSource;
  self->_dataSource = v15;
  v18 = v15;

  [(NTKPeopleComplicationPickerViewController *)self setTitle:self->_parentSectionName];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationPickerViewController;
  [(NTKPeopleComplicationPickerViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationPickerViewController;
  [(NTKPeopleComplicationPickerViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationPickerViewController;
  [(NTKPeopleComplicationPickerViewController *)&v3 viewDidDisappear:a3];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationPickerViewController;
  [(NTKPeopleComplicationPickerViewController *)&v3 viewDidLayoutSubviews];
  if (self->_isFirstTimeVisible)
  {
    [(NTKPeopleComplicationPickerViewController *)self scrollToSelectedIdentifierAnimated:0];
    self->_isFirstTimeVisible = 0;
  }
}

- (void)_didSelectItemAtIndexPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(NTKPeopleComplicationPickerViewController *)self dataSource];
  double v6 = [v5 complicationItemForIndexPath:v4];

  double v7 = [(NTKPeopleComplicationPickerViewController *)self tableView];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v8 = objc_msgSend(v7, "visibleCells", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "ntk_setPickerSelected:", 0);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  v13 = [v7 cellForRowAtIndexPath:v4];
  objc_msgSend(v13, "ntk_setPickerSelected:", 1);
  v14 = [(NTKPeopleComplicationPickerViewController *)self delegate];
  [v14 peopleComplicationPickerViewController:self didSelectItem:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (void)scrollToSelectedIdentifierAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(NTKPeopleComplicationPickerViewController *)self dataSource];
  id v8 = [v5 selectedIndexPath];

  if (v8)
  {
    if ([v8 item]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    double v7 = [(NTKPeopleComplicationPickerViewController *)self tableView];
    [v7 scrollToRowAtIndexPath:v8 atScrollPosition:v6 animated:v3];
  }
}

- (NTKPeopleComplicationPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKPeopleComplicationPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSString)parentSectionName
{
  return self->_parentSectionName;
}

- (void)setParentSectionName:(id)a3
{
}

- (NTKComplicationPickerDetailViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NTKPeopleDetailComplicationPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isFirstTimeVisible
{
  return self->_isFirstTimeVisible;
}

- (void)setIsFirstTimeVisible:(BOOL)a3
{
  self->_isFirstTimeVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_parentSectionName, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end