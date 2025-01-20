@interface DirectionsStartEndContentView
+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3;
+ (BOOL)useMarkerFallback;
+ (double)labelSpacing;
+ (id)_overviewTitleForWaypoint:(id)a3 route:(id)a4;
+ (id)_subtitleForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6;
+ (id)overviewFontProvider;
+ (id)subtitleDefaultFont;
+ (id)subtitleFontProvider;
+ (unint64_t)iconSize;
- (DirectionsStartEndContentView)initWithFrame:(CGRect)a3;
- (double)_bottomPaddingUsingFont:(id)a3 metrics:(id *)a4;
- (double)_dimAlpha;
- (double)_heightForAttributedText:(id)a3 width:(double)a4;
- (double)_heightForText:(id)a3 width:(double)a4 fontProvider:(id)a5;
- (double)_topPaddingUsingFont:(id)a3 metrics:(id *)a4;
- (double)heightForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6 width:(double)a7;
- (id)_labelColor;
- (void)_setPinImageForWaypoint:(id)a3;
- (void)_updateStyleValuesFromTheme;
- (void)configureForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setIsDimmedStep:(BOOL)a3;
@end

@implementation DirectionsStartEndContentView

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  result = +[DirectionsStepTableViewCell cellMetricsForIdiom:](DirectionsStepTableViewCell, "cellMetricsForIdiom:");
  if (a4 != 5) {
    *(_OWORD *)&retstr->var0 = xmmword_100F6F620;
  }
  return result;
}

+ (id)overviewFontProvider
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)5) {
    v4 = &stru_101321300;
  }
  else {
    v4 = &stru_101321500;
  }
  v5 = objc_retainBlock(v4);

  return v5;
}

+ (id)subtitleFontProvider
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)5) {
    v4 = &stru_101321300;
  }
  else {
    v4 = &stru_101321340;
  }
  v5 = objc_retainBlock(v4);

  return v5;
}

+ (id)subtitleDefaultFont
{
  return +[UIFont systemFontOfSize:15.0];
}

- (double)_topPaddingUsingFont:(id)a3 metrics:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = sub_1000BBB44(self);
  double var0 = a4->var0;
  if (v7 != 5)
  {
    [v6 ascender];
    double var0 = var0 - v9;
  }

  return var0;
}

+ (double)labelSpacing
{
  return 10.0;
}

- (double)_bottomPaddingUsingFont:(id)a3 metrics:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = sub_1000BBB44(self);
  double var1 = a4->var1;
  if (v7 != 5)
  {
    [v6 descender];
    double var1 = var1 - v9;
  }

  return var1;
}

+ (unint64_t)iconSize
{
  return 2;
}

+ (BOOL)useMarkerFallback
{
  return 1;
}

- (void)configureForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(id)objc_opt_class() _overviewTitleForWaypoint:v12 route:v11];
  [(UILabel *)self->_overviewLabel setText:v13];

  id v15 = [(id)objc_opt_class() _subtitleForWaypoint:v12 route:v11 selectedVehicle:v10 displayedInRoutePlanning:v6];

  v14 = [(UILabel *)self->_subtitleLabel attributedText];
  LOBYTE(v13) = [v14 isEqualToAttributedString:v15];

  [(UILabel *)self->_subtitleLabel setAttributedText:v15];
  [(DirectionsStartEndContentView *)self _setPinImageForWaypoint:v12];

  if ((v13 & 1) == 0) {
    [(DirectionsStartEndContentView *)self setNeedsLayout];
  }
}

+ (id)_overviewTitleForWaypoint:(id)a3 route:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = [v6 _isStartWaypoint:v5];
  v8 = [v6 legs];

  if (!v7)
  {
    id v12 = [v8 lastObject];
    id v10 = [v12 destinationListInstructionString];

    if ([v10 length]) {
      goto LABEL_10;
    }
    uint64_t v13 = +[NSBundle mainBundle];
    v14 = v13;
    CFStringRef v15 = @"Arrive [Directions Step]";
    goto LABEL_8;
  }
  double v9 = [v8 firstObject];
  id v10 = [v9 originListInstructionString];

  if ([v10 length]) {
    goto LABEL_10;
  }
  if (![v5 isDynamicCurrentLocation])
  {
    uint64_t v13 = +[NSBundle mainBundle];
    v14 = v13;
    CFStringRef v15 = @"Start [Directions Step]";
LABEL_8:
    uint64_t v11 = [v13 localizedStringForKey:v15 value:@"localized string not found" table:0];

    id v10 = v14;
    goto LABEL_9;
  }
  uint64_t v11 = MKLocalizedStringForCurrentLocation();
LABEL_9:

  id v10 = (void *)v11;
LABEL_10:

  return v10;
}

