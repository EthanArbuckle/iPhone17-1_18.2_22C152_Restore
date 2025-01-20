@interface DirectionsElevationGraphView
- (BOOL)isSelected;
- (DirectionsElevationGraphView)initWithConfiguration:(id)a3;
- (GEOElevationProfile)elevationProfile;
- (double)_estimatedElevationAxisWidth;
- (double)_targetChartDrawingWidth;
- (double)routeLength;
- (id)_chartStyle;
- (id)_stringForAxesWithElevation:(double)a3;
- (id)_stringForAxesWithOffset:(double)a3;
- (id)_stringForAxesWithOffsetInMeters:(double)a3;
- (unint64_t)_numberOfBarsForCurrentWidth;
- (void)_prepareForFirstUse;
- (void)_unitsDidChange;
- (void)_updateChartView;
- (void)_updateChartViewIfNeeded;
- (void)_updateMeasurementUnits;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
- (void)setElevationProfile:(id)a3;
- (void)setElevationProfile:(id)a3 routeLength:(double)a4;
- (void)setNavigationProgress:(double)a3;
- (void)setRouteLength:(double)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation DirectionsElevationGraphView

- (DirectionsElevationGraphView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DirectionsElevationGraphView;
  v6 = -[DirectionsElevationGraphView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    GEOConfigGetDouble();
    v7->_chartUpdateDistanceThreshold = v8;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [(DirectionsElevationGraphView *)v7 setAccessibilityIdentifier:v10];

    [(DirectionsElevationGraphView *)v7 _prepareForFirstUse];
  }

  return v7;
}

- (void)_prepareForFirstUse
{
  [(DirectionsElevationGraphView *)self setOpaque:0];
  v3 = +[UIColor clearColor];
  [(DirectionsElevationGraphView *)self setBackgroundColor:v3];

  v4 = (NSMeasurementFormatter *)objc_alloc_init((Class)NSMeasurementFormatter);
  elevationFormatter = self->_elevationFormatter;
  self->_elevationFormatter = v4;

  [(NSMeasurementFormatter *)self->_elevationFormatter setUnitOptions:1];
  v6 = [(NSMeasurementFormatter *)self->_elevationFormatter numberFormatter];
  [v6 setMaximumFractionDigits:0];

  v7 = +[NSLocale currentLocale];
  self->_metric = [v7 _navigation_distanceUsesMetricSystem];

  [(DirectionsElevationGraphView *)self _updateMeasurementUnits];
  double v8 = +[NSNotificationCenter defaultCenter];
  v9 = MNLocaleDidChangeNotification();
  [v8 addObserver:self selector:"_unitsDidChange" name:v9 object:0];

  v10 = +[UIColor clearColor];
  [(DirectionsElevationGraphView *)self setBackgroundColor:v10];

  v11 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(UIView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v11 setAccessibilityIdentifier:@"ChartContainerView"];
  [(DirectionsElevationGraphView *)self addSubview:v11];
  chartContainerView = self->_chartContainerView;
  self->_chartContainerView = v11;
  v13 = v11;

  id v17 = objc_alloc_init((Class)NSMutableArray);
  LODWORD(v14) = 1148846080;
  v15 = [(UIView *)v13 _maps_constraintsEqualToEdgesOfView:self priority:v14];
  v16 = [v15 allConstraints];
  +[NSLayoutConstraint activateConstraints:v16];

  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DirectionsElevationGraphView;
  [(DirectionsElevationGraphView *)&v3 layoutSubviews];
  [(DirectionsElevationGraphView *)self _updateChartViewIfNeeded];
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_configuration;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      v9 = sub_100577384();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:

        objc_storeStrong((id *)&self->_configuration, a3);
        [(DirectionsElevationGraphView *)self _updateChartView];
        goto LABEL_11;
      }
      v10 = self;
      v11 = (objc_class *)objc_opt_class();
      objc_super v12 = NSStringFromClass(v11);
      if (objc_opt_respondsToSelector())
      {
        v13 = [(DirectionsElevationGraphView *)v10 performSelector:"accessibilityIdentifier"];
        double v14 = v13;
        if (v13 && ![v13 isEqualToString:v12])
        {
          v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

          goto LABEL_9;
        }
      }
      v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_9:

      *(_DWORD *)buf = 138412290;
      id v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ | Updating configuration", buf, 0xCu);

      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)setElevationProfile:(id)a3 routeLength:(double)a4
{
  id v6 = a3;
  elevationProfile = self->_elevationProfile;
  unint64_t v8 = (unint64_t)v6;
  id v9 = elevationProfile;
  if (v8 | (unint64_t)v9
    && (v10 = v9, unsigned int v11 = [(id)v8 isEqual:v9],
                  v10,
                  (id)v8,
                  !v11)
    || vabdd_f64(self->_routeLength, a4) > 2.22044605e-16)
  {
    objc_super v12 = sub_100577384();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:

      v19 = (GEOElevationProfile *)[(id)v8 copy];
      v20 = self->_elevationProfile;
      self->_elevationProfile = v19;

      self->_routeLength = a4;
      [(DirectionsElevationGraphView *)self _updateChartView];
      goto LABEL_12;
    }
    v13 = self;
    double v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      v16 = [(DirectionsElevationGraphView *)v13 performSelector:"accessibilityIdentifier"];
      id v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_10;
      }
    }
    v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_10:

    *(_DWORD *)buf = 138412802;
    v22 = v18;
    __int16 v23 = 2048;
    id v24 = [(id)v8 pointsCount];
    __int16 v25 = 2048;
    double v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ | Updating elevation profile (%lu points, %#.2fm length)", buf, 0x20u);

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setNavigationProgress:(double)a3
{
  if (vabdd_f64(a3, self->_progressInMeters) >= self->_chartUpdateDistanceThreshold)
  {
    self->_progressInMeters = a3;
    [(DirectionsElevationGraphView *)self _updateChartView];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(DirectionsElevationGraphView *)self _updateChartView];
  }
}

