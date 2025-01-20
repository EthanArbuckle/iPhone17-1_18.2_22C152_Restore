@interface TTRIRootViewEmptyViewController
- (_TtC9RemindersP33_FA7497EFB9442A0772420FA2AEB0251131TTRIRootViewEmptyViewController)init;
- (_TtC9RemindersP33_FA7497EFB9442A0772420FA2AEB0251131TTRIRootViewEmptyViewController)initWithCoder:(id)a3;
- (_TtC9RemindersP33_FA7497EFB9442A0772420FA2AEB0251131TTRIRootViewEmptyViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation TTRIRootViewEmptyViewController

- (_TtC9RemindersP33_FA7497EFB9442A0772420FA2AEB0251131TTRIRootViewEmptyViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v10 = [(TTRIRootViewEmptyViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC9RemindersP33_FA7497EFB9442A0772420FA2AEB0251131TTRIRootViewEmptyViewController)init
{
  return [(TTRIRootViewEmptyViewController *)self initWithNibName:0 bundle:0];
}

- (_TtC9RemindersP33_FA7497EFB9442A0772420FA2AEB0251131TTRIRootViewEmptyViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TTRIRootViewEmptyViewController *)&v5 initWithCoder:a3];
}

@end