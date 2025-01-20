@interface MFRegion
- (id)pathForClippingWithDeviceContext:(id)a3;
- (int)fill:(id)a3 in_brush:(id)a4;
- (int)frame:(id)a3 in_brush:(id)a4;
- (int)invert:(id)a3;
- (int)selectInto:(id)a3;
@end

@implementation MFRegion

- (int)selectInto:(id)a3
{
  return -1;
}

- (id)pathForClippingWithDeviceContext:(id)a3
{
  return 0;
}

- (int)fill:(id)a3 in_brush:(id)a4
{
  return -1;
}

- (int)frame:(id)a3 in_brush:(id)a4
{
  return -1;
}

- (int)invert:(id)a3
{
  return -1;
}

@end