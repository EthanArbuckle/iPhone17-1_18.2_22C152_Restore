@interface QuerySuggestionView
- (BOOL)needsTwoLinesLayout;
- (BOOL)shouldDistributeProportionally;
- (NSArray)highlightRanges;
- (NSLayoutConstraint)delimeterWidthConstraint;
- (NSString)detailText;
- (NSString)title;
- (QuerySuggestionView)init;
- (UIImageView)iconImageView;
- (UILabel)delimiterLabel;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (UIStackView)labelStackView;
- (id)delimiterString;
- (id)titleFont;
- (unint64_t)querySuggestionStyle;
- (void)clearContents;
- (void)layoutSubviews;
- (void)setDelimeterWidthConstraint:(id)a3;
- (void)setDelimiterLabel:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setHighlightRanges:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setQuerySuggestionStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 highlightTitleRanges:(id)a4 detailText:(id)a5 style:(unint64_t)a6;
- (void)setTitleLabel:(id)a3;
- (void)updateLabels;
- (void)updateTheme;
@end

@implementation QuerySuggestionView

- (QuerySuggestionView)init
{
  v55.receiver = self;
  v55.super_class = (Class)QuerySuggestionView;
  v2 = [(QuerySuggestionView *)&v55 init];
  if (v2)
  {
    v3 = +[UIColor clearColor];
    [(QuerySuggestionView *)v2 setBackgroundColor:v3];

    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v4;

    v6 = +[UIColor clearColor];
    [(UILabel *)v2->_titleLabel setBackgroundColor:v6];

    LODWORD(v7) = 1144750080;
    [(UILabel *)v2->_titleLabel setContentCompressionResistancePriority:0 forAxis:v7];
    LODWORD(v8) = 1144750080;
    [(UILabel *)v2->_titleLabel setContentHuggingPriority:0 forAxis:v8];
    [(UILabel *)v2->_titleLabel setAccessibilityIdentifier:@"QuerySuggestionTitle"];
    v9 = (UILabel *)objc_alloc_init((Class)UILabel);
    delimiterLabel = v2->_delimiterLabel;
    v2->_delimiterLabel = v9;

    v11 = +[UIColor clearColor];
    [(UILabel *)v2->_delimiterLabel setBackgroundColor:v11];

    [(UILabel *)v2->_delimiterLabel setTextAlignment:0];
    LODWORD(v12) = 1144750080;
    [(UILabel *)v2->_delimiterLabel setContentCompressionResistancePriority:0 forAxis:v12];
    LODWORD(v13) = 1144750080;
    [(UILabel *)v2->_delimiterLabel setContentHuggingPriority:0 forAxis:v13];
    [(UILabel *)v2->_delimiterLabel setAccessibilityIdentifier:@"QuerySuggestionDelimiter"];
    v14 = [(UILabel *)v2->_delimiterLabel widthAnchor];
    uint64_t v15 = [v14 constraintEqualToConstant:14.0];
    delimeterWidthConstraint = v2->_delimeterWidthConstraint;
    v2->_delimeterWidthConstraint = (NSLayoutConstraint *)v15;

    v17 = (UILabel *)objc_alloc_init((Class)UILabel);
    detailLabel = v2->_detailLabel;
    v2->_detailLabel = v17;

    v19 = +[UIColor clearColor];
    [(UILabel *)v2->_detailLabel setBackgroundColor:v19];

    LODWORD(v20) = 1132068864;
    [(UILabel *)v2->_detailLabel setContentCompressionResistancePriority:0 forAxis:v20];
    LODWORD(v21) = 1132068864;
    [(UILabel *)v2->_detailLabel setContentHuggingPriority:0 forAxis:v21];
    [(UILabel *)v2->_detailLabel setAccessibilityIdentifier:@"QuerySuggestionDetail"];
    id v22 = objc_alloc((Class)UIStackView);
    v57[0] = v2->_titleLabel;
    v57[1] = v2->_delimiterLabel;
    v57[2] = v2->_detailLabel;
    v23 = +[NSArray arrayWithObjects:v57 count:3];
    v24 = (UIStackView *)[v22 initWithArrangedSubviews:v23];
    labelStackView = v2->_labelStackView;
    v2->_labelStackView = v24;

    [(UIStackView *)v2->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v2->_labelStackView setAxis:0];
    [(UIStackView *)v2->_labelStackView setAlignment:1];
    [(UIStackView *)v2->_labelStackView setDistribution:0];
    [(QuerySuggestionView *)v2 addSubview:v2->_labelStackView];
    v26 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    iconImageView = v2->_iconImageView;
    v2->_iconImageView = v26;

    [(UIImageView *)v2->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = +[UIImage systemImageNamed:@"magnifyingglass"];
    [(UIImageView *)v2->_iconImageView setImage:v28];

    v29 = +[UIColor secondaryLabelColor];
    [(UIImageView *)v2->_iconImageView setTintColor:v29];

    [(UIImageView *)v2->_iconImageView setAccessibilityIdentifier:@"QuerySuggestionIcon"];
    [(QuerySuggestionView *)v2 addSubview:v2->_iconImageView];
    v54 = [(UIStackView *)v2->_labelStackView topAnchor];
    v53 = [(QuerySuggestionView *)v2 topAnchor];
    v52 = [v54 constraintEqualToAnchor:v53 constant:10.0];
    v56[0] = v52;
    v51 = [(UIStackView *)v2->_labelStackView bottomAnchor];
    v50 = [(QuerySuggestionView *)v2 bottomAnchor];
    v49 = [v51 constraintEqualToAnchor:v50 constant:-10.0];
    v56[1] = v49;
    v48 = [(UIStackView *)v2->_labelStackView leadingAnchor];
    v47 = [(UIImageView *)v2->_iconImageView trailingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:15.0];
    v56[2] = v46;
    v45 = [(UIStackView *)v2->_labelStackView trailingAnchor];
    v44 = [(QuerySuggestionView *)v2 trailingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:-15.0];
    v56[3] = v43;
    v42 = [(UIImageView *)v2->_iconImageView centerYAnchor];
    v30 = [(QuerySuggestionView *)v2 centerYAnchor];
    v31 = [v42 constraintEqualToAnchor:v30];
    v56[4] = v31;
    v32 = [(UIImageView *)v2->_iconImageView leadingAnchor];
    v33 = [(QuerySuggestionView *)v2 leadingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 constant:16.0];
    v56[5] = v34;
    v35 = [(UIImageView *)v2->_iconImageView widthAnchor];
    v36 = [v35 constraintEqualToConstant:20.0];
    v56[6] = v36;
    v37 = [(UIImageView *)v2->_iconImageView heightAnchor];
    v38 = [v37 constraintEqualToConstant:20.0];
    v56[7] = v38;
    v41 = +[NSArray arrayWithObjects:v56 count:8];

    +[NSLayoutConstraint activateConstraints:v41];
    v39 = +[NSNotificationCenter defaultCenter];
    [v39 addObserver:v2 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v2;
}

- (void)clearContents
{
  [(QuerySuggestionView *)self setTitle:0];
  [(QuerySuggestionView *)self setHighlightRanges:0];
  v3 = [(QuerySuggestionView *)self titleLabel];
  [v3 setAttributedText:0];

  [(QuerySuggestionView *)self setDetailText:0];
  id v4 = [(QuerySuggestionView *)self detailLabel];
  [v4 setText:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)QuerySuggestionView;
  [(QuerySuggestionView *)&v3 layoutSubviews];
  [(QuerySuggestionView *)self updateLabels];
}

- (id)delimiterString
{
  if (qword_10160FE98 != -1) {
    dispatch_once(&qword_10160FE98, &stru_1012FFB08);
  }
  v2 = (void *)qword_10160FE90;

  return v2;
}

- (id)titleFont
{
  return +[UIFont system17];
}

- (void)setTitle:(id)a3 highlightTitleRanges:(id)a4 detailText:(id)a5 style:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  [(QuerySuggestionView *)self setTitle:a3];
  [(QuerySuggestionView *)self setHighlightRanges:v11];

  [(QuerySuggestionView *)self setDetailText:v10];
  [(QuerySuggestionView *)self setQuerySuggestionStyle:a6];

  [(QuerySuggestionView *)self updateLabels];
}

- (void)updateTheme
{
  v3.receiver = self;
  v3.super_class = (Class)QuerySuggestionView;
  [(MapsThemeView *)&v3 updateTheme];
  [(QuerySuggestionView *)self updateLabels];
}

- (void)updateLabels
{
  objc_super v3 = [(QuerySuggestionView *)self title];
  id v4 = [v3 length];

  if (!v4) {
    return;
  }
  unint64_t v5 = [(QuerySuggestionView *)self querySuggestionStyle];
  if (v5 != 1)
  {
    if (v5) {
      return;
    }
    v6 = +[UIColor secondaryLabelColor];
    double v7 = [(QuerySuggestionView *)self titleLabel];
    [v7 setTextColor:v6];

    double v8 = [(QuerySuggestionView *)self highlightRanges];
    id v9 = [v8 count];

    if (v9)
    {
      id v10 = [(QuerySuggestionView *)self title];
      id v11 = [(QuerySuggestionView *)self highlightRanges];
      double v12 = [(QuerySuggestionView *)self titleFont];
      double v13 = [(QuerySuggestionView *)self titleFont];
      v14 = +[UIColor labelColor];
      id v45 = +[NSAttributedString attributedStringWithText:v10 highlightRanges:v11 font:v12 highlightedFont:v13 highlightedTextColor:v14];
    }
    else
    {
      id v37 = objc_alloc((Class)NSAttributedString);
      id v10 = [(QuerySuggestionView *)self title];
      id v45 = [v37 initWithString:v10];
    }

    v38 = [(QuerySuggestionView *)self titleLabel];
    [v38 setAttributedText:v45];

    v39 = [(QuerySuggestionView *)self detailLabel];
    [v39 setText:0];

    v40 = [(QuerySuggestionView *)self delimiterLabel];
    [v40 setHidden:1];

    goto LABEL_14;
  }
  uint64_t v15 = [(QuerySuggestionView *)self title];
  v16 = [(QuerySuggestionView *)self titleLabel];
  [v16 setText:v15];

  v17 = +[UIColor labelColor];
  v18 = [(QuerySuggestionView *)self titleLabel];
  [v18 setTextColor:v17];

  v19 = [(QuerySuggestionView *)self titleFont];
  double v20 = [(QuerySuggestionView *)self titleLabel];
  [v20 setFont:v19];

  double v21 = [(QuerySuggestionView *)self delimiterString];
  id v22 = [(QuerySuggestionView *)self delimiterLabel];
  [v22 setText:v21];

  v23 = [(QuerySuggestionView *)self titleFont];
  v24 = [(QuerySuggestionView *)self delimiterLabel];
  [v24 setFont:v23];

  v25 = +[UIColor secondaryLabelColor];
  v26 = [(QuerySuggestionView *)self delimiterLabel];
  [v26 setTextColor:v25];

  v27 = [(QuerySuggestionView *)self detailText];
  v28 = [(QuerySuggestionView *)self detailLabel];
  [v28 setText:v27];

  v29 = +[UIColor secondaryLabelColor];
  v30 = [(QuerySuggestionView *)self detailLabel];
  [v30 setTextColor:v29];

  v31 = [(QuerySuggestionView *)self titleFont];
  v32 = [(QuerySuggestionView *)self detailLabel];
  [v32 setFont:v31];

  v33 = [(QuerySuggestionView *)self detailText];
  id v34 = [v33 length];

  if (!v34)
  {
    v36 = [(QuerySuggestionView *)self detailLabel];
    [v36 setText:0];
    goto LABEL_13;
  }
  if ([(QuerySuggestionView *)self needsTwoLinesLayout])
  {
    v35 = [(QuerySuggestionView *)self labelStackView];
    [v35 setDistribution:0];

    v36 = [(QuerySuggestionView *)self labelStackView];
    [v36 setAxis:1];
LABEL_13:

    id v45 = [(QuerySuggestionView *)self delimiterLabel];
    [v45 setHidden:1];
    goto LABEL_14;
  }
  v41 = [(QuerySuggestionView *)self delimiterLabel];
  [v41 setHidden:0];

  v42 = [(QuerySuggestionView *)self labelStackView];
  [v42 setAxis:0];

  if ([(QuerySuggestionView *)self shouldDistributeProportionally])
  {
    v43 = [(QuerySuggestionView *)self labelStackView];
    [v43 setDistribution:2];

    id v45 = [(QuerySuggestionView *)self delimeterWidthConstraint];
    [v45 setActive:1];
  }
  else
  {
    v44 = [(QuerySuggestionView *)self delimeterWidthConstraint];
    [v44 setActive:0];

    id v45 = [(QuerySuggestionView *)self labelStackView];
    [v45 setDistribution:0];
  }
LABEL_14:
}

- (BOOL)shouldDistributeProportionally
{
  v2 = self;
  objc_super v3 = [(QuerySuggestionView *)self title];
  id v4 = [(QuerySuggestionView *)v2 delimiterString];
  unint64_t v5 = [(QuerySuggestionView *)v2 detailText];
  v6 = +[NSString stringWithFormat:@"%@%@%@", v3, v4, v5];

  NSAttributedStringKey v17 = NSFontAttributeName;
  double v7 = [(QuerySuggestionView *)v2 titleFont];
  v18 = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v6 sizeWithAttributes:v8];
  double v10 = ceil(v9);

  [(QuerySuggestionView *)v2 layoutIfNeeded];
  [(QuerySuggestionView *)v2 frame];
  double v12 = v11 + -15.0;
  [(UIImageView *)v2->_iconImageView frame];
  double v14 = v12 - v13;
  [(UIImageView *)v2->_iconImageView frame];
  LOBYTE(v2) = v10 >= v14 - v15;

  return (char)v2;
}

- (BOOL)needsTwoLinesLayout
{
  if (qword_10160FEA8 != -1) {
    dispatch_once(&qword_10160FEA8, &stru_1012FFB28);
  }
  objc_super v3 = (void *)qword_10160FEA0;
  id v4 = +[UIApplication sharedApplication];
  unint64_t v5 = [v4 preferredContentSizeCategory];
  LODWORD(v3) = [v3 containsObject:v5];

  if (!v3) {
    return 0;
  }
  v6 = [(QuerySuggestionView *)self title];
  double v7 = [(QuerySuggestionView *)self delimiterString];
  double v8 = [(QuerySuggestionView *)self detailText];
  double v9 = +[NSString stringWithFormat:@"%@%@%@", v6, v7, v8];

  NSAttributedStringKey v27 = NSFontAttributeName;
  double v10 = [(QuerySuggestionView *)self titleFont];
  v28 = v10;
  double v11 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [v9 sizeWithAttributes:v11];
  double v13 = ceil(v12);

  [(QuerySuggestionView *)self frame];
  double v15 = v14;
  [(QuerySuggestionView *)self layoutMargins];
  double v17 = v15 - v16;
  [(QuerySuggestionView *)self layoutMargins];
  double v19 = 0.0;
  if (v17 - v18 >= 0.0)
  {
    [(QuerySuggestionView *)self frame];
    double v21 = v20;
    [(QuerySuggestionView *)self layoutMargins];
    double v23 = v21 - v22;
    [(QuerySuggestionView *)self layoutMargins];
    double v19 = v23 - v24;
  }
  BOOL v25 = v13 > v19;

  return v25;
}

- (unint64_t)querySuggestionStyle
{
  return self->_querySuggestionStyle;
}

- (void)setQuerySuggestionStyle:(unint64_t)a3
{
  self->_querySuggestionStyle = a3;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)delimiterLabel
{
  return self->_delimiterLabel;
}

- (void)setDelimiterLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (NSArray)highlightRanges
{
  return self->_highlightRanges;
}

- (void)setHighlightRanges:(id)a3
{
}

- (NSLayoutConstraint)delimeterWidthConstraint
{
  return self->_delimeterWidthConstraint;
}

- (void)setDelimeterWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delimeterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_highlightRanges, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_delimiterLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end