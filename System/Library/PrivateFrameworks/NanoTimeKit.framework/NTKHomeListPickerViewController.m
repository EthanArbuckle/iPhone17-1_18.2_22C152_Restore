@interface NTKHomeListPickerViewController
- (NSString)parentSectionName;
- (NTKComplicationPickerDetailViewConfiguration)configuration;
- (NTKHomeListPickerDataSource)dataSource;
- (NTKHomeListPickerViewController)initWithDetailConfiguration:(id)a3;
- (NTKHomeListPickerViewControllerDelegate)delegate;
- (UITableView)tableView;
- (void)setConfiguration:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setParentSectionName:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation NTKHomeListPickerViewController

- (NTKHomeListPickerViewController)initWithDetailConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKHomeListPickerViewController;
  v6 = [(NTKHomeListPickerViewController *)&v10 initWithNibName:0 bundle:0];
  if (v6)
  {
    uint64_t v7 = [v5 title];
    parentSectionName = v6->_parentSectionName;
    v6->_parentSectionName = (NSString *)v7;

    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v6;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)NTKHomeListPickerViewController;
  [(NTKHomeListPickerViewController *)&v19 viewDidLoad];
  v3 = [(NTKHomeListPickerViewController *)self view];
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
  v15 = [[NTKHomeListPickerDataSource alloc] initWithTableView:self->_tableView detailConfiguration:self->_configuration];
  [(UITableView *)self->_tableView setDataSource:v15];
  v16 = [(NTKHomeListPickerViewController *)self view];
  [v16 addSubview:self->_tableView];

  dataSource = self->_dataSource;
  self->_dataSource = v15;
  v18 = v15;

  [(NTKHomeListPickerViewController *)self setTitle:self->_parentSectionName];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v8 = objc_msgSend(v6, "visibleCells", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12++), "ntk_setPickerSelected:", 0);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v13 = [v6 cellForRowAtIndexPath:v7];
  objc_msgSend(v13, "ntk_setPickerSelected:", 1);
  v14 = [(NTKHomeListPickerViewController *)self dataSource];
  v15 = [v14 pickerItemForIndexPath:v7];

  v16 = [(NTKHomeListPickerViewController *)self delegate];
  [v16 homeListPickerViewController:self didSelectItem:v15];
}

- (NTKHomeListPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKHomeListPickerViewControllerDelegate *)WeakRetained;
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

- (NTKHomeListPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
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