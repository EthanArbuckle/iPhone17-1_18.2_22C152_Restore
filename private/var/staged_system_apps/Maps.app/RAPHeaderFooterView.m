@interface RAPHeaderFooterView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (NSString)titleLabelText;
- (RAPHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (UILabel)titleLabel;
- (double)bottomPadding;
- (id)_initialConstraints;
- (void)_createSubviews;
- (void)contentSizeDidChange;
- (void)layoutSubviews;
- (void)setTitleLabelText:(id)a3;
@end

@implementation RAPHeaderFooterView

- (RAPHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RAPHeaderFooterView;
  v3 = [(RAPHeaderFooterView *)&v12 initWithReuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    [(RAPHeaderFooterView *)v3 _createSubviews];
    v5 = [(RAPHeaderFooterView *)v4 _initialConstraints];
    +[NSLayoutConstraint activateConstraints:v5];

    id v6 = objc_alloc_init((Class)NSMutableParagraphStyle);
    LODWORD(v7) = 1.0;
    [v6 setHyphenationFactor:v7];
    NSAttributedStringKey v13 = NSParagraphStyleAttributeName;
    id v14 = v6;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    attributes = v4->_attributes;
    v4->_attributes = (NSDictionary *)v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v4 selector:"contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v4;
}

- (void)contentSizeDidChange
{
  v3 = +[RAPFontManager regularTitleFont];
  [v3 _mapkit_scaledValueForValue:38.0];
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  v4 = +[RAPFontManager regularTitleFont];
  [v4 _mapkit_scaledValueForValue:-11.0];
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");

  [(RAPHeaderFooterView *)self setNeedsLayout];
}

- (void)_createSubviews
{
  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(RAPHeaderFooterView *)self contentView];
  [v5 addSubview:self->_titleLabel];

  id v6 = +[RAPFontManager regularTitleFont];
  [(UILabel *)self->_titleLabel setFont:v6];

  double v7 = +[UIColor systemGrayColor];
  [(UILabel *)self->_titleLabel setTextColor:v7];

  uint64_t v8 = [(RAPHeaderFooterView *)self traitCollection];
  id v9 = [v8 userInterfaceIdiom];

  if (v9 != (id)5) {
    [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  }
  v10 = self->_titleLabel;

  [(UILabel *)v10 setNumberOfLines:0];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  v3 = [(RAPHeaderFooterView *)self contentView];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)bottomPadding
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  double v4 = -1.0 / v3;

  return v4 + 7.0;
}

- (id)_initialConstraints
{
  v27 = +[NSMutableArray array];
  double v3 = [(UILabel *)self->_titleLabel trailingAnchor];
  double v4 = [(RAPHeaderFooterView *)self contentView];
  double v5 = [v4 trailingAnchor];
  double v6 = [v3 constraintLessThanOrEqualToAnchor:v5];

  LODWORD(v7) = 1148829696;
  [v6 setPriority:v7];
  double v8 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  double v9 = [(RAPHeaderFooterView *)self contentView];
  v10 = [v9 topAnchor];
  v11 = +[RAPFontManager regularTitleFont];
  [v11 _mapkit_scaledValueForValue:38.0];
  [v8 constraintEqualToAnchor:v10];
  objc_super v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v12;

  id v14 = [(UILabel *)self->_titleLabel lastBaselineAnchor];
  v15 = [(RAPHeaderFooterView *)self contentView];
  v16 = [v15 bottomAnchor];
  v17 = +[RAPFontManager regularTitleFont];
  [v17 _mapkit_scaledValueForValue:-11.0];
  [v14 constraintEqualToAnchor:v16];
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v18;

  v28[0] = self->_topToFirstBaselineConstraint;
  v20 = [(UILabel *)self->_titleLabel leadingAnchor];
  v21 = [(RAPHeaderFooterView *)self contentView];
  v22 = [v21 leadingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:16.0];
  v24 = self->_lastBaselineToBottomConstraint;
  v28[1] = v23;
  v28[2] = v24;
  v28[3] = v6;
  v25 = +[NSArray arrayWithObjects:v28 count:4];
  [v27 addObjectsFromArray:v25];

  return v27;
}

- (void)setTitleLabelText:(id)a3
{
  id v9 = a3;
  if (([v9 isEqualToString:self->_titleLabelText] & 1) == 0)
  {
    double v4 = (NSString *)[v9 copy];
    titleLabelText = self->_titleLabelText;
    self->_titleLabelText = v4;

    id v6 = objc_alloc((Class)NSAttributedString);
    if (self->_titleLabelText) {
      CFStringRef v7 = (const __CFString *)self->_titleLabelText;
    }
    else {
      CFStringRef v7 = &stru_101324E70;
    }
    id v8 = [v6 initWithString:v7 attributes:self->_attributes];
    [(UILabel *)self->_titleLabel setAttributedText:v8];
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)RAPHeaderFooterView;
  [(RAPHeaderFooterView *)&v5 layoutSubviews];
  double v3 = +[UIColor systemGrayColor];
  [(UILabel *)self->_titleLabel setTextColor:v3];

  double v4 = +[RAPFontManager regularTitleFont];
  [(UILabel *)self->_titleLabel setFont:v4];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSString)titleLabelText
{
  return self->_titleLabelText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelText, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end