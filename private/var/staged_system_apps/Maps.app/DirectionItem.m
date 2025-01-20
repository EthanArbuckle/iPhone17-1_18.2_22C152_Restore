@interface DirectionItem
+ (id)directionItemWithNanoRoutePlanningRequest:(id)a3;
+ (id)directionItemWithRideBookingSession:(id)a3;
+ (id)directionItemWithRoutePlanningSession:(id)a3;
- (BOOL)canAddStop;
- (BOOL)hasCurrentLocationOnlyAsOriginWaypoint;
- (BOOL)ignoreMapType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDirectionItem:(id)a3;
- (BOOL)isEquivalentAsWaypointToDirectionItem:(id)a3;
- (BOOL)isVenueItem;
- (CyclePreferences)cyclePreferences;
- (DirectionItem)initWithItems:(id)a3 ignoreMapType:(BOOL)a4 transportType:(int64_t)a5;
- (DirectionItem)initWithItems:(id)a3 transportType:(int64_t)a4;
- (DrivePreferences)drivePreferences;
- (GEOComposedGeometryRoutePersistentData)persistentData;
- (MKMapItem)endMapItem;
- (MKMapItem)startMapItem;
- (NSArray)items;
- (NSNumber)allowApproximateUserLocation;
- (RoutePlanningTiming)timing;
- (TransitPreferences)transitPreferences;
- (WalkPreferences)walkPreferences;
- (id)copyWithItems:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)transportType;
- (unint64_t)editRequired:(unint64_t *)a3;
- (unint64_t)numberOfCurrentLocationWaypoints:(id *)a3;
- (unint64_t)numberOfUserRequestedWaypoints;
- (unint64_t)venueCardID;
- (unint64_t)venueID;
- (void)setAllowApproximateUserLocation:(id)a3;
- (void)setCyclePreferences:(id)a3;
- (void)setDrivePreferences:(id)a3;
- (void)setIgnoreMapType:(BOOL)a3;
- (void)setPersistentData:(id)a3;
- (void)setTiming:(id)a3;
- (void)setTransitPreferences:(id)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setWalkPreferences:(id)a3;
@end

@implementation DirectionItem

- (DirectionItem)initWithItems:(id)a3 transportType:(int64_t)a4
{
  return [(DirectionItem *)self initWithItems:a3 ignoreMapType:1 transportType:a4];
}

- (DirectionItem)initWithItems:(id)a3 ignoreMapType:(BOOL)a4 transportType:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DirectionItem;
  v10 = [(DirectionItem *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_numberOfCurrentLocationWaypoints = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v10->_items, a3);
    v11->_ignoreMapType = a4;
    v11->_transportType = a5;
  }

  return v11;
}

