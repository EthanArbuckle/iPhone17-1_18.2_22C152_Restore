@interface NSMutableAttributedString(SXAXAdditions)
- (void)sxaxApplyLowerPitchTokenToRange:()SXAXAdditions;
@end

@implementation NSMutableAttributedString(SXAXAdditions)

- (void)sxaxApplyLowerPitchTokenToRange:()SXAXAdditions
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F217D8];
  v9[0] = MEMORY[0x263EFFA88];
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  objc_msgSend(a1, "setAttributes:range:", v7, a3, a4);
}

@end