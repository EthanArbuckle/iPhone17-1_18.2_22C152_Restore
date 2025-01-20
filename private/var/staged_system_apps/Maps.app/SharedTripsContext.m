@interface SharedTripsContext
- (BOOL)shouldShowRoute;
- (BOOL)showsMapView;
- (BOOL)usesDefaultTransitions;
- (GEOSharedNavState)selectedTrip;
- (MKMapView)mapView;
- (MapCameraController)cameraController;
- (NSArray)sharedTrips;
- (PersonalizedItemManager)personalizedItemManager;
- (RouteAnnotationsController)routeAnnotationsController;
- (SearchPinsManager)searchPinsManager;
- (SharedTripsAnnotationsController)sharedTripsAnnotationsController;
- (SharedTripsContext)init;
- (SharedTripsContext)initWithInitialSelectedSharedTrip:(id)a3;
- (void)_updateEverything;
- (void)_updateSharedTrips;
- (void)becomeCurrent:(BOOL)a3;
- (void)dealloc;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)presentDetailsForSelectedTrip;
- (void)presentErrorForChinaTrip:(id)a3;
- (void)presentErrorForUnsupportedProtocolOrTransportWithTrip:(id)a3;
- (void)recenterOnRouteAnimated:(BOOL)a3;
- (void)resignCurrent:(BOOL)a3;
- (void)setSelectedTrip:(id)a3;
- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4;
@end

@implementation SharedTripsContext

- (SharedTripsContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)SharedTripsContext;
  v2 = [(SharedTripsContext *)&v5 init];
  if (v2)
  {
    v3 = sub_100AB11D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    [(SharedTripsContext *)v2 _updateSharedTrips];
  }
  return v2;
}

- (SharedTripsContext)initWithInitialSelectedSharedTrip:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SharedTripsContext *)self init];
  if (v5)
  {
    v6 = sub_100AB11D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [v4 groupIdentifier];
      int v11 = 134349314;
      v12 = v5;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with shared trip: %@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v8 = [v4 groupIdentifier];
    selectedTripID = v5->_selectedTripID;
    v5->_selectedTripID = (NSString *)v8;
  }
  return v5;
}

- (void)dealloc
{
  v3 = sub_100AB11D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)SharedTripsContext;
  [(SharedTripsContext *)&v4 dealloc];
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)shouldShowRoute
{
  v2 = [(SharedTripsContext *)self mapView];
  v3 = [v2 traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] != (id)3;

  return v4;
}

- (void)recenterOnRouteAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SharedTripsContext *)self sharedTripsAnnotationsController];
  [v4 recenterOnRouteAnimated:v3];
}

- (void)becomeCurrent:(BOOL)a3
{
  [(SharedTripsContext *)self _updateSharedTrips];
  id v4 = [(SharedTripsContext *)self selectedTrip];
  if (!v4)
  {
    objc_super v5 = [(SharedTripsContext *)self sharedTrips];
    id v6 = [v5 count];

    if (v6 != (id)1) {
      goto LABEL_5;
    }
    v7 = [(SharedTripsContext *)self sharedTrips];
    id v4 = [v7 firstObject];

    uint64_t v8 = [v4 groupIdentifier];
    selectedTripID = self->_selectedTripID;
    self->_selectedTripID = v8;
  }
LABEL_5:
  id v12 = [(SharedTripsContext *)self selectedTrip];
  if (v12)
  {
    v10 = [(SharedTripsContext *)self sharedTripsAnnotationsController];
    [v10 setSharedTrip:v12];
  }
  int v11 = +[MSPSharedTripService sharedInstance];
  [v11 addReceivingObserver:self];
}

- (void)resignCurrent:(BOOL)a3
{
  id v4 = +[MSPSharedTripService sharedInstance];
  [v4 removeReceivingObserver:self];

  id v5 = [(SharedTripsContext *)self sharedTripsAnnotationsController];
  [v5 setSharedTrip:0];
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  id v5 = [(SharedTripsContext *)self sharedTripsAnnotationsController];
  [v5 setAutomaticallyRecenter:0];
}

- (void)_updateEverything
{
  [(SharedTripsContext *)self _updateSharedTrips];
  BOOL v3 = [(SharedTripsContext *)self sharedTripsAnnotationsController];
  [v3 reload];

  if (![(NSArray *)self->_sharedTrips count])
  {
    [(SharedTripsContext *)self dismiss];
  }
}

- (void)_updateSharedTrips
{
  id v5 = +[MSPSharedTripService sharedInstance];
  BOOL v3 = [v5 receivedTrips];
  sharedTrips = self->_sharedTrips;
  self->_sharedTrips = v3;
}

