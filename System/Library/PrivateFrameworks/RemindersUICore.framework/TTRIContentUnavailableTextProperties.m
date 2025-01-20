@interface TTRIContentUnavailableTextProperties
+ (Class)implClass;
- (UIColor)color;
- (UIFont)font;
- (id)asUIKit;
- (void)setColor:(id)a3;
- (void)setFont:(id)a3;
@end

@implementation TTRIContentUnavailableTextProperties

+ (Class)implClass
{
  return (Class)objc_opt_class();
}

- (id)asUIKit
{
  return self->super._impl;
}

- (UIFont)font
{
  v2 = [(TTRIContentUnavailableTextProperties *)self asUIKit];
  v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRIContentUnavailableTextProperties *)self asUIKit];
  [v5 setFont:v4];
}

- (UIColor)color
{
  v2 = [(TTRIContentUnavailableTextProperties *)self asUIKit];
  v3 = [v2 color];

  return (UIColor *)v3;
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRIContentUnavailableTextProperties *)self asUIKit];
  [v5 setColor:v4];
}

@end