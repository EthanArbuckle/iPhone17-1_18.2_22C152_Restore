@interface PRXCardContentView
- (NSArray)actionButtons;
- (PRXButton)dismissButton;
- (PRXCardContentView)init;
- (PRXCardContentView)initWithCardStyle:(int64_t)a3;
- (PRXCardContentView)initWithFrame:(CGRect)a3;
- (PRXCardContentView)initWithFrame:(CGRect)a3 cardStyle:(int64_t)a4;
- (PRXCardContentViewDelegate)delegate;
- (PRXLabel)subtitleLabel;
- (PRXLabel)titleLabel;
- (PRXTextContainer)titleView;
- (PRXTextView)titleTextView;
- (UILayoutGuide)internalContentGuide;
- (UILayoutGuide)mainContentGuide;
- (UIView)activityIndicator;
- (id)auxiliaryViews;
- (int64_t)cardStyle;
- (void)_invalidateMainContentConstraints;
- (void)setActionButtons:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)updateTitleTextViewExclusionPathsForCardWidth:(double)a3;
@end

@implementation PRXCardContentView

- (PRXCardContentView)init
{
  return [(PRXCardContentView *)self initWithCardStyle:0];
}

- (PRXCardContentView)initWithCardStyle:(int64_t)a3
{
  v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 bounds];
  unint64_t v10 = PRXCardPreferredSizeClassForContainerBounds(v6, v7, v8, v9);

  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v14 = PRXCardPreferredSize(0, v10);
  return -[PRXCardContentView initWithFrame:cardStyle:](self, "initWithFrame:cardStyle:", a3, v11, v12, v14, v13);
}

- (PRXCardContentView)initWithFrame:(CGRect)a3 cardStyle:(int64_t)a4
{
  v30[4] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)PRXCardContentView;
  v5 = -[PRXCardContentView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    CGFloat v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    int64_t v28 = a4;
    mainContentGuide = v5->_mainContentGuide;
    v5->_mainContentGuide = v6;

    [(UILayoutGuide *)v5->_mainContentGuide setIdentifier:@"PRXCardMainContent"];
    [(PRXCardContentView *)v5 addLayoutGuide:v5->_mainContentGuide];
    CGFloat v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    internalContentGuide = v5->_internalContentGuide;
    v5->_internalContentGuide = v8;

    [(UILayoutGuide *)v5->_internalContentGuide setIdentifier:@"PRXCardInternalContent"];
    [(PRXCardContentView *)v5 addLayoutGuide:v5->_internalContentGuide];
    unint64_t v10 = [(PRXCardContentView *)v5 layoutMarginsGuide];
    v22 = (void *)MEMORY[0x263F08938];
    v27 = [(UILayoutGuide *)v5->_mainContentGuide leadingAnchor];
    v26 = [v10 leadingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v30[0] = v25;
    v24 = [(UILayoutGuide *)v5->_mainContentGuide trailingAnchor];
    v23 = [v10 trailingAnchor];
    double v11 = [v24 constraintEqualToAnchor:v23];
    v30[1] = v11;
    double v12 = [(UILayoutGuide *)v5->_internalContentGuide leadingAnchor];
    double v13 = [v10 leadingAnchor];
    double v14 = [v12 constraintEqualToAnchor:v13];
    v30[2] = v14;
    v15 = [(UILayoutGuide *)v5->_internalContentGuide trailingAnchor];
    v16 = [v10 trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v30[3] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
    [v22 activateConstraints:v18];

    v5->_cardStyle = v28;
    -[PRXCardContentView setDirectionalLayoutMargins:](v5, "setDirectionalLayoutMargins:", *MEMORY[0x263F1C228], *(double *)(MEMORY[0x263F1C228] + 8), *(double *)(MEMORY[0x263F1C228] + 16), *(double *)(MEMORY[0x263F1C228] + 24));
    v19 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(PRXCardContentView *)v5 setBackgroundColor:v19];

    v20 = v5;
  }

  return v5;
}

