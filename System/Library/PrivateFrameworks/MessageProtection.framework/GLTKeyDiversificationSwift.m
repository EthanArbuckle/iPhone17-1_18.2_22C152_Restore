@interface GLTKeyDiversificationSwift
+ (__SecKey)diversifyWithPrivateKey:(__SecKey *)a3 docId:(id)a4 trackingPreventionSalt:(id)a5 error:(id *)a6;
+ (id)diversifyWithPublicKey:(__SecKey *)a3 trackingPreventionSalt:(id)a4 docId:(id)a5 error:(id *)a6;
- (_TtC17MessageProtection26GLTKeyDiversificationSwift)init;
@end

@implementation GLTKeyDiversificationSwift

+ (id)diversifyWithPublicKey:(__SecKey *)a3 trackingPreventionSalt:(id)a4 docId:(id)a5 error:(id *)a6
{
  v7 = a4;
  if (a4)
  {
    v9 = a3;
    id v10 = a5;
    id v11 = v7;
    v7 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;
  }
  else
  {
    v14 = a3;
    id v15 = a5;
    unint64_t v13 = 0xF000000000000000;
  }
  unint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  CFDataRef v18 = v17;

  specialized static GLTKeyDiversificationSwift.diversify(publicKey:trackingPreventionSalt:docId:)(a3, (uint64_t)v7, v13, v16, v18);
  v20 = v19;
  swift_bridgeObjectRelease();

  outlined consume of Data?((uint64_t)v7, v13);
  return v20;
}

+ (__SecKey)diversifyWithPrivateKey:(__SecKey *)a3 docId:(id)a4 trackingPreventionSalt:(id)a5 error:(id *)a6
{
  unint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = v9;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  CFDataRef v15 = v14;

  SecKeyRef v16 = specialized static GLTKeyDiversificationSwift.diversify(privateKey:docId:trackingPreventionSalt:)(v11, v8, v10, v13, v15);
  outlined consume of Data._Representation(v13, (unint64_t)v15);
  swift_bridgeObjectRelease();
  return v16;
}

- (_TtC17MessageProtection26GLTKeyDiversificationSwift)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GLTKeyDiversificationSwift();
  return [(GLTKeyDiversificationSwift *)&v3 init];
}

@end