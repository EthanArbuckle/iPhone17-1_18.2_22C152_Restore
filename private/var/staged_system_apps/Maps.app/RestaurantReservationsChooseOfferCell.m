@interface RestaurantReservationsChooseOfferCell
- (RestaurantReservationsChooseOfferCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)mainLabel;
- (UILabel)subLabel;
- (void)initConstraints;
@end

@implementation RestaurantReservationsChooseOfferCell

- (RestaurantReservationsChooseOfferCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)RestaurantReservationsChooseOfferCell;
  v4 = [(RestaurantReservationsChooseOfferCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    mainLabel = v4->_mainLabel;
    v4->_mainLabel = (UILabel *)v5;

    v7 = +[UIFont system15Bold];
    [(UILabel *)v4->_mainLabel setFont:v7];

    v8 = +[UIColor labelColor];
    [(UILabel *)v4->_mainLabel setTextColor:v8];

    uint64_t v9 = objc_opt_new();
    subLabel = v4->_subLabel;
    v4->_subLabel = (UILabel *)v9;

    [(UILabel *)v4->_subLabel setNumberOfLines:2];
    v11 = +[UIFont _maps_systemFontWithSize:13.0];
    [(UILabel *)v4->_subLabel setFont:v11];

    v12 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_subLabel setTextColor:v12];

    v13 = [(RestaurantReservationsChooseOfferCell *)v4 contentView];
    [v13 addSubview:v4->_mainLabel];

    v14 = [(RestaurantReservationsChooseOfferCell *)v4 contentView];
    [v14 addSubview:v4->_subLabel];

    [(RestaurantReservationsChooseOfferCell *)v4 initConstraints];
  }
  return v4;
}

- (void)initConstraints
{
  [(UILabel *)self->_mainLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_subLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [(RestaurantReservationsChooseOfferCell *)self mainLabel];
  v4 = [v3 leadingAnchor];
  uint64_t v5 = [(RestaurantReservationsChooseOfferCell *)self contentView];
  v6 = [v5 layoutMarginsGuide];
  v7 = [v6 leadingAnchor];
  v45 = [v4 constraintEqualToAnchor:v7];

  v8 = [(RestaurantReservationsChooseOfferCell *)self mainLabel];
  uint64_t v9 = [v8 trailingAnchor];
  v10 = [(RestaurantReservationsChooseOfferCell *)self contentView];
  v11 = [v10 layoutMarginsGuide];
  v12 = [v11 trailingAnchor];
  v44 = [v9 constraintEqualToAnchor:v12];

  v13 = [(RestaurantReservationsChooseOfferCell *)self mainLabel];
  v14 = [v13 topAnchor];
  v15 = [(RestaurantReservationsChooseOfferCell *)self contentView];
  objc_super v16 = [v15 layoutMarginsGuide];
  v17 = [v16 topAnchor];
  v43 = [v14 constraintEqualToAnchor:v17];

  v18 = [(RestaurantReservationsChooseOfferCell *)self subLabel];
  v19 = [v18 leadingAnchor];
  v20 = [(RestaurantReservationsChooseOfferCell *)self mainLabel];
  v21 = [v20 leadingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];

  v23 = [(RestaurantReservationsChooseOfferCell *)self subLabel];
  v24 = [v23 trailingAnchor];
  v25 = [(RestaurantReservationsChooseOfferCell *)self mainLabel];
  v26 = [v25 trailingAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];

  v28 = [(RestaurantReservationsChooseOfferCell *)self subLabel];
  v29 = [v28 firstBaselineAnchor];
  v30 = [(RestaurantReservationsChooseOfferCell *)self mainLabel];
  v31 = [v30 firstBaselineAnchor];
  v32 = [(RestaurantReservationsChooseOfferCell *)self subLabel];
  v33 = [v32 font];
  [v33 _mapkit_scaledValueForValue:20.0];
  v34 = [v29 constraintEqualToAnchor:v31];

  v35 = [(RestaurantReservationsChooseOfferCell *)self contentView];
  v36 = [v35 bottomAnchor];
  v37 = [(RestaurantReservationsChooseOfferCell *)self subLabel];
  v38 = [v37 lastBaselineAnchor];
  v39 = [(RestaurantReservationsChooseOfferCell *)self subLabel];
  v40 = [v39 font];
  [v40 _mapkit_scaledValueForValue:10.0];
  v41 = [v36 constraintEqualToAnchor:v38];

  v46[0] = v45;
  v46[1] = v44;
  v46[2] = v43;
  v46[3] = v22;
  v46[4] = v27;
  v46[5] = v34;
  v46[6] = v41;
  v42 = +[NSArray arrayWithObjects:v46 count:7];
  +[NSLayoutConstraint activateConstraints:v42];
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (UILabel)subLabel
{
  return self->_subLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLabel, 0);

  objc_storeStrong((id *)&self->_mainLabel, 0);
}

@end