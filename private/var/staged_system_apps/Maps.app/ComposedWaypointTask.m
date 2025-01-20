@interface ComposedWaypointTask
- (BOOL)isCancelled;
- (BOOL)isLoaded;
- (ClientTypeResolver)resolver;
- (ComposedWaypointTask)initWithRequest:(id)a3;
- (ComposedWaypointTask)initWithRequest:(id)a3 resolver:(id)a4;
- (GEOComposedWaypoint)composedWaypoint;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (Result)result;
- (WaypointRequest)request;
- (void)_handleResponseWithHandler:(id)a3 result:(id)a4;
- (void)_loadWaypointWithAddress:(id)a3 handler:(id)a4 traits:(id)a5 networkActivityHandler:(id)a6;
- (void)_loadWaypointWithCorrectedMapItem:(id)a3 coordinate:(CLLocationCoordinate2D)a4 handler:(id)a5 traits:(id)a6 networkActivityHandler:(id)a7;
- (void)_loadWaypointWithMapItem:(id)a3 handler:(id)a4 traits:(id)a5 networkActivityHandler:(id)a6;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)_resolveAddressForWaypointType:(int)a3 completion:(id)a4 traits:(id)a5 networkActivityHandler:(id)a6;
- (void)_resolveCurrentLocationWithCompletion:(id)a3;
- (void)_resolveItem:(id)a3 traits:(id)a4 completion:(id)a5 networkActivityHandler:(id)a6;
- (void)_resolveParkedCarWithCompletion:(id)a3 traits:(id)a4 networkActivityHandler:(id)a5;
- (void)applyToRAPUserSearch:(id)a3 correctedSearch:(id)a4;
- (void)cancel;
- (void)setRequest:(id)a3;
- (void)setResolver:(id)a3;
- (void)setResult:(id)a3;
- (void)submitWithHandler:(id)a3 traits:(id)a4 networkActivityHandler:(id)a5;
@end

@implementation ComposedWaypointTask

- (ComposedWaypointTask)initWithRequest:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(ClientTypeResolver);
  v6 = [(ComposedWaypointTask *)self initWithRequest:v4 resolver:v5];

  return v6;
}

- (ComposedWaypointTask)initWithRequest:(id)a3 resolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ComposedWaypointTask;
  v8 = [(ComposedWaypointTask *)&v16 init];
  v9 = v8;
  if (v8)
  {
    [(ComposedWaypointTask *)v8 setRequest:v6];
    objc_storeStrong((id *)&v9->_resolver, a4);
    v10 = +[NSUUID UUID];
    uint64_t v11 = [v10 UUIDString];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v11;

    os_activity_t v13 = _os_activity_create((void *)&_mh_execute_header, "Resolve waypoint", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    activity = v9->_activity;
    v9->_activity = (OS_os_activity *)v13;
  }
  return v9;
}

- (BOOL)isLoaded
{
  return self->_result != 0;
}

- (BOOL)isCancelled
{
  return [(GEOMapServiceCorrectableTicket *)self->_ticket isCancelled];
}

- (void)submitWithHandler:(id)a3 traits:(id)a4 networkActivityHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self->_activity;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)v11, &state);
  if (!v8)
  {
    v15 = sub_100576F5C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138543362;
      v50 = identifier;
      v17 = "[%{public}@] A handler is required.";
      v18 = v15;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_11:
      uint32_t v21 = 12;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v21);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!self->_result)
  {
    if ([(ComposedWaypointTask *)self isCancelled])
    {
      v15 = sub_100576F5C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v20 = self->_identifier;
        *(_DWORD *)buf = 138543362;
        v50 = v20;
        v17 = "[%{public}@] Task was previously cancelled";
        v18 = v15;
        os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
        goto LABEL_11;
      }
    }
    else
    {
      if (!self->_ticket)
      {
        if (([v9 hasSource] & 1) == 0) {
          [v9 setSource:18];
        }
        v24 = self->_identifier;
        objc_initWeak((id *)buf, self);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_10042326C;
        v43[3] = &unk_1012E9E00;
        v25 = v11;
        v44 = v25;
        objc_copyWeak(&v47, (id *)buf);
        v26 = v24;
        v45 = v26;
        id v46 = v8;
        v27 = objc_retainBlock(v43);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100423384;
        v36[3] = &unk_1012E9E28;
        v37 = v25;
        objc_copyWeak(&v42, (id *)buf);
        v15 = v26;
        v38 = v15;
        id v28 = v9;
        id v39 = v28;
        v35 = v27;
        id v40 = v35;
        id v29 = v10;
        id v41 = v29;
        v30 = objc_retainBlock(v36);
        if ([v28 navigating]) {
          uint64_t v31 = 2;
        }
        else {
          uint64_t v31 = 1;
        }
        [v28 setSearchOriginationType:v31];
        v32 = [(ComposedWaypointTask *)self request];
        v33 = [v32 loadComposedWaypointWithTraits:v28 clientResolvedCompletionHandler:v30 completionHandler:v35 networkActivityHandler:v29];
        ticket = self->_ticket;
        self->_ticket = v33;

        objc_destroyWeak(&v42);
        objc_destroyWeak(&v47);

        objc_destroyWeak((id *)buf);
        goto LABEL_13;
      }
      v15 = sub_100576F5C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v22 = self->_identifier;
        v23 = self->_ticket;
        *(_DWORD *)buf = 138543618;
        v50 = v22;
        __int16 v51 = 2112;
        v52 = v23;
        v17 = "[%{public}@] Task is in flight: %@";
        v18 = v15;
        os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
        uint32_t v21 = 22;
        goto LABEL_12;
      }
    }
    goto LABEL_13;
  }
  v12 = sub_100576F5C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    os_activity_t v13 = self->_identifier;
    result = self->_result;
    *(_DWORD *)buf = 138543618;
    v50 = v13;
    __int16 v51 = 2112;
    v52 = result;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Already have a response: %@", buf, 0x16u);
  }

  (*((void (**)(id, Result *))v8 + 2))(v8, self->_result);
