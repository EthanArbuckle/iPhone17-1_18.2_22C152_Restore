@interface _UISearchAtomView
+ (BOOL)requiresConstraintBasedLayout;
+ (NSCopying)visualStyleRegistryIdentity;
+ (id)_defaultAtomForegroundColorForTraitCollection:(id)a3;
+ (id)defaultAtomBackgroundColorForTraitCollection:(id)a3;
- (BOOL)isEnabled;
- (NSArray)defaultConstraints;
- (NSArray)withImageConstraints;
- (NSArray)withoutImageConstraints;
- (NSLayoutConstraint)imageBaselineConstraint;
- (NSLayoutConstraint)imageCenterYConstraint;
- (NSLayoutConstraint)maximumAtomWidthConstraint;
- (UIColor)_atomForegroundColor;
- (UIColor)atomBackgroundColor;
- (UIFont)atomFont;
- (UIImageView)leadingImage;
- (UILabel)textLabel;
- (_UISearchAtomBackgroundView)backgroundView;
- (_UISearchAtomView)initWithFrame:(CGRect)a3;
- (_UISearchAtomViewVisualStyle)visualStyle;
- (double)viewportWidth;
- (int64_t)selectionStyle;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_setAtomForegroundColor:(id)a3;
- (void)_updateColors;
- (void)setAtomBackgroundColor:(id)a3;
- (void)setAtomFont:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDefaultConstraints:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setImageBaselineConstraint:(id)a3;
- (void)setImageCenterYConstraint:(id)a3;
- (void)setLeadingImage:(id)a3;
- (void)setMaximumAtomWidthConstraint:(id)a3;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setSelectionStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setTextLabel:(id)a3;
- (void)setViewportWidth:(double)a3;
- (void)setWithImageConstraints:(id)a3;
- (void)setWithoutImageConstraints:(id)a3;
- (void)tintColorDidChange;
- (void)updateConstraints;
@end