- (PRXCardContentView)initWithFrame:(CGRect)a3
{
  return -[PRXCardContentView initWithFrame:cardStyle:](self, "initWithFrame:cardStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PRXCardContentView;
  id v4 = a3;
  [(PRXCardContentView *)&v20 traitCollectionDidChange:v4];
  v5 = [(PRXCardContentView *)self traitCollection];
  uint64_t v6 = objc_msgSend(v5, "prx_cardSizeClass");

  uint64_t v7 = objc_msgSend(v4, "prx_cardSizeClass");
  if (v6 != v7)
  {
    CGFloat v8 = (double *)&PRXCardCompactLayoutMargins;
    CGFloat v9 = (double *)&unk_21C6F1430;
    if (v6 != 1) {
      CGFloat v9 = (double *)&unk_21C6F1410;
    }
    double v10 = *v9;
    double v11 = (double *)&unk_21C6F1428;
    if (v6 != 1) {
      double v11 = (double *)&unk_21C6F1408;
    }
    double v12 = *v11;
    double v13 = (double *)&unk_21C6F1420;
    if (v6 != 1)
    {
      double v13 = (double *)&unk_21C6F1400;
      CGFloat v8 = (double *)&PRXCardDefaultLayoutMargins;
    }
    -[PRXCardContentView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", *v8, *v13, v12, v10);
    [(PRXCardContentView *)self bounds];
    [(PRXCardContentView *)self updateTitleTextViewExclusionPathsForCardWidth:v14];
    [(PRXCardContentView *)self invalidateIntrinsicContentSize];
  }
  if (self->_titleViewConstraints)
  {
    objc_msgSend(MEMORY[0x263F08938], "deactivateConstraints:");
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    [(PRXCardContentView *)self setNeedsUpdateConstraints];
  }
  v16 = [(PRXCardContentView *)self traitCollection];
  v17 = [v16 customBackgroundColor];

  if (v17)
  {
    v18 = [(PRXCardContentView *)self traitCollection];
    v19 = [v18 customBackgroundColor];
    [(PRXCardContentView *)self setBackgroundColor:v19];
  }
}

- (void)updateConstraints
{
  v62[4] = *MEMORY[0x263EF8340];
  v59.receiver = self;
  v59.super_class = (Class)PRXCardContentView;
  [(PRXCardContentView *)&v59 updateConstraints];
  v3 = [(PRXCardContentView *)self layoutMarginsGuide];
  if (!self->_titleViewConstraints && self->_titleView)
  {
    [(PRXCardContentView *)self frame];
    double v5 = v4;
    [(PRXCardContentView *)self layoutMargins];
    double v7 = v6;
    [(PRXCardContentView *)self layoutMargins];
    -[PRXTextContainer sizeThatFits:](self->_titleView, "sizeThatFits:", v5 - (v7 + v8), 1.79769313e308);
    double v10 = v9;
    double v11 = [(PRXTextContainer *)self->_titleView heightAnchor];
    double v12 = [v11 constraintEqualToConstant:v10];
    titleViewHeightConstraint = self->_titleViewHeightConstraint;
    self->_titleViewHeightConstraint = v12;

    v56 = [(PRXTextContainer *)self->_titleView leadingAnchor];
    v53 = [v3 leadingAnchor];
    v52 = [v56 constraintEqualToAnchor:v53];
    v62[0] = v52;
    double v14 = [(PRXTextContainer *)self->_titleView trailingAnchor];
    v15 = [v3 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v62[1] = v16;
    v17 = [(PRXTextContainer *)self->_titleView topAnchor];
    [v3 topAnchor];
    v19 = v18 = v3;
    objc_super v20 = [v17 constraintEqualToAnchor:v19];
    v21 = self->_titleViewHeightConstraint;
    v62[2] = v20;
    v62[3] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:4];
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = v22;

    v3 = v18;
    [MEMORY[0x263F08938] activateConstraints:self->_titleViewConstraints];
  }
  if (!self->_subtitleLabelConstraints)
  {
    subtitleLabel = self->_subtitleLabel;
    if (subtitleLabel)
    {
      v25 = (void *)MEMORY[0x263EFF980];
      v54 = [(PRXLabel *)subtitleLabel leadingAnchor];
      v26 = [v3 leadingAnchor];
      v27 = [v54 constraintEqualToAnchor:v26];
      v61[0] = v27;
      int64_t v28 = [(PRXLabel *)self->_subtitleLabel trailingAnchor];
      objc_super v29 = [v3 trailingAnchor];
      v30 = [v28 constraintEqualToAnchor:v29];
      v61[1] = v30;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
      v31 = v57 = v3;
      v32 = [v25 arrayWithArray:v31];

      titleView = self->_titleView;
      v34 = [(PRXLabel *)self->_subtitleLabel topAnchor];
      if (titleView)
      {
        v35 = [(PRXTextContainer *)self->_titleView bottomAnchor];
        v36 = [v34 constraintEqualToAnchor:v35 constant:4.0];
        v3 = v57;
      }
      else
      {
        v3 = v57;
        v35 = [v57 topAnchor];
        v36 = [v34 constraintEqualToAnchor:v35];
      }
      [(NSArray *)v32 addObject:v36];

      subtitleLabelConstraints = self->_subtitleLabelConstraints;
      self->_subtitleLabelConstraints = v32;
      v38 = v32;

      [MEMORY[0x263F08938] activateConstraints:self->_subtitleLabelConstraints];
    }
  }
  if (!self->_mainContentConstraints)
  {
    double v39 = 20.0;
    v40 = self->_subtitleLabel;
    if (v40 || (v40 = self->_titleView) != 0)
    {
      uint64_t v41 = [v40 bottomAnchor];
    }
    else
    {
      uint64_t v41 = [v3 topAnchor];
      double v39 = 0.0;
    }
    v55 = (void *)v41;
    v58 = [(UILayoutGuide *)self->_mainContentGuide topAnchor];
    v42 = [v58 constraintEqualToAnchor:v41 constant:v39];
    v60[0] = v42;
    v43 = [(UILayoutGuide *)self->_internalContentGuide topAnchor];
    v44 = [(UILayoutGuide *)self->_mainContentGuide bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v60[1] = v45;
    v46 = [(UILayoutGuide *)self->_internalContentGuide bottomAnchor];
    [v3 bottomAnchor];
    v48 = v47 = v3;
    v49 = [v46 constraintEqualToAnchor:v48];
    v60[2] = v49;
    v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:3];
    mainContentConstraints = self->_mainContentConstraints;
    self->_mainContentConstraints = v50;

    v3 = v47;
    [MEMORY[0x263F08938] activateConstraints:self->_mainContentConstraints];
  }
}

- (PRXButton)dismissButton
{
  v2 = [(PRXCardContentView *)self delegate];
  v3 = [v2 dismissButton];

  return (PRXButton *)v3;
}

- (void)setDismissButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PRXCardContentView *)self delegate];
  [v5 setDismissButton:v4];
}