LABEL_14:
  os_activity_scope_leave(&state);
}

- (void)cancel
{
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v5);
  v3 = sub_100576F5C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412546;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancelling task: %@ (%{public}@)", buf, 0x16u);
  }

  [(GEOMapServiceCorrectableTicket *)self->_ticket cancel];
  os_activity_scope_leave(&v5);
}

- (void)applyToRAPUserSearch:(id)a3 correctedSearch:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  [v11 setOrigin:0];
  id v7 = [(ComposedWaypointTask *)self composedWaypoint];

  if (v7)
  {
    __int16 v8 = [(ComposedWaypointTask *)self composedWaypoint];
    id v9 = [v8 latLng];
    [v11 setCoordinate:v9];
  }
  id v10 = [(ComposedWaypointTask *)self request];
  [v10 recordRAPInformation:v11];

  [(GEOMapServiceCorrectableTicket *)self->_ticket applyToCorrectedSearch:v6];
}

- (void)setRequest:(id)a3
{
  os_activity_scope_state_s v5 = (WaypointRequest *)a3;
  p_request = &self->_request;
  if (self->_request != v5)
  {
    objc_storeStrong((id *)&self->_request, a3);
    if (*p_request)
    {
      [(WaypointRequest *)*p_request coordinate];
      if (CLLocationCoordinate2DIsValid(v16))
      {
        if (!self->_lprRuleHelper)
        {
          id v7 = (MNLPRRuleHelper *)objc_alloc_init((Class)MNLPRRuleHelper);
          lprRuleHelper = self->_lprRuleHelper;
          self->_lprRuleHelper = v7;
        }
        id v9 = objc_alloc((Class)GEOLatLng);
        [(WaypointRequest *)self->_request coordinate];
        double v11 = v10;
        [(WaypointRequest *)self->_request coordinate];
        id v12 = [v9 initWithLatitude:v11];
        os_activity_t v13 = self->_lprRuleHelper;
        id v15 = v12;
        v14 = +[NSArray arrayWithObjects:&v15 count:1];
        [(MNLPRRuleHelper *)v13 prefetchRulesForWaypoints:v14];
      }
    }
  }
}

- (void)setResult:(id)a3
{
  os_activity_scope_state_s v5 = (Result *)a3;
  if (self->_result != v5)
  {
    objc_storeStrong((id *)&self->_result, a3);
    id v6 = [(Result *)v5 value];

    id v7 = sub_100576F5C();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        identifier = self->_identifier;
        double v10 = [(Result *)v5 value];
        double v11 = [v10 shortDescription];
        int v14 = 138543619;
        id v15 = identifier;
        __int16 v16 = 2113;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Composed waypoint loaded successfully: %{private}@", (uint8_t *)&v14, 0x16u);
      }
    }
    else if (v8)
    {
      id v12 = self->_identifier;
      os_activity_t v13 = [(Result *)v5 error];
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Composed waypoint loading failed: %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (GEOComposedWaypoint)composedWaypoint
{
  return (GEOComposedWaypoint *)[(Result *)self->_result value];
}

- (void)_resolveItem:(id)a3 traits:(id)a4 completion:(id)a5 networkActivityHandler:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  double v11 = (void (**)(id, void *))a5;
  id v12 = a6;
  switch([v16 itemType])
  {
    case 0u:
    case 5u:
      os_activity_t v13 = GEOErrorDomain();
      int v14 = +[NSError errorWithDomain:v13 code:-8 userInfo:0];
      id v15 = +[Result resultWithError:v14];
      v11[2](v11, v15);

      break;
    case 1u:
    case 2u:
    case 6u:
      -[ComposedWaypointTask _resolveAddressForWaypointType:completion:traits:networkActivityHandler:](self, "_resolveAddressForWaypointType:completion:traits:networkActivityHandler:", [v16 itemType], v11, v10, v12);
      break;
    case 3u:
      [(ComposedWaypointTask *)self _resolveParkedCarWithCompletion:v11 traits:v10 networkActivityHandler:v12];
      break;
    case 4u:
      [(ComposedWaypointTask *)self _resolveCurrentLocationWithCompletion:v11];
      break;
    default:
      break;
  }
}

