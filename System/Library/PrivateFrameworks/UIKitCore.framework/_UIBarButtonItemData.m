@interface _UIBarButtonItemData
+ (id)decodeFromCoder:(id)a3 prefix:(id)a4;
+ (id)standardBackButtonData;
+ (id)standardItemDataForStyle:(int64_t)a3;
- (BOOL)checkEqualTo:(id)a3;
- (BOOL)isBackButtonData;
- (UIImage)backIndicatorImage;
- (UIImage)backIndicatorTransitionMaskImage;
- (UIImage)compactBackIndicatorImage;
- (UIImageSymbolConfiguration)backIndicatorSymbolConfiguration;
- (UIImageSymbolConfiguration)backIndicatorTransitionMaskSymbolConfiguration;
- (UIImageSymbolConfiguration)compactBackIndicatorSymbolConfiguration;
- (UIImageSymbolConfiguration)compactBackIndicatorTransitionMaskSymbolConfiguration;
- (UIImageSymbolConfiguration)compactImageSymbolConfiguration;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (UIOffset)backgroundImagePositionAdjustmentForState:(int64_t)a3;
- (UIOffset)backgroundImagePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4;
- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3;
- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4;
- (_UIBarButtonItemData)dataWithNewFallback:(id)a3;
- (_UIBarButtonItemData)initWithStyle:(int64_t)a3;
- (_UIBarButtonItemDataFallback)fallback;
- (id)__backIndicatorConfigurationForConfig:(uint64_t)a3 withScale:;
- (id)_fallbackColorForState:(int64_t)a3;
- (id)_fallbackFontForState:(int64_t)a3;
- (id)backIndicatorTextStyleForSymbolConfiguration;
- (id)backgroundImageForState:(int64_t)a3;
- (id)backgroundImageForState:(int64_t)a3 style:(int64_t)a4;
- (id)colorForState:(int64_t)a3 style:(int64_t)a4;
- (id)copyAsBackButtonDataWithIndicatorsAndFallbackFrom:(id)a3;
- (id)fontForState:(int64_t)a3 style:(int64_t)a4;
- (id)replicate;
- (id)textStyleForSymbolConfiguration;
- (id)titleTextAttributesForState:(int64_t)a3;
- (int64_t)hashInto:(int64_t)a3;
- (int64_t)style;
- (void)_decodeBackgroundImagesFromCoder:(id)a3 prefix:(id)a4;
- (void)_decodeBackgroundPositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4;
- (void)_decodeTitlePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4;
- (void)_decodeTitleTextAttributesFromCoder:(id)a3 prefix:(id)a4;
- (void)describeInto:(id)a3;
- (void)encodeToCoder:(id)a3 prefix:(id)a4;
- (void)resetBackIndicatorImages;
- (void)setBackIndicatorImage:(id)a3 transitionMaskImage:(id)a4;
- (void)setBackgroundImage:(id)a3 forState:(int64_t)a4;
- (void)setBackgroundImagePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4;
- (void)setTitlePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4;
- (void)setTitleTextAttributes:(id)a3 forState:(int64_t)a4;
@end

@implementation _UIBarButtonItemData

- (id)backgroundImageForState:(int64_t)a3
{
  if ((*(unsigned char *)&self->_stateFlags[2 * a3] & 8) != 0)
  {
    v3 = self->_backgroundImage[a3];
  }
  else
  {
    -[_UIBarButtonItemDataFallback backgroundImageForState:style:](self->_fallback, "backgroundImageForState:style:");
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)titleTextAttributesForState:(int64_t)a3
{
  v5 = &self->_stateFlags[2 * a3];
  if (*(unsigned char *)v5)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)v5 & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = [(_UIBarButtonItemData *)self _fallbackFontForState:a3];
    if ((*(unsigned char *)v5 & 2) != 0)
    {
LABEL_3:
      uint64_t v7 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v7 = [(_UIBarButtonItemData *)self _fallbackColorForState:a3];
LABEL_6:
  v8 = self->_titleTextAttributes[a3];
  if (v6 | v7)
  {
    v9 = (void *)[(NSDictionary *)v8 mutableCopy];
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v12 = v11;

    if (v6) {
      [(NSDictionary *)v12 setObject:v6 forKeyedSubscript:*(void *)off_1E52D2040];
    }
    if (v7) {
      [(NSDictionary *)v12 setObject:v7 forKeyedSubscript:*(void *)off_1E52D2048];
    }
  }
  else
  {
    v12 = v8;
  }

  return v12;
}

- (id)_fallbackFontForState:(int64_t)a3
{
  if (a3 == 3 && (*(unsigned char *)&self->_stateFlags[2] & 1) != 0)
  {
    v4 = self->_titleTextAttributes[1];
  }
  else
  {
    if ((*(unsigned char *)self->_stateFlags & 1) == 0)
    {
      v3 = -[_UIBarButtonItemDataFallback fontForState:style:](self->_fallback, "fontForState:style:");
      goto LABEL_8;
    }
    v4 = self->_titleTextAttributes[0];
  }
  v3 = [(NSDictionary *)v4 objectForKeyedSubscript:*(void *)off_1E52D2040];
LABEL_8:
  return v3;
}

- (id)_fallbackColorForState:(int64_t)a3
{
  if (a3 == 3 && (*(unsigned char *)&self->_stateFlags[2] & 2) != 0)
  {
    uint64_t v4 = [(NSDictionary *)self->_titleTextAttributes[1] objectForKeyedSubscript:*(void *)off_1E52D2048];
    goto LABEL_8;
  }
  if ((*(unsigned char *)self->_stateFlags & 2) == 0)
  {
    uint64_t v4 = [(_UIBarButtonItemDataFallback *)self->_fallback colorForState:a3 style:self->_style];
LABEL_8:
    v5 = (void *)v4;
    goto LABEL_9;
  }
  v5 = [(NSDictionary *)self->_titleTextAttributes[0] objectForKeyedSubscript:*(void *)off_1E52D2048];
  if (a3 == 2)
  {
    uint64_t v6 = +[UIColor _disabledColorForColor:]((uint64_t)UIColor, v5);

    v5 = (void *)v6;
  }
LABEL_9:
  return v5;
}

+ (id)standardItemDataForStyle:(int64_t)a3
{
  if (a3 && a3 != 7)
  {
    if (a3 == 2)
    {
      uint64_t v4 = &_MergedGlobals_3_22;
      id v5 = (id)_MergedGlobals_3_22;
      if (_MergedGlobals_3_22) {
        goto LABEL_11;
      }
      uint64_t v6 = 2;
      goto LABEL_10;
    }
    if (dyld_program_sdk_at_least())
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_UIBarButtonItemData.m", 134, @"Unsupported style: %li", a3);
    }
  }
  uint64_t v4 = &qword_1EB25CF48;
  id v5 = (id)qword_1EB25CF48;
  if (qword_1EB25CF48) {
    goto LABEL_11;
  }
  uint64_t v6 = 0;
LABEL_10:
  v9 = [[_UIBarButtonItemData alloc] initWithStyle:v6];
  id v10 = (id)*v4;
  uint64_t *v4 = (uint64_t)v9;

  id v11 = (id)[(id)*v4 markReadOnly];
  id v5 = (id)*v4;
LABEL_11:
  id v12 = v5;
  return v12;
}

- (id)fontForState:(int64_t)a3 style:(int64_t)a4
{
  if (*(unsigned char *)&self->_stateFlags[2 * a3]) {
    -[NSDictionary objectForKeyedSubscript:](self->_titleTextAttributes[a3], "objectForKeyedSubscript:", *(void *)off_1E52D2040, a4);
  }
  else {
  uint64_t v4 = -[_UIBarButtonItemData _fallbackFontForState:](self, "_fallbackFontForState:");
  }
  return v4;
}

