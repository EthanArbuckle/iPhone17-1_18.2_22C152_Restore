@interface TTRISpinnerAlertContentViewController
- (_TtC9Reminders37TTRISpinnerAlertContentViewController)initWithCoder:(id)a3;
- (_TtC9Reminders37TTRISpinnerAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TTRISpinnerAlertContentViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10062B9D4();
}

- (_TtC9Reminders37TTRISpinnerAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v8 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(TTRISpinnerAlertContentViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC9Reminders37TTRISpinnerAlertContentViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TTRISpinnerAlertContentViewController *)&v5 initWithCoder:a3];
}

@end