@interface CLActivityBasedBeaconPayloadCache
- (BOOL)isResubmitNeededwithOldLocationHacc:(double)a3 newLocationHacc:(double)a4 distance:(double)a5;
- (NSMutableArray)beaconPayloadCache;
- (NSMutableArray)beaconPayloadsToUpload;
- (double)computeCircleIntersectionAreaWithDistance:(double)a3 firstRadius:(double)a4 secondRadius:(double)a5;
- (id).cxx_construct;
- (id)createActivityRefreshBeaconPayloadIfNeededWithLocation:(id)a3 payload:(id)a4;
- (id)createNewBeaconPayloadwithNewLocation:(id)a3 oldBeaconPayload:(id)a4;
- (id)initInUniverse:(id)a3 withExternal:(shared_ptr<CLAvengerHarvestInterface:(CLSubHarvesterAvengerSettings *)a5 :External>)a4 withSettings:;
- (int)binAccuracy:(double)a3;
- (void)collectSecondGeotagMetricWithResult:(int64_t)a3 firstHorizontalAccuracy:(double)a4;
- (void)collectSecondGeotagMetricWithResult:(int64_t)a3 firstHorizontalAccuracy:(double)a4 secondHorizontalAccuracy:(double)a5 distance:(double)a6;
- (void)dealloc;
- (void)pruneActivityBasedBeaconPayloadCache;
- (void)receiveBeaconPayload:(id)a3;
- (void)receiveSignalEnvironment:(int)a3;
- (void)regeotagBeaconPayloads;
- (void)setBeaconPayloadCache:(id)a3;
- (void)setBeaconPayloadsToUpload:(id)a3;
- (void)updateCameraRunning:(BOOL)a3;
- (void)uploadBeaconPayloadsIfAllowed;
@end

@implementation CLActivityBasedBeaconPayloadCache

