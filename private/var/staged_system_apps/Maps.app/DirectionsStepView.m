@interface DirectionsStepView
+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3;
+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics;
+ ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics;
+ (Class)_labelListViewClassForRoute:(id)a3 step:(id)a4;
+ (double)_heightForRoadDescriptionViewWithStep:(id)a3 forWidth:(double)a4;
+ (double)_textWidthForWidth:(double)a3 withManeuver:(BOOL)a4 metrics:(id *)a5;
+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6;
+ (id)_multiPartAttributedStringForRoadDescriptionsInStep:(id)a3;
+ (id)_roadDescriptionsLabelForStep:(id)a3 width:(double)a4;
+ (id)backgroundColorForIndex:(int64_t)a3;
+ (unint64_t)signViewIconSize;
- (BOOL)isSelectedRow;
- (UIView)trailingView;
- (double)_dimAlpha;
- (id)_majorLabelColor;
- (id)_minorLabelColor;
- (id)_shieldImageFromStep:(id)a3 route:(id)a4 shieldSize:(int64_t)a5;
- (id)signView;
- (void)_updateSignViewForStep:(id)a3 maneuverImage:(id)a4 route:(id)a5;
- (void)_updateStyleValuesFromTheme;
- (void)_updateTrailingGuideToContentViewConstraintWithConstant:(double)a3;
- (void)layoutSubviews;
- (void)setIsDimmedStep:(BOOL)a3;
- (void)setIsSelectedRow:(BOOL)a3;
- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7;
- (void)setTrailingView:(id)a3;
@end

@implementation DirectionsStepView

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  if (a4 == 5)
  {
    _Q1 = xmmword_100F6F5A0;
    double v5 = 22.0;
    double v6 = 5.0;
    double v7 = 40.0;
  }
  else
  {
    __asm { FMOV            V1.2D, #15.0 }
    double v5 = 30.0;
    double v6 = 15.0;
    double v7 = 60.0;
  }
  retstr->var0 = v6;
  retstr->var1 = v6;
  retstr->var2 = 17.0;
  retstr->var3 = v7;
  *(void *)&retstr->var4 = _Q1;
  *(_OWORD *)&retstr->var5 = _Q1;
  retstr->var7 = v5;
  retstr->var8 = v5;
  return result;
}

