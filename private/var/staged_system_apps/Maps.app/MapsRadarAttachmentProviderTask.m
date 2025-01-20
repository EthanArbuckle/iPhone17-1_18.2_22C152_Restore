@interface MapsRadarAttachmentProviderTask
+ (BOOL)_isCarPlayMapView:(id)a3;
+ (BOOL)_isMainScreenMapView:(id)a3;
+ (BOOL)getCurrentTileStateSnapshotWithDirectoryURL:(id *)a3 debugTreeURLs:(id *)a4 mapsActivityDataPath:(id *)a5 error:(id *)a6;
+ (int64_t)creationPreference;
- (MapsRadarAttachmentProviderTask)initWithRadarController:(id)a3;
- (MapsRadarController)radarController;
- (OS_dispatch_queue)processingQueue;
- (void)dealloc;
- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4;
- (void)setProcessingQueue:(id)a3;
- (void)setRadarController:(id)a3;
@end

@implementation MapsRadarAttachmentProviderTask

+ (int64_t)creationPreference
{
  return 1;
}

- (MapsRadarAttachmentProviderTask)initWithRadarController:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[MapsRadarAttachmentProviderTask initWithRadarController:]";
      __int16 v22 = 2080;
      v23 = "MapsRadarAttachmentProviderTask.m";
      __int16 v24 = 1024;
      int v25 = 62;
      __int16 v26 = 2080;
      v27 = "radarController != nil";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)MapsRadarAttachmentProviderTask;
  v6 = [(MapsRadarAttachmentProviderTask *)&v19 init];
  if (v6)
  {
    v7 = sub_1005032E0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v21 = (const char *)v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = +[NSString stringWithFormat:@"%@.%@.isolationQueue.%p", v8, objc_opt_class(), v6];

    id v10 = v9;
    v11 = (const char *)[v10 UTF8String];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    processingQueue = v6->_processingQueue;
    v6->_processingQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v6->_radarController, a3);
    [(MapsRadarController *)v6->_radarController addAttachmentProvider:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = sub_1005032E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(MapsRadarController *)self->_radarController removeAttachmentProvider:self];
  v4.receiver = self;
  v4.super_class = (Class)MapsRadarAttachmentProviderTask;
  [(MapsRadarAttachmentProviderTask *)&v4 dealloc];
}

+ (BOOL)_isCarPlayMapView:(id)a3
{
  id v3 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v5 = dispatch_queue_get_label(0);
  if (label != v5)
  {
    BOOL v6 = !label || v5 == 0;
    if (v6 || strcmp(label, v5))
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316418;
        v16 = "+[MapsRadarAttachmentProviderTask _isCarPlayMapView:]";
        __int16 v17 = 2080;
        v18 = "MapsRadarAttachmentProviderTask.m";
        __int16 v19 = 1024;
        int v20 = 84;
        __int16 v21 = 2080;
        __int16 v22 = "dispatch_get_main_queue()";
        __int16 v23 = 2080;
        __int16 v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v25 = 2080;
        __int16 v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v15,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        dispatch_queue_t v13 = sub_1005762E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = +[NSThread callStackSymbols];
          int v15 = 138412290;
          v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
  }
  v7 = +[CarDisplayController sharedInstance];
  v8 = [v7 chromeViewController];
  id v9 = [v8 mapView];
  BOOL v10 = v9 == v3;

  return v10;
}

+ (BOOL)_isMainScreenMapView:(id)a3
{
  id v3 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v5 = dispatch_queue_get_label(0);
  if (label != v5)
  {
    BOOL v6 = !label || v5 == 0;
    if (v6 || strcmp(label, v5))
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316418;
        v16 = "+[MapsRadarAttachmentProviderTask _isMainScreenMapView:]";
        __int16 v17 = 2080;
        v18 = "MapsRadarAttachmentProviderTask.m";
        __int16 v19 = 1024;
        int v20 = 90;
        __int16 v21 = 2080;
        __int16 v22 = "dispatch_get_main_queue()";
        __int16 v23 = 2080;
        __int16 v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v25 = 2080;
        __int16 v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v15,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        dispatch_queue_t v13 = sub_1005762E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = +[NSThread callStackSymbols];
          int v15 = 138412290;
          v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
  }
  v7 = +[UIApplication sharedMapsDelegate];
  v8 = [v7 chromeViewController];
  id v9 = [v8 mapView];
  BOOL v10 = v9 == v3;

  return v10;
}