- (void)_updateChartViewIfNeeded
{
  [(DirectionsElevationGraphView *)self _targetChartDrawingWidth];
  if (self->_chartViewController) {
    BOOL v4 = v3 < 2.22044605e-16;
  }
  else {
    BOOL v4 = 0;
  }
  double v5 = vabdd_f64(v3, self->_chartUsedWidth);
  if (v4 || v5 >= 1.0)
  {
    [(DirectionsElevationGraphView *)self _updateChartView];
  }
}

- (id)_chartStyle
{
  v2 = [(DirectionsElevationGraphConfiguration *)self->_configuration useType];
  if (v2 == (void *)2)
  {
    v2 = +[MapsElevationChartStyle navigationDetailStyle];
  }
  else if (v2 == (void *)1)
  {
    v2 = +[MapsElevationChartStyle routePlanningMiniLineStyle];
  }
  else if (!v2)
  {
    v2 = +[MapsElevationChartStyle navigationLineStyle];
  }

  return v2;
}

- (void)_updateChartView
{
  [(UIView *)self->_chartSubcontainerView removeFromSuperview];
  chartViewController = self->_chartViewController;
  self->_chartViewController = 0;

  [(DirectionsElevationGraphView *)self _targetChartDrawingWidth];
  double v5 = v4;
  self->_chartUsedWidth = v4;
  if (v4 >= 2.22044605e-16)
  {
    id v6 = objc_alloc((Class)NSMeasurement);
    double progressInMeters = self->_progressInMeters;
    unint64_t v8 = +[NSUnitLength meters];
    id v22 = [v6 initWithDoubleValue:v8 unit:progressInMeters];

    elevationProfile = self->_elevationProfile;
    BOOL metric = self->_metric;
    unsigned int v11 = [(DirectionsElevationGraphView *)self traitCollection];
    BOOL selected = self->_selected;
    v13 = [(DirectionsElevationGraphView *)self _chartStyle];
    double v14 = +[MapsElevationGraphViewController makeHostingControllerFor:elevationProfile width:metric isMetric:v11 traitCollection:selected shouldHighlight:v13 chartStyle:v22 currentPosition:v5];
    v15 = self->_chartViewController;
    self->_chartViewController = v14;

    v16 = [(UIViewController *)self->_chartViewController view];
    chartSubcontainerView = self->_chartSubcontainerView;
    self->_chartSubcontainerView = v16;

    [(UIView *)self->_chartSubcontainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = +[UIColor clearColor];
    [(UIView *)self->_chartSubcontainerView setBackgroundColor:v18];

    [(UIView *)self->_chartContainerView addSubview:self->_chartSubcontainerView];
    LODWORD(v19) = 1148846080;
    v20 = [(UIView *)self->_chartSubcontainerView _maps_constraintsEqualToEdgesOfView:self->_chartContainerView priority:v19];
    v21 = [v20 allConstraints];
    +[NSLayoutConstraint activateConstraints:v21];
  }
}

- (void)_updateMeasurementUnits
{
  if (self->_metric) {
    +[NSUnitLength meters];
  }
  else {
  double v3 = +[NSUnitLength feet];
  }
  p_elevationUnit = &self->_elevationUnit;
  objc_storeStrong((id *)&self->_elevationUnit, v3);

  double v5 = sub_100577384();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = self;
    unint64_t v7 = (objc_class *)objc_opt_class();
    unint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(DirectionsElevationGraphView *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        unsigned int v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_10;
      }
    }
    unsigned int v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_10:

    objc_super v12 = *p_elevationUnit;
    *(_DWORD *)buf = 138412546;
    double v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ | Will use '%@' for elevation", buf, 0x16u);
  }
}

