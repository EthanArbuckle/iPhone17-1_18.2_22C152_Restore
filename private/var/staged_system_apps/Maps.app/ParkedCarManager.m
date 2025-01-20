@interface ParkedCarManager
+ (id)sharedManager;
- (ParkedCar)parkedCar;
- (ParkedCarManager)init;
- (void)_authDidChange:(id)a3;
- (void)_debug_addParkedCarAtLocation:(id)a3;
- (void)_debug_showParkedCarNotification;
- (void)_debug_showParkedCarReplacementNotification;
- (void)_updateParkedCar;
- (void)_updateParkedCarMapItem;
- (void)addParkedCarObserver:(id)a3;
- (void)dealloc;
- (void)fetchParkedCar:(id)a3;
- (void)informCoreRoutineOfEngagementWithParkedCar:(id)a3;
- (void)removeImageForParkedCar:(id)a3;
- (void)removeParkedCar;
- (void)removeParkedCarObserver:(id)a3;
- (void)resolveMapItemFromVehicleEvent:(id)a3 overrideCoordinate:(CLLocationCoordinate2D)a4 referenceFrame:(int)a5 callback:(id)a6;
- (void)setCoordinate:(CLLocationCoordinate2D)a3 referenceFrame:(int)a4 forParkedCar:(id)a5;
- (void)setImage:(id)a3 forParkedCar:(id)a4;
- (void)setNotes:(id)a3 forParkedCar:(id)a4;
- (void)setParkedCarWithMapItem:(id)a3 overrideCoordinate:(CLLocationCoordinate2D)a4 referenceFrame:(int)a5 vehicleEvent:(id)a6;
- (void)updateParkedCarWithVehicleEvent:(id)a3 coordinate:(CLLocationCoordinate2D)a4 referenceFrame:(int)a5;
@end

@implementation ParkedCarManager

- (void)addParkedCarObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = +[NSHashTable weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)setParkedCarWithMapItem:(id)a3 overrideCoordinate:(CLLocationCoordinate2D)a4 referenceFrame:(int)a5 vehicleEvent:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v11 = a3;
  id v12 = a6;
  if (v12) {
    v13 = [[ParkedCar alloc] initWithVehicleEvent:v12 geoMapItem:v11];
  }
  else {
    v13 = 0;
  }
  v55.double latitude = latitude;
  v55.double longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v55))
  {
    -[ParkedCar setCoordinate:](v13, "setCoordinate:", latitude, longitude);
    [(ParkedCar *)v13 setReferenceFrame:v7];
  }
  v39 = v12;
  p_parkedCar = &self->_parkedCar;
  parkedCar = self->_parkedCar;
  if (parkedCar)
  {
    id v38 = v11;
    v16 = parkedCar;
    v17 = self->_parkedCar;
    self->_parkedCar = 0;

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v18 = [(NSHashTable *)self->_observers allObjects];
    id v19 = [v18 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v49;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v23 parkedCarManager:self didRemoveParkedCar:v16];
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v20);
    }

    p_parkedCar = &self->_parkedCar;
    id v11 = v38;
  }
  [(GEOMapServiceTicket *)self->_ticket cancel];
  ticket = self->_ticket;
  self->_ticket = 0;

  objc_storeStrong((id *)p_parkedCar, v13);
  if (self->_parkedCar)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v25 = [(NSHashTable *)self->_observers allObjects];
    id v26 = [v25 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v45;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          if (objc_opt_respondsToSelector()) {
            [v30 parkedCarManager:self didAddParkedCar:self->_parkedCar];
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v27);
    }

    if (!v11) {
      [(ParkedCarManager *)self _updateParkedCarMapItem];
    }
  }
  id v31 = [(NSMutableArray *)self->_fetchHandlers copy];
  fetchHandlers = self->_fetchHandlers;
  self->_fetchHandlers = 0;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v33 = v31;
  id v34 = [v33 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v41;
    do
    {
      for (k = 0; k != v35; k = (char *)k + 1)
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(v33);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v40 + 1) + 8 * (void)k) + 16))();
      }
      id v35 = [v33 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v35);
  }
}

