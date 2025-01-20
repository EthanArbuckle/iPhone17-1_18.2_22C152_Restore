@interface UIContentUnavailableConfiguration
+ (BOOL)supportsSecureCoding;
+ (UIContentUnavailableConfiguration)emptyConfiguration;
+ (UIContentUnavailableConfiguration)loadingConfiguration;
+ (UIContentUnavailableConfiguration)searchConfiguration;
+ (id)_defaultEmptyConfigurationForState:(uint64_t)a1 traitCollection:(void *)a2;
+ (id)_defaultLoadingConfigurationForState:(uint64_t)a1 traitCollection:(void *)a2;
+ (void)_defaultSearchConfigurationForState:(void *)a3 traitCollection:;
- (BOOL)isEqual:(id)a3;
- (CGFloat)buttonToSecondaryButtonPadding;
- (CGFloat)imageToTextPadding;
- (CGFloat)textToButtonPadding;
- (CGFloat)textToSecondaryTextPadding;
- (NSAttributedString)attributedText;
- (NSAttributedString)secondaryAttributedText;
- (NSDirectionalEdgeInsets)directionalLayoutMargins;
- (NSString)description;
- (NSString)secondaryText;
- (NSString)text;
- (UIAxis)axesPreservingSuperviewLayoutMargins;
- (UIBackgroundConfiguration)background;
- (UIButtonConfiguration)button;
- (UIButtonConfiguration)secondaryButton;
- (UIContentUnavailableAlignment)alignment;
- (UIContentUnavailableButtonProperties)buttonProperties;
- (UIContentUnavailableButtonProperties)secondaryButtonProperties;
- (UIContentUnavailableConfiguration)initWithCoder:(id)a3;
- (UIContentUnavailableImageProperties)imageProperties;
- (UIContentUnavailableTextProperties)secondaryTextProperties;
- (UIContentUnavailableTextProperties)textProperties;
- (UIImage)image;
- (id)_initWithImageProperties:(void *)a3 textProperties:(void *)a4 secondaryTextProperties:(void *)a5 buttonProperties:(void *)a6 secondaryButtonProperties:(char)a7 sideBySideButtonAndSecondaryButton:(double)a8 directionalLayoutMargins:(double)a9 imageToTextPadding:(double)a10 textToSecondaryTextPadding:(double)a11 textToButtonPadding:(double)a12 buttonToSecondaryButtonPadding:(double)a13;
- (id)copyWithZone:(_NSZone *)a3;
- (id)makeContentView;
- (id)updatedConfigurationForState:(id)a3;
- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1;
- (unint64_t)hash;
- (void)_setSwiftBridgingButtonProperties:(id)a3;
- (void)_setSwiftBridgingImageProperties:(id)a3;
- (void)_setSwiftBridgingSecondaryButtonProperties:(id)a3;
- (void)_setSwiftBridgingSecondaryTextProperties:(id)a3;
- (void)_setSwiftBridgingTextProperties:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignment:(UIContentUnavailableAlignment)alignment;
- (void)setAttributedText:(NSAttributedString *)attributedText;
- (void)setAxesPreservingSuperviewLayoutMargins:(UIAxis)axesPreservingSuperviewLayoutMargins;
- (void)setBackground:(UIBackgroundConfiguration *)background;
- (void)setButton:(UIButtonConfiguration *)button;
- (void)setButtonToSecondaryButtonPadding:(CGFloat)buttonToSecondaryButtonPadding;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)directionalLayoutMargins;
- (void)setImage:(UIImage *)image;
- (void)setImageToTextPadding:(CGFloat)imageToTextPadding;
- (void)setSecondaryAttributedText:(NSAttributedString *)secondaryAttributedText;
- (void)setSecondaryButton:(UIButtonConfiguration *)secondaryButton;
- (void)setSecondaryText:(NSString *)secondaryText;
- (void)setText:(NSString *)text;
- (void)setTextToButtonPadding:(CGFloat)textToButtonPadding;
- (void)setTextToSecondaryTextPadding:(CGFloat)textToSecondaryTextPadding;
@end

@implementation UIContentUnavailableConfiguration

+ (UIContentUnavailableConfiguration)emptyConfiguration
{
  v3 = +[UIContentUnavailableConfigurationState _readonlyContentUnavailableConfigurationState:]((uint64_t)UIContentUnavailableConfigurationState, 0);
  v4 = +[UITraitCollection _fallbackTraitCollection]();
  v5 = +[UIContentUnavailableConfiguration _defaultEmptyConfigurationForState:traitCollection:]((uint64_t)a1, v4);

  return (UIContentUnavailableConfiguration *)v5;
}

