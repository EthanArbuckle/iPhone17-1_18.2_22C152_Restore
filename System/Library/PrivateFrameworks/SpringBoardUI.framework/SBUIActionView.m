@interface SBUIActionView
- (BOOL)isHighlighted;
- (SBUIAction)action;
- (SBUIActionView)initWithAction:(id)a3;
- (SBUIActionView)initWithCoder:(id)a3;
- (SBUIActionView)initWithFrame:(CGRect)a3;
- (double)leadingContentMargin;
- (double)trailingContentMargin;
- (int64_t)imagePosition;
- (void)_invalidateVisualStyling;
- (void)_setupSubviews;
- (void)_updateImageViewLayoutConstraints;
- (void)_updateVisualStylingIfNecessary;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 withFeedbackRetargetBehavior:(id)a4;
- (void)setImagePosition:(int64_t)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation SBUIActionView

- (SBUIActionView)initWithAction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUIActionView;
  v6 = -[SBUIActionView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    v7->_imagePosition = 0;
    v7->_highlighted = 0;
    v7->_interfaceOrientationIsPortrait = (unint64_t)([(id)*MEMORY[0x263F1D020] activeInterfaceOrientation]- 1) < 2;
    [(SBUIActionView *)v7 _setupSubviews];
  }

  return v7;
}

- (SBUIActionView)initWithFrame:(CGRect)a3
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF488];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"%s is not a valid initializer. You must call -[%@ initWithAction:].", "-[SBUIActionView initWithFrame:]", v7 format];

  return [(SBUIActionView *)self initWithAction:0];
}

- (SBUIActionView)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  id v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v4 raise:v5, @"%@ does not support unarchiving from a nib.", v8 format];

  v11.receiver = self;
  v11.super_class = (Class)SBUIActionView;
  objc_super v9 = [(SBUIActionView *)&v11 initWithCoder:v6];

  return v9;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIActionView;
  [(SBUIActionView *)&v3 layoutSubviews];
  [(SBUIActionView *)self _updateVisualStylingIfNecessary];
}

- (void)willMoveToSuperview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIActionView;
  [(SBUIActionView *)&v4 willMoveToSuperview:a3];
  [(SBUIActionView *)self _invalidateVisualStyling];
}

- (void)setImagePosition:(int64_t)a3
{
  if (self->_imagePosition != a3)
  {
    self->_imagePosition = a3;
    [(SBUIActionView *)self _updateImageViewLayoutConstraints];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(UIView *)self->_highlightView setHidden:!a3];
  }
}

- (double)leadingContentMargin
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double result = 12.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 16.0;
  }
  return result;
}

- (double)trailingContentMargin
{
  return 17.0;
}

- (void)setHighlighted:(BOOL)a3 withFeedbackRetargetBehavior:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(SBUIActionView *)self isHighlighted] != v4)
  {
    [(SBUIActionView *)self setHighlighted:v4];
    if (v4) {
      [v6 selectionChanged];
    }
  }
}

