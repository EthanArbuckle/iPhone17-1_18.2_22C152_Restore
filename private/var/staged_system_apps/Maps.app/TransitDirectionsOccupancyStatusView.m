@interface TransitDirectionsOccupancyStatusView
- (TransitDirectionsOccupancyStatusView)initWithFrame:(CGRect)a3;
- (id)bottomView;
- (id)topView;
- (int64_t)occupancyStatus;
- (void)_updateContent;
- (void)setOccupancyStatus:(int64_t)a3;
@end

@implementation TransitDirectionsOccupancyStatusView

- (TransitDirectionsOccupancyStatusView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TransitDirectionsOccupancyStatusView;
  v3 = -[TransitDirectionsBoardingInfoStackView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_occupancyStatus = 0;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(TransitDirectionsOccupancyStatusView *)v4 setAccessibilityIdentifier:v6];

    [(TransitDirectionsOccupancyStatusView *)v4 _updateContent];
  }
  return v4;
}

- (id)topView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = -[AutolayoutImageView initWithFrame:]([AutolayoutImageView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_imageView;
    self->_imageView = &v4->super;

    [(UIImageView *)self->_imageView setAccessibilityIdentifier:@"ImageView"];
    [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)self->_imageView setContentMode:1];
    LODWORD(v6) = 1148846080;
    [(UIImageView *)self->_imageView setContentHuggingPriority:0 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(UIImageView *)self->_imageView setContentHuggingPriority:1 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(UIImageView *)self->_imageView setContentCompressionResistancePriority:1 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(UIImageView *)self->_imageView setContentCompressionResistancePriority:0 forAxis:v9];
    v10 = [(UIImageView *)self->_imageView heightAnchor];
    v11 = [v10 constraintEqualToConstant:20.0];
    [v11 setActive:1];

    [(TransitDirectionsOccupancyStatusView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }

  return imageView;
}

- (id)bottomView
{
  label = self->_label;
  if (!label)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_label;
    self->_label = v4;

    [(UILabel *)self->_label setAccessibilityIdentifier:@"Label"];
    [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_label setAdjustsFontForContentSizeCategory:1];
    double v6 = +[UIColor secondaryLabelColor];
    [(UILabel *)self->_label setTextColor:v6];

    double v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)self->_label setFont:v7];

    [(UILabel *)self->_label setLineBreakMode:0];
    [(UILabel *)self->_label setNumberOfLines:2];
    LODWORD(v8) = 1148846080;
    [(UILabel *)self->_label setContentCompressionResistancePriority:1 forAxis:v8];
    LODWORD(v9) = 1148829696;
    [(UILabel *)self->_label setContentCompressionResistancePriority:0 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [(UILabel *)self->_label setContentHuggingPriority:1 forAxis:v10];
    LODWORD(v11) = 1132068864;
    [(UILabel *)self->_label setContentHuggingPriority:0 forAxis:v11];
    [(TransitDirectionsOccupancyStatusView *)self addSubview:self->_label];
    label = self->_label;
  }

  return label;
}

- (void)setOccupancyStatus:(int64_t)a3
{
  if (self->_occupancyStatus != a3)
  {
    self->_occupancyStatus = a3;
    [(TransitDirectionsOccupancyStatusView *)self _updateContent];
  }
}

- (void)_updateContent
{
  switch([(TransitDirectionsOccupancyStatusView *)self occupancyStatus])
  {
    case 0:
      id v7 = +[UIImage imageNamed:@"transit-occupancy-nodata"];
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Transit Occupancy Status: Unknown";
      goto LABEL_8;
    case 1:
      id v7 = +[UIImage imageNamed:@"transit-occupancy-notcrowded"];
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Transit Occupancy Status: Not Crowded";
      goto LABEL_8;
    case 2:
      id v7 = +[UIImage imageNamed:@"transit-occupancy-crowded"];
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Transit Occupancy Status: Crowded";
      goto LABEL_8;
    case 3:
      id v7 = +[UIImage imageNamed:@"transit-occupancy-verycrowded"];
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Transit Occupancy Status: Very Crowded";
      goto LABEL_8;
    case 4:
      id v7 = +[UIImage imageNamed:@"transit-occupancy-full"];
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Transit Occupancy Status: Full";
LABEL_8:
      double v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      [(UIImageView *)self->_imageView setImage:v7];
      break;
    default:
      id v7 = 0;
      double v6 = 0;
      [(UIImageView *)self->_imageView setImage:0];
      break;
  }
  [(UILabel *)self->_label setText:v6];
}

- (int64_t)occupancyStatus
{
  return self->_occupancyStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end