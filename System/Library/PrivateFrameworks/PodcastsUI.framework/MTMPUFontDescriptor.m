@interface MTMPUFontDescriptor
+ (double)_layoutInterpolatorReferenceMetricForContentSizeCategory:(id)a3;
+ (id)_adjustedNativeFontDescriptorWithBaseNativeFontDescriptor:(id)a3 forCustomTextStyle:(int64_t)a4;
+ (id)_baseNativeTextStyleForTextStyle:(int64_t)a3;
+ (id)_fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5 systemFontSize:(double)a6 defaultPointSizeAdjustment:(double)a7;
+ (id)_fontPointSizeLayoutInterpolatorForTextStyle:(int64_t)a3;
+ (id)fontDescriptorWithSystemFontSize:(double)a3;
+ (id)fontDescriptorWithSystemFontSize:(double)a3 leadingAdjustment:(int64_t)a4;
+ (id)fontDescriptorWithSystemFontSize:(double)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5;
+ (id)fontDescriptorWithSystemFontSize:(double)a3 weight:(int64_t)a4;
+ (id)fontDescriptorWithTextStyle:(int64_t)a3;
+ (id)fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4;
+ (id)fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5;
+ (id)fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5 defaultPointSizeAdjustment:(double)a6;
+ (id)fontDescriptorWithTextStyle:(int64_t)a3 weight:(int64_t)a4;
+ (id)invalidationHandler;
+ (unsigned)_nativeFontDescriptorSymbolicTraitsForLeadingAdjustment:(int64_t)a3;
+ (unsigned)_nativeFontDescriptorSymbolicTraitsForUsingItalic:(BOOL)a3 isCondensedMetrics:(BOOL)a4;
+ (void)_getNativeFontDescriptorSymbolicTraits:(unsigned int *)a3 nativeTextStyleAttribute:(id *)a4 forWeight:(int64_t)a5 textStyle:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesCondensedMetrics;
- (BOOL)usesItalic;
- (BOOL)wantsMonospaceNumbers;
- (MTMPUFontDescriptor)init;
- (UIFont)defaultFont;
- (UIFont)preferredFont;
- (double)defaultFontAscender;
- (double)defaultFontBodyLeading;
- (double)defaultFontCapHeight;
- (double)defaultFontDescender;
- (double)defaultFontLineHeight;
- (double)defaultPointSizeAdjustment;
- (double)preferredFontAscender;
- (double)preferredFontBodyLeading;
- (double)preferredFontCapHeight;
- (double)preferredFontDescender;
- (double)preferredFontLineHeight;
- (double)scaledValueForValue:(double)a3;
- (double)systemFontSize;
- (id)_defaultFontDescriptorForTextStyle:(int64_t)a3;
- (id)_fontPointSizeLayoutInterpolator;
- (id)_fontWithBaseNativeFontDescriptorProvider:(id)a3;
- (id)_preferredFontDescriptorForTextStyle:(int64_t)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)typeSafeCopy;
- (int64_t)leadingAdjustment;
- (int64_t)textStyle;
- (int64_t)weight;
- (unint64_t)hash;
- (void)_invalidateCachedFontsAndMetrics;
- (void)_resetToDefaultValues;
- (void)dealloc;
@end

@implementation MTMPUFontDescriptor

+ (id)fontDescriptorWithTextStyle:(int64_t)a3
{
  return (id)[a1 fontDescriptorWithTextStyle:a3 leadingAdjustment:0 weight:0];
}

+ (id)fontDescriptorWithTextStyle:(int64_t)a3 weight:(int64_t)a4
{
  return (id)[a1 fontDescriptorWithTextStyle:a3 leadingAdjustment:0 weight:a4];
}

+ (id)fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4
{
  return (id)[a1 fontDescriptorWithTextStyle:a3 leadingAdjustment:a4 weight:0];
}

+ (id)fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5
{
  return (id)[a1 fontDescriptorWithTextStyle:a3 leadingAdjustment:a4 weight:a5 defaultPointSizeAdjustment:0.0];
}

+ (id)fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5 defaultPointSizeAdjustment:(double)a6
{
  return (id)[a1 _fontDescriptorWithTextStyle:a3 leadingAdjustment:a4 weight:a5 systemFontSize:0.0 defaultPointSizeAdjustment:a6];
}

+ (id)fontDescriptorWithSystemFontSize:(double)a3
{
  return (id)[a1 fontDescriptorWithSystemFontSize:0 leadingAdjustment:0 weight:a3];
}

+ (id)fontDescriptorWithSystemFontSize:(double)a3 weight:(int64_t)a4
{
  return (id)[a1 fontDescriptorWithSystemFontSize:0 leadingAdjustment:a4 weight:a3];
}

+ (id)fontDescriptorWithSystemFontSize:(double)a3 leadingAdjustment:(int64_t)a4
{
  return (id)[a1 fontDescriptorWithSystemFontSize:a4 leadingAdjustment:0 weight:a3];
}

+ (id)fontDescriptorWithSystemFontSize:(double)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5
{
  return (id)[a1 _fontDescriptorWithTextStyle:1000 leadingAdjustment:a4 weight:a5 systemFontSize:a3 defaultPointSizeAdjustment:0.0];
}

