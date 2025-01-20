@interface TipManager
- (void)barCompressionStatusDidChange:(id)a3;
@end

@implementation TipManager

- (void)barCompressionStatusDidChange:(id)a3
{
  uint64_t v3 = sub_1B61AF6F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AF6B0();
  swift_retain();
  sub_1B61A81EC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end