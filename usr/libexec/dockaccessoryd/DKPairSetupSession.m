@interface DKPairSetupSession
- (BOOL)isSecureSession;
- (_TtC14dockaccessoryd18DKPairSetupSession)init;
- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)getCertificate;
- (void)generateSessionKeys;
- (void)receivedSetupExchangeData:(id)a3 error:(id)a4;
- (void)start;
- (void)stop;
- (void)stopWithError:(id)a3;
@end

@implementation DKPairSetupSession

- (void)start
{
  v2 = self;
  sub_1000AB3E4();
}

- (void)stop
{
  v2 = self;
  sub_1000AB8E0(0);
}

- (void)stopWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_1000AB8E0((uint64_t)a3);
}

- (void)receivedSetupExchangeData:(id)a3 error:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    id v8 = a3;
    uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a4;
    v13 = self;
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  sub_1000B8D98(v9, v11);

  sub_1000A9990(v9, v11);
}

- (void)generateSessionKeys
{
  v2 = self;
  sub_1000B368C();
}

- (BOOL)isSecureSession
{
  v2 = self;
  OS_dispatch_queue.sync<A>(execute:)();

  return v4;
}

- (id)getCertificate
{
  v2.super.isa = Data._bridgeToObjectiveC()().super.isa;

  return v2.super.isa;
}

- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  return sub_1000B5848(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t))sub_1000B44A8);
}

- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  return sub_1000B5848(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t))sub_1000B4B04);
}

- (_TtC14dockaccessoryd18DKPairSetupSession)init
{
  result = (_TtC14dockaccessoryd18DKPairSetupSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000B9E4C((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_delegate);

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000A9990(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_readKey), *(void *)&self->role[OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_readKey]);
  sub_1000A9990(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_writeKey), *(void *)&self->role[OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_writeKey]);
  sub_1000A9990(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_sessionKey), *(void *)&self->role[OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_sessionKey]);
  sub_1000A61E4((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_sharedSecret, &qword_1002A8568);
  sub_1000A61E4((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_prover, (uint64_t *)&unk_1002A8590);
  sub_1000A6240(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_readNonce), *(void *)&self->role[OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_readNonce]);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_writeNonce);
  unint64_t v6 = *(void *)&self->role[OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_writeNonce];

  sub_1000A6240(v5, v6);
}

@end