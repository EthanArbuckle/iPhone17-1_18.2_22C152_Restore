@interface MusicUserNotificationViewController
- (_TtC33MusicNotificationContentExtension35MusicUserNotificationViewController)initWithCoder:(id)a3;
- (_TtC33MusicNotificationContentExtension35MusicUserNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation MusicUserNotificationViewController

- (_TtC33MusicNotificationContentExtension35MusicUserNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100003D80();
    id v6 = a4;
    NSString v7 = sub_100003D70();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MusicUserNotificationViewController();
  v9 = [(MusicUserNotificationViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC33MusicNotificationContentExtension35MusicUserNotificationViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MusicUserNotificationViewController();
  return [(MusicUserNotificationViewController *)&v5 initWithCoder:a3];
}

@end