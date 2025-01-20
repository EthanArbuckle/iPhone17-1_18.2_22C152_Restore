@interface SearchResultDebugPolygon
- (SearchResultDebugPolygon)init;
- (UIColor)strokeColor;
- (void)setStrokeColor:(id)a3;
@end

@implementation SearchResultDebugPolygon

- (SearchResultDebugPolygon)init
{
  v6.receiver = self;
  v6.super_class = (Class)SearchResultDebugPolygon;
  v2 = [(SearchResultDebugPolygon *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[UIColor redColor];
    strokeColor = v2->_strokeColor;
    v2->_strokeColor = (UIColor *)v3;
  }
  return v2;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end