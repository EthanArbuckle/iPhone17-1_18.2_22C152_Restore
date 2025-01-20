@interface CloudKitKVSManager
- (BOOL)removeCertificateSettingsWithEmailAddress:(id)a3 certTypeKey:(id)a4 error:(id *)a5;
- (BOOL)updateCertificateSettingsWithEmailAddress:(id)a3 identityPersistentRefs:(id)a4 error:(id *)a5;
- (CloudKitKVSManager)init;
- (CloudKitKVSManager)initWithStoreIdentifier:(id)a3 cloudAccountManager:(id)a4;
- (id)fetchCertificatesSettingsWithEmailAddress:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)fetchSigningAndEncrytionMessagesStatusFor:(id)a3 completion:(id)a4;
- (void)fetchSigningAndEncrytionStatusFor:(id)a3 completion:(id)a4;
- (void)handleStoreDidChangeExternally:(id)a3;
- (void)setDigitallySignMessageIsEnabledTo:(BOOL)a3 for:(id)a4 completion:(id)a5;
- (void)setEncryptMessagesIsEnabledTo:(BOOL)a3 for:(id)a4 completion:(id)a5;
- (void)setSigningAndEncrytionStatusTo:(BOOL)a3 for:(id)a4 completion:(id)a5;
@end

@implementation CloudKitKVSManager

- (CloudKitKVSManager)initWithStoreIdentifier:(id)a3 cloudAccountManager:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  swift_unknownObjectRetain();
  return (CloudKitKVSManager *)sub_10000E07C(v5, v7, (uint64_t)a4);
}

- (void)fetchSigningAndEncrytionStatusFor:(id)a3 completion:(id)a4
{
}

- (void)setSigningAndEncrytionStatusTo:(BOOL)a3 for:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_100010284(a3, v8, v10, (uint64_t)v11, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)fetchSigningAndEncrytionMessagesStatusFor:(id)a3 completion:(id)a4
{
}

- (void)setDigitallySignMessageIsEnabledTo:(BOOL)a3 for:(id)a4 completion:(id)a5
{
}

- (void)setEncryptMessagesIsEnabledTo:(BOOL)a3 for:(id)a4 completion:(id)a5
{
}

- (id)fetchCertificatesSettingsWithEmailAddress:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;
  uint64_t v8 = self;
  sub_10000EA30(v5, v7);
  swift_bridgeObjectRelease();

  v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (BOOL)updateCertificateSettingsWithEmailAddress:(id)a3 identityPersistentRefs:(id)a4 error:(id *)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = self;
  sub_10000F0CC(v6, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)removeCertificateSettingsWithEmailAddress:(id)a3 certTypeKey:(id)a4 error:(id *)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v12 = self;
  sub_10000F6C0(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (void)handleStoreDidChangeExternally:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100010FB0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)dealloc
{
  uint64_t v3 = self;
  uint64_t v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4 name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:*(Class *)((char *)&v4->super.isa + OBJC_IVAR___CloudKitKVSManager_keyValueStore)];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CloudKitKVSManager();
  [(CloudKitKVSManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (CloudKitKVSManager)init
{
  result = (CloudKitKVSManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end