+ (id)_fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5 systemFontSize:(double)a6 defaultPointSizeAdjustment:(double)a7
{
  if ((id)objc_opt_class() == a1)
  {
    v14 = +[MTMPUFontDescriptorCache sharedFontDescriptorCache];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __119__MTMPUFontDescriptor__fontDescriptorWithTextStyle_leadingAdjustment_weight_systemFontSize_defaultPointSizeAdjustment___block_invoke;
    v16[3] = &__block_descriptor_72_e36_v16__0__MTMPUMutableFontDescriptor_8l;
    v16[4] = a3;
    v16[5] = a4;
    v16[6] = a5;
    *(double *)&v16[7] = a6;
    *(double *)&v16[8] = a7;
    v13 = [v14 cachedImmutableFontDescriptorForConfigurationBlock:v16];
  }
  else
  {
    v13 = (double *)objc_alloc_init((Class)a1);
    *((void *)v13 + 4) = a3;
    *((void *)v13 + 2) = a4;
    *((void *)v13 + 6) = a5;
    v13[3] = a6;
    v13[1] = a7;
  }

  return v13;
}

void __119__MTMPUFontDescriptor__fontDescriptorWithTextStyle_leadingAdjustment_weight_systemFontSize_defaultPointSizeAdjustment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTextStyle:v3];
  [v4 setLeadingAdjustment:*(void *)(a1 + 40)];
  [v4 setWeight:*(void *)(a1 + 48)];
  [v4 setSystemFontSize:*(double *)(a1 + 56)];
  [v4 setDefaultPointSizeAdjustment:*(double *)(a1 + 64)];
}

- (MTMPUFontDescriptor)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTMPUFontDescriptor;
  v2 = [(MTMPUFontDescriptor *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(MTMPUFontDescriptor *)v2 _resetToDefaultValues];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5 = [(id)objc_opt_class() invalidationHandler];
    [v4 addObserver:v3 selector:sel__handleFontDescriptorDidInvalidateCachedFontsAndMetricsNotification_ name:@"_MPUFontDescriptorDidInvalidateCachedFontsAndMetricsNotification" object:v5];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [(id)objc_opt_class() invalidationHandler];
  [v3 removeObserver:self name:@"_MPUFontDescriptorDidInvalidateCachedFontsAndMetricsNotification" object:v4];

  v5.receiver = self;
  v5.super_class = (Class)MTMPUFontDescriptor;
  [(MTMPUFontDescriptor *)&v5 dealloc];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  char v12 = 0;
  objc_super v7 = _MTMPUFontTextStyleGetDescriptionAndCustomStyleStatus(self->_textStyle, &v12);
  [v6 appendFormat:@"; textStyle = %@", v7];
  if (v12) {
    [v6 appendFormat:@"; isCustomTextStyle = YES"];
  }
  unint64_t v8 = self->_weight - 1;
  if (v8 <= 7) {
    [v6 appendFormat:@"; weight = %@", off_1E6E204E8[v8]];
  }
  int64_t leadingAdjustment = self->_leadingAdjustment;
  if (leadingAdjustment == 1)
  {
    v10 = @"shorter";
  }
  else
  {
    if (leadingAdjustment != 2) {
      goto LABEL_10;
    }
    v10 = @"taller";
  }
  [v6 appendFormat:@"; int64_t leadingAdjustment = %@", v10];
LABEL_10:
  if (!MTMPUFloatEqualToFloat(self->_defaultPointSizeAdjustment, 0.0)) {
    objc_msgSend(v6, "appendFormat:", @"; defaultPointSizeAdjustment = %f",
  }
      *(void *)&self->_defaultPointSizeAdjustment);
  if (self->_usesItalic) {
    [v6 appendString:@"; usesItalic = YES"];
  }
  if (self->_usesCondensedMetrics) {
    [v6 appendString:@"; usesCondensedMetrics = YES"];
  }
  if (self->_wantsMonospaceNumbers) {
    [v6 appendString:@"; wantsMonospaceNumbers = YES"];
  }
  [v6 appendString:@">"];

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)((double)(unint64_t)((double)(self->_textStyle
                                                              + 100 * self->_weight
                                                              + 1000 * self->_leadingAdjustment
                                                              + 100000 * self->_wantsMonospaceNumbers
                                                              + 10000
                                                              * (unint64_t)(self->_usesCondensedMetrics
                                                                                 + self->_usesItalic))
                                                     + self->_systemFontSize * 100.0)
                          + self->_defaultPointSizeAdjustment * 100000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MTMPUFontDescriptor *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v6 = (double *)v5;
      BOOL v7 = self->_textStyle == v5->_textStyle
        && self->_weight == v5->_weight
        && self->_leadingAdjustment == v5->_leadingAdjustment
        && self->_usesItalic == v5->_usesItalic
        && self->_usesCondensedMetrics == v5->_usesCondensedMetrics
        && self->_wantsMonospaceNumbers == v5->_wantsMonospaceNumbers
        && MTMPUFloatEqualToFloat(self->_systemFontSize, v5->_systemFontSize)
        && MTMPUFloatEqualToFloat(self->_defaultPointSizeAdjustment, v6[1]);
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)typeSafeCopy
{
  v2 = (void *)[(MTMPUFontDescriptor *)self copy];

  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MTMPUMutableFontDescriptor);
  objc_super v5 = v4;
  if (v4)
  {
    v4->super._textStyle = self->_textStyle;
    v4->super._weight = self->_weight;
    v4->super._int64_t leadingAdjustment = self->_leadingAdjustment;
    v4->super._usesItalic = self->_usesItalic;
    v4->super._usesCondensedMetrics = self->_usesCondensedMetrics;
    v4->super._wantsMonospaceNumbers = self->_wantsMonospaceNumbers;
    v4->super._systemFontSize = self->_systemFontSize;
    v4->super._defaultPointSizeAdjustment = self->_defaultPointSizeAdjustment;
    objc_storeStrong((id *)&v4->super._preferredFont, self->_preferredFont);
    *(_OWORD *)&v5->super._preferredFontMetrics.ascender = *(_OWORD *)&self->_preferredFontMetrics.ascender;
    long long v6 = *(_OWORD *)&self->_preferredFontMetrics.bodyLeading;
    long long v7 = *(_OWORD *)&self->_preferredFontMetrics.capHeight;
    long long v8 = *(_OWORD *)&self->_preferredFontMetrics.lineHeight;
    *(_OWORD *)&v5->super._preferredFontMetrics.descender = *(_OWORD *)&self->_preferredFontMetrics.descender;
    *(_OWORD *)&v5->super._preferredFontMetrics.lineHeight = v8;
    *(_OWORD *)&v5->super._preferredFontMetrics.bodyLeading = v6;
    *(_OWORD *)&v5->super._preferredFontMetrics.capHeight = v7;
    objc_storeStrong((id *)&v5->super._defaultFont, self->_defaultFont);
    *(_OWORD *)&v5->super._defaultFontMetrics.ascender = *(_OWORD *)&self->_defaultFontMetrics.ascender;
    long long v9 = *(_OWORD *)&self->_defaultFontMetrics.bodyLeading;
    long long v10 = *(_OWORD *)&self->_defaultFontMetrics.capHeight;
    long long v11 = *(_OWORD *)&self->_defaultFontMetrics.descender;
    *(_OWORD *)&v5->super._defaultFontMetrics.lineHeight = *(_OWORD *)&self->_defaultFontMetrics.lineHeight;
    *(_OWORD *)&v5->super._defaultFontMetrics.descender = v11;
    *(_OWORD *)&v5->super._defaultFontMetrics.capHeight = v10;
    *(_OWORD *)&v5->super._defaultFontMetrics.bodyLeading = v9;
  }
  return v5;
}

