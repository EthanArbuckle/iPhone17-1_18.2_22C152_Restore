@interface RoutePlanningSessionDirectionsPlanBuilder
- (NavigationSession)navigationSession;
- (RoutePlanningSession)session;
- (RoutePlanningSessionDirectionsPlanBuilder)initWithRoutePlanningSession:(id)a3 fidelity:(unint64_t)a4;
- (RoutePlanningSessionDirectionsPlanBuilder)initWithSessionStack:(id)a3 fidelity:(unint64_t)a4;
- (id)_timingForTransportType:(int64_t)a3;
- (id)_transitPreferences;
- (id)buildDirectionsPlan;
- (unint64_t)fidelity;
- (void)_addOriginDestinationToPlan:(id)a3;
- (void)_addTimingToPlan:(id)a3;
- (void)_addTransitOptionsToPlan:(id)a3;
- (void)setFidelity:(unint64_t)a3;
- (void)setNavigationSession:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation RoutePlanningSessionDirectionsPlanBuilder

- (RoutePlanningSessionDirectionsPlanBuilder)initWithSessionStack:(id)a3 fidelity:(unint64_t)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RoutePlanningSessionDirectionsPlanBuilder;
  v7 = [(RoutePlanningSessionDirectionsPlanBuilder *)&v25 init];
  v8 = v7;
  if (!v7)
  {
LABEL_21:
    v18 = v8;
    goto LABEL_22;
  }
  v7->_fidelity = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v9 = [v6 reverseObjectEnumerator];
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v8->_session, v14);
          goto LABEL_12;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (v8->_session)
  {
    v15 = [v6 indexOfObject:];
    if (v15 < [v6 count])
    {
      while (1)
      {
        v16 = [v6 objectAtIndexedSubscript:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }

        if (++v15 >= [v6 count]) {
          goto LABEL_21;
        }
      }
      navigationSession = v8->_navigationSession;
      v8->_navigationSession = v16;
    }
    goto LABEL_21;
  }
  v17 = sub_100084D38();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "No route planning session present in stack: %@", buf, 0xCu);
  }

  v18 = 0;
LABEL_22:

  return v18;
}

- (RoutePlanningSessionDirectionsPlanBuilder)initWithRoutePlanningSession:(id)a3 fidelity:(unint64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v15 = "-[RoutePlanningSessionDirectionsPlanBuilder initWithRoutePlanningSession:fidelity:]";
      __int16 v16 = 2080;
      v17 = "RoutePlanningSessionDirectionsPlanBuilder.m";
      __int16 v18 = 1024;
      int v19 = 72;
      __int16 v20 = 2080;
      long long v21 = "session != nil";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v13 = v6;
  v7 = +[NSArray arrayWithObjects:&v13 count:1];
  v8 = [(RoutePlanningSessionDirectionsPlanBuilder *)self initWithSessionStack:v7 fidelity:a4];

  return v8;
}

- (id)buildDirectionsPlan
{
  v3 = objc_alloc_init(DirectionsPlan);
  id v4 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
  [(DirectionsPlan *)v3 setRouteRequestStorage:v4];
  v5 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
  unint64_t v6 = (unint64_t)[v5 currentTransportType] - 2;
  if (v6 > 3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = dword_100F6F5C0[v6];
  }
  v8 = [(DirectionsPlan *)v3 routeRequestStorage];
  [v8 setTransportType:v7];

  [(DirectionsPlan *)v3 setDisplayMethod:1];
  v9 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
  id v10 = [v9 currentRouteCollection];

  if (v10) {
    -[DirectionsPlan setCurrentRouteIndex:](v3, "setCurrentRouteIndex:", [v10 currentRouteIndex]);
  }
  id v11 = [v10 currentRoute];
  if (v11)
  {
    id v12 = [objc_alloc((Class)GEOURLRouteHandle) initWithRoute:v11 fidelity:[self fidelity]];
    id v13 = [(DirectionsPlan *)v3 routeRequestStorage];
    [v13 setRouteHandle:v12];
  }
  v14 = [v10 currentRoute];
  v15 = +[DirectionsPlan _maps_expiryDateForRoute:v14];
  [v15 timeIntervalSinceReferenceDate];
  -[DirectionsPlan setExpiryTime:](v3, "setExpiryTime:");

  [(RoutePlanningSessionDirectionsPlanBuilder *)self _addOriginDestinationToPlan:v3];
  [(RoutePlanningSessionDirectionsPlanBuilder *)self _addTransitOptionsToPlan:v3];
  [(RoutePlanningSessionDirectionsPlanBuilder *)self _addTimingToPlan:v3];
  __int16 v16 = sub_100084D38();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = self;
    if (!v17)
    {
      long long v22 = @"<nil>";
      goto LABEL_17;
    }
    __int16 v18 = (objc_class *)objc_opt_class();
    int v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      __int16 v20 = [(RoutePlanningSessionDirectionsPlanBuilder *)v17 performSelector:"accessibilityIdentifier"];
      long long v21 = v20;
      if (v20 && ![v20 isEqualToString:v19])
      {
        long long v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

        goto LABEL_15;
      }
    }
    long long v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_15:

