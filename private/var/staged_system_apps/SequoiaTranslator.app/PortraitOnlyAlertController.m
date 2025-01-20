@interface PortraitOnlyAlertController
- (_TtC17SequoiaTranslator27PortraitOnlyAlertController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator27PortraitOnlyAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation PortraitOnlyAlertController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (_TtC17SequoiaTranslator27PortraitOnlyAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PortraitOnlyAlertController();
  v9 = [(PortraitOnlyAlertController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC17SequoiaTranslator27PortraitOnlyAlertController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PortraitOnlyAlertController();
  return [(PortraitOnlyAlertController *)&v5 initWithCoder:a3];
}

@end