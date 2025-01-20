@interface TTRIFontCache
- (uint64_t)contentSizeChanged:;
@end

@implementation TTRIFontCache

- (uint64_t)contentSizeChanged:
{
  uint64_t v0 = sub_1B9969E10();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9969DD0();
  swift_retain();
  sub_1B96B5BFC();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end