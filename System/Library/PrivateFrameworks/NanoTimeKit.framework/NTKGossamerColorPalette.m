@interface NTKGossamerColorPalette
+ (double)contentScaleForTintedBackground;
- ($1AB5FA073B851C12C2339EC22442E995)approximateComplicationPositions;
- (BOOL)isCuratedColor;
- (BOOL)isCuratedStarlightColor;
- (BOOL)isEditingComplications;
- (BOOL)isSeasonalGradientColor;
- (BOOL)isSwatchPreview;
- (NSArray)backgroundGradientColors;
- (NSNumber)editingComplicationsFraction;
- (NSNumber)foregroundGradientFraction;
- (NSNumber)imageViewFraction;
- (NSNumber)monochromeFraction;
- (NSNumber)scaleFactor;
- (NSNumber)tintedFraction;
- (NTKGossamerColorPalette)init;
- (UIColor)accentColor;
- (UIColor)bottomAccentColor;
- (UIColor)bottomApproximateBackgroundColor;
- (UIColor)centerAccentColor;
- (UIColor)centerApproximateBackgroundColor;
- (UIColor)dateLabelAccentColor;
- (UIColor)dateLabelTextColor;
- (UIColor)dialColor;
- (UIColor)digitalTimeLabelColor;
- (UIColor)foregroundColor;
- (UIColor)hourMinuteHandFillColor;
- (UIColor)hourMinuteHandStrokeColor;
- (UIColor)hourTickColor;
- (UIColor)largeTimeTritiumFillColor;
- (UIColor)largeTimeTritiumOutlineColor;
- (UIColor)minuteTickColor;
- (UIColor)secondHandColor;
- (UIColor)secondTickActiveColor;
- (UIColor)secondTickInactiveColor;
- (UIColor)smallTimeTritiumOutlineColor;
- (UIColor)swatchComplicationPlaceholderColor;
- (UIColor)timeLabelColor;
- (UIColor)topAccentColor;
- (UIColor)topApproximateBackgroundColor;
- (id)_gradientBottomColor;
- (id)_gradientMidColor;
- (id)_gradientTopColor;
- (id)_rangeDarkColor;
- (id)_rangeLightColor;
- (id)_starlightBackgroundColors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)swatchImageForSize:(CGSize)a3;
- (int64_t)curatedNumber;
- (unint64_t)backgroundStyle;
- (void)_setApproximateComplicationBackgroundColors;
- (void)configurationDidChange:(id)a3;
- (void)invalidateCachedValues;
- (void)resolveColorsIfNeeded;
- (void)setApproximateComplicationPositions:(id)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setIsEditingComplications:(BOOL)a3;
- (void)setIsSwatchPreview:(BOOL)a3;
@end

@implementation NTKGossamerColorPalette

+ (double)contentScaleForTintedBackground
{
  return 0.92;
}

- (NTKGossamerColorPalette)init
{
  uint64_t v3 = objc_opt_class();
  v7.receiver = self;
  v7.super_class = (Class)NTKGossamerColorPalette;
  v4 = [(NTKFaceColorPalette *)&v7 initWithFaceClass:v3];
  v5 = v4;
  if (v4) {
    [(NTKGossamerColorPalette *)v4 invalidateCachedValues];
  }
  return v5;
}

- (void)invalidateCachedValues
{
  self->_isDirty = 1;
  cachedIdentifier = self->_cachedIdentifier;
  self->_cachedIdentifier = 0;
}

- (id)identifier
{
  cachedIdentifier = self->_cachedIdentifier;
  if (!cachedIdentifier)
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"%f-%f-%f", *(void *)&self->_approximateComplicationPositions.top, *(void *)&self->_approximateComplicationPositions.center, *(void *)&self->_approximateComplicationPositions.bottom);
    v5 = NSString;
    v10.receiver = self;
    v10.super_class = (Class)NTKGossamerColorPalette;
    v6 = [(NTKFaceColorPalette *)&v10 identifier];
    objc_super v7 = [v5 stringWithFormat:@"%@-%lu-%lu-%@", v6, self->_backgroundStyle, self->_isEditingComplications, v4];
    v8 = self->_cachedIdentifier;
    self->_cachedIdentifier = v7;

    cachedIdentifier = self->_cachedIdentifier;
  }

  return cachedIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKGossamerColorPalette;
  v4 = [(NTKFaceColorPalette *)&v7 copyWithZone:a3];
  [v4 setBackgroundStyle:self->_backgroundStyle];
  [v4 setIsEditingComplications:self->_isEditingComplications];
  double bottom = self->_approximateComplicationPositions.bottom;
  *(_OWORD *)(v4 + 360) = *(_OWORD *)&self->_approximateComplicationPositions.top;
  *((double *)v4 + 47) = bottom;
  [v4 invalidateCachedValues];
  return v4;
}