+ (id)_subtitleForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 _isChargingWaypoint:v8])
  {
    if (a5)
    {
      id v10 = [v9 _isStartWaypoint:v8];
      uint64_t v11 = [v9 steps];
      id v12 = v11;
      if (v10)
      {
        uint64_t v13 = [v11 firstObject];
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v13 = [v11 lastObject];
        uint64_t v14 = 2;
      }

      v22 = [(id)objc_opt_class() subtitleFontProvider];
      v23 = v22[2]();
      id v20 = [v13 attributedChargeStringForWaypointType:v14 font:v23 textColor:0 includeDaysAgo:v10];
    }
    else
    {
      v21 = sub_1005768D4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to generate a proper subtitle for Directions cell. Waypoint was a charge stop, but there was no selected vehicle.", v25, 2u);
      }

      id v20 = 0;
    }
  }
  else
  {
    CFStringRef v15 = [v8 singleLineAddress];
    if (v15)
    {
      id v16 = objc_alloc((Class)NSAttributedString);
      NSAttributedStringKey v26 = NSFontAttributeName;
      v17 = [(id)objc_opt_class() subtitleFontProvider];
      v18 = v17[2]();
      v27 = v18;
      v19 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v20 = [v16 initWithString:v15 attributes:v19];
    }
    else
    {
      id v20 = 0;
    }
  }

  return v20;
}

- (double)heightForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6 width:(double)a7
{
  BOOL v8 = a6;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  CFStringRef v15 = objc_opt_class();
  id v16 = [(DirectionsStartEndContentView *)self traitCollection];
  id v17 = [v16 userInterfaceIdiom];
  if (v15)
  {
    [v15 cellMetricsForIdiom:v17];
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
  }

  v18 = [(id)objc_opt_class() overviewFontProvider];
  v19 = v18[2]();
  *(_OWORD *)v48 = v45;
  *(_OWORD *)&v48[16] = v46;
  double v49 = 0.0;
  *(_OWORD *)buf = v43;
  *(_OWORD *)&buf[16] = v44;
  [(DirectionsStartEndContentView *)self _topPaddingUsingFont:v19 metrics:buf];
  double v21 = v20;

  UIFloorToViewScale();
  double v23 = v22;
  v24 = [(id)objc_opt_class() _overviewTitleForWaypoint:v14 route:v13];
  v25 = [(id)objc_opt_class() overviewFontProvider];
  [(DirectionsStartEndContentView *)self _heightForText:v24 width:v25 fontProvider:v23];
  double v27 = v26;

  double v28 = v21 + 0.0 + v27;
  v29 = [(id)objc_opt_class() _subtitleForWaypoint:v14 route:v13 selectedVehicle:v12 displayedInRoutePlanning:v8];

  if (v29)
  {
    [(id)objc_opt_class() labelSpacing];
    double v31 = v28 + v30;
    [(DirectionsStartEndContentView *)self _heightForAttributedText:v29 width:v23];
    double v28 = v31 + v32;
  }
  v33 = [(id)objc_opt_class() subtitleFontProvider];
  v34 = v33[2]();
  *(_OWORD *)v48 = v45;
  *(_OWORD *)&v48[16] = v46;
  double v49 = 0.0;
  *(_OWORD *)buf = v43;
  *(_OWORD *)&buf[16] = v44;
  [(DirectionsStartEndContentView *)self _bottomPaddingUsingFont:v34 metrics:buf];
  double v36 = v35;

  double v37 = v28 + v36;
  if (v37 >= 0.0)
  {
    UIFloorToViewScale();
    double v40 = v41;
  }
  else
  {
    v38 = sub_10000AF10();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      [(DirectionsStartEndContentView *)self bounds];
      v39 = NSStringFromCGRect(v52);
      *(_DWORD *)buf = 134219778;
      *(double *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v24;
      *(_WORD *)v48 = 2112;
      *(void *)&v48[2] = v29;
      *(_WORD *)&v48[10] = 2048;
      *(double *)&v48[12] = v36;
      *(_WORD *)&v48[20] = 2048;
      *(double *)&v48[22] = v37;
      *(_WORD *)&v48[30] = 2048;
      double v49 = a7;
      __int16 v50 = 2112;
      v51 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, "Invalid height for start/end, topPadding: %f textHeight: %f topText: %@ bottomText: %@ bottomPadding: %f totalHeight: %f width: %f bounds: %@", buf, 0x52u);
    }
    double v40 = 0.0;
  }

  return v40;
}

- (double)_heightForAttributedText:(id)a3 width:(double)a4
{
  [a3 boundingRectWithSize:3 options:0 context:a4];
  CGRectGetHeight(v6);

  UIFloorToViewScale();
  return result;
}

