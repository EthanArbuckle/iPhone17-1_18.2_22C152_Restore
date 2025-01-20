@interface SDAuthenticationAuthSession
@end

@implementation SDAuthenticationAuthSession

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationAuthSession_wifiRequest));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationAuthSession_AWDLInfo);
  unint64_t v4 = *(void *)&self->super.delegate[OBJC_IVAR____TtC16DaemoniOSLibrary27SDAuthenticationAuthSession_AWDLInfo];

  sub_100250CC4(v3, v4);
}

@end