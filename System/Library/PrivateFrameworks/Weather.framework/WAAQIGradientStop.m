@interface WAAQIGradientStop
+ (id)gradientStopWithColor:(id)a3 location:(float)a4;
- (UIColor)color;
- (WAAQIGradientStop)initWithColor:(id)a3 location:(float)a4;
- (float)location;
@end

@implementation WAAQIGradientStop

+ (id)gradientStopWithColor:(id)a3 location:(float)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  *(float *)&double v8 = a4;
  v9 = (void *)[v7 initWithColor:v6 location:v8];

  return v9;
}

- (WAAQIGradientStop)initWithColor:(id)a3 location:(float)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WAAQIGradientStop;
  id v7 = [(WAAQIGradientStop *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    color = v7->_color;
    v7->_color = (UIColor *)v8;

    v7->_location = a4;
  }

  return v7;
}

- (UIColor)color
{
  return self->_color;
}

- (float)location
{
  return self->_location;
}

- (void).cxx_destruct
{
}

@end