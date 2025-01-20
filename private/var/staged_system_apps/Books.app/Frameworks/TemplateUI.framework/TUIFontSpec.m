@interface TUIFontSpec
+ (BOOL)determineUseFontFallbackFromLanguage:(id)a3;
+ (TUIFontSpec)fontSpecWithPostscriptName:(id)a3 size:(double)a4;
+ (double)_weightFromString:(id)a3;
+ (id)attributedStringWith:(id)a3 attributes:(id)a4;
+ (id)defaultFontSpec;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMonospacedDigitsSpecified;
- (BOOL)isPointSizeSpecified;
- (BOOL)isWeightSpecified;
- (BOOL)monospacedDigits;
- (NSDictionary)fontAttributes;
- (NSString)fontDesignTrait;
- (NSString)fontFamilyName;
- (NSString)postscriptName;
- (NSString)textStyle;
- (TUIFontSpec)fontSpecWithAdditionalLeading:(double)a3;
- (TUIFontSpec)fontSpecWithCaps:(unint64_t)a3;
- (TUIFontSpec)fontSpecWithColor:(id)a3;
- (TUIFontSpec)fontSpecWithDesign:(id)a3;
- (TUIFontSpec)fontSpecWithFamily:(id)a3;
- (TUIFontSpec)fontSpecWithLeading:(double)a3;
- (TUIFontSpec)fontSpecWithMaxContentSize:(id)a3;
- (TUIFontSpec)fontSpecWithMaxPointSize:(double)a3;
- (TUIFontSpec)fontSpecWithMinContentSize:(id)a3;
- (TUIFontSpec)fontSpecWithMinPointSize:(double)a3;
- (TUIFontSpec)fontSpecWithMonospacedDigits:(BOOL)a3;
- (TUIFontSpec)fontSpecWithPointSize:(double)a3;
- (TUIFontSpec)fontSpecWithScale:(double)a3;
- (TUIFontSpec)fontSpecWithTextStyle:(id)a3;
- (TUIFontSpec)fontSpecWithTracking:(double)a3;
- (TUIFontSpec)fontSpecWithWeight:(double)a3;
- (TUIFontSpec)init;
- (TUIFontSpec)initWithOther:(id)a3;
- (UIColor)foregroundColor;
- (double)leading;
- (double)pointSize;
- (double)scale;
- (double)tracking;
- (double)weight;
- (id)_mappedSpec:(BOOL)a3 traitCollection:(id)a4;
- (id)_resolvedFontSpecWithTraitCollection:(id)a3;
- (id)attributesForAttributedString;
- (id)attributesForAttributedStringCentered:(BOOL)a3 truncated:(BOOL)a4;
- (id)attributesForAttributedStringCentered:(BOOL)a3 truncated:(BOOL)a4 ignoreLeading:(BOOL)a5;
- (id)attributesForAttributedStringCentered:(BOOL)a3 truncated:(BOOL)a4 ignoreLeading:(BOOL)a5 lineSpacing:(double)a6;
- (id)font;
- (id)mappedSpecIfNeededWithEnvironment:(id)a3;
- (id)mappedSpecIfNeededWithTraitCollection:(id)a3;
- (unint64_t)caps;
- (unint64_t)hash;
@end

@implementation TUIFontSpec

+ (BOOL)determineUseFontFallbackFromLanguage:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_2DFA00 == -1)
  {
    if (!v3)
    {
LABEL_6:
      LOBYTE(v7) = 1;
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_2DFA00, &stru_257040);
    if (!v4) {
      goto LABEL_6;
    }
  }
  v5 = +[NSLocale componentsFromLocaleIdentifier:v4];
  v6 = [v5 objectForKeyedSubscript:NSLocaleLanguageCode];

  if (!v6) {
    goto LABEL_6;
  }
  unsigned int v7 = [(id)qword_2DF9F8 containsObject:v6] ^ 1;

LABEL_7:
  v8 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v9 = [v8 BOOLForKey:@"TUIForceFallbackFont"];

  return v9 | v7;
}