- (id)swatchImageForSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if ([(NTKGossamerColorPalette *)self isCuratedColor])
  {
    if (swatchImageForSize__onceToken != -1) {
      dispatch_once(&swatchImageForSize__onceToken, &__block_literal_global_174);
    }
    v6 = NSString;
    objc_super v7 = [(NTKFaceColorPalette *)self configuration];
    v8 = [v7 uniqueId];
    v17.CGFloat width = width;
    v17.CGFloat height = height;
    v9 = NSStringFromCGSize(v17);
    objc_super v10 = [v6 stringWithFormat:@"%@-%@", v8, v9];

    v11 = [(id)swatchImageForSize__swatches objectForKey:v10];
    if (!v11)
    {
      v12 = [(NTKGossamerColorPalette *)self gradientTopColor];
      v13 = [(NTKGossamerColorPalette *)self gradientBottomColor];
      v11 = NTKSwatchTwoColorGradientImage(v12, v13, 0, 0.0, 1.0, width, height);
      [(id)swatchImageForSize__swatches setObject:v11 forKey:v10];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKGossamerColorPalette;
    v11 = -[NTKFaceColorPalette swatchImageForSize:](&v15, sel_swatchImageForSize_, width, height);
  }

  return v11;
}

void __46__NTKGossamerColorPalette_swatchImageForSize___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)swatchImageForSize__swatches;
  swatchImageForSize__swatches = v0;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
  [(NTKGossamerColorPalette *)self invalidateCachedValues];
}

- (void)setIsEditingComplications:(BOOL)a3
{
  self->_isEditingComplications = a3;
  [(NTKGossamerColorPalette *)self invalidateCachedValues];
}

- (void)setIsSwatchPreview:(BOOL)a3
{
  self->_isSwatchPreview = a3;
  [(NTKGossamerColorPalette *)self invalidateCachedValues];
}

- (void)setApproximateComplicationPositions:(id)a3
{
  self->_approximateComplicationPositions = ($08A3282CA2B764307ED9F5326E269AA3)a3;
  [(NTKGossamerColorPalette *)self invalidateCachedValues];
}

- (BOOL)isCuratedColor
{
  v2 = [(NTKFaceColorPalette *)self configuration];
  uint64_t v3 = [v2 collectionName];
  char v4 = [v3 hasPrefix:@"gossamer"];

  return v4;
}

- (BOOL)isSeasonalGradientColor
{
  uint64_t v3 = [(NTKFaceColorPalette *)self pigmentEditOption];
  char v4 = [v3 collectionName];
  if ([v4 isEqualToString:@"seasons.fall2023"])
  {
    v5 = [(NTKFaceColorPalette *)self pigmentEditOption];
    v6 = [v5 fullname];
    int v7 = [v6 containsString:@"seasons.fall2019.alaskanBlue"] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isCuratedStarlightColor
{
  return [(NTKGossamerColorPalette *)self curatedNumber] == 2;
}

- (int64_t)curatedNumber
{
  if (!curatedNumber_formatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    char v4 = (void *)curatedNumber_formatter;
    curatedNumber_formatter = (uint64_t)v3;
  }
  v5 = [(NTKFaceColorPalette *)self pigmentEditOption];
  v6 = [v5 identifier];

  if ([v6 hasPrefix:@"gossamer.color"])
  {
    int v7 = [v6 substringFromIndex:objc_msgSend(@"gossamer.color", "length")];
    v8 = [(id)curatedNumber_formatter numberFromString:v7];
    if (v8)
    {
      v9 = v8;
      int64_t v10 = [v8 integerValue];
    }
    else
    {
      int64_t v10 = 0;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)_starlightBackgroundColors
{
  if (_starlightBackgroundColors_onceToken != -1) {
    dispatch_once(&_starlightBackgroundColors_onceToken, &__block_literal_global_24_0);
  }
  v2 = (void *)_starlightBackgroundColors___colors;

  return v2;
}

void __53__NTKGossamerColorPalette__starlightBackgroundColors__block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.77254902 green:0.658823529 blue:0.443137255 alpha:1.0];
  v6[0] = v0;
  v1 = [MEMORY[0x1E4FB1618] colorWithRed:0.741176471 green:0.611764706 blue:0.4 alpha:1.0];
  v6[1] = v1;
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.682352941 green:0.51372549 blue:0.278431373 alpha:1.0];
  v6[2] = v2;
  id v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.670588235 green:0.521568627 blue:0.309803922 alpha:1.0];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v5 = (void *)_starlightBackgroundColors___colors;
  _starlightBackgroundColors___colors = v4;
}

- (void)configurationDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKGossamerColorPalette;
  [(NTKFaceColorPalette *)&v4 configurationDidChange:a3];
  [(NTKGossamerColorPalette *)self invalidateCachedValues];
}

