@interface MFMailDebugNotificationDelaySettingsViewController
+ (NSString)title;
- (MFMailDebugNotificationDelaySettingsViewController)initWithCoder:(id)a3;
- (MFMailDebugNotificationDelaySettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation MFMailDebugNotificationDelaySettingsViewController

+ (NSString)title
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static MailDebugNotificationDelaySettingsViewController.title.getter();
  id v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)viewDidLoad
{
  v2 = self;
  MailDebugNotificationDelaySettingsViewController.viewDidLoad()();
}

- (MFMailDebugNotificationDelaySettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v6;

    uint64_t v10 = v8;
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  return (MFMailDebugNotificationDelaySettingsViewController *)MailDebugNotificationDelaySettingsViewController.init(nibName:bundle:)(v10, v11, a4);
}

- (MFMailDebugNotificationDelaySettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  return (MFMailDebugNotificationDelaySettingsViewController *)MailDebugNotificationDelaySettingsViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MFMailDebugNotificationDelaySettingsViewController_contentHost));
}

@end