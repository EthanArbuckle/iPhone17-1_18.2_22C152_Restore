@interface UIFont
+ (BOOL)_isSupportedDynamicFontTextStyle:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (CGFloat)buttonFontSize;
+ (CGFloat)labelFontSize;
+ (CGFloat)smallSystemFontSize;
+ (CGFloat)systemFontSize;
+ (NSArray)familyNames;
+ (NSArray)fontNamesForFamilyName:(NSString *)familyName;
+ (UIFont)boldSystemFontOfSize:(CGFloat)fontSize;
+ (UIFont)fontWithDescriptor:(UIFontDescriptor *)descriptor size:(CGFloat)pointSize;
+ (UIFont)fontWithMarkupDescription:(id)a3;
+ (UIFont)fontWithName:(NSString *)fontName size:(CGFloat)fontSize;
+ (UIFont)fontWithName:(id)a3 size:(double)a4 traits:(int)a5;
+ (UIFont)italicSystemFontOfSize:(CGFloat)fontSize;
+ (UIFont)monospacedDigitSystemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight;
+ (UIFont)monospacedSystemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight;
+ (UIFont)preferredFontForTextStyle:(UIFontTextStyle)style;
+ (UIFont)preferredFontForTextStyle:(UIFontTextStyle)style compatibleWithTraitCollection:(UITraitCollection *)traitCollection;
+ (UIFont)systemFontOfSize:(CGFloat)fontSize;
+ (UIFont)systemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight;
+ (UIFont)systemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight width:(UIFontWidth)width;
+ (double)_pointSize:(double)a3 scaledLikeTextStyle:(id)a4 maximumPointSize:(double)a5 compatibleWithTraitCollection:(id)a6;
+ (double)_pointSize:(double)a3 scaledLikeTextStyle:(id)a4 maximumPointSize:(double)a5 compatibleWithTraitCollection:(id)a6 roundSize:(BOOL)a7;
+ (double)_readableWidth;
+ (id)_fontWithDescriptor:(id)a3 size:(double)a4 textStyleForScaling:(id)a5 pointSizeForScaling:(double)a6 maximumPointSizeAfterScaling:(double)a7 forIB:(BOOL)a8 legibilityWeight:(int64_t)a9;
+ (id)_fontWithName:(id)a3 size:(double)a4;
+ (id)_lightSystemFontOfSize:(double)a3;
+ (id)_opticalBoldSystemFontOfSize:(double)a3;
+ (id)_opticalSystemFontOfSize:(double)a3;
+ (id)_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4;
+ (id)_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 design:(id)a5 weight:(double)a6;
+ (id)_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 weight:(double)a5;
+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5;
+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 compatibleWithTraitCollection:(id)a6;
+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 maximumContentSizeCategory:(id)a6 compatibleWithTraitCollection:(id)a7;
+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 weight:(double)a6 maximumContentSizeCategory:(id)a7 compatibleWithTraitCollection:(id)a8;
+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 weight:(id)a6 maximumContentSizeCategory:(id)a7 compatibleWithTraitCollection:(id)a8 pointSize:(double)a9 pointSizeForScaling:(double)a10;
+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 weight:(double)a5;
+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 weight:(double)a5 maximumContentSizeCategory:(id)a6 compatibleWithTraitCollection:(id)a7;
+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 weight:(id)a5 symbolicTraits:(unsigned int)a6 maximumContentSizeCategory:(id)a7 compatibleWithTraitCollection:(id)a8 pointSize:(double)a9 pointSizeForScaling:(double)a10;
+ (id)_preferredFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4;
+ (id)_preferredFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4 compatibleWithTraitCollection:(id)a5;
+ (id)_preferredFontForTextStyle:(id)a3 maximumPointSize:(double)a4 compatibleWithTraitCollection:(id)a5;
+ (id)_preferredFontForTextStyle:(id)a3 variant:(int64_t)a4;
+ (id)_preferredFontForTextStyle:(id)a3 variant:(int64_t)a4 maximumContentSizeCategory:(id)a5;
+ (id)_preferredFontForTextStyle:(id)a3 weight:(double)a4;
+ (id)_sharedFontCache;
+ (id)_sharedZeroPointFont;
+ (id)_supportedDynamicFontStyles;
+ (id)_systemFontOfSize:(double)a3 width:(id)a4 traits:(int)a5;
+ (id)_systemFontsOfSize:(double)a3 traits:(int)a4;
+ (id)_thinSystemFontOfSize:(double)a3;
+ (id)_ultraLightSystemFontOfSize:(double)a3;
+ (id)classFallbacksForKeyedArchiver;
+ (id)defaultFontForTextStyle:(id)a3;
+ (id)ib_preferredFontForTextStyle:(id)a3;
+ (id)preferredFontForUsage:(id)a3;
+ (id)preferredFontForUsage:(id)a3 contentSizeCategoryName:(id)a4;
+ (id)systemFontOfSize:(double)a3 traits:(int)a4;
+ (id)systemFontOfSize:(double)a3 weight:(double)a4 design:(id)a5;
+ (void)_evictAllItemsFromFontAndFontDescriptorCaches;
+ (void)_setButtonFontSize:(double)a3;
+ (void)_setLabelFontSize:(double)a3;
+ (void)_setSmallSystemFontSize:(double)a3;
+ (void)_setSystemFontSize:(double)a3;
- (BOOL)__isSystemFont;
- (BOOL)_getLatin1Glyphs:(const unsigned __int16 *)a3 advanceWidths:(const double *)a4;
- (BOOL)_hasColorGlyphs;
- (BOOL)_isHiraginoFont;
- (BOOL)_isUIFont;
- (BOOL)isFixedPitch;
- (BOOL)isIBFontMetricsScaledFont;
- (BOOL)isIBTextStyleFont;
- (BOOL)isSystemFont;
- (CGAffineTransform)_textMatrixTransformForContext:(SEL)a3;
- (CGFloat)ascender;
- (CGFloat)descender;
- (CGFloat)leading;
- (CGFloat)lineHeight;
- (CGFont)_backingCGSFont;
- (CGSize)advancementForGlyph:(unsigned __int16)a3;
- (Class)classForCoder;
- (NSString)familyName;
- (NSString)fontName;
- (NSString)textStyleForScaling;
- (UIFont)fontWithSize:(CGFloat)fontSize;
- (UIFont)init;
- (UIFont)initWithCoder:(id)a3;
- (UIFont)initWithFamilyName:(id)a3 traits:(int)a4 size:(double)a5;
- (UIFont)initWithMarkupDescription:(id)a3;
- (UIFont)initWithName:(id)a3 size:(double)a4;
- (UIFontDescriptor)fontDescriptor;
- (double)_ascenderDeltaForBehavior:(int64_t)a3;
- (double)_baseLineHeightForFont:(BOOL)a3;
- (double)_bodyLeading;
- (double)_scaledValueForValue:(double)a3;
- (double)_scaledValueForValue:(double)a3 useLanguageAwareScaling:(BOOL)a4;
- (double)_totalAdvancementForNativeGlyphs:(const unsigned __int16 *)a3 count:(int64_t)a4;
- (double)maximumPointSizeAfterScaling;
- (double)pointSizeForScaling;
- (double)readableWidth;
- (double)underlinePosition;
- (id)_alternateSystemFonts;
- (id)_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:(id)a3;
- (id)_fontAdjustedForCurrentContentSizeCategory;
- (id)_fontScaledByScaleFactor:(double)a3;
- (id)_fontScaledLikeTextStyle:(id)a3 maximumPointSize:(double)a4 compatibleWithTraitCollection:(id)a5 forIB:(BOOL)a6;
- (id)_kernOverride;
- (id)_textStyle;
- (id)bestMatchingFontForCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4 attributes:(id)a5 actualCoveredLength:(unint64_t *)a6;
- (id)coveredCharacterSet;
- (id)description;
- (id)familyNameForCSSFontFamilyValueForWebKit:(BOOL)a3;
- (id)htmlMarkupDescription;
- (id)htmlMarkupDescriptionForWebKit:(BOOL)a3;
- (id)lastResortFont;
- (id)markupDescription;
- (id)markupDescriptionForWebKit:(BOOL)a3 pointSize:(float)a4 sizeUnit:(id)a5;
- (int)traits;
- (unint64_t)getCaretPositions:(double *)a3 forGlyph:(unsigned int)a4 maximumLength:(unint64_t)a5;
- (unint64_t)mostCompatibleStringEncoding;
- (unint64_t)renderingMode;
- (unsigned)_defaultGlyphForChar:(unsigned __int16)a3;
- (unsigned)glyphWithName:(id)a3;
- (unsigned)hyphenGlyphForLocale:(id)a3;
- (void)applyToGraphicsContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getAdvancements:(CGSize *)a3 forCGGlyphs:(const unsigned __int16 *)a4 count:(unint64_t)a5;
- (void)getBoundingRects:(CGRect *)a3 forCGGlyphs:(const unsigned __int16 *)a4 count:(unint64_t)a5;
- (void)getVerticalOriginTranslations:(CGSize *)a3 forCGGlyphs:(const unsigned __int16 *)a4 count:(unint64_t)a5;
- (void)setInContext:(CGContext *)a3;
@end