- (UIFont)preferredFont
{
  preferredFont = self->_preferredFont;
  if (!preferredFont)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__MTMPUFontDescriptor_preferredFont__block_invoke;
    v7[3] = &unk_1E6E20450;
    v7[4] = self;
    id v4 = [(MTMPUFontDescriptor *)self _fontWithBaseNativeFontDescriptorProvider:v7];
    objc_super v5 = self->_preferredFont;
    self->_preferredFont = v4;

    preferredFont = self->_preferredFont;
  }

  return preferredFont;
}

uint64_t __36__MTMPUFontDescriptor_preferredFont__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _preferredFontDescriptorForTextStyle:a2];
}

- (double)preferredFontAscender
{
  if (!self->_preferredFontMetrics.isAscenderInitialized)
  {
    id v3 = [(MTMPUFontDescriptor *)self preferredFont];
    [v3 ascender];
    self->_preferredFontMetrics.ascender = v4;

    self->_preferredFontMetrics.isAscenderInitialized = 1;
  }
  return self->_preferredFontMetrics.ascender;
}

- (double)preferredFontBodyLeading
{
  if (!self->_preferredFontMetrics.isBodyLeadingInitialized)
  {
    id v3 = [(MTMPUFontDescriptor *)self preferredFont];
    [v3 _bodyLeading];
    self->_preferredFontMetrics.bodyLeading = v4;

    self->_preferredFontMetrics.isBodyLeadingInitialized = 1;
  }
  return self->_preferredFontMetrics.bodyLeading;
}

- (double)preferredFontLineHeight
{
  if (!self->_preferredFontMetrics.isLineHeightInitialized)
  {
    id v3 = [(MTMPUFontDescriptor *)self preferredFont];
    [v3 lineHeight];
    self->_preferredFontMetrics.lineHeight = v4;

    self->_preferredFontMetrics.isLineHeightInitialized = 1;
  }
  return self->_preferredFontMetrics.lineHeight;
}

- (double)preferredFontCapHeight
{
  if (!self->_preferredFontMetrics.isCapHeightInitialized)
  {
    id v3 = [(MTMPUFontDescriptor *)self preferredFont];
    [v3 capHeight];
    self->_preferredFontMetrics.capHeight = v4;

    self->_preferredFontMetrics.isCapHeightInitialized = 1;
  }
  return self->_preferredFontMetrics.capHeight;
}

- (double)preferredFontDescender
{
  if (!self->_preferredFontMetrics.isDescenderInitialized)
  {
    id v3 = [(MTMPUFontDescriptor *)self preferredFont];
    [v3 descender];
    self->_preferredFontMetrics.descender = v4;

    self->_preferredFontMetrics.isDescenderInitialized = 1;
  }
  return self->_preferredFontMetrics.descender;
}

- (UIFont)defaultFont
{
  defaultFont = self->_defaultFont;
  if (!defaultFont)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__MTMPUFontDescriptor_defaultFont__block_invoke;
    v7[3] = &unk_1E6E20450;
    v7[4] = self;
    double v4 = [(MTMPUFontDescriptor *)self _fontWithBaseNativeFontDescriptorProvider:v7];
    objc_super v5 = self->_defaultFont;
    self->_defaultFont = v4;

    defaultFont = self->_defaultFont;
  }

  return defaultFont;
}

uint64_t __34__MTMPUFontDescriptor_defaultFont__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _defaultFontDescriptorForTextStyle:a2];
}

- (double)defaultFontAscender
{
  if (!self->_defaultFontMetrics.isAscenderInitialized)
  {
    id v3 = [(MTMPUFontDescriptor *)self defaultFont];
    [v3 ascender];
    self->_defaultFontMetrics.ascender = v4;

    self->_defaultFontMetrics.isAscenderInitialized = 1;
  }
  return self->_defaultFontMetrics.ascender;
}

