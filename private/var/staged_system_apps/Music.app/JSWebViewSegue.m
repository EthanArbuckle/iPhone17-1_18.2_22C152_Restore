@interface JSWebViewSegue
@end

@implementation JSWebViewSegue

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore14JSWebViewSegue_url, (uint64_t *)&unk_10109BF50);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11MusicJSCore14JSWebViewSegue_authorizationCodeResponseHandler);

  sub_10006ADFC(v3);
}

@end