+ (double)_heightForRoadDescriptionViewWithStep:(id)a3 forWidth:(double)a4
{
  id v5 = a3;
  double v6 = [v5 geoStep];
  double v7 = [v6 roadDescriptions];
  id v8 = [v7 count];

  if (v8)
  {
    v9 = [(id)objc_opt_class() _roadDescriptionsLabelForStep:v5 width:a4];
    [v9 sizeThatFits:a4];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

+ (double)_textWidthForWidth:(double)a3 withManeuver:(BOOL)a4 metrics:(id *)a5
{
  double result = a3 - a5->var4 - a5->var5;
  if (a4) {
    return result - a5->var6 - a5->var7;
  }
  return result;
}

+ (Class)_labelListViewClassForRoute:(id)a3 step:(id)a4
{
  return (Class)objc_opt_class();
}

+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = [v10 geoStep];
  BOOL v13 = [v12 maneuverType] != 0;

  id v14 = [a1 _labelListViewClassForRoute:v11 step:v10];
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  [a1 cellMetricsForIdiom:a6];
  v22[2] = v26;
  v22[3] = v27;
  uint64_t v23 = v28;
  v22[0] = v24;
  v22[1] = v25;
  [a1 _textWidthForWidth:v13 withManeuver:v22 metrics:a3];
  double v16 = v15;
  [v14 heightForWidth:v11 route:v10 step:a6 idiom:];
  double v18 = v17;

  [a1 _heightForRoadDescriptionViewWithStep:v10 forWidth:v16];
  double v20 = v19;

  double result = v20 + v18 + *(double *)&v24 + *((double *)&v24 + 1);
  if (result <= *((double *)&v25 + 1)) {
    return *((double *)&v25 + 1);
  }
  return result;
}

- (void)layoutSubviews
{
  v84.receiver = self;
  v84.super_class = (Class)DirectionsStepView;
  [(DirectionsStepView *)&v84 layoutSubviews];
  v3 = [(SimpleSignView *)self->_signView maneuverView];
  v4 = [v3 maneuverArtwork];
  if ([v4 maneuver])
  {

LABEL_4:
    uint64_t v6 = 0;
    BOOL v7 = 1;
    goto LABEL_5;
  }
  id v5 = [(SimpleSignView *)self->_signView shieldImage];

  if (v5) {
    goto LABEL_4;
  }
  BOOL v7 = !self->_alignLeftIfNoManeuverSign;
  uint64_t v6 = 1;
LABEL_5:
  uint64_t v83 = 0;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v8 = objc_opt_class();
  v9 = [(DirectionsStepView *)self traitCollection];
  id v10 = [v9 userInterfaceIdiom];
  if (v8)
  {
    [v8 cellMetricsForIdiom:v10];
  }
  else
  {
    uint64_t v83 = 0;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
  }

  [(DirectionsStepView *)self bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  CGFloat v18 = v17;
  [(NSLayoutConstraint *)self->_trailingGuideWidth constant];
  CGFloat v20 = v16 - v19;
  v21 = objc_opt_class();
  v77[2] = v81;
  v77[3] = v82;
  uint64_t v78 = v83;
  v77[0] = v79;
  v77[1] = v80;
  [v21 _textWidthForWidth:v7 withManeuver:v77 metrics:v20];
  double v23 = v22;
  v88.origin.x = v12;
  v88.origin.y = v14;
  v88.size.width = v20;
  v88.size.height = v18;
  -[RouteStepLabelListView layoutToFitSize:](self->_labelListView, "layoutToFitSize:", v23, CGRectGetHeight(v88));
  [(RouteStepLabelListView *)self->_labelListView frame];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  double v30 = *((double *)&v82 + 1) + *(double *)&v82;
  if (!v7) {
    double v30 = -0.0;
  }
  double v31 = *(double *)&v81 + v30;
  [(MKMultiPartLabel *)self->_roadDescriptionLabel frame];
  v32 = [(MKMultiPartLabel *)self->_roadDescriptionLabel superview];
  CGFloat v33 = 0.0;
  if (v32)
  {
    -[MKMultiPartLabel sizeThatFits:](self->_roadDescriptionLabel, "sizeThatFits:", v23, 1.79769313e308);
    CGFloat v33 = v34;
  }

  [(DirectionsStepView *)self bounds];
  double v68 = v35;
  double v70 = v36;
  double v67 = v37;
  double v38 = *(double *)&v82 + *(double *)&v81 + *((double *)&v82 + 1);
  [(SimpleSignView *)self->_signView setHidden:v6];
  v89.origin.x = v31;
  v89.origin.y = v25;
  v89.size.width = v27;
  v89.size.height = v29;
  double v39 = CGRectGetHeight(v89) + 0.0;
  v90.origin.y = 0.0;
  v90.origin.x = v31;
  v90.size.width = v23;
  v90.size.height = v33;
  double v72 = v23;
  double v71 = v33;
  if (CGRectGetHeight(v90) > 0.00000011920929)
  {
    v91.origin.x = v31;
    v91.origin.y = v25;
    v91.size.width = v27;
    v91.size.height = v29;
    if (CGRectGetHeight(v91) > 0.00000011920929) {
      double v39 = v39 + 4.0;
    }
    v92.origin.y = 0.0;
    v92.origin.x = v31;
    v92.size.width = v23;
    v92.size.height = v33;
    double v39 = CGRectGetHeight(v92) + v39;
  }
  [(DirectionsStepView *)self bounds];
  double v40 = (CGRectGetHeight(v93) - v39) * 0.5;
  v94.origin.x = v31;
  v94.origin.y = v40;
  v94.size.width = v27;
  v94.size.height = v29;
  double v66 = CGRectGetMaxY(v94) + 4.0;
  [(SimpleSignView *)self->_signView frame];
  double v41 = v29;
  CGFloat v42 = v27;
  double v44 = v43;
  double v46 = v45;
  double v69 = round(v68 + (v38 - v43) * 0.5);
  double v47 = round(v70 + (v67 - v45) * 0.5);
  if (sub_1000BBB44(self) == 5)
  {
    v95.origin.x = v31;
    v95.origin.y = v40;
    double v48 = v42;
    v95.size.width = v42;
    v95.size.height = v41;
    double Height = CGRectGetHeight(v95);
    [(SimpleSignView *)self->_signView frame];
    if (Height > CGRectGetHeight(v96)) {
      double v47 = 10.0;
    }
  }
  else
  {
    double v48 = v42;
  }
  -[SimpleSignView setFrame:](self->_signView, "setFrame:", v69, v47, v44, v46);
  -[RouteStepLabelListView setFrame:](self->_labelListView, "setFrame:", v31, v40, v48, v41);
  -[MKMultiPartLabel setFrame:](self->_roadDescriptionLabel, "setFrame:", v31, v66, v72, v71);
  v50 = +[UIApplication sharedApplication];
  id v51 = [v50 userInterfaceLayoutDirection];

  if (v51 == (id)1)
  {
    roadDescriptionLabel = self->_roadDescriptionLabel;
    if (roadDescriptionLabel)
    {
      v87[0] = self->_labelListView;
      v87[1] = roadDescriptionLabel;
      v87[2] = self->_signView;
      v53 = v87;
      uint64_t v54 = 3;
    }
    else
    {
      signView = self->_signView;
      v86[0] = self->_labelListView;
      v86[1] = signView;
      v53 = v86;
      uint64_t v54 = 2;
    }
    v56 = +[NSArray arrayWithObjects:v53 count:v54];
    [(DirectionsStepView *)self bounds];
    double MaxX = CGRectGetMaxX(v97);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v58 = v56;
    id v59 = [v58 countByEnumeratingWithState:&v73 objects:v85 count:16];
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v74;
      do
      {
        for (i = 0; i != v60; i = (char *)i + 1)
        {
          if (*(void *)v74 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          [v63 frame];
          [v63 setFrame:MaxX - v64 - v65];
        }
        id v60 = [v58 countByEnumeratingWithState:&v73 objects:v85 count:16];
      }
      while (v60);
    }
  }
}

- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7
{
  unint64_t v11 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  double v13 = +[UIDevice currentDevice];
  if ([v13 userInterfaceIdiom] == (id)1)
  {

    goto LABEL_4;
  }
  CGFloat v14 = +[UIDevice currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  if (v15 == (id)5)
  {
LABEL_4:
    if (!(v11 | v12)) {
      goto LABEL_24;
    }
  }
  self->_alignLeftIfNoManeuverSign = a6;
  double v16 = (objc_class *)[(id)objc_opt_class() _labelListViewClassForRoute:v11 step:v12];
  uint64_t v17 = objc_opt_class();
  labelListView = self->_labelListView;
  if (v16 == (objc_class *)v17)
  {
    [(RouteStepLabelListView *)labelListView setRoute:v11 step:v12 tableMode:0];
  }
  else
  {
    [(RouteStepLabelListView *)labelListView removeFromSuperview];
    double v19 = (RouteStepLabelListView *)[[v16 alloc] initWithRoute:v11 step:v12 tableMode:0];
    CGFloat v20 = self->_labelListView;
    self->_labelListView = v19;

    [(LabelListView *)self->_labelListView setTextAlignment:+[NSLocale currentTextAlignment]];
    [(DirectionsStepView *)self addSubview:self->_labelListView];
  }
  if (!self->_signView)
  {
    long long v70 = 0u;
    v21 = objc_opt_class();
    double v22 = [(DirectionsStepView *)self traitCollection];
    id v23 = [v22 userInterfaceIdiom];
    if (v21) {
      [v21 cellMetricsForIdiom:v23];
    }
    else {
      long long v70 = 0u;
    }

    double v24 = -[SimpleSignView initWithFrame:]([SimpleSignView alloc], "initWithFrame:", 0.0, 0.0, *((double *)&v70 + 1), 0.0);
    signView = self->_signView;
    self->_signView = v24;

    double v26 = [(DirectionsStepView *)self signView];
    [(DirectionsStepView *)self addSubview:v26];
  }
  [(MKMultiPartLabel *)self->_roadDescriptionLabel removeFromSuperview];
  CGFloat v27 = [(id)v12 geoStep];
  id v28 = [v27 roadDescriptionsCount];

  if (v28)
  {
    if (self->_roadDescriptionLabel)
    {
      roadDescriptionLabel = [(id)objc_opt_class() _multiPartAttributedStringForRoadDescriptionsInStep:v12];
      [(MKMultiPartLabel *)self->_roadDescriptionLabel setMultiPartString:roadDescriptionLabel];
    }
    else
    {
      [(DirectionsStepView *)self bounds];
      double v31 = v30;
      [(NSLayoutConstraint *)self->_trailingGuideWidth constant];
      double v33 = v31 - v32;
      [(RouteStepLabelListView *)self->_labelListView frame];
      double v34 = v33 - CGRectGetMinX(v72);
      double v35 = [(id)objc_opt_class() _roadDescriptionsLabelForStep:v12 width:v34];
      roadDescriptionLabel = self->_roadDescriptionLabel;
      self->_roadDescriptionLabel = v35;
    }

    [(DirectionsStepView *)self addSubview:self->_roadDescriptionLabel];
  }
  double v36 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  trailingViewGuide = self->_trailingViewGuide;
  self->_trailingViewGuide = v36;

  [(DirectionsStepView *)self addLayoutGuide:self->_trailingViewGuide];
  double v38 = objc_opt_class();
  double v39 = [(DirectionsStepView *)self traitCollection];
  id v40 = [v39 userInterfaceIdiom];
  double v68 = (void *)v12;
  double v69 = (void *)v11;
  if (v38) {
    [v38 cellMetricsForIdiom:v40];
  }

  double v41 = [(UILayoutGuide *)self->_trailingViewGuide widthAnchor];
  CGFloat v42 = [v41 constraintEqualToConstant:0.0];
  trailingGuideWidth = self->_trailingGuideWidth;
  self->_trailingGuideWidth = v42;

  double v44 = [(DirectionsStepView *)self trailingAnchor];
  double v45 = [(UILayoutGuide *)self->_trailingViewGuide trailingAnchor];
  double v46 = [v44 constraintEqualToAnchor:v45 constant:0.0];
  trailingGuideToContentViewConstraint = self->_trailingGuideToContentViewConstraint;
  self->_trailingGuideToContentViewConstraint = v46;

  double v48 = objc_opt_new();
  double v67 = [(UILayoutGuide *)self->_trailingViewGuide topAnchor];
  v49 = [(DirectionsStepView *)self topAnchor];
  v50 = [v67 constraintEqualToAnchor:v49];
  v71[0] = v50;
  id v51 = [(UILayoutGuide *)self->_trailingViewGuide bottomAnchor];
  v52 = [(DirectionsStepView *)self bottomAnchor];
  v53 = [v51 constraintEqualToAnchor:v52];
  uint64_t v54 = self->_trailingGuideToContentViewConstraint;
  v71[1] = v53;
  v71[2] = v54;
  v55 = v48;
  v71[3] = self->_trailingGuideWidth;
  v56 = +[NSArray arrayWithObjects:v71 count:4];
  [v48 addObjectsFromArray:v56];

  +[NSLayoutConstraint activateConstraints:v48];
  unint64_t v12 = (unint64_t)v68;
  unint64_t v11 = (unint64_t)v69;
  v57 = sub_100CFEC64(v68, v69);
  id v58 = v57;
  if (v57)
  {
    id v59 = [v57 mapItemIfLoaded];
    id v60 = [(DirectionsStepView *)self traitCollection];
    [v60 displayScale];
    v62 = +[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v59, [(id)objc_opt_class() signViewIconSize], 1, v61);

    [(DirectionsStepView *)self setAccessibilityIdentifier:@"DirectionsStepCell.Waypoint"];
  }
  else
  {
    v63 = [(DirectionsStepView *)self _shieldImageFromStep:v68 route:v69 shieldSize:v66];
    id v64 = [v63 image];
    [v63 contentScale];
    v62 = +[UIImage imageWithCGImage:v64 scale:0 orientation:v65];
    [(DirectionsStepView *)self setAccessibilityIdentifier:@"DirectionsStepCell.Maneuver"];
  }
  [(DirectionsStepView *)self _updateSignViewForStep:v68 maneuverImage:v62 route:v69];
  [(DirectionsStepView *)self setNeedsLayout];

LABEL_24:
}

- (void)_updateTrailingGuideToContentViewConstraintWithConstant:(double)a3
{
}

- (void)setTrailingView:(id)a3
{
  id v5 = (UIView *)a3;
  p_trailingView = &self->_trailingView;
  trailingView = self->_trailingView;
  if (trailingView != v5)
  {
    [(UIView *)trailingView removeFromSuperview];
    objc_storeStrong((id *)&self->_trailingView, a3);
    [(UIView *)*p_trailingView _mapkit_fittingSize];
    -[NSLayoutConstraint setConstant:](self->_trailingGuideWidth, "setConstant:");
    if (*p_trailingView)
    {
      -[DirectionsStepView addSubview:](self, "addSubview:");
      CGFloat v20 = [(UIView *)*p_trailingView topAnchor];
      double v19 = [(UILayoutGuide *)self->_trailingViewGuide topAnchor];
      CGFloat v18 = [v20 constraintGreaterThanOrEqualToAnchor:v19];
      v21[0] = v18;
      uint64_t v17 = [(UIView *)*p_trailingView bottomAnchor];
      double v16 = [(UILayoutGuide *)self->_trailingViewGuide bottomAnchor];
      id v8 = [v17 constraintLessThanOrEqualToAnchor:v16];
      v21[1] = v8;
      v9 = [(UIView *)*p_trailingView leadingAnchor];
      id v10 = [(UILayoutGuide *)self->_trailingViewGuide leadingAnchor];
      unint64_t v11 = [v9 constraintEqualToAnchor:v10];
      v21[2] = v11;
      unint64_t v12 = [(UIView *)*p_trailingView trailingAnchor];
      double v13 = [(UILayoutGuide *)self->_trailingViewGuide trailingAnchor];
      CGFloat v14 = [v12 constraintEqualToAnchor:v13];
      v21[3] = v14;
      id v15 = +[NSArray arrayWithObjects:v21 count:4];
      +[NSLayoutConstraint activateConstraints:v15];
    }
    [(DirectionsStepView *)self setNeedsLayout];
  }
}

- (id)_shieldImageFromStep:(id)a3 route:(id)a4 shieldSize:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = sub_100103BEC;
  CGFloat v25 = sub_100104680;
  id v26 = 0;
  v9 = [v7 geoStep];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10043EDA8;
  v20[3] = &unk_1012EA528;
  v20[4] = &v27;
  v20[5] = &v21;
  [v9 shieldInfo:v20];

  id v10 = [v7 geoStep];
  if ([v10 maneuverType] == 12)
  {
    int v11 = *((_DWORD *)v28 + 6);

    if (v11) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v17 = 0;
    goto LABEL_9;
  }
  unint64_t v12 = [v7 geoStep];
  if (![v12 maneuverIsHighwayExit])
  {
    uint64_t v17 = 0;
    goto LABEL_8;
  }
  int v18 = *((_DWORD *)v28 + 6);

  if (!v18) {
    goto LABEL_6;
  }
LABEL_3:
  id v10 = objc_alloc_init((Class)VKIconModifiers);
  [v10 setText:v22[5]];
  unint64_t v12 = +[VKIconManager sharedManager];
  uint64_t v13 = *((unsigned int *)v28 + 6);
  uint64_t v14 = v22[5];
  id v15 = +[UIScreen mainScreen];
  [v15 scale];
  *(float *)&double v16 = v16;
  uint64_t v17 = [v12 imageForDataID:v13 text:v14 contentScale:a5 sizeGroup:v10 modifiers:v16];

LABEL_8:
LABEL_9:
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v17;
}

+ (id)_roadDescriptionsLabelForStep:(id)a3 width:(double)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)MKMultiPartLabel) initWithFrame:0.0, 0.0, a4, 0.0];
  [v7 setNumberOfLines:0];
  [v7 setTextInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  id v8 = objc_msgSend(objc_msgSend(a1, "_labelListViewClassForRoute:step:", 0, v6), "fontsForStrings:route:step:tableMode:", &off_1013AD590, 0, v6, 0);
  v9 = [v8 lastObject];
  [v7 setFont:v9];

  id v10 = [a1 _multiPartAttributedStringForRoadDescriptionsInStep:v6];

  [v7 setMultiPartString:v10];

  return v7;
}