- (void)resolveColorsIfNeeded
{
  v134[1] = *MEMORY[0x1E4F143B8];
  if (!self->_isDirty) {
    return;
  }
  self->_isDirty = 0;
  BOOL v3 = [(NTKFaceColorPalette *)self isTritium];
  unint64_t backgroundStyle = self->_backgroundStyle;
  BOOL v123 = v3;
  if (backgroundStyle) {
    int v5 = v3;
  }
  else {
    int v5 = 1;
  }
  BOOL isEditingComplications = self->_isEditingComplications;
  BOOL v6 = [(NTKGossamerColorPalette *)self isCuratedColor];
  BOOL v127 = [(NTKGossamerColorPalette *)self isSeasonalGradientColor];
  BOOL v130 = v6;
  if (v6) {
    int64_t v121 = [(NTKGossamerColorPalette *)self curatedNumber];
  }
  else {
    int64_t v121 = 0;
  }
  BOOL v129 = [(NTKFaceColorPalette *)self isMulticolor];
  BOOL v7 = [(NTKFaceColorPalette *)self hasPrimaryColorRange];
  if (v5) {
    v8 = &unk_1F16E8740;
  }
  else {
    v8 = &unk_1F16E8730;
  }
  objc_storeStrong((id *)&self->_tintedFraction, v8);
  v9 = [(NTKGossamerColorPalette *)self inputColor];
  BOOL v125 = v7;
  if (!v7)
  {
    if (!isEditingComplications)
    {
      v16 = [MEMORY[0x1E4FB1618] whiteColor];
      CLKContrastRatioForColors();
      double v13 = v17;

      v11 = 0;
      uint64_t v10 = 0;
      double v14 = 2.7;
      goto LABEL_18;
    }
    v11 = 0;
    uint64_t v10 = 0;
LABEL_16:
    BOOL v15 = 1;
    goto LABEL_19;
  }
  uint64_t v10 = [(NTKGossamerColorPalette *)self rangeLightColor];
  v11 = [(NTKGossamerColorPalette *)self rangeDarkColor];
  if (isEditingComplications) {
    goto LABEL_16;
  }
  CLKContrastRatioForColors();
  double v13 = v12;
  CLKContrastRatioForColors();
LABEL_18:
  BOOL v15 = v13 > v14;
LABEL_19:
  BOOL v126 = v15;
  v124 = (void *)v10;
  if (v5)
  {
    if (self->_isSwatchPreview) {
      [MEMORY[0x1E4FB1618] colorWithWhite:0.0666666667 alpha:1.0];
    }
    else {
    v19 = [MEMORY[0x1E4FB1618] blackColor];
    }
    objc_storeStrong((id *)&self->_backgroundColor, v19);

    v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
    foregroundColor = self->_foregroundColor;
    self->_foregroundColor = v20;

    if (v130)
    {
      v22 = (void *)MEMORY[0x1E4FB1618];
    }
    else
    {
      if (!v127 && !v129)
      {
        v23 = v9;
        goto LABEL_32;
      }
      v22 = (void *)MEMORY[0x1E4FB1618];
    }
    v23 = [v22 whiteColor];
LABEL_32:
    accentColor = self->_accentColor;
    self->_accentColor = v23;
    double v25 = 0.05;
    goto LABEL_46;
  }
  objc_storeStrong((id *)&self->_backgroundColor, v9);
  if (v130 || v129 || v127)
  {
    v18 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    if (v126) {
      double v26 = 0.9;
    }
    else {
      double v26 = 0.1;
    }
    v18 = [MEMORY[0x1E4FB1618] colorWithWhite:v26 alpha:1.0];
  }
  v27 = self->_foregroundColor;
  self->_foregroundColor = v18;

  if (v129)
  {
    v28 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
LABEL_45:
    accentColor = self->_accentColor;
    self->_accentColor = v28;
    double v25 = 0.3;
    goto LABEL_46;
  }
  if (v130)
  {
    v29 = v9;
LABEL_44:
    v28 = v29;
    goto LABEL_45;
  }
  if (v127)
  {
    v29 = v9;
    goto LABEL_44;
  }
  if (!v125)
  {
    NTKInterpolateBetweenColors();
    v28 = (UIColor *)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  if (v126) {
    v64 = (void *)v10;
  }
  else {
    v64 = v11;
  }
  v119 = v64;
  accentColor = self->_accentColor;
  self->_accentColor = v119;
  double v25 = 0.3;
LABEL_46:

  v30 = [(UIColor *)self->_foregroundColor colorWithAlphaComponent:v25];
  swatchComplicationPlaceholderColor = self->_swatchComplicationPlaceholderColor;
  self->_swatchComplicationPlaceholderColor = v30;

  if (self->_isSwatchPreview)
  {
    v32 = NSNumber;
    +[NTKGossamerColorPalette contentScaleForTintedBackground];
    objc_msgSend(v32, "numberWithDouble:");
    v33 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    scaleFactor = self->_scaleFactor;
    self->_scaleFactor = v33;
  }
  else
  {
    if (backgroundStyle)
    {
      v38 = NSNumber;
      +[NTKGossamerColorPalette contentScaleForTintedBackground];
      objc_msgSend(v38, "numberWithDouble:");
      v39 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v40 = self->_scaleFactor;
      self->_scaleFactor = v39;

      int v36 = !v129;
      goto LABEL_54;
    }
    scaleFactor = self->_scaleFactor;
    self->_scaleFactor = (NSNumber *)&unk_1F16E8730;
  }

  BOOL v35 = v129;
  int v36 = !v129;
  if (backgroundStyle) {
    BOOL v35 = 0;
  }
  if (v35)
  {
    char v122 = 0;
    monochromeFraction = self->_monochromeFraction;
    self->_monochromeFraction = (NSNumber *)&unk_1F16E8740;
    goto LABEL_55;
  }
LABEL_54:
  monochromeFraction = self->_monochromeFraction;
  self->_monochromeFraction = (NSNumber *)&unk_1F16E8730;
  char v122 = 1;
LABEL_55:

  imageViewFraction = self->_imageViewFraction;
  if (v5 | v36) {
    v42 = (NSNumber *)&unk_1F16E8740;
  }
  else {
    v42 = (NSNumber *)&unk_1F16E8730;
  }
  self->_imageViewFraction = v42;

  if (self->_isEditingComplications) {
    v43 = &unk_1F16E8730;
  }
  else {
    v43 = &unk_1F16E8740;
  }
  objc_storeStrong((id *)&self->_editingComplicationsFraction, v43);
  if ((v130 & v5) == 1)
  {
    foregroundGradientFraction = self->_foregroundGradientFraction;
LABEL_64:
    self->_foregroundGradientFraction = (NSNumber *)&unk_1F16E8730;
    goto LABEL_66;
  }
  foregroundGradientFraction = self->_foregroundGradientFraction;
  if ((v127 & v5) == 1) {
    goto LABEL_64;
  }
  self->_foregroundGradientFraction = (NSNumber *)&unk_1F16E8740;
LABEL_66:

  v134[0] = self->_backgroundColor;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:1];
  backgroundGradientColors = self->_backgroundGradientColors;
  self->_backgroundGradientColors = v45;

  p_topAccentColor = &self->_topAccentColor;
  objc_storeStrong((id *)&self->_topAccentColor, self->_accentColor);
  p_centerAccentColor = &self->_centerAccentColor;
  objc_storeStrong((id *)&self->_centerAccentColor, self->_accentColor);
  p_bottomAccentColor = &self->_bottomAccentColor;
  objc_storeStrong((id *)&self->_bottomAccentColor, self->_accentColor);
  if (v130)
  {
    if ((v5 & 1) == 0)
    {
      if (v121 == 2)
      {
        v50 = [(NTKGossamerColorPalette *)self _starlightBackgroundColors];
        v51 = self->_backgroundGradientColors;
        self->_backgroundGradientColors = v50;
      }
      else
      {
        v51 = [(NTKGossamerColorPalette *)self gradientTopColor];
        v133[0] = v51;
        v58 = [(NTKGossamerColorPalette *)self gradientMidColor];
        v133[1] = v58;
        v59 = [(NTKGossamerColorPalette *)self gradientBottomColor];
        v133[2] = v59;
        v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:3];
        v61 = self->_backgroundGradientColors;
        self->_backgroundGradientColors = v60;
      }
      goto LABEL_85;
    }
LABEL_72:
    uint64_t v52 = [(NTKGossamerColorPalette *)self backgroundOffGradientTopColor];
    v53 = *p_topAccentColor;
    *p_topAccentColor = (UIColor *)v52;

    uint64_t v54 = [(NTKGossamerColorPalette *)self backgroundOffGradientMidColor];
    v55 = *p_centerAccentColor;
    *p_centerAccentColor = (UIColor *)v54;

    uint64_t v56 = [(NTKGossamerColorPalette *)self backgroundOffGradientBottomColor];
    v57 = *p_bottomAccentColor;
    *p_bottomAccentColor = (UIColor *)v56;

LABEL_87:
    [(NTKGossamerColorPalette *)self _setApproximateComplicationBackgroundColors];
    goto LABEL_89;
  }
  if (!v127) {
    goto LABEL_86;
  }
  if (v5) {
    goto LABEL_72;
  }
  v62 = [(NTKFaceColorPalette *)self pigmentEditOption];
  v63 = [v62 fullname];
  if ([v63 isEqualToString:@"seasons.fall2023.mulberry"])
  {
  }
  else
  {
    v65 = [(NTKFaceColorPalette *)self pigmentEditOption];
    v66 = [v65 fullname];
    int v120 = [v66 isEqualToString:@"seasons.fall2023.winterBlue"];

    if (!v120)
    {
      v51 = [(NTKGossamerColorPalette *)self gradientTopColor];
      v131[0] = v51;
      v67 = [(NTKGossamerColorPalette *)self gradientMidColor];
      v131[1] = v67;
      v70 = [(NTKGossamerColorPalette *)self gradientBottomColor];
      v131[2] = v70;
      v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:3];
      v72 = self->_backgroundGradientColors;
      self->_backgroundGradientColors = v71;

      goto LABEL_84;
    }
  }
  v51 = [(NTKGossamerColorPalette *)self gradientTopColor];
  v132[0] = v51;
  v67 = [(NTKGossamerColorPalette *)self gradientBottomColor];
  v132[1] = v67;
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:2];
  v69 = self->_backgroundGradientColors;
  self->_backgroundGradientColors = v68;

