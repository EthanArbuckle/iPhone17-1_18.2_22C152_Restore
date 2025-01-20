@interface BFFPaneHeaderView
- (BFFPaneHeaderView)initWithFrame:(CGRect)a3;
- (BOOL)iconInheritsTint;
- (BOOL)isTextLabelAlignedByLastBaseline;
- (BOOL)useMinimumTopPadding;
- (CGSize)iconSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)iconAccessibilityLabel;
- (UIColor)bottomLineColor;
- (UIImage)icon;
- (UIImageView)iconView;
- (UILabel)detailTextLabel;
- (UILabel)subLabel;
- (UILabel)textLabel;
- (double)_labelsAndLinksBaselineOffsetForView:(id)a3;
- (double)customTopPadding;
- (double)flexibleHeight;
- (double)heightForWidth:(double)a3 inView:(id)a4;
- (void)_linkButtonPressed;
- (void)layoutSubviews;
- (void)setBottomLineColor:(id)a3;
- (void)setCustomTopPadding:(double)a3;
- (void)setFlexibleHeight:(double)a3;
- (void)setIcon:(id)a3;
- (void)setIconAccessibilityLabel:(id)a3;
- (void)setIconInheritsTint:(BOOL)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setIconView:(id)a3;
- (void)setLinkText:(id)a3 handler:(id)a4;
- (void)setTitleText:(id)a3;
- (void)setUseMinimumTopPadding:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation BFFPaneHeaderView

- (BFFPaneHeaderView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)BFFPaneHeaderView;
  v3 = -[BFFPaneHeaderView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[BFFStyle sharedStyle];
    [v4 edgeInsetsForHeaderView:v3];
    [(BFFPaneHeaderView *)v3 setLayoutMargins:"setLayoutMargins:"];

    id v5 = objc_alloc(MEMORY[0x263F828E0]);
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
    textLabel = v3->_textLabel;
    v3->_textLabel = (UILabel *)v10;

    [(UILabel *)v3->_textLabel setNumberOfLines:0];
    v12 = +[BFFStyle sharedStyle];
    [v12 applyThemeToTitleLabel:v3->_textLabel];

    [(BFFPaneHeaderView *)v3 addSubview:v3->_textLabel];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v6, v7, v8, v9);
    detailTextLabel = v3->_detailTextLabel;
    v3->_detailTextLabel = (UILabel *)v13;

    [(UILabel *)v3->_detailTextLabel setNumberOfLines:0];
    v15 = +[BFFStyle sharedStyle];
    [v15 applyThemeToLabel:v3->_detailTextLabel];

    [(UILabel *)v3->_detailTextLabel setTextAlignment:1];
    v16 = (void *)MEMORY[0x263F82760];
    v17 = [MEMORY[0x263F82768] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
    v18 = [v17 fontDescriptorWithSymbolicTraits:0x8000];
    v19 = [v16 fontWithDescriptor:v18 size:0.0];
    [(UILabel *)v3->_detailTextLabel setFont:v19];

    [(BFFPaneHeaderView *)v3 addSubview:v3->_detailTextLabel];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v6, v7, v8, v9);
    subLabel = v3->_subLabel;
    v3->_subLabel = (UILabel *)v20;

    [(UILabel *)v3->_subLabel setNumberOfLines:0];
    v22 = +[BFFStyle sharedStyle];
    [v22 applyThemeToLabel:v3->_subLabel];

    [(UILabel *)v3->_subLabel setTextAlignment:1];
    v23 = [(UILabel *)v3->_detailTextLabel font];
    [(UILabel *)v3->_subLabel setFont:v23];

    [(BFFPaneHeaderView *)v3 addSubview:v3->_subLabel];
    [(BFFPaneHeaderView *)v3 setCustomTopPadding:-1.0];
  }
  return v3;
}

