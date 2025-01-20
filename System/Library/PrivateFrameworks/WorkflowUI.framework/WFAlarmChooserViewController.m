@interface WFAlarmChooserViewController
- (BOOL)isModalInPresentation;
- (MTAlarmDataSource)alarmDataSource;
- (NSMutableOrderedSet)checkedAlarmIDs;
- (UITableView)tableView;
- (WFAlarmChooserViewController)initWithAlarmDataSource:(id)a3 checkedAlarmIDs:(id)a4;
- (WFAlarmChooserViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancel:(id)a3;
- (void)checkForValidCheckedAlarmIDs;
- (void)dataSourceDidReload:(id)a3;
- (void)finish:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDoneButtonEnabled;
- (void)viewDidLoad;
@end

@implementation WFAlarmChooserViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkedAlarmIDs, 0);
  objc_storeStrong((id *)&self->_alarmDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSMutableOrderedSet)checkedAlarmIDs
{
  return self->_checkedAlarmIDs;
}

- (MTAlarmDataSource)alarmDataSource
{
  return self->_alarmDataSource;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setDelegate:(id)a3
{
}

- (WFAlarmChooserViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFAlarmChooserViewControllerDelegate *)WeakRetained;
}

- (void)cancel:(id)a3
{
  id v4 = [(WFAlarmChooserViewController *)self delegate];
  [v4 alarmChooserViewControllerDidCancel:self];
}

- (void)finish:(id)a3
{
  id v4 = [(WFAlarmChooserViewController *)self delegate];
  if (v4)
  {
    id v16 = v4;
    v5 = objc_opt_new();
    v6 = [(WFAlarmChooserViewController *)self alarmDataSource];
    uint64_t v7 = [v6 numberOfAlarms];

    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [(WFAlarmChooserViewController *)self alarmDataSource];
        v10 = [v9 alarmAtRow:v8];

        v11 = [(WFAlarmChooserViewController *)self checkedAlarmIDs];
        v12 = [v10 alarmID];
        int v13 = [v11 containsObject:v12];

        if (v13) {
          [v5 addObject:v10];
        }

        ++v8;
        v14 = [(WFAlarmChooserViewController *)self alarmDataSource];
        unint64_t v15 = [v14 numberOfAlarms];
      }
      while (v8 < v15);
    }
    [v16 alarmChooserViewController:self didFinishWithChosenAlarms:v5];

    id v4 = v16;
  }
}

- (void)updateDoneButtonEnabled
{
  id v6 = [(WFAlarmChooserViewController *)self checkedAlarmIDs];
  BOOL v3 = [v6 count] != 0;
  id v4 = [(WFAlarmChooserViewController *)self navigationItem];
  v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:v3];
}

- (void)checkForValidCheckedAlarmIDs
{
  id v12 = (id)objc_opt_new();
  BOOL v3 = [(WFAlarmChooserViewController *)self alarmDataSource];
  uint64_t v4 = [v3 numberOfAlarms];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(WFAlarmChooserViewController *)self alarmDataSource];
      uint64_t v7 = [v6 alarmAtRow:v5];

      unint64_t v8 = [v7 alarmID];
      [v12 addObject:v8];

      ++v5;
      v9 = [(WFAlarmChooserViewController *)self alarmDataSource];
      unint64_t v10 = [v9 numberOfAlarms];
    }
    while (v5 < v10);
  }
  v11 = [(WFAlarmChooserViewController *)self checkedAlarmIDs];
  [v11 intersectSet:v12];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a4;
  unint64_t v5 = [(WFAlarmChooserViewController *)self alarmDataSource];
  id v6 = objc_msgSend(v5, "alarmAtRow:", objc_msgSend(v16, "row"));
  uint64_t v7 = [v6 alarmID];

  unint64_t v8 = [(WFAlarmChooserViewController *)self tableView];
  v9 = [v8 cellForRowAtIndexPath:v16];

  unint64_t v10 = [(WFAlarmChooserViewController *)self checkedAlarmIDs];
  int v11 = [v10 containsObject:v7];

  id v12 = [(WFAlarmChooserViewController *)self checkedAlarmIDs];
  int v13 = v12;
  if (v11)
  {
    [v12 removeObject:v7];
    uint64_t v14 = 0;
  }
  else
  {
    [v12 addObject:v7];
    uint64_t v14 = 3;
  }

  [v9 setAccessoryType:v14];
  unint64_t v15 = [(WFAlarmChooserViewController *)self tableView];
  [v15 deselectRowAtIndexPath:v16 animated:1];

  [(WFAlarmChooserViewController *)self updateDoneButtonEnabled];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(WFAlarmChooserViewController *)self alarmDataSource];
  v9 = objc_msgSend(v8, "alarmAtRow:", objc_msgSend(v6, "row"));

  unint64_t v10 = (objc_class *)objc_opt_class();
  int v11 = NSStringFromClass(v10);
  id v12 = [v7 dequeueReusableCellWithIdentifier:v11 forIndexPath:v6];

  [v12 refreshUI:v9 animated:0];
  int v13 = [(WFAlarmChooserViewController *)self checkedAlarmIDs];
  uint64_t v14 = [v9 alarmID];
  LODWORD(v7) = [v13 containsObject:v14];

  if (v7) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [v12 setAccessoryType:v15];

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(WFAlarmChooserViewController *)self alarmDataSource];
  int64_t v5 = [v4 numberOfAlarms];

  return v5;
}

