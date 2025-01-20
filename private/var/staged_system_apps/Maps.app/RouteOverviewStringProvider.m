@interface RouteOverviewStringProvider
+ (id)artworkDataForRoute:(id)a3;
+ (id)etaStringFromRoute:(id)a3;
+ (id)primaryTextForRoute:(id)a3 font:(id)a4;
+ (id)routeDescriptionTextForRoute:(id)a3 font:(id)a4;
+ (id)secondaryMultiPartTextForRoute:(id)a3 font:(id)a4;
+ (unint64_t)adjustedTransportTypeForRoute:(id)a3;
@end

@implementation RouteOverviewStringProvider

+ (id)primaryTextForRoute:(id)a3 font:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 previewDurationString];

  if (v7)
  {
    v8 = [v5 previewDurationString];
    NSAttributedStringKey v14 = NSFontAttributeName;
    id v15 = v6;
    v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100CDCDAC;
    v12[3] = &unk_1013211D8;
    id v13 = v5;
    v10 = +[NSAttributedString _mapkit_attributedStringForComposedString:v8 defaultAttributes:v9 argumentOverrideHandler:v12];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)routeDescriptionTextForRoute:(id)a3 font:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = [v5 planningDescriptionString];
  if (v8) {
    [v7 addObject:v8];
  }
  v9 = [v5 planningSeparatorString];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = +[NSBundle mainBundle];
    id v11 = [v12 localizedStringForKey:@"Route description [separator]" value:@"localized string not found" table:0];
  }
  id v13 = [objc_alloc((Class)NSAttributedString) initWithString:v11];
  v18[0] = NSFontAttributeName;
  v18[1] = MKServerFormattedStringArtworkSFSymbolScaleAttributeKey;
  v19[0] = v6;
  v19[1] = &off_1013AAFA8;
  v18[2] = MKServerFormattedStringArtworkSFSymbolStyleAttributeKey;
  NSAttributedStringKey v14 = +[NSNumber numberWithDouble:UIFontWeightLight];
  v19[2] = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  v16 = +[MKMultiPartAttributedString _mapkit_multiPartAttributedStringForComposedStrings:v7 defaultAttributes:v15 repeatedSeparator:v13];

  return v16;
}

+ (id)secondaryMultiPartTextForRoute:(id)a3 font:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 transportType] == 1) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = [v6 isWalkingOnlyTransitRoute] ^ 1;
  }
  id v9 = objc_alloc_init((Class)NSMutableArray);
  if ([v6 transportType]) {
    goto LABEL_5;
  }
  v10 = [v6 routeAttributes];
  unsigned int v11 = [v10 hasTimepoint];

  if (v11)
  {
    v12 = [v6 routeAttributes];
    id v13 = v12;
    if (v12) {
      [v12 timepoint];
    }
    else {
      uint64_t v32 = 0;
    }

LABEL_5:
    if ((v8 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (!v8) {
    goto LABEL_17;
  }
LABEL_11:
  if (MapsFeature_IsEnabled_FCLShowETA())
  {
    NSAttributedStringKey v14 = [a1 etaStringFromRoute:v6];
    if (v14) {
      [v9 addObject:v14];
    }
  }
LABEL_17:
  id v15 = [v6 planningDistanceString:v32];

  if (v15)
  {
    v16 = [v6 planningDistanceString];
    v17 = [v16 optionsWithArgumentHandler:&stru_1013211F8];
    [v17 setShouldUpdateFormatStrings:1];
    v18 = [v16 composedStringWithOptions:v17];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [v6 planningDistanceString];
    }
    v21 = v20;

    [v9 addObject:v21];
  }
  if ([v6 transportType] == 1
    || [v6 isWalkingOnlyTransitRoute])
  {
    v22 = [v6 planningDescriptionString];

    if (v22)
    {
      v23 = [v6 planningDescriptionString];
      [v9 addObject:v23];
    }
  }
  v24 = [v6 planningSeparatorString];
  v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    v27 = +[NSBundle mainBundle];
    id v26 = [v27 localizedStringForKey:@"Route description [separator]" value:@"localized string not found" table:0];
  }
  id v28 = [objc_alloc((Class)NSAttributedString) initWithString:v26];
  NSAttributedStringKey v33 = NSFontAttributeName;
  id v34 = v7;
  v29 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v30 = +[MKMultiPartAttributedString _mapkit_multiPartAttributedStringForComposedStrings:v9 defaultAttributes:v29 repeatedSeparator:v28];

  return v30;
}

+ (id)etaStringFromRoute:(id)a3
{
  id v3 = a3;
  [v3 travelAndChargingDuration];
  double v5 = (double)(60 * vcvtpd_u64_f64(v4 / 60.0));
  id v6 = [v3 routeAttributes];
  if ([v6 hasTimepoint])
  {
    id v7 = [v3 routeAttributes];
    unsigned int v8 = v7;
    if (v7)
    {
      [v7 timepoint];
      double v9 = v23;
    }
    else
    {
      double v9 = 0.0;
    }
    v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v9];
  }
  else
  {
    v10 = +[NSDate date];
  }

  unsigned int v11 = [v10 dateByAddingTimeInterval:v5];
  id v12 = [v3 destination];

  if (v12)
  {
    if (qword_101610EF8 != -1) {
      dispatch_once(&qword_101610EF8, &stru_101321218);
    }
    id v13 = [v3 destination];
    NSAttributedStringKey v14 = [v13 timezone];
    [(id)qword_101610F00 setTimeZone:v14];

    id v15 = [(id)qword_101610F08 component:32 fromDate:v11];
    v16 = +[NSBundle mainBundle];
    v17 = v16;
    if (v15 == (id)1) {
      CFStringRef v18 = @"ETA [ETA String] (Singular) 1:xx";
    }
    else {
      CFStringRef v18 = @"ETA [ETA String] (Plural)";
    }
    v19 = [v16 localizedStringForKey:v18 value:@"localized string not found" table:0];
    id v20 = [(id)qword_101610F00 stringFromDate:v11];
    v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v20);

    id v12 = [objc_alloc((Class)GEOComposedString) initWithString:v21];
  }

  return v12;
}

+ (id)artworkDataForRoute:(id)a3
{
  id v4 = a3;
  if ([a1 adjustedTransportTypeForRoute:v4] == (id)4)
  {
    double v5 = [v4 routePlanningArtworks];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

+ (unint64_t)adjustedTransportTypeForRoute:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 transportType];
  if (v4 > 5) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = qword_100F73E80[v4];
  }
  unsigned int v6 = [v3 isWalkingOnlyTransitRoute];

  if (v6) {
    return 4;
  }
  else {
    return v5;
  }
}

@end