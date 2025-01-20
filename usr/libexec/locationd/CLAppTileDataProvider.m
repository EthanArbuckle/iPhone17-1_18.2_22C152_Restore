@interface CLAppTileDataProvider
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)fIsRegisteredForTileDownload;
- (CLAppTileDataProvider)init;
- (CLTimer)activeRequestCleanupTimer;
- (NSMutableArray)activeRequests;
- (id).cxx_construct;
- (id)getAppsForAreaAtLatitude:(double)a3 longitude:(double)a4 radius:(float)a5 includeRegionalApps:(BOOL)a6 marqueeAppsOnly:(BOOL)a7;
- (void)beginService;
- (void)endService;
- (void)fetchAppsForAreaAtLatitude:(double)a3 longitude:(double)a4 radius:(float)a5 includeRegionalApps:(BOOL)a6 marqueeAppsOnly:(BOOL)a7 withReply:(id)a8;
- (void)onTileWasDownloadedNotification:(int)a3 data:(uint64_t)a4;
- (void)setActiveRequestCleanupTimer:(id)a3;
- (void)setActiveRequests:(id)a3;
- (void)setFIsRegisteredForTileDownload:(BOOL)a3;
@end

@implementation CLAppTileDataProvider

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102486BF0 != -1) {
    dispatch_once(&qword_102486BF0, &stru_10231F268);
  }
  return (id)qword_102486BE8;
}

- (CLAppTileDataProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLAppTileDataProvider;
  return [(CLAppTileDataProvider *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLAppTileDataProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLAppTileDataProviderClientProtocol];
}

- (void)beginService
{
  [self.universe silo];
  if (qword_102419630 != -1) {
    dispatch_once(&qword_102419630, &stru_10231F288);
  }
  objc_super v3 = qword_102419638;
  if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TILE_APP: begin", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_10231F288);
    }
    __int16 v6 = 0;
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider beginService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLAppTileDataProvider *)self setActiveRequests:objc_alloc_init((Class)NSMutableArray)];
  -[CLAppTileDataProvider setActiveRequestCleanupTimer:](self, "setActiveRequestCleanupTimer:", [objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "silo") newTimer]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1012F415C;
  v5[3] = &unk_10229FED8;
  v5[4] = self;
  [(CLTimer *)[(CLAppTileDataProvider *)self activeRequestCleanupTimer] setHandler:v5];
}

- (void)endService
{
  [(-[CLAppTileDataProvider universe](self, "universe")) silo];
  if (qword_102419630 != -1) {
    dispatch_once(&qword_102419630, &stru_10231F288);
  }
  objc_super v3 = qword_102419638;
  if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TILE_APP: shutdown", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_10231F288);
    }
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider endService]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }

  [(CLAppTileDataProvider *)self setActiveRequests:0];
  [(CLTimer *)[(CLAppTileDataProvider *)self activeRequestCleanupTimer] invalidate];

  [(CLAppTileDataProvider *)self setActiveRequestCleanupTimer:0];
  value = self->_tilesManagerClient.__ptr_.__value_;
  self->_tilesManagerClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
}

