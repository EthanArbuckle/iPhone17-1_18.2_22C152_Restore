@interface UIBackgroundConfiguration
+ (BOOL)supportsSecureCoding;
+ (UIBackgroundConfiguration)clearConfiguration;
+ (UIBackgroundConfiguration)listAccompaniedSidebarCellConfiguration;
+ (UIBackgroundConfiguration)listGroupedCellConfiguration;
+ (UIBackgroundConfiguration)listGroupedHeaderFooterConfiguration;
+ (UIBackgroundConfiguration)listPlainCellConfiguration;
+ (UIBackgroundConfiguration)listPlainHeaderFooterConfiguration;
+ (UIBackgroundConfiguration)listSidebarCellConfiguration;
+ (UIBackgroundConfiguration)listSidebarHeaderConfiguration;
+ (id)_defaultListInsetGroupedCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)_defaultListInsetGroupedHeaderFooterConfigurationForState:(void *)a3 traitCollection:;
+ (id)_listInsetGroupedCellConfiguration;
+ (id)_listInsetGroupedHeaderFooterConfiguration;
+ (id)_sidebarPlainCellConfiguration;
+ (id)listCellConfiguration;
+ (id)listFooterConfiguration;
+ (id)listHeaderConfiguration;
+ (void)_defaultListGroupedCellConfigurationForState:(void *)a3 traitCollection:;
+ (void)_defaultListGroupedHeaderFooterConfigurationForState:(void *)a3 traitCollection:;
+ (void)_defaultListPlainCellConfigurationForState:(void *)a3 traitCollection:;
+ (void)_defaultListPlainHeaderFooterConfigurationForState:(void *)a3 traitCollection:;
+ (void)_defaultListSidebarCellConfigurationForState:(void *)a3 traitCollection:(int)a4 isAccompanied:;
+ (void)_defaultListSidebarHeaderConfigurationForState:(void *)a3 traitCollection:;
+ (void)_defaultListSidebarPlainCellConfigurationForState:(void *)a3 traitCollection:;
- (BOOL)_backgroundFillIsEqual:(id)a3 withTintColor:(id)a4;
- (BOOL)_hasBackgroundColor;
- (BOOL)_hasBackgroundFill;
- (BOOL)_hasStroke;
- (BOOL)_isEqualToInternalConfigurationQuick:(id)a3;
- (BOOL)_visualEffectAllowsTransparentBlurring;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTintBackgroundColor;
- (CGFloat)cornerRadius;
- (CGFloat)strokeOutset;
- (CGFloat)strokeWidth;
- (NSDirectionalEdgeInsets)backgroundInsets;
- (NSDirectionalRectEdge)edgesAddingLayoutMarginsToBackgroundInsets;
- (NSString)__visualEffectGroupName;
- (NSString)_visualEffectGroupName;
- (NSString)description;
- (UIBackgroundConfiguration)initWithCoder:(id)a3;
- (UIBackgroundConfiguration)updatedConfigurationForState:(id)state;
- (UIColor)backgroundColor;
- (UIColor)resolvedBackgroundColorForTintColor:(UIColor *)tintColor;
- (UIColor)resolvedStrokeColorForTintColor:(UIColor *)tintColor;
- (UIColor)strokeColor;
- (UIConfigurationColorTransformer)backgroundColorTransformer;
- (UIConfigurationColorTransformer)strokeColorTransformer;
- (UIImage)image;
- (UIShadowProperties)_shadowProperties;
- (UIShadowProperties)shadowProperties;
- (UIView)customView;
- (UIViewContentMode)imageContentMode;
- (UIVisualEffect)visualEffect;
- (double)_cornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_strokeLocation;
- (uint64_t)_isEqualToConfiguration:(uint64_t)a1;
- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1;
- (unint64_t)__maskedCorners;
- (unint64_t)__visualEffectblurClippingMode;
- (unint64_t)_maskedCorners;
- (unint64_t)_visualEffectblurClippingMode;
- (unint64_t)hash;
- (void)__setMaskedCorners:(unint64_t)a3;
- (void)__setVisualEffectGroupName:(id)a3;
- (void)__setVisualEffectblurClippingMode:(unint64_t)a3;
- (void)_init;
- (void)_setBackgroundColor:(uint64_t)a1;
- (void)_setBackgroundColorTransformer:(uint64_t)a1;
- (void)_setBackgroundColorTransformerIdentifier:(uint64_t)a1;
- (void)_setCornerRadius:(double)a3;
- (void)_setCustomView:(uint64_t)a1;
- (void)_setImage:(uint64_t)a1;
- (void)_setMaskedCorners:(unint64_t)a3;
- (void)_setShadowProperties:(id)a3;
- (void)_setStrokeColor:(uint64_t)a1;
- (void)_setStrokeColorTransformer:(uint64_t)a1;
- (void)_setStrokeLocation:(int64_t)a3;
- (void)_setVisualEffectAllowsTransparentBlurring:(BOOL)a3;
- (void)_setVisualEffectGroupName:(id)a3;
- (void)_setVisualEffectblurClippingMode:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setBackgroundColorTransformer:(UIConfigurationColorTransformer)backgroundColorTransformer;
- (void)setBackgroundInsets:(NSDirectionalEdgeInsets)backgroundInsets;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setCustomView:(UIView *)customView;
- (void)setEdgesAddingLayoutMarginsToBackgroundInsets:(NSDirectionalRectEdge)edgesAddingLayoutMarginsToBackgroundInsets;
- (void)setImage:(UIImage *)image;
- (void)setImageContentMode:(UIViewContentMode)imageContentMode;
- (void)setStrokeColor:(UIColor *)strokeColor;
- (void)setStrokeColorTransformer:(UIConfigurationColorTransformer)strokeColorTransformer;
- (void)setStrokeOutset:(CGFloat)strokeOutset;
- (void)setStrokeWidth:(CGFloat)strokeWidth;
- (void)setVisualEffect:(UIVisualEffect *)visualEffect;
@end

@implementation UIBackgroundConfiguration

- (void)_setCustomView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)_init
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)UIBackgroundConfiguration;
  v1 = objc_msgSendSuper2(&v8, sel_init);
  v2 = v1;
  if (v1)
  {
    v1[18] = 0;
    uint64_t v3 = +[UIColor clearColor];
    v4 = (void *)v2[5];
    v2[5] = v3;

    uint64_t v5 = +[UIColor clearColor];
    v6 = (void *)v2[11];
    v2[11] = v5;

    v2[16] = 15;
    v2[21] = 0;
  }
  return v2;
}