- (double)defaultFontBodyLeading
{
  if (!self->_defaultFontMetrics.isBodyLeadingInitialized)
  {
    id v3 = [(MTMPUFontDescriptor *)self defaultFont];
    [v3 _bodyLeading];
    self->_defaultFontMetrics.bodyLeading = v4;

    self->_defaultFontMetrics.isBodyLeadingInitialized = 1;
  }
  return self->_defaultFontMetrics.bodyLeading;
}

- (double)defaultFontCapHeight
{
  if (!self->_defaultFontMetrics.isCapHeightInitialized)
  {
    id v3 = [(MTMPUFontDescriptor *)self defaultFont];
    [v3 capHeight];
    self->_defaultFontMetrics.capHeight = v4;

    self->_defaultFontMetrics.isCapHeightInitialized = 1;
  }
  return self->_defaultFontMetrics.capHeight;
}

- (double)defaultFontDescender
{
  if (!self->_defaultFontMetrics.isDescenderInitialized)
  {
    id v3 = [(MTMPUFontDescriptor *)self defaultFont];
    [v3 descender];
    self->_defaultFontMetrics.descender = v4;

    self->_defaultFontMetrics.isDescenderInitialized = 1;
  }
  return self->_defaultFontMetrics.descender;
}

- (double)defaultFontLineHeight
{
  if (!self->_defaultFontMetrics.isLineHeightInitialized)
  {
    id v3 = [(MTMPUFontDescriptor *)self defaultFont];
    [v3 lineHeight];
    self->_defaultFontMetrics.lineHeight = v4;

    self->_defaultFontMetrics.isLineHeightInitialized = 1;
  }
  return self->_defaultFontMetrics.bodyLeading;
}

- (double)scaledValueForValue:(double)a3
{
  [(MTMPUFontDescriptor *)self preferredFontBodyLeading];
  double v6 = v5;
  [(MTMPUFontDescriptor *)self defaultFontBodyLeading];
  double v8 = v7;
  if (!MTMPUFloatEqualToFloat(v7, 0.0)) {
    return v6 / v8 * a3;
  }
  return a3;
}

+ (id)invalidationHandler
{
  return +[MTMPUFontDescriptorCache sharedFontDescriptorCache];
}

+ (id)_adjustedNativeFontDescriptorWithBaseNativeFontDescriptor:(id)a3 forCustomTextStyle:(int64_t)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = v5;
  if (a4 == 18)
  {
    uint64_t v16 = *MEMORY[0x1E4FB0920];
    v17 = [v5 objectForKey:*MEMORY[0x1E4FB0920]];
    [v17 floatValue];
    double v19 = v18;

    uint64_t v22 = v16;
    char v12 = [NSNumber numberWithDouble:round(v19 * 1.88235294)];
    v23 = v12;
    v13 = (void *)MEMORY[0x1E4F1C9E8];
    v14 = &v23;
    v15 = &v22;
  }
  else
  {
    double v7 = v5;
    if (a4 != 17) {
      goto LABEL_6;
    }
    uint64_t v8 = *MEMORY[0x1E4FB0920];
    long long v9 = [v5 objectForKey:*MEMORY[0x1E4FB0920]];
    [v9 floatValue];
    double v11 = v10;

    uint64_t v24 = v8;
    char v12 = [NSNumber numberWithDouble:round(v11 * 0.933333333)];
    v25[0] = v12;
    v13 = (void *)MEMORY[0x1E4F1C9E8];
    v14 = (void **)v25;
    v15 = &v24;
  }
  v20 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
  double v7 = [v6 fontDescriptorByAddingAttributes:v20];

LABEL_6:

  return v7;
}

+ (id)_baseNativeTextStyleForTextStyle:(int64_t)a3
{
  double v4 = (id *)MEMORY[0x1E4FB28C8];
  switch(a3)
  {
    case 0:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
      goto LABEL_22;
    case 1:
      double v4 = (id *)MEMORY[0x1E4FB2908];
      goto LABEL_22;
    case 2:
    case 17:
      double v4 = (id *)MEMORY[0x1E4FB2950];
      goto LABEL_22;
    case 3:
      double v4 = (id *)MEMORY[0x1E4FB28F0];
      goto LABEL_22;
    case 4:
      double v4 = (id *)MEMORY[0x1E4FB28D8];
      goto LABEL_22;
    case 5:
      double v4 = (id *)MEMORY[0x1E4FB28E0];
      goto LABEL_22;
    case 6:
      double v4 = (id *)MEMORY[0x1E4FB2980];
      goto LABEL_22;
    case 7:
    case 18:
      double v4 = (id *)MEMORY[0x1E4FB2988];
      goto LABEL_22;
    case 8:
    case 19:
    case 20:
      double v4 = (id *)MEMORY[0x1E4FB2990];
      goto LABEL_22;
    case 9:
      double v4 = (id *)MEMORY[0x1E4FB2998];
      goto LABEL_22;
    case 10:
      double v4 = (id *)MEMORY[0x1E4FB2918];
      goto LABEL_22;
    case 11:
      double v4 = (id *)MEMORY[0x1E4FB2920];
      goto LABEL_22;
    case 12:
      double v4 = (id *)MEMORY[0x1E4FB2958];
      goto LABEL_22;
    case 13:
      double v4 = (id *)MEMORY[0x1E4FB2960];
      goto LABEL_22;
    case 14:
      double v4 = (id *)MEMORY[0x1E4FB28D0];
      goto LABEL_22;
    case 15:
      double v4 = (id *)MEMORY[0x1E4FB28F8];
      goto LABEL_22;
    case 16:
      double v4 = (id *)MEMORY[0x1E4FB2900];
      goto LABEL_22;
    default:
      if (a3 == 1000)
      {
LABEL_22:
        id v5 = *v4;
      }
      else
      {
        id v5 = 0;
      }
      return v5;
  }
}

