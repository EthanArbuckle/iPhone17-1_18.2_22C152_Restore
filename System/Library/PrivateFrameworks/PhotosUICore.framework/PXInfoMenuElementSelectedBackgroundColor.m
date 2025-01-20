@interface PXInfoMenuElementSelectedBackgroundColor
@end

@implementation PXInfoMenuElementSelectedBackgroundColor

void ___PXInfoMenuElementSelectedBackgroundColor_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_57_294005];
  v1 = (void *)_PXInfoMenuElementSelectedBackgroundColor_color;
  _PXInfoMenuElementSelectedBackgroundColor_color = v0;
}

id ___PXInfoMenuElementSelectedBackgroundColor_block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] colorWithRed:0.815686275 green:0.819607843 blue:0.82745098 alpha:0.5];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.37];
  }
  return v2;
}

@end