- (void)_unitsDidChange
{
  double v3 = +[NSLocale currentLocale];
  self->_BOOL metric = [v3 _navigation_distanceUsesMetricSystem];

  double v4 = sub_100577384();
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_11;
  }
  double v5 = self;
  id v6 = (objc_class *)objc_opt_class();
  unint64_t v7 = NSStringFromClass(v6);
  if (objc_opt_respondsToSelector())
  {
    unint64_t v8 = [(DirectionsElevationGraphView *)v5 performSelector:"accessibilityIdentifier"];
    id v9 = v8;
    if (v8 && ![v8 isEqualToString:v7])
    {
      v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

      goto LABEL_7;
    }
  }
  v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

  if (self->_metric) {
    unsigned int v11 = "metric";
  }
  else {
    unsigned int v11 = "imperial";
  }
  *(_DWORD *)buf = 138412546;
  v13 = v10;
  __int16 v14 = 2080;
  __int16 v15 = v11;
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ | Notified units changed to %s", buf, 0x16u);

LABEL_11:
  [(DirectionsElevationGraphView *)self _updateMeasurementUnits];
  [(DirectionsElevationGraphView *)self _updateChartView];
}

- (unint64_t)_numberOfBarsForCurrentWidth
{
  [(UIView *)self->_chartContainerView bounds];
  double Width = CGRectGetWidth(v10);
  if (fabs(Width) <= 2.22044605e-16) {
    return 0;
  }
  [(DirectionsElevationGraphView *)self _estimatedElevationAxisWidth];
  double v5 = Width - v4;
  configuration = self->_configuration;
  double routeLength = self->_routeLength;

  return [(DirectionsElevationGraphConfiguration *)configuration targetNumberOfBarsForRouteLength:routeLength availableWidth:v5];
}

- (double)_estimatedElevationAxisWidth
{
  double v3 = [(DirectionsElevationGraphView *)self elevationProfile];
  if ([v3 isValid])
  {
    unsigned __int8 v4 = [(DirectionsElevationGraphConfiguration *)self->_configuration showsElevationAxisLabels];

    double v5 = 0.0;
    if (v4)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v6 = [(DirectionsElevationGraphView *)self elevationProfile];
      unint64_t v7 = [v6 points];

      id v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v27;
        int v11 = 0x80000000;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (v11 <= (int)[v13 elevationCm]) {
              int v11 = [v13 elevationCm];
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
        }
        while (v9);
      }
      else
      {
        int v11 = 0x80000000;
      }

      double v14 = 3.2808399;
      if (self->_metric) {
        double v14 = 1.0;
      }
      __int16 v15 = [(DirectionsElevationGraphView *)self _stringForAxesWithElevation:(double)v11 / 100.0 * v14];
      v16 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption2];
      UIFontDescriptorTraitKey v34 = UIFontWeightTrait;
      id v17 = +[NSNumber numberWithDouble:UIFontWeightMedium];
      v35 = v17;
      v18 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];

      UIFontDescriptorAttributeName v32 = UIFontDescriptorTraitsAttribute;
      v33 = v18;
      double v19 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      v20 = [v16 fontDescriptorByAddingAttributes:v19];

      v21 = +[UIFont fontWithDescriptor:v20 size:0.0];
      NSAttributedStringKey v30 = NSFontAttributeName;
      v31 = v21;
      id v22 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      [v15 sizeWithAttributes:v22];
      double v24 = v23;

      double v5 = v24 + 8.0;
    }
  }
  else
  {

    return 0.0;
  }
  return v5;
}

