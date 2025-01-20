@interface _UIBackgroundViewConfiguration
+ (BOOL)supportsSecureCoding;
+ (_UIBackgroundViewConfiguration)defaultGroupedListCellConfigurationForState:(void *)a3 traitCollection:;
+ (_UIBackgroundViewConfiguration)defaultGroupedListHeaderFooterConfigurationForState:traitCollection:;
+ (_UIBackgroundViewConfiguration)defaultOutlineCellConfigurationForState:(void *)a3 traitCollection:;
+ (_UIBackgroundViewConfiguration)defaultOutlineRootParentCellConfigurationForState:(void *)a3 traitCollection:;
+ (_UIBackgroundViewConfiguration)defaultPlainListCellConfigurationForState:(void *)a3 traitCollection:;
+ (_UIBackgroundViewConfiguration)defaultPlainListHeaderFooterConfigurationForState:(void *)a3 traitCollection:;
+ (id)defaultGroupedListCellConfigurationForState:(unint64_t)a3;
+ (id)defaultGroupedListHeaderFooterConfigurationForState:(unint64_t)a3;
+ (id)defaultInsetGroupedListCellConfigurationForState:(unint64_t)a3;
+ (id)defaultInsetGroupedListCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)defaultInsetGroupedListHeaderFooterConfigurationForState:(uint64_t)a1 traitCollection:(void *)a2;
+ (id)defaultInsetGroupedListHeaderFooterConfigurationForState:(unint64_t)a3;
+ (id)defaultOutlineCellConfigurationForState:(unint64_t)a3;
+ (id)defaultOutlineParentCellConfigurationForState:(unint64_t)a3;
+ (id)defaultPlainListCellConfigurationForState:(unint64_t)a3;
+ (id)defaultPlainListHeaderFooterConfigurationForState:(unint64_t)a3;
+ (id)groupedListCellConfiguration;
+ (id)groupedListHeaderFooterConfiguration;
+ (id)insetGroupedListCellConfiguration;
+ (id)insetGroupedListHeaderFooterConfiguration;
+ (id)outlineCellConfiguration;
+ (id)outlineRootParentCellConfiguration;
+ (id)plainListCellConfiguration;
+ (id)plainListHeaderFooterConfiguration;
- (BOOL)_backgroundFillIsEqual:(id)a3 withTintColor:(id)a4;
- (BOOL)_hasBackgroundColor;
- (BOOL)_hasBackgroundFill;
- (BOOL)_hasStroke;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTintBackgroundColor;
- (NSDirectionalEdgeInsets)backgroundInsets;
- (NSString)__visualEffectGroupName;
- (NSString)description;
- (UIColor)backgroundColor;
- (UIColor)strokeColor;
- (UIImage)image;
- (UIShadowProperties)_shadowProperties;
- (UIView)customView;
- (UIVisualEffect)visualEffect;
- (_UIBackgroundViewConfiguration)init;
- (_UIBackgroundViewConfiguration)initWithCoder:(id)a3;
- (double)_cornerRadius;
- (double)cornerRadius;
- (double)strokeOutset;
- (double)strokeWidth;
- (id)_updatedConfigurationForState:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resolvedBackgroundColorForTintColor:(id)a3;
- (id)resolvedStrokeColorForTintColor:(id)a3;
- (id)updatedConfigurationForState:(unint64_t)a3;
- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4;
- (int64_t)_strokeLocation;
- (int64_t)backgroundColorMode;
- (int64_t)imageContentMode;
- (int64_t)strokeColorMode;
- (unint64_t)__maskedCorners;
- (unint64_t)__visualEffectblurClippingMode;
- (unint64_t)edgesAddingLayoutMarginsToBackgroundInsets;
- (unint64_t)hash;
- (void)__setMaskedCorners:(unint64_t)a3;
- (void)__setVisualEffectGroupName:(id)a3;
- (void)__setVisualEffectblurClippingMode:(unint64_t)a3;
- (void)_setBackgroundColor:(uint64_t)a1;
- (void)_setCornerRadius:(double)a3;
- (void)_setShadowProperties:(id)a3;
- (void)_setStrokeLocation:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundColorMode:(int64_t)a3;
- (void)setBackgroundInsets:(NSDirectionalEdgeInsets)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCustomView:(id)a3;
- (void)setEdgesAddingLayoutMarginsToBackgroundInsets:(unint64_t)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeColorMode:(int64_t)a3;
- (void)setStrokeOutset:(double)a3;
- (void)setStrokeWidth:(double)a3;
- (void)setVisualEffect:(id)a3;
- (void)shadowProperties;
@end

@implementation _UIBackgroundViewConfiguration

+ (id)plainListCellConfiguration
{
  return (id)[a1 defaultPlainListCellConfigurationForState:0];
}

+ (id)plainListHeaderFooterConfiguration
{
  return (id)[a1 defaultPlainListHeaderFooterConfigurationForState:0];
}

+ (id)groupedListCellConfiguration
{
  return (id)[a1 defaultGroupedListCellConfigurationForState:0];
}

+ (id)groupedListHeaderFooterConfiguration
{
  return (id)[a1 defaultGroupedListHeaderFooterConfigurationForState:0];
}

+ (id)insetGroupedListCellConfiguration
{
  return (id)[a1 defaultInsetGroupedListCellConfigurationForState:0];
}

+ (id)insetGroupedListHeaderFooterConfiguration
{
  return (id)[a1 defaultInsetGroupedListHeaderFooterConfigurationForState:0];
}

+ (id)outlineRootParentCellConfiguration
{
  return (id)[a1 defaultOutlineParentCellConfigurationForState:0];
}

+ (id)outlineCellConfiguration
{
  return (id)[a1 defaultOutlineCellConfigurationForState:0];
}