- (void)setTitleView:(id)a3
{
  id v5 = (PRXTextContainer *)a3;
  p_titleView = &self->_titleView;
  if (self->_titleView != v5)
  {
    double v8 = v5;
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    [(PRXTextContainer *)*p_titleView removeFromSuperview];
    objc_storeStrong((id *)&self->_titleView, a3);
    if (*p_titleView)
    {
      [(PRXTextContainer *)*p_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PRXCardContentView *)self addSubview:*p_titleView];
    }
    [(PRXCardContentView *)self _invalidateMainContentConstraints];
    id v5 = v8;
  }
}

- (void)setSubtitleLabel:(id)a3
{
  id v5 = (PRXLabel *)a3;
  p_subtitleLabel = &self->_subtitleLabel;
  if (self->_subtitleLabel != v5)
  {
    double v8 = v5;
    subtitleLabelConstraints = self->_subtitleLabelConstraints;
    self->_subtitleLabelConstraints = 0;

    [(PRXLabel *)*p_subtitleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
    if (*p_subtitleLabel)
    {
      [(PRXLabel *)*p_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PRXCardContentView *)self addSubview:*p_subtitleLabel];
    }
    [(PRXCardContentView *)self _invalidateMainContentConstraints];
    id v5 = v8;
  }
}

- (PRXLabel)titleLabel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    titleView = self->_titleView;
  }
  else {
    titleView = 0;
  }
  return (PRXLabel *)titleView;
}

- (PRXTextView)titleTextView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    titleView = self->_titleView;
  }
  else {
    titleView = 0;
  }
  return (PRXTextView *)titleView;
}

- (NSArray)actionButtons
{
  v2 = [(PRXCardContentView *)self delegate];
  v3 = [v2 actionButtons];

  return (NSArray *)v3;
}