- (id)getAppsForAreaAtLatitude:(double)a3 longitude:(double)a4 radius:(float)a5 includeRegionalApps:(BOOL)a6 marqueeAppsOnly:(BOOL)a7
{
  BOOL v8 = a6;
  sub_100E047D8((uint64_t)v67);
  uint64_t v64 = (uint64_t)&v64;
  v65 = (double *)&v64;
  double v66 = 0.0;
  double v62 = a3;
  double v63 = a4;
  id v13 = [[objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "vendor") proxyForService:@"CLTilesManager"];
  *(float *)&double v14 = a5;
  [v13 syncgetAppAvailabilityForLocation:v61 radius:v67 searchContext:&v64 availabilityList:v8 includeRegionalApps:v14];
  id v15 = objc_alloc_init((Class)NSMutableArray);
  sub_101171D90((uint64_t)v60);
  if (qword_102419630 != -1) {
    dispatch_once(&qword_102419630, &stru_10231F288);
  }
  v16 = qword_102419638;
  if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v79 = v66;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "TILE_APP: getAppsForArea, examining %zu candidate grids.", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_10231F288);
    }
    int v70 = 134217984;
    double v71 = v66;
    v55 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:]", "%s\n", v55);
    if (v55 != (char *)buf) {
      free(v55);
    }
  }
  for (i = v65; i != (double *)&v64; i = (double *)*((void *)i + 1))
  {
    if (a5 <= 0.0)
    {
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_10231F288);
      }
      v18 = qword_102419638;
      if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = *((void *)i + 5);
        uint64_t v20 = *((void *)i + 6);
        *(_DWORD *)buf = 134218752;
        double v79 = a3;
        __int16 v80 = 2048;
        double v81 = a4;
        __int16 v82 = 2048;
        uint64_t v83 = v19;
        __int16 v84 = 2048;
        uint64_t v85 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "TILE_APP: getAppsForArea, query for exact grid containing lat = %f, lon = %f, gridLat = %f, gridLon = %f", buf, 0x2Au);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419630 != -1) {
          dispatch_once(&qword_102419630, &stru_10231F288);
        }
        uint64_t v50 = *((void *)i + 5);
        uint64_t v51 = *((void *)i + 6);
        int v70 = 134218752;
        double v71 = a3;
        __int16 v72 = 2048;
        double v73 = a4;
        __int16 v74 = 2048;
        uint64_t v75 = v50;
        __int16 v76 = 2048;
        uint64_t v77 = v51;
        v52 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:]", "%s\n", v52);
        if (v52 != (char *)buf) {
          free(v52);
        }
      }
      double v21 = i[5];
      double v22 = i[7] * 0.5;
      double v23 = v21 - v22;
      double v24 = v21 + v22;
      if (v23 > a3 || v24 < a3) {
        continue;
      }
      double v26 = i[6];
      double v27 = i[8] * 0.5;
      double v28 = v26 - v27;
      double v29 = v26 + v27;
      if (v28 > a4 || v29 < a4) {
        continue;
      }
    }
    else if (sub_1000F1648(v60, i[5], i[6], a3, a4, 0.0) - a5 + -25.0 > 0.0)
    {
      continue;
    }
    if (a7)
    {
      if (((*((_DWORD *)i + 4) >> 5) & 1) == 0) {
        continue;
      }
    }
    else
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v31 = [v15 countByEnumeratingWithState:&v56 objects:v69 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v57;
        while (2)
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(void *)v57 != v32) {
              objc_enumerationMutation(v15);
            }
            v34 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
            if ([v34 adamId] == *((_DWORD *)i + 5)
              && [v34 touristApp] != (((_BYTE)i[2] & 0x10) == 0))
            {
              double v45 = sub_1000F1648(v60, i[5], i[6], a3, a4, 0.0);
              [v34 latitude];
              double v47 = v46;
              [v34 longitude];
              if (v45 < sub_1000F1648(v60, v47, v48, a3, a4, 0.0))
              {
                [v34 setLatitude:i[5]];
                [v34 setLongitude:i[6]];
                [v34 setEffectiveRadiusMetersIfInstalled:*((unsigned int *)i + 6)];
                [v34 setHeroAppRankInstalled:*((unsigned int *)i + 7)];
                [v34 setHeroAppRankUnInstalled:*((unsigned int *)i + 8)];
              }
              goto LABEL_56;
            }
          }
          id v31 = [v15 countByEnumeratingWithState:&v56 objects:v69 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }
    }
    v35 = objc_alloc_init(CLAppTileDataProviderResult);
    [(CLAppTileDataProviderResult *)v35 setAdamId:*((unsigned int *)i + 5)];
    int v36 = *((_DWORD *)i + 4);
    if (v36)
    {
      uint64_t v49 = 100;
    }
    else if ((v36 & 2) != 0)
    {
      uint64_t v49 = 200;
    }
    else if ((v36 & 4) != 0)
    {
      uint64_t v49 = 300;
    }
    else
    {
      if ((v36 & 8) == 0)
      {
        if (qword_102419630 != -1) {
          dispatch_once(&qword_102419630, &stru_10231F288);
        }
        v37 = qword_102419638;
        if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEFAULT))
        {
          double v38 = i[5];
          double v39 = i[6];
          int v40 = *((_DWORD *)i + 5);
          *(_DWORD *)buf = 134218496;
          double v79 = v38;
          __int16 v80 = 2048;
          double v81 = v39;
          __int16 v82 = 1024;
          LODWORD(v83) = v40;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#Warning TILE_APP: getAppsForArea, invalid age rating, lat, %f, lon, %f, adamId, %d", buf, 0x1Cu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419630 != -1) {
            dispatch_once(&qword_102419630, &stru_10231F288);
          }
          double v41 = i[5];
          double v42 = i[6];
          int v43 = *((_DWORD *)i + 5);
          int v70 = 134218496;
          double v71 = v41;
          __int16 v72 = 2048;
          double v73 = v42;
          __int16 v74 = 1024;
          LODWORD(v75) = v43;
          v44 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:]", "%s\n", v44);
          if (v44 != (char *)buf) {
            free(v44);
          }
        }
        goto LABEL_55;
      }
      uint64_t v49 = 600;
    }
    [(CLAppTileDataProviderResult *)v35 setAgeRating:v49];
    [(CLAppTileDataProviderResult *)v35 setTouristApp:(*((_DWORD *)i + 4) >> 4) & 1];
    [(CLAppTileDataProviderResult *)v35 setEffectiveRadiusMetersIfInstalled:*((unsigned int *)i + 6)];
    [(CLAppTileDataProviderResult *)v35 setHeroAppRankInstalled:*((unsigned int *)i + 7)];
    [(CLAppTileDataProviderResult *)v35 setHeroAppRankUnInstalled:*((unsigned int *)i + 8)];
    [(CLAppTileDataProviderResult *)v35 setLatitude:i[5]];
    [(CLAppTileDataProviderResult *)v35 setLongitude:i[6]];
    [(CLAppTileDataProviderResult *)v35 setSpanLat:i[7]];
    [(CLAppTileDataProviderResult *)v35 setSpanLon:i[8]];
    [v15 addObject:v35];
