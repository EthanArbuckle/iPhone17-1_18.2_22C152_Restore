@interface CarStarRatingView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isHighlighted;
- (CarStarRatingView)init;
- (id)_providerNameAndPriceAttributedStringForMapItem:(id)a3;
- (id)accessibilityIdentifier;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_setupConstraints;
- (void)setHighlighted:(BOOL)a3;
- (void)setupWithMapItem:(id)a3;
@end

@implementation CarStarRatingView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarStarRatingView)init
{
  v19.receiver = self;
  v19.super_class = (Class)CarStarRatingView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v5 = -[CarStarRatingView initWithFrame:](&v19, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v5)
  {
    v6 = +[UIImage _mapsCar_systemImageNamed:@"star.fill" pointSize:6 weight:8.5];
    id v7 = [objc_alloc((Class)UIImageView) initWithImage:v6];
    v8 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v7;

    [*((id *)v5 + 1) setAccessibilityIdentifier:@"StarImageView"];
    [*((id *)v5 + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v9) = 1148846080;
    [*((id *)v5 + 1) setContentCompressionResistancePriority:1 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [*((id *)v5 + 1) setContentCompressionResistancePriority:0 forAxis:v10];
    v11 = sub_100AC55F8(*((void *)v5 + 3));
    [*((id *)v5 + 1) setTintColor:v11];

    [v5 addSubview:*((void *)v5 + 1)];
    id v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    v13 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v12;

    [*((id *)v5 + 2) setAccessibilityIdentifier:@"ProviderInfoLabel"];
    [*((id *)v5 + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v14) = 1144750080;
    [*((id *)v5 + 2) setContentHuggingPriority:1 forAxis:v14];
    LODWORD(v15) = 1144750080;
    [*((id *)v5 + 2) setContentHuggingPriority:0 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [*((id *)v5 + 2) setContentCompressionResistancePriority:1 forAxis:v16];
    [*((id *)v5 + 2) setLineBreakMode:4];
    v17 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:UIFontWeightRegular];
    [*((id *)v5 + 2) setFont:v17];

    [v5 addSubview:*((void *)v5 + 2)];
    [v5 _setupConstraints];
  }
  return (CarStarRatingView *)v5;
}

- (id)viewForLastBaselineLayout
{
  return self->_providerInfoLabel;
}

- (id)viewForFirstBaselineLayout
{
  return self->_providerInfoLabel;
}

- (void)_setupConstraints
{
  v31 = +[NSMutableArray array];
  v30 = [(UIImageView *)self->_starImageView topAnchor];
  v29 = [(CarStarRatingView *)self topAnchor];
  v28 = [v30 constraintGreaterThanOrEqualToAnchor:v29];
  v32[0] = v28;
  v27 = [(UIImageView *)self->_starImageView leadingAnchor];
  v26 = [(CarStarRatingView *)self leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v32[1] = v25;
  v24 = [(UIImageView *)self->_starImageView trailingAnchor];
  v23 = [(CarStarRatingView *)self trailingAnchor];
  v22 = [v24 constraintLessThanOrEqualToAnchor:v23];
  v32[2] = v22;
  v21 = [(UIImageView *)self->_starImageView bottomAnchor];
  v20 = [(CarStarRatingView *)self bottomAnchor];
  objc_super v19 = [v21 constraintLessThanOrEqualToAnchor:v20];
  v32[3] = v19;
  v18 = [(UILabel *)self->_providerInfoLabel leadingAnchor];
  v17 = [(UIImageView *)self->_starImageView trailingAnchor];
  double v16 = [v18 constraintEqualToAnchor:v17 constant:2.0];
  v32[4] = v16;
  double v15 = [(UILabel *)self->_providerInfoLabel topAnchor];
  double v14 = [(CarStarRatingView *)self topAnchor];
  v13 = [v15 constraintGreaterThanOrEqualToAnchor:v14];
  v32[5] = v13;
  v3 = [(UILabel *)self->_providerInfoLabel trailingAnchor];
  v4 = [(CarStarRatingView *)self trailingAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4];
  v32[6] = v5;
  v6 = [(UILabel *)self->_providerInfoLabel firstBaselineAnchor];
  id v7 = [(UIImageView *)self->_starImageView firstBaselineAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:1.0];
  v32[7] = v8;
  double v9 = [(UILabel *)self->_providerInfoLabel bottomAnchor];
  double v10 = [(CarStarRatingView *)self bottomAnchor];
  v11 = [v9 constraintLessThanOrEqualToAnchor:v10];
  v32[8] = v11;
  id v12 = +[NSArray arrayWithObjects:v32 count:9];
  [v31 addObjectsFromArray:v12];

  +[NSLayoutConstraint activateConstraints:v31];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if ([(CarStarRatingView *)self isHighlighted]) {
      +[UIColor _carSystemFocusLabelColor];
    }
    else {
    v4 = sub_100AC55F8((uint64_t)self->_mapItem);
    }
    [(UIImageView *)self->_starImageView setTintColor:v4];

    id v5 = [(CarStarRatingView *)self _providerNameAndPriceAttributedStringForMapItem:self->_mapItem];
    [(UILabel *)self->_providerInfoLabel setAttributedText:v5];
  }
}

- (id)_providerNameAndPriceAttributedStringForMapItem:(id)a3
{
  id v4 = a3;
  if ([v4 _hasUserRatingScore])
  {
    id v5 = +[MKRatingStringBuilder carPlayHeaderStringForMapItem:v4 isHighlighted:[(CarStarRatingView *)self isHighlighted]];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)setupWithMapItem:(id)a3
{
  id v4 = (MKMapItem *)a3;
  id v5 = [(CarStarRatingView *)self _providerNameAndPriceAttributedStringForMapItem:v4];
  [(UILabel *)self->_providerInfoLabel setAttributedText:v5];

  sub_100AC558C((uint64_t)v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = sub_100AC55F8((uint64_t)v4);
  [(UIImageView *)self->_starImageView setTintColor:v6];

  [(UIImageView *)self->_starImageView setImage:v8];
  mapItem = self->_mapItem;
  self->_mapItem = v4;
}

- (id)accessibilityIdentifier
{
  return @"CarStarRatingView";
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_providerInfoLabel, 0);

  objc_storeStrong((id *)&self->_starImageView, 0);
}

@end