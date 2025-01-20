@interface PKBorderedButtonConfiguration
+ (id)filledButtonConfiguration;
+ (id)grayButtonConfiguration;
+ (id)plainButtonConfiguration;
+ (id)tintedButtonConfiguration;
- (UIColor)borderColor;
- (double)borderWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)border;
- (void)_initializeDefaults;
- (void)setBorder:(unint64_t)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
@end

@implementation PKBorderedButtonConfiguration

- (void)_initializeDefaults
{
  PKScreenScale();
  [(PKBorderedButtonConfiguration *)self setBorderWidth:1.0 / v3];
  id v4 = [MEMORY[0x1E4FB1618] separatorColor];
  [(PKBorderedButtonConfiguration *)self setBorderColor:v4];
}

+ (id)plainButtonConfiguration
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PKBorderedButtonConfiguration;
  v2 = objc_msgSendSuper2(&v4, sel_plainButtonConfiguration);
  [v2 _initializeDefaults];

  return v2;
}

+ (id)tintedButtonConfiguration
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PKBorderedButtonConfiguration;
  v2 = objc_msgSendSuper2(&v4, sel_tintedButtonConfiguration);
  [v2 _initializeDefaults];

  return v2;
}

+ (id)grayButtonConfiguration
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PKBorderedButtonConfiguration;
  v2 = objc_msgSendSuper2(&v4, sel_grayButtonConfiguration);
  [v2 _initializeDefaults];

  return v2;
}

+ (id)filledButtonConfiguration
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PKBorderedButtonConfiguration;
  v2 = objc_msgSendSuper2(&v4, sel_filledButtonConfiguration);
  [v2 _initializeDefaults];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKBorderedButtonConfiguration;
  id v4 = [(UIButtonConfiguration *)&v6 copyWithZone:a3];
  *((void *)v4 + 34) = self->_border;
  objc_storeStrong((id *)v4 + 36, self->_borderColor);
  *((void *)v4 + 35) = *(void *)&self->_borderWidth;
  return v4;
}

- (unint64_t)border
{
  return self->_border;
}

- (void)setBorder:(unint64_t)a3
{
  self->_border = a3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end