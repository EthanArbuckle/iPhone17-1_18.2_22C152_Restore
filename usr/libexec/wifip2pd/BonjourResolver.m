@interface BonjourResolver
- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver)init;
- (void)datapathConfirmedForPeerDataAddress:(id)a3 serviceSpecificInfo:(id)a4;
- (void)datapathFailedToStartWithError:(int64_t)a3;
- (void)datapathPairingRequestStartedWithPairingMethod:(int64_t)a3 pairingAuthenticationInputCompletionHandler:(id)a4;
- (void)datapathTerminatedWithReason:(int64_t)a3;
- (void)datapathUpdatedServiceSpecificInfo:(id)a3;
@end

@implementation BonjourResolver

- (void)datapathFailedToStartWithError:(int64_t)a3
{
  v3 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler);
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler);
  v5 = self;
  if (v4)
  {
    uint64_t v6 = sub_100037FF4((uint64_t)v4);
    v4(v6);
    sub_100011E30((uint64_t)v4);
    uint64_t v7 = *v3;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t *v3 = 0;
  v3[1] = 0;
  sub_100011E30(v7);
}

- (void)datapathConfirmedForPeerDataAddress:(id)a3 serviceSpecificInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10002F7D4((uint64_t)v6, a4);
}

- (void)datapathUpdatedServiceSpecificInfo:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10003005C((uint64_t)a3);
}

- (void)datapathPairingRequestStartedWithPairingMethod:(int64_t)a3 pairingAuthenticationInputCompletionHandler:(id)a4
{
  v4 = _Block_copy(a4);

  _Block_release(v4);
}

- (void)datapathTerminatedWithReason:(int64_t)a3
{
  v3 = self;
  sub_100037548();
}

- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver)init
{
  result = (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000380B4((uint64_t)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_srv, &qword_10047CC00);
  sub_10003719C(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa), *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa], *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 8]);
  swift_unknownObjectRelease();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler);

  sub_100011E30(v5);
}

@end