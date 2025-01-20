@interface COSCDPRepairController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)requiresiCDPRepair;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (COSCDPRepairController)init;
- (COSCDPRepairController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (COSCDPRepairController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (double)waitScreenPushGracePeriod;
- (id)localizedWaitScreenDescription;
- (void)didPushWaitScreen;
@end

@implementation COSCDPRepairController

+ (BOOL)requiresiCDPRepair
{
  return sub_100149EB0() & 1;
}

+ (BOOL)controllerNeedsToRun
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  char v3 = (*(uint64_t (**)(void))(ObjCClassMetadata + 112))();
  if ((v3 & 1) == 0)
  {
    if (UIApp)
    {
      self;
      v4 = (void *)swift_dynamicCastObjCClass();
      if (v4)
      {
        id v5 = [v4 setupController];
        if (!v5)
        {
          __break(1u);
          return (char)v5;
        }
        v6 = v5;
        [v5 startSilentAppleIDSignIn];
      }
    }
  }
  LOBYTE(v5) = v3 & 1;
  return (char)v5;
}

- (void)didPushWaitScreen
{
  uint64_t v3 = sub_10013385C(&qword_10029A7F8);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_10014806C((uint64_t)v5, (uint64_t)&unk_10029AC88, (uint64_t)v9);
  swift_release();
}

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (BOOL)holdWithWaitScreen
{
  return 1;
}

- (double)waitScreenPushGracePeriod
{
  return 0.0;
}

- (id)localizedWaitScreenDescription
{
  v2 = self;
  sub_1001399C0(0xD000000000000017, (void *)0x8000000100224150);

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (COSCDPRepairController)init
{
  *(void *)&self->super.BPSWelcomeOptinViewController_opaque[OBJC_IVAR___COSCDPRepairController_cdpEncryptionHelper] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CDPRepairController();
  return [(COSOptinViewController *)&v3 init];
}

- (COSCDPRepairController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (COSCDPRepairController *)sub_100149800(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (COSCDPRepairController *)sub_100149800(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (COSCDPRepairController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  *(void *)&self->super.BPSWelcomeOptinViewController_opaque[OBJC_IVAR___COSCDPRepairController_cdpEncryptionHelper] = 0;
  id v12 = a5;
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (v11)
  {
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v14 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for CDPRepairController();
  uint64_t v15 = [(COSCDPRepairController *)&v17 initWithTitle:v13 detailText:v14 icon:v12 contentLayout:a6];

  return v15;
}

- (void).cxx_destruct
{
}

@end