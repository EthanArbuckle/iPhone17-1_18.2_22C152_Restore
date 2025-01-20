@interface _UIButtonConfiguration
+ (BOOL)supportsSecureCoding;
+ (_UIButtonConfiguration)configurationWithStyle:(int64_t)a3;
+ (id)filledButtonConfiguration;
+ (id)grayButtonConfiguration;
+ (id)plainButtonConfiguration;
+ (id)tintedButtonConfiguration;
- (BOOL)_hasMultilineSubtitle;
- (BOOL)_hasMultilineTitle;
- (BOOL)_hasObscuringBackground;
- (BOOL)_hasOversizedSubtitle;
- (BOOL)_hasOversizedTitle;
- (BOOL)_hasSymbolImage;
- (BOOL)_isRoundButton;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsBusyIndicator;
- (NSAttributedString)attributedSubtitle;
- (NSAttributedString)attributedTitle;
- (NSDirectionalEdgeInsets)backgroundToContentInsets;
- (NSDirectionalEdgeInsets)contentInsets;
- (NSString)description;
- (NSString)subtitle;
- (NSString)title;
- (UIBackgroundConfiguration)background;
- (UIColor)imageTintColor;
- (UIImage)image;
- (UIImageSymbolConfiguration)preferredSymbolConfigurationForImage;
- (_UIButtonConfiguration)initWithCoder:(id)a3;
- (double)_resolvedActivityIndicatorSize;
- (double)_resolvedImageReservation;
- (double)_resolvedIndicatorPadding;
- (double)imageToTitlePadding;
- (double)titlePadding;
- (id)_apiValue;
- (id)_baseAttributesTransformerForTransformer:(void *)a1;
- (id)_resolvedActivityIndicatorColor;
- (id)_resolvedImageColor;
- (id)_resolvedIndicator;
- (id)_resolvedIndicatorColor;
- (id)_resolvedIndicatorSymbolConfiguration;
- (id)_resolvedSubtitle;
- (id)_resolvedTitle;
- (id)_titleFontForRole;
- (id)_traitCollection;
- (id)_updateFromButton:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageTintColorTransformer;
- (id)subtitleTextAttributesTransformer;
- (id)titleTextAttributesTransformer;
- (id)updatedConfigurationForState:(id)a3;
- (int64_t)_resolvedIdiom;
- (int64_t)_resolvedTitleAlignment;
- (int64_t)buttonSize;
- (int64_t)cornerStyle;
- (int64_t)imageTintColorTransformerIdentifier;
- (int64_t)macIdiomStyle;
- (int64_t)style;
- (int64_t)subtitleLineBreakMode;
- (int64_t)titleAlignment;
- (int64_t)titleLineBreakMode;
- (unint64_t)hash;
- (unint64_t)imageEdge;
- (void)_defaultTitleColor;
- (void)_setImageTintColorTransformerIdentifier:(int64_t)a3;
- (void)_updateMetadataFromButton:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributedSubtitle:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setBackgroundToContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setButtonSize:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setImageEdge:(unint64_t)a3;
- (void)setImageTintColor:(id)a3;
- (void)setImageTintColorTransformer:(id)a3;
- (void)setImageToTitlePadding:(double)a3;
- (void)setMacIdiomStyle:(int64_t)a3;
- (void)setPreferredSymbolConfigurationForImage:(id)a3;
- (void)setShowsBusyIndicator:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleTextAttributesTransformer:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleTextAttributesTransformer:(id)a3;
@end

@implementation _UIButtonConfiguration

- (NSDirectionalEdgeInsets)contentInsets
{
  [(_UIButtonConfiguration *)self backgroundToContentInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(_UIButtonConfiguration *)self _traitCollection];
  v12 = v11;
  if (v11)
  {
    v13 = [v11 preferredContentSizeCategory];
    char v20 = 0;
    uint64_t v14 = _UIContentSizeCategoryFromStringInternal(v13, &v20);

    if (v14 >= 0x10000)
    {
      double v15 = (double)(v14 - 0xFFFF) + (double)(v14 - 0xFFFF);
      double v6 = v6 + v15;
      double v10 = v10 + v15;
    }
  }

  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.trailing = v19;
  result.bottom = v18;
  result.leading = v17;
  result.top = v16;
  return result;
}

- (int64_t)cornerStyle
{
  return 0;
}

- (double)titlePadding
{
  return 1.0;
}

