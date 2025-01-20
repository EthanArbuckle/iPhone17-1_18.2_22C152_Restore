@interface _UIBasicCellContentViewConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultConfiguration;
+ (id)defaultListCellConfigurationForState:(unint64_t)a3;
+ (id)defaultListCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)defaultOutlineCellConfigurationForState:(unint64_t)a3;
+ (id)defaultOutlineCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)defaultOutlineParentCellConfigurationForState:(unint64_t)a3;
+ (id)defaultOutlineRootParentCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)listCellConfiguration;
+ (id)outlineCellConfiguration;
+ (id)outlineRootParentCellConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSDirectionalEdgeInsets)directionalLayoutMargins;
- (NSString)description;
- (_UIBasicCellContentViewConfiguration)initWithCoder:(id)a3;
- (_UIContentViewEditingConfiguration)_textLabelEditingConfiguration;
- (_UIContentViewImageViewConfiguration)imageView;
- (_UIContentViewLabelConfiguration)textLabel;
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
- (void)set_textLabelEditingConfiguration:(id)a3;
@end

@implementation _UIBasicCellContentViewConfiguration

+ (id)listCellConfiguration
{
  return (id)[a1 defaultListCellConfigurationForState:0];
}

+ (id)outlineRootParentCellConfiguration
{
  return (id)[a1 defaultOutlineParentCellConfigurationForState:0];
}

+ (id)outlineCellConfiguration
{
  return (id)[a1 defaultOutlineCellConfigurationForState:0];
}

+ (id)defaultListCellConfigurationForState:(unint64_t)a3
{
  v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UIBasicCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (id)defaultListCellConfigurationForState:(void *)a3 traitCollection:
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
  v12 = [v5 defaultTextLabelFontForCellStyle:0];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v11, v12);

  v13 = [v5 defaultTextColorForCellStyle:0 traitCollection:v4 tintColor:0 state:v6];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v13);

  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v5, v4, 0);
  double v14 = _UICellContentViewDefaultDirectionalLayoutMargins(v5, v4, 0, 0, 0);
  v16 = v15;
  v18 = v17;
  v20 = v19;

  [v5 defaultImageToTextPaddingForSidebar:0];
  v22 = v21;
  v23 = [_UIBasicCellContentViewConfiguration alloc];
  v24 = v7;
  v25 = v11;
  if (v23
    && (v29.receiver = v23,
        v29.super_class = (Class)_UIBasicCellContentViewConfiguration,
        (v26 = (id *)objc_msgSendSuper2(&v29, sel_init)) != 0))
  {
    v27 = v26;
    objc_storeStrong(v26 + 6, v7);
    objc_storeStrong(v27 + 7, v11);
    v27[2] = (id)1;
    *((double *)v27 + 8) = v14;
    v27[9] = v16;
    v27[10] = v18;
    v27[11] = v20;
    v27[3] = v22;

    v27[5] = 0;
  }
  else
  {

    v27 = 0;
  }

  return v27;
}

+ (id)defaultOutlineParentCellConfigurationForState:(unint64_t)a3
{
  v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UIBasicCellContentViewConfiguration defaultOutlineRootParentCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (id)defaultOutlineRootParentCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  uint64_t v5 = self;
  v6 = _UITableConstantsForTraitCollection(v4);
  uint64_t v7 = +[_UIBasicCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v5, a2, v4);
  if ([v4 _splitViewControllerContext] == 2) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  v9 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  [v6 defaultImageToTextPaddingForSidebar:1];
  if (v7)
  {
    *(void *)(v7 + 24) = v10;
    *(double *)(v7 + 64) = _UICellContentViewDefaultDirectionalLayoutMargins(v6, v4, 0, 1, 0);
    *(void *)(v7 + 72) = v11;
    *(void *)(v7 + 80) = v12;
    *(void *)(v7 + 88) = v13;
  }
  else
  {
    _UICellContentViewDefaultDirectionalLayoutMargins(v6, v4, 0, 1, 0);
  }
  double v14 = [(id)v7 textLabel];
  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v6, v4, 1);

  if (objc_opt_respondsToSelector())
  {
    v15 = [v6 defaultSidebarHeaderFont];
    v16 = [(id)v7 textLabel];
    -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v16, v15);
  }
  v17 = [v6 defaultSidebarTextColorForTraitCollection:v4 state:v9 isHeader:1 isSecondaryText:0 style:v8];
  v18 = [(id)v7 textLabel];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v18, v17);

  v19 = [v6 defaultSidebarImageTintColorForTraitCollection:v4 state:v9 isHeader:1 style:v8];
  v20 = [(id)v7 imageView];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v20, v19);

  if ([v9 isHighlighted])
  {
    uint64_t v21 = [(id)v7 textLabel];
    v22 = (void *)v21;
    if (v21) {
      v23 = *(void **)(v21 + 32);
    }
    else {
      v23 = 0;
    }
    id v24 = v23;
    v25 = _UIConfigurationCompatibilityColorForHighlightedState(v24);

    v26 = [(id)v7 imageView];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v26, v25);

    v27 = [(id)v7 textLabel];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v27, v25);
  }
  if (v7) {
    *(void *)(v7 + 40) = 2;
  }

  return (id)v7;
}