+ (void)_getNativeFontDescriptorSymbolicTraits:(unsigned int *)a3 nativeTextStyleAttribute:(id *)a4 forWeight:(int64_t)a5 textStyle:(int64_t)a6
{
  switch(a5)
  {
    case 1:
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v8 = (id *)getkCTFontDescriptorTextStyleHeavySymbolLoc_ptr;
      uint64_t v22 = getkCTFontDescriptorTextStyleHeavySymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleHeavySymbolLoc_ptr)
      {
        long long v9 = (void *)CoreTextLibrary_0();
        v20[3] = (uint64_t)dlsym(v9, "kCTFontDescriptorTextStyleHeavy");
        getkCTFontDescriptorTextStyleHeavySymbolLoc_ptr = v20[3];
        uint64_t v8 = (id *)v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v8) {
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:]();
      }
      goto LABEL_36;
    case 2:
      if (a6 == 19)
      {
        uint64_t v19 = 0;
        v20 = &v19;
        uint64_t v21 = 0x2020000000;
        uint64_t v8 = (id *)getkCTFontDescriptorTextStyleBoldSymbolLoc_ptr;
        uint64_t v22 = getkCTFontDescriptorTextStyleBoldSymbolLoc_ptr;
        if (!getkCTFontDescriptorTextStyleBoldSymbolLoc_ptr)
        {
          uint64_t v16 = (void *)CoreTextLibrary_0();
          v20[3] = (uint64_t)dlsym(v16, "kCTFontDescriptorTextStyleBold");
          getkCTFontDescriptorTextStyleBoldSymbolLoc_ptr = v20[3];
          uint64_t v8 = (id *)v20[3];
        }
        _Block_object_dispose(&v19, 8);
        if (!v8) {
          -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:]();
        }
LABEL_36:
        id v15 = *v8;
        unsigned int v14 = 0;
        if (a3) {
          goto LABEL_37;
        }
      }
      else
      {
        id v15 = 0;
        unsigned int v14 = 2;
        if (a3) {
LABEL_37:
        }
          *a3 = v14;
      }
LABEL_38:
      if (a4) {
        *a4 = v15;
      }

      return;
    case 3:
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v8 = (id *)getkCTFontDescriptorTextStyleSemiboldSymbolLoc_ptr;
      uint64_t v22 = getkCTFontDescriptorTextStyleSemiboldSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleSemiboldSymbolLoc_ptr)
      {
        float v10 = (void *)CoreTextLibrary_0();
        v20[3] = (uint64_t)dlsym(v10, "kCTFontDescriptorTextStyleSemibold");
        getkCTFontDescriptorTextStyleSemiboldSymbolLoc_ptr = v20[3];
        uint64_t v8 = (id *)v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v8) {
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:]();
      }
      goto LABEL_36;
    case 4:
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v8 = (id *)getkCTFontDescriptorTextStyleMediumSymbolLoc_ptr;
      uint64_t v22 = getkCTFontDescriptorTextStyleMediumSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleMediumSymbolLoc_ptr)
      {
        double v11 = (void *)CoreTextLibrary_0();
        v20[3] = (uint64_t)dlsym(v11, "kCTFontDescriptorTextStyleMedium");
        getkCTFontDescriptorTextStyleMediumSymbolLoc_ptr = v20[3];
        uint64_t v8 = (id *)v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v8) {
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:]();
      }
      goto LABEL_36;
    case 5:
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v8 = (id *)getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr_0;
      uint64_t v22 = getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr_0;
      if (!getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr_0)
      {
        char v12 = (void *)CoreTextLibrary_0();
        v20[3] = (uint64_t)dlsym(v12, "kCTFontDescriptorTextStyleRegular");
        getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr_0 = v20[3];
        uint64_t v8 = (id *)v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v8) {
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:]();
      }
      goto LABEL_36;
    case 6:
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v8 = (id *)getkCTFontDescriptorTextStyleLightSymbolLoc_ptr;
      uint64_t v22 = getkCTFontDescriptorTextStyleLightSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleLightSymbolLoc_ptr)
      {
        v17 = (void *)CoreTextLibrary_0();
        v20[3] = (uint64_t)dlsym(v17, "kCTFontDescriptorTextStyleLight");
        getkCTFontDescriptorTextStyleLightSymbolLoc_ptr = v20[3];
        uint64_t v8 = (id *)v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v8) {
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:]();
      }
      goto LABEL_36;
    case 7:
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v8 = (id *)getkCTFontDescriptorTextStyleUltraLightSymbolLoc_ptr;
      uint64_t v22 = getkCTFontDescriptorTextStyleUltraLightSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleUltraLightSymbolLoc_ptr)
      {
        float v18 = (void *)CoreTextLibrary_0();
        v20[3] = (uint64_t)dlsym(v18, "kCTFontDescriptorTextStyleUltraLight");
        getkCTFontDescriptorTextStyleUltraLightSymbolLoc_ptr = v20[3];
        uint64_t v8 = (id *)v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v8) {
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:]();
      }
      goto LABEL_36;
    case 8:
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v8 = (id *)getkCTFontDescriptorTextStyleThinSymbolLoc_ptr;
      uint64_t v22 = getkCTFontDescriptorTextStyleThinSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleThinSymbolLoc_ptr)
      {
        v13 = (void *)CoreTextLibrary_0();
        v20[3] = (uint64_t)dlsym(v13, "kCTFontDescriptorTextStyleThin");
        getkCTFontDescriptorTextStyleThinSymbolLoc_ptr = v20[3];
        uint64_t v8 = (id *)v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v8) {
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:]();
      }
      goto LABEL_36;
    default:
      unsigned int v14 = 0;
      id v15 = 0;
      if (!a3) {
        goto LABEL_38;
      }
      goto LABEL_37;
  }
}