@implementation UIFont

+ (CGFloat)labelFontSize
{
  return *(double *)&__UILabelFontSize;
}

+ (id)_preferredFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4
{
  return (id)[a1 _preferredFontForTextStyle:a3 maximumContentSizeCategory:a4 compatibleWithTraitCollection:0];
}

+ (id)_fontWithDescriptor:(id)a3 size:(double)a4 textStyleForScaling:(id)a5 pointSizeForScaling:(double)a6 maximumPointSizeAfterScaling:(double)a7 forIB:(BOOL)a8 legibilityWeight:(int64_t)a9
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  BOOL v10 = a8;
  id v15 = a3;
  if (a8)
  {
    id v16 = 0;
LABEL_9:
    if (a9 != -1)
    {
      uint64_t v20 = *MEMORY[0x1E4F24590];
      v21 = (void *)[v15 objectForKey:*MEMORY[0x1E4F24590]];
      if (!v21 || [v21 unsignedIntegerValue] != a9)
      {
        uint64_t v27 = v20;
        v28[0] = [NSNumber numberWithLong:a9];
        id v15 = (id)objc_msgSend(v15, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1));
        if (!v15)
        {
          v26 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "UIFont *__UIUncachedFontWithDescriptor(UIFontDescriptor *, CGFloat)"), @"UIFont.m", 183, @"descriptor must not be nil!");
          id v15 = 0;
        }
      }
    }
    v22 = CTFontCreateWithFontDescriptor((CTFontDescriptorRef)v15, a4, 0);
    v19 = v22;
    if (!v10 && v22) {
      objc_msgSend(+[UIFont _sharedFontCache](UIFont, "_sharedFontCache"), "setObject:forKey:", v22, v16);
    }
    goto LABEL_17;
  }
  if (a9 == -1) {
    BOOL v18 = _AXSEnhanceTextLegibilityEnabled() != 0;
  }
  else {
    BOOL v18 = a9 == 1;
  }
  id v16 = +[_UIFontCacheKey newFontCacheKeyWithFontDescriptor:v15 pointSize:a5 textStyleForScaling:v18 pointSizeForScaling:a4 maximumPointSizeAfterScaling:a6 textLegibility:a7];
  v19 = (const __CTFont *)objc_msgSend(+[UIFont _sharedFontCache](UIFont, "_sharedFontCache"), "retainedObjectForKey:", v16);
  if (!v19) {
    goto LABEL_9;
  }
LABEL_17:

  uint64_t v23 = [a5 copy];
  *(void *)(__CTFontGetExtraData(v19) + 32) = v23;
  *(double *)(__CTFontGetExtraData(v19) + 40) = a6;
  *(double *)(__CTFontGetExtraData(v19) + 48) = a7;
  uint64_t ExtraData = __CTFontGetExtraData(v19);
  if (v10) {
    char v25 = 2;
  }
  else {
    char v25 = 0;
  }
  *(unsigned char *)(ExtraData + 24) = *(unsigned char *)(ExtraData + 24) & 0xFD | v25;
  return v19;
}

+ (id)_sharedFontCache
{
  if (_sharedFontCache_onceToken != -1) {
    dispatch_once(&_sharedFontCache_onceToken, &__block_literal_global_9);
  }
  return (id)_sharedFontCache___sharedFontCache;
}

- (CGFloat)lineHeight
{
  return *(double *)(__CTFontGetExtraData((const __CTFont *)self) + 16);
}

- (CGFloat)ascender
{
  return *(double *)(__CTFontGetExtraData((const __CTFont *)self) + 8);
}

- (BOOL)_getLatin1Glyphs:(const unsigned __int16 *)a3 advanceWidths:(const double *)a4
{
  return MEMORY[0x1F40DF520](self, a3, a4);
}

- (void)applyToGraphicsContext:(id)a3
{
  v4 = (CGContext *)[a3 CGContext];
  if (self) {
    [(UIFont *)self _textMatrixTransformForContext:0];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CGContextSetTextMatrix(v4, &v8);
  v5 = CTFontCopyGraphicsFont((CTFontRef)self, 0);
  if (v5)
  {
    v6 = v5;
    CGContextSetFont(v4, v5);
    CFRelease(v6);
    [(UIFont *)self pointSize];
    CGContextSetFontSize(v4, v7);
    CGContextSetFontRenderingStyle();
  }
  else
  {
    NSLog((NSString *)@"%s: CTFontCopyGraphicsFont returned NULL for font %p", "-[UIFont(UIFont_AttributedStringDrawing) applyToGraphicsContext:]", self);
  }
}

- (CGAffineTransform)_textMatrixTransformForContext:(SEL)a3
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CTFontGetMatrix(retstr, (CTFontRef)self);
  retstr->b = -retstr->b;
  retstr->d = -retstr->d;
  result = (CGAffineTransform *)[(UIFont *)self isVertical];
  if (result)
  {
    CGAffineTransformMakeRotation(&t2, -1.57079633);
    long long v7 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v9.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v9.c = v7;
    *(_OWORD *)&v9.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v11, &v9, &t2);
    long long v8 = *(_OWORD *)&v11.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  }
  return result;
}

- (id)coveredCharacterSet
{
  CFCharacterSetRef v2 = CTFontCopyCharacterSet((CTFontRef)self);
  v3 = (void *)CFMakeCollectable(v2);

  return v3;
}

- (void)getAdvancements:(CGSize *)a3 forCGGlyphs:(const unsigned __int16 *)a4 count:(unint64_t)a5
{
}

- (double)_totalAdvancementForNativeGlyphs:(const unsigned __int16 *)a3 count:(int64_t)a4
{
  CTFontGetTransformedAdvancesForGlyphsAndStyle();
  return result;
}

+ (UIFont)systemFontOfSize:(CGFloat)fontSize
{
  return (UIFont *)[a1 systemFontOfSize:0 traits:fontSize];
}

- (unint64_t)renderingMode
{
  return 1;
}

+ (id)_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4
{
  return (id)[a1 _preferredFontForTextStyle:a3 design:0 weight:0 symbolicTraits:*(void *)&a4 maximumContentSizeCategory:0 compatibleWithTraitCollection:0 pointSize:0.0 pointSizeForScaling:0.0];
}

- (CGFloat)descender
{
  return -CTFontGetDescent((CTFontRef)self);
}

