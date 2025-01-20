@interface CryptoKitWrapper
+ (id)convertPrivateKeyToPEMWithX963PrivateKey:(id)a3 error:(id *)a4;
+ (id)convertPrivateKeyTox963WithPemPrivateKey:(id)a3 error:(id *)a4;
+ (id)unwrapEncryptionKeyWithWrappedKey:(id)a3 encapsulatedKey:(id)a4 privateKey:(id)a5 error:(id *)a6;
+ (id)wrappedDataDictionaryWithCertWithPlainText:(id)a3 certificate:(__SecCertificate *)a4 error:(id *)a5;
- (_TtC16FetchRestoreKeys16CryptoKitWrapper)init;
@end

@implementation CryptoKitWrapper

+ (id)convertPrivateKeyToPEMWithX963PrivateKey:(id)a3 error:(id *)a4
{
  return sub_10001D1A0((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_10001D7A0);
}

+ (id)convertPrivateKeyTox963WithPemPrivateKey:(id)a3 error:(id *)a4
{
  return sub_10001D1A0((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_10001DAC8);
}

+ (id)unwrapEncryptionKeyWithWrappedKey:(id)a3 encapsulatedKey:(id)a4 privateKey:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  v17 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;

  id v20 = sub_10001DD94(v11, v13, v14, v16, v17, v19);
  unint64_t v22 = v21;
  sub_10001EFEC((uint64_t)v17, v19);
  sub_10001EFEC(v14, v16);
  sub_10001EFEC((uint64_t)v11, v13);
  v23.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10001EFEC((uint64_t)v20, v22);

  return v23.super.isa;
}

+ (id)wrappedDataDictionaryWithCertWithPlainText:(id)a3 certificate:(__SecCertificate *)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = a4;
  id v8 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  sub_10001E3B0(v8, v10, v7);
  sub_10001EFEC((uint64_t)v8, v10);
  v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v11.super.isa;
}

- (_TtC16FetchRestoreKeys16CryptoKitWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return [(CryptoKitWrapper *)&v3 init];
}

@end