+ (unsigned)_nativeFontDescriptorSymbolicTraitsForLeadingAdjustment:(int64_t)a3
{
  if (a3 == 2) {
    return 0x10000;
  }
  else {
    return (a3 == 1) << 15;
  }
}

+ (unsigned)_nativeFontDescriptorSymbolicTraitsForUsingItalic:(BOOL)a3 isCondensedMetrics:(BOOL)a4
{
  if (a4) {
    unsigned int v4 = 64;
  }
  else {
    unsigned int v4 = 0;
  }
  if (a3) {
    return 1;
  }
  else {
    return v4;
  }
}

+ (id)_fontPointSizeLayoutInterpolatorForTextStyle:(int64_t)a3
{
  if (a3 == 20)
  {
    uint64_t v3 = objc_alloc_init(MTMPULayoutInterpolator);
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27C8]];
    [(MTMPULayoutInterpolator *)v3 addValue:17.0 forReferenceMetric:v18];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27E8]];
    [(MTMPULayoutInterpolator *)v3 addValue:18.0 forReferenceMetric:v19];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27D8]];
    [(MTMPULayoutInterpolator *)v3 addValue:19.0 forReferenceMetric:v20];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    [(MTMPULayoutInterpolator *)v3 addValue:20.0 forReferenceMetric:v21];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27C0]];
    [(MTMPULayoutInterpolator *)v3 addValue:22.0 forReferenceMetric:v22];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27B8]];
    [(MTMPULayoutInterpolator *)v3 addValue:24.0 forReferenceMetric:v23];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27B0]];
    [(MTMPULayoutInterpolator *)v3 addValue:26.0 forReferenceMetric:v24];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB2798]];
    [(MTMPULayoutInterpolator *)v3 addValue:32.0 forReferenceMetric:v25];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB2790]];
    [(MTMPULayoutInterpolator *)v3 addValue:39.0 forReferenceMetric:v26];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB2788]];
    [(MTMPULayoutInterpolator *)v3 addValue:46.0 forReferenceMetric:v27];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB2780]];
    [(MTMPULayoutInterpolator *)v3 addValue:55.0 forReferenceMetric:v28];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB2778]];
    double v16 = v29;
    double v17 = 63.0;
    goto LABEL_5;
  }
  if (a3 == 19)
  {
    uint64_t v3 = objc_alloc_init(MTMPULayoutInterpolator);
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27C8]];
    [(MTMPULayoutInterpolator *)v3 addValue:19.0 forReferenceMetric:v4];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27E8]];
    [(MTMPULayoutInterpolator *)v3 addValue:20.0 forReferenceMetric:v5];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27D8]];
    [(MTMPULayoutInterpolator *)v3 addValue:21.0 forReferenceMetric:v6];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    [(MTMPULayoutInterpolator *)v3 addValue:22.0 forReferenceMetric:v7];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27C0]];
    [(MTMPULayoutInterpolator *)v3 addValue:24.0 forReferenceMetric:v8];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27B8]];
    [(MTMPULayoutInterpolator *)v3 addValue:26.0 forReferenceMetric:v9];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB27B0]];
    [(MTMPULayoutInterpolator *)v3 addValue:28.0 forReferenceMetric:v10];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB2798]];
    [(MTMPULayoutInterpolator *)v3 addValue:34.0 forReferenceMetric:v11];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB2790]];
    [(MTMPULayoutInterpolator *)v3 addValue:41.0 forReferenceMetric:v12];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB2788]];
    [(MTMPULayoutInterpolator *)v3 addValue:48.0 forReferenceMetric:v13];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB2780]];
    [(MTMPULayoutInterpolator *)v3 addValue:57.0 forReferenceMetric:v14];
    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:*MEMORY[0x1E4FB2778]];
    double v16 = v15;
    double v17 = 65.0;
LABEL_5:
    [(MTMPULayoutInterpolator *)v3 addValue:v17 forReferenceMetric:v16];
    goto LABEL_7;
  }
  uint64_t v3 = 0;
LABEL_7:

  return v3;
}

