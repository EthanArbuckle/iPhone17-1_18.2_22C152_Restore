@interface Kyber1024ObjCPrivateKey
- (NSData)protobufData;
- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)publicKey;
- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)init;
- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)initWithApKeyBytes:(id)a3 error:(id *)a4;
- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)initWithProtoBufData:(id)a3 error:(id *)a4;
- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)initWithSepKeyBytes:(id)a3 error:(id *)a4;
@end

@implementation Kyber1024ObjCPrivateKey

- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)publicKey
{
  uint64_t v3 = type metadata accessor for Kyber1024.PublicKey();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TetraKEM1024Key(0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of TetraKEM1024Key((uint64_t)self + OBJC_IVAR____TtC17MessageProtection23Kyber1024ObjCPrivateKey_privKey, (uint64_t)v9);
  v10 = self;
  TetraKEM1024Key.publicKey.getter((uint64_t)v6);
  outlined destroy of TetraKEM1024Key((uint64_t)v9);
  v11 = (objc_class *)type metadata accessor for Kyber1024ObjCPublicKey(0);
  id v12 = objc_allocWithZone(v11);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))((uint64_t)v12 + OBJC_IVAR____TtC17MessageProtection22Kyber1024ObjCPublicKey_pubKey, v6, v3);
  v15.receiver = v12;
  v15.super_class = v11;
  v13 = [(Kyber1024ObjCPrivateKey *)&v15 init];
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (_TtC17MessageProtection22Kyber1024ObjCPublicKey *)v13;
}

- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)init
{
  uint64_t v3 = type metadata accessor for TetraKEM1024Key(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  TetraKEM1024Key.init()((uint64_t)v5);
  outlined init with take of SecureEnclave.Kyber1024.PrivateKey((uint64_t)v5, (uint64_t)v6 + OBJC_IVAR____TtC17MessageProtection23Kyber1024ObjCPrivateKey_privKey, type metadata accessor for TetraKEM1024Key);

  uint64_t v7 = (objc_class *)type metadata accessor for Kyber1024ObjCPrivateKey(0);
  v10.receiver = v6;
  v10.super_class = v7;
  return [(Kyber1024ObjCPrivateKey *)&v10 init];
}

- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)initWithSepKeyBytes:(id)a3 error:(id *)a4
{
  return (_TtC17MessageProtection23Kyber1024ObjCPrivateKey *)@objc Kyber1024ObjCPrivateKey.init(sepKeyBytes:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))Kyber1024ObjCPrivateKey.init(sepKeyBytes:));
}

- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)initWithApKeyBytes:(id)a3 error:(id *)a4
{
  return (_TtC17MessageProtection23Kyber1024ObjCPrivateKey *)@objc Kyber1024ObjCPrivateKey.init(sepKeyBytes:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))Kyber1024ObjCPrivateKey.init(apKeyBytes:));
}

- (void).cxx_destruct
{
}

- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)initWithProtoBufData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  return (_TtC17MessageProtection23Kyber1024ObjCPrivateKey *)Kyber1024ObjCPrivateKey.init(protoBufData:)(v5, v7);
}

- (NSData)protobufData
{
  v2 = self;
  uint64_t v3 = Kyber1024ObjCPrivateKey.protobufData.getter();
  unint64_t v5 = v4;

  v6.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v3, v5);
  return (NSData *)v6.super.isa;
}

@end