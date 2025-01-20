@interface MRDCryptoUtils
+ (id)signature:(id)a3 isValidFor:(id)a4 withPublicKey:(id)a5 error:(id *)a6;
+ (id)signatureForData:(id)a3 withPrivateKey:(id)a4 error:(id *)a5;
+ (void)generateCurve25519SigningKeyPairWithPrivateKeyData:(id *)a3 publicKeyData:(id *)a4;
- (MRDCryptoUtils)init;
@end

@implementation MRDCryptoUtils

+ (void)generateCurve25519SigningKeyPairWithPrivateKeyData:(id *)a3 publicKeyData:(id *)a4
{
}

+ (id)signatureForData:(id)a3 withPrivateKey:(id)a4 error:(id *)a5
{
  uint64_t v7 = type metadata accessor for Curve25519.Signing.PrivateKey();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  uint64_t v26 = v16;
  unint64_t v27 = v18;
  sub_10018FE44(v16, v18);
  Curve25519.Signing.PrivateKey.init<A>(rawRepresentation:)();
  uint64_t v26 = v13;
  unint64_t v27 = v15;
  sub_1001A7548();
  uint64_t v19 = Curve25519.Signing.PrivateKey.signature<A>(for:)();
  unint64_t v21 = v20;
  uint64_t v22 = v19;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_10018FE9C(v16, v18);
  sub_10018FE9C(v13, v15);
  v23.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10018FE9C(v22, v21);

  return v23.super.isa;
}

+ (id)signature:(id)a3 isValidFor:(id)a4 withPublicKey:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  unint64_t v14 = (objc_class *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  uint64_t v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;

  Class v20 = sub_1001A759C(v11, v13, v14, v16, v17, v19);
  sub_10018FE9C(v17, v19);
  sub_10018FE9C((uint64_t)v14, v16);
  sub_10018FE9C(v11, v13);

  return v20;
}

- (MRDCryptoUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CryptoUtils();
  return [(MRDCryptoUtils *)&v3 init];
}

@end