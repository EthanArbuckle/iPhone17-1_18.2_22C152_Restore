@interface _UINavTitleAppearanceData
+ (id)decodeFromCoder:(id)a3 prefix:(id)a4;
+ (id)standardTitleDataForIdiom:(int64_t)a3;
- (BOOL)checkEqualTo:(id)a3;
- (NSDictionary)largeTitleTextAttributes;
- (NSDictionary)titleTextAttributes;
- (UIOffset)titlePositionAdjustment;
- (id)replicate;
- (int64_t)hashInto:(int64_t)a3;
- (void)describeInto:(id)a3;
- (void)encodeToCoder:(id)a3 prefix:(id)a4;
- (void)setLargeTitleTextAttributes:(id)a3;
- (void)setTitlePositionAdjustment:(UIOffset)a3;
- (void)setTitleTextAttributes:(id)a3;
@end

@implementation _UINavTitleAppearanceData

- (UIOffset)titlePositionAdjustment
{
  double horizontal = self->_titlePositionAdjustment.horizontal;
  double vertical = self->_titlePositionAdjustment.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setTitleTextAttributes:(id)a3
{
  id v9 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  if (v9)
  {
    v5 = [(_UINavigationBarTitleFontProvider *)self->_titleFontProvider defaultInlineTitleFont];
    v6 = _UINavigationTitleAppearanceCompleteAttributesWithFont(v9, v5);
    v7 = (NSDictionary *)[v6 copy];
    titleTextAttributes = self->_titleTextAttributes;
    self->_titleTextAttributes = v7;
  }
  else
  {
    v5 = self->_titleTextAttributes;
    self->_titleTextAttributes = 0;
  }
}

- (id)replicate
{
  v9.receiver = self;
  v9.super_class = (Class)_UINavTitleAppearanceData;
  uint64_t v3 = [(_UIBarAppearanceData *)&v9 replicate];
  uint64_t v4 = [(NSDictionary *)self->_titleTextAttributes copy];
  v5 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v4;

  uint64_t v6 = [(NSDictionary *)self->_largeTitleTextAttributes copy];
  v7 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v6;

  *(UIOffset *)(v3 + 32) = self->_titlePositionAdjustment;
  *(void *)(v3 + 56) = self->_titleFontProviderIdiom;
  objc_storeStrong((id *)(v3 + 48), self->_titleFontProvider);
  return (id)v3;
}

- (BOOL)checkEqualTo:(id)a3
{
  uint64_t v4 = (double *)a3;
  v17.receiver = self;
  v17.super_class = (Class)_UINavTitleAppearanceData;
  if (![(_UIBarAppearanceData *)&v17 checkEqualTo:v4]
    || self->_titleFontProviderIdiom != *((void *)v4 + 7))
  {
    goto LABEL_7;
  }
  if (self->_titlePositionAdjustment.horizontal != v4[4] || self->_titlePositionAdjustment.vertical != v4[5]) {
    goto LABEL_7;
  }
  v8 = (void *)*((void *)v4 + 2);
  objc_super v9 = self->_titleTextAttributes;
  v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_18;
  }
  v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    char v6 = 0;
LABEL_23:

    goto LABEL_8;
  }
  int v13 = [(NSDictionary *)v9 isEqual:v10];

  if (v13)
  {
LABEL_18:
    largeTitleTextAttributes = self->_largeTitleTextAttributes;
    v15 = (void *)*((void *)v4 + 3);
    objc_super v9 = largeTitleTextAttributes;
    v16 = v15;
    if (v9 == v16)
    {
      char v6 = 1;
      v11 = v9;
    }
    else
    {
      v11 = v16;
      char v6 = 0;
      if (v9 && v16) {
        char v6 = [(NSDictionary *)v9 isEqual:v16];
      }
    }
    goto LABEL_23;
  }
LABEL_7:
  char v6 = 0;
LABEL_8:

  return v6;
}

