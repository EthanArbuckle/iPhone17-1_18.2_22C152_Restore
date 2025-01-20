@interface VUIMetricsRenderEventListViewController
- (VUIMetricsRenderEventListViewController)initWithCoder:(id)a3;
- (VUIMetricsRenderEventListViewController)initWithEvents:(id)a3;
- (VUIMetricsRenderEventListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VUIMetricsRenderEventListViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation VUIMetricsRenderEventListViewController

- (VUIMetricsRenderEventListViewController)initWithEvents:(id)a3
{
  type metadata accessor for MetricsRenderEvent();
  uint64_t v3 = sub_1E387CC98();
  return (VUIMetricsRenderEventListViewController *)MetricsRenderEventListViewController.init(events:)(v3);
}

- (VUIMetricsRenderEventListViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E35DF248();
}

- (void)viewDidLoad
{
  v2 = self;
  MetricsRenderEventListViewController.viewDidLoad()();
}

- (VUIMetricsRenderEventListViewController)initWithStyle:(int64_t)a3
{
}

- (VUIMetricsRenderEventListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  MetricsRenderEventListViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Swift::Int v6 = MetricsRenderEventListViewController.numberOfSections(in:)((UITableView *)v5);

  return v6;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8 = a3;
  v9 = (UIView *)a4;
  v10 = self;
  MetricsRenderEventListViewController.tableView(_:willDisplayHeaderView:forSection:)((UITableView *)v10, v9, a5);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  object = MetricsRenderEventListViewController.tableView(_:titleForHeaderInSection:)((UITableView *)v7, a4).value._object;

  if (object)
  {
    v9 = (void *)sub_1E387C8E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_91();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_19();
  id v7 = v4;
  id v8 = v5;
  double v9 = MetricsRenderEventListViewController.tableView(_:heightForRowAt:)();

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
  double v9 = MetricsRenderEventListViewController.tableView(_:cellForRowAt:)(v7);

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
  MetricsRenderEventListViewController.tableView(_:didSelectRowAt:)();

  uint64_t v9 = OUTLINED_FUNCTION_7_2();
  v10(v9);
}

@end