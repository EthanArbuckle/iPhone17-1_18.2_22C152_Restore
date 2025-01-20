@interface TransitVehiclePositionAnnotationView
+ (double)baseDiameter;
+ (double)imageDiameter;
+ (double)innerDiameter;
- (TransitVehiclePositionAnnotation)transitVehiclePositionAnnotation;
- (TransitVehiclePositionAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (id)_lastUpdatedTextAttributes;
- (void)_scheduleLastUpdatedLabelUpdate;
- (void)_updateFromAnnotation;
- (void)_updateHeading;
- (void)_updateLastUpdatedLabel;
- (void)didMoveToWindow;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnnotation:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TransitVehiclePositionAnnotationView

+ (double)baseDiameter
{
  return 28.0;
}

+ (double)innerDiameter
{
  [a1 baseDiameter];
  return v2 + -6.0;
}

+ (double)imageDiameter
{
  return 14.0;
}

- (TransitVehiclePositionAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TransitVehiclePositionAnnotationView;
  v4 = [(TransitVehiclePositionAnnotationView *)&v7 initWithAnnotation:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(TransitVehiclePositionAnnotationView *)v4 setCanShowCallout:0];
    [(TransitVehiclePositionAnnotationView *)v5 setClipsToBounds:0];
    [(TransitVehiclePositionAnnotationView *)v5 setShouldInnerPulse:0];
    [(TransitVehiclePositionAnnotationView *)v5 setHeadingIndicatorStyle:1];
    [(TransitVehiclePositionAnnotationView *)v5 _updateFromAnnotation];
  }
  return v5;
}

- (TransitVehiclePositionAnnotation)transitVehiclePositionAnnotation
{
  v3 = [(TransitVehiclePositionAnnotationView *)self annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(TransitVehiclePositionAnnotationView *)self annotation];
  }
  else
  {
    v5 = 0;
  }

  return (TransitVehiclePositionAnnotation *)v5;
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)TransitVehiclePositionAnnotationView;
  [(TransitVehiclePositionAnnotationView *)&v5 didMoveToWindow];
  v3 = [(TransitVehiclePositionAnnotationView *)self window];

  if (v3)
  {
    [(TransitVehiclePositionAnnotationView *)self updateTheme];
  }
  else
  {
    [(NSTimer *)self->_labelUpdateTimer invalidate];
    [(_MKUILabel *)self->_lastUpdatedLabel removeFromSuperview];
    lastUpdatedLabel = self->_lastUpdatedLabel;
    self->_lastUpdatedLabel = 0;
  }
}

- (void)setAnnotation:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TransitVehiclePositionAnnotationView *)self transitVehiclePositionAnnotation];

  if (v5)
  {
    v6 = [(TransitVehiclePositionAnnotationView *)self transitVehiclePositionAnnotation];
    [v6 removeObserver:self forKeyPath:@"vehiclePosition"];
  }
  v9.receiver = self;
  v9.super_class = (Class)TransitVehiclePositionAnnotationView;
  [(TransitVehiclePositionAnnotationView *)&v9 setAnnotation:v4];
  objc_super v7 = [(TransitVehiclePositionAnnotationView *)self transitVehiclePositionAnnotation];

  if (v7)
  {
    v8 = [(TransitVehiclePositionAnnotationView *)self transitVehiclePositionAnnotation];
    [v8 addObserver:self forKeyPath:@"vehiclePosition" options:1 context:0];
  }
  [(TransitVehiclePositionAnnotationView *)self _updateFromAnnotation];
}

