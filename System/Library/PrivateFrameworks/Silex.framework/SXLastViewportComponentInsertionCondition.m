@interface SXLastViewportComponentInsertionCondition
- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5;
@end

@implementation SXLastViewportComponentInsertionCondition

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  id v6 = a5;
  [a3 approximateLocation];
  double v8 = v7;
  [v6 documentSize];
  double v10 = v9;
  [v6 viewportSize];
  double v12 = v11;

  return v8 < v10 - v12;
}

@end