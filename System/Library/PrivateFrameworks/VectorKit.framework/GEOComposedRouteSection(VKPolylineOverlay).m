@interface GEOComposedRouteSection(VKPolylineOverlay)
- (double)vkBounds;
@end

@implementation GEOComposedRouteSection(VKPolylineOverlay)

- (double)vkBounds
{
  return *(double *)(a1 + (int)*MEMORY[0x1E4F64C60]) / *(double *)(MEMORY[0x1E4F63F08] + 16);
}

@end