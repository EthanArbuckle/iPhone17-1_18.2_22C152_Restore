@interface CompassLabelsView
- (CompassLabelsView)initWithFrame:(CGRect)a3;
- (double)bearing;
- (double)bearingLabelRadius;
- (double)degreesRadius;
- (double)directionLabelRadius;
- (id)bearingLabel;
- (id)degreeLabels;
- (id)directionLabels;
- (void)layoutSubviews;
- (void)setBearing:(double)a3;
- (void)setBearing:(double)a3 animated:(BOOL)a4;
- (void)setBearingLabelRadius:(double)a3;
- (void)setCompassHeading:(double)a3;
- (void)setDegreesRadius:(double)a3;
- (void)setDirectionLabelRadius:(double)a3;
- (void)updateLabelsAnimated:(BOOL)a3;
@end

@implementation CompassLabelsView

- (void)setCompassHeading:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompassLabelsView;
  [(CompassLabelsView *)&v4 setCompassHeading:a3];
  [(CompassLabelsView *)self setNeedsLayout];
}

- (id)degreeLabels
{
  v2 = self;
  degreeLabels = self->_degreeLabels;
  if (!degreeLabels)
  {
    objc_super v4 = +[NSMutableArray arrayWithCapacity:12];
    unint64_t v5 = 0;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    do
    {
      id v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
      v10 = +[UIColor whiteColor];
      [v9 setTextColor:v10];

      [v9 setTextAlignment:1];
      v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
      [v11 pointSize];
      double v13 = v12;

      double v14 = fmin(fmax(v13, 12.0), 30.0);
      v15 = +[UIScreen mainScreen];
      [v15 bounds];
      v17 = +[UIFont systemFontOfSize:round(v14 * v16 / 320.0)];

      v18 = [v17 fontDescriptor];
      UIFontDescriptorAttributeName v37 = UIFontDescriptorFeatureSettingsAttribute;
      v34[0] = UIFontFeatureTypeIdentifierKey;
      v34[1] = UIFontFeatureSelectorIdentifierKey;
      v35[0] = &off_100010A90;
      v35[1] = &off_100010AA8;
      v19 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
      v36 = v19;
      v20 = +[NSArray arrayWithObjects:&v36 count:1];
      v38 = v20;
      +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v21 = v2;
      v23 = v22 = v4;
      v24 = [v18 fontDescriptorByAddingAttributes:v23];

      v25 = +[UIScreen mainScreen];
      [v25 bounds];
      v27 = +[UIFont fontWithDescriptor:v24 size:round(v14 * v26 / 320.0)];
      [v9 setFont:v27];

      v28 = +[NSNumber numberWithInt:v5];
      v29 = +[NSNumberFormatter localizedStringFromNumber:v28 numberStyle:0];
      [v9 setText:v29];

      v30 = +[UIColor clearColor];
      [v9 setBackgroundColor:v30];

      objc_super v4 = v22;
      v2 = v21;
      [v9 sizeToFit];
      [v4 addObject:v9];
      [(CompassLabelsView *)v21 addSubview:v9];

      v5 += 30;
    }
    while (v5 < 0x168);
    v31 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v4];
    v32 = v21->_degreeLabels;
    v21->_degreeLabels = v31;

    degreeLabels = v21->_degreeLabels;
  }

  return degreeLabels;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)CompassLabelsView;
  [(CompassLabelsView *)&v54 layoutSubviews];
  [(CompassLabelsView *)self bounds];
  double MidX = CGRectGetMidX(v56);
  [(CompassLabelsView *)self bounds];
  double MidY = CGRectGetMidY(v57);
  if (self->_bearing != 1.79769313e308)
  {
    unint64_t v5 = [(CompassLabelsView *)self bearingLabel];
    [(CompassLabelsView *)self compassHeading];
    long double v7 = fmod(v6 + self->_bearing + 270.0, 360.0);
    double bearingLabelRadius = self->_bearingLabelRadius;
    __double2 v9 = __sincos_stret(v7 * 3.14159265 / 180.0);
    [v5 setCenter:MidX + bearingLabelRadius * v9.__cosval, MidY + bearingLabelRadius * v9.__sinval];
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v10 = [(CompassLabelsView *)self degreeLabels];
  id v11 = [v10 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v51;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        double v16 = [v15 text];
        int v17 = [v16 intValue];

        [(CompassLabelsView *)self compassHeading];
        long double v19 = fmod(v18 + (double)v17 + 270.0, 360.0);
        double degreesRadius = self->_degreesRadius;
        __double2 v21 = __sincos_stret(v19 * 3.14159265 / 180.0);
        [v15 setCenter:MidX + degreesRadius * v21.__cosval, MidY + degreesRadius * v21.__sinval];
      }
      id v12 = [v10 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v12);
  }

  [(CompassLabelsView *)self compassHeading];
  long double v23 = fmod(v22 + 0.0 + 270.0, 360.0);
  double directionLabelRadius = self->_directionLabelRadius;
  __double2 v25 = __sincos_stret(v23 * 3.14159265 / 180.0);
  double v26 = [(CompassLabelsView *)self directionLabels];
  v27 = WebLocalizedString();
  v28 = [v26 objectForKeyedSubscript:v27];

  [v28 setCenter:MidX + directionLabelRadius * v25.__cosval, MidY + directionLabelRadius * v25.__sinval];
  [(CompassLabelsView *)self compassHeading];
  long double v30 = fmod(v29 + 90.0 + 270.0, 360.0);
  double v31 = self->_directionLabelRadius;
  __double2 v32 = __sincos_stret(v30 * 3.14159265 / 180.0);
  v33 = [(CompassLabelsView *)self directionLabels];
  v34 = WebLocalizedString();
  v35 = [v33 objectForKeyedSubscript:v34];

  [v35 setCenter:MidX + v31 * v32.__cosval, MidY + v31 * v32.__sinval];
  [(CompassLabelsView *)self compassHeading];
  long double v37 = fmod(v36 + 180.0 + 270.0, 360.0);
  double v38 = self->_directionLabelRadius;
  __double2 v39 = __sincos_stret(v37 * 3.14159265 / 180.0);
  v40 = [(CompassLabelsView *)self directionLabels];
  v41 = WebLocalizedString();
  v42 = [v40 objectForKeyedSubscript:v41];

  [v42 setCenter:MidX + v38 * v39.__cosval, MidY + v38 * v39.__sinval];
  [(CompassLabelsView *)self compassHeading];
  long double v44 = fmod(v43 + 270.0 + 270.0, 360.0);
  double v45 = self->_directionLabelRadius;
  __double2 v46 = __sincos_stret(v44 * 3.14159265 / 180.0);
  v47 = [(CompassLabelsView *)self directionLabels];
  v48 = WebLocalizedString();
  v49 = [v47 objectForKeyedSubscript:v48];

  [v49 setCenter:MidX + v45 * v46.__cosval, MidY + v45 * v46.__sinval];
}

