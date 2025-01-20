@interface UIListContentConfiguration
+ (BOOL)supportsSecureCoding;
+ (UIListContentConfiguration)accompaniedSidebarCellConfiguration;
+ (UIListContentConfiguration)accompaniedSidebarSubtitleCellConfiguration;
+ (UIListContentConfiguration)cellConfiguration;
+ (UIListContentConfiguration)extraProminentInsetGroupedHeaderConfiguration;
+ (UIListContentConfiguration)groupedFooterConfiguration;
+ (UIListContentConfiguration)groupedHeaderConfiguration;
+ (UIListContentConfiguration)plainFooterConfiguration;
+ (UIListContentConfiguration)plainHeaderConfiguration;
+ (UIListContentConfiguration)prominentInsetGroupedHeaderConfiguration;
+ (UIListContentConfiguration)sidebarCellConfiguration;
+ (UIListContentConfiguration)sidebarHeaderConfiguration;
+ (UIListContentConfiguration)sidebarSubtitleCellConfiguration;
+ (UIListContentConfiguration)subtitleCellConfiguration;
+ (UIListContentConfiguration)valueCellConfiguration;
+ (id)_defaultCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)_defaultGroupedFooterConfigurationForState:(void *)a3 traitCollection:;
+ (id)_defaultGroupedHeaderConfigurationForState:(void *)a3 traitCollection:;
+ (id)_defaultHeaderFooterConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 isHeader:(uint64_t)a5 style:;
+ (id)_defaultInsetGroupedCellConfiguration;
+ (id)_defaultInsetGroupedCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)_defaultInsetGroupedHeaderConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 isExtraProminent:;
+ (id)_defaultPlainFooterConfigurationForState:(void *)a3 traitCollection:;
+ (id)_defaultPlainHeaderConfigurationForState:(void *)a3 traitCollection:;
+ (id)_defaultSidebarCellConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 style:;
+ (id)_defaultSidebarHeaderConfigurationForState:(void *)a3 traitCollection:;
+ (id)_defaultSidebarSubtitleCellConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 style:;
+ (id)_defaultSubtitleCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)_defaultValueCellConfigurationForState:(void *)a3 traitCollection:;
+ (id)_footerConfiguration;
+ (id)_headerConfiguration;
+ (id)_sidebarPlainCellConfiguration;
+ (id)footerConfiguration;
+ (id)headerConfiguration;
+ (void)_applySidebarCellStylingToConfiguration:(void *)a3 forState:(void *)a4 traitCollection:(uint64_t)a5 cellStyle:(uint64_t)a6 sidebarStyle:;
- (BOOL)_enforcesMinimumHeight;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersSideBySideTextAndSecondaryText;
- (CGFloat)imageToTextPadding;
- (CGFloat)textToSecondaryTextHorizontalPadding;
- (CGFloat)textToSecondaryTextVerticalPadding;
- (NSAttributedString)attributedText;
- (NSAttributedString)secondaryAttributedText;
- (NSDirectionalEdgeInsets)directionalLayoutMargins;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)secondaryText;
- (NSString)text;
- (UIAxis)axesPreservingSuperviewLayoutMargins;
- (UIImage)image;
- (UIListContentConfiguration)initWithCoder:(id)a3;
- (UIListContentImageProperties)imageProperties;
- (UIListContentTextProperties)secondaryTextProperties;
- (UIListContentTextProperties)textProperties;
- (double)_minimumHeightForTraitCollection:(id)a3;
- (double)alpha;
- (id)_descriptionPropertiesForFullDescription:(uint64_t)a1;
- (id)_initWithImageProperties:(void *)a3 textProperties:(void *)a4 secondaryTextProperties:(char)a5 directionalLayoutMargins:(double)a6 prefersSideBySideTextAndSecondaryText:(double)a7 imageToTextPadding:(double)a8 textToSecondaryTextVerticalPadding:(double)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)makeContentView;
- (id)updatedConfigurationForState:(id)a3;
- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1;
- (unint64_t)hash;
- (void)_setDefaultStyle:(uint64_t)a1;
- (void)_setEnforcesMinimumHeight:(BOOL)a3;
- (void)_setSwiftBridgingImageProperties:(id)a3;
- (void)_setSwiftBridgingSecondaryTextProperties:(id)a3;
- (void)_setSwiftBridgingTextProperties:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setAttributedText:(NSAttributedString *)attributedText;
- (void)setAxesPreservingSuperviewLayoutMargins:(UIAxis)axesPreservingSuperviewLayoutMargins;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)directionalLayoutMargins;
- (void)setImage:(UIImage *)image;
- (void)setImageToTextPadding:(CGFloat)imageToTextPadding;
- (void)setPrefersSideBySideTextAndSecondaryText:(BOOL)prefersSideBySideTextAndSecondaryText;
- (void)setSecondaryAttributedText:(NSAttributedString *)secondaryAttributedText;
- (void)setSecondaryText:(NSString *)secondaryText;
- (void)setText:(NSString *)text;
- (void)setTextToSecondaryTextHorizontalPadding:(CGFloat)textToSecondaryTextHorizontalPadding;
- (void)setTextToSecondaryTextVerticalPadding:(CGFloat)textToSecondaryTextVerticalPadding;
@end

@implementation UIListContentConfiguration

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)directionalLayoutMargins
{
  *(_WORD *)&self->_configurationFlags |= 2u;
  self->_directionalLayoutMargins = directionalLayoutMargins;
}

+ (UIListContentConfiguration)prominentInsetGroupedHeaderConfiguration
{
  v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v4 = +[UITraitCollection _fallbackTraitCollection]();
  v5 = +[UIListContentConfiguration _defaultInsetGroupedHeaderConfigurationForState:traitCollection:isExtraProminent:]((uint64_t)a1, v3, v4, 0);

  return (UIListContentConfiguration *)v5;
}

+ (UIListContentConfiguration)groupedHeaderConfiguration
{
  v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v4 = +[UITraitCollection _fallbackTraitCollection]();
  v5 = +[UIListContentConfiguration _defaultGroupedHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIListContentConfiguration *)v5;
}

- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1
{
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3 == (void **)a1) {
      a1 = 1;
    }
    else {
      a1 = *(void **)(a1 + 56) == v3[7]
    }
        && ((*((unsigned __int16 *)v3 + 4) ^ *(unsigned __int16 *)(a1 + 8)) & 0x100) == 0
        && *(double *)(a1 + 48) == *((double *)v3 + 6)
        && -[UIListContentImageProperties _isEqualToPropertiesQuick:compareImage:](*(void *)(a1 + 64), v3[8], 1)&& -[UIListContentTextProperties _isEqualToPropertiesQuick:compareText:](*(void *)(a1 + 72), v4[9], 1)&& -[UIListContentTextProperties _isEqualToPropertiesQuick:compareText:](*(void *)(a1 + 80), v4[10], 1)&& *(void **)(a1 + 16) == v4[2]&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 88), *(float64x2_t *)(v4 + 11)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 104), *(float64x2_t *)(v4 + 13)))), 0xFuLL))) & 1) != 0
        && *(unsigned __int8 *)(a1 + 12) == *((unsigned __int8 *)v4 + 12)
        && *(double *)(a1 + 24) == *((double *)v4 + 3)
        && *(double *)(a1 + 32) == *((double *)v4 + 4)
        && *(double *)(a1 + 40) == *((double *)v4 + 5)
        && *(unsigned __int8 *)(a1 + 13) == *((unsigned __int8 *)v4 + 13);
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextProperties, 0);
  objc_storeStrong((id *)&self->_textProperties, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
}

