@interface CRLiOSAppDelegate
+ (_TtC8Freeform17CRLiOSAppDelegate)shared;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (_TtC8Freeform17CRLiOSAppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)applicationDidEnterBackground;
- (void)applicationWillTerminate:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
@end

@implementation CRLiOSAppDelegate

+ (_TtC8Freeform17CRLiOSAppDelegate)shared
{
  id v2 = [self sharedApplication];
  id v3 = [v2 delegate];

  if (v3)
  {
    type metadata accessor for CRLiOSAppDelegate();
    v5 = (void *)swift_dynamicCastClassUnconditional();
    return (_TtC8Freeform17CRLiOSAppDelegate *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  return sub_1006C439C(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1006C6F14);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return sub_1006C439C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1006C7594);
}

- (void)applicationDidEnterBackground
{
  id v2 = self;
  sub_1006C446C();
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006C8768();
}

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1006C4B8C(a3);
  swift_unknownObjectRelease();
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = [v9 role];
  id v13 = objc_allocWithZone((Class)UISceneConfiguration);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithName:v14 sessionRole:v12];

  return v15;
}

- (_TtC8Freeform17CRLiOSAppDelegate)init
{
  return (_TtC8Freeform17CRLiOSAppDelegate *)sub_1006C6288();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_boardLibraryCommandController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_boardPreviewImageCache));
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_applicationCoordinator));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_sharingExtensionImporter));

  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_autoFillMenuIdentifier);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (!a4)
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (v5) {
LABEL_3:
  }
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  id v11 = a3;
  id v12 = self;
  char v13 = sub_100A123C8(a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

@end