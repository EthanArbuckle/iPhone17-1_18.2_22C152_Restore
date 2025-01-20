@interface SHSDualSIMToneTitleView
- (SHSBadgeView)badgeView;
- (SHSDualSIMToneTitleView)init;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (void)loadConstraintsForTitleView;
- (void)setBadgeView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateContentsWithTitle:(id)a3 badgeText:(id)a4;
@end

@implementation SHSDualSIMToneTitleView

- (SHSDualSIMToneTitleView)init
{
  v18[2] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)SHSDualSIMToneTitleView;
  v2 = [(SHSDualSIMToneTitleView *)&v17 init];
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;

    [(UILabel *)v2->_titleLabel setUserInteractionEnabled:0];
    v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v6 = [v5 fontDescriptor];
    v7 = [v6 fontDescriptorWithSymbolicTraits:2];

    v8 = [MEMORY[0x263F81708] fontWithDescriptor:v7 size:0.0];
    [(UILabel *)v2->_titleLabel setFont:v8];

    [(UILabel *)v2->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v9 = objc_alloc_init(SHSBadgeView);
    badgeView = v2->_badgeView;
    v2->_badgeView = v9;

    id v11 = objc_alloc(MEMORY[0x263F82BF8]);
    v12 = [(SHSDualSIMToneTitleView *)v2 badgeView];
    v18[0] = v12;
    v18[1] = v2->_titleLabel;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    uint64_t v14 = [v11 initWithArrangedSubviews:v13];
    stackView = v2->_stackView;
    v2->_stackView = (UIStackView *)v14;

    [(UIStackView *)v2->_stackView setAlignment:3];
    [(UIStackView *)v2->_stackView setAxis:0];
    [(UIStackView *)v2->_stackView setDistribution:3];
    [(UIStackView *)v2->_stackView setLayoutMarginsRelativeArrangement:1];
    [(UIStackView *)v2->_stackView setSpacing:6.0];
    [(UIStackView *)v2->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v2->_stackView setUserInteractionEnabled:0];
    [(SHSDualSIMToneTitleView *)v2 addSubview:v2->_stackView];
    [(SHSDualSIMToneTitleView *)v2 loadConstraintsForTitleView];
  }
  return v2;
}

- (void)loadConstraintsForTitleView
{
  v3 = [(SHSDualSIMToneTitleView *)self badgeView];
  [v3 frame];
  double v5 = v4;
  v6 = [(SHSDualSIMToneTitleView *)self badgeView];
  [v6 frame];
  double v8 = v7;
  v9 = [(SHSDualSIMToneTitleView *)self badgeView];
  [v9 size];
  double v11 = v10;
  v12 = [(SHSDualSIMToneTitleView *)self titleLabel];
  v13 = [v12 font];
  [v13 capHeight];
  double v15 = v14;
  v16 = [(SHSDualSIMToneTitleView *)self badgeView];
  objc_msgSend(v16, "setFrame:", v5, v8, v11, v15);

  objc_super v17 = [(SHSDualSIMToneTitleView *)self stackView];
  v18 = [v17 topAnchor];
  v19 = [(SHSDualSIMToneTitleView *)self topAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  v21 = [(SHSDualSIMToneTitleView *)self stackView];
  v22 = [v21 bottomAnchor];
  v23 = [(SHSDualSIMToneTitleView *)self bottomAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  v25 = [(SHSDualSIMToneTitleView *)self stackView];
  v26 = [v25 leadingAnchor];
  v27 = [(SHSDualSIMToneTitleView *)self leadingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  v29 = [(SHSDualSIMToneTitleView *)self stackView];
  v30 = [v29 trailingAnchor];
  v31 = [(SHSDualSIMToneTitleView *)self trailingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  v33 = [(SHSDualSIMToneTitleView *)self stackView];
  v34 = [v33 centerYAnchor];
  v35 = [(SHSDualSIMToneTitleView *)self centerYAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v36 setActive:1];

  v37 = [(SHSDualSIMToneTitleView *)self badgeView];
  v38 = [v37 centerYAnchor];
  v39 = [(SHSDualSIMToneTitleView *)self stackView];
  v40 = [v39 centerYAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v41 setActive:1];

  id v46 = [(SHSDualSIMToneTitleView *)self titleLabel];
  v42 = [v46 centerYAnchor];
  v43 = [(SHSDualSIMToneTitleView *)self stackView];
  v44 = [v43 centerYAnchor];
  v45 = [v42 constraintEqualToAnchor:v44];
  [v45 setActive:1];
}

- (void)updateContentsWithTitle:(id)a3 badgeText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(SHSDualSIMToneTitleView *)self titleLabel];
  [v8 setText:v7];

  id v9 = [(SHSDualSIMToneTitleView *)self badgeView];
  [v9 setText:v6];
}

- (SHSBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end