- (id)initInUniverse:(id)a3 withExternal:(shared_ptr<CLAvengerHarvestInterface:(CLSubHarvesterAvengerSettings *)a5 :External>)a4 withSettings:
{
  cntrl = a4.__cntrl_;
  ptr = a4.__ptr_;
  v25.receiver = self;
  v25.super_class = (Class)CLActivityBasedBeaconPayloadCache;
  v8 = [(CLActivityBasedBeaconPayloadCache *)&v25 init];
  if (v8)
  {
    *((void *)v8 + 1) = a3;
    uint64_t v10 = *(void *)ptr;
    uint64_t v9 = *((void *)ptr + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    v11 = (std::__shared_weak_count *)*((void *)v8 + 3);
    *((void *)v8 + 2) = v10;
    *((void *)v8 + 3) = v9;
    if (v11) {
      sub_1000DB0A0(v11);
    }
    long long v12 = *(_OWORD *)((char *)cntrl + 8);
    long long v13 = *(_OWORD *)((char *)cntrl + 24);
    long long v14 = *(_OWORD *)((char *)cntrl + 40);
    *(_OWORD *)(v8 + 88) = *(_OWORD *)((char *)cntrl + 56);
    *(_OWORD *)(v8 + 72) = v14;
    *(_OWORD *)(v8 + 56) = v13;
    *(_OWORD *)(v8 + 40) = v12;
    long long v15 = *(_OWORD *)((char *)cntrl + 72);
    long long v16 = *(_OWORD *)((char *)cntrl + 88);
    long long v17 = *(_OWORD *)((char *)cntrl + 104);
    *(_OWORD *)(v8 + 152) = *(_OWORD *)((char *)cntrl + 120);
    *(_OWORD *)(v8 + 136) = v17;
    *(_OWORD *)(v8 + 120) = v16;
    *(_OWORD *)(v8 + 104) = v15;
    long long v18 = *(_OWORD *)((char *)cntrl + 136);
    long long v19 = *(_OWORD *)((char *)cntrl + 152);
    long long v20 = *(_OWORD *)((char *)cntrl + 168);
    *(_OWORD *)(v8 + 216) = *(_OWORD *)((char *)cntrl + 184);
    *(_OWORD *)(v8 + 200) = v20;
    *(_OWORD *)(v8 + 184) = v19;
    *(_OWORD *)(v8 + 168) = v18;
    long long v21 = *(_OWORD *)((char *)cntrl + 200);
    long long v22 = *(_OWORD *)((char *)cntrl + 216);
    long long v23 = *(_OWORD *)((char *)cntrl + 232);
    *((void *)v8 + 35) = *((void *)cntrl + 31);
    *(_OWORD *)(v8 + 264) = v23;
    *(_OWORD *)(v8 + 248) = v22;
    *(_OWORD *)(v8 + 232) = v21;
    *((void *)v8 + 36) = objc_alloc_init((Class)SPFinderInterface);
    *((void *)v8 + 38) = objc_alloc_init((Class)NSMutableArray);
    *((void *)v8 + 39) = objc_alloc_init((Class)NSMutableArray);
    v8[320] = 0;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLActivityBasedBeaconPayloadCache;
  [(CLActivityBasedBeaconPayloadCache *)&v3 dealloc];
}

- (void)receiveBeaconPayload:(id)a3
{
  [(NSMutableArray *)self->_beaconPayloadCache addObject:a3];

  [(CLActivityBasedBeaconPayloadCache *)self pruneActivityBasedBeaconPayloadCache];
}

- (void)pruneActivityBasedBeaconPayloadCache
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_10231D8A8);
  }
  objc_super v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
  {
    id v4 = [(NSMutableArray *)self->_beaconPayloadCache count];
    int v17 = 68289538;
    int v18 = 0;
    __int16 v19 = 2082;
    long long v20 = "";
    __int16 v21 = 2050;
    id v22 = v4;
    __int16 v23 = 2050;
    uint64_t v24 = 11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"pruneActivityBasedBeaconPayloadCache\", \"activityBasedBeaconPayloadCache count\":%{public}lu, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&v17, 0x26u);
  }
  if ([(NSMutableArray *)self->_beaconPayloadCache count])
  {
    [(NSMutableArray *)self->_beaconPayloadCache sortUsingComparator:&stru_10231D860];
    id v5 = +[NSCountedSet set];
    v6 = +[NSDate now];
    id v7 = [(NSMutableArray *)self->_beaconPayloadCache count];
    if ((uint64_t)v7 - 1 >= 0)
    {
      uint64_t v8 = (uint64_t)v7;
      while (1)
      {
        id v9 = [(NSMutableArray *)self->_beaconPayloadCache objectAtIndexedSubscript:--v8];
        -[NSDate timeIntervalSinceDate:](v6, objc_msgSend(objc_msgSend(v9, "advertisement"), "scanDate"));
        if (v10 > (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 28))(&self->_settings)) {
          break;
        }
        [v5 addObject:[objc_msgSend(objc_msgSend(v9, "advertisement"), "address")];
        id v12 = [v5 countForObject:[objc_msgSend(objc_msgSend(v9, "advertisement"), "address")];
        if ((unint64_t)v12 > (*((int (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings
                                      + 30))(&self->_settings))
        {
          uint64_t v11 = 3;
          goto LABEL_12;
        }
LABEL_13:
        if (v8 <= 0) {
          goto LABEL_14;
        }
      }
      uint64_t v11 = 1;
LABEL_12:
      [objc_msgSend(v9, "location") horizontalAccuracy];
      -[CLActivityBasedBeaconPayloadCache collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:](self, "collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:", v11);
      [(NSMutableArray *)self->_beaconPayloadCache removeObjectAtIndex:v8];
      goto LABEL_13;
    }
LABEL_14:
    id v13 = [(NSMutableArray *)self->_beaconPayloadCache count];
    for (i = self->_settings._vptr$Settings;
          (unint64_t)v13 > ((int (*)(CLSubHarvesterAvengerSettings *))i[6])(&self->_settings);
          i = self->_settings._vptr$Settings)
    {
      [objc_msgSend(-[NSMutableArray firstObject](self->_beaconPayloadCache, "firstObject"), "location") horizontalAccuracy];
      -[CLActivityBasedBeaconPayloadCache collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:](self, "collectSecondGeotagMetricWithResult:firstHorizontalAccuracy:", 2);
      [(NSMutableArray *)self->_beaconPayloadCache removeObjectAtIndex:0];
      id v13 = [(NSMutableArray *)self->_beaconPayloadCache count];
    }
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231D8A8);
    }
    long long v15 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
    {
      id v16 = [(NSMutableArray *)self->_beaconPayloadCache count];
      int v17 = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      long long v20 = "";
      __int16 v21 = 2049;
      id v22 = v16;
      __int16 v23 = 2050;
      uint64_t v24 = 11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"pruneActivityBasedBeaconPayloadCache\", \"prunedBeaconPayloads count\":%{private}lu, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&v17, 0x26u);
    }
  }
}

