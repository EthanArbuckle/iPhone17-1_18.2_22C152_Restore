@interface PRPosterContentVibrantMaterialStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsVariation;
- (BOOL)desiresVibrancyEffectView;
- (BOOL)isSupportedBackgroundStyle;
- (BOOL)isSupportedSystemStyle;
- (NSArray)colors;
- (NSString)localizedName;
- (NSString)lutIdentifier;
- (NSString)nonVariatedIdentifier;
- (UIColor)vibrancyEffectColor;
- (int64_t)vibrancyEffectType;
- (unint64_t)type;
- (void)applyStyleWithRenderer:(id)a3;
@end

@implementation PRPosterContentVibrantMaterialStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)nonVariatedIdentifier
{
  uint64_t v2 = [(PRPosterContentVibrantMaterialStyle *)self type];
  return (NSString *)_PRPosterContentStyleStringForType(v2);
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  return 0;
}

- (void)applyStyleWithRenderer:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 renderVibrantMaterialStyle:self];
  }
}

- (unint64_t)type
{
  return 2;
}

- (BOOL)allowsVariation
{
  return 0;
}

- (BOOL)isSupportedSystemStyle
{
  return 1;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 0;
}

- (BOOL)desiresVibrancyEffectView
{
  return 1;
}

- (int64_t)vibrancyEffectType
{
  return 0;
}

- (UIColor)vibrancyEffectColor
{
  return 0;
}

- (NSString)lutIdentifier
{
  return 0;
}

@end