@interface CurrentLocationWaypointRequest
- (BOOL)hasCachedResult;
- (BOOL)isCurrentLocation;
- (BOOL)isEquivalentToOtherRequest:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (CurrentLocationMapServiceTicket)ticket;
- (CurrentLocationWaypointRequest)init;
- (CurrentLocationWaypointRequest)initWithCurrentLocationTicket:(id)a3;
- (MKMapItem)mapItemForLocationComparison;
- (NSString)debugDescription;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)waypointIconWithScale:(double)a3;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)dealloc;
- (void)recordRAPInformation:(id)a3;
@end

@implementation CurrentLocationWaypointRequest

- (CurrentLocationWaypointRequest)initWithCurrentLocationTicket:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CurrentLocationWaypointRequest;
  v6 = [(CurrentLocationWaypointRequest *)&v9 init];
  if (v6)
  {
    v7 = sub_10059B868();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initiailizing with ticket: %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_ticket, a3);
  }

  return v6;
}

- (CurrentLocationWaypointRequest)init
{
  v3 = [CurrentLocationMapServiceTicket alloc];
  v4 = +[MKLocationManager sharedLocationManager];
  id v5 = [(CurrentLocationMapServiceTicket *)v3 initWithLocationManager:v4];

  v6 = [(CurrentLocationWaypointRequest *)self initWithCurrentLocationTicket:v5];
  return v6;
}

- (void)dealloc
{
  v3 = sub_10059B868();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)CurrentLocationWaypointRequest;
  [(CurrentLocationWaypointRequest *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [CurrentLocationMapServiceTicket alloc];
  v6 = [(CurrentLocationWaypointRequest *)self ticket];
  v7 = [v6 locationManager];
  v8 = [(CurrentLocationMapServiceTicket *)v5 initWithLocationManager:v7];

  id v9 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCurrentLocationTicket:", v8);
  return v9;
}

- (NSString)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100091744;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  objc_super v4 = objc_retainBlock(&v14);
  [(CurrentLocationWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(CurrentLocationWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@", "];
  __int16 v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_10059C130;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  objc_super v4 = objc_retainBlock(&v14);
  [(CurrentLocationWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(CurrentLocationWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@"\n"];
  __int16 v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
}

- (CLLocationCoordinate2D)coordinate
{
  v2 = [(CurrentLocationWaypointRequest *)self ticket];
  id v3 = [v2 currentLocation];

  if (v3)
  {
    [v3 coordinate];
    CLLocationDegrees latitude = v4;
    CLLocationDegrees longitude = v6;
  }
  else
  {
    CLLocationDegrees latitude = kCLLocationCoordinate2DInvalid.latitude;
    CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  double v8 = latitude;
  double v9 = longitude;
  result.CLLocationDegrees longitude = v9;
  result.CLLocationDegrees latitude = v8;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 1;
}

- (BOOL)hasCachedResult
{
  return 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  return +[MKMapItem mapItemForCurrentLocation];
}

- (id)waypointIconWithScale:(double)a3
{
  double v4 = +[GEOFeatureStyleAttributes currentLocationStyleAttributes];
  id v5 = +[MKIconManager imageForStyle:v4 size:0 forScale:0 format:a3];

  return v5;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  return 0;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  __int16 v12 = [(CurrentLocationWaypointRequest *)self ticket];
  [v12 submitWithTraits:v11 completionHandler:v10 networkActivityHandler:v9];

  return [(CurrentLocationWaypointRequest *)self ticket];
}

- (void)recordRAPInformation:(id)a3
{
  id v10 = a3;
  [v10 setOrigin:2];
  double v4 = [(CurrentLocationWaypointRequest *)self ticket];
  id v5 = [v4 currentLocation];

  if (v5)
  {
    id v6 = objc_alloc((Class)GEOLatLng);
    [v5 coordinate];
    double v8 = v7;
    [v5 coordinate];
    id v9 = [v6 initWithLatitude:v8];
    [v10 setCoordinate:v9];
  }
}

- (CurrentLocationMapServiceTicket)ticket
{
  return self->_ticket;
}

- (void).cxx_destruct
{
}

@end