- (void)setIcon:(id)a3
{
  v4 = (UIImage *)a3;
  p_icon = &self->_icon;
  if (self->_icon != v4)
  {
    obj = v4;
    if ([(BFFPaneHeaderView *)self iconInheritsTint]
      && ([(BFFPaneHeaderView *)self tintColor],
          double v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      double v7 = [(BFFPaneHeaderView *)self tintColor];
      uint64_t v8 = [(UIImage *)obj _flatImageWithColor:v7];

      double v9 = (UIImage *)v8;
    }
    else
    {
      double v9 = obj;
    }
    obja = v9;
    objc_storeStrong((id *)&self->_icon, v9);
    iconView = self->_iconView;
    if (*p_icon)
    {
      if (!iconView)
      {
        v11 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:*p_icon];
        v12 = self->_iconView;
        self->_iconView = v11;

        if (self->_iconSize.width != *MEMORY[0x263F001B0]
          || self->_iconSize.height != *(double *)(MEMORY[0x263F001B0] + 8))
        {
          [(UIImageView *)self->_iconView frame];
          -[UIImageView setFrame:](self->_iconView, "setFrame:");
        }
        [(BFFPaneHeaderView *)self addSubview:self->_iconView];
        goto LABEL_17;
      }
    }
    else if (iconView)
    {
      [(UIImageView *)iconView removeFromSuperview];
      v14 = self->_iconView;
      self->_iconView = 0;

LABEL_17:
      [(BFFPaneHeaderView *)self setNeedsLayout];
      v4 = obja;
      goto LABEL_18;
    }
    -[UIImageView setImage:](iconView, "setImage:");
    goto LABEL_17;
  }
LABEL_18:
}

- (void)setIconAccessibilityLabel:(id)a3
{
  iconView = self->_iconView;
  BOOL v5 = a3 != 0;
  id v6 = a3;
  [(UIImageView *)iconView setIsAccessibilityElement:v5];
  [(UIImageView *)self->_iconView setAccessibilityLabel:v6];
}

- (NSString)iconAccessibilityLabel
{
  return (NSString *)[(UIImageView *)self->_iconView accessibilityLabel];
}

- (void)setIconSize:(CGSize)a3
{
  p_iconSize = &self->_iconSize;
  if (a3.width != self->_iconSize.width || a3.height != self->_iconSize.height)
  {
    p_iconSize->double width = a3.width;
    self->_iconSize.double height = a3.height;
    [(UIImageView *)self->_iconView frame];
    double v7 = v6;
    double v9 = v8;
    double width = p_iconSize->width;
    double height = p_iconSize->height;
    double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
    if (p_iconSize->width == *MEMORY[0x263F001B0] && height == v12)
    {
      [(UIImage *)self->_icon size];
      double width = v14;
      double height = v15;
    }
    iconView = self->_iconView;
    -[UIImageView setFrame:](iconView, "setFrame:", v7, v9, width, height);
  }
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8)) {
    [(UIImage *)self->_icon size];
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconInheritsTint:(BOOL)a3
{
  if (self->_iconInheritsTint != a3)
  {
    self->_iconInheritsTint = a3;
    [(BFFPaneHeaderView *)self tintColorDidChange];
  }
}

- (void)tintColorDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)BFFPaneHeaderView;
  [(BFFPaneHeaderView *)&v8 tintColorDidChange];
  if ([(BFFPaneHeaderView *)self iconInheritsTint])
  {
    v3 = [(BFFPaneHeaderView *)self tintColor];

    if (v3)
    {
      iconView = self->_iconView;
      BOOL v5 = [(UIImageView *)iconView image];
      double v6 = [(BFFPaneHeaderView *)self tintColor];
      double v7 = [v5 _flatImageWithColor:v6];
      [(UIImageView *)iconView setImage:v7];
    }
  }
}

- (void)_linkButtonPressed
{
  linkHandler = (void (**)(void))self->_linkHandler;
  if (linkHandler) {
    linkHandler[2]();
  }
}

- (void)setTitleText:(id)a3
{
  [(UILabel *)self->_textLabel setText:a3];
  v4 = +[BFFStyle sharedStyle];
  [v4 applyThemeToTitleLabel:self->_textLabel];

  [(BFFPaneHeaderView *)self setNeedsLayout];
}