- (void)receiveSignalEnvironment:(int)a3
{
  self->_recentSignalEnvironment = a3;
}

- (void)collectSecondGeotagMetricWithResult:(int64_t)a3 firstHorizontalAccuracy:(double)a4 secondHorizontalAccuracy:(double)a5 distance:(double)a6
{
  id v11 = +[NSMutableDictionary dictionary];
  [v11 setObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSDateComponents hour](-[NSCalendar components:fromDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:", 32, +[NSDate now](NSDate, "now")), "hour")) forKeyedSubscript:@"timeOfDay"];
  if (self->_recentSignalEnvironment) {
    [v11 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:") unsignedIntValue] forKeyedSubscript:@"sigEnv"];
  }
  [v11 setObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3)] forKeyedSubscript:@"result"];
  [v11 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4) forKeyedSubscript:@"firstHAcc"];
  [v11 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLActivityBasedBeaconPayloadCache binAccuracy:](self, "binAccuracy:", a4))] forKeyedSubscript:@"firstHAccBounded"];
  [v11 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5) forKeyedSubscript:@"secondHAcc"];
  [v11 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLActivityBasedBeaconPayloadCache binAccuracy:](self, "binAccuracy:", a5))] forKeyedSubscript:@"secondHAccBounded"];
  double v12 = a5 - a4;
  [v11 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12) forKeyedSubscript:@"deltaHAcc"];
  [v11 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLActivityBasedBeaconPayloadCache binAccuracy:](self, "binAccuracy:", v12))] forKeyedSubscript:@"deltaHAccBounded"];
  [v11 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6)] forKeyedSubscript:@"distance"];
  [v11 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLActivityBasedBeaconPayloadCache binAccuracy:](self, "binAccuracy:", a6))] forKeyedSubscript:@"distanceBounded"];

  AnalyticsSendEvent();
}

- (void)collectSecondGeotagMetricWithResult:(int64_t)a3 firstHorizontalAccuracy:(double)a4
{
}

- (void)regeotagBeaconPayloads
{
  [(CLActivityBasedBeaconPayloadCache *)self pruneActivityBasedBeaconPayloadCache];
  id v3 = [(NSMutableArray *)self->_beaconPayloadCache copy];
  [(NSMutableArray *)self->_beaconPayloadCache removeAllObjects];
  if ([v3 count])
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231D8A8);
    }
    id v4 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289282;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2050;
      uint64_t v34 = 11;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"regeotagBeaconPayloads: regeotag beacon payloads in cache for motion transition\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", (uint8_t *)&buf, 0x1Cu);
    }
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = dispatch_group_create();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v3);
          }
          id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          dispatch_group_enter(v6);
          id v12 = [objc_msgSend(v11, "advertisement") scanDate];
          [objc_msgSend(v11, "location") speedAccuracy];
          double v14 = fmax(v13, 0.0);
          [objc_msgSend(v11, "location") speed];
          double v16 = fmax(v15, 0.0);
          double v17 = (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 23))(&self->_settings);
          double v18 = v14 + v16;
          double v19 = (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 32))(&self->_settings);
          if (v19 >= v18) {
            double v19 = v18;
          }
          if (v17 < v19) {
            double v17 = v19;
          }
          id v20 = [objc_alloc((Class)RTEstimatedLocationOptions) initWithAverageSpeed:1 enableFallbackModel:v17 timeInterval:(*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 33))(&self->_settings)];
          ptr = self->_external.__ptr_;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1012B855C;
          v24[3] = &unk_10231D888;
          v24[4] = v12;
          v24[5] = self;
          v24[6] = v11;
          v24[7] = v5;
          v24[8] = v6;
          (*(void (**)(External *, id, id, void *))(*(void *)ptr + 208))(ptr, v12, v20, v24);
        }
        id v8 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }
    id v22 = [[-[CLIntersiloUniverse silo](self->_universe, "silo") queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1012B8688;
    block[3] = &unk_1022C6138;
    block[4] = v6;
    block[5] = self;
    block[6] = v5;
    block[7] = v3;
    dispatch_group_notify(v6, v22, block);
  }
}