- (id)colorForState:(int64_t)a3 style:(int64_t)a4
{
  if ((*(unsigned char *)&self->_stateFlags[2 * a3] & 2) != 0) {
    -[NSDictionary objectForKeyedSubscript:](self->_titleTextAttributes[a3], "objectForKeyedSubscript:", *(void *)off_1E52D2048, a4);
  }
  else {
  uint64_t v4 = -[_UIBarButtonItemData _fallbackColorForState:](self, "_fallbackColorForState:");
  }
  return v4;
}

- (id)backgroundImageForState:(int64_t)a3 style:(int64_t)a4
{
  if ((*(unsigned char *)&self->_stateFlags[2 * a3] & 8) != 0)
  {
    uint64_t v4 = self->_backgroundImage[a3];
  }
  else
  {
    -[_UIBarButtonItemDataFallback backgroundImageForState:style:](self->_fallback, "backgroundImageForState:style:");
    uint64_t v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  imageSymbolConfiguration = self->_imageSymbolConfiguration;
  if (!imageSymbolConfiguration)
  {
    if (*(unsigned char *)self->_stateFlags)
    {
      uint64_t v6 = [(_UIBarButtonItemData *)self titleTextAttributesForState:0];
      uint64_t v4 = [v6 objectForKeyedSubscript:*(void *)off_1E52D2040];

      +[UIImageSymbolConfiguration configurationWithFont:v4 scale:3];
    }
    else
    {
      uint64_t v4 = [(_UIBarButtonItemData *)self textStyleForSymbolConfiguration];
      +[UIImageSymbolConfiguration configurationWithTextStyle:v4 scale:3];
    }
    id v5 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_imageSymbolConfiguration;
    self->_imageSymbolConfiguration = v5;

    imageSymbolConfiguration = self->_imageSymbolConfiguration;
  }
  return imageSymbolConfiguration;
}

- (id)textStyleForSymbolConfiguration
{
  return (id)[(_UIBarButtonItemDataFallback *)self->_fallback textStyleForSymbolConfiguration];
}

- (_UIBarButtonItemData)dataWithNewFallback:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIBarAppearanceData *)self writableInstance];
  uint64_t v6 = v4;
  if (!v4)
  {
    uint64_t v6 = +[_UIBarButtonItemDataBaseFallback fallback];
  }
  objc_storeStrong(v5 + 32, v6);
  if (!v4) {

  }
  return (_UIBarButtonItemData *)v5;
}

- (BOOL)checkEqualTo:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_UIBarButtonItemData;
  if (![(_UIBarAppearanceData *)&v30 checkEqualTo:v4]
    || self->_style != v4[38]
    || ((*((unsigned __int8 *)v4 + 296) ^ *(unsigned char *)&self->_dataFlags) & 1) != 0)
  {
    goto LABEL_46;
  }
  id v5 = (void *)v4[32];
  uint64_t v6 = self->_fallback;
  uint64_t v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_45;
    }
    BOOL v10 = [(UIImage *)v6 isEqual:v7];

    if (!v10) {
      goto LABEL_46;
    }
  }
  id v11 = (void *)v4[28];
  uint64_t v6 = self->_backIndicatorImage;
  id v12 = v11;
  if (v6 == v12)
  {
  }
  else
  {
    v8 = v12;
    if (!v6 || !v12) {
      goto LABEL_45;
    }
    BOOL v13 = [(UIImage *)v6 isEqual:v12];

    if (!v13) {
      goto LABEL_46;
    }
  }
  v14 = (void *)v4[29];
  uint64_t v6 = self->_backIndicatorTransitionMaskImage;
  v15 = v14;
  if (v6 != v15)
  {
    v8 = v15;
    if (v6 && v15)
    {
      BOOL v16 = [(UIImage *)v6 isEqual:v15];

      if (!v16) {
        goto LABEL_46;
      }
      goto LABEL_24;
    }
LABEL_45:

    goto LABEL_46;
  }

LABEL_24:
  uint64_t v17 = 0;
  while (1)
  {
    int32x2_t v18 = vmovn_s64(vceqq_f64((float64x2_t)self->_titlePositionAdjustment[v17], *(float64x2_t *)&v4[2 * v17 + 10]));
    if ((v18.i32[0] & v18.i32[1] & 1) == 0) {
      break;
    }
    int32x2_t v19 = vmovn_s64(vceqq_f64((float64x2_t)self->_backgroundImagePositionAdjustment[v17], *(float64x2_t *)&v4[2 * v17 + 18]));
    if ((v19.i32[0] & v19.i32[1] & 1) == 0) {
      break;
    }
    v20 = (void *)v4[v17 + 6];
    uint64_t v6 = self->_backgroundImage[v17];
    v21 = v20;
    if (v6 == v21)
    {
    }
    else
    {
      v8 = v21;
      if (v6) {
        BOOL v22 = v21 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22) {
        goto LABEL_45;
      }
      BOOL v23 = [(UIImage *)v6 isEqual:v21];

      if (!v23) {
        break;
      }
    }
    v24 = (void *)v4[v17 + 2];
    uint64_t v6 = self->_titleTextAttributes[v17];
    v25 = v24;
    if (v6 == v25)
    {
    }
    else
    {
      v8 = v25;
      if (v6) {
        BOOL v26 = v25 == 0;
      }
      else {
        BOOL v26 = 1;
      }
      if (v26) {
        goto LABEL_45;
      }
      BOOL v27 = [(UIImage *)v6 isEqual:v25];

      if (!v27) {
        break;
      }
    }
    ++v17;
    BOOL v28 = 1;
    if (v17 == 4) {
      goto LABEL_47;
    }
  }
LABEL_46:
  BOOL v28 = 0;
LABEL_47:

  return v28;
}

