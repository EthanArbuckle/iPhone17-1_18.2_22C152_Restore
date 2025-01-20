@interface ClearBackground.Controller
- (_TtCV11MusicCoreUIP33_BED032AFC26D7293E5DA491DDAECC51415ClearBackground10Controller)initWithCoder:(id)a3;
- (_TtCV11MusicCoreUIP33_BED032AFC26D7293E5DA491DDAECC51415ClearBackground10Controller)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation ClearBackground.Controller

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ClearBackground.Controller();
  id v2 = v6.receiver;
  [(ClearBackground.Controller *)&v6 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self clearColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ClearBackground.Controller();
  id v4 = v9.receiver;
  id v5 = a3;
  [(ClearBackground.Controller *)&v9 willMoveToParentViewController:v5];
  if (v5)
  {
    id v6 = [v5 view];
    if (v6)
    {
      v7 = v6;
      id v8 = [self clearColor];
      [v7 setBackgroundColor:v8];

      id v5 = v7;
      id v4 = v8;
    }
  }
}

- (_TtCV11MusicCoreUIP33_BED032AFC26D7293E5DA491DDAECC51415ClearBackground10Controller)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for ClearBackground.Controller();
  objc_super v9 = [(ClearBackground.Controller *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtCV11MusicCoreUIP33_BED032AFC26D7293E5DA491DDAECC51415ClearBackground10Controller)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClearBackground.Controller();
  return [(ClearBackground.Controller *)&v5 initWithCoder:a3];
}

@end