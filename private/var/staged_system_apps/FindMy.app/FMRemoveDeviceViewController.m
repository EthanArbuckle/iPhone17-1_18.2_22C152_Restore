@interface FMRemoveDeviceViewController
- (_TtC6FindMy28FMRemoveDeviceViewController)initWithCoder:(id)a3;
- (_TtC6FindMy28FMRemoveDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancel;
- (void)performRemoveAccessory;
- (void)performRemoveDevice;
- (void)removeAccessory;
- (void)removeItem;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMRemoveDeviceViewController

- (_TtC6FindMy28FMRemoveDeviceViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_selectionSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_devicesSubscription) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_imageFetchingCancellable) = 0;
  id v4 = a3;

  result = (_TtC6FindMy28FMRemoveDeviceViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMRemoveDeviceViewController();
  id v2 = v3.receiver;
  [(FMRemoveDeviceViewController *)&v3 viewDidLoad];
  sub_100514F64();
  sub_100517E7C();
  sub_100518170();
  sub_10051C8A0();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_100514C2C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100514DE8(a3);
}

- (void)performRemoveDevice
{
  id v2 = self;
  sub_1005184E0();
}

- (void)performRemoveAccessory
{
  id v2 = self;
  sub_100519100();
}

- (void)removeAccessory
{
  id v2 = self;
  sub_10051963C();
}

- (void)removeItem
{
  id v2 = self;
  sub_10051A124();
}

- (void)cancel
{
}

- (_TtC6FindMy28FMRemoveDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy28FMRemoveDeviceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100057F94((uint64_t)self + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_viewModel, (uint64_t (*)(void))type metadata accessor for FMDeviceDetailViewModel);
  objc_super v3 = (char *)self + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_deviceToRemove;
  uint64_t v4 = type metadata accessor for FMIPDevice();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMRemoveDeviceViewController_landingView));

  swift_release();
}

@end