- (UIOffset)backgroundImagePositionAdjustmentForState:(int64_t)a3
{
  if ((*(unsigned char *)&self->_stateFlags[2 * a3] & 0x10) != 0)
  {
    backgroundImagePositionAdjustment = &self->_backgroundImagePositionAdjustment[a3];
LABEL_8:
    double horizontal = backgroundImagePositionAdjustment->horizontal;
    double vertical = backgroundImagePositionAdjustment->vertical;
    goto LABEL_11;
  }
  if (a3 == 3 && (*(unsigned char *)&self->_stateFlags[2] & 0x10) != 0)
  {
    double horizontal = self->_backgroundImagePositionAdjustment[1].horizontal;
    double vertical = self->_backgroundImagePositionAdjustment[1].vertical;
    goto LABEL_11;
  }
  if ((*(unsigned char *)self->_stateFlags & 0x10) != 0)
  {
    backgroundImagePositionAdjustment = self->_backgroundImagePositionAdjustment;
    goto LABEL_8;
  }
  -[_UIBarButtonItemDataFallback backgroundImagePositionAdjustmentForState:style:](self->_fallback, "backgroundImagePositionAdjustmentForState:style:");
LABEL_11:
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (id)copyAsBackButtonDataWithIndicatorsAndFallbackFrom:(id)a3
{
  id v4 = (id *)a3;
  if (!v4)
  {
    if (*(unsigned char *)&self->_dataFlags)
    {
      uint64_t v8 = [(_UIBarButtonItemData *)self copy];
    }
    else
    {
      if ((_UIBarButtonItemData *)qword_1EB25CF48 != self && _MergedGlobals_3_22 != (void)self) {
        goto LABEL_2;
      }
      uint64_t v8 = +[_UIBarButtonItemData standardBackButtonData];
    }
    uint64_t v6 = (id *)v8;
    goto LABEL_13;
  }
LABEL_2:
  uint64_t v5 = [(_UIBarButtonItemData *)self replicate];
  uint64_t v6 = (id *)v5;
  *(void *)(v5 + 304) = 0;
  *(unsigned char *)(v5 + 296) |= 1u;
  if (v4)
  {
    objc_storeStrong((id *)(v5 + 256), v4[32]);
    objc_storeStrong(v6 + 28, v4[28]);
    objc_storeStrong(v6 + 29, v4[29]);
  }
LABEL_13:

  return v6;
}

+ (id)standardBackButtonData
{
  v2 = (void *)qword_1EB25CF50;
  if (!qword_1EB25CF50)
  {
    v3 = [[_UIBarButtonItemData alloc] initWithStyle:0];
    id v4 = (void *)qword_1EB25CF50;
    qword_1EB25CF50 = (uint64_t)v3;

    uint64_t v5 = (void *)qword_1EB25CF50;
    *(unsigned char *)(qword_1EB25CF50 + 296) |= 1u;
    id v6 = (id)[v5 markReadOnly];
    v2 = (void *)qword_1EB25CF50;
  }
  return v2;
}

- (UIImageSymbolConfiguration)backIndicatorTransitionMaskSymbolConfiguration
{
  if (*(unsigned char *)&self->_dataFlags)
  {
    backIndicatorTransitionMaskImage = self->_backIndicatorTransitionMaskImage;
    if (backIndicatorTransitionMaskImage)
    {
      if ([(UIImage *)backIndicatorTransitionMaskImage isSymbolImage])
      {
LABEL_4:
        id v4 = -[_UIBarButtonItemData __backIndicatorConfigurationForConfig:withScale:](self, self->_backIndicatorSymbolConfiguration, 3);
        goto LABEL_7;
      }
    }
    else if (_UIBarsUseDynamicType())
    {
      goto LABEL_4;
    }
  }
  id v4 = 0;
LABEL_7:
  return (UIImageSymbolConfiguration *)v4;
}

- (UIImage)backIndicatorTransitionMaskImage
{
  if (*(unsigned char *)&self->_dataFlags)
  {
    backIndicatorTransitionMaskImage = self->_backIndicatorTransitionMaskImage;
    if (!backIndicatorTransitionMaskImage)
    {
      backIndicatorTransitionMaskImage = (UIImage *)backIndicatorTransitionMaskImage_indicatorMask;
      if (!backIndicatorTransitionMaskImage_indicatorMask)
      {
        if (_UIBarsUseDynamicType()) {
          id v4 = @"UINavigationBarTitleTransitionBackIndicatorMaskSymbol";
        }
        else {
          id v4 = @"UINavigationBarTitleTransitionBackIndicatorMask";
        }
        uint64_t v5 = +[UIImage kitImageNamed:v4];
        id v6 = (void *)backIndicatorTransitionMaskImage_indicatorMask;
        backIndicatorTransitionMaskImage_indicatorMask = v5;

        backIndicatorTransitionMaskImage = (UIImage *)backIndicatorTransitionMaskImage_indicatorMask;
      }
    }
    v2 = backIndicatorTransitionMaskImage;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (UIImageSymbolConfiguration)backIndicatorSymbolConfiguration
{
  if (*(unsigned char *)&self->_dataFlags)
  {
    backIndicatorImage = self->_backIndicatorImage;
    if (backIndicatorImage)
    {
      if ([(UIImage *)backIndicatorImage isSymbolImage])
      {
LABEL_4:
        id v4 = -[_UIBarButtonItemData __backIndicatorConfigurationForConfig:withScale:](self, self->_backIndicatorSymbolConfiguration, 3);
        goto LABEL_7;
      }
    }
    else if (_UIBarsUseDynamicType())
    {
      goto LABEL_4;
    }
  }
  id v4 = 0;
LABEL_7:
  return (UIImageSymbolConfiguration *)v4;
}

- (id)__backIndicatorConfigurationForConfig:(uint64_t)a3 withScale:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if (v5)
    {
      id v7 = v5;
    }
    else if (a1[264])
    {
      BOOL v9 = [a1 titleTextAttributesForState:0];
      BOOL v10 = [v9 objectForKeyedSubscript:*(void *)off_1E52D2040];

      id v11 = [v10 fontDescriptor];
      id v12 = [v11 fontDescriptorWithSymbolicTraits:2];

      BOOL v13 = [off_1E52D39B8 fontWithDescriptor:v12 size:0.0];
      id v7 = +[UIImageSymbolConfiguration configurationWithFont:v13 scale:a3];
    }
    else
    {
      uint64_t v8 = [a1 backIndicatorTextStyleForSymbolConfiguration];
      id v7 = +[UIImageSymbolConfiguration configurationWithTextStyle:v8 scale:a3];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)backIndicatorTextStyleForSymbolConfiguration
{
  return (id)[(_UIBarButtonItemDataFallback *)self->_fallback backIndicatorTextStyleForSymbolConfiguration];
}

- (UIImage)backIndicatorImage
{
  if (*(unsigned char *)&self->_dataFlags)
  {
    backIndicatorImage = self->_backIndicatorImage;
    if (!backIndicatorImage)
    {
      backIndicatorImage = (UIImage *)backIndicatorImage_indicator;
      if (!backIndicatorImage_indicator)
      {
        if (_UIBarsUseDynamicType()) {
          +[UIImage systemImageNamed:@"chevron.backward"];
        }
        else {
        uint64_t v4 = +[UIImage kitImageNamed:@"UINavigationBarBackIndicatorDefault"];
        }
        id v5 = (void *)backIndicatorImage_indicator;
        backIndicatorImage_indicator = v4;

        backIndicatorImage = (UIImage *)backIndicatorImage_indicator;
      }
    }
    v2 = backIndicatorImage;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (_UIBarButtonItemData)initWithStyle:(int64_t)a3
{
  if (a3 == 7) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = a3;
  }
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIBarButtonItemData.m", 165, @"Unknown or unsupported UIBarButtonItemStyle style %li", v4);
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIBarButtonItemData;
  id v5 = [(_UIBarButtonItemData *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    v5->_style = v4;
    uint64_t v7 = +[_UIBarButtonItemDataBaseFallback fallback];
    fallback = v6->_fallback;
    v6->_fallback = (_UIBarButtonItemDataFallback *)v7;
  }
  return v6;
}

- (int64_t)style
{
  return self->_style;
}

- (id)replicate
{
  v22.receiver = self;
  v22.super_class = (Class)_UIBarButtonItemData;
  uint64_t v3 = [(_UIBarAppearanceData *)&v22 replicate];
  *(void *)(v3 + 304) = self->_style;
  *(void *)(v3 + 296) = *(void *)&self->_dataFlags;
  objc_storeStrong((id *)(v3 + 256), self->_fallback);
  uint64_t v4 = [(UIImage *)self->_backIndicatorImage copy];
  id v5 = *(void **)(v3 + 224);
  *(void *)(v3 + 224) = v4;

  uint64_t v6 = [(UIImage *)self->_backIndicatorTransitionMaskImage copy];
  uint64_t v7 = *(void **)(v3 + 232);
  *(void *)(v3 + 232) = v6;

  uint64_t v8 = [(UIImageSymbolConfiguration *)self->_imageSymbolConfiguration copy];
  BOOL v9 = *(void **)(v3 + 208);
  *(void *)(v3 + 208) = v8;

  uint64_t v10 = [(UIImageSymbolConfiguration *)self->_compactImageSymbolConfiguration copy];
  id v11 = *(void **)(v3 + 216);
  *(void *)(v3 + 216) = v10;

  uint64_t v12 = [(UIImageSymbolConfiguration *)self->_backIndicatorSymbolConfiguration copy];
  BOOL v13 = *(void **)(v3 + 240);
  *(void *)(v3 + 240) = v12;

  uint64_t v14 = [(UIImageSymbolConfiguration *)self->_compactBackIndicatorSymbolConfiguration copy];
  v15 = *(void **)(v3 + 248);
  *(void *)(v3 + 248) = v14;

  uint64_t v16 = 0;
  unint64_t v17 = 0;
  uint64_t v18 = v3 + 16;
  do
  {
    uint64_t v19 = [(NSDictionary *)self->_titleTextAttributes[v17 / 2] copy];
    v20 = *(void **)(v18 + v17 * 4);
    *(void *)(v18 + v17 * 4) = v19;

    *(UIOffset *)(v3 + 80 + v16 * 16) = self->_titlePositionAdjustment[v16];
    objc_storeStrong((id *)(v3 + v17 * 4 + 48), self->_backgroundImage[v17 / 2]);
    *(UIOffset *)(v3 + 144 + v16 * 16) = self->_backgroundImagePositionAdjustment[v16];
    *(void *)(v3 + 264 + v17 * 4) = *(void *)&self->_stateFlags[v17];
    v17 += 2;
    ++v16;
  }
  while (v17 != 8);
  return (id)v3;
}

- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4
{
  if ((*(unsigned char *)&self->_stateFlags[2 * a3] & 4) != 0)
  {
    uint64_t v6 = &self->_titlePositionAdjustment[a3];
    double horizontal = v6->horizontal;
    double vertical = v6->vertical;
  }
  else
  {
    [(_UIBarButtonItemDataFallback *)self->_fallback titlePositionAdjustmentForState:a3 style:a3];
  }
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3
{
  if ((*(unsigned char *)&self->_stateFlags[2 * a3] & 4) != 0)
  {
    titlePositionAdjustment = &self->_titlePositionAdjustment[a3];
LABEL_8:
    double horizontal = titlePositionAdjustment->horizontal;
    double vertical = titlePositionAdjustment->vertical;
    goto LABEL_11;
  }
  if (a3 == 3 && (*(unsigned char *)&self->_stateFlags[2] & 4) != 0)
  {
    double horizontal = self->_titlePositionAdjustment[1].horizontal;
    double vertical = self->_titlePositionAdjustment[1].vertical;
    goto LABEL_11;
  }
  if ((*(unsigned char *)self->_stateFlags & 4) != 0)
  {
    titlePositionAdjustment = self->_titlePositionAdjustment;
    goto LABEL_8;
  }
  -[_UIBarButtonItemDataFallback titlePositionAdjustmentForState:style:](self->_fallback, "titlePositionAdjustmentForState:style:");
LABEL_11:
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallback, 0);
  objc_storeStrong((id *)&self->_compactBackIndicatorSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_backIndicatorSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_backIndicatorTransitionMaskImage, 0);
  objc_storeStrong((id *)&self->_backIndicatorImage, 0);
  objc_storeStrong((id *)&self->_compactImageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  for (uint64_t i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_backgroundImage[i], 0);
  titleTextAttributes = self->_titleTextAttributes;
  for (uint64_t j = 3; j != -1; --j)
    objc_storeStrong((id *)&titleTextAttributes[j], 0);
}

- (BOOL)isBackButtonData
{
  return *(unsigned char *)&self->_dataFlags & 1;
}

- (_UIBarButtonItemDataFallback)fallback
{
  return self->_fallback;
}

- (void)_decodeTitleTextAttributesFromCoder:(id)a3 prefix:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@.%@", v6, @"Normal.TitleTextAttributes"];
    uint64_t v8 = objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", v7);
  }
  else
  {
    uint64_t v8 = objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", @"Normal.TitleTextAttributes");
  }
  titleTextAttributes = self->_titleTextAttributes;
  objc_storeStrong((id *)self->_titleTextAttributes, v8);
  uint64_t v10 = *(void *)off_1E52D2040;
  id v11 = [v8 objectForKeyedSubscript:*(void *)off_1E52D2040];
  stateFlags = self->_stateFlags;
  *(unsigned char *)self->_stateFlags = *(unsigned char *)self->_stateFlags & 0xFE | (v11 != 0);

  uint64_t v13 = *(void *)off_1E52D2048;
  uint64_t v14 = [v8 objectForKeyedSubscript:*(void *)off_1E52D2048];
  *(unsigned char *)stateFlags = *(unsigned char *)stateFlags & 0xFD | (2 * (v14 != 0));

  if (v6)
  {
    v15 = [NSString stringWithFormat:@"%@.%@", v6, @"Highlighted.TitleTextAttributes"];
    uint64_t v16 = objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", v15);
  }
  else
  {
    uint64_t v16 = objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", @"Highlighted.TitleTextAttributes");
  }
  objc_storeStrong((id *)titleTextAttributes + 1, v16);
  unint64_t v17 = [v16 objectForKeyedSubscript:v10];
  *(unsigned char *)&stateFlags[2] = *(unsigned char *)&stateFlags[2] & 0xFE | (v17 != 0);

  uint64_t v18 = [v16 objectForKeyedSubscript:v13];
  *(unsigned char *)&stateFlags[2] = *(unsigned char *)&stateFlags[2] & 0xFD | (2 * (v18 != 0));

  if (v6)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%@.%@", v6, @"Disabled.TitleTextAttributes"];
    v20 = objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", v19);
  }
  else
  {
    v20 = objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", @"Disabled.TitleTextAttributes");
  }
  objc_storeStrong((id *)titleTextAttributes + 2, v20);
  v21 = [v20 objectForKeyedSubscript:v10];
  *(unsigned char *)&stateFlags[4] = *(unsigned char *)&stateFlags[4] & 0xFE | (v21 != 0);

  objc_super v22 = [v20 objectForKeyedSubscript:v13];
  *(unsigned char *)&stateFlags[4] = *(unsigned char *)&stateFlags[4] & 0xFD | (2 * (v22 != 0));

  if (v6)
  {
    BOOL v23 = [NSString stringWithFormat:@"%@.%@", v6, @"Focused.TitleTextAttributes"];
    objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", v23);
    v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v29, "_ui_decodeTextAttributesForKey:", @"Focused.TitleTextAttributes");
    v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v25 = titleTextAttributes[3];
  titleTextAttributes[3] = v24;
  BOOL v26 = v24;

  BOOL v27 = [(NSDictionary *)v26 objectForKeyedSubscript:v10];
  *(unsigned char *)&stateFlags[6] = *(unsigned char *)&stateFlags[6] & 0xFE | (v27 != 0);

  BOOL v28 = [(NSDictionary *)v26 objectForKeyedSubscript:v13];

  *(unsigned char *)&stateFlags[6] = *(unsigned char *)&stateFlags[6] & 0xFD | (2 * (v28 != 0));
}

- (void)_decodeBackgroundImagesFromCoder:(id)a3 prefix:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  if (v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v6, @"Normal.BackgroundImage"];
    BOOL v9 = [v24 decodeObjectOfClass:v7 forKey:v8];
  }
  else
  {
    BOOL v9 = [v24 decodeObjectOfClass:v7 forKey:@"Normal.BackgroundImage"];
  }
  backgroundImage = (id *)self->_backgroundImage;
  objc_storeStrong((id *)self->_backgroundImage, v9);
  stateFlags = self->_stateFlags;
  *(unsigned char *)self->_stateFlags = *(unsigned char *)self->_stateFlags & 0xF7 | (8 * (v9 != 0));
  uint64_t v12 = objc_opt_class();
  if (v6)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@.%@", v6, @"Highlighted.BackgroundImage"];
    uint64_t v14 = [v24 decodeObjectOfClass:v12 forKey:v13];
  }
  else
  {
    uint64_t v14 = [v24 decodeObjectOfClass:v12 forKey:@"Highlighted.BackgroundImage"];
  }
  if (v14) {
    v15 = v14;
  }
  else {
    v15 = v9;
  }
  objc_storeStrong(backgroundImage + 1, v15);
  *(unsigned char *)&stateFlags[2] = *(unsigned char *)&stateFlags[2] & 0xF7 | (8 * (v14 != 0));
  uint64_t v16 = objc_opt_class();
  if (v6)
  {
    unint64_t v17 = [NSString stringWithFormat:@"%@.%@", v6, @"Disabled.BackgroundImage"];
    uint64_t v18 = [v24 decodeObjectOfClass:v16 forKey:v17];
  }
  else
  {
    uint64_t v18 = [v24 decodeObjectOfClass:v16 forKey:@"Disabled.BackgroundImage"];
  }
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v9;
  }
  objc_storeStrong(backgroundImage + 2, v19);
  *(unsigned char *)&stateFlags[4] = *(unsigned char *)&stateFlags[4] & 0xF7 | (8 * (v18 != 0));
  uint64_t v20 = objc_opt_class();
  if (v6)
  {
    v21 = [NSString stringWithFormat:@"%@.%@", v6, @"Focused.BackgroundImage"];
    objc_super v22 = [v24 decodeObjectOfClass:v20 forKey:v21];
  }
  else
  {
    objc_super v22 = [v24 decodeObjectOfClass:v20 forKey:@"Focused.BackgroundImage"];
  }
  if (v22) {
    BOOL v23 = v22;
  }
  else {
    BOOL v23 = v15;
  }
  objc_storeStrong(backgroundImage + 3, v23);
  *(unsigned char *)&stateFlags[6] = *(unsigned char *)&stateFlags[6] & 0xF7 | (8 * (v22 != 0));
}

