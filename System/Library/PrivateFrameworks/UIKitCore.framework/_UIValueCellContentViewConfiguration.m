@interface _UIValueCellContentViewConfiguration
+ (BOOL)supportsSecureCoding;
+ (_UIValueCellContentViewConfiguration)defaultListCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)defaultConfiguration;
+ (id)defaultListCellConfigurationForState:(unint64_t)a3;
+ (id)defaultOutlineCellConfigurationForState:(unint64_t)a3;
+ (id)defaultOutlineCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)listCellConfiguration;
+ (id)outlineCellConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSDirectionalEdgeInsets)directionalLayoutMargins;
- (NSString)description;
- (UIOffset)textToValuePadding;
- (_UIContentViewImageViewConfiguration)imageView;
- (_UIContentViewLabelConfiguration)textLabel;
- (_UIContentViewLabelConfiguration)valueLabel;
- (_UIValueCellContentViewConfiguration)initWithCoder:(id)a3;
- (double)imageToTextPadding;
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
- (void)setTextToValuePadding:(UIOffset)a3;
@end

@implementation _UIValueCellContentViewConfiguration

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
  v6 = +[_UIValueCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (_UIValueCellContentViewConfiguration)defaultListCellConfigurationForState:(void *)a3 traitCollection:
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
  v12 = [v5 defaultTextLabelFontForCellStyle:1];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v11, v12);

  v13 = [v5 defaultTextColorForCellStyle:1 traitCollection:v4 tintColor:0 state:v6];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v13);

  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v5, v4, 0);
  v14 = objc_alloc_init(_UIContentViewLabelConfiguration);
  v15 = [v5 defaultDetailTextFontForCellStyle:1];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v14, v15);

  v16 = [v5 defaultDetailTextColorForCellStyle:1 traitCollection:v4 state:v6];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v14, v16);

  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v5, v4, 0);
  double v17 = _UICellContentViewDefaultDirectionalLayoutMargins(v5, v4, 1, 0, 0);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  [v5 defaultImageToTextPaddingForSidebar:0];
  double v25 = v24;
  [v5 defaultTextToSubtitlePaddingForCellStyle:1];
  CGFloat v27 = v26;
  v28 = [_UIValueCellContentViewConfiguration alloc];
  v29 = v7;
  v30 = v11;
  v31 = v14;
  if (v28)
  {
    v34.receiver = v28;
    v34.super_class = (Class)_UIValueCellContentViewConfiguration;
    v32 = (_UIValueCellContentViewConfiguration *)objc_msgSendSuper2(&v34, sel_init);
    v28 = v32;
    if (v32)
    {
      objc_storeStrong((id *)&v32->_imageView, v7);
      objc_storeStrong((id *)&v28->_textLabel, v11);
      objc_storeStrong((id *)&v28->_valueLabel, v14);
      v28->_axesPreservingSuperviewLayoutMargins = 1;
      v28->_directionalLayoutMargins.leading = v19;
      v28->_directionalLayoutMargins.bottom = v21;
      v28->_directionalLayoutMargins.trailing = v23;
      v28->_imageToTextPadding = v25;
      v28->_textToValuePadding.horizontal = 8.0;
      v28->_textToValuePadding.vertical = v27;
      v28->_directionalLayoutMargins.top = v17;
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
  v6 = +[_UIValueCellContentViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (id)defaultOutlineCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = +[_UIValueCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v5, a2, v4);
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
    uint64_t v14 = *(void *)(v6 + 64);
    [v7 defaultTextToSubtitlePaddingForCellStyle:3];
    *(void *)(v6 + 64) = v14;
    *(void *)(v6 + 72) = v15;
  }
  else
  {
    objc_msgSend(v7, "defaultTextToSubtitlePaddingForCellStyle:", 3, _UICellContentViewDefaultDirectionalLayoutMargins(v7, v4, 3, 1, 0));
  }
  v16 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
  double v17 = [(id)v6 valueLabel];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v17, v16);

  double v18 = [v7 defaultSidebarTextColorForTraitCollection:v4 state:v9 isHeader:0 isSecondaryText:0 style:v8];
  CGFloat v19 = [(id)v6 textLabel];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v19, v18);

  double v20 = [v7 defaultSidebarTextColorForTraitCollection:v4 state:v9 isHeader:0 isSecondaryText:1 style:v8];
  CGFloat v21 = [(id)v6 valueLabel];
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

    uint64_t v31 = [(id)v6 valueLabel];
    v32 = (void *)v31;
    if (v31) {
      v33 = *(void **)(v31 + 32);
    }
    else {
      v33 = 0;
    }
    id v34 = v33;
    v35 = _UIConfigurationCompatibilityColorForHighlightedState(v34);
    v36 = [(id)v6 valueLabel];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v36, v35);
  }
  if (v6) {
    *(void *)(v6 + 32) = 1;
  }

  return (id)v6;
}

