@interface RAPSingleLineTableViewCell
+ (NSString)reuseIdentifier;
- (RAPSingleLineTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)textLabel;
- (void)_contentSizeChanged;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateConstraints;
- (void)_updateFonts;
@end

@implementation RAPSingleLineTableViewCell

- (RAPSingleLineTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)RAPSingleLineTableViewCell;
  v4 = [(RAPSingleLineTableViewCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(RAPSingleLineTableViewCell *)v4 setAccessibilityIdentifier:v6];

    v7 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    textLabel = v4->_textLabel;
    v4->_textLabel = v7;

    [(RAPSingleLineTableViewCell *)v4 _setupSubviews];
    [(RAPSingleLineTableViewCell *)v4 _setupConstraints];
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v4 selector:"_contentSizeChanged" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v4;
}

- (void)_setupSubviews
{
  [(UILabel *)self->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_textLabel setNumberOfLines:0];
  [(UILabel *)self->_textLabel setAccessibilityIdentifier:@"TextLabel"];
  v3 = [(RAPSingleLineTableViewCell *)self contentView];
  [v3 addSubview:self->_textLabel];

  [(RAPSingleLineTableViewCell *)self _updateFonts];
}

- (void)_setupConstraints
{
  v3 = [(RAPSingleLineTableViewCell *)self contentView];
  v4 = [(UILabel *)self->_textLabel firstBaselineAnchor];
  v5 = [v3 topAnchor];
  v6 = [(UILabel *)self->_textLabel font];
  [v6 _scaledValueForValue:33.0];
  [v4 constraintEqualToAnchor:v5];
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v7;

  v9 = [(UILabel *)self->_textLabel lastBaselineAnchor];
  v10 = [v3 bottomAnchor];
  objc_super v11 = [(UILabel *)self->_textLabel font];
  [v11 _scaledValueForValue:-22.0];
  [v9 constraintEqualToAnchor:v10];
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v12;

  v14 = [(UILabel *)self->_textLabel leadingAnchor];
  v15 = [v3 leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:15.0];
  v22[0] = v16;
  v17 = [(UILabel *)self->_textLabel trailingAnchor];
  v18 = [v3 trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:-15.0];
  v20 = self->_topToFirstBaselineConstraint;
  v22[1] = v19;
  v22[2] = v20;
  v22[3] = self->_lastBaselineToBottomConstraint;
  v21 = +[NSArray arrayWithObjects:v22 count:4];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (void)_contentSizeChanged
{
  [(RAPSingleLineTableViewCell *)self _updateFonts];

  [(RAPSingleLineTableViewCell *)self _updateConstraints];
}

- (void)_updateFonts
{
  id v3 = +[UIFont system17];
  [(UILabel *)self->_textLabel setFont:v3];
}

- (void)_updateConstraints
{
  id v3 = [(UILabel *)self->_textLabel font];
  [v3 _scaledValueForValue:33.0];
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  id v4 = [(UILabel *)self->_textLabel font];
  [v4 _scaledValueForValue:-22.0];
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"RAPSingleLineTableViewCell";
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);

  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
}

@end