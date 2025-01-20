@interface MetricsEventDetailListViewController
- (_TtC8VideosUI36MetricsEventDetailListViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI36MetricsEventDetailListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8VideosUI36MetricsEventDetailListViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MetricsEventDetailListViewController

- (_TtC8VideosUI36MetricsEventDetailListViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E36C7040();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1E36C7184(a3);
}

- (_TtC8VideosUI36MetricsEventDetailListViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC8VideosUI36MetricsEventDetailListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E36C7290();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36MetricsEventDetailListViewController_event));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_1E36C732C();

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_91();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_19();
  id v7 = v4;
  id v8 = v5;
  double v9 = sub_1E36C73A4();

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
  double v9 = (void *)sub_1E36C745C(v7);

  uint64_t v10 = OUTLINED_FUNCTION_7_2();
  v11(v10);
  return v9;
}

@end