LABEL_17:
    long long v23 = v22;
    id v24 = (id)[(DirectionsPlan *)v3 displayMethod];
    if (v24 >= 3)
    {
      objc_super v25 = +[NSString stringWithFormat:@"(unknown: %i)", v24];
    }
    else
    {
      objc_super v25 = *(&off_1012F9638 + (int)v24);
    }
    id v26 = v25;
    id v27 = [v4 waypointsCount];
    [(DirectionsPlan *)v3 expiryTime];
    v28 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

    *(_DWORD *)buf = 138544130;
    v31 = v23;
    __int16 v32 = 2114;
    v33 = v25;
    __int16 v34 = 2048;
    id v35 = v27;
    __int16 v36 = 2112;
    v37 = v28;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Preparing directions plan (%{public}@, %lu waypoints, expires: %@)", buf, 0x2Au);
  }

  return v3;
}

- (void)_addOriginDestinationToPlan:(id)a3
{
  id v4 = a3;
  v5 = [(RoutePlanningSessionDirectionsPlanBuilder *)self navigationSession];
  unint64_t v6 = [v5 waypointController];

  uint64_t v7 = [v6 originWaypoint];
  v8 = [v6 displayedWaypoints];
  if (![v8 count] || !v7)
  {
    id v26 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
    int v19 = [v26 resolvedWaypoints];

    if ([v19 areAllValidWaypoints])
    {
      v57 = v6;
      v59 = v7;
      id v27 = v8;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v28 = v19;
      id v29 = [v28 countByEnumeratingWithState:&v64 objects:v72 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v65;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v65 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            __int16 v34 = [v4 routeRequestStorage];
            [v34 addWaypoints:v33];
          }
          id v30 = [v28 countByEnumeratingWithState:&v64 objects:v72 count:16];
        }
        while (v30);
      }

      id v35 = sub_100084D38();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v8 = v27;
        unint64_t v6 = v57;
        uint64_t v7 = v59;
LABEL_52:

        goto LABEL_53;
      }
      __int16 v36 = self;
      v8 = v27;
      if (!v36)
      {
        v41 = @"<nil>";
        unint64_t v6 = v57;
        goto LABEL_48;
      }
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      if (objc_opt_respondsToSelector())
      {
        v39 = [(RoutePlanningSessionDirectionsPlanBuilder *)v36 performSelector:"accessibilityIdentifier"];
        v40 = v39;
        if (v39 && ![v39 isEqualToString:v38])
        {
          v41 = +[NSString stringWithFormat:@"%@<%p, %@>", v38, v36, v40];

          goto LABEL_33;
        }
      }
      v41 = +[NSString stringWithFormat:@"%@<%p>", v38, v36];
LABEL_33:

      unint64_t v6 = v57;
LABEL_48:

      v54 = [v4 routeRequestStorage];
      v55 = [v54 waypoints];
      v56 = sub_100769DCC(v55);
      *(_DWORD *)buf = 138543618;
      v74 = v41;
      __int16 v75 = 2112;
      v76 = v56;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[%{public}@] Waypoints for directions plan are valid from RPS: %@", buf, 0x16u);

      uint64_t v7 = v59;
      goto LABEL_52;
    }
    v42 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
    id v35 = [v42 configuration];

    v43 = [v35 waypointRequests];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1007ED674;
    v61[3] = &unk_1012F9618;
    v62 = v19;
    id v63 = v4;
    [v43 enumerateObjectsUsingBlock:v61];

    v44 = sub_100084D38();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
LABEL_51:

      goto LABEL_52;
    }
    v45 = self;
    if (!v45)
    {
      v50 = @"<nil>";
      goto LABEL_50;
    }
    v60 = v7;
    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    if (objc_opt_respondsToSelector())
    {
      v48 = [(RoutePlanningSessionDirectionsPlanBuilder *)v45 performSelector:"accessibilityIdentifier"];
      v49 = v48;
      if (v48 && ![v48 isEqualToString:v47])
      {
        v50 = +[NSString stringWithFormat:@"%@<%p, %@>", v47, v45, v49];

        goto LABEL_41;
      }
    }
    v50 = +[NSString stringWithFormat:@"%@<%p>", v47, v45];
LABEL_41:

    uint64_t v7 = v60;