- (id)updatedConfigurationForState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIListContentConfiguration *)self copy];
  if (self) {
    int64_t defaultStyle = self->_defaultStyle;
  }
  else {
    int64_t defaultStyle = 0;
  }
  id v7 = v4;
  uint64_t v8 = self;
  v9 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, v7);
  v10 = [v7 traitCollection];
  if (dyld_program_sdk_at_least()
    && (unint64_t)defaultStyle <= 0x12
    && ((1 << defaultStyle) & 0x60007) != 0)
  {
    unint64_t v11 = _UICollectionViewListStyleFromListEnvironment([v10 listEnvironment]);
    unint64_t v12 = v11;
    if (defaultStyle > 1)
    {
      if (defaultStyle != 2)
      {
        if (defaultStyle == 17)
        {
          switch(v11)
          {
            case 0uLL:
            case 4uLL:
              goto LABEL_80;
            case 1uLL:
            case 2uLL:
              uint64_t v13 = +[UIListContentConfiguration _defaultGroupedHeaderConfigurationForState:traitCollection:](v8, v9, v10);
              break;
            case 3uLL:
              uint64_t v13 = +[UIListContentConfiguration _defaultSidebarHeaderConfigurationForState:traitCollection:](v8, v9, v10);
              break;
            default:
              v46 = [MEMORY[0x1E4F28B00] currentHandler];
              objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, @"UIListContentConfiguration.m", 729, @"Unknown list appearance style in trait collection. Style: %ld; trait collection: %@",
                v12,
                v10);

LABEL_80:
              uint64_t v13 = +[UIListContentConfiguration _defaultPlainHeaderConfigurationForState:traitCollection:](v8, v9, v10);
              break;
          }
          goto LABEL_86;
        }
        if (defaultStyle == 18)
        {
          switch(v11)
          {
            case 0uLL:
            case 4uLL:
              goto LABEL_78;
            case 1uLL:
            case 2uLL:
            case 3uLL:
              uint64_t v13 = +[UIListContentConfiguration _defaultGroupedFooterConfigurationForState:traitCollection:](v8, v9, v10);
              break;
            default:
              v44 = [MEMORY[0x1E4F28B00] currentHandler];
              v45 = [NSString stringWithUTF8String:"+[UIListContentConfiguration _defaultConfigurationForStyle:state:]"];
              objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"UIListContentConfiguration.m", 750, @"Unknown list appearance style in trait collection. Style: %ld; trait collection: %@",
                v12,
                v10);

LABEL_78:
              uint64_t v13 = +[UIListContentConfiguration _defaultPlainFooterConfigurationForState:traitCollection:](v8, v9, v10);
              break;
          }
          goto LABEL_86;
        }
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:sel__defaultConfigurationForStyle_state_, v8, @"UIListContentConfiguration.m", 756, @"Attempting to unknown resolve generic content configuration style: %ld for state: %@", defaultStyle, v7 object file lineNumber description];

        goto LABEL_48;
      }
      if (v11 >= 2)
      {
        if (v11 - 3 < 2)
        {
          uint64_t v22 = [v10 _splitViewControllerContext];
          uint64_t v23 = 1;
          if (v22 == 2) {
            uint64_t v23 = 2;
          }
          if (v12 != 3) {
            uint64_t v23 = 0;
          }
          if (v12 == 4) {
            uint64_t v24 = 3;
          }
          else {
            uint64_t v24 = v23;
          }
          id v25 = v10;
          id v26 = v9;
          uint64_t v27 = self;
          uint64_t v28 = +[UIListContentConfiguration _defaultValueCellConfigurationForState:traitCollection:](v27, v26, v25);
          +[UIListContentConfiguration _applySidebarCellStylingToConfiguration:forState:traitCollection:cellStyle:sidebarStyle:](v27, (void *)v28, v26, v25, 1, v24);

          goto LABEL_87;
        }
        if (v11 == 2)
        {
          uint64_t v43 = +[UIListContentConfiguration _defaultValueCellConfigurationForState:traitCollection:](v8, v9, v10);
          goto LABEL_74;
        }
        v48 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, @"UIListContentConfiguration.m", 709, @"Unknown list appearance style in trait collection. Style: %ld; trait collection: %@",
          v12,
          v10);
      }
      uint64_t v13 = +[UIListContentConfiguration _defaultValueCellConfigurationForState:traitCollection:](v8, v9, v10);
      goto LABEL_86;
    }
    if (!defaultStyle)
    {
      if (v11 >= 2)
      {
        if (v11 - 3 < 2)
        {
          uint64_t v29 = [v10 _splitViewControllerContext];
          uint64_t v30 = 1;
          if (v29 == 2) {
            uint64_t v30 = 2;
          }
          if (v12 != 3) {
            uint64_t v30 = 0;
          }
          if (v12 == 4) {
            uint64_t v31 = 3;
          }
          else {
            uint64_t v31 = v30;
          }
          uint64_t v13 = +[UIListContentConfiguration _defaultSidebarCellConfigurationForState:traitCollection:style:](v8, v9, v10, v31);
          goto LABEL_86;
        }
        if (v11 == 2)
        {
          uint64_t v13 = +[UIListContentConfiguration _defaultInsetGroupedCellConfigurationForState:traitCollection:](v8, v9, v10);
          goto LABEL_86;
        }
        v67 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, @"UIListContentConfiguration.m", 659, @"Unknown list appearance style in trait collection. Style: %ld; trait collection: %@",
          v12,
          v10);
      }
LABEL_48:
      uint64_t v13 = +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:](v8, v9, v10);
LABEL_86:
      uint64_t v28 = v13;
      goto LABEL_87;
    }
    if (v11 >= 2)
    {
      if (v11 - 3 < 2)
      {
        uint64_t v19 = [v10 _splitViewControllerContext];
        uint64_t v20 = 1;
        if (v19 == 2) {
          uint64_t v20 = 2;
        }
        if (v12 != 3) {
          uint64_t v20 = 0;
        }
        if (v12 == 4) {
          uint64_t v21 = 3;
        }
        else {
          uint64_t v21 = v20;
        }
        uint64_t v13 = +[UIListContentConfiguration _defaultSidebarSubtitleCellConfigurationForState:traitCollection:style:](v8, v9, v10, v21);
        goto LABEL_86;
      }
      if (v11 == 2)
      {
        uint64_t v43 = +[UIListContentConfiguration _defaultSubtitleCellConfigurationForState:traitCollection:](v8, v9, v10);
LABEL_74:
        uint64_t v28 = v43;
        self;
        goto LABEL_87;
      }
      v47 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, @"UIListContentConfiguration.m", 684, @"Unknown list appearance style in trait collection. Style: %ld; trait collection: %@",
        v12,
        v10);
    }
    uint64_t v13 = +[UIListContentConfiguration _defaultSubtitleCellConfigurationForState:traitCollection:](v8, v9, v10);
    goto LABEL_86;
  }
  id v14 = v9;
  id v15 = v10;
  uint64_t v16 = self;
  uint64_t v17 = v16;
  switch(defaultStyle)
  {
    case 0:
      goto LABEL_51;
    case 1:
      uint64_t v18 = +[UIListContentConfiguration _defaultSubtitleCellConfigurationForState:traitCollection:](v16, v14, v15);
      break;
    case 2:
      uint64_t v18 = +[UIListContentConfiguration _defaultValueCellConfigurationForState:traitCollection:](v16, v14, v15);
      break;
    case 3:
    case 17:
      uint64_t v18 = +[UIListContentConfiguration _defaultPlainHeaderConfigurationForState:traitCollection:](v16, v14, v15);
      break;
    case 4:
    case 18:
      uint64_t v18 = +[UIListContentConfiguration _defaultPlainFooterConfigurationForState:traitCollection:](v16, v14, v15);
      break;
    case 5:
      uint64_t v18 = +[UIListContentConfiguration _defaultGroupedHeaderConfigurationForState:traitCollection:](v16, v14, v15);
      break;
    case 6:
      uint64_t v18 = +[UIListContentConfiguration _defaultGroupedFooterConfigurationForState:traitCollection:](v16, v14, v15);
      break;
    case 7:
      v34 = v14;
      v35 = v15;
      uint64_t v36 = 1;
      goto LABEL_66;
    case 8:
      v37 = v14;
      v38 = v15;
      uint64_t v39 = 1;
      goto LABEL_68;
    case 9:
      uint64_t v18 = +[UIListContentConfiguration _defaultSidebarHeaderConfigurationForState:traitCollection:](v16, v14, v15);
      break;
    case 10:
      v34 = v14;
      v35 = v15;
      uint64_t v36 = 2;
      goto LABEL_66;
    case 11:
      v37 = v14;
      v38 = v15;
      uint64_t v39 = 2;
      goto LABEL_68;
    case 12:
      v40 = v14;
      v41 = v15;
      uint64_t v42 = 0;
      goto LABEL_63;
    case 13:
      v40 = v14;
      v41 = v15;
      uint64_t v42 = 1;
LABEL_63:
      uint64_t v18 = +[UIListContentConfiguration _defaultInsetGroupedHeaderConfigurationForState:traitCollection:isExtraProminent:](v16, v40, v41, v42);
      break;
    case 14:
      uint64_t v18 = +[UIListContentConfiguration _defaultInsetGroupedCellConfigurationForState:traitCollection:](v16, v14, v15);
      break;
    case 15:
      v34 = v14;
      v35 = v15;
      uint64_t v36 = 3;
LABEL_66:
      uint64_t v18 = +[UIListContentConfiguration _defaultSidebarCellConfigurationForState:traitCollection:style:](v16, v34, v35, v36);
      break;
    case 16:
      v37 = v14;
      v38 = v15;
      uint64_t v39 = 3;
LABEL_68:
      uint64_t v18 = +[UIListContentConfiguration _defaultSidebarSubtitleCellConfigurationForState:traitCollection:style:](v16, v37, v38, v39);
      break;
    default:
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForFixedStyle_state_traitCollection_, v17, @"UIListContentConfiguration.m", 822, @"Default configuration requested for unknown style: %ld; state: %@; trait collection: %@",
        defaultStyle,
        v14,
        v15);

LABEL_51:
      uint64_t v18 = +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:](v17, v14, v15);
      break;
  }
  uint64_t v28 = v18;

