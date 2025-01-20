@interface NotificationView
- (MKMapView)mapView;
- (UILabel)notificationBodyLabel;
- (_TtC26FindMyNotificationsContent16NotificationView)initWithCoder:(id)a3;
- (_TtC26FindMyNotificationsContent16NotificationView)initWithFrame:(CGRect)a3;
- (void)setMapView:(id)a3;
- (void)setNotificationBodyLabel:(id)a3;
@end

@implementation NotificationView

- (MKMapView)mapView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (MKMapView *)Strong;
}

- (void)setMapView:(id)a3
{
}

- (UILabel)notificationBodyLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setNotificationBodyLabel:(id)a3
{
}

- (_TtC26FindMyNotificationsContent16NotificationView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NotificationView();
  return -[NotificationView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC26FindMyNotificationsContent16NotificationView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NotificationView();
  return [(NotificationView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end