+ (double)_layoutInterpolatorReferenceMetricForContentSizeCategory:(id)a3
{
  id v3 = a3;
  double v4 = 1.0;
  if (([v3 isEqualToString:*MEMORY[0x1E4FB27C8]] & 1) == 0)
  {
    double v4 = 2.0;
    if (([v3 isEqualToString:*MEMORY[0x1E4FB27E8]] & 1) == 0)
    {
      double v4 = 3.0;
      if (([v3 isEqualToString:*MEMORY[0x1E4FB27D8]] & 1) == 0)
      {
        double v4 = 5.0;
        if (([v3 isEqualToString:*MEMORY[0x1E4FB27C0]] & 1) == 0)
        {
          double v4 = 6.0;
          if (([v3 isEqualToString:*MEMORY[0x1E4FB27B8]] & 1) == 0)
          {
            double v4 = 7.0;
            if (([v3 isEqualToString:*MEMORY[0x1E4FB27B0]] & 1) == 0)
            {
              double v4 = 8.0;
              if (([v3 isEqualToString:*MEMORY[0x1E4FB2798]] & 1) == 0)
              {
                double v4 = 9.0;
                if (([v3 isEqualToString:*MEMORY[0x1E4FB2790]] & 1) == 0)
                {
                  double v4 = 10.0;
                  if (([v3 isEqualToString:*MEMORY[0x1E4FB2788]] & 1) == 0)
                  {
                    double v4 = 11.0;
                    if (([v3 isEqualToString:*MEMORY[0x1E4FB2780]] & 1) == 0)
                    {
                      double v4 = 12.0;
                      if (([v3 isEqualToString:*MEMORY[0x1E4FB2778]] & 1) == 0)
                      {
                        double v4 = 4.0;
                        if (([v3 isEqualToString:*MEMORY[0x1E4FB27D0]] & 1) == 0)
                        {
                          block[0] = MEMORY[0x1E4F143A8];
                          block[1] = 3221225472;
                          block[2] = __80__MTMPUFontDescriptor__layoutInterpolatorReferenceMetricForContentSizeCategory___block_invoke;
                          block[3] = &unk_1E6E1FAA8;
                          id v7 = v3;
                          if (_layoutInterpolatorReferenceMetricForContentSizeCategory__sOnceToken != -1) {
                            dispatch_once(&_layoutInterpolatorReferenceMetricForContentSizeCategory__sOnceToken, block);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

void __80__MTMPUFontDescriptor__layoutInterpolatorReferenceMetricForContentSizeCategory___block_invoke(uint64_t a1)
{
}

- (id)_defaultFontDescriptorForTextStyle:(int64_t)a3
{
  switch(a3)
  {
    case 19:
    case 26:
      id v3 = (void *)MEMORY[0x1E4FB08E0];
      double systemFontSize = 22.0;
      goto LABEL_13;
    case 20:
      id v3 = (void *)MEMORY[0x1E4FB08E0];
      double systemFontSize = 20.0;
      goto LABEL_13;
    case 21:
      id v3 = (void *)MEMORY[0x1E4FB08E0];
      uint64_t v5 = 0x4044000000000000;
      goto LABEL_12;
    case 22:
      id v3 = (void *)MEMORY[0x1E4FB08E0];
      uint64_t v5 = 0x4049000000000000;
      goto LABEL_12;
    case 23:
      id v3 = (void *)MEMORY[0x1E4FB08E0];
      uint64_t v5 = 0x404E000000000000;
      goto LABEL_12;
    case 24:
      id v3 = (void *)MEMORY[0x1E4FB08E0];
      uint64_t v5 = 0x4040000000000000;
      goto LABEL_12;
    case 25:
      id v3 = (void *)MEMORY[0x1E4FB08E0];
      double systemFontSize = 13.0;
      goto LABEL_13;
    case 27:
      id v3 = (void *)MEMORY[0x1E4FB08E0];
      uint64_t v5 = 0x4048000000000000;
LABEL_12:
      double systemFontSize = *(double *)&v5;
      goto LABEL_13;
    default:
      if (a3 == 1000)
      {
        double systemFontSize = self->_systemFontSize;
        id v3 = (void *)MEMORY[0x1E4FB08E0];
LABEL_13:
        double v6 = [v3 systemFontOfSize:systemFontSize];
        uint64_t v7 = [v6 fontDescriptor];
      }
      else
      {
        double v6 = [(id)objc_opt_class() _baseNativeTextStyleForTextStyle:a3];
        uint64_t v7 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:v6];
      }
      double v8 = (void *)v7;

      return v8;
  }
}

- (id)_fontWithBaseNativeFontDescriptorProvider:(id)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  double v4 = (*((void (**)(id, int64_t))a3 + 2))(a3, self->_textStyle);
  uint64_t v5 = objc_opt_class();
  double v6 = [v5 _adjustedNativeFontDescriptorWithBaseNativeFontDescriptor:v4 forCustomTextStyle:self->_textStyle];
  int v42 = 0;
  id v41 = 0;
  [v5 _getNativeFontDescriptorSymbolicTraits:&v42 nativeTextStyleAttribute:&v41 forWeight:self->_weight textStyle:self->_textStyle];
  id v7 = v41;
  double v8 = v7;
  if (v7)
  {
    uint64_t v50 = *MEMORY[0x1E4FB0948];
    v51[0] = v7;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  }
  else
  {
    id v9 = 0;
  }
  if (self->_wantsMonospaceNumbers)
  {
    uint64_t v48 = *MEMORY[0x1E4FB0910];
    uint64_t v10 = *MEMORY[0x1E4FB0960];
    v45[0] = *MEMORY[0x1E4FB0968];
    v45[1] = v10;
    v46[0] = &unk_1F3F6F9E8;
    v46[1] = &unk_1F3F6FA00;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
    v47 = v11;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    v49 = v12;
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];

    if (v9)
    {
      double v14 = (void *)[v9 mutableCopy];
      [v14 addEntriesFromDictionary:v13];

      id v9 = v14;
    }
    else
    {
      id v9 = v13;
    }
  }
  if (!MTMPUFloatEqualToFloat(self->_defaultPointSizeAdjustment, 0.0))
  {
    double v15 = [(MTMPUFontDescriptor *)self _defaultFontDescriptorForTextStyle:self->_textStyle];
    double v16 = [v5 _adjustedNativeFontDescriptorWithBaseNativeFontDescriptor:v15 forCustomTextStyle:self->_textStyle];
    double v17 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v16 size:0.0];
    [v17 _bodyLeading];
    double v19 = v18;

    double v20 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v6 size:0.0];
    [v20 _bodyLeading];
    double v22 = v21;

    BOOL v23 = MTMPUFloatEqualToFloat(v19, 0.0);
    double defaultPointSizeAdjustment = self->_defaultPointSizeAdjustment;
    if (!v23) {
      double defaultPointSizeAdjustment = v22 / v19 * defaultPointSizeAdjustment;
    }
    double v25 = round(defaultPointSizeAdjustment);
    [v6 pointSize];
    double v27 = v26 + v25;
    if (v9)
    {
      double v28 = (void *)[v9 mutableCopy];
      double v29 = [NSNumber numberWithDouble:v27];
      [v28 setObject:v29 forKey:*MEMORY[0x1E4FB0920]];
    }
    else
    {
      uint64_t v43 = *MEMORY[0x1E4FB0920];
      id v9 = [NSNumber numberWithDouble:v27];
      id v44 = v9;
      double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    }

    id v9 = v28;
  }
  int v30 = [v5 _nativeFontDescriptorSymbolicTraitsForLeadingAdjustment:self->_leadingAdjustment];
  int v31 = [v5 _nativeFontDescriptorSymbolicTraitsForUsingItalic:self->_usesItalic isCondensedMetrics:self->_usesCondensedMetrics];
  id v32 = v6;
  v33 = v32;
  int v34 = v31 | v30 | v42;
  v35 = v32;
  if (v9)
  {
    v35 = [v32 fontDescriptorByAddingAttributes:v9];
  }
  if (v34)
  {
    v36 = objc_msgSend(v35, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v35, "symbolicTraits") | v34);
    v37 = v36;
    if (v36)
    {
      id v38 = v36;

      v35 = v38;
    }
  }
  v39 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v35 size:0.0];

  return v39;
}

- (void)_invalidateCachedFontsAndMetrics
{
  preferredFont = self->_preferredFont;
  self->_preferredFont = 0;

  self->_preferredFontMetrics.isAscenderInitialized = 0;
  self->_preferredFontMetrics.isBodyLeadingInitialized = 0;
  self->_preferredFontMetrics.isCapHeightInitialized = 0;
  self->_preferredFontMetrics.isDescenderInitialized = 0;
  defaultFont = self->_defaultFont;
  self->_defaultFont = 0;

  self->_defaultFontMetrics.isAscenderInitialized = 0;
  self->_defaultFontMetrics.isBodyLeadingInitialized = 0;
  self->_defaultFontMetrics.isCapHeightInitialized = 0;
  self->_defaultFontMetrics.isDescenderInitialized = 0;
  customFontPointSizeLayoutInterpolator = self->_customFontPointSizeLayoutInterpolator;
  self->_customFontPointSizeLayoutInterpolator = 0;
}

- (id)_fontPointSizeLayoutInterpolator
{
  customFontPointSizeLayoutInterpolator = self->_customFontPointSizeLayoutInterpolator;
  if (!customFontPointSizeLayoutInterpolator)
  {
    double v4 = [(id)objc_opt_class() _fontPointSizeLayoutInterpolatorForTextStyle:self->_textStyle];
    uint64_t v5 = self->_customFontPointSizeLayoutInterpolator;
    self->_customFontPointSizeLayoutInterpolator = v4;

    customFontPointSizeLayoutInterpolator = self->_customFontPointSizeLayoutInterpolator;
  }

  return customFontPointSizeLayoutInterpolator;
}

- (id)_preferredFontDescriptorForTextStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 21) < 7) {
    goto LABEL_2;
  }
  if ((unint64_t)(a3 - 19) >= 2)
  {
    if (a3 == 1000)
    {
LABEL_2:
      id v3 = [(MTMPUFontDescriptor *)self _defaultFontDescriptorForTextStyle:a3];
      goto LABEL_11;
    }
    double v4 = [(id)objc_opt_class() _baseNativeTextStyleForTextStyle:a3];
    id v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v4];
  }
  else
  {
    double v4 = [(MTMPUFontDescriptor *)self _fontPointSizeLayoutInterpolator];
    uint64_t v5 = [NSClassFromString(&cfstr_Uiapplication.isa) sharedApplication];
    double v6 = v5;
    if (v5)
    {
      id v7 = [v5 preferredContentSizeCategory];
    }
    else
    {
      id v7 = (id)*MEMORY[0x1E4FB27D0];
    }
    double v8 = v7;

    [(id)objc_opt_class() _layoutInterpolatorReferenceMetricForContentSizeCategory:v8];
    objc_msgSend(v4, "valueForReferenceMetric:");
    id v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:");
    id v3 = [v9 fontDescriptor];
  }
LABEL_11:

  return v3;
}

- (void)_resetToDefaultValues
{
  self->_weight = 0;
  self->_int64_t leadingAdjustment = 0;
  self->_textStyle = 0;
  *(_DWORD *)((char *)&self->_textStyle + 7) = 0;
  customFontPointSizeLayoutInterpolator = self->_customFontPointSizeLayoutInterpolator;
  self->_customFontPointSizeLayoutInterpolator = 0;

  self->_double systemFontSize = 0.0;
  self->_double defaultPointSizeAdjustment = 0.0;
}

- (int64_t)textStyle
{
  return self->_textStyle;
}

- (double)systemFontSize
{
  return self->_systemFontSize;
}

- (int64_t)weight
{
  return self->_weight;
}

- (double)defaultPointSizeAdjustment
{
  return self->_defaultPointSizeAdjustment;
}

- (int64_t)leadingAdjustment
{
  return self->_leadingAdjustment;
}

- (BOOL)usesItalic
{
  return self->_usesItalic;
}

- (BOOL)usesCondensedMetrics
{
  return self->_usesCondensedMetrics;
}

- (BOOL)wantsMonospaceNumbers
{
  return self->_wantsMonospaceNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFontPointSizeLayoutInterpolator, 0);
  objc_storeStrong((id *)&self->_defaultFont, 0);

  objc_storeStrong((id *)&self->_preferredFont, 0);
}

@end