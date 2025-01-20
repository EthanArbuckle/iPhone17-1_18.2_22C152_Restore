@interface _UISubtitleCellContentViewConfiguration
+ (BOOL)supportsSecureCoding;
+ (_UISubtitleCellContentViewConfiguration)defaultListCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)defaultConfiguration;
+ (id)defaultListCellConfigurationForState:(unint64_t)a3;
+ (id)defaultOutlineCellConfigurationForState:(unint64_t)a3;
+ (id)defaultOutlineCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)listCellConfiguration;
+ (id)outlineCellConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSDirectionalEdgeInsets)directionalLayoutMargins;
- (NSString)description;
- (_UIContentViewEditingConfiguration)_textLabelEditingConfiguration;
- (_UIContentViewImageViewConfiguration)imageView;
- (_UIContentViewLabelConfiguration)subtitleLabel;
- (_UIContentViewLabelConfiguration)textLabel;
- (_UISubtitleCellContentViewConfiguration)initWithCoder:(id)a3;
- (double)imageToTextPadding;
- (double)textToSubtitlePadding;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createContentView;
- (id)updatedConfigurationForState:(unint64_t)a3;
- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4;
- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1;
- (unint64_t)axesPreservingSuperviewLayoutMargins;
- (unint64_t)hash;
- (void)applyToContentView:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAxesPreservingSuperviewLayoutMargins:(unint64_t)a3;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setImageToTextPadding:(double)a3;
- (void)setTextToSubtitlePadding:(double)a3;
- (void)set_textLabelEditingConfiguration:(id)a3;
@end

@implementation _UISubtitleCellContentViewConfiguration

+ (id)listCellConfiguration
{
  return (id)[a1 defaultListCellConfigurationForState:0];
}

+ (id)outlineCellConfiguration
{
  return (id)[a1 defaultOutlineCellConfigurationForState:0];
}

+ (id)defaultListCellConfigurationForState:(unint64_t)a3
{
  v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UISubtitleCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (_UISubtitleCellContentViewConfiguration)defaultListCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  self;
  v5 = _UITableConstantsForTraitCollection(v4);
  v6 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  v7 = objc_alloc_init(_UIContentViewImageViewConfiguration);
  v9 = [v5 defaultImageSymbolConfigurationForTraitCollection:v4];
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v8, v9, 24);
  }

  v10 = [v5 defaultImageTintColorForState:v6 traitCollection:v4];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v7, v10);

  v11 = objc_alloc_init(_UIContentViewLabelConfiguration);
  v12 = [v5 defaultTextLabelFontForCellStyle:3];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v11, v12);

  v13 = [v5 defaultTextColorForCellStyle:3 traitCollection:v4 tintColor:0 state:v6];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v13);

  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v5, v4, 0);
  v14 = objc_alloc_init(_UIContentViewLabelConfiguration);
  v15 = [v5 defaultDetailTextFontForCellStyle:3];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v14, v15);

  v16 = [v5 defaultDetailTextColorForCellStyle:3 traitCollection:v4 state:v6];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v14, v16);

  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v5, v4, 0);
  double v17 = _UICellContentViewDefaultDirectionalLayoutMargins(v5, v4, 3, 0, 0);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  [v5 defaultImageToTextPaddingForSidebar:0];
  double v25 = v24;
  [v5 defaultTextToSubtitlePaddingForCellStyle:3];
  double v27 = v26;
  v28 = [_UISubtitleCellContentViewConfiguration alloc];
  v29 = v7;
  v30 = v11;
  v31 = v14;
  if (v28)
  {
    v34.receiver = v28;
    v34.super_class = (Class)_UISubtitleCellContentViewConfiguration;
    v32 = (_UISubtitleCellContentViewConfiguration *)objc_msgSendSuper2(&v34, sel_init);
    v28 = v32;
    if (v32)
    {
      objc_storeStrong((id *)&v32->_imageView, v7);
      objc_storeStrong((id *)&v28->_textLabel, v11);
      objc_storeStrong((id *)&v28->_subtitleLabel, v14);
      v28->_axesPreservingSuperviewLayoutMargins = 1;
      v28->_directionalLayoutMargins.top = v17;
      v28->_directionalLayoutMargins.leading = v19;
      v28->_directionalLayoutMargins.bottom = v21;
      v28->_directionalLayoutMargins.trailing = v23;
      v28->_imageToTextPadding = v25;
      v28->_textToSubtitlePadding = v27;
    }
  }

  if (v28) {
    v28->_defaultStyle = 0;
  }

  return v28;
}

