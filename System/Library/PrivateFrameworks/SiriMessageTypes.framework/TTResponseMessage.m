@interface TTResponseMessage
- (NSString)description;
@end

@implementation TTResponseMessage

- (NSString)description
{
  v2 = self;
  sub_25D0A9550();

  v3 = (void *)sub_25D0BD2D0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_25D0A8AF4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse), *(void *)&self->super.super.super.super._anon_0[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse], *(void **)&self->super.super.super.super.postedOnTheBus[OBJC_IVAR____TtC16SiriMessageTypes17TTResponseMessage_tcuMappedNLResponse]);
  swift_bridgeObjectRelease();
}

@end