@interface _UIBasicHeaderFooterContentViewConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultFooterConfiguration;
+ (id)defaultGroupedFooterConfiguration;
+ (id)defaultGroupedHeaderConfiguration;
+ (id)defaultHeaderConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)resetsVerticalLayoutMargins;
- (NSDirectionalEdgeInsets)directionalLayoutMargins;
- (NSString)description;
- (_UIBasicHeaderFooterContentViewConfiguration)initWithCoder:(id)a3;
- (_UIContentViewLabelConfiguration)textLabel;
- (id)_initWithTextLabel:(uint64_t)a3 isHeader:(int)a4 resetsVerticalLayoutMargins:(void *)a5 traitCollection:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createContentView;
- (id)updatedConfigurationForState:(unint64_t)a3;
- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4;
- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1;
- (unint64_t)axesPreservingSuperviewLayoutMargins;
- (unint64_t)hash;
- (void)_configureForResetsVerticalLayoutMargins:(uint64_t)a3 isHeader:(void *)a4 withTraitCollection:;
- (void)applyToContentView:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAxesPreservingSuperviewLayoutMargins:(unint64_t)a3;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setResetsVerticalLayoutMargins:(BOOL)a3;
@end

@implementation _UIBasicHeaderFooterContentViewConfiguration

+ (id)defaultHeaderConfiguration
{
  +[UITraitCollection _fallbackTraitCollection]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  self;
  v3 = _createDefaultLabelConfiguration(1, 0);
  v4 = -[_UIBasicHeaderFooterContentViewConfiguration _initWithTextLabel:isHeader:resetsVerticalLayoutMargins:traitCollection:]((id *)[_UIBasicHeaderFooterContentViewConfiguration alloc], v3, 1, 1, v2);

  if (v4) {
    v4[3] = 0;
  }

  return v4;
}

- (id)_initWithTextLabel:(uint64_t)a3 isHeader:(int)a4 resetsVerticalLayoutMargins:(void *)a5 traitCollection:
{
  id v10 = a2;
  id v11 = a5;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)_UIBasicHeaderFooterContentViewConfiguration;
    v12 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 4, a2);
      -[_UIBasicHeaderFooterContentViewConfiguration _configureForResetsVerticalLayoutMargins:isHeader:withTraitCollection:]((uint64_t)a1, a4, a3, v11);
    }
  }

  return a1;
}

+ (id)defaultFooterConfiguration
{
  +[UITraitCollection _fallbackTraitCollection]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  self;
  v3 = _createDefaultLabelConfiguration(0, 0);
  v4 = -[_UIBasicHeaderFooterContentViewConfiguration _initWithTextLabel:isHeader:resetsVerticalLayoutMargins:traitCollection:]((id *)[_UIBasicHeaderFooterContentViewConfiguration alloc], v3, 0, 1, v2);

  if (v4) {
    v4[3] = (id)1;
  }

  return v4;
}

+ (id)defaultGroupedHeaderConfiguration
{
  +[UITraitCollection _fallbackTraitCollection]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  self;
  v3 = _createDefaultLabelConfiguration(1, 1);
  v4 = -[_UIBasicHeaderFooterContentViewConfiguration _initWithTextLabel:isHeader:resetsVerticalLayoutMargins:traitCollection:]((id *)[_UIBasicHeaderFooterContentViewConfiguration alloc], v3, 1, 0, v2);

  if (v4) {
    v4[3] = (id)2;
  }

  return v4;
}

+ (id)defaultGroupedFooterConfiguration
{
  +[UITraitCollection _fallbackTraitCollection]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  self;
  v3 = _createDefaultLabelConfiguration(0, 1);
  v4 = -[_UIBasicHeaderFooterContentViewConfiguration _initWithTextLabel:isHeader:resetsVerticalLayoutMargins:traitCollection:]((id *)[_UIBasicHeaderFooterContentViewConfiguration alloc], v3, 0, 0, v2);

  if (v4) {
    v4[3] = (id)3;
  }

  return v4;
}

- (id)updatedConfigurationForState:(unint64_t)a3
{
  return [(_UIBasicHeaderFooterContentViewConfiguration *)self updatedConfigurationForState:a3 traitCollection:0];
}

- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_UIBasicHeaderFooterContentViewConfiguration *)self copy];
  int64_t defaultStyle = self->_defaultStyle;
  id v8 = v5;
  v9 = self;
  id v10 = v8;
  if (!v8)
  {
    id v10 = +[UITraitCollection _fallbackTraitCollection]();
  }
  switch(defaultStyle)
  {
    case 0:
      uint64_t v11 = [v9 defaultHeaderConfiguration];
      goto LABEL_9;
    case 1:
      uint64_t v11 = [v9 defaultFooterConfiguration];
      goto LABEL_9;
    case 2:
      uint64_t v11 = [v9 defaultGroupedHeaderConfiguration];
      goto LABEL_9;
    case 3:
      uint64_t v11 = [v9 defaultGroupedFooterConfiguration];
LABEL_9:
      uint64_t v13 = v11;
      break;
    default:
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_traitCollection_, v9, @"_UIBasicHeaderFooterContentView.m", 160, @"Unknown style: %ld", defaultStyle);

      uint64_t v13 = 0;
      break;
  }

  objc_super v14 = [(id)v6 textLabel];
  v15 = [(id)v13 textLabel];
  -[_UIContentViewLabelConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v14, v15);

  char configurationFlags = (char)self->_configurationFlags;
  if ((configurationFlags & 1) == 0)
  {
    if (v13)
    {
      uint64_t v17 = *(void *)(v13 + 16);
      if (!v6) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    uint64_t v17 = 0;
    if (v6)
    {
LABEL_13:
      *(void *)(v6 + 16) = v17;
      char configurationFlags = (char)self->_configurationFlags;
    }
  }
LABEL_14:
  if ((configurationFlags & 2) != 0) {
    goto LABEL_18;
  }
  if (v13)
  {
    long long v18 = *(_OWORD *)(v13 + 40);
    long long v19 = *(_OWORD *)(v13 + 56);
    if (!v6) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  long long v18 = 0uLL;
  long long v19 = 0uLL;
  if (v6)
  {
LABEL_17:
    *(_OWORD *)(v6 + 40) = v18;
    *(_OWORD *)(v6 + 56) = v19;
  }
LABEL_18:

  return (id)v6;
}

- (void)_configureForResetsVerticalLayoutMargins:(uint64_t)a3 isHeader:(void *)a4 withTraitCollection:
{
  id v7 = a4;
  if (a1)
  {
    if (!v7)
    {
      +[UITraitCollection _fallbackTraitCollection]();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v20 = v7;
    id v8 = _UITableConstantsForTraitCollection(v7);
    [v8 defaultHeaderFooterLayoutMarginsForTableViewStyle:a2 ^ 1u isHeader:a3 isFirstSection:0];
    uint64_t v10 = v9;
    double v12 = v11;
    uint64_t v14 = v13;
    double v16 = v15;

    uint64_t v17 = [v20 layoutDirection];
    if (v17 == 1) {
      double v18 = v16;
    }
    else {
      double v18 = v12;
    }
    if (v17 == 1) {
      double v19 = v12;
    }
    else {
      double v19 = v16;
    }
    *(void *)(a1 + 40) = v10;
    *(double *)(a1 + 48) = v18;
    *(void *)(a1 + 56) = v14;
    *(double *)(a1 + 64) = v19;
    *(void *)(a1 + 16) = 1;
  }
  else
  {
    id v20 = v7;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBasicHeaderFooterContentViewConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIBasicHeaderFooterContentViewConfiguration;
  id v5 = [(_UIBasicHeaderFooterContentViewConfiguration *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textLabel"];
    textLabel = v5->_textLabel;
    v5->_textLabel = (_UIContentViewLabelConfiguration *)v6;

    v5->_axesPreservingSuperviewLayoutMargins = [v4 decodeIntegerForKey:@"axesPreservingSuperviewLayoutMargins"];
    [v4 decodeDirectionalEdgeInsetsForKey:@"directionalLayoutMargins"];
    v5->_directionalLayoutMargins.top = v8;
    v5->_directionalLayoutMargins.leading = v9;
    v5->_directionalLayoutMargins.bottom = v10;
    v5->_directionalLayoutMargins.trailing = v11;
    v5->_int64_t defaultStyle = [v4 decodeIntegerForKey:@"defaultStyle"];
    double v12 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFE | [v4 decodeBoolForKey:v12];

    uint64_t v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
    if ([v4 decodeBoolForKey:v13]) {
      char v14 = 2;
    }
    else {
      char v14 = 0;
    }
    *(unsigned char *)&v5->_char configurationFlags = *(unsigned char *)&v5->_configurationFlags & 0xFD | v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  textLabel = self->_textLabel;
  id v5 = a3;
  [v5 encodeObject:textLabel forKey:@"textLabel"];
  [v5 encodeInteger:self->_axesPreservingSuperviewLayoutMargins forKey:@"axesPreservingSuperviewLayoutMargins"];
  objc_msgSend(v5, "encodeDirectionalEdgeInsets:forKey:", @"directionalLayoutMargins", self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  [v5 encodeInteger:self->_defaultStyle forKey:@"defaultStyle"];
  uint64_t v6 = *(unsigned char *)&self->_configurationFlags & 1;
  id v7 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
  [v5 encodeBool:v6 forKey:v7];

  uint64_t v8 = (*(unsigned char *)&self->_configurationFlags >> 1) & 1;
  id v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
  [v5 encodeBool:v8 forKey:v9];
}

- (id)createContentView
{
  id v2 = [[_UIBasicHeaderFooterContentView alloc] initWithConfiguration:self];
  return v2;
}

- (void)applyToContentView:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"_UIBasicHeaderFooterContentView.m", 247, @"Unable to apply %@ to content view %@", self, v6 object file lineNumber description];
  }
  [v6 setConfiguration:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(_UIContentViewLabelConfiguration *)self->_textLabel copy];
    id v6 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v5;

    *(void *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    long long v7 = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 56) = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 40) = v7;
    *(void *)(v4 + 24) = self->_defaultStyle;
    *($2400C692209B9E3F2F06EF33CF4A9920 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UIBasicHeaderFooterContentViewConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    long long v7 = v6;
    if (self)
    {
      if (self->_defaultStyle == v6->_defaultStyle
        && -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self->_textLabel, v6->_textLabel)&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins)
      {
        LOBYTE(self) = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))), 0xFuLL)));
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

  return self & 1;
}

- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1
{
  v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3 == (void **)a1)
    {
      LOBYTE(a1) = 1;
    }
    else if (*(void **)(a1 + 24) == v3[3] {
           && -[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](*(void *)(a1 + 32), v3[4])&& *(void **)(a1 + 16) == v4[2])
    }
    {
      LOBYTE(a1) = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 40), *(float64x2_t *)(v4 + 5)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 56), *(float64x2_t *)(v4 + 7)))), 0xFuLL)));
    }
    else
    {
      LOBYTE(a1) = 0;
    }
  }

  return a1 & 1;
}

- (unint64_t)hash
{
  return [(_UIContentViewLabelConfiguration *)self->_textLabel hash];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = NSString;
  unint64_t defaultStyle = self->_defaultStyle;
  if (defaultStyle >= 4)
  {
    long long v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"NSString *_UIBasicHeaderFooterContentViewConfigurationStyleToString(_UIBasicHeaderFooterContentViewConfigurationStyle)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"_UIBasicHeaderFooterContentView.m", 36, @"Unknown style: %ld", defaultStyle);

    id v6 = 0;
  }
  else
  {
    id v6 = off_1E52DD428[defaultStyle];
  }
  id v9 = [v4 stringWithFormat:@"Base Style = %@", v6];
  [v3 addObject:v9];

  textLabel = (__CFString *)self->_textLabel;
  if (textLabel && (textLabel->data || textLabel[1].length))
  {
    CGFloat v11 = NSString;
    double v12 = -[_UIContentViewLabelConfiguration _shortDescription](textLabel);
    uint64_t v13 = [v11 stringWithFormat:@"textLabel = %@", v12];
    [v3 addObject:v13];
  }
  CGFloat top = self->_directionalLayoutMargins.top;
  double leading = self->_directionalLayoutMargins.leading;
  double bottom = self->_directionalLayoutMargins.bottom;
  double trailing = self->_directionalLayoutMargins.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    double v18 = NSString;
    double v19 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
    id v20 = [v18 stringWithFormat:@"directionalLayoutMargins = %@", v19];
    [v3 addObject:v20];
  }
  unint64_t axesPreservingSuperviewLayoutMargins = self->_axesPreservingSuperviewLayoutMargins;
  if (axesPreservingSuperviewLayoutMargins)
  {
    v22 = NSString;
    v23 = _UIContentViewStringForAxis(axesPreservingSuperviewLayoutMargins);
    v24 = [v22 stringWithFormat:@"unint64_t axesPreservingSuperviewLayoutMargins = %@", v23];
    [v3 addObject:v24];
  }
  v25 = NSString;
  v26 = (objc_class *)objc_opt_class();
  v27 = NSStringFromClass(v26);
  v28 = [v3 componentsJoinedByString:@"; "];
  v29 = [v25 stringWithFormat:@"<%@: %p; %@>", v27, self, v28];

  return (NSString *)v29;
}

- (void)setResetsVerticalLayoutMargins:(BOOL)a3
{
  -[_UIBasicHeaderFooterContentViewConfiguration _configureForResetsVerticalLayoutMargins:isHeader:withTraitCollection:]((uint64_t)self, a3, (self->_defaultStyle & 0xFFFFFFFFFFFFFFFDLL) == 0, 0);
}

- (BOOL)resetsVerticalLayoutMargins
{
  return self->_axesPreservingSuperviewLayoutMargins == 1;
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

- (_UIContentViewLabelConfiguration)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
}

@end