- (id)createActivityRefreshBeaconPayloadIfNeededWithLocation:(id)a3 payload:(id)a4
{
  if (!a3)
  {
    id v59 = [a4 location];
    [v59 horizontalAccuracy];
    double v61 = v60;
    double v62 = (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 2))(&self->_settings);
    double v63 = v61
        + v62
        * (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 23))(&self->_settings);
    id v64 = objc_alloc((Class)SPEstimatedLocation);
    id v65 = [objc_msgSend(a4, "advertisement") scanDate];
    (*((void (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 29))(&self->_settings);
    id v66 = [v65 dateByAddingTimeInterval:];
    [v59 latitude];
    double v68 = v67;
    [v59 longitude];
    double v70 = v69;
    [v59 altitude];
    double v72 = v71;
    [v59 verticalAccuracy];
    double v74 = v73;
    [v59 speed];
    double v76 = v75;
    [v59 speedAccuracy];
    double v78 = v77;
    [v59 course];
    double v80 = v79;
    [v59 courseAccuracy];
    id v50 = [v64 initWithTimestamp:v66 latitude:0 longitude:v68 horizontalAccuracy:v70 altitude:v63 verticalAccuracy:v72 speed:v74 speedAccuracy:v76 course:v78 courseAccuracy:v80 floorLevel:v81];
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231D8A8);
    }
    v82 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
    {
      [objc_msgSend(a4, "location") latitude];
      uint64_t v84 = v83;
      [objc_msgSend(a4, "location") longitude];
      uint64_t v86 = v85;
      [objc_msgSend(a4, "location") horizontalAccuracy];
      uint64_t v88 = v87;
      [v50 latitude];
      uint64_t v90 = v89;
      [v50 longitude];
      uint64_t v92 = v91;
      [v50 horizontalAccuracy];
      *(_DWORD *)uint64_t buf = 68290819;
      int v103 = 0;
      __int16 v104 = 2082;
      v105 = "";
      __int16 v106 = 2049;
      uint64_t v107 = v84;
      __int16 v108 = 2049;
      uint64_t v109 = v86;
      __int16 v110 = 2049;
      uint64_t v111 = v88;
      __int16 v112 = 2049;
      uint64_t v113 = v90;
      __int16 v114 = 2049;
      uint64_t v115 = v92;
      __int16 v116 = 2049;
      uint64_t v117 = v93;
      __int16 v118 = 2050;
      uint64_t v119 = 11;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"createActivityRefreshBeaconPayloadIfNeeded:estimatedLocation is invalid\", \"old location latitude\":\"%{private}f\", \"old location longitude\":\"%{private}f\", \"old location horizontalAccuracy\":\"%{private}f\", \"new location latitude\":\"%{private}f\", \"new location longitude\":\"%{private}f\", \"new location horizontalAccuracy\":\"%{private}f\", \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x58u);
    }
    [objc_msgSend(a4, "location") horizontalAccuracy];
    double v95 = v94;
    [v50 horizontalAccuracy];
    double v54 = v96;
    double v58 = 0.0;
    v55 = self;
    uint64_t v56 = 4;
    double v57 = v95;
    goto LABEL_13;
  }
  [a3 coordinate];
  double v8 = v7;
  [a3 coordinate];
  double v10 = v9;
  [objc_msgSend(a4, "location") latitude];
  double v12 = v11;
  [objc_msgSend(a4, "location") longitude];
  double v14 = sub_1000A3D9C(v8, v10, v12, v13);
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_10231D8A8);
  }
  double v15 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
  {
    [objc_msgSend(a4, "location") latitude];
    uint64_t v17 = v16;
    [objc_msgSend(a4, "location") longitude];
    uint64_t v19 = v18;
    [objc_msgSend(a4, "location") horizontalAccuracy];
    uint64_t v21 = v20;
    [a3 coordinate];
    uint64_t v23 = v22;
    [a3 coordinate];
    uint64_t v25 = v24;
    [a3 horizontalAccuracy];
    *(_DWORD *)uint64_t buf = 68291331;
    __int16 v104 = 2082;
    int v103 = 0;
    v105 = "";
    __int16 v106 = 2049;
    uint64_t v107 = v17;
    __int16 v108 = 2049;
    uint64_t v109 = v19;
    __int16 v110 = 2049;
    uint64_t v111 = v21;
    __int16 v112 = 2049;
    uint64_t v113 = v23;
    __int16 v114 = 2049;
    uint64_t v115 = v25;
    __int16 v116 = 2049;
    uint64_t v117 = v26;
    __int16 v118 = 2049;
    uint64_t v119 = *(void *)&v14;
    __int16 v120 = 2113;
    id v121 = [[objc_msgSend(a4, "advertisement") scanDate];
    __int16 v122 = 2050;
    uint64_t v123 = 11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"createActivityRefreshBeaconPayloadIfNeeded\", \"old location latitude\":\"%{private}f\", \"old location longitude\":\"%{private}f\", \"old location horizontalAccuracy\":\"%{private}f\", \"new location latitude\":\"%{private}f\", \"new location longitude\":\"%{private}f\", \"new location horizontalAccuracy\":\"%{private}f\", \"distance between above two locations\":\"%{private}f\", \"scan date\":%{private, location:escape_only}@, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x6Cu);
  }
  [objc_msgSend(a4, "location") horizontalAccuracy];
  double v28 = v27;
  [a3 horizontalAccuracy];
  if ([(CLActivityBasedBeaconPayloadCache *)self isResubmitNeededwithOldLocationHacc:v28 newLocationHacc:v29 distance:v14])
  {
    id v30 = objc_alloc((Class)SPEstimatedLocation);
    id v31 = [objc_msgSend(a4, "advertisement") scanDate];
    (*((void (**)(void))self->_settings._vptr$Settings + 29))();
    id v32 = [v31 dateByAddingTimeInterval:];
    [a3 coordinate];
    double v34 = v33;
    [a3 coordinate];
    double v36 = v35;
    [a3 horizontalAccuracy];
    double v38 = v37;
    [a3 altitude];
    double v40 = v39;
    [a3 verticalAccuracy];
    double v42 = v41;
    [a3 speed];
    double v44 = v43;
    [a3 speedAccuracy];
    double v101 = v14;
    double v46 = v45;
    [a3 course];
    double v48 = v47;
    [a3 courseAccuracy];
    id v50 = [v30 initWithTimestamp:v32 latitude:0 longitude:v34 horizontalAccuracy:v36 altitude:v38 verticalAccuracy:v40 speed:v42 speedAccuracy:v44 course:v46 courseAccuracy:v48 floorLevel:v49];
    [objc_msgSend(a4, "location") horizontalAccuracy];
    double v52 = v51;
    [v50 horizontalAccuracy];
    double v54 = v53;
    v55 = self;
    uint64_t v56 = 6;
    double v57 = v52;
    double v58 = v101;
LABEL_13:
    [(CLActivityBasedBeaconPayloadCache *)v55 collectSecondGeotagMetricWithResult:v56 firstHorizontalAccuracy:v57 secondHorizontalAccuracy:v54 distance:v58];
    return [(CLActivityBasedBeaconPayloadCache *)self createNewBeaconPayloadwithNewLocation:v50 oldBeaconPayload:a4];
  }
  [objc_msgSend(a4, "location") horizontalAccuracy];
  double v99 = v98;
  [a3 horizontalAccuracy];
  [(CLActivityBasedBeaconPayloadCache *)self collectSecondGeotagMetricWithResult:5 firstHorizontalAccuracy:v99 secondHorizontalAccuracy:v100 distance:v14];
  return 0;
}