- (id)copyWithItems:(id)a3
{
  id v4 = a3;
  v5 = [(DirectionItem *)self copy];
  id v6 = [v4 copy];

  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSArray *)self->_items copyWithZone:a3];
  v7 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v6;

  *((unsigned char *)v5 + 16) = self->_ignoreMapType;
  *((void *)v5 + 4) = self->_allowApproximateUserLocation;
  *((void *)v5 + 5) = self->_transportType;
  objc_storeStrong((id *)v5 + 7, self->_drivePreferences);
  objc_storeStrong((id *)v5 + 8, self->_walkPreferences);
  objc_storeStrong((id *)v5 + 9, self->_transitPreferences);
  objc_storeStrong((id *)v5 + 10, self->_cyclePreferences);
  objc_storeStrong((id *)v5 + 6, self->_timing);
  objc_storeStrong((id *)v5 + 11, self->_persistentData);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DirectionItem *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(DirectionItem *)self isEqualToDirectionItem:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToDirectionItem:(id)a3
{
  id v4 = (DirectionItem *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_21;
  }
  if (v4 == self)
  {
    unsigned __int8 v45 = 1;
    goto LABEL_23;
  }
  items = v4->_items;
  unint64_t v7 = self->_items;
  unint64_t v8 = items;
  if (v7 | v8)
  {
    id v9 = (void *)v8;
    unsigned int v10 = [(id)v7 isEqual:v8];

    if (!v10) {
      goto LABEL_21;
    }
  }
  if (self->_ignoreMapType != v5->_ignoreMapType) {
    goto LABEL_21;
  }
  if (self->_transportType != v5->_transportType) {
    goto LABEL_21;
  }
  allowApproximateUserLocation = v5->_allowApproximateUserLocation;
  unint64_t v12 = self->_allowApproximateUserLocation;
  unint64_t v13 = allowApproximateUserLocation;
  if (v12 | v13)
  {
    v14 = (void *)v13;
    unsigned int v15 = [(id)v12 isEqual:v13];

    if (!v15) {
      goto LABEL_21;
    }
  }
  drivePreferences = v5->_drivePreferences;
  unint64_t v17 = self->_drivePreferences;
  unint64_t v18 = drivePreferences;
  if (v17 | v18)
  {
    v19 = (void *)v18;
    unsigned int v20 = [(id)v17 isEqual:v18];

    if (!v20) {
      goto LABEL_21;
    }
  }
  walkPreferences = v5->_walkPreferences;
  unint64_t v22 = self->_walkPreferences;
  unint64_t v23 = walkPreferences;
  if (v22 | v23)
  {
    v24 = (void *)v23;
    unsigned int v25 = [(id)v22 isEqual:v23];

    if (!v25) {
      goto LABEL_21;
    }
  }
  transitPreferences = v5->_transitPreferences;
  unint64_t v27 = self->_transitPreferences;
  unint64_t v28 = transitPreferences;
  if (v27 | v28)
  {
    v29 = (void *)v28;
    unsigned int v30 = [(id)v27 isEqual:v28];

    if (!v30) {
      goto LABEL_21;
    }
  }
  cyclePreferences = v5->_cyclePreferences;
  unint64_t v32 = self->_cyclePreferences;
  unint64_t v33 = cyclePreferences;
  if (v32 | v33)
  {
    v34 = (void *)v33;
    unsigned int v35 = [(id)v32 isEqual:v33];

    if (!v35) {
      goto LABEL_21;
    }
  }
  timing = v5->_timing;
  unint64_t v37 = self->_timing;
  unint64_t v38 = timing;
  if (!(v37 | v38)
    || (v39 = (void *)v38,
        unsigned int v40 = [(id)v37 isEqual:v38],
        v39,
        (id)v37,
        v40))
  {
    persistentData = self->_persistentData;
    v42 = v5->_persistentData;
    id v43 = persistentData;
    v44 = v43;
    if ((unint64_t)v43 | (unint64_t)v42) {
      unsigned __int8 v45 = [v43 isEqual:v42];
    }
    else {
      unsigned __int8 v45 = 1;
    }
  }
  else
  {
LABEL_21:
    unsigned __int8 v45 = 0;
  }
LABEL_23:

  return v45;
}