+ (double)_weightFromString:(id)a3
{
  uint64_t v3 = qword_2DFA10;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_2DFA10, &stru_257060);
  }
  v5 = [v4 lowercaseString];

  if (v5
    && ([(id)qword_2DFA08 objectForKeyedSubscript:v5],
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v7 = v6;
    [v6 floatValue];
    double v9 = v8;
  }
  else
  {
    double v9 = UIFontWeightRegular;
  }

  return v9;
}

+ (TUIFontSpec)fontSpecWithPostscriptName:(id)a3 size:(double)a4
{
  id v6 = a3;
  unsigned int v7 = objc_alloc_init(TUIFontSpec);
  uint64_t v25 = 0x7FF8000000000000;
  BOOL v8 = sub_170DD4();
  uint64_t v9 = sub_170AD8(v6, &v25, v8);
  v10 = (void *)v9;
  if (v9) {
    v11 = (void *)v9;
  }
  else {
    v11 = v6;
  }
  id v12 = v11;

  v13 = @"System-";
  if ([v12 hasPrefix:@"System-"])
  {
    v14 = (id *)&kCTFontUIFontDesignDefault;
LABEL_10:
    v15 = [v12 substringFromIndex:-[v13 length]];
    [a1 _weightFromString:v15];
    UIFontWeight v17 = v16;

    v18 = (NSString *)*v14;
    id v12 = 0;
    goto LABEL_11;
  }
  v13 = @"SystemSerif-";
  if ([v12 hasPrefix:@"SystemSerif-"])
  {
    v14 = (id *)&kCTFontUIFontDesignSerif;
    goto LABEL_10;
  }
  v13 = @"SystemRounded-";
  if ([v12 hasPrefix:@"SystemRounded-"])
  {
    v14 = (id *)&kCTFontUIFontDesignRounded;
    goto LABEL_10;
  }
  v18 = 0;
  UIFontWeight v17 = UIFontWeightRegular;
LABEL_11:
  v19 = (NSString *)[v12 copy];
  postscriptName = v7->_postscriptName;
  v7->_postscriptName = v19;

  v7->_pointSize = a4;
  uint64_t v21 = v25;
  v7->_leading = 0.0;
  v7->_weight = v17;
  *(void *)&v7->_tracking = v21;
  fontDesignTrait = v7->_fontDesignTrait;
  v7->_fontDesignTrait = v18;
  v23 = v18;

  *(unsigned char *)&v7->_specified |= 3u;

  return v7;
}

- (TUIFontSpec)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIFontSpec;
  result = [(TUIFontSpec *)&v3 init];
  if (result)
  {
    result->_weight = UIFontWeightRegular;
    result->_tracking = NAN;
    *(_OWORD *)&result->_scale = xmmword_243BA0;
    *(unsigned char *)&result->_specified = 0;
  }
  return result;
}

- (TUIFontSpec)initWithOther:(id)a3
{
  id v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIFontSpec;
  v5 = [(TUIFontSpec *)&v8 init];
  id v6 = v5;
  if (v4 && v5)
  {
    objc_storeStrong((id *)&v5->_postscriptName, v4[10]);
    *(void *)&v6->_pointSize = v4[8];
    *(void *)&v6->_tracking = v4[16];
    *(void *)&v6->_leading = v4[6];
    *(void *)&v6->_additionalLeading = v4[7];
    v6->_caps = (unint64_t)v4[14];
    *(void *)&v6->_weight = v4[15];
    *((unsigned char *)&v6->_specified + 1) = *((unsigned char *)v4 + 73);
    objc_storeStrong((id *)&v6->_foregroundColor, v4[17]);
    objc_storeStrong((id *)&v6->_fontDesignTrait, v4[11]);
    objc_storeStrong((id *)&v6->_fontFamilyName, v4[12]);
    objc_storeStrong((id *)&v6->_textStyle, v4[13]);
    *(void *)&v6->_maxPointSize = v4[4];
    objc_storeStrong((id *)&v6->_maxContentSize, v4[2]);
    *(void *)&v6->_minPointSize = v4[3];
    objc_storeStrong((id *)&v6->_minContentSize, v4[1]);
    *(void *)&v6->_scale = v4[5];
    *(unsigned char *)&v6->_specified = *((unsigned char *)v4 + 72);
  }

  return v6;
}

