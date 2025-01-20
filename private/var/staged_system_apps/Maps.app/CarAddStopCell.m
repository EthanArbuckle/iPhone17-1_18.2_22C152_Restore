@interface CarAddStopCell
- (CarAddStopCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_setupConstraints;
- (void)_updateAppearanceWithFocus:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CarAddStopCell

- (CarAddStopCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)CarAddStopCell;
  v4 = [(CarAddStopCell *)&v26 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CarAddStopCell *)v4 setAccessibilityIdentifier:@"CarAddStopCell"];
    id v6 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectMake(0, 0, width, height)];
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = v10;

    [(UIImageView *)v5->_iconImageView setAccessibilityIdentifier:@"IconImageView"];
    [(UIImageView *)v5->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1148846080;
    [(UIImageView *)v5->_iconImageView setContentCompressionResistancePriority:1 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(UIImageView *)v5->_iconImageView setContentCompressionResistancePriority:0 forAxis:v13];
    [(UIImageView *)v5->_iconImageView setContentMode:1];
    v14 = +[UIImage _mapsCar_systemImageNamed:@"plus.circle.fill" textStyle:UIFontTextStyleTitle3];
    [(UIImageView *)v5->_iconImageView setImage:v14];

    v15 = [(CarAddStopCell *)v5 contentView];
    [v15 addSubview:v5->_iconImageView];

    v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    addStopLabel = v5->_addStopLabel;
    v5->_addStopLabel = v16;

    [(UILabel *)v5->_addStopLabel setAccessibilityIdentifier:@"AddStopLabel"];
    [(UILabel *)v5->_addStopLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v18) = 1148846080;
    [(UILabel *)v5->_addStopLabel setContentCompressionResistancePriority:1 forAxis:v18];
    LODWORD(v19) = 1144750080;
    [(UILabel *)v5->_addStopLabel setContentCompressionResistancePriority:0 forAxis:v19];
    [(UILabel *)v5->_addStopLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v5->_addStopLabel setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)v5->_addStopLabel setMinimumScaleFactor:0.800000012];
    [(UILabel *)v5->_addStopLabel setNumberOfLines:2];
    v20 = [(CarAddStopCell *)v5 traitCollection];
    v21 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout compatibleWithTraitCollection:v20];
    [(UILabel *)v5->_addStopLabel setFont:v21];

    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"CarPlay_AddStop" value:@"localized string not found" table:0];
    [(UILabel *)v5->_addStopLabel setText:v23];

    v24 = [(CarAddStopCell *)v5 contentView];
    [v24 addSubview:v5->_addStopLabel];

    [(CarAddStopCell *)v5 _setupConstraints];
    [(CarAddStopCell *)v5 _updateAppearanceWithFocus:0];
  }
  return v5;
}

- (void)_setupConstraints
{
  v30 = [(UIImageView *)self->_iconImageView leadingAnchor];
  v29 = [(CarAddStopCell *)self leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:6.0];
  v31[0] = v28;
  v27 = [(UIImageView *)self->_iconImageView centerYAnchor];
  objc_super v26 = [(CarAddStopCell *)self centerYAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v31[1] = v25;
  v24 = [(UIImageView *)self->_iconImageView topAnchor];
  v23 = [(CarAddStopCell *)self topAnchor];
  v22 = [v24 constraintGreaterThanOrEqualToAnchor:v23];
  v31[2] = v22;
  v21 = [(UIImageView *)self->_iconImageView bottomAnchor];
  v20 = [(CarAddStopCell *)self bottomAnchor];
  double v19 = [v21 constraintLessThanOrEqualToAnchor:v20];
  v31[3] = v19;
  double v18 = [(UILabel *)self->_addStopLabel leadingAnchor];
  v17 = [(UIImageView *)self->_iconImageView trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17 constant:6.0];
  v31[4] = v16;
  v15 = [(UILabel *)self->_addStopLabel centerYAnchor];
  v14 = [(CarAddStopCell *)self centerYAnchor];
  double v13 = [v15 constraintEqualToAnchor:v14];
  v31[5] = v13;
  v3 = [(UILabel *)self->_addStopLabel trailingAnchor];
  v4 = [(CarAddStopCell *)self trailingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4 constant:-6.0];
  v31[6] = v5;
  id v6 = [(UILabel *)self->_addStopLabel topAnchor];
  v7 = [(CarAddStopCell *)self topAnchor];
  v8 = [v6 constraintGreaterThanOrEqualToAnchor:v7];
  v31[7] = v8;
  v9 = [(UILabel *)self->_addStopLabel bottomAnchor];
  v10 = [(CarAddStopCell *)self bottomAnchor];
  v11 = [v9 constraintLessThanOrEqualToAnchor:v10];
  v31[8] = v11;
  double v12 = +[NSArray arrayWithObjects:v31 count:9];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_updateAppearanceWithFocus:(BOOL)a3
{
  if (a3)
  {
    v4 = +[UIColor _carSystemFocusLabelColor];
    [(UIImageView *)self->_iconImageView setTintColor:v4];

    +[UIColor _carSystemFocusLabelColor];
  }
  else
  {
    v5 = +[UIColor labelColor];
    [(UIImageView *)self->_iconImageView setTintColor:v5];

    +[UIColor labelColor];
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_addStopLabel setTextColor:v6];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarAddStopCell;
  [(CarAddStopCell *)&v6 setHighlighted:a3 animated:a4];
  [(CarAddStopCell *)self _updateAppearanceWithFocus:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addStopLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end