- (int64_t)titleAlignment
{
  return 0;
}

- (int64_t)_resolvedTitleAlignment
{
  return 0;
}

- (double)_resolvedImageReservation
{
  return 0.0;
}

- (id)_resolvedIndicator
{
  return 0;
}

- (id)_resolvedIndicatorColor
{
  return 0;
}

- (id)_resolvedIndicatorSymbolConfiguration
{
  return 0;
}

- (double)_resolvedIndicatorPadding
{
  return 0.0;
}

- (id)_resolvedActivityIndicatorColor
{
  return +[UIColor secondaryLabelColor];
}

- (int64_t)_resolvedIdiom
{
  return -1;
}

- (id)_apiValue
{
  return 0;
}

- (id)_updateFromButton:(id)a3
{
  id v4 = a3;
  double v5 = [v4 _configurationState];
  double v6 = [(_UIButtonConfiguration *)self updatedConfigurationForState:v5];

  [v6 _updateMetadataFromButton:v4];
  return v6;
}

- (int64_t)titleLineBreakMode
{
  return 0;
}

- (int64_t)subtitleLineBreakMode
{
  return 0;
}

- (BOOL)_hasMultilineTitle
{
  v2 = [(_UIButtonConfiguration *)self attributedTitle];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)_hasMultilineSubtitle
{
  v2 = [(_UIButtonConfiguration *)self attributedSubtitle];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)_hasOversizedTitle
{
  return 0;
}

- (BOOL)_hasOversizedSubtitle
{
  return 0;
}

- (BOOL)_hasSymbolImage
{
  return 0;
}

- (BOOL)_isRoundButton
{
  return 0;
}

- (BOOL)_hasObscuringBackground
{
  v2 = self;
  BOOL v3 = [(_UIButtonConfiguration *)self background];
  [(_UIButtonConfiguration *)v2 _resolvedIdiom];
  LOBYTE(v2) = _UIBackgroundConfigurationIsObscuring(v3);

  return (char)v2;
}

+ (_UIButtonConfiguration)configurationWithStyle:(int64_t)a3
{
  id v4 = [_UIButtonConfiguration alloc];
  if (v4)
  {
    v18.receiver = v4;
    v18.super_class = (Class)_UIButtonConfiguration;
    double v5 = objc_msgSendSuper2(&v18, sel_init);
    double v6 = v5;
    if (v5)
    {
      v5[9].i64[0] = a3;
      v5[5].i64[0] = 2;
      uint64_t v7 = +[UIBackgroundConfiguration clearConfiguration];
      double v8 = (void *)v6[2].i64[1];
      v6[2].i64[1] = v7;

      uint64_t v9 = v6[9].i64[0];
      switch(v9)
      {
        case 3:
          [(id)v6[2].i64[1] setBackgroundColor:0];
          uint64_t v12 = +[UIColor whiteColor];
          v13 = (void *)v6[3].i64[1];
          v6[3].i64[1] = v12;

          break;
        case 2:
          [(id)v6[2].i64[1] setBackgroundColor:0];
          break;
        case 1:
          double v10 = +[UIColor clearColor];
          [(id)v6[2].i64[1] setStrokeColor:v10];

          [(id)v6[2].i64[1] setStrokeWidth:1.0];
          v11 = +[UIColor secondarySystemFillColor];
          [(id)v6[2].i64[1] setBackgroundColor:v11];

          break;
      }
      [MEMORY[0x1E4F39BE8] cornerCurveExpansionFactor:*MEMORY[0x1E4F39EA8]];
      [(id)v6[2].i64[1] setCornerRadius:22.0 / v14];
      double v15 = +[UIColor clearColor];
      [(id)v6[2].i64[1] setStrokeColor:v15];

      [(id)v6[2].i64[1] setStrokeWidth:1.0];
      v6[8].i64[0] = 0x4020000000000000;
      int64x2_t v16 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
      v6[10] = v16;
      v6[11] = v16;
    }
  }
  else
  {
    double v6 = 0;
  }
  return (_UIButtonConfiguration *)v6;
}

+ (id)plainButtonConfiguration
{
  return (id)[a1 configurationWithStyle:0];
}

+ (id)grayButtonConfiguration
{
  return (id)[a1 configurationWithStyle:1];
}

+ (id)tintedButtonConfiguration
{
  return (id)[a1 configurationWithStyle:2];
}

