@interface AppDelegate
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (_TtC7Journal11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)applicationDidReceiveMemoryWarning:;
- (uint64_t)applicationProtectedDataWillBecomeUnavailable:;
- (void)applicationWillTerminate:;
- (void)testRunner:(id)a3 didFailRunningParameters:(id)a4 withError:(id)a5;
- (void)testRunner:(id)a3 didFinishRunningParameters:(id)a4;
@end

@implementation AppDelegate

- (void)applicationWillTerminate:
{
  uint64_t v0 = sub_100010218((uint64_t *)&unk_100800A60);
  __chkstk_darwin(v0 - 8);
  v55 = (char *)v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for URL.DirectoryHint();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v12 = (char *)v47 - v11;
  __chkstk_darwin(v13);
  v15 = (char *)v47 - v14;
  id v54 = self;
  id v16 = [v54 defaultManager];
  if (qword_1007F6EF8 != -1) {
    swift_once();
  }
  if (qword_10083D468)
  {
    sub_1004FD498(qword_10083D460, (void *)qword_10083D468, (uint64_t)v12);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for URL.DirectoryHint.inferFromPath(_:), v2);
    sub_100014344();
    URL.appending<A>(components:directoryHint:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  else
  {
    static URL.temporaryDirectory.getter();
  }
  URL._bridgeToObjectiveC()(v17);
  v19 = v18;
  v52 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v53 = v7 + 8;
  v52(v15, v6);
  id v56 = 0;
  id v20 = [v16 contentsOfDirectoryAtURL:v19 includingPropertiesForKeys:0 options:4 error:&v56];

  id v21 = v56;
  if (!v20)
  {
    v39 = v21;
    _convertNSErrorToError(_:)();

    swift_willThrow();
LABEL_18:
    if (qword_1007F6998 != -1) {
      swift_once();
    }
    uint64_t v41 = type metadata accessor for Logger();
    sub_100026A54(v41, (uint64_t)qword_1007FCED8);
    swift_errorRetain();
    swift_errorRetain();
    v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = (void *)swift_slowAlloc();
      *(_DWORD *)v44 = 138412290;
      swift_errorRetain();
      v46 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v56 = v46;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v45 = v46;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "AssetsFileManager.clearTemporaryDirectory error: %@", v44, 0xCu);
      sub_100010218((uint64_t *)&unk_1007FC430);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    return;
  }
  uint64_t v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v23 = *(void *)(v22 + 16);
  if (v23)
  {
    v25 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v24 = v7 + 16;
    unint64_t v26 = v22 + ((*(unsigned __int8 *)(v24 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 64));
    uint64_t v27 = *(void *)(v24 + 56);
    v47[2] = v22;
    uint64_t v48 = v27;
    v28 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 40);
    v49 = (unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 32);
    v50 = v25;
    uint64_t v51 = v24;
    v29 = (void (**)(char *, char *, uint64_t))(v24 + 16);
    v47[1] = (unint64_t)v28 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v30 = v55;
    v31 = v9;
    while (1)
    {
      v50(v30, v26, v6);
      v32 = *v28;
      (*v28)(v30, 0, 1, v6);
      if ((*v49)(v30, 1, v6) == 1)
      {
        swift_bridgeObjectRelease();
        return;
      }
      (*v29)(v31, v30, v6);
      id v33 = [v54 defaultManager];
      URL._bridgeToObjectiveC()(v34);
      v36 = v35;
      id v56 = 0;
      unsigned int v37 = [v33 removeItemAtURL:v35 error:&v56];

      if (!v37) {
        break;
      }
      id v38 = v56;
      v52(v31, v6);
      v26 += v48;
      --v23;
      v30 = v55;
      if (!v23) {
        goto LABEL_15;
      }
    }
    id v40 = v56;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v52(v31, v6);
    goto LABEL_18;
  }
  v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v30 = v55;
LABEL_15:
  v32(v30, 1, 1, v6);
  swift_bridgeObjectRelease();
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1002BC568(&qword_100806910, type metadata accessor for LaunchOptionsKey);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  uint64_t v8 = self;
  sub_1002BB4F0(v4);
  char v10 = v9;

  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  id v12 = [v9 role];
  id v13 = objc_allocWithZone((Class)UISceneConfiguration);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithName:v14 sessionRole:v12];

  return v15;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = self;
  v16[2] = URL.absoluteString.getter();
  v16[3] = v13;
  v16[0] = 0x3A73746E656D6F6DLL;
  v16[1] = 0xEA00000000002F2FLL;
  sub_1000143EC();
  sub_10022C144();
  char v14 = BidirectionalCollection<>.starts<A>(with:)();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 & 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = self;
  v5 = self;
  id v6 = [v4 sharedApplication];
  sub_10031F2EC();
  uint64_t v8 = v7;

  sub_1002BAD74(v8);
  LOBYTE(v6) = v9;

  if (v6)
  {

    return 1;
  }
  else
  {
    v12.receiver = v5;
    v12.super_class = ObjectType;
    BOOL v10 = [(AppDelegate *)&v12 accessibilityPerformMagicTap];
  }
  return v10;
}

- (_TtC7Journal11AppDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC7Journal11AppDelegate_keyboardManager;
  type metadata accessor for KeyboardManager();
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)swift_allocObject();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Journal11AppDelegate_streakReminderTask) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(AppDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (uint64_t)applicationProtectedDataWillBecomeUnavailable:
{
  uint64_t v0 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for TaskPriority();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_10001457C((uint64_t)v2, &qword_1007FA1D0);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (*(void *)(v5 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v7 = v8;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = &unk_100806900;
  *(void *)(v9 + 24) = v5;
  if (v7 | v6)
  {
    v11[0] = 0;
    v11[1] = 0;
    v11[2] = v6;
    v11[3] = v7;
  }
  swift_task_create();
  return swift_release();
}

- (id)applicationDidReceiveMemoryWarning:
{
  if (qword_1007F6D28 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100026A54(v0, (uint64_t)qword_100806840);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Received applicationDidReceiveMemoryWarning", v3, 2u);
    swift_slowDealloc();
  }

  if (qword_1007F6BA0 != -1) {
    swift_once();
  }
  sub_1002B9270();

  return sub_1005B7178();
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;
  id v10 = a3;
  id v11 = self;
  LOBYTE(v7) = sub_100655760((void *)v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)testRunner:(id)a3 didFinishRunningParameters:(id)a4
{
  uint64_t v5 = qword_1007F7D00;
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100026A54(v8, (uint64_t)qword_10083EB00);
  unint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Finished running test", v11, 2u);
    swift_slowDealloc();
  }

  swift_unknownObjectRelease();
}

- (void)testRunner:(id)a3 didFailRunningParameters:(id)a4 withError:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  uint64_t v8 = self;
  sub_100655E34();

  swift_unknownObjectRelease();
}

@end