- (id)directionLabels
{
  directionLabels = self->_directionLabels;
  if (!directionLabels)
  {
    uint64_t v28 = 16;
    objc_super v4 = WebLocalizedString();
    v37[0] = v4;
    unint64_t v5 = WebLocalizedString();
    v37[1] = v5;
    double v6 = WebLocalizedString();
    v37[2] = v6;
    long double v7 = WebLocalizedString();
    v37[3] = v7;
    v8 = +[NSArray arrayWithObjects:v37 count:4];

    double v31 = +[NSMutableDictionary dictionaryWithCapacity:4];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v8;
    id v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v30 = *(void *)v33;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v33 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v13 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody, v28);
          [v13 pointSize];
          double v15 = v14;

          double v16 = fmin(fmax(v15, 21.0), 30.0);
          id v17 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, 30.0, 30.0];
          double v18 = +[UIColor whiteColor];
          [v17 setTextColor:v18];

          [v17 setTextAlignment:1];
          long double v19 = +[UIScreen mainScreen];
          [v19 bounds];
          double v21 = v20;
          long long v38 = xmmword_10000B808;
          int v39 = -798153473;
          if (MGIsDeviceOfType()) {
            double v22 = 0.850000024;
          }
          else {
            double v22 = 1.0;
          }
          long double v23 = +[UIFont systemFontOfSize:v22 * round(v16 * v21 / 320.0)];
          [v17 setFont:v23];

          [v17 setText:v12];
          v24 = +[UIColor clearColor];
          [v17 setBackgroundColor:v24];

          [v17 setAdjustsFontSizeToFitWidth:1];
          [v17 sizeToFit];
          [v31 setObject:v17 forKey:v12];
          [(CompassLabelsView *)self addSubview:v17];
        }
        id v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v10);
    }

    id v25 = [objc_alloc((Class)NSDictionary) initWithDictionary:v31];
    double v26 = *(void **)&self->CompassRotatingView_opaque[v28];
    *(void *)&self->CompassRotatingView_opaque[v28] = v25;

    directionLabels = *(NSDictionary **)&self->CompassRotatingView_opaque[v28];
  }

  return directionLabels;
}

