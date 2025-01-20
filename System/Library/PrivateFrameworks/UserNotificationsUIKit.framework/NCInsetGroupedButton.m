@interface NCInsetGroupedButton
+ (id)buttonWithTitle:(id)a3 top:(BOOL)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (id)_initWithTitle:(id)a3 top:(BOOL)a4;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSubtitleText:(id)a3;
@end

@implementation NCInsetGroupedButton

- (id)_initWithTitle:(id)a3 top:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v107.receiver = self;
  v107.super_class = (Class)NCInsetGroupedButton;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = -[NCInsetGroupedButton initWithFrame:](&v107, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
    cornersView = v11->_cornersView;
    v11->_cornersView = (UIView *)v12;

    [(UIView *)v11->_cornersView setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = v11->_cornersView;
    v15 = [MEMORY[0x1E4FB1618] systemGray6Color];
    [(UIView *)v14 setBackgroundColor:v15];

    [(UIView *)v11->_cornersView setUserInteractionEnabled:0];
    [(UIView *)v11->_cornersView _setContinuousCornerRadius:16.0];
    [(NCInsetGroupedButton *)v11 addSubview:v11->_cornersView];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
    backgroundView = v11->_backgroundView;
    v11->_backgroundView = (UIView *)v16;

    [(UIView *)v11->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v11->_backgroundView setUserInteractionEnabled:0];
    v18 = v11->_backgroundView;
    v19 = [MEMORY[0x1E4FB1618] systemGray6Color];
    [(UIView *)v18 setBackgroundColor:v19];

    [(NCInsetGroupedButton *)v11 addSubview:v11->_backgroundView];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v20;

    [(UILabel *)v11->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v11->_titleLabel setUserInteractionEnabled:0];
    v22 = v11->_titleLabel;
    uint64_t v23 = *MEMORY[0x1E4FB28C8];
    v24 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v22 setFont:v24];

    id v106 = v6;
    [(UILabel *)v11->_titleLabel setText:v6];
    [(NCInsetGroupedButton *)v11 addSubview:v11->_titleLabel];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v11->_subtitleLabel;
    v11->_subtitleLabel = (UILabel *)v25;

    [(UILabel *)v11->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v11->_subtitleLabel setUserInteractionEnabled:0];
    v27 = v11->_subtitleLabel;
    v28 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v23];
    [(UILabel *)v27 setFont:v28];

    v29 = v11->_subtitleLabel;
    v30 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UILabel *)v29 setTextColor:v30];

    [(NCInsetGroupedButton *)v11 addSubview:v11->_subtitleLabel];
    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    arrowImageView = v11->_arrowImageView;
    v11->_arrowImageView = (UIImageView *)v31;

    [(UIImageView *)v11->_arrowImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v11->_arrowImageView setUserInteractionEnabled:0];
    v105 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:14.0];
    v104 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:withConfiguration:", @"chevron.forward");
    -[UIImageView setImage:](v11->_arrowImageView, "setImage:");
    [(UIImageView *)v11->_arrowImageView setContentMode:4];
    v33 = v11->_arrowImageView;
    v34 = [MEMORY[0x1E4FB1618] systemGray3Color];
    [(UIImageView *)v33 setTintColor:v34];

    [(NCInsetGroupedButton *)v11 addSubview:v11->_arrowImageView];
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v36 = [(UIView *)v11->_backgroundView leadingAnchor];
    v37 = [(NCInsetGroupedButton *)v11 leadingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [v35 addObject:v38];

    v39 = [(NCInsetGroupedButton *)v11 trailingAnchor];
    v40 = [(UIView *)v11->_backgroundView trailingAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v35 addObject:v41];

    v42 = [(UIView *)v11->_backgroundView topAnchor];
    v43 = [(NCInsetGroupedButton *)v11 topAnchor];
    if (v4) {
      double v44 = 16.0;
    }
    else {
      double v44 = 0.0;
    }
    if (v4) {
      double v45 = 0.0;
    }
    else {
      double v45 = 16.0;
    }
    v46 = [v42 constraintEqualToAnchor:v43 constant:v44];
    [v35 addObject:v46];

    v47 = [(NCInsetGroupedButton *)v11 bottomAnchor];
    v48 = [(UIView *)v11->_backgroundView bottomAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:v45];
    [v35 addObject:v49];

    v50 = [(UIView *)v11->_cornersView leadingAnchor];
    v51 = [(NCInsetGroupedButton *)v11 leadingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    [v35 addObject:v52];

    v53 = [(NCInsetGroupedButton *)v11 trailingAnchor];
    v54 = [(UIView *)v11->_cornersView trailingAnchor];
    v55 = [v53 constraintEqualToAnchor:v54];
    [v35 addObject:v55];

    v56 = [(UIView *)v11->_cornersView heightAnchor];
    v57 = [v56 constraintEqualToConstant:32.0];
    [v35 addObject:v57];

    if (v4)
    {
      v58 = [(UIView *)v11->_cornersView topAnchor];
      [(NCInsetGroupedButton *)v11 topAnchor];
    }
    else
    {
      v58 = [(NCInsetGroupedButton *)v11 bottomAnchor];
      [(UIView *)v11->_cornersView bottomAnchor];
    v59 = };
    v60 = [v58 constraintEqualToAnchor:v59];
    [v35 addObject:v60];

    v61 = [(UILabel *)v11->_titleLabel centerYAnchor];
    v62 = [(NCInsetGroupedButton *)v11 centerYAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    [v35 addObject:v63];

    v64 = [(UILabel *)v11->_titleLabel topAnchor];
    v65 = [(NCInsetGroupedButton *)v11 topAnchor];
    v66 = [v64 constraintGreaterThanOrEqualToAnchor:v65 constant:16.0];
    [v35 addObject:v66];

    v67 = [(NCInsetGroupedButton *)v11 bottomAnchor];
    v68 = [(UILabel *)v11->_titleLabel bottomAnchor];
    v69 = [v67 constraintGreaterThanOrEqualToAnchor:v68 constant:16.0];
    [v35 addObject:v69];

    v70 = [(UILabel *)v11->_titleLabel leadingAnchor];
    v71 = [(NCInsetGroupedButton *)v11 leadingAnchor];
    v72 = [v70 constraintEqualToAnchor:v71 constant:16.0];
    [v35 addObject:v72];

    LODWORD(v73) = 1144750080;
    [(UILabel *)v11->_titleLabel setContentCompressionResistancePriority:0 forAxis:v73];
    v74 = [(UILabel *)v11->_subtitleLabel centerYAnchor];
    v75 = [(NCInsetGroupedButton *)v11 centerYAnchor];
    v76 = [v74 constraintEqualToAnchor:v75];
    [v35 addObject:v76];

    v77 = [(UILabel *)v11->_subtitleLabel leadingAnchor];
    v78 = [(UILabel *)v11->_titleLabel trailingAnchor];
    v79 = [v77 constraintGreaterThanOrEqualToAnchor:v78 constant:16.0];
    [v35 addObject:v79];

    v80 = [(UILabel *)v11->_subtitleLabel topAnchor];
    v81 = [(NCInsetGroupedButton *)v11 topAnchor];
    v82 = [v80 constraintGreaterThanOrEqualToAnchor:v81 constant:16.0];
    [v35 addObject:v82];

    v83 = [(NCInsetGroupedButton *)v11 bottomAnchor];
    v84 = [(UILabel *)v11->_subtitleLabel bottomAnchor];
    v85 = [v83 constraintGreaterThanOrEqualToAnchor:v84 constant:16.0];
    [v35 addObject:v85];

    LODWORD(v86) = 1132068864;
    [(UILabel *)v11->_subtitleLabel setContentCompressionResistancePriority:0 forAxis:v86];
    v87 = [(UILabel *)v11->_subtitleLabel centerYAnchor];
    v88 = [(NCInsetGroupedButton *)v11 centerYAnchor];
    v89 = [v87 constraintEqualToAnchor:v88];
    [v35 addObject:v89];

    v90 = [(UIImageView *)v11->_arrowImageView leadingAnchor];
    v91 = [(UILabel *)v11->_subtitleLabel trailingAnchor];
    v92 = [v90 constraintEqualToAnchor:v91 constant:8.0];
    [v35 addObject:v92];

    v93 = [(UIImageView *)v11->_arrowImageView centerYAnchor];
    v94 = [(NCInsetGroupedButton *)v11 centerYAnchor];
    v95 = [v93 constraintEqualToAnchor:v94];
    [v35 addObject:v95];

    v96 = [(NCInsetGroupedButton *)v11 trailingAnchor];
    v97 = [(UIImageView *)v11->_arrowImageView trailingAnchor];
    v98 = [v96 constraintEqualToAnchor:v97 constant:16.0];
    [v35 addObject:v98];

    v99 = [(UIImageView *)v11->_arrowImageView heightAnchor];
    v100 = [v99 constraintEqualToConstant:10.0];
    [v35 addObject:v100];

    v101 = [(UIImageView *)v11->_arrowImageView widthAnchor];
    v102 = [v101 constraintEqualToConstant:10.0];
    [v35 addObject:v102];

    [MEMORY[0x1E4F28DC8] activateConstraints:v35];
    id v6 = v106;
  }

  return v11;
}

+ (id)buttonWithTitle:(id)a3 top:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[NCInsetGroupedButton alloc] _initWithTitle:v5 top:v4];

  return v6;
}