LABEL_87:
  v49 = [(id)v5 imageProperties];
  v50 = [(id)v28 imageProperties];
  -[UIListContentImageProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v49, v50);

  v51 = [(id)v5 textProperties];
  v52 = [(id)v28 textProperties];
  -[UIListContentTextProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v51, v52);

  v53 = [(id)v5 secondaryTextProperties];
  v54 = [(id)v28 secondaryTextProperties];
  -[UIListContentTextProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v53, v54);

  __int16 configurationFlags = (__int16)self->_configurationFlags;
  if (configurationFlags) {
    goto LABEL_91;
  }
  if (v28)
  {
    uint64_t v56 = *(void *)(v28 + 16);
    if (!v5) {
      goto LABEL_91;
    }
    goto LABEL_90;
  }
  uint64_t v56 = 0;
  if (v5)
  {
LABEL_90:
    *(void *)(v5 + 16) = v56;
    __int16 configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_91:
  if ((configurationFlags & 2) != 0) {
    goto LABEL_95;
  }
  if (v28)
  {
    long long v57 = *(_OWORD *)(v28 + 88);
    long long v58 = *(_OWORD *)(v28 + 104);
    if (!v5) {
      goto LABEL_95;
    }
    goto LABEL_94;
  }
  long long v57 = 0uLL;
  long long v58 = 0uLL;
  if (v5)
  {
LABEL_94:
    *(_OWORD *)(v5 + 88) = v57;
    *(_OWORD *)(v5 + 104) = v58;
    __int16 configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_95:
  if ((configurationFlags & 4) != 0) {
    goto LABEL_99;
  }
  if (v28)
  {
    BOOL v59 = *(unsigned char *)(v28 + 12) != 0;
    if (!v5) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
  BOOL v59 = 0;
  if (v5)
  {
LABEL_98:
    *(unsigned char *)(v5 + 12) = v59;
    __int16 configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_99:
  if ((configurationFlags & 8) != 0) {
    goto LABEL_103;
  }
  if (v28)
  {
    uint64_t v60 = *(void *)(v28 + 24);
    if (!v5) {
      goto LABEL_103;
    }
    goto LABEL_102;
  }
  uint64_t v60 = 0;
  if (v5)
  {
LABEL_102:
    *(void *)(v5 + 24) = v60;
    __int16 configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_103:
  if ((configurationFlags & 0x10) != 0) {
    goto LABEL_107;
  }
  if (v28)
  {
    uint64_t v61 = *(void *)(v28 + 32);
    if (!v5) {
      goto LABEL_107;
    }
    goto LABEL_106;
  }
  uint64_t v61 = 0;
  if (v5)
  {
LABEL_106:
    *(void *)(v5 + 32) = v61;
    __int16 configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_107:
  if ((configurationFlags & 0x20) != 0) {
    goto LABEL_111;
  }
  if (v28)
  {
    uint64_t v62 = *(void *)(v28 + 40);
    if (!v5) {
      goto LABEL_111;
    }
    goto LABEL_110;
  }
  uint64_t v62 = 0;
  if (v5)
  {
LABEL_110:
    *(void *)(v5 + 40) = v62;
    __int16 configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_111:
  if ((configurationFlags & 0x80) != 0) {
    goto LABEL_115;
  }
  if (v28)
  {
    uint64_t v63 = *(void *)(v28 + 48);
    if (!v5) {
      goto LABEL_115;
    }
    goto LABEL_114;
  }
  uint64_t v63 = 0;
  if (v5)
  {
LABEL_114:
    *(void *)(v5 + 48) = v63;
    __int16 configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_115:
  if ((configurationFlags & 0x40) != 0) {
    goto LABEL_119;
  }
  if (v28)
  {
    BOOL v64 = *(unsigned char *)(v28 + 13) != 0;
    if (!v5) {
      goto LABEL_119;
    }
    goto LABEL_118;
  }
  BOOL v64 = 0;
  if (v5) {
LABEL_118:
  }
    *(unsigned char *)(v5 + 13) = v64;
LABEL_119:
  if (v28) {
    __int16 v65 = *(_WORD *)(v28 + 8) & 0x100;
  }
  else {
    __int16 v65 = 0;
  }
  *(_WORD *)(v5 + 8) = *(_WORD *)(v5 + 8) & 0xFEFF | v65;

  return (id)v5;
}

- (UIListContentTextProperties)textProperties
{
  return self->_textProperties;
}

- (UIListContentImageProperties)imageProperties
{
  return self->_imageProperties;
}

- (UIListContentTextProperties)secondaryTextProperties
{
  return self->_secondaryTextProperties;
}

+ (id)_defaultCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = _UITableConstantsForTraitCollection(v4);
  id v7 = objc_alloc_init(UIListContentImageProperties);
  v9 = [v6 defaultImageSymbolConfigurationForTraitCollection:v4];
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v8, v9, 24);
  }

  v10 = [v6 defaultImageTintColorForState:v5 traitCollection:v4];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v7, v10);

  unint64_t v11 = objc_alloc_init(UIListContentTextProperties);
  unint64_t v12 = [v6 defaultTextLabelFontForCellStyle:0];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v12);

  uint64_t v13 = [v6 defaultTextColorForCellStyle:0 traitCollection:v4 tintColor:0 state:v5];
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v11, v13);

  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v6, v4, 0);
  id v14 = objc_alloc_init(UIListContentTextProperties);
  id v15 = [v6 defaultDetailTextFontForCellStyle:3];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v14, v15);

  uint64_t v16 = [v6 defaultDetailTextColorForCellStyle:3 traitCollection:v4 state:v5];

  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v14, v16);
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v6, v4, 0);
  double v17 = _UICellContentViewDefaultDirectionalLayoutMargins(v6, v4, 0, 0, 0);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  [v6 defaultImageToTextPaddingForSidebar:0];
  double v25 = v24;
  [v6 defaultTextToSubtitlePaddingForCellStyle:0];
  uint64_t v27 = -[UIListContentConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:directionalLayoutMargins:prefersSideBySideTextAndSecondaryText:imageToTextPadding:textToSecondaryTextVerticalPadding:]((id *)[UIListContentConfiguration alloc], v7, v11, v14, 0, v17, v19, v21, v23, v25, v26);
  uint64_t v28 = v27;
  if (v27)
  {
    v27[7] = 0;
    __int16 v29 = *((_WORD *)v27 + 4);
    if ((v29 & 0x40) == 0) {
      *((unsigned char *)v27 + 13) = 1;
    }
    *((_WORD *)v27 + 4) = v29 & 0xFEFF;
  }

  return v28;
}

+ (id)_defaultInsetGroupedHeaderConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 isExtraProminent:
{
  id v6 = a2;
  id v7 = a3;
  self;
  uint64_t v8 = _UITableConstantsForTraitCollection(v7);
  v9 = objc_alloc_init(UIListContentImageProperties);
  unint64_t v11 = [v8 defaultImageSymbolConfigurationForTraitCollection:v7];
  if (v9) {
    objc_setProperty_nonatomic_copy(v9, v10, v11, 24);
  }

  unint64_t v12 = objc_alloc_init(UIListContentTextProperties);
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v12, v8, v7, 0);

  if (v12) {
    v12->_showsExpansionTextWhenTruncated = 0;
  }
  uint64_t v13 = (void *)[(UIListContentTextProperties *)v12 copy];
  if (objc_opt_respondsToSelector())
  {
    id v14 = [v8 defaultInsetGroupedHeaderFontForExtraProminentStyle:a4 secondaryText:0];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v12, v14);

    id v15 = [v8 defaultInsetGroupedHeaderFontForExtraProminentStyle:a4 secondaryText:1];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v13, v15);
  }
  uint64_t v16 = +[UIColor labelColor];
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v12, v16);

  double v17 = +[UIColor secondaryLabelColor];
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v13, v17);

  id v18 = v6;
  if ([v18 isDisabled])
  {
    char v19 = [v18 isSwiped];

    if ((v19 & 1) == 0)
    {
      double v20 = +[UIColor quaternaryLabelColor];
      -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v9, v20);

      double v21 = +[UIColor quaternaryLabelColor];
      -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v12, v21);

      double v22 = +[UIColor quaternaryLabelColor];
      -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v13, v22);

      goto LABEL_13;
    }
  }
  else
  {
  }
  if ([v18 isHighlighted])
  {
    -[UIListContentImageProperties _setTintColorTransformerIdentifier:]((uint64_t)v9, 7);
    -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v12, 7);
    -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v13, 7);
  }
LABEL_13:
  double v23 = 0.0;
  double v24 = 0.0;
  double v25 = 0.0;
  double v26 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v8 defaultInsetGroupedHeaderLayoutMarginsForExtraProminentStyle:a4];
    double v26 = v27;
    double v25 = v28;
    double v24 = v29;
    double v23 = v30;
  }
  [v8 defaultImageToTextPaddingForSidebar:0];
  double v32 = v31;
  [v8 defaultTextToSubtitlePaddingForCellStyle:0];
  v34 = -[UIListContentConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:directionalLayoutMargins:prefersSideBySideTextAndSecondaryText:imageToTextPadding:textToSecondaryTextVerticalPadding:]((id *)[UIListContentConfiguration alloc], v9, v12, v13, 0, v26, v25, v24, v23, v32, v33);
  v35 = v34;
  if (v34) {
    v34[2] = 0;
  }
  if (a4) {
    unint64_t v36 = 13;
  }
  else {
    unint64_t v36 = 12;
  }
  -[UIListContentConfiguration _setDefaultStyle:]((uint64_t)v34, v36);

  return v35;
}