- (double)_heightForText:(id)a3 width:(double)a4 fontProvider:(id)a5
{
  unsigned int v7 = (void (*)(id))*((void *)a5 + 2);
  id v8 = a3;
  id v9 = v7(a5);
  NSAttributedStringKey v22 = NSFontAttributeName;
  double v23 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  [v8 boundingRectWithSize:3 options:v10 attributes:0 context:a4];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v24.origin.x = v12;
  v24.origin.y = v14;
  v24.size.width = v16;
  v24.size.height = v18;
  CGRectGetHeight(v24);
  UIFloorToViewScale();
  double v20 = v19;

  return v20;
}

- (DirectionsStartEndContentView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)DirectionsStartEndContentView;
  id v3 = -[DirectionsStartEndContentView initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(DirectionsStartEndContentView *)v3 setAccessibilityIdentifier:@"DirectionsStartEndContent"];
    id v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    overviewLabel = v4->_overviewLabel;
    v4->_overviewLabel = v5;

    unsigned int v7 = v4->_overviewLabel;
    id v8 = [(id)objc_opt_class() overviewFontProvider];
    +[DynamicTypeWizard autorefreshLabel:v7 withFontProvider:v8];

    id v9 = +[UIColor labelColor];
    [(UILabel *)v4->_overviewLabel setTextColor:v9];

    [(UILabel *)v4->_overviewLabel setTextAlignment:+[NSLocale currentTextAlignment]];
    [(UILabel *)v4->_overviewLabel setBackgroundColor:0];
    [(UILabel *)v4->_overviewLabel setNumberOfLines:0];
    [(UILabel *)v4->_overviewLabel setLineBreakMode:0];
    [(UILabel *)v4->_overviewLabel setOpaque:0];
    [(UILabel *)v4->_overviewLabel setAccessibilityIdentifier:@"OverviewLabel"];
    [(DirectionsStartEndContentView *)v4 addSubview:v4->_overviewLabel];
    id v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v10;

    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    CGFloat v12 = v4->_subtitleLabel;
    double v13 = [(id)objc_opt_class() subtitleFontProvider];
    +[DynamicTypeWizard autorefreshLabel:v12 withFontProvider:v13];

    CGFloat v14 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v14];

    [(UILabel *)v4->_subtitleLabel setAccessibilityIdentifier:@"SubtitleLabel"];
    [(DirectionsStartEndContentView *)v4 addSubview:v4->_subtitleLabel];
    if (sub_1000BBB44(v4) == 5)
    {
      double v15 = +[UIColor systemWhiteColor];
      [(UILabel *)v4->_overviewLabel setHighlightedTextColor:v15];

      CGFloat v16 = +[UIColor systemWhiteColor];
      [(UILabel *)v4->_subtitleLabel setHighlightedTextColor:v16];
    }
    double v17 = [(UIImageView *)[objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
    pinView = v4->_pinView;
    v4->_pinView = v17;

    [(UIImageView *)v4->_pinView setContentMode:4];
    [(UIImageView *)v4->_pinView setAccessibilityIdentifier:@"PinView"];
    [(DirectionsStartEndContentView *)v4 addSubview:v4->_pinView];
    v4->_identifier = 0;
  }
  return v4;
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)DirectionsStartEndContentView;
  [(DirectionsStartEndContentView *)&v49 layoutSubviews];
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v3 = objc_opt_class();
  v4 = [(DirectionsStartEndContentView *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];
  if (v3)
  {
    [v3 cellMetricsForIdiom:v5];
  }
  else
  {
    uint64_t v48 = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
  }

  [(DirectionsStartEndContentView *)self bounds];
  CGFloat y = v52.origin.y;
  v52.origin.double x = v8 + *(double *)&v47 + *(double *)&v46 + *((double *)&v47 + 1);
  double x = v52.origin.x;
  double v9 = v52.size.width - (CGRectGetMinX(v52) + *((double *)&v46 + 1));
  id v10 = [(UILabel *)self->_overviewLabel text];
  double v11 = [(id)objc_opt_class() overviewFontProvider];
  [(DirectionsStartEndContentView *)self _heightForText:v10 width:v11 fontProvider:v9];
  double v13 = v12;

  CGFloat v14 = [(UILabel *)self->_subtitleLabel attributedText];
  [(DirectionsStartEndContentView *)self _heightForAttributedText:v14 width:v9];
  double v16 = v15;

  v53.origin.double x = x;
  v53.origin.CGFloat y = y;
  v53.size.width = v9;
  v53.size.height = v13;
  double MinX = CGRectGetMinX(v53);
  v54.origin.double x = x;
  v54.origin.CGFloat y = y;
  v54.size.width = v9;
  v54.size.height = v13;
  double Width = CGRectGetWidth(v54);
  double v19 = 0.0;
  v55.origin.CGFloat y = 0.0;
  v55.origin.double x = MinX;
  v55.size.width = Width;
  v55.size.height = v16;
  if (CGRectGetHeight(v55) > 0.0)
  {
    [(id)objc_opt_class() labelSpacing];
    double v19 = v20;
  }
  v56.origin.double x = x;
  v56.origin.CGFloat y = y;
  v56.size.width = v9;
  v56.size.height = v13;
  double v21 = v19 + CGRectGetHeight(v56);
  v57.origin.CGFloat y = 0.0;
  v57.origin.double x = MinX;
  v57.size.width = Width;
  v57.size.height = v16;
  double v22 = v21 + CGRectGetHeight(v57);
  [(DirectionsStartEndContentView *)self bounds];
  CGFloat v23 = (CGRectGetHeight(v58) - v22) * 0.5;
  v59.origin.double x = x;
  v59.origin.CGFloat y = v23;
  v59.size.width = v9;
  v59.size.height = v13;
  double MaxY = CGRectGetMaxY(v59);
  [(id)objc_opt_class() labelSpacing];
  double v26 = MaxY + v25;
  -[UILabel setFrame:](self->_overviewLabel, "setFrame:", x, v23, v9, v13);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", MinX, v26, Width, v16);
  [(DirectionsStartEndContentView *)self _updateStyleValuesFromTheme];
  [(DirectionsStartEndContentView *)self bounds];
  -[UIImageView setFrame:](self->_pinView, "setFrame:");
  double v27 = +[UIApplication sharedApplication];
  id v28 = [v27 userInterfaceLayoutDirection];

  if (v28 == (id)1)
  {
    subtitleLabel = self->_subtitleLabel;
    v51[0] = self->_overviewLabel;
    v51[1] = subtitleLabel;
    v51[2] = self->_pinView;
    double v30 = +[NSArray arrayWithObjects:v51 count:3];
    [(DirectionsStartEndContentView *)self bounds];
    double MaxX = CGRectGetMaxX(v60);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v32 = v30;
    id v33 = [v32 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v41;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v41 != v35) {
            objc_enumerationMutation(v32);
          }
          double v37 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          [v37 frame:v40];
          [v37 setFrame:MaxX - v38 - v39];
        }
        id v34 = [v32 countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v34);
    }
  }
}