- (void)_decodeTitlePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = @"Normal.TitlePosition";
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v7, @"Normal.TitlePosition"];
  }
  id v9 = v6;
  uint64_t v10 = v8;
  if ([v9 containsValueForKey:v10])
  {
    [v9 decodeUIOffsetForKey:v10];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    char v15 = 4;
  }
  else
  {
    char v15 = 0;
    CGFloat v12 = 0.0;
    CGFloat v14 = 0.0;
  }

  stateFlags = self->_stateFlags;
  *(unsigned char *)self->_stateFlags = *(unsigned char *)self->_stateFlags & 0xFB | v15;
  if (v7)
  {

    titlePositionAdjustment = self->_titlePositionAdjustment;
    self->_titlePositionAdjustment[0].double horizontal = v12;
    self->_titlePositionAdjustment[0].double vertical = v14;
    uint64_t v18 = [NSString stringWithFormat:@"%@.%@", v7, @"Highlighted.TitlePosition"];
  }
  else
  {
    titlePositionAdjustment = self->_titlePositionAdjustment;
    self->_titlePositionAdjustment[0].double horizontal = v12;
    self->_titlePositionAdjustment[0].double vertical = v14;
    uint64_t v18 = @"Highlighted.TitlePosition";
  }
  id v19 = v9;
  uint64_t v20 = v18;
  if ([v19 containsValueForKey:v20])
  {
    [v19 decodeUIOffsetForKey:v20];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    char v25 = 4;
  }
  else
  {
    char v25 = 0;
    CGFloat v22 = v12;
    CGFloat v24 = v14;
  }

  *(unsigned char *)&stateFlags[2] = *(unsigned char *)&stateFlags[2] & 0xFB | v25;
  if (v7)
  {

    titlePositionAdjustment[1].double horizontal = v22;
    titlePositionAdjustment[1].double vertical = v24;
    BOOL v26 = [NSString stringWithFormat:@"%@.%@", v7, @"Disabled.TitlePosition"];
  }
  else
  {
    titlePositionAdjustment[1].double horizontal = v22;
    titlePositionAdjustment[1].double vertical = v24;
    BOOL v26 = @"Disabled.TitlePosition";
  }
  id v27 = v19;
  BOOL v28 = v26;
  if ([v27 containsValueForKey:v28])
  {
    [v27 decodeUIOffsetForKey:v28];
    CGFloat v12 = v29;
    CGFloat v14 = v30;
    char v31 = 4;
  }
  else
  {
    char v31 = 0;
  }

  *(unsigned char *)&stateFlags[4] = *(unsigned char *)&stateFlags[4] & 0xFB | v31;
  if (v7)
  {

    titlePositionAdjustment[2].double horizontal = v12;
    titlePositionAdjustment[2].double vertical = v14;
    v32 = [NSString stringWithFormat:@"%@.%@", v7, @"Focused.TitlePosition"];
  }
  else
  {
    titlePositionAdjustment[2].double horizontal = v12;
    titlePositionAdjustment[2].double vertical = v14;
    v32 = @"Focused.TitlePosition";
  }
  id v37 = v27;
  v33 = v32;
  if ([v37 containsValueForKey:v33])
  {
    [v37 decodeUIOffsetForKey:v33];
    CGFloat v22 = v34;
    CGFloat v24 = v35;
    char v36 = 4;
  }
  else
  {
    char v36 = 0;
  }

  *(unsigned char *)&stateFlags[6] = *(unsigned char *)&stateFlags[6] & 0xFB | v36;
  if (v7) {

  }
  titlePositionAdjustment[3].double horizontal = v22;
  titlePositionAdjustment[3].double vertical = v24;
}

