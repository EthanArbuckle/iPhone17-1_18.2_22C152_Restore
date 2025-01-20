@interface NTKTimeIntervalLabel
- (BOOL)frozen;
- (BOOL)shouldShowDigits;
- (BOOL)showSubSeconds;
- (BOOL)suffixSmallCaps;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)textSize;
- (CLKFont)font;
- (NSString)prefix;
- (NSString)suffix;
- (NTKTimeIntervalLabel)initWithMonospacedFontOfSize:(double)a3 color:(id)a4 style:(int64_t)a5 forDevice:(id)a6;
- (NTKTimeIntervalLabel)initWithMonospacedFontOfSize:(double)a3 color:(id)a4 style:(int64_t)a5 signed:(BOOL)a6 forDevice:(id)a7;
- (NTKTimeIntervalLabel)initWithMonospacedFontOfSize:(double)a3 forDevice:(id)a4;
- (UIColor)textColor;
- (double)_labelWidth;
- (double)actualWidth;
- (double)time;
- (id)_cachedImageForDigit:(unint64_t)a3;
- (id)_localImageForDigit:(unint64_t)a3;
- (id)didResizeHandler;
- (id)formatTimeInterval;
- (id)getTimeText;
- (void)_invalidateDigitImages;
- (void)_localeChanged;
- (void)calculateMetrics;
- (void)createDigitViews;
- (void)dealloc;
- (void)forceTime:(double)a3;
- (void)layoutSubviews;
- (void)recalculateSize;
- (void)setDidResizeHandler:(id)a3;
- (void)setFont:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setLabelText:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setSuffix:(id)a3;
- (void)setSuffixSmallCaps:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)setTime:(double)a3;
- (void)sizeToFitLabelIfNeeded;
@end

@implementation NTKTimeIntervalLabel

- (NTKTimeIntervalLabel)initWithMonospacedFontOfSize:(double)a3 color:(id)a4 style:(int64_t)a5 signed:(BOOL)a6 forDevice:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  v31.receiver = self;
  v31.super_class = (Class)NTKTimeIntervalLabel;
  double v14 = *MEMORY[0x1E4F1DB28];
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v18 = -[NTKTimeIntervalLabel initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v15, v16, v17);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_device, a7);
    v20 = [MEMORY[0x1E4F19A50] systemFontOfSize:a3];
    uint64_t v21 = [v20 CLKFontWithMonospacedNumbers];
    font = v19->_font;
    v19->_font = (CLKFont *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    images = v19->_images;
    v19->_images = (NSMutableDictionary *)v23;

    v19->_showSubSeconds = 1;
    v19->_frozen = 0;
    v19->_style = a5;
    v19->_isSigned = a6;
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v14, v15, v16, v17);
    label = v19->_label;
    v19->_label = (UILabel *)v25;

    [(UILabel *)v19->_label setFont:v19->_font];
    v27 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v19->_label setBackgroundColor:v27];

    [(UILabel *)v19->_label setTextColor:v12];
    if (a5 == 1) {
      uint64_t v28 = 2;
    }
    else {
      uint64_t v28 = 1;
    }
    [(UILabel *)v19->_label setTextAlignment:v28];
    [(NTKTimeIntervalLabel *)v19 forceTime:720.0];
    [(NTKTimeIntervalLabel *)v19 addSubview:v19->_label];
    [(NTKTimeIntervalLabel *)v19 calculateMetrics];
    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v19 selector:sel__localeChanged name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v19;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKTimeIntervalLabel;
  [(NTKTimeIntervalLabel *)&v4 dealloc];
}

- (NTKTimeIntervalLabel)initWithMonospacedFontOfSize:(double)a3 color:(id)a4 style:(int64_t)a5 forDevice:(id)a6
{
  return [(NTKTimeIntervalLabel *)self initWithMonospacedFontOfSize:a4 color:a5 style:0 signed:a6 forDevice:a3];
}

- (NTKTimeIntervalLabel)initWithMonospacedFontOfSize:(double)a3 forDevice:(id)a4
{
  v6 = (void *)MEMORY[0x1E4FB1618];
  id v7 = a4;
  v8 = [v6 whiteColor];
  v9 = [(NTKTimeIntervalLabel *)self initWithMonospacedFontOfSize:v8 color:0 style:v7 forDevice:a3];

  return v9;
}

