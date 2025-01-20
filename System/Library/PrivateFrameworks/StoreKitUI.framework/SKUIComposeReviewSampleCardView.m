@interface SKUIComposeReviewSampleCardView
- (SKUIComposeReviewSampleCardView)initWithFrame:(CGRect)a3;
- (void)_setupView;
@end

@implementation SKUIComposeReviewSampleCardView

- (SKUIComposeReviewSampleCardView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIComposeReviewSampleCardView;
  v3 = -[SKUIComposeReviewSampleCardView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(SKUIComposeReviewSampleCardView *)v3 setBackgroundColor:v4];

    [(SKUIComposeReviewSampleCardView *)v3 _setupView];
  }
  return v3;
}

- (void)_setupView
{
  v3 = [(SKUIComposeReviewSampleCardView *)self layer];
  [v3 setCornerRadius:12.0];

  [(SKUIComposeReviewSampleCardView *)self setClipsToBounds:0];
  id v106 = (id)objc_opt_new();
  [v106 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  [v106 setBackgroundColor:v4];

  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:5.0];
  double v6 = v5;
  v7 = [v106 layer];
  [v7 setCornerRadius:v6];

  [(SKUIComposeReviewSampleCardView *)self addSubview:v106];
  v8 = [v106 topAnchor];
  v9 = [(SKUIComposeReviewSampleCardView *)self topAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:16.0];
  v10 = objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9);
  [v10 setActive:1];

  v11 = [v106 leadingAnchor];
  v12 = [(SKUIComposeReviewSampleCardView *)self leadingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v13 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12);
  [v13 setActive:1];

  v14 = [v106 widthAnchor];
  v15 = [v14 constraintEqualToConstant:66.0];
  [v15 setActive:1];

  v16 = [v106 heightAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:11.0 newValue:14.0];
  v17 = objc_msgSend(v16, "constraintEqualToConstant:");
  [v17 setActive:1];

  v18 = objc_opt_new();
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SKUIComposeReviewSampleCardView *)self addSubview:v18];
  [v18 layoutSubviews];
  v19 = [v18 firstBaselineAnchor];
  v20 = [(SKUIComposeReviewSampleCardView *)self topAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:50.0 newValue:60.0];
  v21 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20);
  [v21 setActive:1];

  v22 = [v18 leadingAnchor];
  v23 = [(SKUIComposeReviewSampleCardView *)self leadingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v24 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23);
  [v24 setActive:1];

  v25 = objc_opt_new();
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = SKUIFontLimitedPreferredFontForTextStyle(11, 7);
  [v25 setFont:v26];

  v27 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v25 setTextColor:v27];

  [(SKUIComposeReviewSampleCardView *)self addSubview:v25];
  v28 = [v25 firstBaselineAnchor];
  v29 = [v18 firstBaselineAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:5.0 newValue:7.0];
  v30 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
  [v30 setActive:1];

  v31 = [v25 trailingAnchor];
  v32 = [(SKUIComposeReviewSampleCardView *)self trailingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v34 = [v31 constraintEqualToAnchor:v32 constant:-v33];
  [v34 setActive:1];

  v35 = [v25 leadingAnchor];
  v36 = [(SKUIComposeReviewSampleCardView *)self centerXAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v37 = objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:constant:", v36);
  [v37 setActive:1];

  v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v39 = [v38 localizedStringForKey:@"NICKNAME_VIEW_PLACEHOLDER" value:&stru_1F1C879E8 table:0];
  [v25 setText:v39];

  v40 = objc_opt_new();
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
  v41 = (void *)MEMORY[0x1E4FB1830];
  v42 = SKUIFontLimitedPreferredFontForTextStyle(30, 7);
  v105 = [v41 configurationWithFont:v42];

  v43 = (void *)MEMORY[0x1E4FB1818];
  v44 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v45 = [v43 imageNamed:@"arrow.backward.extended" inBundle:v44];
  v104 = [v45 imageWithSymbolConfiguration:v105];

  [v40 setImage:v104];
  [(SKUIComposeReviewSampleCardView *)self addSubview:v40];
  v46 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v40 setTintColor:v46];

  v47 = [v40 leadingAnchor];
  v48 = [v25 trailingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48 constant:14.0];
  [v49 setActive:1];

  v50 = [v40 centerYAnchor];
  v51 = [v25 centerYAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v53 = objc_opt_new();
  [v53 setTranslatesAutoresizingMaskIntoConstraints:0];
  v54 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  [v53 setBackgroundColor:v54];

  v55 = [v53 layer];
  [v55 setCornerRadius:5.0];

  [(SKUIComposeReviewSampleCardView *)self addSubview:v53];
  v56 = [v53 topAnchor];
  v57 = [v25 firstBaselineAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:13.0 newValue:17.0];
  v58 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57);
  [v58 setActive:1];

  v59 = [v53 widthAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:222.0 newValue:288.0];
  v60 = objc_msgSend(v59, "constraintEqualToConstant:");
  [v60 setActive:1];

  v61 = [v53 leadingAnchor];
  v62 = [(SKUIComposeReviewSampleCardView *)self leadingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v63 = objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62);
  [v63 setActive:1];

  v64 = [v53 trailingAnchor];
  v65 = [(SKUIComposeReviewSampleCardView *)self trailingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v67 = [v64 constraintEqualToAnchor:v65 constant:-v66];
  [v67 setActive:1];

  v68 = [v53 heightAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:11.0 newValue:14.0];
  v69 = objc_msgSend(v68, "constraintEqualToConstant:");
  [v69 setActive:1];

  v70 = objc_opt_new();
  [v70 setTranslatesAutoresizingMaskIntoConstraints:0];
  v71 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  [v70 setBackgroundColor:v71];

  v72 = [v70 layer];
  [v72 setCornerRadius:5.0];

  [(SKUIComposeReviewSampleCardView *)self addSubview:v70];
  v73 = [v70 topAnchor];
  v74 = [v53 bottomAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:7.0 newValue:9.0];
  v75 = objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74);
  [v75 setActive:1];

  v76 = [v70 leadingAnchor];
  v77 = [(SKUIComposeReviewSampleCardView *)self leadingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v78 = objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77);
  [v78 setActive:1];

  v79 = [v70 trailingAnchor];
  v80 = [(SKUIComposeReviewSampleCardView *)self trailingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v82 = [v79 constraintEqualToAnchor:v80 constant:-v81];
  [v82 setActive:1];

  v83 = [v70 heightAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:11.0 newValue:14.0];
  v84 = objc_msgSend(v83, "constraintEqualToConstant:");
  [v84 setActive:1];

  v85 = objc_opt_new();
  [v85 setTranslatesAutoresizingMaskIntoConstraints:0];
  v86 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  [v85 setBackgroundColor:v86];

  v87 = [v85 layer];
  [v87 setCornerRadius:5.0];

  [(SKUIComposeReviewSampleCardView *)self addSubview:v85];
  v88 = [v85 topAnchor];
  v89 = [v70 bottomAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:7.0 newValue:9.0];
  v90 = objc_msgSend(v88, "constraintEqualToAnchor:constant:", v89);
  [v90 setActive:1];

  v91 = [v85 leadingAnchor];
  v92 = [(SKUIComposeReviewSampleCardView *)self leadingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v93 = objc_msgSend(v91, "constraintEqualToAnchor:constant:", v92);
  [v93 setActive:1];

  v94 = [v85 trailingAnchor];
  v95 = [(SKUIComposeReviewSampleCardView *)self trailingAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v97 = [v94 constraintEqualToAnchor:v95 constant:-v96];
  [v97 setActive:1];

  v98 = [v85 heightAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:11.0 newValue:14.0];
  v99 = objc_msgSend(v98, "constraintEqualToConstant:");
  [v99 setActive:1];

  v100 = [v85 bottomAnchor];
  v101 = [(SKUIComposeReviewSampleCardView *)self bottomAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:20.0 newValue:24.0];
  v103 = [v100 constraintEqualToAnchor:v101 constant:-v102];
  [v103 setActive:1];
}

@end