- (TUIFontSpec)fontSpecWithScale:(double)a3
{
  objc_super v3 = self;
  if (a3 != 1.0 && a3 != 0.0)
  {
    id v4 = [[TUIFontSpec alloc] initWithOther:v3];

    v4->_pointSize = v4->_pointSize * a3;
    *(float64x2_t *)&v4->_scale = vmulq_n_f64(*(float64x2_t *)&v4->_scale, a3);
    objc_super v3 = v4;
  }

  return v3;
}

- (id)mappedSpecIfNeededWithEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [v4 useFontFallback];
  id v6 = [v4 traitCollection];

  unsigned int v7 = [(TUIFontSpec *)self _mappedSpec:v5 traitCollection:v6];

  return v7;
}

- (id)mappedSpecIfNeededWithTraitCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIFontSpec *)self _mappedSpec:sub_170DD4() traitCollection:v4];

  return v5;
}

- (id)_mappedSpec:(BOOL)a3 traitCollection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v7 = self;
  double tracking = v7->_tracking;
  objc_super v8 = sub_170AD8(v7->_postscriptName, &tracking, v4);
  if (!v8)
  {
    if (v4 && [(NSString *)v7->_fontDesignTrait isEqualToString:UIFontSystemFontDesignSerif])
    {
      uint64_t v9 = [[TUIFontSpec alloc] initWithOther:v7];

      objc_storeStrong((id *)&v9->_fontDesignTrait, UIFontSystemFontDesignDefault);
    }
    else
    {
      uint64_t v9 = v7;
    }
    goto LABEL_14;
  }
  uint64_t v9 = [[TUIFontSpec alloc] initWithOther:v7];

  if ([v8 hasPrefix:@"System-"])
  {
    postscriptName = v9->_postscriptName;
    v9->_postscriptName = 0;

    v11 = objc_opt_class();
    id v12 = [v8 substringFromIndex:[@"System-" length]];
    [v11 _weightFromString:v12];
    v9->_weight = v13;

    v14 = (id *)&UIFontSystemFontDesignDefault;
  }
  else if ([v8 hasPrefix:@"SystemSerif-"])
  {
    v15 = v9->_postscriptName;
    v9->_postscriptName = 0;

    double v16 = objc_opt_class();
    UIFontWeight v17 = [v8 substringFromIndex:[@"SystemSerif-" length]];
    [v16 _weightFromString:v17];
    v9->_weight = v18;

    v14 = (id *)&UIFontSystemFontDesignSerif;
  }
  else
  {
    if (![v8 hasPrefix:@"SystemRounded-"])
    {
      objc_storeStrong((id *)&v9->_postscriptName, v8);
      goto LABEL_13;
    }
    v19 = v9->_postscriptName;
    v9->_postscriptName = 0;

    v20 = objc_opt_class();
    uint64_t v21 = [v8 substringFromIndex:[@"SystemRounded-" length]];
    [v20 _weightFromString:v21];
    v9->_weight = v22;

    v14 = (id *)&UIFontSystemFontDesignRounded;
  }
  objc_storeStrong((id *)&v9->_fontDesignTrait, *v14);
  *(unsigned char *)&v9->_specified |= 1u;
LABEL_13:
  v9->_double tracking = tracking;
LABEL_14:
  v23 = [(TUIFontSpec *)v9 _resolvedFontSpecWithTraitCollection:v6];

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NSString *)self->_postscriptName hash] ^ (unint64_t)self->_pointSize ^ (unint64_t)self->_tracking ^ (unint64_t)self->_leading ^ (unint64_t)self->_additionalLeading ^ self->_caps ^ (unint64_t)self->_weight;
  uint64_t v4 = *((unsigned __int8 *)&self->_specified + 1);
  unint64_t v5 = v4 ^ (unint64_t)[(UIColor *)self->_foregroundColor hash];
  unint64_t v6 = v5 ^ [(NSString *)self->_fontFamilyName hash];
  unint64_t v7 = v6 ^ [(NSString *)self->_maxContentSize hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_fontDesignTrait hash];
  return v3 ^ v8 ^ [(NSString *)self->_textStyle hash] ^ (unint64_t)self->_minPointSize ^ (unint64_t)self->_maxPointSize ^ (unint64_t)(self->_scale * 1000.0);
}

