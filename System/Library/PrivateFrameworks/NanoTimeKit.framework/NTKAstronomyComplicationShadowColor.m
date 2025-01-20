@interface NTKAstronomyComplicationShadowColor
@end

@implementation NTKAstronomyComplicationShadowColor

void ___NTKAstronomyComplicationShadowColor_block_invoke()
{
  v0 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  uint64_t v1 = 0;
  v2 = (const CGFloat *)&NavdRecentLocationsEntitlment_block_invoke_2_complicationColorComponents;
  do
  {
    v3 = CGColorCreate(v0, v2);
    uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithCGColor:v3];
    v5 = (void *)_NTKAstronomyComplicationShadowColor_complicationColors[v1];
    _NTKAstronomyComplicationShadowColor_complicationColors[v1] = v4;

    CGColorRelease(v3);
    v2 += 4;
    ++v1;
  }
  while (v1 != 3);

  CGColorSpaceRelease(v0);
}

@end