@interface UIButtonConfiguration
+ (BOOL)supportsSecureCoding;
+ (UIButtonConfiguration)borderedButtonConfiguration;
+ (UIButtonConfiguration)borderlessButtonConfiguration;
+ (UIButtonConfiguration)filledButtonConfiguration;
+ (UIButtonConfiguration)grayButtonConfiguration;
+ (UIButtonConfiguration)plainButtonConfiguration;
+ (UIButtonConfiguration)tintedButtonConfiguration;
+ (id)_emptyButtonConfiguration;
- (BOOL)_alwaysApplyTitleAlignment;
- (BOOL)_hasImage;
- (BOOL)_hasMultilineSubtitle;
- (BOOL)_hasMultilineTitle;
- (BOOL)_hasObscuringBackground;
- (BOOL)_hasOversizedSubtitle;
- (BOOL)_hasOversizedTitle;
- (BOOL)_hasSubtitle;
- (BOOL)_hasSymbolImage;
- (BOOL)_hasTitle;
- (BOOL)_honorsTintInMacIdiom;
- (BOOL)_isRoundButton;
- (BOOL)automaticallyUpdateForSelection;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsActivityIndicator;
- (CGFloat)imagePadding;
- (CGFloat)titlePadding;
- (NSAttributedString)attributedSubtitle;
- (NSAttributedString)attributedTitle;
- (NSDirectionalEdgeInsets)contentInsets;
- (NSDirectionalRectEdge)imagePlacement;
- (NSLineBreakMode)subtitleLineBreakMode;
- (NSLineBreakMode)titleLineBreakMode;
- (NSString)description;
- (NSString)subtitle;
- (NSString)title;
- (UIBackgroundConfiguration)background;
- (UIButtonConfiguration)initWithCoder:(id)a3;
- (UIButtonConfiguration)updatedConfigurationForButton:(UIButton *)button;
- (UIButtonConfigurationCornerStyle)cornerStyle;
- (UIButtonConfigurationIndicator)indicator;
- (UIButtonConfigurationMacIdiomStyle)macIdiomStyle;
- (UIButtonConfigurationSize)buttonSize;
- (UIButtonConfigurationTitleAlignment)titleAlignment;
- (UIColor)baseBackgroundColor;
- (UIColor)baseForegroundColor;
- (UIConfigurationColorTransformer)activityIndicatorColorTransformer;
- (UIConfigurationColorTransformer)imageColorTransformer;
- (UIConfigurationColorTransformer)indicatorColorTransformer;
- (UIConfigurationTextAttributesTransformer)subtitleTextAttributesTransformer;
- (UIConfigurationTextAttributesTransformer)titleTextAttributesTransformer;
- (UIImage)image;
- (UIImageSymbolConfiguration)preferredSymbolConfigurationForImage;
- (double)_resolvedActivityIndicatorSize;
- (double)_resolvedImageReservation;
- (double)_resolvedIndicatorPadding;
- (double)imageReservation;
- (id)_initWithBehaviors:(id)a3;
- (id)_resolvedActivityIndicatorColor;
- (id)_resolvedImage;
- (id)_resolvedImageColor;
- (id)_resolvedIndicator;
- (id)_resolvedIndicatorColor;
- (id)_resolvedIndicatorSymbolConfiguration;
- (id)_resolvedSubtitle;
- (id)_resolvedSymbolConfiguration;
- (id)_resolvedTitle;
- (id)_spiValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)symbolStyleForSize:(int64_t)a3 hasText:(BOOL)a4;
- (int64_t)_resolvedMacIdiomStyle;
- (int64_t)_resolvedTitleAlignment;
- (unint64_t)hash;
- (void)_copyValuesFromConfiguration:(id)a3;
- (void)_dci_setIndicator:(int64_t)a3;
- (void)_resolveValuesWithButton:(id)a3;
- (void)_setAlwaysApplyTitleAlignment:(BOOL)a3;
- (void)_setSwiftBridgingBackground:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityIndicatorColorTransformer:(UIConfigurationColorTransformer)activityIndicatorColorTransformer;
- (void)setAttributedSubtitle:(NSAttributedString *)attributedSubtitle;
- (void)setAttributedTitle:(NSAttributedString *)attributedTitle;
- (void)setAutomaticallyUpdateForSelection:(BOOL)automaticallyUpdateForSelection;
- (void)setBackground:(UIBackgroundConfiguration *)background;
- (void)setBaseBackgroundColor:(UIColor *)baseBackgroundColor;
- (void)setBaseForegroundColor:(UIColor *)baseForegroundColor;
- (void)setButtonSize:(UIButtonConfigurationSize)buttonSize;
- (void)setContentInsets:(NSDirectionalEdgeInsets)contentInsets;
- (void)setCornerStyle:(UIButtonConfigurationCornerStyle)cornerStyle;
- (void)setDefaultContentInsets;
- (void)setImage:(UIImage *)image;
- (void)setImageColorTransformer:(UIConfigurationColorTransformer)imageColorTransformer;
- (void)setImagePadding:(CGFloat)imagePadding;
- (void)setImagePlacement:(NSDirectionalRectEdge)imagePlacement;
- (void)setImageReservation:(double)a3;
- (void)setIndicator:(UIButtonConfigurationIndicator)indicator;
- (void)setIndicatorColorTransformer:(UIConfigurationColorTransformer)indicatorColorTransformer;
- (void)setMacIdiomStyle:(UIButtonConfigurationMacIdiomStyle)macIdiomStyle;
- (void)setPreferredSymbolConfigurationForImage:(UIImageSymbolConfiguration *)preferredSymbolConfigurationForImage;
- (void)setShowsActivityIndicator:(BOOL)showsActivityIndicator;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setSubtitleLineBreakMode:(NSLineBreakMode)subtitleLineBreakMode;
- (void)setSubtitleTextAttributesTransformer:(UIConfigurationTextAttributesTransformer)subtitleTextAttributesTransformer;
- (void)setTitle:(NSString *)title;
- (void)setTitleAlignment:(UIButtonConfigurationTitleAlignment)titleAlignment;
- (void)setTitleLineBreakMode:(NSLineBreakMode)titleLineBreakMode;
- (void)setTitlePadding:(CGFloat)titlePadding;
- (void)setTitleTextAttributesTransformer:(UIConfigurationTextAttributesTransformer)titleTextAttributesTransformer;
@end

@implementation UIButtonConfiguration

- (void)setCornerStyle:(UIButtonConfigurationCornerStyle)cornerStyle
{
  self->_cornerStyle = cornerStyle;
}

- (void)setBaseBackgroundColor:(UIColor *)baseBackgroundColor
{
}

- (void)setPreferredSymbolConfigurationForImage:(UIImageSymbolConfiguration *)preferredSymbolConfigurationForImage
{
}

- (void)setTitleLineBreakMode:(NSLineBreakMode)titleLineBreakMode
{
  self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFFFC7FF | ((titleLineBreakMode & 7) << 11));
}

- (void)setImagePadding:(CGFloat)imagePadding
{
  self->_imagePadding = imagePadding;
}

- (void)setImagePlacement:(NSDirectionalRectEdge)imagePlacement
{
  self->_imagePlacement = imagePlacement;
}

+ (UIButtonConfiguration)borderlessButtonConfiguration
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[_UIButtonConfigurationStyleBehaviors plainBehaviors:]((uint64_t)_UIButtonConfigurationStyleBehaviors, 1);
  v4 = (void *)[v2 _initWithBehaviors:v3];

  return (UIButtonConfiguration *)v4;
}

- (void)setImageReservation:(double)a3
{
  self->_imageReservation = a3;
}

- (UIImageSymbolConfiguration)preferredSymbolConfigurationForImage
{
  return self->_preferredSymbolConfigurationForImage;
}