+ (id)_multiPartAttributedStringForRoadDescriptionsInStep:(id)a3
{
  id v4 = a3;
  if (qword_10160ECC0 != -1) {
    dispatch_once(&qword_10160ECC0, &stru_1012EA548);
  }
  id v5 = objc_alloc((Class)NSMutableArray);
  id v6 = [v4 geoStep];
  id v7 = [v5 initWithCapacity:[v6 roadDescriptionsCount]];

  id v8 = [v4 geoStep];
  v9 = [v8 roadDescriptions];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v15 = [v14 formattedDescription];
        NSAttributedStringKey v27 = NSForegroundColorAttributeName;
        double v16 = [v14 accentColor];
        uint64_t v17 = v16;
        if (!v16)
        {
          v3 = +[UIColor labelColor];
          uint64_t v17 = v3;
        }
        id v28 = v17;
        int v18 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        double v19 = +[NSAttributedString _mapkit_attributedTransitStringForServerFormattedString:v15 defaultAttributes:v18];

        if (!v16) {
        [v7 addObject:v19];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v11);
  }

  CGFloat v20 = +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:v7 repeatedSeparator:qword_10160ECC8];

  return v20;
}

- (void)_updateSignViewForStep:(id)a3 maneuverImage:(id)a4 route:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 drivingSide];
  [(DirectionsStepView *)self _updateStyleValuesFromTheme];
  id v10 = [v7 junction];
  if (v10)
  {
    id v11 = objc_alloc((Class)MKJunction);
    uint64_t v12 = [v7 junction];
    id v13 = [v11 initWithJunction:v12];
  }
  else
  {
    id v13 = 0;
  }

  uint64_t v14 = [GuidanceManeuverArtwork alloc];
  id v15 = [v7 maneuverType];
  double v16 = [v7 artworkOverride];
  uint64_t v17 = [(GuidanceManeuverArtwork *)v14 initWithManeuver:v15 junction:v13 drivingSide:v9 artworkDataSource:v16];
  int v18 = [(SimpleSignView *)self->_signView maneuverView];
  [v18 setManeuverArtwork:v17];

  double v19 = [(SimpleSignView *)self->_signView maneuverView];
  [v19 setFraming:1];

  CGFloat v20 = objc_opt_class();
  if (v20) {
    [v20 arrowMetrics];
  }
  else {
    memset(__src, 0, sizeof(__src));
  }
  uint64_t v21 = [(SimpleSignView *)self->_signView maneuverView];
  memcpy(__dst, __src, sizeof(__dst));
  [v21 setArrowMetrics:__dst];

  double v22 = objc_opt_class();
  if (v22) {
    [v22 junctionArrowMetrics];
  }
  else {
    memset(v29, 0, sizeof(v29));
  }
  long long v23 = [(SimpleSignView *)self->_signView maneuverView];
  memcpy(v28, v29, sizeof(v28));
  [v23 setJunctionArrowMetrics:v28];

  if ([v7 isEVChargerStep])
  {
    long long v24 = +[GEOFeatureStyleAttributes evChargerStyleAttributes];
    id v25 = [(id)objc_opt_class() signViewIconSize];
    long long v26 = +[UIScreen mainScreen];
    [v26 scale];
    NSAttributedStringKey v27 = +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v24, v25, 0);
    [(SimpleSignView *)self->_signView setShieldImage:v27];
  }
  else
  {
    [(SimpleSignView *)self->_signView setShieldImage:v8];
  }
}