- (void)_setupSubviews
{
  v152[7] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SBUIActionView *)self action];
  v151 = [v3 title];
  BOOL v4 = [v3 subtitle];
  uint64_t v5 = [v3 image];
  [v3 systemImageName];
  v148 = v147 = v3;
  id v6 = [v3 badgeView];
  v150 = v4;
  uint64_t v142 = [v4 length];
  id v7 = (id)*MEMORY[0x263F1D260];
  id v8 = (id)*MEMORY[0x263F1D280];
  id v9 = (id)*MEMORY[0x263F1D170];
  if (self->_interfaceOrientationIsPortrait)
  {
    v10 = v6;
    id v11 = v7;
    v12 = [(id)*MEMORY[0x263F1D020] preferredContentSizeCategory];
    v13 = (void *)*MEMORY[0x263F1D168];
    uint64_t v14 = *MEMORY[0x263F1D160];
    v152[0] = *MEMORY[0x263F1D168];
    v152[1] = v14;
    uint64_t v15 = *MEMORY[0x263F1D148];
    v152[2] = *MEMORY[0x263F1D150];
    v152[3] = v15;
    uint64_t v16 = *MEMORY[0x263F1D138];
    v152[4] = *MEMORY[0x263F1D140];
    v152[5] = v16;
    v152[6] = *MEMORY[0x263F1D130];
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v152 count:7];
    int v18 = [v17 containsObject:v12];

    if (v18)
    {
      id v19 = v13;

      id v9 = v19;
    }
    v149 = v8;

    id v20 = v11;
    id v6 = v10;
    v21 = v9;
  }
  else
  {
    id v22 = (id)*MEMORY[0x263F1D188];

    id v20 = (id)*MEMORY[0x263F1D308];
    id v23 = (id)*MEMORY[0x263F1D268];

    v21 = v22;
    v149 = v23;
  }
  v145 = objc_msgSend(MEMORY[0x263F1CB00], "traitCollectionWithPreferredContentSizeCategory:", v21, v142);
  uint64_t v24 = objc_msgSend(MEMORY[0x263F1C658], "preferredFontForTextStyle:compatibleWithTraitCollection:", v20);
  v146 = v20;
  if (v5)
  {
    [v5 size];
    if (v25 < v26) {
      double v25 = v26;
    }
    if (v25 >= 35.0) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = 4;
    }
    goto LABEL_14;
  }
  uint64_t v28 = [MEMORY[0x263F1C6B0] systemImageNamed:v148];
  if (v28)
  {
    uint64_t v5 = (void *)v28;
    uint64_t v27 = 1;
LABEL_14:
    id v29 = objc_alloc(MEMORY[0x263F1C6D0]);
    double v30 = *MEMORY[0x263F001A8];
    double v31 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v32 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v33 = *(double *)(MEMORY[0x263F001A8] + 24);
    v34 = (UIImageView *)objc_msgSend(v29, "initWithFrame:", *MEMORY[0x263F001A8], v31, v32, v33);
    imageView = self->_imageView;
    self->_imageView = v34;

    [(UIImageView *)self->_imageView setContentMode:v27];
    [(UIImageView *)self->_imageView setImage:v5];
    [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:0];
    LODWORD(v36) = 1148846080;
    [(UIImageView *)self->_imageView setContentHuggingPriority:0 forAxis:v36];
    [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBUIActionView *)self addSubview:self->_imageView];

    goto LABEL_15;
  }
  double v30 = *MEMORY[0x263F001A8];
  double v31 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v32 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v33 = *(double *)(MEMORY[0x263F001A8] + 24);