- (double)pointSize
{
  return self->_pointSize;
}

- (double)leading
{
  return self->_leading;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    unint64_t v6 = v4;
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = v6;
  unint64_t v8 = v7;
  if (v7 == self) {
    goto LABEL_32;
  }
  if (!v7
    || self->_specified != v7->_specified
    || (postscriptName = self->_postscriptName, postscriptName != v8->_postscriptName)
    && !-[NSString isEqualToString:](postscriptName, "isEqualToString:")
    || self->_pointSize != v8->_pointSize
    || !TUICGFloatIsEqualFloatOrBothNaN(self->_tracking, v8->_tracking)
    || !TUICGFloatIsEqualFloatOrBothNaN(self->_leading, v8->_leading)
    || self->_additionalLeading != v8->_additionalLeading
    || self->_caps != v8->_caps
    || self->_weight != v8->_weight
    || *((unsigned __int8 *)&self->_specified + 1) != *((unsigned __int8 *)&v8->_specified + 1)
    || (foregroundColor = self->_foregroundColor, foregroundColor != v8->_foregroundColor)
    && !-[UIColor isEqual:](foregroundColor, "isEqual:")
    || self->_scale != v8->_scale
    || self->_minPointSize != v8->_minPointSize
    || self->_maxPointSize != v8->_maxPointSize
    || (textStyle = self->_textStyle, textStyle != v8->_textStyle)
    && !-[NSString isEqualToString:](textStyle, "isEqualToString:")
    || (minContentSize = self->_minContentSize, minContentSize != v8->_minContentSize)
    && !-[NSString isEqualToString:](minContentSize, "isEqualToString:")
    || (maxContentSize = self->_maxContentSize, maxContentSize != v8->_maxContentSize)
    && !-[NSString isEqualToString:](maxContentSize, "isEqualToString:")
    || (fontFamilyName = self->_fontFamilyName, fontFamilyName != v8->_fontFamilyName)
    && !-[NSString isEqualToString:](fontFamilyName, "isEqualToString:"))
  {
    unsigned __int8 v16 = 0;
    goto LABEL_33;
  }
  fontDesignTrait = self->_fontDesignTrait;
  if (fontDesignTrait == v8->_fontDesignTrait)
  {
LABEL_32:
    unsigned __int8 v16 = 1;
    goto LABEL_33;
  }
  unsigned __int8 v16 = -[NSString isEqualToString:](fontDesignTrait, "isEqualToString:");
LABEL_33:

  return v16;
}

+ (id)attributedStringWith:(id)a3 attributes:(id)a4
{
  return _[a4 attributedStringWithText:a3];
}

- (id)font
{
  unint64_t v3 = [(TUIFontSpec *)self fontAttributes];
  if (v3)
  {
    id v4 = +[UIFontDescriptor fontDescriptorWithFontAttributes:v3];
    uint64_t v5 = +[UIFont fontWithDescriptor:v4 size:self->_pointSize];

    if (!v5) {
      goto LABEL_15;
    }
  }
  else
  {
    if (*((unsigned char *)&self->_specified + 1))
    {
      uint64_t v6 = +[UIFont monospacedDigitSystemFontOfSize:self->_pointSize weight:self->_weight];
    }
    else
    {
      double pointSize = self->_pointSize;
      if (self->_postscriptName) {
        +[UIFont fontWithName:size:](UIFont, "fontWithName:size:", pointSize);
      }
      else {
      uint64_t v6 = +[UIFont systemFontOfSize:pointSize weight:self->_weight];
      }
    }
    uint64_t v5 = (void *)v6;
    if (!v6) {
      goto LABEL_15;
    }
  }
  if (self->_caps == 3)
  {
    unint64_t v8 = [v5 fontDescriptor];
    v21[0] = kCTFontFeatureTypeIdentifierKey;
    v21[1] = kCTFontFeatureSelectorIdentifierKey;
    v22[0] = &off_2682D0;
    v22[1] = &off_2682D0;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    v23[0] = v9;
    CFStringRef v19 = kCTFontOpenTypeFeatureTag;
    CFStringRef v20 = @"smcp";
    v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v23[1] = v10;
    v11 = +[NSArray arrayWithObjects:v23 count:2];

    id v12 = [v8 fontAttributes];
    id v13 = [v12 mutableCopy];

    [v13 setObject:v11 forKeyedSubscript:UIFontDescriptorFeatureSettingsAttribute];
    v14 = +[UIFontDescriptor fontDescriptorWithFontAttributes:v13];
    v15 = +[UIFont fontWithDescriptor:v14 size:self->_pointSize];
    unsigned __int8 v16 = v15;
    if (v15)
    {
      id v17 = v15;

      uint64_t v5 = v17;
    }
  }
LABEL_15:

  return v5;
}