LABEL_50:

    *(_DWORD *)buf = 138543362;
    v74 = v50;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "[%{public}@] Waypoints for directions plan are planning waypoints", buf, 0xCu);

    goto LABEL_51;
  }
  v9 = v6;
  id v10 = [v4 routeRequestStorage];
  v58 = v7;
  [v10 addWaypoints:v7];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v11 = v8;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v69;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v69 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v68 + 1) + 8 * (void)j);
        __int16 v18 = [v4 routeRequestStorage];
        [v18 addWaypoints:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v68 objects:v77 count:16];
    }
    while (v14);
  }

  int v19 = sub_100084D38();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int16 v20 = self;
    if (!v20)
    {
      objc_super v25 = @"<nil>";
      v8 = v11;
      unint64_t v6 = v9;
      goto LABEL_45;
    }
    long long v21 = (objc_class *)objc_opt_class();
    long long v22 = NSStringFromClass(v21);
    v8 = v11;
    unint64_t v6 = v9;
    if (objc_opt_respondsToSelector())
    {
      long long v23 = [(RoutePlanningSessionDirectionsPlanBuilder *)v20 performSelector:"accessibilityIdentifier"];
      id v24 = v23;
      if (v23 && ![v23 isEqualToString:v22])
      {
        objc_super v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

        goto LABEL_17;
      }
    }
    objc_super v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_17:

LABEL_45:
    v51 = [v4 routeRequestStorage];
    v52 = [v51 waypoints];
    v53 = sub_100769DCC(v52);
    *(_DWORD *)buf = 138543618;
    v74 = v25;
    __int16 v75 = 2112;
    v76 = v53;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] Waypoints for directions plan are from navigation: %@", buf, 0x16u);

    goto LABEL_46;
  }
  v8 = v11;
  unint64_t v6 = v9;
LABEL_46:
  uint64_t v7 = v58;
LABEL_53:
}

- (void)_addTransitOptionsToPlan:(id)a3
{
  id v12 = a3;
  id v4 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
  id v5 = [v4 currentTransportType];

  if (v5 == (id)3)
  {
    unint64_t v6 = [(RoutePlanningSessionDirectionsPlanBuilder *)self _transitPreferences];
    if (v6)
    {
      uint64_t v7 = [DirectionsPlanTransitPreferences alloc];
      v8 = [v6 transitOptions];
      v9 = [(DirectionsPlanTransitPreferences *)v7 initWithGEOTransitOptions:v8];
      [v12 setTransitPreferences:v9];

      [v12 setTransitPrioritization:[v6 sortOption]];
      id v10 = [v6 surchargeOption];

      if (v10)
      {
        id v11 = [v6 surchargeOption];
        [v12 setTransitSurchargeOption:[v11 integerValue]];
      }
    }
  }
}

- (void)_addTimingToPlan:(id)a3
{
  id v12 = a3;
  id v4 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
  id v5 = -[RoutePlanningSessionDirectionsPlanBuilder _timingForTransportType:](self, "_timingForTransportType:", [v4 currentTransportType]);

  unint64_t v6 = [v5 departureDate];

  if (v6)
  {
    uint64_t v7 = [v5 departureDate];
    [v7 timeIntervalSinceReferenceDate];
    [v12 setDepartureTime:];
  }
  else
  {
    v8 = [v5 arrivalDate];

    if (v8)
    {
      uint64_t v7 = [v5 arrivalDate];
      [v7 timeIntervalSinceReferenceDate];
      [v12 setArrivalTime:];
    }
    else
    {
      uint64_t v7 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
      if ([v7 currentTransportType] == (id)3)
      {
        v9 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
        id v10 = [v9 startDate];

        if (!v10) {
          goto LABEL_9;
        }
        uint64_t v7 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
        id v11 = [v7 startDate];
        [v11 timeIntervalSinceReferenceDate];
        [v12 setDepartureTime:];
      }
    }
  }

LABEL_9:
}

- (id)_transitPreferences
{
  v2 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
  v3 = [v2 configuration];
  id v4 = [v3 routeLoadingTaskFactory];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 transportTypeInformation];
    unint64_t v6 = [v5 requestInfoProviderForTransportType:3];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 transitPreferences];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_timingForTransportType:(int64_t)a3
{
  id v4 = [(RoutePlanningSessionDirectionsPlanBuilder *)self session];
  id v5 = [v4 configuration];
  unint64_t v6 = [v5 routeLoadingTaskFactory];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 transportTypeInformation];
    v8 = [v7 requestInfoProviderForTransportType:a3];

    v9 = [v8 timing];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (RoutePlanningSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (void)setNavigationSession:(id)a3
{
}

- (unint64_t)fidelity
{
  return self->_fidelity;
}

- (void)setFidelity:(unint64_t)a3
{
  self->_fidelity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSession, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end