LABEL_15:
  v37 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  textContainer = self->_textContainer;
  self->_textContainer = v37;

  [(UIView *)self->_textContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SBUIActionView *)self addSubview:self->_textContainer];
  v39 = -[SBUIActionViewLabel initWithFrame:]([SBUIActionViewLabel alloc], "initWithFrame:", v30, v31, v32, v33);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v39;

  [(SBUIActionViewLabel *)self->_titleLabel _setLayoutDebuggingIdentifier:@"titleLabel"];
  v144 = (void *)v24;
  [(SBUIActionViewLabel *)self->_titleLabel setFont:v24];
  [(SBUIActionViewLabel *)self->_titleLabel setLineBreakMode:4];
  if (v143) {
    uint64_t v41 = 1;
  }
  else {
    uint64_t v41 = 2;
  }
  [(SBUIActionViewLabel *)self->_titleLabel setNumberOfLines:v41];
  [(SBUIActionViewLabel *)self->_titleLabel setText:v151];
  [(SBUIActionViewLabel *)self->_titleLabel setTextAlignment:4];
  [(SBUIActionViewLabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_textContainer addSubview:self->_titleLabel];
  if (v143)
  {
    v42 = -[SBUIActionViewLabel initWithFrame:]([SBUIActionViewLabel alloc], "initWithFrame:", v30, v31, v32, v33);
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v42;

    [(SBUIActionViewLabel *)self->_subtitleLabel _setLayoutDebuggingIdentifier:@"subtitleLabel"];
    v44 = self->_subtitleLabel;
    v45 = (void *)MEMORY[0x263F1C658];
    v46 = [MEMORY[0x263F1CB00] traitCollectionWithPreferredContentSizeCategory:v21];
    v47 = [v45 preferredFontForTextStyle:v149 compatibleWithTraitCollection:v46];
    [(SBUIActionViewLabel *)v44 setFont:v47];

    [(SBUIActionViewLabel *)self->_subtitleLabel setLineBreakMode:4];
    [(SBUIActionViewLabel *)self->_subtitleLabel setNumberOfLines:1];
    [(SBUIActionViewLabel *)self->_subtitleLabel setText:v150];
    [(SBUIActionViewLabel *)self->_subtitleLabel setTextAlignment:4];
    [(SBUIActionViewLabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_textContainer addSubview:self->_subtitleLabel];
  }
  if (v6)
  {
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_textContainer addSubview:v6];
    [v6 bounds];
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    v56 = [v6 widthAnchor];
    v153.origin.x = v49;
    v153.origin.y = v51;
    v153.size.width = v53;
    v153.size.height = v55;
    v57 = [v56 constraintEqualToConstant:CGRectGetWidth(v153)];
    [v57 setActive:1];

    v58 = [v6 heightAnchor];
    v154.origin.x = v49;
    v154.origin.y = v51;
    v154.size.width = v53;
    v154.size.height = v55;
    v59 = [v58 constraintEqualToConstant:CGRectGetHeight(v154)];
    [v59 setActive:1];
  }
  if (self->_imageView)
  {
    [(SBUIActionView *)self _updateImageViewLayoutConstraints];
    v60 = [(UIImageView *)self->_imageView centerYAnchor];
    v61 = [(SBUIActionView *)self centerYAnchor];
    v62 = [v60 constraintEqualToAnchor:v61];
    [v62 setActive:1];

    v63 = [(UIImageView *)self->_imageView widthAnchor];
    v64 = [v63 constraintEqualToConstant:35.0];
    [v64 setActive:1];

    v65 = [(UIImageView *)self->_imageView heightAnchor];
    v66 = [v65 constraintEqualToConstant:35.0];
    [v66 setActive:1];
  }
  else
  {
    v67 = [(UIView *)self->_textContainer leadingAnchor];
    v68 = [(SBUIActionView *)self leadingAnchor];
    [(SBUIActionView *)self trailingContentMargin];
    v69 = objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68);
    [v69 setActive:1];

    v65 = [(UIView *)self->_textContainer trailingAnchor];
    v66 = [(SBUIActionView *)self trailingAnchor];
    [(SBUIActionView *)self trailingContentMargin];
    v70 = objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66);
    [v70 setActive:1];
  }
  v71 = [(UIView *)self->_textContainer centerYAnchor];
  v72 = [(SBUIActionView *)self centerYAnchor];
  v73 = [v71 constraintEqualToAnchor:v72];
  [v73 setActive:1];

  v74 = [(SBUIActionViewLabel *)self->_titleLabel leadingAnchor];
  v75 = [(UIView *)self->_textContainer leadingAnchor];
  v76 = [v74 constraintEqualToAnchor:v75];
  [v76 setActive:1];

  v77 = [(SBUIActionViewLabel *)self->_titleLabel trailingAnchor];
  if (v6)
  {
    v78 = [v6 leadingAnchor];
    v79 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v80 = [v79 userInterfaceIdiom];

    double v81 = -12.0;
    if ((v80 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v81 = -16.0;
    }
    v82 = [v77 constraintEqualToAnchor:v78 constant:v81];
  }
  else
  {
    v78 = [(UIView *)self->_textContainer trailingAnchor];
    v82 = [v77 constraintEqualToAnchor:v78];
  }
  v83 = v82;
  [v82 setActive:1];

  v84 = [(SBUIActionViewLabel *)self->_titleLabel font];
  [v84 _bodyLeading];
  double v86 = v85;

  v87 = self->_subtitleLabel;
  if (v87)
  {
    v88 = [(SBUIActionViewLabel *)v87 leadingAnchor];
    v89 = [(UIView *)self->_textContainer leadingAnchor];
    v90 = [v88 constraintEqualToAnchor:v89];
    [v90 setActive:1];

    v91 = [(SBUIActionViewLabel *)self->_subtitleLabel trailingAnchor];
    if (v6)
    {
      v92 = [v6 leadingAnchor];
      v93 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v94 = [v93 userInterfaceIdiom];

      double v95 = -12.0;
      if ((v94 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v95 = -16.0;
      }
      v96 = [v91 constraintEqualToAnchor:v92 constant:v95];
    }
    else
    {
      v92 = [(UIView *)self->_textContainer trailingAnchor];
      v96 = [v91 constraintEqualToAnchor:v92];
    }
    v109 = v96;
    [v96 setActive:1];

    v110 = [(SBUIActionViewLabel *)self->_subtitleLabel font];
    [v110 _bodyLeading];
    double v112 = v111;

    v113 = [(SBUIActionViewLabel *)self->_titleLabel firstBaselineAnchor];
    v114 = [(SBUIActionView *)self topAnchor];
    double v115 = 1.173913;
    if (self->_interfaceOrientationIsPortrait) {
      double v115 = 1.125;
    }
    v116 = [v113 constraintEqualToAnchor:v114 constant:v86 * v115];
    [v116 setActive:1];

    v117 = [(SBUIActionViewLabel *)self->_subtitleLabel firstBaselineAnchor];
    v118 = [(SBUIActionViewLabel *)self->_titleLabel firstBaselineAnchor];
    double v119 = 0.949999988;
    if (self->_interfaceOrientationIsPortrait) {
      double v119 = 1.0;
    }
    v120 = [v117 constraintEqualToAnchor:v118 constant:v112 * v119];
    [v120 setActive:1];

    v106 = [(SBUIActionViewLabel *)self->_subtitleLabel firstBaselineAnchor];
    v107 = [(SBUIActionView *)self bottomAnchor];
    double v121 = 0.608695626;
    if (self->_interfaceOrientationIsPortrait) {
      double v121 = 0.625;
    }
    v108 = [v106 constraintEqualToAnchor:v107 constant:-(v121 * v86)];
    [v108 setActive:1];
  }
  else
  {
    v97 = [(SBUIActionViewLabel *)self->_titleLabel firstBaselineAnchor];
    v98 = [(SBUIActionView *)self topAnchor];
    v99 = [v97 constraintGreaterThanOrEqualToAnchor:v98 constant:v86 * dbl_2218E4790[!self->_interfaceOrientationIsPortrait]];
    [v99 setActive:1];

    v100 = [(SBUIActionViewLabel *)self->_titleLabel firstBaselineAnchor];
    v101 = [(SBUIActionView *)self bottomAnchor];
    v102 = [v100 constraintEqualToAnchor:v101 constant:-v86];
    __32__SBUIActionView__setupSubviews__block_invoke(250.0, (uint64_t)v102, v102);
    objc_claimAutoreleasedReturnValue();
    [v102 setActive:1];

    v103 = [(SBUIActionViewLabel *)self->_titleLabel lastBaselineAnchor];
    v104 = [(SBUIActionView *)self bottomAnchor];
    v105 = [v103 constraintLessThanOrEqualToAnchor:v104 constant:-(dbl_2218E47A0[!self->_interfaceOrientationIsPortrait] * v86)];
    [v105 setActive:1];

    v106 = [(SBUIActionViewLabel *)self->_titleLabel lastBaselineAnchor];
    v107 = [(SBUIActionView *)self topAnchor];
    v108 = [v106 constraintEqualToAnchor:v107 constant:v86 * dbl_2218E47B0[!self->_interfaceOrientationIsPortrait]];
    __32__SBUIActionView__setupSubviews__block_invoke(250.0, (uint64_t)v108, v108);
    objc_claimAutoreleasedReturnValue();
    [v108 setActive:1];
  }
  if (v6)
  {
    v122 = [v6 trailingAnchor];
    v123 = [(UIView *)self->_textContainer trailingAnchor];
    v124 = [v122 constraintEqualToAnchor:v123];
    [v124 setActive:1];

    v125 = [v6 centerYAnchor];
    v126 = [(SBUIActionView *)self centerYAnchor];
    v127 = [v125 constraintEqualToAnchor:v126];
    [v127 setActive:1];
  }
  v128 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  highlightView = self->_highlightView;
  self->_highlightView = v128;

  [(UIView *)self->_highlightView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SBUIActionView *)self addSubview:self->_highlightView];
  v130 = [(UIView *)self->_highlightView leadingAnchor];
  v131 = [(SBUIActionView *)self leadingAnchor];
  v132 = [v130 constraintEqualToAnchor:v131];
  [v132 setActive:1];

  v133 = [(UIView *)self->_highlightView trailingAnchor];
  v134 = [(SBUIActionView *)self trailingAnchor];
  v135 = [v133 constraintEqualToAnchor:v134];
  [v135 setActive:1];

  v136 = [(UIView *)self->_highlightView topAnchor];
  v137 = [(SBUIActionView *)self topAnchor];
  v138 = [v136 constraintEqualToAnchor:v137];
  [v138 setActive:1];

  v139 = [(UIView *)self->_highlightView bottomAnchor];
  v140 = [(SBUIActionView *)self bottomAnchor];
  v141 = [v139 constraintEqualToAnchor:v140];
  [v141 setActive:1];

  [(UIView *)self->_highlightView setHidden:!self->_highlighted];
}