+ (id)defaultOutlineCellConfigurationForState:(unint64_t)a3
{
  v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UISubtitleCellContentViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (id)defaultOutlineCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = +[_UISubtitleCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v5, a2, v4);
  v7 = _UITableConstantsForTraitCollection(v4);
  if ([v4 _splitViewControllerContext] == 2) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  v9 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  [v7 defaultImageToTextPaddingForSidebar:1];
  if (v6)
  {
    *(void *)(v6 + 24) = v10;
    *(double *)(v6 + 80) = _UICellContentViewDefaultDirectionalLayoutMargins(v7, v4, 3, 1, 0);
    *(void *)(v6 + 88) = v11;
    *(void *)(v6 + 96) = v12;
    *(void *)(v6 + 104) = v13;
  }
  else
  {
    _UICellContentViewDefaultDirectionalLayoutMargins(v7, v4, 3, 1, 0);
  }
  v14 = [(id)v6 textLabel];
  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v7, v4, 1);

  v15 = [(id)v6 subtitleLabel];
  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v15, v7, v4, 1);

  v16 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
  double v17 = [(id)v6 subtitleLabel];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v17, v16);

  double v18 = [v7 defaultSidebarTextColorForTraitCollection:v4 state:v9 isHeader:0 isSecondaryText:0 style:v8];
  CGFloat v19 = [(id)v6 textLabel];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v19, v18);

  double v20 = [v7 defaultSidebarTextColorForTraitCollection:v4 state:v9 isHeader:0 isSecondaryText:1 style:v8];
  CGFloat v21 = [(id)v6 subtitleLabel];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v21, v20);

  double v22 = [v7 defaultSidebarImageTintColorForTraitCollection:v4 state:v9 isHeader:0 style:v8];
  CGFloat v23 = [(id)v6 imageView];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v23, v22);

  if ([v9 isHighlighted])
  {
    uint64_t v24 = [(id)v6 textLabel];
    double v25 = (void *)v24;
    if (v24) {
      double v26 = *(void **)(v24 + 32);
    }
    else {
      double v26 = 0;
    }
    id v27 = v26;
    v28 = _UIConfigurationCompatibilityColorForHighlightedState(v27);

    v29 = [(id)v6 imageView];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v29, v28);

    v30 = [(id)v6 textLabel];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v30, v28);

    uint64_t v31 = [(id)v6 subtitleLabel];
    v32 = (void *)v31;
    if (v31) {
      v33 = *(void **)(v31 + 32);
    }
    else {
      v33 = 0;
    }
    id v34 = v33;
    v35 = _UIConfigurationCompatibilityColorForHighlightedState(v34);
    v36 = [(id)v6 subtitleLabel];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v36, v35);
  }
  if (v6) {
    *(void *)(v6 + 48) = 1;
  }

  return (id)v6;
}

+ (id)defaultConfiguration
{
  v2 = [a1 defaultListCellConfigurationForState:0];
  v3 = +[UITraitCollection _fallbackTraitCollection]();
  id v4 = _UITableConstantsForTraitCollection(v3);
  uint64_t v5 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 5);
  uint64_t v6 = [v4 defaultTextColorForCellStyle:3 traitCollection:v3 tintColor:0 state:v5];
  v7 = [v2 textLabel];
  [v7 setHighlightedTextColor:v6];

  return v2;
}

- (id)updatedConfigurationForState:(unint64_t)a3
{
  return [(_UISubtitleCellContentViewConfiguration *)self updatedConfigurationForState:a3 traitCollection:0];
}

- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_UISubtitleCellContentViewConfiguration *)self copy];
  int64_t defaultStyle = self->_defaultStyle;
  id v9 = v6;
  uint64_t v10 = self;
  uint64_t v11 = v9;
  if (!v9)
  {
    uint64_t v11 = +[UITraitCollection _fallbackTraitCollection]();
  }
  if (defaultStyle == 1)
  {
    uint64_t v12 = +[_UISubtitleCellContentViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:](v10, a3, v11);
    goto LABEL_7;
  }
  if (!defaultStyle)
  {
    uint64_t v12 = +[_UISubtitleCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v10, a3, v11);
LABEL_7:
    uint64_t v13 = v12;
    goto LABEL_9;
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_traitCollection_, v10, @"_UISubtitleCellContentView.m", 174, @"Unknown style: %ld", defaultStyle);

  uint64_t v13 = 0;