- (void)setDefaultContentInsets
{
  *(_DWORD *)&self->_flags &= ~0x80u;
}

- (BOOL)_hasMultilineTitle
{
  return (*((unsigned char *)&self->_flags + 1) & 0x30) == 0
      && [(NSAttributedString *)self->_attributedTitle length] != 0;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (UIImage)image
{
  return self->_image;
}

- (UIButtonConfigurationCornerStyle)cornerStyle
{
  return self->_cornerStyle;
}

- (UIBackgroundConfiguration)background
{
  return self->_background;
}

- (void)_resolveValuesWithButton:(id)a3
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _UIButtonStatesFromButton(v4);
  uint64_t v97 = [v4 role];
  v6 = [v4 traitCollection];
  v7 = [v4 traitCollection];
  v8 = [v7 preferredContentSizeCategory];
  buf[0] = 0;
  uint64_t v9 = _UIContentSizeCategoryFromStringInternal(v8, buf);

  if (v9 >= 65543)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v93 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v111 = (UIButtonConfiguration *)v9;
        _os_log_fault_impl(&dword_1853B0000, v93, OS_LOG_TYPE_FAULT, "Unexpectedly large contentSizeCategory %lu while updating button configuration. The button this configuration is applied to will likely look wrong.", buf, 0xCu);
      }
    }
    else
    {
      v91 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_991) + 8);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v111 = (UIButtonConfiguration *)v9;
        _os_log_impl(&dword_1853B0000, v91, OS_LOG_TYPE_ERROR, "Unexpectedly large contentSizeCategory %lu while updating button configuration. The button this configuration is applied to will likely look wrong.", buf, 0xCu);
      }
    }
  }
  int v10 = (((_WORD)v9 << 8) + 256) & 0x700;
  if (v9 < 0x10000) {
    int v10 = 0;
  }
  self->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFFFF8FF | v10);
  v11 = -[_UIButtonConfigurationStyleBehaviors behaviorForState:](self->_behaviors, v5);
  if (([v4 _wantsAccessibilityUnderline] & 1) == 0)
  {
    uint64_t v12 = -[_UIButtonConfigurationStyleBehaviors effectiveBehaviorWithoutButtonShapes](v11);

    v11 = (void *)v12;
  }
  image = self->_image;
  if (image && [(UIImage *)image isSymbolImage])
  {
    preferredSymbolConfigurationForImage = self->_preferredSymbolConfigurationForImage;
    if (preferredSymbolConfigurationForImage) {
      LODWORD(preferredSymbolConfigurationForImage) = (*(unsigned char *)&preferredSymbolConfigurationForImage->_configFlags & 1) != 0
    }
                                                   || preferredSymbolConfigurationForImage->_textStyle != 0;
    unsigned int v15 = preferredSymbolConfigurationForImage ^ 1;
  }
  else
  {
    unsigned int v15 = 0;
  }
  v16 = -[_UIButtonConfigurationStyleBehaviors effectiveForegroundColorFromBaseColor:baseBackgroundColor:state:traitCollection:]((uint64_t)v11, self->_baseForegroundColor, self->_baseBackgroundColor, v5, v6);
  BOOL v17 = [(UIButtonConfiguration *)self _hasTitle];
  BOOL v18 = [(UIButtonConfiguration *)self _hasSubtitle];
  BOOL v19 = [(UIButtonConfiguration *)self _hasImage];
  $79A7E1F5F387068245F5C9CFF36D1F58 flags = self->_flags;
  v101 = v16;
  BOOL v98 = v19;
  if (((*(unsigned int *)&flags >> 18) & 3) == 0)
  {
    if (_UIButtonCanInferIndicator()
      && [v4 _menuEnabled]
      && [v4 showsMenuAsPrimaryAction])
    {
      int v22 = [v4 changesSelectionAsPrimaryAction];
      unsigned int v23 = *(_DWORD *)&self->_flags & 0xFF3FFFFF;
      if (v22)
      {
        $79A7E1F5F387068245F5C9CFF36D1F58 v21 = ($79A7E1F5F387068245F5C9CFF36D1F58)(v23 | 0x800000);
        goto LABEL_23;
      }
    }
    else
    {
      unsigned int v23 = *(_DWORD *)&self->_flags & 0xFF3FFFFF;
    }
    $79A7E1F5F387068245F5C9CFF36D1F58 v21 = ($79A7E1F5F387068245F5C9CFF36D1F58)(v23 | 0x400000);
    goto LABEL_23;
  }
  $79A7E1F5F387068245F5C9CFF36D1F58 v21 = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&flags & 0xFF3FFFFF | (((*(unsigned int *)&flags >> 18) & 3) << 22));
LABEL_23:
  self->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = v21;
  uint64_t v24 = v17 | v18;
  BOOL v96 = v18;
  BOOL v99 = v17;
  if (!v17 && !v18 && (*(unsigned char *)&v21 & 0x40) == 0)
  {
    v104 = 0;
    v105 = 0;
    v102 = 0;
    v103 = 0;
    v100 = 0;
    goto LABEL_30;
  }
  id v108 = 0;
  id v109 = 0;
  id v107 = 0;
  _getDefaultTitleAndSubtitleFontStylesForButtonSize((*(unsigned int *)&v21 >> 4) & 3, &v109, &v108, &v107, v6);
  v105 = (__CFString *)v109;
  v103 = (__CFString *)v108;
  v102 = (__CFString *)v107;
  if (v17 || (*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    if (v97 == 1) {
      v27 = v102;
    }
    else {
      v27 = v105;
    }
    v104 = [off_1E52D39B8 preferredFontForTextStyle:v27 compatibleWithTraitCollection:v6];
    if (!v18)
    {
LABEL_29:
      v100 = 0;
      if (!v24) {
        goto LABEL_30;
      }
      goto LABEL_37;
    }
  }
  else
  {
    v104 = 0;
    if (!v18) {
      goto LABEL_29;
    }
  }
  v100 = [off_1E52D39B8 preferredFontForTextStyle:v103 compatibleWithTraitCollection:v6];
  if (!v24)
  {
LABEL_30:
    if (v15)
    {
      unint64_t v25 = ((unint64_t)self->_flags >> 4) & 3;
      id v106 = 0;
      _getDefaultTitleAndSubtitleFontStylesForButtonSize(v25, &v106, 0, 0, v6);
      v26 = (__CFString *)v106;
    }
    else
    {
      v26 = 0;
    }
    goto LABEL_62;
  }
LABEL_37:
  id v28 = v16;
  v29 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v28)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v94 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v111 = self;
        __int16 v112 = 2112;
        v113 = v11;
        _os_log_fault_impl(&dword_1853B0000, v94, OS_LOG_TYPE_FAULT, "textColor is nil resolving configuration (%@) effectiveBehavior (%@)", buf, 0x16u);
      }
    }
    else
    {
      v92 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FE30) + 8);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v111 = self;
        __int16 v112 = 2112;
        v113 = v11;
        _os_log_impl(&dword_1853B0000, v92, OS_LOG_TYPE_ERROR, "textColor is nil resolving configuration (%@) effectiveBehavior (%@)", buf, 0x16u);
      }
    }
  }
  v95 = v28;
  [v29 setObject:v28 forKeyedSubscript:*(void *)off_1E52D2048];
  int64_t v30 = [(UIButtonConfiguration *)self _resolvedTitleAlignment];
  if (v30)
  {
    int64_t v31 = v30;
    v32 = objc_opt_new();
    uint64_t v33 = [v6 layoutDirection];
    uint64_t v34 = 1;
    uint64_t v35 = 4;
    if (v31 == 1) {
      uint64_t v35 = 2 * (v33 == 1);
    }
    if (v31 != 2) {
      uint64_t v34 = v35;
    }
    if (v31 == 3) {
      uint64_t v36 = 2 * (v33 != 1);
    }
    else {
      uint64_t v36 = v34;
    }
    [v32 setAlignment:v36];
    [v29 setObject:v32 forKeyedSubscript:*(void *)off_1E52D21B8];
  }
  v37 = +[UILabel _tooBigChars]();
  if ([(NSAttributedString *)self->_attributedTitle length])
  {
    [v29 setObject:v104 forKeyedSubscript:*(void *)off_1E52D2040];
    _UIButtonUpdateStringAttributes(self->_attributedTitle, v29, self->_titleTextAttributesTransformer, v6);
    v38 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    resolvedTitle = self->_resolvedTitle;
    self->_resolvedTitle = v38;

    v40 = [(NSAttributedString *)self->_resolvedTitle string];
    self->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | (([v40 rangeOfCharacterFromSet:v37] != 0x7FFFFFFFFFFFFFFFLL) << 20));
  }
  else
  {
    *(_DWORD *)&self->_flags &= ~0x100000u;
  }
  if ([(NSAttributedString *)self->_attributedSubtitle length])
  {
    [v29 setObject:v100 forKeyedSubscript:*(void *)off_1E52D2040];
    _UIButtonUpdateStringAttributes(self->_attributedSubtitle, v29, self->_subtitleTextAttributesTransformer, v6);
    v41 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    resolvedSubtitle = self->_resolvedSubtitle;
    self->_resolvedSubtitle = v41;

    v43 = [(NSAttributedString *)self->_resolvedSubtitle string];
    self->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFDFFFFF | (([v43 rangeOfCharacterFromSet:v37] != 0x7FFFFFFFFFFFFFFFLL) << 21));
  }
  else
  {
    *(_DWORD *)&self->_flags &= ~0x200000u;
  }
  if (v15)
  {
    NSUInteger v44 = [(NSAttributedString *)self->_attributedTitle length];
    v45 = v105;
    if (v97 == 1) {
      v45 = v102;
    }
    if (!v44) {
      v45 = v103;
    }
    v26 = v45;
  }
  else
  {
    v26 = 0;
  }

