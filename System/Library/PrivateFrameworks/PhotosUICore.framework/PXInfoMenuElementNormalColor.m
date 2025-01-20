@interface PXInfoMenuElementNormalColor
@end

@implementation PXInfoMenuElementNormalColor

void ___PXInfoMenuElementNormalColor_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_49_294001];
  v1 = (void *)_PXInfoMenuElementNormalColor_color;
  _PXInfoMenuElementNormalColor_color = v0;
}

id ___PXInfoMenuElementNormalColor_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  double v3 = 0.0;
  if (v2 == 2) {
    double v3 = 1.0;
  }
  v4 = [MEMORY[0x1E4FB1618] colorWithWhite:v3 alpha:0.5];
  return v4;
}

@end