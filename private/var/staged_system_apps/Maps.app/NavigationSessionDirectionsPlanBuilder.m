@interface NavigationSessionDirectionsPlanBuilder
- (NavigationSession)session;
- (NavigationSessionDirectionsPlanBuilder)initWithSessionStack:(id)a3 fidelity:(unint64_t)a4;
- (RoutePlanningSessionDirectionsPlanBuilder)routePlanningBuilder;
- (id)buildDirectionsPlan;
- (unint64_t)fidelity;
- (void)setFidelity:(unint64_t)a3;
@end

@implementation NavigationSessionDirectionsPlanBuilder

- (NavigationSessionDirectionsPlanBuilder)initWithSessionStack:(id)a3 fidelity:(unint64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NavigationSessionDirectionsPlanBuilder;
  v7 = [(NavigationSessionDirectionsPlanBuilder *)&v16 init];
  v8 = v7;
  if (v7)
  {
    v7->_fidelity = a4;
    v9 = [[RoutePlanningSessionDirectionsPlanBuilder alloc] initWithSessionStack:v6 fidelity:a4];
    routePlanningBuilder = v8->_routePlanningBuilder;
    v8->_routePlanningBuilder = v9;

    v11 = [v6 lastObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v13 = [v6 lastObject];
      session = v8->_session;
      v8->_session = (NavigationSession *)v13;
    }
  }

  return v8;
}

- (id)buildDirectionsPlan
{
  v3 = [(NavigationSessionDirectionsPlanBuilder *)self routePlanningBuilder];
  if (v3) {

  }
  if (!self->_session)
  {
    id v6 = 0;
    goto LABEL_40;
  }
  v4 = [(NavigationSessionDirectionsPlanBuilder *)self routePlanningBuilder];
  if (v4)
  {
    v5 = [(NavigationSessionDirectionsPlanBuilder *)self routePlanningBuilder];
    id v6 = [v5 buildDirectionsPlan];
  }
  else
  {
    id v6 = objc_alloc_init(DirectionsPlan);
  }

  id v7 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
  [(DirectionsPlan *)v6 setRouteRequestStorage:v7];
  unint64_t v8 = (unint64_t)[(NavigationSession *)self->_session currentTransportType] - 2;
  if (v8 > 3) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = dword_100F6F5C0[v8];
  }
  v10 = [(DirectionsPlan *)v6 routeRequestStorage];
  [v10 setTransportType:v9];

  v11 = [(NavigationSession *)self->_session currentRouteCollection];
  v12 = v11;
  if (v11) {
    -[DirectionsPlan setCurrentRouteIndex:](v6, "setCurrentRouteIndex:", [v11 currentRouteIndex]);
  }
  uint64_t v13 = [v12 currentRoute];
  if (v13)
  {
    id v14 = [objc_alloc((Class)GEOURLRouteHandle) initWithRoute:v13 fidelity:[self fidelity]];
    v15 = [(DirectionsPlan *)v6 routeRequestStorage];
    [v15 setRouteHandle:v14];
  }
  objc_super v16 = [v12 currentRoute];
  v17 = +[DirectionsPlan _maps_expiryDateForRoute:v16];
  [v17 timeIntervalSinceReferenceDate];
  -[DirectionsPlan setExpiryTime:](v6, "setExpiryTime:");

  v18 = [(NavigationSessionDirectionsPlanBuilder *)self session];
  v19 = [v18 waypointController];
  v20 = (char *)[v19 targetLegIndex];

  v21 = [v13 waypoints];
  id v22 = [v21 mutableCopy];

  if (v20 && (unint64_t)[v22 count] >= 3 && v20 < (char *)objc_msgSend(v22, "count") - 1) {
    [v22 removeObjectsInRange:1, v20];
  }
  v58 = v20;
  v23 = [(DirectionsPlan *)v6 routeRequestStorage];
  [v23 setWaypoints:v22];

  if (((unint64_t)[v13 source] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v24 = [v13 persistentData];
    v25 = [(DirectionsPlan *)v6 routeRequestStorage];
    [v25 setDestinationRouteData:v24];
  }
  if ((id)[(NavigationSession *)self->_session guidanceType] == (id)2) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = 2;
  }
  [(DirectionsPlan *)v6 setDisplayMethod:v26];
  v27 = +[MNNavigationService sharedService];
  [v27 state];
  int IsNavigating = MNNavigationServiceStateIsNavigating();

  if (IsNavigating)
  {
    v29 = +[MNNavigationService sharedService];
    -[DirectionsPlan setShouldRestoreLowGuidance:](v6, "setShouldRestoreLowGuidance:", [v29 state] == (id)5);
  }
  else
  {
    v29 = [(NavigationSession *)self->_session configuration];
    v30 = [v29 startNavigationDetails];
    -[DirectionsPlan setShouldRestoreLowGuidance:](v6, "setShouldRestoreLowGuidance:", [v30 guidanceType] == (id)1);
  }
  if (GEOConfigGetBOOL())
  {
    v31 = +[MSPSharedTripService sharedInstance];
    v32 = [v31 receivers];

    v33 = sub_100099700(v32, &stru_1012F67F8);
    v34 = v13;
    id v35 = [v33 mutableCopy];
    [(DirectionsPlan *)v6 setHandlesForSharingETAs:v35];

    uint64_t v13 = v34;
  }
  v36 = sub_100084D38();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    log = v36;
    v56 = v13;
    v37 = self;
    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    v57 = v12;
    if (objc_opt_respondsToSelector())
    {
      v40 = [(NavigationSessionDirectionsPlanBuilder *)v37 performSelector:"accessibilityIdentifier"];
      v41 = v40;
      if (v40 && ![v40 isEqualToString:v39])
      {
        v42 = +[NSString stringWithFormat:@"%@<%p, %@>", v39, v37, v41];

        goto LABEL_35;
      }
    }
    v42 = +[NSString stringWithFormat:@"%@<%p>", v39, v37];