- (id)_initWithImageProperties:(void *)a3 textProperties:(void *)a4 secondaryTextProperties:(char)a5 directionalLayoutMargins:(double)a6 prefersSideBySideTextAndSecondaryText:(double)a7 imageToTextPadding:(double)a8 textToSecondaryTextVerticalPadding:(double)a9
{
  id v22 = a2;
  id v23 = a3;
  id v24 = a4;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)UIListContentConfiguration;
    double v25 = (id *)objc_msgSendSuper2(&v27, sel_init);
    a1 = v25;
    if (v25)
    {
      objc_storeStrong(v25 + 8, a2);
      objc_storeStrong(a1 + 9, a3);
      objc_storeStrong(a1 + 10, a4);
      a1[2] = (id)1;
      *((double *)a1 + 11) = a6;
      *((double *)a1 + 12) = a7;
      *((double *)a1 + 13) = a8;
      *((double *)a1 + 14) = a9;
      *((unsigned char *)a1 + 12) = a5;
      *((double *)a1 + 3) = a10;
      a1[4] = (id)0x4020000000000000;
      *((double *)a1 + 5) = a11;
      a1[6] = (id)0x3FF0000000000000;
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(UIListContentImageProperties *)self->_imageProperties copy];
    id v6 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v5;

    uint64_t v7 = [(UIListContentTextProperties *)self->_textProperties copy];
    uint64_t v8 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v7;

    uint64_t v9 = [(UIListContentTextProperties *)self->_secondaryTextProperties copy];
    v10 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v9;

    *(void *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    long long v11 = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 88) = v11;
    *(unsigned char *)(v4 + 12) = self->_prefersSideBySideTextAndSecondaryText;
    *(double *)(v4 + 24) = self->_imageToTextPadding;
    *(double *)(v4 + 32) = self->_textToSecondaryTextHorizontalPadding;
    *(double *)(v4 + 40) = self->_textToSecondaryTextVerticalPadding;
    *(double *)(v4 + 48) = self->_alpha;
    *(unsigned char *)(v4 + 13) = self->_enforcesMinimumHeight;
    *(void *)(v4 + 56) = self->_defaultStyle;
    *($B71C294484D86EC4F08CB958832877D7 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (void)_setDefaultStyle:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a1 + 56) = a2;
    if ((*(unsigned char *)(a1 + 8) & 0x40) == 0)
    {
      switch(a2)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 7uLL:
        case 8uLL:
        case 0xAuLL:
        case 0xBuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
          *(unsigned char *)(a1 + 13) = 1;
          break;
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 0xCuLL:
        case 0xDuLL:
        case 0x11uLL:
        case 0x12uLL:
          *(unsigned char *)(a1 + 13) = 0;
          break;
        case 9uLL:
          *(unsigned char *)(a1 + 13) = 1;
          goto LABEL_8;
        default:
          uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setDefaultStyle_, a1, @"UIListContentConfiguration.m", 902, @"Unknown style: %ld", *(void *)(a1 + 56));

          *(unsigned char *)(a1 + 13) = 1;
          a2 = *(void *)(a1 + 56);
          break;
      }
    }
    if (a2 <= 0x10 && ((1 << a2) & 0x18F80) != 0) {
LABEL_8:
    }
      __int16 v3 = *(_WORD *)(a1 + 8) | 0x100;
    else {
      __int16 v3 = *(_WORD *)(a1 + 8) & 0xFEFF;
    }
    *(_WORD *)(a1 + 8) = v3;
  }
}

- (CGFloat)imageToTextPadding
{
  return self->_imageToTextPadding;
}

- (BOOL)prefersSideBySideTextAndSecondaryText
{
  return self->_prefersSideBySideTextAndSecondaryText;
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
}

- (void)setImage:(UIImage *)image
{
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

- (double)alpha
{
  return self->_alpha;
}

- (UIImage)image
{
  return (UIImage *)-[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_imageProperties->super.isa);
}

- (CGFloat)textToSecondaryTextVerticalPadding
{
  return self->_textToSecondaryTextVerticalPadding;
}

+ (UIListContentConfiguration)extraProminentInsetGroupedHeaderConfiguration
{
  __int16 v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  uint64_t v4 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v5 = +[UIListContentConfiguration _defaultInsetGroupedHeaderConfigurationForState:traitCollection:isExtraProminent:]((uint64_t)a1, v3, v4, 1);

  return (UIListContentConfiguration *)v5;
}

+ (UIListContentConfiguration)cellConfiguration
{
  __int16 v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  uint64_t v4 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v5 = +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultInsetGroupedCellConfiguration
{
  __int16 v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  uint64_t v4 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v5 = +[UIListContentConfiguration _defaultInsetGroupedCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return v5;
}

+ (id)_defaultInsetGroupedCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:]((uint64_t)UIListContentConfiguration, v5, v4);

  self;
  if (v6)
  {
    *(void *)(v6 + 56) = 14;
    __int16 v7 = *(_WORD *)(v6 + 8);
    if ((v7 & 0x40) == 0) {
      *(unsigned char *)(v6 + 13) = 1;
    }
    *(_WORD *)(v6 + 8) = v7 & 0xFEFF;
  }
  return (id)v6;
}

+ (UIListContentConfiguration)plainHeaderConfiguration
{
  __int16 v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIListContentConfiguration _defaultPlainHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultPlainHeaderConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  uint64_t v7 = +[UIListContentConfiguration _defaultHeaderFooterConfigurationForState:traitCollection:isHeader:style:](v6, v5, v4, 1, 0);

  if (v7)
  {
    *(void *)(v7 + 56) = 3;
    __int16 v8 = *(_WORD *)(v7 + 8);
    if ((v8 & 0x40) == 0) {
      *(unsigned char *)(v7 + 13) = 0;
    }
    *(_WORD *)(v7 + 8) = v8 & 0xFEFF;
  }
  return (id)v7;
}

- (double)_minimumHeightForTraitCollection:(id)a3
{
  if (!self->_enforcesMinimumHeight) {
    return 0.0;
  }
  id v3 = a3;
  id v4 = _UITableConstantsForTraitCollection(v3);
  id v5 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  [v4 minimumContentViewHeightForFont:v5 traitCollection:v3];
  double v7 = v6;

  return v7;
}

+ (id)_defaultGroupedHeaderConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  uint64_t v7 = +[UIListContentConfiguration _defaultHeaderFooterConfigurationForState:traitCollection:isHeader:style:](v6, v5, v4, 1, 1);

  if (v7)
  {
    *(void *)(v7 + 56) = 5;
    __int16 v8 = *(_WORD *)(v7 + 8);
    if ((v8 & 0x40) == 0) {
      *(unsigned char *)(v7 + 13) = 0;
    }
    *(_WORD *)(v7 + 8) = v8 & 0xFEFF;
  }
  return (id)v7;
}

+ (id)_defaultHeaderFooterConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 isHeader:(uint64_t)a5 style:
{
  id v8 = a2;
  id v9 = a3;
  self;
  v10 = _UITableConstantsForTraitCollection(v9);
  long long v11 = objc_alloc_init(UIListContentImageProperties);
  uint64_t v13 = [v10 defaultImageSymbolConfigurationForTraitCollection:v9];
  if (v11) {
    objc_setProperty_nonatomic_copy(v11, v12, v13, 24);
  }

  id v14 = [v10 defaultImageTintColorForState:v8 traitCollection:v9];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v14);

  id v15 = objc_alloc_init(UIListContentTextProperties);
  if (a4)
  {
    uint64_t v16 = [v10 defaultHeaderFontForTableViewStyle:a5];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v15, v16);

    objc_msgSend(v10, "defaultHeaderTextColorForTableViewStyle:focused:", a5, objc_msgSend(v8, "isFocused"));
  }
  else
  {
    double v17 = [v10 defaultFooterFontForTableViewStyle:a5];
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v15, v17);

    objc_msgSend(v10, "defaultFooterTextColorForTableViewStyle:focused:", a5, objc_msgSend(v8, "isFocused"));
  id v18 = };
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v15, v18);

  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v15, v10, v9, 0);
  if (v15)
  {
    v15->_showsExpansionTextWhenTruncated = 0;
    v15->_transform = [v10 shouldUppercaseHeaderFooterTextForTableStyle:a5 isHeader:a4];
  }
  else
  {
    [v10 shouldUppercaseHeaderFooterTextForTableStyle:a5 isHeader:a4];
  }
  uint64_t v19 = [(UIListContentTextProperties *)v15 copy];
  double v20 = (void *)v19;
  if (v19) {
    *(void *)(v19 + 96) = 0;
  }
  [v10 defaultHeaderFooterLayoutMarginsForTableViewStyle:a5 isHeader:a4 isFirstSection:0];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  uint64_t v29 = [v9 layoutDirection];
  if (v29 == 1) {
    double v30 = v28;
  }
  else {
    double v30 = v24;
  }
  if (v29 != 1) {
    double v24 = v28;
  }
  [v10 defaultImageToTextPaddingForSidebar:0];
  double v32 = v31;
  [v10 defaultTextToSubtitlePaddingForCellStyle:0];
  v34 = -[UIListContentConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:directionalLayoutMargins:prefersSideBySideTextAndSecondaryText:imageToTextPadding:textToSecondaryTextVerticalPadding:]((id *)[UIListContentConfiguration alloc], v11, v15, v20, 0, v22, v30, v26, v24, v32, v33);

  return v34;
}