- (void)setIsDimmedStep:(BOOL)a3
{
  if (self->_isDimmedStep != a3)
  {
    self->_isDimmedStep = a3;
    [(DirectionsStartEndContentView *)self _updateStyleValuesFromTheme];
  }
}

- (void)_updateStyleValuesFromTheme
{
  id v3 = [(DirectionsStartEndContentView *)self _labelColor];
  [(UILabel *)self->_overviewLabel setTextColor:v3];

  if (self->_isDimmedStep) {
    [(DirectionsStartEndContentView *)self _dimAlpha];
  }
  else {
    double v4 = 1.0;
  }
  pinView = self->_pinView;

  [(UIImageView *)pinView setAlpha:v4];
}

- (double)_dimAlpha
{
  v2 = [(DirectionsStartEndContentView *)self traitCollection];
  double v3 = dbl_100F6F5B0[[v2 userInterfaceStyle] == (id)2];

  return v3;
}

- (id)_labelColor
{
  double v3 = +[UIColor labelColor];
  if (self->_isDimmedStep)
  {
    [(DirectionsStartEndContentView *)self _dimAlpha];
    uint64_t v4 = [v3 colorWithAlphaComponent:];

    double v3 = (void *)v4;
  }

  return v3;
}

- (void)_setPinImageForWaypoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 responseSearch];
  if (v5)
  {
    CGRect v6 = (void *)v5;
    unsigned int v7 = [v4 responseSearch];
    double v8 = [v7 place];

    if (v8)
    {
      [(UIImageView *)self->_pinView setImage:0];
      int64_t identifier = self->_identifier;
      id v10 = [(DirectionsStartEndContentView *)self window];
      double v11 = [v10 screen];
      if (v11)
      {
        double v12 = [(DirectionsStartEndContentView *)self window];
        double v13 = [v12 screen];
        [v13 scale];
        uint64_t v15 = v14;
      }
      else
      {
        double v12 = +[MKSystemController sharedInstance];
        [v12 screenScale];
        uint64_t v15 = v16;
      }

      double v17 = dispatch_get_global_queue(0, 0);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100450B24;
      v18[3] = &unk_1012EAA08;
      uint64_t v21 = v15;
      id v19 = v4;
      double v20 = self;
      int64_t v22 = identifier;
      dispatch_async(v17, v18);
    }
  }
}

- (void)prepareForReuse
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_overviewLabel, 0);
}

@end