- (unint64_t)__maskedCorners
{
  return self->_maskedCorners;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (UIBackgroundConfiguration)updatedConfigurationForState:(id)state
{
  id v4 = state;
  uint64_t v5 = [(UIBackgroundConfiguration *)self copy];
  unint64_t defaultStyle = self->_defaultStyle;
  if (defaultStyle)
  {
    id v7 = v4;
    uint64_t v8 = self;
    if (defaultStyle - 11 >= 3)
    {
      id v9 = v7;
      uint64_t v13 = self;
      v10 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, v9);
      switch(defaultStyle)
      {
        case 1uLL:
          v14 = [v9 traitCollection];
          uint64_t v15 = +[UIBackgroundConfiguration _defaultListPlainCellConfigurationForState:traitCollection:](v13, v10, v14);
          goto LABEL_28;
        case 2uLL:
          v14 = [v9 traitCollection];
          uint64_t v15 = +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:](v13, v10, v14);
          goto LABEL_28;
        case 3uLL:
          v14 = [v9 traitCollection];
          uint64_t v15 = +[UIBackgroundConfiguration _defaultListGroupedCellConfigurationForState:traitCollection:](v13, v10, v14);
          goto LABEL_28;
        case 4uLL:
          v14 = [v9 traitCollection];
          uint64_t v15 = +[UIBackgroundConfiguration _defaultListGroupedHeaderFooterConfigurationForState:traitCollection:](v13, v10, v14);
          goto LABEL_28;
        case 5uLL:
          v14 = [v9 traitCollection];
          uint64_t v22 = v13;
          v23 = v10;
          v24 = v14;
          int v25 = 0;
          goto LABEL_24;
        case 6uLL:
          v14 = [v9 traitCollection];
          uint64_t v15 = +[UIBackgroundConfiguration _defaultListSidebarHeaderConfigurationForState:traitCollection:](v13, v10, v14);
          goto LABEL_28;
        case 7uLL:
          v14 = [v9 traitCollection];
          uint64_t v22 = v13;
          v23 = v10;
          v24 = v14;
          int v25 = 1;
LABEL_24:
          uint64_t v15 = +[UIBackgroundConfiguration _defaultListSidebarCellConfigurationForState:traitCollection:isAccompanied:](v22, v23, v24, v25);
          goto LABEL_28;
        case 8uLL:
          v14 = [v9 traitCollection];
          uint64_t v15 = +[UIBackgroundConfiguration _defaultListInsetGroupedCellConfigurationForState:traitCollection:](v13, v10, v14);
          goto LABEL_28;
        case 9uLL:
          v14 = [v9 traitCollection];
          uint64_t v15 = +[UIBackgroundConfiguration _defaultListInsetGroupedHeaderFooterConfigurationForState:traitCollection:](v13, v10, v14);
          goto LABEL_28;
        case 0xAuLL:
          v14 = [v9 traitCollection];
          uint64_t v15 = +[UIBackgroundConfiguration _defaultListSidebarPlainCellConfigurationForState:traitCollection:](v13, v10, v14);
LABEL_28:
          uint64_t v21 = v15;
          break;
        default:
          v14 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForFixedStyle_state_, v13, @"UIBackgroundConfiguration.m", 617, @"Unknown style: %ld", defaultStyle);
          uint64_t v21 = 0;
          break;
      }
    }
    else
    {
      id v9 = [v7 traitCollection];
      v10 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, v7);
      uint64_t v11 = [v9 listEnvironment];
      switch(defaultStyle)
      {
        case 0xDuLL:
          switch(v11)
          {
            case 3:
            case 5:
              uint64_t v17 = +[UIBackgroundConfiguration _defaultListGroupedHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              break;
            case 4:
              uint64_t v17 = +[UIBackgroundConfiguration _defaultListInsetGroupedHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              break;
            default:
              uint64_t v17 = +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              break;
          }
          uint64_t v21 = v17;
          if (v17)
          {
            uint64_t v26 = 13;
            goto LABEL_43;
          }
          break;
        case 0xCuLL:
          switch(v11)
          {
            case 3:
              uint64_t v16 = +[UIBackgroundConfiguration _defaultListGroupedHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              break;
            case 4:
              uint64_t v16 = +[UIBackgroundConfiguration _defaultListInsetGroupedHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              break;
            case 5:
              uint64_t v16 = +[UIBackgroundConfiguration _defaultListSidebarHeaderConfigurationForState:traitCollection:](v8, v10, v9);
              break;
            default:
              uint64_t v16 = +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              break;
          }
          uint64_t v21 = v16;
          if (v16)
          {
            uint64_t v26 = 12;
            goto LABEL_43;
          }
          break;
        case 0xBuLL:
          switch(v11)
          {
            case 3:
              uint64_t v12 = +[UIBackgroundConfiguration _defaultListGroupedCellConfigurationForState:traitCollection:](v8, v10, v9);
              break;
            case 4:
              uint64_t v12 = +[UIBackgroundConfiguration _defaultListInsetGroupedCellConfigurationForState:traitCollection:](v8, v10, v9);
              break;
            case 5:
              uint64_t v12 = +[UIBackgroundConfiguration _defaultListSidebarCellConfigurationForState:traitCollection:isAccompanied:](v8, v10, v9, [v9 _splitViewControllerContext] == 2);
              break;
            case 6:
              uint64_t v12 = +[UIBackgroundConfiguration _defaultListSidebarPlainCellConfigurationForState:traitCollection:](v8, v10, v9);
              break;
            default:
              uint64_t v12 = +[UIBackgroundConfiguration _defaultListPlainCellConfigurationForState:traitCollection:](v8, v10, v9);
              break;
          }
          uint64_t v21 = v12;
          if (v12)
          {
            uint64_t v26 = 11;
LABEL_43:
            *(void *)(v21 + 144) = v26;
          }
          break;
        default:
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          v19 = [NSString stringWithUTF8String:"+[UIBackgroundConfiguration _defaultConfigurationForStyle:state:]"];
          v20 = _UIBackgroundConfigurationStyleToString(defaultStyle);
          [v18 handleFailureInFunction:v19, @"UIBackgroundConfiguration.m", 585, @"Attempting to fetch default configuration for unknown generic style. Style: %@", v20 file lineNumber description];

          uint64_t v21 = +[UIBackgroundConfiguration clearConfiguration];
          break;
      }
    }

    __int16 configurationFlags = (__int16)self->_configurationFlags;
    if (configurationFlags)
    {
      if ((configurationFlags & 2) != 0) {
        goto LABEL_48;
      }
    }
    else
    {
      if (v21) {
        v31 = *(void **)(v21 + 16);
      }
      else {
        v31 = 0;
      }
      -[UIBackgroundConfiguration _setCustomView:](v5, v31);
      __int16 configurationFlags = (__int16)self->_configurationFlags;
      if ((configurationFlags & 2) != 0)
      {
LABEL_48:
        if ((configurationFlags & 4) != 0) {
          goto LABEL_55;
        }
LABEL_52:
        if (v21)
        {
          long long v29 = *(_OWORD *)(v21 + 176);
          long long v32 = *(_OWORD *)(v21 + 192);
          if (!v5) {
            goto LABEL_55;
          }
        }
        else
        {
          long long v29 = 0uLL;
          long long v32 = 0uLL;
          if (!v5)
          {
LABEL_55:
            if ((configurationFlags & 8) != 0) {
              goto LABEL_59;
            }
            if (v21)
            {
              uint64_t v33 = *(void *)(v21 + 32);
              if (!v5) {
                goto LABEL_59;
              }
            }
            else
            {
              uint64_t v33 = 0;
              if (!v5)
              {
LABEL_59:
                if ((configurationFlags & 0x10) != 0)
                {
                  if ((configurationFlags & 0x20) != 0) {
                    goto LABEL_63;
                  }
                }
                else
                {
                  if (v21) {
                    v34 = *(void **)(v21 + 40);
                  }
                  else {
                    v34 = 0;
                  }
                  -[UIBackgroundConfiguration _setBackgroundColor:](v5, v34);
                  __int16 configurationFlags = (__int16)self->_configurationFlags;
                  if ((configurationFlags & 0x20) != 0)
                  {
LABEL_63:
                    if ((configurationFlags & 0x40) != 0) {
                      goto LABEL_72;
                    }
LABEL_69:
                    if (v21)
                    {
                      v28 = *(void **)(v21 + 56);
                      if (!v5) {
                        goto LABEL_72;
                      }
                      goto LABEL_71;
                    }
                    v28 = 0;
                    if (v5)
                    {
LABEL_71:
                      objc_setProperty_nonatomic_copy((id)v5, v27, v28, 56);
                      __int16 configurationFlags = (__int16)self->_configurationFlags;
                    }
LABEL_72:
                    if ((configurationFlags & 0x80) != 0)
                    {
                      if ((configurationFlags & 0x100) != 0)
                      {
LABEL_74:
                        if ((configurationFlags & 0x200) == 0) {
                          goto LABEL_75;
                        }
                        goto LABEL_81;
                      }
                    }
                    else
                    {
                      v36 = objc_msgSend((id)v21, "__visualEffectGroupName", v28);
                      objc_msgSend((id)v5, "__setVisualEffectGroupName:", v36);

                      __int16 configurationFlags = (__int16)self->_configurationFlags;
                      if ((configurationFlags & 0x100) != 0) {
                        goto LABEL_74;
                      }
                    }
                    objc_msgSend((id)v5, "__setVisualEffectblurClippingMode:", objc_msgSend((id)v21, "__visualEffectblurClippingMode"));
                    __int16 configurationFlags = (__int16)self->_configurationFlags;
                    if ((configurationFlags & 0x200) == 0)
                    {
LABEL_75:
                      if (v21) {
                        v37 = *(void **)(v21 + 72);
                      }
                      else {
                        v37 = 0;
                      }
                      -[UIBackgroundConfiguration _setImage:](v5, v37);
                      __int16 configurationFlags = (__int16)self->_configurationFlags;
                      if ((configurationFlags & 0x400) != 0) {
                        goto LABEL_85;
                      }
                      goto LABEL_82;
                    }
LABEL_81:
                    if ((configurationFlags & 0x400) != 0) {
                      goto LABEL_85;
                    }
LABEL_82:
                    if (v21)
                    {
                      uint64_t v38 = *(void *)(v21 + 80);
                      if (!v5) {
                        goto LABEL_85;
                      }
                      goto LABEL_84;
                    }
                    uint64_t v38 = 0;
                    if (v5)
                    {
LABEL_84:
                      *(void *)(v5 + 80) = v38;
                      __int16 configurationFlags = (__int16)self->_configurationFlags;
                    }
LABEL_85:
                    if ((configurationFlags & 0x800) != 0)
                    {
                      if ((configurationFlags & 0x1000) != 0) {
                        goto LABEL_89;
                      }
                    }
                    else
                    {
                      if (v21) {
                        v39 = *(void **)(v21 + 88);
                      }
                      else {
                        v39 = 0;
                      }
                      -[UIBackgroundConfiguration _setStrokeColor:](v5, v39);
                      __int16 configurationFlags = (__int16)self->_configurationFlags;
                      if ((configurationFlags & 0x1000) != 0)
                      {
LABEL_89:
                        if ((configurationFlags & 0x2000) != 0) {
                          goto LABEL_98;
                        }
LABEL_95:
                        if (v21)
                        {
                          *(void *)&long long v29 = *(void *)(v21 + 104);
                          if (!v5) {
                            goto LABEL_98;
                          }
                          goto LABEL_97;
                        }
                        *(void *)&long long v29 = 0;
                        if (v5)
                        {
LABEL_97:
                          *(void *)(v5 + 104) = v29;
                          __int16 configurationFlags = (__int16)self->_configurationFlags;
                        }
LABEL_98:
                        if ((configurationFlags & 0x4000) != 0) {
                          goto LABEL_102;
                        }
                        if (v21)
                        {
                          *(void *)&long long v29 = *(void *)(v21 + 112);
                          if (!v5) {
                            goto LABEL_102;
                          }
                        }
                        else
                        {
                          *(void *)&long long v29 = 0;
                          if (!v5)
                          {
LABEL_102:
                            if ((configurationFlags & 0x8000) == 0) {
                              objc_msgSend((id)v5, "__setMaskedCorners:", objc_msgSend((id)v21, "__maskedCorners", *(double *)&v29));
                            }
                            v41 = objc_msgSend((id)v5, "_shadowProperties", *(double *)&v29);
                            if (v41)
                            {
                            }
                            else
                            {
                              v42 = [(id)v21 _shadowProperties];

                              if (!v42)
                              {
LABEL_108:
                                objc_msgSend((id)v5, "_setStrokeLocation:", objc_msgSend((id)v21, "_strokeLocation"));

                                goto LABEL_109;
                              }
                            }
                            v43 = [(id)v5 shadowProperties];
                            v44 = [(id)v21 shadowProperties];
                            [v43 _applyPropertiesFromDefaultProperties:v44];

                            goto LABEL_108;
                          }
                        }
                        *(void *)(v5 + 112) = v29;
                        __int16 configurationFlags = (__int16)self->_configurationFlags;
                        goto LABEL_102;
                      }
                    }
                    if (v21) {
                      v40 = *(void **)(v21 + 96);
                    }
                    else {
                      v40 = 0;
                    }
                    -[UIBackgroundConfiguration _setStrokeColorTransformer:](v5, v40);
                    __int16 configurationFlags = (__int16)self->_configurationFlags;
                    if ((configurationFlags & 0x2000) != 0) {
                      goto LABEL_98;
                    }
                    goto LABEL_95;
                  }
                }
                if (v21) {
                  v35 = *(void **)(v21 + 48);
                }
                else {
                  v35 = 0;
                }
                -[UIBackgroundConfiguration _setBackgroundColorTransformer:](v5, v35);
                __int16 configurationFlags = (__int16)self->_configurationFlags;
                if ((configurationFlags & 0x40) != 0) {
                  goto LABEL_72;
                }
                goto LABEL_69;
              }
            }
            *(void *)(v5 + 32) = v33;
            __int16 configurationFlags = (__int16)self->_configurationFlags;
            goto LABEL_59;
          }
        }
        *(_OWORD *)(v5 + 176) = v29;
        *(_OWORD *)(v5 + 192) = v32;
        __int16 configurationFlags = (__int16)self->_configurationFlags;
        goto LABEL_55;
      }
    }
    [(id)v21 _cornerRadius];
    objc_msgSend((id)v5, "_setCornerRadius:");
    __int16 configurationFlags = (__int16)self->_configurationFlags;
    if ((configurationFlags & 4) != 0) {
      goto LABEL_55;
    }
    goto LABEL_52;
  }
LABEL_109:

  return (UIBackgroundConfiguration *)(id)v5;
}

- (UIShadowProperties)_shadowProperties
{
  return self->_shadowProperties;
}

- (UIView)customView
{
  return self->_customView;
}

- (void)__setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (unint64_t)__visualEffectblurClippingMode
{
  return self->_visualEffectblurClippingMode;
}

- (NSString)__visualEffectGroupName
{
  return self->_visualEffectGroupName;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)_strokeLocation
{
  return self->_strokeLocation;
}

- (void)_setStrokeColor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)-[UIBackgroundConfiguration _init](+[UIBackgroundConfiguration allocWithZone:](UIBackgroundConfiguration, "allocWithZone:", a3));
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 2, self->_customView);
    v5[3] = *(id *)&self->_cornerRadius;
    v5[16] = self->_maskedCorners;
    objc_storeStrong(v5 + 5, self->_backgroundColor);
    uint64_t v6 = [self->_backgroundColorTransformer copy];
    id v7 = v5[6];
    v5[6] = (id)v6;

    v5[19] = self->_backgroundColorTransformerIdentifier;
    uint64_t v8 = [(UIVisualEffect *)self->_visualEffect copy];
    id v9 = v5[7];
    v5[7] = (id)v8;

    uint64_t v10 = [(NSString *)self->_visualEffectGroupName copy];
    id v11 = v5[8];
    v5[8] = (id)v10;

    v5[17] = self->_visualEffectblurClippingMode;
    objc_storeStrong(v5 + 9, self->_image);
    v5[10] = self->_imageContentMode;
    long long v12 = *(_OWORD *)&self->_backgroundInsets.bottom;
    *((_OWORD *)v5 + 11) = *(_OWORD *)&self->_backgroundInsets.top;
    *((_OWORD *)v5 + 12) = v12;
    v5[4] = self->_edgesAddingLayoutMarginsToBackgroundInsets;
    objc_storeStrong(v5 + 11, self->_strokeColor);
    uint64_t v13 = [self->_strokeColorTransformer copy];
    id v14 = v5[12];
    v5[12] = (id)v13;

    v5[20] = self->_strokeColorTransformerIdentifier;
    v5[13] = *(id *)&self->_strokeWidth;
    v5[14] = *(id *)&self->_strokeOutset;
    v5[21] = self->_strokeLocation;
    uint64_t v15 = [(UIShadowProperties *)self->_shadowProperties copy];
    id v16 = v5[15];
    v5[15] = (id)v15;

    v5[18] = self->_defaultStyle;
    *((_DWORD *)v5 + 2) = self->_configurationFlags;
  }
  return v5;
}

