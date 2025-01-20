@interface WFTimeOffsetPickerViewController
- (NSArray)sections;
- (NSArray)tableViewItems;
- (UIPickerView)currentPickerView;
- (UITableView)tableView;
- (WFTimeOffsetPickerViewController)initWithTimeTriggerEvent:(unint64_t)a3 timeOffset:(unint64_t)a4;
- (WFTimeOffsetPickerViewControllerDelegate)delegate;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)titleForRow:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)event;
- (unint64_t)timeOffset;
- (void)cancel:(id)a3;
- (void)done:(id)a3;
- (void)loadView;
- (void)setCurrentPickerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTimeOffset:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WFTimeOffsetPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewItems, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentPickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTimeOffset:(unint64_t)a3
{
  self->_timeOffset = a3;
}

- (unint64_t)timeOffset
{
  return self->_timeOffset;
}

- (NSArray)tableViewItems
{
  return self->_tableViewItems;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setTableView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setCurrentPickerView:(id)a3
{
}

- (UIPickerView)currentPickerView
{
  return self->_currentPickerView;
}

- (unint64_t)event
{
  return self->_event;
}

- (void)setDelegate:(id)a3
{
}

- (WFTimeOffsetPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTimeOffsetPickerViewControllerDelegate *)WeakRetained;
}

- (id)titleForRow:(int64_t)a3
{
  v5 = [(WFTimeOffsetPickerViewController *)self tableViewItems];
  v6 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [v6 integerValue];

  v8 = (void *)MEMORY[0x263F86F20];
  unint64_t v9 = [(WFTimeOffsetPickerViewController *)self event];
  return (id)[v8 localizedSunriseSunsetDescriptionForTriggerEvent:v9 timeOffset:v7];
}

- (void)done:(id)a3
{
  id v4 = [(WFTimeOffsetPickerViewController *)self delegate];
  objc_msgSend(v4, "timeOffsetPickerViewController:didSelectOffset:", self, -[WFTimeOffsetPickerViewController timeOffset](self, "timeOffset"));
}

- (void)cancel:(id)a3
{
  id v4 = [(WFTimeOffsetPickerViewController *)self delegate];
  [v4 timeOffsetPickerViewControllerDidCancel:self];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = [v6 row];

  [(WFTimeOffsetPickerViewController *)self setTimeOffset:v7];
  id v8 = [(WFTimeOffsetPickerViewController *)self tableView];
  [v8 reloadData];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFTimeOffsetPickerViewController *)self infoForSection:a4];
  v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (objc_class *)objc_opt_class();
  unint64_t v9 = NSStringFromClass(v8);
  v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  v11 = -[WFTimeOffsetPickerViewController titleForRow:](self, "titleForRow:", [v6 row]);
  v12 = [v10 textLabel];
  [v12 setText:v11];

  [v10 setAccessoryType:0];
  unint64_t v13 = [(WFTimeOffsetPickerViewController *)self timeOffset];
  uint64_t v14 = [v6 row];

  if (v13 == v14) {
    [v10 setAccessoryType:3];
  }
  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(WFTimeOffsetPickerViewController *)self infoForSection:a4];
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  int v7 = [v6 isEqual:@"start"];

  if (v7)
  {
    id v8 = [(WFTimeOffsetPickerViewController *)self tableViewItems];
    int64_t v9 = [v8 count];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(WFTimeOffsetPickerViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)infoForSection:(int64_t)a3
{
  int64_t v4 = [(WFTimeOffsetPickerViewController *)self sections];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  int64_t v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [(UITableView *)v4 setBackgroundColor:v5];

  [(UITableView *)v4 setDataSource:self];
  [(UITableView *)v4 setDelegate:self];
  uint64_t v6 = objc_opt_class();
  int v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [(UITableView *)v4 registerClass:v6 forCellReuseIdentifier:v8];

  tableView = self->_tableView;
  self->_tableView = v4;
  v10 = v4;

  [(WFTimeOffsetPickerViewController *)self setView:v10];
  id v11 = [(WFTimeOffsetPickerViewController *)self tableView];
  [v11 reloadData];
}

- (WFTimeOffsetPickerViewController)initWithTimeTriggerEvent:(unint64_t)a3 timeOffset:(unint64_t)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)WFTimeOffsetPickerViewController;
  uint64_t v6 = [(WFTimeOffsetPickerViewController *)&v21 initWithNibName:0 bundle:0];
  int v7 = v6;
  if (v6)
  {
    v6->_event = a3;
    v6->_timeOffset = a4;
    tableViewItems = v6->_tableViewItems;
    v6->_tableViewItems = (NSArray *)&unk_26E1CA930;

    int64_t v9 = [(WFTimeOffsetPickerViewController *)v7 navigationItem];
    v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v7 action:sel_cancel_];
    [v9 setLeftBarButtonItem:v10];

    id v11 = [(WFTimeOffsetPickerViewController *)v7 navigationItem];
    v12 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v7 action:sel_done_];
    [v11 setRightBarButtonItem:v12];

    v23[0] = @"start";
    v22[0] = @"identifier";
    v22[1] = @"sectionTitle";
    unint64_t v13 = WFLocalizedString(@"Offset");
    v23[1] = v13;
    v22[2] = @"cellIdentifier";
    uint64_t v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v23[2] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    v24[0] = v16;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    sections = v7->_sections;
    v7->_sections = (NSArray *)v17;

    v19 = v7;
  }

  return v7;
}

@end