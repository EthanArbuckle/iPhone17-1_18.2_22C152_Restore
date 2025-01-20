@interface CertificateManager
- (CertificateManager)init;
- (CertificateManager)initWithKeychainManager:(id)a3 certificateRequestManager:(id)a4 cloudKVSManager:(id)a5;
- (void)generateCertificateWith:(id)a3 completion:(id)a4;
- (void)listCertificatesForEmail:(id)a3 completion:(id)a4;
- (void)listCertificatesWithCompletion:(id)a3;
- (void)refreshCertificateWith:(id)a3 certId:(id)a4 completion:(id)a5;
- (void)updateCertificateDefaultsFor:(id)a3 certInfo:(id)a4 completion:(id)a5;
@end

@implementation CertificateManager

- (CertificateManager)initWithKeychainManager:(id)a3 certificateRequestManager:(id)a4 cloudKVSManager:(id)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = (CertificateManager *)sub_10001495C((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v8;
}

- (void)generateCertificateWith:(id)a3 completion:(id)a4
{
}

- (void)listCertificatesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1000184FC((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)listCertificatesForEmail:(id)a3 completion:(id)a4
{
}

- (void)updateCertificateDefaultsFor:(id)a3 certInfo:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v6);
  v11 = self;
  sub_100019630(v7, v9, v10, (uint64_t)v11, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)refreshCertificateWith:(id)a3 certId:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_100019B08(v9, (uint64_t)v10, (char *)v11, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (CertificateManager)init
{
  result = (CertificateManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000A72C((uint64_t)self + OBJC_IVAR___CertificateManager_signingEndpoint, &qword_1000641E0);
  sub_10000A72C((uint64_t)self + OBJC_IVAR___CertificateManager_encryptEndpoint, &qword_1000641E0);
  sub_10000A72C((uint64_t)self + OBJC_IVAR___CertificateManager_revokeEndpoint, &qword_1000641E0);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end