- (void)_setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)__setVisualEffectGroupName:(id)a3
{
}

- (void)_setShadowProperties:(id)a3
{
}

- (void)_setBackgroundColorTransformerIdentifier:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = _UIConfigurationColorTransformerForIdentifier(a2);
    uint64_t v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v4;

    if (*(void *)(a1 + 48)) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = 0;
    }
    *(void *)(a1 + 152) = v6;
  }
}

- (BOOL)_isEqualToInternalConfigurationQuick:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = -[UIBackgroundConfiguration _isEqualToConfigurationQuick:]((uint64_t)self, v4);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    if (v3 == (void **)a1)
    {
      a1 = 1;
    }
    else if (*(void **)(a1 + 144) == v3[18] {
           && *(void **)(a1 + 40) == v3[5]
    }
           && *(void **)(a1 + 16) == v3[2]
           && *(double *)(a1 + 24) == *((double *)v3 + 3)
           && *(void **)(a1 + 128) == v3[16]
           && *(void **)(a1 + 32) == v3[4]
           && *(void **)(a1 + 88) == v3[11]
           && *(double *)(a1 + 104) == *((double *)v3 + 13)
           && *(double *)(a1 + 112) == *((double *)v3 + 14)
           && *(void **)(a1 + 72) == v3[9]
           && *(void **)(a1 + 80) == v3[10])
    {
      id v7 = v3;
      if (*(void **)(a1 + 168) == v3[21]
        && *(void **)(a1 + 136) == v3[17]
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 176), *((float64x2_t *)v3 + 11)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 192), *((float64x2_t *)v3 + 12)))), 0xFuLL))) & 1) != 0&& (v4 = *(void **)(a1 + 152), v4 == v3[19])&& (v4 != (void *)1 || *(void **)(a1 + 48) == v3[6])&& (char v5 = *(void **)(a1 + 160), v5 == v3[20])&& (v5 != (void *)1 || *(void **)(a1 + 96) == v3[12])&& UIEqual(*(void **)(a1 + 120), v3[15])&& UIEqual(*(void **)(a1 + 64), v7[8]))
      {
        a1 = UIEqual(*(void **)(a1 + 56), v7[7]);
        uint64_t v3 = v7;
      }
      else
      {
        a1 = 0;
        uint64_t v3 = v7;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  *(_WORD *)&self->_configurationFlags |= 2u;
  [(UIBackgroundConfiguration *)self _setCornerRadius:cornerRadius];
}

