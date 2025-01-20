@interface STLSHandshaker
- (BOOL)getEarlyDataAccepted;
- (BOOL)hasSessionState;
- (_TtC10nwswifttls14STLSHandshaker)init;
- (id)continueHandshake:(id)a3;
- (id)getClientRandom;
- (id)getEncryptionSecretWithWrite:(BOOL)a3;
- (id)getPeerQUICTransportParameters;
- (id)getSessionState;
- (id)init:(id)a3 serverName:(id)a4 quicTransportParameters:(id)a5 alpn:(id)a6 sessionState:(id)a7 ticketRequest:(id)a8 useX25519KeyExchange:(BOOL)a9;
- (id)startHandshake;
- (id)validateAuthenticatorWithAuthenticator:(id)a3 context:(id)a4 keyParser:(id)a5;
- (int)getErrorCode;
- (int64_t)getEncryptionLevel;
- (int64_t)getNegotiatedCiphersuite;
- (int64_t)isImplemented;
@end

@implementation STLSHandshaker

- (int64_t)isImplemented
{
  return 1;
}

- (id)init:(id)a3 serverName:(id)a4 quicTransportParameters:(id)a5 alpn:(id)a6 sessionState:(id)a7 ticketRequest:(id)a8 useX25519KeyExchange:(BOOL)a9
{
  if (a8) {
    v14 = (unsigned __int16 *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    v14 = 0;
  }
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  return STLSHandshaker.init(_:serverName:quicTransportParameters:alpn:sessionState:ticketRequest:useX25519KeyExchange:)(a3, a4, a5, a6, a7, v14, a9);
}

- (id)startHandshake
{
  v2 = self;
  v3 = (void *)STLSHandshaker.startHandshake()();

  return v3;
}

- (id)continueHandshake:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)STLSHandshaker.continueHandshake(_:)((NSData)v4);

  return v6;
}

- (int)getErrorCode
{
  v2 = self;
  Swift::Int32 v3 = STLSHandshaker.getErrorCode()();

  return v3;
}

- (int64_t)getEncryptionLevel
{
  v2 = self;
  Swift::Int v3 = STLSHandshaker.getEncryptionLevel()();

  return v3;
}

- (id)getClientRandom
{
  v2 = self;
  Swift::Int v3 = (void *)STLSHandshaker.getClientRandom()();

  return v3;
}

- (id)getEncryptionSecretWithWrite:(BOOL)a3
{
  id v4 = self;
  v5 = (void *)STLSHandshaker.getEncryptionSecret(write:)(a3);

  return v5;
}

- (id)getPeerQUICTransportParameters
{
  v2 = self;
  Swift::Int v3 = (void *)STLSHandshaker.getPeerQUICTransportParameters()();

  return v3;
}

- (int64_t)getNegotiatedCiphersuite
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HandshakeStateMachine?);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_stateMachine;
  swift_beginAccess();
  outlined init with copy of PartialHandshakeResult.NewEncryptionLevel?((uint64_t)v6, (uint64_t)v5, &demangling cache variable for type metadata for HandshakeStateMachine?);
  uint64_t v7 = type metadata accessor for HandshakeStateMachine();
  int64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    v9 = self;
    int v10 = HandshakeStateMachine.negotiatedCiphersuite.getter();
    outlined destroy of PartialHandshakeResult((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HandshakeStateMachine);

    if ((v10 & 0x10000) != 0) {
      return 0;
    }
    else {
      return (unsigned __int16)v10;
    }
  }
  return result;
}

- (BOOL)hasSessionState
{
  v2 = (char *)self + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_receivedSessionTickets;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16) != 0;
}

- (id)getSessionState
{
  v2 = self;
  uint64_t v3 = (void *)STLSHandshaker.getSessionState()();

  return v3;
}

- (BOOL)getEarlyDataAccepted
{
  uint64_t v3 = type metadata accessor for HandshakeStateMachine();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_stateMachine;
  swift_beginAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v7, 1, v3)) {
    return 0;
  }
  outlined init with copy of PartialHandshakeResult((uint64_t)v7, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HandshakeStateMachine);
  v9 = self;
  char v10 = HandshakeStateMachine.earlyDataAccepted.getter();
  outlined destroy of PartialHandshakeResult((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HandshakeStateMachine);

  return v10 & 1;
}

- (id)validateAuthenticatorWithAuthenticator:(id)a3 context:(id)a4 keyParser:(id)a5
{
  v8 = _Block_copy(a5);
  id v9 = a3;
  char v10 = self;
  id v11 = a4;
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  if (v11)
  {
    uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v18 = 0xF000000000000000;
  }
  MEMORY[0x1F4188790](v15);
  v21[2] = v8;
  specialized STLSHandshaker.validateAuthenticator(authenticator:context:keyParser:)(v12, v14, (uint64_t (*)(void))partial apply for thunk for @callee_unowned @convention(block) (@unowned NSData) -> (@autoreleased NSData?), (uint64_t)v21);
  _Block_release(v8);
  outlined consume of ByteBuffer?(v16, v18);
  outlined consume of Data._Representation(v12, v14);

  v19.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v19.super.isa;
}

- (_TtC10nwswifttls14STLSHandshaker)init
{
  int64_t result = (_TtC10nwswifttls14STLSHandshaker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of HandshakeStateMachine?((uint64_t)self + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_stateMachine, &demangling cache variable for type metadata for HandshakeStateMachine?);
  outlined destroy of HandshakeStateMachine?((uint64_t)self + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_partialHandshakeResult, &demangling cache variable for type metadata for PartialHandshakeResult?);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_latestError);
}

@end