- (void)_updateParkedCar
{
  v3 = +[MKLocationManager sharedLocationManager];
  if ([v3 isLocationServicesApproved] && !self->_isUpdating)
  {
    self->_isUpdating = 1;
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10010930C;
    v11[3] = &unk_1012E6708;
    objc_copyWeak(&v12, &location);
    id v4 = objc_retainBlock(v11);
    v5 = +[RTRoutineManager defaultManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100032158;
    v7[3] = &unk_1012FA0D0;
    objc_copyWeak(&v10, &location);
    v6 = v4;
    id v9 = v6;
    id v8 = v3;
    [v5 fetchLastVehicleEventsWithHandler:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (ParkedCarManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)ParkedCarManager;
  v2 = [(ParkedCarManager *)&v14 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_authDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_willResume:" name:MKApplicationStateWillEnterForegroundNotification object:0];

    objc_initWeak(&location, v2);
    v5 = +[RTRoutineManager defaultManager];
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_100CE96D4;
    id v11 = &unk_1012E6E78;
    objc_copyWeak(&v12, &location);
    [v5 startMonitoringVehicleEventsWithHandler:&v8];

    [(ParkedCarManager *)v2 _updateParkedCar];
    v6 = v2;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v2;
}

+ (id)sharedManager
{
  if (qword_101610F38 != -1) {
    dispatch_once(&qword_101610F38, &stru_101321668);
  }
  v2 = (void *)qword_101610F30;

  return v2;
}

- (ParkedCar)parkedCar
{
  return self->_parkedCar;
}

- (void)dealloc
{
  v3 = +[RTRoutineManager defaultManager];
  [v3 stopMonitoringVehicleEvents];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ParkedCarManager;
  [(ParkedCarManager *)&v5 dealloc];
}

- (void)_authDidChange:(id)a3
{
  id v4 = +[MKLocationManager sharedLocationManager];
  if ([v4 isAuthorizedForPreciseLocation]) {
    [(ParkedCarManager *)self _updateParkedCar];
  }
  else {
    [(ParkedCarManager *)self removeParkedCar];
  }
}

- (void)removeParkedCarObserver:(id)a3
{
}

- (void)fetchParkedCar:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    fetchHandlers = self->_fetchHandlers;
    id v10 = v4;
    if (!fetchHandlers)
    {
      v6 = +[NSMutableArray array];
      uint64_t v7 = self->_fetchHandlers;
      self->_fetchHandlers = v6;

      fetchHandlers = self->_fetchHandlers;
    }
    id v8 = [v10 copy];
    id v9 = objc_retainBlock(v8);
    [(NSMutableArray *)fetchHandlers addObject:v9];

    id v4 = v10;
    if (!self->_isUpdating)
    {
      [(ParkedCarManager *)self _updateParkedCar];
      id v4 = v10;
    }
  }
}

- (void)updateParkedCarWithVehicleEvent:(id)a3 coordinate:(CLLocationCoordinate2D)a4 referenceFrame:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v9 = a3;
  parkedCar = self->_parkedCar;
  id v11 = [(ParkedCar *)parkedCar mapItem];
  id v12 = [v11 _geoMapItem];
  [(ParkedCar *)parkedCar updateFromVehicleEvent:v9 geoMapItem:v12];

  v36.double latitude = latitude;
  v36.double longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v36))
  {
    -[ParkedCar setCoordinate:](self->_parkedCar, "setCoordinate:", latitude, longitude);
    [(ParkedCar *)self->_parkedCar setReferenceFrame:v5];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v13 = [(NSHashTable *)self->_observers allObjects];
  id v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v18 parkedCarManager:self didUpdateParkedCar:self->_parkedCar];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v15);
  }

  id v19 = [(NSMutableArray *)self->_fetchHandlers copy];
  fetchHandlers = self->_fetchHandlers;
  self->_fetchHandlers = 0;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = v19;
  id v22 = [v21 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v26 + 1) + 8 * (void)j) + 16))(*(void *)(*((void *)&v26 + 1) + 8 * (void)j));
      }
      id v23 = [v21 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v23);
  }
}

