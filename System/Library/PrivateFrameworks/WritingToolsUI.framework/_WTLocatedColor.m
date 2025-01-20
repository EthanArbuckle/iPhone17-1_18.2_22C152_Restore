@interface _WTLocatedColor
+ (id)locatedColor:(id)a3 location:(double)a4;
- (_WTColor)color;
- (double)location;
- (void)setColor:(id)a3;
- (void)setLocation:(double)a3;
@end

@implementation _WTLocatedColor

+ (id)locatedColor:(id)a3 location:(double)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = objc_opt_new();
  [v6 setColor:v5];

  [v6 setLocation:a4];

  return v6;
}

- (_WTColor)color
{
  return (_WTColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setColor:(id)a3
{
}

- (double)location
{
  return self->_location;
}

- (void)setLocation:(double)a3
{
  self->_location = a3;
}

- (void).cxx_destruct
{
}

@end