- (void)setLinkText:(id)a3 handler:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  [(UIButton *)self->_linkButton removeFromSuperview];
  uint64_t v7 = [v19 length];
  if (v6 && v7)
  {
    objc_super v8 = [MEMORY[0x263F824E8] buttonWithType:1];
    linkButton = self->_linkButton;
    self->_linkButton = v8;

    uint64_t v10 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v11 = [(UIButton *)self->_linkButton titleLabel];
    [v11 setFont:v10];

    double v12 = [(UIButton *)self->_linkButton titleLabel];
    [v12 setLineBreakMode:0];

    uint64_t v13 = [(UIButton *)self->_linkButton titleLabel];
    [v13 setNumberOfLines:0];

    double v14 = [(UIButton *)self->_linkButton titleLabel];
    [v14 setTextAlignment:1];

    [(UIButton *)self->_linkButton setTitle:v19 forState:0];
    [(UIButton *)self->_linkButton addTarget:self action:sel__linkButtonPressed forControlEvents:0x2000];
    double v15 = (void *)MEMORY[0x223C63B60](v6);
    id linkHandler = self->_linkHandler;
    self->_id linkHandler = v15;

    [(BFFPaneHeaderView *)self addSubview:self->_linkButton];
  }
  else
  {
    v17 = self->_linkButton;
    self->_linkButton = 0;

    id v18 = self->_linkHandler;
    self->_id linkHandler = 0;
  }
  [(BFFPaneHeaderView *)self setNeedsLayout];
}

- (UIColor)bottomLineColor
{
  return [(UIView *)self->_bottomLine backgroundColor];
}

- (void)setBottomLineColor:(id)a3
{
  id v10 = a3;
  id v4 = [(UIView *)self->_bottomLine backgroundColor];

  BOOL v5 = v10;
  if (v4 != v10)
  {
    [(UIView *)self->_bottomLine removeFromSuperview];
    if (v10)
    {
      bottomLine = self->_bottomLine;
      if (!bottomLine)
      {
        id v7 = objc_alloc(MEMORY[0x263F82E00]);
        objc_super v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        double v9 = self->_bottomLine;
        self->_bottomLine = v8;

        bottomLine = self->_bottomLine;
      }
      [(BFFPaneHeaderView *)self addSubview:bottomLine];
    }
    [(UIView *)self->_bottomLine setBackgroundColor:v10];
    [(BFFPaneHeaderView *)self setNeedsLayout];
    BOOL v5 = v10;
  }
}

- (double)_labelsAndLinksBaselineOffsetForView:(id)a3
{
  v3 = (void *)MEMORY[0x263F82770];
  uint64_t v4 = *MEMORY[0x263F83570];
  id v5 = a3;
  id v6 = [v3 metricsForTextStyle:v4];
  id v7 = [v5 traitCollection];

  uint64_t v8 = [v7 horizontalSizeClass];
  double v9 = 34.0;
  if (v8 == 1) {
    double v9 = 30.0;
  }
  [v6 scaledValueForValue:v9];
  double v11 = v10;

  return v11;
}