- (void)resolveMapItemFromVehicleEvent:(id)a3 overrideCoordinate:(CLLocationCoordinate2D)a4 referenceFrame:(int)a5 callback:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v11 = a3;
  id v12 = (void (**)(void))a6;
  if (v11)
  {
    parkedCar = self->_parkedCar;
    if (parkedCar)
    {
      id v14 = [(ParkedCar *)parkedCar vehicleEvent];
      id v15 = [v14 identifier];
      uint64_t v16 = [v11 identifier];
      unsigned int v17 = [v15 isEqual:v16];

      if (v17)
      {
        -[ParkedCarManager updateParkedCarWithVehicleEvent:coordinate:referenceFrame:](self, "updateParkedCarWithVehicleEvent:coordinate:referenceFrame:", v11, v7, latitude, longitude);
        if (!v12) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }
  v18 = [v11 mapItem];
  id v19 = [v18 geoMapItemHandle];

  if (v19)
  {
    objc_initWeak(&location, self);
    id v20 = +[GEOMapService sharedService];
    id v21 = [v11 mapItem];
    id v22 = [v21 geoMapItemHandle];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100CE9DF8;
    v23[3] = &unk_1013216B8;
    objc_copyWeak(v26, &location);
    v26[1] = *(id *)&latitude;
    v26[2] = *(id *)&longitude;
    int v27 = v7;
    id v24 = v11;
    v25 = v12;
    [v20 resolveMapItemFromHandle:v22 completionHandler:v23];

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ParkedCarManager setParkedCarWithMapItem:overrideCoordinate:referenceFrame:vehicleEvent:](self, "setParkedCarWithMapItem:overrideCoordinate:referenceFrame:vehicleEvent:", 0, v7, v11, latitude, longitude);
    if (v12) {
LABEL_9:
    }
      v12[2](v12);
  }
LABEL_10:
}

- (void)_updateParkedCarMapItem
{
  [(GEOMapServiceTicket *)self->_ticket cancel];
  ticket = self->_ticket;
  self->_ticket = 0;

  objc_initWeak(&location, self);
  id v4 = self->_parkedCar;
  uint64_t v5 = +[GEOMapService sharedService];
  [(ParkedCar *)v4 coordinate];
  GEOLocationCoordinate2DFromCLLocationCoordinate2D();
  [v5 ticketForReverseGeocodeCoordinate:1 includeEntryPoints:-[ParkedCar referenceFrame](v4, "referenceFrame") != 2 shiftLocationsIfNeeded:1 preserveOriginalLocation:0 traits:v6, v7];
  id v8 = (GEOMapServiceTicket *)objc_claimAutoreleasedReturnValue();
  id v9 = self->_ticket;
  self->_ticket = v8;

  id v10 = self->_ticket;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100CEA228;
  v12[3] = &unk_1012E7418;
  objc_copyWeak(&v14, &location);
  id v11 = v4;
  v13 = v11;
  [(GEOMapServiceTicket *)v10 submitWithHandler:v12 networkActivity:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)removeParkedCar
{
  v3 = +[RTRoutineManager defaultManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100CEA4CC;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [v3 clearAllVehicleEventsWithHandler:v4];
}

- (void)removeImageForParkedCar:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 vehicleEvent];
  if (v5)
  {
    double v6 = +[RTRoutineManager defaultManager];
    double v7 = [v5 identifier];
    [v6 updateVehicleEventWithIdentifier:v7 photo:0];
  }
  [v4 setImage:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(NSHashTable *)self->_observers allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 parkedCarManager:self didUpdateParkedCar:v4];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(ParkedCarManager *)self _updateParkedCar];
}