- (void)setActionButtons:(id)a3
{
  id v4 = a3;
  id v5 = [(PRXCardContentView *)self delegate];
  [v5 setActionButtons:v4];
}

- (void)_invalidateMainContentConstraints
{
  if (self->_mainContentConstraints)
  {
    objc_msgSend(MEMORY[0x263F08938], "deactivateConstraints:");
    mainContentConstraints = self->_mainContentConstraints;
    self->_mainContentConstraints = 0;

    [(PRXCardContentView *)self setNeedsUpdateConstraints];
  }
}

- (void)updateTitleTextViewExclusionPathsForCardWidth:(double)a3
{
  v36[2] = *MEMORY[0x263EF8340];
  id v5 = [(PRXCardContentView *)self delegate];
  double v6 = [v5 dismissButton];

  double v7 = [(PRXCardContentView *)self titleTextView];
  double v8 = [v7 textContainer];
  double v9 = v8;
  if (v6 && v7)
  {
    if (a3 == 0.0)
    {
      double v12 = [MEMORY[0x263F1C920] mainScreen];
      [v12 bounds];
      uint64_t v11 = PRXCardPreferredSizeClassForContainerBounds(v13, v14, v15, v16);

      PRXExpectedCardWidthForStyle([(PRXCardContentView *)self cardStyle]);
      a3 = v17;
    }
    else
    {
      double v10 = [(PRXCardContentView *)self traitCollection];
      uint64_t v11 = objc_msgSend(v10, "prx_cardSizeClass");
    }
    if (v11 == 1) {
      v18 = (double *)&PRXCardCompactLayoutMargins;
    }
    else {
      v18 = (double *)&PRXCardDefaultLayoutMargins;
    }
    double v19 = *v18;
    objc_super v20 = (double *)&unk_21C6F1420;
    if (v11 != 1) {
      objc_super v20 = (double *)&unk_21C6F1400;
    }
    v21 = (double *)&unk_21C6F1430;
    if (v11 != 1) {
      v21 = (double *)&unk_21C6F1410;
    }
    double v22 = *v21;
    double v23 = a3 - (*v20 + *v21);
    double v24 = *MEMORY[0x263F001A8];
    double v25 = *(double *)(MEMORY[0x263F001A8] + 8);
    BOOL v26 = PRXIsEdgeToEdgePhone();
    v27 = &PRXDismissButtonEdgeToEdgeMargin;
    if (!v26) {
      v27 = &PRXDismissButtonDefaultMargin;
    }
    CGFloat v28 = *(double *)v27 + 24.0 - v22;
    CGFloat v29 = *(double *)v27 + 12.0 - v19;
    v37.origin.x = v24;
    v37.origin.y = v25;
    v37.size.width = v28;
    v37.size.height = v29;
    double v30 = v23 - CGRectGetWidth(v37);
    v31 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:", v24, v25, v28, v29);
    v36[0] = v31;
    v32 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:", v30, v25, v28, v29);
    v36[1] = v32;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    [v9 setExclusionPaths:v33];

    v34 = [(PRXCardContentView *)self titleTextView];
    objc_msgSend(v34, "sizeThatFits:", v23, 1.79769313e308);
    [(NSLayoutConstraint *)self->_titleViewHeightConstraint setConstant:v35];
  }
  else
  {
    [v8 setExclusionPaths:MEMORY[0x263EFFA68]];
  }
}

- (id)auxiliaryViews
{
  v2 = [(PRXCardContentView *)self delegate];
  v3 = [v2 auxiliaryViews];

  return v3;
}

- (int64_t)cardStyle
{
  return self->_cardStyle;
}

- (PRXTextContainer)titleView
{
  return self->_titleView;
}

- (PRXLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UILayoutGuide)mainContentGuide
{
  return self->_mainContentGuide;
}

- (PRXCardContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRXCardContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILayoutGuide)internalContentGuide
{
  return self->_internalContentGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalContentGuide, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainContentGuide, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_titleViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_mainContentConstraints, 0);
  objc_storeStrong((id *)&self->_actionButtonConstraints, 0);
  objc_storeStrong((id *)&self->_subtitleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_titleViewConstraints, 0);
}

@end