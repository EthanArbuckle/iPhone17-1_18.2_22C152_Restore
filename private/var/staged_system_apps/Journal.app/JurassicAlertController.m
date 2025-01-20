@interface JurassicAlertController
- (_TtC7Journal23JurassicAlertController)initWithCoder:(id)a3;
- (_TtC7Journal23JurassicAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation JurassicAlertController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for JurassicAlertController();
  id v2 = v6.receiver;
  [(JurassicAlertController *)&v6 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self systemIndigoColor];
    [v4 setTintColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC7Journal23JurassicAlertController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for JurassicAlertController();
  v9 = [(JurassicAlertController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC7Journal23JurassicAlertController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JurassicAlertController();
  return [(JurassicAlertController *)&v5 initWithCoder:a3];
}

@end