@interface CHAchievementsSectionHeaderView
+ (CGSize)preferredSizeForSectionName:(id)a3;
+ (id)_headerConfiguration;
+ (id)headerFont;
- (BOOL)hidesKeyLine;
- (CHAchievementsSectionHeaderView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)keyLineLeadingConstraint;
- (NSLayoutConstraint)labelBaselineConstraint;
- (NSLayoutConstraint)labelLeadingConstraint;
- (NSLayoutConstraint)labelTrailingConstraint;
- (UILabel)label;
- (UIView)keyLineView;
- (void)configureWithSectionName:(id)a3;
- (void)setHidesKeyLine:(BOOL)a3;
- (void)setKeyLineLeadingConstraint:(id)a3;
- (void)setKeyLineView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelBaselineConstraint:(id)a3;
- (void)setLabelLeadingConstraint:(id)a3;
- (void)setLabelTrailingConstraint:(id)a3;
- (void)setupLabelFont;
@end

@implementation CHAchievementsSectionHeaderView

- (CHAchievementsSectionHeaderView)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)CHAchievementsSectionHeaderView;
  v3 = -[CHAchievementsSectionHeaderView initWithFrame:](&v32, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    keyLineView = v3->_keyLineView;
    v3->_keyLineView = v4;

    v6 = +[UIColor separatorColor];
    [(UIView *)v3->_keyLineView setBackgroundColor:v6];

    [(UIView *)v3->_keyLineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CHAchievementsSectionHeaderView *)v3 addSubview:v3->_keyLineView];
    v7 = [(UIView *)v3->_keyLineView topAnchor];
    v8 = [(CHAchievementsSectionHeaderView *)v3 topAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:0.0];
    [v9 setActive:1];

    v10 = [(UIView *)v3->_keyLineView widthAnchor];
    v11 = [(CHAchievementsSectionHeaderView *)v3 widthAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [(UIView *)v3->_keyLineView heightAnchor];
    if (qword_10096B4A8 != -1) {
      dispatch_once(&qword_10096B4A8, &stru_1008ACDA8);
    }
    v14 = [v13 constraintEqualToConstant:*(double *)&qword_10096B4A0];
    [v14 setActive:1];

    v15 = [(UIView *)v3->_keyLineView leadingAnchor];
    v16 = [(CHAchievementsSectionHeaderView *)v3 leadingAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16 constant:16.0];
    keyLineLeadingConstraint = v3->_keyLineLeadingConstraint;
    v3->_keyLineLeadingConstraint = (NSLayoutConstraint *)v17;

    [(NSLayoutConstraint *)v3->_keyLineLeadingConstraint setActive:1];
    v19 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    label = v3->_label;
    v3->_label = v19;

    v21 = +[UIColor labelColor];
    [(UILabel *)v3->_label setTextColor:v21];

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_label setNumberOfLines:0];
    [(UILabel *)v3->_label setLineBreakMode:0];
    [(CHAchievementsSectionHeaderView *)v3 addSubview:v3->_label];
    [(CHAchievementsSectionHeaderView *)v3 setupLabelFont];
    v22 = [(UILabel *)v3->_label leadingAnchor];
    v23 = [(CHAchievementsSectionHeaderView *)v3 leadingAnchor];
    uint64_t v24 = [v22 constraintEqualToAnchor:v23 constant:16.0];
    labelLeadingConstraint = v3->_labelLeadingConstraint;
    v3->_labelLeadingConstraint = (NSLayoutConstraint *)v24;

    [(NSLayoutConstraint *)v3->_labelLeadingConstraint setActive:1];
    v26 = [(UILabel *)v3->_label widthAnchor];
    v27 = +[UIScreen mainScreen];
    [v27 bounds];
    uint64_t v28 = [v26 constraintEqualToConstant:CGRectGetWidth(v33) - 16.0];
    labelTrailingConstraint = v3->_labelTrailingConstraint;
    v3->_labelTrailingConstraint = (NSLayoutConstraint *)v28;

    [(NSLayoutConstraint *)v3->_labelTrailingConstraint setActive:1];
    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v3 selector:"setupLabelFont" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v3;
}

- (void)setHidesKeyLine:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hidesKeyLine = a3;
  id v4 = [(CHAchievementsSectionHeaderView *)self keyLineView];
  [v4 setHidden:v3];
}

- (void)setupLabelFont
{
  id v14 = +[CHAchievementsSectionHeaderView _headerConfiguration];
  [v14 directionalLayoutMargins];
  [(CHAchievementsSectionHeaderView *)self setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];
  BOOL v3 = [v14 textProperties];
  id v4 = [v3 font];
  v5 = [(CHAchievementsSectionHeaderView *)self label];
  [v5 setFont:v4];

  v6 = [(CHAchievementsSectionHeaderView *)self labelBaselineConstraint];
  [v6 setActive:0];

  v7 = [(CHAchievementsSectionHeaderView *)self label];
  v8 = [v7 firstBaselineAnchor];
  v9 = [(CHAchievementsSectionHeaderView *)self topAnchor];
  v10 = [(CHAchievementsSectionHeaderView *)self label];
  v11 = [v10 font];
  [v11 _scaledValueForValue:30.0];
  v12 = [v8 constraintEqualToAnchor:v9];
  [(CHAchievementsSectionHeaderView *)self setLabelBaselineConstraint:v12];

  v13 = [(CHAchievementsSectionHeaderView *)self labelBaselineConstraint];
  [v13 setActive:1];
}

+ (CGSize)preferredSizeForSectionName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)UILabel);
  v5 = +[CHAchievementsSectionHeaderView headerFont];
  [v4 setFont:v5];

  [v4 setNumberOfLines:0];
  [v4 setLineBreakMode:0];
  [v4 setText:v3];

  v6 = +[UIScreen mainScreen];
  [v6 bounds];
  CGFloat v7 = CGRectGetWidth(v13) - 16.0;

  [v4 systemLayoutSizeFittingSize:v7];
  double v9 = v8 + 27.5;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)headerFont
{
  v2 = +[CHAchievementsSectionHeaderView _headerConfiguration];
  id v3 = [v2 textProperties];
  id v4 = [v3 font];

  return v4;
}

- (void)configureWithSectionName:(id)a3
{
  id v4 = a3;
  id v5 = [(CHAchievementsSectionHeaderView *)self label];
  [v5 setText:v4];
}

+ (id)_headerConfiguration
{
  return +[UIListContentConfiguration extraProminentInsetGroupedHeaderConfiguration];
}

- (BOOL)hidesKeyLine
{
  return self->_hidesKeyLine;
}

- (UIView)keyLineView
{
  return self->_keyLineView;
}

- (void)setKeyLineView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSLayoutConstraint)labelBaselineConstraint
{
  return self->_labelBaselineConstraint;
}

- (void)setLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelLeadingConstraint
{
  return self->_labelLeadingConstraint;
}

- (void)setLabelLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelTrailingConstraint
{
  return self->_labelTrailingConstraint;
}

- (void)setLabelTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)keyLineLeadingConstraint
{
  return self->_keyLineLeadingConstraint;
}

- (void)setKeyLineLeadingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLineLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_labelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_labelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_labelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_keyLineView, 0);
}

@end