LABEL_62:
  v46 = self->_preferredSymbolConfigurationForImage;
  if (v46)
  {
    v47 = v46;
    p_resolvedSymbolConfig = &self->_resolvedSymbolConfig;
    resolvedSymbolConfig = self->_resolvedSymbolConfig;
    self->_resolvedSymbolConfig = v47;
  }
  else
  {
    resolvedSymbolConfig = +[UIImageSymbolConfiguration unspecifiedConfiguration];
    p_resolvedSymbolConfig = &self->_resolvedSymbolConfig;
    objc_storeStrong((id *)&self->_resolvedSymbolConfig, resolvedSymbolConfig);
  }

  if ([v6 userInterfaceIdiom] != 6)
  {
    BOOL v57 = [(UIImageSymbolConfiguration *)self->_preferredSymbolConfigurationForImage _hasSpecifiedScale];
    if (v15)
    {
      v58 = *p_resolvedSymbolConfig;
      if (v57) {
        +[UIImageSymbolConfiguration configurationWithTextStyle:v26];
      }
      else {
      v60 = +[UIImageSymbolConfiguration configurationWithTextStyle:v26 scale:3];
      }
      uint64_t v61 = [(UIImageConfiguration *)v58 configurationByApplyingConfiguration:v60];
      v56 = v101;
    }
    else
    {
      v56 = v101;
      if (v57) {
        goto LABEL_77;
      }
      v59 = *p_resolvedSymbolConfig;
      v60 = +[UIImageSymbolConfiguration configurationWithScale:3];
      uint64_t v61 = [(UIImageConfiguration *)v59 configurationByApplyingConfiguration:v60];
    }
    v62 = *p_resolvedSymbolConfig;
    *p_resolvedSymbolConfig = (UIImageSymbolConfiguration *)v61;

LABEL_77:
    if (*p_resolvedSymbolConfig)
    {
      v63 = +[UIFontMetrics defaultMetrics];
      [v63 scaledValueForValue:v6 compatibleWithTraitCollection:self->_imageReservation];
      self->_resolvedImageReservation = v64;
    }
    else if (self->_image)
    {
      self->_resolvedImageReservation = self->_imageReservation;
    }
    else
    {
      self->_resolvedImageReservation = 0.0;
    }
    goto LABEL_82;
  }
  if (v15)
  {
    uint64_t v50 = [(UIButtonConfiguration *)self symbolStyleForSize:((unint64_t)self->_flags >> 4) & 3 hasText:v24];

    v51 = +[UIImageSymbolConfiguration configurationWithTextStyle:v50];
    v52 = +[UIImageSymbolConfiguration configurationWithWeight:5];
    v53 = [(UIImageConfiguration *)self->_resolvedSymbolConfig configurationByApplyingConfiguration:v51];
    v54 = [v53 configurationByApplyingConfiguration:v52];
    v55 = self->_resolvedSymbolConfig;
    self->_resolvedSymbolConfig = v54;

    v26 = (__CFString *)v50;
  }
  v56 = v101;
LABEL_82:
  $79A7E1F5F387068245F5C9CFF36D1F58 v65 = self->_flags;
  if ((*(unsigned char *)&v65 & 0x40) != 0)
  {
    [v104 lineHeight];
    self->_resolvedActivityIndicatorSize = v68;
    resolvedImageColor = -[_UIButtonConfigurationStyleBehaviors effectiveActivityIndicatorColorFromEffectiveColor:state:]((uint64_t)self->_behaviors, v56, v5);
    activityIndicatorColorTransformer = (void (**)(id, void *))self->_activityIndicatorColorTransformer;
    if (activityIndicatorColorTransformer)
    {
      activityIndicatorColorTransformer[2](activityIndicatorColorTransformer, resolvedImageColor);
      v71 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v71 = resolvedImageColor;
    }
    resolvedActivityIndicatorColor = self->_resolvedActivityIndicatorColor;
    self->_resolvedActivityIndicatorColor = v71;
  }
  else
  {
    if (!v98) {
      goto LABEL_93;
    }
    imageColorTransformer = (void (**)(id, void *))self->_imageColorTransformer;
    if (imageColorTransformer)
    {
      imageColorTransformer[2](imageColorTransformer, v56);
      v67 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v67 = v56;
    }
    resolvedImageColor = self->_resolvedImageColor;
    self->_resolvedImageColor = v67;
  }

  $79A7E1F5F387068245F5C9CFF36D1F58 v65 = self->_flags;
LABEL_93:
  if ((*(_DWORD *)&v65 & 0xC00000) != 0x400000)
  {
    indicatorColorTransformer = (void (**)(id, void *))self->_indicatorColorTransformer;
    if (indicatorColorTransformer)
    {
      indicatorColorTransformer[2](indicatorColorTransformer, v56);
      v76 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = v56;
    }
    resolvedIndicatorColor = self->_resolvedIndicatorColor;
    self->_resolvedIndicatorColor = v76;

    v74 = @"UICTFontTextStyleBody";
    if (v99)
    {
      v78 = v105;
    }
    else if (v96)
    {
      v78 = v103;
    }
    else
    {
      v79 = *p_resolvedSymbolConfig;
      if (v79)
      {
        v80 = +[UIImageSymbolConfiguration configurationWithScale:1];
        v81 = [(UIImageConfiguration *)v79 configurationByApplyingConfiguration:v80];
        resolvedIndicatorSymbolConfig = self->_resolvedIndicatorSymbolConfig;
        self->_resolvedIndicatorSymbolConfig = v81;

LABEL_106:
        goto LABEL_107;
      }
      v78 = v74;
    }
    v83 = +[UIImageSymbolConfiguration configurationWithTextStyle:v78 scale:1];
    v80 = self->_resolvedIndicatorSymbolConfig;
    self->_resolvedIndicatorSymbolConfig = v83;
    goto LABEL_106;
  }
  v73 = self->_resolvedIndicatorColor;
  self->_resolvedIndicatorColor = 0;

  v74 = (__CFString *)self->_resolvedIndicatorSymbolConfig;
  self->_resolvedIndicatorSymbolConfig = 0;