- (UIFont)initWithCoder:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  [a3 decodeDoubleForKey:@"UIFontPointSize"];
  double v6 = v5;
  uint64_t v7 = [a3 decodeIntegerForKey:@"UIFontTraits"];
  uint64_t v8 = [a3 decodeBoolForKey:@"UIIBFontMetricsScaledFont"];
  uint64_t v9 = objc_opt_class();
  v28.receiver = self;
  v28.super_class = (Class)UIFont;

  if ([a3 containsValueForKey:@"UIIBTextStyle"])
  {
    BOOL v10 = +[UIFont ib_preferredFontForTextStyle:](UIFont, "ib_preferredFontForTextStyle:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"UIIBTextStyle"]);
    return v10;
  }
  if ([a3 containsValueForKey:@"UIFontDescriptor"])
  {
    double result = (UIFont *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"UIFontDescriptor"];
    if (result)
    {
      v12 = (UIFontDescriptor *)result;
      CFTypeID v13 = CFGetTypeID(result);
      if (v13 != CTFontDescriptorGetTypeID())
      {
        uint64_t v18 = [NSString stringWithFormat:@"-[%@ initWithCoder]: decoded an object %@ as CTFontDescriptor.", v9, v12];
        uint64_t v19 = *MEMORY[0x1E4F1D148];
        uint64_t v29 = *MEMORY[0x1E4F28568];
        v30[0] = v18;
        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v19, 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1)));
        return 0;
      }
      id v14 = [(UIFontDescriptor *)v12 objectForKey:@"NSCTFontUIUsageAttribute"];
      if (v14)
      {
        id v15 = v14;
        if (([v14 isEqualToString:*MEMORY[0x1E4F244D8]] & 1) != 0
          || [v15 isEqualToString:*MEMORY[0x1E4F244E0]])
        {
          uint64_t v16 = objc_msgSend(-[NSDictionary objectForKey:](-[UIFontDescriptor fontAttributes](v12, "fontAttributes"), "objectForKey:", @"NSCTFontTraitsAttribute"), "objectForKey:", @"NSCTFontProportionTrait");
          if (v6 != 0.0)
          {
            BOOL v10 = +[UIFont _systemFontOfSize:v16 width:v7 traits:v6];
            return v10;
          }
LABEL_15:
          BOOL v10 = +[UIFont _sharedZeroPointFont];
          return v10;
        }
        id v20 = [(NSDictionary *)[(UIFontDescriptor *)v12 fontAttributes] objectForKey:@"NSFontSizeAttribute"];
        if (v20)
        {
          [v20 doubleValue];
          double v6 = v21;
        }
        if (v6 == 0.0) {
          v12 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v15];
        }
      }
      uint64_t v22 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"UIFontTextStyleForScaling"];
      [a3 decodeDoubleForKey:@"UIFontPointSizeForScaling"];
      double v24 = v23;
      [a3 decodeDoubleForKey:@"UIFontMaximumPointSizeAfterScaling"];
      double v26 = v25;
      if (v8)
      {
        +[UIFont _pointSize:v22 scaledLikeTextStyle:0 maximumPointSize:v24 compatibleWithTraitCollection:v25];
        double v6 = v27;
      }
      BOOL v10 = +[UIFont _fontWithDescriptor:v12 size:v22 textStyleForScaling:v8 pointSizeForScaling:-1 maximumPointSizeAfterScaling:v6 forIB:v24 legibilityWeight:v26];
      return v10;
    }
  }
  else
  {
    if ([a3 decodeBoolForKey:@"UISystemFont"])
    {
      if (v6 != 0.0)
      {
        BOOL v10 = +[UIFont systemFontOfSize:v7 traits:v6];
        return v10;
      }
      goto LABEL_15;
    }
    v17 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"UIFontName"];
    double result = (UIFont *)[v17 length];
    if (result)
    {
      if ([a3 containsValueForKey:@"UIFontTraits"]) {
        BOOL v10 = +[UIFont fontWithName:v17 size:v7 traits:v6];
      }
      else {
        BOOL v10 = +[UIFont fontWithName:v17 size:v6];
      }
      return v10;
    }
  }
  return result;
}

+ (UIFont)fontWithDescriptor:(UIFontDescriptor *)descriptor size:(CGFloat)pointSize
{
  return (UIFont *)[a1 _fontWithDescriptor:descriptor size:0 textStyleForScaling:0 pointSizeForScaling:-1 maximumPointSizeAfterScaling:pointSize forIB:0.0 legibilityWeight:0.0];
}

- (UIFont)fontWithSize:(CGFloat)fontSize
{
  if (dyld_program_sdk_at_least())
  {
    double v5 = objc_opt_class();
    double v6 = [(UIFont *)self fontDescriptor];
    return (UIFont *)[v5 fontWithDescriptor:v6 size:fontSize];
  }
  else
  {
    BOOL v8 = [(UIFont *)self __isSystemFont];
    uint64_t v9 = objc_opt_class();
    if (v8)
    {
      uint64_t v10 = [(UIFont *)self traits];
      return (UIFont *)[v9 systemFontOfSize:v10 traits:fontSize];
    }
    else
    {
      CGAffineTransform v11 = [(UIFont *)self fontName];
      uint64_t v12 = [(UIFont *)self traits];
      return (UIFont *)[v9 fontWithName:v11 size:v12 traits:fontSize];
    }
  }
}

+ (id)_systemFontOfSize:(double)a3 width:(id)a4 traits:(int)a5
{
  CTFontRef v5 = UINewFont(0, *(uint64_t *)&a5, 0, (uint64_t)a4, 1, 0, a3, 0.0);

  return v5;
}

- (id)_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:(id)a3
{
  CTFontRef v5 = [(UIFont *)self fontDescriptor];
  if (a3) {
    uint64_t v6 = [a3 legibilityWeight];
  }
  else {
    uint64_t v6 = -1;
  }
  uint64_t v7 = [(UIFont *)self textStyleForScaling];
  if (!v7)
  {
    if (![(UIFont *)self _isTextStyleFont])
    {
LABEL_13:
      BOOL v12 = 0;
LABEL_16:
      uint64_t v7 = 0;
      goto LABEL_18;
    }
LABEL_10:
    [(UIFont *)self _textStyle];
    uint64_t v14 = *MEMORY[0x1E4F245F8];
    [(UIFontDescriptor *)v5 objectForKey:*MEMORY[0x1E4F245F8]];
    CTFontDescriptorGetTextStyleSize();
    double v16 = v15;
    [(UIFont *)self pointSize];
    if (v17 == v16)
    {
      uint64_t v18 = [(UIFontDescriptor *)v5 objectForKey:@"NSCTFontOpticalSizeAttribute"];
      if (!v7 && v18) {
        goto LABEL_13;
      }
    }
    else if (!v7)
    {
      goto LABEL_17;
    }
    BOOL v12 = [(UIFont *)self isIBTextStyleFont];
    +[UIFont _normalizedContentSizeCategory:default:](UIFont, "_normalizedContentSizeCategory:default:", [a3 preferredContentSizeCategory], 0);
    uint64_t ContentSizeCategoryIndex = CTFontDescriptorGetContentSizeCategoryIndex();
    if (CTFontDescriptorGetContentSizeCategoryIndex() != ContentSizeCategoryIndex)
    {
      [NSNumber numberWithUnsignedInt:ContentSizeCategoryIndex];
      CTFontDescriptorGetTextStyleSize();
      double v23 = v22;
      double v24 = (void *)[(NSDictionary *)[(UIFontDescriptor *)v5 fontAttributes] mutableCopy];
      objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", ContentSizeCategoryIndex), v14);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v23), @"NSFontSizeAttribute");
      [v24 removeObjectForKey:*MEMORY[0x1E4F24590]];
      CTFontRef v5 = +[UIFontDescriptor fontDescriptorWithFontAttributes:v24];

      [(UIFont *)self pointSizeForScaling];
      double v9 = v25;
      [(UIFont *)self maximumPointSizeAfterScaling];
      double v11 = v26;
      uint64_t v7 = 0;
LABEL_24:
      double v13 = 0.0;
      goto LABEL_25;
    }
    goto LABEL_16;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0 && [(UIFont *)self _isTextStyleFont]) {
    goto LABEL_10;
  }
  if (![(id)objc_opt_class() _isSupportedDynamicFontTextStyle:v7])
  {
LABEL_17:
    BOOL v12 = 0;
LABEL_18:
    if (v6 == -1) {
      return self;
    }
    if (![(UIFont *)self __isSystemFont]) {
      return self;
    }
    id v20 = [(UIFontDescriptor *)v5 objectForKey:*MEMORY[0x1E4F24590]];
    if (objc_msgSend(v20, "isEqual:", objc_msgSend(NSNumber, "numberWithLong:", v6))) {
      return self;
    }
    [(UIFont *)self pointSizeForScaling];
    double v9 = v27;
    [(UIFont *)self maximumPointSizeAfterScaling];
    double v11 = v28;
    goto LABEL_24;
  }
  [(UIFont *)self pointSizeForScaling];
  double v9 = v8;
  [(UIFont *)self maximumPointSizeAfterScaling];
  double v11 = v10;
  BOOL v12 = [(UIFont *)self isIBFontMetricsScaledFont];
  [(id)objc_opt_class() _pointSize:v7 scaledLikeTextStyle:a3 maximumPointSize:v9 compatibleWithTraitCollection:v11];
LABEL_25:

  return +[UIFont _fontWithDescriptor:v5 size:v7 textStyleForScaling:v12 pointSizeForScaling:v6 maximumPointSizeAfterScaling:v13 forIB:v9 legibilityWeight:v11];
}

- (UIFontDescriptor)fontDescriptor
{
  CTFontDescriptorRef v2 = CTFontCopyFontDescriptor((CTFontRef)self);

  return (UIFontDescriptor *)v2;
}

