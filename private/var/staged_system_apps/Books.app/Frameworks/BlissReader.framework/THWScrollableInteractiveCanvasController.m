@interface THWScrollableInteractiveCanvasController
- (BOOL)allowsHorizontalScrollingForScrollView:(id)a3;
- (BOOL)allowsVerticalRubberbandingForScrollView:(id)a3;
- (BOOL)handleHyperlinksWithTextGRs;
@end

@implementation THWScrollableInteractiveCanvasController

- (BOOL)allowsHorizontalScrollingForScrollView:(id)a3
{
  return 0;
}

- (BOOL)allowsVerticalRubberbandingForScrollView:(id)a3
{
  return 1;
}

- (BOOL)handleHyperlinksWithTextGRs
{
  return 1;
}

@end