+ (id)defaultPlainListCellConfigurationForState:(unint64_t)a3
{
  v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UIBackgroundViewConfiguration defaultPlainListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (_UIBackgroundViewConfiguration)defaultPlainListCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  self;
  v5 = _UITableConstantsForTraitCollection(v4);
  v6 = objc_alloc_init(_UIBackgroundViewConfiguration);
  v7 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  if (v5) {
    [v5 defaultCellBackgroundPropertiesForTableViewStyle:0 state:v7 traitCollection:v4];
  }
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v9, (uint64_t)v10);
  _UIBackgroundViewConfigurationApplyProperties(v6, (uint64_t)v9, v4);
  if (v6) {
    v6->_defaultStyle = 1;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)v10);

  return v6;
}

+ (id)defaultPlainListHeaderFooterConfigurationForState:(unint64_t)a3
{
  v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UIBackgroundViewConfiguration defaultPlainListHeaderFooterConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (_UIBackgroundViewConfiguration)defaultPlainListHeaderFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  self;
  v5 = _UITableConstantsForTraitCollection(v4);
  v6 = objc_alloc_init(_UIBackgroundViewConfiguration);
  v7 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  if (v5) {
    [v5 defaultHeaderFooterBackgroundPropertiesForTableViewStyle:0 cellConfigurationState:v7 traitCollection:v4 floating:(a2 >> 11) & 1];
  }
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v9, (uint64_t)v10);
  _UIBackgroundViewConfigurationApplyProperties(v6, (uint64_t)v9, v4);
  if (v6) {
    v6->_defaultStyle = 2;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)v10);

  return v6;
}

+ (id)defaultGroupedListCellConfigurationForState:(unint64_t)a3
{
  v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UIBackgroundViewConfiguration defaultGroupedListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (_UIBackgroundViewConfiguration)defaultGroupedListCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  self;
  v5 = _UITableConstantsForTraitCollection(v4);
  v6 = objc_alloc_init(_UIBackgroundViewConfiguration);
  v7 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  if (v5) {
    [v5 defaultCellBackgroundPropertiesForTableViewStyle:1 state:v7 traitCollection:v4];
  }
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v9, (uint64_t)v10);
  _UIBackgroundViewConfigurationApplyProperties(v6, (uint64_t)v9, v4);
  if (v6) {
    v6->_defaultStyle = 3;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)v10);

  return v6;
}

+ (id)defaultInsetGroupedListCellConfigurationForState:(unint64_t)a3
{
  v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UIBackgroundViewConfiguration defaultInsetGroupedListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (id)defaultInsetGroupedListCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  uint64_t v5 = self;
  v6 = +[_UIBackgroundViewConfiguration defaultGroupedListCellConfigurationForState:traitCollection:](v5, a2, v4);

  return v6;
}

+ (id)defaultInsetGroupedListHeaderFooterConfigurationForState:(unint64_t)a3
{
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v5 = +[_UIBackgroundViewConfiguration defaultInsetGroupedListHeaderFooterConfigurationForState:traitCollection:]((uint64_t)a1, v4);

  return v5;
}

+ (id)defaultInsetGroupedListHeaderFooterConfigurationForState:(uint64_t)a1 traitCollection:(void *)a2
{
  id v2 = a2;
  self;
  if ([v2 userInterfaceIdiom] == 6)
  {
    v3 = objc_alloc_init(_UIBackgroundViewConfiguration);
    id v4 = v3;
    if (v3) {
      v3->_defaultStyle = 8;
    }
  }
  else
  {
    id v4 = +[_UIBackgroundViewConfiguration defaultGroupedListHeaderFooterConfigurationForState:traitCollection:]();
  }

  return v4;
}

+ (_UIBackgroundViewConfiguration)defaultGroupedListHeaderFooterConfigurationForState:traitCollection:
{
  self;
  v0 = objc_alloc_init(_UIBackgroundViewConfiguration);
  if (v0) {
    v0->_defaultStyle = 4;
  }
  return v0;
}

+ (id)defaultGroupedListHeaderFooterConfigurationForState:(unint64_t)a3
{
  v3 = +[UITraitCollection _fallbackTraitCollection]();
  id v4 = +[_UIBackgroundViewConfiguration defaultGroupedListHeaderFooterConfigurationForState:traitCollection:]();

  return v4;
}

+ (id)defaultOutlineParentCellConfigurationForState:(unint64_t)a3
{
  uint64_t v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UIBackgroundViewConfiguration defaultOutlineRootParentCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (_UIBackgroundViewConfiguration)defaultOutlineRootParentCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  self;
  uint64_t v5 = objc_alloc_init(_UIBackgroundViewConfiguration);
  v6 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v7 = _UITableConstantsForTraitCollection(v4);
  v8 = v7;
  if (v7)
  {
    [v7 defaultSidebarHeaderBackgroundPropertiesWithState:v6 traitCollection:v4];
  }
  else
  {
    uint64_t v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
  }

  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v10, (uint64_t)&v11);
  _UIBackgroundViewConfigurationApplyProperties(v5, (uint64_t)v10, v4);
  if (v5) {
    v5->_defaultStyle = 6;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)&v11);

  return v5;
}

+ (id)defaultOutlineCellConfigurationForState:(unint64_t)a3
{
  uint64_t v5 = +[UITraitCollection _fallbackTraitCollection]();
  v6 = +[_UIBackgroundViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);

  return v6;
}

+ (_UIBackgroundViewConfiguration)defaultOutlineCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  self;
  uint64_t v5 = [v4 _splitViewControllerContext];
  v6 = objc_alloc_init(_UIBackgroundViewConfiguration);
  v7 = +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = _UITableConstantsForTraitCollection(v4);
  v9 = v8;
  if (v8)
  {
    if (v5 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    [v8 defaultSidebarCellBackgroundPropertiesForStyle:v10 state:v7 traitCollection:v4];
  }
  else
  {
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
  }

  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v12, (uint64_t)&v13);
  _UIBackgroundViewConfigurationApplyProperties(v6, (uint64_t)v12, v4);
  if (v6) {
    v6->_defaultStyle = 5;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)&v13);

  return v6;
}

- (id)updatedConfigurationForState:(unint64_t)a3
{
  return [(_UIBackgroundViewConfiguration *)self updatedConfigurationForState:a3 traitCollection:0];
}

- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_UIBackgroundViewConfiguration *)self copy];
  int64_t defaultStyle = self->_defaultStyle;
  if (defaultStyle)
  {
    id v9 = v6;
    uint64_t v10 = self;
    if (!v9)
    {
      +[UITraitCollection _fallbackTraitCollection]();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    switch(defaultStyle)
    {
      case 1:
        uint64_t v11 = +[_UIBackgroundViewConfiguration defaultPlainListCellConfigurationForState:traitCollection:](v10, a3, v9);
        goto LABEL_14;
      case 2:
        uint64_t v11 = +[_UIBackgroundViewConfiguration defaultPlainListHeaderFooterConfigurationForState:traitCollection:](v10, a3, v9);
        goto LABEL_14;
      case 3:
        uint64_t v11 = +[_UIBackgroundViewConfiguration defaultGroupedListCellConfigurationForState:traitCollection:](v10, a3, v9);
        goto LABEL_14;
      case 4:
        uint64_t v11 = +[_UIBackgroundViewConfiguration defaultGroupedListHeaderFooterConfigurationForState:traitCollection:]();
        goto LABEL_14;
      case 5:
        uint64_t v11 = +[_UIBackgroundViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:](v10, a3, v9);
        goto LABEL_14;
      case 6:
        uint64_t v11 = +[_UIBackgroundViewConfiguration defaultOutlineRootParentCellConfigurationForState:traitCollection:](v10, a3, v9);
        goto LABEL_14;
      case 7:
        uint64_t v11 = +[_UIBackgroundViewConfiguration defaultInsetGroupedListCellConfigurationForState:traitCollection:](v10, a3, v9);
        goto LABEL_14;
      case 8:
        uint64_t v11 = +[_UIBackgroundViewConfiguration defaultInsetGroupedListHeaderFooterConfigurationForState:traitCollection:](v10, v9);
LABEL_14:
        uint64_t v13 = v11;
        break;
      default:
        long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_traitCollection_, v10, @"_UIBackgroundViewConfiguration.m", 434, @"Unknown style: %ld", defaultStyle);

        uint64_t v13 = 0;
        break;
    }

    __int16 configurationFlags = (__int16)self->_configurationFlags;
    if (configurationFlags)
    {
      if ((configurationFlags & 2) != 0) {
        goto LABEL_19;
      }
    }
    else
    {
      if (v13) {
        long long v19 = *(void **)(v13 + 16);
      }
      else {
        long long v19 = 0;
      }
      -[UIBackgroundConfiguration _setCustomView:](v7, v19);
      __int16 configurationFlags = (__int16)self->_configurationFlags;
      if ((configurationFlags & 2) != 0)
      {
LABEL_19:
        if ((configurationFlags & 4) != 0) {
          goto LABEL_26;
        }
LABEL_23:
        if (v13)
        {
          long long v16 = *(_OWORD *)(v13 + 144);
          long long v17 = *(_OWORD *)(v13 + 160);
          if (!v7) {
            goto LABEL_26;
          }
        }
        else
        {
          long long v16 = 0uLL;
          long long v17 = 0uLL;
          if (!v7)
          {
LABEL_26:
            if ((configurationFlags & 8) != 0) {
              goto LABEL_30;
            }
            if (v13)
            {
              uint64_t v20 = *(void *)(v13 + 32);
              if (!v7) {
                goto LABEL_30;
              }
            }
            else
            {
              uint64_t v20 = 0;
              if (!v7)
              {
LABEL_30:
                if ((configurationFlags & 0x10) == 0)
                {
                  if (v13)
                  {
                    if (v7)
                    {
                      uint64_t v21 = *(void *)(v13 + 40);
                      *(void *)(v7 + 40) = v21;
                      if (v21)
                      {
                        v22 = *(void **)(v7 + 48);
                        *(void *)(v7 + 48) = 0;
                      }
                    }
                    v23 = *(void **)(v13 + 48);
                  }
                  else
                  {
                    v23 = 0;
                    if (v7) {
                      *(void *)(v7 + 40) = 0;
                    }
                  }
                  -[_UIBackgroundViewConfiguration _setBackgroundColor:](v7, v23);
                  __int16 configurationFlags = (__int16)self->_configurationFlags;
                }
                if ((configurationFlags & 0x20) == 0)
                {
                  if (v13)
                  {
                    long long v15 = *(void **)(v13 + 56);
                    if (!v7) {
                      goto LABEL_41;
                    }
                    goto LABEL_40;
                  }
                  long long v15 = 0;
                  if (v7)
                  {
LABEL_40:
                    objc_setProperty_nonatomic_copy((id)v7, v14, v15, 56);
                    __int16 configurationFlags = (__int16)self->_configurationFlags;
                  }
                }
LABEL_41:
                if ((configurationFlags & 0x40) != 0) {
                  goto LABEL_48;
                }
                if (v13)
                {
                  uint64_t v24 = *(void *)(v13 + 64);
                  if (!v7)
                  {
LABEL_45:
                    if (v13) {
                      v25 = *(void **)(v13 + 72);
                    }
                    else {
                      v25 = 0;
                    }
                    -[UIBackgroundConfiguration _setImage:](v7, v25);
                    __int16 configurationFlags = (__int16)self->_configurationFlags;
LABEL_48:
                    if ((configurationFlags & 0x80) != 0) {
                      goto LABEL_52;
                    }
                    if (v13)
                    {
                      *(void *)&long long v16 = *(void *)(v13 + 80);
                      if (!v7) {
                        goto LABEL_52;
                      }
                    }
                    else
                    {
                      *(void *)&long long v16 = 0;
                      if (!v7)
                      {
LABEL_52:
                        if ((configurationFlags & 0x100) != 0) {
                          goto LABEL_56;
                        }
                        if (v13)
                        {
                          *(void *)&long long v16 = *(void *)(v13 + 88);
                          if (!v7) {
                            goto LABEL_56;
                          }
                        }
                        else
                        {
                          *(void *)&long long v16 = 0;
                          if (!v7)
                          {
LABEL_56:
                            objc_msgSend((id)v7, "__setMaskedCorners:", objc_msgSend((id)v13, "__maskedCorners", v15, *(double *)&v16, *(double *)&v17));
                            v26 = objc_msgSend((id)v13, "__visualEffectGroupName");
                            objc_msgSend((id)v7, "__setVisualEffectGroupName:", v26);

                            objc_msgSend((id)v7, "__setVisualEffectblurClippingMode:", objc_msgSend((id)v13, "__visualEffectblurClippingMode"));
                            objc_msgSend((id)v7, "_setStrokeLocation:", objc_msgSend((id)v13, "_strokeLocation"));
                            v27 = [(id)v7 _shadowProperties];
                            if (v27)
                            {
                            }
                            else
                            {
                              v28 = [(id)v13 _shadowProperties];

                              if (!v28)
                              {
LABEL_60:

                                goto LABEL_61;
                              }
                            }
                            v29 = -[_UIBackgroundViewConfiguration shadowProperties]((void *)v7);
                            v30 = -[_UIBackgroundViewConfiguration shadowProperties]((void *)v13);
                            [v29 _applyPropertiesFromDefaultProperties:v30];

                            goto LABEL_60;
                          }
                        }
                        *(void *)(v7 + 88) = v16;
                        goto LABEL_56;
                      }
                    }
                    *(void *)(v7 + 80) = v16;
                    __int16 configurationFlags = (__int16)self->_configurationFlags;
                    goto LABEL_52;
                  }
                }
                else
                {
                  uint64_t v24 = 0;
                  if (!v7) {
                    goto LABEL_45;
                  }
                }
                *(void *)(v7 + 64) = v24;
                goto LABEL_45;
              }
            }
            *(void *)(v7 + 32) = v20;
            __int16 configurationFlags = (__int16)self->_configurationFlags;
            goto LABEL_30;
          }
        }
        *(_OWORD *)(v7 + 144) = v16;
        *(_OWORD *)(v7 + 160) = v17;
        __int16 configurationFlags = (__int16)self->_configurationFlags;
        goto LABEL_26;
      }
    }
    [(id)v13 _cornerRadius];
    objc_msgSend((id)v7, "_setCornerRadius:");
    __int16 configurationFlags = (__int16)self->_configurationFlags;
    if ((configurationFlags & 4) != 0) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
LABEL_61:

  return (id)v7;
}

