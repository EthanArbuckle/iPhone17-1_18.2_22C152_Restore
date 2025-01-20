@interface TTRIAddShareesViewController
+ (id)composeLabel;
+ (id)titleString;
- (_TtC9Reminders28TTRIAddShareesViewController)initWithAllowsPhoneNumbers:(BOOL)a3;
- (_TtC9Reminders28TTRIAddShareesViewController)initWithCoder:(id)a3;
- (_TtC9Reminders28TTRIAddShareesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TTRIAddShareesViewController

+ (id)titleString
{
  v4._object = (void *)0x80000001006A4820;
  v3._countAndFlagsBits = 0x7372655020646441;
  v3._object = (void *)0xEA00000000006E6FLL;
  v4._countAndFlagsBits = 0xD00000000000002ALL;
  return sub_10005FE9C((int)a1, (int)a2, v3, v4);
}

+ (id)composeLabel
{
  v4._object = (void *)0x80000001006A47D0;
  v3._countAndFlagsBits = 3829588;
  v3._object = (void *)0xE300000000000000;
  v4._countAndFlagsBits = 0xD000000000000047;
  return sub_10005FE9C((int)a1, (int)a2, v3, v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10005FEF4();
}

- (_TtC9Reminders28TTRIAddShareesViewController)initWithAllowsPhoneNumbers:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(RemindersListAddPersonController *)&v5 initWithAllowsPhoneNumbers:v3];
}

- (_TtC9Reminders28TTRIAddShareesViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v10 = [(TTRIAddShareesViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC9Reminders28TTRIAddShareesViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TTRIAddShareesViewController *)&v5 initWithCoder:a3];
}

@end