LABEL_84:
LABEL_85:

LABEL_86:
  if ((v36 | v5)) {
    goto LABEL_87;
  }
  v73 = [MEMORY[0x1E4FB1618] grayColor];
  topApproximateBackgroundColor = self->_topApproximateBackgroundColor;
  self->_topApproximateBackgroundColor = v73;

  v75 = [MEMORY[0x1E4FB1618] grayColor];
  centerApproximateBackgroundColor = self->_centerApproximateBackgroundColor;
  self->_centerApproximateBackgroundColor = v75;

  v77 = [MEMORY[0x1E4FB1618] grayColor];
  bottomApproximateBackgroundColor = self->_bottomApproximateBackgroundColor;
  self->_bottomApproximateBackgroundColor = v77;

LABEL_89:
  if (isEditingComplications) {
    char v79 = v5;
  }
  else {
    char v79 = 1;
  }
  if ((v79 & 1) == 0)
  {
    v80 = [MEMORY[0x1E4FB1618] blackColor];
    NTKInterpolateBetweenColors();
    v81 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v82 = self->_topApproximateBackgroundColor;
    self->_topApproximateBackgroundColor = v81;

    v83 = [MEMORY[0x1E4FB1618] blackColor];
    NTKInterpolateBetweenColors();
    v84 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v85 = self->_centerApproximateBackgroundColor;
    self->_centerApproximateBackgroundColor = v84;

    v86 = [MEMORY[0x1E4FB1618] blackColor];
    NTKInterpolateBetweenColors();
    v87 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v88 = self->_bottomApproximateBackgroundColor;
    self->_bottomApproximateBackgroundColor = v87;
  }
  if ((v5 | !v125))
  {
    v89 = [(UIColor *)self->_foregroundColor colorWithAlphaComponent:0.2];
    modularCompactDialBackgroundColor = self->_modularCompactDialBackgroundColor;
    self->_modularCompactDialBackgroundColor = v89;

    objc_storeStrong((id *)&self->_modularCompactDialForegroundPrimaryColor, self->_foregroundColor);
    v91 = self->_foregroundColor;
    modularCompactDialDigitalTimeColor = self->_modularCompactDialDigitalTimeColor;
    self->_modularCompactDialDigitalTimeColor = v91;
  }
  else
  {
    if (v126) {
      v93 = v124;
    }
    else {
      v93 = v11;
    }
    if (v126) {
      v94 = v11;
    }
    else {
      v94 = v124;
    }
    objc_storeStrong((id *)&self->_modularCompactDialBackgroundColor, v93);
    objc_storeStrong((id *)&self->_modularCompactDialForegroundPrimaryColor, v94);
    if (v126) {
      [MEMORY[0x1E4FB1618] blackColor];
    }
    else {
    modularCompactDialDigitalTimeColor = [MEMORY[0x1E4FB1618] whiteColor];
    }
    objc_storeStrong((id *)&self->_modularCompactDialDigitalTimeColor, modularCompactDialDigitalTimeColor);
  }

  v95 = [(UIColor *)self->_modularCompactDialForegroundPrimaryColor colorWithAlphaComponent:0.4];
  p_modularCompactDialForegroundSecondaryColor = &self->_modularCompactDialForegroundSecondaryColor;
  modularCompactDialForegroundSecondaryColor = self->_modularCompactDialForegroundSecondaryColor;
  self->_modularCompactDialForegroundSecondaryColor = v95;

  if (v123)
  {
    v98 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
    p_modularCompactDialForegroundSecondaryColor = &self->_modularCompactSecondTickActiveColor;
    modularCompactSecondTickActiveColor = self->_modularCompactSecondTickActiveColor;
    self->_modularCompactSecondTickActiveColor = v98;
  }
  else
  {
    objc_storeStrong((id *)&self->_modularCompactSecondTickActiveColor, self->_modularCompactDialForegroundPrimaryColor);
  }
  v100 = *p_modularCompactDialForegroundSecondaryColor;
  modularCompactSecondTickInactiveColor = self->_modularCompactSecondTickInactiveColor;
  self->_modularCompactSecondTickInactiveColor = v100;

  if (v129)
  {
    v102 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  }
  else
  {
    v102 = self->_accentColor;
  }
  modularCompactDialSecondHandColor = self->_modularCompactDialSecondHandColor;
  self->_modularCompactDialSecondHandColor = v102;

  if (v122)
  {
    if (((!v130 | v5) & 1) != 0 || (v121 | 4) != 6)
    {
      v106 = self->_topAccentColor;
      infographModularDateLabelColor = self->_infographModularDateLabelColor;
      self->_infographModularDateLabelColor = v106;
      goto LABEL_119;
    }
    v104 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    v104 = [MEMORY[0x1E4FB1618] systemRedColor];
  }
  infographModularDateLabelColor = self->_infographModularDateLabelColor;
  self->_infographModularDateLabelColor = v104;
