@interface UIPasteControlConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldLayoutSynchronously;
- (CGFloat)cornerRadius;
- (UIButtonConfigurationCornerStyle)cornerStyle;
- (UIColor)baseBackgroundColor;
- (UIColor)baseForegroundColor;
- (UIPasteControlConfiguration)init;
- (UIPasteControlConfiguration)initWithCoder:(id)a3;
- (UIPasteControlDisplayMode)displayMode;
- (unint64_t)imagePlacement;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseBackgroundColor:(UIColor *)baseBackgroundColor;
- (void)setBaseForegroundColor:(UIColor *)baseForegroundColor;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setCornerStyle:(UIButtonConfigurationCornerStyle)cornerStyle;
- (void)setDisplayMode:(UIPasteControlDisplayMode)displayMode;
- (void)setImagePlacement:(unint64_t)a3;
- (void)set_shouldLayoutSynchronously:(BOOL)a3;
@end

@implementation UIPasteControlConfiguration

- (UIPasteControlConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIPasteControlConfiguration;
  result = [(UIPasteControlConfiguration *)&v3 init];
  if (result)
  {
    result->_cornerStyle = 2;
    result->_imagePlacement = 2;
  }
  return result;
}

- (UIPasteControlConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIPasteControlConfiguration;
  v5 = [(UIPasteControlConfiguration *)&v12 init];
  if (v5)
  {
    v5->_displayMode = [v4 decodeIntegerForKey:@"UIPasteControlConfigurationDisplayMode"];
    v5->_cornerStyle = [v4 decodeIntegerForKey:@"UIPasteControlConfigurationCornerStyle"];
    [v4 decodeFloatForKey:@"UIPasteControlConfigurationCornerRadius"];
    v5->_cornerRadius = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIPasteControlConfigurationBaseForegroundColor"];
    baseForegroundColor = v5->_baseForegroundColor;
    v5->_baseForegroundColor = (UIColor *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIPasteControlConfigurationBaseBackgroundColor"];
    baseBackgroundColor = v5->_baseBackgroundColor;
    v5->_baseBackgroundColor = (UIColor *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t displayMode = self->_displayMode;
  id v6 = a3;
  [v6 encodeInteger:displayMode forKey:@"UIPasteControlConfigurationDisplayMode"];
  [v6 encodeInteger:self->_cornerStyle forKey:@"UIPasteControlConfigurationCornerStyle"];
  double cornerRadius = self->_cornerRadius;
  *(float *)&double cornerRadius = cornerRadius;
  [v6 encodeFloat:@"UIPasteControlConfigurationCornerRadius" forKey:cornerRadius];
  [v6 encodeObject:self->_baseForegroundColor forKey:@"UIPasteControlConfigurationBaseForegroundColor"];
  [v6 encodeObject:self->_baseBackgroundColor forKey:@"UIPasteControlConfigurationBaseBackgroundColor"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIPasteControlDisplayMode)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(UIPasteControlDisplayMode)displayMode
{
  self->_unint64_t displayMode = displayMode;
}

- (UIButtonConfigurationCornerStyle)cornerStyle
{
  return self->_cornerStyle;
}

- (void)setCornerStyle:(UIButtonConfigurationCornerStyle)cornerStyle
{
  self->_cornerStyle = cornerStyle;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  self->_double cornerRadius = cornerRadius;
}

- (unint64_t)imagePlacement
{
  return self->_imagePlacement;
}

- (void)setImagePlacement:(unint64_t)a3
{
  self->_imagePlacement = a3;
}

- (UIColor)baseForegroundColor
{
  return self->_baseForegroundColor;
}

- (void)setBaseForegroundColor:(UIColor *)baseForegroundColor
{
}

- (UIColor)baseBackgroundColor
{
  return self->_baseBackgroundColor;
}

- (void)setBaseBackgroundColor:(UIColor *)baseBackgroundColor
{
}

- (BOOL)_shouldLayoutSynchronously
{
  return self->__shouldLayoutSynchronously;
}

- (void)set_shouldLayoutSynchronously:(BOOL)a3
{
  self->__shouldLayoutSynchronously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseBackgroundColor, 0);
  objc_storeStrong((id *)&self->_baseForegroundColor, 0);
}

@end