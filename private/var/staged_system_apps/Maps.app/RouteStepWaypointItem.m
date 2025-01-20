@interface RouteStepWaypointItem
- (DirectionsWaypoint)waypoint;
- (GEOComposedRouteStep)arrivalStep;
- (NSAttributedString)primaryText;
- (NSAttributedString)secondaryText;
- (RouteStepWaypointItem)initWithWaypoint:(id)a3 waypointType:(unint64_t)a4 arrivalStep:(id)a5 vehicle:(id)a6 route:(id)a7 cellClass:(Class)a8 state:(unint64_t)a9 metrics:(id)a10 context:(int64_t)a11 scale:(double)a12;
- (UIImage)pinImage;
- (VGVehicle)vehicle;
- (id)_stepWithEVInfo;
- (id)description;
- (unint64_t)waypointType;
- (void)_computeContent;
- (void)reset;
@end

@implementation RouteStepWaypointItem

- (RouteStepWaypointItem)initWithWaypoint:(id)a3 waypointType:(unint64_t)a4 arrivalStep:(id)a5 vehicle:(id)a6 route:(id)a7 cellClass:(Class)a8 state:(unint64_t)a9 metrics:(id)a10 context:(int64_t)a11 scale:(double)a12
{
  id v26 = a3;
  id v25 = a5;
  id v24 = a6;
  id v20 = a10;
  v27.receiver = self;
  v27.super_class = (Class)RouteStepWaypointItem;
  v21 = [(RouteStepItem *)&v27 initWithCellClass:a8 state:a9 metrics:v20 context:a11 route:a7 scale:a12];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_waypoint, a3);
    v22->_waypointType = a4;
    objc_storeStrong((id *)&v22->_arrivalStep, a5);
    objc_storeStrong((id *)&v22->_vehicle, a6);
    [v20 imageAreaWidth];
    -[RouteStepItem setHairlineLeadingInset:](v22, "setHairlineLeadingInset:");
    [v20 textTrailingMargin];
    -[RouteStepItem setHairlineTrailingInset:](v22, "setHairlineTrailingInset:");
  }

  return v22;
}

- (void)reset
{
  self->_computedContent = 0;
}

- (NSAttributedString)primaryText
{
  if (!self->_computedContent) {
    [(RouteStepWaypointItem *)self _computeContent];
  }
  primaryText = self->_primaryText;

  return primaryText;
}

- (NSAttributedString)secondaryText
{
  if (!self->_computedContent) {
    [(RouteStepWaypointItem *)self _computeContent];
  }
  secondaryText = self->_secondaryText;

  return secondaryText;
}

- (UIImage)pinImage
{
  if (!self->_computedContent) {
    [(RouteStepWaypointItem *)self _computeContent];
  }
  pinImage = self->_pinImage;

  return pinImage;
}

- (void)_computeContent
{
  self->_computedContent = 1;
  primaryText = self->_primaryText;
  self->_primaryText = 0;

  unint64_t v4 = [(RouteStepWaypointItem *)self waypointType];
  if (self->_arrivalStep)
  {
    v5 = [(RouteStepItem *)self route];
    id v6 = [v5 legIndexForStepIndex:[self->_arrivalStep stepIndex]];
  }
  else
  {
    id v6 = 0;
  }
  v7 = [(RouteStepItem *)self route];
  v8 = [v7 legs];
  id v9 = [v8 count];

  if (v6 >= v9)
  {
    v89 = 0;
    v13 = 0;
  }
  else
  {
    v10 = [(RouteStepItem *)self route];
    v11 = [v10 legs];
    v12 = [v11 objectAtIndexedSubscript:v6];

    if (v4) {
      [v12 destination];
    }
    else {
    v14 = [v12 origin];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 name];
    }
    else
    {
      if (v4) {
        [v12 destinationListInstructionString];
      }
      else {
      uint64_t v15 = [v12 originListInstructionString];
      }
    }
    v13 = (void *)v15;
    v89 = v12;
  }
  v16 = [(RouteStepWaypointItem *)self waypoint];
  unsigned int v17 = [v16 isDynamicCurrentLocation];

  if ([v13 length]) {
    unsigned int v18 = 0;
  }
  else {
    unsigned int v18 = v17;
  }
  if (v18 == 1)
  {
    uint64_t v19 = MKLocalizedStringForCurrentLocation();
LABEL_30:
    int v84 = v18 ^ 1;

    v13 = (void *)v19;
    goto LABEL_31;
  }
  if ([v13 length])
  {
    int v84 = 0;
    goto LABEL_31;
  }
  unint64_t v20 = [(RouteStepWaypointItem *)self waypointType];
  switch(v20)
  {
    case 2uLL:
      v21 = +[NSBundle mainBundle];
      v22 = v21;
      CFStringRef v23 = @"Arrive [Directions Step]";
      goto LABEL_29;
    case 1uLL:
      v21 = +[NSBundle mainBundle];
      v22 = v21;
      CFStringRef v23 = @"Stop [Directions Step]";
      goto LABEL_29;
    case 0uLL:
      v21 = +[NSBundle mainBundle];
      v22 = v21;
      CFStringRef v23 = @"Start [Directions Step]";
LABEL_29:
      uint64_t v19 = [v21 localizedStringForKey:v23 value:@"localized string not found" table:0];

      v13 = v22;
      goto LABEL_30;
  }
  int v84 = 1;
