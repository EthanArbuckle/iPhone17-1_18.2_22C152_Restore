@interface SKUIComposeReviewNicknameView
- (SKUIComposeReviewNicknameView)initWithFrame:(CGRect)a3;
- (SKUIComposeReviewSampleCardView)sampleCardView;
- (SKUIGradientView)sampleCardGradientView;
- (UILabel)nicknameInfoLabel;
- (UILabel)nicknamePlaceholderLabel;
- (UILabel)titleView;
- (UITextField)nicknameTextfield;
- (UIView)nicknameBackgroundView;
- (void)_setupInfo;
- (void)_setupSampleCardView;
- (void)_setupTextField;
- (void)_setupTitle;
- (void)_setupView;
- (void)setNicknameBackgroundView:(id)a3;
- (void)setNicknameInfoLabel:(id)a3;
- (void)setNicknamePlaceholderLabel:(id)a3;
- (void)setNicknameTextfield:(id)a3;
- (void)setSampleCardGradientView:(id)a3;
- (void)setSampleCardView:(id)a3;
- (void)setTitleView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SKUIComposeReviewNicknameView

- (SKUIComposeReviewNicknameView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIComposeReviewNicknameView;
  v3 = -[SKUIComposeReviewNicknameView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(SKUIComposeReviewNicknameView *)v3 setBackgroundColor:v4];

    [(SKUIComposeReviewNicknameView *)v3 _setupView];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SKUIComposeReviewNicknameView *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    v8 = [(SKUIComposeReviewNicknameView *)self titleView];
    v9 = SKUIFontLimitedPreferredFontForTextStyle(15, 7);
    [v8 setFont:v9];

    v10 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
    v11 = SKUIFontLimitedPreferredFontForTextStyle(3, 7);
    [v10 setFont:v11];

    v12 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
    v13 = SKUIFontLimitedPreferredFontForTextStyle(1, 7);
    [v12 setFont:v13];

    v14 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
    v15 = SKUIFontLimitedPreferredFontForTextStyle(11, 7);
    [v14 setFont:v15];
  }
  v16 = [(SKUIComposeReviewNicknameView *)self traitCollection];
  int v17 = [v16 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v17)
  {
    v18 = [(SKUIComposeReviewNicknameView *)self sampleCardGradientView];
    v19 = [v18 layer];
    v20 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    id v21 = [v20 colorWithAlphaComponent:0.0];
    v27[0] = [v21 CGColor];
    v22 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    id v23 = [v22 colorWithAlphaComponent:0.0];
    v27[1] = [v23 CGColor];
    id v24 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v27[2] = [v24 CGColor];
    id v25 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v27[3] = [v25 CGColor];
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    [v19 setColors:v26];
  }
}

- (void)_setupView
{
  [(SKUIComposeReviewNicknameView *)self _setupTitle];
  [(SKUIComposeReviewNicknameView *)self _setupSampleCardView];
  [(SKUIComposeReviewNicknameView *)self _setupTextField];

  [(SKUIComposeReviewNicknameView *)self _setupInfo];
}