- (void)layoutSubviews
{
  v104.receiver = self;
  v104.super_class = (Class)BFFPaneHeaderView;
  [(BFFPaneHeaderView *)&v104 layoutSubviews];
  [(BFFPaneHeaderView *)self _labelsAndLinksBaselineOffsetForView:self];
  double v4 = v3;
  iconView = self->_iconView;
  [(BFFPaneHeaderView *)self bounds];
  double v7 = v6;
  uint64_t v8 = +[BFFStyle sharedStyle];
  [v8 horizontalInsetsForContainingInView:self width:v7];
  double v10 = v9;

  double v11 = [(BFFPaneHeaderView *)self superview];
  [v11 safeAreaInsets];
  double v13 = v12;

  if (iconView)
  {
    [(UIImageView *)self->_iconView frame];
    double v15 = v14;
    double v17 = v16;
    double v18 = v4;
    double v19 = BFFRoundToPixel((v7 - v14) * 0.5);
    uint64_t v20 = +[BFFStyle sharedStyle];
    [(BFFPaneHeaderView *)self iconSize];
    objc_msgSend(v20, "headerYOffsetForIconSize:inView:", self);
    double v22 = v21;

    if ([(BFFPaneHeaderView *)self useMinimumTopPadding] && v22 < 12.0) {
      double v23 = 12.0;
    }
    else {
      double v23 = v22;
    }
    double v24 = v19;
    double v4 = v18;
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v24, v23, v15, v17);
  }
  objc_super v25 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [(BFFPaneHeaderView *)self customTopPadding];
  if (v26 >= 0.0)
  {
    v30 = (void *)MEMORY[0x263F82770];
    v27 = _BFFHeaderTextStyle();
    v31 = [v30 metricsForTextStyle:v27];
    [(BFFPaneHeaderView *)self customTopPadding];
    objc_msgSend(v31, "scaledValueForValue:");
    double v29 = v32;
  }
  else
  {
    v27 = +[BFFStyle sharedStyle];
    [(BFFPaneHeaderView *)self iconSize];
    objc_msgSend(v27, "headerTitleBaselineOffsetForView:iconSize:", self);
    double v29 = v28;
  }
  double v33 = v10 + v13;

  [(UILabel *)self->_detailTextLabel _firstBaselineOffsetFromTop];
  double v35 = v34;
  [(UILabel *)self->_textLabel frame];
  double v37 = v36;
  double v39 = v38;
  double v103 = v40;
  double v101 = v41;
  v42 = [(UILabel *)self->_textLabel text];
  uint64_t v43 = [v42 length];

  if (v43)
  {
    double v37 = BFFRoundToPixel(v33);
    BOOL v44 = [(BFFPaneHeaderView *)self isTextLabelAlignedByLastBaseline];
    textLabel = self->_textLabel;
    if (v44) {
      [(UILabel *)textLabel _lastLineBaseline];
    }
    else {
      [(UILabel *)textLabel _firstBaselineOffsetFromTop];
    }
    float v48 = BFFRoundToPixel(v29 - v46);
    double v49 = fmaxf(v48, 0.0);
    [(BFFPaneHeaderView *)self frame];
    if (v103 + v37 > v50)
    {
      [(BFFPaneHeaderView *)self frame];
      double v103 = v51 + v37 * -2.0;
    }
    [(UILabel *)self->_textLabel _lastLineBaseline];
    double v102 = v49;
    double v53 = v52 + v49;
    v54 = +[BFFStyle sharedStyle];
    [v54 headerSubheaderBaselineSpacingForView:self];
    objc_msgSend(v25, "scaledValueForValue:");
    double v47 = v53 + v55;
  }
  else
  {
    double v102 = v39;
    double v47 = v29 - v35;
  }
  [(UILabel *)self->_detailTextLabel frame];
  double v57 = v56;
  double v59 = v58;
  double v98 = v61;
  double v99 = v60;
  v62 = [(UILabel *)self->_detailTextLabel text];
  double v100 = v37;
  if ([v62 length])
  {

LABEL_20:
    double v65 = v7;
    double v57 = BFFRoundToPixel(v33);
    [(UILabel *)self->_detailTextLabel _firstBaselineOffsetFromTop];
    double v59 = BFFRoundToPixel(v47 - v66);
    [(UILabel *)self->_detailTextLabel _lastLineBaseline];
    double v47 = v4 + v59 + v67;
    goto LABEL_21;
  }
  v63 = [(UILabel *)self->_detailTextLabel attributedText];
  uint64_t v64 = [v63 length];

  if (v64) {
    goto LABEL_20;
  }
  double v65 = v7;
LABEL_21:
  [(UILabel *)self->_subLabel frame];
  double v69 = v68;
  double v71 = v70;
  double v95 = v73;
  double v96 = v72;
  v74 = [(UILabel *)self->_subLabel text];
  uint64_t v75 = [v74 length];

  double v97 = v57;
  if (v75)
  {
    double v69 = BFFRoundToPixel(v33);
    [(UILabel *)self->_subLabel _firstBaselineOffsetFromTop];
    double v71 = BFFRoundToPixel(v47 - v76);
    [(UILabel *)self->_subLabel _lastLineBaseline];
    double v47 = v4 + v71 + v77;
  }
  [(UIButton *)self->_linkButton frame];
  double v81 = v80;
  uint64_t v93 = v82;
  linkButton = self->_linkButton;
  if (linkButton)
  {
    [(UIButton *)linkButton layoutSubviews];
    double v84 = BFFRoundToPixel((v65 - v81) * 0.5);
    v85 = [(UIButton *)self->_linkButton titleLabel];
    [v85 _firstLineBaselineOffsetFromBoundsTop];
    double v87 = v47 - v86;
  }
  else
  {
    double v84 = v78;
    double v87 = v79;
  }
  double v88 = v102;
  v89 = [(BFFPaneHeaderView *)self bottomLineColor];

  if (v89)
  {
    UICeilToViewScale();
    double v91 = v90;
    [(BFFPaneHeaderView *)self bounds];
    CGFloat v92 = CGRectGetMaxY(v105) - v91;
    [(BFFPaneHeaderView *)self bounds];
    double v88 = v102;
    -[UIView setFrame:](self->_bottomLine, "setFrame:", 0.0, v92);
  }
  -[UILabel setFrame:](self->_detailTextLabel, "setFrame:", v97, v59, v99, v98);
  -[UILabel setFrame:](self->_subLabel, "setFrame:", v69, v71, v96, v95);
  -[UILabel setFrame:](self->_textLabel, "setFrame:", v100, v88, v103, v101);
  -[UIButton setFrame:](self->_linkButton, "setFrame:", v84, v87, v81, v94);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[BFFPaneHeaderView heightForWidth:inView:](self, "heightForWidth:inView:", self, a3.width, a3.height);
  double v5 = v4;
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