LABEL_35:

    id v54 = v42;
    id v43 = (id)[(DirectionsPlan *)v6 displayMethod];
    if (v43 >= 3)
    {
      v44 = +[NSString stringWithFormat:@"(unknown: %i)", v43];
    }
    else
    {
      v44 = *(&off_1012F6818 + (int)v43);
    }
    id v53 = v44;
    id v45 = v7;
    id v46 = [v7 waypointsCount];
    id v47 = [v22 count];
    [(DirectionsPlan *)v6 expiryTime];
    v48 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

    unint64_t v49 = [(DirectionsPlan *)v6 handlesForSharingETAsCount];
    [(DirectionsPlan *)v6 handlesForSharingETAs];
    v51 = id v50 = v22;
    *(_DWORD *)buf = 138545154;
    id v60 = v54;
    __int16 v61 = 2114;
    v62 = v44;
    __int16 v63 = 2048;
    id v64 = v46;
    id v7 = v45;
    __int16 v65 = 2048;
    id v66 = v47;
    __int16 v67 = 2048;
    v68 = v58;
    __int16 v69 = 2112;
    v70 = v48;
    __int16 v71 = 2048;
    unint64_t v72 = v49;
    __int16 v73 = 2112;
    v74 = v51;
    v36 = log;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[%{public}@] Prepared directions plan (%{public}@, %lu waypoints (%lu in original route, %lu current leg index), expires: %@, %lu sharing handles: %@)", buf, 0x52u);

    id v22 = v50;
    uint64_t v13 = v56;
    v12 = v57;
  }

LABEL_40:

  return v6;
}

- (NavigationSession)session
{
  return self->_session;
}

- (unint64_t)fidelity
{
  return self->_fidelity;
}

- (void)setFidelity:(unint64_t)a3
{
  self->_fidelity = a3;
}

- (RoutePlanningSessionDirectionsPlanBuilder)routePlanningBuilder
{
  return self->_routePlanningBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningBuilder, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end