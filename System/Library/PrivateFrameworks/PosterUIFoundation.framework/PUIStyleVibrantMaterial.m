@interface PUIStyleVibrantMaterial
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsVariation;
- (BOOL)desiresVibrancyEffectView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4;
- (BOOL)isEqualToStyle:(id)a3;
- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4;
- (BOOL)isSupportedBackgroundStyle;
- (BOOL)isSupportedSystemStyle;
- (NSArray)colors;
- (NSString)localizedName;
- (NSString)lutIdentifier;
- (NSString)nonVariatedIdentifier;
- (UIColor)vibrancyEffectColor;
- (int64_t)vibrancyEffectType;
- (unint64_t)type;
@end

@implementation PUIStyleVibrantMaterial

- (BOOL)isEqual:(id)a3
{
  return [(PUIStyleVibrantMaterial *)self isEqual:a3 ignoringVariation:1];
}

- (BOOL)isEqualToStyle:(id)a3
{
  return [(PUIStyleVibrantMaterial *)self isEqualToStyle:a3 ignoringVariation:1];
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (PUIStyleVibrantMaterial *)a3;
  if (self == v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PUIStyleVibrantMaterial *)self isEqualToStyle:v6 ignoringVariation:v4];
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (PUIStyleVibrantMaterial *)a3;
  BOOL v7 = v6;
  if (self == v6)
  {
    char v8 = 1;
  }
  else if (v6)
  {
    char v8 = _PUIStyleCompareUsingIdentifiers(self, v6, v4);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)nonVariatedIdentifier
{
  uint64_t v2 = [(PUIStyleVibrantMaterial *)self type];
  return (NSString *)NSStringFromPUIStyleType(v2);
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  return 0;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end