@interface MailActionHorizontalGroupedCell
+ (id)reusableIdentifier;
- (BOOL)isHorizontalActionCell;
- (MFMessageDisplayMetrics)displayMetrics;
- (NSLayoutConstraint)baselineToBaselineConstraint;
- (NSLayoutConstraint)topToBaselineConstraint;
- (void)configureConstraints;
- (void)setBaselineToBaselineConstraint:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setTopToBaselineConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation MailActionHorizontalGroupedCell

+ (id)reusableIdentifier
{
  return @"MailActionHorizontalGroupedCellIdentifier";
}

- (void)configureConstraints
{
  id v24 = [(MailActionHorizontalGroupedCell *)self contentView];
  v3 = objc_opt_new();
  [(MailActionHorizontalGroupedCell *)self setDisplayMetrics:v3];
  v4 = +[NSMutableArray array];
  v5 = [(MailActionCell *)self imageView];
  v6 = [v5 centerXAnchor];
  v7 = [v24 centerXAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  [v4 addObject:v8];

  v9 = [v5 firstBaselineAnchor];
  v10 = [v24 topAnchor];
  [v3 topToGlyphBaselineInMailActionCardHorizontalGroup];
  v11 = [v9 constraintEqualToAnchor:v10];
  [(MailActionHorizontalGroupedCell *)self setTopToBaselineConstraint:v11];

  v12 = [(MailActionHorizontalGroupedCell *)self topToBaselineConstraint];
  [v4 addObject:v12];

  v13 = [(MailActionCell *)self titleLabel];
  [v13 setTextAlignment:1];
  [v13 setLineBreakMode:0];
  [v13 setAllowsDefaultTighteningForTruncation:1];
  v14 = [v13 leadingAnchor];
  v15 = [v24 leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:5.0];
  [v4 addObject:v16];

  v17 = [v13 trailingAnchor];
  v18 = [v24 trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:-5.0];
  [v4 addObject:v19];

  v20 = [v13 firstBaselineAnchor];
  v21 = [v5 firstBaselineAnchor];
  [v3 baselineToBaselineSpacingInMailActionCardHorizontalGroup];
  v22 = [v20 constraintEqualToAnchor:v21];
  [(MailActionHorizontalGroupedCell *)self setBaselineToBaselineConstraint:v22];

  v23 = [(MailActionHorizontalGroupedCell *)self baselineToBaselineConstraint];
  [v4 addObject:v23];

  +[NSLayoutConstraint activateConstraints:v4];
}

- (void)updateConstraints
{
  v10.receiver = self;
  v10.super_class = (Class)MailActionHorizontalGroupedCell;
  [(MailActionHorizontalGroupedCell *)&v10 updateConstraints];
  v3 = [(MailActionHorizontalGroupedCell *)self displayMetrics];
  [v3 topToGlyphBaselineInMailActionCardHorizontalGroup];
  double v5 = v4;
  v6 = [(MailActionHorizontalGroupedCell *)self topToBaselineConstraint];
  [v6 setConstant:v5];

  [v3 baselineToBaselineSpacingInMailActionCardHorizontalGroup];
  double v8 = v7;
  v9 = [(MailActionHorizontalGroupedCell *)self baselineToBaselineConstraint];
  [v9 setConstant:v8];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailActionHorizontalGroupedCell;
  [(MailActionCell *)&v5 traitCollectionDidChange:v4];
  [(MailActionHorizontalGroupedCell *)self setNeedsUpdateConstraints];
}

- (BOOL)isHorizontalActionCell
{
  return 1;
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void)setDisplayMetrics:(id)a3
{
}

- (NSLayoutConstraint)topToBaselineConstraint
{
  return self->_topToBaselineConstraint;
}

- (void)setTopToBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)baselineToBaselineConstraint
{
  return self->_baselineToBaselineConstraint;
}

- (void)setBaselineToBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baselineToBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topToBaselineConstraint, 0);

  objc_storeStrong((id *)&self->_displayMetrics, 0);
}

@end