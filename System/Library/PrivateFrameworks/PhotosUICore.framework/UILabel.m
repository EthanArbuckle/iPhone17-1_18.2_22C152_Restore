@interface UILabel
@end

@implementation UILabel

uint64_t __72__UILabel_Truncation__px_isTruncatedForAttributedString_forWidth_lines___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4FB1930]);
  uint64_t v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v2 = (void *)px_isTruncatedForAttributedString_forWidth_lines__label;
  px_isTruncatedForAttributedString_forWidth_lines__label = v1;

  v3 = (void *)px_isTruncatedForAttributedString_forWidth_lines__label;
  return [v3 setNumberOfLines:0];
}

@end