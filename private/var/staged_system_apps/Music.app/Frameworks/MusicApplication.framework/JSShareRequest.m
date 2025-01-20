@interface JSShareRequest
@end

@implementation JSShareRequest

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11MusicJSCore14JSShareRequest_pendingResponseHandler);

  sub_1A528(v3);
}

@end