@interface ShareMenuItemManager
- (void)didBecomeKeyWindowScene:(id)a3;
@end

@implementation ShareMenuItemManager

- (void)didBecomeKeyWindowScene:(id)a3
{
  uint64_t v3 = sub_20A8C2140();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C2130();
  swift_retain();
  sub_20A5A9B20();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end