- (id)signView
{
  signView = self->_signView;
  if (!signView)
  {
    long long v10 = 0u;
    id v4 = objc_opt_class();
    id v5 = [(DirectionsStepView *)self traitCollection];
    id v6 = [v5 userInterfaceIdiom];
    if (v4) {
      [v4 cellMetricsForIdiom:v6];
    }
    else {
      long long v10 = 0u;
    }

    id v7 = -[SimpleSignView initWithFrame:]([SimpleSignView alloc], "initWithFrame:", 0.0, 0.0, *((double *)&v10 + 1), 0.0);
    id v8 = self->_signView;
    self->_signView = v7;

    -[SimpleSignView setManeuverViewEdgeInsets:](self->_signView, "setManeuverViewEdgeInsets:", 5.0, 5.0, 5.0, 5.0);
    signView = self->_signView;
  }

  return signView;
}

- (void)setIsSelectedRow:(BOOL)a3
{
  if (self->_isSelectedRow != a3)
  {
    self->_isSelectedRow = a3;
    [(DirectionsStepView *)self _updateStyleValuesFromTheme];
  }
}

- (void)setIsDimmedStep:(BOOL)a3
{
  if (self->_isDimmedStep != a3)
  {
    self->_isDimmedStep = a3;
    [(DirectionsStepView *)self _updateStyleValuesFromTheme];
  }
}

