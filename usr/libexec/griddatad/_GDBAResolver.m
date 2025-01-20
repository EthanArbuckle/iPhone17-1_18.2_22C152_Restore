@interface _GDBAResolver
+ (id)sharedInstance;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_GDBAResolver)init;
- (id)balancingAuthorityForLatitude:(double)a3 longitude:(double)a4 polygons:(id)a5;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _GDBAResolver

- (_GDBAResolver)init
{
  v9.receiver = self;
  v9.super_class = (Class)_GDBAResolver;
  v2 = [(_GDBAResolver *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.griddatad.locmonitor.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    os_log_t v6 = os_log_create("com.apple.gds", "geoDataReader");
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10000CE40 != -1) {
    dispatch_once(&qword_10000CE40, &stru_100008530);
  }
  v2 = (void *)qword_10000CE38;

  return v2;
}

- (id)balancingAuthorityForLatitude:(double)a3 longitude:(double)a4 polygons:(id)a5
{
  id v86 = a5;
  v85 = (void *)os_transaction_create();
  v103 = self;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283777;
    double v120 = a3;
    __int16 v121 = 2049;
    double v122 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Looking for (%{private}lf, %{private}lf)", buf, 0x16u);
  }
  objc_super v9 = [v86 objectForKeyedSubscript:@"geoJsonDocuments"];
  v101 = +[NSMutableArray array];
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id obj = v9;
  id v106 = [obj countByEnumeratingWithState:&v115 objects:v131 count:16];
  if (v106)
  {
    uint64_t v104 = *(void *)v116;
    CFStringRef v10 = @"geoJsonDocument";
    do
    {
      for (i = 0; i != v106; i = (char *)i + 1)
      {
        if (*(void *)v116 != v104) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        v13 = [v12 objectForKeyedSubscript:@"boundingBox"];
        v14 = [v13 objectAtIndexedSubscript:1];
        [v14 doubleValue];
        double v16 = v15;

        v17 = [v13 objectAtIndexedSubscript:3];
        [v17 doubleValue];
        double v19 = v18;

        v20 = [v13 objectAtIndexedSubscript:0];
        [v20 doubleValue];
        double v22 = v21;

        v23 = [v13 objectAtIndexedSubscript:2];
        [v23 doubleValue];
        double v25 = v24;

        BOOL v26 = v16 >= a3 || v19 <= a3;
        if (!v26 || (v16 > a3 ? (BOOL v27 = v19 < a3) : (BOOL v27 = 0), v27))
        {
          BOOL v28 = v22 >= a4 || v25 <= a4;
          if (!v28 || (v22 > a4 ? (BOOL v29 = v25 < a4) : (BOOL v29 = 0), v29))
          {
            *(double *)&uint64_t v30 = [v12 objectForKeyedSubscript:v10];
            v31 = v103->_log;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              double v120 = *(double *)&v30;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, " Within bounding box. GeoJSON: %@", buf, 0xCu);
            }
            v130[0] = v30;
            v129[0] = v10;
            v129[1] = @"boundingBox";
            v32 = +[NSNumber numberWithDouble:v16];
            v128[0] = v32;
            v33 = +[NSNumber numberWithDouble:v19];
            v128[1] = v33;
            +[NSNumber numberWithDouble:v22];
            v108 = (void *)v30;
            v35 = CFStringRef v34 = v10;
            v128[2] = v35;
            v36 = +[NSNumber numberWithDouble:v25];
            v128[3] = v36;
            v37 = +[NSArray arrayWithObjects:v128 count:4];
            v130[1] = v37;
            v38 = +[NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:2];
            [v101 addObject:v38];

            CFStringRef v10 = v34;
          }
        }
      }
      id v106 = [obj countByEnumeratingWithState:&v115 objects:v131 count:16];
    }
    while (v106);
  }

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v39 = v101;
  id v95 = [v39 countByEnumeratingWithState:&v111 objects:v127 count:16];
  if (!v95)
  {
LABEL_68:
    v81 = 0;
    goto LABEL_69;
  }
  uint64_t v96 = *(void *)v112;
  *(void *)&long long v40 = 134284291;
  long long v84 = v40;
  id v93 = v39;
  while (2)
  {
    for (j = 0; j != v95; j = (char *)j + 1)
    {
      if (*(void *)v112 != v96) {
        objc_enumerationMutation(v39);
      }
      v42 = *(void **)(*((void *)&v111 + 1) + 8 * (void)j);
      v43 = [v42 objectForKeyedSubscript:@"geoJsonDocument" v84, v85];
      uint64_t v44 = [v43 dataUsingEncoding:4];
      id v46 = objc_alloc_init((Class)MKGeoJSONDecoder);
      id v110 = 0;
      v105 = (void *)v44;
      double v47 = [v46 geoJSONObjectsWithData:v44 error:&v110];
      id v48 = v110;
      if (v47 == 0.0)
      {
        v82 = v103->_log;
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
          sub_100004E9C(v82);
        }
        AnalyticsSendEventLazy();
        goto LABEL_67;
      }
      v49 = v103->_log;
      if (v48)
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_100004F18((uint64_t)v48, v49);
        }