- (void)setImageToTextPadding:(CGFloat)imageToTextPadding
{
  *(_WORD *)&self->_configurationFlags |= 8u;
  self->_imageToTextPadding = imageToTextPadding;
}

- (void)setAxesPreservingSuperviewLayoutMargins:(UIAxis)axesPreservingSuperviewLayoutMargins
{
  *(_WORD *)&self->_configurationFlags |= 1u;
  self->_axesPreservingSuperviewLayoutMargins = axesPreservingSuperviewLayoutMargins;
}

- (id)makeContentView
{
  v2 = [[UIListContentView alloc] initWithConfiguration:self];
  return v2;
}

- (void)setText:(NSString *)text
{
}

+ (UIListContentConfiguration)valueCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIListContentConfiguration _defaultValueCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultValueCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = _UITableConstantsForTraitCollection(v4);
  uint64_t v7 = objc_alloc_init(UIListContentImageProperties);
  id v9 = [v6 defaultImageSymbolConfigurationForTraitCollection:v4];
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v8, v9, 24);
  }

  v10 = [v6 defaultImageTintColorForState:v5 traitCollection:v4];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v7, v10);

  long long v11 = objc_alloc_init(UIListContentTextProperties);
  unint64_t v12 = [v6 defaultTextLabelFontForCellStyle:1];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v12);

  uint64_t v13 = [v6 defaultTextColorForCellStyle:1 traitCollection:v4 tintColor:0 state:v5];
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v11, v13);

  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v6, v4, 0);
  id v14 = objc_alloc_init(UIListContentTextProperties);
  id v15 = [v6 defaultDetailTextFontForCellStyle:1];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v14, v15);

  uint64_t v16 = [v6 defaultDetailTextColorForCellStyle:1 traitCollection:v4 state:v5];

  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v14, v16);
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v6, v4, 0);
  double v17 = _UICellContentViewDefaultDirectionalLayoutMargins(v6, v4, 1, 0, 0);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  [v6 defaultImageToTextPaddingForSidebar:0];
  double v25 = v24;
  [v6 defaultTextToSubtitlePaddingForCellStyle:1];
  double v27 = -[UIListContentConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:directionalLayoutMargins:prefersSideBySideTextAndSecondaryText:imageToTextPadding:textToSecondaryTextVerticalPadding:]((id *)[UIListContentConfiguration alloc], v7, v11, v14, 1, v17, v19, v21, v23, v25, v26);
  double v28 = v27;
  if (v27)
  {
    v27[7] = (id)2;
    __int16 v29 = *((_WORD *)v27 + 4);
    if ((v29 & 0x40) == 0) {
      *((unsigned char *)v27 + 13) = 1;
    }
    *((_WORD *)v27 + 4) = v29 & 0xFEFF;
  }

  return v28;
}

+ (UIListContentConfiguration)subtitleCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIListContentConfiguration _defaultSubtitleCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultSubtitleCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = _UITableConstantsForTraitCollection(v4);
  uint64_t v7 = objc_alloc_init(UIListContentImageProperties);
  id v9 = [v6 defaultImageSymbolConfigurationForTraitCollection:v4];
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v8, v9, 24);
  }

  v10 = [v6 defaultImageTintColorForState:v5 traitCollection:v4];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v7, v10);

  long long v11 = objc_alloc_init(UIListContentTextProperties);
  unint64_t v12 = [v6 defaultTextLabelFontForCellStyle:3];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v12);

  uint64_t v13 = [v6 defaultTextColorForCellStyle:3 traitCollection:v4 tintColor:0 state:v5];
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v11, v13);

  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v6, v4, 0);
  id v14 = objc_alloc_init(UIListContentTextProperties);
  id v15 = [v6 defaultDetailTextFontForCellStyle:3];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v14, v15);

  uint64_t v16 = [v6 defaultDetailTextColorForCellStyle:3 traitCollection:v4 state:v5];

  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v14, v16);
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v6, v4, 0);
  double v17 = _UICellContentViewDefaultDirectionalLayoutMargins(v6, v4, 3, 0, 0);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  [v6 defaultImageToTextPaddingForSidebar:0];
  double v25 = v24;
  [v6 defaultTextToSubtitlePaddingForCellStyle:3];
  double v27 = -[UIListContentConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:directionalLayoutMargins:prefersSideBySideTextAndSecondaryText:imageToTextPadding:textToSecondaryTextVerticalPadding:]((id *)[UIListContentConfiguration alloc], v7, v11, v14, 0, v17, v19, v21, v23, v25, v26);
  double v28 = v27;
  if (v27)
  {
    v27[7] = (id)1;
    __int16 v29 = *((_WORD *)v27 + 4);
    if ((v29 & 0x40) == 0) {
      *((unsigned char *)v27 + 13) = 1;
    }
    *((_WORD *)v27 + 4) = v29 & 0xFEFF;
  }

  return v28;
}

+ (id)headerConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v5 = +[UIListContentConfiguration _defaultPlainHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  if (v5)
  {
    *(void *)(v5 + 56) = 17;
    __int16 v6 = *(_WORD *)(v5 + 8);
    if ((v6 & 0x40) == 0) {
      *(unsigned char *)(v5 + 13) = 0;
    }
    *(_WORD *)(v5 + 8) = v6 & 0xFEFF;
  }
  return (id)v5;
}

+ (id)footerConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v5 = +[UIListContentConfiguration _defaultPlainFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  if (v5)
  {
    *(void *)(v5 + 56) = 18;
    __int16 v6 = *(_WORD *)(v5 + 8);
    if ((v6 & 0x40) == 0) {
      *(unsigned char *)(v5 + 13) = 0;
    }
    *(_WORD *)(v5 + 8) = v6 & 0xFEFF;
  }
  return (id)v5;
}

+ (id)_defaultPlainFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  uint64_t v7 = +[UIListContentConfiguration _defaultHeaderFooterConfigurationForState:traitCollection:isHeader:style:](v6, v5, v4, 0, 0);

  if (v7)
  {
    *(void *)(v7 + 56) = 4;
    __int16 v8 = *(_WORD *)(v7 + 8);
    if ((v8 & 0x40) == 0) {
      *(unsigned char *)(v7 + 13) = 0;
    }
    *(_WORD *)(v7 + 8) = v8 & 0xFEFF;
  }
  return (id)v7;
}

+ (UIListContentConfiguration)accompaniedSidebarCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIListContentConfiguration _defaultSidebarCellConfigurationForState:traitCollection:style:]((uint64_t)a1, v3, v4, 2);

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultSidebarCellConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 style:
{
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = self;
  uint64_t v9 = +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:](v8, v7, v6);
  +[UIListContentConfiguration _applySidebarCellStylingToConfiguration:forState:traitCollection:cellStyle:sidebarStyle:](v8, (void *)v9, v7, v6, 0, a4);

  if (a4 == 2)
  {
    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v10 = v9 + 8;
    __int16 v11 = *(_WORD *)(v9 + 8);
    uint64_t v12 = 10;
  }
  else if (a4 == 3)
  {
    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v10 = v9 + 8;
    __int16 v11 = *(_WORD *)(v9 + 8);
    uint64_t v12 = 15;
  }
  else
  {
    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v10 = v9 + 8;
    __int16 v11 = *(_WORD *)(v9 + 8);
    uint64_t v12 = 7;
  }
  *(void *)(v10 + 48) = v12;
  if ((v11 & 0x40) == 0) {
    *(unsigned char *)(v9 + 13) = 1;
  }
  *(_WORD *)uint64_t v10 = v11 | 0x100;
LABEL_12:
  return (id)v9;
}