LABEL_31:
  unint64_t v86 = v4;
  if ([v13 length])
  {
    id v24 = [(RouteStepItem *)self metrics];
    id v25 = [v24 primaryTextFontStyle];
    id v26 = [(RouteStepItem *)self metrics];
    [v26 primaryTextFontWeight];
    double v28 = v27;
    v29 = [(RouteStepItem *)self traitCollection];
    v30 = +[UIFont _maps_fontWithTextStyle:v25 weight:v29 compatibleWithTraitCollection:v28];

    id v31 = objc_alloc((Class)NSAttributedString);
    v93[0] = v30;
    v92[0] = NSFontAttributeName;
    v92[1] = NSForegroundColorAttributeName;
    unint64_t v32 = [(RouteStepItem *)self state];
    v33 = [(RouteStepItem *)self metrics];
    v34 = v33;
    if (v32) {
      [v33 primaryTextActiveTextColor];
    }
    else {
    v35 = [v33 primaryTextDisabledTextColor];
    }
    v93[1] = v35;
    v36 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
    v37 = (NSAttributedString *)[v31 initWithString:v13 attributes:v36];
    v38 = self->_primaryText;
    self->_primaryText = v37;

    unint64_t v4 = v86;
  }
  if (v4) {
    [v89 destination];
  }
  else {
  v39 = [v89 origin];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v41 = [(RouteStepItem *)self metrics];
  v42 = [v41 secondaryTextFontStyle];
  v43 = [(RouteStepItem *)self metrics];
  [v43 secondaryTextFontWeight];
  double v45 = v44;
  v46 = [(RouteStepItem *)self traitCollection];
  uint64_t v88 = +[UIFont _maps_fontWithTextStyle:v42 weight:v46 compatibleWithTraitCollection:v45];

  unint64_t v47 = [(RouteStepItem *)self state];
  v48 = [(RouteStepItem *)self metrics];
  v49 = v48;
  if (v47) {
    [v48 secondaryTextActiveTextColor];
  }
  else {
  uint64_t v50 = [v48 secondaryTextDisabledTextColor];
  }

  v90[0] = NSFontAttributeName;
  v90[1] = NSForegroundColorAttributeName;
  v51 = (void *)v88;
  v91[0] = v88;
  v91[1] = v50;
  uint64_t v52 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
  v85 = v13;
  if (!v89)
  {
    id v55 = 0;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_51;
    }
LABEL_47:
    v87 = 0;
    goto LABEL_52;
  }
  if (![v39 hasFindMyHandleID])
  {
    if (isKindOfClass)
    {
      p_secondaryText = &self->_secondaryText;
      secondaryText = self->_secondaryText;
      self->_secondaryText = 0;

      v87 = 0;
      goto LABEL_55;
    }
    +[RouteStepWaypointItemUtil attributedSubtitleForLeg:v89 waypoint:v39 isOrigin:v86 == 0 attributes:v52];
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  id v53 = objc_alloc((Class)NSAttributedString);
  v54 = [v39 arrivingDisplayName];
  id v55 = [v53 initWithString:v54 attributes:v52];

  if (isKindOfClass) {
    goto LABEL_47;
  }
LABEL_51:
  v58 = [(RouteStepWaypointItem *)self waypoint];
  v87 = [v58 singleLineAddress];

LABEL_52:
  p_secondaryText = &self->_secondaryText;
  v59 = self->_secondaryText;
  self->_secondaryText = 0;

  if (v55)
  {
    v60 = (NSAttributedString *)v55;
    v61 = v60;
LABEL_54:
    v62 = *p_secondaryText;
    *p_secondaryText = v60;
LABEL_58:

    goto LABEL_59;
  }
LABEL_55:
  v63 = [(RouteStepWaypointItem *)self vehicle];

  if (v63)
  {
    v62 = [(RouteStepWaypointItem *)self _stepWithEVInfo];
    [v62 attributedChargeStringForWaypointType:[self waypointType] font:v88 textColor:v50 includeDaysAgo:v86 == 0];
    v64 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
LABEL_57:
    v65 = *p_secondaryText;
    *p_secondaryText = v64;

    v61 = 0;
    goto LABEL_58;
  }
  if ([v87 length])
  {
    v60 = (NSAttributedString *)[objc_alloc((Class)NSAttributedString) initWithString:v87 attributes:v52];
    v61 = 0;
    goto LABEL_54;
  }
  if (v84)
  {
    id v83 = objc_alloc((Class)NSAttributedString);
    v62 = MKLocalizedStringForUnknownLocation();
    v64 = (NSAttributedString *)[v83 initWithString:v62 attributes:v52];
    goto LABEL_57;
  }
  v61 = 0;
LABEL_59:
  v66 = (void *)v50;
  v67 = [v39 chargingInfo];

  v68 = (void *)v52;
  if (v67)
  {
    v69 = +[GEOFeatureStyleAttributes evChargerStyleAttributes];
    v70 = [(RouteStepItem *)self metrics];
    id v71 = [v70 iconSize];
    [(RouteStepItem *)self scale];
    v72 = v69;
    id v73 = v71;
  }
  else
  {
    if ((isKindOfClass & 1) == 0)
    {
      v69 = [(RouteStepWaypointItem *)self waypoint];
      v70 = [v69 mapItemIfLoaded];
      [(RouteStepItem *)self scale];
      double v78 = v77;
      v76 = [(RouteStepItem *)self metrics];
      id v79 = [v76 iconSize];
      v80 = [(RouteStepItem *)self metrics];
      +[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v70, v79, [v80 useMarkerFallback], v78);
      v81 = (UIImage *)objc_claimAutoreleasedReturnValue();
      pinImage = self->_pinImage;
      self->_pinImage = v81;

      v51 = (void *)v88;
      goto LABEL_64;
    }
    v69 = +[GEOFeatureStyleAttributes customSavedRouteStyleAttributes];
    v70 = [(RouteStepItem *)self metrics];
    id v74 = [v70 iconSize];
    [(RouteStepItem *)self scale];
    v72 = v69;
    id v73 = v74;
  }
  +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v72, v73, 0);
  v75 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v76 = self->_pinImage;
  self->_pinImage = v75;
