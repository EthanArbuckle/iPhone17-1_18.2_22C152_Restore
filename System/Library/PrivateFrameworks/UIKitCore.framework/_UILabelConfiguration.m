@interface _UILabelConfiguration
+ (BOOL)supportsSecureCoding;
+ (_UILabelConfiguration)new;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)allowsDefaultTighteningForTruncation;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighlighted;
- (CGRect)bounds;
- (NSAttributedString)attributedText;
- (NSDictionary)_defaultAttributes;
- (NSShadow)shadow;
- (NSString)text;
- (UIColor)_resolvedTextColor;
- (UIColor)backgroundColor;
- (UIColor)highlightedTextColor;
- (UIColor)textBackgroundColor;
- (UIColor)textColor;
- (UIFont)font;
- (_UILabelConfiguration)init;
- (_UILabelConfiguration)initWithCoder:(id)a3;
- (_UILabelConfiguration)initWithTraitCollection:(id)a3;
- (double)minimumScaleFactor;
- (double)preferredMaxLayoutWidth;
- (id)_initEmpty;
- (id)_internal;
- (id)_resolvedStringDrawingContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (int64_t)semanticContentAttribute;
- (int64_t)textAlignment;
- (unint64_t)hash;
- (unint64_t)lineBreakStrategy;
- (void)_setDefaultAttributes:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAllowsDefaultTighteningForTruncation:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setLineBreakStrategy:(unint64_t)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setPreferredMaxLayoutWidth:(double)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShadow:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextBackgroundColor:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation _UILabelConfiguration

- (_UILabelConfiguration)initWithTraitCollection:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UILabelConfiguration;
  id v5 = [(_UILabelConfiguration *)&v17 init];
  if (v5)
  {
    [v4 displayScale];
    *((void *)v5 + 19) = v6;
    v7 = +[UILabel _defaultAttributes];
    v8 = (void *)[v7 mutableCopy];

    v9 = [v8 objectForKeyedSubscript:*(void *)off_1E52D21B8];
    v10 = v9;
    if (v9)
    {
      *((void *)v5 + 4) = [v9 lineBreakMode];
      *((_DWORD *)v5 + 42) |= 0x8000u;
      *((void *)v5 + 5) = [v10 lineBreakStrategy];
      *((_DWORD *)v5 + 42) |= 0x10000u;
      uint64_t v11 = [v10 alignment];
      int v12 = *((_DWORD *)v5 + 42);
    }
    else
    {
      int v13 = *((_DWORD *)v5 + 42);
      *((_OWORD *)v5 + 2) = xmmword_186B93670;
      int v12 = v13 | 0x18000;
      uint64_t v11 = 4;
    }
    *((void *)v5 + 3) = v11;
    *((_DWORD *)v5 + 42) = v12 | 0x4000;
    v14 = [[_UILabelContent alloc] initWithDefaultAttributes:v8];
    v15 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v14;

    *((_DWORD *)v5 + 42) |= 0x80u;
  }

  return (_UILabelConfiguration *)v5;
}

+ (_UILabelConfiguration)new
{
  v2 = (objc_class *)objc_opt_class();
  return (_UILabelConfiguration *)objc_alloc_init(v2);
}

- (_UILabelConfiguration)init
{
  v3 = +[UITraitCollection _fallbackTraitCollection]();
  id v4 = [(_UILabelConfiguration *)self initWithTraitCollection:v3];

  return v4;
}