- (double)_dimAlpha
{
  v2 = [(DirectionsStepView *)self traitCollection];
  double v3 = dbl_100F6F5B0[[v2 userInterfaceStyle] == (id)2];

  return v3;
}

- (void)_updateStyleValuesFromTheme
{
  if (self->_isDimmedStep) {
    [(DirectionsStepView *)self _dimAlpha];
  }
  else {
    double v3 = 1.0;
  }
  [(SimpleSignView *)self->_signView setAlpha:v3];
  id v4 = [(LabelListView *)self->_labelListView labels];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10043F824;
  v5[3] = &unk_1012EA570;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  [(SimpleSignView *)self->_signView updateStyleForTheme];
}

- (id)_majorLabelColor
{
  double v3 = +[UIColor labelColor];
  if (self->_isDimmedStep)
  {
    [(DirectionsStepView *)self _dimAlpha];
    uint64_t v4 = [v3 colorWithAlphaComponent:];

    double v3 = (void *)v4;
  }

  return v3;
}

- (id)_minorLabelColor
{
  double v3 = +[UIColor secondaryLabelColor];
  if (self->_isDimmedStep)
  {
    [(DirectionsStepView *)self _dimAlpha];
    uint64_t v4 = [v3 colorWithAlphaComponent:];

    double v3 = (void *)v4;
  }

  return v3;
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics
{
  return +[SignStyle arrowMetricsForStyle:1];
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics
{
  return +[SignStyle junctionArrowMetricsForStyle:1];
}

+ (unint64_t)signViewIconSize
{
  return 2;
}

+ (id)backgroundColorForIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)isSelectedRow
{
  return self->_isSelectedRow;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_roadDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_trailingViewGuide, 0);
  objc_storeStrong((id *)&self->_trailingGuideToContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_trailingGuideWidth, 0);
  objc_storeStrong((id *)&self->_labelListView, 0);

  objc_storeStrong((id *)&self->_signView, 0);
}

@end