+ (BOOL)getCurrentTileStateSnapshotWithDirectoryURL:(id *)a3 debugTreeURLs:(id *)a4 mapsActivityDataPath:(id *)a5 error:(id *)a6
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v12 = dispatch_queue_get_label(0);
  if (label != v12)
  {
    BOOL v13 = !label || v12 == 0;
    if (v13 || strcmp(label, v12))
    {
      v79 = sub_1005762E4();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v110 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:]";
        __int16 v111 = 2080;
        v112 = "MapsRadarAttachmentProviderTask.m";
        __int16 v113 = 1024;
        int v114 = 97;
        __int16 v115 = 2080;
        v116 = "dispatch_get_main_queue()";
        __int16 v117 = 2080;
        v118 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v119 = 2080;
        v120 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v80 = sub_1005762E4();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          v81 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v110 = v81;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v14 = +[GEOPlatform sharedPlatform];
  unsigned __int8 v15 = [v14 isInternalInstall];

  if (v15)
  {
    id v98 = a1;
    v87 = a3;
    v88 = a4;
    v89 = a5;
    v16 = +[NSFileManager defaultManager];
    uint64_t v17 = +[NSDate date];
    v18 = +[NSCalendar currentCalendar];
    v91 = (void *)v17;
    __int16 v19 = [v18 components:252 fromDate:v17];

    uint64_t v20 = [@"~/Library/Maps/StateSnapshots" stringByExpandingTildeInPath];
    v90 = v19;
    __int16 v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/State-%ld-%02ld-%02ld.%02ld-%02ld-%02ld", v20, [v19 year], objc_msgSend(v19, "month"), objc_msgSend(v19, "day"), objc_msgSend(v19, "hour"), objc_msgSend(v19, "minute"), objc_msgSend(v19, "second"));
    id v107 = 0;
    unsigned __int8 v22 = [v16 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v107];
    id v23 = v107;
    __int16 v24 = v23;
    v92 = (void *)v20;
    v93 = v16;
    if ((v22 & 1) == 0 && v23)
    {
      __int16 v25 = sub_1005762E4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = +[NSString stringWithFormat:@"Could not create state snapshot directory %@", v24];
        *(_DWORD *)buf = 136315906;
        v110 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:]";
        __int16 v111 = 2080;
        v112 = "MapsRadarAttachmentProviderTask.m";
        __int16 v113 = 1024;
        int v114 = 129;
        __int16 v115 = 2112;
        v116 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
      }
      if (sub_100BB36BC())
      {
        v27 = sub_1005762E4();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v110 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      id v29 = 0;
      BOOL v30 = 0;
      if (a6) {
        *a6 = v24;
      }
      v76 = v90;
      v77 = (void *)v17;
LABEL_78:

      return v30;
    }
    v31 = +[NSURL fileURLWithPath:v20];
    id v106 = v24;
    unsigned __int8 v32 = [v31 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v106];
    id v33 = v106;

    if ((v32 & 1) == 0)
    {
      v34 = sub_1005762E4();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = +[NSString stringWithFormat:@"Could not exclude state snapshot directory %@ from backups: %@", v20, v33];
        *(_DWORD *)buf = 136315906;
        v110 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:]";
        __int16 v111 = 2080;
        v112 = "MapsRadarAttachmentProviderTask.m";
        __int16 v113 = 1024;
        int v114 = 141;
        __int16 v115 = 2112;
        v116 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
      }
      if (sub_100BB36BC())
      {
        v36 = sub_1005762E4();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v110 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    __int16 v24 = +[NSString stringWithFormat:@"%@/debugtree", v21];
    id v105 = v33;
    unsigned __int8 v38 = [v16 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:&v105];
    id v39 = v105;

    if ((v38 & 1) == 0 && v39)
    {
      v40 = sub_1005762E4();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = +[NSString stringWithFormat:@"Could not create debug tree directory %@", v39];
        *(_DWORD *)buf = 136315906;
        v110 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:]";
        __int16 v111 = 2080;
        v112 = "MapsRadarAttachmentProviderTask.m";
        __int16 v113 = 1024;
        int v114 = 147;
        __int16 v115 = 2112;
        v116 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
      }
      if (sub_100BB36BC())
      {
        v42 = sub_1005762E4();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v110 = v43;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }

      id v39 = 0;
    }
    v86 = v21;
    uint64_t v44 = +[NSString stringWithFormat:@"%@/MapsActivityData", v21];
    uint64_t v45 = +[UIApplication _maps_keyMapsSceneDelegate];
    v46 = [(id)v45 mapsActivity];
    v47 = [v46 data];

    id v104 = v39;
    v83 = v47;
    id v84 = (id)v44;
    LOBYTE(v45) = [v47 writeToFile:v44 options:1 error:&v104];
    id v29 = v104;

    v48 = v98;
    unsigned __int8 v85 = v22;
    if ((v45 & 1) == 0 && v29)
    {
      v49 = sub_1005762E4();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = +[NSString stringWithFormat:@"Could not write maps data to a file %@", v29];
        *(_DWORD *)buf = 136315906;
        v110 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:]";
        __int16 v111 = 2080;
        v112 = "MapsRadarAttachmentProviderTask.m";
        __int16 v113 = 1024;
        int v114 = 156;
        __int16 v115 = 2112;
        v116 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
      }
      if (sub_100BB36BC())
      {
        v51 = sub_1005762E4();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v110 = v52;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }

      id v29 = 0;
    }
    id v97 = objc_alloc_init((Class)NSMutableArray);
    +[UIApplication sharedMapsDelegate];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v82 = long long v103 = 0u;
    id obj = [v82 allVisibleMapViews];
    id v53 = [obj countByEnumeratingWithState:&v100 objects:v108 count:16];
    if (!v53)
    {
LABEL_69:

      __int16 v21 = v86;
      if (v87)
      {
        id *v87 = +[NSURL fileURLWithPath:v86];
      }
      v76 = v90;
      BOOL v30 = v85;
      if (v88) {
        id *v88 = [v97 copy];
      }
      if (v89) {
        id *v89 = v84;
      }

      v77 = v91;
      goto LABEL_78;
    }
    id v54 = v53;
    uint64_t v94 = 0;
    uint64_t v55 = *(void *)v101;
    v96 = v24;
