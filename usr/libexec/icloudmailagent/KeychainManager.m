@interface KeychainManager
- (BOOL)saveCertificateToKeychain:(__SecCertificate *)a3 error:(id *)a4;
- (KeychainManager)init;
- (__SecIdentity)findSecIdentityForCertId:(id)a3 error:(id *)a4;
- (__SecIdentity)getIdentityByRef:(id)a3 error:(id *)a4;
- (id)find:(const __CFString *)a3 error:(id *)a4;
- (id)getIdentityPersistentRef:(__SecIdentity *)a3 error:(id *)a4;
- (id)saveIdentityToKeychain:(__SecCertificate *)a3 privateKey:(__SecKey *)a4 error:(id *)a5;
- (void)findSecIdentityRefForCertId:(id)a3 completion:(id)a4;
- (void)getCertificateByIdentityRef:(id)a3 completion:(id)a4;
@end

@implementation KeychainManager

- (id)saveIdentityToKeychain:(__SecCertificate *)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  v7 = a3;
  v8 = a4;
  v9 = self;
  uint64_t v10 = sub_10002D5E0();
  unint64_t v12 = v11;

  v13.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100008F8C(v10, v12);

  return v13.super.isa;
}

- (BOOL)saveCertificateToKeychain:(__SecCertificate *)a3 error:(id *)a4
{
  v5 = a3;
  v6 = self;
  sub_10002D898(v5);

  return 1;
}

- (void)getCertificateByIdentityRef:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  unint64_t v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_10002F010(v8, v10, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_100008F8C(v8, v10);
}

- (void)findSecIdentityRefForCertId:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  v6 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  _Block_copy(v5);
  unint64_t v9 = self;
  sub_10002F4AC(v6, v8, (uint64_t)v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (__SecIdentity)findSecIdentityForCertId:(id)a3 error:(id *)a4
{
  v5 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = v6;
  uint64_t v8 = self;
  Class v9 = sub_10002DB34(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (id)getIdentityPersistentRef:(__SecIdentity *)a3 error:(id *)a4
{
  v5 = a3;
  v6 = self;
  sub_10002DE9C(v5);
  uint64_t v8 = v7;
  unint64_t v10 = v9;

  v11.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100008F8C(v8, v10);

  return v11.super.isa;
}

- (__SecIdentity)getIdentityByRef:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  sub_10000A848(v7, v9);
  sub_1000257C8(v7, v9);
  sub_100008F8C(v7, v9);

  sub_100008F8C(v7, v9);
  type metadata accessor for SecIdentity(0);
  unint64_t v10 = (void *)swift_dynamicCastUnknownClassUnconditional();

  return (__SecIdentity *)v10;
}

- (id)find:(const __CFString *)a3 error:(id *)a4
{
  id v5 = (id)a3;
  v6 = self;
  sub_10002E47C(v5);

  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (KeychainManager)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___KeychainManager_keychainAccessGroup);
  void *v2 = 0xD000000000000019;
  v2[1] = 0x80000001000537E0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for KeychainManager();
  return [(KeychainManager *)&v4 init];
}

- (void).cxx_destruct
{
}

@end