id __32__SBUIActionView__setupSubviews__block_invoke(float a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(float *)&double v5 = a1;
  [v4 setPriority:v5];

  return v4;
}

- (void)_updateImageViewLayoutConstraints
{
  v19[2] = *MEMORY[0x263EF8340];
  if (self->_imageView && self->_textContainer)
  {
    [MEMORY[0x263F08938] deactivateConstraints:self->_imageViewLayoutConstraints];
    int64_t v3 = [(SBUIActionView *)self imagePosition];
    if (v3 == 1) {
      unint64_t v4 = 0x10000;
    }
    else {
      unint64_t v4 = (unint64_t)(v3 == 2) << 17;
    }
    double v5 = (void *)MEMORY[0x263F08938];
    v18[0] = @"trailingContentOffset";
    id v6 = NSNumber;
    [(SBUIActionView *)self trailingContentMargin];
    id v7 = objc_msgSend(v6, "numberWithDouble:");
    v18[1] = @"leadingContentOffset";
    v19[0] = v7;
    id v8 = NSNumber;
    [(SBUIActionView *)self leadingContentMargin];
    id v9 = objc_msgSend(v8, "numberWithDouble:");
    v19[1] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    imageView = self->_imageView;
    v16[0] = @"imageView";
    v16[1] = @"textContainer";
    textContainer = self->_textContainer;
    v17[0] = imageView;
    v17[1] = textContainer;
    v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    uint64_t v14 = [v5 constraintsWithVisualFormat:@"H:|-(leadingContentOffset)-[imageView]-(leadingContentOffset)-[textContainer]-(trailingContentOffset)-|" options:v4 metrics:v10 views:v13];
    imageViewLayoutConstraints = self->_imageViewLayoutConstraints;
    self->_imageViewLayoutConstraints = v14;

    [MEMORY[0x263F08938] activateConstraints:self->_imageViewLayoutConstraints];
  }
}

