@interface PXInfoMenuElementFocusColor
@end

@implementation PXInfoMenuElementFocusColor

void ___PXInfoMenuElementFocusColor_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_53_294011];
  v1 = (void *)_PXInfoMenuElementFocusColor_color;
  _PXInfoMenuElementFocusColor_color = v0;
}

id ___PXInfoMenuElementFocusColor_block_invoke_2(uint64_t a1, void *a2)
{
  [a2 userInterfaceStyle];
  v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
  return v2;
}

@end