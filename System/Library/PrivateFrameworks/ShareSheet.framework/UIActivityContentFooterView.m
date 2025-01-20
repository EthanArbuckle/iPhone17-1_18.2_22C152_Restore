@interface UIActivityContentFooterView
@end

@implementation UIActivityContentFooterView

id __49___UIActivityContentFooterView__createEditButton__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  v3 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB12B0]];

  return v2;
}

@end