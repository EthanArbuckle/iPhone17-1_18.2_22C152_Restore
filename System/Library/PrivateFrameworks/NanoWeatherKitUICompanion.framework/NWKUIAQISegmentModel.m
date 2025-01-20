@interface NWKUIAQISegmentModel
- (BOOL)isActive;
- (NWKUIAQISegmentModel)initWithColor:(id)a3 active:(BOOL)a4;
- (UIColor)color;
@end

@implementation NWKUIAQISegmentModel

- (NWKUIAQISegmentModel)initWithColor:(id)a3 active:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NWKUIAQISegmentModel;
  v8 = [(NWKUIAQISegmentModel *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_color, a3);
    v9->_active = a4;
  }

  return v9;
}

- (UIColor)color
{
  return (UIColor *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
}

@end