@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (UIWindow)window;
- (_TtC17SequoiaTranslator11AppDelegate)init;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)setWindow:(id)a3;
@end

@implementation AppDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10000B630();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  char v8 = sub_10000B524();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v6 = a3;
  v7 = self;
  if (!a4) {
    goto LABEL_7;
  }
  id v8 = a4;
  id v9 = [v8 rootViewController];
  if (!v9) {
    goto LABEL_7;
  }
  v10 = v9;
  self;
  v11 = (void *)swift_dynamicCastObjCClass();
  if (!v11)
  {

    goto LABEL_7;
  }
  id v12 = [v11 selectedIndex];

  if (v12 != (id)1)
  {
LABEL_7:
    unint64_t v13 = *(unint64_t *)((char *)&v7->super.super.isa
                              + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_orientationLock);
    goto LABEL_8;
  }
  unint64_t v13 = 26;
  a4 = v8;
LABEL_8:

  return v13;
}

- (_TtC17SequoiaTranslator11AppDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_interruptionController) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_orientationLock) = (Class)26;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  swift_release();
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_100011038(v10, v7, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

@end