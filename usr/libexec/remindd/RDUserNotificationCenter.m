@interface RDUserNotificationCenter
- (_TtC7remindd24RDUserNotificationCenter)init;
- (_TtC7remindd24RDUserNotificationCenter)initWithQueue:(id)a3 notificationCenter:(id)a4;
- (id)calDAVSharedListNotificationContentWithList:(id)a3;
- (void)releaseNotificationWithIdentifier:(id)a3 reference:(id)a4 completion:(id)a5;
- (void)retainNotificationWithIdentifier:(id)a3 reference:(id)a4 content:(id)a5 skipBanner:(BOOL)a6 completion:(id)a7;
- (void)showNotificationWithIdentifier:(id)a3 content:(id)a4 completion:(id)a5;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation RDUserNotificationCenter

- (_TtC7remindd24RDUserNotificationCenter)initWithQueue:(id)a3 notificationCenter:(id)a4
{
  *(void *)&self->queue[OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_reminderAlarmDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&self->queue[OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_todayNotificationDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&self->queue[OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_beforeFirstUnlockReminderDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&self->queue[OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_assignmentNotificationDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&self->queue[OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_sharedListUpdateNotificationDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_queue) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_notificationCenter) = (Class)a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RDUserNotificationCenter();
  id v7 = a3;
  id v8 = a4;
  return [(RDUserNotificationCenter *)&v10 init];
}

- (_TtC7remindd24RDUserNotificationCenter)init
{
  result = (_TtC7remindd24RDUserNotificationCenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000F3DB4((uint64_t)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_reminderAlarmDelegate);
  sub_1000F3DB4((uint64_t)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_todayNotificationDelegate);
  sub_1000F3DB4((uint64_t)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_beforeFirstUnlockReminderDelegate);
  sub_1000F3DB4((uint64_t)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_assignmentNotificationDelegate);
  sub_1000F3DB4((uint64_t)self + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_sharedListUpdateNotificationDelegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd24RDUserNotificationCenter_notificationCenter);
}

- (void)retainNotificationWithIdentifier:(id)a3 reference:(id)a4 content:(id)a5 skipBanner:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  objc_super v10 = (uint64_t (*)())_Block_copy(a7);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  if (v10)
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v10;
    objc_super v10 = sub_10011FBC8;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = a5;
  v19 = self;
  sub_10050FAC0(v11, v13, v14, v16, v18, v7, (uint64_t)v10, v17);
  sub_100096314((uint64_t)v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)releaseNotificationWithIdentifier:(id)a3 reference:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v6)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v6;
    v6 = sub_10011C2EC;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = self;
  RDUserNotificationCenter.releaseNotification(identifier:reference:completion:)(v7, v9, v10, v12, (uint64_t)v6, v13);
  sub_100096314((uint64_t)v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  uint64_t v9 = qword_100907768;
  id v10 = a3;
  id v11 = a4;
  uint64_t v16 = self;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_10008E2DC(v12, (uint64_t)qword_10091C220);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "userNotificationCenter willPresent", v15, 2u);
    swift_slowDealloc();
  }

  (*((void (**)(void *, uint64_t))v8 + 2))(v8, 27);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_100515E54(v10, (char *)v11, (void (**)(void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  uint64_t v6 = qword_100907768;
  id v7 = a3;
  id v13 = a4;
  uint64_t v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_10008E2DC(v9, (uint64_t)qword_10091C220);
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "userNotificationCenter openSettingsForNotification, but we don't have any settings pane yet so bye ;)",
      v12,
      2u);
    swift_slowDealloc();
  }
}

- (void)showNotificationWithIdentifier:(id)a3 content:(id)a4 completion:(id)a5
{
  uint64_t v8 = (void (*)(uint64_t))_Block_copy(a5);
  uint64_t v9 = v8;
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v11;
    if (v9)
    {
LABEL_3:
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v9;
      uint64_t v9 = sub_10011C2EC;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (v8) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  swift_unknownObjectRetain();
  id v13 = self;
  RDUserNotificationCenter.showNotification(withIdentifier:content:completion:)(v10, (unint64_t)a3, (uint64_t)a4, (uint64_t)v9, v12);
  sub_100096314((uint64_t)v9);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)calDAVSharedListNotificationContentWithList:(id)a3
{
  uint64_t v5 = type metadata accessor for RDUserNotificationType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v9 = a3;
  uint64_t v10 = self;
  *uint64_t v8 = [v9 objectID];
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for RDUserNotificationType.caldavSharedList(_:), v5);
  id v11 = sub_10026D9CC(0, v9, 0);
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

@end