- (void)_setBackgroundColor:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    objc_storeStrong((id *)(a1 + 48), a2);
    id v4 = v5;
    if (v5) {
      *(void *)(a1 + 40) = 0;
    }
  }
}

- (void)shadowProperties
{
  if (a1)
  {
    id v2 = a1;
    v3 = (void *)a1[12];
    if (!v3)
    {
      id v4 = objc_alloc_init(UIShadowProperties);
      id v5 = (void *)v2[12];
      v2[12] = v4;

      v3 = (void *)v2[12];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (_UIBackgroundViewConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIBackgroundViewConfiguration;
  result = [(_UIBackgroundViewConfiguration *)&v3 init];
  if (result)
  {
    result->_strokeLocation = 0;
    result->_maskedCorners = 15;
    result->_int64_t defaultStyle = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBackgroundViewConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)_UIBackgroundViewConfiguration;
  id v5 = [(_UIBackgroundViewConfiguration *)&v47 init];
  if (v5)
  {
    if (([v4 requiresSecureCoding] & 1) == 0)
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customView"];
      customView = v5->_customView;
      v5->_customView = (UIView *)v6;
    }
    [v4 decodeDoubleForKey:@"cornerRadius"];
    v5->_cornerRadius = v8;
    v5->_maskedCorners = [v4 decodeIntegerForKey:@"maskedCorners"];
    v5->_backgroundColorMode = [v4 decodeIntegerForKey:@"backgroundColorMode"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visualEffect"];
    visualEffect = v5->_visualEffect;
    v5->_visualEffect = (UIVisualEffect *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visualEffectGroupName"];
    visualEffectGroupName = v5->_visualEffectGroupName;
    v5->_visualEffectGroupName = (NSString *)v13;

    if ([v4 containsValueForKey:@"visualEffectblurClippingMode"]) {
      uint64_t v15 = [v4 decodeIntegerForKey:@"visualEffectblurClippingMode"];
    }
    else {
      uint64_t v15 = [v4 decodeBoolForKey:@"visualEffectAllowsTransparentBlurring"];
    }
    v5->_visualEffectblurClippingMode = v15;
    [v4 decodeDirectionalEdgeInsetsForKey:@"backgroundInsets"];
    v5->_backgroundInsets.top = v16;
    v5->_backgroundInsets.leading = v17;
    v5->_backgroundInsets.bottom = v18;
    v5->_backgroundInsets.trailing = v19;
    v5->_edgesAddingLayoutMarginsToBackgroundInsets = [v4 decodeIntegerForKey:@"edgesAddingLayoutMarginsToBackgroundInsets"];
    v5->_strokeColorMode = [v4 decodeIntegerForKey:@"strokeColorMode"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"strokeColor"];
    strokeColor = v5->_strokeColor;
    v5->_strokeColor = (UIColor *)v20;

    [v4 decodeDoubleForKey:@"strokeWidth"];
    v5->_strokeWidth = v22;
    [v4 decodeDoubleForKey:@"strokeOutset"];
    v5->_strokeOutset = v23;
    v5->_strokeLocation = [v4 decodeIntegerForKey:@"strokeLocation"];
    if ([v4 containsValueForKey:@"shadowProperties"])
    {
      uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shadowProperties"];
      shadowProperties = v5->_shadowProperties;
      v5->_shadowProperties = (UIShadowProperties *)v24;
    }
    else
    {
      uint64_t v26 = [v4 decodeIntegerForKey:@"shadowType"];
      shadowProperties = +[UITraitCollection _fallbackTraitCollection]();
      uint64_t v27 = _UIShadowPropertiesFromShadowType(v26, shadowProperties);
      v28 = v5->_shadowProperties;
      v5->_shadowProperties = (UIShadowProperties *)v27;
    }
    v5->_int64_t defaultStyle = [v4 decodeIntegerForKey:@"defaultStyle"];
    v29 = [NSString stringWithFormat:@"hasCustomized-%@", @"customView"];
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFE | [v4 decodeBoolForKey:v29];

    v30 = [NSString stringWithFormat:@"hasCustomized-%@", @"cornerRadius"];
    if ([v4 decodeBoolForKey:v30]) {
      __int16 v31 = 2;
    }
    else {
      __int16 v31 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFD | v31;

    v32 = [NSString stringWithFormat:@"hasCustomized-%@", @"backgroundInsets"];
    if ([v4 decodeBoolForKey:v32]) {
      __int16 v33 = 4;
    }
    else {
      __int16 v33 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFB | v33;

    v34 = [NSString stringWithFormat:@"hasCustomized-%@", @"edgesAddingLayoutMarginsToBackgroundInsets"];
    if ([v4 decodeBoolForKey:v34]) {
      __int16 v35 = 8;
    }
    else {
      __int16 v35 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFF7 | v35;

    v36 = [NSString stringWithFormat:@"hasCustomized-%@", @"backgroundColor"];
    if ([v4 decodeBoolForKey:v36]) {
      __int16 v37 = 16;
    }
    else {
      __int16 v37 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFEF | v37;

    v38 = [NSString stringWithFormat:@"hasCustomized-%@", @"visualEffect"];
    if ([v4 decodeBoolForKey:v38]) {
      __int16 v39 = 32;
    }
    else {
      __int16 v39 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFDF | v39;

    v40 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeColor"];
    if ([v4 decodeBoolForKey:v40]) {
      __int16 v41 = 64;
    }
    else {
      __int16 v41 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFBF | v41;

    v42 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeWidth"];
    if ([v4 decodeBoolForKey:v42]) {
      __int16 v43 = 128;
    }
    else {
      __int16 v43 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFF7F | v43;

    v44 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeOutset"];
    if ([v4 decodeBoolForKey:v44]) {
      __int16 v45 = 256;
    }
    else {
      __int16 v45 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFEFF | v45;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v23 = a3;
  if (([v23 requiresSecureCoding] & 1) == 0) {
    [v23 encodeObject:self->_customView forKey:@"customView"];
  }
  [v23 encodeDouble:@"cornerRadius" forKey:self->_cornerRadius];
  [v23 encodeInteger:self->_maskedCorners forKey:@"maskedCorners"];
  [v23 encodeInteger:self->_backgroundColorMode forKey:@"backgroundColorMode"];
  [v23 encodeObject:self->_backgroundColor forKey:@"backgroundColor"];
  [v23 encodeObject:self->_visualEffect forKey:@"visualEffect"];
  [v23 encodeObject:self->_visualEffectGroupName forKey:@"visualEffectGroupName"];
  [v23 encodeInteger:self->_visualEffectblurClippingMode forKey:@"visualEffectblurClippingMode"];
  objc_msgSend(v23, "encodeDirectionalEdgeInsets:forKey:", @"backgroundInsets", self->_backgroundInsets.top, self->_backgroundInsets.leading, self->_backgroundInsets.bottom, self->_backgroundInsets.trailing);
  [v23 encodeInteger:self->_edgesAddingLayoutMarginsToBackgroundInsets forKey:@"edgesAddingLayoutMarginsToBackgroundInsets"];
  [v23 encodeInteger:self->_strokeColorMode forKey:@"strokeColorMode"];
  [v23 encodeObject:self->_strokeColor forKey:@"strokeColor"];
  [v23 encodeDouble:@"strokeWidth" forKey:self->_strokeWidth];
  [v23 encodeDouble:@"strokeOutset" forKey:self->_strokeOutset];
  [v23 encodeInteger:self->_strokeLocation forKey:@"strokeLocation"];
  shadowProperties = self->_shadowProperties;
  if (shadowProperties)
  {
    objc_msgSend(v23, "encodeInteger:forKey:", -[UIShadowProperties _backgroundConfigurationShadowType](shadowProperties, "_backgroundConfigurationShadowType"), @"shadowType");
    [v23 encodeObject:self->_shadowProperties forKey:@"shadowProperties"];
  }
  [v23 encodeInteger:self->_defaultStyle forKey:@"defaultStyle"];
  uint64_t v5 = *(_WORD *)&self->_configurationFlags & 1;
  uint64_t v6 = [NSString stringWithFormat:@"hasCustomized-%@", @"customView"];
  [v23 encodeBool:v5 forKey:v6];

  uint64_t v7 = (*(_WORD *)&self->_configurationFlags >> 1) & 1;
  double v8 = [NSString stringWithFormat:@"hasCustomized-%@", @"cornerRadius"];
  [v23 encodeBool:v7 forKey:v8];

  uint64_t v9 = (*(_WORD *)&self->_configurationFlags >> 2) & 1;
  uint64_t v10 = [NSString stringWithFormat:@"hasCustomized-%@", @"backgroundInsets"];
  [v23 encodeBool:v9 forKey:v10];

  uint64_t v11 = (*(_WORD *)&self->_configurationFlags >> 3) & 1;
  long long v12 = [NSString stringWithFormat:@"hasCustomized-%@", @"edgesAddingLayoutMarginsToBackgroundInsets"];
  [v23 encodeBool:v11 forKey:v12];

  uint64_t v13 = (*(_WORD *)&self->_configurationFlags >> 4) & 1;
  long long v14 = [NSString stringWithFormat:@"hasCustomized-%@", @"backgroundColor"];
  [v23 encodeBool:v13 forKey:v14];

  uint64_t v15 = (*(_WORD *)&self->_configurationFlags >> 5) & 1;
  CGFloat v16 = [NSString stringWithFormat:@"hasCustomized-%@", @"visualEffect"];
  [v23 encodeBool:v15 forKey:v16];

  uint64_t v17 = (*(_WORD *)&self->_configurationFlags >> 6) & 1;
  CGFloat v18 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeColor"];
  [v23 encodeBool:v17 forKey:v18];

  uint64_t v19 = (*(_WORD *)&self->_configurationFlags >> 7) & 1;
  uint64_t v20 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeWidth"];
  [v23 encodeBool:v19 forKey:v20];

  uint64_t v21 = HIBYTE(*(_WORD *)&self->_configurationFlags) & 1;
  double v22 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeOutset"];
  [v23 encodeBool:v21 forKey:v22];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)(v5 + 16), self->_customView);
    *(double *)(v6 + 24) = self->_cornerRadius;
    *(void *)(v6 + 120) = self->_maskedCorners;
    *(void *)(v6 + 40) = self->_backgroundColorMode;
    objc_storeStrong((id *)(v6 + 48), self->_backgroundColor);
    uint64_t v7 = [(UIVisualEffect *)self->_visualEffect copy];
    double v8 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v7;

    uint64_t v9 = [(NSString *)self->_visualEffectGroupName copy];
    uint64_t v10 = *(void **)(v6 + 128);
    *(void *)(v6 + 128) = v9;

    *(void *)(v6 + 136) = self->_visualEffectblurClippingMode;
    long long v11 = *(_OWORD *)&self->_backgroundInsets.bottom;
    *(_OWORD *)(v6 + 144) = *(_OWORD *)&self->_backgroundInsets.top;
    *(_OWORD *)(v6 + 160) = v11;
    *(void *)(v6 + 32) = self->_edgesAddingLayoutMarginsToBackgroundInsets;
    *(void *)(v6 + 64) = self->_strokeColorMode;
    objc_storeStrong((id *)(v6 + 72), self->_strokeColor);
    *(double *)(v6 + 80) = self->_strokeWidth;
    *(double *)(v6 + 88) = self->_strokeOutset;
    *(void *)(v6 + 112) = self->_strokeLocation;
    id v12 = [(UIShadowProperties *)self->_shadowProperties copyWithZone:a3];
    uint64_t v13 = *(void **)(v6 + 96);
    *(void *)(v6 + 96) = v12;

    *(void *)(v6 + 104) = self->_defaultStyle;
    *($343470A21C251F9819AE9B93F46C3241 *)(v6 + 8) = self->_configurationFlags;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIBackgroundViewConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = v6;
    BOOL v8 = self->_defaultStyle == v6->_defaultStyle
      && self->_customView == v6->_customView
      && self->_cornerRadius == v6->_cornerRadius
      && self->_maskedCorners == v6->_maskedCorners
      && self->_strokeLocation == v6->_strokeLocation
      && self->_backgroundColorMode == v6->_backgroundColorMode
      && self->_backgroundColor == v6->_backgroundColor
      && UIEqual(self->_visualEffect, v6->_visualEffect)
      && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_backgroundInsets.top, *(float64x2_t *)&v7->_backgroundInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_backgroundInsets.bottom, *(float64x2_t *)&v7->_backgroundInsets.bottom))), 0xFuLL))) & 1) != 0&& self->_edgesAddingLayoutMarginsToBackgroundInsets == v7->_edgesAddingLayoutMarginsToBackgroundInsets&& self->_strokeColorMode == v7->_strokeColorMode&& self->_strokeColor == v7->_strokeColor&& self->_strokeWidth == v7->_strokeWidth&& self->_strokeOutset == v7->_strokeOutset&& UIEqual(self->_shadowProperties, v7->_shadowProperties)&& UIEqual(self->_visualEffectGroupName, v7->_visualEffectGroupName)&& self->_visualEffectblurClippingMode == v7->_visualEffectblurClippingMode;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(UIView *)self->_customView hash];
  unint64_t cornerRadius = (unint64_t)self->_cornerRadius;
  int64_t v5 = v3 ^ self->_backgroundColorMode;
  unint64_t v6 = v5 ^ [(UIColor *)self->_backgroundColor hash];
  uint64_t v7 = v6 ^ [(UIVisualEffect *)self->_visualEffect hash] ^ self->_strokeColorMode;
  return v7 ^ [(UIColor *)self->_strokeColor hash] ^ cornerRadius ^ (unint64_t)self->_strokeWidth;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = NSString;
  unint64_t defaultStyle = self->_defaultStyle;
  if (defaultStyle >= 9)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v8 = [NSString stringWithUTF8String:"NSString *_UIBackgroundViewConfigurationStyleToString(_UIBackgroundViewConfigurationStyle)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"_UIBackgroundViewConfiguration.m", 54, @"Unknown style: %ld", defaultStyle);

    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = off_1E5304F88[defaultStyle];
  }
  uint64_t v9 = [v4 stringWithFormat:@"Base Style = %@", v6];
  [v3 addObject:v9];

  if (self->_cornerRadius > 0.0)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"cornerRadius = %g", *(void *)&self->_cornerRadius);
    [v3 addObject:v10];
  }
  CGFloat top = self->_backgroundInsets.top;
  double leading = self->_backgroundInsets.leading;
  double bottom = self->_backgroundInsets.bottom;
  double trailing = self->_backgroundInsets.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    uint64_t v15 = NSString;
    CGFloat v16 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
    uint64_t v17 = [v15 stringWithFormat:@"backgroundInsets = %@", v16];
    [v3 addObject:v17];
  }
  unint64_t edgesAddingLayoutMarginsToBackgroundInsets = self->_edgesAddingLayoutMarginsToBackgroundInsets;
  if (edgesAddingLayoutMarginsToBackgroundInsets)
  {
    uint64_t v19 = NSString;
    if (edgesAddingLayoutMarginsToBackgroundInsets == 15)
    {
      uint64_t v20 = @"All";
LABEL_20:
      v25 = [v19 stringWithFormat:@"unint64_t edgesAddingLayoutMarginsToBackgroundInsets = %@", v20];
      [v3 addObject:v25];

      goto LABEL_21;
    }
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v22 = v21;
    if (edgesAddingLayoutMarginsToBackgroundInsets)
    {
      [v21 addObject:@"Top"];
      if ((edgesAddingLayoutMarginsToBackgroundInsets & 2) == 0)
      {
LABEL_16:
        if ((edgesAddingLayoutMarginsToBackgroundInsets & 4) == 0) {
          goto LABEL_17;
        }
        goto LABEL_46;
      }
    }
    else if ((edgesAddingLayoutMarginsToBackgroundInsets & 2) == 0)
    {
      goto LABEL_16;
    }
    [v22 addObject:@"Leading"];
    if ((edgesAddingLayoutMarginsToBackgroundInsets & 4) == 0)
    {
LABEL_17:
      if ((edgesAddingLayoutMarginsToBackgroundInsets & 8) == 0)
      {
LABEL_19:
        id v23 = NSString;
        uint64_t v24 = [v22 componentsJoinedByString:@", "];
        uint64_t v20 = [v23 stringWithFormat:@"[%@]", v24];

        goto LABEL_20;
      }
LABEL_18:
      [v22 addObject:@"Trailing"];
      goto LABEL_19;
    }
LABEL_46:
    [v22 addObject:@"Bottom"];
    if ((edgesAddingLayoutMarginsToBackgroundInsets & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_21:
  if ([(_UIBackgroundViewConfiguration *)self _hasBackgroundColor])
  {
    int64_t backgroundColorMode = self->_backgroundColorMode;
    uint64_t v27 = NSString;
    if (backgroundColorMode)
    {
      v28 = _stringForColorMode(backgroundColorMode);
      v29 = [v27 stringWithFormat:@"int64_t backgroundColorMode = %@", v28];
      [v3 addObject:v29];
    }
    else
    {
      v28 = [NSString stringWithFormat:@"backgroundColor = %@", self->_backgroundColor];
      [v3 addObject:v28];
    }
  }
  if (self->_visualEffect)
  {
    v30 = [NSString stringWithFormat:@"visualEffect = %@", self->_visualEffect];
    [v3 addObject:v30];
  }
  if ([(_UIBackgroundViewConfiguration *)self _hasStroke])
  {
    int64_t strokeColorMode = self->_strokeColorMode;
    v32 = NSString;
    if (strokeColorMode)
    {
      __int16 v33 = _stringForColorMode(strokeColorMode);
      v34 = [v32 stringWithFormat:@"int64_t strokeColorMode = %@", v33];
      [v3 addObject:v34];
    }
    else
    {
      __int16 v33 = [NSString stringWithFormat:@"strokeColor = %@", self->_strokeColor];
      [v3 addObject:v33];
    }

    __int16 v35 = objc_msgSend(NSString, "stringWithFormat:", @"strokeWidth = %g", *(void *)&self->_strokeWidth);
    [v3 addObject:v35];

    if (self->_strokeOutset > 0.0)
    {
      v36 = objc_msgSend(NSString, "stringWithFormat:", @"strokeOutset = %g", *(void *)&self->_strokeOutset);
      [v3 addObject:v36];
    }
  }
  if (self->_shadowProperties)
  {
    __int16 v37 = [NSString stringWithFormat:@"shadowProperties = %@", self->_shadowProperties];
    [v3 addObject:v37];
  }
  if (self->_customView)
  {
    v38 = [NSString stringWithFormat:@"customView = %@", self->_customView];
    [v3 addObject:v38];
  }
  if ([v3 count])
  {
    __int16 v39 = [v3 componentsJoinedByString:@"; "];
  }
  else
  {
    __int16 v39 = @"empty configuration";
  }
  v40 = NSString;
  __int16 v41 = (objc_class *)objc_opt_class();
  v42 = NSStringFromClass(v41);
  __int16 v43 = [v40 stringWithFormat:@"<%@: %p; %@>", v42, self, v39];

  return (NSString *)v43;
}

- (BOOL)_hasBackgroundColor
{
  return self->_backgroundColorMode || self->_backgroundColor != 0;
}

- (BOOL)_hasStroke
{
  if (self->_strokeWidth <= 0.0) {
    return 0;
  }
  if (self->_strokeColorMode) {
    return 1;
  }
  return self->_strokeColor != 0;
}

- (BOOL)_hasBackgroundFill
{
  return [(_UIBackgroundViewConfiguration *)self _hasBackgroundColor]
      || self->_visualEffect
      || self->_customView != 0;
}

- (BOOL)_backgroundFillIsEqual:(id)a3 withTintColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    customView = self->_customView;
    uint64_t v9 = [v6 customView];
    if (customView != v9)
    {
LABEL_20:

LABEL_21:
      LOBYTE(v18) = 0;
      goto LABEL_22;
    }
    uint64_t v10 = [(_UIBackgroundViewConfiguration *)self resolvedBackgroundColorForTintColor:v7];
    long long v11 = [v6 resolvedBackgroundColorForTintColor:v7];
    id v12 = v10;
    uint64_t v13 = v11;
    long long v14 = v13;
    if (v12 == v13)
    {
    }
    else
    {
      uint64_t v15 = v13;
      CGFloat v16 = v12;
      if (!v12) {
        goto LABEL_18;
      }
      uint64_t v15 = v13;
      CGFloat v16 = v12;
      if (!v13) {
        goto LABEL_18;
      }
      int v17 = [(UIVisualEffect *)v12 isEqual:v13];

      if (!v17) {
        goto LABEL_19;
      }
    }
    visualEffect = self->_visualEffect;
    uint64_t v20 = [v6 visualEffect];
    uint64_t v15 = visualEffect;
    id v21 = v20;
    if (v15 == v21)
    {

LABEL_16:
      LOBYTE(v18) = 1;
      goto LABEL_22;
    }
    CGFloat v16 = v21;
    if (v15 && v21)
    {
      char v22 = [(UIVisualEffect *)v15 isEqual:v21];

      if ((v22 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }

LABEL_18:
LABEL_19:

    uint64_t v9 = customView;
    goto LABEL_20;
  }
  BOOL v18 = ![(_UIBackgroundViewConfiguration *)self _hasBackgroundFill];
LABEL_22:

  return v18;
}

- (void)setCustomView:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  id v9 = v5;
  if (v5)
  {
    char v7 = [v5 translatesAutoresizingMaskIntoConstraints];
    id v6 = v9;
    if ((v7 & 1) == 0)
    {
      BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"_UIBackgroundViewConfiguration.m", 767, @"Custom view must have translatesAutoresizingMaskIntoConstraints enabled, even if auto layout constraints are used inside it. Custom view: %@", v9 object file lineNumber description];

      id v6 = v9;
    }
  }
  *(_WORD *)&self->_configurationFlags |= 1u;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)self, v6);
}