- (BOOL)_hasBackgroundColor
{
  backgroundColor = self->_backgroundColor;
  uint64_t v3 = +[UIColor clearColor];
  LOBYTE(backgroundColor) = backgroundColor != v3;

  return (char)backgroundColor;
}

- (void)_setImage:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (BOOL)_hasStroke
{
  if (self->_strokeWidth <= 0.0) {
    return 0;
  }
  strokeColor = self->_strokeColor;
  uint64_t v3 = +[UIColor clearColor];
  BOOL v4 = strokeColor != v3;

  return v4;
}

- (void)_setStrokeLocation:(int64_t)a3
{
  self->_strokeLocation = a3;
}

- (void)_setStrokeColorTransformer:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    *(void *)(a1 + 160) = _UIConfigurationIdentifierForColorTransformer(v3);
    uint64_t v4 = [v3 copy];

    char v5 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v4;
  }
}

- (void)_setBackgroundColorTransformer:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    *(void *)(a1 + 152) = _UIConfigurationIdentifierForColorTransformer(v3);
    uint64_t v4 = [v3 copy];

    char v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v4;
  }
}

- (void)__setVisualEffectblurClippingMode:(unint64_t)a3
{
  self->_visualEffectblurClippingMode = a3;
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (CGFloat)strokeWidth
{
  return self->_strokeWidth;
}

- (NSDirectionalRectEdge)edgesAddingLayoutMarginsToBackgroundInsets
{
  return self->_edgesAddingLayoutMarginsToBackgroundInsets;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowProperties, 0);
  objc_storeStrong(&self->_strokeColorTransformer, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_visualEffectGroupName, 0);
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong(&self->_backgroundColorTransformer, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_customView, 0);
}

+ (UIBackgroundConfiguration)listPlainHeaderFooterConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  uint64_t v4 = +[UITraitCollection _fallbackTraitCollection]();
  char v5 = +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIBackgroundConfiguration *)v5;
}

+ (void)_defaultListPlainHeaderFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v6 = _UITableConstantsForTraitCollection(v5);
  id v7 = +[UIBackgroundConfiguration clearConfiguration];
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v8 = [v4 isPinned];
  if (v6)
  {
    [v6 defaultHeaderFooterBackgroundPropertiesForTableViewStyle:0 cellConfigurationState:v4 traitCollection:v5 floating:v8];
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
  _UIBackgroundConfigurationApplyProperties(v7, (uint64_t)v10, v5);
  if (v7) {
    v7[18] = 2;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)&v11);

  return v7;
}

+ (void)_defaultListGroupedHeaderFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v6 = _UITableConstantsForTraitCollection(v5);
  id v7 = +[UIBackgroundConfiguration clearConfiguration];
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  if (v6) {
    [v6 defaultHeaderFooterBackgroundPropertiesForTableViewStyle:1 cellConfigurationState:v4 traitCollection:v5 floating:0];
  }
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v9, (uint64_t)v10);
  _UIBackgroundConfigurationApplyProperties(v7, (uint64_t)v9, v5);
  if (v7) {
    v7[18] = 4;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)v10);

  return v7;
}

- (void)setStrokeWidth:(CGFloat)strokeWidth
{
  *(_WORD *)&self->_configurationFlags |= 0x2000u;
  self->_strokeWidth = strokeWidth;
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
  *(_WORD *)&self->_configurationFlags |= 0x800u;
  -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)self, strokeColor);
}

+ (void)_defaultListGroupedCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if ([v5 userInterfaceIdiom] == 6 && dyld_program_sdk_at_least())
  {
    id v7 = +[UIBackgroundConfiguration _defaultListInsetGroupedCellConfigurationForState:traitCollection:](v6, v4, v5);
  }
  else
  {
    uint64_t v8 = _UITableConstantsForTraitCollection(v5);
    id v7 = +[UIBackgroundConfiguration clearConfiguration];
    uint64_t v12 = 0;
    memset(v11, 0, sizeof(v11));
    if (v8) {
      [v8 defaultCellBackgroundPropertiesForTableViewStyle:1 state:v4 traitCollection:v5];
    }
    __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v10, (uint64_t)v11);
    _UIBackgroundConfigurationApplyProperties(v7, (uint64_t)v10, v5);
    if (v7) {
      v7[18] = 3;
    }
    __destructor_8_s8_s16_s24_s80((uint64_t)v11);
  }
  return v7;
}

+ (void)_defaultListPlainCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v6 = _UITableConstantsForTraitCollection(v5);
  id v7 = +[UIBackgroundConfiguration clearConfiguration];
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  if (v6) {
    [v6 defaultCellBackgroundPropertiesForTableViewStyle:0 state:v4 traitCollection:v5];
  }
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v9, (uint64_t)v10);
  _UIBackgroundConfigurationApplyProperties(v7, (uint64_t)v9, v5);
  if (v7) {
    v7[18] = 1;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)v10);

  return v7;
}

+ (UIBackgroundConfiguration)clearConfiguration
{
  v2 = -[UIBackgroundConfiguration _init]([UIBackgroundConfiguration alloc]);
  return (UIBackgroundConfiguration *)v2;
}

- (void)_setBackgroundColor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (CGFloat)strokeOutset
{
  return self->_strokeOutset;
}

+ (UIBackgroundConfiguration)listPlainCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIBackgroundConfiguration _defaultListPlainCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIBackgroundConfiguration *)v5;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  *(_WORD *)&self->_configurationFlags |= 0x10u;
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)self, backgroundColor);
}

- (void)setVisualEffect:(UIVisualEffect *)visualEffect
{
  *(_WORD *)&self->_configurationFlags |= 0x40u;
  objc_setProperty_nonatomic_copy(self, a2, visualEffect, 56);
}

- (BOOL)_backgroundFillIsEqual:(id)a3 withTintColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    customView = self->_customView;
    id v9 = [v6 customView];
    if (customView != v9)
    {
LABEL_29:

LABEL_30:
      LOBYTE(v18) = 0;
      goto LABEL_31;
    }
    uint64_t v10 = [(UIBackgroundConfiguration *)self resolvedBackgroundColorForTintColor:v7];
    uint64_t v11 = [v6 resolvedBackgroundColorForTintColor:v7];
    uint64_t v12 = v10;
    long long v13 = v11;
    long long v14 = v13;
    if (v12 == v13)
    {
    }
    else
    {
      long long v15 = v13;
      long long v16 = (UIImage *)v12;
      if (!v12) {
        goto LABEL_26;
      }
      long long v15 = v13;
      long long v16 = (UIImage *)v12;
      if (!v13) {
        goto LABEL_26;
      }
      int v17 = [(UIVisualEffect *)v12 isEqual:v13];

      if (!v17) {
        goto LABEL_28;
      }
    }
    visualEffect = self->_visualEffect;
    v20 = [v6 visualEffect];
    long long v15 = visualEffect;
    uint64_t v21 = v20;
    long long v16 = v21;
    if (v15 == (UIVisualEffect *)v21)
    {
    }
    else
    {
      if (!v15 || !v21)
      {
        int v25 = v21;
LABEL_25:

LABEL_26:
LABEL_27:

LABEL_28:
        id v9 = customView;
        goto LABEL_29;
      }
      int v22 = [(UIVisualEffect *)v15 isEqual:v21];

      if (!v22) {
        goto LABEL_27;
      }
    }
    image = self->_image;
    v24 = [v6 image];
    int v25 = image;
    uint64_t v26 = v24;
    if (v25 == (UIImage *)v26)
    {

LABEL_23:
      LOBYTE(v18) = 1;
      goto LABEL_31;
    }
    long long v15 = v26;
    if (v25 && v26)
    {
      BOOL v27 = [(UIImage *)v25 isEqual:v26];

      if (!v27) {
        goto LABEL_30;
      }
      goto LABEL_23;
    }

    goto LABEL_25;
  }
  BOOL v18 = ![(UIBackgroundConfiguration *)self _hasBackgroundFill];