+ (id)filledButtonConfiguration
{
  return (id)[a1 configurationWithStyle:3];
}

- (id)updatedConfigurationForState:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[(_UIButtonConfiguration *)self copy];
  uint64_t v6 = [(UIBackgroundConfiguration *)self->_background updatedConfigurationForState:v4];
  uint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  switch([(_UIButtonConfiguration *)self style])
  {
    case 0:
      if ([v4 isHighlighted])
      {
        double v8 = [v4 traitCollection];
        uint64_t v9 = [v8 userInterfaceStyle];

        if (v9 == 2) {
          uint64_t v10 = 17;
        }
        else {
          uint64_t v10 = 14;
        }
        v11 = _UIConfigurationColorTransformerForIdentifier(v10);
        uint64_t v12 = -[_UIButtonConfiguration _baseAttributesTransformerForTransformer:](self, v11);
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v12 = 0;
      }
      uint64_t v15 = 0;
      if ([v4 isDisabled]) {
        goto LABEL_39;
      }
      break;
    case 1:
      if ([v4 isHighlighted])
      {
        v25 = [v4 traitCollection];
        uint64_t v26 = [v25 userInterfaceStyle];

        if (v26 == 2) {
          uint64_t v10 = 16;
        }
        else {
          uint64_t v10 = 14;
        }
        v27 = _UIConfigurationColorTransformerForIdentifier(v10);
        uint64_t v12 = -[_UIButtonConfiguration _baseAttributesTransformerForTransformer:](self, v27);

        v28 = [v4 traitCollection];
        uint64_t v29 = [v28 userInterfaceStyle];

        if (v29 == 2) {
          uint64_t v15 = 15;
        }
        else {
          uint64_t v15 = 14;
        }
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v12 = 0;
        uint64_t v15 = 0;
      }
      goto LABEL_37;
    case 2:
      v13 = [v4 traitCollection];
      uint64_t v14 = [v13 userInterfaceStyle];

      if (v14 == 2) {
        uint64_t v15 = 22;
      }
      else {
        uint64_t v15 = 21;
      }
      if ([v4 isHighlighted])
      {
        int64x2_t v16 = [v4 traitCollection];
        uint64_t v17 = [v16 userInterfaceStyle];

        if (v17 == 2) {
          uint64_t v10 = 16;
        }
        else {
          uint64_t v10 = 14;
        }
        objc_super v18 = _UIConfigurationColorTransformerForIdentifier(v10);
        uint64_t v12 = -[_UIButtonConfiguration _baseAttributesTransformerForTransformer:](self, v18);

        double v19 = [v4 traitCollection];
        uint64_t v20 = [v19 userInterfaceStyle];

        if (v20 == 2) {
          uint64_t v15 = 24;
        }
        else {
          uint64_t v15 = 25;
        }
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v12 = 0;
      }
LABEL_37:
      if ([v4 isDisabled]) {
        goto LABEL_38;
      }
      break;
    case 3:
      if ([v4 isHighlighted])
      {
        v21 = [v4 traitCollection];
        [v21 userInterfaceStyle];

        id v22 = &__block_literal_global_8_5;
        uint64_t v12 = -[_UIButtonConfiguration _baseAttributesTransformerForTransformer:](self, &__block_literal_global_8_5);

        v23 = [v4 traitCollection];
        uint64_t v24 = [v23 userInterfaceStyle];

        uint64_t v10 = 14;
        if (v24 == 2) {
          uint64_t v15 = 17;
        }
        else {
          uint64_t v15 = 14;
        }
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v12 = 0;
        uint64_t v15 = 0;
      }
      if (![v4 isDisabled]) {
        break;
      }
LABEL_38:
      uint64_t v15 = 23;
LABEL_39:
      v30 = [v4 traitCollection];
      [v30 userInterfaceStyle];

      id v31 = &__block_literal_global_45;
      uint64_t v32 = -[_UIButtonConfiguration _baseAttributesTransformerForTransformer:](self, &__block_literal_global_45);

      uint64_t v10 = 26;
      uint64_t v12 = (void *)v32;
      break;
    default:
      uint64_t v10 = 0;
      uint64_t v12 = 0;
      uint64_t v15 = 0;
      break;
  }
  if (!self->_hasCustomizedImageTintColorTransformer) {
    [v5 _setImageTintColorTransformerIdentifier:v10];
  }
  v33 = _Block_copy(v12);
  v34 = (void *)v5[1];
  v5[1] = v33;

  uint64_t v35 = [v5 background];
  v36 = (void *)v35;
  if (v35 && (*(_WORD *)(v35 + 8) & 0x20) == 0) {
    -[UIBackgroundConfiguration _setBackgroundColorTransformerIdentifier:](v35, v15);
  }

  return v5;
}