- (void)_decodeBackgroundPositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = @"Normal.BackgroundImagePosition";
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v7, @"Normal.BackgroundImagePosition"];
  }
  id v9 = v6;
  uint64_t v10 = v8;
  if ([v9 containsValueForKey:v10])
  {
    [v9 decodeUIOffsetForKey:v10];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    char v15 = 16;
  }
  else
  {
    char v15 = 0;
    CGFloat v12 = 0.0;
    CGFloat v14 = 0.0;
  }

  stateFlags = self->_stateFlags;
  *(unsigned char *)self->_stateFlags = *(unsigned char *)self->_stateFlags & 0xEF | v15;
  if (v7)
  {

    backgroundImagePositionAdjustment = self->_backgroundImagePositionAdjustment;
    self->_backgroundImagePositionAdjustment[0].double horizontal = v12;
    self->_backgroundImagePositionAdjustment[0].double vertical = v14;
    uint64_t v18 = [NSString stringWithFormat:@"%@.%@", v7, @"Highlighted.BackgroundImagePosition"];
  }
  else
  {
    backgroundImagePositionAdjustment = self->_backgroundImagePositionAdjustment;
    self->_backgroundImagePositionAdjustment[0].double horizontal = v12;
    self->_backgroundImagePositionAdjustment[0].double vertical = v14;
    uint64_t v18 = @"Highlighted.BackgroundImagePosition";
  }
  id v19 = v9;
  uint64_t v20 = v18;
  if ([v19 containsValueForKey:v20])
  {
    [v19 decodeUIOffsetForKey:v20];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    char v25 = 16;
  }
  else
  {
    char v25 = 0;
    CGFloat v22 = v12;
    CGFloat v24 = v14;
  }

  *(unsigned char *)&stateFlags[2] = *(unsigned char *)&stateFlags[2] & 0xEF | v25;
  if (v7)
  {

    backgroundImagePositionAdjustment[1].double horizontal = v22;
    backgroundImagePositionAdjustment[1].double vertical = v24;
    BOOL v26 = [NSString stringWithFormat:@"%@.%@", v7, @"Disabled.BackgroundImagePosition"];
  }
  else
  {
    backgroundImagePositionAdjustment[1].double horizontal = v22;
    backgroundImagePositionAdjustment[1].double vertical = v24;
    BOOL v26 = @"Disabled.BackgroundImagePosition";
  }
  id v27 = v19;
  BOOL v28 = v26;
  if ([v27 containsValueForKey:v28])
  {
    [v27 decodeUIOffsetForKey:v28];
    CGFloat v12 = v29;
    CGFloat v14 = v30;
    char v31 = 16;
  }
  else
  {
    char v31 = 0;
  }

  *(unsigned char *)&stateFlags[4] = *(unsigned char *)&stateFlags[4] & 0xEF | v31;
  if (v7)
  {

    backgroundImagePositionAdjustment[2].double horizontal = v12;
    backgroundImagePositionAdjustment[2].double vertical = v14;
    v32 = [NSString stringWithFormat:@"%@.%@", v7, @"Focused.BackgroundImagePosition"];
  }
  else
  {
    backgroundImagePositionAdjustment[2].double horizontal = v12;
    backgroundImagePositionAdjustment[2].double vertical = v14;
    v32 = @"Focused.BackgroundImagePosition";
  }
  id v37 = v27;
  v33 = v32;
  if ([v37 containsValueForKey:v33])
  {
    [v37 decodeUIOffsetForKey:v33];
    CGFloat v22 = v34;
    CGFloat v24 = v35;
    char v36 = 16;
  }
  else
  {
    char v36 = 0;
  }

  *(unsigned char *)&stateFlags[6] = *(unsigned char *)&stateFlags[6] & 0xEF | v36;
  if (v7) {

  }
  backgroundImagePositionAdjustment[3].double horizontal = v22;
  backgroundImagePositionAdjustment[3].double vertical = v24;
}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [NSString stringWithFormat:@"%@.%@", v8, @"IsBackButton"];
    int v10 = [v7 decodeBoolForKey:v9];

    double v11 = [NSString stringWithFormat:@"%@.%@", v8, @"DefaultStyle"];
  }
  else
  {
    int v10 = [v7 decodeBoolForKey:@"IsBackButton"];
    double v11 = @"DefaultStyle";
  }
  if ([v7 containsValueForKey:v11])
  {
    if (v10) {
      [a1 standardBackButtonData];
    }
    else {
    uint64_t v12 = objc_msgSend(a1, "standardItemDataForStyle:", objc_msgSend(v7, "decodeIntegerForKey:", v11));
    }
    goto LABEL_22;
  }
  uint64_t v12 = objc_opt_new();
  if (v8)
  {
    double v13 = [NSString stringWithFormat:@"%@.%@", v8, @"CustomizedStyle"];
    *(void *)(v12 + 304) = [v7 decodeIntegerForKey:v13];
  }
  else
  {
    *(void *)(v12 + 304) = [v7 decodeIntegerForKey:@"CustomizedStyle"];
  }
  *(unsigned char *)(v12 + 296) = *(unsigned char *)(v12 + 296) & 0xFE | v10;
  uint64_t v14 = +[_UIBarButtonItemDataBaseFallback fallback];
  char v15 = *(void **)(v12 + 256);
  *(void *)(v12 + 256) = v14;

  [(id)v12 _decodeTitleTextAttributesFromCoder:v7 prefix:v8];
  [(id)v12 _decodeBackgroundImagesFromCoder:v7 prefix:v8];
  [(id)v12 _decodeTitlePositionAdjustmentsFromCoder:v7 prefix:v8];
  [(id)v12 _decodeBackgroundPositionAdjustmentsFromCoder:v7 prefix:v8];
  if (!v10) {
    goto LABEL_22;
  }
  uint64_t v16 = objc_opt_class();
  unint64_t v17 = @"BackIndicator";
  if (v8)
  {
    unint64_t v17 = [NSString stringWithFormat:@"%@.%@", v8, @"BackIndicator"];
  }
  uint64_t v18 = [v7 decodeObjectOfClass:v16 forKey:v17];
  id v19 = *(void **)(v12 + 224);
  *(void *)(v12 + 224) = v18;

  if (v8)
  {

    uint64_t v20 = objc_opt_class();
    double v21 = [NSString stringWithFormat:@"%@.%@", v8, @"BackIndicatorTransitionMask"];
  }
  else
  {
    uint64_t v20 = objc_opt_class();
    double v21 = @"BackIndicatorTransitionMask";
  }
  uint64_t v22 = [v7 decodeObjectOfClass:v20 forKey:v21];
  double v23 = *(void **)(v12 + 232);
  *(void *)(v12 + 232) = v22;

  if (v8) {
  uint64_t v24 = *(void *)(v12 + 232);
  }
  if (*(void *)(v12 + 224))
  {
    if (v24) {
      goto LABEL_22;
    }
  }
  else if (!v24)
  {
    goto LABEL_22;
  }
  BOOL v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"_UIBarButtonItemData.m", 350, @"Invalid BackButton Appearance archive - must either contain both a back indicator image and a back indicator transition mask image, or contain neither image" object file lineNumber description];