- (void)setDirectionLabelRadius:(double)a3
{
  self->_double directionLabelRadius = a3;
  [(CompassLabelsView *)self setNeedsLayout];
}

- (void)setDegreesRadius:(double)a3
{
  self->_double degreesRadius = a3;
  [(CompassLabelsView *)self setNeedsLayout];
}

- (void)setBearingLabelRadius:(double)a3
{
  self->_double bearingLabelRadius = a3;
}

- (CompassLabelsView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompassLabelsView;
  result = -[CompassLabelsView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_bearing = 1.79769313e308;
  }
  return result;
}

- (void)setBearing:(double)a3
{
}

- (void)setBearing:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_bearing = a3;
  if (a3 != 1.79769313e308)
  {
    double v6 = +[NSNumber numberWithInt:(int)a3];
    long double v7 = +[NSNumberFormatter localizedStringFromNumber:v6 numberStyle:0];
    v8 = [(CompassLabelsView *)self bearingLabel];
    [v8 setText:v7];

    [(UILabel *)self->_bearingLabel sizeToFit];
    [(CompassLabelsView *)self setNeedsLayout];
  }

  [(CompassLabelsView *)self updateLabelsAnimated:v4];
}

- (void)updateLabelsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double bearing = self->_bearing;
  double v6 = [(CompassLabelsView *)self bearingLabel];
  [v6 alpha];
  BOOL v8 = v7 == 0.0;

  if ((((bearing != 1.79769313e308) ^ v8) & 1) == 0)
  {
    if (bearing == 1.79769313e308) {
      double v9 = 1.0;
    }
    else {
      double v9 = 0.0;
    }
    id v10 = [(CompassLabelsView *)self bearingLabel];
    [v10 setAlpha:v9];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = [(CompassLabelsView *)self degreeLabels];
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      if (bearing == 1.79769313e308) {
        double v14 = 0.699999988;
      }
      else {
        double v14 = 1.0;
      }
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) setAlpha:v14];
        }
        id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000085B0;
    v18[3] = &unk_1000104D0;
    objc_copyWeak(&v19, &location);
    BOOL v20 = bearing != 1.79769313e308;
    double v16 = objc_retainBlock(v18);
    id v17 = v16;
    if (v3) {
      +[UIView animateWithDuration:v16 animations:0.200000003];
    }
    else {
      ((void (*)(void *))v16[2])(v16);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (id)bearingLabel
{
  bearingLabel = self->_bearingLabel;
  if (!bearingLabel)
  {
    BOOL v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v4 pointSize];
    double v6 = v5;

    double v7 = [(UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
    BOOL v8 = +[UIColor whiteColor];
    [(UILabel *)v7 setTextColor:v8];

    [(UILabel *)v7 setTextAlignment:1];
    double v9 = +[UIScreen mainScreen];
    [v9 bounds];
    id v11 = +[UIFont boldSystemFontOfSize:round(fmin(fmax(v6, 16.0), 30.0) * v10 / 320.0)];
    [(UILabel *)v7 setFont:v11];

    [(UILabel *)v7 setAlpha:0.0];
    [(CompassLabelsView *)self addSubview:v7];
    id v12 = self->_bearingLabel;
    self->_bearingLabel = v7;

    bearingLabel = self->_bearingLabel;
  }

  return bearingLabel;
}

- (double)degreesRadius
{
  return self->_degreesRadius;
}

- (double)directionLabelRadius
{
  return self->_directionLabelRadius;
}

- (double)bearingLabelRadius
{
  return self->_bearingLabelRadius;
}

- (double)bearing
{
  return self->_bearing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bearingLabel, 0);
  objc_storeStrong((id *)&self->_directionLabels, 0);

  objc_storeStrong((id *)&self->_degreeLabels, 0);
}

@end