- (id)_baseAttributesTransformerForTransformer:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67___UIButtonConfiguration__baseAttributesTransformerForTransformer___block_invoke;
    aBlock[3] = &unk_1E5300460;
    id v7 = v3;
    a1 = _Block_copy(aBlock);
  }
  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIButtonConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_UIButtonConfiguration;
  double v5 = [(_UIButtonConfiguration *)&v22 init];
  if (v5)
  {
    v5->_style = [v4 decodeIntegerForKey:@"UIButtonConfigurationButtonStyle"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationAttributedTitle"];
    attributedTitle = v5->_attributedTitle;
    v5->_attributedTitle = (NSAttributedString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationAttributedSubtitle"];
    attributedSubtitle = v5->_attributedSubtitle;
    v5->_attributedSubtitle = (NSAttributedString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationImage"];
    image = v5->_image;
    v5->_image = (UIImage *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationImageTintColor"];
    imageTintColor = v5->_imageTintColor;
    v5->_imageTintColor = (UIColor *)v12;

    v5->_showsBusyIndicator = [v4 decodeBoolForKey:@"UIButtonConfigurationShowsBusyIndicator"];
    [v4 decodeFloatForKey:@"UIButtonConfigurationTitlePadding"];
    v5->_imageToTitlePadding = v14;
    v5->_imageEdge = [v4 decodeIntegerForKey:@"UIButtonConfigurationImageEdge"];
    v5->_macIdiomStyle = [v4 decodeIntegerForKey:@"UIButtonConfigurationMacIdiomStyle"];
    [v4 decodeDirectionalEdgeInsetsForKey:@"UIButtonConfigurationBackgroundToContentInsets"];
    v5->_backgroundToContentInsets.top = v15;
    v5->_backgroundToContentInsets.leading = v16;
    v5->_backgroundToContentInsets.bottom = v17;
    v5->_backgroundToContentInsets.trailing = v18;
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationBackground"];
    background = v5->_background;
    v5->_background = (UIBackgroundConfiguration *)v19;

    -[_UIButtonConfiguration _setImageTintColorTransformerIdentifier:](v5, "_setImageTintColorTransformerIdentifier:", [v4 decodeIntegerForKey:@"UIButtonConfigurationImageColorTransformer"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style = self->_style;
  id v6 = a3;
  [v6 encodeInteger:style forKey:@"UIButtonStyle"];
  [v6 encodeObject:self->_attributedTitle forKey:@"UIButtonConfigurationAttributedTitle"];
  [v6 encodeObject:self->_attributedSubtitle forKey:@"UIButtonConfigurationAttributedSubtitle"];
  [v6 encodeObject:self->_image forKey:@"UIButtonConfigurationImage"];
  [v6 encodeObject:self->_imageTintColor forKey:@"UIButtonConfigurationImageTintColor"];
  [v6 encodeBool:self->_showsBusyIndicator forKey:@"UIButtonConfigurationShowsBusyIndicator"];
  double imageToTitlePadding = self->_imageToTitlePadding;
  *(float *)&double imageToTitlePadding = imageToTitlePadding;
  [v6 encodeFloat:@"UIButtonConfigurationTitlePadding" forKey:imageToTitlePadding];
  [v6 encodeInteger:self->_imageEdge forKey:@"UIButtonConfigurationImageEdge"];
  [v6 encodeInteger:self->_macIdiomStyle forKey:@"UIButtonConfigurationMacIdiomStyle"];
  objc_msgSend(v6, "encodeDirectionalEdgeInsets:forKey:", @"UIButtonConfigurationBackgroundToContentInsets", self->_backgroundToContentInsets.top, self->_backgroundToContentInsets.leading, self->_backgroundToContentInsets.bottom, self->_backgroundToContentInsets.trailing);
  [v6 encodeObject:self->_background forKey:@"UIButtonConfigurationBackground"];
  [v6 encodeInteger:self->_imageTintColorTransformerIdentifier forKey:@"UIButtonConfigurationImageColorTransformer"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [self->_baseAttributesTransformer copy];
  id v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  *(void *)(v4 + 144) = self->_style;
  *(void *)(v4 + 152) = self->_macIdiomStyle;
  uint64_t v7 = [(UIBackgroundConfiguration *)self->_background copy];
  uint64_t v8 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v7;

  objc_storeStrong((id *)(v4 + 48), self->_image);
  objc_storeStrong((id *)(v4 + 56), self->_imageTintColor);
  uint64_t v9 = [self->_imageTintColorTransformer copy];
  uint64_t v10 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v9;

  *(void *)(v4 + 136) = self->_imageTintColorTransformerIdentifier;
  objc_storeStrong((id *)(v4 + 72), self->_preferredSymbolConfigurationForImage);
  *(void *)(v4 + 88) = self->_buttonSize;
  uint64_t v11 = [(NSAttributedString *)self->_attributedTitle copy];
  uint64_t v12 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v11;

  uint64_t v13 = [self->_titleTextAttributesTransformer copy];
  float v14 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v13;

  uint64_t v15 = [(NSAttributedString *)self->_attributedSubtitle copy];
  CGFloat v16 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = v15;

  uint64_t v17 = [self->_subtitleTextAttributesTransformer copy];
  CGFloat v18 = *(void **)(v4 + 120);
  *(void *)(v4 + 120) = v17;

  *(unsigned char *)(v4 + 33) = self->_showsBusyIndicator;
  long long v19 = *(_OWORD *)&self->_backgroundToContentInsets.bottom;
  *(_OWORD *)(v4 + 160) = *(_OWORD *)&self->_backgroundToContentInsets.top;
  *(_OWORD *)(v4 + 176) = v19;
  *(double *)(v4 + 128) = self->_imageToTitlePadding;
  *(void *)(v4 + 80) = self->_imageEdge;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UIButtonConfiguration *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      id v6 = v5;
      if (self->_style != v5->_style) {
        goto LABEL_7;
      }
      if (self->_macIdiomStyle != v5->_macIdiomStyle) {
        goto LABEL_7;
      }
      if (self->_showsBusyIndicator != v5->_showsBusyIndicator) {
        goto LABEL_7;
      }
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_backgroundToContentInsets.top, *(float64x2_t *)&v5->_backgroundToContentInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_backgroundToContentInsets.bottom, *(float64x2_t *)&v5->_backgroundToContentInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_7; {
      if (self->_imageToTitlePadding != v5->_imageToTitlePadding)
      }
        goto LABEL_7;
      if (self->_imageEdge != v5->_imageEdge) {
        goto LABEL_7;
      }
      if (!UIEqual(self->_image, v5->_image)) {
        goto LABEL_7;
      }
      uint64_t v9 = _Block_copy(self->_imageTintColorTransformer);
      uint64_t v10 = _Block_copy(v6->_imageTintColorTransformer);
      int v11 = UIEqual(v9, v10);

      if (!v11) {
        goto LABEL_7;
      }
      if (self->_buttonSize != v6->_buttonSize) {
        goto LABEL_7;
      }
      if (!UIEqual(self->_preferredSymbolConfigurationForImage, v6->_preferredSymbolConfigurationForImage))goto LABEL_7; {
      if (!UIEqual(self->_attributedTitle, v6->_attributedTitle))
      }
        goto LABEL_7;
      uint64_t v12 = _Block_copy(self->_titleTextAttributesTransformer);
      uint64_t v13 = _Block_copy(v6->_titleTextAttributesTransformer);
      int v14 = UIEqual(v12, v13);

      if (!v14) {
        goto LABEL_7;
      }
      if (UIEqual(self->_attributedSubtitle, v6->_attributedSubtitle)
        && (uint64_t v15 = _Block_copy(self->_subtitleTextAttributesTransformer),
            CGFloat v16 = _Block_copy(v6->_subtitleTextAttributesTransformer),
            int v17 = UIEqual(v15, v16),
            v16,
            v15,
            v17))
      {
        char v7 = UIEqual(self->_background, v6->_background);
      }
      else
      {
LABEL_7:
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(UIBackgroundConfiguration *)self->_background hash];
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)_UIButtonConfiguration;
  id v3 = [(_UIButtonConfiguration *)&v10 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@" background=%@", self->_background];
  if ([(NSAttributedString *)self->_attributedTitle length])
  {
    attributedTitle = self->_attributedTitle;
    id v6 = [(NSAttributedString *)attributedTitle string];
    [v4 appendFormat:@" title=[<%p>]%@", attributedTitle, v6];
  }
  if ([(NSAttributedString *)self->_attributedSubtitle length])
  {
    attributedSubtitle = self->_attributedSubtitle;
    uint64_t v8 = [(NSAttributedString *)attributedSubtitle string];
    [v4 appendFormat:@" subTitle=[<%p>]%@", attributedSubtitle, v8];
  }
  if (self->_image) {
    [v4 appendFormat:@" image=%@", self->_image];
  }
  return (NSString *)v4;
}

- (void)setImageEdge:(unint64_t)a3
{
  if (a3 > 8 || ((1 << a3) & 0x116) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIButtonConfiguration.m", 360, @"Only single edges are supported by _UIButtonConfiguration.imageEdge (%lx was specified)", a3);
  }
  self->_imageEdge = a3;
}

- (void)setImageTintColorTransformer:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  id imageTintColorTransformer = self->_imageTintColorTransformer;
  self->_id imageTintColorTransformer = v4;

  self->_hasCustomizedImageTintColorTransformer = 1;
}

- (NSString)title
{
  return [(NSAttributedString *)self->_attributedTitle string];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
    [(_UIButtonConfiguration *)self setAttributedTitle:v4];
  }
  else
  {
    [(_UIButtonConfiguration *)self setAttributedTitle:0];
  }
}

- (NSString)subtitle
{
  return [(NSAttributedString *)self->_attributedSubtitle string];
}

- (void)setSubtitle:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
    [(_UIButtonConfiguration *)self setAttributedSubtitle:v4];
  }
  else
  {
    [(_UIButtonConfiguration *)self setAttributedSubtitle:0];
  }
}

- (NSDirectionalEdgeInsets)backgroundToContentInsets
{
  unint64_t v2 = self->_buttonSize - 1;
  if (v2 > 2)
  {
    double trailing = 12.0;
    double bottom = 7.0;
  }
  else
  {
    double bottom = dbl_186B9B520[v2];
    double trailing = dbl_186B9B538[v2];
  }
  double top = self->_backgroundToContentInsets.top;
  double leading = self->_backgroundToContentInsets.leading;
  if (top == -1.79769313e308) {
    double top = bottom;
  }
  if (leading == -1.79769313e308) {
    double leading = trailing;
  }
  if (self->_backgroundToContentInsets.bottom != -1.79769313e308) {
    double bottom = self->_backgroundToContentInsets.bottom;
  }
  if (self->_backgroundToContentInsets.trailing != -1.79769313e308) {
    double trailing = self->_backgroundToContentInsets.trailing;
  }
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)_setImageTintColorTransformerIdentifier:(int64_t)a3
{
  self->_imageTintColorTransformerIdentifier = a3;
  uint64_t v4 = _UIConfigurationColorTransformerForIdentifier(a3);
  id imageTintColorTransformer = self->_imageTintColorTransformer;
  self->_id imageTintColorTransformer = v4;
}

- (void)_defaultTitleColor
{
  if (a1)
  {
    if (a1[18] == 3) {
      +[UIColor whiteColor];
    }
    else {
    a1 = +[UIColor tintColor];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_titleFontForRole
{
  if (a1)
  {
    unint64_t v1 = *(void *)(a1 + 88) - 1;
    BOOL v2 = v1 >= 2;
    if (v1 >= 2) {
      id v3 = UIFontTextStyleEmphasizedBody;
    }
    else {
      id v3 = UIFontTextStyleEmphasizedSubheadline;
    }
    uint64_t v4 = &UIFontTextStyleSubheadline;
    if (v2) {
      uint64_t v4 = &UIFontTextStyleBody;
    }
    if (*(void *)(a1 + 24) == 1) {
      id v5 = (id *)v3;
    }
    else {
      id v5 = (id *)v4;
    }
    id v6 = *v5;
    char v7 = [off_1E52D39B8 preferredFontForTextStyle:v6];
  }
  else
  {
    char v7 = 0;
  }
  return v7;
}

- (id)_resolvedTitle
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if ([(NSAttributedString *)self->_attributedTitle length])
  {
    v8[0] = *(void *)off_1E52D2040;
    id v3 = -[_UIButtonConfiguration _titleFontForRole]((uint64_t)self);
    v9[0] = v3;
    v8[1] = *(void *)off_1E52D2048;
    uint64_t v4 = -[_UIButtonConfiguration _defaultTitleColor](self);
    v9[1] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

    id v6 = _UIButtonUpdateStringAttributes_0(self->_attributedTitle, v5, self->_baseAttributesTransformer, self->_titleTextAttributesTransformer);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_resolvedSubtitle
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(NSAttributedString *)self->_attributedSubtitle length])
  {
    v9[0] = *(void *)off_1E52D2040;
    if ((unint64_t)(self->_buttonSize - 1) >= 2) {
      id v3 = &UIFontTextStyleFootnote;
    }
    else {
      id v3 = &UIFontTextStyleCaption1;
    }
    uint64_t v4 = [off_1E52D39B8 preferredFontForTextStyle:*v3];
    v10[0] = v4;
    v9[1] = *(void *)off_1E52D2048;
    id v5 = -[_UIButtonConfiguration _defaultTitleColor](self);
    v10[1] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

    char v7 = _UIButtonUpdateStringAttributes_0(self->_attributedSubtitle, v6, self->_baseAttributesTransformer, self->_subtitleTextAttributesTransformer);
  }
  else
  {
    char v7 = 0;
  }
  return v7;
}

- (id)_resolvedImageColor
{
  imageTintColor = self->_imageTintColor;
  if (imageTintColor)
  {
    uint64_t v4 = imageTintColor;
  }
  else
  {
    uint64_t v4 = +[UIColor tintColor];
  }
  id v5 = v4;
  id imageTintColorTransformer = (void (**)(id, void *))self->_imageTintColorTransformer;
  if (imageTintColorTransformer)
  {
    uint64_t v7 = imageTintColorTransformer[2](imageTintColorTransformer, v5);

    id v5 = (void *)v7;
  }
  return v5;
}

- (double)_resolvedActivityIndicatorSize
{
  BOOL v2 = -[_UIButtonConfiguration _titleFontForRole]((uint64_t)self);
  [v2 lineHeight];
  double v4 = v3;

  return v4;
}

- (id)_traitCollection
{
  return self->_traitCollection;
}

- (void)_updateMetadataFromButton:(id)a3
{
  id v4 = a3;
  id v5 = [v4 traitCollection];
  traitCollection = self->_traitCollection;
  self->_traitCollection = v5;

  int64_t v7 = [v4 role];
  self->_role = v7;
}

- (UIBackgroundConfiguration)background
{
  return self->_background;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (id)imageTintColorTransformer
{
  return self->_imageTintColorTransformer;
}

- (UIImageSymbolConfiguration)preferredSymbolConfigurationForImage
{
  return self->_preferredSymbolConfigurationForImage;
}

- (void)setPreferredSymbolConfigurationForImage:(id)a3
{
}

- (unint64_t)imageEdge
{
  return self->_imageEdge;
}

- (int64_t)buttonSize
{
  return self->_buttonSize;
}

- (void)setButtonSize:(int64_t)a3
{
  self->_buttonSize = a3;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
}

- (id)titleTextAttributesTransformer
{
  return self->_titleTextAttributesTransformer;
}

- (void)setTitleTextAttributesTransformer:(id)a3
{
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (void)setAttributedSubtitle:(id)a3
{
}

- (id)subtitleTextAttributesTransformer
{
  return self->_subtitleTextAttributesTransformer;
}

- (void)setSubtitleTextAttributesTransformer:(id)a3
{
}

- (BOOL)showsBusyIndicator
{
  return self->_showsBusyIndicator;
}

- (void)setShowsBusyIndicator:(BOOL)a3
{
  self->_showsBusyIndicator = a3;
}

- (void)setBackgroundToContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_backgroundToContentInsets = a3;
}

- (double)imageToTitlePadding
{
  return self->_imageToTitlePadding;
}

- (void)setImageToTitlePadding:(double)a3
{
  self->_double imageToTitlePadding = a3;
}

- (int64_t)imageTintColorTransformerIdentifier
{
  return self->_imageTintColorTransformerIdentifier;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)macIdiomStyle
{
  return self->_macIdiomStyle;
}

- (void)setMacIdiomStyle:(int64_t)a3
{
  self->_macIdiomStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_subtitleTextAttributesTransformer, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong(&self->_titleTextAttributesTransformer, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfigurationForImage, 0);
  objc_storeStrong(&self->_imageTintColorTransformer, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong(&self->_baseAttributesTransformer, 0);
}

@end