LABEL_64:
}

- (id)_stepWithEVInfo
{
  unint64_t v4 = [(RouteStepWaypointItem *)self waypointType];
  if (v4 == 2)
  {
    v5 = [(RouteStepItem *)self route];
    uint64_t v7 = [v5 lastEVStep];
LABEL_18:
    v2 = (void *)v7;
LABEL_19:

    goto LABEL_20;
  }
  if (v4 != 1)
  {
    if (v4) {
      goto LABEL_20;
    }
    v5 = [(RouteStepItem *)self route];
    id v6 = [v5 steps];
    v2 = [v6 firstObject];

    goto LABEL_19;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = [(RouteStepItem *)self route];
  id v9 = [v8 legs];

  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
LABEL_8:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
      id v15 = [v14 endStepIndex];
      v16 = [(RouteStepWaypointItem *)self arrivalStep];
      id v17 = [v16 stepIndex];

      if (v15 >= v17) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
    id v18 = [v14 legIndex];

    if (v18 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_16;
    }
    v5 = [(RouteStepItem *)self route];
    uint64_t v7 = [v5 lastEVStepInLegWithIndex:v18];
    goto LABEL_18;
  }
LABEL_14:

LABEL_16:
  v2 = 0;
LABEL_20:

  return v2;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(RouteStepWaypointItem *)self primaryText];
  v5 = [v4 string];
  id v6 = [(RouteStepWaypointItem *)self secondaryText];
  uint64_t v7 = [v6 string];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; primaryText = %@; secondaryText = %@>",
    v3,
    self,
    v5,
  v8 = v7);

  return v8;
}

- (DirectionsWaypoint)waypoint
{
  return self->_waypoint;
}

- (unint64_t)waypointType
{
  return self->_waypointType;
}

- (GEOComposedRouteStep)arrivalStep
{
  return self->_arrivalStep;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_arrivalStep, 0);
  objc_storeStrong((id *)&self->_waypoint, 0);
  objc_storeStrong((id *)&self->_pinImage, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);

  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end