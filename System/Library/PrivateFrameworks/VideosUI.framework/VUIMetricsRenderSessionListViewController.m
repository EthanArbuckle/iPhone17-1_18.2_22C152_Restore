@interface VUIMetricsRenderSessionListViewController
- (VUIMetricsRenderSessionListViewController)initWithCoder:(id)a3;
- (VUIMetricsRenderSessionListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VUIMetricsRenderSessionListViewController)initWithStorageDataSource:(id)a3;
- (VUIMetricsRenderSessionListViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapClearAllSessions;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VUIMetricsRenderSessionListViewController

- (VUIMetricsRenderSessionListViewController)initWithStorageDataSource:(id)a3
{
  return (VUIMetricsRenderSessionListViewController *)MetricsRenderSessionListViewController.init(storageDataSource:)((uint64_t)a3);
}

- (VUIMetricsRenderSessionListViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  MetricsRenderSessionListViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  MetricsRenderSessionListViewController.viewWillAppear(_:)(a3);
}

- (VUIMetricsRenderSessionListViewController)initWithStyle:(int64_t)a3
{
}

- (VUIMetricsRenderSessionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  MetricsRenderSessionListViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  Swift::Int v8 = MetricsRenderSessionListViewController.tableView(_:numberOfRowsInSection:)((UITableView *)v6, v7);

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_91();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_19();
  id v7 = v4;
  id v8 = v5;
  double v9 = MetricsRenderSessionListViewController.tableView(_:heightForRowAt:)();

  uint64_t v10 = OUTLINED_FUNCTION_7_2();
  v11(v10);
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_91();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_19();
  id v7 = v4;
  id v8 = v5;
  double v9 = MetricsRenderSessionListViewController.tableView(_:cellForRowAt:)(v7);

  uint64_t v10 = OUTLINED_FUNCTION_7_2();
  v11(v10);
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_91();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_19();
  id v7 = v4;
  id v8 = v5;
  MetricsRenderSessionListViewController.tableView(_:didSelectRowAt:)();

  uint64_t v9 = OUTLINED_FUNCTION_7_2();
  v10(v9);
}

- (void)didTapClearAllSessions
{
  v2 = self;
  sub_1E340C434();
}

@end