- (BOOL)isEquivalentAsWaypointToDirectionItem:(id)a3
{
  id v4 = (DirectionItem *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_27;
  }
  if (v4 == self)
  {
    unsigned __int8 v45 = 1;
    goto LABEL_29;
  }
  id v6 = [(NSArray *)self->_items count];
  if (v6 != (id)[(NSArray *)v5->_items count]) {
    goto LABEL_27;
  }
  if ([(NSArray *)self->_items count])
  {
    unint64_t v7 = 0;
    unsigned __int8 v8 = 1;
    do
    {
      id v9 = [(NSArray *)self->_items objectAtIndexedSubscript:v7];
      unsigned int v10 = [(NSArray *)v5->_items objectAtIndexedSubscript:v7];
      if (v8) {
        unsigned __int8 v8 = [v9 isEquivalentAsWaypointToSearchFieldItem:v10];
      }
      else {
        unsigned __int8 v8 = 0;
      }

      ++v7;
    }
    while (v7 < [(NSArray *)self->_items count]);
    if ((v8 & 1) == 0) {
      goto LABEL_27;
    }
  }
  if (self->_ignoreMapType != v5->_ignoreMapType) {
    goto LABEL_27;
  }
  if (self->_transportType != v5->_transportType) {
    goto LABEL_27;
  }
  allowApproximateUserLocation = v5->_allowApproximateUserLocation;
  unint64_t v12 = self->_allowApproximateUserLocation;
  unint64_t v13 = allowApproximateUserLocation;
  if (v12 | v13)
  {
    v14 = (void *)v13;
    unsigned int v15 = [(id)v12 isEqual:v13];

    if (!v15) {
      goto LABEL_27;
    }
  }
  drivePreferences = v5->_drivePreferences;
  unint64_t v17 = self->_drivePreferences;
  unint64_t v18 = drivePreferences;
  if (v17 | v18)
  {
    v19 = (void *)v18;
    unsigned int v20 = [(id)v17 isEqual:v18];

    if (!v20) {
      goto LABEL_27;
    }
  }
  walkPreferences = v5->_walkPreferences;
  unint64_t v22 = self->_walkPreferences;
  unint64_t v23 = walkPreferences;
  if (v22 | v23)
  {
    v24 = (void *)v23;
    unsigned int v25 = [(id)v22 isEqual:v23];

    if (!v25) {
      goto LABEL_27;
    }
  }
  transitPreferences = v5->_transitPreferences;
  unint64_t v27 = self->_transitPreferences;
  unint64_t v28 = transitPreferences;
  if (v27 | v28)
  {
    v29 = (void *)v28;
    unsigned int v30 = [(id)v27 isEqual:v28];

    if (!v30) {
      goto LABEL_27;
    }
  }
  cyclePreferences = v5->_cyclePreferences;
  unint64_t v32 = self->_cyclePreferences;
  unint64_t v33 = cyclePreferences;
  if (v32 | v33)
  {
    v34 = (void *)v33;
    unsigned int v35 = [(id)v32 isEqual:v33];

    if (!v35) {
      goto LABEL_27;
    }
  }
  timing = v5->_timing;
  unint64_t v37 = self->_timing;
  unint64_t v38 = timing;
  if (!(v37 | v38)
    || (v39 = (void *)v38,
        unsigned int v40 = [(id)v37 isEqual:v38],
        v39,
        (id)v37,
        v40))
  {
    persistentData = self->_persistentData;
    v42 = v5->_persistentData;
    id v43 = persistentData;
    v44 = v43;
    if ((unint64_t)v43 | (unint64_t)v42) {
      unsigned __int8 v45 = [v43 isEqual:v42];
    }
    else {
      unsigned __int8 v45 = 1;
    }
  }
  else
  {
LABEL_27:
    unsigned __int8 v45 = 0;
  }
LABEL_29:

  return v45;
}

- (MKMapItem)startMapItem
{
  v2 = [(DirectionItem *)self items];
  v3 = [v2 firstObject];

  id v4 = [v3 searchResult];
  if (v4)
  {
    id v5 = [v3 searchResult];
    [v5 mapItem];
  }
  else
  {
    id v5 = [v3 address];
    [v5 geocodedMapItem];
  id v6 = };

  return (MKMapItem *)v6;
}

- (MKMapItem)endMapItem
{
  v2 = [(DirectionItem *)self items];
  v3 = [v2 lastObject];

  id v4 = [v3 searchResult];
  if (v4)
  {
    id v5 = [v3 searchResult];
    [v5 mapItem];
  }
  else
  {
    id v5 = [v3 address];
    [v5 geocodedMapItem];
  id v6 = };

  return (MKMapItem *)v6;
}