LABEL_31:

  return v18;
}

- (UIColor)resolvedBackgroundColorForTintColor:(UIColor *)tintColor
{
  id v4 = tintColor;
  id v5 = v4;
  backgroundColor = self->_backgroundColor;
  if (!backgroundColor) {
    backgroundColor = v4;
  }
  id v7 = backgroundColor;
  backgroundColorTransformer = (void (**)(id, id))self->_backgroundColorTransformer;
  if (backgroundColorTransformer)
  {
    backgroundColorTransformer[2](backgroundColorTransformer, v7);
    id v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v7;
  }
  uint64_t v10 = v9;

  return v10;
}

- (BOOL)_hasBackgroundFill
{
  return [(UIBackgroundConfiguration *)self _hasBackgroundColor]
      || self->_visualEffect
      || self->_image
      || self->_customView != 0;
}

- (void)_setVisualEffectGroupName:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x80u;
  [(UIBackgroundConfiguration *)self __setVisualEffectGroupName:a3];
}

- (void)setCustomView:(UIView *)customView
{
  id v5 = customView;
  id v6 = v5;
  id v9 = v5;
  if (v5)
  {
    BOOL v7 = [(UIView *)v5 translatesAutoresizingMaskIntoConstraints];
    id v6 = v9;
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"UIBackgroundConfiguration.m", 1061, @"Custom view must have translatesAutoresizingMaskIntoConstraints enabled, even if auto layout constraints are used inside it. Custom view: %@", v9 object file lineNumber description];

      id v6 = v9;
    }
  }
  *(_WORD *)&self->_configurationFlags |= 1u;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)self, v6);
}

+ (UIBackgroundConfiguration)listGroupedHeaderFooterConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIBackgroundConfiguration _defaultListGroupedHeaderFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIBackgroundConfiguration *)v5;
}

+ (id)_listInsetGroupedHeaderFooterConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIBackgroundConfiguration _defaultListInsetGroupedHeaderFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return v5;
}

+ (id)_defaultListInsetGroupedHeaderFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if ([v5 userInterfaceIdiom] == 6)
  {
    uint64_t v7 = +[UIBackgroundConfiguration clearConfiguration];
    uint64_t v8 = (void *)v7;
    if (v7) {
      *(void *)(v7 + 144) = 9;
    }
  }
  else
  {
    uint64_t v8 = +[UIBackgroundConfiguration _defaultListGroupedHeaderFooterConfigurationForState:traitCollection:](v6, v4, v5);
  }

  return v8;
}

+ (id)_listInsetGroupedCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIBackgroundConfiguration _defaultListInsetGroupedCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return v5;
}

+ (id)_defaultListInsetGroupedCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  uint64_t v7 = +[UIBackgroundConfiguration _defaultListGroupedCellConfigurationForState:traitCollection:](v6, v5, v4);

  return v7;
}

+ (id)listCellConfiguration
{
  v2 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v3 = +[UITraitCollection _fallbackTraitCollection]();
  id v4 = +[UIBackgroundConfiguration _defaultListPlainCellConfigurationForState:traitCollection:]((uint64_t)UIBackgroundConfiguration, v2, v3);

  if (v4) {
    v4[18] = 11;
  }
  return v4;
}

+ (UIBackgroundConfiguration)listGroupedCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIBackgroundConfiguration _defaultListGroupedCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIBackgroundConfiguration *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIBackgroundConfiguration *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = -[UIBackgroundConfiguration _isEqualToConfiguration:]((uint64_t)self, v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (uint64_t)_isEqualToConfiguration:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (v3 == (void **)a1)
    {
      a1 = 1;
    }
    else if (*(void **)(a1 + 144) == v3[18] {
           && *(void **)(a1 + 16) == v3[2]
    }
           && *(double *)(a1 + 24) == *((double *)v3 + 3)
           && *(void **)(a1 + 128) == v3[16]
           && *(void **)(a1 + 32) == v3[4]
           && *(double *)(a1 + 104) == *((double *)v3 + 13)
           && *(double *)(a1 + 112) == *((double *)v3 + 14)
           && *(void **)(a1 + 80) == v3[10]
           && *(void **)(a1 + 168) == v3[21]
           && *(void **)(a1 + 136) == v3[17]
           && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 176), *((float64x2_t *)v3 + 11)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 192), *((float64x2_t *)v3 + 12)))), 0xFuLL))) & 1) != 0)
    {
      id v5 = *(void **)(a1 + 152);
      uint64_t v7 = v3;
      if (v5 == v3[19]
        && (v5 != (void *)1 || *(void **)(a1 + 48) == v3[6])
        && (char v6 = *(void **)(a1 + 160), v6 == v3[20])
        && (v6 != (void *)1 || *(void **)(a1 + 96) == v3[12])
        && UIEqual(*(void **)(a1 + 40), v3[5])
        && UIEqual(*(void **)(a1 + 88), v7[11])
        && UIEqual(*(void **)(a1 + 64), v7[8])
        && UIEqual(*(void **)(a1 + 56), v7[7])
        && UIEqual(*(void **)(a1 + 72), v7[9]))
      {
        a1 = UIEqual(*(void **)(a1 + 120), v7[15]);
        id v3 = v7;
      }
      else
      {
        a1 = 0;
        id v3 = v7;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

+ (id)listHeaderConfiguration
{
  v2 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v3 = +[UITraitCollection _fallbackTraitCollection]();
  id v4 = +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:]((uint64_t)UIBackgroundConfiguration, v2, v3);

  if (v4) {
    v4[18] = 12;
  }
  return v4;
}

+ (id)listFooterConfiguration
{
  v2 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v3 = +[UITraitCollection _fallbackTraitCollection]();
  id v4 = +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:]((uint64_t)UIBackgroundConfiguration, v2, v3);

  if (v4) {
    v4[18] = 13;
  }
  return v4;
}

+ (void)_defaultListSidebarHeaderConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a2;
  id v5 = a3;
  self;
  char v6 = +[UIBackgroundConfiguration clearConfiguration];
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v7 = _UITableConstantsForTraitCollection(v5);
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 defaultSidebarHeaderBackgroundPropertiesWithState:v4 traitCollection:v5];
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
  _UIBackgroundConfigurationApplyProperties(v6, (uint64_t)v10, v5);
  if (v6) {
    v6[18] = 6;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)&v11);

  return v6;
}

+ (UIBackgroundConfiguration)listAccompaniedSidebarCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIBackgroundConfiguration _defaultListSidebarCellConfigurationForState:traitCollection:isAccompanied:]((uint64_t)a1, v3, v4, 1);

  return (UIBackgroundConfiguration *)v5;
}

+ (void)_defaultListSidebarCellConfigurationForState:(void *)a3 traitCollection:(int)a4 isAccompanied:
{
  id v6 = a2;
  id v7 = a3;
  self;
  uint64_t v8 = +[UIBackgroundConfiguration clearConfiguration];
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = _UITableConstantsForTraitCollection(v7);
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    [v9 defaultSidebarCellBackgroundPropertiesForStyle:v11 state:v6 traitCollection:v7];
  }
  else
  {
    uint64_t v23 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
  }

  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v14, (uint64_t)&v15);
  _UIBackgroundConfigurationApplyProperties(v8, (uint64_t)v14, v7);
  if (v8)
  {
    uint64_t v12 = 5;
    if (a4) {
      uint64_t v12 = 7;
    }
    v8[18] = v12;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)&v15);

  return v8;
}

+ (id)_sidebarPlainCellConfiguration
{
  uint64_t v0 = self;
  v1 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v2 = +[UITraitCollection _fallbackTraitCollection]();
  id v3 = +[UIBackgroundConfiguration _defaultListSidebarPlainCellConfigurationForState:traitCollection:](v0, v1, v2);

  return v3;
}

