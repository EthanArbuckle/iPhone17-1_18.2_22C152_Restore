@interface CarArrivedGuidanceSign
+ (BOOL)requiresConstraintBasedLayout;
- (CarArrivedGuidanceSign)initWithDestination:(unint64_t)a3;
- (CarGuidanceCardSizeProviding)sizeProvider;
- (MapsAutolayoutLabel)arrivedLabel;
- (NavSignLabel)destinationLabel;
- (void)_setupConstraints;
- (void)_updateStyling;
- (void)setArrivedLabel:(id)a3;
- (void)setDestinationLabel:(id)a3;
- (void)setFormattedDestination:(id)a3;
- (void)setSizeProvider:(id)a3;
@end

@implementation CarArrivedGuidanceSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarArrivedGuidanceSign)initWithDestination:(unint64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CarArrivedGuidanceSign;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[CarArrivedGuidanceSign initWithFrame:](&v22, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    [(CarArrivedGuidanceSign *)v7 setAccessibilityIdentifier:@"CarArrivedGuidanceSign"];
    v8->_destination = a3;
    v9 = -[NavSignLabel initWithFrame:]([NavSignLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(CarArrivedGuidanceSign *)v8 setDestinationLabel:v9];

    v10 = [(CarArrivedGuidanceSign *)v8 destinationLabel];
    [v10 setAccessibilityIdentifier:@"DestinationLabel"];

    v11 = [(CarArrivedGuidanceSign *)v8 destinationLabel];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v12 = [(CarArrivedGuidanceSign *)v8 destinationLabel];
    LODWORD(v13) = 1148813312;
    [v12 setContentCompressionResistancePriority:1 forAxis:v13];

    v14 = [(CarArrivedGuidanceSign *)v8 destinationLabel];
    [(CarArrivedGuidanceSign *)v8 addSubview:v14];

    v15 = -[MapsAutolayoutLabel initWithFrame:]([MapsAutolayoutLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(CarArrivedGuidanceSign *)v8 setArrivedLabel:v15];

    v16 = [(CarArrivedGuidanceSign *)v8 arrivedLabel];
    [v16 setAccessibilityIdentifier:@"ArrivedLabel"];

    v17 = [(CarArrivedGuidanceSign *)v8 arrivedLabel];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(CarArrivedGuidanceSign *)v8 arrivedLabel];
    LODWORD(v19) = 1148829696;
    [v18 setContentCompressionResistancePriority:1 forAxis:v19];

    v20 = [(CarArrivedGuidanceSign *)v8 arrivedLabel];
    [(CarArrivedGuidanceSign *)v8 addSubview:v20];

    [(CarArrivedGuidanceSign *)v8 _updateStyling];
    [(CarArrivedGuidanceSign *)v8 _setupConstraints];
  }
  return v8;
}

- (void)_updateStyling
{
  v3 = +[UIFont boldSystemFontOfSize:16.0];
  v4 = [(CarArrivedGuidanceSign *)self destinationLabel];
  [v4 setPreferredFont:v3];

  v5 = [(CarArrivedGuidanceSign *)self destinationLabel];
  [v5 setMaxNumberOfLinesWithPreferredFont:0];

  v6 = [(CarArrivedGuidanceSign *)self destinationLabel];
  [v6 setMaxNumberOfTotalLines:0];

  v7 = sub_100D89C4C(self->_destination == 1);
  v8 = [(CarArrivedGuidanceSign *)self destinationLabel];
  [v8 setTextColor:v7];

  v9 = [(CarArrivedGuidanceSign *)self destinationLabel];
  [v9 setParagraphLineBreakMode:4];

  v10 = [(CarArrivedGuidanceSign *)self destinationLabel];
  [v10 updateLabelIfNeeded];

  v11 = +[UIFont systemFontOfSize:12.0];
  v12 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  [v12 setFont:v11];

  double v13 = sub_100D89C4C(self->_destination == 1);
  v14 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  [v14 setTextColor:v13];

  v15 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  [v15 setShouldInsetAlignmentToAscender:1];

  v16 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  [v16 setNumberOfLines:0];

  v17 = +[NSBundle mainBundle];
  id v19 = [v17 localizedStringForKey:@"Arrived [CarPlay]" value:@"localized string not found" table:0];

  v18 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  [v18 setText:v19];
}

- (void)setFormattedDestination:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v8 = v4;
    v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    v6 = 0;
  }
  v7 = [(CarArrivedGuidanceSign *)self destinationLabel];
  [v7 setTextAlternatives:v6];

  if (v5) {
}
  }