LABEL_47:
    uint64_t v56 = 0;
    while (1)
    {
      if (*(void *)v101 != v55) {
        objc_enumerationMutation(obj);
      }
      if (!v24) {
        goto LABEL_67;
      }
      v57 = *(void **)(*((void *)&v100 + 1) + 8 * v56);
      v58 = [v24 stringByAppendingPathComponent:@"debugtree"];
      if ([v48 _isMainScreenMapView:v57]) {
        break;
      }
      if ([v48 _isCarPlayMapView:v57])
      {
        v59 = v58;
        CFStringRef v60 = @"-Car";
        goto LABEL_55;
      }
      uint64_t v62 = +[NSString stringWithFormat:@"-%lu", v94 + v56];
      v61 = [v58 stringByAppendingString:v62];

      v58 = (void *)v62;
LABEL_57:

      v63 = [v61 stringByAppendingPathExtension:@"json"];

      id v64 = objc_alloc_init((Class)VKDebugTree);
      [v64 enableAllOptions];
      v65 = [v57 _mapLayer];
      [v64 populateData:v65];

      v66 = [v64 logTree];
      v67 = [v66 dataUsingEncoding:4];
      v68 = v67;
      if (!v67
        || (id v99 = v29,
            unsigned __int8 v69 = [v67 writeToFile:v63 options:0 error:&v99],
            id v70 = v99,
            v29,
            id v29 = v70,
            (v69 & 1) == 0))
      {
        v71 = sub_1005762E4();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          v72 = +[NSString stringWithFormat:@"Could not write debugtree to a file %@", v29];
          *(_DWORD *)buf = 136315906;
          v110 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivit"
                 "yDataPath:error:]";
          __int16 v111 = 2080;
          v112 = "MapsRadarAttachmentProviderTask.m";
          __int16 v113 = 1024;
          int v114 = 189;
          __int16 v115 = 2112;
          v116 = v72;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
        }
        if (sub_100BB36BC())
        {
          v73 = sub_1005762E4();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            v74 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v110 = v74;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }

        id v70 = 0;
      }
      v75 = +[NSURL fileURLWithPath:v63];
      [v97 addObject:v75];

      id v29 = v70;
      v48 = v98;
      __int16 v24 = v96;