- (void)_resolveCurrentLocationWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_activity_scope_state_s v5 = [(ComposedWaypointTask *)self resolver];
    id v6 = [v5 currentLocationSource];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100423BB8;
    v7[3] = &unk_1012E9E50;
    id v8 = v4;
    [v6 objectWithCompletion:v7];
  }
}

- (void)_resolveParkedCarWithCompletion:(id)a3 traits:(id)a4 networkActivityHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  double v11 = [(ComposedWaypointTask *)self resolver];
  id v12 = [v11 parkedCarSource];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100423E2C;
  v16[3] = &unk_1012E9E78;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v17 = v14;
  objc_copyWeak(&v20, &location);
  id v15 = v10;
  id v19 = v15;
  [v12 objectWithCompletion:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_resolveAddressForWaypointType:(int)a3 completion:(id)a4 traits:(id)a5 networkActivityHandler:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(ComposedWaypointTask *)self resolver];
  id v14 = [v13 personalizedItemSource];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1004240BC;
  v18[3] = &unk_1012E9EA0;
  id v15 = v11;
  id v19 = v15;
  objc_copyWeak(&v22, &location);
  id v16 = v10;
  id v20 = v16;
  id v17 = v12;
  id v21 = v17;
  [v14 addressOrLOIWithType:v8 completion:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_loadWaypointWithCorrectedMapItem:(id)a3 coordinate:(CLLocationCoordinate2D)a4 handler:(id)a5 traits:(id)a6 networkActivityHandler:(id)a7
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  id v17 = -[CorrectedLocationMapItemWaypointRequest initWithCorrectedCoordinate:mapItem:]([CorrectedLocationMapItemWaypointRequest alloc], "initWithCorrectedCoordinate:mapItem:", v16, latitude, longitude);

  [(ComposedWaypointTask *)self setRequest:v17];
  id v20 = [(ComposedWaypointTask *)self request];
  id v18 = [v20 loadComposedWaypointWithTraits:v14 clientResolvedCompletionHandler:0 completionHandler:v15 networkActivityHandler:v13];

  ticket = self->_ticket;
  self->_ticket = v18;
}

- (void)_loadWaypointWithMapItem:(id)a3 handler:(id)a4 traits:(id)a5 networkActivityHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[MapItemWaypointRequest alloc] initWithMapItem:v13];

  [(ComposedWaypointTask *)self setRequest:v14];
  id v17 = [(ComposedWaypointTask *)self request];
  id v15 = [v17 loadComposedWaypointWithTraits:v11 clientResolvedCompletionHandler:0 completionHandler:v12 networkActivityHandler:v10];

  ticket = self->_ticket;
  self->_ticket = v15;
}

- (void)_loadWaypointWithAddress:(id)a3 handler:(id)a4 traits:(id)a5 networkActivityHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[AddressBookAddressWaypointRequest alloc] initWithAddress:v13];

  [(ComposedWaypointTask *)self setRequest:v14];
  id v17 = [(ComposedWaypointTask *)self request];
  id v15 = [v17 loadComposedWaypointWithTraits:v11 clientResolvedCompletionHandler:0 completionHandler:v12 networkActivityHandler:v10];

  ticket = self->_ticket;
  self->_ticket = v15;
}

- (void)_handleResponseWithHandler:(id)a3 result:(id)a4
{
  id v6 = (void (**)(id, id))a3;
  id v7 = a4;
  if ([(ComposedWaypointTask *)self isCancelled])
  {
    uint64_t v8 = sub_100576F5C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      int v10 = 138543362;
      id v11 = identifier;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Received result, but task was already canceled", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    [(ComposedWaypointTask *)self setResult:v7];
    if (v6) {
      v6[2](v6, v7);
    }
  }
}

- (NSString)description
{
  v2 = self;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10009141C;
  id v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(ComposedWaypointTask *)v2 _maps_buildDescriptionWithBlock:v4];
  os_activity_scope_state_s v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [(ComposedWaypointTask *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        int v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    int v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  int v10 = @"<nil>";
LABEL_9:

  id v11 = [v3 componentsJoinedByString:@", "];
  id v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100424B1C;
  id v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(ComposedWaypointTask *)v2 _maps_buildDescriptionWithBlock:v4];
  os_activity_scope_state_s v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [(ComposedWaypointTask *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        int v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    int v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  int v10 = @"<nil>";
LABEL_9:

  id v11 = [v3 componentsJoinedByString:@"\n"];
  id v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  id v4 = (void (**)(id, const __CFString *, ClientTypeResolver *))((char *)a3 + 16);
  os_activity_scope_state_s v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, @"resolver", self->_resolver);
  (*v4)(v6, @"identifier", (ClientTypeResolver *)self->_identifier);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (Result)result
{
  return self->_result;
}

- (WaypointRequest)request
{
  return self->_request;
}

- (ClientTypeResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_lprRuleHelper, 0);

  objc_storeStrong((id *)&self->_ticket, 0);
}

@end