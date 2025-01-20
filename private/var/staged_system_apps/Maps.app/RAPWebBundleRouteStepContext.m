@interface RAPWebBundleRouteStepContext
- (RAPWebBundleRouteStepContext)initWithRouteStep:(id)a3 isMissedStep:(BOOL)a4 aggregatedData:(id)a5 locales:(id)a6 mapSnapshotId:(id)a7 routeIndex:(unint64_t)a8;
- (id)context;
@end

@implementation RAPWebBundleRouteStepContext

- (RAPWebBundleRouteStepContext)initWithRouteStep:(id)a3 isMissedStep:(BOOL)a4 aggregatedData:(id)a5 locales:(id)a6 mapSnapshotId:(id)a7 routeIndex:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = v15;
  unsigned int v20 = [v19 transportType];
  switch(v20)
  {
    case 3u:
      unsigned int v21 = [v19 isArrivalStep];
      v22 = @"navigationCyclingStep";
      CFStringRef v23 = @"navigationCyclingArrival";
      goto LABEL_7;
    case 2u:
      unsigned int v21 = [v19 isArrivalStep];
      v22 = @"navigationWalkingStep";
      CFStringRef v23 = @"navigationWalkingArrival";
      goto LABEL_7;
    case 0u:
      unsigned int v21 = [v19 isArrivalStep];
      v22 = @"navigationDrivingStep";
      CFStringRef v23 = @"navigationDrivingArrival";
LABEL_7:
      if (v21) {
        v22 = (__CFString *)v23;
      }
      v24 = v22;

      v33.receiver = self;
      v33.super_class = (Class)RAPWebBundleRouteStepContext;
      v25 = [(RAPWebBundleBaseContext *)&v33 initWithType:v24 locales:v17];
      v26 = v25;
      if (v25)
      {
        objc_storeStrong((id *)&v25->_step, a3);
        v26->_isMissedStep = a4;
        v27 = (NSString *)[v16 copy];
        aggregatedData = v26->_aggregatedData;
        v26->_aggregatedData = v27;

        v29 = (NSString *)[v18 copy];
        mapSnapshotId = v26->_mapSnapshotId;
        v26->_mapSnapshotId = v29;

        v26->_routeIndex = a8;
      }
      self = v26;
      v31 = self;
      goto LABEL_15;
  }

  v24 = sub_10057670C();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v19;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Tried to create RAPWebBundleRouteStepContext for unsupported transportType: %@", buf, 0xCu);
  }
  v31 = 0;
LABEL_15:

  return v31;
}

- (id)context
{
  v34.receiver = self;
  v34.super_class = (Class)RAPWebBundleRouteStepContext;
  v3 = [(RAPWebBundleBaseContext *)&v34 context];
  id v4 = [v3 mutableCopy];

  [v4 setObject:self->_aggregatedData forKeyedSubscript:@"initialData"];
  v5 = +[NSMutableDictionary dictionary];
  v6 = +[NSNumber numberWithUnsignedInt:[(GEOComposedRouteStep *)self->_step stepID]];
  [v5 setObject:v6 forKeyedSubscript:@"stepId"];

  v7 = +[NSNumber numberWithUnsignedInteger:self->_routeIndex];
  [v5 setObject:v7 forKeyedSubscript:@"routeIndex"];

  v8 = [(GEOComposedRouteStep *)self->_step contentsForContext:2];
  v9 = [v8 instruction];
  [v5 setObject:v9 forKeyedSubscript:@"title"];

  v10 = [v8 stringForDistance:-1.0];
  [v5 setObject:v10 forKeyedSubscript:@"subtitle"];

  [v5 setObject:@"RAPManeuverIconIdentifier" forKeyedSubscript:@"icon"];
  [v5 setObject:self->_mapSnapshotId forKeyedSubscript:@"map"];
  [v5 setObject:self->_mapSnapshotId forKeyedSubscript:@"routeStepImageId"];
  v11 = [(GEOComposedRouteStep *)self->_step composedRoute];
  v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 indexInResponse]);
  [v5 setObject:v12 forKeyedSubscript:@"directionsResponseIndex"];

  v13 = [(GEOComposedRouteStep *)self->_step waypoint];
  v14 = [v13 findMyHandleID];
  id v15 = +[NSNumber numberWithInt:v14 != 0];
  [v5 setObject:v15 forKeyedSubscript:@"isRouteToPerson"];

  [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"checked"];
  CFStringRef v37 = @"focused";
  id v16 = [v5 copy];
  id v38 = v16;
  id v17 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  [v4 setObject:v17 forKeyedSubscript:@"navigation"];

  if (self->_isMissedStep) {
    [v4 setObject:@"navigation.missed.title" forKeyedSubscript:@"titleOverrideKey"];
  }
  id v18 = [(GEOComposedRouteStep *)self->_step composedRoute];
  id v19 = [v18 legIndexForStepIndex:[self->_step stepIndex]];

  unsigned int v20 = [(GEOComposedRouteStep *)self->_step composedRoute];
  unsigned int v21 = [v20 legs];
  id v22 = [v21 count];

  if (v19 >= v22)
  {
    v35[0] = @"entityName";
  }
  else
  {
    CFStringRef v23 = [(GEOComposedRouteStep *)self->_step composedRoute];
    v24 = [v23 legs];
    v25 = [v24 objectAtIndexedSubscript:v19];
    v26 = [v25 destination];
    v27 = [v26 navDisplayName];

    v35[0] = @"entityName";
    if (v27)
    {
      int v28 = 0;
      v29 = v27;
      goto LABEL_8;
    }
  }
  CFStringRef v23 = [(GEOComposedRouteStep *)self->_step composedRoute];
  v29 = [v23 rapDestinationTitle];
  v27 = 0;
  int v28 = 1;
LABEL_8:
  v35[1] = @"structuredAddressThoroughfare";
  v36[0] = v29;
  v30 = [(GEOComposedRouteStep *)self->_step maneuverRoadName];
  v36[1] = v30;
  v31 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  [v4 setObject:v31 forKeyedSubscript:@"place"];

  if (v28)
  {
  }
  id v32 = [v4 copy];

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapSnapshotId, 0);
  objc_storeStrong((id *)&self->_aggregatedData, 0);

  objc_storeStrong((id *)&self->_step, 0);
}

@end