- (NSString)textStyleForScaling
{
  return *(NSString **)(__CTFontGetExtraData((const __CTFont *)self) + 32);
}

- (id)_textStyle
{
  return (id)MEMORY[0x1F40DF570](self, a2);
}

- (BOOL)__isSystemFont
{
  return *(unsigned char *)(__CTFontGetExtraData((const __CTFont *)self) + 24) & 1;
}

- (BOOL)isIBTextStyleFont
{
  return (*(unsigned char *)(__CTFontGetExtraData((const __CTFont *)self) + 24) & 2) != 0
      && *(void *)(__CTFontGetExtraData((const __CTFont *)self) + 32) == 0;
}

+ (BOOL)_isSupportedDynamicFontTextStyle:(id)a3
{
  if (dyld_program_sdk_at_least())
  {
    return CTFontDescriptorCanCreateWithTextStyle();
  }
  else
  {
    uint64_t v6 = (void *)[a1 _supportedDynamicFontStyles];
    return [v6 containsObject:a3];
  }
}

+ (UIFont)systemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight width:(UIFontWidth)width
{
  if (width == 0.0) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [NSNumber numberWithDouble:width];
  }
  CTFontRef v8 = UINewFont(0, 0, @"NSCTFontUIFontDesignDefault", v7, 1, 0, fontSize, weight);

  return (UIFont *)v8;
}

+ (UIFont)systemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight
{
  CTFontRef v4 = UINewFont(0, 0, @"NSCTFontUIFontDesignDefault", 0, 1, 0, fontSize, weight);

  return (UIFont *)v4;
}

+ (id)systemFontOfSize:(double)a3 traits:(int)a4
{
  CTFontRef v4 = UINewFont(0, *(uint64_t *)&a4, 0, 0, 1, 0, a3, 0.0);

  return v4;
}

- (double)pointSizeForScaling
{
  return *(double *)(__CTFontGetExtraData((const __CTFont *)self) + 40);
}

- (double)maximumPointSizeAfterScaling
{
  return *(double *)(__CTFontGetExtraData((const __CTFont *)self) + 48);
}

- (BOOL)isIBFontMetricsScaledFont
{
  return (*(unsigned char *)(__CTFontGetExtraData((const __CTFont *)self) + 24) & 2) != 0
      && *(void *)(__CTFontGetExtraData((const __CTFont *)self) + 32) != 0;
}

+ (UIFont)boldSystemFontOfSize:(CGFloat)fontSize
{
  return (UIFont *)[a1 systemFontOfSize:2 traits:fontSize];
}

- (id)_fontAdjustedForCurrentContentSizeCategory
{
  return [(UIFont *)self _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:0];
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 weight:(double)a6 maximumContentSizeCategory:(id)a7 compatibleWithTraitCollection:(id)a8
{
  uint64_t v14 = [NSNumber numberWithDouble:a6];

  return (id)[a1 _preferredFontForTextStyle:a3 design:a4 variant:a5 weight:v14 maximumContentSizeCategory:a7 compatibleWithTraitCollection:a8 pointSize:0.0 pointSizeForScaling:0.0];
}

+ (double)_readableWidth
{
  double result = *(double *)&_readableWidth_cachedReadableWidth;
  if (*(double *)&_readableWidth_cachedReadableWidth == 0.0)
  {
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = 3221225472;
    uint64_t v6 = __24__UIFont__readableWidth__block_invoke;
    uint64_t v7 = &unk_1E55C7AB0;
    id v8 = a1;
    SEL v9 = a2;
    if (_readableWidth_onceToken != -1) {
      dispatch_once(&_readableWidth_onceToken, &v4);
    }
    objc_msgSend((id)objc_msgSend(a1, "preferredFontForTextStyle:", *MEMORY[0x1E4F24808], v4, v5, v6, v7, v8, v9), "readableWidth");
    _readableWidth_cachedReadableWidth = *(void *)&result;
  }
  return result;
}

+ (UIFont)preferredFontForTextStyle:(UIFontTextStyle)style
{
  return (UIFont *)__UIFontForTextStyle((const __CTFont *)style, 0, -1, 0, 0);
}

- (double)readableWidth
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id AssociatedObject = objc_getAssociatedObject(self, &readableWidth_readableWidthKey);
  if (AssociatedObject)
  {
    [AssociatedObject doubleValue];
  }
  else
  {
    memset_pattern16(__b, aMmmmmmmm, 0x5CuLL);
    uint64_t v5 = [NSString stringWithCharacters:__b length:46];
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v10 = @"NSFont";
    double v11 = self;
    uint64_t v7 = CTLineCreateWithAttributedString((CFAttributedStringRef)(id)objc_msgSend(v6, "initWithString:attributes:", v5, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)));
    if (!v7) {
      return 0.0;
    }
    id v8 = v7;
    double TypographicBounds = CTLineGetTypographicBounds(v7, 0, 0, 0);
    CFRelease(v8);
    if (TypographicBounds > 0.0) {
      objc_setAssociatedObject(self, &readableWidth_readableWidthKey, (id)[NSNumber numberWithDouble:TypographicBounds], (void *)3);
    }
    return TypographicBounds;
  }
  return result;
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 weight:(id)a5 symbolicTraits:(unsigned int)a6 maximumContentSizeCategory:(id)a7 compatibleWithTraitCollection:(id)a8 pointSize:(double)a9 pointSizeForScaling:(double)a10
{
  uint64_t v14 = *(void *)&a6;
  if (a8) {
    uint64_t v19 = [a8 legibilityWeight];
  }
  else {
    uint64_t v19 = -1;
  }
  id v20 = (void *)__UIFontDescriptorWithTextStyle((uint64_t)a3, [a8 preferredContentSizeCategory], 0, v14, (uint64_t)a4, (uint64_t)a5, v19);
  if (a7)
  {
    if (([a7 isEqualToString:getUIContentSizeCategoryUnspecified()] & 1) == 0)
    {
      double v21 = (void *)__UIFontDescriptorWithTextStyle((uint64_t)a3, (uint64_t)a7, 0, 0, 0, 0, v19);
      [v21 pointSize];
      double v23 = v22;
      [v20 pointSize];
      if (v23 < v24)
      {
        [v21 pointSize];
        id v20 = objc_msgSend(v20, "fontDescriptorWithSize:");
      }
    }
  }

  return (id)[a1 _fontWithDescriptor:v20 size:0 textStyleForScaling:0 pointSizeForScaling:v19 maximumPointSizeAfterScaling:a9 forIB:a10 legibilityWeight:0.0];
}

- (id)_fontScaledLikeTextStyle:(id)a3 maximumPointSize:(double)a4 compatibleWithTraitCollection:(id)a5 forIB:(BOOL)a6
{
  BOOL v6 = a6;
  if ((dyld_program_sdk_at_least() & 1) == 0 && [(UIFont *)self _isTextStyleFont])
  {
    [(UIFont *)self maximumPointSizeAfterScaling];
    if (v11 <= 0.0)
    {
      BOOL v12 = objc_opt_class();
      id v13 = [(UIFont *)self _textStyle];
      return (id)[v12 _preferredFontForTextStyle:v13 maximumPointSize:a5 compatibleWithTraitCollection:a4];
    }
LABEL_8:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"A scaled font returned by UIFontMetrics should not be used to create another scaled font.", 0), "raise");
    return 0;
  }
  if ([(UIFont *)self textStyleForScaling]) {
    goto LABEL_8;
  }
  double v15 = [(UIFont *)self fontDescriptor];
  double v16 = objc_opt_class();
  [(UIFont *)self pointSize];
  objc_msgSend(v16, "_pointSize:scaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:", a3, a5);
  double v18 = v17;
  [(UIFont *)self pointSize];
  double v20 = v19;
  if (a5) {
    uint64_t v21 = [a5 legibilityWeight];
  }
  else {
    uint64_t v21 = -1;
  }

  return +[UIFont _fontWithDescriptor:v15 size:a3 textStyleForScaling:v6 pointSizeForScaling:v21 maximumPointSizeAfterScaling:v18 forIB:v20 legibilityWeight:a4];
}

+ (double)_pointSize:(double)a3 scaledLikeTextStyle:(id)a4 maximumPointSize:(double)a5 compatibleWithTraitCollection:(id)a6 roundSize:(BOOL)a7
{
  BOOL v7 = a7;
  [+[UIFont preferredFontForTextStyle:a4 compatibleWithTraitCollection:a6] _scaledValueForValue:a3];
  double v10 = round(result);
  if (v7) {
    double result = v10;
  }
  if (result >= a5) {
    double v11 = a5;
  }
  else {
    double v11 = result;
  }
  if (a5 > 0.0) {
    return v11;
  }
  return result;
}