- (void)_setupTitle
{
  v3 = objc_opt_new();
  [(SKUIComposeReviewNicknameView *)self setTitleView:v3];

  id v4 = [(SKUIComposeReviewNicknameView *)self titleView];
  v5 = SKUIFontLimitedPreferredFontForTextStyle(15, 7);
  [v4 setFont:v5];

  objc_super v6 = [(SKUIComposeReviewNicknameView *)self titleView];
  [v6 setNumberOfLines:2];

  v7 = [(SKUIComposeReviewNicknameView *)self titleView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(SKUIComposeReviewNicknameView *)self titleView];
  [(SKUIComposeReviewNicknameView *)self addSubview:v8];

  v9 = [(SKUIComposeReviewNicknameView *)self titleView];
  v10 = [v9 firstBaselineAnchor];
  v11 = [(SKUIComposeReviewNicknameView *)self safeAreaLayoutGuide];
  v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:61.0];
  [v13 setActive:1];

  v14 = [(SKUIComposeReviewNicknameView *)self titleView];
  v15 = [v14 leadingAnchor];
  v16 = [(SKUIComposeReviewNicknameView *)self leadingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:20.0];
  int v17 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16);
  [v17 setActive:1];

  v18 = [(SKUIComposeReviewNicknameView *)self titleView];
  v19 = [v18 trailingAnchor];
  v20 = [(SKUIComposeReviewNicknameView *)self trailingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:20.0];
  v22 = [v19 constraintEqualToAnchor:v20 constant:-v21];
  [v22 setActive:1];

  id v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v24 = [v23 localizedStringForKey:@"NICKNAME_VIEW_TITLE" value:&stru_1F1C879E8 table:0];
  id v25 = [(SKUIComposeReviewNicknameView *)self titleView];
  [v25 setText:v24];

  id v26 = [(SKUIComposeReviewNicknameView *)self titleView];
  [v26 setTextAlignment:1];
}

