@interface RouteAnnotationsResponder
+ (id)routeAtPoint:(CGPoint)a3 inMapView:(id)a4 withRoutes:(id)a5 selectedRoute:(id)a6 overlappingRouteSelectorBlock:(id)a7;
@end

@implementation RouteAnnotationsResponder

+ (id)routeAtPoint:(CGPoint)a3 inMapView:(id)a4 withRoutes:(id)a5 selectedRoute:(id)a6 overlappingRouteSelectorBlock:(id)a7
{
  double y = a3.y;
  double x = a3.x;
  id v12 = a4;
  id v13 = a5;
  id v53 = a6;
  id v52 = a7;
  [v12 convertPoint:v12 toCoordinateFromView:x, y];
  MKMapPoint v14 = MKMapPointForCoordinate(v74);
  v56 = +[NSMapTable strongToStrongObjectsMapTable];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v13;
  id v15 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v62;
    double v18 = 1.79769313e308;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v62 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        [v20 _maps_closestMapPointToMapPoint:v14.x, v14.y];
        CLLocationCoordinate2D v21 = MKCoordinateForMapPoint(v75);
        [v12 convertCoordinate:v12 toPointToView:v21.latitude, v21.longitude];
        UIDistanceBetweenPoints();
        uint64_t v23 = *(void *)&v22;
        if (v22 < v18) {
          double v18 = v22;
        }
        v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v56 setObject:v24 forKey:v20];

        v25 = sub_1005BE42C();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v26 = [v20 uniqueRouteID];
          v27 = [v26 UUIDString];
          *(_DWORD *)buf = 134349570;
          id v67 = a1;
          __int16 v68 = 2048;
          uint64_t v69 = v23;
          __int16 v70 = 2112;
          v71 = v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "[%{public}p] Adding minimum distance (%f) for route: %@", buf, 0x20u);
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
    }
    while (v16);
  }
  else
  {
    double v18 = 1.79769313e308;
  }

  v28 = sub_1005BE42C();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    id v67 = a1;
    __int16 v68 = 2048;
    uint64_t v69 = *(void *)&v18;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}p] Calculated closest route distance: %f", buf, 0x16u);
  }

  v29 = sub_1005BE42C();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
  if (v18 > 30.0)
  {
    v32 = v52;
    v31 = v53;
    if (v30)
    {
      *(_DWORD *)buf = 134349312;
      id v67 = a1;
      __int16 v68 = 2048;
      uint64_t v69 = 0x403E000000000000;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}p] Closest route distance was larger than the maximum (%f)", buf, 0x16u);
    }
LABEL_41:
    v46 = 0;
    goto LABEL_46;
  }
  if (v30)
  {
    *(_DWORD *)buf = 134349312;
    id v67 = a1;
    __int16 v68 = 2048;
    uint64_t v69 = 0x403E000000000000;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}p] Closest route distance was smaller than the maximum (%f)", buf, 0x16u);
  }

  v29 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [obj count]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v33 = v56;
  id v34 = [v33 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v58;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v58 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v57 + 1) + 8 * (void)j);
        v39 = [v33 objectForKey:v38];
        [v39 cgFloatValue];
        double v41 = v40;

        if (vabdd_f64(v41, v18) < 0.00999999978) {
          [v29 addObject:v38];
        }
      }
      id v35 = [v33 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v35);
  }

  id v42 = [v29 count];
  v43 = sub_1005BE42C();
  v44 = v43;
  if (!v42)
  {
    v32 = v52;
    v31 = v53;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349312;
      id v67 = a1;
      __int16 v68 = 2048;
      uint64_t v69 = 0x3F847AE140000000;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "[%{public}p] Did not find any routes within %f of the closestRouteDistance", buf, 0x16u);
    }

    goto LABEL_41;
  }
  v32 = v52;
  v31 = v53;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    v45 = sub_100099700(v29, &stru_1012F1070);
    *(_DWORD *)buf = 134349314;
    id v67 = a1;
    __int16 v68 = 2112;
    uint64_t v69 = (uint64_t)v45;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "[%{public}p] Found closest routes: %@", buf, 0x16u);
  }
  if ([v29 count] == (id)1) {
    goto LABEL_45;
  }
  if (!v52)
  {
    v50 = sub_1005BE42C();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      id v67 = a1;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "[%{public}p] overlappingRouteSelectorBlock is nil; cannot differentiate between multiple overlapping routes",
        buf,
        0xCu);
    }

LABEL_45:
    v46 = [v29 firstObject];
    goto LABEL_46;
  }
  v46 = (*((void (**)(id, NSObject *, id))v52 + 2))(v52, v29, v53);
  v47 = sub_1005BE42C();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = [v46 uniqueRouteID];
    v49 = [v48 UUIDString];
    *(_DWORD *)buf = 134349314;
    id v67 = a1;
    __int16 v68 = 2112;
    uint64_t v69 = (uint64_t)v49;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "[%{public}p] Differentiated between multiple overlapping routes: %@", buf, 0x16u);
  }
LABEL_46:

  return v46;
}

@end