LABEL_119:

  if (v127)
  {
    v107 = [MEMORY[0x1E4FB1618] whiteColor];
    infographModularTimeLabelColor = self->_infographModularTimeLabelColor;
    self->_infographModularTimeLabelColor = v107;
  }
  else
  {
    if ((v5 | v130 | (v129 || v126))) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    v109 = [MEMORY[0x1E4FB1618] blackColor];
    }
    infographModularTimeLabelColor = self->_infographModularTimeLabelColor;
    self->_infographModularTimeLabelColor = v109;
  }

  if (isEditingComplications)
  {
    v110 = [MEMORY[0x1E4FB1618] blackColor];
    NTKInterpolateBetweenColors();
    v111 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v112 = self->_infographModularTimeLabelColor;
    self->_infographModularTimeLabelColor = v111;
  }
  objc_storeStrong((id *)&self->_infographModularDateAccentColor, self->_foregroundColor);
  v113 = [MEMORY[0x1E4FB1618] whiteColor];
  NTKInterpolateBetweenColors();
  v114 = (UIColor *)objc_claimAutoreleasedReturnValue();
  xLargeSmallTimeTritiumOutlineColor = self->_xLargeSmallTimeTritiumOutlineColor;
  self->_xLargeSmallTimeTritiumOutlineColor = v114;

  objc_storeStrong((id *)&self->_xLargeLargeTimeTritiumOutlineColor, self->_accentColor);
  v116 = [MEMORY[0x1E4FB1618] blackColor];
  NTKInterpolateBetweenColors();
  v117 = (UIColor *)objc_claimAutoreleasedReturnValue();
  xLargeLargeTimeTritiumFillColor = self->_xLargeLargeTimeTritiumFillColor;
  self->_xLargeLargeTimeTritiumFillColor = v117;
}

