@interface RideSharingSessionDirectionsPlanBuilder
- (RideBookingPlanningSession)session;
- (RideSharingSessionDirectionsPlanBuilder)initWithRideBookingPlanningSession:(id)a3;
- (id)buildDirectionsPlan;
- (void)_addOriginDestinationToPlan:(id)a3;
@end

@implementation RideSharingSessionDirectionsPlanBuilder

- (RideSharingSessionDirectionsPlanBuilder)initWithRideBookingPlanningSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RideSharingSessionDirectionsPlanBuilder;
  v6 = [(RideSharingSessionDirectionsPlanBuilder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v7;
}

- (id)buildDirectionsPlan
{
  v3 = objc_alloc_init(DirectionsPlan);
  id v4 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
  [(DirectionsPlan *)v3 setRouteRequestStorage:v4];
  id v5 = [(DirectionsPlan *)v3 routeRequestStorage];
  [v5 setTransportType:6];

  [(DirectionsPlan *)v3 setDisplayMethod:1];
  v6 = +[DirectionsPlan _maps_expiryDateForRoute:0];
  [v6 timeIntervalSinceReferenceDate];
  -[DirectionsPlan setExpiryTime:](v3, "setExpiryTime:");

  [(RideSharingSessionDirectionsPlanBuilder *)self _addOriginDestinationToPlan:v3];
  v7 = sub_100084D38();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    if (!v8)
    {
      v13 = @"<nil>";
      goto LABEL_10;
    }
    objc_super v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      v11 = [(RideSharingSessionDirectionsPlanBuilder *)v8 performSelector:"accessibilityIdentifier"];
      v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

LABEL_10:
    v14 = v13;
    id v15 = (id)[(DirectionsPlan *)v3 displayMethod];
    if (v15 >= 3)
    {
      v16 = +[NSString stringWithFormat:@"(unknown: %i)", v15];
    }
    else
    {
      v16 = off_1012F9150[(int)v15];
    }
    v17 = v16;
    id v18 = [v4 waypointsCount];
    [(DirectionsPlan *)v3 expiryTime];
    v19 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

    *(_DWORD *)buf = 138544130;
    v22 = v14;
    __int16 v23 = 2114;
    v24 = v16;
    __int16 v25 = 2048;
    id v26 = v18;
    __int16 v27 = 2112;
    v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Prepared directions plan (%{public}@, %lu waypoints, expires: %@)", buf, 0x2Au);
  }

  return v3;
}

- (void)_addOriginDestinationToPlan:(id)a3
{
  id v4 = a3;
  id v5 = [(RideSharingSessionDirectionsPlanBuilder *)self session];
  id v16 = [v5 resolvedWaypoints];

  if (v16)
  {
    v6 = [v4 routeRequestStorage];
    v7 = [v16 origin];
    [v6 addWaypoints:v7];

    v8 = [v4 routeRequestStorage];

    objc_super v9 = [v16 destination];
    [v8 addWaypoints:v9];
  }
  else
  {
    v10 = [(RideSharingSessionDirectionsPlanBuilder *)self session];
    v11 = [v10 originRequest];
    v12 = [v11 waypointPlaceholder];
    v13 = [v12 name];
    [v4 setOriginString:v13];

    v8 = [(RideSharingSessionDirectionsPlanBuilder *)self session];
    objc_super v9 = [v8 destinationRequest];
    v14 = [v9 waypointPlaceholder];
    id v15 = [v14 name];
    [v4 setDestinationString:v15];
  }
}

- (RideBookingPlanningSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
}

@end