- (void)_updateFromAnnotation
{
  v3 = [(TransitVehiclePositionAnnotationView *)self transitVehicleAnnotation];
  -[TransitVehiclePositionAnnotationView setAllowsAccuracyRing:](self, "setAllowsAccuracyRing:", [v3 allowsAccuracyRing]);

  id v4 = [(TransitVehiclePositionAnnotationView *)self transitVehicleAnnotation];
  objc_super v5 = [v4 color];
  [(TransitVehiclePositionAnnotationView *)self setTintColor:v5];

  [(TransitVehiclePositionAnnotationView *)self _updateHeading];
  [(TransitVehiclePositionAnnotationView *)self _updateLastUpdatedLabel];
  v6 = [(TransitVehiclePositionAnnotationView *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;

  objc_super v9 = [(TransitVehiclePositionAnnotationView *)self transitVehicleAnnotation];
  [v9 imageWithScale:[self _mapkit_isDarkModeEnabled] nightMode:v8];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [(TransitVehiclePositionAnnotationView *)self setGlyphImage:v10];
}

- (void)_updateLastUpdatedLabel
{
  [(NSTimer *)self->_labelUpdateTimer invalidate];
  labelUpdateTimer = self->_labelUpdateTimer;
  self->_labelUpdateTimer = 0;

  id v4 = [(TransitVehiclePositionAnnotationView *)self transitVehiclePositionAnnotation];
  if ([v4 allowsTimestampLabel])
  {
    objc_super v5 = [(TransitVehiclePositionAnnotationView *)self transitVehiclePositionAnnotation];
    v6 = [v5 vehiclePosition];
    double v7 = [v6 timestamp];

    if (v7)
    {
      if (!self->_lastUpdatedLabel)
      {
        double v8 = [objc_alloc((Class)_MKUILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
        lastUpdatedLabel = self->_lastUpdatedLabel;
        self->_lastUpdatedLabel = v8;

        [(_MKUILabel *)self->_lastUpdatedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        id v10 = +[UIFont systemFontOfSize:11.0 weight:UIFontWeightSemibold];
        [(_MKUILabel *)self->_lastUpdatedLabel setFont:v10];

        [(TransitVehiclePositionAnnotationView *)self addSubview:self->_lastUpdatedLabel];
        v11 = [(_MKUILabel *)self->_lastUpdatedLabel topAnchor];
        v12 = [(TransitVehiclePositionAnnotationView *)self centerYAnchor];
        [(id)objc_opt_class() baseDiameter];
        v14 = [v11 constraintEqualToAnchor:v12 constant:v13 * 0.5 + 2.0];
        v30[0] = v14;
        v15 = [(_MKUILabel *)self->_lastUpdatedLabel centerXAnchor];
        v16 = [(TransitVehiclePositionAnnotationView *)self centerXAnchor];
        v17 = [v15 constraintEqualToAnchor:v16];
        v30[1] = v17;
        v18 = +[NSArray arrayWithObjects:v30 count:2];
        +[NSLayoutConstraint activateConstraints:v18];
      }
      v19 = [(TransitVehiclePositionAnnotationView *)self transitVehiclePositionAnnotation];
      v20 = [v19 vehiclePosition];
      v21 = [v20 timestamp];

      if (v21)
      {
        [v21 timeIntervalSinceNow];
        v23 = +[NSDate dateWithTimeIntervalSinceNow:round(v22 / 10.0) * 10.0];

        v24 = +[NSDate date];
        v25 = +[NSDateComponentsFormatter _mapkit_descriptionForTimeSinceDate:v23 referenceDate:v24 smallestUnit:128];

        if (v25)
        {
          id v26 = objc_alloc((Class)NSAttributedString);
          v27 = [(TransitVehiclePositionAnnotationView *)self _lastUpdatedTextAttributes];
          id v28 = [v26 initWithString:v25 attributes:v27];
          [(_MKUILabel *)self->_lastUpdatedLabel setAttributedText:v28];
        }
        else
        {
          [(_MKUILabel *)self->_lastUpdatedLabel setAttributedText:0];
        }
        [(TransitVehiclePositionAnnotationView *)self _scheduleLastUpdatedLabelUpdate];
        [(_MKUILabel *)self->_lastUpdatedLabel setHidden:0];
      }
      else
      {
        [(_MKUILabel *)self->_lastUpdatedLabel setAttributedText:0];
        [(_MKUILabel *)self->_lastUpdatedLabel setHidden:1];
      }
      return;
    }
  }
  else
  {
  }
  v29 = self->_lastUpdatedLabel;

  [(_MKUILabel *)v29 setHidden:1];
}

- (id)_lastUpdatedTextAttributes
{
  NSAttributedStringKey v5 = NSForegroundColorAttributeName;
  double v2 = +[UIColor labelColor];
  v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (void)_scheduleLastUpdatedLabelUpdate
{
  if (([(_MKUILabel *)self->_lastUpdatedLabel isHidden] & 1) == 0)
  {
    v3 = [(TransitVehiclePositionAnnotationView *)self transitVehiclePositionAnnotation];
    id v4 = [v3 vehiclePosition];
    NSAttributedStringKey v5 = [v4 timestamp];

    [v5 timeIntervalSinceNow];
    double v7 = fabs(v6);
    double v8 = 60.0;
    if (v7 < 60.0) {
      double v8 = 10.0;
    }
    double v9 = -(v7 - ceil(v7 / v8) * v8);
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100AA3858;
    v12[3] = &unk_1012E73C8;
    objc_copyWeak(&v13, &location);
    id v10 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v12 block:v9];
    labelUpdateTimer = self->_labelUpdateTimer;
    self->_labelUpdateTimer = v10;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(TransitVehiclePositionAnnotationView *)self annotation];

  if (v13 == v11)
  {
    [(TransitVehiclePositionAnnotationView *)self _updateHeading];
    [(TransitVehiclePositionAnnotationView *)self _updateLastUpdatedLabel];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TransitVehiclePositionAnnotationView;
    [(TransitVehiclePositionAnnotationView *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_updateHeading
{
  v3 = [(TransitVehiclePositionAnnotationView *)self transitVehiclePositionAnnotation];
  id v7 = [v3 vehiclePosition];

  id v4 = v7;
  if (v7)
  {
    [v7 heading];
    double v6 = v5;
    -[TransitVehiclePositionAnnotationView setHeading:](self, "setHeading:");
    [(TransitVehiclePositionAnnotationView *)self setShouldDisplayHeading:v6 >= 0.0];
    id v4 = v7;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitVehiclePositionAnnotationView;
  [(TransitVehiclePositionAnnotationView *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(TransitVehiclePositionAnnotationView *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    id v7 = [(TransitVehiclePositionAnnotationView *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(TransitVehiclePositionAnnotationView *)self updateTheme];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelUpdateTimer, 0);

  objc_storeStrong((id *)&self->_lastUpdatedLabel, 0);
}

@end