- (id)_localImageForDigit:(unint64_t)a3
{
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v6 = [(NSMutableDictionary *)self->_images objectForKey:v5];
  if (!v6)
  {
    v6 = [(NTKTimeIntervalLabel *)self _cachedImageForDigit:a3];
    if (v6) {
      [(NSMutableDictionary *)self->_images setObject:v6 forKey:v5];
    }
  }
  id v7 = v6;

  return v7;
}

- (void)calculateMetrics
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v3 = [(NTKTimeIntervalLabel *)self getTimeText];
  text = self->_text;
  self->_text = v3;

  uint64_t v5 = *MEMORY[0x1E4FB06F8];
  v16[0] = self->_font;
  uint64_t v6 = *MEMORY[0x1E4FB0700];
  v15[0] = v5;
  v15[1] = v6;
  id v7 = [(NTKTimeIntervalLabel *)self textColor];
  v16[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  v9 = -[NSString substringWithRange:](self->_text, "substringWithRange:", [(NSString *)self->_text length] - 1, 1);
  [v9 sizeWithAttributes:v8];
  self->_digitWidth = v10;

  v11 = -[NSString substringWithRange:](self->_text, "substringWithRange:", 0, [(NSString *)self->_text length] - 1);
  [v11 sizeWithAttributes:v8];
  self->_staticLabelWidth = v12;

  [(NSString *)self->_text sizeWithAttributes:v8];
  self->_textSize.width = v13;
  self->_textSize.height = v14;
  *(_WORD *)&self->_isShowingDigits = 1;
}

- (double)actualWidth
{
  double width = self->_textSize.width;
  suffix = self->_suffix;
  if (suffix)
  {
    [(UILabel *)suffix frame];
    double width = width + v5;
  }
  prefix = self->_prefix;
  if (prefix)
  {
    [(UILabel *)prefix frame];
    return width + v7;
  }
  return width;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_textSize.width;
  CGFloat height = self->_textSize.height;
  suffix = self->_suffix;
  if (suffix)
  {
    [(UILabel *)suffix frame];
    double width = width + v7;
  }
  prefix = self->_prefix;
  if (prefix)
  {
    [(UILabel *)prefix frame];
    double width = width + v9;
  }
  double v10 = width;
  double v11 = height;
  result.CGFloat height = v11;
  result.double width = v10;
  return result;
}

- (void)createDigitViews
{
  if (!self->_digits)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    digits = self->_digits;
    self->_digits = v3;

    char v5 = 1;
    do
    {
      char v6 = v5;
      double v7 = self->_digits;
      id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
      double v9 = [(NTKTimeIntervalLabel *)self _localImageForDigit:0];
      double v10 = (void *)[v8 initWithImage:v9];
      [(NSMutableArray *)v7 addObject:v10];

      double v11 = [(NSMutableArray *)self->_digits lastObject];
      [(NTKTimeIntervalLabel *)self addSubview:v11];

      char v5 = 0;
    }
    while ((v6 & 1) != 0);
  }
}

- (double)_labelWidth
{
  if (self->_style) {
    v2 = &OBJC_IVAR___NTKTimeIntervalLabel__staticLabelWidth;
  }
  else {
    v2 = &OBJC_IVAR___NTKTimeIntervalLabel__textSize;
  }
  return *(double *)((char *)&self->super.super.super.isa + *v2);
}

- (void)layoutSubviews
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)NTKTimeIntervalLabel;
  [(NTKTimeIntervalLabel *)&v32 layoutSubviews];
  double v3 = 0.0;
  if ([(NTKTimeIntervalLabel *)self shouldShowDigits]) {
    double v3 = -self->_digitWidth;
  }
  prefix = self->_prefix;
  if (prefix)
  {
    [(UILabel *)prefix frame];
    double v6 = v5;
    [(UILabel *)self->_prefix frame];
    -[UILabel setFrame:](self->_prefix, "setFrame:", 0.0, 0.0, v6);
    [(UILabel *)self->_prefix frame];
    CLKCeilForDevice();
    double v3 = v3 + v7;
  }
  [(NTKTimeIntervalLabel *)self _labelWidth];
  CLKCeilForDevice();
  double v9 = v8;
  [(UILabel *)self->_label frame];
  -[UILabel setFrame:](self->_label, "setFrame:", v3, 0.0, v9);
  CLKCeilForDevice();
  float v11 = v3 + v10;
  if ([(NTKTimeIntervalLabel *)self shouldShowDigits])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v12 = self->_digits;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          CLKCeilForDevice();
          double v19 = v18;
          [(UILabel *)self->_label frame];
          double v21 = v20;
          [v17 frame];
          double v23 = v22;
          [v17 frame];
          objc_msgSend(v17, "setFrame:", v19, v21, v23);
          float v11 = self->_digitWidth + v11;
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v14);
    }
  }
  if (self->_suffix)
  {
    CLKCeilForDevice();
    double v25 = v24;
    [(UILabel *)self->_suffix frame];
    double v27 = v26;
    [(UILabel *)self->_suffix frame];
    -[UILabel setFrame:](self->_suffix, "setFrame:", v25, 0.0, v27);
  }
}

