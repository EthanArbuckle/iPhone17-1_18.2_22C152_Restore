@interface MFMailIntelligenceLightSettingsViewController
+ (NSString)title;
- (MFMailIntelligenceLightSettingsViewController)initWithCoder:(id)a3;
- (MFMailIntelligenceLightSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation MFMailIntelligenceLightSettingsViewController

+ (NSString)title
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static MailIntelligenceLightSettingsViewController.title.getter();
  id v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)viewDidLoad
{
  v2 = self;
  MailIntelligenceLightSettingsViewController.viewDidLoad()();
}

- (MFMailIntelligenceLightSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (MFMailIntelligenceLightSettingsViewController *)MailIntelligenceLightSettingsViewController.init(nibName:bundle:)(v10, v11, a4);
}

- (MFMailIntelligenceLightSettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  return (MFMailIntelligenceLightSettingsViewController *)MailIntelligenceLightSettingsViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MFMailIntelligenceLightSettingsViewController_contentHost));
}

@end