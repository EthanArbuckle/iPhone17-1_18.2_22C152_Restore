@interface WFVariableString
@end

@implementation WFVariableString

id __63__WFVariableString_AttributedString__initWithAttributedString___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) attribute:*MEMORY[0x263F814A0] atIndex:a2 effectiveRange:0];
  objc_opt_class();
  v3 = 0;
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 variable];
  }

  return v3;
}

@end