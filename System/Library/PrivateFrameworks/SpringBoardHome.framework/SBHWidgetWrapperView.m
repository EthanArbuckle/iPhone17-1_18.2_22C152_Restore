@interface SBHWidgetWrapperView
- (BOOL)isHoverAnimationEnabled;
- (BOOL)titleAndSubtitleVisible;
- (CATransform3D)hoverTransform;
- (CGSize)contentSize;
- (NSLayoutConstraint)contentHeightConstraint;
- (NSLayoutConstraint)contentWidthConstraint;
- (NSLayoutConstraint)widgetToTitleSpacingConstraint;
- (NSString)subtitle;
- (NSString)title;
- (SBHShadowedWidgetView)shadowedWidgetView;
- (SBHWidgetWrapperView)init;
- (SBHWidgetWrapperView)initWithTitleAndSubtitleVisible:(BOOL)a3;
- (SBIconView)contentView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIView)shadowView;
- (UIView)shadowedWidgetWrapperView;
- (double)cornerRadius;
- (double)extraSpacingBetweenWidgetAndTitle;
- (id)_subititleLabelFont;
- (id)_titleLabelFont;
- (id)newPortaledShadowedWidgetView;
- (int64_t)backgroundType;
- (void)_applyBackgroundType;
- (void)_applyBackgroundType:(int64_t)a3 toView:(id)a4;
- (void)_contentSizeCategoryDidChange;
- (void)_updateContentSizeConstraints;
- (void)_updateHoverAnimation;
- (void)dealloc;
- (void)setBackgroundType:(int64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContentHeightConstraint:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentView:(id)a3;
- (void)setContentWidthConstraint:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setExtraSpacingBetweenWidgetAndTitle:(double)a3;
- (void)setHoverAnimationEnabled:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setWidgetToTitleSpacingConstraint:(id)a3;
@end

@implementation SBHWidgetWrapperView

- (SBHWidgetWrapperView)init
{
  return [(SBHWidgetWrapperView *)self initWithTitleAndSubtitleVisible:0];
}

- (SBHWidgetWrapperView)initWithTitleAndSubtitleVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v89[7] = *MEMORY[0x1E4F143B8];
  v84.receiver = self;
  v84.super_class = (Class)SBHWidgetWrapperView;
  v4 = -[SBHWidgetWrapperView initWithFrame:](&v84, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    [(SBHWidgetWrapperView *)v4 setClipsToBounds:0];
    v6 = -[_SBHShadowView initWithFrame:]([_SBHShadowView alloc], "initWithFrame:", 0.0, 0.0, v5->_contentSize.width, v5->_contentSize.height);
    BOOL v82 = v3;
    shadowView = v5->_shadowView;
    v5->_shadowView = &v6->super;

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    shadowedWidgetWrapperView = v5->_shadowedWidgetWrapperView;
    v5->_shadowedWidgetWrapperView = v8;

    [(UIView *)v5->_shadowedWidgetWrapperView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBHWidgetWrapperView *)v5 addSubview:v5->_shadowedWidgetWrapperView];
    v10 = [[SBHShadowedWidgetView alloc] initWithContentView:0 shadowView:v5->_shadowView perspectiveEnabled:0];
    shadowedWidgetView = v5->_shadowedWidgetView;
    v5->_shadowedWidgetView = v10;

    [(SBHShadowedWidgetView *)v5->_shadowedWidgetView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v5->_shadowedWidgetWrapperView addSubview:v5->_shadowedWidgetView];
    v68 = (void *)MEMORY[0x1E4F28DC8];
    v80 = [(UIView *)v5->_shadowedWidgetWrapperView leadingAnchor];
    v78 = [(SBHWidgetWrapperView *)v5 leadingAnchor];
    v76 = [v80 constraintEqualToAnchor:v78 constant:0.0];
    v89[0] = v76;
    v74 = [(UIView *)v5->_shadowedWidgetWrapperView trailingAnchor];
    v73 = [(SBHWidgetWrapperView *)v5 trailingAnchor];
    v72 = [v74 constraintEqualToAnchor:v73 constant:0.0];
    v89[1] = v72;
    v71 = [(UIView *)v5->_shadowedWidgetWrapperView topAnchor];
    v70 = [(SBHWidgetWrapperView *)v5 topAnchor];
    v69 = [v71 constraintEqualToAnchor:v70 constant:0.0];
    v89[2] = v69;
    v67 = [(SBHShadowedWidgetView *)v5->_shadowedWidgetView leadingAnchor];
    v66 = [(UIView *)v5->_shadowedWidgetWrapperView leadingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66 constant:0.0];
    v89[3] = v65;
    v64 = [(SBHShadowedWidgetView *)v5->_shadowedWidgetView trailingAnchor];
    v63 = [(UIView *)v5->_shadowedWidgetWrapperView trailingAnchor];
    v12 = [v64 constraintEqualToAnchor:v63 constant:0.0];
    v89[4] = v12;
    v13 = [(SBHShadowedWidgetView *)v5->_shadowedWidgetView topAnchor];
    v14 = [(UIView *)v5->_shadowedWidgetWrapperView topAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:0.0];
    v89[5] = v15;
    v16 = [(SBHShadowedWidgetView *)v5->_shadowedWidgetView bottomAnchor];
    v17 = [(UIView *)v5->_shadowedWidgetWrapperView bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 constant:0.0];
    v89[6] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:7];
    [v68 activateConstraints:v19];

    if (v82)
    {
      v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      titleLabel = v5->_titleLabel;
      v5->_titleLabel = v20;

      [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v22 = v5->_titleLabel;
      v23 = [(SBHWidgetWrapperView *)v5 _titleLabelFont];
      [(UILabel *)v22 setFont:v23];

      v24 = v5->_titleLabel;
      v25 = [MEMORY[0x1E4FB1618] labelColor];
      [(UILabel *)v24 setTextColor:v25];

      [(UILabel *)v5->_titleLabel setNumberOfLines:0];
      [(UILabel *)v5->_titleLabel setTextAlignment:1];
      LODWORD(v26) = 1148846080;
      [(UILabel *)v5->_titleLabel setContentCompressionResistancePriority:1 forAxis:v26];
      [(SBHWidgetWrapperView *)v5 addSubview:v5->_titleLabel];
      v27 = [(UILabel *)v5->_titleLabel topAnchor];
      v28 = [(UIView *)v5->_shadowedWidgetWrapperView bottomAnchor];
      uint64_t v29 = [v27 constraintEqualToAnchor:v28 constant:5.0];
      widgetToTitleSpacingConstraint = v5->_widgetToTitleSpacingConstraint;
      v5->_widgetToTitleSpacingConstraint = (NSLayoutConstraint *)v29;

      v31 = (void *)MEMORY[0x1E4F28DC8];
      v32 = [(UILabel *)v5->_titleLabel leadingAnchor];
      v33 = [(SBHWidgetWrapperView *)v5 leadingAnchor];
      v34 = [v32 constraintEqualToAnchor:v33];
      v88[0] = v34;
      v35 = [(UILabel *)v5->_titleLabel trailingAnchor];
      v36 = [(SBHWidgetWrapperView *)v5 trailingAnchor];
      v37 = [v35 constraintEqualToAnchor:v36];
      v88[1] = v37;
      v88[2] = v5->_widgetToTitleSpacingConstraint;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
      [v31 activateConstraints:v38];

      v39 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      subtitleLabel = v5->_subtitleLabel;
      v5->_subtitleLabel = v39;

      [(UILabel *)v5->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v41 = v5->_subtitleLabel;
      v42 = [(SBHWidgetWrapperView *)v5 _subititleLabelFont];
      [(UILabel *)v41 setFont:v42];

      v43 = v5->_subtitleLabel;
      v44 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UILabel *)v43 setTextColor:v44];

      [(UILabel *)v5->_subtitleLabel setNumberOfLines:0];
      [(UILabel *)v5->_subtitleLabel setTextAlignment:1];
      LODWORD(v45) = 1148846080;
      [(UILabel *)v5->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v45];
      [(SBHWidgetWrapperView *)v5 addSubview:v5->_subtitleLabel];
      v75 = (void *)MEMORY[0x1E4F28DC8];
      v83 = [(UILabel *)v5->_subtitleLabel leadingAnchor];
      v81 = [(SBHWidgetWrapperView *)v5 leadingAnchor];
      v79 = [v83 constraintEqualToAnchor:v81];
      v87[0] = v79;
      v77 = [(UILabel *)v5->_subtitleLabel trailingAnchor];
      v46 = [(SBHWidgetWrapperView *)v5 trailingAnchor];
      v47 = [v77 constraintEqualToAnchor:v46];
      v87[1] = v47;
      v48 = [(UILabel *)v5->_subtitleLabel topAnchor];
      v49 = [(UILabel *)v5->_titleLabel bottomAnchor];
      v50 = [v48 constraintEqualToAnchor:v49];
      v87[2] = v50;
      v51 = [(UILabel *)v5->_subtitleLabel bottomAnchor];
      v52 = [(SBHWidgetWrapperView *)v5 bottomAnchor];
      v53 = [v51 constraintEqualToAnchor:v52];
      v87[3] = v53;
      v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:4];
      [v75 activateConstraints:v54];

      v55 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v55 addObserver:v5 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4FB27A8] object:0];

      v56 = self;
      v86 = v56;
      v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
      id v58 = (id)[(SBHWidgetWrapperView *)v5 registerForTraitChanges:v57 withAction:sel__contentSizeCategoryDidChange];
    }
    else
    {
      v59 = (void *)MEMORY[0x1E4F28DC8];
      v56 = [(UIView *)v5->_shadowedWidgetWrapperView bottomAnchor];
      v57 = [(SBHWidgetWrapperView *)v5 bottomAnchor];
      v60 = [v56 constraintEqualToAnchor:v57 constant:0.0];
      v85 = v60;
      v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
      [v59 activateConstraints:v61];
    }
  }
  return v5;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetWrapperView;
  [(SBHWidgetWrapperView *)&v4 dealloc];
}

