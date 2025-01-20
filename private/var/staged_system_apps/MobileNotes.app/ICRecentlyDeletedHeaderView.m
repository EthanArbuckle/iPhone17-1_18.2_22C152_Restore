@interface ICRecentlyDeletedHeaderView
+ (double)heightForSuperview:(id)a3;
+ (id)sizingView;
- (ICRecentlyDeletedHeaderView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)bottomLabelConstraint;
- (NSLayoutConstraint)leadingLabelConstraint;
- (NSLayoutConstraint)topLabelConstraint;
- (NSLayoutConstraint)trailingLabelConstraint;
- (UILabel)label;
- (void)layoutSubviews;
- (void)registerForTraitChanges;
- (void)setBottomLabelConstraint:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLeadingLabelConstraint:(id)a3;
- (void)setTopLabelConstraint:(id)a3;
- (void)setTrailingLabelConstraint:(id)a3;
- (void)updateLabel;
@end

@implementation ICRecentlyDeletedHeaderView

- (ICRecentlyDeletedHeaderView)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)ICRecentlyDeletedHeaderView;
  v3 = -[ICRecentlyDeletedHeaderView initWithFrame:](&v32, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v3->_label;
    v3->_label = v4;

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_label setNumberOfLines:0];
    v6 = +[UIColor secondaryLabelColor];
    [(UILabel *)v3->_label setTextColor:v6];

    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Notes are available here for %d days. After that time, notes will be permanently deleted. This may take up to %d days.", &stru_10063F3D8, 0 value table];
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, 30, 40);
    [(UILabel *)v3->_label setText:v9];

    LODWORD(v10) = 1148846080;
    [(UILabel *)v3->_label setContentCompressionResistancePriority:1 forAxis:v10];
    LODWORD(v11) = 1148846080;
    [(UILabel *)v3->_label setContentHuggingPriority:1 forAxis:v11];
    [(ICRecentlyDeletedHeaderView *)v3 updateLabel];
    [(UILabel *)v3->_label setTextAlignment:4];
    [(ICRecentlyDeletedHeaderView *)v3 addSubview:v3->_label];
    v12 = [(UILabel *)v3->_label topAnchor];
    v13 = [(ICRecentlyDeletedHeaderView *)v3 topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:6.0];
    [(ICRecentlyDeletedHeaderView *)v3 setTopLabelConstraint:v14];

    v15 = [(UILabel *)v3->_label bottomAnchor];
    v16 = [(ICRecentlyDeletedHeaderView *)v3 bottomAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:-16.0];
    [(ICRecentlyDeletedHeaderView *)v3 setBottomLabelConstraint:v17];

    v18 = [(UILabel *)v3->_label leadingAnchor];
    v19 = [(ICRecentlyDeletedHeaderView *)v3 layoutMarginsGuide];
    v20 = [v19 leadingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20 constant:11.0];
    [(ICRecentlyDeletedHeaderView *)v3 setLeadingLabelConstraint:v21];

    v22 = [(UILabel *)v3->_label trailingAnchor];
    v23 = [(ICRecentlyDeletedHeaderView *)v3 layoutMarginsGuide];
    v24 = [v23 trailingAnchor];
    v25 = [v22 constraintEqualToAnchor:v24 constant:-11.0];
    [(ICRecentlyDeletedHeaderView *)v3 setTrailingLabelConstraint:v25];

    v26 = [(ICRecentlyDeletedHeaderView *)v3 topLabelConstraint];
    v33[0] = v26;
    v27 = [(ICRecentlyDeletedHeaderView *)v3 bottomLabelConstraint];
    v33[1] = v27;
    v28 = [(ICRecentlyDeletedHeaderView *)v3 leadingLabelConstraint];
    v33[2] = v28;
    v29 = [(ICRecentlyDeletedHeaderView *)v3 trailingLabelConstraint];
    v33[3] = v29;
    v30 = +[NSArray arrayWithObjects:v33 count:4];
    +[NSLayoutConstraint activateConstraints:v30];

    [(ICRecentlyDeletedHeaderView *)v3 setPreservesSuperviewLayoutMargins:1];
    [(ICRecentlyDeletedHeaderView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICRecentlyDeletedHeaderView *)v3 registerForTraitChanges];
  }
  return v3;
}

