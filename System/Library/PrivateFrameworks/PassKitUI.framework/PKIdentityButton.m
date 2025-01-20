@interface PKIdentityButton
+ (Class)layerClass;
+ (PKIdentityButton)buttonWithLabel:(PKIdentityButtonLabel)label style:(PKIdentityButtonStyle)style;
- (CGFloat)cornerRadius;
- (PKIdentityButton)init;
- (PKIdentityButton)initWithCoder:(id)a3;
- (PKIdentityButton)initWithLabel:(PKIdentityButtonLabel)label style:(PKIdentityButtonStyle)style;
- (void)setCornerRadius:(CGFloat)cornerRadius;
@end

@implementation PKIdentityButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (PKIdentityButton)buttonWithLabel:(PKIdentityButtonLabel)label style:(PKIdentityButtonStyle)style
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabel:label style:style];

  return (PKIdentityButton *)v4;
}

- (PKIdentityButton)init
{
  v3 = objc_alloc_init(_PKIdentityButton);

  return (PKIdentityButton *)v3;
}

- (PKIdentityButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [[_PKIdentityButton alloc] initWithCoder:v4];

  return (PKIdentityButton *)v5;
}

- (PKIdentityButton)initWithLabel:(PKIdentityButtonLabel)label style:(PKIdentityButtonStyle)style
{
  v5 = [[_PKIdentityButton alloc] initWithLabel:label style:style];

  return (PKIdentityButton *)v5;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  self->_cornerRadius = cornerRadius;
}

@end