- (double)heightForWidth:(double)a3 inView:(id)a4
{
  id v6 = a4;
  double v7 = [v6 traitCollection];
  uint64_t v8 = [v7 horizontalSizeClass];

  double v9 = +[BFFStyle sharedStyle];
  [v9 horizontalInsetsForContainingInView:v6 width:a3];
  double v11 = v10;
  double v13 = v12;

  double v14 = [(BFFPaneHeaderView *)self superview];
  [v14 safeAreaInsets];
  double v16 = a3 - v11 - v13 - v15;
  double v17 = [(BFFPaneHeaderView *)self superview];
  [v17 safeAreaInsets];
  double v19 = v18;

  double v99 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [(BFFPaneHeaderView *)self _labelsAndLinksBaselineOffsetForView:v6];
  double v21 = v20;
  iconView = self->_iconView;
  double v23 = [(UILabel *)self->_textLabel text];
  uint64_t v24 = [v23 length];

  objc_super v25 = [(UILabel *)self->_detailTextLabel text];
  uint64_t v98 = v8;
  uint64_t v102 = v24;
  if ([v25 length])
  {
    BOOL v100 = 1;
  }
  else
  {
    double v26 = [(UILabel *)self->_detailTextLabel attributedText];
    BOOL v100 = [v26 length] != 0;
  }
  double v27 = v16 - v19;

  double v28 = [(UILabel *)self->_subLabel text];
  uint64_t v29 = [v28 length];

  linkButton = self->_linkButton;
  v30 = +[BFFStyle sharedStyle];
  [(BFFPaneHeaderView *)self iconSize];
  objc_msgSend(v30, "headerTitleBaselineOffsetForView:iconSize:", v6);
  double v32 = v31;

  if (iconView)
  {
    [(UIImageView *)self->_iconView frame];
    double v34 = v33;
    double v36 = v35;
    p_iconSize = &self->_iconSize;
    double v38 = *MEMORY[0x263F001B0];
    double v39 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v40 = self->_iconView;
    double v97 = v32;
    if (self->_iconSize.width == *MEMORY[0x263F001B0] && self->_iconSize.height == v39)
    {
      double v41 = v21;
      [(UIImageView *)v40 sizeToFit];
      [(UIImageView *)self->_iconView frame];
      double v34 = v43;
      double v36 = v44;
    }
    else
    {
      double v41 = v21;
      -[UIImageView setBounds:](v40, "setBounds:", 0.0, 0.0);
      double width = p_iconSize->width;
    }
    if (width < a3) {
      a3 = width;
    }
    double v46 = [(UIImageView *)self->_iconView image];
    [v46 size];
    double v48 = a3 * v47;
    double v49 = [(UIImageView *)self->_iconView image];
    [v49 size];
    double v51 = v48 / v50;

    if (a3 != v38 || v51 != v39)
    {
      p_iconSize->double width = a3;
      self->_iconSize.double height = v51;
    }
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v34, v36, a3, v51);
    double v21 = v41;
    BOOL v45 = v100;
    double v32 = v97;
    if (v102) {
      goto LABEL_17;
    }
    double v66 = +[BFFStyle sharedStyle];
    [(BFFPaneHeaderView *)self iconSize];
    objc_msgSend(v66, "headerYOffsetForIconSize:inView:", v6);
    double v32 = v67;

LABEL_25:
    v63 = v99;
    v62 = linkButton;
    double v60 = v32 + 0.0;
    if (v29) {
      char v68 = 1;
    }
    else {
      char v68 = v45;
    }
    if ((v68 & 1) != 0 || linkButton) {
      goto LABEL_33;
    }
    goto LABEL_30;
  }
  BOOL v45 = v100;
  if (!v102) {
    goto LABEL_25;
  }