- (NSDictionary)largeTitleTextAttributes
{
  largeTitleTextAttributes = self->_largeTitleTextAttributes;
  if (largeTitleTextAttributes)
  {
    uint64_t v3 = largeTitleTextAttributes;
  }
  else
  {
    uint64_t v4 = [(_UINavigationBarTitleFontProvider *)self->_titleFontProvider defaultLargeTitleFont];
    _UINavigationTitleAppearanceAttributesWithFont(v4);
    uint64_t v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSDictionary)titleTextAttributes
{
  titleTextAttributes = self->_titleTextAttributes;
  if (titleTextAttributes)
  {
    uint64_t v3 = titleTextAttributes;
  }
  else
  {
    uint64_t v4 = [(_UINavigationBarTitleFontProvider *)self->_titleFontProvider defaultInlineTitleFont];
    _UINavigationTitleAppearanceAttributesWithFont(v4);
    uint64_t v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setLargeTitleTextAttributes:(id)a3
{
  id v9 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  if (v9)
  {
    v5 = [(_UINavigationBarTitleFontProvider *)self->_titleFontProvider defaultLargeTitleFont];
    char v6 = _UINavigationTitleAppearanceCompleteAttributesWithFont(v9, v5);
    v7 = (NSDictionary *)[v6 copy];
    largeTitleTextAttributes = self->_largeTitleTextAttributes;
    self->_largeTitleTextAttributes = v7;
  }
  else
  {
    v5 = self->_largeTitleTextAttributes;
    self->_largeTitleTextAttributes = 0;
  }
}

+ (id)standardTitleDataForIdiom:(int64_t)a3
{
  uint64_t v4 = (void *)_UIStandardTitleData;
  if (!_UIStandardTitleData)
  {
    uint64_t v5 = objc_opt_new();
    char v6 = (void *)_UIStandardTitleData;
    _UIStandardTitleData = v5;

    uint64_t v4 = (void *)_UIStandardTitleData;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    a3 = 0;
  }
  v7 = [NSNumber numberWithInteger:a3];
  v8 = [v4 objectForKeyedSubscript:v7];

  if (!v8)
  {
    v8 = objc_opt_new();
    id v9 = (void *)v8[2];
    v8[2] = 0;

    v10 = (void *)v8[3];
    v8[3] = 0;

    v8[4] = 0;
    v8[5] = 0;
    uint64_t v11 = +[_UINavigationBarTitleFontProvider providerForIdiom:a3];
    BOOL v12 = (void *)v8[6];
    v8[6] = v11;

    v8[7] = a3;
    id v13 = (id)[v8 markReadOnly];
    v14 = (void *)_UIStandardTitleData;
    v15 = [NSNumber numberWithInteger:a3];
    [v14 setObject:v8 forKeyedSubscript:v15];
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleFontProvider, 0);
  objc_storeStrong((id *)&self->_largeTitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_titleTextAttributes, 0);
}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [NSString stringWithFormat:@"%@.%@", v6, @"InlineAttributes"];
    uint64_t v8 = objc_msgSend(v5, "_ui_decodeTextAttributesForKey:", v7);

    id v9 = [NSString stringWithFormat:@"%@.%@", v6, @"LargeAttributes"];
    uint64_t v10 = objc_msgSend(v5, "_ui_decodeTextAttributesForKey:", v9);

    uint64_t v11 = [NSString stringWithFormat:@"%@.%@", v6, @"InlineOffset"];
    [v5 decodeUIOffsetForKey:v11];
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    uint64_t v8 = objc_msgSend(v5, "_ui_decodeTextAttributesForKey:", @"InlineAttributes");
    uint64_t v10 = objc_msgSend(v5, "_ui_decodeTextAttributesForKey:", @"LargeAttributes");
    [v5 decodeUIOffsetForKey:@"InlineOffset"];
    double v13 = v16;
    double v15 = v17;
  }
  if (!(v8 | v10) && v13 == 0.0 && v15 == 0.0)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = objc_opt_new();
    objc_storeStrong((id *)(v18 + 16), (id)v8);
    *(double *)(v18 + 32) = v13;
    *(double *)(v18 + 40) = v15;
    objc_storeStrong((id *)(v18 + 24), (id)v10);
    v19 = @"TitleProviderIdiom";
    if (v6)
    {
      v19 = [NSString stringWithFormat:@"%@.%@", v6, @"TitleProviderIdiom"];
    }
    if ([v5 containsValueForKey:v19]) {
      uint64_t v20 = [v5 decodeIntegerForKey:v19];
    }
    else {
      uint64_t v20 = 0;
    }
    *(void *)(v18 + 56) = v20;
    uint64_t v21 = +[_UINavigationBarTitleFontProvider providerForIdiom:](_UINavigationBarTitleFontProvider, "providerForIdiom:");
    v22 = *(void **)(v18 + 48);
    *(void *)(v18 + 48) = v21;
  }
  return (id)v18;
}