+ (id)defaultConfiguration
{
  v2 = [a1 defaultListCellConfigurationForState:0];
  v3 = +[UITraitCollection _fallbackTraitCollection]();
  id v4 = _UITableConstantsForTraitCollection(v3);
  uint64_t v5 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 5);
  uint64_t v6 = [v4 defaultTextColorForCellStyle:1 traitCollection:v3 tintColor:0 state:v5];
  v7 = [v2 textLabel];
  [v7 setHighlightedTextColor:v6];

  return v2;
}

- (id)updatedConfigurationForState:(unint64_t)a3
{
  return [(_UIValueCellContentViewConfiguration *)self updatedConfigurationForState:a3 traitCollection:0];
}

- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_UIValueCellContentViewConfiguration *)self copy];
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
    uint64_t v12 = +[_UIValueCellContentViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:](v10, a3, v11);
    goto LABEL_7;
  }
  if (!defaultStyle)
  {
    uint64_t v12 = +[_UIValueCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v10, a3, v11);
LABEL_7:
    uint64_t v13 = v12;
    goto LABEL_9;
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_traitCollection_, v10, @"_UIValueCellContentView.m", 174, @"Unknown style: %ld", defaultStyle);

  uint64_t v13 = 0;
LABEL_9:

  uint64_t v15 = [(id)v7 imageView];
  v16 = [(id)v13 imageView];
  -[_UIContentViewImageViewConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v15, v16);

  double v17 = [(id)v7 textLabel];
  double v18 = [(id)v13 textLabel];
  -[_UIContentViewLabelConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v17, v18);

  CGFloat v19 = [(id)v7 valueLabel];
  double v20 = [(id)v13 valueLabel];
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
    long long v26 = *(_OWORD *)(v13 + 64);
    if (!v7) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  long long v26 = 0uLL;
  if (v7) {
LABEL_24:
  }
    *(_OWORD *)(v7 + 64) = v26;