+ (id)_defaultEmptyConfigurationForState:(uint64_t)a1 traitCollection:(void *)a2
{
  id v2 = a2;
  self;
  v3 = _UIContentUnavailableConstantsForTraitCollection(v2);
  v4 = objc_alloc_init(UIContentUnavailableImageProperties);
  v6 = [v3 defaultEmptyImageSymbolConfigurationForTraitCollection:v2];
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v5, v6, 24);
  }

  v7 = [v3 defaultEmptyImageTintColor];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v4, v7);

  v8 = objc_alloc_init(UIContentUnavailableTextProperties);
  v9 = [v3 defaultEmptyTextFontForTraitCollection:v2];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v8, v9);

  v10 = [v3 defaultEmptyTextColorForTraitCollection:v2];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v8, v10);

  v11 = objc_alloc_init(UIContentUnavailableTextProperties);
  v12 = [v3 defaultEmptySecondaryTextFontForTraitCollection:v2];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v11, v12);

  v13 = [v3 defaultSecondaryTextColor];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v13);

  v14 = objc_alloc_init(UIContentUnavailableButtonProperties);
  v15 = objc_alloc_init(UIContentUnavailableButtonProperties);
  char v16 = [v3 prefersSideBySideButtonAndSecondaryButton];
  [v3 defaultDirectionalLayoutMarginsForTraitCollection:v2];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [v3 defaultEmptyImageToTextPaddingForTraitCollection:v2];
  double v26 = v25;
  [v3 defaultEmptyTextToSecondaryTextPaddingForTraitCollection:v2];
  double v28 = v27;
  [v3 defaultEmptyTextToButtonPaddingForTraitCollection:v2];
  double v30 = v29;
  [v3 defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:v2];
  double v32 = v31;

  v33 = -[UIContentUnavailableConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:buttonProperties:secondaryButtonProperties:sideBySideButtonAndSecondaryButton:directionalLayoutMargins:imageToTextPadding:textToSecondaryTextPadding:textToButtonPadding:buttonToSecondaryButtonPadding:]((id *)[UIContentUnavailableConfiguration alloc], v4, v8, v11, v14, v15, v16, v18, v20, v22, v24, v26, v28, v30, v32);
  v34 = v33;
  if (v33) {
    v33[7] = 0;
  }

  return v34;
}

