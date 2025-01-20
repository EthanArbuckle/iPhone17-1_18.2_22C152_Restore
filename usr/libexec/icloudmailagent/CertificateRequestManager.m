@interface CertificateRequestManager
- (BOOL)generatePayloadAndRevokeFor:(__SecCertificate *)a3 signingIdentity:(__SecIdentity *)a4 endpoint:(id)a5 error:(id *)a6 errCompletion:(id)a7;
- (BOOL)revokeResultFromServerFor:(id)a3 endpoint:(id)a4 error:(id *)a5 completion:(id)a6;
- (CertificateRequestManager)init;
- (__SecCertificate)certificateFor:(id)a3 error:(id *)a4;
- (id)generateCertificateRequestStringWith:(id)a3 subjectAltName:(id)a4 privateKey:(__SecKey *)a5 encrypt:(BOOL)a6;
- (id)resultFromServerFor:(id)a3 endpoint:(id)a4 email:(id)a5 error:(id *)a6;
@end

@implementation CertificateRequestManager

- (id)resultFromServerFor:(id)a3 endpoint:(id)a4 email:(id)a5 error:(id *)a6
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (void (*)(char *, uint64_t))((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  v17 = self;
  sub_100027754(v11, v13, v10, v14, v16);
  (*(void (**)(void, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v18.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v18.super.isa;
}

- (id)generateCertificateRequestStringWith:(id)a3 subjectAltName:(id)a4 privateKey:(__SecKey *)a5 encrypt:(BOOL)a6
{
  sub_100008E28(&qword_1000641E8);
  int v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = a5;
  uint64_t v12 = self;
  sub_100028624(v9, v10, v11, a6);
  uint64_t v14 = v13;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v15 = 0;
  }

  return v15;
}

- (__SecCertificate)certificateFor:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  SecCertificateRef v9 = sub_100028854(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (BOOL)generatePayloadAndRevokeFor:(__SecCertificate *)a3 signingIdentity:(__SecIdentity *)a4 endpoint:(id)a5 error:(id *)a6 errCompletion:(id)a7
{
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v15 = _Block_copy(a7);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v15);
  uint64_t v16 = a3;
  v17 = a4;
  NSArray v18 = self;
  sub_100029550(v16, v17, (uint64_t)v14, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);

  _Block_release(v15);
  return 1;
}

- (BOOL)revokeResultFromServerFor:(id)a3 endpoint:(id)a4 error:(id *)a5 completion:(id)a6
{
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  id v15 = a3;
  id v16 = a4;
  v17 = self;
  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v20 = v19;

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v14);
  sub_10002A058(v18, v20, (uint64_t)v13, (void (**)(const void *, void *))v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

  _Block_release(v14);
  sub_100008F8C(v18, v20);
  return 1;
}

- (CertificateRequestManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CertificateRequestManager();
  return [(CertificateRequestManager *)&v3 init];
}

@end