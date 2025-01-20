@interface NTKHomeDetailPickerViewController
- (NSString)parentSectionName;
- (NTKComplicationPickerDetailViewConfiguration)configuration;
- (NTKHomeDetailPickerDataSource)dataSource;
- (NTKHomeDetailPickerViewController)initWithDetailConfiguration:(id)a3 homeListItem:(id)a4;
- (NTKHomeDetailPickerViewControllerDelegate)delegate;
- (NTKHomeListItem)homeListItem;
- (UITableView)tableView;
- (void)_didSelectItemAtIndexPath:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeListItem:(id)a3;
- (void)setParentSectionName:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation NTKHomeDetailPickerViewController

- (NTKHomeDetailPickerViewController)initWithDetailConfiguration:(id)a3 homeListItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKHomeDetailPickerViewController;
  v9 = [(NTKHomeDetailPickerViewController *)&v13 initWithNibName:0 bundle:0];
  if (v9)
  {
    uint64_t v10 = [v7 title];
    parentSectionName = v9->_parentSectionName;
    v9->_parentSectionName = (NSString *)v10;

    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v9->_homeListItem, a4);
  }

  return v9;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)NTKHomeDetailPickerViewController;
  [(NTKHomeDetailPickerViewController *)&v19 viewDidLoad];
  v3 = [(NTKHomeDetailPickerViewController *)self view];
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
  v15 = [[NTKHomeDetailPickerDataSource alloc] initWithTableView:self->_tableView detailConfiguration:self->_configuration homeListItem:self->_homeListItem];
  [(UITableView *)self->_tableView setDataSource:v15];
  v16 = [(NTKHomeDetailPickerViewController *)self view];
  [v16 addSubview:self->_tableView];

  dataSource = self->_dataSource;
  self->_dataSource = v15;
  v18 = v15;

  [(NTKHomeDetailPickerViewController *)self setTitle:self->_parentSectionName];
}

- (void)_didSelectItemAtIndexPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(NTKHomeDetailPickerViewController *)self dataSource];
  double v6 = [v5 pickerItemForIndexPath:v4];

  double v7 = [(NTKHomeDetailPickerViewController *)self tableView];
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

  objc_super v13 = [v7 cellForRowAtIndexPath:v4];
  objc_msgSend(v13, "ntk_setPickerSelected:", 1);
  v14 = [(NTKHomeDetailPickerViewController *)self delegate];
  [v14 homeDetailPickerViewController:self didSelectItem:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (NTKHomeDetailPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKHomeDetailPickerViewControllerDelegate *)WeakRetained;
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

- (NTKHomeDetailPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NTKHomeListItem)homeListItem
{
  return self->_homeListItem;
}

- (void)setHomeListItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeListItem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_parentSectionName, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end