- (double)_targetChartDrawingWidth
{
  double v3 = (double)[(DirectionsElevationGraphView *)self _numberOfBarsForCurrentWidth];
  [(DirectionsElevationGraphConfiguration *)self->_configuration barWidth];
  double v5 = v4;
  [(DirectionsElevationGraphConfiguration *)self->_configuration gapWidth];
  double v7 = v5 + v6;
  [(DirectionsElevationGraphConfiguration *)self->_configuration gapWidth];
  if (-(v8 - v3 * v7) < 0.0) {
    return 0.0;
  }
  double v10 = (double)[(DirectionsElevationGraphView *)self _numberOfBarsForCurrentWidth];
  [(DirectionsElevationGraphConfiguration *)self->_configuration barWidth];
  double v12 = v11;
  [(DirectionsElevationGraphConfiguration *)self->_configuration gapWidth];
  double v14 = v12 + v13;
  [(DirectionsElevationGraphConfiguration *)self->_configuration gapWidth];
  return -(v15 - v10 * v14);
}

- (id)_stringForAxesWithOffset:(double)a3
{
  if (!self->_metric) {
    a3 = a3 * 0.3048;
  }
  return [(DirectionsElevationGraphView *)self _stringForAxesWithOffsetInMeters:a3];
}

- (id)_stringForAxesWithOffsetInMeters:(double)a3
{
  if (a3 == 0.0)
  {
    id v4 = objc_alloc_init((Class)NSMeasurementFormatter);
    [v4 setUnitOptions:1];
    double v5 = [v4 numberFormatter];
    [v5 setMaximumFractionDigits:0];

    double v6 = [v4 numberFormatter];
    [v6 setMinimumFractionDigits:0];

    double routeLength = self->_routeLength;
    if (self->_metric)
    {
      if (routeLength >= 1000.0) {
        +[NSUnitLength kilometers];
      }
      else {
        +[NSUnitLength meters];
      }
    }
    else if (routeLength * 3.2808399 >= 5280.0)
    {
      +[NSUnitLength miles];
    }
    else
    {
      +[NSUnitLength feet];
    uint64_t v8 = };
    id v9 = (void *)v8;
    id v10 = [objc_alloc((Class)NSMeasurement) initWithDoubleValue:v8 unit:0.0];
    double v11 = [v4 stringFromMeasurement:v10];
  }
  else
  {
    double v11 = +[NSString _navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:](NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0);
  }

  return v11;
}

- (id)_stringForAxesWithElevation:(double)a3
{
  double v5 = self->_elevationFormatter;
  id v6 = [objc_alloc((Class)NSMeasurement) initWithDoubleValue:self->_elevationUnit unit:a3];
  double v7 = [(NSMeasurementFormatter *)v5 stringFromMeasurement:v6];

  return v7;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (GEOElevationProfile)elevationProfile
{
  return self->_elevationProfile;
}

- (void)setElevationProfile:(id)a3
{
}

- (double)routeLength
{
  return self->_routeLength;
}

- (void)setRouteLength:(double)a3
{
  self->_double routeLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevationProfile, 0);
  objc_storeStrong((id *)&self->_chartSubcontainerView, 0);
  objc_storeStrong((id *)&self->_chartViewController, 0);
  objc_storeStrong((id *)&self->_chartContainerView, 0);
  objc_storeStrong((id *)&self->_elevationUnit, 0);
  objc_storeStrong((id *)&self->_elevationFormatter, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end