- (void)_setupSampleCardView
{
  v51[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(SKUIComposeReviewNicknameView *)self setSampleCardView:v3];

  id v4 = [(SKUIComposeReviewNicknameView *)self sampleCardView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(SKUIComposeReviewNicknameView *)self sampleCardView];
  [(SKUIComposeReviewNicknameView *)self addSubview:v5];

  objc_super v6 = [(SKUIComposeReviewNicknameView *)self sampleCardView];
  v7 = [v6 topAnchor];
  v8 = [(SKUIComposeReviewNicknameView *)self titleView];
  v9 = [v8 bottomAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:24.0 newValue:30.0];
  v10 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9);
  [v10 setActive:1];

  v11 = [(SKUIComposeReviewNicknameView *)self sampleCardView];
  v12 = [v11 centerXAnchor];
  v13 = [(SKUIComposeReviewNicknameView *)self centerXAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [SKUIGradientView alloc];
  v16 = -[SKUIGradientView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SKUIComposeReviewNicknameView *)self setSampleCardGradientView:v16];

  int v17 = [(SKUIComposeReviewNicknameView *)self sampleCardGradientView];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [(SKUIComposeReviewNicknameView *)self sampleCardView];
  v19 = [(SKUIComposeReviewNicknameView *)self sampleCardGradientView];
  [v18 addSubview:v19];

  v20 = [(SKUIComposeReviewNicknameView *)self sampleCardGradientView];
  double v21 = [v20 topAnchor];
  v22 = [(SKUIComposeReviewNicknameView *)self sampleCardView];
  id v23 = [v22 topAnchor];
  id v24 = [v21 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  id v25 = [(SKUIComposeReviewNicknameView *)self sampleCardGradientView];
  id v26 = [v25 leadingAnchor];
  v27 = [(SKUIComposeReviewNicknameView *)self sampleCardView];
  v28 = [v27 leadingAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  v30 = [(SKUIComposeReviewNicknameView *)self sampleCardGradientView];
  v31 = [v30 trailingAnchor];
  v32 = [(SKUIComposeReviewNicknameView *)self sampleCardView];
  v33 = [v32 trailingAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  v35 = [(SKUIComposeReviewNicknameView *)self sampleCardGradientView];
  v36 = [v35 bottomAnchor];
  v37 = [(SKUIComposeReviewNicknameView *)self sampleCardView];
  v38 = [v37 bottomAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  [v39 setActive:1];

  v40 = [(SKUIComposeReviewNicknameView *)self sampleCardGradientView];
  v41 = [v40 layer];
  v42 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v43 = [v42 colorWithAlphaComponent:0.0];
  v51[0] = [v43 CGColor];
  v44 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v45 = [v44 colorWithAlphaComponent:0.0];
  v51[1] = [v45 CGColor];
  id v46 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v51[2] = [v46 CGColor];
  id v47 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v51[3] = [v47 CGColor];
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
  [v41 setColors:v48];

  v49 = [(SKUIComposeReviewNicknameView *)self sampleCardGradientView];
  v50 = [v49 layer];
  [v50 setLocations:&unk_1F1D62090];
}

- (void)_setupTextField
{
  v3 = objc_opt_new();
  [(SKUIComposeReviewNicknameView *)self setNicknameBackgroundView:v3];

  id v4 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  objc_super v6 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  [v6 setBackgroundColor:v5];

  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:8.0];
  double v8 = v7;
  v9 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v10 = [v9 layer];
  [v10 setCornerRadius:v8];

  v11 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  [(SKUIComposeReviewNicknameView *)self addSubview:v11];

  v12 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v13 = [v12 topAnchor];
  v14 = [(SKUIComposeReviewNicknameView *)self sampleCardView];
  v15 = [v14 bottomAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:20.0];
  v16 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15);
  [v16 setActive:1];

  int v17 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v18 = [v17 leadingAnchor];
  v19 = [(SKUIComposeReviewNicknameView *)self leadingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:20.0];
  v20 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19);
  [v20 setActive:1];

  double v21 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v22 = [v21 trailingAnchor];
  id v23 = [(SKUIComposeReviewNicknameView *)self trailingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:20.0];
  id v25 = [v22 constraintEqualToAnchor:v23 constant:-v24];
  [v25 setActive:1];

  id v26 = objc_opt_new();
  [(SKUIComposeReviewNicknameView *)self setNicknamePlaceholderLabel:v26];

  v27 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v29 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
  [v28 addSubview:v29];

  v30 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
  v31 = SKUIFontLimitedPreferredFontForTextStyle(3, 7);
  [v30 setFont:v31];

  v32 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
  v33 = [v32 leadingAnchor];
  v34 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v35 = [v34 leadingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:20.0];
  v36 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35);
  [v36 setActive:1];

  v37 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
  v38 = [v37 topAnchor];
  v39 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v40 = [v39 topAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:18.0];
  v41 = objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40);
  [v41 setActive:1];

  v42 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
  id v43 = [v42 bottomAnchor];
  v44 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  id v45 = [v44 bottomAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:18.0];
  id v47 = [v43 constraintEqualToAnchor:v45 constant:-v46];
  [v47 setActive:1];

  v48 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
  LODWORD(v49) = 1148846080;
  [v48 setContentHuggingPriority:0 forAxis:v49];

  v50 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v51 = [v50 localizedStringForKey:@"NICKNAME_VIEW_PLACEHOLDER" value:&stru_1F1C879E8 table:0];
  v52 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
  [v52 setText:v51];

  v53 = objc_opt_new();
  [(SKUIComposeReviewNicknameView *)self setNicknameTextfield:v53];

  v54 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
  [v54 setTranslatesAutoresizingMaskIntoConstraints:0];

  v55 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v56 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
  [v55 addSubview:v56];

  v57 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
  v58 = [v57 firstBaselineAnchor];
  v59 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
  v60 = [v59 firstBaselineAnchor];
  v61 = [v58 constraintEqualToAnchor:v60];
  [v61 setActive:1];

  v62 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
  v63 = [v62 topAnchor];
  v64 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v65 = [v64 topAnchor];
  v66 = [v63 constraintEqualToAnchor:v65];
  [v66 setActive:1];

  v67 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
  v68 = [v67 leadingAnchor];
  v69 = [(SKUIComposeReviewNicknameView *)self nicknamePlaceholderLabel];
  v70 = [v69 trailingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:20.0];
  v71 = objc_msgSend(v68, "constraintEqualToAnchor:constant:", v70);
  [v71 setActive:1];

  v72 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
  v73 = [v72 trailingAnchor];
  v74 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v75 = [v74 trailingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:16.0];
  v77 = [v73 constraintEqualToAnchor:v75 constant:-v76];
  [v77 setActive:1];

  v78 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
  v79 = [v78 bottomAnchor];
  v80 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v81 = [v80 bottomAnchor];
  v82 = [v79 constraintEqualToAnchor:v81];
  [v82 setActive:1];

  v83 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
  LODWORD(v84) = 1132068864;
  [v83 setContentCompressionResistancePriority:0 forAxis:v84];

  v85 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
  [v85 setClearButtonMode:1];

  id v87 = [(SKUIComposeReviewNicknameView *)self nicknameTextfield];
  v86 = SKUIFontLimitedPreferredFontForTextStyle(1, 7);
  [v87 setFont:v86];
}

