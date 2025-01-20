@interface STWeeklyReportViewController
- (NSArray)tableViewCells;
- (NSLayoutConstraint)heightConstraint;
- (STUsageReport)report;
- (STWeeklyReportViewController)initWithData:(id)a3;
- (STWeeklyReportViewController)initWithUsageReport:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_heightDidChange:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setHeightConstraint:(id)a3;
- (void)setTableViewCells:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation STWeeklyReportViewController

- (STWeeklyReportViewController)initWithData:(id)a3
{
  v4 = (void *)MEMORY[0x263F08928];
  id v5 = a3;
  id v11 = 0;
  v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];

  id v7 = v11;
  if (v7)
  {
    v8 = +[STUILog usage];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STWeeklyReportViewController initWithData:]((uint64_t)v7, v8);
    }
  }
  if (v6)
  {
    self = [(STWeeklyReportViewController *)self initWithUsageReport:v6];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (STWeeklyReportViewController)initWithUsageReport:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STWeeklyReportViewController;
  v6 = [(STWeeklyReportViewController *)&v17 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    p_report = &v6->_report;
    objc_storeStrong((id *)&v6->_report, a3);
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    v10 = [[STDailyAverageSummaryTableViewCell alloc] initWithUsageReport:*p_report];
    [v9 addObject:v10];
    id v11 = [[STWeeklyReportAppUsageTableViewCell alloc] initWithUsageReport:*p_report];
    [v9 addObject:v11];
    v12 = [[STNotificationsPickupSummaryTableViewCell alloc] initWithUsageReport:*p_report];
    [v9 addObject:v12];
    uint64_t v13 = [v9 copy];
    tableViewCells = v7->_tableViewCells;
    v7->_tableViewCells = (NSArray *)v13;

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v7 selector:sel__heightDidChange_ name:0x26D93DCE8 object:v10];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(STWeeklyReportViewController *)self tableView];
  [v3 removeObserver:self forKeyPath:@"contentSize" context:@"KVOContextWeeklyReportViewController"];

  v4.receiver = self;
  v4.super_class = (Class)STWeeklyReportViewController;
  [(STWeeklyReportViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)STWeeklyReportViewController;
  [(STWeeklyReportViewController *)&v9 viewDidLoad];
  v3 = [(STWeeklyReportViewController *)self tableView];
  [v3 setRowHeight:*MEMORY[0x263F839B8]];
  [v3 setEstimatedRowHeight:75.0];
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"CELL"];
  [v3 addObserver:self forKeyPath:@"contentSize" options:3 context:@"KVOContextWeeklyReportViewController"];
  objc_super v4 = [(STWeeklyReportViewController *)self view];
  id v5 = [v4 heightAnchor];
  [v3 contentSize];
  id v7 = [v5 constraintEqualToConstant:v6];

  [v7 setActive:1];
  [(STWeeklyReportViewController *)self setHeightConstraint:v7];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STWeeklyReportViewController.viewDidLoad", v8, 2u);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == @"KVOContextWeeklyReportViewController")
  {
    id v12 = a3;
    [(STWeeklyReportViewController *)self tableView];

    int v13 = [v12 isEqualToString:@"contentSize"];
    if (v13)
    {
      v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      [v14 CGSizeValue];
      double v17 = v16;
      v18 = [(STWeeklyReportViewController *)self heightConstraint];
      [v18 setConstant:v17];
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)STWeeklyReportViewController;
    id v11 = a3;
    [(STWeeklyReportViewController *)&v19 observeValueForKeyPath:v11 ofObject:a4 change:v10 context:a6];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v6 = [(STWeeklyReportViewController *)self tableViewCells];
  int64_t v7 = [v6 count];

  if (v7 < 0)
  {
    objc_super v9 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STWeeklyReportViewController.m", 111, @"number of rows overflowed %lu", v7);
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  unint64_t v6 = v5 & ~(v5 >> 63);
  int64_t v7 = [(STWeeklyReportViewController *)self tableViewCells];
  if (v6 >= [v7 count])
  {
    v8 = 0;
  }
  else
  {
    v8 = [v7 objectAtIndexedSubscript:v6];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setParentViewController:self];
  }
  else if (!v8)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
  }

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (void)_heightDidChange:(id)a3
{
  id v3 = [(STWeeklyReportViewController *)self tableView];
  [v3 reloadData];
}

- (STUsageReport)report
{
  return self->_report;
}

- (NSArray)tableViewCells
{
  return self->_tableViewCells;
}

- (void)setTableViewCells:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewCells, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

- (void)initWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving %@", (uint8_t *)&v2, 0xCu);
}

@end