@interface FMFUtils
+ (BOOL)locationServicesEnabled;
+ (BOOL)shareMyLocationSystemServiceEnabled;
+ (id)shiftLocations:(id)a3;
+ (unint64_t)timeout;
+ (void)handleAlertAction:(id)a3;
@end

@implementation FMFUtils

+ (id)shiftLocations:(id)a3
{
  id v45 = a1;
  id v3 = a3;
  id v48 = objc_alloc_init((Class)GEOLocationShifter);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v65;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v65 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        v8 = [v7 objectForKeyedSubscript:@"location" v45];
        v9 = +[NSNull null];
        if (v8 == v9)
        {

          v10 = 0;
        }
        else
        {
          v10 = [v7 objectForKeyedSubscript:@"location"];

          if (v10)
          {
            v11 = [v10 objectForKey:@"latitude"];
            [v11 doubleValue];
            double v13 = v12;
            v14 = [v10 objectForKey:@"longitude"];
            [v14 doubleValue];
            double v16 = v15;

            if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:", v13, v16))
            {
              v19 = sub_100005560();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v70 = v7;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Detected location shift required for incoming locations(%@)", buf, 0xCu);
              }

              v49 = +[NSMutableArray array];
              group = dispatch_group_create();
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              id v47 = obj;
              id v21 = [v47 countByEnumeratingWithState:&v60 objects:v68 count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v61;
                do
                {
                  for (j = 0; j != v21; j = (char *)j + 1)
                  {
                    if (*(void *)v61 != v22) {
                      objc_enumerationMutation(v47);
                    }
                    v24 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
                    id v25 = [v24 mutableCopy];
                    v26 = [v24 objectForKeyedSubscript:@"location"];
                    v27 = +[NSNull null];
                    if (v26 == v27)
                    {
                      id v29 = [0 mutableCopy];
                    }
                    else
                    {
                      v28 = [v24 objectForKeyedSubscript:@"location"];
                      id v29 = [v28 mutableCopy];
                    }
                    if (v29)
                    {
                      v30 = [v29 objectForKey:@"latitude"];
                      [v30 doubleValue];
                      double v32 = v31;
                      v33 = [v29 objectForKey:@"longitude"];
                      [v33 doubleValue];
                      double v35 = v34;

                      dispatch_group_enter(group);
                      v36 = sub_100005560();
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Entering shifter dispatch group", buf, 2u);
                      }

                      v53[0] = _NSConcreteStackBlock;
                      v53[1] = 3221225472;
                      v53[2] = sub_100025FE8;
                      v53[3] = &unk_1000A2330;
                      double v58 = v32;
                      double v59 = v35;
                      v53[4] = v24;
                      id v54 = v29;
                      id v55 = v25;
                      id v56 = v49;
                      v57 = group;
                      v51[0] = _NSConcreteStackBlock;
                      v51[1] = 3221225472;
                      v51[2] = sub_100026220;
                      v51[3] = &unk_1000A1708;
                      v52 = v57;
                      v37 = dispatch_get_global_queue(0, 0);
                      [v48 shiftCoordinate:v53 accuracy:0 withCompletionHandler:v51 mustGoToNetworkCallback:v37 errorHandler:v32 callbackQueue:v35];
                    }
                    else
                    {
                      id v38 = v49;
                      objc_sync_enter(v38);
                      [v38 addObject:v25];
                      v39 = sub_100005560();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v70 = v49;
                        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Outside shifter, updated locations array: %@", buf, 0xCu);
                      }

                      objc_sync_exit(v38);
                    }
                  }
                  id v21 = [v47 countByEnumeratingWithState:&v60 objects:v68 count:16];
                }
                while (v21);
              }

              dispatch_group_wait(group, (dispatch_time_t)[v45 timeout]);
              v40 = sub_100005560();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Shifter after dispatch_group_wait", buf, 2u);
              }

              v18 = v49;
              objc_sync_enter(v18);
              id v41 = [v47 count];
              if (v41 == [v18 count])
              {
                id v17 = [v18 copy];
                v42 = sub_100005560();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v70 = v17;
                  v43 = "Shifter updating shiftedLocationsArray(%@) due to same count";
                  goto LABEL_41;
                }
              }
              else
              {
                id v17 = v47;
                v42 = sub_100005560();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v70 = v17;
                  v43 = "Shifter updating shiftedLocationsArray(%@) due to mismatched array count";
LABEL_41:
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);
                }
              }

              objc_sync_exit(v18);
              goto LABEL_43;
            }
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v17 = obj;
  v18 = sub_100005560();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v70 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Shifter updating shiftedLocationsArray(%@) due to no shifting required", buf, 0xCu);
  }
LABEL_43:

  return v17;
}

+ (unint64_t)timeout
{
  return dispatch_time(0, 10000000000);
}

+ (BOOL)locationServicesEnabled
{
  return +[CLLocationManager locationServicesEnabled];
}

+ (BOOL)shareMyLocationSystemServiceEnabled
{
  v2 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FMF.framework"];
  unsigned int v3 = +[CLLocationManager authorizationStatusForBundle:v2];

  return v3 == 3;
}

+ (void)handleAlertAction:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v8 = [v3 objectForKeyedSubscript:@"url"];
    id v4 = [v3 objectForKeyedSubscript:@"sensitive"];

    unsigned int v5 = [v4 BOOLValue];
    v6 = +[LSApplicationWorkspace defaultWorkspace];
    v7 = v6;
    if (v5) {
      [v6 openSensitiveURL:v8 withOptions:0];
    }
    else {
      [v6 openURL:v8 withOptions:0];
    }
  }
}

@end