- (id)createNewBeaconPayloadwithNewLocation:(id)a3 oldBeaconPayload:(id)a4
{
  if (+[SPAdvertisement instancesRespondToSelector:NSSelectorFromString(@"initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:")])
  {
    SEL v7 = NSSelectorFromString(@"isPosh");
    [a4 advertisement];
    double v8 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", [(id)objc_opt_class() instanceMethodSignatureForSelector:v7]);
    [(NSInvocation *)v8 setSelector:v7];
    -[NSInvocation setTarget:](v8, "setTarget:", [a4 advertisement]);
    [(NSInvocation *)v8 invoke];
    char v28 = 0;
    [(NSInvocation *)v8 getReturnValue:&v28];
    id v9 = objc_alloc((Class)SPAdvertisement);
    id v10 = [objc_msgSend(a4, "advertisement") address];
    id v11 = [objc_msgSend(a4, "advertisement") advertisementData];
    id v12 = [objc_msgSend(a4, "advertisement") status];
    id v13 = [objc_msgSend(a4, "advertisement") reserved];
    id v14 = [objc_msgSend(a4, "advertisement") rssi];
    id v15 = [objc_msgSend(a4, "advertisement") scanDate];
    (*((void (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 29))(&self->_settings);
    id v16 = [v15 dateByAddingTimeInterval:x0];
    LOBYTE(v27) = v28;
    id v17 = [v9 initWithAddress:v10 advertisementData:v11 status:v12 reserved:v13 rssi:v14 scanDate:v16 isPosh:v27];
  }
  else
  {
    id v18 = objc_alloc((Class)SPAdvertisement);
    id v19 = [objc_msgSend(a4, "advertisement") address];
    id v20 = [objc_msgSend(a4, "advertisement") advertisementData];
    id v21 = [objc_msgSend(a4, "advertisement") status];
    id v22 = [objc_msgSend(a4, "advertisement") reserved];
    id v23 = [objc_msgSend(a4, "advertisement") rssi];
    id v24 = [objc_msgSend(a4, "advertisement") scanDate];
    (*((void (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings + 29))(&self->_settings);
    id v17 = [v18 initWithAddress:v19 advertisementData:v20 status:v21 reserved:v22 rssi:v23 scanDate:[v24 dateByAddingTimeInterval:x0]];
  }
  id v25 = [objc_alloc((Class)SPBeaconPayload) initWithAdvertisement:v17 location:a3];
  [v25 setObservationValue:3];
  [v25 setRefreshGeotag:1];
  return v25;
}

- (BOOL)isResubmitNeededwithOldLocationHacc:(double)a3 newLocationHacc:(double)a4 distance:(double)a5
{
  [(CLActivityBasedBeaconPayloadCache *)self computeCircleIntersectionAreaWithDistance:a5 firstRadius:a3 secondRadius:a4];
  return v8 / (a4 * 3.14159265 * a4 + a3 * 3.14159265 * a3 - v8) < (*((double (**)(CLSubHarvesterAvengerSettings *))self->_settings._vptr$Settings
                                                                    + 31))(&self->_settings);
}

- (void)uploadBeaconPayloadsIfAllowed
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if ([(NSMutableArray *)self->_beaconPayloadsToUpload count] && !self->_isCameraAppRunning)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231D8A8);
    }
    id v3 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
    {
      id v4 = [(NSMutableArray *)self->_beaconPayloadsToUpload count];
      BOOL isCameraAppRunning = self->_isCameraAppRunning;
      *(_DWORD *)uint64_t buf = 68289795;
      __int16 v11 = 2082;
      int v10 = 0;
      id v12 = "";
      __int16 v13 = 2049;
      id v14 = v4;
      __int16 v15 = 1025;
      BOOL v16 = isCameraAppRunning;
      __int16 v17 = 2050;
      uint64_t v18 = 11;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"uploadBeaconPayloadsIfAllowed\", \"refreshedBeaconPayloads count\":%{private}lu, \"isCameraAppRunning\":%{private}hhd, \"subHarvester\":%{public, location:CLSubHarvesterIdentifier}lld}", buf, 0x2Cu);
    }
    id v6 = [(NSMutableArray *)self->_beaconPayloadsToUpload copy];
    [(NSMutableArray *)self->_beaconPayloadsToUpload removeAllObjects];
    id v7 = [(SPFinderInterface *)self->_finderInterface beaconPayloadCache];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1012B92FC;
    v8[3] = &unk_1022B8750;
    v8[4] = self;
    [v7 saveBeaconPayloads:v6 completion:v8];
  }
}

