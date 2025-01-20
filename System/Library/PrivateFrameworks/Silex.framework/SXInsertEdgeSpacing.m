@interface SXInsertEdgeSpacing
- (_SXConvertibleValue)bottom;
- (_SXConvertibleValue)left;
- (_SXConvertibleValue)right;
- (_SXConvertibleValue)top;
- (void)initWithTop:(uint64_t)a3 bottom:(uint64_t)a4;
@end

@implementation SXInsertEdgeSpacing

- (void)initWithTop:(uint64_t)a3 bottom:(uint64_t)a4
{
  if (result)
  {
    v9.receiver = result;
    v9.super_class = (Class)SXInsertEdgeSpacing;
    result = objc_msgSendSuper2(&v9, sel_init);
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
      result[5] = a4;
      result[6] = a5;
    }
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