LABEL_25:

  return (id)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIValueCellContentViewConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_UIValueCellContentViewConfiguration;
  uint64_t v5 = [(_UIValueCellContentViewConfiguration *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageView"];
    imageView = v5->_imageView;
    v5->_imageView = (_UIContentViewImageViewConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textLabel"];
    textLabel = v5->_textLabel;
    v5->_textLabel = (_UIContentViewLabelConfiguration *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueLabel"];
    valueLabel = v5->_valueLabel;
    v5->_valueLabel = (_UIContentViewLabelConfiguration *)v10;

    v5->_axesPreservingSuperviewLayoutMargins = [v4 decodeIntegerForKey:@"axesPreservingSuperviewLayoutMargins"];
    [v4 decodeDirectionalEdgeInsetsForKey:@"directionalLayoutMargins"];
    v5->_directionalLayoutMargins.top = v12;
    v5->_directionalLayoutMargins.leading = v13;
    v5->_directionalLayoutMargins.bottom = v14;
    v5->_directionalLayoutMargins.trailing = v15;
    [v4 decodeDoubleForKey:@"imageToTextPadding"];
    v5->_imageToTextPadding = v16;
    [v4 decodeUIOffsetForKey:@"textToValuePadding"];
    v5->_textToValuePadding.horizontal = v17;
    v5->_textToValuePadding.vertical = v18;
    v5->_int64_t defaultStyle = [v4 decodeIntegerForKey:@"defaultStyle"];
    CGFloat v19 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFE | [v4 decodeBoolForKey:v19];

    double v20 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
    if ([v4 decodeBoolForKey:v20]) {
      char v21 = 2;
    }
    else {
      char v21 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFD | v21;

    uint64_t v22 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageToTextPadding"];
    if ([v4 decodeBoolForKey:v22]) {
      char v23 = 4;
    }
    else {
      char v23 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFB | v23;

    long long v24 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToValuePadding"];
    if ([v4 decodeBoolForKey:v24]) {
      char v25 = 8;
    }
    else {
      char v25 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xF7 | v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [v5 encodeObject:imageView forKey:@"imageView"];
  [v5 encodeObject:self->_textLabel forKey:@"textLabel"];
  [v5 encodeObject:self->_valueLabel forKey:@"valueLabel"];
  [v5 encodeInteger:self->_axesPreservingSuperviewLayoutMargins forKey:@"axesPreservingSuperviewLayoutMargins"];
  objc_msgSend(v5, "encodeDirectionalEdgeInsets:forKey:", @"directionalLayoutMargins", self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  [v5 encodeDouble:@"imageToTextPadding" forKey:self->_imageToTextPadding];
  objc_msgSend(v5, "encodeUIOffset:forKey:", @"textToValuePadding", self->_textToValuePadding.horizontal, self->_textToValuePadding.vertical);
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
  id v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToValuePadding"];
  [v5 encodeBool:v12 forKey:v13];
}

- (id)createContentView
{
  v2 = [[_UIValueCellContentView alloc] initWithConfiguration:self];
  return v2;
}

- (void)applyToContentView:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"_UIValueCellContentView.m", 283, @"Unable to apply %@ to content view %@", self, v6 object file lineNumber description];
  }
  [v6 setConfiguration:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(_UIContentViewImageViewConfiguration *)self->_imageView copy];
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;

    uint64_t v7 = [(_UIContentViewLabelConfiguration *)self->_textLabel copy];
    uint64_t v8 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v7;

    uint64_t v9 = [(_UIContentViewLabelConfiguration *)self->_valueLabel copy];
    uint64_t v10 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v9;

    *(void *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    long long v11 = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 80) = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 96) = v11;
    *(double *)(v4 + 24) = self->_imageToTextPadding;
    *(UIOffset *)(v4 + 64) = self->_textToValuePadding;
    *(void *)(v4 + 32) = self->_defaultStyle;
    *($5D13304826AFFDDB3C4E902785E8870E *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UIValueCellContentViewConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    uint64_t v7 = v6;
    if (self) {
      LOBYTE(self) = self->_defaultStyle == v6->_defaultStyle
    }
                  && -[_UIContentViewImageViewConfiguration _isEqualToConfiguration:]((uint64_t)self->_imageView, v6->_imageView)&& -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self->_textLabel, v7->_textLabel)&& -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self->_valueLabel, v7->_valueLabel)&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))),
                                                0xFuLL))) & 1) != 0
                  && self->_imageToTextPadding == v7->_imageToTextPadding
                  && self->_textToValuePadding.vertical == v7->_textToValuePadding.vertical
                  && self->_textToValuePadding.horizontal == v7->_textToValuePadding.horizontal;
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
    else if (*(void **)(a1 + 32) == v3[4] {
           && -[_UIContentViewImageViewConfiguration _isEqualToConfigurationQuick:](*(void *)(a1 + 40), v3[5])
    }
           && -[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](*(void *)(a1 + 48), v4[6])&& -[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](*(void *)(a1 + 56), v4[7])&& *(void **)(a1 + 16) == v4[2]&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 80), *((float64x2_t *)v4 + 5)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 96), *((float64x2_t *)v4 + 6)))), 0xFuLL))) & 1) != 0&& *(double *)(a1 + 24) == *((double *)v4 + 3))
    {
      a1 = *(double *)(a1 + 72) == *((double *)v4 + 9) && *(double *)(a1 + 64) == *((double *)v4 + 8);
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
  return v4 ^ [(_UIContentViewLabelConfiguration *)self->_valueLabel hash];
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
      uint64_t v8 = [NSString stringWithUTF8String:"NSString *_UIValueCellContentViewConfigurationStyleToString(_UIValueCellContentViewConfigurationStyle)"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"_UIValueCellContentView.m", 31, @"Unknown style: %ld", defaultStyle);

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
    CGFloat v17 = [v15 stringWithFormat:@"textLabel = %@", v16];
    [v3 addObject:v17];
  }
  valueLabel = (__CFString *)self->_valueLabel;
  if (valueLabel && (valueLabel->data || valueLabel[1].length))
  {
    CGFloat v19 = NSString;
    double v20 = -[_UIContentViewLabelConfiguration _shortDescription](valueLabel);
    char v21 = [v19 stringWithFormat:@"valueLabel = %@", v20];
    [v3 addObject:v21];
  }
  CGFloat top = self->_directionalLayoutMargins.top;
  double leading = self->_directionalLayoutMargins.leading;
  double bottom = self->_directionalLayoutMargins.bottom;
  double trailing = self->_directionalLayoutMargins.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    long long v26 = NSString;
    objc_super v27 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
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

  id v34 = [NSString stringWithFormat:@"textToValuePadding = {horizontal = %g, vertical = %g}", *(void *)&self->_textToValuePadding.horizontal, *(void *)&self->_textToValuePadding.vertical];
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

- (void)setTextToValuePadding:(UIOffset)a3
{
  *(unsigned char *)&self->_configurationFlags |= 8u;
  self->_textToValuePadding = a3;
}

- (UIOffset)textToValuePadding
{
  double horizontal = self->_textToValuePadding.horizontal;
  double vertical = self->_textToValuePadding.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (_UIContentViewImageViewConfiguration)imageView
{
  return self->_imageView;
}

- (_UIContentViewLabelConfiguration)textLabel
{
  return self->_textLabel;
}

- (_UIContentViewLabelConfiguration)valueLabel
{
  return self->_valueLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end