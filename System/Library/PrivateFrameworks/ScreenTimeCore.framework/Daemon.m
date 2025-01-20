@interface Daemon
+ (STReactor)reactor;
+ (void)setReactor:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC15ScreenTimeAgent6Daemon)init;
- (id)operationToResolveAsset:(id)a3;
- (id)operationToSendEvents:(id)a3;
- (id)operationToSendStatusUpdate:(id)a3;
- (void)configurationSourceDidFailToRegister:(id)a3 withError:(id)a4;
- (void)containerEventChanged:(id)a3;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)start;
- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5;
@end

@implementation Daemon

+ (STReactor)reactor
{
  return (STReactor *)(id)qword_10034B378;
}

+ (void)setReactor:(id)a3
{
  id v4 = (id)qword_10034B378;
  qword_10034B378 = (uint64_t)a3;
  id v3 = a3;
}

- (void)dealloc
{
  v2 = self;
  sub_100214AD0();
}

- (void).cxx_destruct
{
  sub_1000A4F28((uint64_t)self + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon_factory);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___persistenceController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___notificationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___screenTimeOrganizationController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___askForTimeListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___askForTimeListenerDelegate));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___askForTimeResponseHandler));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___commandLineToolListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___commandLineToolListenerDelegate));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___publicAgentListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___privateAgentListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___contactsAgentListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___agentListenerDelegate));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___coreAnalyticsManager));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___bootstrapperQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___xpcServiceProvider));
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___askAlternateListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___communicationListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___contactsListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___diagnosticsListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___downtimeListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___privateListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___settingsListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___setupListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___publicListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___cleanupActivityScheduler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___appCollectionActivityScheduler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___analyticsActivityScheduler));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15ScreenTimeAgent6Daemon____lazy_storage___configurationSourceClient);
}

- (void)start
{
  v2 = self;
  sub_10021560C();
}

- (_TtC15ScreenTimeAgent6Daemon)init
{
  result = (_TtC15ScreenTimeAgent6Daemon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100227904(v7);

  return v9 & 1;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  if (a5)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    v15 = 0;
  }
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  v20 = self;
  sub_100229120(a3, a4, v13, v15, a6, (uint64_t)a7);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  if (!a5)
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    memset(v19, 0, sizeof(v19));
    id v16 = a3;
    id v17 = a4;
    id v18 = self;
    goto LABEL_6;
  }
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  id v13 = a3;
  id v14 = a4;
  swift_unknownObjectRetain();
  v15 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
LABEL_6:
  sub_100229444(v10, v12);

  swift_bridgeObjectRelease();
  sub_1000A4FD8((uint64_t)v19, &qword_100341CD8);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v13 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v13 - 8);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a5)
  {
    id v27 = a3;
    id v28 = a4;
    id v29 = a6;
    id v30 = a7;
    v31 = self;
    unint64_t v23 = 0xF000000000000000;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v24 = 0;
    uint64_t v26 = 0;
    goto LABEL_6;
  }
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  v20 = self;
  id v21 = a5;
  a5 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v23 = v22;

  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v26 = v25;

LABEL_6:
  uint64_t v32 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v15, 1, 1, v32);
  v33 = (void *)swift_allocObject();
  v33[2] = 0;
  v33[3] = 0;
  v33[4] = self;
  v33[5] = a3;
  v33[6] = a4;
  v33[7] = a5;
  v33[8] = v23;
  v33[9] = v24;
  v33[10] = v26;
  v33[11] = a7;
  id v34 = a3;
  id v35 = a4;
  id v36 = a7;
  v37 = self;
  sub_1000FD884((uint64_t)a5, v23);
  swift_bridgeObjectRetain();
  sub_100213D2C((uint64_t)v15, (uint64_t)&unk_100346110, (uint64_t)v33);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1000FD918((uint64_t)a5, v23);
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v13 = sub_10009EE78(&qword_1003460E0);
  __chkstk_darwin(v13 - 8);
  v15 = (uint64_t *)((char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v16 = type metadata accessor for URL();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 0, 1, v16);
  }
  else
  {
    uint64_t v17 = type metadata accessor for URL();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  }
  if (a6)
  {
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v19;
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v20 = a3;
  id v21 = a4;
  id v22 = a7;
  unint64_t v23 = self;
  sub_10021F380((uint64_t)a3, (uint64_t)a4, v15, v18, (uint64_t)a6, (uint64_t)a7);

  swift_bridgeObjectRelease();
  sub_1000A4FD8((uint64_t)v15, &qword_1003460E0);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (a4) {
    static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  id v7 = self;
  sub_100229664(a3);

  swift_bridgeObjectRelease();
}

- (void)containerEventChanged:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1002225D4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)configurationSourceDidFailToRegister:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_10022988C((uint64_t)v8);
}

- (id)operationToSendStatusUpdate:(id)a3
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  id v5 = sub_100224BEC();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)operationToSendEvents:(id)a3
{
  id v3 = self;
  id v4 = sub_100229AC0();

  return v4;
}

- (id)operationToResolveAsset:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_100229C74();

  return v6;
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100346050;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1003464F0;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  id v19 = self;
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_100346060, (uint64_t)v16);
  swift_release();
}

@end