- (id)newPortaledShadowedWidgetView
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4FB2248]) initWithSourceView:self->_contentView];
  [v3 setHidesSourceView:1];
  [(SBIconView *)self->_contentView bounds];
  objc_msgSend(v3, "setBounds:");
  [v3 setAllowsBackdropGroups:1];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4FB2248]) initWithSourceView:self->_shadowView];
  [v4 setHidesSourceView:1];
  [(UIView *)self->_shadowView bounds];
  objc_msgSend(v4, "setBounds:");
  v5 = [[SBHPortaledShadowedWidgetView alloc] initWithContentView:v3 shadowView:v4 perspectiveEnabled:0];
  [(SBHShadowedWidgetView *)self->_shadowedWidgetView bounds];
  -[SBHPortaledShadowedWidgetView setBounds:](v5, "setBounds:");

  return v5;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(SBHWidgetWrapperView *)self title];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_titleLabel setText:v6];
  }
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(SBHWidgetWrapperView *)self subtitle];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_subtitleLabel setText:v6];
  }
}

- (void)setContentView:(id)a3
{
  char v5 = (SBIconView *)a3;
  if (self->_contentView != v5)
  {
    -[SBHWidgetWrapperView _applyBackgroundType:toView:](self, "_applyBackgroundType:toView:", 0);
    objc_storeStrong((id *)&self->_contentView, a3);
    [(SBHShadowedWidgetView *)self->_shadowedWidgetView setContentView:v5];
    [(SBHWidgetWrapperView *)self _applyBackgroundType];
  }
}

