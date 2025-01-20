@interface EMAxisMapper
- (BOOL)centerLabels;
- (BOOL)isLogarithmic;
- (CGColor)strokeColor;
- (CGColor)textColor;
- (float)maxValue;
- (float)minValue;
- (float)strokeWidth;
- (float)unit;
- (id)label;
- (id)labels;
- (id)position;
- (id)values;
- (unsigned)type;
@end

@implementation EMAxisMapper

- (id)position
{
  return 0;
}

- (unsigned)type
{
  return 0;
}

- (id)label
{
  return 0;
}

- (float)minValue
{
  return 0.0;
}

- (float)maxValue
{
  return 0.0;
}

- (float)unit
{
  return 0.0;
}

- (BOOL)isLogarithmic
{
  return 0;
}

- (id)labels
{
  return 0;
}

- (BOOL)centerLabels
{
  return 0;
}

- (id)values
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

- (CGColor)textColor
{
  return 0;
}

@end