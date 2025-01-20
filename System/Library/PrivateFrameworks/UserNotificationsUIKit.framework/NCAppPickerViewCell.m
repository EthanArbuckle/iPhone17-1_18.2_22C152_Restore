@interface NCAppPickerViewCell
+ (double)preferredHeightForText:(id)a3 cellWidth:(double)a4;
+ (double)preferredImageDimension;
+ (id)_frequencyFont;
+ (id)_titleFont;
+ (id)reuseIdentifier;
- (NCAppPickerViewCell)initWithFrame:(CGRect)a3;
- (id)_frequencyTextForCount:(unint64_t)a3;
- (void)_layoutLine;
- (void)configureWithName:(id)a3 image:(id)a4 avgNumberOfNotificationsCount:(unint64_t)a5 maxAvgNumberOfNotificationsCount:(unint64_t)a6 selected:(BOOL)a7;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation NCAppPickerViewCell

- (NCAppPickerViewCell)initWithFrame:(CGRect)a3
{
  v142.receiver = self;
  v142.super_class = (Class)NCAppPickerViewCell;
  v3 = -[NCAppPickerViewCell initWithFrame:](&v142, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(NCAppPickerViewCell *)v3 traitCollection];
    if ([v5 userInterfaceStyle] == 2) {
      [MEMORY[0x1E4FB1618] systemGray5Color];
    }
    else {
    v141 = [MEMORY[0x1E4FB1618] systemGray6Color];
    }

    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIView *)v11;

    [(UIView *)v4->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_backgroundView _setContinuousCornerRadius:12.0];
    [(UIView *)v4->_backgroundView setBackgroundColor:v141];
    v13 = [(NCAppPickerViewCell *)v4 contentView];
    [v13 addSubview:v4->_backgroundView];

    uint64_t v14 = +[NCCheckmarkButton button];
    checkmarkButton = v4->_checkmarkButton;
    v4->_checkmarkButton = (NCCheckmarkButton *)v14;

    [(NCCheckmarkButton *)v4->_checkmarkButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NCCheckmarkButton *)v4->_checkmarkButton setUserInteractionEnabled:0];
    v16 = [(NCAppPickerViewCell *)v4 contentView];
    [v16 addSubview:v4->_checkmarkButton];

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v17;

    [(UIImageView *)v4->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(NCAppPickerViewCell *)v4 contentView];
    [v19 addSubview:v4->_iconImageView];

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
    titleAndFrequencyContainer = v4->_titleAndFrequencyContainer;
    v4->_titleAndFrequencyContainer = (UIView *)v20;

    [(UIView *)v4->_titleAndFrequencyContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [(NCAppPickerViewCell *)v4 contentView];
    [v22 addSubview:v4->_titleAndFrequencyContainer];

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v23;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = v4->_titleLabel;
    v26 = [(id)objc_opt_class() _titleFont];
    [(UILabel *)v25 setFont:v26];

    v27 = v4->_titleLabel;
    v28 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v27 setTextColor:v28];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setMinimumScaleFactor:0.8];
    [(UIView *)v4->_titleAndFrequencyContainer addSubview:v4->_titleLabel];
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
    frequencyLineView = v4->_frequencyLineView;
    v4->_frequencyLineView = (UIView *)v29;

    [(UIView *)v4->_frequencyLineView setTranslatesAutoresizingMaskIntoConstraints:0];
    v31 = v4->_frequencyLineView;
    v32 = [MEMORY[0x1E4FB1618] systemGray3Color];
    [(UIView *)v31 setBackgroundColor:v32];

    [(UIView *)v4->_frequencyLineView _setContinuousCornerRadius:2.0];
    [(UIView *)v4->_titleAndFrequencyContainer addSubview:v4->_frequencyLineView];
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
    frequencyDotView = v4->_frequencyDotView;
    v4->_frequencyDotView = (UIView *)v33;

    [(UIView *)v4->_frequencyDotView setTranslatesAutoresizingMaskIntoConstraints:0];
    v35 = v4->_frequencyDotView;
    v36 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(UIView *)v35 setBackgroundColor:v36];

    [(UIView *)v4->_frequencyDotView _setCornerRadius:4.5];
    [(UIView *)v4->_titleAndFrequencyContainer addSubview:v4->_frequencyDotView];
    uint64_t v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    frequencyLabel = v4->_frequencyLabel;
    v4->_frequencyLabel = (UILabel *)v37;

    [(UILabel *)v4->_frequencyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v39 = v4->_frequencyLabel;
    v40 = [(id)objc_opt_class() _frequencyFont];
    [(UILabel *)v39 setFont:v40];

    v41 = v4->_frequencyLabel;
    v42 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v41 setTextColor:v42];

    [(UILabel *)v4->_frequencyLabel setMinimumScaleFactor:0.5];
    [(UILabel *)v4->_frequencyLabel setAdjustsFontSizeToFitWidth:1];
    [(UIView *)v4->_titleAndFrequencyContainer addSubview:v4->_frequencyLabel];
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v44 = [(UIView *)v4->_backgroundView topAnchor];
    v45 = [(NCAppPickerViewCell *)v4 contentView];
    v46 = [v45 topAnchor];
    v47 = [v44 constraintEqualToAnchor:v46];
    [v43 addObject:v47];

    v48 = [(NCAppPickerViewCell *)v4 contentView];
    v49 = [v48 trailingAnchor];
    v50 = [(UIView *)v4->_backgroundView trailingAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v43 addObject:v51];

    v52 = [(UIView *)v4->_backgroundView leadingAnchor];
    v53 = [(NCAppPickerViewCell *)v4 contentView];
    v54 = [v53 leadingAnchor];
    v55 = [v52 constraintEqualToAnchor:v54];
    [v43 addObject:v55];

    v56 = [(NCAppPickerViewCell *)v4 contentView];
    v57 = [v56 bottomAnchor];
    v58 = [(UIView *)v4->_backgroundView bottomAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];
    [v43 addObject:v59];

    v60 = [(NCCheckmarkButton *)v4->_checkmarkButton leadingAnchor];
    v61 = [(NCAppPickerViewCell *)v4 contentView];
    v62 = [v61 leadingAnchor];
    v63 = [v60 constraintEqualToAnchor:v62 constant:2.0];
    [v43 addObject:v63];

    v64 = [(NCCheckmarkButton *)v4->_checkmarkButton heightAnchor];
    v65 = [(NCAppPickerViewCell *)v4 contentView];
    v66 = [v65 heightAnchor];
    v67 = [v64 constraintEqualToAnchor:v66];
    [v43 addObject:v67];

    v68 = [(NCCheckmarkButton *)v4->_checkmarkButton centerYAnchor];
    v69 = [(NCAppPickerViewCell *)v4 contentView];
    v70 = [v69 centerYAnchor];
    v71 = [v68 constraintEqualToAnchor:v70];
    [v43 addObject:v71];

    v72 = [(NCCheckmarkButton *)v4->_checkmarkButton widthAnchor];
    v73 = [v72 constraintEqualToConstant:44.0];
    [v43 addObject:v73];

    v74 = [(UIImageView *)v4->_iconImageView heightAnchor];
    v75 = [v74 constraintEqualToConstant:29.0];
    [v43 addObject:v75];

    v76 = [(UIImageView *)v4->_iconImageView widthAnchor];
    v77 = [v76 constraintEqualToConstant:29.0];
    [v43 addObject:v77];

    v78 = [(UIImageView *)v4->_iconImageView leadingAnchor];
    v79 = [(NCAppPickerViewCell *)v4 contentView];
    v80 = [v79 leadingAnchor];
    v81 = [v78 constraintEqualToAnchor:v80 constant:47.0];
    [v43 addObject:v81];

    v82 = [(UIImageView *)v4->_iconImageView centerYAnchor];
    v83 = [(NCAppPickerViewCell *)v4 contentView];
    v84 = [v83 centerYAnchor];
    v85 = [v82 constraintEqualToAnchor:v84];
    [v43 addObject:v85];

    v86 = [(UIView *)v4->_titleAndFrequencyContainer centerYAnchor];
    v87 = [(NCAppPickerViewCell *)v4 contentView];
    v88 = [v87 centerYAnchor];
    v89 = [v86 constraintEqualToAnchor:v88];
    [v43 addObject:v89];

    v90 = [(UIView *)v4->_titleAndFrequencyContainer leadingAnchor];
    v91 = [(UIImageView *)v4->_iconImageView trailingAnchor];
    v92 = [v90 constraintEqualToAnchor:v91 constant:12.0];
    [v43 addObject:v92];

    v93 = [(NCAppPickerViewCell *)v4 contentView];
    v94 = [v93 trailingAnchor];
    v95 = [(UIView *)v4->_titleAndFrequencyContainer trailingAnchor];
    v96 = [v94 constraintEqualToAnchor:v95 constant:14.0];
    [v43 addObject:v96];

    v97 = [(UILabel *)v4->_titleLabel topAnchor];
    v98 = [(UIView *)v4->_titleAndFrequencyContainer topAnchor];
    v99 = [v97 constraintEqualToAnchor:v98];
    [v43 addObject:v99];

    v100 = [(UIView *)v4->_titleAndFrequencyContainer trailingAnchor];
    v101 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v102 = [v100 constraintEqualToAnchor:v101];
    [v43 addObject:v102];

    v103 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v104 = [(UIView *)v4->_titleAndFrequencyContainer leadingAnchor];
    v105 = [v103 constraintEqualToAnchor:v104];
    [v43 addObject:v105];

    v106 = [(UILabel *)v4->_frequencyLabel topAnchor];
    v107 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v108 = [v106 constraintEqualToAnchor:v107 constant:2.0];
    [v43 addObject:v108];

    v109 = [(UILabel *)v4->_frequencyLabel leadingAnchor];
    v110 = [(UIView *)v4->_frequencyDotView trailingAnchor];
    v111 = [v109 constraintEqualToAnchor:v110 constant:4.0];
    [v43 addObject:v111];

    v112 = [(UIView *)v4->_titleAndFrequencyContainer trailingAnchor];
    v113 = [(UILabel *)v4->_frequencyLabel trailingAnchor];
    v114 = [v112 constraintGreaterThanOrEqualToAnchor:v113 constant:0.0];
    [v43 addObject:v114];

    v115 = [(UIView *)v4->_titleAndFrequencyContainer bottomAnchor];
    v116 = [(UILabel *)v4->_frequencyLabel bottomAnchor];
    v117 = [v115 constraintEqualToAnchor:v116];
    [v43 addObject:v117];

    v118 = [(UIView *)v4->_frequencyLineView centerYAnchor];
    v119 = [(UILabel *)v4->_frequencyLabel centerYAnchor];
    v120 = [v118 constraintEqualToAnchor:v119];
    [v43 addObject:v120];

    v121 = [(UIView *)v4->_frequencyLineView leadingAnchor];
    v122 = [(UIView *)v4->_titleAndFrequencyContainer leadingAnchor];
    v123 = [v121 constraintEqualToAnchor:v122];
    [v43 addObject:v123];

    v124 = [(UIView *)v4->_frequencyLineView heightAnchor];
    v125 = [v124 constraintEqualToConstant:4.0];
    [v43 addObject:v125];

    v126 = [(UIView *)v4->_frequencyLineView widthAnchor];
    uint64_t v127 = [v126 constraintEqualToConstant:0.0];
    frequencyLineWidthConstraint = v4->_frequencyLineWidthConstraint;
    v4->_frequencyLineWidthConstraint = (NSLayoutConstraint *)v127;

    [v43 addObject:v4->_frequencyLineWidthConstraint];
    v129 = [(UIView *)v4->_frequencyDotView centerYAnchor];
    v130 = [(UIView *)v4->_frequencyLineView centerYAnchor];
    v131 = [v129 constraintEqualToAnchor:v130];
    [v43 addObject:v131];

    v132 = [(UIView *)v4->_frequencyDotView heightAnchor];
    v133 = [v132 constraintEqualToConstant:9.0];
    [v43 addObject:v133];

    v134 = [(UIView *)v4->_frequencyDotView widthAnchor];
    v135 = [v134 constraintEqualToConstant:9.0];
    [v43 addObject:v135];

    v136 = [(UIView *)v4->_frequencyDotView leadingAnchor];
    v137 = [(UIView *)v4->_frequencyLineView trailingAnchor];
    uint64_t v138 = [v136 constraintEqualToAnchor:v137];
    frequencyDotLeadingConstraint = v4->_frequencyDotLeadingConstraint;
    v4->_frequencyDotLeadingConstraint = (NSLayoutConstraint *)v138;

    [v43 addObject:v4->_frequencyDotLeadingConstraint];
    [MEMORY[0x1E4F28DC8] activateConstraints:v43];
  }
  return v4;
}