- (void)setContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  p_contentSize = &self->_contentSize;
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    p_contentSize->CGFloat width = width;
    p_contentSize->CGFloat height = height;
    [(SBHWidgetWrapperView *)self _updateContentSizeConstraints];
    [(SBHWidgetWrapperView *)self setNeedsLayout];
    [(SBHWidgetWrapperView *)self invalidateIntrinsicContentSize];
    [(SBHWidgetWrapperView *)self _updateHoverAnimation];
  }
}

- (double)cornerRadius
{
  [(SBHShadowedWidgetView *)self->_shadowedWidgetView cornerRadius];
  return result;
}

- (void)setCornerRadius:(double)a3
{
  [(SBHShadowedWidgetView *)self->_shadowedWidgetView setCornerRadius:a3];
  [(SBHWidgetWrapperView *)self _applyBackgroundType];
}

- (UIView)containerView
{
  return (UIView *)self->_shadowedWidgetView;
}

- (void)setExtraSpacingBetweenWidgetAndTitle:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_extraSpacingBetweenWidgetAndTitle = a3;
    widgetToTitleSpacingConstraint = self->_widgetToTitleSpacingConstraint;
    [(NSLayoutConstraint *)widgetToTitleSpacingConstraint setConstant:a3 + 5.0];
  }
}

- (void)setBackgroundType:(int64_t)a3
{
  if (self->_backgroundType != a3)
  {
    self->_backgroundType = a3;
    [(SBHWidgetWrapperView *)self _applyBackgroundType];
  }
}

