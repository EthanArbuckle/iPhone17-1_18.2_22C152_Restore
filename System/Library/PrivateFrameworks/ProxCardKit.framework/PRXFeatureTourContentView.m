@interface PRXFeatureTourContentView
- (CGSize)intrinsicContentSize;
- (PRXButton)dismissButton;
- (PRXFeatureTourContentView)init;
- (PRXFeatureTourContentView)initWithFrame:(CGRect)a3;
- (PRXTextContainer)bodyView;
- (PRXTextContainer)titleView;
- (UILayoutGuide)mainContentGuide;
- (void)setBodyView:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setTitleView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation PRXFeatureTourContentView

- (PRXFeatureTourContentView)init
{
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  unint64_t v8 = PRXCardPreferredSizeClassForContainerBounds(v4, v5, v6, v7);

  double v9 = *MEMORY[0x263F001A8];
  double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v12 = PRXCardPreferredSize(0, v8);
  return -[PRXFeatureTourContentView initWithFrame:](self, "initWithFrame:", v9, v10, v12, v11);
}

- (PRXFeatureTourContentView)initWithFrame:(CGRect)a3
{
  v30[3] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)PRXFeatureTourContentView;
  v3 = -[PRXFeatureTourContentView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    CGFloat v4 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    mainContentGuide = v3->_mainContentGuide;
    v3->_mainContentGuide = v4;

    [(PRXFeatureTourContentView *)v3 addLayoutGuide:v3->_mainContentGuide];
    CGFloat v6 = [(PRXFeatureTourContentView *)v3 layoutMarginsGuide];
    v26 = (void *)MEMORY[0x263F08938];
    v27 = [(UILayoutGuide *)v3->_mainContentGuide topAnchor];
    CGFloat v7 = [v6 topAnchor];
    unint64_t v8 = [v27 constraintEqualToAnchor:v7];
    v30[0] = v8;
    double v9 = [(UILayoutGuide *)v3->_mainContentGuide leadingAnchor];
    v28 = v6;
    double v10 = [v6 leadingAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    v30[1] = v11;
    double v12 = [(UILayoutGuide *)v3->_mainContentGuide trailingAnchor];
    v13 = [v6 trailingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v30[2] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
    [v26 activateConstraints:v15];

    v16 = [MEMORY[0x263F1C920] mainScreen];
    [v16 bounds];
    uint64_t v21 = PRXCardPreferredSizeClassForContainerBounds(v17, v18, v19, v20);
    double v22 = 40.0;
    if (v21 == 1) {
      double v22 = 20.0;
    }
    -[PRXFeatureTourContentView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", v22, v22, v22, v22);

    [(PRXFeatureTourContentView *)v3 setInsetsLayoutMarginsFromSafeArea:0];
    v23 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(PRXFeatureTourContentView *)v3 setBackgroundColor:v23];

    v24 = v3;
  }

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PRXFeatureTourContentView;
  id v4 = a3;
  [(PRXFeatureTourContentView *)&v13 traitCollectionDidChange:v4];
  CGFloat v5 = [(PRXFeatureTourContentView *)self traitCollection];
  uint64_t v6 = objc_msgSend(v5, "prx_cardSizeClass");

  uint64_t v7 = objc_msgSend(v4, "prx_cardSizeClass");
  if (v6 != v7)
  {
    double v8 = 40.0;
    if (v6) {
      double v8 = 20.0;
    }
    -[PRXFeatureTourContentView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v8, v8, v8, v8);
  }
  double v9 = [(PRXFeatureTourContentView *)self traitCollection];
  double v10 = [v9 customBackgroundColor];

  if (v10)
  {
    double v11 = [(PRXFeatureTourContentView *)self traitCollection];
    double v12 = [v11 customBackgroundColor];
    [(PRXFeatureTourContentView *)self setBackgroundColor:v12];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(PRXFeatureTourContentView *)self traitCollection];
  double v3 = PRXCardPreferredSize(0, objc_msgSend(v2, "prx_cardSizeClass"));
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)updateConstraints
{
  v55[3] = *MEMORY[0x263EF8340];
  v51.receiver = self;
  v51.super_class = (Class)PRXFeatureTourContentView;
  [(PRXFeatureTourContentView *)&v51 updateConstraints];
  double v3 = [(PRXFeatureTourContentView *)self layoutMarginsGuide];
  titleView = self->_titleView;
  if (titleView && !self->_titleViewConstraints)
  {
    double v5 = [(PRXTextContainer *)titleView leadingAnchor];
    v46 = [v3 leadingAnchor];
    v48 = v5;
    double v6 = objc_msgSend(v5, "constraintEqualToAnchor:");
    v55[0] = v6;
    double v7 = [(PRXTextContainer *)self->_titleView trailingAnchor];
    double v8 = [v3 trailingAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8];
    v55[1] = v9;
    bodyView = self->_bodyView;
    v50 = v3;
    if (bodyView)
    {
      double v11 = [(PRXTextContainer *)bodyView topAnchor];
      double v12 = [(PRXTextContainer *)self->_titleView bottomAnchor];
      [v11 constraintEqualToAnchor:v12 constant:4.0];
    }
    else
    {
      double v11 = [(PRXTextContainer *)self->_titleView bottomAnchor];
      double v12 = [v3 bottomAnchor];
      [v11 constraintEqualToAnchor:v12];
    objc_super v13 = };
    v55[2] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:3];
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = v14;

    [MEMORY[0x263F08938] activateConstraints:self->_titleViewConstraints];
    double v3 = v50;
  }
  v16 = self->_bodyView;
  if (v16 && !self->_bodyViewConstraints)
  {
    v49 = [(PRXTextContainer *)v16 leadingAnchor];
    v47 = [v3 leadingAnchor];
    v45 = [v49 constraintEqualToAnchor:v47];
    v54[0] = v45;
    CGFloat v17 = [(PRXTextContainer *)self->_bodyView trailingAnchor];
    CGFloat v18 = [v3 trailingAnchor];
    CGFloat v19 = [v17 constraintEqualToAnchor:v18];
    v54[1] = v19;
    CGFloat v20 = [(PRXTextContainer *)self->_bodyView bottomAnchor];
    [v3 bottomAnchor];
    v22 = uint64_t v21 = v3;
    v23 = [v20 constraintEqualToAnchor:v22];
    v54[2] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:3];
    bodyViewConstraints = self->_bodyViewConstraints;
    self->_bodyViewConstraints = v24;

    double v3 = v21;
    [MEMORY[0x263F08938] activateConstraints:self->_bodyViewConstraints];
  }
  dismissButton = self->_dismissButton;
  if (dismissButton && !self->_dismissButtonConstraints)
  {
    v27 = [(PRXButton *)dismissButton centerXAnchor];
    v28 = [(PRXFeatureTourContentView *)self trailingAnchor];
    if (PRXIsEdgeToEdgePhone()) {
      double v29 = 32.0;
    }
    else {
      double v29 = 24.0;
    }
    v30 = [v27 constraintEqualToAnchor:v28 constant:-v29];
    v53[0] = v30;
    v31 = [(PRXButton *)self->_dismissButton centerYAnchor];
    v32 = [(PRXFeatureTourContentView *)self topAnchor];
    if (PRXIsEdgeToEdgePhone()) {
      double v33 = 32.0;
    }
    else {
      double v33 = 24.0;
    }
    v34 = [v31 constraintEqualToAnchor:v32 constant:v33];
    v53[1] = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
    dismissButtonConstraints = self->_dismissButtonConstraints;
    self->_dismissButtonConstraints = v35;

    [MEMORY[0x263F08938] activateConstraints:self->_dismissButtonConstraints];
  }
  if (self->_mainContentGuide && !self->_mainContentGuideConstraints)
  {
    v37 = self->_titleView;
    if (v37)
    {
      v38 = v37;
    }
    else
    {
      v38 = self->_bodyView;
      if (!v38)
      {
        v39 = [(UILayoutGuide *)self->_mainContentGuide bottomAnchor];
        v40 = [v3 bottomAnchor];
        uint64_t v41 = [v39 constraintEqualToAnchor:v40];
        goto LABEL_25;
      }
    }
    v39 = [(PRXTextContainer *)v38 topAnchor];
    v40 = [(UILayoutGuide *)self->_mainContentGuide bottomAnchor];
    uint64_t v41 = [v39 constraintEqualToAnchor:v40 constant:20.0];
LABEL_25:
    v42 = (void *)v41;

    v52 = v42;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];

    mainContentGuideConstraints = self->_mainContentGuideConstraints;
    self->_mainContentGuideConstraints = v43;

    [MEMORY[0x263F08938] activateConstraints:self->_mainContentGuideConstraints];
  }
}