LABEL_67:
      if (v54 == (id)++v56)
      {
        id v54 = [obj countByEnumeratingWithState:&v100 objects:v108 count:16];
        v94 += v56;
        if (!v54) {
          goto LABEL_69;
        }
        goto LABEL_47;
      }
    }
    v59 = v58;
    CFStringRef v60 = @"-Main";
LABEL_55:
    v61 = [v59 stringByAppendingString:v60];
    goto LABEL_57;
  }
  if (!a6) {
    return 0;
  }
  +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
  BOOL v30 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  return v30;
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      __int16 v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v51 = "-[MapsRadarAttachmentProviderTask generateAttachmentsForRadarDraft:withCompletion:]";
        __int16 v52 = 2080;
        id v53 = "MapsRadarAttachmentProviderTask.m";
        __int16 v54 = 1024;
        int v55 = 220;
        __int16 v56 = 2080;
        v57 = "dispatch_get_main_queue()";
        __int16 v58 = 2080;
        v59 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v60 = 2080;
        v61 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        unsigned __int8 v22 = sub_1005762E4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v51 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v11 = dispatch_group_create();
  v12 = +[NSMutableArray array];
  BOOL v13 = +[NSMutableArray array];
  if (GEOConfigGetBOOL())
  {
    dispatch_group_enter(v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100504C90;
    block[3] = &unk_1012E5D58;
    id v48 = v12;
    v49 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (GEOConfigGetBOOL())
  {
    dispatch_group_enter(v11);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100504D58;
    v44[3] = &unk_1012E5D58;
    id v45 = v12;
    v46 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v44);
  }
  if (GEOConfigGetBOOL())
  {
    dispatch_group_enter(v11);
    processingQueue = self->_processingQueue;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1005050D0;
    v41[3] = &unk_1012E5D58;
    id v42 = v12;
    v43 = v11;
    dispatch_async(processingQueue, v41);
  }
  if (GEOConfigGetBOOL())
  {
    dispatch_group_enter(v11);
    unsigned __int8 v15 = self->_processingQueue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100505430;
    v38[3] = &unk_1012E5D58;
    id v39 = v12;
    v40 = v11;
    dispatch_async(v15, v38);
  }
  if (GEOConfigGetBOOL())
  {
    dispatch_group_enter(v11);
    v16 = self->_processingQueue;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1005057E8;
    v35[3] = &unk_1012E5D58;
    id v36 = v12;
    v37 = v11;
    dispatch_async(v16, v35);
  }
  if (GEOConfigGetBOOL())
  {
    dispatch_group_enter(v11);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100505A20;
    v32[3] = &unk_1012E5D58;
    id v33 = v12;
    v34 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v32);
  }
  if (GEOConfigGetBOOL())
  {
    dispatch_group_enter(v11);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100506018;
    v29[3] = &unk_1012E5D58;
    id v30 = v12;
    v31 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v29);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100506200;
  v24[3] = &unk_1012ED778;
  id v25 = v6;
  id v26 = v12;
  id v27 = v13;
  id v28 = v7;
  id v17 = v7;
  id v18 = v13;
  id v19 = v12;
  id v20 = v6;
  dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, v24);
}

- (MapsRadarController)radarController
{
  return self->_radarController;
}

- (void)setRadarController:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);

  objc_storeStrong((id *)&self->_radarController, 0);
}

@end