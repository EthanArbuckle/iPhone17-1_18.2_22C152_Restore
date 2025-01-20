@interface NavigationRouteDetourer
- (MNNavigationService)navigationService;
- (NavigationRouteDetourer)initWithNavigationService:(id)a3 platformController:(id)a4 routeInfoProvider:(id)a5 routeInterrupter:(id)a6;
- (NavigationRouteHistoryInfoProviding)routeInfoProvider;
- (NavigationRouteInterrupting)routeInterrupter;
- (PlatformController)platformController;
- (void)detourRouteToMapItem:(id)a3;
- (void)detourRouteToWaypoint:(id)a3;
- (void)detourRouteToWaypoint:(id)a3 replacingWaypoint:(id)a4;
@end

@implementation NavigationRouteDetourer

- (NavigationRouteDetourer)initWithNavigationService:(id)a3 platformController:(id)a4 routeInfoProvider:(id)a5 routeInterrupter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NavigationRouteDetourer;
  v15 = [(NavigationRouteDetourer *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_navigationService, a3);
    objc_storeWeak((id *)&v16->_platformController, v12);
    objc_storeStrong((id *)&v16->_routeInfoProvider, a5);
    objc_storeStrong((id *)&v16->_routeInterrupter, a6);
  }

  return v16;
}

- (void)detourRouteToMapItem:(id)a3
{
  id v16 = a3;
  v4 = [v16 _geoMapItemStorageForPersistence];
  id v5 = [objc_alloc((Class)GEOComposedWaypoint) initWithMapItem:v4];
  v6 = +[MNNavigationService sharedService];
  v7 = [v6 arrivalInfo];

  v8 = +[MNNavigationService sharedService];
  v9 = [v8 route];

  v10 = [v9 legs];
  id v11 = [v7 legIndex];
  if (v11 >= [v10 count])
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [v10 objectAtIndex:v11];
  }
  id v13 = [v16 pointOfInterestCategory];
  if ([v13 isEqualToString:MKPointOfInterestCategoryEVCharger]
    && (([v7 isInArrivalState] & 1) != 0
     || ([v7 isInParkingState] & 1) != 0))
  {
    id v14 = [v12 chargingStationInfo];

    if (v14)
    {
      v15 = [v7 destination];
      [(NavigationRouteDetourer *)self detourRouteToWaypoint:v5 replacingWaypoint:v15];

      goto LABEL_11;
    }
  }
  else
  {
  }
  [(NavigationRouteDetourer *)self detourRouteToWaypoint:v5];
LABEL_11:
}

- (void)detourRouteToWaypoint:(id)a3
{
}

- (void)detourRouteToWaypoint:(id)a3 replacingWaypoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NavigationRouteDetourer *)self navigationService];
  switch([v8 navigationTransportType])
  {
    case 1u:
    case 6u:

      goto LABEL_12;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_5;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_5:
      char v10 = IsEnabled_Maps182;

      if (v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    default:
      int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();

      if (IsEnabled_DrivingMultiWaypointRoutes)
      {
LABEL_6:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
        id v12 = [WeakRetained currentNavigationSession];
        id v13 = [v12 waypointController];

        if (v13)
        {
          if (v7)
          {
            id v14 = sub_100015DB4();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v15 = [v7 name];
              id v16 = [v6 name];
              int v25 = 138412546;
              v26 = v15;
              __int16 v27 = 2112;
              v28 = v16;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[MPR] replacing waypoint %@ with %@", (uint8_t *)&v25, 0x16u);
            }
            [v13 replaceWaypoint:v7 with:v6];
          }
          else
          {
            v23 = sub_10000AF10();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = [v6 name];
              int v25 = 138412290;
              v26 = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[MPR] inserting new waypoint %@", (uint8_t *)&v25, 0xCu);
            }
            [v13 insertWaypoint:v6];
          }
        }
        else
        {
          v22 = sub_10000AF10();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v25) = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Failed to reach nav waypoint controller from NavigationRouteDetourer", (uint8_t *)&v25, 2u);
          }

          id v13 = 0;
        }
      }
      else
      {
LABEL_12:
        objc_super v18 = [(NavigationRouteDetourer *)self navigationService];
        [v18 updateDestination:v6];

        v19 = [(NavigationRouteDetourer *)self routeInfoProvider];
        id v13 = [v19 historyEntryRoute];

        v20 = sub_10000AF10();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412290;
          v26 = v13;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Will interrupt route with history entry: %@.", (uint8_t *)&v25, 0xCu);
        }

        v21 = [(NavigationRouteDetourer *)self routeInterrupter];
        [v21 interruptHistoryEntryRoute:v13 withCompletion:0];
      }
      return;
  }
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (NavigationRouteHistoryInfoProviding)routeInfoProvider
{
  return self->_routeInfoProvider;
}

- (NavigationRouteInterrupting)routeInterrupter
{
  return self->_routeInterrupter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeInterrupter, 0);
  objc_storeStrong((id *)&self->_routeInfoProvider, 0);
  objc_destroyWeak((id *)&self->_platformController);

  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end