- (void)setImage:(id)a3 forParkedCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 vehicleEvent];
  if (v8)
  {
    id v9 = +[UIScreen mainScreen];
    [v9 bounds];
    double v11 = v10;
    id v12 = +[UIScreen mainScreen];
    [v12 bounds];
    double v14 = v13;
    long long v15 = +[UIScreen mainScreen];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;

    if (v11 <= v14) {
      double v17 = v19;
    }

    [v6 size];
    double v21 = v20;
    [v6 size];
    double v23 = v22;
    [v6 size];
    if (v21 <= v23) {
      double v24 = v25;
    }
    double v26 = fmax(v24 / v17 * 0.5, 1.0);
    [v6 size];
    CGFloat v28 = v27 / v26;
    [v6 size];
    v51.size.double height = v29 / v26;
    v51.origin.x = 0.0;
    v51.origin.y = 0.0;
    v51.size.double width = v28;
    CGRect v52 = CGRectIntegral(v51);
    double width = v52.size.width;
    double height = v52.size.height;
    [v6 scale];
    CGFloat v34 = v33;
    v50.double width = width;
    v50.double height = height;
    UIGraphicsBeginImageContextWithOptions(v50, 1, v34);
    [v6 drawInRect:CGRectMake(0.0, 0.0, width, height)];
    UIGraphicsGetImageFromCurrentImageContext();
    id v35 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if (v6)
    {
      CLLocationCoordinate2D v36 = UIImageJPEGRepresentation(v35, 0.699999988);
    }
    else
    {
      CLLocationCoordinate2D v36 = 0;
    }
    v37 = +[RTRoutineManager defaultManager];
    id v38 = [v8 identifier];
    [v37 updateVehicleEventWithIdentifier:v38 photo:v36];
  }
  [v7 setImage:v6];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v39 = [(NSHashTable *)self->_observers allObjects];
  id v40 = [v39 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v46;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v46 != v42) {
          objc_enumerationMutation(v39);
        }
        long long v44 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v44 parkedCarManager:self didUpdateParkedCar:v7];
        }
      }
      id v41 = [v39 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v41);
  }

  [(ParkedCarManager *)self _updateParkedCar];
}

- (void)setNotes:(id)a3 forParkedCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 vehicleEvent];
  if (v8)
  {
    id v9 = +[RTRoutineManager defaultManager];
    double v10 = [v8 identifier];
    [v9 updateVehicleEventWithIdentifier:v10 notes:v6];
  }
  double v17 = v6;
  [v7 setNotes:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v11 = [(NSHashTable *)self->_observers allObjects];
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v15);
        if (objc_opt_respondsToSelector()) {
          [v16 parkedCarManager:self didUpdateParkedCar:v7];
        }
        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  [(ParkedCarManager *)self _updateParkedCar];
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3 referenceFrame:(int)a4 forParkedCar:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v9 = a5;
  [v9 setCoordinate:latitude longitude:longitude];
  [v9 setReferenceFrame:v5];
  [v9 setMapItem:0];
  double v10 = [v9 vehicleEvent];
  if (v10)
  {
    id v11 = objc_alloc((Class)CLLocation);
    id v12 = +[NSDate date];
    id v13 = [v11 initWithCoordinate:v12 altitude:v5 horizontalAccuracy:latitude verticalAccuracy:longitude timestamp:0.0 referenceFrame:-1.0];

    uint64_t v14 = +[RTRoutineManager defaultManager];
    long long v15 = [v10 identifier];
    [v14 updateVehicleEventWithIdentifier:v15 geoMapItem:0];

    double v16 = +[RTRoutineManager defaultManager];
    double v17 = [v10 identifier];
    [v16 updateVehicleEventWithIdentifier:v17 location:v13];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v18 = [(NSHashTable *)self->_observers allObjects];
  id v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      double v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v22);
        if (objc_opt_respondsToSelector()) {
          [v23 parkedCarManager:self didUpdateParkedCar:v9];
        }
        double v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v20);
  }

  [(ParkedCarManager *)self _updateParkedCarMapItem];
}

- (void)informCoreRoutineOfEngagementWithParkedCar:(id)a3
{
  id v5 = [a3 vehicleEvent];
  if (v5)
  {
    v3 = +[RTRoutineManager defaultManager];
    id v4 = [v5 identifier];
    [v3 engageInVehicleEventWithIdentifier:v4];
  }
}

- (void)_debug_addParkedCarAtLocation:(id)a3
{
  id v4 = a3;
  id v5 = +[RTRoutineManager defaultManager];
  [v5 vehicleEventAtLocation:v4 notes:0];

  [(ParkedCarManager *)self _updateParkedCar];
}

- (void)_debug_showParkedCarNotification
{
  id v4 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
  v3 = [(ParkedCar *)self->_parkedCar vehicleEvent];
  [v4 showParkedCarBulletinForEvent:v3];
}

- (void)_debug_showParkedCarReplacementNotification
{
  id v5 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
  v3 = [(ParkedCar *)self->_parkedCar vehicleEvent];
  id v4 = [(ParkedCar *)self->_parkedCar vehicleEvent];
  [v5 showParkedCarReplacementBulletinForEvent:v3 replacingEvent:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedCar, 0);
  objc_storeStrong((id *)&self->_fetchHandlers, 0);
  objc_storeStrong((id *)&self->_ticket, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end