LABEL_22:
  return (id)v12;
}

- (void)encodeToCoder:(id)a3 prefix:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if ((_UIBarButtonItemData *)qword_1EB25CF48 == self)
  {
    if (v7)
    {
      int v10 = [NSString stringWithFormat:@"%@.%@", v7, @"DefaultStyle"];
      double v11 = v6;
      uint64_t v12 = 0;
LABEL_11:
      [v11 encodeInteger:v12 forKey:v10];
LABEL_12:

      goto LABEL_53;
    }
    uint64_t v14 = v6;
    uint64_t v15 = 0;
LABEL_20:
    [v14 encodeInteger:v15 forKey:@"DefaultStyle"];
    goto LABEL_53;
  }
  if ((_UIBarButtonItemData *)_MergedGlobals_3_22 == self)
  {
    if (v7)
    {
      int v10 = [NSString stringWithFormat:@"%@.%@", v7, @"DefaultStyle"];
      double v11 = v6;
      uint64_t v12 = 2;
      goto LABEL_11;
    }
    uint64_t v14 = v6;
    uint64_t v15 = 2;
    goto LABEL_20;
  }
  if ((_UIBarButtonItemData *)qword_1EB25CF50 == self)
  {
    if (!v7)
    {
      [v6 encodeInteger:0 forKey:@"DefaultStyle"];
      [v6 encodeBool:1 forKey:@"IsBackButton"];
      goto LABEL_53;
    }
    double v13 = [NSString stringWithFormat:@"%@.%@", v7, @"DefaultStyle"];
    [v6 encodeInteger:0 forKey:v13];

    int v10 = [NSString stringWithFormat:@"%@.%@", v8, @"IsBackButton"];
    [v6 encodeBool:1 forKey:v10];
    goto LABEL_12;
  }
  id v39 = v7;
  if (*(unsigned char *)&self->_dataFlags)
  {
    if (!v7)
    {
      int v40 = 1;
      [v6 encodeBool:1 forKey:@"IsBackButton"];
      [v6 encodeObject:self->_backIndicatorImage forKey:@"BackIndicator"];
      [v6 encodeObject:self->_backIndicatorTransitionMaskImage forKey:@"BackIndicatorTransitionMask"];
      [v6 encodeInteger:self->_style forKey:@"CustomizedStyle"];
      goto LABEL_23;
    }
    uint64_t v16 = [NSString stringWithFormat:@"%@.%@", v7, @"IsBackButton"];
    [v6 encodeBool:1 forKey:v16];

    backIndicatorImage = self->_backIndicatorImage;
    uint64_t v18 = [NSString stringWithFormat:@"%@.%@", v8, @"BackIndicator"];
    [v6 encodeObject:backIndicatorImage forKey:v18];

    backIndicatorTransitionMaskImage = self->_backIndicatorTransitionMaskImage;
    uint64_t v20 = [NSString stringWithFormat:@"%@.%@", v8, @"BackIndicatorTransitionMask"];
    [v6 encodeObject:backIndicatorTransitionMaskImage forKey:v20];

    int64_t style = self->_style;
    goto LABEL_18;
  }
  int64_t style = self->_style;
  if (v7)
  {
LABEL_18:
    double v21 = [NSString stringWithFormat:@"%@.%@", v8, @"CustomizedStyle"];
    [v6 encodeInteger:style forKey:v21];

    int v40 = 0;
    goto LABEL_23;
  }
  [v6 encodeInteger:self->_style forKey:@"CustomizedStyle"];
  int v40 = 1;
