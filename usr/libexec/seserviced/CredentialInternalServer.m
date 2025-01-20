@interface CredentialInternalServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC10seserviced24CredentialInternalServer)init;
- (_TtC10seserviced24CredentialInternalServer)initWithMachServiceName:(id)a3;
- (void)deleteApplicationWithIdentifier:(id)a3 reply:(id)a4;
- (void)deleteCredentialWithUuid:(id)a3 reply:(id)a4;
- (void)listCredentialsInternalWithReply:(id)a3;
@end

@implementation CredentialInternalServer

- (_TtC10seserviced24CredentialInternalServer)initWithMachServiceName:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Logger.init(subsystem:category:)();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(CredentialInternalServer *)&v8 initWithMachServiceName:v5];

  [(CredentialInternalServer *)v6 setDelegate:v6];
  return v6;
}

- (_TtC10seserviced24CredentialInternalServer)init
{
  NSString v3 = String._bridgeToObjectiveC()();
  v4 = [(CredentialInternalServer *)self initWithMachServiceName:v3];

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  char v9 = sub_10010E5C0(v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC10seserviced24CredentialInternalServer_logger;
  uint64_t v3 = type metadata accessor for Logger();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (void)listCredentialsInternalWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  NSString v5 = self;
  sub_100290DC0((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)deleteCredentialWithUuid:(id)a3 reply:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  v12 = self;
  sub_100291184((uint64_t)v10, (uint64_t)v12, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)deleteApplicationWithIdentifier:(id)a3 reply:(id)a4
{
  NSString v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_100291624(v6, v8, (uint64_t)v9, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

@end