@interface AirDropDiscoveryViewController
- (_TtC7AirDrop30AirDropDiscoveryViewController)initWithCoder:(id)a3;
- (_TtC7AirDrop30AirDropDiscoveryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didEnterBackgroundWithNotification:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willEnterForegroundWithNotification:(id)a3;
@end

@implementation AirDropDiscoveryViewController

- (_TtC7AirDrop30AirDropDiscoveryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001CCF0();
}

- (void)viewDidLoad
{
  v2 = self;
  AirDropDiscoveryViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  AirDropDiscoveryViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  AirDropDiscoveryViewController.viewDidDisappear(_:)(a3);
}

- (void)willEnterForegroundWithNotification:(id)a3
{
}

- (void)didEnterBackgroundWithNotification:(id)a3
{
}

- (_TtC7AirDrop30AirDropDiscoveryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7AirDrop30AirDropDiscoveryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_activityExtensionItemData));
  id v3 = (char *)self + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_airDropDiscoveryView;
  uint64_t v4 = sub_100022CC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10001CE40((uint64_t)self + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_delegate);
  swift_release();
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_pendingTransferID;
  uint64_t v6 = sub_100022F20();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
}

@end