LABEL_23:
  unint64_t v22 = 0;
  p_immutable = (double *)&self->super._immutable;
  v41[0] = xmmword_1E5305608;
  v41[1] = *(_OWORD *)&off_1E5305618;
  do
  {
    if (v40)
    {
      id v24 = *(id *)((char *)v41 + v22);
    }
    else
    {
      id v24 = [NSString stringWithFormat:@"%@.%@", v39, *(void *)((char *)v41 + v22)];
    }
    char v25 = v24;
    BOOL v26 = self->_titleTextAttributes[v22 / 8];
    if (v26)
    {
      if (v24)
      {
        id v27 = [NSString stringWithFormat:@"%@.%@", v24, @"TitleTextAttributes"];
        objc_msgSend(v6, "_ui_encodeTextAttributes:forKey:", v26, v27);
      }
      else
      {
        objc_msgSend(v6, "_ui_encodeTextAttributes:forKey:", self->_titleTextAttributes[v22 / 8], @"TitleTextAttributes");
      }
    }
    stateFlags = self->_stateFlags;
    char v29 = (char)self->_stateFlags[v22 / 4];
    if ((v29 & 8) != 0)
    {
      double v30 = self->_backgroundImage[v22 / 8];
      if (!v25)
      {
        [v6 encodeObject:self->_backgroundImage[v22 / 8] forKey:@"BackgroundImage"];
        if ((*(unsigned char *)&stateFlags[v22 / 4] & 4) == 0)
        {
          if ((*(unsigned char *)&stateFlags[v22 / 4] & 0x10) == 0) {
            goto LABEL_49;
          }
          goto LABEL_46;
        }
        goto LABEL_40;
      }
      char v31 = [NSString stringWithFormat:@"%@.%@", v25, @"BackgroundImage"];
      [v6 encodeObject:v30 forKey:v31];

      char v29 = (char)stateFlags[v22 / 4];
    }
    if ((v29 & 4) == 0) {
      goto LABEL_43;
    }
    if (v25)
    {
      [NSString stringWithFormat:@"%@.%@", v25, @"TitlePosition"];
      char v32 = 0;
      id v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v33 = v37;
      goto LABEL_41;
    }
LABEL_40:
    char v32 = 1;
    v33 = @"TitlePosition";
LABEL_41:
    objc_msgSend(v6, "encodeUIOffset:forKey:", v33, p_immutable[9], p_immutable[10]);
    if ((v32 & 1) == 0) {

    }
LABEL_43:
    if ((*(unsigned char *)&stateFlags[v22 / 4] & 0x10) == 0) {
      goto LABEL_49;
    }
    if (v25)
    {
      [NSString stringWithFormat:@"%@.%@", v25, @"BackgroundImagePosition"];
      char v34 = 0;
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      double v35 = v38;
      goto LABEL_47;
    }
LABEL_46:
    char v34 = 1;
    double v35 = @"BackgroundImagePosition";
LABEL_47:
    objc_msgSend(v6, "encodeUIOffset:forKey:", v35, p_immutable[17], p_immutable[18]);
    if ((v34 & 1) == 0) {

    }
LABEL_49:
    v22 += 8;
    p_immutable += 2;
  }
  while (v22 != 32);
  for (uint64_t i = 24; i != -8; i -= 8)

  id v8 = v39;
LABEL_53:
}

- (void)describeInto:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIBarButtonItemData;
  [(_UIBarAppearanceData *)&v17 describeInto:v4];
  [v4 appendString:@" baseStyle="];
  if ((*(unsigned char *)&self->_dataFlags & 1) == 0)
  {
    int64_t style = self->_style;
    if (style == 2)
    {
      id v6 = @"done";
    }
    else
    {
      if (style)
      {
        objc_msgSend(v4, "appendFormat:", @"unknown(%li)", self->_style, v16);
        goto LABEL_11;
      }
      id v6 = @"plain";
    }
    goto LABEL_9;
  }
  [v4 appendString:@"backButton"];
  if (!self->_backIndicatorImage)
  {
    id v6 = @" backIndicator=default mask=default";
LABEL_9:
    [v4 appendString:v6];
    goto LABEL_11;
  }
  [v4 appendFormat:@" backIndicator=%@ mask=%@", self->_backIndicatorImage, self->_backIndicatorTransitionMaskImage];
LABEL_11:
  unint64_t v7 = 0;
  uint64_t v8 = 1;
  v18[0] = xmmword_1E5305628;
  v18[1] = *(_OWORD *)&off_1E5305638;
  do
  {
    objc_msgSend(v4, "appendFormat:", @" %@=(titleTextAttributes="), *(void *)((char *)v18 + v7);
    _UIBADPrettyPrintTextAttributes(v4, self->_titleTextAttributes[v7 / 8]);
    stateFlags = self->_stateFlags;
    char v10 = (char)self->_stateFlags[v7 / 4];
    if ((v10 & 4) != 0)
    {
      double v11 = NSStringFromUIOffset(*(UIOffset *)&self->_backgroundImage[v8 + 3]);
      [v4 appendFormat:@", titlePositionAdjustment=%@", v11];

      char v10 = (char)stateFlags[v7 / 4];
    }
    if ((v10 & 8) != 0)
    {
      [v4 appendFormat:@", backgroundImage=%@", self->_backgroundImage[v7 / 8]];
      if ((*(unsigned char *)&stateFlags[v7 / 4] & 0x10) != 0)
      {
        uint64_t v12 = NSStringFromUIOffset(*(UIOffset *)((char *)&self->_titlePositionAdjustment[3].vertical + v8 * 8));
        [v4 appendFormat:@", backgroundImagePositionAdjustment=%@", v12];
      }
    }
    [v4 appendString:@""]);
    v8 += 2;
    v7 += 8;
  }
  while (v8 != 9);
  fallback = self->_fallback;
  uint64_t v14 = +[_UIBarButtonItemDataBaseFallback fallback];

  if (fallback != v14) {
    objc_msgSend(v4, "appendFormat:", @" basedOn=%p", self->_fallback);
  }
  for (uint64_t i = 24; i != -8; i -= 8)
}