- (void)setSubtitleText:(id)a3
{
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NCInsetGroupedButton;
  [(NCInsetGroupedButton *)&v4 layoutSubviews];
  if ([(NCInsetGroupedButton *)self isHighlighted]) {
    [MEMORY[0x1E4FB1618] systemGray4Color];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] systemGray6Color];
  }
  [(UIView *)self->_cornersView setBackgroundColor:v3];
  [(UIView *)self->_backgroundView setBackgroundColor:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(NCInsetGroupedButton *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)NCInsetGroupedButton;
  [(NCInsetGroupedButton *)&v6 setHighlighted:v3];
  if (v5 != [(NCInsetGroupedButton *)self isHighlighted]) {
    [(NCInsetGroupedButton *)self setNeedsLayout];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(NCInsetGroupedButton *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)NCInsetGroupedButton;
  [(NCInsetGroupedButton *)&v6 setSelected:v3];
  if (v5 != [(NCInsetGroupedButton *)self isSelected]) {
    [(NCInsetGroupedButton *)self setNeedsLayout];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  int v5 = [v4 view];
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1)
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v4 numberOfTapsRequired];

  if (v6 != 1)
  {
LABEL_7:
    BOOL v7 = 1;
    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_arrowImageView, 0);
  objc_storeStrong((id *)&self->_cornersView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end