- (UIView)customView
{
  return self->_customView;
}

- (void)setCornerRadius:(double)a3
{
  *(_WORD *)&self->_configurationFlags |= 2u;
  [(_UIBackgroundViewConfiguration *)self _setCornerRadius:a3];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setBackgroundInsets:(NSDirectionalEdgeInsets)a3
{
  *(_WORD *)&self->_configurationFlags |= 4u;
  self->_backgroundInsets = a3;
}

- (NSDirectionalEdgeInsets)backgroundInsets
{
  double top = self->_backgroundInsets.top;
  double leading = self->_backgroundInsets.leading;
  double bottom = self->_backgroundInsets.bottom;
  double trailing = self->_backgroundInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setEdgesAddingLayoutMarginsToBackgroundInsets:(unint64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 8u;
  self->_unint64_t edgesAddingLayoutMarginsToBackgroundInsets = a3;
}

- (unint64_t)edgesAddingLayoutMarginsToBackgroundInsets
{
  return self->_edgesAddingLayoutMarginsToBackgroundInsets;
}

- (void)setBackgroundColorMode:(int64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x10u;
  self->_int64_t backgroundColorMode = a3;
  if (a3)
  {
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = 0;
  }
}

- (int64_t)backgroundColorMode
{
  return self->_backgroundColorMode;
}

- (void)setBackgroundColor:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x10u;
  -[_UIBackgroundViewConfiguration _setBackgroundColor:]((uint64_t)self, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setVisualEffect:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x20u;
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (void)setStrokeColorMode:(int64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x40u;
  self->_int64_t strokeColorMode = a3;
  if (a3)
  {
    strokeColor = self->_strokeColor;
    self->_strokeColor = 0;
  }
}

- (int64_t)strokeColorMode
{
  return self->_strokeColorMode;
}

- (void)setStrokeColor:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x40u;
  -[UIBackgroundConfiguration _setImage:]((uint64_t)self, a3);
  if (a3) {
    self->_int64_t strokeColorMode = 0;
  }
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeWidth:(double)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x80u;
  self->_strokeWidth = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeOutset:(double)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x100u;
  self->_strokeOutset = a3;
}

- (double)strokeOutset
{
  return self->_strokeOutset;
}

- (id)_updatedConfigurationForState:(id)a3
{
  id v4 = a3;
  id v5 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, v4);
  uint64_t v6 = [v5 _viewConfigurationState];

  char v7 = [v4 traitCollection];

  BOOL v8 = [(_UIBackgroundViewConfiguration *)self updatedConfigurationForState:v6 traitCollection:v7];

  return v8;
}

- (id)resolvedBackgroundColorForTintColor:(id)a3
{
  id v4 = (UIColor *)a3;
  backgroundColor = v4;
  if (!self->_backgroundColorMode) {
    backgroundColor = self->_backgroundColor;
  }
  uint64_t v6 = backgroundColor;
  unint64_t v7 = self->_backgroundColorMode - 2;
  if (v7 > 9) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = qword_186B9C288[v7];
  }
  uint64_t v9 = _UIConfigurationColorTransformerForIdentifier(v8);
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, UIColor *))(v9 + 16))(v9, v6);
    long long v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v11 = v6;
  }
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = v11;
  }
  else
  {
    uint64_t v13 = +[UIColor clearColor];
  }
  long long v14 = v13;

  return v14;
}

