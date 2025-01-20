@interface UILabelSummarySymbolTextAttachment
@end

@implementation UILabelSummarySymbolTextAttachment

void __84___UILabelSummarySymbolTextAttachment_initWithSummarySymbolOn_font_foregroundColor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) CGColor];
  UILabelNewAnimatingSummarySymbolView(v1, v2, v3);
}

@end