@interface TTRIAppDelegate
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4;
- (_TtC9Reminders15TTRIAppDelegate)init;
- (void)application:(id)a3 didUpdateUserActivity:(id)a4;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)application:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4;
- (void)buildMenuWithBuilder:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation TTRIAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10001D3DC(&qword_100799F80, type metadata accessor for LaunchOptionsKey);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  v8 = self;
  char v9 = sub_10001D424(v4);

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (_TtC9Reminders15TTRIAppDelegate)init
{
  return (_TtC9Reminders15TTRIAppDelegate *)sub_100017524();
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for OpenURLOptionsKey(0);
  sub_10001D3DC((unint64_t *)&unk_100799F90, type metadata accessor for OpenURLOptionsKey);
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  v13 = self;
  char v14 = sub_1002F41BC((uint64_t)v10, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 & 1;
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  LOBYTE(v6) = sub_1002F44C0(v6, v8);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)application:(id)a3 didUpdateUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  sub_1002F466C(v7);
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  unint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  char v12 = sub_1002F4840(v10);
  _Block_release(v8);

  return v12 & 1;
}

- (void)application:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  sub_1002F49E4(v7);
}

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1002F3694(a3);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders15TTRIAppDelegate____lazy_storage___hashtagAssociation, &qword_100799F68);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  sub_1002F539C(a4);
}

@end