+ (UIListContentConfiguration)accompaniedSidebarSubtitleCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIListContentConfiguration _defaultSidebarSubtitleCellConfigurationForState:traitCollection:style:]((uint64_t)a1, v3, v4, 2);

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultSidebarSubtitleCellConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 style:
{
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = self;
  uint64_t v9 = +[UIListContentConfiguration _defaultSubtitleCellConfigurationForState:traitCollection:](v8, v7, v6);
  +[UIListContentConfiguration _applySidebarCellStylingToConfiguration:forState:traitCollection:cellStyle:sidebarStyle:](v8, (void *)v9, v7, v6, 3, a4);

  if (a4 == 2)
  {
    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v10 = v9 + 8;
    __int16 v11 = *(_WORD *)(v9 + 8);
    uint64_t v12 = 11;
  }
  else if (a4 == 3)
  {
    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v10 = v9 + 8;
    __int16 v11 = *(_WORD *)(v9 + 8);
    uint64_t v12 = 16;
  }
  else
  {
    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v10 = v9 + 8;
    __int16 v11 = *(_WORD *)(v9 + 8);
    uint64_t v12 = 8;
  }
  *(void *)(v10 + 48) = v12;
  if ((v11 & 0x40) == 0) {
    *(unsigned char *)(v9 + 13) = 1;
  }
  *(_WORD *)uint64_t v10 = v11 | 0x100;
LABEL_12:
  return (id)v9;
}

+ (id)_defaultGroupedFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  uint64_t v7 = +[UIListContentConfiguration _defaultHeaderFooterConfigurationForState:traitCollection:isHeader:style:](v6, v5, v4, 0, 1);

  if (v7)
  {
    *(void *)(v7 + 56) = 6;
    __int16 v8 = *(_WORD *)(v7 + 8);
    if ((v8 & 0x40) == 0) {
      *(unsigned char *)(v7 + 13) = 0;
    }
    *(_WORD *)(v7 + 8) = v8 & 0xFEFF;
  }
  return (id)v7;
}

+ (void)_applySidebarCellStylingToConfiguration:(void *)a3 forState:(void *)a4 traitCollection:(uint64_t)a5 cellStyle:(uint64_t)a6 sidebarStyle:
{
  uint64_t v10 = a2;
  id v11 = a3;
  id v12 = a4;
  self;
  uint64_t v13 = _UITableConstantsForTraitCollection(v12);
  [v13 defaultImageToTextPaddingForSidebar:1];
  if (v10)
  {
    v10[3] = v14;
    *((double *)v10 + 11) = _UICellContentViewDefaultDirectionalLayoutMargins(v13, v12, a5, 1, 0);
    v10[12] = v15;
    v10[13] = v16;
    v10[14] = v17;
  }
  else
  {
    _UICellContentViewDefaultDirectionalLayoutMargins(v13, v12, a5, 1, 0);
  }
  double v18 = [v10 textProperties];
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v18, v13, v12, 1);

  double v19 = [v10 secondaryTextProperties];
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v19, v13, v12, 1);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  if (v13)
  {
    [v13 contentPropertiesForSidebarElementWithTraitCollection:v12 state:v11 isHeader:0 cellStyle:a5 sidebarStyle:a6];
    double v20 = (void *)v32;
  }
  else
  {
    double v20 = 0;
  }
  double v21 = objc_msgSend(v10, "textProperties", (void)v32);
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v21, v20);

  double v22 = [v10 textProperties];
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v22, (void *)v33);

  double v23 = [v10 textProperties];
  -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v23, *((uint64_t *)&v35 + 1));

  double v24 = [v10 secondaryTextProperties];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v24, *((void **)&v32 + 1));

  double v25 = [v10 secondaryTextProperties];
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v25, *((void **)&v33 + 1));

  double v26 = [v10 secondaryTextProperties];
  -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v26, v36);

  double v27 = [v10 imageProperties];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v27, (void *)v34);

  double v28 = [v10 imageProperties];
  double v30 = v28;
  if (v28) {
    objc_setProperty_nonatomic_copy(v28, v29, *((id *)&v34 + 1), 24);
  }

  double v31 = [v10 imageProperties];
  -[UIListContentImageProperties _setTintColorTransformerIdentifier:]((uint64_t)v31, *((uint64_t *)&v36 + 1));

  if (v10) {
    v10[6] = v35;
  }
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)&v32);
}

+ (id)_sidebarPlainCellConfiguration
{
  uint64_t v0 = self;
  v1 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v2 = +[UITraitCollection _fallbackTraitCollection]();
  id v3 = +[UIListContentConfiguration _defaultSidebarCellConfigurationForState:traitCollection:style:](v0, v1, v2, 3);

  return v3;
}

+ (id)_defaultSidebarHeaderConfigurationForState:(void *)a3 traitCollection:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = _UITableConstantsForTraitCollection(v5);
  uint64_t v8 = [v5 _splitViewControllerContext];
  uint64_t v9 = _UICollectionViewListStyleFromListEnvironment([v5 listEnvironment]);
  if (v9 == 4)
  {
    uint64_t v10 = 3;
  }
  else if (v9 == 3)
  {
    if (v8 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:](v6, v4, v5);
  [v7 defaultImageToTextPaddingForSidebar:1];
  if (v11)
  {
    *(void *)(v11 + 24) = v12;
    *(double *)(v11 + 88) = _UICellContentViewDefaultDirectionalLayoutMargins(v7, v5, 0, 1, 0);
    *(void *)(v11 + 96) = v13;
    *(void *)(v11 + 104) = v14;
    *(void *)(v11 + 112) = v15;
  }
  else
  {
    _UICellContentViewDefaultDirectionalLayoutMargins(v7, v5, 0, 1, 0);
  }
  uint64_t v16 = [(id)v11 textProperties];
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v16, v7, v5, 1);

  uint64_t v17 = [(id)v11 secondaryTextProperties];
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v17, v7, v5, 1);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  if (v7)
  {
    [v7 contentPropertiesForSidebarElementWithTraitCollection:v5 state:v4 isHeader:1 cellStyle:0 sidebarStyle:v10];
    double v18 = (void *)v32;
  }
  else
  {
    double v18 = 0;
  }
  double v19 = objc_msgSend((id)v11, "textProperties", (void)v32);
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v19, v18);

  double v20 = [(id)v11 textProperties];
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v20, (void *)v33);

  double v21 = [(id)v11 secondaryTextProperties];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v21, *((void **)&v32 + 1));

  double v22 = [(id)v11 secondaryTextProperties];
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v22, *((void **)&v33 + 1));

  double v23 = [(id)v11 imageProperties];
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v23, (void *)v34);

  double v24 = [(id)v11 imageProperties];
  double v26 = v24;
  if (v24) {
    objc_setProperty_nonatomic_copy(v24, v25, *((id *)&v34 + 1), 24);
  }

  if (v11) {
    *(void *)(v11 + 48) = v35;
  }
  double v27 = [(id)v11 textProperties];
  -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v27, *((uint64_t *)&v35 + 1));

  double v28 = [(id)v11 secondaryTextProperties];
  -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v28, v36);

  __int16 v29 = [(id)v11 imageProperties];
  -[UIListContentImageProperties _setTintColorTransformerIdentifier:]((uint64_t)v29, *((uint64_t *)&v36 + 1));

  if (v11)
  {
    *(void *)(v11 + 56) = 9;
    __int16 v30 = *(_WORD *)(v11 + 8);
    if ((v30 & 0x40) == 0) {
      *(unsigned char *)(v11 + 13) = 1;
    }
    *(_WORD *)(v11 + 8) = v30 | 0x100;
  }
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)&v32);

  return (id)v11;
}

+ (UIListContentConfiguration)sidebarCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIListContentConfiguration _defaultSidebarCellConfigurationForState:traitCollection:style:]((uint64_t)a1, v3, v4, 1);

  return (UIListContentConfiguration *)v5;
}

+ (UIListContentConfiguration)sidebarSubtitleCellConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIListContentConfiguration _defaultSidebarSubtitleCellConfigurationForState:traitCollection:style:]((uint64_t)a1, v3, v4, 1);

  return (UIListContentConfiguration *)v5;
}

+ (UIListContentConfiguration)plainFooterConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIListContentConfiguration _defaultPlainFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIListContentConfiguration *)v5;
}

+ (UIListContentConfiguration)sidebarHeaderConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIListContentConfiguration _defaultSidebarHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIListContentConfiguration *)v5;
}

+ (UIListContentConfiguration)groupedFooterConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  id v5 = +[UIListContentConfiguration _defaultGroupedFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  return (UIListContentConfiguration *)v5;
}

+ (id)_headerConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v5 = +[UIListContentConfiguration _defaultPlainHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  if (v5)
  {
    *(void *)(v5 + 56) = 17;
    __int16 v6 = *(_WORD *)(v5 + 8);
    if ((v6 & 0x40) == 0) {
      *(unsigned char *)(v5 + 13) = 0;
    }
    *(_WORD *)(v5 + 8) = v6 & 0xFEFF;
  }
  return (id)v5;
}

