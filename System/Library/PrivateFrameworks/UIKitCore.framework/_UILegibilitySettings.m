@interface _UILegibilitySettings
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstanceForStyle:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)shadowCompositingFilterName;
- (UIColor)contentColor;
- (UIColor)primaryColor;
- (UIColor)secondaryColor;
- (UIColor)shadowColor;
- (_UILegibilitySettings)initWithCoder:(id)a3;
- (_UILegibilitySettings)initWithContentColor:(id)a3;
- (_UILegibilitySettings)initWithContentColor:(id)a3 contrast:(double)a4;
- (_UILegibilitySettings)initWithStyle:(int64_t)a3;
- (_UILegibilitySettings)initWithStyle:(int64_t)a3 contentColor:(id)a4;
- (_UILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6;
- (_UILegibilitySettings)initWithXPCDictionary:(id)a3;
- (double)imageOutset;
- (double)minFillHeight;
- (double)shadowAlpha;
- (double)shadowRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setContentColor:(id)a3;
- (void)setImageOutset:(double)a3;
- (void)setMinFillHeight:(double)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setPropertiesForStyle:(int64_t)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowCompositingFilterName:(id)a3;
- (void)setShadowRadius:(double)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation _UILegibilitySettings

- (double)imageOutset
{
  return self->_imageOutset;
}

- (NSString)shadowCompositingFilterName
{
  return self->_shadowCompositingFilterName;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (double)minFillHeight
{
  return self->_minFillHeight;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (_UILegibilitySettings)initWithStyle:(int64_t)a3 contentColor:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UILegibilitySettings;
  v6 = [(_UILegibilitySettings *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(_UILegibilitySettings *)v6 setStyle:a3];
    [(_UILegibilitySettings *)v7 setMinFillHeight:20.0];
    [(_UILegibilitySettings *)v7 setPropertiesForStyle:a3];
    [(_UILegibilitySettings *)v7 setContentColor:a4];
  }
  return v7;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)setPropertiesForStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"lightenSourceOver";
LABEL_7:
    [(_UILegibilitySettings *)self setShadowCompositingFilterName:v5];
    [(_UILegibilitySettings *)self setShadowRadius:12.0];
    [(_UILegibilitySettings *)self setShadowAlpha:1.0];
    [(_UILegibilitySettings *)self shadowRadius];
    double v4 = v6 + v6;
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    v5 = @"darkenSourceOver";
    goto LABEL_7;
  }
  if (a3) {
    return;
  }
  double v4 = 0.0;
  [(_UILegibilitySettings *)self setShadowRadius:0.0];
  [(_UILegibilitySettings *)self setShadowAlpha:0.0];
LABEL_8:
  [(_UILegibilitySettings *)self setImageOutset:v4];
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (void)setShadowCompositingFilterName:(id)a3
{
}

- (void)setShadowAlpha:(double)a3
{
  self->_shadowAlpha = a3;
}

- (void)setMinFillHeight:(double)a3
{
  self->_minFillHeight = a3;
}

- (void)setImageOutset:(double)a3
{
  self->_imageOutset = a3;
}

- (void)setContentColor:(id)a3
{
  contentColor = self->_contentColor;
  self->_contentColor = (UIColor *)a3;

  int64_t v6 = [(_UILegibilitySettings *)self style];
  if (v6 == 2)
  {
    if (a3) {
      v8 = ComputeLegibilityColorFromColor(a3, 0.3);
    }
    else {
      v8 = +[UIColor blackColor];
    }
    [(_UILegibilitySettings *)self setPrimaryColor:v8];
    [(_UILegibilitySettings *)self setSecondaryColor:[(UIColor *)[(_UILegibilitySettings *)self primaryColor] colorWithAlphaComponent:0.45]];
    v7 = +[UIColor whiteColor];
  }
  else if (v6 == 1)
  {
    [(_UILegibilitySettings *)self setPrimaryColor:+[UIColor whiteColor]];
    [(_UILegibilitySettings *)self setSecondaryColor:[(UIColor *)[(_UILegibilitySettings *)self primaryColor] colorWithAlphaComponent:0.45]];
    if (a3) {
      v7 = ComputeLegibilityColorFromColor(a3, 0.25);
    }
    else {
      v7 = +[UIColor blackColor];
    }
  }
  else
  {
    if (v6) {
      return;
    }
    [(_UILegibilitySettings *)self setPrimaryColor:+[UIColor clearColor]];
    [(_UILegibilitySettings *)self setSecondaryColor:+[UIColor clearColor]];
    v7 = +[UIColor clearColor];
  }
  [(_UILegibilitySettings *)self setShadowColor:v7];
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setSecondaryColor:(id)a3
{
}

- (void)setPrimaryColor:(id)a3
{
}

- (void)setShadowColor:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && self->_style == *((void *)a3 + 1)
    && vabdd_f64(self->_shadowAlpha, *((double *)a3 + 7)) < 2.22044605e-16
    && vabdd_f64(self->_shadowRadius, *((double *)a3 + 6)) < 2.22044605e-16
    && vabdd_f64(self->_imageOutset, *((double *)a3 + 8)) < 2.22044605e-16
    && vabdd_f64(self->_minFillHeight, *((double *)a3 + 9)) < 2.22044605e-16)
  {
    contentColor = self->_contentColor;
    unint64_t v6 = *((void *)a3 + 2);
    if (contentColor == (UIColor *)v6
      || !((unint64_t)contentColor | v6)
      || (BOOL v7 = -[UIColor _isSimilarToColor:withinPercentage:](contentColor, "_isSimilarToColor:withinPercentage:", 0.01)))
    {
      primaryColor = self->_primaryColor;
      unint64_t v9 = *((void *)a3 + 3);
      if (primaryColor == (UIColor *)v9
        || !((unint64_t)primaryColor | v9)
        || (BOOL v7 = -[UIColor _isSimilarToColor:withinPercentage:](primaryColor, "_isSimilarToColor:withinPercentage:", 0.01)))
      {
        secondaryColor = self->_secondaryColor;
        unint64_t v11 = *((void *)a3 + 4);
        if (secondaryColor == (UIColor *)v11
          || !((unint64_t)secondaryColor | v11)
          || (BOOL v7 = -[UIColor _isSimilarToColor:withinPercentage:](secondaryColor, "_isSimilarToColor:withinPercentage:", 0.01)))
        {
          unint64_t shadowColor = (unint64_t)self->_shadowColor;
          unint64_t v13 = *((void *)a3 + 5);
          LOBYTE(v7) = 1;
          if (shadowColor != v13)
          {
            if (shadowColor | v13)
            {
              v14 = self->_shadowColor;
              LOBYTE(v7) = -[UIColor _isSimilarToColor:withinPercentage:](v14, "_isSimilarToColor:withinPercentage:", 0.01);
            }
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)dealloc
{
  self->_shadowCompositingFilterName = 0;
  self->_contentColor = 0;

  self->_primaryColor = 0;
  self->_secondaryColor = 0;

  self->_unint64_t shadowColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilitySettings;
  [(_UILegibilitySettings *)&v3 dealloc];
}

+ (id)sharedInstanceForStyle:(int64_t)a3
{
  if (a3 != 2)
  {
    if (qword_1EB25A0A8 == -1)
    {
      objc_super v3 = &qword_1EB25A0B0;
      return (id)*v3;
    }
    v5 = &qword_1EB25A0A8;
    unint64_t v6 = &__block_literal_global_97;
LABEL_9:
    dispatch_once(v5, v6);
    objc_super v3 = v5 + 1;
    return (id)*v3;
  }
  if (qword_1EB25A0B8 != -1)
  {
    v5 = &qword_1EB25A0B8;
    unint64_t v6 = &__block_literal_global_101_0;
    goto LABEL_9;
  }
  objc_super v3 = &qword_1EB25A0C0;
  return (id)*v3;
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (_UILegibilitySettings)initWithStyle:(int64_t)a3
{
  return [(_UILegibilitySettings *)self initWithStyle:a3 contentColor:0];
}

- (_UILegibilitySettings)initWithContentColor:(id)a3
{
  int64_t v5 = +[_UILegibilitySettingsProvider styleForContentColor:](_UILegibilitySettingsProvider, "styleForContentColor:");
  return [(_UILegibilitySettings *)self initWithStyle:v5 contentColor:a3];
}

- (_UILegibilitySettings)initWithContentColor:(id)a3 contrast:(double)a4
{
  int64_t v6 = +[_UILegibilitySettingsProvider styleForContentColor:contrast:](_UILegibilitySettingsProvider, "styleForContentColor:contrast:", a4);
  return [(_UILegibilitySettings *)self initWithStyle:v6 contentColor:a3];
}

- (_UILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6
{
  unint64_t v9 = [(_UILegibilitySettings *)self initWithStyle:a3];
  v10 = v9;
  if (v9)
  {
    [(_UILegibilitySettings *)v9 setPrimaryColor:a4];
    [(_UILegibilitySettings *)v10 setSecondaryColor:a5];
    [(_UILegibilitySettings *)v10 setShadowColor:a6];
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [+[_UILegibilitySettings allocWithZone:a3] initWithStyle:self->_style primaryColor:self->_primaryColor secondaryColor:self->_secondaryColor shadowColor:self->_shadowColor];
  v4->_contentColor = (UIColor *)[(UIColor *)[(_UILegibilitySettings *)self contentColor] copy];
  [(_UILegibilitySettings *)self shadowRadius];
  v4->_shadowRadius = v5;
  [(_UILegibilitySettings *)self shadowAlpha];
  v4->_shadowAlpha = v6;
  [(_UILegibilitySettings *)self imageOutset];
  v4->_imageOutset = v7;
  [(_UILegibilitySettings *)self minFillHeight];
  v4->_minFillHeight = v8;
  v4->_shadowCompositingFilterName = (NSString *)[(NSString *)[(_UILegibilitySettings *)self shadowCompositingFilterName] copy];
  return v4;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = @"_UILegibilityStyleDefault";
  int64_t style = self->_style;
  if (style == 2) {
    double v5 = @"_UILegibilityStyleDarkContentWithLightShadow";
  }
  if (style == 1) {
    double v5 = @"_UILegibilityStyleLightContentWithDarkShadow";
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; style: '%@' primaryColor: '%@' secondaryColor: '%@' shadowColor: '%@' contentColor: '%@'>",
                       v4,
                       self,
                       v5,
                       self->_primaryColor,
                       self->_secondaryColor,
                       self->_shadowColor,
                       self->_contentColor);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", -[_UILegibilitySettings style](self, "style"), @"UILegibilityStyle");
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILegibilitySettings contentColor](self, "contentColor"), @"UILegibilityContentColor");
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILegibilitySettings primaryColor](self, "primaryColor"), @"UILegibilityPrimaryColor");
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILegibilitySettings secondaryColor](self, "secondaryColor"), @"UILegibilitySecondaryColor");
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILegibilitySettings shadowColor](self, "shadowColor"), @"UILegibilityShadowColor");
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILegibilitySettings shadowCompositingFilterName](self, "shadowCompositingFilterName"), @"UILegibilityShadowCompositingFilterName");
  [(_UILegibilitySettings *)self shadowRadius];
  objc_msgSend(a3, "encodeDouble:forKey:", @"UILegibilityShadowRadius");
  [(_UILegibilitySettings *)self shadowAlpha];
  objc_msgSend(a3, "encodeDouble:forKey:", @"UILegibilityShadowAlpha");
  [(_UILegibilitySettings *)self imageOutset];
  objc_msgSend(a3, "encodeDouble:forKey:", @"UILegibilityImageOutset");
  [(_UILegibilitySettings *)self minFillHeight];
  objc_msgSend(a3, "encodeDouble:forKey:", @"UILegibilityMinFillHeight");
}

