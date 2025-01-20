@interface BonjourAdvertiser
- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser)init;
- (void)publishPairingRequestIndicatedBySubscriber:(id)a3 withPairingMethod:(int64_t)a4 pairingAuthenticationGeneratedCompletionHandler:(id)a5;
@end

@implementation BonjourAdvertiser

- (void)publishPairingRequestIndicatedBySubscriber:(id)a3 withPairingMethod:(int64_t)a4 pairingAuthenticationGeneratedCompletionHandler:(id)a5
{
  v5 = _Block_copy(a5);

  _Block_release(v5);
}

- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser)init
{
  result = (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100036154(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_service), *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_service]);
  sub_100036090(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo), *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo], *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo+ 8], *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo+ 16], *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo+ 24], *(void *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo+ 32], *(void *)&self->txtInfo[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_txtInfo+ 6]);
  sub_1000380B4((uint64_t)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB17BonjourAdvertiser_srvInfo, &qword_10047CC00);
}

@end