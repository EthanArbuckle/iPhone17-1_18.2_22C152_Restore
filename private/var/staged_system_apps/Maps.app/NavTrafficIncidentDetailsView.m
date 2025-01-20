@interface NavTrafficIncidentDetailsView
- (NSString)primaryLabelText;
- (NSString)secondaryLabelText;
- (NavTrafficIncidentDetailsView)initWithFrame:(CGRect)a3;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (id)_initialConstraints;
- (void)_setupViews;
- (void)setPrimaryLabel:(id)a3;
- (void)setPrimaryLabelText:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSecondaryLabelText:(id)a3;
@end

@implementation NavTrafficIncidentDetailsView

- (NavTrafficIncidentDetailsView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NavTrafficIncidentDetailsView;
  v3 = -[NavTrafficIncidentDetailsView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NavTrafficIncidentDetailsView *)v3 _setupViews];
    [(NavTrafficIncidentDetailsView *)v4 setAccessibilityIdentifier:@"NavTrafficIncidentDetailsView"];
    v5 = [(NavTrafficIncidentDetailsView *)v4 _initialConstraints];
    +[NSLayoutConstraint activateConstraints:v5];
  }
  return v4;
}

- (void)_setupViews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v7 = (UILabel *)[v3 initWithFrame:CGRectMake(0, 0, width, height)];
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v7;

  [(UILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = +[UIFont _maps_systemFontWithFixedSize:20.0];
  [(UILabel *)self->_primaryLabel setFont:v9];

  [(UILabel *)self->_primaryLabel setNumberOfLines:0];
  [(UILabel *)self->_primaryLabel setLineBreakStrategy:0];
  v10 = +[UIColor labelColor];
  [(UILabel *)self->_primaryLabel setTextColor:v10];

  [(UILabel *)self->_primaryLabel setAccessibilityIdentifier:@"PrimaryLabel"];
  [(NavTrafficIncidentDetailsView *)self addSubview:self->_primaryLabel];
  v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v11;

  [(UILabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = +[UIFont _maps_systemFontWithFixedSize:20.0];
  [(UILabel *)self->_secondaryLabel setFont:v13];

  [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
  [(UILabel *)self->_secondaryLabel setLineBreakStrategy:0];
  v14 = +[UIColor labelColor];
  [(UILabel *)self->_secondaryLabel setTextColor:v14];

  [(UILabel *)self->_secondaryLabel setAccessibilityIdentifier:@"SecondaryLabel"];
  v15 = self->_secondaryLabel;

  [(NavTrafficIncidentDetailsView *)self addSubview:v15];
}

- (id)_initialConstraints
{
  v25 = [(UILabel *)self->_primaryLabel leadingAnchor];
  v24 = [(NavTrafficIncidentDetailsView *)self leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:21.0];
  v26[0] = v23;
  v22 = [(UILabel *)self->_primaryLabel trailingAnchor];
  v21 = [(NavTrafficIncidentDetailsView *)self trailingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21 constant:-16.0];
  v26[1] = v20;
  v19 = [(UILabel *)self->_secondaryLabel leadingAnchor];
  v18 = [(UILabel *)self->_primaryLabel leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v26[2] = v17;
  v16 = [(UILabel *)self->_secondaryLabel trailingAnchor];
  v15 = [(UILabel *)self->_primaryLabel trailingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v26[3] = v14;
  id v3 = [(UILabel *)self->_primaryLabel firstBaselineAnchor];
  v4 = [(NavTrafficIncidentDetailsView *)self topAnchor];
  v5 = [v3 constraintEqualToAnchor:v4 constant:40.0];
  v26[4] = v5;
  v6 = [(UILabel *)self->_secondaryLabel firstBaselineAnchor];
  objc_super v7 = [(UILabel *)self->_primaryLabel lastBaselineAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:44.0];
  v26[5] = v8;
  v9 = [(NavTrafficIncidentDetailsView *)self bottomAnchor];
  v10 = [(UILabel *)self->_secondaryLabel lastBaselineAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:35.0];
  v26[6] = v11;
  v12 = +[NSArray arrayWithObjects:v26 count:7];

  return v12;
}

- (NSString)primaryLabelText
{
  return [(UILabel *)self->_primaryLabel text];
}

- (NSString)secondaryLabelText
{
  return [(UILabel *)self->_secondaryLabel text];
}

- (void)setPrimaryLabelText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc_init((Class)NSMutableParagraphStyle);
    v6 = +[UIFont _maps_systemFontWithFixedSize:20.0];
    [v6 lineHeight];
    [v5 setLineSpacing:24.0 - v7];

    id v8 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v11 = NSParagraphStyleAttributeName;
    id v12 = v5;
    v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = [v8 initWithString:v4 attributes:v9];
    [(UILabel *)self->_primaryLabel setAttributedText:v10];
  }
  else
  {
    [(UILabel *)self->_primaryLabel setAttributedText:0];
  }
}

- (void)setSecondaryLabelText:(id)a3
{
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);

  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end