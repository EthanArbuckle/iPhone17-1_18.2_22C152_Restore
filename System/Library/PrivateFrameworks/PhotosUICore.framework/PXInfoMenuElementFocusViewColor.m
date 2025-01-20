@interface PXInfoMenuElementFocusViewColor
@end

@implementation PXInfoMenuElementFocusViewColor

void ___PXInfoMenuElementFocusViewColor_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_45_293997];
  v1 = (void *)_PXInfoMenuElementFocusViewColor_color;
  _PXInfoMenuElementFocusViewColor_color = v0;
}

id ___PXInfoMenuElementFocusViewColor_block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] colorWithRed:0.815686275 green:0.819607843 blue:0.82745098 alpha:1.0];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v2;
}

@end