- (void)encodeToCoder:(id)a3 prefix:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  v7 = (void *)_UIStandardTitleData;
  uint64_t v8 = [NSNumber numberWithInteger:self->_titleFontProviderIdiom];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9 == self) {
    goto LABEL_21;
  }
  titleTextAttributes = self->_titleTextAttributes;
  if (titleTextAttributes)
  {
    if (v6)
    {
      uint64_t v11 = [NSString stringWithFormat:@"%@.%@", v6, @"InlineAttributes"];
      objc_msgSend(v20, "_ui_encodeTextAttributes:forKey:", titleTextAttributes, v11);
    }
    else
    {
      objc_msgSend(v20, "_ui_encodeTextAttributes:forKey:", self->_titleTextAttributes, @"InlineAttributes");
    }
  }
  if (self->_titlePositionAdjustment.horizontal == 0.0 && self->_titlePositionAdjustment.vertical == 0.0) {
    goto LABEL_10;
  }
  if (v6)
  {
    double v12 = [NSString stringWithFormat:@"%@.%@", v6, @"InlineOffset"];
    objc_msgSend(v20, "encodeUIOffset:forKey:", v12, self->_titlePositionAdjustment.horizontal, self->_titlePositionAdjustment.vertical);

LABEL_10:
    largeTitleTextAttributes = self->_largeTitleTextAttributes;
    if (!largeTitleTextAttributes) {
      goto LABEL_17;
    }
    if (v6)
    {
      double v14 = [NSString stringWithFormat:@"%@.%@", v6, @"LargeAttributes"];
      objc_msgSend(v20, "_ui_encodeTextAttributes:forKey:", largeTitleTextAttributes, v14);

      goto LABEL_17;
    }
    double v16 = v20;
    double v15 = self->_largeTitleTextAttributes;
    goto LABEL_16;
  }
  objc_msgSend(v20, "encodeUIOffset:forKey:", @"InlineOffset");
  double v15 = self->_largeTitleTextAttributes;
  if (!v15) {
    goto LABEL_17;
  }
  double v16 = v20;
LABEL_16:
  objc_msgSend(v16, "_ui_encodeTextAttributes:forKey:", v15, @"LargeAttributes");
LABEL_17:
  unint64_t titleFontProviderIdiom = self->_titleFontProviderIdiom;
  if (titleFontProviderIdiom > 5 || ((1 << titleFontProviderIdiom) & 0x23) == 0)
  {
    if (v6)
    {
      v19 = [NSString stringWithFormat:@"%@.%@", v6, @"TitleProviderIdiom"];
      [v20 encodeInteger:titleFontProviderIdiom forKey:v19];
    }
    else
    {
      [v20 encodeInteger:titleFontProviderIdiom forKey:@"TitleProviderIdiom"];
    }
  }
LABEL_21:
}

- (void)describeInto:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UINavTitleAppearanceData;
  [(_UIBarAppearanceData *)&v8 describeInto:v4];
  [v4 appendString:@" titleTextAttributes="];
  _UIBADPrettyPrintTextAttributes(v4, self->_titleTextAttributes);
  double vertical = self->_titlePositionAdjustment.vertical;
  if (self->_titlePositionAdjustment.horizontal != 0.0 || vertical != 0.0)
  {
    CGFloat horizontal = self->_titlePositionAdjustment.horizontal;
    v7 = NSStringFromUIOffset(*(UIOffset *)(&vertical - 1));
    [v4 appendFormat:@" titlePositionAdjustment=%@", v7];
  }
  [v4 appendString:@" largeTitleTextAttributes="];
  _UIBADPrettyPrintTextAttributes(v4, self->_largeTitleTextAttributes);
}

- (int64_t)hashInto:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavTitleAppearanceData;
  return [(_UIBarAppearanceData *)&v4 hashInto:a3];
}

- (void)setTitlePositionAdjustment:(UIOffset)a3
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  self->_titlePositionAdjustment.CGFloat horizontal = horizontal;
  self->_titlePositionAdjustment.CGFloat vertical = vertical;
}

@end