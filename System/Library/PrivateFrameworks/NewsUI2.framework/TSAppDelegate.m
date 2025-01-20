@interface TSAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (TSAppDelegate)init;
- (UIWindow)window;
- (id)createBridgedAppResolver;
- (id)createCarPlaySceneContainer;
- (id)createSceneContainer;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5;
- (void)application:(id)a3 handleIntent:(id)a4 completionHandler:(id)a5;
- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4;
- (void)bootstrapWithApplication:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)didCommitFirstFrame;
- (void)setWindow:(id)a3;
- (void)validateCommand:(id)a3;
@end

@implementation TSAppDelegate

- (id)createBridgedAppResolver
{
  v2 = self;
  sub_1DEA24BA8((uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_1DFDECC30();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);

  return v3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1DEAE3AD8(&qword_1EAC1FA30, 255, type metadata accessor for LaunchOptionsKey);
    uint64_t v4 = sub_1DFDFDAF0();
  }
  id v7 = a3;
  v8 = self;
  char v9 = sub_1DE9870C8(v4);

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1DEAE3AD8(&qword_1EAC1FA30, 255, type metadata accessor for LaunchOptionsKey);
    sub_1DFDFDAF0();
  }
  id v6 = a3;
  id v7 = self;
  char v8 = _s7NewsUI211AppDelegateC11application_30willFinishLaunchingWithOptionsSbSo13UIApplicationC_SDySo0k6LaunchJ3KeyaypGSgtF_0();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (id)createSceneContainer
{
  uint64_t v3 = sub_1DFDF0E10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = self;
  sub_1DE93F5F8();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FABEE8], v3);
  char v8 = (void *)sub_1DFDF16B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v8;
}

- (void)bootstrapWithApplication:(id)a3
{
  sub_1DFDE8210();
  id v5 = a3;
  id v6 = self;
  sub_1DFDE7CE0();
  type metadata accessor for AppDelegate();
  sub_1DEAE3AD8(&qword_1EBAA9BE8, v7, (void (*)(uint64_t))type metadata accessor for AppDelegate);
  sub_1DFDE7EB0();
  swift_release();
  sub_1DFDE8200();
}

- (TSAppDelegate)init
{
  return (TSAppDelegate *)AppDelegate.init()();
}

- (void)didCommitFirstFrame
{
  uint64_t v3 = sub_1DFDEDAB0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v6 = (char *)&v9[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  sub_1DEA24BA8((uint64_t)v9);
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_1DFDED650();
  if (sub_1DFDECCB0())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FAAE88], v3);
    sub_1DFDED630();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    __break(1u);
  }
}

- (UIWindow)window
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___TSAppDelegate_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___TSAppDelegate_window);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1DE9332F4((uint64_t)self + OBJC_IVAR___TSAppDelegate____lazy_storage___resolver, &qword_1EBAA7470, (unint64_t *)&unk_1EBAA7460, MEMORY[0x1E4FAA9C0]);

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (id)createCarPlaySceneContainer
{
  v2 = self;
  sub_1DE93F5F8();
  uint64_t v3 = (void *)sub_1DFDF1690();

  swift_release();
  return v3;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v27 = MEMORY[0x1E4FAC178];
  uint64_t v26 = MEMORY[0x1E4FBB718];
  sub_1DF329604(0, (unint64_t *)&unk_1EBAA3B00, MEMORY[0x1E4FAC178], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  char v9 = (char *)&v25 - v8;
  uint64_t v10 = sub_1DFDE7220();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DFDE7190();
  type metadata accessor for OpenURLOptionsKey(0);
  sub_1DEAE3AD8(&qword_1EBAA6610, 255, type metadata accessor for OpenURLOptionsKey);
  sub_1DFDFDAF0();
  v14 = self;
  id v15 = a3;
  v16 = self;
  id v17 = objc_msgSend(v14, sel_sharedApplication);
  id v18 = objc_msgSend(v17, sel_connectedScenes);

  sub_1DE919914(0, (unint64_t *)&qword_1EBAA6620);
  sub_1DF18E704();
  uint64_t v19 = sub_1DFDFE5D0();

  sub_1DF326784(v19);
  v21 = v20;
  swift_bridgeObjectRelease();
  sub_1DF327604(v21);
  uint64_t v22 = sub_1DFDF14B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 1, 1, v22);
  char v23 = sub_1DFDED450();
  swift_release();

  sub_1DEA2CE18((uint64_t)v9, (uint64_t)&unk_1EBAA3B00, v27, v26, (uint64_t (*)(void))sub_1DF329604);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v23 & 1;
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1DFDFDAF0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = a3;
  uint64_t v11 = self;
  sub_1DF328C94(v8, (uint64_t)sub_1DF329668, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)application:(id)a3 handleIntent:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_1DF328E9C(v10, (uint64_t)v11, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  sub_1DF329098((uint64_t)sub_1DEB6EE74, v7);

  swift_release();
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  uint64_t v4 = self;
  AppDelegate.forwardingTarget(for:)((uint64_t)a3, v12);

  uint64_t v5 = v13;
  if (v13)
  {
    id v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6);
    id v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    id v10 = (void *)sub_1DFDFFF30();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  id v6 = (id)sub_1DF326D08();
  objc_msgSend(v6, sel_buildMenuWithBuilder_, a3);
  swift_unknownObjectRelease();
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = (void *)sub_1DF326D08();
  swift_getObjectType();
  sub_1DF326DE8();
  uint64_t v7 = sub_1DF326EC0();
  v8[3] = sub_1DFDE8900();
  v8[4] = sub_1DEAE3AD8((unint64_t *)&qword_1EBAA7040, 255, MEMORY[0x1E4F4AB68]);
  v8[0] = v7;
  sub_1DFDF12D0();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    sub_1DFDFF780();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v7 = self;
  }
  char v8 = AppDelegate.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_1DEA2CE18((uint64_t)v10, (uint64_t)&qword_1EBABB7F0, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1DEAE8FD8);
  return v8 & 1;
}

@end