- (void)setTitleView:(id)a3
{
  double v5 = (PRXTextContainer *)a3;
  p_titleView = &self->_titleView;
  titleView = self->_titleView;
  if (titleView != v5)
  {
    double v10 = v5;
    [(PRXTextContainer *)titleView removeFromSuperview];
    objc_storeStrong((id *)&self->_titleView, a3);
    [(PRXTextContainer *)*p_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXFeatureTourContentView *)self addSubview:*p_titleView];
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    mainContentGuideConstraints = self->_mainContentGuideConstraints;
    self->_mainContentGuideConstraints = 0;

    titleView = (PRXTextContainer *)[(PRXFeatureTourContentView *)self setNeedsUpdateConstraints];
    double v5 = v10;
  }
  MEMORY[0x270F9A758](titleView, v5);
}

- (void)setBodyView:(id)a3
{
  double v5 = (PRXTextContainer *)a3;
  p_bodyView = &self->_bodyView;
  bodyView = self->_bodyView;
  if (bodyView != v5)
  {
    double v10 = v5;
    [(PRXTextContainer *)bodyView removeFromSuperview];
    objc_storeStrong((id *)&self->_bodyView, a3);
    [(PRXTextContainer *)*p_bodyView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXFeatureTourContentView *)self addSubview:*p_bodyView];
    bodyViewConstraints = self->_bodyViewConstraints;
    self->_bodyViewConstraints = 0;

    mainContentGuideConstraints = self->_mainContentGuideConstraints;
    self->_mainContentGuideConstraints = 0;

    bodyView = (PRXTextContainer *)[(PRXFeatureTourContentView *)self setNeedsUpdateConstraints];
    double v5 = v10;
  }
  MEMORY[0x270F9A758](bodyView, v5);
}