LABEL_55:

LABEL_56:
    ;
  }
  id v53 = v15;
  sub_1003B2350(&v64);
  sub_10014F400((uint64_t)v68, v68[1]);
  return v53;
}

- (void)fetchAppsForAreaAtLatitude:(double)a3 longitude:(double)a4 radius:(float)a5 includeRegionalApps:(BOOL)a6 marqueeAppsOnly:(BOOL)a7 withReply:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  [self universe].silo
  if (!a8) {
    sub_101AAE098();
  }
  __int16 v37 = 0;
  if (objc_msgSend(objc_msgSend(objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "vendor"), "proxyForService:", @"CLTilesManager"), "syncgetTileFilePath:latitude:longitude:isFileAccessible:isTileNotExistingOnServer:", 9, (char *)&v37 + 1, &v37, a3, a4))
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_10231F288);
    }
    id v15 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      buf[0] = 134218240;
      *(double *)&buf[1] = a3;
      __int16 v43 = 2048;
      double v44 = a4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "TILE_APP: fetchAppsForArea, tile is available for lat = %f, lon = %f.", (uint8_t *)buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_10231F288);
      }
      int v38 = 134218240;
      double v39 = a3;
      __int16 v40 = 2048;
      double v41 = a4;
      double v26 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]", "%s\n", v26);
      if (v26 != (char *)buf) {
        free(v26);
      }
    }
    *(float *)&double v16 = a5;
    id v17 = [(CLAppTileDataProvider *)self getAppsForAreaAtLatitude:v10 longitude:v9 radius:a3 includeRegionalApps:a4 marqueeAppsOnly:v16];
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_10231F288);
    }
    v18 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [v17 count];
      buf[0] = 134217984;
      *(void *)&buf[1] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "TILE_APP: fetchAppsForArea, found %lu apps.", (uint8_t *)buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_10231F288);
      }
      id v27 = [v17 count];
      int v38 = 134217984;
      double v39 = *(double *)&v27;
      double v28 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]", "%s\n", v28);
      if (v28 != (char *)buf) {
        free(v28);
      }
    }
    (*((void (**)(id, id, void))a8 + 2))(a8, v17, 0);
  }
  else if ((_BYTE)v37)
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_10231F288);
    }
    uint64_t v20 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      buf[0] = 134218240;
      *(double *)&buf[1] = a3;
      __int16 v43 = 2048;
      double v44 = a4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "TILE_APP: fetchAppsForArea, tile does not exist on the server for lat = %f, lon = %f.", (uint8_t *)buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_10231F288);
      }
      int v38 = 134218240;
      double v39 = a3;
      __int16 v40 = 2048;
      double v41 = a4;
      double v29 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]", "%s\n", v29);
      if (v29 != (char *)buf) {
        free(v29);
      }
    }
    id v21 = objc_alloc_init((Class)NSArray);
    (*((void (**)(id, id, void))a8 + 2))(a8, v21, 0);
  }
  else
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_10231F288);
    }
    double v22 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      buf[0] = 134218240;
      *(double *)&buf[1] = a3;
      __int16 v43 = 2048;
      double v44 = a4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "TILE_APP: fetchAppsForArea, tile is not available for lat = %f, lon = %f. Request for download.", (uint8_t *)buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_10231F288);
      }
      int v38 = 134218240;
      double v39 = a3;
      __int16 v40 = 2048;
      double v41 = a4;
      v30 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]", "%s\n", v30);
      if (v30 != (char *)buf) {
        free(v30);
      }
    }
    if (![(CLAppTileDataProvider *)self fIsRegisteredForTileDownload])
    {
      [(CLAppTileDataProvider *)self universe];
      sub_101066858();
    }
    double v23 = objc_alloc_init(CLAppTileDataProviderRequest);
    [(CLAppTileDataProviderRequest *)v23 setLat:a3];
    [(CLAppTileDataProviderRequest *)v23 setLon:a4];
    *(float *)&double v24 = a5;
    [(CLAppTileDataProviderRequest *)v23 setRadiusMeters:v24];
    [(CLAppTileDataProviderRequest *)v23 setIncludeRegionalApps:v10];
    [(CLAppTileDataProviderRequest *)v23 setMarqueeAppsOnly:v9];
    [(CLAppTileDataProviderRequest *)v23 setHandler:a8];
    [(CLAppTileDataProviderRequest *)v23 setTimestamp:CFAbsoluteTimeGetCurrent()];
    [(NSMutableArray *)[(CLAppTileDataProvider *)self activeRequests] addObject:v23];

    __int16 v31 = 0;
    char v32 = 0;
    unint64_t v33 = 0xBFF0000000000000;
    int v34 = 0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    __int16 v36 = 1;
    [objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "vendor") proxyForService:@"CLTilesManager"] requestTileDownloadByType:9 lat:-1 lon:&v31 details:a3, a4];
    [(CLTimer *)[(CLAppTileDataProvider *)self activeRequestCleanupTimer] nextFireDelay];
    if (v25 == 1.79769313e308) {
      [(CLTimer *)[(CLAppTileDataProvider *)self activeRequestCleanupTimer] setNextFireDelay:5.0];
    }
  }
}