- (void)_invalidateVisualStyling
{
  [(MTVisualStylingProvider *)self->_visualStylingProviderStroke stopAutomaticallyUpdatingView:self->_imageView];
  [(MTVisualStylingProvider *)self->_visualStylingProviderStroke stopAutomaticallyUpdatingView:self->_titleLabel];
  [(MTVisualStylingProvider *)self->_visualStylingProviderStroke stopAutomaticallyUpdatingView:self->_subtitleLabel];
  visualStylingProviderStroke = self->_visualStylingProviderStroke;
  self->_visualStylingProviderStroke = 0;

  [(MTVisualStylingProvider *)self->_visualStylingProviderFill stopAutomaticallyUpdatingView:self->_highlightView];
  visualStylingProviderFill = self->_visualStylingProviderFill;
  self->_visualStylingProviderFill = 0;

  [(SBUIActionView *)self setNeedsLayout];
}

- (void)_updateVisualStylingIfNecessary
{
  if (!self->_visualStylingProviderStroke)
  {
    int64_t v3 = [(SBUIActionView *)self visualStylingProviderForCategory:1];
    visualStylingProviderStroke = self->_visualStylingProviderStroke;
    self->_visualStylingProviderStroke = v3;

    [(MTVisualStylingProvider *)self->_visualStylingProviderStroke automaticallyUpdateView:self->_imageView withStyle:0];
    [(MTVisualStylingProvider *)self->_visualStylingProviderStroke automaticallyUpdateView:self->_titleLabel withStyle:0];
    [(MTVisualStylingProvider *)self->_visualStylingProviderStroke automaticallyUpdateView:self->_subtitleLabel withStyle:0];
    double v5 = [(SBUIActionView *)self visualStylingProviderForCategory:2];
    visualStylingProviderFill = self->_visualStylingProviderFill;
    self->_visualStylingProviderFill = v5;

    id v7 = self->_visualStylingProviderFill;
    highlightView = self->_highlightView;
    [(MTVisualStylingProvider *)v7 automaticallyUpdateView:highlightView withStyle:4];
  }
}

- (SBUIAction)action
{
  return self->_action;
}

- (int64_t)imagePosition
{
  return self->_imagePosition;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_visualStylingProviderFill, 0);
  objc_storeStrong((id *)&self->_visualStylingProviderStroke, 0);
  objc_storeStrong((id *)&self->_imageViewLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end