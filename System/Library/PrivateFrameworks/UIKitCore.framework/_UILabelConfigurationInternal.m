@interface _UILabelConfigurationInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_UILabelConfigurationInternal)init;
- (_UILabelConfigurationInternal)initWithCoder:(id)a3;
- (id)_cuiCatalog;
- (id)_cuiStyleEffectConfiguration;
- (id)_resolvedCuiCatalog;
- (id)_resolvedCuiStyleEffectConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setDisabledTextColor:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UILabelConfigurationInternal

- (id)_resolvedCuiCatalog
{
  if (a1)
  {
    a1 = -[_UILabelConfigurationInternal _cuiCatalog](a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_resolvedCuiStyleEffectConfiguration
{
  if (a1)
  {
    a1 = -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (_UILabelConfigurationInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UILabelConfigurationInternal;
  v2 = [(_UILabelConfigurationInternal *)&v5 init];
  if (v2)
  {
    if (dyld_program_sdk_at_least()) {
      int v3 = 128;
    }
    else {
      int v3 = 0;
    }
    v2->_configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v2->_configurationFlags & 0xFFFFFF7F | v3);
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UILabelConfigurationInternal *)a3;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
    if (configurationFlags == v4->_configurationFlags
      && ((*(_DWORD *)&configurationFlags ^ *(_DWORD *)&v4->_configurationFlags) & 0x300) == 0
      && v4->_lineSpacing == self->_lineSpacing)
    {
      v9 = v4->_disabledTextColor;
      v10 = self->_disabledTextColor;
      v11 = v9;
      v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {
      }
      else
      {
        LOBYTE(v7) = 0;
        v14 = v12;
        v15 = v11;
        if (!v11 || !v12) {
          goto LABEL_25;
        }
        BOOL v16 = [(UIColor *)v11 isEqual:v12];

        if (!v16)
        {
          LOBYTE(v7) = 0;
LABEL_26:

          goto LABEL_10;
        }
      }
      v17 = -[_UILabelConfigurationInternal _cuiCatalog](v4);
      v18 = -[_UILabelConfigurationInternal _cuiCatalog](self);
      v15 = v17;
      v19 = v18;
      v14 = v19;
      if (v15 == v19)
      {
      }
      else
      {
        LOBYTE(v7) = 0;
        v20 = v19;
        v21 = v15;
        if (!v15 || !v19) {
          goto LABEL_24;
        }
        int v7 = [(UIColor *)v15 isEqual:v19];

        if (!v7) {
          goto LABEL_25;
        }
      }
      v21 = -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](v4);
      v20 = -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](self);
      LOBYTE(v7) = CUIStyleEffectConfigurationEqualToStyleEffectConfiguration(v21, v20);
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
  }
  LOBYTE(v7) = 0;
LABEL_10:

  return v7;
}

- (id)_cuiCatalog
{
  if (a1)
  {
    a1 = objc_getAssociatedObject(a1, &cuiCatalogKey);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_cuiStyleEffectConfiguration
{
  if (a1)
  {
    a1 = objc_getAssociatedObject(a1, &cuiStyleEffectConfigurationKey);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (unint64_t)hash
{
  unint64_t configurationFlags = self->_configurationFlags;
  return ((configurationFlags & 1) << 16) ^ ((uint64_t)(self->_lineSpacing * 100.0) << 8) ^ (configurationFlags << 15) & 0x20000 ^ (unint64_t)((configurationFlags << 15) & 0x40000) ^ (configurationFlags << 15) & 0x80000 ^ (configurationFlags << 15) & 0x100000 ^ (((configurationFlags >> 6) & 1) << 21) ^ (((configurationFlags >> 6) & 1) << 22);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = ($80F9FF894D804BF481F9E54DC1AB63BD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v5 = -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->super.isa);
  -[_UILabelConfigurationInternal _setDisabledTextColor:]((uint64_t)v4, v5);

  v6 = -[_UILabelConfigurationInternal _cuiCatalog](self);
  if (v4) {
    objc_setAssociatedObject(v4, &cuiCatalogKey, v6, (void *)1);
  }

  int v7 = -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](self);
  if (v4) {
    objc_setAssociatedObject(v4, &cuiStyleEffectConfigurationKey, v7, (void *)1);
  }

  v4[6] = self->_configurationFlags;
  return v4;
}

- (void)_setDisabledTextColor:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 16), a2);
    *(_DWORD *)(a1 + 24) |= 0x400000u;
  }
}

- (_UILabelConfigurationInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UILabelConfigurationInternal;
  objc_super v5 = [(_UILabelConfigurationInternal *)&v16 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_autotracksTextToFit"])v5->_unint64_t configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFFE | objc_msgSend(v4, "decodeBoolForKey:", @"UILabelConfiguration_autotracksTextToFit") | 0x400); {
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_textAlignmentMirrored"])
    }
    {
      if ([v4 decodeBoolForKey:@"UILabelConfiguration_textAlignmentMirrored"]) {
        int v6 = 8200;
      }
      else {
        int v6 = 0x2000;
      }
      v5->_unint64_t configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFF7 | v6);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_textAlignmentFollowsWritingDirection"])
    {
      if ([v4 decodeBoolForKey:@"UILabelConfiguration_textAlignmentFollowsWritingDirection"])int v7 = 4100; {
      else
      }
        int v7 = 4096;
      v5->_unint64_t configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFFB | v7);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_usesSimpleTextEffects"])
    {
      if ([v4 decodeBoolForKey:@"UILabelConfiguration_usesSimpleTextEffects"]) {
        int v8 = 16400;
      }
      else {
        int v8 = 0x4000;
      }
      v5->_unint64_t configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFEF | v8);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_cuiCatalog"])
    {
      *(_DWORD *)&v5->_configurationFlags |= 0x8000u;
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UILabelConfiguration_cuiCatalog"];
      objc_setAssociatedObject(v5, &cuiCatalogKey, v9, (void *)1);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_cuiStyleEffectConfiguration"])
    {
      *(_DWORD *)&v5->_configurationFlags |= 0x10000u;
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UILabelConfiguration_cuiStyleEffectConfiguration"];
      objc_setAssociatedObject(v5, &cuiStyleEffectConfigurationKey, v10, (void *)1);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_lineSpacing"])
    {
      [v4 decodeFloatForKey:@"UILabelConfiguration_lineSpacing"];
      v5->_lineSpacing = v11;
      *(_DWORD *)&v5->_configurationFlags |= 0x20000u;
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_disabledTextColor"])
    {
      *(_DWORD *)&v5->_configurationFlags |= 0x400000u;
      v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UILabelConfiguration_disabledTextColor"];
      -[_UILabelConfigurationInternal _setDisabledTextColor:]((uint64_t)v5, v12);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_hyphenationFactorIgnoredIfURLsDetected"])
    {
      if ([v4 decodeBoolForKey:@"UILabelConfiguration_hyphenationFactorIgnoredIfURLsDetected"])int v13 = 262208; {
      else
      }
        int v13 = 0x40000;
      v5->_unint64_t configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFBF | v13);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_overallWritingDirectionFollowsLayoutDirection"])
    {
      if ([v4 decodeBoolForKey:@"UILabelConfiguration_overallWritingDirectionFollowsLayoutDirection"])int v14 = 1048608; {
      else
      }
        int v14 = 0x100000;
      v5->_unint64_t configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFDF | v14);
    }
    if ([v4 containsValueForKey:@"UILabelConfiguration_hasCustomized_baselineAdjustment"])v5->_unint64_t configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFF7FFFF | ((objc_msgSend(v4, "decodeIntegerForKey:", @"UILabelConfiguration_baselineAdjustment") & 1) << 19)); {
  }
    }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x400) != 0)
  {
    [v9 encodeBool:*(unsigned char *)&configurationFlags & 1 forKey:@"UILabelConfiguration_autotracksTextToFit"];
    [v9 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_autotracksTextToFit"];
    $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
    if ((*(_WORD *)&configurationFlags & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&configurationFlags & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&configurationFlags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  [v9 encodeBool:(*(unsigned int *)&configurationFlags >> 3) & 1 forKey:@"UILabelConfiguration_textAlignmentMirrored"];
  [v9 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_textAlignmentMirrored"];
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x1000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&configurationFlags & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v9 encodeBool:(*(unsigned int *)&configurationFlags >> 2) & 1 forKey:@"UILabelConfiguration_textAlignmentFollowsWritingDirection"];
  [v9 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_textAlignmentFollowsWritingDirection"];
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&configurationFlags & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v9 encodeBool:(*(unsigned int *)&configurationFlags >> 4) & 1 forKey:@"UILabelConfiguration_usesSimpleTextEffects"];
  [v9 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_usesSimpleTextEffects"];
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&configurationFlags & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  objc_super v5 = -[_UILabelConfigurationInternal _cuiCatalog](self);
  [v9 encodeObject:v5 forKey:@"UILabelConfiguration_cuiCatalog"];

  [v9 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_cuiCatalog"];
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&configurationFlags & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  int v6 = -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](self);
  [v9 encodeObject:v6 forKey:@"UILabelConfiguration_cuiStyleEffectConfiguration"];

  [v9 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_cuiStyleEffectConfiguration"];
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&configurationFlags & 0x400000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  double lineSpacing = self->_lineSpacing;
  *(float *)&double lineSpacing = lineSpacing;
  [v9 encodeFloat:@"UILabelConfiguration_lineSpacing" forKey:lineSpacing];
  [v9 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_lineSpacing"];
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&configurationFlags & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  int v8 = self->_disabledTextColor;
  [v9 encodeObject:v8 forKey:@"UILabelConfiguration_disabledTextColor"];

  [v9 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_disabledTextColor"];
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&configurationFlags & 0x100000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v9 encodeBool:(*(unsigned int *)&configurationFlags >> 6) & 1 forKey:@"UILabelConfiguration_hyphenationFactorIgnoredIfURLsDetected"];
  [v9 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_hyphenationFactorIgnoredIfURLsDetected"];
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&configurationFlags & 0x80000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  [v9 encodeBool:(*(unsigned int *)&configurationFlags >> 5) & 1 forKey:@"UILabelConfiguration_overallWritingDirectionFollowsLayoutDirection"];
  [v9 encodeBool:1 forKey:@"UILabelConfiguration_hasCustomized_overallWritingDirectionFollowsLayoutDirection"];
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x80000) != 0)
  {
LABEL_12:
    [v9 encodeInt:(*(unsigned int *)&configurationFlags >> 8) & 3 forKey:@"UILabelConfiguration_baselineAdjustment"];
    [v9 encodeBool:(*(_DWORD *)&self->_configurationFlags >> 19) & 1 forKey:@"UILabelConfiguration_hasCustomized_baselineAdjustment"];
  }
LABEL_13:
}

- (void).cxx_destruct
{
}

@end