- (id)attributesForAttributedString
{
  return [(TUIFontSpec *)self attributesForAttributedStringCentered:0 truncated:0 ignoreLeading:0 lineSpacing:NAN];
}

- (id)attributesForAttributedStringCentered:(BOOL)a3 truncated:(BOOL)a4
{
  return [(TUIFontSpec *)self attributesForAttributedStringCentered:a3 truncated:a4 ignoreLeading:0 lineSpacing:NAN];
}

- (id)attributesForAttributedStringCentered:(BOOL)a3 truncated:(BOOL)a4 ignoreLeading:(BOOL)a5
{
  return [(TUIFontSpec *)self attributesForAttributedStringCentered:a3 truncated:a4 ignoreLeading:a5 lineSpacing:NAN];
}

- (id)attributesForAttributedStringCentered:(BOOL)a3 truncated:(BOOL)a4 ignoreLeading:(BOOL)a5 lineSpacing:(double)a6
{
  BOOL v8 = a4;
  BOOL v9 = a3;
  v11 = [(TUIFontSpec *)self font];
  if (v11)
  {
    id v12 = +[NSParagraphStyle defaultParagraphStyle];
    id v13 = [v12 mutableCopy];

    [(TUIFontSpec *)self leading];
    if (!a5)
    {
      double v15 = v14;
      if (v14 != 0.0)
      {
        [v13 setMinimumLineHeight:v14];
        [v13 setMaximumLineHeight:v15];
      }
    }
    if (v9) {
      [v13 setAlignment:1];
    }
    if (v8) {
      [v13 setLineBreakMode:4];
    }
    [v13 setLineSpacing:a6];
    v26[0] = v11;
    v25[0] = NSFontAttributeName;
    v25[1] = NSParagraphStyleAttributeName;
    id v16 = [v13 copy];
    v26[1] = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    double v18 = +[NSMutableDictionary dictionaryWithDictionary:v17];

    CFStringRef v19 = [(TUIFontSpec *)self foregroundColor];

    if (v19)
    {
      CFStringRef v20 = [(TUIFontSpec *)self foregroundColor];
      [v18 setObject:v20 forKeyedSubscript:NSForegroundColorAttributeName];
    }
    double v21 = self->_tracking * self->_pointSize / 1000.0;
    *(float *)&double v21 = v21;
    double v22 = +[NSNumber numberWithFloat:v21];
    [v18 setObject:v22 forKeyedSubscript:NSKernAttributeName];
  }
  else
  {
    double v18 = 0;
  }
  v23 = [[_TUIFontAttributes alloc] initWithAttributes:v18 caps:self->_caps];

  return v23;
}

+ (id)defaultFontSpec
{
  v2 = objc_alloc_init(TUIFontSpec);

  return v2;
}

- (TUIFontSpec)fontSpecWithFamily:(id)a3
{
  id v4 = (NSString *)a3;
  uint64_t v5 = [[TUIFontSpec alloc] initWithOther:self];
  postscriptName = v5->_postscriptName;
  v5->_postscriptName = 0;

  fontFamilyName = v5->_fontFamilyName;
  v5->_fontFamilyName = v4;
  BOOL v8 = v4;

  fontDesignTrait = v5->_fontDesignTrait;
  v5->_fontDesignTrait = 0;

  return v5;
}

