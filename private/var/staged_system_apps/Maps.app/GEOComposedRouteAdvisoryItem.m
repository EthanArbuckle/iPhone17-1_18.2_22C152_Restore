@interface GEOComposedRouteAdvisoryItem
- (void)updateModel:(id)a3;
@end

@implementation GEOComposedRouteAdvisoryItem

- (void)updateModel:(id)a3
{
  id v4 = a3;
  v5 = [(GEOComposedRouteAdvisoryItem *)self titleString];
  v6 = [v5 stringWithDefaultOptions];
  [v4 setFirstLine:v6];

  id v8 = [(GEOComposedRouteAdvisoryItem *)self subtitleString];
  v7 = [v8 stringWithDefaultOptions];
  [v4 setSecondLine:v7];
}

@end