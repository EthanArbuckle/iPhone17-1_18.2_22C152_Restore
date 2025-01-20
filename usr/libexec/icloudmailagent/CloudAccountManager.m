@interface CloudAccountManager
- (BOOL)removeCertificateDefaultsWithEmailAddress:(id)a3 certTypeKey:(id)a4 error:(id *)a5;
- (BOOL)setFlagsToAccountWithEmailAddress:(id)a3 keys:(id)a4 value:(BOOL)a5 error:(id *)a6;
- (BOOL)updateCertificateDefaultsWithEmailAddress:(id)a3 identityPersistentRefs:(id)a4 error:(id *)a5;
- (CloudAccountManager)init;
- (id)fetchDefaultCertificatesForAccountWithEmailAddress:(id)a3 error:(id *)a4;
- (id)getAppleAccountWithEmailAddress:(id)a3 error:(id *)a4;
@end

@implementation CloudAccountManager

- (BOOL)setFlagsToAccountWithEmailAddress:(id)a3 keys:(id)a4 value:(BOOL)a5 error:(id *)a6
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = self;
  sub_1000425BC(v8, v10, v11, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (id)getAppleAccountWithEmailAddress:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  uint64_t v8 = self;
  id v9 = sub_100042938(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (id)fetchDefaultCertificatesForAccountWithEmailAddress:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  sub_10003F60C(v5, v7);
  swift_bridgeObjectRelease();

  v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (BOOL)updateCertificateDefaultsWithEmailAddress:(id)a3 identityPersistentRefs:(id)a4 error:(id *)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  NSDictionary v9 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = self;
  sub_100040034(v6, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)removeCertificateDefaultsWithEmailAddress:(id)a3 certTypeKey:(id)a4 error:(id *)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v12 = self;
  sub_100040D08(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (CloudAccountManager)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CloudAccountManager_userDefaultsMailAppGroup);
  void *v2 = 0xD000000000000014;
  v2[1] = 0x8000000100053D90;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CloudAccountManager_mailPropertyKey);
  void *v3 = 0xD000000000000023;
  v3[1] = 0x8000000100053DB0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CloudAccountManager();
  return [(CloudAccountManager *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end