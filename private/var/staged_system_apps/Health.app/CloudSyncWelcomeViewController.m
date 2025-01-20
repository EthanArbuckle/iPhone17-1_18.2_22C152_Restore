@interface CloudSyncWelcomeViewController
- (_TtC6Health30CloudSyncWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6Health30CloudSyncWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapDisableCloudSync:(id)a3;
- (void)didTapEnableCloudSync:(id)a3;
- (void)viewDidLoad;
@end

@implementation CloudSyncWelcomeViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CloudSyncWelcomeViewController();
  id v2 = v6.receiver;
  [(CloudSyncWelcomeViewController *)&v6 viewDidLoad];
  [v2 view];
  if (v3)
  {
    v4 = v3;
    NSString v5 = String._bridgeToObjectiveC()();
    [v4 setAccessibilityIdentifier:v5];
  }
  else
  {
    __break(1u);
  }
}

- (void)didTapEnableCloudSync:(id)a3
{
}

- (void)didTapDisableCloudSync:(id)a3
{
}

- (_TtC6Health30CloudSyncWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC6Health30CloudSyncWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC6Health30CloudSyncWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC6Health30CloudSyncWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100070F10((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health30CloudSyncWelcomeViewController_delegate]);
  id v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health30CloudSyncWelcomeViewController_cloudSyncControl];
}

@end