- (id)_initEmpty
{
  v3 = +[UITraitCollection _fallbackTraitCollection]();
  id v4 = [(_UILabelConfiguration *)self initWithTraitCollection:v3];

  if (v4)
  {
    id v5 = [_UILabelContent alloc];
    uint64_t v6 = [(_UILabelContent *)v5 initWithDefaultAttributes:MEMORY[0x1E4F1CC08]];
    content = v4->_content;
    v4->_content = (_UILabelContent *)v6;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UILabelConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UILabelConfiguration *)self _initEmpty];
  if (v5)
  {
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_defaultAttributes"])
    {
      content = v5->_content;
      v7 = [v4 decodeObjectForKey:@"UILabelConfiguration_hasCustomized_defaultAttributes"];
      uint64_t v8 = [(_UILabelContent *)content contentWithDefaultAttributes:v7];
      v9 = v5->_content;
      v5->_content = (_UILabelContent *)v8;

      *(_DWORD *)&v5->_configurationFlags |= 0x80u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_text"])
    {
      v10 = v5->_content;
      uint64_t v11 = [v4 decodeObjectForKey:@"UILabelConfiguration_hasCustomized_text"];
      uint64_t v12 = [(_UILabelContent *)v10 contentWithString:v11];
      int v13 = v5->_content;
      v5->_content = (_UILabelContent *)v12;

      *(_DWORD *)&v5->_configurationFlags |= 0x20u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_attributedText"])
    {
      v14 = v5->_content;
      v15 = [v4 decodeObjectForKey:@"UILabelConfiguration_hasCustomized_attributedText"];
      uint64_t v16 = [(_UILabelContent *)v14 contentWithAttributedString:v15];
      objc_super v17 = v5->_content;
      v5->_content = (_UILabelContent *)v16;

      *(_DWORD *)&v5->_configurationFlags |= 0x40u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_textColor"])
    {
      uint64_t v18 = [v4 decodeObjectForKey:@"UILabelConfiguration_textColor"];
      textColor = v5->_textColor;
      v5->_textColor = (UIColor *)v18;

      *(_DWORD *)&v5->_configurationFlags |= 0x200u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_highlightedTextColor"])
    {
      uint64_t v20 = [v4 decodeObjectForKey:@"UILabelConfiguration_highlightedTextColor"];
      highlightedTextColor = v5->_highlightedTextColor;
      v5->_highlightedTextColor = (UIColor *)v20;

      *(_DWORD *)&v5->_configurationFlags |= 0x400u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_textBackgroundColor"])
    {
      uint64_t v22 = [v4 decodeObjectForKey:@"UILabelConfiguration_textBackgroundColor"];
      textBackgroundColor = v5->_textBackgroundColor;
      v5->_textBackgroundColor = (UIColor *)v22;

      *(_DWORD *)&v5->_configurationFlags |= 0x800u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_backgroundColor"])
    {
      uint64_t v24 = [v4 decodeObjectForKey:@"UILabelConfiguration_backgroundColor"];
      backgroundColor = v5->_backgroundColor;
      v5->_backgroundColor = (UIColor *)v24;

      *(_DWORD *)&v5->_configurationFlags |= 0x2000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_shadow"])
    {
      uint64_t v26 = [v4 decodeObjectForKey:@"UILabelConfiguration_shadow"];
      shadow = v5->_shadow;
      v5->_shadow = (NSShadow *)v26;

      *(_DWORD *)&v5->_configurationFlags |= 0x1000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_font"])
    {
      uint64_t v28 = [v4 decodeObjectForKey:@"UILabelConfiguration_font"];
      font = v5->_font;
      v5->_font = (UIFont *)v28;

      *(_DWORD *)&v5->_configurationFlags |= 0x100u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_lineBreakMode"])
    {
      v5->_lineBreakMode = (int)[v4 decodeIntForKey:@"UILabelConfiguration_lineBreakMode"];
      *(_DWORD *)&v5->_configurationFlags |= 0x8000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_lineBreakStrategy"])
    {
      v5->_lineBreakStrategy = (int)[v4 decodeIntForKey:@"UILabelConfiguration_lineBreakStrategy"];
      *(_DWORD *)&v5->_configurationFlags |= 0x10000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_textAlignment"])
    {
      v5->_textAlignment = (int)[v4 decodeIntForKey:@"UILabelConfiguration_textAlignment"];
      *(_DWORD *)&v5->_configurationFlags |= 0x4000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_numberOfLines"])
    {
      v5->_numberOfLines = (int)[v4 decodeIntForKey:@"UILabelConfiguration_numberOfLines"];
      *(_DWORD *)&v5->_configurationFlags |= 0x20000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_minimumScaleFactor"])
    {
      [v4 decodeFloatForKey:@"UILabelConfiguration_minimumScaleFactor"];
      v5->_minimumScaleFactor = v30;
      *(_DWORD *)&v5->_configurationFlags |= 0x80000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_adjustsFontSizeToFitWidth"])v5->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFFE | objc_msgSend(v4, "decodeBoolForKey:", @"UILabelConfiguration_adjustsFontSizeToFitWidth") | 0x40000); {
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_adjustsFontForContentSizeCategory"])
    }
    {
      if ([v4 decodeBoolForKey:@"UILabelConfiguration_adjustsFontForContentSizeCategory"])int v31 = 2097156; {
      else
      }
        int v31 = 0x200000;
      v5->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFFB | v31);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_allowsDefaultTighteningForTruncation"])
    {
      if ([v4 decodeBoolForKey:@"UILabelConfiguration_allowsDefaultTighteningForTruncation"])int v32 = 1048578; {
      else
      }
        int v32 = 0x100000;
      v5->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFFD | v32);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_bounds"])
    {
      [v4 decodeRectForKey:@"UILabelConfiguration_bounds"];
      v5->_bounds.origin.x = v33;
      v5->_bounds.origin.y = v34;
      v5->_bounds.size.width = v35;
      v5->_bounds.size.height = v36;
      *(_DWORD *)&v5->_configurationFlags |= 0x400000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_preferredMaxLayoutWidth"])
    {
      [v4 decodeFloatForKey:@"UILabelConfiguration_preferredMaxLayoutWidth"];
      v5->_preferredMaxLayoutWidth = v37;
      *(_DWORD *)&v5->_configurationFlags |= 0x800000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_semanticContentAttribute"])
    {
      v5->_semanticContentAttribute = (int)[v4 decodeIntForKey:@"UILabelConfiguration_semanticContentAttribute"];
      *(_DWORD *)&v5->_configurationFlags |= 0x1000000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_isEnabled"])
    {
      if ([v4 decodeBoolForKey:@"UILabelConfiguration_isEnabled"]) {
        int v38 = 33554440;
      }
      else {
        int v38 = 0x2000000;
      }
      v5->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFF7 | v38);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_isHighlighted"])
    {
      if ([v4 decodeBoolForKey:@"UILabelConfiguration_isHighlighted"]) {
        int v39 = 67108880;
      }
      else {
        int v39 = 0x4000000;
      }
      v5->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFEF | v39);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_internal"])
    {
      uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UILabelConfiguration_internal"];
      internal = v5->_internal;
      v5->_internal = (_UILabelConfigurationInternal *)v40;

      *(_DWORD *)&v5->_configurationFlags |= 0x8000000u;
    }
    [v4 decodeFloatForKey:@"UILabelConfiguration_displayScale"];
    v5->_displayScale = v42;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x200) != 0)
  {
    [v8 encodeObject:self->_textColor forKey:@"UILabelConfiguration_textColor"];
    [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_textColor"];
    $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
    if ((*(_WORD *)&configurationFlags & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&configurationFlags & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&configurationFlags & 0x400) == 0)
  {
    goto LABEL_3;
  }
  [v8 encodeObject:self->_highlightedTextColor forKey:@"UILabelConfiguration_highlightedTextColor"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_highlightedTextColor"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&configurationFlags & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v8 encodeObject:self->_textBackgroundColor forKey:@"UILabelConfiguration_textBackgroundColor"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_textBackgroundColor"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&configurationFlags & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v8 encodeObject:self->_shadow forKey:@"UILabelConfiguration_shadow"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_shadow"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&configurationFlags & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v8 encodeObject:self->_backgroundColor forKey:@"UILabelConfiguration_backgroundColor"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_backgroundColor"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&configurationFlags & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v8 encodeObject:self->_font forKey:@"UILabelConfiguration_font"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_font"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&configurationFlags & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v8 encodeInt:LODWORD(self->_lineBreakMode) forKey:@"UILabelConfiguration_lineBreakMode"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_lineBreakMode"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&configurationFlags & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v8 encodeInt:LODWORD(self->_lineBreakStrategy) forKey:@"UILabelConfiguration_lineBreakStrategy"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_lineBreakStrategy"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&configurationFlags & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v8 encodeInt:LODWORD(self->_textAlignment) forKey:@"UILabelConfiguration_textAlignment"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_textAlignment"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&configurationFlags & 0x80000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v8 encodeInt:LODWORD(self->_numberOfLines) forKey:@"UILabelConfiguration_numberOfLines"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_numberOfLines"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x80000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&configurationFlags & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  double minimumScaleFactor = self->_minimumScaleFactor;
  *(float *)&double minimumScaleFactor = minimumScaleFactor;
  [v8 encodeFloat:@"UILabelConfiguration_minimumScaleFactor" forKey:minimumScaleFactor];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_minimumScaleFactor"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&configurationFlags & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v8 encodeBool:*(unsigned char *)&configurationFlags & 1 forKey:@"UILabelConfiguration_adjustsFontSizeToFitWidth"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_adjustsFontSizeToFitWidth"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&configurationFlags & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v8 encodeBool:(*(unsigned int *)&configurationFlags >> 1) & 1 forKey:@"UILabelConfiguration_allowsDefaultTighteningForTruncation"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_allowsDefaultTighteningForTruncation"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&configurationFlags & 0x400000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v8 encodeBool:*(unsigned char *)&configurationFlags & 1 forKey:@"UILabelConfiguration_adjustsFontSizeToFitWidth"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_adjustsFontSizeToFitWidth"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&configurationFlags & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v8, "encodeRect:forKey:", @"UILabelConfiguration_bounds", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_bounds"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&configurationFlags & 0x1000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  double preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  *(float *)&double preferredMaxLayoutWidth = preferredMaxLayoutWidth;
  [v8 encodeFloat:@"UILabelConfiguration_preferredMaxLayoutWidth" forKey:preferredMaxLayoutWidth];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_preferredMaxLayoutWidth"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x1000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&configurationFlags & 0x2000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v8 encodeInt:LODWORD(self->_semanticContentAttribute) forKey:@"UILabelConfiguration_semanticContentAttribute"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_semanticContentAttribute"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x2000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&configurationFlags & 0x4000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v8 encodeBool:(*(unsigned int *)&configurationFlags >> 3) & 1 forKey:@"UILabelConfiguration_isEnabled"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_isEnabled"];
  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x4000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&configurationFlags & 0x8000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_43:
  [v8 encodeBool:(*(unsigned int *)&configurationFlags >> 4) & 1 forKey:@"UILabelConfiguration_isHighlighted"];
  [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_isHighlighted"];
  if ((*(_DWORD *)&self->_configurationFlags & 0x8000000) != 0)
  {
LABEL_21:
    [v8 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_internal"];
    [v8 encodeObject:self->_internal forKey:@"UILabelConfiguration_internal"];
  }
LABEL_22:
  double displayScale = self->_displayScale;
  *(float *)&double displayScale = displayScale;
  [v8 encodeFloat:@"UILabelConfiguration_displayScale" forKey:displayScale];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initEmpty");
  *(double *)(v5 + 152) = self->_displayScale;
  id v6 = [(_UILabelContent *)self->_content copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(UIFont *)self->_font copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  id v10 = [(UIColor *)self->_textColor copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  id v12 = [(UIColor *)self->_highlightedTextColor copyWithZone:a3];
  int v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  id v14 = [(UIColor *)self->_textBackgroundColor copyWithZone:a3];
  v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  id v16 = [(UIColor *)self->_backgroundColor copyWithZone:a3];
  objc_super v17 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v16;

  uint64_t v18 = [(NSShadow *)self->_shadow copyWithZone:a3];
  v19 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v18;

  *(void *)(v5 + 32) = self->_lineBreakMode;
  *(void *)(v5 + 40) = self->_lineBreakStrategy;
  *(void *)(v5 + 24) = self->_textAlignment;
  *(void *)(v5 + 96) = self->_numberOfLines;
  *(double *)(v5 + 104) = self->_minimumScaleFactor;
  CGSize size = self->_bounds.size;
  *(CGPoint *)(v5 + 112) = self->_bounds.origin;
  *(CGSize *)(v5 + 128) = size;
  *(double *)(v5 + 144) = self->_preferredMaxLayoutWidth;
  *(void *)(v5 + 16) = self->_semanticContentAttribute;
  *($A04097B2114CAB6226B776567B655A1B *)(v5 + 168) = self->_configurationFlags;
  id v21 = [(_UILabelConfigurationInternal *)self->_internal copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UILabelConfiguration *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ((*(_DWORD *)&self->_configurationFlags ^ *(_DWORD *)&v4->_configurationFlags) & 0x1F) != 0
      || v4->_numberOfLines != self->_numberOfLines
      || v4->_minimumScaleFactor != self->_minimumScaleFactor
      || v4->_lineBreakMode != self->_lineBreakMode
      || v4->_displayScale != self->_displayScale
      || v4->_lineBreakStrategy != self->_lineBreakStrategy
      || v4->_textAlignment != self->_textAlignment
      || v4->_semanticContentAttribute != self->_semanticContentAttribute
      || !CGRectEqualToRect(v4->_bounds, self->_bounds)
      || v4->_preferredMaxLayoutWidth != self->_preferredMaxLayoutWidth
      || !UIEqual(v4->_textColor, self->_textColor)
      || !UIEqual(v4->_highlightedTextColor, self->_highlightedTextColor)
      || !UIEqual(v4->_textBackgroundColor, self->_textBackgroundColor)
      || !UIEqual(v4->_backgroundColor, self->_backgroundColor)
      || !UIEqual(v4->_font, self->_font)
      || !UIEqual(v4->_content, self->_content)
      || !UIEqual(v4->_textColor, self->_textColor)
      || !UIEqual(v4->_textBackgroundColor, self->_textBackgroundColor)
      || !UIEqual(v4->_backgroundColor, self->_backgroundColor)
      || !UIEqual(v4->_shadow, self->_shadow))
    {
      char v5 = 0;
      goto LABEL_27;
    }
    if ((*((unsigned char *)&self->_configurationFlags + 3) & 8) != 0 && (*((unsigned char *)&v4->_configurationFlags + 3) & 8) != 0)
    {
      char v5 = UIEqual(v4->_internal, self->_internal);
      goto LABEL_27;
    }
  }
  char v5 = 1;
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_UILabelContent *)self->_content hash];
  int v4 = *(_DWORD *)&self->_configurationFlags << 24;
  return self->_numberOfLines ^ v3 ^ (16 * (int)(self->_displayScale * 100.0)) ^ ((int)(self->_minimumScaleFactor * 100.0) << 8) ^ (unint64_t)((int)(self->_preferredMaxLayoutWidth * 100.0) << 16) ^ v4 & 0x1000000 ^ (unint64_t)(v4 & 0x2000000) ^ v4 & 0x4000000 ^ v4 & 0x8000000 ^ v4 & 0x10000000;
}

- (NSString)text
{
  return (NSString *)[(_UILabelContent *)self->_content string];
}

- (void)setText:(id)a3
{
  int v4 = [(_UILabelContent *)self->_content contentWithString:a3];
  content = self->_content;
  self->_content = v4;

  self->_$A04097B2114CAB6226B776567B655A1B configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFF9F | 0x20);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)[(_UILabelContent *)self->_content attributedString];
}

- (void)setAttributedText:(id)a3
{
  int v4 = [(_UILabelContent *)self->_content contentWithAttributedString:a3];
  content = self->_content;
  self->_content = v4;

  self->_$A04097B2114CAB6226B776567B655A1B configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFF9F | 0x40);
}

- (NSDictionary)_defaultAttributes
{
  return (NSDictionary *)[(_UILabelContent *)self->_content defaultAttributes];
}

- (void)_setDefaultAttributes:(id)a3
{
  int v4 = [(_UILabelContent *)self->_content contentWithDefaultAttributes:a3];
  content = self->_content;
  self->_content = v4;

  *(_DWORD *)&self->_configurationFlags |= 0x80u;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  *(_DWORD *)&self->_configurationFlags |= 0x100u;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  *(_DWORD *)&self->_configurationFlags |= 0x200u;
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
  *(_DWORD *)&self->_configurationFlags |= 0x400u;
}

- (UIColor)textBackgroundColor
{
  return self->_textBackgroundColor;
}

- (void)setTextBackgroundColor:(id)a3
{
  *(_DWORD *)&self->_configurationFlags |= 0x800u;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
  *(_DWORD *)&self->_configurationFlags |= 0x1000u;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  *(_DWORD *)&self->_configurationFlags |= 0x2000u;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x4000u;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x8000u;
}

- (unint64_t)lineBreakStrategy
{
  return self->_lineBreakStrategy;
}

- (void)setLineBreakStrategy:(unint64_t)a3
{
  self->_lineBreakStrategy = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x10000u;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x20000u;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return *(_DWORD *)&self->_configurationFlags & 1;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  self->_$A04097B2114CAB6226B776567B655A1B configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFFFE | a3 | 0x40000);
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_double minimumScaleFactor = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x80000u;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  return (*(unsigned char *)&self->_configurationFlags >> 1) & 1;
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)a3
{
  if (a3) {
    int v3 = 1048578;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$A04097B2114CAB6226B776567B655A1B configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFFFD | v3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return (*(unsigned char *)&self->_configurationFlags >> 2) & 1;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (a3) {
    int v3 = 2097156;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$A04097B2114CAB6226B776567B655A1B configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFFFB | v3);
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x400000u;
}

- (double)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  self->_double preferredMaxLayoutWidth = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x800000u;
}

- (int64_t)semanticContentAttribute
{
  return self->_semanticContentAttribute;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  self->_semanticContentAttribute = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x1000000u;
}

- (BOOL)isEnabled
{
  return (*(unsigned char *)&self->_configurationFlags >> 3) & 1;
}

- (void)setEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 33554440;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$A04097B2114CAB6226B776567B655A1B configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFFF7 | v3);
}

- (BOOL)isHighlighted
{
  return (*(unsigned char *)&self->_configurationFlags >> 4) & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  if (a3) {
    int v3 = 67108880;
  }
  else {
    int v3 = 0x4000000;
  }
  self->_$A04097B2114CAB6226B776567B655A1B configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFFEF | v3);
}

- (id)_internal
{
  if (a1)
  {
    a1 = (id *)a1[20];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (UIColor)_resolvedTextColor
{
  if (a1)
  {
    if ([a1 isEnabled])
    {
      if ([a1 isHighlighted])
      {
        v2 = [a1 highlightedTextColor];
        int v3 = v2;
        if (v2)
        {
          int v4 = v2;
        }
        else
        {
          int v4 = [a1 textColor];
        }
        uint64_t v8 = v4;

        if (!v8) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v8 = [a1 textColor];
        if (!v8)
        {
LABEL_16:
          v9 = +[UIColor labelColor];
          goto LABEL_17;
        }
      }
    }
    else
    {
      uint64_t v5 = a1[20];
      if (v5 && (id v6 = *(id *)(v5 + 16)) != 0)
      {
        v7 = (UIColor *)v6;
        uint64_t v8 = v7;
      }
      else
      {
        uint64_t v8 = [[UIColor alloc] initWithWhite:0.56 alpha:1.0];
        v7 = 0;
      }

      if (!v8) {
        goto LABEL_16;
      }
    }
    v9 = v8;
LABEL_17:
    id v10 = v9;

    goto LABEL_18;
  }
  id v10 = 0;
LABEL_18:
  return v10;
}

- (id)_resolvedStringDrawingContext
{
  if (a1)
  {
    id v2 = objc_alloc_init((Class)off_1E52D2E48);
    uint64_t v3 = [a1 numberOfLines];
    [v2 setWrapsForTruncationMode:v3 != 1];
    [v2 setMaximumNumberOfLines:v3];
    [v2 setCachesLayout:1];
    [v2 setLayout:0];
    int v4 = a1[20];
    if (v4 && (v4[24] & 0x10) != 0)
    {
      [v2 setUsesSimpleTextEffects:1];
      int v4 = a1[20];
    }
    uint64_t v5 = -[_UILabelConfigurationInternal _resolvedCuiCatalog](v4);

    if (v5)
    {
      id v6 = -[_UILabelConfigurationInternal _resolvedCuiCatalog](a1[20]);
      [v2 setCuiCatalog:v6];
    }
    v7 = -[_UILabelConfigurationInternal _resolvedCuiStyleEffectConfiguration](a1[20]);

    if (v7)
    {
      uint64_t v8 = -[_UILabelConfigurationInternal _resolvedCuiStyleEffectConfiguration](a1[20]);
      [v2 setCuiStyleEffects:v8];

      v9 = [v2 cuiStyleEffects];
      int v10 = [v9 useSimplifiedEffect];

      if (v10) {
        [v2 setUsesSimpleTextEffects:1];
      }
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = [NSString stringWithFormat:@"<%@:%p", objc_opt_class(), self];
  int v4 = (void *)[v3 mutableCopy];

  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(unsigned char *)&configurationFlags & 0x20) != 0)
  {
    id v6 = [(_UILabelConfiguration *)self text];
    [v4 appendFormat:@" text=%@", v6];

    $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
    if ((*(unsigned char *)&configurationFlags & 0x40) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&configurationFlags & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&configurationFlags & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v7 = [(_UILabelConfiguration *)self attributedText];
  [v4 appendFormat:@" attributedText=%@", v7];

  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x200) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&configurationFlags & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v8 = [(_UILabelConfiguration *)self textColor];
  [v4 appendFormat:@" textColor=%@", v8];

  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x400) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&configurationFlags & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = [(_UILabelConfiguration *)self highlightedTextColor];
  [v4 appendFormat:@" highlightedTextColor=%@", v9];

  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x800) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&configurationFlags & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  int v10 = [(_UILabelConfiguration *)self textBackgroundColor];
  [v4 appendFormat:@" textBackgroundColor=%@", v10];

  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&configurationFlags & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v11 = [(_UILabelConfiguration *)self backgroundColor];
  [v4 appendFormat:@" backgroundColor=%@", v11];

  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&configurationFlags & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  id v12 = [(_UILabelConfiguration *)self font];
  [v4 appendFormat:@" font=%@", v12];

  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&configurationFlags & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  int v13 = [(_UILabelConfiguration *)self shadow];
  [v4 appendFormat:@" shadow=%@", v13];

  $A04097B2114CAB6226B776567B655A1B configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&configurationFlags & 0x10000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "appendFormat:", @" numberOfLines=%ld", -[_UILabelConfiguration numberOfLines](self, "numberOfLines"));
  if ((*(_DWORD *)&self->_configurationFlags & 0x10000) == 0) {
    goto LABEL_31;
  }
LABEL_21:
  uint64_t v14 = [(_UILabelConfiguration *)self lineBreakStrategy];
  if (v14 > 1)
  {
    if (v14 == 2)
    {
      v15 = @" lineBreakStrategy=hangulWordPriority";
    }
    else
    {
      if (v14 != 0xFFFF) {
        goto LABEL_31;
      }
      v15 = @" lineBreakStrategy=standard";
    }
  }
  else if (v14)
  {
    if (v14 != 1) {
      goto LABEL_31;
    }
    v15 = @" lineBreakStrategy=pushOut";
  }
  else
  {
    v15 = @" lineBreakStrategy=none";
  }
  [v4 appendFormat:v15];
LABEL_31:
  if ((*((unsigned char *)&self->_configurationFlags + 1) & 0x80) != 0)
  {
    switch([(_UILabelConfiguration *)self lineBreakMode])
    {
      case 0:
        id v16 = @" lineBreakMode=wordWrapping";
        goto LABEL_40;
      case 1:
        id v16 = @" lineBreakMode=charWrapping";
        goto LABEL_40;
      case 2:
        id v16 = @" lineBreakMode=clipping";
        goto LABEL_40;
      case 3:
        id v16 = @" lineBreakMode=truncatingHead";
        goto LABEL_40;
      case 4:
        id v16 = @" lineBreakMode=truncatingTail";
        goto LABEL_40;
      case 5:
        id v16 = @" lineBreakMode=truncatingMiddle";
LABEL_40:
        [v4 appendString:v16];
        break;
      default:
        objc_msgSend(v4, "appendFormat:", @" lineBreakMode=%ld", -[_UILabelConfiguration lineBreakMode](self, "lineBreakMode"));
        break;
    }
  }
  if ((*((unsigned char *)&self->_configurationFlags + 1) & 0x40) != 0)
  {
    switch([(_UILabelConfiguration *)self textAlignment])
    {
      case 0:
        [v4 appendString:@" textAlignment=left"];
        goto LABEL_44;
      case 1:
LABEL_44:
        objc_super v17 = @" textAlignment=center";
        goto LABEL_49;
      case 2:
        objc_super v17 = @" textAlignment=right";
        goto LABEL_49;
      case 3:
        objc_super v17 = @" textAlignment=justified";
        goto LABEL_49;
      case 4:
        objc_super v17 = @" textAlignment=natural";
LABEL_49:
        [v4 appendString:v17];
        break;
      default:
        objc_msgSend(v4, "appendFormat:", @" textAlignment=%ld", -[_UILabelConfiguration textAlignment](self, "textAlignment"));
        break;
    }
  }
  $A04097B2114CAB6226B776567B655A1B v18 = self->_configurationFlags;
  if ((*(_DWORD *)&v18 & 0x40000) != 0)
  {
    if ([(_UILabelConfiguration *)self adjustsFontSizeToFitWidth]) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
    [v4 appendFormat:@" adjustsFontSizeToFitWidth=%@", v19];
    $A04097B2114CAB6226B776567B655A1B v18 = self->_configurationFlags;
    if ((*(_DWORD *)&v18 & 0x80000) == 0)
    {
LABEL_52:
      if ((*(_DWORD *)&v18 & 0x200000) == 0) {
        goto LABEL_53;
      }
      goto LABEL_63;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x80000) == 0)
  {
    goto LABEL_52;
  }
  [(_UILabelConfiguration *)self minimumScaleFactor];
  objc_msgSend(v4, "appendFormat:", @" minimumScaleFactor=%f", v20);
  $A04097B2114CAB6226B776567B655A1B v18 = self->_configurationFlags;
  if ((*(_DWORD *)&v18 & 0x200000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v18 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_67;
  }
LABEL_63:
  if ([(_UILabelConfiguration *)self adjustsFontForContentSizeCategory]) {
    id v21 = @"YES";
  }
  else {
    id v21 = @"NO";
  }
  [v4 appendFormat:@" adjustsFontForContentSizeCategory=%@", v21];
  $A04097B2114CAB6226B776567B655A1B v18 = self->_configurationFlags;
  if ((*(_DWORD *)&v18 & 0x100000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v18 & 0x400000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_71;
  }
LABEL_67:
  if ([(_UILabelConfiguration *)self allowsDefaultTighteningForTruncation]) {
    uint64_t v22 = @"YES";
  }
  else {
    uint64_t v22 = @"NO";
  }
  [v4 appendFormat:@" allowsDefaultTighteningForTruncation=%@", v22];
  $A04097B2114CAB6226B776567B655A1B v18 = self->_configurationFlags;
  if ((*(_DWORD *)&v18 & 0x400000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v18 & 0x800000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_72;
  }
LABEL_71:
  [(_UILabelConfiguration *)self bounds];
  v23 = NSStringFromCGRect(v29);
  [v4 appendFormat:@" bounds=%@", v23];

  $A04097B2114CAB6226B776567B655A1B v18 = self->_configurationFlags;
  if ((*(_DWORD *)&v18 & 0x800000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v18 & 0x1000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_73;
  }
LABEL_72:
  [(_UILabelConfiguration *)self preferredMaxLayoutWidth];
  objc_msgSend(v4, "appendFormat:", @" preferredMaxLayoutWidth=%f", v24);
  if ((*(_DWORD *)&self->_configurationFlags & 0x1000000) == 0) {
    goto LABEL_81;
  }
LABEL_73:
  switch([(_UILabelConfiguration *)self semanticContentAttribute])
  {
    case 0:
      v25 = @" semanticContentAttribute=unspecified";
      goto LABEL_80;
    case 1:
      v25 = @" semanticContentAttribute=playback";
      goto LABEL_80;
    case 2:
      v25 = @" semanticContentAttribute=spatial";
      goto LABEL_80;
    case 3:
      v25 = @" semanticContentAttribute=forceLeftToRight";
      goto LABEL_80;
    case 4:
      v25 = @" semanticContentAttribute=forceRightToLeft";
LABEL_80:
      [v4 appendString:v25];
      break;
    default:
      objc_msgSend(v4, "appendFormat:", @" semanticContentAttribute=%ld", -[_UILabelConfiguration semanticContentAttribute](self, "semanticContentAttribute"));
      break;
  }
LABEL_81:
  objc_msgSend(v4, "appendFormat:", @" displayScale=%f", *(void *)&self->_displayScale);
  [v4 appendString:@">"];
  uint64_t v26 = (void *)[v4 copy];

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end