- (void)_setupConstraints
{
  v45 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  v44 = [v45 topAnchor];
  v43 = [(CarArrivedGuidanceSign *)self topAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:10.0];
  v46[0] = v42;
  v41 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  v40 = [v41 leadingAnchor];
  v39 = [(CarArrivedGuidanceSign *)self leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:10.0];
  v46[1] = v38;
  v36 = [(CarArrivedGuidanceSign *)self trailingAnchor];
  v37 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  v35 = [v37 trailingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:10.0];
  v46[2] = v34;
  v33 = [(CarArrivedGuidanceSign *)self destinationLabel];
  v31 = [v33 topAnchor];
  v32 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  v30 = [v32 bottomAnchor];
  v29 = [v31 constraintGreaterThanOrEqualToAnchor:v30 constant:2.0];
  v46[3] = v29;
  v28 = [(CarArrivedGuidanceSign *)self destinationLabel];
  v26 = [v28 topAnchor];
  v27 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  v25 = [v27 bottomAnchor];
  LODWORD(v3) = 1144750080;
  v24 = [v26 constraintEqualToAnchor:v25 constant:10.0 priority:v3];
  v46[4] = v24;
  v23 = [(CarArrivedGuidanceSign *)self destinationLabel];
  v21 = [v23 leadingAnchor];
  objc_super v22 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  id v19 = [v22 leadingAnchor];
  v18 = [v21 constraintEqualToAnchor:v19];
  v46[5] = v18;
  v17 = [(CarArrivedGuidanceSign *)self destinationLabel];
  v15 = [v17 heightAnchor];
  v16 = [(CarArrivedGuidanceSign *)self destinationLabel];
  v14 = [v16 preferredFont];
  [v14 lineHeight];
  id v4 = [v15 constraintGreaterThanOrEqualToConstant:];
  v46[6] = v4;
  v5 = [(CarArrivedGuidanceSign *)self arrivedLabel];
  v6 = [v5 trailingAnchor];
  v7 = [(CarArrivedGuidanceSign *)self destinationLabel];
  id v8 = [v7 trailingAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  v46[7] = v9;
  v10 = [(CarArrivedGuidanceSign *)self bottomAnchor];
  v11 = [(CarArrivedGuidanceSign *)self destinationLabel];
  v12 = [v11 bottomAnchor];
  double v13 = [v10 constraintEqualToAnchor:v12 constant:10.0];
  v46[8] = v13;
  v20 = +[NSArray arrayWithObjects:v46 count:9];

  +[NSLayoutConstraint activateConstraints:v20];
}

- (CarGuidanceCardSizeProviding)sizeProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeProvider);

  return (CarGuidanceCardSizeProviding *)WeakRetained;
}

- (void)setSizeProvider:(id)a3
{
}

- (NavSignLabel)destinationLabel
{
  return self->_destinationLabel;
}

- (void)setDestinationLabel:(id)a3
{
}

- (MapsAutolayoutLabel)arrivedLabel
{
  return self->_arrivedLabel;
}

- (void)setArrivedLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivedLabel, 0);
  objc_storeStrong((id *)&self->_destinationLabel, 0);

  objc_destroyWeak((id *)&self->_sizeProvider);
}

@end