+ (id)_footerConfiguration
{
  id v3 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  id v4 = +[UITraitCollection _fallbackTraitCollection]();
  uint64_t v5 = +[UIListContentConfiguration _defaultPlainFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);

  if (v5)
  {
    *(void *)(v5 + 56) = 18;
    __int16 v6 = *(_WORD *)(v5 + 8);
    if ((v6 & 0x40) == 0) {
      *(unsigned char *)(v5 + 13) = 0;
    }
    *(_WORD *)(v5 + 8) = v6 & 0xFEFF;
  }
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIListContentConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)UIListContentConfiguration;
  uint64_t v5 = [(UIListContentConfiguration *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageProperties"];
    imageProperties = v5->_imageProperties;
    v5->_imageProperties = (UIListContentImageProperties *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textProperties"];
    textProperties = v5->_textProperties;
    v5->_textProperties = (UIListContentTextProperties *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryTextProperties"];
    secondaryTextProperties = v5->_secondaryTextProperties;
    v5->_secondaryTextProperties = (UIListContentTextProperties *)v10;

    v5->_axesPreservingSuperviewLayoutMargins = [v4 decodeIntegerForKey:@"axesPreservingSuperviewLayoutMargins"];
    [v4 decodeDirectionalEdgeInsetsForKey:@"directionalLayoutMargins"];
    v5->_directionalLayoutMargins.double top = v12;
    v5->_directionalLayoutMargins.double leading = v13;
    v5->_directionalLayoutMargins.double bottom = v14;
    v5->_directionalLayoutMargins.double trailing = v15;
    v5->_prefersSideBySideTextAndSecondaryText = [v4 decodeBoolForKey:@"prefersSideBySideTextAndSecondaryText"];
    [v4 decodeDoubleForKey:@"imageToTextPadding"];
    v5->_imageToTextPadding = v16;
    [v4 decodeDoubleForKey:@"textToSecondaryTextHorizontalPadding"];
    v5->_textToSecondaryTextHorizontalPadding = v17;
    [v4 decodeDoubleForKey:@"textToSecondaryTextVerticalPadding"];
    v5->_textToSecondaryTextVerticalPadding = v18;
    if ([v4 containsValueForKey:@"defaultStyle_v2"]) {
      double v19 = @"defaultStyle_v2";
    }
    else {
      double v19 = @"defaultStyle";
    }
    unint64_t v20 = [v4 decodeIntegerForKey:v19];
    if (v20 >= 0x13) {
      unint64_t v21 = 0;
    }
    else {
      unint64_t v21 = v20;
    }
    -[UIListContentConfiguration _setDefaultStyle:]((uint64_t)v5, v21);
    if ([v4 containsValueForKey:@"enforcesMinimumHeight"]) {
      v5->_enforcesMinimumHeight = [v4 decodeBoolForKey:@"enforcesMinimumHeight"];
    }
    double v22 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFE | [v4 decodeBoolForKey:v22];

    double v23 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
    if ([v4 decodeBoolForKey:v23]) {
      __int16 v24 = 2;
    }
    else {
      __int16 v24 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFD | v24;

    double v25 = [NSString stringWithFormat:@"hasCustomized-%@", @"prefersSideBySideTextAndSecondaryText"];
    if ([v4 decodeBoolForKey:v25]) {
      __int16 v26 = 4;
    }
    else {
      __int16 v26 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFB | v26;

    double v27 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageToTextPadding"];
    if ([v4 decodeBoolForKey:v27]) {
      __int16 v28 = 8;
    }
    else {
      __int16 v28 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFF7 | v28;

    __int16 v29 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToSecondaryTextHorizontalPadding"];
    if ([v4 decodeBoolForKey:v29]) {
      __int16 v30 = 16;
    }
    else {
      __int16 v30 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFEF | v30;

    double v31 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToSecondaryTextVerticalPadding"];
    if ([v4 decodeBoolForKey:v31]) {
      __int16 v32 = 32;
    }
    else {
      __int16 v32 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFDF | v32;

    long long v33 = [NSString stringWithFormat:@"hasCustomized-%@", @"enforcesMinimumHeight"];
    if ([v4 decodeBoolForKey:v33]) {
      __int16 v34 = 64;
    }
    else {
      __int16 v34 = 0;
    }
    *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFBF | v34;

    if ([v4 containsValueForKey:@"isSidebarStyle"])
    {
      if ([v4 decodeBoolForKey:@"isSidebarStyle"]) {
        __int16 v35 = 256;
      }
      else {
        __int16 v35 = 0;
      }
      *(_WORD *)&v5->___int16 configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFEFF | v35;
    }
    int v36 = [v4 containsValueForKey:@"alpha"];
    double v37 = 1.0;
    if (v36) {
      objc_msgSend(v4, "decodeDoubleForKey:", @"alpha", 1.0);
    }
    v5->_alpha = v37;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v22 = a3;
  [v22 encodeObject:self->_imageProperties forKey:@"imageProperties"];
  [v22 encodeObject:self->_textProperties forKey:@"textProperties"];
  [v22 encodeObject:self->_secondaryTextProperties forKey:@"secondaryTextProperties"];
  [v22 encodeInteger:self->_axesPreservingSuperviewLayoutMargins forKey:@"axesPreservingSuperviewLayoutMargins"];
  objc_msgSend(v22, "encodeDirectionalEdgeInsets:forKey:", @"directionalLayoutMargins", self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  [v22 encodeBool:self->_prefersSideBySideTextAndSecondaryText forKey:@"prefersSideBySideTextAndSecondaryText"];
  [v22 encodeDouble:@"imageToTextPadding" forKey:self->_imageToTextPadding];
  [v22 encodeDouble:@"textToSecondaryTextHorizontalPadding" forKey:self->_textToSecondaryTextHorizontalPadding];
  [v22 encodeDouble:@"textToSecondaryTextVerticalPadding" forKey:self->_textToSecondaryTextVerticalPadding];
  [v22 encodeBool:self->_enforcesMinimumHeight forKey:@"enforcesMinimumHeight"];
  [v22 encodeDouble:@"alpha" forKey:self->_alpha];
  [v22 encodeInteger:self->_defaultStyle forKey:@"defaultStyle_v2"];
  unint64_t defaultStyle = self->_defaultStyle;
  if ((defaultStyle & 0x8000000000000000) != 0)
  {
    int64_t v7 = 0;
  }
  else
  {
    uint64_t v5 = 4 * (defaultStyle == 18);
    if (defaultStyle == 17) {
      uint64_t v5 = 3;
    }
    if (defaultStyle - 15 >= 2) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 7;
    }
    if (defaultStyle >= 0xE) {
      int64_t v7 = v6;
    }
    else {
      int64_t v7 = self->_defaultStyle;
    }
  }
  [v22 encodeInteger:v7 forKey:@"defaultStyle"];
  [v22 encodeBool:HIBYTE(*(_WORD *)&self->_configurationFlags) & 1 forKey:@"isSidebarStyle"];
  uint64_t v8 = *(_WORD *)&self->_configurationFlags & 1;
  uint64_t v9 = [NSString stringWithFormat:@"hasCustomized-%@", @"axesPreservingSuperviewLayoutMargins"];
  [v22 encodeBool:v8 forKey:v9];

  uint64_t v10 = (*(_WORD *)&self->_configurationFlags >> 1) & 1;
  uint64_t v11 = [NSString stringWithFormat:@"hasCustomized-%@", @"directionalLayoutMargins"];
  [v22 encodeBool:v10 forKey:v11];

  uint64_t v12 = (*(_WORD *)&self->_configurationFlags >> 2) & 1;
  CGFloat v13 = [NSString stringWithFormat:@"hasCustomized-%@", @"prefersSideBySideTextAndSecondaryText"];
  [v22 encodeBool:v12 forKey:v13];

  uint64_t v14 = (*(_WORD *)&self->_configurationFlags >> 3) & 1;
  CGFloat v15 = [NSString stringWithFormat:@"hasCustomized-%@", @"imageToTextPadding"];
  [v22 encodeBool:v14 forKey:v15];

  uint64_t v16 = (*(_WORD *)&self->_configurationFlags >> 4) & 1;
  double v17 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToSecondaryTextHorizontalPadding"];
  [v22 encodeBool:v16 forKey:v17];

  uint64_t v18 = (*(_WORD *)&self->_configurationFlags >> 5) & 1;
  double v19 = [NSString stringWithFormat:@"hasCustomized-%@", @"textToSecondaryTextVerticalPadding"];
  [v22 encodeBool:v18 forKey:v19];

  uint64_t v20 = (*(_WORD *)&self->_configurationFlags >> 6) & 1;
  unint64_t v21 = [NSString stringWithFormat:@"hasCustomized-%@", @"enforcesMinimumHeight"];
  [v22 encodeBool:v20 forKey:v21];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIListContentConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    int64_t v7 = v6;
    if (self) {
      LOBYTE(self) = self->_defaultStyle == v6->_defaultStyle
    }
                  && ((*(_WORD *)&v6->_configurationFlags ^ *(_WORD *)&self->_configurationFlags) & 0x100) == 0
                  && self->_alpha == v6->_alpha
                  && -[UIListContentImageProperties _isEqualToProperties:compareImage:]((uint64_t)self->_imageProperties, v6->_imageProperties, 1)&& -[UIListContentTextProperties _isEqualToProperties:compareText:]((uint64_t)self->_textProperties, v7->_textProperties, 1)&& -[UIListContentTextProperties _isEqualToProperties:compareText:]((uint64_t)self->_secondaryTextProperties, v7->_secondaryTextProperties, 1)&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top),
                                                    (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))), 0xFuLL))) & 1) != 0&& self->_prefersSideBySideTextAndSecondaryText == v7->_prefersSideBySideTextAndSecondaryText&& self->_imageToTextPadding == v7->_imageToTextPadding&& self->_textToSecondaryTextHorizontalPadding == v7->_textToSecondaryTextHorizontalPadding&& self->_textToSecondaryTextVerticalPadding == v7->_textToSecondaryTextVerticalPadding&& self->_enforcesMinimumHeight == v7->_enforcesMinimumHeight;
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (unint64_t)hash
{
  unint64_t v3 = [(UIListContentImageProperties *)self->_imageProperties hash];
  unint64_t v4 = [(UIListContentTextProperties *)self->_textProperties hash] ^ v3;
  return v4 ^ [(UIListContentTextProperties *)self->_secondaryTextProperties hash];
}

- (id)_descriptionPropertiesForFullDescription:(uint64_t)a1
{
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = *(__CFString **)(a1 + 64);
    if (v5 && v5->data)
    {
      uint64_t v6 = NSString;
      int64_t v7 = -[UIContentUnavailableImageProperties _shortDescription](v5);
      uint64_t v8 = [v6 stringWithFormat:@"image = %@", v7];
      [v4 addObject:v8];
    }
    uint64_t v9 = *(__CFString **)(a1 + 72);
    if (v9 && (v9->length || v9[2].info))
    {
      uint64_t v10 = NSString;
      uint64_t v11 = -[UIListContentTextProperties _shortDescription](v9);
      uint64_t v12 = [v10 stringWithFormat:@"text = %@", v11];
      [v4 addObject:v12];
    }
    CGFloat v13 = *(__CFString **)(a1 + 80);
    if (v13 && (v13->length || v13[2].info))
    {
      uint64_t v14 = NSString;
      CGFloat v15 = -[UIListContentTextProperties _shortDescription](v13);
      uint64_t v16 = [v14 stringWithFormat:@"secondaryText = %@", v15];
      [v4 addObject:v16];
    }
    if (*(double *)(a1 + 48) != 1.0)
    {
      double v17 = objc_msgSend(NSString, "stringWithFormat:", @"alpha = %g", *(void *)(a1 + 48));
      [v4 addObject:v17];
    }
    if (a2)
    {
      uint64_t v18 = NSString;
      unint64_t v19 = *(void *)(a1 + 56);
      if (v19 >= 0x13)
      {
        unint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
        id v22 = [NSString stringWithUTF8String:"NSString *_UIListContentConfigurationStyleToString(_UIListContentConfigurationStyle)"];
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"UIListContentConfiguration.m", 138, @"Unknown style: %ld", v19);

        uint64_t v20 = 0;
      }
      else
      {
        uint64_t v20 = off_1E5308250[v19];
      }
      double v23 = [v18 stringWithFormat:@"Base Style = %@", v20];
      [v4 addObject:v23];

      double v24 = *(double *)(a1 + 88);
      double v25 = *(double *)(a1 + 96);
      double v26 = *(double *)(a1 + 104);
      double v27 = *(double *)(a1 + 112);
      if (v25 != 0.0 || v24 != 0.0 || v27 != 0.0 || v26 != 0.0)
      {
        __int16 v28 = NSString;
        __int16 v29 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&v24);
        __int16 v30 = [v28 stringWithFormat:@"directionalLayoutMargins = %@", v29];
        [v4 addObject:v30];
      }
      uint64_t v31 = *(void *)(a1 + 16);
      if (v31)
      {
        __int16 v32 = NSString;
        long long v33 = _UIContentViewStringForAxis(v31);
        __int16 v34 = [v32 stringWithFormat:@"axesPreservingSuperviewLayoutMargins = %@", v33];
        [v4 addObject:v34];
      }
      if (*(unsigned char *)(a1 + 12))
      {
        __int16 v35 = [NSString stringWithFormat:@"prefersSideBySideTextAndSecondaryText = YES"];
        [v4 addObject:v35];
      }
      int v36 = objc_msgSend(NSString, "stringWithFormat:", @"imageToTextPadding = %g", *(void *)(a1 + 24));
      [v4 addObject:v36];

      if (*(unsigned char *)(a1 + 12))
      {
        double v37 = objc_msgSend(NSString, "stringWithFormat:", @"textToSecondaryTextHorizontalPadding = %g", *(void *)(a1 + 32));
        [v4 addObject:v37];
      }
      v38 = objc_msgSend(NSString, "stringWithFormat:", @"textToSecondaryTextVerticalPadding = %g", *(void *)(a1 + 40));
      [v4 addObject:v38];
    }
    if (![v4 count]) {
      [v4 addObject:@"(empty)"];
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (NSString)description
{
  unint64_t v3 = -[UIListContentConfiguration _descriptionPropertiesForFullDescription:]((uint64_t)self, 1);
  id v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int64_t v7 = [v3 componentsJoinedByString:@"; "];
  uint64_t v8 = [v4 stringWithFormat:@"<%@: %p; %@>", v6, self, v7];

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  return (NSString *)+[UIView _descriptionWithoutTextRedactionForObject:self];
}

- (NSString)text
{
  return -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)&self->_textProperties->super.isa);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)-[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&self->_textProperties->super.isa);
}