LABEL_67:

        goto LABEL_68;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v120 = v47;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Read GeoJSON %@", buf, 0xCu);
      }
      v102 = v43;

      v51 = [*(id *)&v47 objectAtIndexedSubscript:0];
      v99 = [v51 properties];
      v52 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:");
      *(double *)&uint64_t v53 = [v52 objectForKeyedSubscript:@"name"];
      double v109 = [v52 objectForKeyedSubscript:@"abbrev"];
      v54 = v103->_log;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v120 = *(double *)&v53;
        __int16 v121 = 2112;
        double v122 = v109;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Name %@ %@", buf, 0x16u);
      }
      v107 = (void *)v53;
      v55 = [v51 geometry];
      if ([v55 count])
      {
        contexta = v51;
        v56 = [v55 objectAtIndexedSubscript:0];
        v57 = [v56 polygons];

        v133.latitude = a3;
        v133.longitude = a4;
        MKMapPoint v58 = MKMapPointForCoordinate(v133);
        if ([v57 count])
        {
          v94 = v50;
          uint64_t v59 = 0;
          while (1)
          {
            id v61 = objc_alloc((Class)MKPolygonRenderer);
            v62 = [v57 objectAtIndexedSubscript:v59];
            id v63 = [v61 initWithPolygon:v62];

            [v63 pointForMapPoint:v58.x, v58.y];
            CGFloat v65 = v64;
            CGFloat v67 = v66;
            v68 = (const CGPath *)[v63 path];
            v134.x = v65;
            v134.y = v67;
            if (CGPathContainsPoint(v68, 0, v134, 1)) {
              break;
            }

            if ((unint64_t)[v57 count] <= ++v59)
            {
              int v69 = 0;
              goto LABEL_55;
            }
          }
          v70 = v103->_log;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v84;
            double v120 = a3;
            __int16 v121 = 2049;
            double v122 = a4;
            __int16 v123 = 2112;
            double v124 = v109;
            __int16 v125 = 2112;
            v126 = v107;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Coordinate (%{private}f,%{private}f) inside %@ %@", buf, 0x2Au);
          }
          v88 = [v42 objectForKeyedSubscript:@"boundingBox"];
          id v90 = objc_alloc((Class)_GDSBalancingAuthorityOutput);
          v92 = [v88 objectAtIndexedSubscript:0];
          [v92 doubleValue];
          double v72 = v71;
          int v69 = 1;
          v91 = [v88 objectAtIndexedSubscript:1];
          [v91 doubleValue];
          double v74 = v73;
          v87 = [v88 objectAtIndexedSubscript:2];
          [v87 doubleValue];
          double v76 = v75;
          v77 = [v88 objectAtIndexedSubscript:3];
          [v77 doubleValue];
          double v79 = v78;
          v80 = +[NSDate date];
          id v89 = [v90 initWithIdentifier:v107 name:*(void *)&v109 latitudeStart:v80 latitudeEnd:v72 longitudeStart:v74 longitudeEnd:v76 updateDate:v79];

LABEL_55:
          id v39 = v93;
          v50 = v94;
        }
        else
        {
          int v69 = 0;
        }

        v51 = contexta;
      }
      else
      {
        int v69 = 5;
      }

      if (v69 != 5 && v69)
      {
        v81 = v89;
        goto LABEL_69;
      }
    }
    v81 = 0;
    id v95 = [v39 countByEnumeratingWithState:&v111 objects:v127 count:16];
    if (v95) {
      continue;
    }
    break;
  }
LABEL_69:

  return v81;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end