+ (id)reuseIdentifier
{
  return @"NCAppPickerViewCell";
}

+ (double)preferredHeightForText:(id)a3 cellWidth:(double)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [a1 _titleFont];
  if (!preferredHeightForText_cellWidth____drawingContext)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FB0860]);
    double v9 = (void *)preferredHeightForText_cellWidth____drawingContext;
    preferredHeightForText_cellWidth____drawingContext = (uint64_t)v8;

    [(id)preferredHeightForText_cellWidth____drawingContext setWantsNumberOfLineFragments:1];
  }
  uint64_t v23 = *MEMORY[0x1E4FB06F8];
  v24[0] = v7;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v10, preferredHeightForText_cellWidth____drawingContext, a4 + -102.0, 0.0);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v25.origin.x = v12;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v18;
  CGRectGetHeight(v25);

  v19 = [a1 _frequencyFont];
  [v19 lineHeight];

  _NCMainScreenScale();
  UICeilToScale();
  if (v20 >= 62.0) {
    double v21 = v20;
  }
  else {
    double v21 = 62.0;
  }

  return v21;
}

+ (double)preferredImageDimension
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  double v4 = ceil(v3 * 29.0);

  return v4;
}

- (void)configureWithName:(id)a3 image:(id)a4 avgNumberOfNotificationsCount:(unint64_t)a5 maxAvgNumberOfNotificationsCount:(unint64_t)a6 selected:(BOOL)a7
{
  BOOL v7 = a7;
  titleLabel = self->_titleLabel;
  id v13 = a4;
  [(UILabel *)titleLabel setText:a3];
  [(UIImageView *)self->_iconImageView setImage:v13];

  [(NCCheckmarkButton *)self->_checkmarkButton setSelected:v7];
  frequencyLabel = self->_frequencyLabel;
  double v15 = [(NCAppPickerViewCell *)self _frequencyTextForCount:a5];
  [(UILabel *)frequencyLabel setText:v15];

  self->_avgNumberOfNotificationsCount = a5;
  self->_maxAvgNumberOfNotificationsCount = a6;
  [(NCAppPickerViewCell *)self setNeedsLayout];

  [(NCAppPickerViewCell *)self layoutIfNeeded];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)NCAppPickerViewCell;
  [(NCAppPickerViewCell *)&v3 prepareForReuse];
  [(UIImageView *)self->_iconImageView setImage:0];
  [(UILabel *)self->_frequencyLabel setText:0];
  [(UILabel *)self->_titleLabel setText:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCAppPickerViewCell;
  [(NCAppPickerViewCell *)&v3 layoutSubviews];
  [(NCAppPickerViewCell *)self _layoutLine];
}

