@interface ReadingHistoryAppFileSyncManager
- (uint64_t)applicationWillEnterForeground:;
@end

@implementation ReadingHistoryAppFileSyncManager

- (uint64_t)applicationWillEnterForeground:
{
  uint64_t v0 = sub_1F10E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1F10A0();
  swift_retain();
  sub_1F1A90();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end