- (_UILegibilitySettings)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UILegibilitySettings;
  uint64_t v4 = [(_UILegibilitySettings *)&v6 init];
  if (v4)
  {
    -[_UILegibilitySettings setStyle:](v4, "setStyle:", [a3 decodeIntegerForKey:@"UILegibilityStyle"]);
    -[_UILegibilitySettings setContentColor:](v4, "setContentColor:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"UILegibilityContentColor"]);
    -[_UILegibilitySettings setPrimaryColor:](v4, "setPrimaryColor:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"UILegibilityPrimaryColor"]);
    -[_UILegibilitySettings setSecondaryColor:](v4, "setSecondaryColor:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"UILegibilitySecondaryColor"]);
    -[_UILegibilitySettings setShadowColor:](v4, "setShadowColor:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"UILegibilityShadowColor"]);
    -[_UILegibilitySettings setShadowCompositingFilterName:](v4, "setShadowCompositingFilterName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"UILegibilityShadowCompositingFilterName"]);
    [a3 decodeDoubleForKey:@"UILegibilityShadowRadius"];
    -[_UILegibilitySettings setShadowRadius:](v4, "setShadowRadius:");
    [a3 decodeDoubleForKey:@"UILegibilityShadowAlpha"];
    -[_UILegibilitySettings setShadowAlpha:](v4, "setShadowAlpha:");
    [a3 decodeDoubleForKey:@"UILegibilityImageOutset"];
    -[_UILegibilitySettings setImageOutset:](v4, "setImageOutset:");
    [a3 decodeDoubleForKey:@"UILegibilityMinFillHeight"];
    -[_UILegibilitySettings setMinFillHeight:](v4, "setMinFillHeight:");
  }
  return v4;
}

- (_UILegibilitySettings)initWithXPCDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UILegibilitySettings;
  uint64_t v4 = [(_UILegibilitySettings *)&v6 init];
  if (v4)
  {
    -[_UILegibilitySettings setStyle:](v4, "setStyle:", xpc_dictionary_get_int64(a3, (const char *)[@"UILegibilityStyle" UTF8String]));
    objc_opt_class();
    [@"UILegibilityContentColor" UTF8String];
    [(_UILegibilitySettings *)v4 setContentColor:BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()];
    objc_opt_class();
    [@"UILegibilityPrimaryColor" UTF8String];
    [(_UILegibilitySettings *)v4 setPrimaryColor:BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()];
    objc_opt_class();
    [@"UILegibilitySecondaryColor" UTF8String];
    [(_UILegibilitySettings *)v4 setSecondaryColor:BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()];
    objc_opt_class();
    [@"UILegibilityShadowColor" UTF8String];
    [(_UILegibilitySettings *)v4 setShadowColor:BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()];
    [@"UILegibilityShadowCompositingFilterName" UTF8String];
    [(_UILegibilitySettings *)v4 setShadowCompositingFilterName:BSDeserializeStringFromXPCDictionaryWithKey()];
    -[_UILegibilitySettings setShadowRadius:](v4, "setShadowRadius:", xpc_dictionary_get_double(a3, (const char *)[@"UILegibilityShadowRadius" UTF8String]));
    -[_UILegibilitySettings setShadowAlpha:](v4, "setShadowAlpha:", xpc_dictionary_get_double(a3, (const char *)[@"UILegibilityShadowAlpha" UTF8String]));
    -[_UILegibilitySettings setImageOutset:](v4, "setImageOutset:", xpc_dictionary_get_double(a3, (const char *)[@"UILegibilityImageOutset" UTF8String]));
    -[_UILegibilitySettings setMinFillHeight:](v4, "setMinFillHeight:", xpc_dictionary_get_double(a3, (const char *)[@"UILegibilityMinFillHeight" UTF8String]));
  }
  return v4;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_dictionary_set_int64(a3, (const char *)[@"UILegibilityStyle" UTF8String], -[_UILegibilitySettings style](self, "style"));
  [(_UILegibilitySettings *)self contentColor];
  [@"UILegibilityContentColor" UTF8String];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  [(_UILegibilitySettings *)self primaryColor];
  [@"UILegibilityPrimaryColor" UTF8String];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  [(_UILegibilitySettings *)self secondaryColor];
  [@"UILegibilitySecondaryColor" UTF8String];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  [(_UILegibilitySettings *)self shadowColor];
  [@"UILegibilityShadowColor" UTF8String];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  [(_UILegibilitySettings *)self shadowCompositingFilterName];
  [@"UILegibilityShadowCompositingFilterName" UTF8String];
  BSSerializeStringToXPCDictionaryWithKey();
  double v5 = (const char *)[@"UILegibilityShadowRadius" UTF8String];
  [(_UILegibilitySettings *)self shadowRadius];
  xpc_dictionary_set_double(a3, v5, v6);
  double v7 = (const char *)[@"UILegibilityShadowAlpha" UTF8String];
  [(_UILegibilitySettings *)self shadowAlpha];
  xpc_dictionary_set_double(a3, v7, v8);
  unint64_t v9 = (const char *)[@"UILegibilityImageOutset" UTF8String];
  [(_UILegibilitySettings *)self imageOutset];
  xpc_dictionary_set_double(a3, v9, v10);
  unint64_t v11 = (const char *)[@"UILegibilityMinFillHeight" UTF8String];
  [(_UILegibilitySettings *)self minFillHeight];
  xpc_dictionary_set_double(a3, v11, v12);
}

@end