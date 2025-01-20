@interface _UIExpandingGlyphsView(StatusBarDisplayable)
- (uint64_t)prefersBaselineAlignment;
@end

@implementation _UIExpandingGlyphsView(StatusBarDisplayable)

- (uint64_t)prefersBaselineAlignment
{
  return 1;
}

@end