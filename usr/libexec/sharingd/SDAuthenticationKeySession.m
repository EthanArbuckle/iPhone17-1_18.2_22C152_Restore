@interface SDAuthenticationKeySession
@end

@implementation SDAuthenticationKeySession

- (void).cxx_destruct
{
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary26SDAuthenticationKeySession_lastUnlockDate, (uint64_t *)&unk_100975040);
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16DaemoniOSLibrary26SDAuthenticationKeySession_authToken);
  unint64_t v4 = *(void *)&self->super.super.delegate[OBJC_IVAR____TtC16DaemoniOSLibrary26SDAuthenticationKeySession_authToken];

  sub_100250CB0(v3, v4);
}

@end