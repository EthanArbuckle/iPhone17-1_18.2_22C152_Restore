@interface NotificationViewController
- (_TtC20SeymourNotifications26NotificationViewController)initWithCoder:(id)a3;
- (_TtC20SeymourNotifications26NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation NotificationViewController

- (_TtC20SeymourNotifications26NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100003DB0();
    id v6 = a4;
    NSString v7 = sub_100003DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for NotificationViewController();
  v9 = [(NotificationViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC20SeymourNotifications26NotificationViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NotificationViewController();
  return [(NotificationViewController *)&v5 initWithCoder:a3];
}

@end