LABEL_107:

  background = self->_background;
  if ((!background || (*(_WORD *)&background->_configurationFlags & 0x10) == 0)
    && (-[_UIButtonConfigurationStyleBehaviors effectiveBackgroundColorFromBaseColor:state:traitCollection:]((uint64_t)v11, self->_baseBackgroundColor, v5, v6), v85 = objc_claimAutoreleasedReturnValue(), -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)self->_background, v85), v85, (background = self->_background) == 0)|| (*(_WORD *)&background->_configurationFlags & 0x40) == 0)
  {
    v87 = -[_UIButtonConfigurationStyleBehaviors effectiveBackgroundVisualEffectFromBaseColor:state:traitCollection:]((uint64_t)v11, self->_baseBackgroundColor, v5, v6);
    v88 = self->_background;
    if (v88) {
      objc_setProperty_nonatomic_copy(v88, v86, v87, 56);
    }
  }
  if ([v6 userInterfaceIdiom] == 6)
  {
    v89 = self->_background;
    if (!v89 || (*(_WORD *)&v89->_configurationFlags & 0x80) == 0)
    {
      v90 = objc_msgSend(NSString, "stringWithFormat:", @"UIVisualEffectViewCaptureGroupName(%p)", v4);
      [(UIBackgroundConfiguration *)self->_background __setVisualEffectGroupName:v90];
    }
  }
  self->_resolvedIdiom = [v6 userInterfaceIdiom];
}

- (BOOL)_hasTitle
{
  return [(NSAttributedString *)self->_attributedTitle length] != 0;
}

- (BOOL)_hasSubtitle
{
  return [(NSAttributedString *)self->_attributedSubtitle length] != 0;
}

- (BOOL)_hasImage
{
  return self->_image != 0;
}

- (int64_t)_resolvedTitleAlignment
{
  BOOL v3 = [(UIButtonConfiguration *)self _hasTitle];
  BOOL v4 = [(UIButtonConfiguration *)self _hasSubtitle];
  if (v3 || v4)
  {
    $79A7E1F5F387068245F5C9CFF36D1F58 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x3000000) != 0)
    {
      if (v3 && v4) {
        int v7 = HIBYTE(*(unsigned int *)&flags) & 3;
      }
      else {
        int v7 = 0;
      }
      if ((*(_DWORD *)&flags & 0x4000000) != 0) {
        LODWORD(image) = HIBYTE(*(unsigned int *)&flags) & 3;
      }
      else {
        LODWORD(image) = v7;
      }
    }
    else if ((*(_DWORD *)&flags & 0x4000000) != 0 || (LODWORD(image) = v3 && v4) != 0)
    {
      image = self->_image;
      if (image)
      {
        unint64_t imagePlacement = self->_imagePlacement;
        if (imagePlacement == 8) {
          int v9 = 3;
        }
        else {
          int v9 = 2;
        }
        if (imagePlacement == 2) {
          LODWORD(image) = 1;
        }
        else {
          LODWORD(image) = v9;
        }
      }
    }
  }
  else
  {
    LODWORD(image) = 0;
  }
  return image;
}

- (void)setBaseForegroundColor:(UIColor *)baseForegroundColor
{
}

+ (UIButtonConfiguration)grayButtonConfiguration
{
  id v2 = objc_alloc((Class)a1);
  BOOL v3 = +[_UIButtonConfigurationStyleBehaviors grayBehaviors]();
  BOOL v4 = (void *)[v2 _initWithBehaviors:v3];

  return (UIButtonConfiguration *)v4;
}

+ (UIButtonConfiguration)filledButtonConfiguration
{
  id v2 = objc_alloc((Class)a1);
  BOOL v3 = +[_UIButtonConfigurationStyleBehaviors fillBehaviors]();
  BOOL v4 = (void *)[v2 _initWithBehaviors:v3];

  return (UIButtonConfiguration *)v4;
}

- (UIButtonConfiguration)updatedConfigurationForButton:(UIButton *)button
{
  BOOL v4 = button;
  uint64_t v5 = (void *)[(UIButtonConfiguration *)self copy];
  [v5 _resolveValuesWithButton:v4];

  return (UIButtonConfiguration *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  _UIButtonConfigurationCopy(v4, self, 1, 1);
  return v4;
}

+ (UIButtonConfiguration)plainButtonConfiguration
{
  id v2 = objc_alloc((Class)a1);
  BOOL v3 = +[_UIButtonConfigurationStyleBehaviors plainBehaviors:]((uint64_t)_UIButtonConfigurationStyleBehaviors, 0);
  BOOL v4 = (void *)[v2 _initWithBehaviors:v3];

  return (UIButtonConfiguration *)v4;
}

- (id)_initWithBehaviors:(id)a3
{
  uint64_t v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIButtonConfiguration;
  v6 = [(UIButtonConfiguration *)&v14 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_behaviors, a3);
    uint64_t v8 = +[UIBackgroundConfiguration clearConfiguration];
    background = v7->_background;
    v7->_background = (UIBackgroundConfiguration *)v8;

    [(UIBackgroundConfiguration *)v7->_background _setCornerRadius:5.95];
    if (v5) {
      int64_t v10 = v5[8];
    }
    else {
      int64_t v10 = 0;
    }
    v7->_cornerStyle = v10;
    v11 = +[UIColor clearColor];
    [(UIBackgroundConfiguration *)v7->_background setStrokeColor:v11];

    [(UIBackgroundConfiguration *)v7->_background setStrokeWidth:1.0];
    v7->_unint64_t imagePlacement = 2;
    v7->_titlePadding = 1.0;
    if (v5) {
      int v12 = (v5[6] != -1) << 17;
    }
    else {
      int v12 = 0x20000;
    }
    v7->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v7->_flags & 0xFFFDFFFF | v12);
  }

  return v7;
}

- (void)setTitleAlignment:(UIButtonConfigurationTitleAlignment)titleAlignment
{
  self->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFCFFFFFF | ((titleAlignment & 3) << 24));
}

- (void)setButtonSize:(UIButtonConfigurationSize)buttonSize
{
  unint64_t flags = self->_flags;
  if (((flags >> 4) & 3) != buttonSize)
  {
    self->_unint64_t flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(flags & 0xFFFFFFCF | (16 * (buttonSize & 3)));
    resolvedTitle = self->_resolvedTitle;
    self->_resolvedTitle = 0;

    resolvedSubtitle = self->_resolvedSubtitle;
    self->_resolvedSubtitle = 0;

    background = self->_background;
    if (!background || (*(_WORD *)&background->_configurationFlags & 2) == 0)
    {
      if ((unint64_t)(buttonSize - 1) > 2) {
        double v9 = 5.95;
      }
      else {
        double v9 = dbl_186B93EB8[buttonSize - 1];
      }
      [(UIBackgroundConfiguration *)background _setCornerRadius:v9];
    }
  }
}

- (void)setMacIdiomStyle:(UIButtonConfigurationMacIdiomStyle)macIdiomStyle
{
  self->_unint64_t flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFFFFFF0 | macIdiomStyle & 0xF);
}

- (void)_setAlwaysApplyTitleAlignment:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFBFFFFFF | v3);
}

