@interface NavigationTrackingTask
+ (int64_t)creationPreference;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)trackNavigationStarted:(BOOL)a3 purpose:(int)a4 originResolvedType:(int)a5 destinationResolvedType:(int)a6;
@end

@implementation NavigationTrackingTask

+ (int64_t)creationPreference
{
  return 2;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((+[GEOAPPortal directionsRequestDetailsAreDisabled] & 1) == 0)
  {
    id v11 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      id v14 = v10;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (!v14 || (isKindOfClass & 1) == 0)
      {
        v55 = [v13 configuration];
        v16 = [v55 originWaypointRequest];
        v17 = [v16 waypointRequest];
        [v17 coordinate];
        v19 = v18;
        double v21 = v20;

        v22 = [v55 destinationWaypointRequest];
        v23 = [v22 waypointRequest];
        [v23 coordinate];
        double v25 = v24;
        double v27 = v26;

        v54 = sub_100018584();
        v28 = [v54 oneUser];
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_100C2FC34;
        v56[3] = &unk_10131BF58;
        v56[4] = self;
        id v57 = v14;
        int v58 = 4;
        id v29 = v28;
        v53 = v56;
        dispatch_group_t v30 = dispatch_group_create();
        v31 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v21;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Checking origin <%+.6f,%+.6f>", buf, 0x16u);
        }

        v68[0] = 0;
        v68[1] = v68;
        v68[2] = 0x2020000000;
        int v69 = 4;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100C2FF44;
        v76 = &unk_10131BF80;
        v78 = v19;
        double v79 = v21;
        v77 = v68;
        id v32 = v29;
        v33 = v30;
        v34 = buf;
        dispatch_group_enter(v33);
        GEOConfigGetDouble();
        double v36 = v35;
        GEOConfigGetDouble();
        double v38 = v37;
        uint64_t Integer = GEOConfigGetInteger();
        *(void *)v70 = _NSConcreteStackBlock;
        *(void *)&v70[8] = 3221225472;
        *(void *)&v70[16] = sub_100C30520;
        v71 = &unk_10131BFD0;
        v40 = v34;
        id v73 = v40;
        v41 = v33;
        v72 = v41;
        [v32 meCardForProminentPlacesAroundCoordinate:Integer v70 maxDistance:*(double *)&v19 maxAge:v21 minVisits:v36 handler:v38];

        v42 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v70 = 134218240;
          *(double *)&v70[4] = v25;
          *(_WORD *)&v70[12] = 2048;
          *(double *)&v70[14] = v27;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Checking destination <%+.6f,%+.6f>", v70, 0x16u);
        }

        v66[0] = 0;
        v66[1] = v66;
        v66[2] = 0x2020000000;
        int v67 = 4;
        *(void *)v70 = _NSConcreteStackBlock;
        *(void *)&v70[8] = 3221225472;
        *(void *)&v70[16] = sub_100C300F0;
        v71 = &unk_10131BF80;
        id v73 = v19;
        double v74 = v21;
        v72 = v66;
        id v43 = v32;
        v44 = v41;
        v45 = v70;
        dispatch_group_enter(v44);
        GEOConfigGetDouble();
        double v47 = v46;
        GEOConfigGetDouble();
        double v49 = v48;
        uint64_t v50 = GEOConfigGetInteger();
        block = _NSConcreteStackBlock;
        uint64_t v60 = 3221225472;
        v61 = sub_100C30520;
        v62 = &unk_10131BFD0;
        v51 = v45;
        v64 = v51;
        v52 = v44;
        v63 = v52;
        [v43 meCardForProminentPlacesAroundCoordinate:v50 maxDistance:&block maxAge:v25 minVisits:v27 handler:v47];

        block = _NSConcreteStackBlock;
        uint64_t v60 = 3221225472;
        v61 = sub_100C3029C;
        v62 = &unk_10131BFA8;
        v65 = v66;
        v64 = v68;
        v63 = v53;
        dispatch_group_notify(v52, (dispatch_queue_t)&_dispatch_main_q, &block);

        _Block_object_dispose(v66, 8);
        _Block_object_dispose(v68, 8);
      }
    }
  }
}

- (void)trackNavigationStarted:(BOOL)a3 purpose:(int)a4 originResolvedType:(int)a5 destinationResolvedType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  BOOL v9 = a3;
  GEOFindOrCreateLog();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if (v7 >= 5)
    {
      v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v16 = 136446978;
        v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/AuxiliaryTasks/NavigationTrackingTask.m";
        __int16 v18 = 1024;
        *(_DWORD *)v19 = 94;
        *(_WORD *)&v19[4] = 2082;
        *(void *)&v19[6] = "NSString *_stringForType(GEOLogMsgEventDirectionsRequestDetails_DirectionsRequestLocation)";
        __int16 v20 = 2082;
        double v21 = "YES";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. An unhandled GEOLogMsgEventDirectionsRequestDetails_DirectionsRequestLocation?", (uint8_t *)&v16, 0x26u);
      }

      CFStringRef v11 = @"?";
    }
    else
    {
      CFStringRef v11 = off_10131BFF0[(int)v7];
    }
    if (v6 >= 5)
    {
      id v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        int v16 = 136446978;
        v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/AuxiliaryTasks/NavigationTrackingTask.m";
        __int16 v18 = 1024;
        *(_DWORD *)v19 = 94;
        *(_WORD *)&v19[4] = 2082;
        *(void *)&v19[6] = "NSString *_stringForType(GEOLogMsgEventDirectionsRequestDetails_DirectionsRequestLocation)";
        __int16 v20 = 2082;
        double v21 = "YES";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. An unhandled GEOLogMsgEventDirectionsRequestDetails_DirectionsRequestLocation?", (uint8_t *)&v16, 0x26u);
      }

      CFStringRef v13 = @"?";
    }
    else
    {
      CFStringRef v13 = off_10131BFF0[(int)v6];
    }
    int v16 = 138412546;
    v17 = (const char *)v11;
    __int16 v18 = 2112;
    *(void *)v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Sending Analytics [%@, %@]", (uint8_t *)&v16, 0x16u);
  }

  v15 = +[NSNumber numberWithBool:v9];
  +[GEOAPPortal captureDirectionsRequestDetailsWithNavStarted:v15 purpose:v8 origin:v7 destination:v6];
}

@end