@implementation _UISearchAtomView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (_UISearchAtomView)initWithFrame:(CGRect)a3
{
  v82[8] = *MEMORY[0x1E4F143B8];
  v79.receiver = self;
  v79.super_class = (Class)_UISearchAtomView;
  v3 = -[UIView initWithFrame:](&v79, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[_UIVisualStyleRegistry defaultRegistry];
    uint64_t v5 = objc_opt_class();
    [v4 registerVisualStyleClass:v5 forStylableClass:objc_opt_class()];

    v6 = +[_UIVisualStyleRegistry registryForTraitEnvironment:v3];
    v7 = (objc_class *)[v6 visualStyleClassForView:v3];

    uint64_t v8 = [[v7 alloc] initWithInstance:v3];
    visualStyle = v3->_visualStyle;
    v3->_visualStyle = (_UISearchAtomViewVisualStyle *)v8;

    v10 = [_UISearchAtomBackgroundView alloc];
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v15 = -[_UISearchAtomBackgroundView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (_UISearchAtomBackgroundView *)v15;

    v78 = [(_UISearchAtomViewVisualStyle *)v3->_visualStyle defaultFont];
    v17 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v11, v12, v13, v14);
    textLabel = v3->_textLabel;
    v3->_textLabel = v17;

    [(UILabel *)v3->_textLabel setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)v3->_textLabel setFont:v78];
    [(UILabel *)v3->_textLabel setNumberOfLines:1];
    [(UILabel *)v3->_textLabel setTextAlignment:4];
    LODWORD(v19) = 1132068864;
    [(UIView *)v3->_textLabel setContentCompressionResistancePriority:0 forAxis:v19];
    [(UILabel *)v3->_textLabel setAdjustsFontForContentSizeCategory:1];
    v20 = [[UIImageView alloc] initWithImage:0];
    leadingImage = v3->_leadingImage;
    v3->_leadingImage = v20;

    [(UIView *)v3->_leadingImage setTintAdjustmentMode:1];
    LODWORD(v22) = 1148846080;
    [(UIView *)v3->_leadingImage setContentCompressionResistancePriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UIView *)v3->_leadingImage setContentCompressionResistancePriority:1 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(UIView *)v3->_leadingImage setContentHuggingPriority:0 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [(UIView *)v3->_leadingImage setContentHuggingPriority:1 forAxis:v25];
    v26 = [(_UISearchAtomView *)v3 atomFont];
    v27 = +[UIImageSymbolConfiguration configurationWithFont:v26 scale:1];
    [(UIImageView *)v3->_leadingImage setPreferredSymbolConfiguration:v27];

    [(UIView *)v3->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_leadingImage setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3 addSubview:v3->_backgroundView];
    [(UIView *)v3 addSubview:v3->_leadingImage];
    [(UIView *)v3 addSubview:v3->_textLabel];
    [(_UISearchAtomView *)v3 _updateColors];
    [(_UISearchAtomViewVisualStyle *)v3->_visualStyle textVerticalPadding];
    double v29 = v28;
    [(_UISearchAtomViewVisualStyle *)v3->_visualStyle cornerRadius];
    double v31 = v30;
    -[UIView _setContinuousCornerRadius:](v3->_backgroundView, "_setContinuousCornerRadius:");
    [(UIView *)v3 _setContinuousCornerRadius:v31];
    v32 = [(UIView *)v3 widthAnchor];
    [(_UISearchAtomViewVisualStyle *)v3->_visualStyle maximumFallbackWidth];
    v33 = objc_msgSend(v32, "constraintLessThanOrEqualToConstant:");
    [(_UISearchAtomView *)v3 setMaximumAtomWidthConstraint:v33];

    v77 = [(UIView *)v3 trailingAnchor];
    v76 = [(UIView *)v3->_textLabel trailingAnchor];
    [(_UISearchAtomViewVisualStyle *)v3->_visualStyle contentHorizontalPadding];
    v75 = objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76);
    v82[0] = v75;
    v74 = [(UIView *)v3->_textLabel topAnchor];
    v73 = [(UIView *)v3 topAnchor];
    v72 = [v74 constraintEqualToAnchor:v73 constant:v29];
    v82[1] = v72;
    v71 = [(UIView *)v3 bottomAnchor];
    v70 = [(UIView *)v3->_textLabel bottomAnchor];
    v69 = [v71 constraintEqualToAnchor:v70 constant:v29];
    v82[2] = v69;
    v68 = [(UIView *)v3->_backgroundView leadingAnchor];
    v67 = [(UIView *)v3 leadingAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v82[3] = v66;
    v65 = [(UIView *)v3->_backgroundView trailingAnchor];
    v64 = [(UIView *)v3 trailingAnchor];
    v34 = [v65 constraintEqualToAnchor:v64];
    v82[4] = v34;
    v35 = [(UIView *)v3->_backgroundView topAnchor];
    v36 = [(UIView *)v3 topAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v82[5] = v37;
    v38 = [(UIView *)v3->_backgroundView bottomAnchor];
    v39 = [(UIView *)v3 bottomAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v82[6] = v40;
    v41 = [(_UISearchAtomView *)v3 maximumAtomWidthConstraint];
    v82[7] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:8];
    [(_UISearchAtomView *)v3 setDefaultConstraints:v42];

    v43 = [(UIView *)v3->_leadingImage centerYAnchor];
    v44 = [(UIView *)v3->_textLabel centerYAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [(_UISearchAtomView *)v3 setImageCenterYConstraint:v45];

    v46 = [(UIView *)v3->_leadingImage lastBaselineAnchor];
    v47 = [(UIView *)v3->_textLabel lastBaselineAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    [(_UISearchAtomView *)v3 setImageBaselineConstraint:v48];

    v49 = [(UIView *)v3->_leadingImage leadingAnchor];
    v50 = [(UIView *)v3 leadingAnchor];
    [(_UISearchAtomViewVisualStyle *)v3->_visualStyle contentHorizontalPadding];
    v51 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50);
    v81[0] = v51;
    v52 = [(UIView *)v3->_textLabel leadingAnchor];
    v53 = [(UIView *)v3->_leadingImage trailingAnchor];
    [(_UISearchAtomViewVisualStyle *)v3->_visualStyle imageTextSpacing];
    v54 = objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53);
    v81[1] = v54;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
    [(_UISearchAtomView *)v3 setWithImageConstraints:v55];

    v56 = [(UIView *)v3->_textLabel leadingAnchor];
    v57 = [(UIView *)v3 leadingAnchor];
    [(_UISearchAtomViewVisualStyle *)v3->_visualStyle contentHorizontalPadding];
    v58 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57);
    v80[0] = v58;
    v59 = [(UIView *)v3->_leadingImage leadingAnchor];
    v60 = [(UIView *)v3 leadingAnchor];
    v61 = [v59 constraintEqualToAnchor:v60];
    v80[1] = v61;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
    [(_UISearchAtomView *)v3 setWithoutImageConstraints:v62];
  }
  return v3;
}

+ (id)defaultAtomBackgroundColorForTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UISearchAtomView);
  uint64_t v5 = [v3 userInterfaceIdiom];

  v6 = +[_UIVisualStyleRegistry registryForIdiom:v5];
  v7 = (objc_class *)[v6 visualStyleClassForStylableClass:objc_opt_class()];

  uint64_t v8 = (void *)[[v7 alloc] initWithInstance:v4];
  v9 = [v8 defaultAtomBackgroundColor];

  return v9;
}

+ (id)_defaultAtomForegroundColorForTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UISearchAtomView);
  uint64_t v5 = [v3 userInterfaceIdiom];

  v6 = +[_UIVisualStyleRegistry registryForIdiom:v5];
  v7 = (objc_class *)[v6 visualStyleClassForStylableClass:objc_opt_class()];

  uint64_t v8 = (void *)[[v7 alloc] initWithInstance:v4];
  v9 = [v8 defaultTextAndImageColor];

  return v9;
}

- (void)setAtomBackgroundColor:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = objc_opt_class();
    id v3 = [(UIView *)self traitCollection];
    id v5 = [v6 defaultAtomBackgroundColorForTraitCollection:v3];
  }
  objc_storeStrong((id *)&self->_atomBackgroundColor, v5);
  if (!v7)
  {
  }
  [(_UISearchAtomView *)self _updateColors];
}

- (void)_setAtomForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_customAtomForegroundColor, a3);
  [(_UISearchAtomView *)self _updateColors];
}

- (UIColor)_atomForegroundColor
{
  customAtomForegroundColor = self->_customAtomForegroundColor;
  if (customAtomForegroundColor)
  {
    id v3 = customAtomForegroundColor;
  }
  else
  {
    id v3 = [(_UISearchAtomViewVisualStyle *)self->_visualStyle defaultTextAndImageColor];
  }
  return v3;
}

- (UIFont)atomFont
{
  return [(UILabel *)self->_textLabel font];
}

- (void)setAtomFont:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(_UISearchAtomViewVisualStyle *)self->_visualStyle defaultFont];
  }
  id v6 = v4;
  [(UILabel *)self->_textLabel setFont:v4];
  id v5 = +[UIImageSymbolConfiguration configurationWithFont:v6 scale:1];
  [(UIImageView *)self->_leadingImage setPreferredSymbolConfiguration:v5];
  [(UIView *)self setNeedsLayout];
}