- (TUIFontSpec)fontSpecWithDesign:(id)a3
{
  id v4 = (NSString *)a3;
  uint64_t v5 = [[TUIFontSpec alloc] initWithOther:self];
  postscriptName = v5->_postscriptName;
  v5->_postscriptName = 0;

  fontFamilyName = v5->_fontFamilyName;
  v5->_fontFamilyName = 0;

  fontDesignTrait = v5->_fontDesignTrait;
  v5->_fontDesignTrait = v4;

  return v5;
}

- (TUIFontSpec)fontSpecWithPointSize:(double)a3
{
  id v4 = [[TUIFontSpec alloc] initWithOther:self];
  v4->_double pointSize = a3;
  *(unsigned char *)&v4->_specified |= 2u;

  return v4;
}

- (TUIFontSpec)fontSpecWithTextStyle:(id)a3
{
  id v4 = (NSString *)a3;
  uint64_t v5 = [[TUIFontSpec alloc] initWithOther:self];
  textStyle = v5->_textStyle;
  v5->_textStyle = v4;

  *(unsigned char *)&v5->_specified |= 2u;

  return v5;
}

- (TUIFontSpec)fontSpecWithMinContentSize:(id)a3
{
  id v4 = (NSString *)a3;
  uint64_t v5 = [[TUIFontSpec alloc] initWithOther:self];
  minContentSize = v5->_minContentSize;
  v5->_minContentSize = v4;

  *(unsigned char *)&v5->_specified |= 2u;

  return v5;
}

- (TUIFontSpec)fontSpecWithMinPointSize:(double)a3
{
  id v4 = [[TUIFontSpec alloc] initWithOther:self];
  v4->_minPointSize = a3;
  *(unsigned char *)&v4->_specified |= 2u;

  return v4;
}

- (TUIFontSpec)fontSpecWithMaxContentSize:(id)a3
{
  id v4 = (NSString *)a3;
  uint64_t v5 = [[TUIFontSpec alloc] initWithOther:self];
  maxContentSize = v5->_maxContentSize;
  v5->_maxContentSize = v4;

  *(unsigned char *)&v5->_specified |= 2u;

  return v5;
}

- (TUIFontSpec)fontSpecWithMaxPointSize:(double)a3
{
  id v4 = [[TUIFontSpec alloc] initWithOther:self];
  v4->_maxPointSize = a3;
  *(unsigned char *)&v4->_specified |= 2u;

  return v4;
}

- (TUIFontSpec)fontSpecWithLeading:(double)a3
{
  id v4 = [[TUIFontSpec alloc] initWithOther:self];
  v4->_leading = a3;

  return v4;
}

- (TUIFontSpec)fontSpecWithAdditionalLeading:(double)a3
{
  id v4 = [[TUIFontSpec alloc] initWithOther:self];
  v4->_additionalLeading = a3;

  return v4;
}

- (TUIFontSpec)fontSpecWithWeight:(double)a3
{
  id v4 = [[TUIFontSpec alloc] initWithOther:self];
  v4->_weight = a3;
  *(unsigned char *)&v4->_specified |= 1u;

  return v4;
}

- (TUIFontSpec)fontSpecWithCaps:(unint64_t)a3
{
  id v4 = [[TUIFontSpec alloc] initWithOther:self];
  v4->_caps = a3;

  return v4;
}

- (TUIFontSpec)fontSpecWithColor:(id)a3
{
  id v4 = (UIColor *)a3;
  uint64_t v5 = [[TUIFontSpec alloc] initWithOther:self];
  foregroundColor = v5->_foregroundColor;
  v5->_foregroundColor = v4;

  return v5;
}

- (TUIFontSpec)fontSpecWithTracking:(double)a3
{
  id v4 = [[TUIFontSpec alloc] initWithOther:self];
  v4->_double tracking = a3;

  return v4;
}

