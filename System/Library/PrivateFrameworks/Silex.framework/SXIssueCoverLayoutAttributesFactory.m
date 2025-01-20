@interface SXIssueCoverLayoutAttributesFactory
- (id)createAttributesWithIssueCover:(id)a3 options:(id)a4;
@end

@implementation SXIssueCoverLayoutAttributesFactory

- (id)createAttributesWithIssueCover:(id)a3 options:(id)a4
{
  id v4 = a4;
  v5 = [SXIssueCoverLayoutAttributes alloc];
  [v4 boundingWidth];
  double v7 = v6;
  [v4 boundingWidth];
  double v9 = v8;

  v10 = -[SXIssueCoverLayoutAttributes initWithFrame:](v5, "initWithFrame:", 0.0, 0.0, v7, v9 / 0.75);
  return v10;
}

@end