- (void)updateConstraints
{
  v11.receiver = self;
  v11.super_class = (Class)_UISearchAtomView;
  [(UIView *)&v11 updateConstraints];
  id v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = [(UIImageView *)self->_leadingImage image];

  [v3 addObjectsFromArray:self->_defaultConstraints];
  if (v5)
  {
    [v3 addObjectsFromArray:self->_withImageConstraints];
    [v4 addObjectsFromArray:self->_withoutImageConstraints];
    id v6 = [(UIImageView *)self->_leadingImage _currentImage];
    int v7 = [v6 hasBaseline];

    if (v7) {
      uint64_t v8 = &OBJC_IVAR____UISearchAtomView__imageBaselineConstraint;
    }
    else {
      uint64_t v8 = &OBJC_IVAR____UISearchAtomView__imageCenterYConstraint;
    }
    if (v7) {
      v9 = &OBJC_IVAR____UISearchAtomView__imageCenterYConstraint;
    }
    else {
      v9 = &OBJC_IVAR____UISearchAtomView__imageBaselineConstraint;
    }
    v10 = v3;
  }
  else
  {
    [v3 addObjectsFromArray:self->_withoutImageConstraints];
    [v4 addObjectsFromArray:self->_withImageConstraints];
    v9 = &OBJC_IVAR____UISearchAtomView__imageCenterYConstraint;
    uint64_t v8 = &OBJC_IVAR____UISearchAtomView__imageBaselineConstraint;
    v10 = v4;
  }
  [v10 addObject:*(Class *)((char *)&self->super.super.super.isa + *v8)];
  [v4 addObject:*(Class *)((char *)&self->super.super.super.isa + *v9)];
  [MEMORY[0x1E4F5B268] deactivateConstraints:v4];
  [MEMORY[0x1E4F5B268] activateConstraints:v3];
}

- (void)_updateColors
{
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      double v22 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    double v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateColors___s_category) + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24[0] = 0;
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", (uint8_t *)v24, 2u);
    }
  }
  id v3 = +[UITraitCollection _currentTraitCollectionIfExists]();
  id v4 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v4];

  id v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  int64_t v6 = [(_UISearchAtomBackgroundView *)self->_backgroundView selectionStyle];
  visualStyle = self->_visualStyle;
  if (v6) {
    BOOL v8 = (*(unsigned char *)&self->_flags & 1) == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (*(unsigned char *)&self->_flags)
    {
      v9 = [(_UISearchAtomViewVisualStyle *)visualStyle defaultAtomBackgroundBlurEffect];
      v10 = self->_atomBackgroundColor;
    }
    else
    {
      v9 = [(_UISearchAtomViewVisualStyle *)visualStyle disabledAtomBackgroundBlurEffect];
      if (v9)
      {
        +[UIColor clearColor];
      }
      else
      {
        atomBackgroundColor = self->_atomBackgroundColor;
        [(_UISearchAtomViewVisualStyle *)self->_visualStyle disabledAlpha];
        -[UIColor colorWithAlphaComponent:](atomBackgroundColor, "colorWithAlphaComponent:");
      }
      v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    double v14 = v10;
    uint64_t v15 = [(_UISearchAtomView *)self _atomForegroundColor];
  }
  else
  {
    objc_super v11 = [(_UISearchAtomViewVisualStyle *)visualStyle defaultSelectedAtomBackgroundColor];
    double v12 = v11;
    if (v11)
    {
      double v13 = v11;
    }
    else
    {
      double v13 = [(UIView *)self tintColor];
    }
    double v14 = v13;
    uint64_t v15 = [(_UISearchAtomViewVisualStyle *)self->_visualStyle defaultSelectedTextAndImageColor];

    v9 = 0;
  }
  [(_UISearchAtomViewVisualStyle *)self->_visualStyle updateColorsWithBackgroundColor:v14];
  [(UIView *)self->_backgroundView setBackgroundColor:v14];
  [(_UISearchAtomBackgroundView *)self->_backgroundView setBlurEffect:v9];
  [(UIColor *)v14 _luminanceDifferenceFromColor:v15];
  double v18 = v17;
  [(_UISearchAtomViewVisualStyle *)self->_visualStyle minimumTextConstrastRatio];
  if (v18 < v19)
  {
    uint64_t v20 = [(_UISearchAtomViewVisualStyle *)self->_visualStyle textContrastFallbackColor];

    uint64_t v15 = (void *)v20;
  }
  if (*(unsigned char *)&self->_flags)
  {
    [(UILabel *)self->_textLabel setTextColor:v15];
    [(UIView *)self->_leadingImage setTintColor:v15];
  }
  else
  {
    [(_UISearchAtomViewVisualStyle *)self->_visualStyle disabledAlpha];
    v21 = objc_msgSend(v15, "colorWithAlphaComponent:");
    [(UILabel *)self->_textLabel setTextColor:v21];
    [(UIView *)self->_leadingImage setTintColor:v21];
  }
  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:v3];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UISearchAtomView;
  [(UIView *)&v3 tintColorDidChange];
  [(_UISearchAtomView *)self _updateColors];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UISearchAtomView;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(_UISearchAtomView *)self _updateColors];
}