+ (UIFont)preferredFontForTextStyle:(UIFontTextStyle)style compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  BOOL v6 = [(UITraitCollection *)traitCollection preferredContentSizeCategory];
  UILegibilityWeight v7 = [(UITraitCollection *)traitCollection legibilityWeight];

  return (UIFont *)__UIFontForTextStyle((const __CTFont *)style, (uint64_t)v6, v7, 0, 0);
}

- (double)_scaledValueForValue:(double)a3 useLanguageAwareScaling:(BOOL)a4
{
  BOOL v4 = a4;
  UILegibilityWeight v7 = [(UIFont *)self _textStyle];
  if (v7)
  {
    id v8 = v7;
    if (_scaledValueForValue_useLanguageAwareScaling__onceToken != -1) {
      dispatch_once(&_scaledValueForValue_useLanguageAwareScaling__onceToken, &__block_literal_global_108);
    }
    os_unfair_lock_lock_with_options();
    double v17 = 0.0;
    int HasExuberatedLineHeight = CTFontHasExuberatedLineHeight();
    double v10 = &_scaledValueForValue_useLanguageAwareScaling____textStyleLanguageAwareBodyLeadingCache;
    if ((v4 & HasExuberatedLineHeight) == 0) {
      double v10 = &_scaledValueForValue_useLanguageAwareScaling____textStyleBodyLeadingCache;
    }
    id v11 = (id)*v10;
    BOOL v12 = (void *)[(id)*v10 objectForKey:v8];
    if (v12)
    {
      [v12 doubleValue];
      double v17 = v13;
    }
    else
    {
      if ([(UIFont *)self _isTextStyleFont] && v4 | HasExuberatedLineHeight ^ 1)
      {
        CTFontDescriptorGetTextStyleSize();
        double v14 = 0.0;
      }
      else
      {
        [(__CTFont *)__UIFontForTextStyle(v8, 0, -1, 1, 0) _bodyLeading];
        double v17 = v14;
      }
      objc_msgSend(v11, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v14), v8);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__UIFontTextStyleBodyLeadingCacheLock);
    if (v17 != 0.0)
    {
      [(UIFont *)self _bodyLeading];
      return v15 * a3 / v17;
    }
  }
  return a3;
}

- (double)_bodyLeading
{
  [(UIFont *)self lineHeight];
  return v3 + CTFontGetLeading((CTFontRef)self);
}

+ (id)_preferredFontForTextStyle:(id)a3 maximumPointSize:(double)a4 compatibleWithTraitCollection:(id)a5
{
  if (a4 <= 0.0)
  {
    return +[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", a3);
  }
  else
  {
    UILegibilityWeight v7 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 compatibleWithTraitCollection:a5];
    [(UIFontDescriptor *)v7 pointSize];
    if (v8 >= a4) {
      double v9 = a4;
    }
    else {
      double v9 = v8;
    }
    if (a5) {
      uint64_t v10 = [a5 legibilityWeight];
    }
    else {
      uint64_t v10 = -1;
    }
    return +[UIFont _fontWithDescriptor:v7 size:0 textStyleForScaling:0 pointSizeForScaling:v10 maximumPointSizeAfterScaling:v9 forIB:0.0 legibilityWeight:a4];
  }
}

- (double)_scaledValueForValue:(double)a3
{
  [(UIFont *)self _scaledValueForValue:0 useLanguageAwareScaling:a3];
  return result;
}

+ (double)_pointSize:(double)a3 scaledLikeTextStyle:(id)a4 maximumPointSize:(double)a5 compatibleWithTraitCollection:(id)a6
{
  [a1 _pointSize:a4 scaledLikeTextStyle:a6 maximumPointSize:1 compatibleWithTraitCollection:a3 roundSize:a5];
  return result;
}

+ (id)_preferredFontForTextStyle:(id)a3 weight:(double)a4
{
  uint64_t v6 = [NSNumber numberWithDouble:a4];

  return (id)[a1 _preferredFontForTextStyle:a3 design:0 weight:v6 symbolicTraits:0 maximumContentSizeCategory:0 compatibleWithTraitCollection:0 pointSize:0.0 pointSizeForScaling:0.0];
}

+ (id)_preferredFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4 compatibleWithTraitCollection:(id)a5
{
  if (!a4 || (id)getUIContentSizeCategoryUnspecified() == a4)
  {
    return (id)[a1 preferredFontForTextStyle:a3 compatibleWithTraitCollection:a5];
  }
  else
  {
    CTFontDescriptorGetTextStyleSize();
    return (id)objc_msgSend(a1, "_preferredFontForTextStyle:maximumPointSize:compatibleWithTraitCollection:", a3, a5);
  }
}

_UICache *__26__UIFont__sharedFontCache__block_invoke()
{
  double result = objc_alloc_init(_UICache);
  _sharedFontCache___sharedFontCache = (uint64_t)result;
  return result;
}

id __55__UIFont__scaledValueForValue_useLanguageAwareScaling___block_invoke()
{
  _scaledValueForValue_useLanguageAwareScaling____textStyleBodyLeadingCache = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:20];
  _scaledValueForValue_useLanguageAwareScaling____textStyleLanguageAwareBodyLeadingCache = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:20];
  id result = (id)+[UIFont _normalizedContentSizeCategory:0 default:1];
  _scaledValueForValue_useLanguageAwareScaling____defaultContentSizeCategory = (uint64_t)result;
  return result;
}

uint64_t __24__UIFont__readableWidth__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  uint64_t v5 = __24__UIFont__readableWidth__block_invoke_2;
  uint64_t v6 = &unk_1E55CDEF8;
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v1 = getUIContentSizeCategoryDidChangeNotification[0]();
  __24__UIFont__readableWidth__block_invoke_2((uint64_t)v4, v1);
  uint64_t v2 = getUIApplicationDidEnterBackgroundNotification[0]();
  return v5((uint64_t)v4, v2);
}

uint64_t __24__UIFont__readableWidth__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"UIFont.m", 807, @"Notification name symbol not found");
  }
  double v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  return [v3 addObserverForName:a2 object:0 queue:0 usingBlock:&__block_literal_global_105];
}

+ (CGFloat)systemFontSize
{
  return *(double *)&__UISystemFontSize;
}

- (CGFloat)leading
{
  if (dyld_program_sdk_at_least())
  {
    [(UIFont *)self _leading];
  }
  else
  {
    [(UIFont *)self lineHeight];
  }
  return result;
}

+ (UIFont)monospacedDigitSystemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight
{
  CTFontRef v4 = UINewFont(0, 0, @"NSCTFontUIFontDesignDefault", 0, 1, 1, fontSize, weight);

  return (UIFont *)v4;
}

+ (CGFloat)smallSystemFontSize
{
  return *(double *)&__UISmallSystemFontSize;
}

+ (id)_preferredFontForTextStyle:(id)a3 variant:(int64_t)a4
{
  return (id)[a1 _preferredFontForTextStyle:a3 design:0 variant:a4 maximumContentSizeCategory:0 compatibleWithTraitCollection:0];
}

