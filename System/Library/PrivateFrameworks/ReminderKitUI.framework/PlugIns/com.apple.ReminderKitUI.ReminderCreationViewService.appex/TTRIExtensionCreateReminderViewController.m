@interface TTRIExtensionCreateReminderViewController
- (UIBarButtonItem)addBarButtonItem;
- (UITableView)tableView;
- (_TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController)initWithCoder:(id)a3;
- (_TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapAdd:(id)a3;
- (void)didTapCancel:(id)a3;
- (void)setAddBarButtonItem:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TTRIExtensionCreateReminderViewController

- (_TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController)initWithCoder:(id)a3
{
  return (_TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController *)sub_10001ED14(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001EE98();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10001FD4C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  [(TTRIExtensionCreateReminderViewController *)&v5 viewWillDisappear:v3];
  if (*(void *)&v4[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver])
  {
    swift_retain();
    sub_100022180();
    swift_release();
  }
  sub_100021E80();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10001FF20();
}

- (UITableView)tableView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITableView *)Strong;
}

- (void)setTableView:(id)a3
{
}

- (UIBarButtonItem)addBarButtonItem
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIBarButtonItem *)Strong;
}

- (void)setAddBarButtonItem:(id)a3
{
}

- (void)didTapCancel:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100022700();
  swift_unknownObjectRelease();
  sub_100010B94();

  sub_1000132D0((uint64_t)&v5);
}

- (void)didTapAdd:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100022700();
  swift_unknownObjectRelease();
  sub_100022640();
  [(TTRIExtensionCreateReminderViewController *)v4 resignFirstResponder];
  sub_1000106BC();

  sub_1000132D0((uint64_t)&v5);
}

- (_TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_tableDataController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end