- (BOOL)isEnabled
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  char flags = (char)self->_flags;
  if (((((flags & 1) == 0) ^ a3) & 1) == 0)
  {
    BOOL v5 = a4;
    *(unsigned char *)&self->_char flags = flags & 0xFE | a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __41___UISearchAtomView_setEnabled_animated___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    aBlock[4] = self;
    int v7 = _Block_copy(aBlock);
    BOOL v8 = v7;
    if (v5) {
      +[UIView transitionWithView:self duration:5242880 options:v7 animations:0 completion:0.35];
    }
    else {
      (*((void (**)(void *))v7 + 2))(v7);
    }
  }
}

- (int64_t)selectionStyle
{
  return [(_UISearchAtomBackgroundView *)self->_backgroundView selectionStyle];
}

- (void)setSelectionStyle:(int64_t)a3
{
}

- (void)setSelectionStyle:(int64_t)a3 animated:(BOOL)a4
{
  -[_UISearchAtomBackgroundView setSelectionStyle:](self->_backgroundView, "setSelectionStyle:", a3, a4);
  [(_UISearchAtomView *)self _updateColors];
}

- (void)setViewportWidth:(double)a3
{
  [(_UISearchAtomViewVisualStyle *)self->_visualStyle maximumAtomWidthFraction];
  double v6 = v5 * a3;
  [(_UISearchAtomViewVisualStyle *)self->_visualStyle maximumFallbackWidth];
  if (v6 < v7) {
    double v6 = v7;
  }
  id v8 = [(_UISearchAtomView *)self maximumAtomWidthConstraint];
  [v8 setConstant:v6];
}

- (double)viewportWidth
{
  v2 = [(_UISearchAtomView *)self maximumAtomWidthConstraint];
  [v2 constant];
  double v4 = v3;

  return v4;
}

- (UIColor)atomBackgroundColor
{
  return self->_atomBackgroundColor;
}

- (_UISearchAtomBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (_UISearchAtomViewVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (NSArray)defaultConstraints
{
  return self->_defaultConstraints;
}

- (void)setDefaultConstraints:(id)a3
{
}

- (NSLayoutConstraint)maximumAtomWidthConstraint
{
  return self->_maximumAtomWidthConstraint;
}

- (void)setMaximumAtomWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageBaselineConstraint
{
  return self->_imageBaselineConstraint;
}

- (void)setImageBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageCenterYConstraint
{
  return self->_imageCenterYConstraint;
}

- (void)setImageCenterYConstraint:(id)a3
{
}

- (NSArray)withImageConstraints
{
  return self->_withImageConstraints;
}

- (void)setWithImageConstraints:(id)a3
{
}

- (NSArray)withoutImageConstraints
{
  return self->_withoutImageConstraints;
}

- (void)setWithoutImageConstraints:(id)a3
{
}

- (UILabel)textLabel
{
  return (UILabel *)objc_getProperty(self, a2, 496, 1);
}

- (void)setTextLabel:(id)a3
{
}

- (UIImageView)leadingImage
{
  return (UIImageView *)objc_getProperty(self, a2, 504, 1);
}

- (void)setLeadingImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingImage, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_withoutImageConstraints, 0);
  objc_storeStrong((id *)&self->_withImageConstraints, 0);
  objc_storeStrong((id *)&self->_imageCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_imageBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_maximumAtomWidthConstraint, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_atomBackgroundColor, 0);
  objc_storeStrong((id *)&self->_customAtomForegroundColor, 0);
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"_UISearchAtomView";
}

@end