- (void)_setApproximateComplicationBackgroundColors
{
  NSUInteger v3 = [(NSArray *)self->_backgroundGradientColors count];
  if (v3 == 1)
  {
    objc_super v4 = [(NSArray *)self->_backgroundGradientColors firstObject];
    objc_storeStrong((id *)&self->_topApproximateBackgroundColor, v4);
    objc_storeStrong((id *)&self->_centerApproximateBackgroundColor, v4);
    bottomApproximateBackgroundColor = self->_bottomApproximateBackgroundColor;
    self->_bottomApproximateBackgroundColor = v4;
  }
  else
  {
    NSUInteger v6 = v3;
    BOOL v7 = objc_opt_new();
    backgroundGradientColors = self->_backgroundGradientColors;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__NTKGossamerColorPalette__setApproximateComplicationBackgroundColors__block_invoke;
    v25[3] = &unk_1E62CB300;
    id v26 = v7;
    NSUInteger v27 = v6;
    id v9 = v7;
    [(NSArray *)backgroundGradientColors enumerateObjectsUsingBlock:v25];
    uint64_t v10 = [NTKColorCurve alloc];
    v11 = (void *)[v9 copy];
    double v12 = [(NTKColorCurve *)v10 initWithColorCurveElements:v11];

    [(NSNumber *)self->_scaleFactor doubleValue];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__NTKGossamerColorPalette__setApproximateComplicationBackgroundColors__block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e8_d16__0d8l;
    aBlock[4] = v13;
    double v14 = (double (**)(double))_Block_copy(aBlock);
    double v15 = v14[2](self->_approximateComplicationPositions.top);
    *(float *)&double v15 = v15;
    v16 = [(NTKColorCurve *)v12 colorForFraction:v15];
    topApproximateBackgroundColor = self->_topApproximateBackgroundColor;
    self->_topApproximateBackgroundColor = v16;

    double v18 = ((double (*)(double (**)(double), double))v14[2])(v14, self->_approximateComplicationPositions.center);
    *(float *)&double v18 = v18;
    v19 = [(NTKColorCurve *)v12 colorForFraction:v18];
    centerApproximateBackgroundColor = self->_centerApproximateBackgroundColor;
    self->_centerApproximateBackgroundColor = v19;

    double v21 = ((double (*)(double (**)(double), double))v14[2])(v14, self->_approximateComplicationPositions.bottom);
    *(float *)&double v21 = v21;
    v22 = [(NTKColorCurve *)v12 colorForFraction:v21];
    v23 = self->_bottomApproximateBackgroundColor;
    self->_bottomApproximateBackgroundColor = v22;
  }
}