- (void)setSelectedTrip:(id)a3
{
  id v4 = a3;
  id v5 = sub_100AB11D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      int v11 = @"<nil>";
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(SharedTripsContext *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        int v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    int v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    id v12 = [v4 groupIdentifier];
    *(_DWORD *)buf = 138544386;
    v44 = v11;
    __int16 v45 = 2112;
    v46 = v12;
    __int16 v47 = 2048;
    uint64_t v48 = [v4 transportType];
    __int16 v49 = 2048;
    unint64_t v50 = [v4 protocolVersion];
    __int16 v51 = 1024;
    unsigned int v52 = [v4 referenceFrame];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Selecting trip: %@, transportType: %lu, protocolVersion: %lu, referenceFrame: %d", buf, 0x30u);
  }
  __int16 v13 = [v4 groupIdentifier];
  selectedTripID = self->_selectedTripID;
  self->_selectedTripID = v13;

  v15 = [(SharedTripsContext *)self selectedTrip];

  if (!v15) {
    goto LABEL_38;
  }
  if (![(__CFString *)v15 disallowDetailsForChina])
  {
    if ([(__CFString *)v15 disallowDetailsForTransportType])
    {
      v23 = sub_100AB11D4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = self;
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        if (objc_opt_respondsToSelector())
        {
          v27 = [(SharedTripsContext *)v24 performSelector:"accessibilityIdentifier"];
          v28 = v27;
          if (v27 && ![v27 isEqualToString:v26])
          {
            v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v28];

            goto LABEL_28;
          }
        }
        v29 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
LABEL_28:

        v30 = v29;
        id v31 = [(__CFString *)v15 transportType];
        if (v31 >= 7)
        {
          v32 = +[NSString stringWithFormat:@"(unknown: %i)", v31];
        }
        else
        {
          v32 = off_1013165A0[(int)v31];
        }
        uint64_t UInteger = GEOConfigGetUInteger();
        *(_DWORD *)buf = 138544130;
        v44 = v30;
        __int16 v45 = 2112;
        v46 = v32;
        __int16 v47 = 2048;
        uint64_t v48 = UInteger;
        __int16 v49 = 2112;
        unint64_t v50 = (unint64_t)v15;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Selected trip is not allowed for transport type: %@. Allowed transport type bitmask: %lu. Trip: %@", buf, 0x2Au);
      }
LABEL_42:

      [(SharedTripsContext *)self presentErrorForUnsupportedProtocolOrTransportWithTrip:v15];
      goto LABEL_43;
    }
    if ([(__CFString *)v15 disallowDetailsForProtocolVersion])
    {
      v23 = sub_100AB11D4();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      v33 = self;
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      if (objc_opt_respondsToSelector())
      {
        v36 = [(SharedTripsContext *)v33 performSelector:"accessibilityIdentifier"];
        v37 = v36;
        if (v36 && ![v36 isEqualToString:v35])
        {
          v38 = +[NSString stringWithFormat:@"%@<%p, %@>", v35, v33, v37];

          goto LABEL_37;
        }
      }
      v38 = +[NSString stringWithFormat:@"%@<%p>", v35, v33];
LABEL_37:

      v39 = (__CFString *)[(__CFString *)v15 protocolVersion];
      uint64_t v40 = GEOConfigGetUInteger();
      *(_DWORD *)buf = 138544130;
      v44 = v38;
      __int16 v45 = 2048;
      v46 = v39;
      __int16 v47 = 2048;
      uint64_t v48 = v40;
      __int16 v49 = 2112;
      unint64_t v50 = (unint64_t)v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Selected trip protocol (%lu) is greater than ours (%lu). Trip: %@", buf, 0x2Au);

      goto LABEL_42;
    }
LABEL_38:
    v41 = [(SharedTripsContext *)self sharedTripsAnnotationsController];
    [v41 setSharedTrip:v15];

    [(SharedTripsContext *)self presentDetailsForSelectedTrip];
    goto LABEL_43;
  }
  v16 = sub_100AB11D4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = self;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      v20 = [(SharedTripsContext *)v17 performSelector:"accessibilityIdentifier"];
      v21 = v20;
      if (v20 && ![v20 isEqualToString:v19])
      {
        v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

        goto LABEL_19;
      }
    }
    v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_19:

    *(_DWORD *)buf = 138543618;
    v44 = v22;
    __int16 v45 = 2112;
    v46 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Selected trip is not allowed for China: %@", buf, 0x16u);
  }
  [(SharedTripsContext *)self presentErrorForChinaTrip:v15];
LABEL_43:
}

- (GEOSharedNavState)selectedTrip
{
  sharedTrips = self->_sharedTrips;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100AB1E44;
  v7[3] = &unk_1012E9B20;
  v7[4] = self;
  id v4 = [(NSArray *)sharedTrips indexOfObjectPassingTest:v7];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_sharedTrips objectAtIndexedSubscript:v4];
  }

  return (GEOSharedNavState *)v5;
}

- (void)presentDetailsForSelectedTrip
{
}

- (void)presentErrorForChinaTrip:(id)a3
{
}

- (void)presentErrorForUnsupportedProtocolOrTransportWithTrip:(id)a3
{
}

- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4
{
  id v7 = a4;
  [(SharedTripsContext *)self _updateSharedTrips];
  if ([(NSArray *)self->_sharedTrips count])
  {
    id v5 = [v7 groupIdentifier];
    unsigned int v6 = [v5 isEqualToString:self->_selectedTripID];

    if (v6) {
      [(SharedTripsContext *)self setSelectedTrip:0];
    }
  }
  else
  {
    [(SharedTripsContext *)self dismiss];
  }
}

- (MapCameraController)cameraController
{
  return self->_cameraController;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (PersonalizedItemManager)personalizedItemManager
{
  return self->_personalizedItemManager;
}

- (RouteAnnotationsController)routeAnnotationsController
{
  return self->_routeAnnotationsController;
}

- (SharedTripsAnnotationsController)sharedTripsAnnotationsController
{
  return self->_sharedTripsAnnotationsController;
}

- (SearchPinsManager)searchPinsManager
{
  return self->_searchPinsManager;
}

- (NSArray)sharedTrips
{
  return self->_sharedTrips;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTrips, 0);
  objc_storeStrong((id *)&self->_searchPinsManager, 0);
  objc_storeStrong((id *)&self->_sharedTripsAnnotationsController, 0);
  objc_storeStrong((id *)&self->_routeAnnotationsController, 0);
  objc_storeStrong((id *)&self->_personalizedItemManager, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_cameraController, 0);

  objc_storeStrong((id *)&self->_selectedTripID, 0);
}

@end