- (void)_localeChanged
{
  createDateFormats();
  double v3 = _ImageCache(self->_device);
  [v3 removeAllObjects];

  [(NTKTimeIntervalLabel *)self _invalidateDigitImages];
}

- (id)getTimeText
{
  double v3 = self->_text;
  double time = self->_time;
  double v5 = time - self->_currentTextTime;
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  if (v5 >= 1.0)
  {
    self->_currentTextTime = round(time);
    uint64_t v6 = [(NTKTimeIntervalLabel *)self formatTimeInterval];

    double v3 = (NSString *)v6;
  }
  return v3;
}

- (id)formatTimeInterval
{
  double time = self->_time;
  if (time >= 0.0) {
    double v4 = self->_time;
  }
  else {
    double v4 = -time;
  }
  signed int v5 = vcvtmd_s64_f64(v4 / 60.0);
  uint64_t v6 = (v5 / 60);
  if (formatTimeInterval_onceToken != -1) {
    dispatch_once(&formatTimeInterval_onceToken, &__block_literal_global_26);
  }
  uint64_t v7 = (v5 % 60);
  if (self->_style) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (v5 + 59) >= 0x77;
  }
  BOOL v9 = !v8;
  self->_showSubSeconds = v9;
  if (self->_style == 1)
  {
    if (self->_isSigned) {
      double v10 = &__formatHourMinSigned;
    }
    else {
      double v10 = &__formatHourMin;
    }
    double v11 = (double)(int)v6;
    if (time < 0.0) {
      double v11 = -(double)(int)v6;
    }
    float v12 = v11;
    objc_msgSend(NSString, "localizedStringWithFormat:", *v10, v12, (v5 % 60), v17);
  }
  else
  {
    int v13 = 60 * v5;
    uint64_t v14 = (int)(v4 - (double)(60 * v5));
    if ([(NTKTimeIntervalLabel *)self showSubSeconds]) {
      objc_msgSend(NSString, "localizedStringWithFormat:", __formatMinSecSubsec, v7, v14, ((int)llround((v4 - (double)(v13 + (int)v14)) * 100.0) % 100));
    }
    else {
      objc_msgSend(NSString, "localizedStringWithFormat:", __formatHourMinSec, v6, v7, v14);
    }
  uint64_t v15 = };
  return v15;
}

- (BOOL)shouldShowDigits
{
  if (self->_frozen) {
    return 0;
  }
  if (self->_showSubSeconds) {
    return 1;
  }
  return self->_style == 1;
}

- (void)setTime:(double)a3
{
  if (self->_time != a3) {
    -[NTKTimeIntervalLabel forceTime:](self, "forceTime:");
  }
}

- (void)setSuffix:(id)a3
{
  id v4 = a3;
  suffix = self->_suffix;
  id v16 = v4;
  if (!v4)
  {
    [(UILabel *)suffix removeFromSuperview];
    double v10 = self->_suffix;
    self->_suffix = 0;

LABEL_10:
    uint64_t v15 = v16;
    goto LABEL_11;
  }
  if (!suffix)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v8 = self->_suffix;
    self->_suffix = v7;

    if (self->_suffixSmallCaps)
    {
      BOOL v9 = [(CLKFont *)self->_font CLKFontWithLocalizedSmallCaps];
      [(UILabel *)self->_suffix setFont:v9];
    }
    else
    {
      [(UILabel *)self->_suffix setFont:self->_font];
    }
    double v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)self->_suffix setBackgroundColor:v11];

    float v12 = [(UILabel *)self->_label textColor];
    [(UILabel *)self->_suffix setTextColor:v12];

    [(UILabel *)self->_suffix setTextAlignment:0];
    [(NTKTimeIntervalLabel *)self addSubview:self->_suffix];
    suffix = self->_suffix;
  }
  int v13 = [(UILabel *)suffix text];
  char v14 = [v16 isEqual:v13];

  uint64_t v15 = v16;
  if ((v14 & 1) == 0)
  {
    [(UILabel *)self->_suffix setText:v16];
    [(UILabel *)self->_suffix sizeToFit];
    goto LABEL_10;
  }