- (BOOL)isTintBackgroundColor
{
  return self->_backgroundColorMode != 0;
}

- (id)resolvedStrokeColorForTintColor:(id)a3
{
  id v4 = (UIColor *)a3;
  strokeColor = v4;
  if (!self->_strokeColorMode) {
    strokeColor = self->_strokeColor;
  }
  uint64_t v6 = strokeColor;
  unint64_t v7 = self->_strokeColorMode - 2;
  if (v7 > 9) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = qword_186B9C288[v7];
  }
  uint64_t v9 = _UIConfigurationColorTransformerForIdentifier(v8);
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, UIColor *))(v9 + 16))(v9, v6);
    long long v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v11 = v6;
  }
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = v11;
  }
  else
  {
    uint64_t v13 = +[UIColor clearColor];
  }
  long long v14 = v13;

  return v14;
}

- (UIImage)image
{
  return 0;
}

- (int64_t)imageContentMode
{
  return 0;
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setCornerRadius:(double)a3
{
  self->_unint64_t cornerRadius = a3;
}

- (UIShadowProperties)_shadowProperties
{
  return self->_shadowProperties;
}

- (void)_setShadowProperties:(id)a3
{
}

- (int64_t)_strokeLocation
{
  return self->_strokeLocation;
}

- (void)_setStrokeLocation:(int64_t)a3
{
  self->_strokeLocation = a3;
}

- (unint64_t)__maskedCorners
{
  return self->_maskedCorners;
}

- (void)__setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (NSString)__visualEffectGroupName
{
  return self->_visualEffectGroupName;
}

- (void)__setVisualEffectGroupName:(id)a3
{
}

- (unint64_t)__visualEffectblurClippingMode
{
  return self->_visualEffectblurClippingMode;
}

- (void)__setVisualEffectblurClippingMode:(unint64_t)a3
{
  self->_visualEffectblurClippingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectGroupName, 0);
  objc_storeStrong((id *)&self->_shadowProperties, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_customView, 0);
}

@end