- (void)setDismissButton:(id)a3
{
  double v5 = (PRXButton *)a3;
  p_dismissButton = &self->_dismissButton;
  dismissButton = self->_dismissButton;
  if (dismissButton != v5)
  {
    double v9 = v5;
    [(PRXButton *)dismissButton removeFromSuperview];
    objc_storeStrong((id *)&self->_dismissButton, a3);
    [(PRXButton *)*p_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXFeatureTourContentView *)self addSubview:*p_dismissButton];
    dismissButtonConstraints = self->_dismissButtonConstraints;
    self->_dismissButtonConstraints = 0;

    dismissButton = (PRXButton *)[(PRXFeatureTourContentView *)self setNeedsUpdateConstraints];
    double v5 = v9;
  }
  MEMORY[0x270F9A758](dismissButton, v5);
}

- (PRXTextContainer)titleView
{
  return self->_titleView;
}

- (PRXTextContainer)bodyView
{
  return self->_bodyView;
}

- (PRXButton)dismissButton
{
  return self->_dismissButton;
}

- (UILayoutGuide)mainContentGuide
{
  return self->_mainContentGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainContentGuide, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_mainContentGuideConstraints, 0);
  objc_storeStrong((id *)&self->_dismissButtonConstraints, 0);
  objc_storeStrong((id *)&self->_bodyViewConstraints, 0);
  objc_storeStrong((id *)&self->_titleViewConstraints, 0);
}

@end