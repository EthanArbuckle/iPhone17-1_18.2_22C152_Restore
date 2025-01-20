@interface SBIconLabelImageParameters
- (BOOL)canTighten;
- (BOOL)canTruncate;
- (BOOL)containsEmoji;
- (BOOL)isAccessibilityReduceTransparencyEnabled;
- (BOOL)isColorspaceGrayscale;
- (BOOL)isEqual:(id)a3;
- (CGSize)maxSize;
- (NSString)contentSizeCategory;
- (NSString)text;
- (SBIconLabelImageParameters)init;
- (SBIconLabelImageParameters)initWithParameters:(id)a3;
- (UIColor)focusHighlightColor;
- (UIColor)textColor;
- (UIEdgeInsets)fontLanguageInsets;
- (UIEdgeInsets)textInsets;
- (UIFont)font;
- (UITraitCollection)overrideTraitCollection;
- (double)scale;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)legibilityStyle;
- (unint64_t)hash;
- (void)_noteNeedsHashRecalculation;
- (void)setOverrideTraitCollection:(id)a3;
@end

@implementation SBIconLabelImageParameters

- (NSString)text
{
  return self->_text;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBIconLabelImageParameters *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      if (self->_legibilityStyle != v7->_legibilityStyle
        || !BSFloatEqualToFloat()
        || !SBFBoolEquals()
        || !SBFBoolEquals())
      {
        goto LABEL_21;
      }
      char v8 = 0;
      if (self->_maxSize.width != v7->_maxSize.width || self->_maxSize.height != v7->_maxSize.height) {
        goto LABEL_22;
      }
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textInsets.top, *(float64x2_t *)&v7->_textInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textInsets.bottom, *(float64x2_t *)&v7->_textInsets.bottom))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_fontLanguageInsets.top, *(float64x2_t *)&v7->_fontLanguageInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_fontLanguageInsets.bottom,
                                                       *(float64x2_t *)&v7->_fontLanguageInsets.bottom))),
                                      0xFuLL))) & 1) != 0
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && SBFBoolEquals()
        && BSEqualObjects()
        && SBFBoolEquals())
      {
        char v8 = SBFBoolEquals();
      }
      else
      {
LABEL_21:
        char v8 = 0;
      }
LABEL_22:

      goto LABEL_23;
    }
    char v8 = 0;
  }
LABEL_23:

  return v8;
}

- (BOOL)containsEmoji
{
  return self->_containsEmoji;
}

- (void)setOverrideTraitCollection:(id)a3
{
}

