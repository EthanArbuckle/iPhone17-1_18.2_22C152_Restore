@interface NotificationViewController
- (_TtC26FindMyNotificationsContent26NotificationViewController)initWithCoder:(id)a3;
- (_TtC26FindMyNotificationsContent26NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)didReceiveNotification:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation NotificationViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100004DCC();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000050D0(a3);
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100005214(v4);
}

- (_TtC26FindMyNotificationsContent26NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC26FindMyNotificationsContent26NotificationViewController *)sub_1000079DC(v5, v7, a4);
}

- (_TtC26FindMyNotificationsContent26NotificationViewController)initWithCoder:(id)a3
{
  return (_TtC26FindMyNotificationsContent26NotificationViewController *)sub_100007B7C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_monogrammer));
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  id v8 = sub_1000097BC(v6, (uint64_t)a4);

  swift_unknownObjectRelease();

  return v8;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  id v8 = sub_1000098F8((uint64_t)a4);

  swift_unknownObjectRelease();

  return v8;
}

@end