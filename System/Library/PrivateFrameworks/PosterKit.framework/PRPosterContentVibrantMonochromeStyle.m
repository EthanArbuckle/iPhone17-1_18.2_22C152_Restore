@interface PRPosterContentVibrantMonochromeStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsVariation;
- (BOOL)desiresVibrancyEffectView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedBackgroundStyle;
- (BOOL)isSupportedSystemStyle;
- (NSArray)colors;
- (NSString)localizedName;
- (NSString)lutIdentifier;
- (NSString)nonVariatedIdentifier;
- (PRPosterContentVibrantMonochromeStyle)init;
- (PRPosterContentVibrantMonochromeStyle)initWithBackgroundType:(unint64_t)a3;
- (UIColor)effectiveColor;
- (UIColor)vibrancyEffectColor;
- (int64_t)vibrancyEffectType;
- (unint64_t)backgroundType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)applyStyleWithRenderer:(id)a3;
@end

@implementation PRPosterContentVibrantMonochromeStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterContentVibrantMonochromeStyle)init
{
  return [(PRPosterContentVibrantMonochromeStyle *)self initWithBackgroundType:1];
}

- (PRPosterContentVibrantMonochromeStyle)initWithBackgroundType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PRPosterContentVibrantMonochromeStyle;
  v4 = [(PRPosterContentVibrantMonochromeStyle *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_backgroundType = a3;
    if (a3 == 1) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    uint64_t v6 = [MEMORY[0x1E4FB1618] blackColor];
    }
    effectiveColor = v5->_effectiveColor;
    v5->_effectiveColor = (UIColor *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRPosterContentVibrantMonochromeStyle *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_backgroundType == v4->_backgroundType;
  }

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  id v4 = (id)[v3 appendUnsignedInteger:self->_backgroundType];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (NSString)nonVariatedIdentifier
{
  uint64_t v2 = [(PRPosterContentVibrantMonochromeStyle *)self type];
  return (NSString *)_PRPosterContentStyleStringForType(v2);
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_effectiveColor;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (void)applyStyleWithRenderer:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 renderVibrantMonochromeStyle:self];
  }
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