LABEL_11:
}

- (NSString)suffix
{
  return [(UILabel *)self->_suffix text];
}

- (void)setPrefix:(id)a3
{
  id v4 = a3;
  prefix = self->_prefix;
  id v16 = v4;
  if (!v4)
  {
    [(UILabel *)prefix removeFromSuperview];
    double v10 = self->_prefix;
    self->_prefix = 0;

LABEL_10:
    uint64_t v15 = v16;
    goto LABEL_11;
  }
  if (!prefix)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v8 = self->_prefix;
    self->_prefix = v7;

    if (self->_suffixSmallCaps)
    {
      BOOL v9 = [(CLKFont *)self->_font CLKFontWithLocalizedSmallCaps];
      [(UILabel *)self->_prefix setFont:v9];
    }
    else
    {
      [(UILabel *)self->_prefix setFont:self->_font];
    }
    double v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)self->_prefix setBackgroundColor:v11];

    float v12 = [(UILabel *)self->_label textColor];
    [(UILabel *)self->_prefix setTextColor:v12];

    [(UILabel *)self->_prefix setTextAlignment:0];
    [(NTKTimeIntervalLabel *)self addSubview:self->_prefix];
    prefix = self->_prefix;
  }
  int v13 = [(UILabel *)prefix text];
  char v14 = [v16 isEqual:v13];

  uint64_t v15 = v16;
  if ((v14 & 1) == 0)
  {
    [(UILabel *)self->_prefix setText:v16];
    [(UILabel *)self->_prefix sizeToFit];
    goto LABEL_10;
  }
LABEL_11:
}

- (NSString)prefix
{
  return [(UILabel *)self->_prefix text];
}

- (void)forceTime:(double)a3
{
  self->_double time = a3;
  id v4 = [(NTKTimeIntervalLabel *)self getTimeText];
  text = self->_text;
  self->_text = v4;

  if ([(NTKTimeIntervalLabel *)self shouldShowDigits])
  {
    [(NTKTimeIntervalLabel *)self createDigitViews];
    double time = self->_time;
    if (time >= 0.0) {
      double v7 = self->_time;
    }
    else {
      double v7 = -time;
    }
    signed int v8 = vcvtmd_s64_f64(v7 / 60.0);
    int v9 = v8 % 60;
    if ([(NTKTimeIntervalLabel *)self showSubSeconds])
    {
      double v10 = v7 - (double)((int)(v7 - (double)(60 * v8)) + 60 * v9);
      signed int v11 = llround(v10 * 10.0);
      int v9 = llround(v10 * 100.0);
    }
    else
    {
      signed int v11 = (((103 * (char)v9) >> 15) & 1) + ((103 * (char)v9) >> 10);
    }
    int v14 = v11 % 10;
    int v15 = v9 % 10;
    int v13 = [(NSMutableArray *)self->_digits objectAtIndexedSubscript:0];
    id v16 = [(NTKTimeIntervalLabel *)self _localImageForDigit:v14];
    uint64_t v17 = [v13 image];

    if (v16 != v17) {
      [v13 setImage:v16];
    }
    double v18 = [(NSMutableArray *)self->_digits objectAtIndexedSubscript:1];
    double v19 = [(NTKTimeIntervalLabel *)self _localImageForDigit:v15];
    double v20 = [v18 image];

    if (v19 != v20) {
      [v18 setImage:v19];
    }
    [v13 setHidden:0];
    [v18 setHidden:0];
    double v21 = -[NSString substringWithRange:](self->_text, "substringWithRange:", 0, [(NSString *)self->_text length] - 2);
    [(NTKTimeIntervalLabel *)self setLabelText:v21];
  }
  else
  {
    [(NTKTimeIntervalLabel *)self setLabelText:self->_text];
    float v12 = [(NSMutableArray *)self->_digits objectAtIndexedSubscript:0];
    [v12 setHidden:1];

    int v13 = [(NSMutableArray *)self->_digits objectAtIndexedSubscript:1];
    [v13 setHidden:1];
  }

  [(NTKTimeIntervalLabel *)self sizeToFitLabelIfNeeded];
}