- (void)updateCameraRunning:(BOOL)a3
{
  self->_BOOL isCameraAppRunning = a3;
  [(CLActivityBasedBeaconPayloadCache *)self uploadBeaconPayloadsIfAllowed];
}

- (int)binAccuracy:(double)a3
{
  if (a3 <= 0.0) {
    return 0;
  }
  if (a3 <= 5.0) {
    return 5;
  }
  if (a3 <= 10.0) {
    return 10;
  }
  if (a3 <= 15.0) {
    return 15;
  }
  if (a3 <= 25.0) {
    return 25;
  }
  if (a3 <= 50.0) {
    return 50;
  }
  if (a3 <= 75.0) {
    return 75;
  }
  if (a3 <= 100.0) {
    return 100;
  }
  if (a3 <= 125.0) {
    return 125;
  }
  if (a3 <= 250.0) {
    return 250;
  }
  if (a3 <= 500.0) {
    return 500;
  }
  if (a3 <= 750.0) {
    return 750;
  }
  if (a3 <= 1000.0) {
    return 1000;
  }
  if (a3 <= 5000.0) {
    return 5000;
  }
  if (a3 <= 10000.0) {
    return 10000;
  }
  return 20000;
}

- (double)computeCircleIntersectionAreaWithDistance:(double)a3 firstRadius:(double)a4 secondRadius:(double)a5
{
  double v5 = a5;
  double v6 = a4;
  BOOL v8 = a4 <= a5;
  if (a4 >= a5) {
    a4 = a5;
  }
  if (!v8) {
    a5 = v6;
  }
  double result = 0.0;
  if (a4 + a5 > a3 && a3 >= 0.0 && a4 > 0.0 && a5 > 0.0)
  {
    if (a4 + a3 <= a5)
    {
      return a4 * (a4 * 3.14159265);
    }
    else
    {
      long double v10 = v6 * v6 * acos((a3 * a3 + v6 * v6 - v5 * v5) / (a3 + a3) / v6);
      return v10
           + v5 * v5 * acos((a3 * a3 - v6 * v6 + v5 * v5) / (a3 + a3) / v5)
           + sqrt((a3 + v6 + v5) * ((a3 + v6 - v5) * ((v6 - a3 + v5) * (a3 - v6 + v5)))) * -0.5;
    }
  }
  return result;
}