+ (id)defaultOutlineCellConfigurationForState:(unint64_t)a3
{
  uint64_t v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UIBasicCellContentViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (id)defaultOutlineCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = +[_UIBasicCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v5, a2, v4);
  uint64_t v7 = _UITableConstantsForTraitCollection(v4);
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
    *(double *)(v6 + 64) = _UICellContentViewDefaultDirectionalLayoutMargins(v7, v4, 0, 1, 0);
    *(void *)(v6 + 72) = v11;
    *(void *)(v6 + 80) = v12;
    *(void *)(v6 + 88) = v13;
  }
  else
  {
    _UICellContentViewDefaultDirectionalLayoutMargins(v7, v4, 0, 1, 0);
  }
  double v14 = [(id)v6 textLabel];
  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v7, v4, 1);

  v15 = [v7 defaultSidebarTextColorForTraitCollection:v4 state:v9 isHeader:0 isSecondaryText:0 style:v8];
  v16 = [(id)v6 textLabel];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v16, v15);

  v17 = [v7 defaultSidebarImageTintColorForTraitCollection:v4 state:v9 isHeader:0 style:v8];
  v18 = [(id)v6 imageView];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v18, v17);

  if ([v9 isHighlighted])
  {
    uint64_t v19 = [(id)v6 textLabel];
    v20 = (void *)v19;
    if (v19) {
      uint64_t v21 = *(void **)(v19 + 32);
    }
    else {
      uint64_t v21 = 0;
    }
    id v22 = v21;
    v23 = _UIConfigurationCompatibilityColorForHighlightedState(v22);

    id v24 = [(id)v6 imageView];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v24, v23);

    v25 = [(id)v6 textLabel];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v25, v23);
  }
  if (v6) {
    *(void *)(v6 + 40) = 1;
  }

  return (id)v6;
}

+ (id)defaultConfiguration
{
  v2 = [a1 defaultListCellConfigurationForState:0];
  v3 = +[UITraitCollection _fallbackTraitCollection]();
  id v4 = _UITableConstantsForTraitCollection(v3);
  uint64_t v5 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 5);
  uint64_t v6 = [v4 defaultTextColorForCellStyle:0 traitCollection:v3 tintColor:0 state:v5];
  uint64_t v7 = [v2 textLabel];
  [v7 setHighlightedTextColor:v6];

  return v2;
}

- (id)updatedConfigurationForState:(unint64_t)a3
{
  return [(_UIBasicCellContentViewConfiguration *)self updatedConfigurationForState:a3 traitCollection:0];
}

- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_UIBasicCellContentViewConfiguration *)self copy];
  int64_t defaultStyle = self->_defaultStyle;
  id v9 = v6;
  uint64_t v10 = self;
  uint64_t v11 = v9;
  if (!v9)
  {
    uint64_t v11 = +[UITraitCollection _fallbackTraitCollection]();
  }
  switch(defaultStyle)
  {
    case 2:
      uint64_t v12 = +[_UIBasicCellContentViewConfiguration defaultOutlineRootParentCellConfigurationForState:traitCollection:](v10, a3, v11);
      goto LABEL_9;
    case 1:
      uint64_t v12 = +[_UIBasicCellContentViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:](v10, a3, v11);
      goto LABEL_9;
    case 0:
      uint64_t v12 = +[_UIBasicCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v10, a3, v11);
LABEL_9:
      uint64_t v13 = v12;
      goto LABEL_11;
  }
  double v14 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_traitCollection_, v10, @"_UIBasicCellContentView.m", 207, @"Unknown style: %ld", defaultStyle);

  uint64_t v13 = 0;