+ (void)_defaultListSidebarPlainCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a2;
  id v5 = a3;
  self;
  id v6 = +[UIBackgroundConfiguration clearConfiguration];
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = _UITableConstantsForTraitCollection(v5);
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 defaultSidebarCellBackgroundPropertiesForStyle:3 state:v4 traitCollection:v5];
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
  _UIBackgroundConfigurationApplyProperties(v6, (uint64_t)v10, v5);
  if (v6) {
    v6[18] = 10;
  }
  __destructor_8_s8_s16_s24_s80((uint64_t)&v11);

  return v6;
}

+ (UIBackgroundConfiguration)listSidebarCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIBackgroundConfiguration _defaultListSidebarCellConfigurationForState:traitCollection:isAccompanied:]((uint64_t)a1, v3, v4, 0);

  return (UIBackgroundConfiguration *)v5;
}

+ (UIBackgroundConfiguration)listSidebarHeaderConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIBackgroundConfiguration _defaultListSidebarHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIBackgroundConfiguration *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIBackgroundConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)UIBackgroundConfiguration;
  id v5 = [(UIBackgroundConfiguration *)&v73 init];
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
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v9;

    -[UIBackgroundConfiguration _setBackgroundColorTransformerIdentifier:]((uint64_t)v5, [v4 decodeIntegerForKey:@"backgroundColorTransformerIdentifier"]);
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
      uint64_t v15 = [v4 decodeBoolForKey:@"visualEffectAllowsTransparentBlurring"] ^ 1;
    }
    v5->_visualEffectblurClippingMode = v15;
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (UIImage *)v16;

    v5->_imageContentMode = [v4 decodeIntegerForKey:@"imageContentMode"];
    [v4 decodeDirectionalEdgeInsetsForKey:@"backgroundInsets"];
    v5->_backgroundInsets.double top = v18;
    v5->_backgroundInsets.double leading = v19;
    v5->_backgroundInsets.double bottom = v20;
    v5->_backgroundInsets.double trailing = v21;
    v5->_edgesAddingLayoutMarginsToBackgroundInsets = [v4 decodeIntegerForKey:@"edgesAddingLayoutMarginsToBackgroundInsets"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"strokeColor"];
    strokeColor = v5->_strokeColor;
    v5->_strokeColor = (UIColor *)v22;

    uint64_t v24 = [v4 decodeIntegerForKey:@"strokeColorTransformerIdentifier"];
    uint64_t v25 = _UIConfigurationColorTransformerForIdentifier(v24);
    id strokeColorTransformer = v5->_strokeColorTransformer;
    v5->_id strokeColorTransformer = (id)v25;

    if (v5->_strokeColorTransformer) {
      uint64_t v27 = v24;
    }
    else {
      uint64_t v27 = 0;
    }
    v5->_strokeColorTransformerIdentifier = v27;
    [v4 decodeDoubleForKey:@"strokeWidth"];
    v5->_strokeWidth = v28;
    [v4 decodeDoubleForKey:@"strokeOutset"];
    v5->_strokeOutset = v29;
    v5->_strokeLocation = [v4 decodeIntegerForKey:@"strokeLocation"];
    if ([v4 containsValueForKey:@"shadowProperties"])
    {
      uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shadowProperties"];
      shadowProperties = v5->_shadowProperties;
      v5->_shadowProperties = (UIShadowProperties *)v30;
    }
    else
    {
      uint64_t v32 = [v4 decodeIntegerForKey:@"shadowType"];
      shadowProperties = +[UITraitCollection _fallbackTraitCollection]();
      uint64_t v33 = _UIShadowPropertiesFromShadowType(v32, shadowProperties);
      v34 = v5->_shadowProperties;
      v5->_shadowProperties = (UIShadowProperties *)v33;
    }
    if ([v4 containsValueForKey:@"defaultStyle_v2"]) {
      v35 = @"defaultStyle_v2";
    }
    else {
      v35 = @"defaultStyle";
    }
    uint64_t v36 = [v4 decodeIntegerForKey:v35];
    if ((unint64_t)(v36 - 1) >= 0xD) {
      uint64_t v37 = 0;
    }
    else {
      uint64_t v37 = v36;
    }
    v5->_unint64_t defaultStyle = v37;
    uint64_t v38 = [NSString stringWithFormat:@"hasCustomized-%@", @"customView"];
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFE | [v4 decodeBoolForKey:v38];

    v39 = [NSString stringWithFormat:@"hasCustomized-%@", @"cornerRadius"];
    if ([v4 decodeBoolForKey:v39]) {
      __int16 v40 = 2;
    }
    else {
      __int16 v40 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFD | v40;

    v41 = [NSString stringWithFormat:@"hasCustomized-%@", @"backgroundInsets"];
    if ([v4 decodeBoolForKey:v41]) {
      __int16 v42 = 4;
    }
    else {
      __int16 v42 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFB | v42;

    v43 = [NSString stringWithFormat:@"hasCustomized-%@", @"edgesAddingLayoutMarginsToBackgroundInsets"];
    if ([v4 decodeBoolForKey:v43]) {
      __int16 v44 = 8;
    }
    else {
      __int16 v44 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFF7 | v44;

    v45 = [NSString stringWithFormat:@"hasCustomized-%@", @"backgroundColor"];
    if ([v4 decodeBoolForKey:v45]) {
      __int16 v46 = 16;
    }
    else {
      __int16 v46 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFEF | v46;

    v47 = [NSString stringWithFormat:@"hasCustomized-%@", @"backgroundColorTransformerIdentifier"];
    if ([v4 decodeBoolForKey:v47]) {
      __int16 v48 = 32;
    }
    else {
      __int16 v48 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFDF | v48;

    v49 = [NSString stringWithFormat:@"hasCustomized-%@", @"visualEffect"];
    if ([v4 decodeBoolForKey:v49]) {
      __int16 v50 = 64;
    }
    else {
      __int16 v50 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFBF | v50;

    v51 = [NSString stringWithFormat:@"hasCustomized-%@", @"visualEffectGroupName"];
    if ([v4 decodeBoolForKey:v51]) {
      __int16 v52 = 128;
    }
    else {
      __int16 v52 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFF7F | v52;

    v53 = [NSString stringWithFormat:@"hasCustomized-%@", @"visualEffectblurClippingMode"];
    int v54 = [v4 containsValueForKey:v53];

    v55 = @"visualEffectAllowsTransparentBlurring";
    if (v54) {
      v55 = @"visualEffectblurClippingMode";
    }
    v56 = [NSString stringWithFormat:@"hasCustomized-%@", v55];
    if ([v4 decodeBoolForKey:v56]) {
      __int16 v57 = 256;
    }
    else {
      __int16 v57 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFEFF | v57;

    v58 = [NSString stringWithFormat:@"hasCustomized-%@", @"image"];
    if ([v4 decodeBoolForKey:v58]) {
      __int16 v59 = 512;
    }
    else {
      __int16 v59 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFDFF | v59;

    v60 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageContentMode"];
    if ([v4 decodeBoolForKey:v60]) {
      __int16 v61 = 1024;
    }
    else {
      __int16 v61 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFBFF | v61;

    v62 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeColor"];
    if ([v4 decodeBoolForKey:v62]) {
      __int16 v63 = 2048;
    }
    else {
      __int16 v63 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xF7FF | v63;

    v64 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeColorTransformerIdentifier"];
    if ([v4 decodeBoolForKey:v64]) {
      __int16 v65 = 4096;
    }
    else {
      __int16 v65 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xEFFF | v65;

    v66 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeWidth"];
    if ([v4 decodeBoolForKey:v66]) {
      __int16 v67 = 0x2000;
    }
    else {
      __int16 v67 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xDFFF | v67;

    v68 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeOutset"];
    if ([v4 decodeBoolForKey:v68]) {
      __int16 v69 = 0x4000;
    }
    else {
      __int16 v69 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xBFFF | v69;

    v70 = [NSString stringWithFormat:@"hasCustomized-%@", @"maskedCorners"];
    if ([v4 decodeBoolForKey:v70]) {
      __int16 v71 = 0x8000;
    }
    else {
      __int16 v71 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = v71 & 0x8000 | *(_WORD *)&v5->_configurationFlags & 0x7FFF;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v37 = a3;
  if (([v37 requiresSecureCoding] & 1) == 0) {
    [v37 encodeObject:self->_customView forKey:@"customView"];
  }
  [v37 encodeDouble:@"cornerRadius" forKey:self->_cornerRadius];
  [v37 encodeInteger:self->_maskedCorners forKey:@"maskedCorners"];
  [v37 encodeObject:self->_backgroundColor forKey:@"backgroundColor"];
  [v37 encodeInteger:self->_backgroundColorTransformerIdentifier forKey:@"backgroundColorTransformerIdentifier"];
  [v37 encodeObject:self->_visualEffect forKey:@"visualEffect"];
  [v37 encodeObject:self->_visualEffectGroupName forKey:@"visualEffectGroupName"];
  [v37 encodeInteger:self->_visualEffectblurClippingMode forKey:@"visualEffectblurClippingMode"];
  [v37 encodeObject:self->_image forKey:@"image"];
  [v37 encodeInteger:self->_imageContentMode forKey:@"imageContentMode"];
  objc_msgSend(v37, "encodeDirectionalEdgeInsets:forKey:", @"backgroundInsets", self->_backgroundInsets.top, self->_backgroundInsets.leading, self->_backgroundInsets.bottom, self->_backgroundInsets.trailing);
  [v37 encodeInteger:self->_edgesAddingLayoutMarginsToBackgroundInsets forKey:@"edgesAddingLayoutMarginsToBackgroundInsets"];
  [v37 encodeObject:self->_strokeColor forKey:@"strokeColor"];
  [v37 encodeInteger:self->_strokeColorTransformerIdentifier forKey:@"strokeColorTransformerIdentifier"];
  [v37 encodeDouble:@"strokeWidth" forKey:self->_strokeWidth];
  [v37 encodeDouble:@"strokeOutset" forKey:self->_strokeOutset];
  [v37 encodeInteger:self->_strokeLocation forKey:@"strokeLocation"];
  shadowProperties = self->_shadowProperties;
  if (shadowProperties)
  {
    [v37 encodeObject:shadowProperties forKey:@"shadowProperties"];
    objc_msgSend(v37, "encodeInteger:forKey:", -[UIShadowProperties _backgroundConfigurationShadowType](self->_shadowProperties, "_backgroundConfigurationShadowType"), @"shadowType");
  }
  unint64_t defaultStyle = self->_defaultStyle;
  [v37 encodeInteger:defaultStyle forKey:@"defaultStyle_v2"];
  if ((defaultStyle & 0x8000000000000000) != 0)
  {
    unint64_t defaultStyle = 0;
    id v7 = v37;
  }
  else
  {
    unint64_t v6 = defaultStyle - 10;
    id v7 = v37;
    if (defaultStyle >= 0xA)
    {
      if (v6 > 3) {
        unint64_t defaultStyle = 1;
      }
      else {
        unint64_t defaultStyle = qword_186B92A80[v6];
      }
    }
  }
  [v7 encodeInteger:defaultStyle forKey:@"defaultStyle"];
  uint64_t v8 = *(_WORD *)&self->_configurationFlags & 1;
  uint64_t v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"customView"];
  [v37 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(_WORD *)&self->_configurationFlags >> 1) & 1;
  uint64_t v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"cornerRadius"];
  [v37 encodeBool:v10 forKey:v11];

  uint64_t v12 = (*(_WORD *)&self->_configurationFlags >> 2) & 1;
  uint64_t v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"backgroundInsets"];
  [v37 encodeBool:v12 forKey:v13];

  uint64_t v14 = (*(_WORD *)&self->_configurationFlags >> 3) & 1;
  uint64_t v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"edgesAddingLayoutMarginsToBackgroundInsets"];
  [v37 encodeBool:v14 forKey:v15];

  uint64_t v16 = (*(_WORD *)&self->_configurationFlags >> 4) & 1;
  long long v17 = [NSString stringWithFormat:@"hasCustomized-%@", @"backgroundColor"];
  [v37 encodeBool:v16 forKey:v17];

  uint64_t v18 = (*(_WORD *)&self->_configurationFlags >> 5) & 1;
  CGFloat v19 = [NSString stringWithFormat:@"hasCustomized-%@", @"backgroundColorTransformerIdentifier"];
  [v37 encodeBool:v18 forKey:v19];

  uint64_t v20 = (*(_WORD *)&self->_configurationFlags >> 6) & 1;
  CGFloat v21 = [NSString stringWithFormat:@"hasCustomized-%@", @"visualEffect"];
  [v37 encodeBool:v20 forKey:v21];

  uint64_t v22 = (*(_WORD *)&self->_configurationFlags >> 7) & 1;
  uint64_t v23 = [NSString stringWithFormat:@"hasCustomized-%@", @"visualEffectGroupName"];
  [v37 encodeBool:v22 forKey:v23];

  uint64_t v24 = (*(_WORD *)&self->_configurationFlags >> 9) & 1;
  uint64_t v25 = [NSString stringWithFormat:@"hasCustomized-%@", @"image"];
  [v37 encodeBool:v24 forKey:v25];

  uint64_t v26 = (*(_WORD *)&self->_configurationFlags >> 10) & 1;
  uint64_t v27 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageContentMode"];
  [v37 encodeBool:v26 forKey:v27];

  uint64_t v28 = (*(_WORD *)&self->_configurationFlags >> 11) & 1;
  double v29 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeColor"];
  [v37 encodeBool:v28 forKey:v29];

  uint64_t v30 = (*(_WORD *)&self->_configurationFlags >> 12) & 1;
  v31 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeColorTransformerIdentifier"];
  [v37 encodeBool:v30 forKey:v31];

  uint64_t v32 = (*(_WORD *)&self->_configurationFlags >> 13) & 1;
  uint64_t v33 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeWidth"];
  [v37 encodeBool:v32 forKey:v33];

  uint64_t v34 = (*(_WORD *)&self->_configurationFlags >> 14) & 1;
  v35 = [NSString stringWithFormat:@"hasCustomized-%@", @"strokeOutset"];
  [v37 encodeBool:v34 forKey:v35];

  LODWORD(v34) = self->_configurationFlags;
  uint64_t v36 = [NSString stringWithFormat:@"hasCustomized-%@", @"maskedCorners"];
  [v37 encodeBool:v34 >> 15 forKey:v36];
}

- (unint64_t)hash
{
  uint64_t v3 = [(UIView *)self->_customView hash];
  unint64_t cornerRadius = (unint64_t)self->_cornerRadius;
  unint64_t v5 = v3 ^ [(UIColor *)self->_backgroundColor hash];
  uint64_t v6 = v5 ^ [(UIVisualEffect *)self->_visualEffect hash];
  unint64_t v7 = v6 ^ [(UIImage *)self->_image hash];
  return v7 ^ [(UIColor *)self->_strokeColor hash] ^ cornerRadius ^ (unint64_t)self->_strokeWidth;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = NSString;
  unint64_t v5 = _UIBackgroundConfigurationStyleToString(self->_defaultStyle);
  uint64_t v6 = [v4 stringWithFormat:@"Base Style = %@", v5];
  [v3 addObject:v6];

  if (self->_cornerRadius > 0.0)
  {
    unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"cornerRadius = %g", *(void *)&self->_cornerRadius);
    [v3 addObject:v7];
  }
  CGFloat top = self->_backgroundInsets.top;
  double leading = self->_backgroundInsets.leading;
  double bottom = self->_backgroundInsets.bottom;
  double trailing = self->_backgroundInsets.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    uint64_t v12 = NSString;
    uint64_t v13 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
    uint64_t v14 = [v12 stringWithFormat:@"backgroundInsets = %@", v13];
    [v3 addObject:v14];
  }
  unint64_t edgesAddingLayoutMarginsToBackgroundInsets = self->_edgesAddingLayoutMarginsToBackgroundInsets;
  if (edgesAddingLayoutMarginsToBackgroundInsets)
  {
    uint64_t v16 = NSString;
    if (edgesAddingLayoutMarginsToBackgroundInsets == 15)
    {
      long long v17 = @"All";
LABEL_17:
      uint64_t v22 = [v16 stringWithFormat:@"edgesAddingLayoutMarginsToBackgroundInsets = %@", v17];
      [v3 addObject:v22];

      goto LABEL_18;
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CGFloat v19 = v18;
    if (edgesAddingLayoutMarginsToBackgroundInsets)
    {
      [v18 addObject:@"Top"];
      if ((edgesAddingLayoutMarginsToBackgroundInsets & 2) == 0)
      {
LABEL_13:
        if ((edgesAddingLayoutMarginsToBackgroundInsets & 4) == 0) {
          goto LABEL_14;
        }
        goto LABEL_48;
      }
    }
    else if ((edgesAddingLayoutMarginsToBackgroundInsets & 2) == 0)
    {
      goto LABEL_13;
    }
    [v19 addObject:@"Leading"];
    if ((edgesAddingLayoutMarginsToBackgroundInsets & 4) == 0)
    {
LABEL_14:
      if ((edgesAddingLayoutMarginsToBackgroundInsets & 8) == 0)
      {
LABEL_16:
        uint64_t v20 = NSString;
        CGFloat v21 = [v19 componentsJoinedByString:@", "];
        long long v17 = [v20 stringWithFormat:@"[%@]", v21];

        goto LABEL_17;
      }
LABEL_15:
      [v19 addObject:@"Trailing"];
      goto LABEL_16;
    }
LABEL_48:
    [v19 addObject:@"Bottom"];
    if ((edgesAddingLayoutMarginsToBackgroundInsets & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_18:
  if ([(UIBackgroundConfiguration *)self _hasBackgroundColor])
  {
    if (self->_backgroundColor)
    {
      uint64_t v23 = [NSString stringWithFormat:@"backgroundColor = %@", self->_backgroundColor];
      [v3 addObject:v23];
    }
    else
    {
      [v3 addObject:@"backgroundColor = Inherited Tint Color"];
    }
    unint64_t backgroundColorTransformerIdentifier = self->_backgroundColorTransformerIdentifier;
    if (backgroundColorTransformerIdentifier)
    {
      uint64_t v25 = NSString;
      uint64_t v26 = _UIConfigurationColorTransformerIdentifierToString(backgroundColorTransformerIdentifier);
      uint64_t v27 = [v25 stringWithFormat:@"backgroundColorTransformer = %@", v26];
      [v3 addObject:v27];
    }
  }
  if (self->_visualEffect)
  {
    uint64_t v28 = [NSString stringWithFormat:@"visualEffect = %@", self->_visualEffect];
    [v3 addObject:v28];
  }
  if (self->_image)
  {
    double v29 = [NSString stringWithFormat:@"image = %@", self->_image];
    [v3 addObject:v29];

    uint64_t v30 = NSString;
    v31 = _UIViewContentModeToString(self->_imageContentMode);
    uint64_t v32 = [v30 stringWithFormat:@"imageContentMode = %@", v31];
    [v3 addObject:v32];
  }
  if ([(UIBackgroundConfiguration *)self _hasStroke])
  {
    if (self->_strokeColor)
    {
      uint64_t v33 = [NSString stringWithFormat:@"strokeColor = %@", self->_strokeColor];
      [v3 addObject:v33];
    }
    else
    {
      [v3 addObject:@"strokeColor = Inherited Tint Color"];
    }
    unint64_t strokeColorTransformerIdentifier = self->_strokeColorTransformerIdentifier;
    if (strokeColorTransformerIdentifier)
    {
      v35 = NSString;
      uint64_t v36 = _UIConfigurationColorTransformerIdentifierToString(strokeColorTransformerIdentifier);
      v37 = [v35 stringWithFormat:@"id strokeColorTransformer = %@", v36];
      [v3 addObject:v37];
    }
    uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"strokeWidth = %g", *(void *)&self->_strokeWidth);
    [v3 addObject:v38];

    if (self->_strokeOutset > 0.0)
    {
      v39 = objc_msgSend(NSString, "stringWithFormat:", @"strokeOutset = %g", *(void *)&self->_strokeOutset);
      [v3 addObject:v39];
    }
  }
  if (self->_shadowProperties)
  {
    __int16 v40 = [NSString stringWithFormat:@"shadowProperties = %@", self->_shadowProperties];
    [v3 addObject:v40];
  }
  if (self->_customView)
  {
    v41 = [NSString stringWithFormat:@"customView = %@", self->_customView];
    [v3 addObject:v41];
  }
  if ([v3 count])
  {
    __int16 v42 = [v3 componentsJoinedByString:@"; "];
  }
  else
  {
    __int16 v42 = @"empty configuration";
  }
  v43 = NSString;
  __int16 v44 = (objc_class *)objc_opt_class();
  v45 = NSStringFromClass(v44);
  __int16 v46 = [v43 stringWithFormat:@"<%@: %p; %@>", v45, self, v42];

  return (NSString *)v46;
}

- (void)setBackgroundInsets:(NSDirectionalEdgeInsets)backgroundInsets
{
  *(_WORD *)&self->_configurationFlags |= 4u;
  self->_backgroundInsets = backgroundInsets;
}

- (void)setEdgesAddingLayoutMarginsToBackgroundInsets:(NSDirectionalRectEdge)edgesAddingLayoutMarginsToBackgroundInsets
{
  *(_WORD *)&self->_configurationFlags |= 8u;
  self->_unint64_t edgesAddingLayoutMarginsToBackgroundInsets = edgesAddingLayoutMarginsToBackgroundInsets;
}

- (void)setBackgroundColorTransformer:(UIConfigurationColorTransformer)backgroundColorTransformer
{
  *(_WORD *)&self->_configurationFlags |= 0x20u;
  -[UIBackgroundConfiguration _setBackgroundColorTransformer:]((uint64_t)self, backgroundColorTransformer);
}

- (UIConfigurationColorTransformer)backgroundColorTransformer
{
  v2 = _Block_copy(self->_backgroundColorTransformer);
  return v2;
}

- (NSString)_visualEffectGroupName
{
  return self->_visualEffectGroupName;
}

- (void)_setVisualEffectAllowsTransparentBlurring:(BOOL)a3
{
}

- (BOOL)_visualEffectAllowsTransparentBlurring
{
  return [(UIBackgroundConfiguration *)self _visualEffectblurClippingMode] == 0;
}

- (void)_setVisualEffectblurClippingMode:(unint64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x100u;
  [(UIBackgroundConfiguration *)self __setVisualEffectblurClippingMode:a3];
}

- (unint64_t)_visualEffectblurClippingMode
{
  return self->_visualEffectblurClippingMode;
}

- (void)setImage:(UIImage *)image
{
  *(_WORD *)&self->_configurationFlags |= 0x200u;
  -[UIBackgroundConfiguration _setImage:]((uint64_t)self, image);
}

- (void)setImageContentMode:(UIViewContentMode)imageContentMode
{
  *(_WORD *)&self->_configurationFlags |= 0x400u;
  self->_imageContentMode = imageContentMode;
}

- (UIViewContentMode)imageContentMode
{
  return self->_imageContentMode;
}

- (void)setStrokeColorTransformer:(UIConfigurationColorTransformer)strokeColorTransformer
{
  *(_WORD *)&self->_configurationFlags |= 0x1000u;
  -[UIBackgroundConfiguration _setStrokeColorTransformer:]((uint64_t)self, strokeColorTransformer);
}

- (UIConfigurationColorTransformer)strokeColorTransformer
{
  v2 = _Block_copy(self->_strokeColorTransformer);
  return v2;
}

- (void)setStrokeOutset:(CGFloat)strokeOutset
{
  *(_WORD *)&self->_configurationFlags |= 0x4000u;
  self->_strokeOutset = strokeOutset;
}

- (void)_setMaskedCorners:(unint64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x8000u;
  [(UIBackgroundConfiguration *)self __setMaskedCorners:a3];
}

- (unint64_t)_maskedCorners
{
  return self->_maskedCorners;
}

- (BOOL)isTintBackgroundColor
{
  return self->_backgroundColor == 0;
}

- (UIColor)resolvedStrokeColorForTintColor:(UIColor *)tintColor
{
  id v4 = tintColor;
  unint64_t v5 = v4;
  strokeColor = self->_strokeColor;
  if (!strokeColor) {
    strokeColor = v4;
  }
  unint64_t v7 = strokeColor;
  id strokeColorTransformer = (void (**)(id, id))self->_strokeColorTransformer;
  if (strokeColorTransformer)
  {
    strokeColorTransformer[2](strokeColorTransformer, v7);
    uint64_t v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = v7;
  }
  uint64_t v10 = v9;

  return v10;
}

- (UIShadowProperties)shadowProperties
{
  shadowProperties = self->_shadowProperties;
  if (!shadowProperties)
  {
    id v4 = objc_alloc_init(UIShadowProperties);
    unint64_t v5 = self->_shadowProperties;
    self->_shadowProperties = v4;

    shadowProperties = self->_shadowProperties;
  }
  return shadowProperties;
}

@end