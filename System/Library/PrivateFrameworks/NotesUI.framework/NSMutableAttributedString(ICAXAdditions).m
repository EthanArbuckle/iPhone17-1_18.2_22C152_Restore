@interface NSMutableAttributedString(ICAXAdditions)
- (void)icaxApplyLowerPitchTokenToRange:()ICAXAdditions;
@end

@implementation NSMutableAttributedString(ICAXAdditions)

- (void)icaxApplyLowerPitchTokenToRange:()ICAXAdditions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F48A48];
  v9[0] = MEMORY[0x1E4F1CC38];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  objc_msgSend(a1, "setAttributes:range:", v7, a3, a4);
}

@end