- (void)dataSourceDidReload:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int64_t v5 = [(WFAlarmChooserViewController *)self alarmDataSource];
    id v6 = [(WFAlarmChooserViewController *)self alarmDataSource];
    int v8 = 136315650;
    v9 = "-[WFAlarmChooserViewController dataSourceDidReload:]";
    __int16 v10 = 2112;
    int v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = [v6 numberOfAlarms];
    _os_log_impl(&dword_22D994000, v4, OS_LOG_TYPE_INFO, "%s alarmDataSource: %@ has %lu alarms", (uint8_t *)&v8, 0x20u);
  }
  [(WFAlarmChooserViewController *)self checkForValidCheckedAlarmIDs];
  [(WFAlarmChooserViewController *)self updateDoneButtonEnabled];
  id v7 = [(WFAlarmChooserViewController *)self tableView];
  [v7 reloadData];
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)WFAlarmChooserViewController;
  [(WFAlarmChooserViewController *)&v5 viewDidLoad];
  BOOL v3 = [(WFAlarmChooserViewController *)self alarmDataSource];
  id v4 = (id)[v3 reloadAlarms];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  id v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setAllowsSelectionDuringEditing:1];
  [(UITableView *)self->_tableView setAllowsSelection:1];
  [(UITableView *)self->_tableView setAllowsMultipleSelection:1];
  [(UITableView *)self->_tableView setEstimatedRowHeight:96.0];
  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x263F839B8]];
  id v6 = self->_tableView;
  uint64_t v7 = objc_opt_class();
  int v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [(UITableView *)v6 registerClass:v7 forCellReuseIdentifier:v9];

  __int16 v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
  int v11 = [(WFAlarmChooserViewController *)self navigationItem];
  [v11 setLeftBarButtonItem:v10];

  __int16 v12 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_finish_];
  uint64_t v13 = [(WFAlarmChooserViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v12];

  uint64_t v14 = self->_tableView;
  [(WFAlarmChooserViewController *)self setView:v14];
}

- (WFAlarmChooserViewController)initWithAlarmDataSource:(id)a3 checkedAlarmIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFAlarmChooserViewController;
  v9 = [(WFAlarmChooserViewController *)&v16 initWithNibName:0 bundle:0];
  if (v9)
  {
    __int16 v10 = WFLocalizedString(@"Choose Alarms");
    [(WFAlarmChooserViewController *)v9 setTitle:v10];

    objc_storeStrong((id *)&v9->_alarmDataSource, a3);
    int v11 = [(WFAlarmChooserViewController *)v9 alarmDataSource];
    [v11 registerObserver:v9];

    uint64_t v12 = [MEMORY[0x263EFF9B0] orderedSetWithArray:v8];
    checkedAlarmIDs = v9->_checkedAlarmIDs;
    v9->_checkedAlarmIDs = (NSMutableOrderedSet *)v12;

    uint64_t v14 = v9;
  }

  return v9;
}

@end