- (void)_setupInfo
{
  v3 = objc_opt_new();
  [(SKUIComposeReviewNicknameView *)self setNicknameInfoLabel:v3];

  id v4 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  [(SKUIComposeReviewNicknameView *)self addSubview:v5];

  objc_super v6 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  double v7 = SKUIFontLimitedPreferredFontForTextStyle(11, 7);
  [v6 setFont:v7];

  double v8 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v8 setTextColor:v9];

  v10 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  v11 = [v10 leadingAnchor];
  v12 = [(SKUIComposeReviewNicknameView *)self leadingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:40.0];
  v13 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12);
  [v13 setActive:1];

  v14 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  v15 = [v14 trailingAnchor];
  v16 = [(SKUIComposeReviewNicknameView *)self trailingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:40.0];
  v18 = [v15 constraintEqualToAnchor:v16 constant:-v17];
  [v18 setActive:1];

  v19 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  v20 = [v19 firstBaselineAnchor];
  double v21 = [(SKUIComposeReviewNicknameView *)self nicknameBackgroundView];
  v22 = [v21 bottomAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:24.0];
  id v23 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  [v23 setActive:1];

  double v24 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  id v25 = [v24 bottomAnchor];
  id v26 = [(SKUIComposeReviewNicknameView *)self bottomAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:20.0];
  v28 = [v25 constraintEqualToAnchor:v26 constant:-v27];
  [v28 setActive:1];

  v29 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  [v29 setNumberOfLines:3];

  v30 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  [v30 setTextAlignment:1];

  id v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v31 = [v33 localizedStringForKey:@"NICKNAME_VIEW_MESSAGE" value:&stru_1F1C879E8 table:0];
  v32 = [(SKUIComposeReviewNicknameView *)self nicknameInfoLabel];
  [v32 setText:v31];
}

- (UITextField)nicknameTextfield
{
  return self->_nicknameTextfield;
}

- (void)setNicknameTextfield:(id)a3
{
}

- (UILabel)nicknameInfoLabel
{
  return self->_nicknameInfoLabel;
}

- (void)setNicknameInfoLabel:(id)a3
{
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UILabel)nicknamePlaceholderLabel
{
  return self->_nicknamePlaceholderLabel;
}

- (void)setNicknamePlaceholderLabel:(id)a3
{
}

- (SKUIComposeReviewSampleCardView)sampleCardView
{
  return self->_sampleCardView;
}

- (void)setSampleCardView:(id)a3
{
}

- (SKUIGradientView)sampleCardGradientView
{
  return self->_sampleCardGradientView;
}

- (void)setSampleCardGradientView:(id)a3
{
}

- (UIView)nicknameBackgroundView
{
  return self->_nicknameBackgroundView;
}

- (void)setNicknameBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknameBackgroundView, 0);
  objc_storeStrong((id *)&self->_sampleCardGradientView, 0);
  objc_storeStrong((id *)&self->_sampleCardView, 0);
  objc_storeStrong((id *)&self->_nicknamePlaceholderLabel, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_nicknameInfoLabel, 0);

  objc_storeStrong((id *)&self->_nicknameTextfield, 0);
}

@end