- (void)updateLabel
{
  [(ICRecentlyDeletedHeaderView *)self frame];
  double v4 = v3;
  if (v3 < 600.0)
  {
    unsigned int v5 = 0;
    uint64_t v6 = 4;
  }
  else
  {
    unsigned int v5 = +[UIDevice ic_isiPad];
    if (v5) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 4;
    }
  }
  v7 = [(ICRecentlyDeletedHeaderView *)self label];
  [v7 setTextAlignment:v6];

  v8 = &UIFontTextStyleSubheadline;
  if (!v5) {
    v8 = &UIFontTextStyleFootnote;
  }
  id v18 = +[UIFont ic_preferredFontForTextStyle:*v8 maxContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  v9 = [v18 ic_fontWithSingleLineA];
  double v10 = [(ICRecentlyDeletedHeaderView *)self label];
  [v10 setFont:v9];

  double v11 = [(ICRecentlyDeletedHeaderView *)self topLabelConstraint];
  [v11 setConstant:6.0];

  v12 = [(ICRecentlyDeletedHeaderView *)self bottomLabelConstraint];
  [v12 setConstant:-16.0];

  if (v4 >= 600.0 && +[UIDevice ic_isiPhone])
  {
    v13 = [(ICRecentlyDeletedHeaderView *)self leadingLabelConstraint];
    [v13 setConstant:80.0];

    v14 = [(ICRecentlyDeletedHeaderView *)self trailingLabelConstraint];
    v15 = v14;
    double v16 = -80.0;
  }
  else
  {
    v17 = [(ICRecentlyDeletedHeaderView *)self leadingLabelConstraint];
    [v17 setConstant:11.0];

    v14 = [(ICRecentlyDeletedHeaderView *)self trailingLabelConstraint];
    v15 = v14;
    double v16 = -11.0;
  }
  [v14 setConstant:v16];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICRecentlyDeletedHeaderView;
  [(ICRecentlyDeletedHeaderView *)&v3 layoutSubviews];
  [(ICRecentlyDeletedHeaderView *)self updateLabel];
}

+ (id)sizingView
{
  if (qword_1006AA0E8 != -1) {
    dispatch_once(&qword_1006AA0E8, &stru_1006272B0);
  }
  v2 = (void *)qword_1006AA0F0;

  return v2;
}

+ (double)heightForSuperview:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  v7 = [a1 sizingView];
  [v4 frame];
  [v7 setFrame:0.0, 0.0];
  [v7 updateLabel];
  [v4 layoutMargins];
  double v9 = v6 + -22.0 - v8;
  [v4 layoutMargins];
  double v11 = v10;

  v12 = [v7 label];
  LODWORD(v13) = 1148846080;
  LODWORD(v14) = 1112014848;
  [v12 systemLayoutSizeFittingSize:v9 - v11 withHorizontalFittingPriority:1.79769313e308 verticalFittingPriority:v13 v14];
  double v16 = v15;

  return v16 + 6.0 + 16.0;
}

- (void)registerForTraitChanges
{
  id v4 = +[UITraitCollection ic_traitsAffectingSize];
  id v3 = [(ICRecentlyDeletedHeaderView *)self registerForTraitChanges:v4 withAction:"updateLabel"];
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSLayoutConstraint)topLabelConstraint
{
  return self->_topLabelConstraint;
}

- (void)setTopLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomLabelConstraint
{
  return self->_bottomLabelConstraint;
}

- (void)setBottomLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingLabelConstraint
{
  return self->_leadingLabelConstraint;
}

- (void)setLeadingLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingLabelConstraint
{
  return self->_trailingLabelConstraint;
}

- (void)setTrailingLabelConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_leadingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelConstraint, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end