LABEL_11:

  v15 = [(id)v7 imageView];
  v16 = [(id)v13 imageView];
  -[_UIContentViewImageViewConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v15, v16);

  v17 = [(id)v7 textLabel];
  v18 = [(id)v13 textLabel];
  -[_UIContentViewLabelConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v17, v18);

  char configurationFlags = (char)self->_configurationFlags;
  if (configurationFlags) {
    goto LABEL_15;
  }
  if (v13)
  {
    uint64_t v20 = *(void *)(v13 + 16);
    if (!v7) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v20 = 0;
  if (v7)
  {
LABEL_14:
    *(void *)(v7 + 16) = v20;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_15:
  if ((configurationFlags & 2) != 0) {
    goto LABEL_19;
  }
  if (v13)
  {
    long long v21 = *(_OWORD *)(v13 + 64);
    long long v22 = *(_OWORD *)(v13 + 80);
    if (!v7) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  long long v21 = 0uLL;
  long long v22 = 0uLL;
  if (v7)
  {
LABEL_18:
    *(_OWORD *)(v7 + 64) = v21;
    *(_OWORD *)(v7 + 80) = v22;
    char configurationFlags = (char)self->_configurationFlags;
  }
LABEL_19:
  if ((configurationFlags & 4) != 0) {
    goto LABEL_23;
  }
  if (v13)
  {
    uint64_t v23 = *(void *)(v13 + 24);
    if (!v7) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  uint64_t v23 = 0;
  if (v7) {
LABEL_22:
  }
    *(void *)(v7 + 24) = v23;
LABEL_23:

  return (id)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBasicCellContentViewConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIBasicCellContentViewConfiguration;
  uint64_t v5 = [(_UIBasicCellContentViewConfiguration *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageView"];
    imageView = v5->_imageView;
    v5->_imageView = (_UIContentViewImageViewConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textLabel"];
    textLabel = v5->_textLabel;
    v5->_textLabel = (_UIContentViewLabelConfiguration *)v8;

    v5->_axesPreservingSuperviewLayoutMargins = [v4 decodeIntegerForKey:@"axesPreservingSuperviewLayoutMargins"];
    [v4 decodeDirectionalEdgeInsetsForKey:@"directionalLayoutMargins"];
    v5->_directionalLayoutMargins.top = v10;
    v5->_directionalLayoutMargins.leading = v11;
    v5->_directionalLayoutMargins.bottom = v12;
    v5->_directionalLayoutMargins.trailing = v13;
    [v4 decodeDoubleForKey:@"imageToTextPadding"];
    v5->_imageToTextPadding = v14;
    v5->_int64_t defaultStyle = [v4 decodeIntegerForKey:@"defaultStyle"];
    v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFE | [v4 decodeBoolForKey:v15];

    v16 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
    if ([v4 decodeBoolForKey:v16]) {
      char v17 = 2;
    }
    else {
      char v17 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFD | v17;

    v18 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageToTextPadding"];
    if ([v4 decodeBoolForKey:v18]) {
      char v19 = 4;
    }
    else {
      char v19 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFB | v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [v5 encodeObject:imageView forKey:@"imageView"];
  [v5 encodeObject:self->_textLabel forKey:@"textLabel"];
  [v5 encodeInteger:self->_axesPreservingSuperviewLayoutMargins forKey:@"axesPreservingSuperviewLayoutMargins"];
  objc_msgSend(v5, "encodeDirectionalEdgeInsets:forKey:", @"directionalLayoutMargins", self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  [v5 encodeDouble:@"imageToTextPadding" forKey:self->_imageToTextPadding];
  [v5 encodeInteger:self->_defaultStyle forKey:@"defaultStyle"];
  uint64_t v6 = *(unsigned char *)&self->_configurationFlags & 1;
  uint64_t v7 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
  [v5 encodeBool:v6 forKey:v7];

  uint64_t v8 = (*(unsigned char *)&self->_configurationFlags >> 1) & 1;
  id v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
  [v5 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(unsigned char *)&self->_configurationFlags >> 2) & 1;
  id v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageToTextPadding"];
  [v5 encodeBool:v10 forKey:v11];
}

- (id)createContentView
{
  v2 = [[_UIBasicCellContentView alloc] initWithConfiguration:self];
  return v2;
}

- (void)applyToContentView:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"_UIBasicCellContentView.m", 308, @"Unable to apply %@ to content view %@", self, v6 object file lineNumber description];
  }
  [v6 setConfiguration:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(_UIContentViewImageViewConfiguration *)self->_imageView copy];
    id v6 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v5;

    uint64_t v7 = [(_UIContentViewLabelConfiguration *)self->_textLabel copy];
    uint64_t v8 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v7;

    *(void *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    long long v9 = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 64) = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 80) = v9;
    *(double *)(v4 + 24) = self->_imageToTextPadding;
    uint64_t v10 = [(_UIContentViewEditingConfiguration *)self->_textLabelEditingConfiguration copy];
    id v11 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v10;

    *(void *)(v4 + 40) = self->_defaultStyle;
    *($51CF450A80AAE809443F9EE75CC1F982 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UIBasicCellContentViewConfiguration *)a3;
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
        && -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self->_textLabel, v7->_textLabel)&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))), 0xFuLL))) & 1) != 0&& self->_imageToTextPadding == v7->_imageToTextPadding)
      {
        textLabelEditingConfiguration = self->_textLabelEditingConfiguration;
        uint64_t v10 = v7->_textLabelEditingConfiguration;
        id v11 = textLabelEditingConfiguration;
        CGFloat v12 = v10;
        CGFloat v13 = v12;
        if (v11 == v12)
        {
          LOBYTE(self) = 1;
        }
        else
        {
          LOBYTE(self) = 0;
          if (v11 && v12) {
            LOBYTE(self) = [(_UIContentViewEditingConfiguration *)v11 isEqual:v12];
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
    else if (*(void **)(a1 + 40) == v3[5] {
           && -[_UIContentViewImageViewConfiguration _isEqualToConfigurationQuick:](*(void *)(a1 + 48), v3[6])
    }
           && -[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](*(void *)(a1 + 56), v4[7])&& *(void **)(a1 + 16) == v4[2]&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 64), *((float64x2_t *)v4 + 4)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 80), *((float64x2_t *)v4 + 5)))), 0xFuLL))) & 1) != 0&& *(double *)(a1 + 24) == *((double *)v4 + 3))
    {
      a1 = UIEqual(*(void **)(a1 + 32), v4[4]);
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
  return [(_UIContentViewLabelConfiguration *)self->_textLabel hash] ^ v3;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = NSString;
  unint64_t defaultStyle = self->_defaultStyle;
  if (defaultStyle >= 3)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"NSString *_UIBasicCellContentViewConfigurationStyleToString(_UIBasicCellContentViewConfigurationStyle)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"_UIBasicCellContentView.m", 35, @"Unknown style: %ld", defaultStyle);

    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (uint64_t)*(&off_1E530EC28 + defaultStyle);
  }
  long long v9 = [v4 stringWithFormat:@"Base Style = %@", v6];
  [v3 addObject:v9];

  imageView = (__CFString *)self->_imageView;
  if (imageView && (imageView->data || imageView[1].data))
  {
    id v11 = NSString;
    CGFloat v12 = -[_UIContentViewImageViewConfiguration _shortDescription](imageView);
    CGFloat v13 = [v11 stringWithFormat:@"imageView = %@", v12];
    [v3 addObject:v13];
  }
  textLabel = (__CFString *)self->_textLabel;
  if (textLabel && (textLabel->data || textLabel[1].length))
  {
    v15 = NSString;
    v16 = -[_UIContentViewLabelConfiguration _shortDescription](textLabel);
    char v17 = [v15 stringWithFormat:@"textLabel = %@", v16];
    [v3 addObject:v17];
  }
  CGFloat top = self->_directionalLayoutMargins.top;
  double leading = self->_directionalLayoutMargins.leading;
  double bottom = self->_directionalLayoutMargins.bottom;
  double trailing = self->_directionalLayoutMargins.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    long long v22 = NSString;
    uint64_t v23 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
    id v24 = [v22 stringWithFormat:@"directionalLayoutMargins = %@", v23];
    [v3 addObject:v24];
  }
  unint64_t axesPreservingSuperviewLayoutMargins = self->_axesPreservingSuperviewLayoutMargins;
  if (axesPreservingSuperviewLayoutMargins)
  {
    v26 = NSString;
    v27 = _UIContentViewStringForAxis(axesPreservingSuperviewLayoutMargins);
    v28 = [v26 stringWithFormat:@"unint64_t axesPreservingSuperviewLayoutMargins = %@", v27];
    [v3 addObject:v28];
  }
  objc_super v29 = objc_msgSend(NSString, "stringWithFormat:", @"imageToTextPadding = %g", *(void *)&self->_imageToTextPadding);
  [v3 addObject:v29];

  v30 = NSString;
  v31 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v31);
  v33 = [v3 componentsJoinedByString:@"; "];
  v34 = [v30 stringWithFormat:@"<%@: %p; %@>", v32, self, v33];

  return (NSString *)v34;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabelEditingConfiguration, 0);
}

@end