- (id)_frequencyTextForCount:(unint64_t)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F28EE0];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [v3 localizedStringFromNumber:v4 numberStyle:0];

  return v5;
}

- (void)_layoutLine
{
  v18[1] = *MEMORY[0x1E4F143B8];
  [(UIView *)self->_titleAndFrequencyContainer frame];
  double v4 = v3;
  v5 = [(NCAppPickerViewCell *)self _frequencyTextForCount:self->_maxAvgNumberOfNotificationsCount];
  [(UIView *)self->_titleAndFrequencyContainer frame];
  double v7 = v6;
  double v9 = v8;
  uint64_t v17 = *MEMORY[0x1E4FB06F8];
  double v10 = [(id)objc_opt_class() _frequencyFont];
  v18[0] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v11, 0, v7, v9);
  double Width = CGRectGetWidth(v19);

  unint64_t maxAvgNumberOfNotificationsCount = self->_maxAvgNumberOfNotificationsCount;
  double v14 = 0.0;
  if (maxAvgNumberOfNotificationsCount) {
    double v14 = (double)self->_avgNumberOfNotificationsCount / (double)maxAvgNumberOfNotificationsCount;
  }
  double v15 = floor(fmax(v4 - Width + -4.0 + -4.5, 0.0) * v14);
  [(NSLayoutConstraint *)self->_frequencyLineWidthConstraint setConstant:v15];
  if (v15 >= 4.5) {
    double v16 = -4.5;
  }
  else {
    double v16 = 0.0;
  }
  [(NSLayoutConstraint *)self->_frequencyDotLeadingConstraint setConstant:v16];
  [(UIView *)self->_frequencyLineView setHidden:v15 < 4.5];
}

+ (id)_frequencyFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (id)_titleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequencyDotLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_frequencyLineWidthConstraint, 0);
  objc_storeStrong((id *)&self->_frequencyLabel, 0);
  objc_storeStrong((id *)&self->_frequencyDotView, 0);
  objc_storeStrong((id *)&self->_frequencyLineView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleAndFrequencyContainer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_checkmarkButton, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end