@interface EMSeriesMapper
- (BOOL)useSecondaryAxis;
- (CGColor)fillColor;
- (CGColor)markerColor;
- (CGColor)strokeColor;
- (float)markerWidth;
- (float)offset;
- (float)strokeWidth;
- (id)values;
- (unsigned)chartType;
- (unsigned)markerType;
@end

@implementation EMSeriesMapper

- (unsigned)chartType
{
  return 0;
}

- (BOOL)useSecondaryAxis
{
  return 0;
}

- (id)values
{
  return 0;
}

- (CGColor)fillColor
{
  return 0;
}

- (CGColor)strokeColor
{
  return 0;
}

- (float)strokeWidth
{
  return 0.0;
}

- (unsigned)markerType
{
  return 0;
}

- (CGColor)markerColor
{
  return 0;
}

- (float)markerWidth
{
  return 0.0;
}

- (float)offset
{
  return 0.0;
}

@end