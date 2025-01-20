@interface AppleAccountDaemonManager
- (NSString)serviceName;
- (Protocol)exportedProtocol;
- (_TtC13appleaccountd25AppleAccountDaemonManager)init;
- (void)cacheLoginResponse:(AALoginAccountResponse *)a3 forAccount:(ACAccount *)a4 completion:(id)a5;
- (void)configureExportedInterface:(id)a3;
- (void)fetchCachedLoginResponseForAccount:(ACAccount *)a3 completion:(id)a4;
- (void)handleAppleAccountDeleteForAccount:(id)a3 completion:(id)a4;
- (void)urlConfigurationWithCompletion:(id)a3;
@end

@implementation AppleAccountDaemonManager

- (_TtC13appleaccountd25AppleAccountDaemonManager)init
{
  return (_TtC13appleaccountd25AppleAccountDaemonManager *)sub_1001A3980();
}

- (void).cxx_destruct
{
  sub_100008EA8((uint64_t)&self->AAFService_opaque[OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_loginResponseCache]);
  sub_100008EA8((uint64_t)&self->AAFService_opaque[OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_urlConfigurationManager]);
  v3 = &self->AAFService_opaque[OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_storageController];

  sub_100008EA8((uint64_t)v3);
}

- (NSString)serviceName
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (Protocol)exportedProtocol
{
  return (Protocol *)&OBJC_PROTOCOL___AADaemonProtocol;
}

- (void)configureExportedInterface:(id)a3
{
  sub_100009D78();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1002A9C00;
  *(void *)(inited + 32) = sub_10019E768();
  id v6 = a3;
  v7 = self;
  NSXPCInterface.aa_setClasses(_:for:argumentIndex:ofReply:)(inited);
  swift_setDeallocating();
}

- (void)handleAppleAccountDeleteForAccount:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1001A61EC(v7, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)cacheLoginResponse:(AALoginAccountResponse *)a3 forAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100009F04(&qword_100321C90);
  __chkstk_darwin(v9 - 8, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10032A238;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10032A240;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_1001A5AAC((uint64_t)v12, (uint64_t)&unk_10032A248, (uint64_t)v17);
  swift_release();
}

- (void)fetchCachedLoginResponseForAccount:(ACAccount *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100009F04(&qword_100321C90);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10032A200;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100324620;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_1001A5AAC((uint64_t)v10, (uint64_t)&unk_100324628, (uint64_t)v15);
  swift_release();
}

- (void)urlConfigurationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_1001A5680((uint64_t)sub_1001A58D4, v5);

  swift_release();
}

@end