- (NSString)fontName
{
  CFStringRef v2 = CTFontCopyPostScriptName((CTFontRef)self);
  double v3 = (void *)CFMakeCollectable(v2);

  return (NSString *)v3;
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 maximumContentSizeCategory:(id)a6 compatibleWithTraitCollection:(id)a7
{
  return (id)[a1 _preferredFontForTextStyle:a3 design:a4 variant:a5 weight:0 maximumContentSizeCategory:a6 compatibleWithTraitCollection:a7 pointSize:0.0 pointSizeForScaling:0.0];
}

+ (id)_lightSystemFontOfSize:(double)a3
{
  CTFontRef v3 = UINewFont(0, 8, 0, 0, 1, 0, a3, 0.0);

  return v3;
}

+ (UIFont)fontWithName:(id)a3 size:(double)a4 traits:(int)a5
{
  CTFontRef v5 = UINewFont((uint64_t)a3, *(uint64_t *)&a5, 0, 0, 0, 0, a4, 0.0);

  return (UIFont *)v5;
}

+ (UIFont)fontWithName:(NSString *)fontName size:(CGFloat)fontSize
{
  return (UIFont *)[a1 fontWithName:fontName size:0 traits:fontSize];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultFontForTextStyle:(id)a3
{
  return __UIFontForTextStyle((const __CTFont *)a3, 0, -1, 1, 0);
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 weight:(id)a6 maximumContentSizeCategory:(id)a7 compatibleWithTraitCollection:(id)a8 pointSize:(double)a9 pointSizeForScaling:(double)a10
{
  int v10 = (a5 << 7) & 0x10000;
  if ((a5 & 0x100) != 0) {
    int v10 = 0x8000;
  }
  if (!a4) {
    a4 = (id)((unint64_t)@"NSCTFontUIFontDesignRounded" & (a5 << 47 >> 63));
  }
  return (id)[a1 _preferredFontForTextStyle:a3 design:a4 weight:a6 symbolicTraits:v10 | (a5 >> 9) & 2 maximumContentSizeCategory:a7 compatibleWithTraitCollection:a8 pointSize:a9 pointSizeForScaling:a10];
}

- (int)traits
{
  int UIFontType = CTFontGetUIFontType();
  int result = 1;
  if (UIFontType > 133)
  {
    if ((UIFontType - 135) >= 4)
    {
      if (UIFontType == 134) {
        return result;
      }
      if (UIFontType == 140) {
        return 4;
      }
      return CTFontGetSymbolicTraits((CTFontRef)self) & 3;
    }
    return 3;
  }
  if (UIFontType <= 101)
  {
    if (UIFontType == 3) {
      return 2;
    }
    if (UIFontType == 27) {
      return result;
    }
    if (UIFontType != 52) {
      return CTFontGetSymbolicTraits((CTFontRef)self) & 3;
    }
    return 3;
  }
  switch(UIFontType)
  {
    case 'f':
      return 4;
    case 'g':
      int result = 8;
      break;
    case 'h':
      int result = 16;
      break;
    case 'j':
    case 'k':
    case 'l':
    case 'm':
      return 2;
    default:
      return CTFontGetSymbolicTraits((CTFontRef)self) & 3;
  }
  return result;
}

- (BOOL)_hasColorGlyphs
{
  return ([(UIFontDescriptor *)[(UIFont *)self fontDescriptor] symbolicTraits] >> 13) & 1;
}

+ (id)systemFontOfSize:(double)a3 weight:(double)a4 design:(id)a5
{
  CTFontRef v5 = UINewFont(0, 0, (uint64_t)a5, 0, 1, 0, a3, a4);

  return v5;
}

- (void)getBoundingRects:(CGRect *)a3 forCGGlyphs:(const unsigned __int16 *)a4 count:(unint64_t)a5
{
}

- (id)_kernOverride
{
  return 0;
}

- (NSString)familyName
{
  CFStringRef v2 = (__CFString *)CTFontCopyFamilyName((CTFontRef)self);

  return (NSString *)v2;
}

- (id)_fontScaledByScaleFactor:(double)a3
{
  [(UIFont *)self pointSize];
  double v6 = round(v5 * a3 * 4.0) * 0.25;
  long long v7 = [(UIFont *)self fontDescriptor];

  return +[UIFont fontWithDescriptor:v7 size:v6];
}

- (UIFont)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIFont;
  return [(UIFont *)&v3 init];
}

+ (id)_sharedZeroPointFont
{
  if (_sharedZeroPointFont_once != -1) {
    dispatch_once(&_sharedZeroPointFont_once, &__block_literal_global_7);
  }
  return (id)_sharedZeroPointFont___zeroPointCTFont;
}

void __30__UIFont__sharedZeroPointFont__block_invoke()
{
  MEMORY[0x192FAD930](0.0);
  _sharedZeroPointFont___zeroPointCTFont = (uint64_t)CTFontCreateWithNameAndOptions(@"Helvetica", 0.0, 0, 4uLL);

  JUMPOUT(0x192FAD930);
}

+ (void)_evictAllItemsFromFontAndFontDescriptorCaches
{
}

+ (UIFont)fontWithMarkupDescription:(id)a3
{
  objc_super v3 = [[UIFont alloc] initWithMarkupDescription:a3];

  return v3;
}

+ (NSArray)familyNames
{
  CFArrayRef v2 = CTFontManagerCopyAvailableFontFamilyNames();
  objc_super v3 = (void *)CFMakeCollectable(v2);

  return (NSArray *)v3;
}

+ (NSArray)fontNamesForFamilyName:(NSString *)familyName
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!familyName) {
    return 0;
  }
  uint64_t v7 = *MEMORY[0x1E4F24538];
  v8[0] = familyName;
  objc_super v3 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1]);
  CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v3, 0);
  CFRelease(v3);
  if (!MatchingFontDescriptors) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  double v5 = (const void *)CTFontDescriptorsCopyAttribute();
  CFRelease(MatchingFontDescriptors);
  return (NSArray *)(id)CFMakeCollectable(v5);
}

+ (id)_systemFontsOfSize:(double)a3 traits:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double v6 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = +[UIFont fontWithName:@"Helvetica" size:v4 traits:a3];
  if (v7) {
    [v6 addObject:v7];
  }
  return v6;
}

- (id)_alternateSystemFonts
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  if ([(UIFont *)self __isSystemFont])
  {
    uint64_t v4 = objc_opt_class();
    [(UIFont *)self pointSize];
    objc_super v3 = objc_msgSend(v4, "_systemFontsOfSize:traits:", -[UIFont traits](self, "traits"), v5);
    if ([v3 containsObject:self]) {
      [v3 removeObject:self];
    }
  }
  return v3;
}

+ (id)preferredFontForUsage:(id)a3
{
  return __UIFontForTextStyle((const __CTFont *)a3, 0, -1, 0, 0);
}

+ (id)preferredFontForUsage:(id)a3 contentSizeCategoryName:(id)a4
{
  return __UIFontForTextStyle((const __CTFont *)a3, (uint64_t)a4, -1, 0, 0);
}

+ (id)_preferredFontForTextStyle:(id)a3 variant:(int64_t)a4 maximumContentSizeCategory:(id)a5
{
  return (id)[a1 _preferredFontForTextStyle:a3 design:0 variant:a4 maximumContentSizeCategory:a5 compatibleWithTraitCollection:0];
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5
{
  return (id)[a1 _preferredFontForTextStyle:a3 design:a4 variant:a5 maximumContentSizeCategory:0 compatibleWithTraitCollection:0];
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 compatibleWithTraitCollection:(id)a6
{
  return (id)[a1 _preferredFontForTextStyle:a3 design:a4 variant:a5 maximumContentSizeCategory:0 compatibleWithTraitCollection:a6];
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 weight:(double)a5
{
  uint64_t v8 = [NSNumber numberWithDouble:a5];

  return (id)[a1 _preferredFontForTextStyle:a3 design:a4 weight:v8 symbolicTraits:0 maximumContentSizeCategory:0 compatibleWithTraitCollection:0 pointSize:0.0 pointSizeForScaling:0.0];
}

+ (id)_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 weight:(double)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v8 = [NSNumber numberWithDouble:a5];

  return (id)[a1 _preferredFontForTextStyle:a3 design:0 weight:v8 symbolicTraits:v5 maximumContentSizeCategory:0 compatibleWithTraitCollection:0 pointSize:0.0 pointSizeForScaling:0.0];
}

+ (id)_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 design:(id)a5 weight:(double)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v10 = [NSNumber numberWithDouble:a6];

  return (id)[a1 _preferredFontForTextStyle:a3 design:a5 weight:v10 symbolicTraits:v7 maximumContentSizeCategory:0 compatibleWithTraitCollection:0 pointSize:0.0 pointSizeForScaling:0.0];
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 weight:(double)a5 maximumContentSizeCategory:(id)a6 compatibleWithTraitCollection:(id)a7
{
  uint64_t v12 = [NSNumber numberWithDouble:a5];

  return (id)[a1 _preferredFontForTextStyle:a3 design:a4 weight:v12 symbolicTraits:0 maximumContentSizeCategory:a6 compatibleWithTraitCollection:a7 pointSize:0.0 pointSizeForScaling:0.0];
}

+ (id)_supportedDynamicFontStyles
{
  if (_supportedDynamicFontStyles_onceToken != -1) {
    dispatch_once(&_supportedDynamicFontStyles_onceToken, &__block_literal_global_20_0);
  }
  return (id)_supportedDynamicFontStyles__fontStyles;
}

uint64_t __37__UIFont__supportedDynamicFontStyles__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"UICTFontTextStyleHeadline", @"UICTFontTextStyleBody", @"UICTFontTextStyleSubhead", @"UICTFontTextStyleFootnote", @"UICTFontTextStyleCaption1", @"UICTFontTextStyleCaption2", @"UICTFontTextStyleTitle1", @"UICTFontTextStyleTitle2", @"UICTFontTextStyleTitle3", @"UICTFontTextStyleTitle4", @"UICTFontTextStyleTitle5", @"UICTFontTextStyleSubtitle", @"UICTFontTextStyleSubtitle1", @"UICTFontTextStyleSubtitle2", @"UICTFontTextStyleSubtitle3", @"UICTFontTextStyleCallout", @"UICTFontTextStyleFootnote",
             @"UICTFontTextStyleFootnote2",
             @"UICTFontTextStyleHeadline1",
             @"UICTFontTextStyleHeadline2",
             @"UICTFontTextStyleHeadline3",
             @"UICTFontTextStyleSubhead1",
             @"UICTFontTextStyleSubhead2",
             0);
  _supportedDynamicFontStyles__fontStyles = result;
  return result;
}