- (unint64_t)editRequired:(unint64_t *)a3
{
  if (a3) {
    *a3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = [(DirectionItem *)self items];
  id v6 = [v5 count];

  if (!v6) {
    return 4;
  }
  unint64_t v7 = [(DirectionItem *)self items];
  id v8 = [v7 count];

  if (v8 != (id)1)
  {
    id v27 = 0;
    unint64_t v10 = [(DirectionItem *)self numberOfCurrentLocationWaypoints:&v27];
    id v11 = v27;
    if (!v10)
    {
LABEL_18:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2020000000;
      uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v17 = [(DirectionItem *)self items];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10063F888;
      v22[3] = &unk_1012F2B40;
      v22[4] = &v23;
      [v17 enumerateObjectsUsingBlock:v22];

      unint64_t v18 = v24;
      if (a3) {
        *a3 = v24[3];
      }
      unint64_t v9 = 4 * (v18[3] != 0x7FFFFFFFFFFFFFFFLL);
      _Block_object_dispose(&v23, 8);
      goto LABEL_25;
    }
    unint64_t v12 = +[MKLocationManager sharedLocationManager];
    unsigned __int8 v13 = [v12 isLocationServicesPossiblyAvailable];

    if (v13)
    {
      v14 = +[MKLocationManager sharedLocationManager];
      if ([v14 isAuthorizedForPreciseLocation])
      {
      }
      else
      {
        unsigned int v15 = [(DirectionItem *)self allowApproximateUserLocation];

        if (!v15)
        {
          if (a3) {
            *a3 = (unint64_t)[v11 firstIndex];
          }
          unint64_t v9 = 3;
          goto LABEL_25;
        }
      }
      v16 = +[MKLocationManager sharedLocationManager];
      if ([v16 isAuthorizedForPreciseLocation])
      {

        goto LABEL_18;
      }
      v19 = [(DirectionItem *)self allowApproximateUserLocation];
      unsigned int v20 = [v19 BOOLValue];

      if (!a3 || (v20 & 1) != 0)
      {
        if (v20) {
          goto LABEL_18;
        }
LABEL_24:
        unint64_t v9 = 2;
LABEL_25:

        return v9;
      }
    }
    else if (!a3)
    {
      goto LABEL_24;
    }
    *a3 = (unint64_t)[v11 firstIndex];
    goto LABEL_24;
  }
  if ([(DirectionItem *)self hasCurrentLocationOnlyAsOriginWaypoint]) {
    return 4;
  }
  else {
    return 1;
  }
}

- (BOOL)hasCurrentLocationOnlyAsOriginWaypoint
{
  unint64_t v3 = [(DirectionItem *)self numberOfCurrentLocationWaypoints:0];
  if (v3)
  {
    id v4 = [(DirectionItem *)self items];
    id v5 = [v4 firstObject];
    id v6 = [v5 searchResult];
    unsigned __int8 v7 = [v6 isDynamicCurrentLocation];

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (unint64_t)numberOfCurrentLocationWaypoints:(id *)a3
{
  if (a3) {
    id v5 = objc_alloc_init((Class)NSMutableIndexSet);
  }
  else {
    id v5 = 0;
  }
  if (self->_numberOfCurrentLocationWaypoints == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = 0;
    unsigned __int8 v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    id v6 = [(DirectionItem *)self items];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10063FAAC;
    v9[3] = &unk_1012F2B68;
    id v10 = v5;
    id v11 = &v12;
    [v6 enumerateObjectsUsingBlock:v9];

    self->_unint64_t numberOfCurrentLocationWaypoints = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  if (a3) {
    *a3 = [v5 copy];
  }
  unint64_t numberOfCurrentLocationWaypoints = self->_numberOfCurrentLocationWaypoints;

  return numberOfCurrentLocationWaypoints;
}

- (unint64_t)numberOfUserRequestedWaypoints
{
  v2 = [(DirectionItem *)self items];
  unint64_t v3 = sub_1000AC254(v2, &stru_1012F2BA8);
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (BOOL)canAddStop
{
  int v3 = 0;
  switch([(DirectionItem *)self transportType])
  {
    case 0:
      if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0 && (MapsFeature_IsEnabled_Maps420() & 1) == 0) {
        goto LABEL_5;
      }
      int v3 = 1;
      break;
    case 1:
      int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
      goto LABEL_8;
    case 2:
LABEL_5:
      int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
      goto LABEL_8;
    case 5:
      int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_8:
      int v3 = IsEnabled_DrivingMultiWaypointRoutes;
      break;
    default:
      break;
  }
  unint64_t UInteger = GEOConfigGetUInteger();
  if (!v3) {
    return 0;
  }
  if (UInteger) {
    return [(DirectionItem *)self numberOfUserRequestedWaypoints] < UInteger;
  }
  return 1;
}

- (BOOL)isVenueItem
{
  int v3 = [(DirectionItem *)self startMapItem];
  id v4 = [v3 _venueInfo];
  id v5 = [v4 venueIdentifier];
  if ([v5 _hasVenueID])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    unsigned __int8 v7 = [(DirectionItem *)self endMapItem];
    id v8 = [v7 _venueInfo];
    unint64_t v9 = [v8 venueIdentifier];
    unsigned __int8 v6 = [v9 _hasVenueID];
  }
  return v6;
}

- (unint64_t)venueID
{
  int v3 = [(DirectionItem *)self endMapItem];
  id v4 = [v3 _venueInfo];
  id v5 = [v4 venueIdentifier];
  unsigned int v6 = [v5 _hasVenueID];

  if (v6)
  {
    unsigned __int8 v7 = [(DirectionItem *)self endMapItem];
LABEL_5:
    uint64_t v12 = v7;
    unsigned __int8 v13 = [v7 _venueInfo];
    uint64_t v14 = [v13 venueIdentifier];
    id v15 = [v14 venueID];

    return (unint64_t)v15;
  }
  id v8 = [(DirectionItem *)self startMapItem];
  unint64_t v9 = [v8 _venueInfo];
  id v10 = [v9 venueIdentifier];
  unsigned int v11 = [v10 _hasVenueID];

  if (v11)
  {
    unsigned __int8 v7 = [(DirectionItem *)self startMapItem];
    goto LABEL_5;
  }
  return 0;
}

- (unint64_t)venueCardID
{
  return 0;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)ignoreMapType
{
  return self->_ignoreMapType;
}

- (void)setIgnoreMapType:(BOOL)a3
{
  self->_ignoreMapType = a3;
}

- (NSNumber)allowApproximateUserLocation
{
  return self->_allowApproximateUserLocation;
}

- (void)setAllowApproximateUserLocation:(id)a3
{
  self->_allowApproximateUserLocation = (NSNumber *)a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (RoutePlanningTiming)timing
{
  return self->_timing;
}

- (void)setTiming:(id)a3
{
}

- (DrivePreferences)drivePreferences
{
  return self->_drivePreferences;
}

- (void)setDrivePreferences:(id)a3
{
}

- (WalkPreferences)walkPreferences
{
  return self->_walkPreferences;
}

- (void)setWalkPreferences:(id)a3
{
}

- (TransitPreferences)transitPreferences
{
  return self->_transitPreferences;
}

- (void)setTransitPreferences:(id)a3
{
}

- (CyclePreferences)cyclePreferences
{
  return self->_cyclePreferences;
}

- (void)setCyclePreferences:(id)a3
{
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_cyclePreferences, 0);
  objc_storeStrong((id *)&self->_transitPreferences, 0);
  objc_storeStrong((id *)&self->_walkPreferences, 0);
  objc_storeStrong((id *)&self->_drivePreferences, 0);
  objc_storeStrong((id *)&self->_timing, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

+ (id)directionItemWithNanoRoutePlanningRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 waypoints];
  id v5 = sub_100099700(v4, &stru_1012F4B78);

  unsigned int v6 = [DirectionItem alloc];
  unsigned int v7 = [v3 resolvedTransportType];

  if (v7 - 1 > 5) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = qword_100F702D8[v7 - 1];
  }
  unint64_t v9 = [(DirectionItem *)v6 initWithItems:v5 transportType:v8];

  return v9;
}

+ (id)directionItemWithRoutePlanningSession:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v26 = "+[DirectionItem(RoutePlanningSession) directionItemWithRoutePlanningSession:]";
      __int16 v27 = 2080;
      unint64_t v28 = "DirectionItem+RoutePlanningSession.m";
      __int16 v29 = 1024;
      int v30 = 31;
      __int16 v31 = 2080;
      unint64_t v32 = "routePlanningSession != nil";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      unint64_t v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unint64_t v18 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v5 = [v4 configuration];
  unsigned int v6 = [v5 originWaypointRequest];

  unsigned int v7 = [v4 configuration];
  uint64_t v8 = [v7 destinationWaypointRequest];

  if (!v6 || !v8)
  {
    v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unsigned int v20 = +[NSString stringWithFormat:@"We should have both origin and destination here"];
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = "+[DirectionItem(RoutePlanningSession) directionItemWithRoutePlanningSession:]";
      __int16 v27 = 2080;
      unint64_t v28 = "DirectionItem+RoutePlanningSession.m";
      __int16 v29 = 1024;
      int v30 = 35;
      __int16 v31 = 2080;
      unint64_t v32 = "origin && destination";
      __int16 v33 = 2112;
      v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        unint64_t v22 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100A25620;
  v23[3] = &unk_1012EECD0;
  id v24 = (id)objc_opt_new();
  id v9 = v24;
  [v4 enumerateRequestsOrWaypointsUsingBlock:v23];
  id v10 = [objc_alloc((Class)a1) initWithItems:v9 transportType:[v4 currentTransportType]];
  unsigned int v11 = [v4 timing];
  [v10 setTiming:v11];

  uint64_t v12 = [v4 drivePreferences];
  [v10 setDrivePreferences:v12];

  unsigned __int8 v13 = [v4 transitPreferences];
  [v10 setTransitPreferences:v13];

  uint64_t v14 = [v4 cyclePreferences];
  [v10 setCyclePreferences:v14];

  return v10;
}

+ (id)directionItemWithRideBookingSession:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    unsigned int v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "+[DirectionItem(RoutePlanningSession) directionItemWithRideBookingSession:]";
      __int16 v22 = 2080;
      uint64_t v23 = "DirectionItem+RoutePlanningSession.m";
      __int16 v24 = 1024;
      int v25 = 54;
      __int16 v26 = 2080;
      __int16 v27 = "rideBookingSession != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v5 = [v4 originRequest];
  uint64_t v6 = [v4 destinationRequest];
  unsigned int v7 = (void *)v6;
  if (!v5 || !v6)
  {
    uint64_t v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = +[NSString stringWithFormat:@"We should have both origin and destination here"];
      *(_DWORD *)buf = 136316162;
      v21 = "+[DirectionItem(RoutePlanningSession) directionItemWithRideBookingSession:]";
      __int16 v22 = 2080;
      uint64_t v23 = "DirectionItem+RoutePlanningSession.m";
      __int16 v24 = 1024;
      int v25 = 58;
      __int16 v26 = 2080;
      __int16 v27 = "origin && destination";
      __int16 v28 = 2112;
      __int16 v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        unint64_t v17 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v21 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100A259F4;
  v18[3] = &unk_1012EECD0;
  id v19 = (id)objc_opt_new();
  id v8 = v19;
  [v4 enumerateRequestsOrWaypointsUsingBlock:v18];
  id v9 = [objc_alloc((Class)a1) initWithItems:v8 transportType:4];

  return v9;
}

@end