void __70__NTKGossamerColorPalette__setApproximateComplicationBackgroundColors__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v4 = (double)a3 / (double)(unint64_t)(*(void *)(a1 + 40) - 1);
  id v5 = a2;
  NSUInteger v6 = [NTKColorCurveElement alloc];
  *(float *)&double v7 = v4;
  v8 = [(NTKColorCurveElement *)v6 initWithColor:v5 fraction:v7];

  [*(id *)(a1 + 32) addObject:v8];
}

double __70__NTKGossamerColorPalette__setApproximateComplicationBackgroundColors__block_invoke_2(uint64_t a1, double a2)
{
  return (1.0 - *(double *)(a1 + 32)) * 0.5 + a2 * *(double *)(a1 + 32);
}

- (UIColor)accentColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  accentColor = self->_accentColor;

  return accentColor;
}

- (UIColor)foregroundColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  foregroundColor = self->_foregroundColor;

  return foregroundColor;
}

- (UIColor)topAccentColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  topAccentColor = self->_topAccentColor;

  return topAccentColor;
}

- (UIColor)centerAccentColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  centerAccentColor = self->_centerAccentColor;

  return centerAccentColor;
}

- (UIColor)bottomAccentColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  bottomAccentColor = self->_bottomAccentColor;

  return bottomAccentColor;
}

- (UIColor)swatchComplicationPlaceholderColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  swatchComplicationPlaceholderColor = self->_swatchComplicationPlaceholderColor;

  return swatchComplicationPlaceholderColor;
}

- (UIColor)dialColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  modularCompactDialBackgroundColor = self->_modularCompactDialBackgroundColor;

  return modularCompactDialBackgroundColor;
}

- (UIColor)hourTickColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  modularCompactDialForegroundPrimaryColor = self->_modularCompactDialForegroundPrimaryColor;

  return modularCompactDialForegroundPrimaryColor;
}

- (UIColor)minuteTickColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  modularCompactDialForegroundSecondaryColor = self->_modularCompactDialForegroundSecondaryColor;

  return modularCompactDialForegroundSecondaryColor;
}

- (UIColor)secondTickActiveColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  modularCompactSecondTickActiveColor = self->_modularCompactSecondTickActiveColor;

  return modularCompactSecondTickActiveColor;
}

- (UIColor)secondTickInactiveColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  modularCompactSecondTickInactiveColor = self->_modularCompactSecondTickInactiveColor;

  return modularCompactSecondTickInactiveColor;
}

- (UIColor)hourMinuteHandFillColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  foregroundColor = self->_foregroundColor;

  return foregroundColor;
}

- (UIColor)hourMinuteHandStrokeColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] whiteColor];
}

- (UIColor)secondHandColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  modularCompactDialSecondHandColor = self->_modularCompactDialSecondHandColor;

  return modularCompactDialSecondHandColor;
}

- (UIColor)digitalTimeLabelColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  modularCompactDialDigitalTimeColor = self->_modularCompactDialDigitalTimeColor;

  return modularCompactDialDigitalTimeColor;
}

- (UIColor)dateLabelAccentColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  infographModularDateAccentColor = self->_infographModularDateAccentColor;

  return infographModularDateAccentColor;
}

- (UIColor)dateLabelTextColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  infographModularDateLabelColor = self->_infographModularDateLabelColor;

  return infographModularDateLabelColor;
}

- (UIColor)timeLabelColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  infographModularTimeLabelColor = self->_infographModularTimeLabelColor;

  return infographModularTimeLabelColor;
}

- (UIColor)smallTimeTritiumOutlineColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  xLargeSmallTimeTritiumOutlineColor = self->_xLargeSmallTimeTritiumOutlineColor;

  return xLargeSmallTimeTritiumOutlineColor;
}

- (UIColor)largeTimeTritiumOutlineColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  xLargeLargeTimeTritiumOutlineColor = self->_xLargeLargeTimeTritiumOutlineColor;

  return xLargeLargeTimeTritiumOutlineColor;
}

- (UIColor)largeTimeTritiumFillColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  xLargeLargeTimeTritiumFillColor = self->_xLargeLargeTimeTritiumFillColor;

  return xLargeLargeTimeTritiumFillColor;
}

- (NSNumber)scaleFactor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  scaleFactor = self->_scaleFactor;

  return scaleFactor;
}