LABEL_17:
  [(UILabel *)self->_textLabel frame];
  double v53 = v52;
  double v55 = v54;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v27, 1.79769313e308);
  -[UILabel setFrame:](self->_textLabel, "setFrame:", v53, v55, v27, v56);
  [(UILabel *)self->_textLabel setNeedsDisplay];
  [(UILabel *)self->_textLabel _lastLineBaseline];
  double v58 = v57;
  [(UILabel *)self->_textLabel _firstBaselineOffsetFromTop];
  double v60 = v32 + v58 - v59 + 0.0;
  if (v29) {
    char v61 = 1;
  }
  else {
    char v61 = v45;
  }
  v62 = linkButton;
  if ((v61 & 1) != 0 || linkButton)
  {
    uint64_t v64 = +[BFFStyle sharedStyle];
    [v64 headerSubheaderBaselineSpacingForView:v6];
    v63 = v99;
    objc_msgSend(v99, "scaledValueForValue:");
    double v60 = v60 + v65;

    goto LABEL_33;
  }
  v63 = v99;
LABEL_30:
  double v69 = 56.0;
  if (v98 == 1) {
    double v69 = 37.0;
  }
  [v63 scaledValueForValue:v69];
  double v60 = v60 + v70;
LABEL_33:
  if (v45)
  {
    [(UILabel *)self->_detailTextLabel frame];
    double v72 = v71;
    double v74 = v73;
    -[UILabel sizeThatFits:](self->_detailTextLabel, "sizeThatFits:", v27, 1.79769313e308);
    -[UILabel setFrame:](self->_detailTextLabel, "setFrame:", v72, v74, v27, v75);
    [(UILabel *)self->_detailTextLabel setNeedsDisplay];
    [(UILabel *)self->_detailTextLabel _lastLineBaseline];
    double v77 = v76;
    [(UILabel *)self->_detailTextLabel _firstBaselineOffsetFromTop];
    double v60 = v60 + v21 + v77 - v78;
  }
  if (v29)
  {
    [(UILabel *)self->_subLabel frame];
    double v80 = v79;
    double v82 = v81;
    -[UILabel sizeThatFits:](self->_subLabel, "sizeThatFits:", v27, 1.79769313e308);
    -[UILabel setFrame:](self->_subLabel, "setFrame:", v80, v82, v27, v83);
    [(UILabel *)self->_subLabel setNeedsDisplay];
    [(UILabel *)self->_subLabel _lastLineBaseline];
    double v85 = v84;
    [(UILabel *)self->_subLabel _firstBaselineOffsetFromTop];
    double v60 = v60 + v21 + v85 - v86;
  }
  if (v62)
  {
    [(UIButton *)self->_linkButton frame];
    double v88 = v87;
    double v90 = v89;
    double v91 = [(UIButton *)self->_linkButton titleLabel];
    objc_msgSend(v91, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0, v27, 1.79769313e308);
    double v93 = v92;
    double v95 = v94;

    -[UIButton setFrame:](self->_linkButton, "setFrame:", v88, v90, v93, v95);
    double v60 = v21 + v60;
  }

  return v60;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (UILabel)subLabel
{
  return self->_subLabel;
}

- (double)flexibleHeight
{
  return self->_flexibleHeight;
}

- (void)setFlexibleHeight:(double)a3
{
  self->_flexibleHeight = a3;
}

- (BOOL)iconInheritsTint
{
  return self->_iconInheritsTint;
}

- (BOOL)useMinimumTopPadding
{
  return self->_useMinimumTopPadding;
}

- (void)setUseMinimumTopPadding:(BOOL)a3
{
  self->_useMinimumTopPadding = a3;
}

- (double)customTopPadding
{
  return self->_customTopPadding;
}

- (void)setCustomTopPadding:(double)a3
{
  self->_customTopPadding = a3;
}

- (BOOL)isTextLabelAlignedByLastBaseline
{
  return self->_textLabelAlignedByLastBaseline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong(&self->_linkHandler, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
}

@end