LABEL_9:

  v15 = [(id)v7 imageView];
  v16 = [(id)v13 imageView];
  -[_UIContentViewImageViewConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v15, v16);

  double v17 = [(id)v7 textLabel];
  double v18 = [(id)v13 textLabel];
  -[_UIContentViewLabelConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v17, v18);

  CGFloat v19 = [(id)v7 subtitleLabel];
  double v20 = [(id)v13 subtitleLabel];
  -[_UIContentViewLabelConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v19, v20);

  char configurationFlags = (char)self->_configurationFlags;
  if (configurationFlags) {
    goto LABEL_13;
  }
  if (v13)
  {
    uint64_t v22 = *(void *)(v13 + 16);
    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v22 = 0;
  if (v7)
  {
LABEL_12:
    *(void *)(v7 + 16) = v22;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_13:
  if ((configurationFlags & 2) != 0) {
    goto LABEL_17;
  }
  if (v13)
  {
    long long v23 = *(_OWORD *)(v13 + 80);
    long long v24 = *(_OWORD *)(v13 + 96);
    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  long long v23 = 0uLL;
  long long v24 = 0uLL;
  if (v7)
  {
LABEL_16:
    *(_OWORD *)(v7 + 80) = v23;
    *(_OWORD *)(v7 + 96) = v24;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_17:
  if ((configurationFlags & 4) != 0) {
    goto LABEL_21;
  }
  if (v13)
  {
    uint64_t v25 = *(void *)(v13 + 24);
    if (!v7) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v25 = 0;
  if (v7)
  {
LABEL_20:
    *(void *)(v7 + 24) = v25;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_21:
  if ((configurationFlags & 8) != 0) {
    goto LABEL_25;
  }
  if (v13)
  {
    uint64_t v26 = *(void *)(v13 + 32);
    if (!v7) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  uint64_t v26 = 0;
  if (v7) {
LABEL_24:
  }
    *(void *)(v7 + 32) = v26;
LABEL_25:

  return (id)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISubtitleCellContentViewConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_UISubtitleCellContentViewConfiguration;
  uint64_t v5 = [(_UISubtitleCellContentViewConfiguration *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageView"];
    imageView = v5->_imageView;
    v5->_imageView = (_UIContentViewImageViewConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textLabel"];
    textLabel = v5->_textLabel;
    v5->_textLabel = (_UIContentViewLabelConfiguration *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitleLabel"];
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = (_UIContentViewLabelConfiguration *)v10;

    v5->_axesPreservingSuperviewLayoutMargins = [v4 decodeIntegerForKey:@"axesPreservingSuperviewLayoutMargins"];
    [v4 decodeDirectionalEdgeInsetsForKey:@"directionalLayoutMargins"];
    v5->_directionalLayoutMargins.top = v12;
    v5->_directionalLayoutMargins.leading = v13;
    v5->_directionalLayoutMargins.bottom = v14;
    v5->_directionalLayoutMargins.trailing = v15;
    [v4 decodeDoubleForKey:@"imageToTextPadding"];
    v5->_imageToTextPadding = v16;
    [v4 decodeDoubleForKey:@"textToSubtitlePadding"];
    v5->_textToSubtitlePadding = v17;
    v5->_int64_t defaultStyle = [v4 decodeIntegerForKey:@"defaultStyle"];
    double v18 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFE | [v4 decodeBoolForKey:v18];

    CGFloat v19 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
    if ([v4 decodeBoolForKey:v19]) {
      char v20 = 2;
    }
    else {
      char v20 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFD | v20;

    CGFloat v21 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageToTextPadding"];
    if ([v4 decodeBoolForKey:v21]) {
      char v22 = 4;
    }
    else {
      char v22 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFB | v22;

    long long v23 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToSubtitlePadding"];
    if ([v4 decodeBoolForKey:v23]) {
      char v24 = 8;
    }
    else {
      char v24 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xF7 | v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [v5 encodeObject:imageView forKey:@"imageView"];
  [v5 encodeObject:self->_textLabel forKey:@"textLabel"];
  [v5 encodeObject:self->_subtitleLabel forKey:@"subtitleLabel"];
  [v5 encodeInteger:self->_axesPreservingSuperviewLayoutMargins forKey:@"axesPreservingSuperviewLayoutMargins"];
  objc_msgSend(v5, "encodeDirectionalEdgeInsets:forKey:", @"directionalLayoutMargins", self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  [v5 encodeDouble:@"imageToTextPadding" forKey:self->_imageToTextPadding];
  [v5 encodeDouble:@"textToSubtitlePadding" forKey:self->_textToSubtitlePadding];
  [v5 encodeInteger:self->_defaultStyle forKey:@"defaultStyle"];
  uint64_t v6 = *(unsigned char *)&self->_configurationFlags & 1;
  uint64_t v7 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
  [v5 encodeBool:v6 forKey:v7];

  uint64_t v8 = (*(unsigned char *)&self->_configurationFlags >> 1) & 1;
  id v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
  [v5 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(unsigned char *)&self->_configurationFlags >> 2) & 1;
  uint64_t v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageToTextPadding"];
  [v5 encodeBool:v10 forKey:v11];

  uint64_t v12 = (*(unsigned char *)&self->_configurationFlags >> 3) & 1;
  id v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToSubtitlePadding"];
  [v5 encodeBool:v12 forKey:v13];
}

- (id)createContentView
{
  v2 = [[_UISubtitleCellContentView alloc] initWithConfiguration:self];
  return v2;
}

- (void)applyToContentView:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"_UISubtitleCellContentView.m", 283, @"Unable to apply %@ to content view %@", self, v6 object file lineNumber description];
  }
  [v6 setConfiguration:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(_UIContentViewImageViewConfiguration *)self->_imageView copy];
    id v6 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v5;

    uint64_t v7 = [(_UIContentViewLabelConfiguration *)self->_textLabel copy];
    uint64_t v8 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v7;

    uint64_t v9 = [(_UIContentViewLabelConfiguration *)self->_subtitleLabel copy];
    uint64_t v10 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v9;

    *(void *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    long long v11 = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 80) = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 96) = v11;
    *(double *)(v4 + 24) = self->_imageToTextPadding;
    *(double *)(v4 + 32) = self->_textToSubtitlePadding;
    uint64_t v12 = [(_UIContentViewEditingConfiguration *)self->_textLabelEditingConfiguration copy];
    id v13 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v12;

    *(void *)(v4 + 48) = self->_defaultStyle;
    *($BF8D45CD21A2295E3DCCAFF3B37A82F5 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UISubtitleCellContentViewConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    uint64_t v7 = v6;
    if (self)
    {
      if (self->_defaultStyle == v6->_defaultStyle
        && -[_UIContentViewImageViewConfiguration _isEqualToConfiguration:]((uint64_t)self->_imageView, v6->_imageView)
        && -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self->_textLabel, v7->_textLabel)&& -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self->_subtitleLabel, v7->_subtitleLabel)&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))), 0xFuLL))) & 1) != 0&& self->_imageToTextPadding == v7->_imageToTextPadding&& self->_textToSubtitlePadding == v7->_textToSubtitlePadding)
      {
        textLabelEditingConfiguration = self->_textLabelEditingConfiguration;
        uint64_t v10 = v7->_textLabelEditingConfiguration;
        long long v11 = textLabelEditingConfiguration;
        uint64_t v12 = v10;
        id v13 = v12;
        if (v11 == (_UIContentViewEditingConfiguration *)v12)
        {
          LOBYTE(self) = 1;
        }
        else
        {
          LOBYTE(self) = 0;
          if (v11 && v12)
          {
            self = v12;
            BOOL v14 = [(_UIContentViewEditingConfiguration *)v11 isEqual:v12];
            id v13 = self;
            LOBYTE(self) = v14;
          }
        }
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
    else if (*(void **)(a1 + 48) == v3[6] {
           && -[_UIContentViewImageViewConfiguration _isEqualToConfigurationQuick:](*(void *)(a1 + 56), v3[7])
    }
           && -[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](*(void *)(a1 + 64), v4[8])&& -[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](*(void *)(a1 + 72), v4[9])&& *(void **)(a1 + 16) == v4[2]&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 80), *((float64x2_t *)v4 + 5)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 96), *((float64x2_t *)v4 + 6)))), 0xFuLL))) & 1) != 0&& *(double *)(a1 + 24) == *((double *)v4 + 3)&& *(double *)(a1 + 32) == *((double *)v4 + 4))
    {
      a1 = UIEqual(*(void **)(a1 + 40), v4[5]);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_UIContentViewImageViewConfiguration *)self->_imageView hash];
  unint64_t v4 = [(_UIContentViewLabelConfiguration *)self->_textLabel hash] ^ v3;
  return v4 ^ [(_UIContentViewLabelConfiguration *)self->_subtitleLabel hash];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = NSString;
  int64_t defaultStyle = self->_defaultStyle;
  if (defaultStyle)
  {
    if (defaultStyle == 1)
    {
      id v6 = @"Outline";
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"NSString *_UISubtitleCellContentViewConfigurationStyleToString(_UISubtitleCellContentViewConfigurationStyle)"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"_UISubtitleCellContentView.m", 31, @"Unknown style: %ld", defaultStyle);

      id v6 = 0;
    }
  }
  else
  {
    id v6 = @"List";
  }
  uint64_t v9 = [v4 stringWithFormat:@"Base Style = %@", v6];
  [v3 addObject:v9];

  imageView = (__CFString *)self->_imageView;
  if (imageView && (imageView->data || imageView[1].data))
  {
    long long v11 = NSString;
    uint64_t v12 = -[_UIContentViewImageViewConfiguration _shortDescription](imageView);
    id v13 = [v11 stringWithFormat:@"imageView = %@", v12];
    [v3 addObject:v13];
  }
  textLabel = (__CFString *)self->_textLabel;
  if (textLabel && (textLabel->data || textLabel[1].length))
  {
    CGFloat v15 = NSString;
    double v16 = -[_UIContentViewLabelConfiguration _shortDescription](textLabel);
    double v17 = [v15 stringWithFormat:@"textLabel = %@", v16];
    [v3 addObject:v17];
  }
  subtitleLabel = (__CFString *)self->_subtitleLabel;
  if (subtitleLabel && (subtitleLabel->data || subtitleLabel[1].length))
  {
    CGFloat v19 = NSString;
    char v20 = -[_UIContentViewLabelConfiguration _shortDescription](subtitleLabel);
    CGFloat v21 = [v19 stringWithFormat:@"subtitleLabel = %@", v20];
    [v3 addObject:v21];
  }
  CGFloat top = self->_directionalLayoutMargins.top;
  double leading = self->_directionalLayoutMargins.leading;
  double bottom = self->_directionalLayoutMargins.bottom;
  double trailing = self->_directionalLayoutMargins.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    objc_super v26 = NSString;
    id v27 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
    v28 = [v26 stringWithFormat:@"directionalLayoutMargins = %@", v27];
    [v3 addObject:v28];
  }
  unint64_t axesPreservingSuperviewLayoutMargins = self->_axesPreservingSuperviewLayoutMargins;
  if (axesPreservingSuperviewLayoutMargins)
  {
    v30 = NSString;
    uint64_t v31 = _UIContentViewStringForAxis(axesPreservingSuperviewLayoutMargins);
    v32 = [v30 stringWithFormat:@"unint64_t axesPreservingSuperviewLayoutMargins = %@", v31];
    [v3 addObject:v32];
  }
  v33 = objc_msgSend(NSString, "stringWithFormat:", @"imageToTextPadding = %g", *(void *)&self->_imageToTextPadding);
  [v3 addObject:v33];

  id v34 = objc_msgSend(NSString, "stringWithFormat:", @"textToSubtitlePadding = %g", *(void *)&self->_textToSubtitlePadding);
  [v3 addObject:v34];

  v35 = NSString;
  v36 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v36);
  v38 = [v3 componentsJoinedByString:@"; "];
  v39 = [v35 stringWithFormat:@"<%@: %p; %@>", v37, self, v38];

  return (NSString *)v39;
}

