@interface NTKGroupedBezelProperties
- (UIColor)bezelTextColor;
- (double)bezelTextRadius;
- (void)setBezelTextColor:(id)a3;
- (void)setBezelTextRadius:(double)a3;
@end

@implementation NTKGroupedBezelProperties

- (UIColor)bezelTextColor
{
  return self->_bezelTextColor;
}

- (void)setBezelTextColor:(id)a3
{
}

- (double)bezelTextRadius
{
  return self->_bezelTextRadius;
}

- (void)setBezelTextRadius:(double)a3
{
  self->_bezelTextRadius = a3;
}

- (void).cxx_destruct
{
}

@end