+ (id)_defaultLoadingConfigurationForState:(uint64_t)a1 traitCollection:(void *)a2
{
  id v2 = a2;
  self;
  v3 = _UIContentUnavailableConstantsForTraitCollection(v2);
  v4 = objc_alloc_init(UIContentUnavailableImageProperties);
  v6 = [v3 defaultLoadingImageSymbolConfigurationForTraitCollection:v2];
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v5, v6, 24);
  }

  v7 = [v3 defaultLoadingImageTintColor];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v4, v7);

  v8 = objc_alloc_init(UIContentUnavailableTextProperties);
  v9 = [v3 defaultLoadingTextFontForTraitCollection:v2];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v8, v9);

  v10 = [v3 defaultLoadingTextColor];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v8, v10);

  v11 = objc_alloc_init(UIContentUnavailableTextProperties);
  v12 = [v3 defaultEmptySecondaryTextFontForTraitCollection:v2];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v11, v12);

  v13 = [v3 defaultSecondaryTextColor];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v13);

  v14 = objc_alloc_init(UIContentUnavailableButtonProperties);
  v15 = objc_alloc_init(UIContentUnavailableButtonProperties);
  char v16 = [v3 prefersSideBySideButtonAndSecondaryButton];
  [v3 defaultDirectionalLayoutMarginsForTraitCollection:v2];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [v3 defaultLoadingImageToTextPaddingForTraitCollection:v2];
  double v26 = v25;
  [v3 defaultEmptyTextToSecondaryTextPaddingForTraitCollection:v2];
  double v28 = v27;
  [v3 defaultEmptyTextToButtonPaddingForTraitCollection:v2];
  double v30 = v29;
  [v3 defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:v2];
  double v32 = -[UIContentUnavailableConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:buttonProperties:secondaryButtonProperties:sideBySideButtonAndSecondaryButton:directionalLayoutMargins:imageToTextPadding:textToSecondaryTextPadding:textToButtonPadding:buttonToSecondaryButtonPadding:]((id *)[UIContentUnavailableConfiguration alloc], v4, v8, v11, v14, v15, v16, v18, v20, v22, v24, v26, v28, v30, v31);
  if (![v2 userInterfaceIdiom] || objc_msgSend(v2, "userInterfaceIdiom") == 1)
  {
    v33 = _UILocalizedString(@"CONTENT_UNAVAILABLE_LOADING_TEXT", @"Default text to display whilst loading content", @"Loading...");
    v34 = [v32 textProperties];
    v36 = v34;
    if (v34) {
      objc_setProperty_nonatomic_copy(v34, v35, v33, 16);
    }
  }
  if (v32) {
    v32[7] = (id)1;
  }

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(UIContentUnavailableImageProperties *)self->_imageProperties copy];
    v6 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v5;

    uint64_t v7 = [(UIContentUnavailableTextProperties *)self->_textProperties copy];
    v8 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v7;

    uint64_t v9 = [(UIContentUnavailableTextProperties *)self->_secondaryTextProperties copy];
    v10 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v9;

    uint64_t v11 = [(UIContentUnavailableButtonProperties *)self->_buttonProperties copy];
    v12 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v11;

    uint64_t v13 = [(UIContentUnavailableButtonProperties *)self->_secondaryButtonProperties copy];
    v14 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v13;

    *(unsigned char *)(v4 + 12) = self->_prefersSideBySideButtonAndSecondaryButton;
    *(void *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    long long v15 = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 112) = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 128) = v15;
    *(double *)(v4 + 24) = self->_imageToTextPadding;
    *(double *)(v4 + 32) = self->_textToSecondaryTextPadding;
    *(double *)(v4 + 40) = self->_textToButtonPadding;
    *(double *)(v4 + 48) = self->_buttonToSecondaryButtonPadding;
    uint64_t v16 = [(UIBackgroundConfiguration *)self->_background copy];
    double v17 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v16;

    *(void *)(v4 + 56) = self->_defaultStyle;
    *($4E4CD6226BC3E2B796C6AE785477D738 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (id)_initWithImageProperties:(void *)a3 textProperties:(void *)a4 secondaryTextProperties:(void *)a5 buttonProperties:(void *)a6 secondaryButtonProperties:(char)a7 sideBySideButtonAndSecondaryButton:(double)a8 directionalLayoutMargins:(double)a9 imageToTextPadding:(double)a10 textToSecondaryTextPadding:(double)a11 textToButtonPadding:(double)a12 buttonToSecondaryButtonPadding:(double)a13
{
  id v38 = a2;
  id v29 = a3;
  id v30 = a4;
  id v31 = a5;
  id v32 = a6;
  if (a1)
  {
    v39.receiver = a1;
    v39.super_class = (Class)UIContentUnavailableConfiguration;
    v33 = (id *)objc_msgSendSuper2(&v39, sel_init);
    a1 = v33;
    if (v33)
    {
      objc_storeStrong(v33 + 8, a2);
      objc_storeStrong(a1 + 9, a3);
      objc_storeStrong(a1 + 10, a4);
      objc_storeStrong(a1 + 11, a5);
      objc_storeStrong(a1 + 12, a6);
      *((unsigned char *)a1 + 12) = a7;
      a1[2] = (id)1;
      *((double *)a1 + 14) = a8;
      *((double *)a1 + 15) = a9;
      *((double *)a1 + 16) = a10;
      *((double *)a1 + 17) = a11;
      *((double *)a1 + 3) = a12;
      *((double *)a1 + 4) = a13;
      *((double *)a1 + 5) = a14;
      *((double *)a1 + 6) = a15;
      uint64_t v34 = +[UIBackgroundConfiguration clearConfiguration];
      id v35 = a1[13];
      a1[13] = (id)v34;
    }
  }

  return a1;
}

- (CGFloat)imageToTextPadding
{
  return self->_imageToTextPadding;
}

- (UIContentUnavailableAlignment)alignment
{
  textProperties = self->_textProperties;
  if (textProperties) {
    return textProperties->_alignment;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_secondaryButtonProperties, 0);
  objc_storeStrong((id *)&self->_buttonProperties, 0);
  objc_storeStrong((id *)&self->_secondaryTextProperties, 0);
  objc_storeStrong((id *)&self->_textProperties, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
}

+ (UIContentUnavailableConfiguration)loadingConfiguration
{
  v3 = +[UIContentUnavailableConfigurationState _readonlyContentUnavailableConfigurationState:]((uint64_t)UIContentUnavailableConfigurationState, 0);
  uint64_t v4 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v5 = +[UIContentUnavailableConfiguration _defaultLoadingConfigurationForState:traitCollection:]((uint64_t)a1, v4);

  return (UIContentUnavailableConfiguration *)v5;
}

- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1
{
  v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3 == (void **)a1)
    {
      a1 = 1;
    }
    else if (*(void **)(a1 + 56) == v3[7] {
           && -[UIContentUnavailableImageProperties _isEqualToPropertiesQuick:compareImage:](*(void *)(a1 + 64), v3[8], 1)&& -[UIContentUnavailableTextProperties _isEqualToPropertiesQuick:compareText:](*(void *)(a1 + 72), v4[9], 1)&& -[UIContentUnavailableTextProperties _isEqualToPropertiesQuick:compareText:](*(void *)(a1 + 80), v4[10], 1)&& -[UIContentUnavailableButtonProperties _isEqualToPropertiesQuick:](*(void *)(a1 + 88), v4[11])&& -[UIContentUnavailableButtonProperties _isEqualToPropertiesQuick:](*(void *)(a1 + 96), v4[12])&& *(unsigned __int8 *)(a1 + 12) == *((unsigned __int8 *)v4 + 12)&& *(void **)(a1 + 16) == v4[2]
    }
           && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 112), *((float64x2_t *)v4 + 7)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 128), *((float64x2_t *)v4 + 8)))), 0xFuLL))) & 1) != 0&& *(double *)(a1 + 24) == *((double *)v4 + 3)&& *(double *)(a1 + 32) == *((double *)v4 + 4)&& *(double *)(a1 + 40) == *((double *)v4 + 5)&& *(double *)(a1 + 48) == *((double *)v4 + 6))
    {
      a1 = -[UIBackgroundConfiguration _isEqualToConfigurationQuick:](*(void *)(a1 + 104), v4[13]);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)updatedConfigurationForState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIContentUnavailableConfiguration *)self copy];
  int64_t defaultStyle = self->_defaultStyle;
  id v7 = v4;
  uint64_t v8 = self;
  uint64_t v9 = +[UIContentUnavailableConfigurationState _readonlyContentUnavailableConfigurationState:]((uint64_t)UIContentUnavailableConfigurationState, v7);
  switch(defaultStyle)
  {
    case 2:
      v10 = [v7 traitCollection];
      uint64_t v11 = +[UIContentUnavailableConfiguration _defaultSearchConfigurationForState:traitCollection:](v8, v9, v10);
      goto LABEL_7;
    case 1:
      v10 = [v7 traitCollection];
      uint64_t v11 = +[UIContentUnavailableConfiguration _defaultLoadingConfigurationForState:traitCollection:](v8, v10);
      goto LABEL_7;
    case 0:
      v10 = [v7 traitCollection];
      uint64_t v11 = +[UIContentUnavailableConfiguration _defaultEmptyConfigurationForState:traitCollection:](v8, v10);
LABEL_7:
      uint64_t v12 = v11;
      goto LABEL_9;
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, @"UIContentUnavailableConfiguration.m", 226, @"Unknown style: %ld", defaultStyle);
  uint64_t v12 = 0;
