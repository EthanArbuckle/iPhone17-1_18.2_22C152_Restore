@interface MapsGroupedTableHeaderView
- (MapsGroupedTableHeaderView)initWithReuseIdentifier:(id)a3;
- (UILabel)titleLabel;
- (void)_contentSizeChanged:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupConstraints;
- (void)updateAXIdentifiersWithPrefix:(id)a3;
@end

@implementation MapsGroupedTableHeaderView

- (MapsGroupedTableHeaderView)initWithReuseIdentifier:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)MapsGroupedTableHeaderView;
  v3 = [(MapsGroupedTableHeaderView *)&v26 initWithReuseIdentifier:a3];
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 1148846080;
    [(MapsGroupedTableHeaderView *)v3 setContentHuggingPriority:1 forAxis:v4];
    [(MapsGroupedTableHeaderView *)v5 setAccessibilityIdentifier:@"MapsGroupedTableHeader"];
    id v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(MapsGroupedTableHeaderView *)v5 setTitleLabel:v6];

    v7 = [(MapsGroupedTableHeaderView *)v5 titleLabel];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = +[RAPFontManager tableHeaderViewFont];
    v9 = [(MapsGroupedTableHeaderView *)v5 titleLabel];
    [v9 setFont:v8];

    v10 = +[UIColor systemGrayColor];
    v11 = [(MapsGroupedTableHeaderView *)v5 titleLabel];
    [v11 setTextColor:v10];

    v12 = [(MapsGroupedTableHeaderView *)v5 titleLabel];
    [v12 setNumberOfLines:0];

    v13 = [(MapsGroupedTableHeaderView *)v5 titleLabel];
    [v13 setAccessibilityIdentifier:@"MapsGroupedTableHeaderTitle"];

    v14 = [(MapsGroupedTableHeaderView *)v5 contentView];
    v15 = [(MapsGroupedTableHeaderView *)v5 titleLabel];
    [v14 addSubview:v15];

    v16 = [(MapsGroupedTableHeaderView *)v5 titleLabel];
    LODWORD(v17) = 1148846080;
    [v16 setContentHuggingPriority:1 forAxis:v17];

    v18 = [(MapsGroupedTableHeaderView *)v5 titleLabel];
    LODWORD(v19) = 1148846080;
    [v18 setContentCompressionResistancePriority:1 forAxis:v19];

    [(MapsGroupedTableHeaderView *)v5 setupConstraints];
    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v5 selector:"_contentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

    v21 = +[UIDevice currentDevice];
    id v22 = [v21 userInterfaceIdiom];

    if (v22 == (id)5)
    {
      v23 = +[UIColor systemBackgroundColor];
      v24 = [(MapsGroupedTableHeaderView *)v5 contentView];
      [v24 setBackgroundColor:v23];
    }
  }
  return v5;
}

- (void)setupConstraints
{
  v3 = [(MapsGroupedTableHeaderView *)self titleLabel];
  double v4 = [v3 firstBaselineAnchor];
  v5 = [(MapsGroupedTableHeaderView *)self contentView];
  id v6 = [v5 topAnchor];
  v7 = +[RAPFontManager tableHeaderViewFont];
  [v7 _mapkit_scaledValueForValue:38.0];
  [v4 constraintEqualToAnchor:v6];
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v8;

  LODWORD(v10) = 1144750080;
  [(NSLayoutConstraint *)self->_topToFirstBaselineConstraint setPriority:v10];
  v11 = [(MapsGroupedTableHeaderView *)self contentView];
  v12 = [v11 bottomAnchor];
  v13 = [(MapsGroupedTableHeaderView *)self titleLabel];
  v14 = [v13 lastBaselineAnchor];
  v15 = +[RAPFontManager tableHeaderViewFont];
  [v15 _mapkit_scaledValueForValue:11.0];
  [v12 constraintGreaterThanOrEqualToAnchor:v14];
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v16;

  LODWORD(v18) = 1144750080;
  [(NSLayoutConstraint *)self->_lastBaselineToBottomConstraint setPriority:v18];
  double v19 = self->_lastBaselineToBottomConstraint;
  v33[0] = self->_topToFirstBaselineConstraint;
  v33[1] = v19;
  v32 = [(MapsGroupedTableHeaderView *)self titleLabel];
  v30 = [v32 leadingAnchor];
  v31 = [(MapsGroupedTableHeaderView *)self contentView];
  v20 = [v31 layoutMarginsGuide];
  v21 = [v20 leadingAnchor];
  id v22 = [v30 constraintEqualToAnchor:v21];
  v33[2] = v22;
  v23 = [(MapsGroupedTableHeaderView *)self titleLabel];
  v24 = [v23 trailingAnchor];
  v25 = [(MapsGroupedTableHeaderView *)self contentView];
  objc_super v26 = [v25 layoutMarginsGuide];
  v27 = [v26 trailingAnchor];
  v28 = [v24 constraintLessThanOrEqualToAnchor:v27];
  v33[3] = v28;
  v29 = +[NSArray arrayWithObjects:v33 count:4];
  +[NSLayoutConstraint activateConstraints:v29];
}

- (void)_contentSizeChanged:(id)a3
{
  double v4 = +[RAPFontManager tableHeaderViewFont];
  v5 = [(MapsGroupedTableHeaderView *)self titleLabel];
  [v5 setFont:v4];

  id v6 = +[RAPFontManager tableHeaderViewFont];
  [v6 _mapkit_scaledValueForValue:38.0];
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  id v7 = +[RAPFontManager tableHeaderViewFont];
  [v7 _mapkit_scaledValueForValue:11.0];
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");
}

- (void)updateAXIdentifiersWithPrefix:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringByAppendingString:@"TableHeader"];
  [(MapsGroupedTableHeaderView *)self setAccessibilityIdentifier:v5];

  id v7 = [v4 stringByAppendingString:@"TableHeaderTitle"];

  id v6 = [(MapsGroupedTableHeaderView *)self titleLabel];
  [v6 setAccessibilityIdentifier:v7];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);

  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
}

@end