- (NSMutableArray)beaconPayloadCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 304, 1);
}

- (void)setBeaconPayloadCache:(id)a3
{
}

- (NSMutableArray)beaconPayloadsToUpload
{
  return (NSMutableArray *)objc_getProperty(self, a2, 312, 1);
}

- (void)setBeaconPayloadsToUpload:(id)a3
{
}

- (void).cxx_destruct
{
  cntrl = self->_external.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = off_10231B370;
  *(_OWORD *)((char *)self + 40) = xmmword_101D8ACB0;
  *(_OWORD *)((char *)self + 56) = xmmword_101D8ACC0;
  *((void *)self + 9) = 0x12000001F4;
  *((_DWORD *)self + 20) = 72;
  *((void *)self + 11) = 0x40CC200000000000;
  *((unsigned char *)self + 96) = 1;
  *((_DWORD *)self + 25) = 1;
  *(_OWORD *)((char *)self + 104) = xmmword_101D8ACD0;
  *(_OWORD *)((char *)self + 120) = xmmword_101D8ACE0;
  *((void *)self + 17) = 0x40B2C00000000000;
  *((unsigned char *)self + 144) = 0;
  *(_OWORD *)((char *)self + 152) = xmmword_101D8ACF0;
  *((_DWORD *)self + 42) = 1;
  *((_OWORD *)self + 11) = xmmword_101D82690;
  *((_OWORD *)self + 12) = xmmword_101D826A0;
  *((_OWORD *)self + 13) = xmmword_101D826B0;
  *((_OWORD *)self + 14) = xmmword_101D826C0;
  *((_OWORD *)self + 15) = xmmword_101D826D0;
  *((_DWORD *)self + 64) = 4;
  *((void *)self + 33) = 0x3FECCCCCCCCCCCCDLL;
  *((_OWORD *)self + 17) = xmmword_101D826E0;
  return self;
}

@end