- (void)sizeToFitLabelIfNeeded
{
  BOOL isShowingDigits = self->_isShowingDigits;
  if (isShowingDigits != [(NTKTimeIntervalLabel *)self shouldShowDigits] || !self->_labelWasSized)
  {
    self->_BOOL isShowingDigits = [(NTKTimeIntervalLabel *)self shouldShowDigits];
    self->_labelWasSized = 1;
    [(UILabel *)self->_label sizeToFit];
    id didResizeHandler = self->_didResizeHandler;
    if (didResizeHandler)
    {
      signed int v5 = (void (*)(void))*((void *)didResizeHandler + 2);
      v5();
    }
  }
}

- (void)setFrozen:(BOOL)a3
{
  if (self->_frozen != a3)
  {
    BOOL v3 = a3;
    self->_frozen = a3;
    signed int v5 = [(NSMutableArray *)self->_digits objectAtIndexedSubscript:0];
    [v5 setHidden:v3];

    id v6 = [(NSMutableArray *)self->_digits objectAtIndexedSubscript:1];
    [v6 setHidden:v3];

    [(NTKTimeIntervalLabel *)self setNeedsLayout];
  }
}

- (void)recalculateSize
{
  [(NTKTimeIntervalLabel *)self calculateMetrics];
  [(NTKTimeIntervalLabel *)self sizeToFit];
  [(NTKTimeIntervalLabel *)self setNeedsLayout];
}

- (void)setLabelText:(id)a3
{
  id v12 = a3;
  id v4 = [(UILabel *)self->_label text];
  char v5 = NTKEqualStrings(v12, v4);

  if ((v5 & 1) == 0)
  {
    id v6 = [(UILabel *)self->_label text];
    uint64_t v7 = [v6 length];
    uint64_t v8 = [v12 length];

    if (v7 != v8) {
      [(NTKTimeIntervalLabel *)self recalculateSize];
    }
    if (self->_isSigned)
    {
      int v9 = [(UILabel *)self->_label text];
      int v10 = [v9 characterAtIndex:0];
      int v11 = [v12 characterAtIndex:0];

      if (v10 != v11) {
        [(NTKTimeIntervalLabel *)self recalculateSize];
      }
    }
    [(UILabel *)self->_label setText:v12];
  }
}

- (void)setTextColor:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_label textColor];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_label setTextColor:v6];
    [(NTKTimeIntervalLabel *)self _invalidateDigitImages];
  }
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_font] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(UILabel *)self->_label setFont:v5];
  }
}

- (UIColor)textColor
{
  return [(UILabel *)self->_label textColor];
}

- (void)_invalidateDigitImages
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_digits;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "removeFromSuperview", (void)v10);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  digits = self->_digits;
  self->_digits = 0;

  images = self->_images;
  self->_images = 0;
}

- (id)_cachedImageForDigit:(unint64_t)a3
{
  uint64_t v5 = [(UILabel *)self->_label textColor];
  [(CLKFont *)self->_font pointSize];
  uint64_t v7 = _cacheKeyString(a3, v5, v6);
  uint64_t v8 = _ImageCache(self->_device);
  int v9 = [v8 imageForKey:v7];

  if (!v9)
  {
    long long v10 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%tu", a3);
    int v9 = [v10 imageWithFont:self->_font border:0 color:v5 cropped:0];
    long long v11 = _ImageCache(self->_device);
    [v11 setImage:v9 forKey:v7];
  }
  return v9;
}

- (double)time
{
  return self->_time;
}

- (BOOL)suffixSmallCaps
{
  return self->_suffixSmallCaps;
}

- (void)setSuffixSmallCaps:(BOOL)a3
{
  self->_suffixSmallCaps = a3;
}

- (CLKFont)font
{
  return self->_font;
}

- (BOOL)showSubSeconds
{
  return self->_showSubSeconds;
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (CGSize)textSize
{
  double width = self->_textSize.width;
  double height = self->_textSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)didResizeHandler
{
  return self->_didResizeHandler;
}

- (void)setDidResizeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didResizeHandler, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end