- (void)setBackgroundView:(id)a3
{
  v28[4] = *MEMORY[0x1E4F143B8];
  char v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    if (v5)
    {
      contentView = self->_contentView;
      if (contentView)
      {
        v27 = contentView;
        v9 = [(SBIconView *)v27 customIconImageViewController];
        double v26 = [v9 view];

        [v26 insertSubview:v5 atIndex:0];
        [(SBHWidgetWrapperView *)self setBackgroundType:2];
        [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
        v21 = (void *)MEMORY[0x1E4F28DC8];
        v25 = [(UIView *)v5 leadingAnchor];
        v24 = [(UIView *)self->_shadowedWidgetWrapperView leadingAnchor];
        v23 = [v25 constraintEqualToAnchor:v24 constant:4.0];
        v28[0] = v23;
        v22 = [(UIView *)v5 trailingAnchor];
        v10 = [(UIView *)self->_shadowedWidgetWrapperView trailingAnchor];
        v11 = [v22 constraintEqualToAnchor:v10 constant:-4.0];
        v28[1] = v11;
        v12 = [(UIView *)v5 topAnchor];
        v13 = [(UIView *)self->_shadowedWidgetWrapperView topAnchor];
        v14 = [v12 constraintEqualToAnchor:v13 constant:4.0];
        v28[2] = v14;
        v15 = [(UIView *)v5 bottomAnchor];
        v16 = [(UIView *)self->_shadowedWidgetWrapperView bottomAnchor];
        v17 = [v15 constraintEqualToAnchor:v16 constant:-4.0];
        v28[3] = v17;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
        [v21 activateConstraints:v18];

        goto LABEL_7;
      }
      v19 = *p_backgroundView;
      *p_backgroundView = 0;
      id v20 = 0;
    }
    [(SBHWidgetWrapperView *)self setBackgroundType:0];
  }
LABEL_7:
}

- (void)_updateContentSizeConstraints
{
  v15[2] = *MEMORY[0x1E4F143B8];
  contentHeightConstraint = self->_contentHeightConstraint;
  if (!contentHeightConstraint)
  {
    objc_super v4 = [(UIView *)self->_shadowedWidgetWrapperView heightAnchor];
    char v5 = [v4 constraintEqualToConstant:self->_contentSize.height];
    id v6 = self->_contentHeightConstraint;
    self->_contentHeightConstraint = v5;

    contentHeightConstraint = self->_contentHeightConstraint;
  }
  p_contentSize = &self->_contentSize;
  [(NSLayoutConstraint *)contentHeightConstraint setConstant:self->_contentSize.height];
  contentWidthConstraint = self->_contentWidthConstraint;
  if (!contentWidthConstraint)
  {
    v9 = [(UIView *)self->_shadowedWidgetWrapperView widthAnchor];
    v10 = [v9 constraintEqualToConstant:p_contentSize->width];
    v11 = self->_contentWidthConstraint;
    self->_contentWidthConstraint = v10;

    contentWidthConstraint = self->_contentWidthConstraint;
  }
  [(NSLayoutConstraint *)contentWidthConstraint setConstant:p_contentSize->width];
  v12 = (void *)MEMORY[0x1E4F28DC8];
  v13 = self->_contentWidthConstraint;
  v15[0] = self->_contentHeightConstraint;
  v15[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v12 activateConstraints:v14];
}

- (void)_applyBackgroundType
{
  id v3 = [(SBHWidgetWrapperView *)self contentView];
  [(SBHWidgetWrapperView *)self _applyBackgroundType:[(SBHWidgetWrapperView *)self backgroundType] toView:v3];
}

- (void)_applyBackgroundType:(int64_t)a3 toView:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    id v8 = v6;
    v7 = [MEMORY[0x1E4FB1618] blackColor];
    [v8 setBackgroundColor:v7];

    [(SBHShadowedWidgetView *)self->_shadowedWidgetView cornerRadius];
    objc_msgSend(v8, "_setContinuousCornerRadius:");
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v8 = v6;
    [v6 setBackgroundColor:0];
  }
  id v6 = v8;
LABEL_6:
}

- (CATransform3D)hoverTransform
{
  objc_super v4 = [(SBHWidgetWrapperView *)self shadowedWidgetView];
  id v9 = [v4 layer];

  char v5 = [v9 presentationLayer];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v9;
  }
  id v7 = v6;

  if (v7)
  {
    [v7 transform];
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)_updateHoverAnimation
{
  if ([(SBHWidgetWrapperView *)self isHoverAnimationEnabled])
  {
    id v3 = [(SBHWidgetWrapperView *)self window];

    shadowedWidgetView = self->_shadowedWidgetView;
    if (v3)
    {
      [(SBHShadowedWidgetView *)shadowedWidgetView setPerspectiveEnabled:1];
      double v5 = dbl_1D81E5010[self->_contentSize.width > 200.0];
      uint32_t v6 = arc4random_uniform(0x3E8u);
      v8[1] = 3221225472;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[2] = __45__SBHWidgetWrapperView__updateHoverAnimation__block_invoke;
      v8[3] = &unk_1E6AAE648;
      *(double *)&v8[5] = (double)v6 * 0.001 * 8.0;
      v8[4] = self;
      id v7 = (void (**)(void *, __CFString *, double, double, double, double))_Block_copy(v8);
      v7[2](v7, @"x", -v5, v5, 8.0, 0.0);
      v7[2](v7, @"y", -v5, v5, 8.0, 0.5);
      v7[2](v7, @"z", v5 / -5.0, v5 / 5.0, 16.0, 0.25);
    }
    else
    {
      [(SBHShadowedWidgetView *)shadowedWidgetView setPerspectiveEnabled:0];
    }
  }
}

