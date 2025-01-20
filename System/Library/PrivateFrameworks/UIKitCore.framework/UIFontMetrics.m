@interface UIFontMetrics
+ (UIFontMetrics)defaultMetrics;
+ (UIFontMetrics)metricsForTextStyle:(UIFontTextStyle)textStyle;
+ (double)scaledValueForValue:(double)a3 withTextStyle:(id)a4 bodyLeading:(double)a5 compatibleWithTraitCollection:(id)a6;
- (CGFloat)scaledValueForValue:(CGFloat)value;
- (CGFloat)scaledValueForValue:(CGFloat)value compatibleWithTraitCollection:(UITraitCollection *)traitCollection;
- (UIFont)scaledFontForFont:(UIFont *)font;
- (UIFont)scaledFontForFont:(UIFont *)font compatibleWithTraitCollection:(UITraitCollection *)traitCollection;
- (UIFont)scaledFontForFont:(UIFont *)font maximumPointSize:(CGFloat)maximumPointSize;
- (UIFont)scaledFontForFont:(UIFont *)font maximumPointSize:(CGFloat)maximumPointSize compatibleWithTraitCollection:(UITraitCollection *)traitCollection;
- (UIFontMetrics)init;
- (UIFontMetrics)initForTextStyle:(UIFontTextStyle)textStyle;
- (id)ib_scaledFontForFont:(id)a3;
- (id)ib_scaledFontForFont:(id)a3 maximumPointSize:(double)a4;
@end

@implementation UIFontMetrics

- (CGFloat)scaledValueForValue:(CGFloat)value compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  v6 = traitCollection;
  v7 = [(UITraitCollection *)v6 preferredContentSizeCategory];
  v8 = [off_1E52D39B8 _normalizedContentSizeCategory:v7 default:0];

  CTFontDescriptorGetTextStyleSize();
  [(id)objc_opt_class() scaledValueForValue:self->_textStyle withTextStyle:v6 bodyLeading:value compatibleWithTraitCollection:0.0];
  double v10 = v9;

  return v10;
}

+ (double)scaledValueForValue:(double)a3 withTextStyle:(id)a4 bodyLeading:(double)a5 compatibleWithTraitCollection:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v11 = v10;
  if (v10 && ([v10 displayScale], v12 != 0.0))
  {
    double v15 = v12;
  }
  else
  {
    v13 = +[UIScreen mainScreen];
    [v13 scale];
    double v15 = v14;
  }
  if (qword_1EB260DE8 != -1) {
    dispatch_once(&qword_1EB260DE8, &__block_literal_global_278);
  }
  v16 = [(id)qword_1EB260DE0 objectForKey:v9];
  v17 = v16;
  if (v16)
  {
    [v16 doubleValue];
  }
  else
  {
    v19 = [off_1E52D39B8 _normalizedContentSizeCategory:@"_UICTContentSizeCategoryUnspecified" default:1];
    CTFontDescriptorGetTextStyleSize();
    v20 = (void *)qword_1EB260DE0;
    v21 = [NSNumber numberWithDouble:0.0];
    [v20 setObject:v21 forKey:v9];

    double v18 = 0.0;
  }
  if (v18 != 0.0) {
    a3 = a3 * a5 / v18;
  }
  UIRoundToScale(a3, v15);
  double v23 = v22;

  return v23;
}

- (void).cxx_destruct
{
}

- (UIFont)scaledFontForFont:(UIFont *)font maximumPointSize:(CGFloat)maximumPointSize
{
  return [(UIFontMetrics *)self scaledFontForFont:font maximumPointSize:0 compatibleWithTraitCollection:maximumPointSize];
}

- (UIFont)scaledFontForFont:(UIFont *)font
{
  return [(UIFontMetrics *)self scaledFontForFont:font maximumPointSize:0.0];
}

+ (UIFontMetrics)defaultMetrics
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__UIFontMetrics_defaultMetrics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB260DD8 != -1) {
    dispatch_once(&qword_1EB260DD8, block);
  }
  v2 = (void *)_MergedGlobals_1089;
  return (UIFontMetrics *)v2;
}

- (CGFloat)scaledValueForValue:(CGFloat)value
{
  [(UIFontMetrics *)self scaledValueForValue:0 compatibleWithTraitCollection:value];
  return result;
}

void __31__UIFontMetrics_defaultMetrics__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) metricsForTextStyle:@"UICTFontTextStyleBody"];
  v2 = (void *)_MergedGlobals_1089;
  _MergedGlobals_1089 = v1;
}

+ (UIFontMetrics)metricsForTextStyle:(UIFontTextStyle)textStyle
{
  v4 = textStyle;
  v5 = (void *)[objc_alloc((Class)a1) initForTextStyle:v4];

  return (UIFontMetrics *)v5;
}

- (UIFontMetrics)initForTextStyle:(UIFontTextStyle)textStyle
{
  v4 = textStyle;
  v9.receiver = self;
  v9.super_class = (Class)UIFontMetrics;
  v5 = [(UIFontMetrics *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)v4 copy];
    v7 = v5->_textStyle;
    v5->_textStyle = (NSString *)v6;
  }
  return v5;
}

- (UIFont)scaledFontForFont:(UIFont *)font maximumPointSize:(CGFloat)maximumPointSize compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  v8 = font;
  objc_super v9 = traitCollection;
  if (!v8)
  {
    double v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    double v14 = NSStringFromSelector(sel_scaledFontForFont_maximumPointSize_compatibleWithTraitCollection_);
    [v12 raise:v13, @"The font passed to %@ must be non-nil.", v14 format];
  }
  id v10 = [(UIFont *)v8 _fontScaledLikeTextStyle:self->_textStyle maximumPointSize:v9 compatibleWithTraitCollection:0 forIB:maximumPointSize];

  return (UIFont *)v10;
}

void __93__UIFontMetrics_scaledValueForValue_withTextStyle_bodyLeading_compatibleWithTraitCollection___block_invoke()
{
  id v0 = objc_alloc_init((Class)off_1E52D51F0);
  uint64_t v1 = (void *)qword_1EB260DE0;
  qword_1EB260DE0 = (uint64_t)v0;
}

- (UIFontMetrics)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(sel_initForTextStyle_);
  uint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"Use %@ to instantiate an instance of %@", v5, v7 format];

  return 0;
}

- (UIFont)scaledFontForFont:(UIFont *)font compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  return [(UIFontMetrics *)self scaledFontForFont:font maximumPointSize:traitCollection compatibleWithTraitCollection:0.0];
}

- (id)ib_scaledFontForFont:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    objc_super v9 = NSStringFromSelector(sel_ib_scaledFontForFont_);
    [v7 raise:v8, @"The font passed to %@ must be non-nil.", v9 format];
  }
  v5 = [v4 _fontScaledLikeTextStyle:self->_textStyle maximumPointSize:0 compatibleWithTraitCollection:1 forIB:0.0];

  return v5;
}

- (id)ib_scaledFontForFont:(id)a3 maximumPointSize:(double)a4
{
  id v6 = a3;
  if (!v6)
  {
    objc_super v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = NSStringFromSelector(sel_ib_scaledFontForFont_maximumPointSize_);
    [v9 raise:v10, @"The font passed to %@ must be non-nil.", v11 format];
  }
  v7 = [v6 _fontScaledLikeTextStyle:self->_textStyle maximumPointSize:0 compatibleWithTraitCollection:1 forIB:a4];

  return v7;
}

@end