- (int64_t)hashInto:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIBarButtonItemData;
  id v4 = [(_UIBarAppearanceData *)&v12 hashInto:a3];
  id v5 = self->_titleTextAttributes[0];
  if (v5) {
    int64_t style = [(NSDictionary *)v5 hash];
  }
  else {
    int64_t style = self->_style;
  }
  unint64_t v7 = &v4[style];
  if ((*(unsigned char *)self->_stateFlags & 8) != 0) {
    int64_t v8 = [(UIImage *)self->_backgroundImage[0] hash];
  }
  else {
    int64_t v8 = self->_style;
  }
  int64_t v9 = (v8 << 8) + ((void)v7 << 16);
  backIndicatorImage = self->_backIndicatorImage;
  if (backIndicatorImage) {
    return [(UIImage *)backIndicatorImage hash] | (unint64_t)v9;
  }
  return v9;
}

- (void)setTitleTextAttributes:(id)a3 forState:(int64_t)a4
{
  id v7 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  int64_t v8 = [v7 objectForKeyedSubscript:*(void *)off_1E52D2040];
  *(unsigned char *)&self->_stateFlags[2 * a4] = *(unsigned char *)&self->_stateFlags[2 * a4] & 0xFE | (v8 != 0);

  int64_t v9 = [v7 objectForKeyedSubscript:*(void *)off_1E52D2048];
  *(unsigned char *)&self->_stateFlags[2 * a4] = *(unsigned char *)&self->_stateFlags[2 * a4] & 0xFD | (2 * (v9 != 0));

  char v10 = (NSDictionary *)[v7 copy];
  double v11 = self->_titleTextAttributes[a4];
  self->_titleTextAttributes[a4] = v10;
}

- (void)setTitlePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  int64_t v8 = &self->_titlePositionAdjustment[a4];
  v8->CGFloat horizontal = horizontal;
  v8->CGFloat vertical = vertical;
  *(unsigned char *)&self->_stateFlags[2 * a4] |= 4u;
}

- (void)setBackgroundImage:(id)a3 forState:(int64_t)a4
{
  id v7 = (UIImage *)a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  int64_t v8 = self->_backgroundImage[a4];
  self->_backgroundImage[a4] = v7;

  *(unsigned char *)&self->_stateFlags[2 * a4] = *(unsigned char *)&self->_stateFlags[2 * a4] & 0xF7 | (8 * (v7 != 0));
}

- (void)setBackgroundImagePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  int64_t v8 = &self->_backgroundImagePositionAdjustment[a4];
  v8->CGFloat horizontal = horizontal;
  v8->CGFloat vertical = vertical;
  *(unsigned char *)&self->_stateFlags[2 * a4] |= 0x10u;
}

- (UIImageSymbolConfiguration)compactImageSymbolConfiguration
{
  compactImageSymbolConfiguration = self->_compactImageSymbolConfiguration;
  if (!compactImageSymbolConfiguration)
  {
    if (*(unsigned char *)self->_stateFlags)
    {
      id v6 = [(_UIBarButtonItemData *)self titleTextAttributesForState:0];
      id v4 = [v6 objectForKeyedSubscript:*(void *)off_1E52D2040];

      +[UIImageSymbolConfiguration configurationWithFont:v4 scale:2];
    }
    else
    {
      id v4 = [(_UIBarButtonItemData *)self textStyleForSymbolConfiguration];
      +[UIImageSymbolConfiguration configurationWithTextStyle:v4 scale:2];
    }
    id v5 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_compactImageSymbolConfiguration;
    self->_compactImageSymbolConfiguration = v5;

    compactImageSymbolConfiguration = self->_compactImageSymbolConfiguration;
  }
  return compactImageSymbolConfiguration;
}

- (void)setBackIndicatorImage:(id)a3 transitionMaskImage:(id)a4
{
  id v9 = a3;
  id v8 = a4;
  if (*(unsigned char *)&self->_dataFlags)
  {
    [(_UIBarAppearanceData *)self assertMutable:a2];
    objc_storeStrong((id *)&self->_backIndicatorImage, a3);
    objc_storeStrong((id *)&self->_backIndicatorTransitionMaskImage, a4);
  }
}

- (void)resetBackIndicatorImages
{
  backIndicatorImage = self->_backIndicatorImage;
  self->_backIndicatorImage = 0;

  backIndicatorTransitionMaskImage = self->_backIndicatorTransitionMaskImage;
  self->_backIndicatorTransitionMaskImage = 0;
}

- (UIImage)compactBackIndicatorImage
{
  if (*(unsigned char *)&self->_dataFlags)
  {
    backIndicatorImage = self->_backIndicatorImage;
    if (!backIndicatorImage)
    {
      backIndicatorImage = (UIImage *)compactBackIndicatorImage_indicator;
      if (!compactBackIndicatorImage_indicator)
      {
        if (_UIBarsUseDynamicType()) {
          +[UIImage systemImageNamed:@"chevron.backward"];
        }
        else {
        uint64_t v4 = +[UIImage kitImageNamed:@"UINavigationBarBackIndicatorLandscape"];
        }
        id v5 = (void *)compactBackIndicatorImage_indicator;
        compactBackIndicatorImage_indicator = v4;

        backIndicatorImage = (UIImage *)compactBackIndicatorImage_indicator;
      }
    }
    v2 = backIndicatorImage;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (UIImageSymbolConfiguration)compactBackIndicatorSymbolConfiguration
{
  if (*(unsigned char *)&self->_dataFlags)
  {
    backIndicatorImage = self->_backIndicatorImage;
    if (backIndicatorImage)
    {
      if ([(UIImage *)backIndicatorImage isSymbolImage])
      {
LABEL_4:
        uint64_t v4 = -[_UIBarButtonItemData __backIndicatorConfigurationForConfig:withScale:](self, self->_compactBackIndicatorSymbolConfiguration, 2);
        goto LABEL_7;
      }
    }
    else if (_UIBarsUseDynamicType())
    {
      goto LABEL_4;
    }
  }
  uint64_t v4 = 0;
LABEL_7:
  return (UIImageSymbolConfiguration *)v4;
}

- (UIImageSymbolConfiguration)compactBackIndicatorTransitionMaskSymbolConfiguration
{
  if (*(unsigned char *)&self->_dataFlags)
  {
    backIndicatorTransitionMaskImage = self->_backIndicatorTransitionMaskImage;
    if (backIndicatorTransitionMaskImage)
    {
      if ([(UIImage *)backIndicatorTransitionMaskImage isSymbolImage])
      {
LABEL_4:
        uint64_t v4 = -[_UIBarButtonItemData __backIndicatorConfigurationForConfig:withScale:](self, self->_compactBackIndicatorSymbolConfiguration, 2);
        goto LABEL_7;
      }
    }
    else if (_UIBarsUseDynamicType())
    {
      goto LABEL_4;
    }
  }
  uint64_t v4 = 0;
LABEL_7:
  return (UIImageSymbolConfiguration *)v4;
}

- (UIOffset)backgroundImagePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4
{
  if ((*(unsigned char *)&self->_stateFlags[2 * a3] & 0x10) != 0)
  {
    id v6 = &self->_backgroundImagePositionAdjustment[a3];
    double horizontal = v6->horizontal;
    double vertical = v6->vertical;
  }
  else
  {
    -[_UIBarButtonItemDataFallback backgroundImagePositionAdjustmentForState:style:](self->_fallback, "backgroundImagePositionAdjustmentForState:style:");
  }
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

@end