- (NSNumber)monochromeFraction
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  monochromeFraction = self->_monochromeFraction;

  return monochromeFraction;
}

- (NSNumber)imageViewFraction
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  imageViewFraction = self->_imageViewFraction;

  return imageViewFraction;
}

- (NSNumber)editingComplicationsFraction
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  editingComplicationsFraction = self->_editingComplicationsFraction;

  return editingComplicationsFraction;
}

- (NSNumber)foregroundGradientFraction
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  foregroundGradientFraction = self->_foregroundGradientFraction;

  return foregroundGradientFraction;
}

- (NSNumber)tintedFraction
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  tintedFraction = self->_tintedFraction;

  return tintedFraction;
}

- (NSArray)backgroundGradientColors
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  backgroundGradientColors = self->_backgroundGradientColors;

  return backgroundGradientColors;
}

- (UIColor)topApproximateBackgroundColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  topApproximateBackgroundColor = self->_topApproximateBackgroundColor;

  return topApproximateBackgroundColor;
}

- (UIColor)centerApproximateBackgroundColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  centerApproximateBackgroundColor = self->_centerApproximateBackgroundColor;

  return centerApproximateBackgroundColor;
}

- (UIColor)bottomApproximateBackgroundColor
{
  [(NTKGossamerColorPalette *)self resolveColorsIfNeeded];
  bottomApproximateBackgroundColor = self->_bottomApproximateBackgroundColor;

  return bottomApproximateBackgroundColor;
}

- (id)_gradientBottomColor
{
  return (id)[MEMORY[0x1E4FB1618] blackColor];
}

- (id)_gradientMidColor
{
  return (id)[MEMORY[0x1E4FB1618] blackColor];
}

- (id)_gradientTopColor
{
  return (id)[MEMORY[0x1E4FB1618] blackColor];
}

- (id)_rangeLightColor
{
  return [(NTKFaceColorPalette *)self primaryColorWithFraction:0.0];
}

- (id)_rangeDarkColor
{
  return [(NTKFaceColorPalette *)self primaryColorWithFraction:1.0];
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (BOOL)isEditingComplications
{
  return self->_isEditingComplications;
}

- ($1AB5FA073B851C12C2339EC22442E995)approximateComplicationPositions
{
  double top = self->_approximateComplicationPositions.top;
  double center = self->_approximateComplicationPositions.center;
  double bottom = self->_approximateComplicationPositions.bottom;
  result.var2 = bottom;
  result.var1 = center;
  result.var0 = top;
  return result;
}

- (BOOL)isSwatchPreview
{
  return self->_isSwatchPreview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIdentifier, 0);
  objc_storeStrong((id *)&self->_xLargeLargeTimeTritiumFillColor, 0);
  objc_storeStrong((id *)&self->_xLargeLargeTimeTritiumOutlineColor, 0);
  objc_storeStrong((id *)&self->_xLargeSmallTimeTritiumOutlineColor, 0);
  objc_storeStrong((id *)&self->_infographModularTimeLabelColor, 0);
  objc_storeStrong((id *)&self->_infographModularDateAccentColor, 0);
  objc_storeStrong((id *)&self->_infographModularDateLabelColor, 0);
  objc_storeStrong((id *)&self->_modularCompactSecondTickInactiveColor, 0);
  objc_storeStrong((id *)&self->_modularCompactSecondTickActiveColor, 0);
  objc_storeStrong((id *)&self->_modularCompactDialDigitalTimeColor, 0);
  objc_storeStrong((id *)&self->_modularCompactDialSecondHandColor, 0);
  objc_storeStrong((id *)&self->_modularCompactDialForegroundSecondaryColor, 0);
  objc_storeStrong((id *)&self->_modularCompactDialForegroundPrimaryColor, 0);
  objc_storeStrong((id *)&self->_modularCompactDialBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tintedFraction, 0);
  objc_storeStrong((id *)&self->_foregroundGradientFraction, 0);
  objc_storeStrong((id *)&self->_editingComplicationsFraction, 0);
  objc_storeStrong((id *)&self->_imageViewFraction, 0);
  objc_storeStrong((id *)&self->_monochromeFraction, 0);
  objc_storeStrong((id *)&self->_scaleFactor, 0);
  objc_storeStrong((id *)&self->_swatchComplicationPlaceholderColor, 0);
  objc_storeStrong((id *)&self->_backgroundGradientColors, 0);
  objc_storeStrong((id *)&self->_bottomApproximateBackgroundColor, 0);
  objc_storeStrong((id *)&self->_centerApproximateBackgroundColor, 0);
  objc_storeStrong((id *)&self->_topApproximateBackgroundColor, 0);
  objc_storeStrong((id *)&self->_bottomAccentColor, 0);
  objc_storeStrong((id *)&self->_centerAccentColor, 0);
  objc_storeStrong((id *)&self->_topAccentColor, 0);
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end