- (void)setAxesPreservingSuperviewLayoutMargins:(unint64_t)a3
{
  *(unsigned char *)&self->_configurationFlags |= 1u;
  self->_unint64_t axesPreservingSuperviewLayoutMargins = a3;
}

- (unint64_t)axesPreservingSuperviewLayoutMargins
{
  return self->_axesPreservingSuperviewLayoutMargins;
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  *(unsigned char *)&self->_configurationFlags |= 2u;
  self->_directionalLayoutMargins = a3;
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

- (void)setImageToTextPadding:(double)a3
{
  *(unsigned char *)&self->_configurationFlags |= 4u;
  self->_imageToTextPadding = a3;
}

- (double)imageToTextPadding
{
  return self->_imageToTextPadding;
}

- (void)setTextToSubtitlePadding:(double)a3
{
  *(unsigned char *)&self->_configurationFlags |= 8u;
  self->_textToSubtitlePadding = a3;
}

- (double)textToSubtitlePadding
{
  return self->_textToSubtitlePadding;
}

- (_UIContentViewEditingConfiguration)_textLabelEditingConfiguration
{
  return self->_textLabelEditingConfiguration;
}

- (void)set_textLabelEditingConfiguration:(id)a3
{
}

- (_UIContentViewImageViewConfiguration)imageView
{
  return self->_imageView;
}

- (_UIContentViewLabelConfiguration)textLabel
{
  return self->_textLabel;
}

- (_UIContentViewLabelConfiguration)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabelEditingConfiguration, 0);
}

@end