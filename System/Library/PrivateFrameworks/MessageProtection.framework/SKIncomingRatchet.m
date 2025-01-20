@interface SKIncomingRatchet
+ (unint64_t)maxForwardRatchetDelta;
- (_TtC17MessageProtection17SKIncomingRatchet)init;
- (_TtC17MessageProtection17SKIncomingRatchet)initWithData:(id)a3 error:(id *)a4;
- (_TtC17MessageProtection17SKIncomingRatchet)initWithKey:(id)a3 index:(unsigned __int16)a4 signingKey:(id)a5 error:(id *)a6;
- (id)openStatusWithIndex:(unint64_t)a3 encryptedMessage:(id)a4 authenticating:(id)a5 signature:(id)a6 error:(id *)a7;
- (id)serializedData;
- (id)signingKeyIdentifier;
@end

@implementation SKIncomingRatchet

+ (unint64_t)maxForwardRatchetDelta
{
  return 50000;
}

- (_TtC17MessageProtection17SKIncomingRatchet)initWithData:(id)a3 error:(id *)a4
{
  return (_TtC17MessageProtection17SKIncomingRatchet *)@objc SKOutgoingRatchet.init(data:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))SKIncomingRatchet.init(data:));
}

- (_TtC17MessageProtection17SKIncomingRatchet)initWithKey:(id)a3 index:(unsigned __int16)a4 signingKey:(id)a5 error:(id *)a6
{
  uint64_t v7 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  return (_TtC17MessageProtection17SKIncomingRatchet *)SKIncomingRatchet.init(key:index:signingKey:)(v10, v12, v7, v13, v15);
}

- (id)openStatusWithIndex:(unint64_t)a3 encryptedMessage:(id)a4 authenticating:(id)a5 signature:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = self;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;

  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v20 = v19;

  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v23 = v22;

  uint64_t v24 = SKIncomingRatchet.openStatus(index:encryptedMessage:authenticating:signature:)(a3, v15, v17, v18, v20, v21, v23);
  unint64_t v26 = v25;

  outlined consume of Data._Representation(v21, v23);
  outlined consume of Data._Representation(v18, (unint64_t)v20);
  outlined consume of Data._Representation(v15, v17);
  v27.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v24, v26);
  return v27.super.isa;
}

- (id)serializedData
{
  return @objc SKOutgoingRatchet.serializedData()(self, (uint64_t)a2, SKIncomingRatchet.serializedData());
}

- (id)signingKeyIdentifier
{
  return @objc SKOutgoingRatchet.serializedData()(self, (uint64_t)a2, SKIncomingRatchet.signingKeyIdentifier());
}

- (_TtC17MessageProtection17SKIncomingRatchet)init
{
  result = (_TtC17MessageProtection17SKIncomingRatchet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of SymmetricRatchet((uint64_t)self + OBJC_IVAR____TtC17MessageProtection17SKIncomingRatchet_ratchet, (uint64_t (*)(void))type metadata accessor for SymmetricRatchet);
  v3 = (char *)self + OBJC_IVAR____TtC17MessageProtection17SKIncomingRatchet_signingPublicKey;
  uint64_t v4 = type metadata accessor for P256.Signing.PublicKey();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end