- (void)setImage:(UIImage *)image
{
}

- (void)setTitle:(NSString *)title
{
  uint64_t v5 = title;
  if (v5)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
    [(UIButtonConfiguration *)self setAttributedTitle:v4];
  }
  else
  {
    [(UIButtonConfiguration *)self setAttributedTitle:0];
  }
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle
{
  BOOL v4 = attributedTitle;
  uint64_t v5 = self->_attributedTitle;
  v6 = v4;
  int v12 = v6;
  if (v5 == v6)
  {

    resolvedTitle = v12;
LABEL_9:

    uint64_t v8 = v12;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    uint64_t v8 = v12;
    goto LABEL_8;
  }
  char v7 = [(NSAttributedString *)v5 isEqual:v6];

  uint64_t v8 = v12;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    int64_t v10 = (NSAttributedString *)[(NSAttributedString *)v8 copy];
    v11 = self->_attributedTitle;
    self->_attributedTitle = v10;

    resolvedTitle = self->_resolvedTitle;
    self->_resolvedTitle = 0;
    goto LABEL_9;
  }
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_indicatorColorTransformer, 0);
  objc_storeStrong(&self->_subtitleTextAttributesTransformer, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong(&self->_titleTextAttributesTransformer, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong(&self->_activityIndicatorColorTransformer, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfigurationForImage, 0);
  objc_storeStrong(&self->_imageColorTransformer, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_baseBackgroundColor, 0);
  objc_storeStrong((id *)&self->_baseForegroundColor, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_resolvedActivityIndicatorColor, 0);
  objc_storeStrong((id *)&self->_resolvedIndicatorSymbolConfig, 0);
  objc_storeStrong((id *)&self->_resolvedIndicatorColor, 0);
  objc_storeStrong((id *)&self->_resolvedSymbolConfig, 0);
  objc_storeStrong((id *)&self->_resolvedImageColor, 0);
  objc_storeStrong((id *)&self->_resolvedSubtitle, 0);
  objc_storeStrong((id *)&self->_resolvedTitle, 0);
  objc_storeStrong((id *)&self->_behaviors, 0);
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)contentInsets
{
  *(_DWORD *)&self->_flags |= 0x80u;
  self->_contentInsets = contentInsets;
}

- (id)_resolvedTitle
{
  return self->_resolvedTitle;
}

- (id)_resolvedSubtitle
{
  return self->_resolvedSubtitle;
}

- (BOOL)showsActivityIndicator
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)_resolvedIndicator
{
  int v2 = (*(_DWORD *)&self->_flags >> 22) & 3;
  if (v2 == 2)
  {
    int v3 = @"chevron.up.chevron.down";
    goto LABEL_5;
  }
  if (v2 == 3)
  {
    int v3 = @"chevron.down";
LABEL_5:
    BOOL v4 = +[UIImage systemImageNamed:v3];
    goto LABEL_7;
  }
  BOOL v4 = 0;
LABEL_7:
  return v4;
}

- (id)_resolvedImage
{
  return self->_image;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    double top = self->_contentInsets.top;
    double leading = self->_contentInsets.leading;
    double bottom = self->_contentInsets.bottom;
    double trailing = self->_contentInsets.trailing;
  }
  else
  {
    [(UIButtonConfiguration *)self _hasTitle];
    [(UIButtonConfiguration *)self _hasSubtitle];
    [(UIButtonConfiguration *)self _hasImage];
    int v3 = +[UIDevice currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    double trailing = 0.0;
    double bottom = 0.0;
    double leading = 0.0;
    double top = 0.0;
    if (v4 != 6)
    {
      unint64_t flags = self->_flags;
      uint64_t v10 = (flags >> 4) & 3;
      double bottom = dbl_186B93EF0[v10];
      double trailing = (double)((flags >> 8) & 7)
               + (double)((flags >> 8) & 7)
               + dbl_186B93ED0[v10];
      double leading = trailing;
      double top = bottom;
    }
  }
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSDirectionalRectEdge)imagePlacement
{
  return self->_imagePlacement;
}

- (double)_resolvedImageReservation
{
  return self->_resolvedImageReservation;
}

