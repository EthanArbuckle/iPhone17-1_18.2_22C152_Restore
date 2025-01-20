@interface CarStateManager
- (void)setMapsActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5;
@end

@implementation CarStateManager

- (void)setMapsActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5
{
  id v6 = a3;
  if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    v7 = +[NSUUID UUID];
    v8 = [v7 UUIDString];

    v9 = sub_1000A930C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v51 = (int64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "setting Maps activity (tag %@)", buf, 0xCu);
    }

    v10 = dispatch_get_global_queue(-2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100CC32F8;
    block[3] = &unk_1012EA9E0;
    id v11 = v8;
    id v45 = v11;
    int64_t v47 = a5;
    id v12 = v6;
    id v46 = v12;
    dispatch_async(v10, block);

    if (!v12) {
      goto LABEL_37;
    }
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v51 = a5;
      __int16 v52 = 2112;
      id v53 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "setting Maps activity from source: %ld : state: %@", buf, 0x16u);
    }

    if (![v12 hasDirectionsPlan]) {
      goto LABEL_37;
    }
    v14 = [v12 directionsPlan];
    v15 = [v14 routeRequestStorage];
    v16 = [v15 waypoints];
    id v17 = [v16 count];

    v18 = (SearchResult *)objc_alloc_init((Class)NSMutableDictionary);
    v19 = [v14 originString];
    v20 = [v14 destinationString];
    unint64_t v21 = (unint64_t)v20;
    if (v19 && !v20 && v17)
    {
      v22 = [v14 routeRequestStorage];
      v23 = [v22 waypoints];
      v24 = [v23 firstObject];

      if ([v24 isCurrentLocation])
      {
        v25 = +[SearchResult currentLocationSearchResult];
      }
      else
      {
        v25 = [[SearchResult alloc] initWithComposedWaypoint:v24];
      }
      unint64_t v26 = (unint64_t)v25;
    }
    else
    {
      if (!v19 && v20 && v17)
      {
        if (objc_msgSend(v20, "_maps_isEqualToSearchStringForCurrentLocationSearchResult"))
        {
          unint64_t v26 = +[SearchResult currentLocationSearchResult];
        }
        else
        {
          unint64_t v26 = 0;
        }
        goto LABEL_30;
      }
      if ((unint64_t)v17 < 2)
      {
        if (v17 != (id)1)
        {
          unint64_t v26 = 0;
LABEL_27:
          if (!(v26 | v21))
          {
            unint64_t v26 = (unint64_t)v18;
LABEL_36:

LABEL_37:
            goto LABEL_38;
          }
LABEL_30:
          double v30 = 0.0;
          if (a5 == 5)
          {
            id v31 = +[NSNumber numberWithDouble:5.0];
            v32 = +[NSUserDefaults standardUserDefaults];
            v33 = [v32 objectForKey:@"NavigationAutoLaunchDelayKey"];

            if (v33) {
              v34 = v33;
            }
            else {
              v34 = v31;
            }
            id v35 = v34;

            [v35 doubleValue];
            double v30 = v36;
          }
          v48[0] = @"DirectionsNavigationAutoLaunchDelayKey";
          v37 = +[NSNumber numberWithDouble:v30];
          v48[1] = @"DirectionsShouldRestoreLowGuidanceKey";
          v49[0] = v37;
          v38 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v14 shouldRestoreLowGuidance]);
          v49[1] = v38;
          v39 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];

          v40 = +[CarChromeModeCoordinator sharedInstance];
          [v40 displayRoutePlanningForDestination:v26 userInfo:v39];

          v19 = v18;
          goto LABEL_36;
        }
        v41 = [SearchResult alloc];
        v24 = [v14 routeRequestStorage];
        v43 = [v24 waypoints];
        v42 = [v43 firstObject];
        unint64_t v26 = [(SearchResult *)v41 initWithComposedWaypoint:v42];
      }
      else
      {
        v27 = [v14 routeRequestStorage];
        v28 = [v27 waypoints];
        v24 = [v28 lastObject];

        unint64_t v26 = [[SearchResult alloc] initWithComposedWaypoint:v24];
        if ((unint64_t)a5 <= 4 && ((1 << a5) & 0x15) != 0)
        {
          if ([v24 isCurrentLocation])
          {
            uint64_t v29 = +[SearchResult currentLocationSearchResult];

            unint64_t v26 = v29;
          }
        }
        else
        {
          [(SearchResult *)v18 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DirectionsAttemptCachedRouteKey"];
        }
      }
    }

    goto LABEL_27;
  }
LABEL_38:
}

@end