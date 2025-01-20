@interface SessionAudioPlayerPresenter
- (void)handleRouteChanged:(id)a3;
@end

@implementation SessionAudioPlayerPresenter

- (void)handleRouteChanged:(id)a3
{
  uint64_t v3 = sub_23A7F5F48();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F5F18();
  swift_retain();
  sub_23A629FC8((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end