- (void)onTileWasDownloadedNotification:(int)a3 data:(uint64_t)a4
{
  [objc_msgSend(a1, "universe") silo];
  if (a3)
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_10231F288);
    }
    v7 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 67109120;
      LODWORD(v59) = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Warning TILE_APP: Got unexpected notification, %d", (uint8_t *)&buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_10231F288);
      }
      int v53 = 67109120;
      LODWORD(v54) = a3;
      BOOL v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]", "%s\n", v8);
      if (v8 != (char *)&buf) {
        free(v8);
      }
    }
  }
  else if (*(_DWORD *)(a4 + 4) == 9)
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_10231F288);
    }
    BOOL v9 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      int buf = 134217984;
      id v59 = [[objc_msgSend(a1, "activeRequests") count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "TILE_APP: onTileWasDownloadedNotification, activeRequests.count = %lu", (uint8_t *)&buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_10231F288);
      }
      int v53 = 134217984;
      id v54 = [[objc_msgSend(a1, "activeRequests") count];
      double v46 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]", "%s\n", v46);
      if (v46 != (char *)&buf) {
        free(v46);
      }
    }
    id v47 = +[NSMutableIndexSet indexSet];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v10 = [a1 activeRequests];
    id v11 = [v10 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v50;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(v10);
          }
          double v16 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v15);
          __int16 v48 = 0;
          id v17 = [[[a1 universe] vendor] proxyForService:@"CLTilesManager"];
          [v16 lat];
          double v19 = v18;
          [v16 lon];
          if ([v17 syncgetTileFilePath:9 latitude:(char *)&v48 + 1 longitude:&v48 isFileAccessible:v19 isTileNotExistingOnServer:v20])
          {
            BOOL v21 = 0;
          }
          else
          {
            BOOL v21 = v48 == 0;
          }
          if (!v21)
          {
            if (qword_102419630 != -1) {
              dispatch_once(&qword_102419630, &stru_10231F288);
            }
            double v22 = qword_102419638;
            if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
            {
              [v16 lat];
              double v24 = v23;
              [v16 lon];
              int buf = 134218240;
              id v59 = v24;
              __int16 v60 = 2048;
              uint64_t v61 = v25;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "TILE_APP: onTileWasDownloadedNotification, tile is available (or tile is 404) for lat = %f, lon = %f.", (uint8_t *)&buf, 0x16u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(&buf, 0x65CuLL);
              if (qword_102419630 != -1) {
                dispatch_once(&qword_102419630, &stru_10231F288);
              }
              [v16 lat];
              __int16 v40 = v39;
              [v16 lon];
              int v53 = 134218240;
              id v54 = v40;
              __int16 v55 = 2048;
              uint64_t v56 = v41;
              double v42 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]", "%s\n", v42);
              if (v42 != (char *)&buf) {
                free(v42);
              }
            }
            [v16 lat];
            double v27 = v26;
            [v16 lon];
            double v29 = v28;
            [v16 radiusMeters];
            int v31 = v30;
            id v32 = [v16 includeRegionalApps];
            id v33 = [v16 marqueeAppsOnly];
            LODWORD(v34) = v31;
            id v35 = [a1 getAppsForAreaAtLatitude:v32 longitude:v33 radius:v27 includeRegionalApps:v29 marqueeAppsOnly:v34];
            if (qword_102419630 != -1) {
              dispatch_once(&qword_102419630, &stru_10231F288);
            }
            __int16 v36 = qword_102419638;
            if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
            {
              id v37 = [v35 count];
              int buf = 134217984;
              id v59 = v37;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "TILE_APP: onTileWasDownloadedNotification, found %lu apps.", (uint8_t *)&buf, 0xCu);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(&buf, 0x65CuLL);
              if (qword_102419630 != -1) {
                dispatch_once(&qword_102419630, &stru_10231F288);
              }
              id v43 = [v35 count];
              int v53 = 134217984;
              id v54 = v43;
              double v44 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]", "%s\n", v44);
              if (v44 != (char *)&buf) {
                free(v44);
              }
            }
            int v38 = (void (**)(id, id, void))[v16 handler];
            v38[2](v38, v35, 0);
            [v47 addIndex:(char *)v15 + v13];
          }
          id v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        id v45 = [v10 countByEnumeratingWithState:&v49 objects:v57 count:16];
        id v12 = v45;
        v13 += (uint64_t)v15;
      }
      while (v45);
    }
    [objc_msgSend(a1, "activeRequests") removeObjectsAtIndexes:v47];
  }
}

- (BOOL)fIsRegisteredForTileDownload
{
  return self->_fIsRegisteredForTileDownload;
}

- (void)setFIsRegisteredForTileDownload:(BOOL)a3
{
  self->_fIsRegisteredForTileDownload = a3;
}

- (NSMutableArray)activeRequests
{
  return self->_activeRequests;
}

- (void)setActiveRequests:(id)a3
{
  self->_activeRequests = (NSMutableArray *)a3;
}

- (CLTimer)activeRequestCleanupTimer
{
  return self->_activeRequestCleanupTimer;
}

- (void)setActiveRequestCleanupTimer:(id)a3
{
  self->_activeRequestCleanupTimer = (CLTimer *)a3;
}

- (void).cxx_destruct
{
  value = self->_tilesManagerClient.__ptr_.__value_;
  self->_tilesManagerClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end