- (TUIFontSpec)fontSpecWithMonospacedDigits:(BOOL)a3
{
  if (*((unsigned char *)&self->_specified + 1) == a3)
  {
    unint64_t v3 = self;
  }
  else
  {
    unint64_t v3 = [[TUIFontSpec alloc] initWithOther:self];
    *((unsigned char *)&v3->_specified + 1) = a3;
    *(unsigned char *)&v3->_specified |= 4u;
  }

  return v3;
}

- (NSDictionary)fontAttributes
{
  if (self->_postscriptName)
  {
    v2 = 0;
    goto LABEL_19;
  }
  v2 = objc_opt_new();
  if ((*(unsigned char *)&self->_specified & 1) == 0)
  {
    p_fontDesignTrait = &self->_fontDesignTrait;
    if (!self->_fontDesignTrait)
    {
      uint64_t v5 = 0;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = +[NSNumber numberWithDouble:self->_weight];
  [v5 setObject:v6 forKeyedSubscript:kCTFontWeightTrait];

  p_fontDesignTrait = &self->_fontDesignTrait;
  fontDesignTrait = self->_fontDesignTrait;
  if (fontDesignTrait)
  {
    if (v5)
    {
LABEL_9:
      CFStringRef v8 = (CFStringRef)kCTFontUIFontDesignTrait;
      BOOL v9 = v5;
LABEL_12:
      [v9 setObject:fontDesignTrait forKeyedSubscript:v8];
      goto LABEL_13;
    }
LABEL_8:
    uint64_t v5 = objc_opt_new();
    fontDesignTrait = *p_fontDesignTrait;
    goto LABEL_9;
  }
LABEL_10:
  fontDesignTrait = self->_fontFamilyName;
  if (fontDesignTrait)
  {
    CFStringRef v8 = kCTFontFamilyNameAttribute;
    BOOL v9 = v2;
    goto LABEL_12;
  }
LABEL_13:
  if (v5) {
    [v2 setObject:v5 forKeyedSubscript:kCTFontTraitsAttribute];
  }
  if (*((unsigned char *)&self->_specified + 1) && (*(unsigned char *)&self->_specified & 4) != 0)
  {
    v13[0] = UIFontFeatureTypeIdentifierKey;
    v13[1] = UIFontFeatureSelectorIdentifierKey;
    v14[0] = &off_2682E8;
    v14[1] = &off_268300;
    v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    double v15 = v10;
    v11 = +[NSArray arrayWithObjects:&v15 count:1];
    [v2 setObject:v11 forKeyedSubscript:UIFontDescriptorFeatureSettingsAttribute];
  }
LABEL_19:

  return (NSDictionary *)v2;
}

- (id)_resolvedFontSpecWithTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = v5;
  textStyle = v5->_textStyle;
  if (textStyle)
  {
    double minPointSize = v5->_minPointSize;
    double maxPointSize = v5->_maxPointSize;
    v10 = +[UIFont preferredFontForTextStyle:textStyle compatibleWithTraitCollection:v4];
    maxContentSize = v6->_maxContentSize;
    if (maxContentSize
      && ![(NSString *)maxContentSize isEqualToString:UIContentSizeCategoryUnspecified])
    {
      id v12 = v6->_textStyle;
      id v13 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v6->_maxContentSize];
      double v14 = +[UIFont preferredFontForTextStyle:v12 compatibleWithTraitCollection:v13];

      [v14 pointSize];
      if (maxPointSize >= v15 || maxPointSize <= 0.0) {
        double maxPointSize = v15;
      }
    }
    minContentSize = v6->_minContentSize;
    if (minContentSize
      && ![(NSString *)minContentSize isEqualToString:UIContentSizeCategoryUnspecified])
    {
      double v18 = v6->_textStyle;
      CFStringRef v19 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v6->_minContentSize];
      CFStringRef v20 = +[UIFont preferredFontForTextStyle:v18 compatibleWithTraitCollection:v19];

      [v20 pointSize];
      if (minPointSize >= v21) {
        double v22 = minPointSize;
      }
      else {
        double v22 = v21;
      }
      if (minPointSize <= 0.0) {
        double minPointSize = v21;
      }
      else {
        double minPointSize = v22;
      }
    }
    if (v6->_pointSize == 0.0)
    {
      [v10 pointSize];
      if (maxPointSize < v23 && maxPointSize > 0.0) {
        double v23 = maxPointSize;
      }
      if (minPointSize >= v23) {
        double v25 = minPointSize;
      }
      else {
        double v25 = v23;
      }
      if (minPointSize <= 0.0) {
        double v26 = v23;
      }
      else {
        double v26 = v25;
      }
      [v10 pointSize];
      if (v26 != v27)
      {
        uint64_t v28 = [v10 fontWithSize:v26];

        v10 = (void *)v28;
      }
    }
    v29 = v6->_textStyle;
    v30 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryLarge];
    v31 = +[UIFont preferredFontForTextStyle:v29 compatibleWithTraitCollection:v30];

    if (v4)
    {
      [v4 displayScale];
      double v33 = v32;
    }
    else
    {
      double v33 = 1.0;
    }
    if (v6->_pointSize != 0.0)
    {
      [v31 pointSize];
      if (v34 != 0.0)
      {
        double pointSize = v6->_pointSize;
        [v10 pointSize];
        double v37 = pointSize * v36;
        [v31 pointSize];
        double v39 = v37 / v38;
        if (maxPointSize < v39 && maxPointSize > 0.0) {
          double v39 = maxPointSize;
        }
        if (minPointSize >= v39) {
          double v41 = minPointSize;
        }
        else {
          double v41 = v39;
        }
        if (minPointSize > 0.0) {
          double v39 = v41;
        }
        double v42 = round(v33 * v39) / v33;
        uint64_t v43 = [v31 fontWithSize:v6->_pointSize];

        uint64_t v44 = [v10 fontWithSize:v42];

        v31 = (void *)v43;
        v10 = (void *)v44;
      }
    }
    [v31 _bodyLeading];
    if (v45 == 0.0)
    {
      double v48 = 1.0;
    }
    else
    {
      double v46 = v45;
      [v10 _bodyLeading];
      double v48 = v47 / v46;
    }
    double leading = v6->_leading;
    double additionalLeading = v6->_additionalLeading;
    if (additionalLeading != 0.0 && leading == 0.0)
    {
      [v31 _bodyLeading];
      double additionalLeading = v6->_additionalLeading;
    }
    double v51 = round(v33 * (v48 * (leading + additionalLeading))) / v33;
    [v10 pointSize];
    double v53 = v52;
    if (v52 != v6->_pointSize || v51 != v6->_leading || v48 != v6->_scale)
    {
      v54 = [[TUIFontSpec alloc] initWithOther:v6];

      v54->_double pointSize = v53;
      v54->_scale = v48;
      v54->_double leading = v51;
      *(unsigned char *)&v54->_specified |= 2u;
      uint64_t v6 = v54;
    }
  }

  return v6;
}

- (BOOL)isWeightSpecified
{
  return *(unsigned char *)&self->_specified & 1;
}

- (BOOL)isPointSizeSpecified
{
  return (*(unsigned char *)&self->_specified >> 1) & 1;
}

- (BOOL)isMonospacedDigitsSpecified
{
  return (*(unsigned char *)&self->_specified >> 2) & 1;
}

- (double)scale
{
  return self->_scale;
}

- (NSString)postscriptName
{
  return self->_postscriptName;
}

- (NSString)fontDesignTrait
{
  return self->_fontDesignTrait;
}

- (NSString)fontFamilyName
{
  return self->_fontFamilyName;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (BOOL)monospacedDigits
{
  return *((unsigned char *)&self->_specified + 1);
}

- (unint64_t)caps
{
  return self->_caps;
}

- (double)weight
{
  return self->_weight;
}

- (double)tracking
{
  return self->_tracking;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_fontFamilyName, 0);
  objc_storeStrong((id *)&self->_fontDesignTrait, 0);
  objc_storeStrong((id *)&self->_postscriptName, 0);
  objc_storeStrong((id *)&self->_maxContentSize, 0);

  objc_storeStrong((id *)&self->_minContentSize, 0);
}

@end