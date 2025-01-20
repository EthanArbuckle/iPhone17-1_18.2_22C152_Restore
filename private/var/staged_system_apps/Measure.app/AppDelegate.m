@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (UIWindow)window;
- (_TtC7Measure11AppDelegate)init;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AppDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC7Measure11AppDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11AppDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Measure11AppDelegate)init
{
  return (_TtC7Measure11AppDelegate *)sub_10002999C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11AppDelegate_levelShortcut);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10002B4FC();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  sub_10002AB74(v6);
  char v9 = v8;

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002AFE8();
}

- (void)applicationWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002B198();
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002B308();
}

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v4 = qword_1004C2B18;
  id v5 = a3;
  v7 = self;
  if (v4 != -1) {
    swift_once();
  }
  v6._object = (void *)0x800000010041FC50;
  v6._countAndFlagsBits = 0xD000000000000019;
  Log.default(_:isPrivate:)(v6, 0);
}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v4 = qword_1004C2B18;
  id v5 = a3;
  Swift::String v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  v7._object = (void *)0x800000010041FC30;
  v7._countAndFlagsBits = 0xD000000000000012;
  Log.default(_:isPrivate:)(v7, 0);
  char v8 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&v6->super.super.isa
                                                       + OBJC_IVAR____TtC7Measure11AppDelegate__appState)
                                         + 200);
  uint64_t v9 = swift_retain();
  uint64_t v10 = v8(v9);
  swift_release();
  (*(void (**)(unsigned char *(*)(unsigned char *), void))(*(void *)v10 + 280))(sub_10002A13C, 0);

  swift_release();
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  char v8 = (void (**)(void *, void))_Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v12 = self;
  char v11 = sub_10002A29C(v10);
  v8[2](v8, v11 & 1);
  _Block_release(v8);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (a4)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v10 = v9;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = 0;
  id v10 = 0;
  if (a5) {
LABEL_3:
  }
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  char v11 = self;
  id v12 = a3;
  BOOL result = sub_100029910();
  if (!v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (!v5)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v12)
  {
    swift_bridgeObjectRetain();
    v14._countAndFlagsBits = v8;
    v14._object = v10;
    Swift::Int v15 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1004855F0, v14);
    swift_bridgeObjectRelease();
    char v16 = 0;
    if (v15)
    {
      if (v15 != 1)
      {
LABEL_11:

        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        return v16;
      }
      char v16 = 1;
    }
    sub_100155340(v16, v12);
    char v16 = 1;
    goto LABEL_11;
  }
LABEL_16:
  __break(1u);
  return result;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  sub_10001C99C(0, (unint64_t *)&qword_1004C6A10);
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  if (static UIDevice.isIPhone()())
  {
    unsigned __int8 v10 = [self _hasHomeButton];

    if ((v10 & 1) == 0) {
      return 2;
    }
  }
  else
  {
  }
  return 30;
}

@end