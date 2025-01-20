@interface SXAutoPlacementMargin
- (SXAutoPlacementMargin)initWithTop:(_SXConvertibleValue)a3 bottom:(_SXConvertibleValue)a4;
- (_SXConvertibleValue)bottom;
- (_SXConvertibleValue)left;
- (_SXConvertibleValue)right;
- (_SXConvertibleValue)top;
@end

@implementation SXAutoPlacementMargin

- (SXAutoPlacementMargin)initWithTop:(_SXConvertibleValue)a3 bottom:(_SXConvertibleValue)a4
{
  unint64_t unit = a4.unit;
  double value = a4.value;
  unint64_t v6 = a3.unit;
  double v7 = a3.value;
  v9.receiver = self;
  v9.super_class = (Class)SXAutoPlacementMargin;
  result = [(SXAutoPlacementMargin *)&v9 init];
  if (result)
  {
    result->_top.double value = v7;
    result->_top.unint64_t unit = v6;
    result->_bottom.double value = value;
    result->_bottom.unint64_t unit = unit;
  }
  return result;
}

- (_SXConvertibleValue)top
{
  unint64_t unit = self->_top.unit;
  double value = self->_top.value;
  result.unint64_t unit = unit;
  result.double value = value;
  return result;
}

- (_SXConvertibleValue)right
{
  unint64_t unit = self->_right.unit;
  double value = self->_right.value;
  result.unint64_t unit = unit;
  result.double value = value;
  return result;
}

- (_SXConvertibleValue)bottom
{
  unint64_t unit = self->_bottom.unit;
  double value = self->_bottom.value;
  result.unint64_t unit = unit;
  result.double value = value;
  return result;
}

- (_SXConvertibleValue)left
{
  unint64_t unit = self->_left.unit;
  double value = self->_left.value;
  result.unint64_t unit = unit;
  result.double value = value;
  return result;
}

@end