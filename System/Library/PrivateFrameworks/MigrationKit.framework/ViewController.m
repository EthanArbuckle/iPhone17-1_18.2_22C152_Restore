@interface ViewController
- (_TtC12MigrationKit14ViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC12MigrationKit14ViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)cancel;
- (void)viewDidLoad;
@end

@implementation ViewController

- (_TtC12MigrationKit14ViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  sub_22C01E5F8();
  sub_22C01E5E8();
  sub_22C01E5B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = sub_22C01E4A8();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    goto LABEL_8;
  }
  a4 = (id)sub_22C01E4A8();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v14 = sub_22C01E4A8();
  uint64_t v16 = v15;
LABEL_8:
  v17 = (_TtC12MigrationKit14ViewController *)ViewController.init(title:detailText:symbolName:contentLayout:)(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  swift_release();
  return v17;
}

- (void)viewDidLoad
{
  sub_22C01E5F8();
  sub_22C01E5E8();
  sub_22C01E5B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_22C010CF0();
  swift_release();
}

- (void)cancel
{
  sub_22C01E5F8();
  sub_22C01E5E8();
  sub_22C01E5B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_22C01E5E8();
  sub_22C01E5B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = [(ViewController *)v3 navigationController];
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

    swift_release();
  }
  else
  {

    swift_release();
  }
  swift_release();
}

- (_TtC12MigrationKit14ViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  sub_22C01E5F8();
  sub_22C01E5E8();
  sub_22C01E5B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a5;
  result = (_TtC12MigrationKit14ViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end