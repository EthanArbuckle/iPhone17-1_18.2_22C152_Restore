@interface CarplayLocationTableViewCell
- (CarplayLocationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_titleFont;
- (void)cellWasTapped;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)updateWithEvent:(id)a3;
@end

@implementation CarplayLocationTableViewCell

- (CarplayLocationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v38.receiver = self;
  v38.super_class = (Class)CarplayLocationTableViewCell;
  v4 = [(CarplayLocationTableViewCell *)&v38 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    label = v4->_label;
    v4->_label = (UILabel *)v5;

    v7 = +[UIColor labelColor];
    [(UILabel *)v4->_label setTextColor:v7];

    v8 = +[UIColor _carSystemFocusLabelColor];
    [(UILabel *)v4->_label setHighlightedTextColor:v8];

    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(CarplayLocationTableViewCell *)v4 _titleFont];
    [(UILabel *)v4->_label setFont:v9];

    [(CarplayLocationTableViewCell *)v4 addSubview:v4->_label];
    v10 = +[UIImage systemImageNamed:@"arrow.triangle.turn.up.right.circle.fill"];
    v37 = [v10 imageFlippedForRightToLeftLayoutDirection];

    v11 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v37];
    icon = v4->_icon;
    v4->_icon = v11;

    v13 = +[UIColor labelColor];
    [(UIImageView *)v4->_icon setTintColor:v13];

    [(UIImageView *)v4->_icon setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleCallout scale:3];
    [(UIImageView *)v4->_icon setPreferredSymbolConfiguration:v14];

    [(CarplayLocationTableViewCell *)v4 addSubview:v4->_icon];
    v36 = [(UILabel *)v4->_label leadingAnchor];
    v35 = [(CarplayLocationTableViewCell *)v4 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:12.0];
    v39[0] = v34;
    v33 = [(UIImageView *)v4->_icon leadingAnchor];
    v32 = [(UILabel *)v4->_label trailingAnchor];
    v31 = [v33 constraintGreaterThanOrEqualToAnchor:v32 constant:12.0];
    v39[1] = v31;
    v30 = [(CarplayLocationTableViewCell *)v4 bottomAnchor];
    v29 = [(UILabel *)v4->_label bottomAnchor];
    v28 = [v30 constraintEqualToSystemSpacingBelowAnchor:v29 multiplier:1.0];
    v39[2] = v28;
    v27 = [(UILabel *)v4->_label topAnchor];
    v26 = [(CarplayLocationTableViewCell *)v4 topAnchor];
    v25 = [v27 constraintEqualToSystemSpacingBelowAnchor:v26 multiplier:1.0];
    v39[3] = v25;
    v15 = [(CarplayLocationTableViewCell *)v4 trailingAnchor];
    v16 = [(UIImageView *)v4->_icon centerXAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:23.0];
    v39[4] = v17;
    v18 = [(UIImageView *)v4->_icon centerYAnchor];
    v19 = [(CarplayLocationTableViewCell *)v4 centerYAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v39[5] = v20;
    v21 = [(CarplayLocationTableViewCell *)v4 heightAnchor];
    v22 = [v21 constraintGreaterThanOrEqualToConstant:44.0];
    v39[6] = v22;
    v23 = +[NSArray arrayWithObjects:v39 count:7];
    +[NSLayoutConstraint activateConstraints:v23];
  }
  return v4;
}

- (id)_titleFont
{
  v2 = [(CarplayLocationTableViewCell *)self traitCollection];
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout compatibleWithTraitCollection:v2];

  v4 = [v3 fontDescriptorWithSymbolicTraits:0x8000];

  uint64_t v5 = +[UIFont fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (void)updateWithEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
  id v5 = a3;
  id v6 = [v5 location];
  [(UILabel *)self->_label setText:v6];
  [(UILabel *)self->_label setNumberOfLines:+[CarplayUtilities numberOfLinesInString:v6]];
}

- (void)cellWasTapped
{
  v3 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Location cell was tapped", v7, 2u);
  }
  v4 = +[EKMapsUtilities mapsURLForLocation:0 onEvent:self->_event hasMapItemLaunchOptionFromTimeToLeaveNotification:0];
  if (v4)
  {
    id v5 = [(CarplayLocationTableViewCell *)self window];
    id v6 = [v5 windowScene];
    [v6 openURL:v4 options:0 completionHandler:&stru_1001D6108];
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CarplayLocationTableViewCell;
  [(CarplayLocationTableViewCell *)&v7 setHighlighted:a3 animated:a4];
  if (v4) {
    +[UIColor _carSystemFocusLabelColor];
  }
  else {
  id v6 = +[UIColor labelColor];
  }
  [(UIImageView *)self->_icon setTintColor:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end