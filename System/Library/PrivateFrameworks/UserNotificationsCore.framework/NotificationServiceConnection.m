@interface NotificationServiceConnection
- (_TtC21UserNotificationsCore29NotificationServiceConnection)init;
- (void)addNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4;
- (void)getBadgeNumberForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getClearedInfoForDataProviderMigrationWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getDeliveredNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationCategoriesForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationSettingsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationSettingsForTopicsWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationTopicsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getPendingNotificationRequestsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)removeAllDeliveredNotificationsForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeAllPendingNotificationRequestsForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeSimilarNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)replaceContentForRequestWithIdentifier:(id)a3 bundleIdentifier:(id)a4 replacementContent:(id)a5 completionHandler:(id)a6;
- (void)requestAuthorizationWithOptions:(unint64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)requestRemoveAuthorizationForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setNotificationCategories:(id)a3 forBundleIdentifier:(id)a4;
- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4;
- (void)setNotificationTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setObservingUserNotifications:(BOOL)a3 forBundleIdentifier:(id)a4;
@end

@implementation NotificationServiceConnection

- (void)getNotificationSettingsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)getNotificationSettingsForTopicsWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)setNotificationCategories:(id)a3 forBundleIdentifier:(id)a4
{
  sub_2608DED7C(0, &qword_26B3FC978);
  sub_2608E0C98((unint64_t *)&unk_26B3FC980, &qword_26B3FC978);
  sub_260A84FA0();
  uint64_t v5 = sub_260A84BC0();
  unint64_t v7 = v6;
  v8 = self;
  os_transaction_create();
  sub_2608DF63C(v8, v5, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)setNotificationTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  unint64_t v6 = _Block_copy(a5);
  sub_2608DED7C(0, &qword_26B3F7228);
  sub_2608E0C98(&qword_26B3F7250, &qword_26B3F7228);
  uint64_t v7 = sub_260A84FA0();
  uint64_t v8 = sub_260A84BC0();
  unint64_t v10 = v9;
  _Block_copy(v6);
  v11 = self;
  sub_2608E062C(v7, v8, v10, v11, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC21UserNotificationsCore29NotificationServiceConnection)init
{
  result = (_TtC21UserNotificationsCore29NotificationServiceConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_26094056C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore29NotificationServiceConnection_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore29NotificationServiceConnection_clientConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore29NotificationServiceConnection_clientAuditToken));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore29NotificationServiceConnection_queue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21UserNotificationsCore29NotificationServiceConnection_queue_serverConnection);
}

- (void)setObservingUserNotifications:(BOOL)a3 forBundleIdentifier:(id)a4
{
  uint64_t v6 = sub_260A84BC0();
  unint64_t v8 = v7;
  unint64_t v9 = self;
  os_transaction_create();
  sub_2609B8AD4(v9, v6, v8, a3);

  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  unint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_260A84BC0();
  unint64_t v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_2609BD118(a3, v8, v10, v11, (void (**)(void, void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)getNotificationCategoriesForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)addNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  unint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_260A84BC0();
  unint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a3;
  v12 = self;
  sub_2609BDD9C((uint64_t)v11, v8, v10, v12, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)replaceContentForRequestWithIdentifier:(id)a3 bundleIdentifier:(id)a4 replacementContent:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = (uint64_t (*)())_Block_copy(a6);
  uint64_t v9 = sub_260A84BC0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_260A84BC0();
  unint64_t v14 = v13;
  if (v8)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v8;
    uint64_t v8 = sub_2608DF170;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = a5;
  v17 = self;
  sub_2609B9270(v9, v11, v12, v14, (uint64_t)v16, (void (*)(void))v8, v15);
  sub_2609477D4((uint64_t)v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4
{
  sub_2608DED7C(0, &qword_26B3F7220);
  sub_260A84D70();
  uint64_t v5 = sub_260A84BC0();
  unint64_t v7 = v6;
  uint64_t v8 = self;
  os_transaction_create();
  sub_2609B9974(v8, v5, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)getPendingNotificationRequestsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  unint64_t v6 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v7 = sub_260A84D70();
  uint64_t v8 = sub_260A84BC0();
  unint64_t v10 = v9;
  if (v6)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v6;
    unint64_t v6 = sub_2609C1298;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = self;
  sub_2609B9F5C(v7, v8, v10, (void (*)(void, uint64_t))v6, v11);
  sub_2609477D4((uint64_t)v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)removeSimilarNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  unint64_t v6 = (uint64_t (*)())_Block_copy(a5);
  sub_2608DED7C(0, &qword_26B3F7220);
  uint64_t v7 = sub_260A84D70();
  uint64_t v8 = sub_260A84BC0();
  unint64_t v10 = v9;
  if (v6)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v6;
    unint64_t v6 = sub_2609C1298;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = self;
  sub_2609BA640(v7, v8, v10, (void (*)(void, void))v6, v11);
  sub_2609477D4((uint64_t)v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)removeAllPendingNotificationRequestsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (uint64_t (*)())_Block_copy(a4);
  uint64_t v6 = sub_260A84BC0();
  unint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v5;
    uint64_t v5 = sub_2609C1298;
  }
  else
  {
    uint64_t v9 = 0;
  }
  unint64_t v10 = self;
  sub_2609BAD54(v6, v8, (void (*)(void, void))v5, v9);
  sub_2609477D4((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)getDeliveredNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v7 = sub_260A84D70();
  uint64_t v8 = sub_260A84BC0();
  unint64_t v10 = v9;
  if (v6)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v6;
    uint64_t v6 = sub_2609C1298;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = self;
  sub_2609BB514(v7, v8, v10, (void (*)(void, uint64_t))v6, v11);
  sub_2609477D4((uint64_t)v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)removeAllDeliveredNotificationsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (uint64_t (*)())_Block_copy(a4);
  uint64_t v6 = sub_260A84BC0();
  unint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v5;
    uint64_t v5 = sub_2609C1298;
  }
  else
  {
    uint64_t v9 = 0;
  }
  unint64_t v10 = self;
  sub_2609BBBF8(v6, v8, (void (*)(void, void))v5, v9);
  sub_2609477D4((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)getBadgeNumberForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  unint64_t v7 = _Block_copy(a5);
  if (a3)
  {
    uint64_t v8 = sub_260A84BC0();
    a3 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v10 = sub_260A84BC0();
  unint64_t v12 = v11;
  _Block_copy(v7);
  unint64_t v13 = self;
  sub_2609BFBB4(v8, (uint64_t)a3, v10, v12, v13, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)getNotificationTopicsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)requestRemoveAuthorizationForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)getClearedInfoForDataProviderMigrationWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_260A84BC0();
  unint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_2609BC5AC(v6, v8, (uint64_t)sub_2609BD0E4, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v11 = self;
  uint64_t v8 = sub_260A83B80();
  unint64_t v10 = v9;

  sub_260A84BC0();
  sub_2609BCE14();
  swift_bridgeObjectRelease();
  sub_26094524C(v8, v10);
}

@end