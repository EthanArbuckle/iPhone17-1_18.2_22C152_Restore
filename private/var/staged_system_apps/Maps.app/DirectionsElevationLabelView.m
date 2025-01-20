@interface DirectionsElevationLabelView
+ (id)_formatter;
- (DirectionsElevationLabelView)initWithFrame:(CGRect)a3;
- (DirectionsElevationLabelView)initWithStyle:(int64_t)a3;
- (NSMeasurement)elevation;
- (id)accessibilityIdentifier;
- (void)_refreshLabel;
- (void)setElevation:(id)a3;
- (void)setFont:(id)a3;
- (void)setFont:(id)a3 color:(id)a4;
@end

@implementation DirectionsElevationLabelView

+ (id)_formatter
{
  if (qword_10160ECA0 != -1) {
    dispatch_once(&qword_10160ECA0, &stru_1012EA270);
  }
  v2 = (void *)qword_10160EC98;

  return v2;
}

- (DirectionsElevationLabelView)initWithFrame:(CGRect)a3
{
  return -[DirectionsElevationLabelView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (DirectionsElevationLabelView)initWithStyle:(int64_t)a3
{
  v41.receiver = self;
  v41.super_class = (Class)DirectionsElevationLabelView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[DirectionsElevationLabelView initWithFrame:](&v41, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    v7->_style = a3;
    [(DirectionsElevationLabelView *)v7 setIsAccessibilityElement:1];
    LODWORD(v9) = 1148846080;
    [(DirectionsElevationLabelView *)v8 setContentCompressionResistancePriority:1 forAxis:v9];
    LODWORD(v10) = 1148829696;
    [(DirectionsElevationLabelView *)v8 setContentCompressionResistancePriority:0 forAxis:v10];
    v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    label = v8->_label;
    v8->_label = v11;

    [(UILabel *)v8->_label setAccessibilityIdentifier:@"TextLabel"];
    [(UILabel *)v8->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_label setAdjustsFontForContentSizeCategory:1];
    LODWORD(v13) = 1148846080;
    [(UILabel *)v8->_label setContentCompressionResistancePriority:1 forAxis:v13];
    LODWORD(v14) = 1148829696;
    [(UILabel *)v8->_label setContentCompressionResistancePriority:0 forAxis:v14];
    v15 = @"arrow.down.forward.circle.fill";
    if (!a3) {
      v15 = @"arrow.up.forward.circle.fill";
    }
    v16 = v15;
    id v17 = objc_alloc((Class)UIImageView);
    v18 = +[UIImage systemImageNamed:v16];

    v19 = (UIImageView *)[v17 initWithImage:v18];
    imageView = v8->_imageView;
    v8->_imageView = v19;

    [(UIImageView *)v8->_imageView setAccessibilityIdentifier:@"ImageView"];
    [(UIImageView *)v8->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [(UILabel *)v8->_label textColor];
    [(UIImageView *)v8->_imageView setTintColor:v21];

    LODWORD(v22) = 1148846080;
    [(UIImageView *)v8->_imageView setContentHuggingPriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UIImageView *)v8->_imageView setContentHuggingPriority:1 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(UIImageView *)v8->_imageView setContentCompressionResistancePriority:1 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [(UIImageView *)v8->_imageView setContentCompressionResistancePriority:0 forAxis:v25];
    v26 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    v27 = +[UIColor labelColor];
    [(DirectionsElevationLabelView *)v8 setFont:v26 color:v27];
    id v28 = objc_alloc((Class)UIStackView);
    v42[0] = v8->_imageView;
    v42[1] = v8->_label;
    v29 = +[NSArray arrayWithObjects:v42 count:2];
    id v30 = [v28 initWithArrangedSubviews:v29];

    [v30 setAccessibilityIdentifier:@"StackView"];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v30 setAxis:0];
    [v30 setDistribution:2];
    [v30 setAlignment:0];
    [v30 setSpacing:3.0];
    LODWORD(v31) = 1132068864;
    [v30 setContentHuggingPriority:0 forAxis:v31];
    LODWORD(v32) = 1148846080;
    [v30 setContentHuggingPriority:1 forAxis:v32];
    LODWORD(v33) = 1148829696;
    [v30 setContentCompressionResistancePriority:0 forAxis:v33];
    LODWORD(v34) = 1148846080;
    [v30 setContentCompressionResistancePriority:1 forAxis:v34];
    [(DirectionsElevationLabelView *)v8 addSubview:v30];
    LODWORD(v35) = 1148846080;
    v36 = [v30 _maps_constraintsEqualToEdgesOfView:v8 priority:v35];
    v37 = [v36 allConstraints];
    +[NSLayoutConstraint activateConstraints:v37];

    v38 = +[NSNotificationCenter defaultCenter];
    v39 = MNLocaleDidChangeNotification();
    [v38 addObserver:v8 selector:"_refreshLabel" name:v39 object:0];
  }
  return v8;
}

- (void)setFont:(id)a3
{
  label = self->_label;
  id v5 = a3;
  id v6 = [(UILabel *)label textColor];
  [(DirectionsElevationLabelView *)self setFont:v5 color:v6];
}

- (void)setFont:(id)a3 color:(id)a4
{
  label = self->_label;
  id v10 = a4;
  id v7 = a3;
  [(UILabel *)label setFont:v7];
  if (sub_1000BBB44(self) == 5) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = 1;
  }
  double v9 = +[UIImageSymbolConfiguration configurationWithFont:v7 scale:v8];

  [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v9];
  [(UILabel *)self->_label setTextColor:v10];
  [(UIImageView *)self->_imageView setTintColor:v10];
}

- (void)setElevation:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_elevation;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_elevation, a3);
      [(DirectionsElevationLabelView *)self _refreshLabel];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (void)_refreshLabel
{
  id v17 = self->_elevation;
  v3 = +[NSLocale currentLocale];
  if ((objc_msgSend(v3, "_navigation_distanceUsesMetricSystem") & 1) == 0)
  {
    v4 = [(NSMeasurement *)v17 unit];
    id v5 = +[NSUnitLength feet];
    unsigned __int8 v6 = [v4 isEqual:v5];

    if (v6) {
      goto LABEL_5;
    }
    v3 = +[NSUnitLength feet];
    uint64_t v7 = [(NSMeasurement *)v17 measurementByConvertingToUnit:v3];

    id v17 = (NSMeasurement *)v7;
  }

LABEL_5:
  if (v17)
  {
    unsigned __int8 v8 = [(id)objc_opt_class() _formatter];
    id v9 = [v8 stringFromMeasurement:v17];
    [(UILabel *)self->_label setText:v9];

    int64_t style = self->_style;
    if (style == 1)
    {
      v11 = +[NSBundle mainBundle];
      v12 = v11;
      CFStringRef v13 = @"Elevation graph loss accessibility label";
    }
    else
    {
      if (style) {
        goto LABEL_12;
      }
      v11 = +[NSBundle mainBundle];
      v12 = v11;
      CFStringRef v13 = @"Elevation graph gain accessibility label";
    }
    double v14 = [v11 localizedStringForKey:v13 value:@"localized string not found" table:0];
    v15 = [(UILabel *)self->_label text];
    v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v15);
    [(DirectionsElevationLabelView *)self setAccessibilityLabel:v16];
  }
  else
  {
    [(UILabel *)self->_label setText:0];
  }
LABEL_12:
}

- (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSMeasurement)elevation
{
  return self->_elevation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevation, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end