@interface VehicleConnectorCell
- (BOOL)isActive;
- (UIImageView)iconView;
- (UILabel)nameLabel;
- (UILabel)powerLabel;
- (VehicleConnectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (unint64_t)connectorType;
- (void)_setup;
- (void)setActive:(BOOL)a3;
- (void)setConnectorType:(unint64_t)a3;
- (void)setIconView:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPowerLabel:(id)a3;
@end

@implementation VehicleConnectorCell

- (VehicleConnectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VehicleConnectorCell;
  v4 = [(VehicleConnectorCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(VehicleConnectorCell *)v4 _setup];
    [(VehicleConnectorCell *)v5 setAccessibilityIdentifier:@"VehicleConnectorCell"];
  }
  return v5;
}

- (void)_setup
{
  [(VehicleConnectorCell *)self setSelectionStyle:0];
  v3 = (UIImageView *)objc_opt_new();
  iconView = self->_iconView;
  self->_iconView = v3;

  [(UIImageView *)self->_iconView setAccessibilityIdentifier:@"IconView"];
  [(UIImageView *)self->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[UIColor systemGray2Color];
  [(UIImageView *)self->_iconView setTintColor:v5];

  [(UIImageView *)self->_iconView setContentMode:1];
  v6 = (UILabel *)objc_opt_new();
  nameLabel = self->_nameLabel;
  self->_nameLabel = v6;

  [(UILabel *)self->_nameLabel setAccessibilityIdentifier:@"NameLabel"];
  [(UILabel *)self->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = +[UIColor labelColor];
  [(UILabel *)self->_nameLabel setTextColor:v8];

  v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_nameLabel setFont:v9];

  v10 = (UILabel *)objc_opt_new();
  powerLabel = self->_powerLabel;
  self->_powerLabel = v10;

  [(UILabel *)self->_powerLabel setAccessibilityIdentifier:@"PowerLabel"];
  [(UILabel *)self->_powerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_powerLabel setTextColor:v12];

  v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [(UILabel *)self->_powerLabel setFont:v13];

  v14 = [(VehicleConnectorCell *)self contentView];
  [v14 addSubview:self->_iconView];

  v15 = [(VehicleConnectorCell *)self contentView];
  [v15 addSubview:self->_nameLabel];

  v16 = [(VehicleConnectorCell *)self contentView];
  [v16 addSubview:self->_powerLabel];

  v47 = [(UIImageView *)self->_iconView leadingAnchor];
  v48 = [(VehicleConnectorCell *)self contentView];
  v46 = [v48 leadingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46 constant:16.0];
  v49[0] = v45;
  v43 = [(UIImageView *)self->_iconView centerYAnchor];
  v44 = [(VehicleConnectorCell *)self contentView];
  v42 = [v44 centerYAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v49[1] = v41;
  v40 = [(UIImageView *)self->_iconView widthAnchor];
  v39 = [v40 constraintEqualToConstant:30.0];
  v49[2] = v39;
  v38 = [(UILabel *)self->_nameLabel leadingAnchor];
  v37 = [(UIImageView *)self->_iconView trailingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:10.0];
  v49[3] = v36;
  v34 = [(UILabel *)self->_nameLabel topAnchor];
  v35 = [(VehicleConnectorCell *)self contentView];
  v33 = [v35 topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:16.0];
  v49[4] = v32;
  v30 = [(UILabel *)self->_nameLabel trailingAnchor];
  v31 = [(VehicleConnectorCell *)self contentView];
  v29 = [v31 trailingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:-16.0];
  v49[5] = v28;
  v27 = [(UILabel *)self->_powerLabel leadingAnchor];
  v17 = [(UIImageView *)self->_iconView trailingAnchor];
  v18 = [v27 constraintEqualToAnchor:v17 constant:10.0];
  v49[6] = v18;
  v19 = [(UILabel *)self->_powerLabel topAnchor];
  v20 = [(UILabel *)self->_nameLabel bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 constant:3.0];
  v49[7] = v21;
  v22 = [(UILabel *)self->_powerLabel trailingAnchor];
  v23 = [(VehicleConnectorCell *)self contentView];
  v24 = [v23 trailingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24 constant:-16.0];
  v49[8] = v25;
  v26 = +[NSArray arrayWithObjects:v49 count:9];
  +[NSLayoutConstraint activateConstraints:v26];
}

- (void)setConnectorType:(unint64_t)a3
{
  if (self->_connectorType == a3) {
    return;
  }
  self->_connectorType = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [(VehicleConnectorCell *)self traitCollection];
  id v7 = v5;
  id v8 = v6;
  if ((uint64_t)a3 > 31)
  {
LABEL_5:
    uint64_t v10 = objc_opt_new();
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        CFStringRef v9 = @"Plug_J1772";
        break;
      case 2uLL:
        CFStringRef v9 = @"Plug_CCS1";
        break;
      case 4uLL:
        CFStringRef v9 = @"Plug_CCS2";
        break;
      case 8uLL:
        CFStringRef v9 = @"Plug_CHAdeMO";
        break;
      default:
        goto LABEL_5;
    }
    uint64_t v10 = +[UIImage imageNamed:v9 inBundle:v7 compatibleWithTraitCollection:v8];
  }
  v11 = (void *)v10;

  v12 = [(VehicleConnectorCell *)self iconView];
  [v12 setImage:v11];

  v13 = sub_10082A298(a3);
  v14 = [(VehicleConnectorCell *)self nameLabel];
  [v14 setText:v13];

  id v19 = 0;
  if ((uint64_t)a3 <= 31)
  {
    switch(a3)
    {
      case 1uLL:
        goto LABEL_21;
      case 2uLL:
      case 4uLL:
      case 8uLL:
        goto LABEL_16;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_23;
      default:
        if (a3 == 16) {
          goto LABEL_21;
        }
        break;
    }
    goto LABEL_23;
  }
  if ((uint64_t)a3 > 127)
  {
    if (a3 == 256 || a3 == 128)
    {
LABEL_21:
      v15 = +[NSBundle mainBundle];
      v16 = v15;
      CFStringRef v17 = @"EV_Routing_AC_Power";
      goto LABEL_22;
    }
  }
  else
  {
    if (a3 == 32)
    {
LABEL_16:
      v15 = +[NSBundle mainBundle];
      v16 = v15;
      CFStringRef v17 = @"EV_Routing_DC_Fast_Power";
      goto LABEL_22;
    }
    if (a3 == 64)
    {
      v15 = +[NSBundle mainBundle];
      v16 = v15;
      CFStringRef v17 = @"EV_Routing_DC_Power";
LABEL_22:
      id v19 = [v15 localizedStringForKey:v17 value:@"localized string not found" table:0];
    }
  }
LABEL_23:
  v18 = [(VehicleConnectorCell *)self powerLabel];
  [v18 setText:v19];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 0;
    }
    [(VehicleConnectorCell *)self setAccessoryType:v3];
  }
}

- (unint64_t)connectorType
{
  return self->_connectorType;
}

- (BOOL)isActive
{
  return self->_active;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)powerLabel
{
  return self->_powerLabel;
}

- (void)setPowerLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

@end