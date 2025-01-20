@interface Kyber1024ObjCPublicKey
- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)init;
- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)initWithPublicKeyBytes:(id)a3 error:(id *)a4;
- (id)dataRepresentation;
@end

@implementation Kyber1024ObjCPublicKey

- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)initWithPublicKeyBytes:(id)a3 error:(id *)a4
{
  return (_TtC17MessageProtection22Kyber1024ObjCPublicKey *)Kyber1024ObjCPublicKey.init(publicKeyBytes:)(a3);
}

- (id)dataRepresentation
{
  uint64_t v3 = type metadata accessor for Kyber1024.PublicKey();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, (char *)self + OBJC_IVAR____TtC17MessageProtection22Kyber1024ObjCPublicKey_pubKey, v3);
  v7 = self;
  uint64_t v8 = Kyber1024.PublicKey.dataRepresentation.getter();
  unint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v8, v10);

  return v11.super.isa;
}

- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)init
{
  result = (_TtC17MessageProtection22Kyber1024ObjCPublicKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC17MessageProtection22Kyber1024ObjCPublicKey_pubKey;
  uint64_t v3 = type metadata accessor for Kyber1024.PublicKey();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end