void __24__UIFont__readableWidth__block_invoke_3()
{
  _readableWidth_cachedReadableWidth = 0;
}

+ (id)ib_preferredFontForTextStyle:(id)a3
{
  if (!a3) {
    return 0;
  }
  +[UIFont _sharedFontCache];
  uint64_t v4 = (const __CTFontDescriptor *)__UIFontDescriptorWithTextStyle((uint64_t)a3, 0, 0, 0, 0, 0, -1);
  if (v4) {
    uint64_t v5 = CTFontCreateWithFontDescriptor(v4, 0.0, 0);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t ExtraData = __CTFontGetExtraData(v5);
  *(unsigned char *)(ExtraData + 24) |= 2u;

  return v5;
}

- (UIFont)initWithName:(id)a3 size:(double)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = (UIFont *)(id)[(id)objc_opt_class() fontWithName:a3 size:0 traits:a4];

  return v5;
}

- (UIFont)initWithFamilyName:(id)a3 traits:(int)a4 size:(double)a5
{
  if (!a3) {
    return 0;
  }
  double v6 = (UIFont *)(id)[(id)objc_opt_class() fontWithName:a3 size:*(void *)&a4 traits:a5];

  return v6;
}

- (UIFont)initWithMarkupDescription:(id)a3
{
  double v19 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v4 = (void *)[a3 componentsSeparatedByString:@";"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = (const __CTFont *)@"Helvetica";
    uint64_t v9 = *(void *)v22;
    double v10 = 12.0;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v11), "componentsSeparatedByString:", @":", v19);
      if ([v12 count] != 2) {
        break;
      }
      double v13 = objc_msgSend((id)objc_msgSend(v12, "objectAtIndex:", 0), "stringByStrippingLeadingAndTrailingWhitespaceAndQuotes");
      double v14 = objc_msgSend((id)objc_msgSend(v12, "objectAtIndex:", 1), "stringByStrippingLeadingAndTrailingWhitespaceAndQuotes");
      if ([v13 compare:@"font-family" options:1])
      {
        if ([v13 compare:@"font-weight" options:1])
        {
          if ([v13 compare:@"font-style" options:1])
          {
            if (![v13 compare:@"font-size" options:1])
            {
              [v14 floatValue];
              double v10 = v15;
            }
          }
          else
          {
            uint64_t v7 = v7 | ([v14 compare:@"italic" options:1] == 0);
          }
        }
        else if ([v14 compare:@"bold" options:1])
        {
          uint64_t v7 = v7;
        }
        else
        {
          uint64_t v7 = v7 | 2;
        }
      }
      else
      {
        uint64_t v8 = (const __CTFont *)v14;
      }
      if (v6 == ++v11)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = (const __CTFont *)@"Helvetica";
    double v10 = 12.0;
  }
  if ([(id)objc_opt_class() _isSupportedDynamicFontTextStyle:v8])
  {

    double v16 = __UIFontForTextStyle(v8, 0, -1, 0, 0);
  }
  else if ([(__CTFont *)v8 isEqualToString:@"system-ui"])
  {

    double v16 = UINewFont(0, v7, 0, 0, 1, 0, v10, 0.0);
  }
  else
  {
    double v16 = [(UIFont *)v19 initWithFamilyName:v8 traits:v7 size:v10];
  }
  double v17 = (UIFont *)v16;

  return v17;
}

- (id)familyNameForCSSFontFamilyValueForWebKit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UIFont *)self _textStyle];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([(UIFont *)self _isTextStyleFont]) {
      return v6;
    }
  }
  uint64_t v6 = [(UIFont *)self fontName];
  if ([(NSString *)v6 hasPrefix:@"."])
  {
    if (v3) {
      return @"system-ui";
    }
    return v6;
  }
  uint64_t v8 = [(NSString *)v6 componentsSeparatedByString:@"-"];
  if ([(NSArray *)v8 count] > 1)
  {
    id v9 = [(NSArray *)v8 lastObject];
    if (([v9 isEqualToString:@"Bold"] & 1) == 0
      && ![v9 isEqualToString:@"Italic"])
    {
      return v6;
    }
  }

  return [(UIFont *)self familyName];
}

- (id)markupDescriptionForWebKit:(BOOL)a3 pointSize:(float)a4 sizeUnit:(id)a5
{
  BOOL v7 = a3;
  char v9 = [(UIFont *)self traits];
  double v10 = NSString;
  id v11 = [(UIFont *)self familyNameForCSSFontFamilyValueForWebKit:v7];
  uint64_t v12 = @"bold";
  double v13 = @"normal";
  if ((v9 & 2) == 0) {
    uint64_t v12 = @"normal";
  }
  if (v9) {
    double v13 = @"italic";
  }
  return (id)objc_msgSend(v10, "stringWithFormat:", @"font-family: \"%@\"; font-weight: %@; font-style: %@; font-size: %.2f%@",
               v11,
               v12,
               v13,
               a4,
               a5);
}

- (id)markupDescription
{
  [(UIFont *)self pointSize];
  *(float *)&double v3 = v3;

  return [(UIFont *)self markupDescriptionForWebKit:1 pointSize:@"pt" sizeUnit:v3];
}

- (id)htmlMarkupDescriptionForWebKit:(BOOL)a3
{
  BOOL v3 = a3;
  if (dyld_program_sdk_at_least())
  {
    [(UIFont *)self pointSize];
    *(float *)&double v5 = v5;
    return [(UIFont *)self markupDescriptionForWebKit:v3 pointSize:@"px" sizeUnit:v5];
  }
  else
  {
    return [(UIFont *)self markupDescription];
  }
}

- (id)htmlMarkupDescription
{
  return [(UIFont *)self htmlMarkupDescriptionForWebKit:0];
}

+ (id)_opticalSystemFontOfSize:(double)a3
{
  CTFontRef v3 = UINewFont(0, 0, 0, 0, 1, 0, a3, 0.0);

  return v3;
}

+ (id)_opticalBoldSystemFontOfSize:(double)a3
{
  CTFontRef v3 = UINewFont(0, 2, 0, 0, 1, 0, a3, 0.0);

  return v3;
}

+ (UIFont)italicSystemFontOfSize:(CGFloat)fontSize
{
  return (UIFont *)[a1 systemFontOfSize:1 traits:fontSize];
}

+ (id)_thinSystemFontOfSize:(double)a3
{
  CTFontRef v3 = UINewFont(0, 4, 0, 0, 1, 0, a3, 0.0);

  return v3;
}

+ (id)_ultraLightSystemFontOfSize:(double)a3
{
  CTFontRef v3 = UINewFont(0, 16, 0, 0, 1, 0, a3, 0.0);

  return v3;
}

+ (UIFont)monospacedSystemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight
{
  CTFontRef v4 = UINewFont(0, 0, @"NSCTFontUIFontDesignMonospaced", 0, 1, 0, fontSize, weight);

  return (UIFont *)v4;
}

+ (void)_setLabelFontSize:(double)a3
{
  __UILabelFontSize = *(void *)&a3;
}

+ (CGFloat)buttonFontSize
{
  return *(double *)&__UIButtonFontSize;
}

+ (void)_setButtonFontSize:(double)a3
{
  __UIButtonFontSize = *(void *)&a3;
}

+ (void)_setSmallSystemFontSize:(double)a3
{
  __UISmallSystemFontSize = *(void *)&a3;
}

+ (void)_setSystemFontSize:(double)a3
{
  __UISystemFontSize = *(void *)&a3;
}