- (BOOL)_isRoundButton
{
  if (self->_cornerStyle == 4
    && (*(_DWORD *)&self->_flags & 0xC00000) == 0x400000
    && ![(NSAttributedString *)self->_attributedTitle length]
    && ![(NSAttributedString *)self->_attributedSubtitle length])
  {
    if (self->_image) {
      LOBYTE(v3) = 1;
    }
    else {
      return (*(unsigned char *)&self->_flags >> 6) & 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_hasOversizedTitle
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)_hasOversizedSubtitle
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (BOOL)_hasMultilineSubtitle
{
  return (*(_DWORD *)&self->_flags & 0x18000) == 0
      && [(NSAttributedString *)self->_attributedSubtitle length] != 0;
}

- (id)_resolvedSymbolConfiguration
{
  return self->_resolvedSymbolConfig;
}

- (id)_resolvedImageColor
{
  return self->_resolvedImageColor;
}

- (NSLineBreakMode)titleLineBreakMode
{
  return ((unint64_t)self->_flags >> 11) & 7;
}

- (CGFloat)imagePadding
{
  return self->_imagePadding;
}

- (BOOL)_hasSymbolImage
{
  image = self->_image;
  if (image) {
    LOBYTE(image) = [(UIImage *)image isSymbolImage];
  }
  return (char)image;
}

- (void)setTitlePadding:(CGFloat)titlePadding
{
  self->_titlePadding = titlePadding;
}

- (NSString)title
{
  return [(NSAttributedString *)self->_attributedTitle string];
}

- (UIButtonConfigurationSize)buttonSize
{
  return ((unint64_t)self->_flags >> 4) & 3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UIButtonConfiguration *)a3;
  if (v4 == self)
  {
    char v10 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = v4;
  v6 = v5;
  if (self->_behaviors != v5->_behaviors) {
    goto LABEL_6;
  }
  if (self->_cornerStyle != v5->_cornerStyle) {
    goto LABEL_6;
  }
  $79A7E1F5F387068245F5C9CFF36D1F58 flags = self->_flags;
  $79A7E1F5F387068245F5C9CFF36D1F58 v8 = v5->_flags;
  int v9 = *(_DWORD *)&v8 ^ *(_DWORD *)&flags;
  if (((*(_DWORD *)&v8 ^ *(_DWORD *)&flags) & 0x7F) != 0) {
    goto LABEL_6;
  }
  if ((*(_DWORD *)&flags & *(_DWORD *)&v8 & 0x80) != 0)
  {
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.top, *(float64x2_t *)&v5->_contentInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.bottom, *(float64x2_t *)&v5->_contentInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_6; {
  }
    }
  else if ((v9 & 0x780) != 0)
  {
    goto LABEL_6;
  }
  if ((v9 & 0xDF800) == 0
    && self->_imagePlacement == v5->_imagePlacement
    && self->_imagePadding == v5->_imagePadding
    && self->_imageReservation == v5->_imageReservation)
  {
    char v10 = 0;
    if ((v9 & 0x7000000) != 0 || self->_titlePadding != v5->_titlePadding) {
      goto LABEL_7;
    }
    if (UIEqual(self->_background, v5->_background))
    {
      if (UIEqual(self->_baseForegroundColor, v6->_baseForegroundColor))
      {
        if (UIEqual(self->_baseBackgroundColor, v6->_baseBackgroundColor))
        {
          if (UIEqual(self->_image, v6->_image))
          {
            int v12 = _Block_copy(self->_imageColorTransformer);
            v13 = _Block_copy(v6->_imageColorTransformer);
            int v14 = UIEqual(v12, v13);

            if (v14)
            {
              if (UIEqual(self->_preferredSymbolConfigurationForImage, v6->_preferredSymbolConfigurationForImage))
              {
                unsigned int v15 = _Block_copy(self->_indicatorColorTransformer);
                v16 = _Block_copy(v6->_indicatorColorTransformer);
                int v17 = UIEqual(v15, v16);

                if (v17)
                {
                  BOOL v18 = _Block_copy(self->_activityIndicatorColorTransformer);
                  BOOL v19 = _Block_copy(v6->_activityIndicatorColorTransformer);
                  int v20 = UIEqual(v18, v19);

                  if (v20)
                  {
                    if (UIEqual(self->_attributedTitle, v6->_attributedTitle))
                    {
                      $79A7E1F5F387068245F5C9CFF36D1F58 v21 = _Block_copy(self->_titleTextAttributesTransformer);
                      int v22 = _Block_copy(v6->_titleTextAttributesTransformer);
                      int v23 = UIEqual(v21, v22);

                      if (v23)
                      {
                        if (UIEqual(self->_attributedSubtitle, v6->_attributedSubtitle))
                        {
                          uint64_t v24 = _Block_copy(self->_subtitleTextAttributesTransformer);
                          unint64_t v25 = _Block_copy(v6->_subtitleTextAttributesTransformer);
                          char v10 = UIEqual(v24, v25);

                          goto LABEL_7;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_6:
  char v10 = 0;
LABEL_7:

LABEL_10:
  return v10;
}

- (void)setBackground:(UIBackgroundConfiguration *)background
{
}

- (UIColor)baseForegroundColor
{
  return self->_baseForegroundColor;
}

- (void)_setSwiftBridgingBackground:(id)a3
{
}

- (void)setTitleTextAttributesTransformer:(UIConfigurationTextAttributesTransformer)titleTextAttributesTransformer
{
}

+ (UIButtonConfiguration)tintedButtonConfiguration
{
  id v2 = objc_alloc((Class)a1);
  BOOL v3 = +[_UIButtonConfigurationStyleBehaviors tintBehaviors]();
  uint64_t v4 = (void *)[v2 _initWithBehaviors:v3];

  return (UIButtonConfiguration *)v4;
}

+ (UIButtonConfiguration)borderedButtonConfiguration
{
  BOOL v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 6) {
    [a1 filledButtonConfiguration];
  }
  else {
  uint64_t v5 = [a1 grayButtonConfiguration];
  }
  return (UIButtonConfiguration *)v5;
}

+ (id)_emptyButtonConfiguration
{
  id v2 = objc_alloc((Class)a1);
  BOOL v3 = +[_UIButtonConfigurationStyleBehaviors emptyBehaviors]();
  uint64_t v4 = (void *)[v2 _initWithBehaviors:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIButtonConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)UIButtonConfiguration;
  uint64_t v5 = [(UIButtonConfiguration *)&v32 init];
  if (v5)
  {
    uint64_t v6 = +[_UIButtonConfigurationStyleBehaviors behaviorForStyle:]((uint64_t)_UIButtonConfigurationStyleBehaviors, [v4 decodeIntegerForKey:@"UIButtonConfigurationButtonStyle"]);
    behaviors = v5->_behaviors;
    v5->_behaviors = (_UIButtonConfigurationStyleBehaviors *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationBackground"];
    background = v5->_background;
    v5->_background = (UIBackgroundConfiguration *)v8;

    v5->_cornerStyle = [v4 decodeIntegerForKey:@"UIButtonConfigurationCornerStyle"];
    v5->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFFFFCF | (16
                                                                                          * ([v4 decodeIntegerForKey:@"UIButtonConfigurationButtonSize"] & 3)));
    v5->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFFFFF0 | [v4 decodeIntegerForKey:@"UIButtonConfigurationMacIdiomStyle"] & 0xF);
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationBaseBackgroundColor"];
    baseBackgroundColor = v5->_baseBackgroundColor;
    v5->_baseBackgroundColor = (UIColor *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationBaseForegroundColor"];
    baseForegroundColor = v5->_baseForegroundColor;
    v5->_baseForegroundColor = (UIColor *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationImage"];
    image = v5->_image;
    v5->_image = (UIImage *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationPreferredSymbolConfigurationForImage"];
    preferredSymbolConfigurationForImage = v5->_preferredSymbolConfigurationForImage;
    v5->_preferredSymbolConfigurationForImage = (UIImageSymbolConfiguration *)v16;

    if ([v4 decodeBoolForKey:@"UIButtonConfigurationShowsActivityIndicator"]) {
      int v18 = 64;
    }
    else {
      int v18 = 0;
    }
    v5->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFFFFBF | v18);
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationTitle"];
    attributedTitle = v5->_attributedTitle;
    v5->_attributedTitle = (NSAttributedString *)v19;

    v5->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFFC7FF | (([v4 decodeIntegerForKey:@"UIButtonConfigurationTitleLineBreakMode"] & 7) << 11));
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIButtonConfigurationSubtitle"];
    attributedSubtitle = v5->_attributedSubtitle;
    v5->_attributedSubtitle = (NSAttributedString *)v21;

    v5->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFE3FFF | (([v4 decodeIntegerForKey:@"UIButtonConfigurationSubtitleLineBreakMode"] & 7) << 14));
    if ([v4 containsValueForKey:@"UIButtonConfigurationContentInset"])
    {
      [v4 decodeDirectionalEdgeInsetsForKey:@"UIButtonConfigurationContentInset"];
      v5->_contentInsets.double top = v23;
      v5->_contentInsets.double leading = v24;
      v5->_contentInsets.double bottom = v25;
      v5->_contentInsets.double trailing = v26;
      *(_DWORD *)&v5->_flags |= 0x80u;
    }
    v5->_unint64_t imagePlacement = [v4 decodeIntegerForKey:@"UIButtonConfigurationImagePlacement"];
    [v4 decodeFloatForKey:@"UIButtonConfigurationImagePadding"];
    v5->_imagePadding = v27;
    v5->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFF3FFFF | (([v4 decodeIntegerForKey:@"UIButtonConfigurationIndicator"] & 3) << 18));
    [v4 decodeFloatForKey:@"UIButtonConfigurationTitlePadding"];
    v5->_titlePadding = v28;
    v5->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFCFFFFFF | (([v4 decodeIntegerForKey:@"UIButtonConfigurationTitleAlignment"] & 3) << 24));
    if ([v4 containsValueForKey:@"UIButtonConfigurationAutomaticallyUpdateForSelection"])
    {
      if ([v4 decodeBoolForKey:@"UIButtonConfigurationAutomaticallyUpdateForSelection"])int v29 = 0x20000; {
      else
      }
        int v29 = 0;
    }
    else
    {
      int64_t v30 = v5->_behaviors;
      if (v30) {
        int v29 = (v30->_selectionStyle != -1) << 17;
      }
      else {
        int v29 = 0x20000;
      }
    }
    v5->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFDFFFF | v29);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  behaviors = self->_behaviors;
  if (behaviors) {
    int64_t style = behaviors->_style;
  }
  else {
    int64_t style = 0;
  }
  [v14 encodeInteger:style forKey:@"UIButtonConfigurationButtonStyle"];
  [v14 encodeObject:self->_background forKey:@"UIButtonConfigurationBackground"];
  [v14 encodeInteger:self->_cornerStyle forKey:@"UIButtonConfigurationCornerStyle"];
  [v14 encodeInteger:((unint64_t)self->_flags >> 4) & 3 forKey:@"UIButtonConfigurationButtonSize"];
  [v14 encodeInteger:*(_DWORD *)&self->_flags & 0xFLL forKey:@"UIButtonConfigurationMacIdiomStyle"];
  [v14 encodeObject:self->_baseBackgroundColor forKey:@"UIButtonConfigurationBaseBackgroundColor"];
  [v14 encodeObject:self->_baseForegroundColor forKey:@"UIButtonConfigurationBaseForegroundColor"];
  [v14 encodeObject:self->_image forKey:@"UIButtonConfigurationImage"];
  unint64_t v6 = ((unint64_t)self->_flags >> 18) & 3;
  if (v6) {
    [v14 encodeInteger:v6 forKey:@"UIButtonConfigurationIndicator"];
  }
  [v14 encodeObject:self->_preferredSymbolConfigurationForImage forKey:@"UIButtonConfigurationPreferredSymbolConfigurationForImage"];
  [v14 encodeBool:(*(_DWORD *)&self->_flags >> 6) & 1 forKey:@"UIButtonConfigurationShowsActivityIndicator"];
  [v14 encodeObject:self->_attributedTitle forKey:@"UIButtonConfigurationTitle"];
  unint64_t v7 = ((unint64_t)self->_flags >> 11) & 7;
  if (v7) {
    [v14 encodeInteger:v7 forKey:@"UIButtonConfigurationTitleLineBreakMode"];
  }
  [v14 encodeObject:self->_attributedSubtitle forKey:@"UIButtonConfigurationSubtitle"];
  unint64_t flags = self->_flags;
  uint64_t v9 = (flags >> 14) & 7;
  if (v9)
  {
    [v14 encodeInteger:v9 forKey:@"UIButtonConfigurationSubtitleLineBreakMode"];
    LODWORD(flags) = self->_flags;
  }
  if ((flags & 0x80) != 0) {
    objc_msgSend(v14, "encodeDirectionalEdgeInsets:forKey:", @"UIButtonConfigurationContentInset", self->_contentInsets.top, self->_contentInsets.leading, self->_contentInsets.bottom, self->_contentInsets.trailing);
  }
  [v14 encodeInteger:self->_imagePlacement forKey:@"UIButtonConfigurationImagePlacement"];
  double imagePadding = self->_imagePadding;
  *(float *)&double imagePadding = imagePadding;
  [v14 encodeFloat:@"UIButtonConfigurationImagePadding" forKey:imagePadding];
  double titlePadding = self->_titlePadding;
  *(float *)&double titlePadding = titlePadding;
  [v14 encodeFloat:@"UIButtonConfigurationTitlePadding" forKey:titlePadding];
  [v14 encodeInteger:*((unsigned char *)&self->_flags + 3) & 3 forKey:@"UIButtonConfigurationTitleAlignment"];
  $79A7E1F5F387068245F5C9CFF36D1F58 v12 = self->_flags;
  v13 = self->_behaviors;
  if (v13)
  {
    if (((*(unsigned int *)&v12 >> 17) & 1) != (v13->_selectionStyle == -1)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ((*(_DWORD *)&v12 & 0x20000) == 0) {
LABEL_13:
  }
    objc_msgSend(v14, "encodeBool:forKey:");
LABEL_14:
}

- (unint64_t)hash
{
  unint64_t v3 = [(UIImage *)self->_image hash];
  uint64_t v4 = [(NSAttributedString *)self->_attributedTitle hash];
  uint64_t v5 = [(NSAttributedString *)self->_attributedSubtitle hash];
  behaviors = self->_behaviors;
  if (behaviors) {
    behaviors = (_UIButtonConfigurationStyleBehaviors *)behaviors->_style;
  }
  return (unint64_t)behaviors + 256 * (v4 ^ v3 ^ v5);
}

- (NSString)description
{
  v24.receiver = self;
  v24.super_class = (Class)UIButtonConfiguration;
  unint64_t v3 = [(UIButtonConfiguration *)&v24 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  behaviors = self->_behaviors;
  if (behaviors) {
    behaviors = (_UIButtonConfigurationStyleBehaviors *)behaviors->_styleDescription;
  }
  unint64_t v6 = behaviors;
  [v4 appendFormat:@" baseStyle=%@", v6];

  $79A7E1F5F387068245F5C9CFF36D1F58 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0xFu) <= 3)
  {
    [v4 appendString:*(&off_1E52E4D88 + (*(unsigned char *)&flags & 0xF))];
    $79A7E1F5F387068245F5C9CFF36D1F58 flags = self->_flags;
  }
  [v4 appendString:*(&off_1E52E4DA8 + ((*(unsigned int *)&flags >> 4) & 3))];
  unint64_t v8 = self->_cornerStyle + 1;
  if (v8 <= 5) {
    [v4 appendString:*(&off_1E52E4E40 + v8)];
  }
  if (self->_baseBackgroundColor) {
    [v4 appendFormat:@" baseBackgroundColor=%@", self->_baseBackgroundColor];
  }
  if (self->_baseForegroundColor) {
    [v4 appendFormat:@" baseForegroundColor=%@", self->_baseForegroundColor];
  }
  if ([(NSAttributedString *)self->_attributedTitle length])
  {
    attributedTitle = self->_attributedTitle;
    uint64_t v10 = [(NSAttributedString *)attributedTitle string];
    [v4 appendFormat:@" title=<%p>:'%@'", attributedTitle, v10];

    if (self->_titleTextAttributesTransformer) {
      [v4 appendString:@" hasTitleTextAttributesTransformer"];
    }
  }
  if ([(NSAttributedString *)self->_attributedSubtitle length])
  {
    attributedSubtitle = self->_attributedSubtitle;
    $79A7E1F5F387068245F5C9CFF36D1F58 v12 = [(NSAttributedString *)attributedSubtitle string];
    [v4 appendFormat:@" subTitle=<%p>:'%@'", attributedSubtitle, v12];

    if (self->_subtitleTextAttributesTransformer) {
      [v4 appendString:@" hasSubtitleTextAttributesTransformer"];
    }
  }
  if (self->_image)
  {
    if ((*(_DWORD *)&self->_flags & 0x40) != 0) {
      v13 = @"[hidden]";
    }
    else {
      v13 = &stru_1ED0E84C0;
    }
    uint64_t v14 = objc_opt_class();
    image = self->_image;
    uint64_t v16 = [(UIImage *)image _identityDescription];
    [v4 appendFormat:@" image%@=<%@:%p %@>", v13, v14, image, v16];

    if (self->_preferredSymbolConfigurationForImage) {
      [v4 appendFormat:@" preferredSymbolConfigurationForImage=%@", self->_preferredSymbolConfigurationForImage];
    }
    if (self->_imageColorTransformer) {
      [v4 appendString:@" hasImageColorTransformer"];
    }
  }
  unint64_t v17 = self->_flags;
  uint64_t v18 = ((v17 >> 18) & 3) - 1;
  if (v18 <= 2)
  {
    [v4 appendString:*(&off_1E52E4DC8 + v18)];
    LODWORD(v17) = self->_flags;
  }
  if ((v17 & 0x40) != 0)
  {
    [v4 appendString:@" showsActivityIndicator"];
    if (self->_activityIndicatorColorTransformer) {
      [v4 appendString:@" hasActivityIndicatorColorTransformer"];
    }
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    uint64_t v19 = NSStringFromDirectionalEdgeInsets(self->_contentInsets);
    [v4 appendFormat:@" contentInsets=%@", v19];
  }
  else
  {
    [v4 appendString:@" contentInsets=default"];
  }
  unint64_t v20 = self->_imagePlacement - 1;
  if (v20 <= 7 && ((0x8Bu >> v20) & 1) != 0) {
    [v4 appendString:*(&off_1E52E4DE0 + v20)];
  }
  objc_msgSend(v4, "appendFormat:", @" imagePadding=%.*g titlePadding=%.*g", 17, *(void *)&self->_imagePadding, 17, *(void *)&self->_titlePadding);
  [v4 appendString:*(&off_1E52E4E20 + (*((unsigned char *)&self->_flags + 3) & 3))];
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0)
  {
    uint64_t v21 = self->_behaviors;
    int v22 = @" automaticallyUpdateForSelection";
    if (v21 && v21->_selectionStyle == -1) {
      int v22 = @" (automaticallyUpdateForSelection)";
    }
    [v4 appendString:v22];
  }
  [v4 appendFormat:@" background=%@", self->_background];
  return (NSString *)v4;
}

- (UIButtonConfigurationMacIdiomStyle)macIdiomStyle
{
  return *(_DWORD *)&self->_flags & 0xFLL;
}

- (int64_t)_resolvedMacIdiomStyle
{
  $79A7E1F5F387068245F5C9CFF36D1F58 flags = self->_flags;
  int64_t result = *(unsigned char *)&flags & 0xF;
  if ((*(unsigned char *)&flags & 0xF) == 0)
  {
    behaviors = self->_behaviors;
    if (behaviors) {
      return behaviors->_automaticMacIdiomStyle;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)setShowsActivityIndicator:(BOOL)showsActivityIndicator
{
  if (showsActivityIndicator) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (NSString)subtitle
{
  return [(NSAttributedString *)self->_attributedSubtitle string];
}

- (void)setSubtitle:(NSString *)subtitle
{
  uint64_t v5 = subtitle;
  if (v5)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
    [(UIButtonConfiguration *)self setAttributedSubtitle:v4];
  }
  else
  {
    [(UIButtonConfiguration *)self setAttributedSubtitle:0];
  }
}

- (NSLineBreakMode)subtitleLineBreakMode
{
  return ((unint64_t)self->_flags >> 14) & 7;
}

- (void)setSubtitleLineBreakMode:(NSLineBreakMode)subtitleLineBreakMode
{
  self->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFFE3FFF | ((subtitleLineBreakMode & 7) << 14));
}

- (void)setAttributedSubtitle:(NSAttributedString *)attributedSubtitle
{
  uint64_t v4 = attributedSubtitle;
  uint64_t v5 = self->_attributedSubtitle;
  unint64_t v6 = v4;
  $79A7E1F5F387068245F5C9CFF36D1F58 v12 = v6;
  if (v5 == v6)
  {

    resolvedSubtitle = v12;
LABEL_9:

    unint64_t v8 = v12;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    unint64_t v8 = v12;
    goto LABEL_8;
  }
  char v7 = [(NSAttributedString *)v5 isEqual:v6];

  unint64_t v8 = v12;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    uint64_t v10 = (NSAttributedString *)[(NSAttributedString *)v8 copy];
    v11 = self->_attributedSubtitle;
    self->_attributedSubtitle = v10;

    resolvedSubtitle = self->_resolvedSubtitle;
    self->_resolvedSubtitle = 0;
    goto LABEL_9;
  }
LABEL_10:
}

- (UIButtonConfigurationIndicator)indicator
{
  return ((unint64_t)self->_flags >> 18) & 3;
}

- (void)setIndicator:(UIButtonConfigurationIndicator)indicator
{
  self->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFF3FFFF | ((indicator & 3) << 18));
}

- (void)_dci_setIndicator:(int64_t)a3
{
  if (a3 == 3) {
    a3 = 1;
  }
  [(UIButtonConfiguration *)self setIndicator:a3];
}

- (UIButtonConfigurationTitleAlignment)titleAlignment
{
  return (unint64_t)(*((unsigned char *)&self->_flags + 3) & 3);
}

- (BOOL)automaticallyUpdateForSelection
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (void)setAutomaticallyUpdateForSelection:(BOOL)automaticallyUpdateForSelection
{
  $79A7E1F5F387068245F5C9CFF36D1F58 flags = self->_flags;
  if (((((*(_DWORD *)&flags & 0x20000) == 0) ^ automaticallyUpdateForSelection) & 1) == 0)
  {
    if (automaticallyUpdateForSelection) {
      int v4 = 0x20000;
    }
    else {
      int v4 = 0;
    }
    self->_$79A7E1F5F387068245F5C9CFF36D1F58 flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&flags & 0xFFFDFFFF | v4);
  }
}

- (void)_copyValuesFromConfiguration:(id)a3
{
}

- (BOOL)_alwaysApplyTitleAlignment
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (id)symbolStyleForSize:(int64_t)a3 hasText:(BOOL)a4
{
  int v4 = (id *)&UIFontTextStyleFootnote;
  switch(a3)
  {
    case 1:
      int v4 = (id *)&UIFontTextStyleCallout;
      break;
    case 2:
      return *v4;
    case 3:
      int v4 = (id *)&UIFontTextStyleTitle1;
      if (a4) {
        int v4 = (id *)&UIFontTextStyleTitle2;
      }
      break;
    default:
      int v4 = (id *)&UIFontTextStyleTitle3;
      break;
  }
  return *v4;
}

- (id)_resolvedIndicatorColor
{
  return self->_resolvedIndicatorColor;
}

- (id)_resolvedIndicatorSymbolConfiguration
{
  return self->_resolvedIndicatorSymbolConfig;
}

- (double)_resolvedIndicatorPadding
{
  double result = 4.0;
  if ((*((unsigned char *)&self->_flags + 2) & 0x80) == 0) {
    return 0.0;
  }
  return result;
}

- (double)_resolvedActivityIndicatorSize
{
  return self->_resolvedActivityIndicatorSize;
}

- (id)_resolvedActivityIndicatorColor
{
  return self->_resolvedActivityIndicatorColor;
}

- (BOOL)_hasObscuringBackground
{
  return _UIBackgroundConfigurationIsObscuring(self->_background);
}

- (BOOL)_honorsTintInMacIdiom
{
  behaviors = self->_behaviors;
  return behaviors && (behaviors->_style & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (UIColor)baseBackgroundColor
{
  return self->_baseBackgroundColor;
}

- (UIConfigurationColorTransformer)imageColorTransformer
{
  return self->_imageColorTransformer;
}

- (void)setImageColorTransformer:(UIConfigurationColorTransformer)imageColorTransformer
{
}

- (UIConfigurationColorTransformer)activityIndicatorColorTransformer
{
  return self->_activityIndicatorColorTransformer;
}

- (void)setActivityIndicatorColorTransformer:(UIConfigurationColorTransformer)activityIndicatorColorTransformer
{
}

- (UIConfigurationTextAttributesTransformer)titleTextAttributesTransformer
{
  return self->_titleTextAttributesTransformer;
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (UIConfigurationTextAttributesTransformer)subtitleTextAttributesTransformer
{
  return self->_subtitleTextAttributesTransformer;
}

- (void)setSubtitleTextAttributesTransformer:(UIConfigurationTextAttributesTransformer)subtitleTextAttributesTransformer
{
}

- (UIConfigurationColorTransformer)indicatorColorTransformer
{
  return self->_indicatorColorTransformer;
}

- (void)setIndicatorColorTransformer:(UIConfigurationColorTransformer)indicatorColorTransformer
{
}

- (CGFloat)titlePadding
{
  return self->_titlePadding;
}

- (double)imageReservation
{
  return self->_imageReservation;
}

- (id)_spiValue
{
  return 0;
}

id __67___UIButtonConfiguration__baseAttributesTransformerForTransformer___block_invoke(uint64_t a1, void *a2)
{
  int v3 = (void *)[a2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)off_1E52D2048;
  unint64_t v6 = [v3 objectForKeyedSubscript:*(void *)off_1E52D2048];
  char v7 = (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  [v3 setObject:v7 forKeyedSubscript:v5];

  return v3;
}

@end