- (void)setSecondaryText:(NSString *)secondaryText
{
}

- (NSString)secondaryText
{
  return -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)&self->_secondaryTextProperties->super.isa);
}

- (void)setSecondaryAttributedText:(NSAttributedString *)secondaryAttributedText
{
}

- (NSAttributedString)secondaryAttributedText
{
  return (NSAttributedString *)-[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&self->_secondaryTextProperties->super.isa);
}

- (void)setPrefersSideBySideTextAndSecondaryText:(BOOL)prefersSideBySideTextAndSecondaryText
{
  *(_WORD *)&self->_configurationFlags |= 4u;
  self->_prefersSideBySideTextAndSecondaryText = prefersSideBySideTextAndSecondaryText;
}

- (void)setTextToSecondaryTextHorizontalPadding:(CGFloat)textToSecondaryTextHorizontalPadding
{
  *(_WORD *)&self->_configurationFlags |= 0x10u;
  self->_textToSecondaryTextHorizontalPadding = textToSecondaryTextHorizontalPadding;
}

- (CGFloat)textToSecondaryTextHorizontalPadding
{
  return self->_textToSecondaryTextHorizontalPadding;
}

- (void)setTextToSecondaryTextVerticalPadding:(CGFloat)textToSecondaryTextVerticalPadding
{
  *(_WORD *)&self->_configurationFlags |= 0x20u;
  self->_textToSecondaryTextVerticalPadding = textToSecondaryTextVerticalPadding;
}

- (void)setAlpha:(double)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x80u;
  self->_alpha = a3;
}

- (void)_setEnforcesMinimumHeight:(BOOL)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x40u;
  self->_enforcesMinimumHeight = a3;
}

- (BOOL)_enforcesMinimumHeight
{
  return self->_enforcesMinimumHeight;
}

- (void)_setSwiftBridgingImageProperties:(id)a3
{
  id v4 = (UIListContentImageProperties *)a3;
  imageProperties = self->_imageProperties;
  if (imageProperties) {
    imageProperties = (UIListContentImageProperties *)imageProperties->_image;
  }
  uint64_t v6 = imageProperties;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v4, v6);

  int64_t v7 = self->_imageProperties;
  self->_imageProperties = v4;
}

- (void)_setSwiftBridgingTextProperties:(id)a3
{
  id v4 = (UIListContentTextProperties *)a3;
  textProperties = self->_textProperties;
  if (textProperties) {
    textProperties = (UIListContentTextProperties *)textProperties->_text;
  }
  int64_t v7 = textProperties;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v6, v7, 24);
  }

  uint64_t v8 = self->_textProperties;
  if (v8) {
    uint64_t v8 = (UIListContentTextProperties *)v8->_attributedText;
  }
  uint64_t v10 = v8;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v9, v10, 72);
  }

  uint64_t v11 = self->_textProperties;
  self->_textProperties = v4;
}

- (void)_setSwiftBridgingSecondaryTextProperties:(id)a3
{
  id v4 = (UIListContentTextProperties *)a3;
  secondaryTextProperties = self->_secondaryTextProperties;
  if (secondaryTextProperties) {
    secondaryTextProperties = (UIListContentTextProperties *)secondaryTextProperties->_text;
  }
  int64_t v7 = secondaryTextProperties;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v6, v7, 24);
  }

  uint64_t v8 = self->_secondaryTextProperties;
  if (v8) {
    uint64_t v8 = (UIListContentTextProperties *)v8->_attributedText;
  }
  uint64_t v10 = v8;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v9, v10, 72);
  }

  uint64_t v11 = self->_secondaryTextProperties;
  self->_secondaryTextProperties = v4;
}

@end