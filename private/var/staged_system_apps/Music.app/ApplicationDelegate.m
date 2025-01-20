@interface ApplicationDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (UIResponder)nextResponder;
- (_TtC5Music19ApplicationDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)application:(id)a3 handlerForIntent:(id)a4;
- (uint64_t)userNotificationCenter:openSettingsForNotification:;
@end

@implementation ApplicationDelegate

- (_TtC5Music19ApplicationDelegate)init
{
  return (_TtC5Music19ApplicationDelegate *)sub_1000136F8();
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_100019690(v9, v10);

  return v12;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1002FE778(&qword_1010995B8, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  char v8 = sub_10001E6DC();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for OpenURLOptionsKey(0);
  sub_1002FE778(&qword_1010995D8, type metadata accessor for OpenURLOptionsKey);
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  v13 = self;
  char v14 = sub_1002FE1E0(v12, (uint64_t)v10, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 & 1;
}

- (UIResponder)nextResponder
{
  v2 = self;
  id v3 = sub_1002FDC5C();

  return (UIResponder *)v3;
}

- (id)application:(id)a3 handlerForIntent:(id)a4
{
  self;
  if (!swift_dynamicCastObjCClass()) {
    goto LABEL_4;
  }
  uint64_t v7 = (objc_class *)type metadata accessor for MediaIntentHandler();
  id v8 = objc_allocWithZone(v7);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  v19[3] = v7;
  v19[0] = [v8 init];

  if (v7)
  {
    id v12 = sub_100068990(v19, (uint64_t)v7);
    uint64_t v13 = *((void *)v7 - 1);
    __n128 v14 = __chkstk_darwin(v12);
    uint64_t v16 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v13 + 16))(v16, v14);
    v17 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, objc_class *))(v13 + 8))(v16, v7);
    sub_1000760E4((uint64_t)v19);
  }
  else
  {
LABEL_4:
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  swift_release();
}

- (uint64_t)userNotificationCenter:openSettingsForNotification:
{
  uint64_t v0 = sub_100063814((uint64_t *)&unk_10109BF50);
  __chkstk_darwin(v0 - 8);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  id v9 = &v20[-v8];
  id v10 = [self sharedApplication];
  id v11 = [v10 connectedScenes];
  sub_100057778(0, (unint64_t *)&qword_10109BA70);
  sub_1002FE178();
  uint64_t v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1006BCD84(v12);
  unint64_t v14 = v13;
  uint64_t result = swift_bridgeObjectRelease();
  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_3;
    }
LABEL_11:

    return swift_bridgeObjectRelease();
  }
  if (!*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_11;
  }
LABEL_3:
  if ((v14 & 0xC000000000000001) != 0)
  {
    id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v16 = *(id *)(v14 + 32);
  }
  v17 = v16;

  swift_bridgeObjectRelease();
  URL.init(string:)();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {

    return sub_1000637B8((uint64_t)v2, (uint64_t *)&unk_10109BF50);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 32))(v9, v2, v3);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v6, v9, v3);
    type metadata accessor for LaunchOptions(0);
    swift_allocObject();
    id v18 = v17;
    sub_1002757F4((uint64_t)v6, 0, v18);
    sub_100285AC8();

    swift_release();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v9, v3);
  }
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
  uint64_t v12 = self;
  char v13 = sub_10050712C(a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

@end