- (SBIconLabelImageParameters)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconLabelImageParameters;
  v2 = [(SBIconLabelImageParameters *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_recalculateHash = 1;
    v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 scale];
    v3->_scale = v5;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_focusHighlightColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

- (unint64_t)hash
{
  if (!self->_recalculateHash) {
    return self->_hash;
  }
  double scale = self->_scale;
  CGFloat v4 = self->_maxSize.height
     + self->_maxSize.width
     + self->_textInsets.top
     + self->_textInsets.bottom
     + self->_textInsets.left
     + self->_textInsets.right
     + self->_fontLanguageInsets.top
     + self->_fontLanguageInsets.bottom
     + self->_fontLanguageInsets.left
     + self->_fontLanguageInsets.right;
  self->_recalculateHash = 0;
  unint64_t v5 = self->_canTighten + (unint64_t)self->_canTruncate;
  unint64_t v6 = (unint64_t)(v4 + scale);
  unint64_t v7 = v5 + [(NSString *)self->_text hash];
  uint64_t v8 = v7 + [(UIFont *)self->_font hash] + self->_legibilityStyle;
  uint64_t v9 = v8 + [(UIColor *)self->_textColor hash];
  uint64_t v10 = v9 + [(UIColor *)self->_focusHighlightColor hash] + self->_accessibilityReduceTransparencyEnabled;
  unint64_t result = v6
         + v10
         + [(NSString *)self->_contentSizeCategory hash]
         + self->_colorspaceGrayscale
         + self->_colorspaceGrayscaleSet;
  self->_hash = result;
  return result;
}

- (SBIconLabelImageParameters)initWithParameters:(id)a3
{
  CGFloat v4 = (char *)a3;
  unint64_t v5 = [(SBIconLabelImageParameters *)self init];
  if (v5)
  {
    uint64_t v6 = [*((id *)v4 + 2) copy];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_containsEmoji = v4[24];
    v5->_canTruncate = v4[25];
    v5->_canTighten = v4[26];
    v5->_maxSize = (CGSize)*((_OWORD *)v4 + 3);
    objc_storeStrong((id *)&v5->_font, *((id *)v4 + 1));
    v5->_legibilityStyle = *((void *)v4 + 8);
    v5->_double scale = *((double *)v4 + 5);
    objc_storeStrong((id *)&v5->_textColor, *((id *)v4 + 9));
    v5->_recalculateHash = v4[27];
    v5->_hash = *((void *)v4 + 20);
    v5->_accessibilityReduceTransparencyEnabled = v4[28];
    uint64_t v8 = [*((id *)v4 + 4) copy];
    contentSizeCategory = v5->_contentSizeCategory;
    v5->_contentSizeCategory = (NSString *)v8;

    objc_storeStrong((id *)&v5->_focusHighlightColor, *((id *)v4 + 10));
    long long v10 = *(_OWORD *)(v4 + 88);
    *(_OWORD *)&v5->_textInsets.bottom = *(_OWORD *)(v4 + 104);
    *(_OWORD *)&v5->_textInsets.top = v10;
    long long v11 = *(_OWORD *)(v4 + 120);
    *(_OWORD *)&v5->_fontLanguageInsets.bottom = *(_OWORD *)(v4 + 136);
    *(_OWORD *)&v5->_fontLanguageInsets.top = v11;
    v5->_colorspaceGraydouble scale = v4[29];
    v5->_colorspaceGrayscaleSet = v4[30];
  }

  return v5;
}

- (BOOL)isColorspaceGrayscale
{
  v2 = self;
  if (self->_colorspaceGrayscaleSet)
  {
    LOBYTE(self) = self->_colorspaceGrayscale;
  }
  else if (self->_containsEmoji)
  {
    LOBYTE(self) = 0;
  }
  else
  {
    textColor = self->_textColor;
    if (!textColor || (LODWORD(self) = [(UIColor *)textColor sbh_isGrayscale], self))
    {
      focusHighlightColor = v2->_focusHighlightColor;
      if (!focusHighlightColor
        || (LODWORD(self) = [(UIColor *)focusHighlightColor sbh_isGrayscale], self))
      {
        LOBYTE(self) = 1;
      }
    }
  }
  return (char)self;
}

- (void)_noteNeedsHashRecalculation
{
  self->_recalculateHash = 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_text withName:@"text"];
  id v5 = (id)[v3 appendObject:self->_font withName:@"font"];
  id v6 = (id)objc_msgSend(v3, "appendSize:withName:", @"maxSize", self->_maxSize.width, self->_maxSize.height);
  unint64_t v7 = NSStringFromUIEdgeInsets(self->_fontLanguageInsets);
  id v8 = (id)[v3 appendObject:v7 withName:@"fontLanguageInsets"];

  id v9 = (id)[v3 appendBool:self->_containsEmoji withName:@"containsEmoji"];
  id v10 = (id)[v3 appendBool:self->_canTruncate withName:@"canTruncate"];
  id v11 = (id)[v3 appendBool:self->_canTighten withName:@"canTighten"];
  id v12 = (id)[v3 appendInteger:self->_legibilityStyle withName:@"legibilityStyle"];
  id v13 = (id)[v3 appendFloat:@"scale" withName:self->_scale];
  id v14 = (id)[v3 appendBool:self->_accessibilityReduceTransparencyEnabled withName:@"accessibilityReduceTransparencyEnabled"];
  id v15 = (id)[v3 appendObject:self->_contentSizeCategory withName:@"contentSizeCategory"];
  if (self->_colorspaceGrayscaleSet) {
    id v16 = (id)[v3 appendBool:self->_colorspaceGrayscale withName:@"colorspaceGrayscale"];
  }
  id v17 = (id)[v3 appendObject:self->_overrideTraitCollection withName:@"overrideTraitCollection" skipIfNil:1];
  v18 = [v3 build];

  return v18;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SBMutableIconLabelImageParameters alloc];
  return [(SBIconLabelImageParameters *)v4 initWithParameters:self];
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIFont)font
{
  return self->_font;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)canTruncate
{
  return self->_canTruncate;
}

- (BOOL)canTighten
{
  return self->_canTighten;
}

- (int64_t)legibilityStyle
{
  return self->_legibilityStyle;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)isAccessibilityReduceTransparencyEnabled
{
  return self->_accessibilityReduceTransparencyEnabled;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (UIColor)focusHighlightColor
{
  return self->_focusHighlightColor;
}

- (UIEdgeInsets)textInsets
{
  double top = self->_textInsets.top;
  double left = self->_textInsets.left;
  double bottom = self->_textInsets.bottom;
  double right = self->_textInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)fontLanguageInsets
{
  double top = self->_fontLanguageInsets.top;
  double left = self->_fontLanguageInsets.left;
  double bottom = self->_fontLanguageInsets.bottom;
  double right = self->_fontLanguageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UITraitCollection)overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

@end