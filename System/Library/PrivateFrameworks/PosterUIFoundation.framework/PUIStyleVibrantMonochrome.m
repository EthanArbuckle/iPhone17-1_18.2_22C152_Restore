@interface PUIStyleVibrantMonochrome
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
- (PUIStyleVibrantMonochrome)init;
- (PUIStyleVibrantMonochrome)initWithBackgroundType:(unint64_t)a3;
- (PUIStyleVibrantMonochrome)initWithCoder:(id)a3;
- (UIColor)effectiveColor;
- (UIColor)vibrancyEffectColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)vibrancyEffectType;
- (unint64_t)backgroundType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIStyleVibrantMonochrome

- (PUIStyleVibrantMonochrome)init
{
  return [(PUIStyleVibrantMonochrome *)self initWithBackgroundType:1];
}

- (PUIStyleVibrantMonochrome)initWithBackgroundType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUIStyleVibrantMonochrome;
  v4 = [(PUIStyleVibrantMonochrome *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_backgroundType = a3;
    if (a3 == 1) {
      [MEMORY[0x263F1C550] whiteColor];
    }
    else {
    uint64_t v6 = [MEMORY[0x263F1C550] blackColor];
    }
    effectiveColor = v5->_effectiveColor;
    v5->_effectiveColor = (UIColor *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return [(PUIStyleVibrantMonochrome *)self isEqual:a3 ignoringVariation:1];
}

- (BOOL)isEqualToStyle:(id)a3
{
  return [(PUIStyleVibrantMonochrome *)self isEqualToStyle:a3 ignoringVariation:1];
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  v5 = (PUIStyleVibrantMonochrome *)a3;
  if (v5 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PUIStyleVibrantMonochrome *)self isEqualToStyle:v5];
  }

  return v6;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (PUIStyleVibrantMonochrome *)a3;
  if (v6 == self)
  {
    BOOL v7 = 1;
  }
  else if (_PUIStyleCompareUsingIdentifiers(self, v6, v4))
  {
    BOOL v7 = self->_backgroundType == v6->_backgroundType;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C60]);
  id v4 = (id)[v3 appendUnsignedInteger:self->_backgroundType];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (NSString)nonVariatedIdentifier
{
  uint64_t v2 = [(PUIStyleVibrantMonochrome *)self type];
  return (NSString *)NSStringFromPUIStyleType(v2);
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_effectiveColor;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (unint64_t)type
{
  return 3;
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
  return 2;
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

- (PUIStyleVibrantMonochrome)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"_backgroundType"];
  return [(PUIStyleVibrantMonochrome *)self initWithBackgroundType:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t backgroundType = self->_backgroundType;
  return (id)[v4 initWithBackgroundType:backgroundType];
}

- (unint64_t)backgroundType
{
  return self->_backgroundType;
}

- (UIColor)effectiveColor
{
  return self->_effectiveColor;
}

- (void).cxx_destruct
{
}

@end