- (BOOL)_isUIFont
{
  return 1;
}

+ (id)classFallbacksForKeyedArchiver
{
  return &unk_1EDD68D78;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[UIFont fontName](self, "fontName"), @"UIFontName");
  BOOL v6 = [(UIFont *)self isIBTextStyleFont];
  BOOL v7 = [(UIFont *)self fontDescriptor];
  if (v6)
  {
    uint64_t v8 = [(UIFontDescriptor *)v7 objectForKey:@"NSCTFontUIUsageAttribute"];
    if (!v8) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIFont.m", 1260, @"Expecting a text style, got nil!");
    }
    [a3 encodeObject:v8 forKey:@"UIIBTextStyle"];
    double v9 = 0.0;
  }
  else
  {
    [a3 encodeObject:v7 forKey:@"UIFontDescriptor"];
    [(UIFont *)self pointSize];
  }
  [a3 encodeDouble:@"UIFontPointSize" forKey:v9];
  objc_msgSend(a3, "encodeObject:forKey:", -[UIFont textStyleForScaling](self, "textStyleForScaling"), @"UIFontTextStyleForScaling");
  [(UIFont *)self pointSizeForScaling];
  objc_msgSend(a3, "encodeDouble:forKey:", @"UIFontPointSizeForScaling");
  [(UIFont *)self maximumPointSizeAfterScaling];
  objc_msgSend(a3, "encodeDouble:forKey:", @"UIFontMaximumPointSizeAfterScaling");
  if ([(UIFont *)self isIBFontMetricsScaledFont]) {
    [a3 encodeBool:1 forKey:@"UIIBFontMetricsScaledFont"];
  }
  objc_msgSend(a3, "encodeInteger:forKey:", -[UIFont traits](self, "traits"), @"UIFontTraits");
  objc_msgSend(a3, "encodeBool:forKey:", -[UIFont __isSystemFont](self, "__isSystemFont"), @"UISystemFont");
  objc_msgSend(a3, "encodeObject:forKey:", -[UIFont fontName](self, "fontName"), @"NSName");
  [(UIFont *)self pointSize];

  objc_msgSend(a3, "encodeDouble:forKey:", @"NSSize");
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (id)_fontWithName:(id)a3 size:(double)a4
{
  if ([a3 hasPrefix:@"."])
  {
    return (id)[a1 fontWithName:a3 size:4096 traits:a4];
  }
  else
  {
    return (id)[a1 fontWithName:a3 size:a4];
  }
}

- (unint64_t)mostCompatibleStringEncoding
{
  CFStringEncoding StringEncoding = CTFontGetStringEncoding((CTFontRef)self);
  if (StringEncoding == 256) {
    return 30;
  }

  return CFStringConvertEncodingToNSStringEncoding(StringEncoding);
}

- (BOOL)_isHiraginoFont
{
  return 0;
}

- (double)_baseLineHeightForFont:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIFont *)self _defaultLineHeightForUILayout];
  double v6 = v5;
  double v7 = 0.0;
  if (v3) {
    [(UIFont *)self _leading];
  }
  return v6 + v7;
}

- (double)_ascenderDeltaForBehavior:(int64_t)a3
{
  return 0.0;
}

- (BOOL)isSystemFont
{
  return *(unsigned char *)(__CTFontGetExtraData((const __CTFont *)self) + 24) & 1;
}

- (BOOL)isFixedPitch
{
  return (CTFontGetSymbolicTraits((CTFontRef)self) >> 10) & 1;
}

- (id)description
{
  BOOL v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)UIFont;
  id v4 = [(UIFont *)&v7 description];
  [(UIFont *)self pointSize];
  *(float *)&double v5 = v5;
  return (id)[v3 stringWithFormat:@"%@ %@", v4, -[UIFont markupDescriptionForWebKit:pointSize:sizeUnit:](self, "markupDescriptionForWebKit:pointSize:sizeUnit:", 0, @"pt", v5)];
}

- (unsigned)glyphWithName:(id)a3
{
  return CTFontGetGlyphWithName((CTFontRef)self, (CFStringRef)a3);
}

- (void)setInContext:(CGContext *)a3
{
  uint64_t v4 = [(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] graphicsContextForApplicationFrameworkContext:1];

  [(UIFont *)self applyToGraphicsContext:v4];
}

- (void)getVerticalOriginTranslations:(CGSize *)a3 forCGGlyphs:(const unsigned __int16 *)a4 count:(unint64_t)a5
{
  CGFontRef v8 = CTFontCopyGraphicsFont((CTFontRef)self, 0);
  memset(&v16, 0, sizeof(v16));
  if (self) {
    [(UIFont *)self _textMatrixTransformForContext:0];
  }
  unsigned int UnitsPerEm = CTFontGetUnitsPerEm((CTFontRef)self);
  CGAffineTransformMakeScale(&t2, 1.0 / (double)UnitsPerEm, 1.0 / (double)UnitsPerEm);
  CGAffineTransform v13 = v16;
  CGAffineTransformConcat(&v15, &v13, &t2);
  CGAffineTransform v16 = v15;
  if (CGFontGetGlyphVerticalOffsets())
  {
    if ((uint64_t)a5 >= 1)
    {
      double v10 = &a3[a5];
      float64x2_t v11 = *(float64x2_t *)&v16.a;
      float64x2_t v12 = *(float64x2_t *)&v16.c;
      do
      {
        *(float64x2_t *)a3 = vmlaq_n_f64(vmulq_n_f64(v12, a3->height), v11, a3->width);
        ++a3;
      }
      while (a3 < v10);
    }
  }
  else
  {
    bzero(a3, 16 * a5);
  }
  CFRelease(v8);
}

- (CGFont)_backingCGSFont
{
  CGFontRef v2 = CTFontCopyGraphicsFont((CTFontRef)self, 0);

  return v2;
}

- (double)underlinePosition
{
  double UnderlinePosition = CTFontGetUnderlinePosition((CTFontRef)self);
  if ([(UIFont *)self isVertical])
  {
    [(UIFont *)self ascender];
    double v5 = v4;
    [(UIFont *)self descender];
    double v7 = v6;
    if (v5 > -UnderlinePosition)
    {
      if (v5 >= -v6)
      {
        [(UIFont *)self underlineThickness];
        return v7 + v8;
      }
      else
      {
        return -v5;
      }
    }
  }
  return UnderlinePosition;
}

- (CGSize)advancementForGlyph:(unsigned __int16)a3
{
  if ([(UIFont *)self numberOfGlyphs] <= a3)
  {
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    CTFontGetTransformedAdvancesForGlyphsAndStyle();
    double v4 = 0.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (unsigned)hyphenGlyphForLocale:(id)a3
{
  UniChar characters = 8208;
  CGGlyph glyphs = 0;
  if (!CTFontGetGlyphsForCharacters((CTFontRef)self, &characters, &glyphs, 1))
  {
    UniChar characters = 45;
    if (!CTFontGetGlyphsForCharacters((CTFontRef)self, &characters, &glyphs, 1)) {
      return 0;
    }
  }
  return glyphs;
}

- (unint64_t)getCaretPositions:(double *)a3 forGlyph:(unsigned int)a4 maximumLength:(unint64_t)a5
{
  unint64_t v9 = [(UIFont *)self numberOfGlyphs];
  if (!a4 || v9 <= a4) {
    return 0;
  }

  return CTFontGetLigatureCaretPositions((CTFontRef)self, a4, a3, a5);
}

- (unsigned)_defaultGlyphForChar:(unsigned __int16)a3
{
  UniChar characters = a3;
  CGGlyph glyphs = 0;
  if (CTFontGetGlyphsForCharacters((CTFontRef)self, &characters, &glyphs, 1)) {
    return glyphs;
  }
  else {
    return 0;
  }
}

- (id)bestMatchingFontForCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4 attributes:(id)a5 actualCoveredLength:(unint64_t *)a6
{
  double v7 = self;
  double v8 = MEMORY[0x192FAD930](self, a2, 0.0);
  [a5 objectForKey:NSLanguageAttributeName];
  unint64_t v9 = (UIFont *)CTFontCreateForCharactersWithLanguage();
  MEMORY[0x192FAD930](v8);
  if (v9 == v7)
  {
    CFRelease(v7);
  }
  else
  {
    double v10 = v9;
    return v9;
  }
  return v7;
}

- (id)lastResortFont
{
  [(UIFont *)self pointSize];

  return +[UIFont fontWithName:size:](UIFont, "fontWithName:size:", @"LastResort");
}

@end