void __45__SBHWidgetWrapperView__updateHoverAnimation__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  id v18 = [NSString stringWithFormat:@"transform.rotation.%@", a2];
  v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v18];
  v12 = [NSNumber numberWithDouble:a3];
  [v11 setFromValue:v12];

  v13 = [NSNumber numberWithDouble:a4];
  [v11 setToValue:v13];

  [v11 setBeginTime:CACurrentMediaTime() - *(double *)(a1 + 40) - a6 * a5];
  [v11 setDuration:a5];
  [v11 setAutoreverses:1];
  LODWORD(v14) = 1148846080;
  [v11 setRepeatCount:v14];
  v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v11 setTimingFunction:v15];

  [v11 setAdditive:1];
  CAFrameRateRange v20 = CAFrameRateRangeMake(20.0, 60.0, 20.0);
  objc_msgSend(v11, "setPreferredFrameRateRange:", *(double *)&v20.minimum, *(double *)&v20.maximum, *(double *)&v20.preferred);
  v16 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  v17 = [v11 keyPath];
  [v16 addAnimation:v11 forKey:v17];
}

- (id)_titleLabelFont
{
  id v3 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  uint64_t v4 = *MEMORY[0x1E4FB28F0];
  double v5 = [(SBHWidgetWrapperView *)self traitCollection];
  uint32_t v6 = [v5 preferredContentSizeCategory];
  id v7 = [v3 preferredFontForTextStyle:v4 hiFontStyle:4 contentSizeCategory:v6];

  return v7;
}

- (id)_subititleLabelFont
{
  id v3 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  uint64_t v4 = *MEMORY[0x1E4FB28F0];
  double v5 = [(SBHWidgetWrapperView *)self traitCollection];
  uint32_t v6 = [v5 preferredContentSizeCategory];
  id v7 = [v3 preferredFontForTextStyle:v4 hiFontStyle:1 contentSizeCategory:v6];

  return v7;
}

- (void)_contentSizeCategoryDidChange
{
  id v3 = [(SBHWidgetWrapperView *)self titleLabel];
  uint64_t v4 = [(SBHWidgetWrapperView *)self _titleLabelFont];
  [v3 setFont:v4];

  double v5 = [(SBHWidgetWrapperView *)self subtitleLabel];
  uint32_t v6 = [(SBHWidgetWrapperView *)self _subititleLabelFont];
  [v5 setFont:v6];

  [(SBHWidgetWrapperView *)self setNeedsLayout];
}

- (SBIconView)contentView
{
  return self->_contentView;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isHoverAnimationEnabled
{
  return self->_hoverAnimationEnabled;
}

- (void)setHoverAnimationEnabled:(BOOL)a3
{
  self->_hoverAnimationEnabled = a3;
}

- (double)extraSpacingBetweenWidgetAndTitle
{
  return self->_extraSpacingBetweenWidgetAndTitle;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (SBHShadowedWidgetView)shadowedWidgetView
{
  return self->_shadowedWidgetView;
}

- (UIView)shadowedWidgetWrapperView
{
  return self->_shadowedWidgetWrapperView;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (NSLayoutConstraint)widgetToTitleSpacingConstraint
{
  return self->_widgetToTitleSpacingConstraint;
}

- (void)setWidgetToTitleSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentHeightConstraint
{
  return self->_contentHeightConstraint;
}

- (void)setContentHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentWidthConstraint
{
  return self->_contentWidthConstraint;
}

- (void)setContentWidthConstraint:(id)a3
{
}

- (BOOL)titleAndSubtitleVisible
{
  return self->_titleAndSubtitleVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_widgetToTitleSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_shadowedWidgetWrapperView, 0);
  objc_storeStrong((id *)&self->_shadowedWidgetView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end