LABEL_9:

  uint64_t v13 = [(id)v5 imageProperties];
  v14 = [(id)v12 imageProperties];
  -[UIContentUnavailableImageProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v13, v14);

  long long v15 = [(id)v5 textProperties];
  uint64_t v16 = [(id)v12 textProperties];
  -[UIContentUnavailableTextProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v15, v16);

  double v17 = [(id)v5 secondaryTextProperties];
  double v18 = [(id)v12 secondaryTextProperties];
  -[UIContentUnavailableTextProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v17, v18);

  double v19 = [(id)v5 buttonProperties];
  double v20 = [(id)v12 buttonProperties];
  -[UIContentUnavailableButtonProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v19, v20);

  double v21 = [(id)v5 secondaryButtonProperties];
  double v22 = [(id)v12 secondaryButtonProperties];
  -[UIContentUnavailableButtonProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v21, v22);

  char configurationFlags = (char)self->_configurationFlags;
  if (configurationFlags) {
    goto LABEL_13;
  }
  if (v12)
  {
    BOOL v24 = *(unsigned char *)(v12 + 12) != 0;
    if (!v5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  BOOL v24 = 0;
  if (v5)
  {
LABEL_12:
    *(unsigned char *)(v5 + 12) = v24;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_13:
  if ((configurationFlags & 2) != 0) {
    goto LABEL_17;
  }
  if (v12)
  {
    uint64_t v25 = *(void *)(v12 + 16);
    if (!v5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v25 = 0;
  if (v5)
  {
LABEL_16:
    *(void *)(v5 + 16) = v25;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_17:
  if ((configurationFlags & 4) != 0) {
    goto LABEL_21;
  }
  if (v12)
  {
    long long v26 = *(_OWORD *)(v12 + 112);
    long long v27 = *(_OWORD *)(v12 + 128);
    if (!v5) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  long long v26 = 0uLL;
  long long v27 = 0uLL;
  if (v5)
  {
LABEL_20:
    *(_OWORD *)(v5 + 112) = v26;
    *(_OWORD *)(v5 + 128) = v27;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_21:
  if ((configurationFlags & 8) != 0) {
    goto LABEL_25;
  }
  if (v12)
  {
    uint64_t v28 = *(void *)(v12 + 24);
    if (!v5) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  uint64_t v28 = 0;
  if (v5)
  {
LABEL_24:
    *(void *)(v5 + 24) = v28;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_25:
  if ((configurationFlags & 0x10) != 0) {
    goto LABEL_29;
  }
  if (v12)
  {
    uint64_t v29 = *(void *)(v12 + 32);
    if (!v5) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  uint64_t v29 = 0;
  if (v5)
  {
LABEL_28:
    *(void *)(v5 + 32) = v29;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_29:
  if ((configurationFlags & 0x20) != 0) {
    goto LABEL_33;
  }
  if (v12)
  {
    uint64_t v30 = *(void *)(v12 + 40);
    if (!v5) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  uint64_t v30 = 0;
  if (v5)
  {
LABEL_32:
    *(void *)(v5 + 40) = v30;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_33:
  if ((configurationFlags & 0x40) != 0) {
    goto LABEL_37;
  }
  if (v12)
  {
    uint64_t v31 = *(void *)(v12 + 48);
    if (!v5) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  uint64_t v31 = 0;
  if (v5) {
LABEL_36:
  }
    *(void *)(v5 + 48) = v31;
LABEL_37:

  return (id)v5;
}

- (UIContentUnavailableImageProperties)imageProperties
{
  return self->_imageProperties;
}

- (UIContentUnavailableTextProperties)textProperties
{
  return self->_textProperties;
}

- (UIContentUnavailableTextProperties)secondaryTextProperties
{
  return self->_secondaryTextProperties;
}

- (UIContentUnavailableButtonProperties)secondaryButtonProperties
{
  return self->_secondaryButtonProperties;
}

- (UIContentUnavailableButtonProperties)buttonProperties
{
  return self->_buttonProperties;
}

- (UIBackgroundConfiguration)background
{
  return self->_background;
}

- (NSDirectionalEdgeInsets)directionalLayoutMargins
{
  double top = self->_directionalLayoutMargins.top;
  double leading = self->_directionalLayoutMargins.leading;
  double bottom = self->_directionalLayoutMargins.bottom;
  double trailing = self->_directionalLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (UIAxis)axesPreservingSuperviewLayoutMargins
{
  return self->_axesPreservingSuperviewLayoutMargins;
}

- (id)makeContentView
{
  id v2 = [[UIContentUnavailableView alloc] initWithConfiguration:self];
  return v2;
}

- (void)setBackground:(UIBackgroundConfiguration *)background
{
}

- (void)setText:(NSString *)text
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIContentUnavailableConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = v6;
    if (self)
    {
      if (self->_defaultStyle == v6->_defaultStyle
        && -[UIContentUnavailableImageProperties _isEqualToProperties:compareImage:]((uint64_t)self->_imageProperties, v6->_imageProperties, 1)&& -[UIContentUnavailableTextProperties _isEqualToProperties:compareText:]((uint64_t)self->_textProperties, v7->_textProperties, 1)&& -[UIContentUnavailableTextProperties _isEqualToProperties:compareText:]((uint64_t)self->_secondaryTextProperties, v7->_secondaryTextProperties, 1)&& -[UIContentUnavailableButtonProperties _isEqualToProperties:]((uint64_t)self->_buttonProperties, v7->_buttonProperties)&& -[UIContentUnavailableButtonProperties _isEqualToProperties:]((uint64_t)self->_secondaryButtonProperties, v7->_secondaryButtonProperties)&& self->_prefersSideBySideButtonAndSecondaryButton == v7->_prefersSideBySideButtonAndSecondaryButton&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))), 0xFuLL))) & 1) != 0&& self->_imageToTextPadding == v7->_imageToTextPadding&& self->_textToSecondaryTextPadding == v7->_textToSecondaryTextPadding&& self->_textToButtonPadding == v7->_textToButtonPadding&& self->_buttonToSecondaryButtonPadding == v7->_buttonToSecondaryButtonPadding)
      {
        LOBYTE(self) = -[UIBackgroundConfiguration _isEqualToConfiguration:]((uint64_t)self->_background, v7->_background);
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

+ (UIContentUnavailableConfiguration)searchConfiguration
{
  v3 = +[UIContentUnavailableConfigurationState _readonlyContentUnavailableConfigurationState:]((uint64_t)UIContentUnavailableConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v5 = +[UIContentUnavailableConfiguration _defaultSearchConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIContentUnavailableConfiguration *)v5;
}

+ (void)_defaultSearchConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = +[UIContentUnavailableConfiguration _defaultEmptyConfigurationForState:traitCollection:](v6, v5);

  uint64_t v8 = +[UIImage systemImageNamed:@"magnifyingglass"];
  uint64_t v9 = [v7 imageProperties];
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v9, v8);

  v10 = [v4 searchText];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [v4 searchText];
    double v18 = _UILocalizedFormat(@"CONTENT_UNAVAILABLE_SEARCH_TEXT_WITH_QUERY", @"Default text to display when a search with a query returns no results", @"No Results for “%@”", v13, v14, v15, v16, v17, (uint64_t)v12);
    double v19 = [v7 textProperties];
    double v21 = v19;
    if (v19) {
      objc_setProperty_nonatomic_copy(v19, v20, v18, 16);
    }
  }
  else
  {
    uint64_t v12 = _UILocalizedString(@"CONTENT_UNAVAILABLE_SEARCH_TEXT", @"Default text to display when a search returns no results", @"No Results");
    double v22 = [v7 textProperties];
    double v18 = v22;
    if (v22) {
      objc_setProperty_nonatomic_copy(v22, v23, v12, 16);
    }
  }

  BOOL v24 = _UILocalizedString(@"CONTENT_UNAVAILABLE_SEARCH_SECONDARY_TEXT", @"Default secondary text to display when a search returns no results", @"Check the spelling or try a new search.");
  uint64_t v25 = [v7 secondaryTextProperties];
  long long v27 = v25;
  if (v25) {
    objc_setProperty_nonatomic_copy(v25, v26, v24, 16);
  }

  if (v7) {
    v7[7] = 2;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIContentUnavailableConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)UIContentUnavailableConfiguration;
  id v5 = [(UIContentUnavailableConfiguration *)&v41 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageProperties"];
    imageProperties = v5->_imageProperties;
    v5->_imageProperties = (UIContentUnavailableImageProperties *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textProperties"];
    textProperties = v5->_textProperties;
    v5->_textProperties = (UIContentUnavailableTextProperties *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryTextProperties"];
    secondaryTextProperties = v5->_secondaryTextProperties;
    v5->_secondaryTextProperties = (UIContentUnavailableTextProperties *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buttonProperties"];
    buttonProperties = v5->_buttonProperties;
    v5->_buttonProperties = (UIContentUnavailableButtonProperties *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryButtonProperties"];
    secondaryButtonProperties = v5->_secondaryButtonProperties;
    v5->_secondaryButtonProperties = (UIContentUnavailableButtonProperties *)v14;

    [v4 decodeDoubleForKey:@"prefersSideBySideButtonAndSecondaryButton"];
    v5->_prefersSideBySideButtonAndSecondaryButton = v16 != 0.0;
    v5->_axesPreservingSuperviewLayoutMargins = [v4 decodeIntegerForKey:@"axesPreservingSuperviewLayoutMargins"];
    [v4 decodeDirectionalEdgeInsetsForKey:@"directionalLayoutMargins"];
    v5->_directionalLayoutMargins.double top = v17;
    v5->_directionalLayoutMargins.double leading = v18;
    v5->_directionalLayoutMargins.double bottom = v19;
    v5->_directionalLayoutMargins.double trailing = v20;
    [v4 decodeDoubleForKey:@"imageToTextPadding"];
    v5->_imageToTextPadding = v21;
    [v4 decodeDoubleForKey:@"textToSecondaryTextPadding"];
    v5->_textToSecondaryTextPadding = v22;
    [v4 decodeDoubleForKey:@"textToButtonPadding"];
    v5->_textToButtonPadding = v23;
    [v4 decodeDoubleForKey:@"buttonToSecondaryButtonPadding"];
    v5->_buttonToSecondaryButtonPadding = v24;
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"background"];
    background = v5->_background;
    v5->_background = (UIBackgroundConfiguration *)v25;

    v5->_int64_t defaultStyle = [v4 decodeIntegerForKey:@"defaultStyle"];
    long long v27 = [NSString stringWithFormat:@"hasCustomized-%@", @"prefersSideBySideButtonAndSecondaryButton"];
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFE | [v4 decodeBoolForKey:v27];

    uint64_t v28 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
    if ([v4 decodeBoolForKey:v28]) {
      char v29 = 2;
    }
    else {
      char v29 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFD | v29;

    uint64_t v30 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
    if ([v4 decodeBoolForKey:v30]) {
      char v31 = 4;
    }
    else {
      char v31 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFB | v31;

    id v32 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageToTextPadding"];
    if ([v4 decodeBoolForKey:v32]) {
      char v33 = 8;
    }
    else {
      char v33 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xF7 | v33;

    uint64_t v34 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToSecondaryTextPadding"];
    if ([v4 decodeBoolForKey:v34]) {
      char v35 = 16;
    }
    else {
      char v35 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xEF | v35;

    v36 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToButtonPadding"];
    if ([v4 decodeBoolForKey:v36]) {
      char v37 = 32;
    }
    else {
      char v37 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xDF | v37;

    id v38 = [NSString stringWithFormat:@"hasCustomized-%@", @"buttonToSecondaryButtonPadding"];
    if ([v4 decodeBoolForKey:v38]) {
      char v39 = 64;
    }
    else {
      char v39 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xBF | v39;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  imageProperties = self->_imageProperties;
  id v5 = a3;
  [v5 encodeObject:imageProperties forKey:@"imageProperties"];
  [v5 encodeObject:self->_textProperties forKey:@"textProperties"];
  [v5 encodeObject:self->_secondaryTextProperties forKey:@"secondaryTextProperties"];
  [v5 encodeObject:self->_buttonProperties forKey:@"buttonProperties"];
  [v5 encodeObject:self->_secondaryButtonProperties forKey:@"secondaryButtonProperties"];
  double v6 = 0.0;
  if (self->_prefersSideBySideButtonAndSecondaryButton) {
    double v6 = 1.0;
  }
  [v5 encodeDouble:@"prefersSideBySideButtonAndSecondaryButton" forKey:v6];
  [v5 encodeInteger:self->_axesPreservingSuperviewLayoutMargins forKey:@"axesPreservingSuperviewLayoutMargins"];
  objc_msgSend(v5, "encodeDirectionalEdgeInsets:forKey:", @"directionalLayoutMargins", self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  [v5 encodeDouble:@"imageToTextPadding" forKey:self->_imageToTextPadding];
  [v5 encodeDouble:@"textToSecondaryTextPadding" forKey:self->_textToSecondaryTextPadding];
  [v5 encodeDouble:@"textToButtonPadding" forKey:self->_textToButtonPadding];
  [v5 encodeDouble:@"buttonToSecondaryButtonPadding" forKey:self->_buttonToSecondaryButtonPadding];
  [v5 encodeObject:self->_background forKey:@"background"];
  [v5 encodeInteger:self->_defaultStyle forKey:@"defaultStyle"];
  uint64_t v7 = *(unsigned char *)&self->_configurationFlags & 1;
  uint64_t v8 = [NSString stringWithFormat:@"hasCustomized-%@", @"prefersSideBySideButtonAndSecondaryButton"];
  [v5 encodeBool:v7 forKey:v8];

  uint64_t v9 = (*(unsigned char *)&self->_configurationFlags >> 1) & 1;
  uint64_t v10 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
  [v5 encodeBool:v9 forKey:v10];

  uint64_t v11 = (*(unsigned char *)&self->_configurationFlags >> 2) & 1;
  uint64_t v12 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
  [v5 encodeBool:v11 forKey:v12];

  uint64_t v13 = (*(unsigned char *)&self->_configurationFlags >> 3) & 1;
  uint64_t v14 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageToTextPadding"];
  [v5 encodeBool:v13 forKey:v14];

  uint64_t v15 = (*(unsigned char *)&self->_configurationFlags >> 4) & 1;
  double v16 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToSecondaryTextPadding"];
  [v5 encodeBool:v15 forKey:v16];

  uint64_t v17 = (*(unsigned char *)&self->_configurationFlags >> 5) & 1;
  CGFloat v18 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToButtonPadding"];
  [v5 encodeBool:v17 forKey:v18];

  uint64_t v19 = (*(unsigned char *)&self->_configurationFlags >> 6) & 1;
  id v20 = [NSString stringWithFormat:@"hasCustomized-%@", @"buttonToSecondaryButtonPadding"];
  [v5 encodeBool:v19 forKey:v20];
}

- (unint64_t)hash
{
  unint64_t v3 = [(UIContentUnavailableImageProperties *)self->_imageProperties hash];
  unint64_t v4 = [(UIContentUnavailableTextProperties *)self->_textProperties hash] ^ v3;
  return v4 ^ [(UIContentUnavailableTextProperties *)self->_secondaryTextProperties hash];
}

- (NSString)description
{
  if (self)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    imageProperties = (__CFString *)self->_imageProperties;
    if (imageProperties && imageProperties->data)
    {
      id v5 = NSString;
      double v6 = -[UIContentUnavailableImageProperties _shortDescription](imageProperties);
      uint64_t v7 = [v5 stringWithFormat:@"image = %@", v6];
      [v3 addObject:v7];
    }
    textProperties = (__CFString *)self->_textProperties;
    if (textProperties && (textProperties->data || textProperties[1].data))
    {
      uint64_t v9 = NSString;
      uint64_t v10 = -[UIContentUnavailableTextProperties _shortDescription](textProperties);
      uint64_t v11 = [v9 stringWithFormat:@"text = %@", v10];
      [v3 addObject:v11];
    }
    secondaryTextProperties = (__CFString *)self->_secondaryTextProperties;
    if (secondaryTextProperties && (secondaryTextProperties->data || secondaryTextProperties[1].data))
    {
      uint64_t v13 = NSString;
      uint64_t v14 = -[UIContentUnavailableTextProperties _shortDescription](secondaryTextProperties);
      uint64_t v15 = [v13 stringWithFormat:@"secondaryText = %@", v14];
      [v3 addObject:v15];
    }
    buttonProperties = (__CFString *)self->_buttonProperties;
    if (buttonProperties)
    {
      uint64_t v17 = NSString;
      CGFloat v18 = -[UIContentUnavailableButtonProperties _shortDescription](buttonProperties);
      uint64_t v19 = [v17 stringWithFormat:@"buttonProperties = %@", v18];
      [v3 addObject:v19];
    }
    secondaryButtonProperties = (__CFString *)self->_secondaryButtonProperties;
    if (secondaryButtonProperties)
    {
      double v21 = NSString;
      double v22 = -[UIContentUnavailableButtonProperties _shortDescription](secondaryButtonProperties);
      double v23 = [v21 stringWithFormat:@"secondaryButtonProperties = %@", v22];
      [v3 addObject:v23];
    }
    double v24 = NSString;
    unint64_t defaultStyle = self->_defaultStyle;
    if (defaultStyle >= 3)
    {
      long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v28 = [NSString stringWithUTF8String:"NSString *_UIContentUnavailableConfigurationStyleToString(_UIContentUnavailableConfigurationStyle)"];
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"UIContentUnavailableConfiguration.m", 35, @"Unknown style: %ld", defaultStyle);

      long long v26 = 0;
    }
    else
    {
      long long v26 = off_1E5300F80[defaultStyle];
    }
    char v29 = [v24 stringWithFormat:@"Base Style = %@", v26];
    [v3 addObject:v29];

    uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"prefersSideBySideButtonAndSecondaryButton = %d", self->_prefersSideBySideButtonAndSecondaryButton);
    [v3 addObject:v30];

    unint64_t axesPreservingSuperviewLayoutMargins = self->_axesPreservingSuperviewLayoutMargins;
    if (axesPreservingSuperviewLayoutMargins)
    {
      id v32 = NSString;
      char v33 = _UIContentViewStringForAxis(axesPreservingSuperviewLayoutMargins);
      uint64_t v34 = [v32 stringWithFormat:@"axesPreservingSuperviewLayoutMargins = %@", v33];
      [v3 addObject:v34];
    }
    CGFloat top = self->_directionalLayoutMargins.top;
    double leading = self->_directionalLayoutMargins.leading;
    double bottom = self->_directionalLayoutMargins.bottom;
    double trailing = self->_directionalLayoutMargins.trailing;
    if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
    {
      char v39 = NSString;
      v40 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
      objc_super v41 = [v39 stringWithFormat:@"directionalLayoutMargins = %@", v40];
      [v3 addObject:v41];
    }
    v42 = objc_msgSend(NSString, "stringWithFormat:", @"imageToTextPadding = %g", *(void *)&self->_imageToTextPadding);
    [v3 addObject:v42];

    v43 = objc_msgSend(NSString, "stringWithFormat:", @"textToSecondaryTextPadding = %g", *(void *)&self->_textToSecondaryTextPadding);
    [v3 addObject:v43];

    v44 = objc_msgSend(NSString, "stringWithFormat:", @"textToButtonPadding = %g", *(void *)&self->_textToButtonPadding);
    [v3 addObject:v44];

    v45 = objc_msgSend(NSString, "stringWithFormat:", @"buttonToSecondaryButtonPadding = %g", *(void *)&self->_buttonToSecondaryButtonPadding);
    [v3 addObject:v45];

    v46 = [NSString stringWithFormat:@"background = %@", self->_background];
    [v3 addObject:v46];

    if (![v3 count]) {
      [v3 addObject:@"(empty)"];
    }
  }
  else
  {
    id v3 = 0;
  }
  v47 = NSString;
  v48 = (objc_class *)objc_opt_class();
  v49 = NSStringFromClass(v48);
  v50 = [v3 componentsJoinedByString:@"; "];
  v51 = [v47 stringWithFormat:@"<%@: %p; %@>", v49, self, v50];

  return (NSString *)v51;
}

- (void)_setSwiftBridgingImageProperties:(id)a3
{
  unint64_t v4 = (UIContentUnavailableImageProperties *)a3;
  imageProperties = self->_imageProperties;
  if (imageProperties) {
    imageProperties = (UIContentUnavailableImageProperties *)imageProperties->_image;
  }
  double v6 = imageProperties;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v4, v6);

  uint64_t v7 = self->_imageProperties;
  self->_imageProperties = v4;
}

- (void)_setSwiftBridgingTextProperties:(id)a3
{
  unint64_t v4 = (UIContentUnavailableTextProperties *)a3;
  textProperties = self->_textProperties;
  if (textProperties) {
    textProperties = (UIContentUnavailableTextProperties *)textProperties->_text;
  }
  uint64_t v7 = textProperties;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v6, v7, 16);
  }

  uint64_t v8 = self->_textProperties;
  if (v8) {
    uint64_t v8 = (UIContentUnavailableTextProperties *)v8->_attributedText;
  }
  uint64_t v10 = v8;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v9, v10, 48);
  }

  uint64_t v11 = self->_textProperties;
  self->_textProperties = v4;
}

- (void)_setSwiftBridgingSecondaryTextProperties:(id)a3
{
  unint64_t v4 = (UIContentUnavailableTextProperties *)a3;
  secondaryTextProperties = self->_secondaryTextProperties;
  if (secondaryTextProperties) {
    secondaryTextProperties = (UIContentUnavailableTextProperties *)secondaryTextProperties->_text;
  }
  uint64_t v7 = secondaryTextProperties;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v6, v7, 16);
  }

  uint64_t v8 = self->_secondaryTextProperties;
  if (v8) {
    uint64_t v8 = (UIContentUnavailableTextProperties *)v8->_attributedText;
  }
  uint64_t v10 = v8;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v9, v10, 48);
  }

  uint64_t v11 = self->_secondaryTextProperties;
  self->_secondaryTextProperties = v4;
}

- (void)_setSwiftBridgingButtonProperties:(id)a3
{
  unint64_t v4 = (UIContentUnavailableButtonProperties *)a3;
  buttonProperties = self->_buttonProperties;
  if (buttonProperties) {
    buttonProperties = (UIContentUnavailableButtonProperties *)buttonProperties->_configuration;
  }
  double v6 = buttonProperties;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v4, v6);

  uint64_t v7 = self->_buttonProperties;
  self->_buttonProperties = v4;
}

- (void)_setSwiftBridgingSecondaryButtonProperties:(id)a3
{
  unint64_t v4 = (UIContentUnavailableButtonProperties *)a3;
  secondaryButtonProperties = self->_secondaryButtonProperties;
  if (secondaryButtonProperties) {
    secondaryButtonProperties = (UIContentUnavailableButtonProperties *)secondaryButtonProperties->_configuration;
  }
  double v6 = secondaryButtonProperties;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v4, v6);

  uint64_t v7 = self->_secondaryButtonProperties;
  self->_secondaryButtonProperties = v4;
}

- (void)setImage:(UIImage *)image
{
}

- (UIImage)image
{
  return (UIImage *)-[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_imageProperties->super.isa);
}

- (NSString)text
{
  return -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_textProperties->super.isa);
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)-[UIContentUnavailableTextProperties attributedText]((id *)&self->_textProperties->super.isa);
}

- (void)setSecondaryText:(NSString *)secondaryText
{
}

- (NSString)secondaryText
{
  return -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_secondaryTextProperties->super.isa);
}

- (void)setSecondaryAttributedText:(NSAttributedString *)secondaryAttributedText
{
}

- (NSAttributedString)secondaryAttributedText
{
  return (NSAttributedString *)-[UIContentUnavailableTextProperties attributedText]((id *)&self->_secondaryTextProperties->super.isa);
}

- (void)setButton:(UIButtonConfiguration *)button
{
}

- (UIButtonConfiguration)button
{
  return [(UIContentUnavailableButtonProperties *)self->_buttonProperties configuration];
}

- (void)setSecondaryButton:(UIButtonConfiguration *)secondaryButton
{
}

- (UIButtonConfiguration)secondaryButton
{
  return [(UIContentUnavailableButtonProperties *)self->_secondaryButtonProperties configuration];
}

- (void)setAxesPreservingSuperviewLayoutMargins:(UIAxis)axesPreservingSuperviewLayoutMargins
{
  *(unsigned char *)&self->_configurationFlags |= 2u;
  self->_unint64_t axesPreservingSuperviewLayoutMargins = axesPreservingSuperviewLayoutMargins;
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)directionalLayoutMargins
{
  *(unsigned char *)&self->_configurationFlags |= 4u;
  self->_directionalLayoutMargins = directionalLayoutMargins;
}

- (void)setAlignment:(UIContentUnavailableAlignment)alignment
{
  textProperties = self->_textProperties;
  if (textProperties) {
    textProperties->_alignment = alignment;
  }
  secondaryTextProperties = self->_secondaryTextProperties;
  if (secondaryTextProperties) {
    secondaryTextProperties->_alignment = alignment;
  }
}

- (void)setImageToTextPadding:(CGFloat)imageToTextPadding
{
  *(unsigned char *)&self->_configurationFlags |= 8u;
  self->_imageToTextPadding = imageToTextPadding;
}

- (void)setTextToSecondaryTextPadding:(CGFloat)textToSecondaryTextPadding
{
  *(unsigned char *)&self->_configurationFlags |= 0x10u;
  self->_textToSecondaryTextPadding = textToSecondaryTextPadding;
}

- (CGFloat)textToSecondaryTextPadding
{
  return self->_textToSecondaryTextPadding;
}

- (void)setTextToButtonPadding:(CGFloat)textToButtonPadding
{
  *(unsigned char *)&self->_configurationFlags |= 0x20u;
  self->_textToButtonPadding = textToButtonPadding;
}

- (CGFloat)textToButtonPadding
{
  return self->_textToButtonPadding;
}

- (void)setButtonToSecondaryButtonPadding:(CGFloat)buttonToSecondaryButtonPadding
{
  *(unsigned char *)&self->_configurationFlags |= 0x40u;
  self->_buttonToSecondaryButtonPadding = buttonToSecondaryButtonPadding;
}

- (CGFloat)buttonToSecondaryButtonPadding
{
  return self->_buttonToSecondaryButtonPadding;
}

@end