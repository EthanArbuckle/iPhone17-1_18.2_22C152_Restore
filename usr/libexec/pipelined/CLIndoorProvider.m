@interface CLIndoorProvider
+ (id)getAvailabilityTilePathFromWorkdir:(id)a3;
+ (id)makeReason:(id)a3 withCode:(int64_t)a4 withFailure:(id)a5;
+ (id)makeReason:(id)a3 withCode:(int64_t)a4 withInfo:(id)a5;
- (BOOL)demoRunStarted;
- (BOOL)isRegionalEnabled;
- (BOOL)localizationActive;
- (BOOL)localizationStarted;
- (BOOL)onQueueProcessCompletedFetch:(id)a3;
- (CLIndoorForegroundFetchRequest)currentForegroundFetchRequest;
- (CLIndoorLocation)latestFix;
- (CLIndoorProvider)init;
- (CLIndoorProvider)initWithConnection:(id)a3;
- (CLIndoorTilePrefetcher)prefetcher;
- (CLIndoorUniverse)indoorUniverse;
- (NSURL)workdir;
- (NSXPCConnection)xpcConnection;
- (float)numOfDaysBeforeIndoorTileRedownload;
- (float)numOfDaysBeforeRegionalTileRedownload;
- (id).cxx_construct;
- (id)getAvailabilityTileParserAndSetParams:(id)a3;
- (id)initializeServiceApi;
- (id)locationRequests:(id)a3 usingAvailabilityTile:(const void *)a4 forAction:(unsigned __int8)a5;
- (int)prefetchByteSizeLimitIndoor;
- (int)prefetchByteSizeLimitRegional;
- (int)prefetchFloorLimitIndoor;
- (int)prefetchFloorLimitRegional;
- (optional<SelectedLocations>)selectedLocation;
- (shared_ptr<ITileDb>)fsDb;
- (void)changeLocationGroups:(id)a3;
- (void)clVisionNotificationARSessionStateAvailable:(id)a3;
- (void)clVisionNotificationAvailable:(id)a3;
- (void)clVisionNotificationVIOEstimationAvailable:(id)a3;
- (void)clVisionNotificationVLLocalizationResultAvailable:(id)a3;
- (void)clpOutdoorEstimatorLogEntryNotificationAvailable:(id)a3;
- (void)dealloc;
- (void)foregroundRequestCompleted:(id)a3;
- (void)foregroundRequestCompleted:(id)a3 withError:(id)a4;
- (void)foregroundTileDownloadComplete;
- (void)gpsEstimateAvailable:(id)a3;
- (void)gpsSignalQualityAvailable:(id)a3;
- (void)initializeIndoorUniverse:(id)a3 atLocation:(id)a4;
- (void)mutableDeferredState;
- (void)notify:(id)a3 failedWithReason:(id)a4;
- (void)notifyProxyOfDownloadError;
- (void)notifyProxyOfDownloadError:(id)a3;
- (void)onConnectionQueueShutdown;
- (void)onQueueInterruptDownloads:(int)a3;
- (void)onQueueInvalidate:(int)a3;
- (void)onQueueLocalizeOnSelection:(const void *)a3 withParameterOverrides:(optional<proto::params::LocalizerParameters>)a4;
- (void)onQueueNotify:(const void *)a3 onFloor:(const void *)a4;
- (void)onQueueNotifyLocationContext:(BOOL)a3 withLocationContext:(int)a4;
- (void)onQueueRecordInputEventMetrics:(const void *)a3;
- (void)onQueueSelectedLocationDownloadCompleted:(const void *)a3 forAction:(unsigned __int8)a4;
- (void)onQueueStopUpdatingLocation:(int)a3;
- (void)outdoorLocationAvailable:(id)a3;
- (void)playbackDatarun:(id)a3;
- (void)requestForegroundTileDownload;
- (void)requestLocationTilesForGroup:(id)a3 usingAvailabilityTile:(const void *)a4 forAction:(unsigned __int8)a5;
- (void)setApiKey:(id)a3;
- (void)setApiKey:(id)a3 onServer:(id)a4;
- (void)setCurrentForegroundFetchRequest:(id)a3;
- (void)setDemoRunStarted:(BOOL)a3;
- (void)setFsDb:(shared_ptr<ITileDb>)a3;
- (void)setIndoorUniverse:(id)a3;
- (void)setIsRegionalEnabled:(BOOL)a3;
- (void)setLatestFix:(id)a3;
- (void)setLocalizationActive:(BOOL)a3;
- (void)setLocalizationStarted:(BOOL)a3;
- (void)setLocationGroups:(id)a3;
- (void)setNumOfDaysBeforeIndoorTileRedownload:(float)a3;
- (void)setNumOfDaysBeforeRegionalTileRedownload:(float)a3;
- (void)setPrefetchByteSizeLimitIndoor:(int)a3;
- (void)setPrefetchByteSizeLimitRegional:(int)a3;
- (void)setPrefetchFloorLimitIndoor:(int)a3;
- (void)setPrefetchFloorLimitRegional:(int)a3;
- (void)setPrefetcher:(id)a3;
- (void)setSelectedLocation:(optional<SelectedLocations>)a3;
- (void)setWorkdir:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)startLocalizer;
- (void)startUpdatingLocationAtLocation:(id)a3;
- (void)startUpdatingLocationDeferred:(id)a3;
- (void)stopLocalizer;
- (void)stopUpdatingLocation;
- (void)updateUniverseIfAllowedAndNecessary:(id *)a3;
@end

@implementation CLIndoorProvider

- (void)clVisionNotificationAvailable:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_serviceLocalizer.__ptr_.__value_)
  {
    unsigned int v6 = [v4 notificationType];
    if (v6)
    {
      if (v6 == 1)
      {
        [(CLIndoorProvider *)self clVisionNotificationVIOEstimationAvailable:v5];
      }
      else if (v6 == 2)
      {
        [(CLIndoorProvider *)self clVisionNotificationVLLocalizationResultAvailable:v5];
      }
    }
    else
    {
      [(CLIndoorProvider *)self clVisionNotificationARSessionStateAvailable:v5];
    }
    goto LABEL_6;
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    v7 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
LABEL_6:

    return;
  }
  v7 = qword_10047BF00;
  if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
    goto LABEL_6;
  }
LABEL_9:
  *(_WORD *)v8 = 0;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Ignoring CLVision notification - not localizing yet", v8, 2u);
}

- (void)setFsDb:(shared_ptr<ITileDb>)a3
{
  ptr = a3.__ptr_;
  if (qword_10047BEF8 == -1)
  {
    v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    BOOL v6 = *(void *)ptr != 0;
    LODWORD(buf.__r_.__value_.__l.__data_) = 67240192;
    HIDWORD(buf.__r_.__value_.__r.__words[0]) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CLIndoorProvider] Keybag unlock, FsDb, %{public}d", (uint8_t *)&buf, 8u);
  }
LABEL_4:
  v7 = self->_fsDb.__ptr_;
  if (v7)
  {
    if (v7 != *(ITileDb **)ptr)
    {
      sub_1000AE4B0(__p, "");
      sub_10026F5B8("Cannot change the localizer DB being used", &buf);
      sub_10016A2C4((uint64_t)__p, (uint64_t)&buf, 1);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
      if (v13 < 0) {
        operator delete(__p[0]);
      }
      sub_1000D11E0((uint64_t)&v11);
    }
  }
  else
  {
    v7 = *(ITileDb **)ptr;
  }
  uint64_t v8 = *((void *)ptr + 1);
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  self->_fsDb.__ptr_ = v7;
  cntrl = self->_fsDb.__cntrl_;
  self->_fsDb.__cntrl_ = (__shared_weak_count *)v8;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    if (!self->_deferredState.m_initialized) {
      return;
    }
  }
  else if (!self->_deferredState.m_initialized)
  {
    return;
  }
  v10 = [(CLIndoorProvider *)self xpcConnection];
  if (v10)
  {
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)objc_retain(*(id *)((char *)&self->_deferredState.m_storage.dummy_.aligner_
                                                                                 + 7));
    buf.__r_.__value_.__s.__data_[8] = 0;
    if (self->_anon_11[7])
    {
      buf.__r_.__value_.__r.__words[2] = (std::string::size_type)*(id *)&self->_anon_11[15];
      if ((char)self->_anon_11[46] < 0)
      {
        sub_1000559FC(&v15, *(void **)&self->_anon_11[23], *(void *)&self->_anon_11[31]);
      }
      else
      {
        long long v15 = *(_OWORD *)&self->_anon_11[23];
        uint64_t v16 = *(void *)&self->_anon_11[39];
      }
      buf.__r_.__value_.__s.__data_[8] = 1;
    }
    if (self->_deferredState.m_initialized)
    {
      if (self->_anon_11[7])
      {
        sub_100091F70((uint64_t)&self->_anon_11[15]);
        self->_anon_11[7] = 0;
      }

      self->_deferredState.m_initialized = 0;
    }
    if (buf.__r_.__value_.__r.__words[0]) {
      -[CLIndoorProvider playbackDatarun:](self, "playbackDatarun:");
    }
    if (buf.__r_.__value_.__s.__data_[8])
    {
      if (!self->_lastOutdoorPositionAvailable
        || (-[CLIndoorProvider startUpdatingLocationDeferred:](self, "startUpdatingLocationDeferred:"),
            buf.__r_.__value_.__s.__data_[8]))
      {
        sub_100091F70((uint64_t)&buf.__r_.__value_.__r.__words[2]);
        buf.__r_.__value_.__s.__data_[8] = 0;
      }
    }
  }
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    goto LABEL_6;
  }
  if (qword_10047BEF8 == -1)
  {
    v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
  {
LABEL_5:
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "request to login, but connection to client is dead", v7, 2u);
  }
LABEL_6:

  return (NSXPCConnection *)v3;
}

+ (id)getAvailabilityTilePathFromWorkdir:(id)a3
{
  v3 = [a3 URLByDeletingLastPathComponent];
  id v4 = [v3 URLByAppendingPathComponent:@"locationd/indoor_tiles/availability.pb"];

  return v4;
}

- (id)initializeServiceApi
{
  v3 = [(CLIndoorProvider *)self xpcConnection];
  if (!v3) {
    goto LABEL_28;
  }
  uint64_t v4 = (*(uint64_t (**)(ITileDb *))(*(void *)self->_fsDb.__ptr_ + 232))(self->_fsDb.__ptr_);
  uint64_t v5 = (*(uint64_t (**)(ITileDb *))(*(void *)self->_fsDb.__ptr_ + 240))(self->_fsDb.__ptr_);
  BOOL v6 = (std::__shared_weak_count *)operator new(0xA8uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)off_10046B560;
  sub_10000756C((uint64_t)&v21, (uint64_t)&v6[1], v4, v5);
  v23 = &v6[1].__vftable;
  v24 = v6;
  sub_10009BD98(&v21);
  shared_ptr<PlatformInfo> v7 = *(shared_ptr<PlatformInfo> *)&v21.__r_.__value_.__l.__data_;
  *(_OWORD *)&v21.__r_.__value_.__l.__data_ = 0uLL;
  cntrl = self->_platformInfo.__cntrl_;
  self->_platformInfo = v7;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  size = (std::__shared_weak_count *)v21.__r_.__value_.__l.__size_;
  if (v21.__r_.__value_.__l.__size_
    && !atomic_fetch_add((atomic_ullong *volatile)(v21.__r_.__value_.__l.__size_ + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
    std::__shared_weak_count::__release_weak(size);
  }
  v10 = (__shared_weak_count *)operator new(0x48uLL);
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = 0;
  *(void *)v10 = off_10046B5B0;
  self->_eventBuses.__ptr_ = (_EventBusCollection *)sub_100005564((void *)v10 + 3);
  v11 = self->_eventBuses.__cntrl_;
  self->_eventBuses.__cntrl_ = v10;
  if (v11 && !atomic_fetch_add((atomic_ullong *volatile)v11 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v11 + 16))(v11);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v11);
  }
  uint64_t v12 = (uint64_t)v23;
  sub_1000A1FB4((uint64_t)v23, (uint64_t *)&self->_eventBuses);
  v26 = 0;
  sub_100011FE4(v12, 0xBu, v25, &v21);
  shared_ptr<SensorCollection> v13 = *(shared_ptr<SensorCollection> *)&v21.__r_.__value_.__l.__data_;
  *(_OWORD *)&v21.__r_.__value_.__l.__data_ = 0uLL;
  v14 = self->_localizationSensorCollection.__cntrl_;
  self->_localizationSensorCollection = v13;
  if (v14 && !atomic_fetch_add((atomic_ullong *volatile)v14 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v14 + 16))(v14);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v14);
    long long v15 = (std::__shared_weak_count *)v21.__r_.__value_.__l.__size_;
    if (!v21.__r_.__value_.__l.__size_)
    {
LABEL_15:
      uint64_t v16 = v26;
      if (v26 != v25) {
        goto LABEL_16;
      }
      goto LABEL_23;
    }
  }
  else
  {
    long long v15 = (std::__shared_weak_count *)v21.__r_.__value_.__l.__size_;
    if (!v21.__r_.__value_.__l.__size_) {
      goto LABEL_15;
    }
  }
  if (atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_15;
  }
  ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
  std::__shared_weak_count::__release_weak(v15);
  uint64_t v16 = v26;
  if (v26 != v25)
  {
LABEL_16:
    if (v16) {
      (*(void (**)(void *))(*v16 + 40))(v16);
    }
    if (!self->_serviceLocalizer.__ptr_.__value_) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_23:
  (*(void (**)(void *))(v25[0] + 32))(v25);
  if (self->_serviceLocalizer.__ptr_.__value_)
  {
LABEL_24:
    if ([(CLIndoorProvider *)self localizationActive])
    {
      __cxa_allocate_exception(0x40uLL);
      sub_1000AE4B0(&v21, "This should not be possible. We have just started pipelined for the first time. The localizer couldn't possibly be running.");
      std::runtime_error::runtime_error(&v22, &v21);
      v22.__vftable = (std::runtime_error_vtbl *)&off_100453860;
      sub_10018E868((uint64_t)v20);
      sub_1000D1698(&v22, (uint64_t)"-[CLIndoorProvider initializeServiceApi]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorProvider.mm", 1617, (uint64_t)v20);
    }
  }
LABEL_25:
  id v17 = v3;
  v18 = v24;
  if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
LABEL_28:

  return v3;
}

- (void)clVisionNotificationARSessionStateAvailable:(id)a3
{
  id v4 = a3;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  uint64_t v5 = (id)qword_10047BF00;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 134349056;
    *(void *)&buf[4] = [v4 arSessionState];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Receiving CLVision notification - ARSessionState %{public}lu", buf, 0xCu);
  }

  id v6 = [v4 arSessionState];
  if (v6)
  {
    if (v6 == (id)1)
    {
      int v7 = 1;
      goto LABEL_15;
    }
    if (v6 == (id)2)
    {
      int v7 = 2;
LABEL_15:
      int v17 = v7;
      goto LABEL_16;
    }
    if (qword_10047BEF8 == -1)
    {
      uint64_t v8 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_14:

        int v7 = -1;
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      uint64_t v8 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_14;
      }
    }
    id v9 = [v4 arSessionState];
    *(_DWORD *)std::string buf = 134349056;
    *(void *)&buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Invalid arSessionState %{public}lu", buf, 0xCu);
    goto LABEL_14;
  }
  int v17 = 0;
LABEL_16:
  sub_100016A80((uint64_t)v16);
  uint64_t v10 = *(void *)(*(uint64_t (**)(LocalizerApi *))(*(void *)self->_serviceLocalizer.__ptr_.__value_ + 120))(self->_serviceLocalizer.__ptr_.__value_);
  sub_1000A0CB4((uint64_t)buf, (uint64_t)v16, &v17);
  v11 = operator new(0x108uLL);
  v11[1] = 0;
  v11[2] = 0;
  void *v11 = off_100454870;
  v11[4] = *(void *)buf;
  *((_DWORD *)v11 + 10) = *(_DWORD *)&buf[8];
  sub_100018854((uint64_t)(v11 + 6), (uint64_t)v19);
  *((_DWORD *)v11 + 6) = 17;
  v14 = (char *)(v11 + 3);
  long long v15 = (std::__shared_weak_count *)v11;
  sub_100041DEC(v10, (uint64_t)&v14);
  uint64_t v12 = v15;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    sub_1000428B0((uint64_t)v19);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr) {
      goto LABEL_21;
    }
  }
  else
  {
    sub_1000428B0((uint64_t)v19);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr) {
      goto LABEL_21;
    }
  }
  if (self->_localizationActive) {
    sub_10009D760((uint64_t)ptr);
  }
LABEL_21:
  sub_1000428B0((uint64_t)v16);
}

- (id)getAvailabilityTileParserAndSetParams:(id)a3
{
  id v4 = a3;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  uint64_t v5 = (id)qword_10047BF00;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315138;
    v14[0] = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "@IndoorAvl, load, getAvailabilityTileParserAndSetParams because %s", buf, 0xCu);
  }

  id v6 = [CLAvailabilityTileParser alloc];
  int v7 = [(CLIndoorProvider *)self workdir];
  uint64_t v8 = +[CLIndoorProvider getAvailabilityTilePathFromWorkdir:v7];
  id v9 = [(CLAvailabilityTileParser *)v6 initWithTilePathIncrementalIO:v8];

  if (v9)
  {
    sub_10003E040((uint64_t)[(CLAvailabilityTileParser *)v9 getAvlTile], buf);
    p_paramOverrides = &self->_paramOverrides;
    if (self->_paramOverrides.m_initialized)
    {
      if (buf[0])
      {
        sub_10003DA28((uint64_t)&self->_paramOverrides.m_storage.dummy_.aligner_ + 7, (uint64_t)v14 + 4);
        if (!buf[0]) {
          goto LABEL_15;
        }
      }
      else
      {
        sub_10006E2E4((a8 *)((char *)&self->_paramOverrides.m_storage.dummy_.aligner_ + 7));
        p_paramOverrides->m_initialized = 0;
        if (!buf[0]) {
          goto LABEL_15;
        }
      }
    }
    else if (!buf[0] {
           || (sub_10003E0AC((uint64_t)&self->_paramOverrides.m_storage.dummy_.aligner_ + 7, (uint64_t)v14 + 4),
    }
               p_paramOverrides->m_initialized = 1,
               !buf[0]))
    {
LABEL_15:
      uint64_t v12 = off_10046B360;
      sub_100038974((uint64_t)buf, (uint64_t)&v12, &self->_paramOverrides.m_initialized);
    }
    sub_10006E2E4((void *)((char *)v14 + 4));
    goto LABEL_15;
  }

  return 0;
}

- (void)requestLocationTilesForGroup:(id)a3 usingAvailabilityTile:(const void *)a4 forAction:(unsigned __int8)a5
{
  id v8 = a3;
  unsigned __int8 v20 = a5;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  id v9 = (id)qword_10047BF00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v8 allObjects];
    id v11 = [v10 componentsJoinedByString:@", "];
    LODWORD(buf.__r_.__value_.__l.__data_) = 136380675;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)[v11 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "async fetch location tiles for group %{private}s", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v12 = [(CLIndoorProvider *)self locationRequests:v8 usingAvailabilityTile:a4 forAction:v20];
  if (![v12 count])
  {
    if (qword_10047BEF8 == -1)
    {
      shared_ptr<SensorCollection> v13 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    shared_ptr<SensorCollection> v13 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No floors found in availability tile?!", (uint8_t *)&buf, 2u);
    }
  }
LABEL_9:
  id v14 = [v12 count];
  long long v15 = [v8 description];
  uint64_t v16 = v15;
  if (v15)
  {
    [v15 ps_STLStringOnNil:@"<nil location groups>"];
    if (!v14)
    {
LABEL_16:
      sub_1000AE4B0(v22, "");
      sub_100282374("No floors found in availability tile? Group Ids: ", &buf);
      if (SHIBYTE(v19) < 0)
      {
        sub_1000559FC(&v25, __p[0], (unint64_t)__p[1]);
      }
      else
      {
        long long v25 = *(_OWORD *)__p;
        uint64_t v26 = v19;
      }
      sub_1000E1B9C(" ,action: ", &v27);
      sub_10038E248((char *)&v20, &v28);
      sub_10016A2C4((uint64_t)v22, (uint64_t)&buf, 4);
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v28.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_23:
          if ((SHIBYTE(v26) & 0x80000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_29;
        }
      }
      else if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_23;
      }
      operator delete(v27.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v26) & 0x80000000) == 0)
      {
LABEL_24:
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_25;
        }
        goto LABEL_30;
      }
LABEL_29:
      operator delete((void *)v25);
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_25:
        if ((v23 & 0x80000000) == 0) {
          goto LABEL_26;
        }
LABEL_31:
        operator delete(v22[0]);
LABEL_26:
        sub_1000D11E0((uint64_t)&v21);
      }
LABEL_30:
      operator delete(buf.__r_.__value_.__l.__data_);
      if ((v23 & 0x80000000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_31;
    }
  }
  else
  {
    *(_OWORD *)__p = 0uLL;
    uint64_t v19 = 0;
    if (!v14) {
      goto LABEL_16;
    }
  }
  if (SHIBYTE(v19) < 0) {
    operator delete(__p[0]);
  }

  int v17 = [[CLIndoorForegroundFetchRequest alloc] initWithFloorRequests:v12 forAction:v20];
  [(CLIndoorProvider *)self setCurrentForegroundFetchRequest:v17];

  [(CLIndoorProvider *)self requestForegroundTileDownload];
}

- (void)startUpdatingLocationAtLocation:(id)a3
{
  id v5 = a3;
  if (self->_indoorUniverse)
  {
    sub_1000AE4B0(__p, "");
    sub_10038EEAC("startUpdatingLocationAtLocation, indoorUniverse already initialized", buf);
    sub_10016A2C4((uint64_t)__p, (uint64_t)buf, 1);
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf[0].__r_.__value_.__l.__data_);
    }
    if (v50 < 0) {
      operator delete(__p[0]);
    }
    sub_1000D11E0((uint64_t)v51);
  }
  if (!v5)
  {
    sub_1000AE4B0(__p, "");
    sub_10025CA0C("startUpdatingLocationAtLocation needs a valid location", buf);
    sub_10016A2C4((uint64_t)__p, (uint64_t)buf, 1);
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf[0].__r_.__value_.__l.__data_);
    }
    if (v50 < 0) {
      operator delete(__p[0]);
    }
    sub_1000D11E0((uint64_t)v51);
  }
  p_lastOutdoorPositionAvailable = &self->_lastOutdoorPositionAvailable;
  objc_storeStrong((id *)&self->_lastOutdoorPositionAvailable, a3);
  if (!self->_fsDb.__ptr_)
  {
    if (qword_10047BEF8 == -1)
    {
      v42 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_50;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      v42 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_50:
        sub_100092088((uint64_t)buf, "deferred startUpdatingLocationAtLocation - locked");
        std::string v27 = [(CLIndoorProvider *)self mutableDeferredState];
        std::string v28 = v27;
        std::string::size_type v29 = buf[0].__r_.__value_.__r.__words[0];
        if (*((unsigned char *)v27 + 8))
        {
          buf[0].__r_.__value_.__r.__words[0] = 0;
          v30 = (void *)v27[2];
          v27[2] = v29;
        }
        else
        {
          v27[2] = buf[0].__r_.__value_.__l.__data_;
          *(_OWORD *)(v28 + 3) = *(_OWORD *)&buf[0].__r_.__value_.__r.__words[1];
          v28[5] = buf[1].__r_.__value_.__l.__data_;
          v35 = (void *)buf[0].__r_.__value_.__r.__words[0];
          memset(buf, 0, 32);

          *((unsigned char *)v28 + 8) = 1;
        }
        v36 = buf;
        goto LABEL_70;
      }
    }
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[CLIndoorProvider] startUpdatingLocationAtLocation. Deferring request to start indoor - localizer DB is locked", (uint8_t *)buf, 2u);
    goto LABEL_50;
  }
  if (qword_10047BEF8 == -1)
  {
    v40 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  v40 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_7:
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "startUpdatingLocationAtLocation", (uint8_t *)buf, 2u);
  }
LABEL_8:
  sub_100092088((uint64_t)__p, "startUpdatingLocationAtLocation:");
  int v7 = [(CLIndoorProvider *)self initializeServiceApi];
  if (!v7)
  {
    if (qword_10047BEF8 == -1)
    {
      v34 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_61:
        int v37 = 0;
        goto LABEL_62;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      v34 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_61;
      }
    }
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Ignoring startUpdatingLocationAtLocation since connection to client is not alive", (uint8_t *)buf, 2u);
    goto LABEL_61;
  }
  char v8 = 0;
  int v9 = 6;
  while (1)
  {
    if ((v8 & 1) == 0) {
      goto LABEL_15;
    }
    if (qword_10047BEF8 != -1)
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      uint64_t v10 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
LABEL_13:
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CLIndoorProvider] Failed to startup the indoor provider due to missing availability tile, notifying locationd of failure then retrying", (uint8_t *)buf, 2u);
      goto LABEL_14;
    }
    uint64_t v10 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
LABEL_14:
    [(CLIndoorProvider *)self notifyProxyOfDownloadError];
    sub_1000BA17C();
LABEL_15:
    id v11 = [(CLIndoorProvider *)self getAvailabilityTileParserAndSetParams:@"startUpdatingLocationAtLocation"];
    if (v11) {
      break;
    }

    char v8 = 1;
    if (!--v9)
    {
      if (qword_10047BEF8 == -1)
      {
        uint64_t v26 = qword_10047BF00;
        if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_FAULT)) {
          goto LABEL_44;
        }
      }
      else
      {
        dispatch_once(&qword_10047BEF8, &stru_10046B230);
        uint64_t v26 = qword_10047BF00;
        if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_FAULT))
        {
LABEL_44:
          LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "[CLIndoorProvider] Indoor is persistently failing to find the availability tile, something is wrong", (uint8_t *)buf, 2u);
        }
      }
      [(CLIndoorProvider *)self notifyProxyOfDownloadError];
      goto LABEL_61;
    }
  }
  if (!self->_indoorUniverse) {
    [(CLIndoorProvider *)self initializeIndoorUniverse:v11 atLocation:v5];
  }
  v51[0] = +[NSMutableSet set];
  indoorUniverse = self->_indoorUniverse;
  uint64_t v13 = sub_100048550();
  if (*p_lastOutdoorPositionAvailable)
  {
    [(CLGpsPosition *)*p_lastOutdoorPositionAvailable gpsLocation];
  }
  else
  {
    long long v57 = 0u;
    memset(v58, 0, sizeof(v58));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    memset(buf, 0, sizeof(buf));
  }
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3321888768;
  v48[2] = sub_100012E6C;
  v48[3] = &unk_10046B1D0;
  v48[4] = v51;
  if (!-[CLIndoorUniverse updateLocalizerUniverseIfAllowed:fromLocation:withUniverseUpdatedHandler:](indoorUniverse, "updateLocalizerUniverseIfAllowed:fromLocation:withUniverseUpdatedHandler:", v13, buf, v48)|| ![v51[0] count])
  {
    if (qword_10047BEF8 == -1)
    {
      std::runtime_error v22 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_31;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      std::runtime_error v22 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_31:
        if (qword_10047BEF8 == -1)
        {
          char v23 = qword_10047BF00;
          if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
            goto LABEL_34;
          }
        }
        else
        {
          dispatch_once(&qword_10047BEF8, &stru_10046B230);
          char v23 = qword_10047BF00;
          if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
          {
LABEL_34:
            v24 = self->_indoorUniverse;
            self->_indoorUniverse = 0;

            sub_100092088((uint64_t)buf, "deferred startUpdatingLocationAtLocation - universe");
            long long v25 = [(CLIndoorProvider *)self mutableDeferredState];
            v31 = v25;
            std::string::size_type v32 = buf[0].__r_.__value_.__r.__words[0];
            if (*((unsigned char *)v25 + 8))
            {
              buf[0].__r_.__value_.__r.__words[0] = 0;
              v33 = (void *)v25[2];
              v25[2] = v32;
            }
            else
            {
              v25[2] = buf[0].__r_.__value_.__l.__data_;
              *(_OWORD *)(v31 + 3) = *(_OWORD *)&buf[0].__r_.__value_.__r.__words[1];
              v31[5] = buf[1].__r_.__value_.__l.__data_;
              v38 = (void *)buf[0].__r_.__value_.__r.__words[0];
              memset(buf, 0, 32);

              *((unsigned char *)v31 + 8) = 1;
            }
            sub_100091F70((uint64_t)buf);

            goto LABEL_61;
          }
        }
        LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "_lastOutdoorPositionAvailable was available to compute Universe, but the universe did not update", (uint8_t *)buf, 2u);
        goto LABEL_34;
      }
    }
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[CLIndoorProvider] Ignoring startUpdatingLocationAtLocation since universe didn't update or no groups in universe", (uint8_t *)buf, 2u);
    goto LABEL_31;
  }
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  id v14 = (id)qword_10047BF00;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v46 = [(CLIndoorProvider *)self localizationActive];
    unsigned int v45 = [(CLIndoorProvider *)self localizationStarted];
    BOOL v44 = self->_serviceLocalizer.__ptr_.__value_ != 0;
    id v15 = [v51[0] count];
    uint64_t v16 = [v51[0] allObjects];
    int v17 = [v16 componentsJoinedByString:@", "];
    LODWORD(buf[0].__r_.__value_.__l.__data_) = 67110403;
    HIDWORD(buf[0].__r_.__value_.__r.__words[0]) = v46;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = v45;
    HIWORD(buf[0].__r_.__value_.__r.__words[1]) = 1024;
    LODWORD(buf[0].__r_.__value_.__r.__words[2]) = v44;
    WORD2(buf[0].__r_.__value_.__r.__words[2]) = 1024;
    *(_DWORD *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 6) = 1;
    *(_WORD *)&buf[1].__r_.__value_.__s.__data_[2] = 2050;
    *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 4) = (std::string::size_type)v15;
    WORD2(buf[1].__r_.__value_.__r.__words[1]) = 2113;
    *(std::string::size_type *)((char *)&buf[1].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CLIndoorProvider] Start state %d,%d,%d, didUpdate, %d, Universe size: %{public}lu with locationGroupIds: %{private}@", (uint8_t *)buf, 0x2Eu);
  }
  v18 = [(CLIndoorUniverse *)self->_indoorUniverse getAvailabilityData];
  buf[0].__r_.__value_.__r.__words[0] = *v18;
  buf[0].__r_.__value_.__l.__size_ = (std::string::size_type)(id)v18[1];
  char v19 = *((unsigned char *)v18 + 48);
  long long v20 = *((_OWORD *)v18 + 2);
  *(_OWORD *)&buf[0].__r_.__value_.__r.__words[2] = *((_OWORD *)v18 + 1);
  *(_OWORD *)&buf[1].__r_.__value_.__r.__words[1] = v20;
  LOBYTE(v53) = v19;
  std::string v21 = +[NSSet setWithSet:v51[0]];
  [(CLIndoorProvider *)self requestLocationTilesForGroup:v21 usingAvailabilityTile:buf forAction:0];

  int v37 = 1;
LABEL_62:

  if (v37)
  {
    [(CLIndoorProvider *)self setLocalizationActive:1];
    if (!self->_serviceLocalizer.__ptr_.__value_)
    {
      if (qword_10047BEF8 == -1)
      {
        v39 = qword_10047BF00;
        if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
          goto LABEL_69;
        }
      }
      else
      {
        dispatch_once(&qword_10047BEF8, &stru_10046B230);
        v39 = qword_10047BF00;
        if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
          goto LABEL_69;
        }
      }
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "didn't select a location to localize against yet", (uint8_t *)buf, 2u);
      goto LABEL_69;
    }
    if (![(CLIndoorProvider *)self localizationStarted]) {
      [(CLIndoorProvider *)self startLocalizer];
    }
  }
LABEL_69:
  v36 = (std::string *)__p;
LABEL_70:
  sub_100091F70((uint64_t)v36);
}

- (void)initializeIndoorUniverse:(id)a3 atLocation:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (self->_indoorUniverse)
  {
    sub_1000AE4B0(v22, "");
    sub_10036F3E8("IndoorUniverse already set and being asked to re-initialized", __p);
    sub_10016A2C4((uint64_t)v22, (uint64_t)__p, 1);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (v23 < 0) {
      operator delete(*(void **)v22);
    }
    sub_1000D11E0((uint64_t)v21);
  }
  id v20 = objc_alloc_init((Class)NSMutableArray);
  int v7 = sub_10009D0A4();
  sub_1000776C8((uint64_t)v7);
  int data = (int)__p[0].__r_.__value_.__l.__data_;
  sub_100077BC8((uint64_t)__p);
  if (data == data >> 31
    || (int v9 = sub_10009D0A4(),
        sub_1000776C8((uint64_t)v9),
        int v10 = (int)__p[0].__r_.__value_.__l.__data_,
        sub_100077BC8((uint64_t)__p),
        v10 == v10 >> 31))
  {
    if (v6)
    {
      id v11 = [GeographicCoordinate alloc];
      [v6 gpsLocation];
      double v12 = *(double *)((char *)__p[0].__r_.__value_.__r.__words + 4);
      [v6 gpsLocation];
      double v13 = *(double *)&v22[12];
      [v6 gpsLocation];
      id v14 = [(GeographicCoordinate *)v11 initWithLatitude:v12 longitude:v13 andAltitude:*(double *)((char *)&v21[3] + 4)];
    }
    else
    {
      id v14 = 0;
    }
    id v15 = +[NSSet setWithArray:](NSSet, "setWithArray:", v20, v18);
    [(CLAvailableVenuesStateMachine *)self->_avlVenuesStateMachine setDisabledVenues:v15];

    [(CLAvailableVenuesStateMachine *)self->_avlVenuesStateMachine clearLastFix];
    [(CLAvailableVenuesStateMachine *)self->_avlVenuesStateMachine getNearbyLocationGroupsForTile:v19 withUpdatedPos:v14];
    objc_claimAutoreleasedReturnValue();
    id v16 = [v19 getAvlTile];
    v21[0] = off_10046B360;
    sub_10003E040((uint64_t)v16, __p);
    int v17 = operator new(0x28uLL);
    v17[1] = 0;
    v17[2] = 0;
    *int v17 = off_10046B510;
    sub_100038974((uint64_t)(v17 + 3), (uint64_t)v21, __p);
  }
  sub_1000AE4B0(v22, "");
  sub_10036383C("Override of DYNAMIC_UNIVERSE_DISABLED_VENUES is not supported.", __p);
  sub_10016A2C4((uint64_t)v22, (uint64_t)__p, 1);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p[0].__r_.__value_.__l.__data_);
    if ((v23 & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((v23 & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  operator delete(*(void **)v22);
LABEL_6:
  sub_1000D11E0((uint64_t)v21);
}

- (void)gpsEstimateAvailable:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!v5 || ([v5 gpsLocation], v61 != 1) && (objc_msgSend(v6, "gpsLocation"), v29 != 9))
  {
    objc_storeStrong((id *)&self->_lastNonGpsPositionAvailable, a3);
    int v9 = 0;
    self->_lastNonGpsReceivedTime.__rep_ = sub_100048550();
    if (!self->_serviceLocalizer.__ptr_.__value_) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_lastGpsPositionAvailable, a3);
  self->_lastGpsReceivedTime.__rep_ = sub_100048550();
  if (qword_10047BEF8 == -1)
  {
    int v7 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  int v7 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_6:
    int64_t rep = self->_lastGpsReceivedTime.__rep_;
    *(_DWORD *)std::string buf = 134217984;
    *(void *)&uint8_t buf[4] = rep;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Updated last available GPS estimate. New estimate's timestamp: %llu", buf, 0xCu);
  }
LABEL_7:
  int v9 = 1;
  if (!self->_serviceLocalizer.__ptr_.__value_) {
    goto LABEL_13;
  }
LABEL_10:
  if ([(CLIndoorProvider *)self localizationStarted])
  {
    long long v53 = 0u;
    memset(v54, 0, sizeof(v54));
    long long v51 = 0u;
    long long v52 = 0u;
    memset(v50, 0, sizeof(v50));
    if (v6)
    {
      [v6 gpsLocation];
      long long v86 = 0u;
      long long v85 = 0u;
      long long v84 = 0u;
      long long v83 = 0u;
      long long v82 = 0u;
      long long v81 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      *(_OWORD *)std::string buf = 0u;
      long long v56 = 0u;
      [v6 gpsLocationPrivate];
    }
    else
    {
      bzero(buf, 0x230uLL);
    }
    sub_100016A80((uint64_t)v46);
    sub_10009E67C((uint64_t)v31);
    v45 |= 1u;
    uint64_t v11 = v32;
    if (!v32) {
      operator new();
    }
    *(_DWORD *)(v32 + 52) |= 1u;
    v45 |= 1u;
    *(_DWORD *)(v11 + 52) |= 2u;
    *(_OWORD *)(v11 + 16) = v47;
    v45 |= 1u;
    uint64_t v12 = v48;
    *(_DWORD *)(v11 + 52) |= 4u;
    *(void *)(v11 + 32) = v12;
    v45 |= 1u;
    uint64_t v13 = v49;
    *(_DWORD *)(v11 + 52) |= 8u;
    *(void *)(v11 + 40) = v13;
    int v14 = v45;
    long long v33 = *(_OWORD *)((char *)v50 + 4);
    int v41 = DWORD1(v51);
    int v34 = v52;
    float64x2_t v42 = vcvtq_f64_f32(*(float32x2_t *)((char *)&v57 + 8));
    v45 |= 0x3C10Eu;
    double v43 = *(float *)&v58;
    long long v39 = *(_OWORD *)((char *)&v50[3] + 12);
    long long v40 = *(_OWORD *)((char *)&v50[2] + 12);
    uint64_t v38 = *(void *)((char *)&v50[1] + 4);
    uint64_t v36 = *(void *)((char *)&v50[1] + 12);
    if (!v9)
    {
      int v16 = v14 | 0x3DF6E;
      int v17 = 1;
LABEL_27:
      int v35 = v17;
      uint64_t v37 = *(void *)((char *)&v50[2] + 4);
      int v45 = v16 | 0x40080;
      uint64_t v18 = v44;
      if (!v44) {
        operator new();
      }
      int v19 = v87;
      *(_DWORD *)(v44 + 24) |= 1u;
      *(_DWORD *)(v18 + 16) = v19;
      sub_1000A064C((uint64_t)&v26, 1, (uint64_t)v46, (uint64_t)v31);
      id v20 = operator new(0x108uLL);
      v20[1] = 0;
      v20[2] = 0;
      *id v20 = off_100454870;
      v20[4] = v26;
      *((_DWORD *)v20 + 10) = v27;
      sub_10001D800((uint64_t)(v20 + 6), (uint64_t)v28);
      sub_100018854((uint64_t)(v20 + 26), (uint64_t)v30);
      *((_DWORD *)v20 + 6) = 20;
      v24 = (char *)(v20 + 3);
      long long v25 = (std::__shared_weak_count *)v20;
      std::string v21 = (uint64_t *)(*(uint64_t (**)(LocalizerApi *))(*(void *)self->_serviceLocalizer.__ptr_.__value_
                                                                 + 120))(self->_serviceLocalizer.__ptr_.__value_);
      sub_100041DEC(*v21, (uint64_t)&v24);
      ptr = self->_sensorLogger.__ptr_;
      if (ptr && self->_localizationActive) {
        sub_10000AB54((uint64_t)ptr);
      }
      char v23 = v25;
      if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
      sub_1000428B0((uint64_t)v30);
      sub_100042F7C(v28);
      sub_100042F7C(v31);
      sub_1000428B0((uint64_t)v46);
      goto LABEL_36;
    }
    if (DWORD2(v74) == 1)
    {
      int v15 = v14 | 0x3DF6E;
      int v35 = 1;
    }
    else
    {
      int v15 = v14 | 0x3DF2E;
      if (DWORD2(v74) != 2) {
        goto LABEL_26;
      }
    }
    v15 |= 0x40u;
    int v35 = 2;
LABEL_26:
    int v17 = 0;
    int v16 = v15 | 0x40;
    goto LABEL_27;
  }
LABEL_13:
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    int v10 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_36;
    }
    goto LABEL_15;
  }
  int v10 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_15:
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Not passing the GPS estimate to the PF or the logger since we are not localizing yet", buf, 2u);
  }
LABEL_36:
}

- (void)outdoorLocationAvailable:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastOutdoorPositionAvailable, a3);
  long long v48 = 0u;
  memset(v49, 0, 28);
  long long v46 = 0u;
  *(_OWORD *)__val = 0u;
  long long v45 = 0u;
  memset(v44, 0, sizeof(v44));
  if (self->_lastOutdoorPositionAvailable)
  {
    [(CLGpsPosition *)self->_lastOutdoorPositionAvailable gpsLocation];
    char v6 = v43;
    double v7 = *(double *)((char *)v44 + 4);
  }
  else
  {
    double v7 = 0.0;
  }
  std::string::size_type v41 = 0;
  std::string::size_type v42 = 0;
  long long v40 = off_10045DAB8;
  char v43 = v6 & 0xFC;
  sub_100076484((uint64_t)&v40, v7);
  sub_10007647C((uint64_t)&v40, *(double *)((char *)v44 + 12));
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  char v8 = (id)qword_10047BF00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    std::string::size_type v10 = v41;
    std::string::size_type v9 = v42;
    int v11 = __val[0];
    value = self->_serviceLocalizer.__ptr_.__value_;
    unsigned int v13 = [(CLIndoorProvider *)self localizationStarted];
    LODWORD(buf.__r_.__value_.__l.__data_) = 134284545;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v10;
    if (v13) {
      int v14 = 1;
    }
    else {
      int v14 = 2;
    }
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2049;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v9;
    HIWORD(buf.__r_.__value_.__r.__words[2]) = 1026;
    LODWORD(v51) = v11;
    WORD2(v51) = 1026;
    *(_DWORD *)((char *)&v51 + 6) = value != 0;
    WORD5(v51) = 1026;
    HIDWORD(v51) = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[CLIndoorProvider] We just got notified about an outdoor position at %{private}.8lf, %{private}.8lf from provider %{public}d, localizing %{public}d, %{public}d", (uint8_t *)&buf, 0x28u);
  }

  if (__val[0] != 10)
  {
    v38[6] = *(_OWORD *)__val;
    v38[7] = v48;
    v39[0] = v49[0];
    *(_OWORD *)((char *)v39 + 12) = *(_OWORD *)((char *)v49 + 12);
    v38[2] = v44[2];
    v38[3] = v44[3];
    v38[4] = v45;
    v38[5] = v46;
    v38[0] = v44[0];
    v38[1] = v44[1];
    [(CLIndoorProvider *)self updateUniverseIfAllowedAndNecessary:v38];
    v30[0] = off_10045DEA8;
    memset(&v30[1], 0, 24);
    v30[4] = off_10045DAB8;
    v30[5] = 0;
    v30[6] = 0;
    v31 &= 0xFCu;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v36 = 0;
    v37 &= 0xF800u;
    uint64_t v15 = sub_100042EE0();
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
    v28[1] = 0;
    v28[2] = 0;
    v28[0] = off_10045DAB8;
    v29 &= 0xFCu;
    sub_100076484((uint64_t)v28, *(double *)((char *)v44 + 4));
    sub_10007647C((uint64_t)v28, *(double *)((char *)v44 + 12));
    sub_100041B18((uint64_t)v30, v15);
    sub_100041B20((uint64_t)v30, rep);
    sub_100041EB0((uint64_t)v30, v15);
    sub_100041EB8((uint64_t)v30, (uint64_t)v28);
    sub_100041DC4((uint64_t)v30, *(double *)((char *)&v44[1] + 12));
    sub_100041DD8((uint64_t)v30, *(double *)((char *)&v44[2] + 12));
    sub_100041D40((uint64_t)v30, *(double *)((char *)&v44[1] + 4));
    std::to_string(&buf, __val[0]);
    sub_100041D90((uint64_t)v30, &buf);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(buf.__r_.__value_.__l.__data_);
      if (v5) {
        goto LABEL_14;
      }
    }
    else if (v5)
    {
LABEL_14:
      [v5 gpsLocationPrivate];
      float v17 = *(float *)&v52;
      goto LABEL_17;
    }
    bzero(&buf, 0x230uLL);
    float v17 = 0.0;
LABEL_17:
    sub_100041D7C((uint64_t)v30, v17);
    if (v5)
    {
      [v5 gpsLocationPrivate];
      float v18 = *((float *)&v52 + 1);
    }
    else
    {
      bzero(&buf, 0x230uLL);
      float v18 = 0.0;
    }
    sub_100041D68((uint64_t)v30, v18);
    if (v5)
    {
      [v5 gpsLocationPrivate];
      float v19 = v53;
    }
    else
    {
      bzero(&buf, 0x230uLL);
      float v19 = 0.0;
    }
    sub_100041D54((uint64_t)v30, v19);
    if (!self->_serviceLocalizer.__ptr_.__value_
      || ![(CLIndoorProvider *)self localizationStarted])
    {
LABEL_32:
      ptr = self->_sensorLogger.__ptr_;
      if (ptr && self->_localizationActive) {
        sub_100041C44((uint64_t)ptr, (uint64_t)v30);
      }
      if (self->_deferredState.m_initialized)
      {
        long long v25 = [(CLIndoorProvider *)self xpcConnection];
        if (v25)
        {
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)objc_retain(*(id *)((char *)&self->_deferredState.m_storage.dummy_.aligner_
                                                                                       + 7));
          buf.__r_.__value_.__s.__data_[8] = 0;
          if (self->_anon_11[7])
          {
            buf.__r_.__value_.__r.__words[2] = (std::string::size_type)*(id *)&self->_anon_11[15];
            if ((char)self->_anon_11[46] < 0)
            {
              sub_1000559FC(&v51, *(void **)&self->_anon_11[23], *(void *)&self->_anon_11[31]);
            }
            else
            {
              long long v51 = *(_OWORD *)&self->_anon_11[23];
              uint64_t v52 = *(void *)&self->_anon_11[39];
            }
            buf.__r_.__value_.__s.__data_[8] = 1;
          }
          if (self->_deferredState.m_initialized)
          {
            if (self->_anon_11[7])
            {
              sub_100091F70((uint64_t)&self->_anon_11[15]);
              self->_anon_11[7] = 0;
            }

            self->_deferredState.m_initialized = 0;
          }
          if (buf.__r_.__value_.__r.__words[0]) {
            -[CLIndoorProvider playbackDatarun:](self, "playbackDatarun:");
          }
          if (buf.__r_.__value_.__s.__data_[8])
          {
            if (!self->_lastOutdoorPositionAvailable
              || (-[CLIndoorProvider startUpdatingLocationDeferred:](self, "startUpdatingLocationDeferred:"),
                  buf.__r_.__value_.__s.__data_[8]))
            {
              sub_100091F70((uint64_t)&buf.__r_.__value_.__r.__words[2]);
              buf.__r_.__value_.__s.__data_[8] = 0;
            }
          }
        }
      }
      nullsub_15(v28);
      sub_100041664((uint64_t)v30);
      goto LABEL_55;
    }
    if (qword_10047BEF8 == -1)
    {
      id v20 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      id v20 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
      {
LABEL_28:
        sub_100041D24();
        std::string v21 = operator new(0x108uLL);
        v21[1] = 0;
        v21[2] = 0;
        *std::string v21 = off_100454870;
        sub_1000417D0(v21 + 4, &buf);
        *((_DWORD *)v21 + 6) = 9;
        uint64_t v26 = (char *)(v21 + 3);
        int v27 = (std::__shared_weak_count *)v21;
        std::runtime_error v22 = (uint64_t *)(*(uint64_t (**)(LocalizerApi *))(*(void *)self->_serviceLocalizer.__ptr_.__value_
                                                                   + 120))(self->_serviceLocalizer.__ptr_.__value_);
        sub_100041DEC(*v22, (uint64_t)&v26);
        char v23 = v27;
        if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
        sub_100041664((uint64_t)&buf);
        goto LABEL_32;
      }
    }
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Ignoring outdoor position estimate - not localizing yet", (uint8_t *)&buf, 2u);
    goto LABEL_28;
  }
LABEL_55:
  nullsub_15(&v40);
}

- (BOOL)localizationStarted
{
  return self->_localizationStarted;
}

- (void)updateUniverseIfAllowedAndNecessary:(id *)a3
{
  if (!self->_serviceLocalizer.__ptr_.__value_ || ![(CLIndoorProvider *)self localizationStarted])
  {
    if (qword_10047BEF8 == -1)
    {
      char v8 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      char v8 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        return;
      }
    }
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[CLIndoorProvider] Localizer is not running, ignoring request to updateUniverse", (uint8_t *)&buf, 2u);
    return;
  }
  if (!self->_indoorUniverse)
  {
    sub_1000AE4B0(__p, "");
    sub_1002AAB0C("IndoorUniverse not initialzied prior to requesting update.", &buf);
    sub_10016A2C4((uint64_t)__p, (uint64_t)&buf, 1);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    sub_1000D11E0((uint64_t)&v11);
  }
  uint64_t v5 = sub_100048550();
  indoorUniverse = self->_indoorUniverse;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_10038A014;
  v9[3] = &unk_10046B200;
  double v7 = self;
  std::string::size_type v10 = v7;
  [(CLIndoorUniverse *)indoorUniverse updateLocalizerUniverseIfAllowed:v5 fromLocation:a3 withUniverseUpdatedHandler:v9];
}

- (id)locationRequests:(id)a3 usingAvailabilityTile:(const void *)a4 forAction:(unsigned __int8)a5
{
  int v73 = a5;
  id v5 = a3;
  id v82 = +[NSMutableArray array];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = v5;
  id v77 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
  if (v77)
  {
    char v87 = 0;
    uint64_t v75 = *(void *)v102;
    while (1)
    {
      for (i = 0; i != v77; i = (char *)i + 1)
      {
        if (*(void *)v102 != v75) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v101 + 1) + 8 * i);
        id v83 = v6;
        if (v6)
        {
          [v6 ps_STLString];
        }
        else
        {
          __s1 = 0;
          size_t __n = 0;
          uint64_t v100 = 0;
        }
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v79 = *((id *)a4 + 1);
        id v7 = [v79 countByEnumeratingWithState:&v94 objects:v110 count:16];
        if (!v7)
        {
          uint64_t v85 = 0;
          uint64_t v86 = 0;
          goto LABEL_92;
        }
        uint64_t v85 = 0;
        uint64_t v86 = 0;
        uint64_t v81 = *(void *)v95;
        do
        {
          id v80 = v7;
          for (j = 0; j != v80; j = (char *)j + 1)
          {
            if (*(void *)v95 != v81) {
              objc_enumerationMutation(v79);
            }
            id v9 = *(id *)(*((void *)&v94 + 1) + 8 * (void)j);
            id v88 = v9;
            if (v9)
            {
              [v9 getGroupId];
              uint64_t v10 = HIBYTE(v93);
              uint64_t v11 = v92;
            }
            else
            {
              uint64_t v11 = 0;
              uint64_t v10 = 0;
              __p = 0;
              uint64_t v92 = 0;
              uint64_t v93 = 0;
            }
            uint64_t v12 = HIBYTE(v100);
            if (v100 >= 0) {
              size_t v13 = HIBYTE(v100);
            }
            else {
              size_t v13 = __n;
            }
            int v14 = (char)v10;
            if ((v10 & 0x80u) != 0) {
              uint64_t v10 = v11;
            }
            if (v13 != v10) {
              goto LABEL_38;
            }
            if (v14 >= 0) {
              p_p = (unsigned __int8 *)&__p;
            }
            else {
              p_p = (unsigned __int8 *)__p;
            }
            if (v100 < 0)
            {
              if (memcmp(__s1, p_p, __n)) {
                goto LABEL_38;
              }
            }
            else if (HIBYTE(v100))
            {
              p_s1 = &__s1;
              while (*(unsigned __int8 *)p_s1 == *p_p)
              {
                p_s1 = (void **)((char *)p_s1 + 1);
                ++p_p;
                if (!--v12) {
                  goto LABEL_33;
                }
              }
LABEL_38:
              char v18 = 1;
              if ((SHIBYTE(v93) & 0x80000000) == 0) {
                goto LABEL_40;
              }
LABEL_39:
              operator delete(__p);
              goto LABEL_40;
            }
LABEL_33:
            if (![(CLIndoorProvider *)self isRegionalEnabled]
              && [v88 locationContext] == (id)1)
            {
              if (qword_10047BEF8 == -1)
              {
                float v17 = qword_10047BF00;
                if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_38;
                }
              }
              else
              {
                dispatch_once(&qword_10047BEF8, &stru_10046B230);
                float v17 = qword_10047BF00;
                if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_38;
                }
              }
              *(_WORD *)std::string buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "locationRequests include not allowed regional tile", buf, 2u);
              goto LABEL_38;
            }
            float v19 = (uint64_t *)[v88 getLocationIds];
            if (qword_10047BEF8 != -1) {
              dispatch_once(&qword_10047BEF8, &stru_10046B230);
            }
            id v20 = (id)qword_10047BF00;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              std::string v21 = &__p;
              if (v93 < 0) {
                std::string v21 = __p;
              }
              unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v19[1] - *v19) >> 3);
              *(_DWORD *)std::string buf = 136380931;
              *(void *)v106 = v21;
              *(_WORD *)&v106[8] = 2050;
              *(void *)&v106[10] = v22;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "TileLookup, groupId, %{private}s, %{public}lu", buf, 0x16u);
            }

            uint64_t v24 = *v19;
            uint64_t v23 = v19[1];
            if (v23 != *v19)
            {
              uint64_t v25 = 0;
              for (unint64_t k = 0; k < 0xAAAAAAAAAAAAAAABLL * ((v23 - v24) >> 3); ++k)
              {
                int v27 = (unsigned char *)(v24 + v25);
                if (*(char *)(v24 + v25 + 23) < 0)
                {
                  if (**(unsigned char **)v27 == 76)
                  {
LABEL_56:
                    char v29 = (unsigned char *)(v24 + v25);
                    if ((char)v27[23] < 0) {
                      char v29 = *(unsigned char **)v27;
                    }
                    v30 = +[NSString stringWithUTF8String:v29];
                    char v31 = [v30 substringFromIndex:1];

                    if ((char)v27[23] < 0)
                    {
                      uint64_t v34 = *(void *)(v24 + v25 + 8);
                      if (!v34) {
LABEL_132:
                      }
                        sub_10018E31C();
                      int v27 = *(unsigned char **)v27;
                      size_t v33 = v34 - 1;
                      if ((unint64_t)(v34 - 1) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_133:
                      }
                        sub_1000A6968();
                    }
                    else
                    {
                      uint64_t v32 = v27[23];
                      if (!v27[23]) {
                        goto LABEL_132;
                      }
                      size_t v33 = v32 - 1;
                      if ((unint64_t)(v32 - 1) >= 0x7FFFFFFFFFFFFFF8) {
                        goto LABEL_133;
                      }
                    }
                    if (v33 >= 0x17)
                    {
                      uint64_t v36 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
                      if ((v33 | 7) != 0x17) {
                        uint64_t v36 = v33 | 7;
                      }
                      uint64_t v37 = v36 + 1;
                      long long v35 = (void **)operator new(v36 + 1);
                      __dst[1] = (void *)v33;
                      int64_t v90 = v37 | 0x8000000000000000;
                      __dst[0] = v35;
                    }
                    else
                    {
                      HIBYTE(v90) = v33;
                      long long v35 = __dst;
                      if (!v33)
                      {
LABEL_71:
                        *((unsigned char *)v35 + v33) = 0;
                        ptr = self->_fsDb.__ptr_;
                        sub_100085B24(buf, (uint64_t)__dst);
                        uint64_t v39 = (*(uint64_t (**)(ITileDb *, uint8_t *))(*(void *)ptr + 64))(ptr, buf);
                        long long v40 = *(std::__shared_weak_count **)&v106[4];
                        if (*(void *)&v106[4]
                          && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v106[4] + 8), 0xFFFFFFFFFFFFFFFFLL))
                        {
                          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
                          std::__shared_weak_count::__release_weak(v40);
                        }
                        id v41 = [v88 allowCellularDownload:k];
                        std::string::size_type v42 = [CLPrefetchFloorRequest alloc];
                        char v43 = +[NSDate date];
                        uint64_t v44 = -[CLPrefetchFloorRequest initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:](v42, "initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:", v31, v83, v43, v39, v41, [v88 locationContext]);

                        [v82 addObject:v44];
                        unsigned __int8 v45 = +[CLLocationContextUtil isIndoor:[(CLPrefetchFloorRequest *)v44 locationContext]];
                        if (qword_10047BEF8 != -1) {
                          dispatch_once(&qword_10047BEF8, &stru_10046B230);
                        }
                        v87 |= v45;
                        long long v46 = (id)qword_10047BF00;
                        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                        {
                          long long v47 = __dst;
                          if (v90 < 0) {
                            long long v47 = (void **)__dst[0];
                          }
                          long long v48 = &__p;
                          if (v93 < 0) {
                            long long v48 = __p;
                          }
                          *(_DWORD *)std::string buf = 136381443;
                          *(void *)v106 = v47;
                          *(_WORD *)&v106[8] = 2081;
                          *(void *)&v106[10] = v48;
                          __int16 v107 = 1026;
                          *(_DWORD *)v108 = v87 & 1;
                          *(_WORD *)&v108[4] = 1026;
                          *(_DWORD *)&v108[6] = v39;
                          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "TileLookup, locationId, %{private}s, groupId, %{private}s,  containsIndoorRequest, %{public}d, completeFloor, %{public}d", buf, 0x22u);
                        }

                        if (SHIBYTE(v90) < 0) {
                          operator delete(__dst[0]);
                        }

                        v85 += v39;
                        v86 += v39 ^ 1;
                        uint64_t v24 = *v19;
                        uint64_t v23 = v19[1];
                        goto LABEL_51;
                      }
                    }
                    memmove(v35, v27 + 1, v33);
                    goto LABEL_71;
                  }
                }
                else if (*(unsigned char *)(v24 + v25) == 76)
                {
                  goto LABEL_56;
                }
LABEL_51:
                v25 += 24;
              }
            }
            char v18 = 0;
            if (SHIBYTE(v93) < 0) {
              goto LABEL_39;
            }
LABEL_40:

            if ((v18 & 1) == 0) {
              goto LABEL_92;
            }
          }
          id v7 = [v79 countByEnumeratingWithState:&v94 objects:v110 count:16];
        }
        while (v7);
LABEL_92:

        if ([v82 count])
        {
          if (qword_10047BEF8 != -1) {
            dispatch_once(&qword_10047BEF8, &stru_10046B230);
          }
          uint64_t v49 = (id)qword_10047BF00;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            id v50 = [v82 count];
            id v51 = [v83 UTF8String];
            *(_DWORD *)std::string buf = 134218755;
            *(void *)v106 = v50;
            *(_WORD *)&v106[8] = 2081;
            *(void *)&v106[10] = v51;
            __int16 v107 = 2048;
            *(void *)v108 = v85;
            *(_WORD *)&v108[8] = 2048;
            uint64_t v109 = v86;
            uint64_t v52 = v49;
            os_log_type_t v53 = OS_LOG_TYPE_INFO;
            long long v54 = "Found %lu floors in availability tile for %{private}s, found %zu floors with data already, %zu floors without data";
            uint32_t v55 = 42;
            goto LABEL_101;
          }
        }
        else
        {
          if (qword_10047BEF8 != -1) {
            dispatch_once(&qword_10047BEF8, &stru_10046B230);
          }
          uint64_t v49 = (id)qword_10047BF00;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            id v56 = [v83 UTF8String];
            *(_DWORD *)std::string buf = 136380675;
            *(void *)v106 = v56;
            uint64_t v52 = v49;
            os_log_type_t v53 = OS_LOG_TYPE_ERROR;
            long long v54 = "Couldn't find any floors within %{private}s in availability tile.";
            uint32_t v55 = 12;
LABEL_101:
            _os_log_impl((void *)&_mh_execute_header, v52, v53, v54, buf, v55);
          }
        }

        if (SHIBYTE(v100) < 0) {
          operator delete(__s1);
        }
      }
      id v77 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
      if (!v77) {
        goto LABEL_108;
      }
    }
  }
  char v87 = 0;
LABEL_108:

  long long v57 = sub_10009C7B8();
  long long v58 = v57;
  unsigned __int8 v59 = atomic_load((unsigned __int8 *)v57 + 20);
  if ((v59 & 1) != 0 || *((unsigned char *)v57 + 16))
  {
    if (*((unsigned char *)v57 + 17)) {
      goto LABEL_111;
    }
LABEL_118:
    if (v73 != 0 || (v87 & 1) == 0) {
      goto LABEL_125;
    }
    long long v60 = [v82 indexesOfObjectsPassingTest:&stru_10046B188];
    id v65 = [v60 count];
    if (qword_10047BEF8 == -1)
    {
      long long v66 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_124;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      long long v66 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_124;
      }
    }
    long long v67 = "s";
    if (v65 == (id)1) {
      long long v67 = "";
    }
    *(_DWORD *)std::string buf = 134218242;
    *(void *)v106 = v65;
    *(_WORD *)&v106[8] = 2080;
    *(void *)&v106[10] = v67;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "Ignoring %lu Regional tile %s", buf, 0x16u);
    goto LABEL_124;
  }
  BOOL v64 = sub_100059C20((uint64_t)v57, (unsigned char *)v57 + 9);
  *((unsigned char *)v58 + 17) = v64;
  *((unsigned char *)v58 + 16) = 1;
  atomic_store(1u, (unsigned __int8 *)v58 + 20);
  if (!v64) {
    goto LABEL_118;
  }
LABEL_111:
  long long v60 = [v82 indexesOfObjectsPassingTest:&stru_10046B168];
  id v61 = [v60 count];
  if (qword_10047BEF8 == -1)
  {
    long long v62 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
    {
LABEL_113:
      long long v63 = "s";
      if (v61 == (id)1) {
        long long v63 = "";
      }
      *(_DWORD *)std::string buf = 134218242;
      *(void *)v106 = v61;
      *(_WORD *)&v106[8] = 2080;
      *(void *)&v106[10] = v63;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "Ignoring %lu Indoor tile %s", buf, 0x16u);
    }
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    long long v62 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_113;
    }
  }
LABEL_124:
  [v82 removeObjectsAtIndexes:v60];

LABEL_125:
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  long long v68 = (id)qword_10047BF00;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    id v69 = [*((id *)a4 + 1) count];
    id v70 = [obj count];
    id v71 = [v82 count];
    *(_DWORD *)std::string buf = 134349568;
    *(void *)v106 = v69;
    *(_WORD *)&v106[8] = 2050;
    *(void *)&v106[10] = v70;
    __int16 v107 = 2050;
    *(void *)v108 = v71;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "@TileLookup, avlVenues, %{public}lu, groupIds, %{public}lu, requested, %{public}lu", buf, 0x20u);
  }

  return v82;
}

- (BOOL)isRegionalEnabled
{
  return self->_isRegionalEnabled;
}

- (void)onQueueRecordInputEventMetrics:(const void *)a3
{
}

- (void)startLocalizer
{
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  v3 = (id)qword_10047BF00;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startLocalizer", buf, 2u);
  }

  if (self->_simulation.m_initialized)
  {
    if (qword_10047BEF8 == -1)
    {
      id v4 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_9:
        (*(void (**)(LocalizerApi *, void))(*(void *)self->_serviceLocalizer.__ptr_.__value_ + 24))(self->_serviceLocalizer.__ptr_.__value_, 0);
        goto LABEL_267;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      id v4 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
    }
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "simulating estimation via event playback", buf, 2u);
    goto LABEL_9;
  }
  if (!self->_sensorLogger.__ptr_) {
    goto LABEL_263;
  }
  sub_10009D184((uint64_t)buf);
  sub_10001D078((uint64_t)buf, (uint64_t)&buf[16], &v84);
  std::string v91 = v84;
  memset(&v84, 0, sizeof(v84));
  if ((buf[39] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[16]);
  }
  *(void *)std::string buf = sub_10009D144();
  *(void *)&buf[8] = v5;
  if (sub_100059C20((uint64_t)buf, &buf[9]))
  {
    char v89 = 4;
    strcpy((char *)v88, "logs");
    if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0) {
      sub_1000559FC(&__p, v91.__r_.__value_.__l.__data_, v91.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v91;
    }
    sub_1000512AC(&__p, (uint64_t)v88);
    memset(&v84, 0, sizeof(v84));
    sub_100056B28((const char *)&__p, (uint64_t)&v84, &v108);
    if ((v84.__r_.__value_.__s.__data_[16] & 1) == 0
      || v84.__r_.__value_.__r.__words[2] == 1 && !LODWORD(v84.__r_.__value_.__l.__data_))
    {
      if (v108 == 3)
      {
        *(void *)std::string buf = sub_10009D114();
        *(void *)&buf[8] = v6;
        int v7 = sub_100058BC0((uint64_t)buf, (unsigned int *)&buf[12]);
        *(void *)std::string buf = std::chrono::system_clock::now().__d_.__rep_ - 86400000000 * v7;
        time_t v81 = std::chrono::system_clock::to_time_t((const std::chrono::system_clock::time_point *)buf);
        v105 = 0;
        sub_100056568((dirent **)&v105, (uint64_t)&__p, 0, 0);
        long long v104 = 0;
        sub_100056344(&v105, &v104, &v106);
        char v8 = v104;
        if (v104 && atomic_fetch_add(v104, 0xFFFFFFFF) == 1)
        {
          sub_10005623C((DIR **)v8 + 6, (void **)v8 + 7, buf);
          if (*((char *)v8 + 31) < 0) {
            operator delete(*((void **)v8 + 1));
          }
          operator delete();
        }
        id v9 = v105;
        if (v105 && atomic_fetch_add(v105, 0xFFFFFFFF) == 1)
        {
          sub_10005623C((DIR **)v9 + 6, (void **)v9 + 7, buf);
          if (*((char *)v9 + 31) < 0) {
            operator delete(*((void **)v9 + 1));
          }
          operator delete();
        }
        long long v101 = 0;
        long long v102 = 0;
        uint64_t v103 = 0;
        uint64_t v100 = v106;
        if (v106) {
          atomic_fetch_add(v106, 1u);
        }
        v99 = v107;
        if (v107) {
          atomic_fetch_add(v107, 1u);
        }
        sub_1000985DC(&v100, &v99, (uint64_t)&v101);
        uint64_t v10 = v99;
        if (v99 && atomic_fetch_add(v99, 0xFFFFFFFF) == 1)
        {
          sub_10005623C((DIR **)v10 + 6, (void **)v10 + 7, buf);
          if (*((char *)v10 + 31) < 0) {
            operator delete(*((void **)v10 + 1));
          }
          operator delete();
        }
        uint64_t v11 = v100;
        if (v100 && atomic_fetch_add(v100, 0xFFFFFFFF) == 1)
        {
          sub_10005623C((DIR **)v11 + 6, (void **)v11 + 7, buf);
          if (*((char *)v11 + 31) < 0) {
            operator delete(*((void **)v11 + 1));
          }
          operator delete();
        }
        unint64_t v12 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((v102 - v101) >> 3));
        if (v102 == v101) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = v12;
        }
        sub_1000999C0((unint64_t)v101, (unint64_t)v102, (uint64_t)buf, v13, 1);
        *(void *)std::string buf = sub_10009D104();
        *(void *)&buf[8] = v14;
        int v80 = sub_100058BC0((uint64_t)buf, (unsigned int *)&buf[12]);
        *(void *)std::string buf = sub_10009D0E4();
        *(void *)&buf[8] = v15;
        int v78 = sub_100058BC0((uint64_t)buf, (unsigned int *)&buf[12]);
        if (qword_10047BEF8 != -1) {
          dispatch_once(&qword_10047BEF8, &stru_10046B230);
        }
        int v16 = (id)qword_10047BF00;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          p_p = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)std::string buf = 136315906;
          *(void *)&uint8_t buf[4] = p_p;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v80;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v78;
          *(_WORD *)&buf[24] = 2048;
          *(void *)&buf[26] = v81;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "tracesDirectory,%s,maxNumberOfTraces,%d,maxDirectorySizeBytes,%d,traceTimeFloor,%ld", buf, 0x22u);
        }

        uint64_t v19 = (uint64_t)v101;
        unint64_t v83 = (unint64_t)v102;
        if (v101 != v102)
        {
          int v79 = 0;
          int v82 = 0;
          *(void *)&long long v18 = 136315138;
          long long v77 = v18;
          while (1)
          {
            sub_100056AA4(v19, &v84, &v98);
            if ((v84.__r_.__value_.__s.__data_[16] & 1) == 0) {
              break;
            }
            if (v84.__r_.__value_.__r.__words[2] == 1 && LODWORD(v84.__r_.__value_.__l.__data_) == 0) {
              break;
            }
            if (qword_10047BEF8 == -1)
            {
              std::string v21 = qword_10047BF00;
              if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
                goto LABEL_59;
              }
            }
            else
            {
              dispatch_once(&qword_10047BEF8, &stru_10046B230);
              std::string v21 = qword_10047BF00;
              if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
                goto LABEL_59;
              }
            }
            uint64_t v22 = v19;
            if (*(char *)(v19 + 23) < 0) {
              uint64_t v22 = *(void *)v19;
            }
            int data = (int)v84.__r_.__value_.__l.__data_;
            if (v84.__r_.__value_.__r.__words[2] == 1) {
              int data = LODWORD(v84.__r_.__value_.__l.__data_) + 1000 * (v84.__r_.__value_.__l.__size_ % 0x1FFFF7);
            }
            *(_DWORD *)std::string buf = 136315394;
            *(void *)&uint8_t buf[4] = v22;
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = data;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "bad trace path,%s,ec,%d", buf, 0x12u);
LABEL_59:
            v19 += 40;
            if (v19 == v83)
            {
              uint64_t v19 = (uint64_t)v101;
              goto LABEL_229;
            }
          }
          if (LODWORD(v98) != 3)
          {
            if (qword_10047BEF8 == -1)
            {
              uint64_t v26 = qword_10047BF00;
              if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
                goto LABEL_59;
              }
            }
            else
            {
              dispatch_once(&qword_10047BEF8, &stru_10046B230);
              uint64_t v26 = qword_10047BF00;
              if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
                goto LABEL_59;
              }
            }
            *(_WORD *)std::string buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "trace is not a directory", buf, 2u);
            goto LABEL_59;
          }
          __darwin_time_t v24 = sub_1000557A4(v19, &v84);
          if ((v84.__r_.__value_.__s.__data_[16] & 1) != 0
            && ((uint64_t v25 = v24, v84.__r_.__value_.__r.__words[2] != 1) || LODWORD(v84.__r_.__value_.__l.__data_)))
          {
            if (qword_10047BEF8 != -1) {
              dispatch_once(&qword_10047BEF8, &stru_10046B230);
            }
            int v27 = (id)qword_10047BF00;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)std::string buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "could not get last write time of trace directory", buf, 2u);
            }
          }
          else
          {
            uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
          }
          long long v95 = 0;
          sub_100056568((dirent **)&v95, v19, 0, 0);
          long long v94 = 0;
          sub_100056344(&v95, &v94, &v96);
          std::string v28 = v94;
          if (v94 && atomic_fetch_add(v94, 0xFFFFFFFF) == 1)
          {
            sub_10005623C((DIR **)v28 + 6, (void **)v28 + 7, buf);
            if (*((char *)v28 + 31) < 0) {
              operator delete(*((void **)v28 + 1));
            }
            operator delete();
          }
          char v29 = v95;
          if (v95 && atomic_fetch_add(v95, 0xFFFFFFFF) == 1)
          {
            sub_10005623C((DIR **)v29 + 6, (void **)v29 + 7, buf);
            if (*((char *)v29 + 31) < 0) {
              operator delete(*((void **)v29 + 1));
            }
            operator delete();
          }
          uint64_t v93 = v96;
          if (v96) {
            atomic_fetch_add((atomic_uint *volatile)v96, 1u);
          }
          uint64_t v92 = v97;
          if (v97)
          {
            atomic_fetch_add(v97, 1u);
            v30 = v92;
          }
          else
          {
            v30 = 0;
          }
          int v31 = 0;
          while (1)
          {
            uint64_t v32 = v93;
            if (v93 == (dirent *)v30)
            {
              if (!v30) {
                goto LABEL_146;
              }
LABEL_137:
              if (atomic_fetch_add(v30, 0xFFFFFFFF) == 1)
              {
                sub_10005623C((DIR **)v30 + 6, (void **)v30 + 7, buf);
                if (*((char *)v30 + 31) < 0) {
                  operator delete(*((void **)v30 + 1));
                }
                operator delete();
              }
LABEL_141:
              id v41 = v93;
              if (v93 && atomic_fetch_add((atomic_uint *volatile)v93, 0xFFFFFFFF) == 1)
              {
                sub_10005623C((DIR **)&v41->d_name[27], (void **)&v41->d_name[35], buf);
                if (v41->d_name[10] < 0) {
                  operator delete((void *)v41->d_seekoff);
                }
                operator delete();
              }
LABEL_146:
              std::string::size_type v42 = v97;
              if (v97 && atomic_fetch_add(v97, 0xFFFFFFFF) == 1)
              {
                sub_10005623C((DIR **)v42 + 6, (void **)v42 + 7, buf);
                if (*((char *)v42 + 31) < 0) {
                  operator delete(*((void **)v42 + 1));
                }
                operator delete();
              }
              char v43 = v96;
              if (v96 && atomic_fetch_add((atomic_uint *volatile)v96, 0xFFFFFFFF) == 1)
              {
                sub_10005623C((DIR **)&v43->d_name[27], (void **)&v43->d_name[35], buf);
                if (v43->d_name[10] < 0) {
                  operator delete((void *)v43->d_seekoff);
                }
                operator delete();
              }
              if (v25 < v81 || v25 == 0x7FFFFFFFFFFFFFFFLL)
              {
                sub_1000B2334(v19, &v84);
                if ((v84.__r_.__value_.__s.__data_[16] & 1) != 0
                  && (v84.__r_.__value_.__r.__words[2] != 1 || LODWORD(v84.__r_.__value_.__l.__data_)))
                {
                  if (qword_10047BEF8 != -1) {
                    dispatch_once(&qword_10047BEF8, &stru_10046B230);
                  }
                  uint64_t v44 = (id)qword_10047BF00;
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v48 = v19;
                    if (*(char *)(v19 + 23) < 0) {
                      uint64_t v48 = *(void *)v19;
                    }
                    int v49 = (int)v84.__r_.__value_.__l.__data_;
                    if (v84.__r_.__value_.__r.__words[2] == 1) {
                      int v49 = LODWORD(v84.__r_.__value_.__l.__data_) + 1000 * (v84.__r_.__value_.__l.__size_ % 0x1FFFF7);
                    }
                    *(_DWORD *)std::string buf = 136315394;
                    *(void *)&uint8_t buf[4] = v48;
                    *(_WORD *)&unsigned char buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v49;
                    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "error deleting trace,%s,ec,%d", buf, 0x12u);
                  }
                }
                else
                {
                  if (qword_10047BEF8 != -1) {
                    dispatch_once(&qword_10047BEF8, &stru_10046B230);
                  }
                  uint64_t v44 = (id)qword_10047BF00;
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v46 = v19;
                    if (*(char *)(v19 + 23) < 0) {
                      uint64_t v46 = *(void *)v19;
                    }
                    *(_DWORD *)std::string buf = 136315394;
                    *(void *)&uint8_t buf[4] = v46;
                    *(_WORD *)&unsigned char buf[12] = 2048;
                    *(void *)&buf[14] = v25;
                    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "deleted due to age,%s,traceTime,%ld", buf, 0x16u);
                  }
                }
              }
              else
              {
                if (v82 < v80)
                {
                  v79 += v31;
                  if (v79 > v78)
                  {
                    sub_1000B2334(v19, &v84);
                    if ((v84.__r_.__value_.__s.__data_[16] & 1) != 0
                      && (v84.__r_.__value_.__r.__words[2] != 1 || LODWORD(v84.__r_.__value_.__l.__data_)))
                    {
                      if (qword_10047BEF8 != -1) {
                        dispatch_once(&qword_10047BEF8, &stru_10046B230);
                      }
                      uint64_t v44 = (id)qword_10047BF00;
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v52 = v19;
                        if (*(char *)(v19 + 23) < 0) {
                          uint64_t v52 = *(void *)v19;
                        }
                        int v53 = (int)v84.__r_.__value_.__l.__data_;
                        if (v84.__r_.__value_.__r.__words[2] == 1) {
                          int v53 = LODWORD(v84.__r_.__value_.__l.__data_)
                        }
                              + 1000 * (v84.__r_.__value_.__l.__size_ % 0x1FFFF7);
                        *(_DWORD *)std::string buf = 136315394;
                        *(void *)&uint8_t buf[4] = v52;
                        *(_WORD *)&unsigned char buf[12] = 1024;
                        *(_DWORD *)&buf[14] = v53;
                        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "error deleting trace,%s,ec,%d", buf, 0x12u);
                      }
                    }
                    else
                    {
                      if (qword_10047BEF8 != -1) {
                        dispatch_once(&qword_10047BEF8, &stru_10046B230);
                      }
                      uint64_t v44 = (id)qword_10047BF00;
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                      {
                        uint64_t v45 = v19;
                        if (*(char *)(v19 + 23) < 0) {
                          uint64_t v45 = *(void *)v19;
                        }
                        *(_DWORD *)std::string buf = v77;
                        *(void *)&uint8_t buf[4] = v45;
                        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "deleted due to size,%s", buf, 0xCu);
                      }
                    }
                    goto LABEL_57;
                  }
LABEL_58:
                  ++v82;
                  goto LABEL_59;
                }
                sub_1000B2334(v19, &v84);
                if ((v84.__r_.__value_.__s.__data_[16] & 1) != 0
                  && (v84.__r_.__value_.__r.__words[2] != 1 || LODWORD(v84.__r_.__value_.__l.__data_)))
                {
                  if (qword_10047BEF8 != -1) {
                    dispatch_once(&qword_10047BEF8, &stru_10046B230);
                  }
                  uint64_t v44 = (id)qword_10047BF00;
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v50 = v19;
                    if (*(char *)(v19 + 23) < 0) {
                      uint64_t v50 = *(void *)v19;
                    }
                    int v51 = (int)v84.__r_.__value_.__l.__data_;
                    if (v84.__r_.__value_.__r.__words[2] == 1) {
                      int v51 = LODWORD(v84.__r_.__value_.__l.__data_) + 1000 * (v84.__r_.__value_.__l.__size_ % 0x1FFFF7);
                    }
                    *(_DWORD *)std::string buf = 136315394;
                    *(void *)&uint8_t buf[4] = v50;
                    *(_WORD *)&unsigned char buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v51;
                    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "error deleting trace,%s,ec,%d", buf, 0x12u);
                  }
                }
                else
                {
                  if (qword_10047BEF8 != -1) {
                    dispatch_once(&qword_10047BEF8, &stru_10046B230);
                  }
                  uint64_t v44 = (id)qword_10047BF00;
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v47 = v19;
                    if (*(char *)(v19 + 23) < 0) {
                      uint64_t v47 = *(void *)v19;
                    }
                    *(_DWORD *)std::string buf = 136315394;
                    *(void *)&uint8_t buf[4] = v47;
                    *(_WORD *)&unsigned char buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v82 + 1;
                    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "deleted due to num traces,%s,num traces,%d", buf, 0x12u);
                  }
                }
              }
LABEL_57:

              goto LABEL_58;
            }
            if (!v93 || !*(void *)&v93->d_name[27])
            {
              if (!v30) {
                goto LABEL_141;
              }
              if (!*((void *)v30 + 6)) {
                goto LABEL_137;
              }
            }
            p_d_seekoff = &v93->d_seekoff;
            int v34 = sub_100055960((uint64_t)&v93->d_seekoff, &v84);
            if ((v84.__r_.__value_.__s.__data_[16] & 1) != 0
              && (v84.__r_.__value_.__r.__words[2] != 1 || LODWORD(v84.__r_.__value_.__l.__data_)))
            {
              break;
            }
            v31 += v34;
LABEL_121:
            __darwin_time_t v38 = sub_1000557A4((uint64_t)&v32->d_seekoff, &v84);
            if ((v84.__r_.__value_.__s.__data_[16] & 1) != 0
              && (v84.__r_.__value_.__r.__words[2] != 1 || LODWORD(v84.__r_.__value_.__l.__data_)))
            {
              if (qword_10047BEF8 != -1) {
                dispatch_once(&qword_10047BEF8, &stru_10046B230);
              }
              uint64_t v39 = (id)qword_10047BF00;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                if (v32->d_name[10] < 0)
                {
                  p_d_seekoff = (__uint64_t *)*p_d_seekoff;
                  int v40 = (int)v84.__r_.__value_.__l.__data_;
                  if (v84.__r_.__value_.__r.__words[2] == 1) {
LABEL_129:
                  }
                    v40 += 1000 * (v84.__r_.__value_.__l.__size_ % 0x1FFFF7);
                }
                else
                {
                  int v40 = (int)v84.__r_.__value_.__l.__data_;
                  if (v84.__r_.__value_.__r.__words[2] == 1) {
                    goto LABEL_129;
                  }
                }
                *(_DWORD *)std::string buf = 136315394;
                *(void *)&uint8_t buf[4] = p_d_seekoff;
                *(_WORD *)&unsigned char buf[12] = 1024;
                *(_DWORD *)&buf[14] = v40;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "could not get last write time of trace file,%s,ec,%d", buf, 0x12u);
              }

              goto LABEL_103;
            }
            if (v38 < v25) {
              uint64_t v25 = v38;
            }
LABEL_103:
            sub_1000551CC(&v93, 0);
          }
          if (qword_10047BEF8 != -1) {
            dispatch_once(&qword_10047BEF8, &stru_10046B230);
          }
          long long v35 = (id)qword_10047BF00;
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
LABEL_120:

            goto LABEL_121;
          }
          __uint64_t v36 = (__uint64_t)&v32->d_seekoff;
          if (v32->d_name[10] < 0)
          {
            __uint64_t v36 = *p_d_seekoff;
            int v37 = (int)v84.__r_.__value_.__l.__data_;
            if (v84.__r_.__value_.__r.__words[2] != 1) {
              goto LABEL_119;
            }
          }
          else
          {
            int v37 = (int)v84.__r_.__value_.__l.__data_;
            if (v84.__r_.__value_.__r.__words[2] != 1)
            {
LABEL_119:
              *(_DWORD *)std::string buf = 136315394;
              *(void *)&uint8_t buf[4] = v36;
              *(_WORD *)&unsigned char buf[12] = 1024;
              *(_DWORD *)&buf[14] = v37;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "could not get size of trace file,%s,ec,%d", buf, 0x12u);
              goto LABEL_120;
            }
          }
          v37 += 1000 * (v84.__r_.__value_.__l.__size_ % 0x1FFFF7);
          goto LABEL_119;
        }
LABEL_229:
        if (v19)
        {
          unint64_t v61 = (unint64_t)v102;
          long long v62 = (void *)v19;
          if (v102 != (unsigned char *)v19)
          {
            do
            {
              if (*(char *)(v61 - 17) < 0) {
                operator delete(*(void **)(v61 - 40));
              }
              v61 -= 40;
            }
            while (v61 != v19);
            long long v62 = v101;
          }
          long long v102 = (unsigned char *)v19;
          operator delete(v62);
        }
        long long v63 = v107;
        if (v107 && atomic_fetch_add(v107, 0xFFFFFFFF) == 1)
        {
          sub_10005623C((DIR **)v63 + 6, (void **)v63 + 7, buf);
          if (*((char *)v63 + 31) < 0) {
            operator delete(*((void **)v63 + 1));
          }
          operator delete();
        }
        BOOL v64 = v106;
        if (v106 && atomic_fetch_add(v106, 0xFFFFFFFF) == 1)
        {
          sub_10005623C((DIR **)v64 + 6, (void **)v64 + 7, buf);
          if (*((char *)v64 + 31) < 0) {
            operator delete(*((void **)v64 + 1));
          }
          operator delete();
        }
        goto LABEL_247;
      }
      if (qword_10047BEF8 != -1)
      {
        dispatch_once(&qword_10047BEF8, &stru_10046B230);
        uint64_t v54 = qword_10047BF00;
        if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
          goto LABEL_247;
        }
        goto LABEL_221;
      }
      uint64_t v54 = qword_10047BF00;
      if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
      {
LABEL_221:
        *(_WORD *)std::string buf = 0;
        uint32_t v55 = "trace path is not a directory";
        id v56 = v54;
        os_log_type_t v57 = OS_LOG_TYPE_ERROR;
        uint32_t v58 = 2;
LABEL_227:
        _os_log_impl((void *)&_mh_execute_header, v56, v57, v55, buf, v58);
      }
LABEL_247:
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v89 < 0) {
        operator delete(v88[0]);
      }
      goto LABEL_251;
    }
    if (qword_10047BEF8 == -1)
    {
      uint64_t v59 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_247;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      uint64_t v59 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_247;
      }
    }
    int v60 = (int)v84.__r_.__value_.__l.__data_;
    if (v84.__r_.__value_.__r.__words[2] == 1) {
      int v60 = LODWORD(v84.__r_.__value_.__l.__data_) + 1000 * (v84.__r_.__value_.__l.__size_ % 0x1FFFF7);
    }
    *(_DWORD *)std::string buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v60;
    uint32_t v55 = "#Warning bad trace directory path,ec,%d";
    id v56 = v59;
    os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
    uint32_t v58 = 8;
    goto LABEL_227;
  }
LABEL_251:
  ptr = self->_platformInfo.__ptr_;
  [(CLIndoorProvider *)self selectedLocation];
  uint64_t v86 = operator new(0x28uLL);
  long long v87 = xmmword_1003EE110;
  strcpy((char *)v86, "purple-loc-indoor-qa@group.apple.com");
  sub_100014D8C((uint64_t)ptr, (uint64_t)&buf[8], (uint64_t)&v86, (uint64_t)&v91, (uint64_t)&v84);
  if (SHIBYTE(v87) < 0) {
    operator delete(v86);
  }
  if (buf[0]) {
    sub_1000748BC(&buf[8]);
  }
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  long long v66 = (id)qword_10047BF00;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    long long v67 = &v84;
    if ((v84.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      long long v67 = (std::string *)v84.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = v67;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "logging trace %s", buf, 0xCu);
  }

  sub_10000FB98(self->_sensorLogger.__ptr_, &v84);
  sub_10000EB40(self->_sensorLogger.__ptr_);
  (*(void (**)(SensorCollection *, uint64_t))(*(void *)self->_localizationSensorCollection.__ptr_ + 24))(self->_localizationSensorCollection.__ptr_, 2);
  if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v91.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_263;
    }
LABEL_280:
    operator delete(v91.__r_.__value_.__l.__data_);
    if (qword_10047BEF8 == -1) {
      goto LABEL_264;
    }
LABEL_281:
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    goto LABEL_264;
  }
  operator delete(v84.__r_.__value_.__l.__data_);
  if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_280;
  }
LABEL_263:
  if (qword_10047BEF8 != -1) {
    goto LABEL_281;
  }
LABEL_264:
  long long v68 = (id)qword_10047BF00;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "starting estimation", buf, 2u);
  }

  value = self->_serviceLocalizer.__ptr_.__value_;
  uint64_t v70 = sub_100048550();
  (*(void (**)(LocalizerApi *, void, uint64_t))(*(void *)value + 16))(value, 0, v70);
LABEL_267:
  [(CLIndoorProvider *)self setLocalizationStarted:1];
  memset(&buf[8], 0, 48);
  long long v110 = 0u;
  long long v111 = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.avgNumOfSelectedLocations = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.numOfIncomingVIOEstimates = 0u;
  long long v71 = *(_OWORD *)&buf[24];
  *(_OWORD *)&self->_localizationSessionMetrics.sessionStartTimeNanos.__rep_ = *(_OWORD *)&buf[8];
  *(_OWORD *)&self->_localizationSessionMetrics.ttffNanos.__rep_ = v71;
  *(_OWORD *)&self->_localizationSessionMetrics.avgHorizontalAccuracy = *(_OWORD *)&buf[40];
  self->_localizationSessionMetrics.sessionStartTimeNanos.__rep_ = sub_100048550();
  [(CLIndoorProvider *)self selectedLocation];
  if (buf[0])
  {
    sub_1000748BC(&buf[8]);
    [(CLIndoorProvider *)self selectedLocation];
    sub_10002B040((uint64_t)&buf[8], (uint64_t)&v84);
    v72.n128_f64[0] = sub_10009FEE4((uint64_t)&self->_localizationSessionMetrics, v85);
    int v73 = (void *)v84.__r_.__value_.__r.__words[2];
    if (v84.__r_.__value_.__r.__words[2])
    {
      do
      {
        long long v74 = v73;
        int v73 = (void *)*v73;
        uint64_t v75 = (std::__shared_weak_count *)v74[3];
        if (v75 && !atomic_fetch_add(&v75->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, __n128))v75->__on_zero_shared)(v75, v72);
          std::__shared_weak_count::__release_weak(v75);
        }
        operator delete(v74);
      }
      while (v73);
    }
    long long v76 = (void *)v84.__r_.__value_.__r.__words[0];
    v84.__r_.__value_.__r.__words[0] = 0;
    if (v76) {
      operator delete(v76);
    }
    if (buf[0]) {
      sub_1000748BC(&buf[8]);
    }
  }
}

- (void)onQueueLocalizeOnSelection:(const void *)a3 withParameterOverrides:(optional<proto::params::LocalizerParameters>)a4
{
  [(CLIndoorProvider *)self selectedLocation];
  if (!buf[0]) {
    goto LABEL_10;
  }
  [(CLIndoorProvider *)self selectedLocation];
  BOOL v6 = sub_10025193C((uint64_t)a3, (uint64_t)v16);
  if ((_BYTE)v15) {
    sub_1000748BC(v16);
  }
  if (buf[0])
  {
    sub_1000748BC(v18);
    if (v6) {
      goto LABEL_6;
    }
LABEL_10:
    if (qword_10047BEF8 == -1)
    {
      char v8 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      char v8 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_13:
        v11[0] = 0;
        uint64_t v9 = *((void *)a3 + 1);
        v12[0] = *(void *)a3;
        v12[1] = v9;
        if (v9) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
        }
        sub_1000771DC((uint64_t)v13, (uint64_t)a3 + 16);
        uint64_t v10 = *((void *)a3 + 8);
        v13[5] = *((void *)a3 + 7);
        v13[6] = v10;
        if (v10) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
        }
        char v14 = *((unsigned char *)a3 + 72);
        v11[0] = 1;
        [(CLIndoorProvider *)self setSelectedLocation:v11];
        if (v11[0])
        {
          sub_1000748BC(v12);
          v11[0] = 0;
        }
        [(CLIndoorProvider *)self setLocalizationStarted:0];
        sub_1000A4488();
      }
    }
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting up localizer", buf, 2u);
    goto LABEL_13;
  }
  if (!v6) {
    goto LABEL_10;
  }
LABEL_6:
  if (qword_10047BEF8 == -1)
  {
    int v7 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
    {
LABEL_8:
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Ignoring request to change to same set of selected venues", buf, 2u);
    }
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    int v7 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
  }
}

- (optional<SelectedLocations>)selectedLocation
{
  v3 = v2;
  unsigned char *v2 = 0;
  if (self->_selectedLocation.m_initialized)
  {
    id v4 = self;
    Class isa = self[1].super.isa;
    *((void *)v3 + 1) = *(void *)((char *)&self->_selectedLocation.m_storage.dummy_.aligner_ + 7);
    *((void *)v3 + 2) = isa;
    if (isa) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)isa + 1, 1uLL, memory_order_relaxed);
    }
    self = (CLIndoorProvider *)sub_1000771DC((uint64_t)(v3 + 24), (uint64_t)&self[1]._deferredState);
    uint64_t v6 = *(void *)&v4[1]._anon_11[39];
    *((void *)v3 + 8) = *(void *)&v4[1]._anon_11[31];
    *((void *)v3 + 9) = v6;
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    v3[80] = v4[1]._floorEnvironmentLoader.__ptr_.__value_;
    unsigned char *v3 = 1;
  }
  result.m_storage.dummy_.data[7] = (char)a2;
  result.m_initialized = (char)self;
  *(_DWORD *)result.m_storage.dummy_.int data = *(_DWORD *)((char *)&self + 1);
  *((_WORD *)&result.m_storage.dummy_.aligner_ + 2) = *(_WORD *)((char *)&self + 5);
  result.m_storage.dummy_.data[6] = HIBYTE(self);
  return result;
}

- (CLIndoorProvider)initWithConnection:(id)a3
{
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)CLIndoorProvider;
  uint64_t v5 = [(CLIndoorProvider *)&v67 init];
  if (!v5) {
    goto LABEL_35;
  }
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  uint64_t v6 = (id)qword_10047BF00;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 serviceName];
    id v8 = [v7 UTF8String];
    unsigned int v9 = [v4 processIdentifier];
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initting w/ NSXPCConnection serviceName = %s pid = %d", buf, 0x12u);
  }
  objc_storeWeak((id *)v5 + 101, v4);
  if (qword_10047BEF8 == -1)
  {
    uint64_t v10 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  uint64_t v10 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_8:
    *(_DWORD *)std::string buf = 134217984;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Creating indoor service provider instance %p", buf, 0xCu);
  }
LABEL_9:
  uint64_t v11 = (void *)*((void *)v5 + 104);
  *((void *)v5 + 104) = 0;

  *(void *)std::string buf = sub_10009D0F4();
  *(void *)&uint8_t buf[8] = v12;
  *((_DWORD *)v5 + 195) = sub_100058BC0((uint64_t)buf, (unsigned int *)&buf[12]);
  *(void *)std::string buf = sub_10009D090();
  *(void *)&uint8_t buf[8] = v13;
  *((_DWORD *)v5 + 197) = sub_100058BC0((uint64_t)buf, (unsigned int *)&buf[12]);
  *(void *)std::string buf = sub_10009D0D4();
  *(void *)&uint8_t buf[8] = v14;
  *((_DWORD *)v5 + 196) = sub_100058BC0((uint64_t)buf, (unsigned int *)&buf[12]);
  *(void *)std::string buf = sub_10009D050();
  *(void *)&uint8_t buf[8] = v15;
  *((_DWORD *)v5 + 198) = sub_100058BC0((uint64_t)buf, (unsigned int *)&buf[12]);
  *(void *)std::string buf = sub_10009D064();
  *(void *)&uint8_t buf[8] = v16;
  *((float *)v5 + 199) = sub_10005BF74((uint64_t)buf, (float *)&buf[12]);
  *(void *)std::string buf = sub_10009D040();
  *(void *)&uint8_t buf[8] = v17;
  *((float *)v5 + 200) = sub_10005BF74((uint64_t)buf, (float *)&buf[12]);
  long long v18 = sub_10009D174();
  sub_1000776C8((uint64_t)v18);
  int v19 = *(_DWORD *)buf;
  sub_100077BC8((uint64_t)buf);
  if (v19 != v19 >> 31)
  {
    *(void *)std::string buf = sub_10009D174();
    *(void *)&uint8_t buf[8] = v23;
    LOBYTE(to) = 0;
    v5[779] = sub_100059C20((uint64_t)buf, &to);
    if (qword_10047BEF8 == -1)
    {
      id v20 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      id v20 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
    }
    int v24 = v5[779];
    *(_DWORD *)std::string buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v24;
    uint64_t v22 = "WARNING: Regional enabled overriden %d";
    goto LABEL_16;
  }
  v5[779] = sub_1000A2EAC();
  if (qword_10047BEF8 == -1)
  {
    id v20 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  id v20 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_12:
    int v21 = v5[779];
    *(_DWORD *)std::string buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v21;
    uint64_t v22 = "Regional enabled %d";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v22, buf, 8u);
  }
LABEL_17:
  uint64_t v25 = sub_100058E7C();
  uint64_t v26 = sub_10009C968();
  int v27 = v26;
  unsigned __int8 v28 = atomic_load((unsigned __int8 *)v26 + 26);
  if ((v28 & 1) == 0 && !*((unsigned char *)v26 + 16))
  {
    *((float *)v26 + 5) = sub_10005BF74((uint64_t)v26, (float *)v26 + 3);
    *((unsigned char *)v27 + 16) = 1;
    atomic_store(1u, (unsigned __int8 *)v27 + 26);
  }
  sub_1000A19A4(v25, *((float *)v27 + 5));
  uint64_t v29 = sub_100058E7C();
  *(void *)std::string buf = sub_10009D020();
  *(void *)&uint8_t buf[8] = v30;
  int v31 = sub_100058BC0((uint64_t)buf, (unsigned int *)&buf[12]);
  sub_1000A1894(v29, v31);
  *(void *)std::string buf = sub_100058E6C();
  *(void *)&uint8_t buf[8] = v32;
  if (sub_100059C20((uint64_t)buf, &buf[9]))
  {
    uint64_t v33 = sub_100058E7C();
    sub_1000A199C(v33, 2);
  }
  *(void *)std::string buf = sub_10005B2A0();
  *(void *)&uint8_t buf[8] = v34;
  if ((int)sub_100058BC0((uint64_t)buf, (unsigned int *)&buf[12]) >= 1)
  {
    id to = (id)sub_100058E6C();
    id v66 = v35;
    if (!sub_100059C20((uint64_t)&to, (unsigned char *)&v66 + 1))
    {
      uint64_t v36 = sub_100058E7C();
      sub_1000A199C(v36, 3);
    }
  }
  objc_initWeak(&location, v5);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3321888768;
  v61[2] = sub_100385F40;
  v61[3] = &unk_10046B0C0;
  objc_copyWeak(&to, &location);
  id v66 = [v4 _queue];
  objc_copyWeak(&v62, &to);
  id v63 = v66;
  *(void *)std::string buf = off_10046B290;
  int v37 = objc_retainBlock(v61);
  if (v5[200])
  {
    *(void *)&uint8_t buf[8] = 0;
    __darwin_time_t v38 = (void *)*((void *)v5 + 27);
    *((void *)v5 + 27) = v37;

    uint64_t v39 = *(void **)&buf[8];
  }
  else
  {
    uint64_t v39 = 0;
    *(void *)&uint8_t buf[8] = 0;
    *((void *)v5 + 26) = off_10046B290;
    *((void *)v5 + 27) = v37;
    v5[200] = 1;
  }

  objc_destroyWeak(&to);
  objc_initWeak(&from, v5);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3321888768;
  v57[2] = sub_1003861B0;
  v57[3] = &unk_10046B0F0;
  objc_copyWeak(&to, &from);
  id v66 = [v4 _queue];
  objc_copyWeak(&v58, &to);
  id v59 = v66;
  *(void *)std::string buf = off_10046B310;
  int v40 = objc_retainBlock(v57);
  if (v5[224])
  {
    *(void *)&uint8_t buf[8] = 0;
    id v41 = (void *)*((void *)v5 + 30);
    *((void *)v5 + 30) = v40;

    std::string::size_type v42 = *(void **)&buf[8];
  }
  else
  {
    std::string::size_type v42 = 0;
    *(void *)&uint8_t buf[8] = 0;
    *((void *)v5 + 29) = off_10046B310;
    *((void *)v5 + 30) = v40;
    v5[224] = 1;
  }

  objc_destroyWeak(&to);
  objc_initWeak(&v56, v5);
  objc_copyWeak(&to, &v56);
  id v66 = [v4 _queue];
  char v43 = operator new(0x28uLL);
  v43[1] = 0;
  v43[2] = 0;
  *char v43 = off_10046B408;
  *(void *)std::string buf = _NSConcreteStackBlock;
  *(void *)&uint8_t buf[8] = 3321888768;
  *(void *)&uint8_t buf[16] = sub_100045BA0;
  id v69 = &unk_10046B448;
  objc_copyWeak(&v70, &to);
  id v71 = v66;
  uint64_t v44 = objc_retainBlock(buf);

  objc_destroyWeak(&v70);
  v43[3] = off_10046B4B8;
  v43[4] = objc_retainBlock(v44);

  *((void *)v5 + 93) = v43 + 3;
  uint64_t v45 = (std::__shared_weak_count *)*((void *)v5 + 94);
  *((void *)v5 + 94) = v43;
  if (v45 && !atomic_fetch_add(&v45->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
  }

  objc_destroyWeak(&to);
  uint64_t v46 = (void *)*((void *)v5 + 105);
  *((void *)v5 + 105) = 0;

  uint64_t v47 = (void *)*((void *)v5 + 76);
  *((void *)v5 + 76) = 0;

  uint64_t v48 = (void *)*((void *)v5 + 77);
  *((void *)v5 + 77) = 0;

  int v49 = (void *)*((void *)v5 + 79);
  *((_OWORD *)v5 + 39) = 0u;

  *((void *)v5 + 80) = 0;
  uint64_t v50 = objc_alloc_init(CLAvailableVenuesStateMachine);
  int v51 = (void *)*((void *)v5 + 81);
  *((void *)v5 + 81) = v50;

  id to = (id)sub_10009D030();
  id v66 = v52;
  __int16 v53 = sub_10000AD2C((uint64_t)&to, (unsigned __int16 *)&v66 + 1);
  sub_1000A0478((uint64_t)buf, v53);
  *(_OWORD *)(v5 + 760) = *(_OWORD *)buf;
  uint64_t v54 = v5;
  objc_destroyWeak(&v56);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);
LABEL_35:

  return (CLIndoorProvider *)v5;
}

- (void)foregroundTileDownloadComplete
{
  v3 = [(CLIndoorProvider *)self currentForegroundFetchRequest];
  int v40 = [v3 floorRequests];

  id v4 = [(CLIndoorProvider *)self currentForegroundFetchRequest];
  unsigned int v39 = [v4 action];

  [(CLIndoorProvider *)self setCurrentForegroundFetchRequest:0];
  if (![(CLIndoorProvider *)self onQueueProcessCompletedFetch:v40])
  {
    if (qword_10047BEF8 == -1)
    {
      id v7 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_7:
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v8 = v40;
        id v9 = [v8 countByEnumeratingWithState:&v41 objects:v58 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v42;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v42 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              ptr = self->_fsDb.__ptr_;
              id v14 = [v12 floorUuid];
              sub_1000900D0(buf, (const char *)[v14 UTF8String]);
              [v12 setHasCompleteFloor:((*(uint64_t (**)(ITileDb *, std::string *))(*(void *)ptr + 64))(ptr, buf));
              size = (std::__shared_weak_count *)buf[0].__r_.__value_.__l.__size_;
              if (buf[0].__r_.__value_.__l.__size_
                && !atomic_fetch_add((atomic_ullong *volatile)(buf[0].__r_.__value_.__l.__size_ + 8), 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
                std::__shared_weak_count::__release_weak(size);
              }
            }
            id v9 = [v8 countByEnumeratingWithState:&v41 objects:v58 count:16];
          }
          while (v9);
        }

        uint64_t v16 = [[CLIndoorForegroundFetchRequest alloc] initWithFloorRequests:v8 forAction:v39];
        [(CLIndoorProvider *)self setCurrentForegroundFetchRequest:v16];

        [(CLIndoorProvider *)self requestForegroundTileDownload];
        goto LABEL_67;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      id v7 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
    }
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "WARNING: Import failed. Signalling download is available and retrying fetch", (uint8_t *)buf, 2u);
    goto LABEL_7;
  }
  *(_OWORD *)__int16 v53 = 0u;
  long long v54 = 0u;
  float v55 = 1.0;
  unint64_t prime = vcvtps_u32_f32((float)(unint64_t)[v40 count] / 1.0);
  if (prime == 1)
  {
    unint64_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    unint64_t prime = std::__next_prime(prime);
  }
  if ((void *)prime > v53[1]) {
    goto LABEL_21;
  }
  if ((void *)prime < v53[1])
  {
    unint64_t v17 = vcvtps_u32_f32((float)*((unint64_t *)&v54 + 1) / v55);
    if (v53[1] < (void *)3
      || (uint8x8_t v18 = (uint8x8_t)vcnt_s8((int8x8_t)v53[1]), v18.i16[0] = vaddlv_u8(v18), v18.u32[0] > 1uLL))
    {
      unint64_t v17 = std::__next_prime(v17);
    }
    else
    {
      uint64_t v19 = 1 << -(char)__clz(v17 - 1);
      if (v17 >= 2) {
        unint64_t v17 = v19;
      }
    }
    if (prime <= v17) {
      unint64_t prime = v17;
    }
    if ((void *)prime < v53[1]) {
LABEL_21:
    }
      sub_10006338C((uint64_t)v53, prime);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v20 = v40;
  id v21 = [v20 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v50;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v50 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = [*(id *)(*((void *)&v49 + 1) + 8 * (void)j) floorUuid];
        sub_1000900D0(&v56, (const char *)[v24 UTF8String]);

        if (qword_10047BEF8 != -1)
        {
          dispatch_once(&qword_10047BEF8, &stru_10046B230);
          uint64_t v25 = (id)qword_10047BF00;
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
            goto LABEL_41;
          }
LABEL_40:
          uint64_t v26 = sub_1000900B8((char **)&v56);
          LODWORD(buf[0].__r_.__value_.__l.__data_) = 136380675;
          *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Fetching location configuration for floor UUID %{private}s", (uint8_t *)buf, 0xCu);
          goto LABEL_41;
        }
        uint64_t v25 = (id)qword_10047BF00;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
          goto LABEL_40;
        }
LABEL_41:

        (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_fsDb.__ptr_ + 120))(&v47);
        sub_100074A28(&v47, (uint64_t)buf);
        sub_10008FD08((uint64_t)v53, (uint64_t ***)&v56, &v56, (uint64_t)buf);
        sub_100074A24(buf);
        int v27 = v48;
        if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
          unsigned __int8 v28 = v57;
          if (!v57) {
            continue;
          }
        }
        else
        {
          unsigned __int8 v28 = v57;
          if (!v57) {
            continue;
          }
        }
        if (!atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
      id v21 = [v20 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v21);
  }

  uint64_t v29 = self->_fsDb.__ptr_;
  sub_1000771DC((uint64_t)__p, (uint64_t)v53);
  sub_1000A2138(buf, v29, __p);
  [(CLIndoorProvider *)self onQueueSelectedLocationDownloadCompleted:buf forAction:v39];
  sub_1000748BC(buf);
  uint64_t v30 = v46;
  while (v30)
  {
    int v31 = v30;
    uint64_t v30 = (void *)*v30;
    sub_100074A24(v31 + 4);
    uint64_t v32 = (std::__shared_weak_count *)v31[3];
    if (v32 && !atomic_fetch_add(&v32->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
    operator delete(v31);
  }
  uint64_t v33 = __p[0];
  __p[0] = 0;
  if (v33) {
    operator delete(v33);
  }
  uint64_t v34 = (void *)v54;
  while (v34)
  {
    long long v35 = v34;
    uint64_t v34 = (void *)*v34;
    sub_100074A24(v35 + 4);
    uint64_t v36 = (std::__shared_weak_count *)v35[3];
    if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
    operator delete(v35);
  }
  int v37 = v53[0];
  v53[0] = 0;
  if (v37) {
    operator delete(v37);
  }
LABEL_67:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prefetcher);
  if (!WeakRetained)
  {
    sub_1000AE4B0(v53, "");
    sub_1002700A4("No prefetcher initialized", buf);
    sub_10016A2C4((uint64_t)v53, (uint64_t)buf, 1);
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf[0].__r_.__value_.__l.__data_);
    }
    if (SBYTE7(v54) < 0) {
      operator delete(v53[0]);
    }
    sub_1000D11E0((uint64_t)&v56);
  }
  [WeakRetained allDownloadItemsCompleted];
}

- (void)requestForegroundTileDownload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prefetcher);
  if (!WeakRetained)
  {
    sub_1000AE4B0(__p, "");
    sub_1002700A4("No prefetcher initialized", &buf);
    sub_10016A2C4((uint64_t)__p, (uint64_t)&buf, 1);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    sub_1000D11E0((uint64_t)&v11);
  }
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  id v4 = (id)qword_10047BF00;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(CLIndoorProvider *)self currentForegroundFetchRequest];
    uint64_t v6 = [v5 floorRequests];
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)[v6 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting foreground downloads for %lu floors", (uint8_t *)&buf, 0xCu);
  }
  id v7 = [(CLIndoorProvider *)self currentForegroundFetchRequest];
  id v8 = [v7 floorRequests];
  id v9 = [(CLIndoorProvider *)self currentForegroundFetchRequest];
  uint64_t v10 = [v9 uuid];
  [WeakRetained requestForegroundFetchForFloors:v8 withRequestUUID:v10];
}

- (CLIndoorForegroundFetchRequest)currentForegroundFetchRequest
{
  return self->_currentForegroundFetchRequest;
}

- (BOOL)onQueueProcessCompletedFetch:(id)a3
{
  id v42 = a3;
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Immediate fetch completed.  Importing into localizer", buf, 2u);
  }
LABEL_4:
  long long v52 = 0;
  __int16 v53 = 0;
  unint64_t v54 = 0;
  sub_10009826C((uint64_t)&v52, (unint64_t)[v42 count]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v42;
  id v4 = [obj countByEnumeratingWithState:&v48 objects:v65 count:16];
  if (!v4) {
    goto LABEL_57;
  }
  uint64_t v5 = *(void *)v49;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v49 != v5) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      id v8 = [v7 floorUuid];
      id v9 = (const char *)[v8 UTF8String];
      size_t v10 = strlen(v9);
      if (v10 > 0x7FFFFFFFFFFFFFF7) {
        sub_1000A6968();
      }
      size_t v11 = v10;
      if (v10 >= 0x17)
      {
        uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v10 | 7) != 0x17) {
          uint64_t v13 = v10 | 7;
        }
        uint64_t v14 = v13 + 1;
        p_dst = (long long *)operator new(v13 + 1);
        *((void *)&__dst + 1) = v11;
        unint64_t v47 = v14 | 0x8000000000000000;
        *(void *)&long long __dst = p_dst;
LABEL_17:
        memmove(p_dst, v9, v11);
        goto LABEL_18;
      }
      HIBYTE(v47) = v10;
      p_dst = &__dst;
      if (v10) {
        goto LABEL_17;
      }
LABEL_18:
      *((unsigned char *)p_dst + v11) = 0;
      id v15 = [v7 venueUuid];
      uint64_t v16 = (const char *)[v15 UTF8String];
      size_t v17 = strlen(v16);
      if (v17 > 0x7FFFFFFFFFFFFFF7) {
        sub_1000A6968();
      }
      size_t v18 = v17;
      if (v17 >= 0x17)
      {
        uint64_t v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v17 | 7) != 0x17) {
          uint64_t v20 = v17 | 7;
        }
        uint64_t v21 = v20 + 1;
        p_p = (__n128 *)operator new(v20 + 1);
        __p.n128_u64[1] = v18;
        unint64_t v45 = v21 | 0x8000000000000000;
        __p.n128_u64[0] = (unint64_t)p_p;
LABEL_25:
        memmove(p_p, v16, v18);
        goto LABEL_26;
      }
      HIBYTE(v45) = v17;
      p_p = &__p;
      if (v17) {
        goto LABEL_25;
      }
LABEL_26:
      p_p->n128_u8[v18] = 0;
      sub_100091630((uint64_t)buf, &__dst, &__p, +[CLLocationContextConversions fromCLPipelinedLocationContext:](CLLocationContextConversions, "fromCLPipelinedLocationContext:", [v7 locationContext]));
      if (SHIBYTE(v45) < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }

      if (SHIBYTE(v47) < 0) {
        operator delete((void *)__dst);
      }

      uint64_t v22 = v53;
      if ((unint64_t)v53 >= v54)
      {
        __int16 v53 = sub_10038E710(&v52, (uint64_t)buf);
        if (qword_10047BEF8 == -1) {
          goto LABEL_34;
        }
LABEL_55:
        dispatch_once(&qword_10047BEF8, &stru_10046B230);
        goto LABEL_34;
      }
      if ((buf[23] & 0x80000000) != 0)
      {
        sub_1000559FC(v53, *(void **)buf, *(unint64_t *)&buf[8]);
      }
      else
      {
        long long v23 = *(_OWORD *)buf;
        *((void *)v53 + 2) = *(void *)&buf[16];
        *(_OWORD *)uint64_t v22 = v23;
      }
      uint64_t v33 = v22 + 24;
      if (SHIBYTE(v63) < 0)
      {
        sub_1000559FC(v33, (void *)v62, *((unint64_t *)&v62 + 1));
      }
      else
      {
        long long v34 = v62;
        *((void *)v22 + 5) = v63;
        *(_OWORD *)uint64_t v33 = v34;
      }
      *((_DWORD *)v22 + 12) = v64;
      __int16 v53 = v22 + 56;
      if (qword_10047BEF8 != -1) {
        goto LABEL_55;
      }
LABEL_34:
      id v24 = (id)qword_10047BF00;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = sub_10008807C((uint64_t)buf);
        if (*(char *)(v25 + 23) >= 0) {
          uint64_t v26 = v25;
        }
        else {
          uint64_t v26 = *(void *)v25;
        }
        uint64_t v27 = nullsub_22(buf);
        int v28 = *(char *)(v27 + 23);
        uint64_t v29 = *(void *)v27;
        int v30 = sub_10007CA84((uint64_t)buf);
        if (v28 >= 0) {
          uint64_t v31 = v27;
        }
        else {
          uint64_t v31 = v29;
        }
        *(_DWORD *)float v55 = 136381187;
        uint64_t v56 = v26;
        if (v30 == 1) {
          int v32 = 82;
        }
        else {
          int v32 = 73;
        }
        __int16 v57 = 2081;
        uint64_t v58 = v31;
        __int16 v59 = 1026;
        int v60 = v32;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "TileVisit, fetch, %{private}s, %{private}s, %{public}c", v55, 0x1Cu);
      }

      if (SHIBYTE(v63) < 0)
      {
        operator delete((void *)v62);
        if ((buf[23] & 0x80000000) == 0) {
          continue;
        }
      }
      else if ((buf[23] & 0x80000000) == 0)
      {
        continue;
      }
      operator delete(*(void **)buf);
    }
    id v4 = [obj countByEnumeratingWithState:&v48 objects:v65 count:16];
  }
  while (v4);
LABEL_57:

  v35.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  (*(void (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, void **))(*(void *)self->_fsDb.__ptr_ + 184))(self->_fsDb.__ptr_, v35.__d_.__rep_ - 1000000 * (v35.__d_.__rep_ % 21600), &v52);
  if (qword_10047BEF8 == -1)
  {
    uint64_t v36 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_59;
    }
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    uint64_t v36 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
    {
LABEL_59:
      *(_DWORD *)std::string buf = 134283777;
      *(std::chrono::system_clock::time_point *)&uint8_t buf[4] = v35;
      *(_WORD *)&unsigned char buf[12] = 2049;
      *(void *)&buf[14] = v35.__d_.__rep_ - 1000000 * (v35.__d_.__rep_ % 21600);
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Prefetch complete, fuzz, %{private}lld, %{private}lld", buf, 0x16u);
    }
  }
  int v37 = (char *)v52;
  if (v52)
  {
    __darwin_time_t v38 = v53;
    unsigned int v39 = v52;
    if (v53 == v52)
    {
LABEL_70:
      __int16 v53 = v37;
      operator delete(v39);
      goto LABEL_71;
    }
    while (2)
    {
      if (*(v38 - 9) < 0)
      {
        operator delete(*((void **)v38 - 4));
        if (*(v38 - 33) < 0) {
          goto LABEL_68;
        }
      }
      else if (*(v38 - 33) < 0)
      {
LABEL_68:
        operator delete(*((void **)v38 - 7));
      }
      v38 -= 56;
      if (v38 == v37)
      {
        unsigned int v39 = v52;
        goto LABEL_70;
      }
      continue;
    }
  }
LABEL_71:

  return 1;
}

- (void)foregroundRequestCompleted:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    sub_1000AE4B0(buf, "");
    sub_10016A2C4((uint64_t)buf, 0, 0);
    if (v16 < 0) {
      operator delete(*(void **)buf);
    }
    sub_10014B3FC((uint64_t)&__p);
  }
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  uint64_t v5 = (id)qword_10047BF00;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 requestUUID];
    id v7 = [v6 UUIDString];
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = [v7 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "download request finished for UUID: %s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  id v9 = [WeakRetained _queue];

  if (!v9)
  {
    if (qword_10047BEF8 == -1)
    {
      size_t v10 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      size_t v10 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
    }
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "No queue so ignoring message", buf, 2u);
    goto LABEL_11;
  }
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100090B5C;
  block[3] = &unk_10046B128;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = v4;
  dispatch_async(v9, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
LABEL_11:
}

- (NSURL)workdir
{
  return self->_workdir;
}

- (void)setWorkdir:(id)a3
{
}

- (void)setSelectedLocation:(optional<SelectedLocations>)a3
{
}

- (void)setPrefetcher:(id)a3
{
}

- (void)setPrefetchFloorLimitRegional:(int)a3
{
  self->_prefetchFloorLimitRegional = a3;
}

- (void)setPrefetchFloorLimitIndoor:(int)a3
{
  self->_prefetchFloorLimitIndoor = a3;
}

- (void)setPrefetchByteSizeLimitRegional:(int)a3
{
  self->_prefetchByteSizeLimitRegional = a3;
}

- (void)setPrefetchByteSizeLimitIndoor:(int)a3
{
  self->_prefetchByteSizeLimitIndoor = a3;
}

- (void)setLocalizationStarted:(BOOL)a3
{
  self->_localizationStarted = a3;
}

- (void)setLocalizationActive:(BOOL)a3
{
  self->_localizationActive = a3;
}

- (void)setCurrentForegroundFetchRequest:(id)a3
{
}

- (void)onQueueSelectedLocationDownloadCompleted:(const void *)a3 forAction:(unsigned __int8)a4
{
  if (a4 == 1)
  {
    if (self->_serviceLocalizer.__ptr_.__value_)
    {
      v18[0] = 0;
      uint64_t v6 = *((void *)a3 + 1);
      v19[0] = *(void *)a3;
      v19[1] = v6;
      if (v6) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
      }
      sub_1000771DC((uint64_t)v20, (uint64_t)a3 + 16);
      uint64_t v7 = *((void *)a3 + 8);
      v20[5] = *((void *)a3 + 7);
      v20[6] = v7;
      if (v7) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
      }
      char v21 = *((unsigned char *)a3 + 72);
      v18[0] = 1;
      [(CLIndoorProvider *)self setSelectedLocation:v18];
      if (v18[0])
      {
        sub_1000748BC(v19);
        v18[0] = 0;
      }
      value = self->_serviceLocalizer.__ptr_.__value_;
      uint64_t v9 = sub_100048550();
      (*(void (**)(LocalizerApi *, uint64_t, const void *))(*(void *)value + 48))(value, v9, a3);
      sub_10002B040((uint64_t)a3, (uint64_t)&v15);
      v10.n128_f64[0] = sub_10009FEE4((uint64_t)&self->_localizationSessionMetrics, v17);
      size_t v11 = __p;
      if (__p)
      {
        do
        {
          id v12 = v11;
          size_t v11 = (void *)*v11;
          id v13 = (std::__shared_weak_count *)v12[3];
          if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *, __n128))v13->__on_zero_shared)(v13, v10);
            std::__shared_weak_count::__release_weak(v13);
          }
          operator delete(v12);
        }
        while (v11);
      }
      uint64_t v14 = v15;
      id v15 = 0;
      if (v14) {
        operator delete(v14);
      }
    }
  }
  else if (!a4)
  {
    v22[0] = 0;
    if (self->_paramOverrides.m_initialized)
    {
      sub_10003E0AC((uint64_t)v23, (uint64_t)&self->_paramOverrides.m_storage.dummy_.aligner_ + 7);
      v22[0] = 1;
    }
    [(CLIndoorProvider *)self onQueueLocalizeOnSelection:a3 withParameterOverrides:v22];
    if (v22[0]) {
      sub_10006E2E4(v23);
    }
  }
}

- (BOOL)localizationActive
{
  return self->_localizationActive;
}

- (id).cxx_construct
{
  self->_deferredState.m_initialized = 0;
  self->_possibleLocationObserver.m_initialized = 0;
  self->_params.m_initialized = 0;
  self->_floorEnvironmentLoader.__ptr_.__value_ = 0;
  self->_serviceLocalizer.__ptr_.__value_ = 0;
  self->_simulation.m_initialized = 0;
  self->_platformInfo = 0u;
  self->_eventBuses = 0u;
  self->_localizationSensorCollection = 0u;
  self->_scanPriorityObserver = 0u;
  self->_localizerObserver.m_initialized = 0;
  self->_sensorLogger.__ptr_ = 0;
  self->_sensorLogger.__cntrl_ = 0;
  self->_paramOverrides.m_initialized = 0;
  self->_localizationSessionMetrics._vptr$ILocalizerInputEventReceiver = (void **)off_10046AE28;
  *(_OWORD *)&self->_localizationSessionMetrics.sessionStartTimeNanos.__rep_ = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.ttffNanos.__rep_ = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.numOfIndoorFixes = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.numOfIncomingVIOEstimates = 0u;
  self->_sensorMetricsObserver = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.avgNumOfSelectedLocations = 0u;
  uint64_t v6 = sub_10009D030();
  uint64_t v7 = v3;
  __int16 v4 = sub_10000AD2C((uint64_t)&v6, (unsigned __int16 *)&v7 + 1);
  sub_1000A0478((uint64_t)&self->_pipelinedFixCrossCheckMetrics, v4);
  self->_selectedLocation.m_initialized = 0;
  self->_fsDb = 0u;
  return self;
}

- (CLIndoorProvider)init
{
  return 0;
}

- (void)mutableDeferredState
{
  if (!self->_deferredState.m_initialized)
  {
    *(void *)((char *)&self->_deferredState.m_storage.dummy_.aligner_ + 7) = 0;
    self->_anon_11[7] = 0;
    self->_deferredState.m_initialized = 1;
  }
  return (char *)&self->_deferredState.m_storage.dummy_.aligner_ + 7;
}

- (void)onQueueNotify:(const void *)a3 onFloor:(const void *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  if (WeakRetained && self->_localizationActive)
  {
    uint64_t v8 = sub_100385D80(*((_DWORD *)a3 + 131));
    sub_10037D0D0(&self->_pipelinedFixCrossCheckMetrics.fSamplingFactor, (uint64_t)a3, v8, self->_lastGpsPositionAvailable, self->_lastGpsReceivedTime.__rep_, a4);
    uint64_t v9 = sub_100385D80(*((_DWORD *)a3 + 131));
    sub_10037D0D0(&self->_pipelinedFixCrossCheckMetrics.fSamplingFactor, (uint64_t)a3, v9, self->_lastNonGpsPositionAvailable, self->_lastNonGpsReceivedTime.__rep_, a4);
    uint64_t v10 = sub_100048550();
    if (*((_DWORD *)a3 + 131) == 4)
    {
      if (!self->_lastGpsPositionAvailable)
      {
        if (qword_10047BEF8 == -1)
        {
          char v16 = qword_10047BF00;
          if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_14;
          }
        }
        else
        {
          dispatch_once(&qword_10047BEF8, &stru_10046B230);
          char v16 = qword_10047BF00;
          if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_14;
          }
        }
        *(_WORD *)std::string buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Yielding Wifi2 but no GPS available yet, therefore not copying GPS fields...", buf, 2u);
        goto LABEL_14;
      }
      uint64_t v11 = v10;
      int64_t rep = self->_lastGpsReceivedTime.__rep_;
      if ((double)(uint64_t)(v10 - rep) / 1000000000.0 < sub_1002A3CE0((uint64_t)&self->_params.m_storage.dummy_.aligner_ + 7))
      {
        uint64_t v17 = +[CLIndoorLocation fromPoseEstimate:a3 andGpsEstimate:self->_lastGpsPositionAvailable];
LABEL_15:
        size_t v18 = (void *)v17;
        if (!v17)
        {
          uint64_t v20 = +[NSError errorWithDomain:@"com.apple.pipelined" code:-1 userInfo:&__NSDictionary0__struct];
          [(CLIndoorProvider *)self notify:WeakRetained failedWithReason:v20];
LABEL_33:

          goto LABEL_34;
        }
        ptr = self->_sensorLogger.__ptr_;
        if (ptr) {
          sub_10015AF68((uint64_t)ptr, (uint64_t)a3);
        }
        uint64_t v20 = [WeakRetained remoteObjectProxy];
        int v21 = *((_DWORD *)a3 + 74);
        if ((v21 - 1) < 3) {
          goto LABEL_19;
        }
        if (v21)
        {
          if (v21 == 4)
          {
            if (qword_10047BEF8 == -1)
            {
              uint64_t v22 = qword_10047BF00;
              if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
                goto LABEL_19;
              }
            }
            else
            {
              dispatch_once(&qword_10047BEF8, &stru_10046B230);
              uint64_t v22 = qword_10047BF00;
              if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
              {
LABEL_19:
                if ((*((unsigned char *)a3 + 755) & 0x20) != 0)
                {
                  if (!*((_DWORD *)a3 + 75)) {
                    [v20 indoorGivesUpWithLocation:0];
                  }
                }
                else
                {
                  [v20 indoorIsUncertainWithLocation:0];
                }
                goto LABEL_32;
              }
            }
            *(_WORD *)std::string buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Illegal yieldStatus emitted from localizer. We should never receive YIELD_DATA_MISSING. It means we forgot to set yieldStatus...", buf, 2u);
            goto LABEL_19;
          }
LABEL_32:
          objc_storeStrong((id *)&self->_latestFix, v18);
          goto LABEL_33;
        }
        [v18 location];
        [v18 location:v35];
        double v23 = v35;
        [v18 location];
        if (v23 > 0.0)
        {
          [v20 indoorDidUpdateToLocation:v18 fromLocation:self->_latestFix];
          [v18 location];
          [(CLIndoorProvider *)self updateUniverseIfAllowedAndNecessary:v24];
          sub_10037EB58((uint64_t)&self->_localizationSessionMetrics, (uint64_t)a3);
          goto LABEL_32;
        }
        sub_1000AE4B0(v27, "");
        sub_10038D1EC("lifespan = ", &v36);
        sub_10016452C(&v25, &v37);
        sub_10016A2C4((uint64_t)v27, (uint64_t)&v36, 2);
        if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v37.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_41:
            if ((v28 & 0x80000000) == 0) {
              goto LABEL_42;
            }
LABEL_45:
            operator delete(v27[0]);
LABEL_42:
            sub_1000D11E0((uint64_t)v26);
          }
        }
        else if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          goto LABEL_41;
        }
        operator delete(v36.__r_.__value_.__l.__data_);
        if ((v28 & 0x80000000) == 0) {
          goto LABEL_42;
        }
        goto LABEL_45;
      }
      if (qword_10047BEF8 != -1) {
        dispatch_once(&qword_10047BEF8, &stru_10046B230);
      }
      id v13 = (id)qword_10047BF00;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        double v14 = sub_1002A3CE0((uint64_t)&self->_params.m_storage.dummy_.aligner_ + 7);
        int64_t v15 = self->_lastGpsReceivedTime.__rep_;
        *(_DWORD *)std::string buf = 134218496;
        double v30 = v14;
        __int16 v31 = 2048;
        int64_t v32 = v15;
        __int16 v33 = 2048;
        uint64_t v34 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Yielding Wifi2 but available GPS's time mismatch is more than %f seconds (GPS timestamp: %llu, Current time: %llu), therefore not copying GPS fields...", buf, 0x20u);
      }
    }
LABEL_14:
    uint64_t v17 = +[CLIndoorLocation fromPoseEstimate:a3];
    goto LABEL_15;
  }
LABEL_34:
}

- (void)onQueueNotifyLocationContext:(BOOL)a3 withLocationContext:(int)a4
{
  if (a4 == 1)
  {
    uint64_t v5 = sub_10036E290();
    uint64_t v6 = v5;
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)v5 + 26);
    if ((v7 & 1) != 0 || *((unsigned char *)v5 + 16)) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = sub_10009C968();
    uint64_t v6 = v5;
    unsigned __int8 v8 = atomic_load((unsigned __int8 *)v5 + 26);
    if ((v8 & 1) != 0 || *((unsigned char *)v5 + 16)) {
      goto LABEL_8;
    }
  }
  *((float *)v6 + 5) = sub_10005BF74((uint64_t)v5, (float *)v5 + 3);
  *((unsigned char *)v6 + 16) = 1;
  atomic_store(1u, (unsigned __int8 *)v6 + 26);
LABEL_8:
  float v9 = *((float *)v6 + 5);
  uint64_t v10 = sub_100058E7C();
  if (sub_10033C0DC(v10) != v9)
  {
    uint64_t v11 = sub_100058E7C();
    sub_1000A19A4(v11, v9);
    ++self->_localizationSessionMetrics.numOfLocationContextChange;
  }
}

- (void)dealloc
{
  if (qword_10047BEF8 == -1)
  {
    uint64_t v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  uint64_t v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "dealloc start", buf, 2u);
  }
LABEL_4:
  [(CLIndoorProvider *)self onQueueInvalidate:1];
  if (qword_10047BEF8 == -1)
  {
    __int16 v4 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  __int16 v4 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    *(_DWORD *)std::string buf = 134217984;
    unsigned __int8 v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Connection state %p invalidated", buf, 0xCu);
  }
LABEL_7:
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    uint64_t v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_9:
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "dealloc end", buf, 2u);
  }
LABEL_10:
  v6.receiver = self;
  v6.super_class = (Class)CLIndoorProvider;
  [(CLIndoorProvider *)&v6 dealloc];
}

- (void)onQueueInvalidate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_xpcConnection = &self->_xpcConnection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  if (qword_10047BEF8 == -1)
  {
    unsigned __int8 v7 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  unsigned __int8 v7 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "invalidating for connection %p", (uint8_t *)&buf, 0xCu);
  }
LABEL_4:
  if (qword_10047BEF8 == -1)
  {
    unsigned __int8 v8 = (id)qword_10047BF00;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  unsigned __int8 v8 = (id)qword_10047BF00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    id v9 = +[CLIndoorServiceDelegate versionString];
    id v10 = [v9 UTF8String];
    LODWORD(buf.__r_.__value_.__l.__data_) = 134218498;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)self;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)WeakRetained;
    HIWORD(buf.__r_.__value_.__r.__words[2]) = 2080;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Tearing down server-side state %p for connection %p to %s", (uint8_t *)&buf, 0x20u);
  }
LABEL_7:

  [(CLIndoorProvider *)self onQueueInterruptDownloads:v3];
  [(CLIndoorProvider *)self stopLocalizer];
  [(CLIndoorProvider *)self onQueueStopUpdatingLocation:v3];
  if (self->_serviceLocalizer.__ptr_.__value_)
  {
    sub_1000AE4B0(__p, "");
    sub_10027692C("Service localizer should have already been torne down", &buf);
    sub_10016A2C4((uint64_t)__p, (uint64_t)&buf, 1);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    if (v24 < 0) {
      operator delete(__p[0]);
    }
    sub_1000D11E0((uint64_t)v22);
  }
  if (self->_sensorLogger.__ptr_)
  {
    sub_1000AE4B0(&buf, "");
    sub_10016A2C4((uint64_t)&buf, 0, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    sub_1000D11E0((uint64_t)__p);
  }
  cntrl = self->_localizationSensorCollection.__cntrl_;
  if (cntrl && *((uint64_t *)cntrl + 1) >= 1)
  {
    sub_1000AE4B0(&buf, "");
    sub_10016A2C4((uint64_t)&buf, 0, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    sub_1000D11E0((uint64_t)__p);
  }
  ptr = self->_localizationSensorCollection.__ptr_;
  if (!ptr) {
    goto LABEL_23;
  }
  id v13 = self->_localizationSensorCollection.__cntrl_;
  if (v13)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v13 + 2, 1uLL, memory_order_relaxed);
    ptr = self->_localizationSensorCollection.__ptr_;
  }
  uint64_t v14 = sub_10036BC40((uint64_t)ptr);
  std::string::size_type v16 = v15;
  if (v14 | v15)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v17 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    uint64_t v17 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:
      LODWORD(buf.__r_.__value_.__l.__data_) = 134218240;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v14;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Still have %lu activ sensor observers, %lu inactive sensor observers", (uint8_t *)&buf, 0x16u);
    }
  }
LABEL_18:
  size_t v18 = self->_localizationSensorCollection.__cntrl_;
  self->_localizationSensorCollection.__ptr_ = 0;
  self->_localizationSensorCollection.__cntrl_ = 0;
  if (v18 && !atomic_fetch_add((atomic_ullong *volatile)v18 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v18 + 16))(v18);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v18);
    if (!v13) {
      goto LABEL_23;
    }
  }
  else if (!v13)
  {
    goto LABEL_23;
  }
  if (*((void *)v13 + 1) != -1)
  {
    sub_1000AE4B0(__p, "");
    sub_1003026A8("MEMORY LEAK!? sensor collection still alive", &buf);
    sub_10016A2C4((uint64_t)__p, (uint64_t)&buf, 1);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    if (v24 < 0) {
      operator delete(__p[0]);
    }
    sub_1000D11E0((uint64_t)v22);
  }
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v13);
LABEL_23:
  [(CLIndoorProvider *)self setLocalizationStarted:0];
  [(CLIndoorProvider *)self setLocalizationActive:0];
  objc_storeWeak((id *)p_xpcConnection, 0);
  [WeakRetained invalidate];
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    uint64_t v19 = (id)qword_10047BF00;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v19 = (id)qword_10047BF00;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
LABEL_25:
    id v20 = +[CLIndoorServiceDelegate versionString];
    id v21 = [v20 UTF8String];
    LODWORD(buf.__r_.__value_.__l.__data_) = 134218242;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)WeakRetained;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Client state torn-down (mostly) for connection %p to %s", (uint8_t *)&buf, 0x16u);
  }
LABEL_26:
}

- (void)onConnectionQueueShutdown
{
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  uint64_t v3 = (id)qword_10047BF00;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = +[CLIndoorServiceDelegate versionString];
    int v10 = 136315138;
    id v11 = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to shutdown %s", (uint8_t *)&v10, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_super v6 = [WeakRetained _queue];
  unsigned __int8 v7 = v6;
  if (!v6)
  {
    if (qword_10047BEF8 == -1)
    {
      id v9 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      id v9 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
    }
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Already shut down?", (uint8_t *)&v10, 2u);
    goto LABEL_13;
  }
  dispatch_assert_queue_V2(v6);
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    unsigned __int8 v8 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  unsigned __int8 v8 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_8:
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Processing shutdown request", (uint8_t *)&v10, 2u);
  }
LABEL_9:
  [(CLIndoorProvider *)self onQueueInvalidate:0];
LABEL_13:
}

- (void)setApiKey:(id)a3
{
  id v3 = a3;
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    id v4 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v4 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "This API is unused", v5, 2u);
  }
LABEL_4:
}

- (void)setApiKey:(id)a3 onServer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    unsigned __int8 v7 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unsigned __int8 v7 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)unsigned __int8 v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "This API is unused", v8, 2u);
  }
LABEL_4:
}

- (void)notifyProxyOfDownloadError
{
  id v3 = +[CLIndoorProvider makeReason:@"download request failed" withCode:2 withFailure:0];
  -[CLIndoorProvider notifyProxyOfDownloadError:](self, "notifyProxyOfDownloadError:");
}

- (void)notifyProxyOfDownloadError:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  id v6 = [WeakRetained _queue];

  if (!v6)
  {
    if (qword_10047BEF8 == -1)
    {
      int v10 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      int v10 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_6;
      }
    }
    LOWORD(location) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "No queue so unable to notify proxy of download error", (uint8_t *)&location, 2u);
    goto LABEL_6;
  }
  id location = (id)sub_100163838();
  uint64_t v15 = v7;
  int v8 = sub_100058BC0((uint64_t)&location, (unsigned int *)&v15 + 1);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)((double)v8 * 1000000000.0));
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100387938;
  v11[3] = &unk_10046B128;
  objc_copyWeak(&v13, &location);
  id v12 = v4;
  dispatch_after(v9, v6, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_6:
}

- (void)notify:(id)a3 failedWithReason:(id)a4
{
  id v6 = a4;
  id v5 = [a3 remoteObjectProxy];
  [v5 indoorDidFailWithError:v6];
}

+ (id)makeReason:(id)a3 withCode:(int64_t)a4 withFailure:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = v9;
  if (v9)
  {
    NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
    id v15 = v9;
    id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  }
  else
  {
    id v11 = &__NSDictionary0__struct;
  }
  id v12 = [a1 makeReason:v8 withCode:a4 withInfo:v11];

  return v12;
}

+ (id)makeReason:(id)a3 withCode:(int64_t)a4 withInfo:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", (char *)[v8 count] + 1);
  [v9 setObject:v7 forKey:NSLocalizedDescriptionKey];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v15 = [v10 objectForKeyedSubscript:v14];
        [v9 setObject:v15 forKey:v14];
      }
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  std::string::size_type v16 = +[NSError errorWithDomain:@"com.apple.pipelined" code:a4 userInfo:v9];

  return v16;
}

- (void)changeLocationGroups:(id)a3
{
  id v4 = a3;
  if (self->_serviceLocalizer.__ptr_.__value_ && [(CLIndoorProvider *)self localizationStarted])
  {
    [(CLIndoorProvider *)self setLocationGroups:v4];
LABEL_4:

    return;
  }
  if (qword_10047BEF8 == -1)
  {
    id v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    id v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
  }
  *(_WORD *)id v6 = 0;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "WARNING: Ignoring changeLocationGroup request - not localizing yet", v6, 2u);
}

- (void)foregroundRequestCompleted:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  id v8 = (id)qword_10047BF00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 requestUUID];
    id v10 = [v9 UUIDString];
    id v11 = [v10 UTF8String];
    uint64_t v12 = [v7 description];
    id v13 = v12;
    if (v12)
    {
      [v12 ps_STLStringOnNil:&stru_10046D078];
      if (v23 >= 0) {
        uint64_t v14 = __p;
      }
      else {
        uint64_t v14 = (void **)__p[0];
      }
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v14 = __p;
      uint64_t v23 = 0;
    }
    *(_DWORD *)std::string buf = 136315394;
    id v25 = v11;
    __int16 v26 = 2080;
    uint64_t v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "download request finished for UUID: %s with an error %s", buf, 0x16u);
    if (SHIBYTE(v23) < 0) {
      operator delete(__p[0]);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  std::string::size_type v16 = [WeakRetained _queue];

  if (!v16)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v17 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      uint64_t v17 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
    }
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "No queue so ignoring message", (uint8_t *)__p, 2u);
    goto LABEL_17;
  }
  objc_initWeak(__p, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100388210;
  v18[3] = &unk_10046B1B0;
  objc_copyWeak(&v21, __p);
  v18[4] = self;
  id v19 = v6;
  id v20 = v7;
  dispatch_async(v16, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(__p);
LABEL_17:
}

- (void)playbackDatarun:(id)a3
{
  id v4 = a3;
  id v5 = [(CLIndoorProvider *)self xpcConnection];
  if (v5)
  {
    ptr = self->_fsDb.__ptr_;
    if (!ptr)
    {
      sub_1000AE4B0(__dst, "");
      sub_100270054("Localizer DB must be unlocked to playback dataruns", &v22);
      sub_10016A2C4((uint64_t)__dst, (uint64_t)&v22, 1);
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
      if (v17 < 0) {
        operator delete(__dst[0]);
      }
      sub_100149690((uint64_t)__p);
    }
    (*(void (**)(ITileDb *))(*(void *)ptr + 240))(ptr);
    sub_100383D60(__dst);
    if (v4)
    {
      [v4 ps_STLString];
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v15 = 0;
    }
    sub_100383D64((uint64_t)__dst, (uint64_t)__p, &v22);
    p_simulation = &self->_simulation;
    sub_10038B88C((uint64_t)&self->_simulation, (uint64_t)&v22);
    if (!v22.__r_.__value_.__s.__data_[0])
    {
LABEL_12:
      if (SHIBYTE(v15) < 0)
      {
        operator delete(__p[0]);
        if (p_simulation->m_initialized)
        {
LABEL_14:
          id v9 = [(CLIndoorProvider *)self getAvailabilityTileParserAndSetParams:@"playbackDatarun"];
          if (v9)
          {
            __p[0] = off_10046B360;
            sub_10003E040((uint64_t)[v9 getAvlTile], &v22);
            id v10 = operator new(0x28uLL);
            v10[1] = 0;
            v10[2] = 0;
            void *v10 = off_10046B510;
            sub_100038974((uint64_t)(v10 + 3), (uint64_t)__p, &v22);
          }
          v22.__r_.__value_.__r.__words[0] = (std::string::size_type)off_10046B360;
          id v13 = operator new(0x28uLL);
          v13[1] = 0;
          v13[2] = 0;
          *id v13 = off_10046B510;
          sub_1002A3B50();
        }
      }
      else if (p_simulation->m_initialized)
      {
        goto LABEL_14;
      }
      v25[0] = NSLocalizedDescriptionKey;
      v25[1] = @"datarunid";
      v26[0] = @"datarun not found";
      v26[1] = v4;
      id v11 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
      uint64_t v12 = +[NSError errorWithDomain:@"com.apple.pipelined" code:-1 userInfo:v11];

      [(CLIndoorProvider *)self notify:v5 failedWithReason:v12];
      if (v21 < 0)
      {
        operator delete(v20);
        if ((v19 & 0x80000000) == 0)
        {
LABEL_21:
          if ((v17 & 0x80000000) == 0) {
            goto LABEL_22;
          }
LABEL_25:
          operator delete(__dst[0]);
          goto LABEL_22;
        }
      }
      else if ((v19 & 0x80000000) == 0)
      {
        goto LABEL_21;
      }
      operator delete(v18);
      if ((v17 & 0x80000000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    id v8 = v24;
    if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
      if ((v23 & 0x80000000) == 0) {
        goto LABEL_11;
      }
    }
    else if ((v23 & 0x80000000) == 0)
    {
LABEL_11:
      v22.__r_.__value_.__s.__data_[0] = 0;
      goto LABEL_12;
    }
    operator delete((void *)v22.__r_.__value_.__l.__size_);
    goto LABEL_11;
  }
LABEL_22:
}

- (void)setLocationGroups:(id)a3
{
  id v4 = a3;
  if (!self->_fsDb.__ptr_)
  {
    sub_1000AE4B0(__p, "");
    sub_10015F140("setLocationGroups fsDb is not set", (std::string *)buf);
    sub_10016A2C4((uint64_t)__p, (uint64_t)buf, 1);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    if (v30 < 0) {
      operator delete(__p[0]);
    }
    sub_100149690((uint64_t)v31);
  }
  if (!self->_indoorUniverse)
  {
    sub_1000AE4B0(__p, "");
    sub_10025356C("setLocationGroups, indoorUniverse is not set", (std::string *)buf);
    sub_10016A2C4((uint64_t)__p, (uint64_t)buf, 1);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    if (v30 < 0) {
      operator delete(__p[0]);
    }
    sub_1000D11E0((uint64_t)v31);
  }
  id v5 = objc_loadWeakRetained((id *)&self->_xpcConnection);
  if (!v5)
  {
    sub_1000AE4B0(__p, "");
    sub_1003026A8("setLocationGroups, xpcConnection is not set", (std::string *)buf);
    sub_10016A2C4((uint64_t)__p, (uint64_t)buf, 1);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    if (v30 < 0) {
      operator delete(__p[0]);
    }
    sub_100149690((uint64_t)v31);
  }

  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
  }
  id v6 = (id)qword_10047BF00;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 allObjects];
    id v8 = [v7 componentsJoinedByString:@", "];
    *(_DWORD *)std::string buf = 136380675;
    *(void *)&uint8_t buf[4] = [v8 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[CLIndoorProvider] Location group %{private}s request to change", buf, 0xCu);
  }
  sub_100092088((uint64_t)__p, "setLocationGroups:");
  id v9 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        [v9 addObject:v14];
      }
      id v11 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v11);
  }

  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    uint64_t v15 = (id)qword_10047BF00;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  uint64_t v15 = (id)qword_10047BF00;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
LABEL_17:
    id v16 = [v9 count];
    char v17 = [v9 allObjects];
    id v18 = [v17 componentsJoinedByString:@", "];
    id v19 = [v18 UTF8String];
    *(_DWORD *)std::string buf = 134349315;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&unsigned char buf[12] = 2081;
    *(void *)&buf[14] = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Universe size: %{public}lu with locationGroupIds: %{private}s", buf, 0x16u);
  }
LABEL_18:

  id v20 = [(CLIndoorUniverse *)self->_indoorUniverse getAvailabilityData];
  *(void *)std::string buf = *v20;
  *(void *)&uint8_t buf[8] = (id)v20[1];
  char v21 = *((unsigned char *)v20 + 48);
  long long v22 = *((_OWORD *)v20 + 2);
  *(_OWORD *)&uint8_t buf[16] = *((_OWORD *)v20 + 1);
  long long v33 = v22;
  char v34 = v21;
  char v23 = +[NSSet setWithSet:v9];
  [(CLIndoorProvider *)self requestLocationTilesForGroup:v23 usingAvailabilityTile:buf forAction:1];

  sub_100091F70((uint64_t)__p);
}

- (void)startUpdatingLocationDeferred:(id)a3
{
  id v4 = a3;
  if (self->_deferredState.m_initialized)
  {
    sub_1000AE4B0(v27, "");
    sub_100267DC4("startUpdatingLocationDeferred must be entered without a deferredState", (std::string *)__p);
    sub_10016A2C4((uint64_t)v27, (uint64_t)__p, 1);
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    if (SHIBYTE(v27[2]) < 0) {
      operator delete(v27[0]);
    }
    sub_1000D11E0((uint64_t)v18);
  }
  if ([v4 isStaleFix:std::chrono::steady_clock::now().__d_.__rep_])
  {
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
    }
    id v5 = (id)qword_10047BF00;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (v4)
      {
        [v4 gpsLocation];
        uint64_t v6 = *(void *)((char *)v38 + 12);
        [v4 gpsLocation];
        uint64_t v7 = *((void *)&v31 + 1);
        [v4 gpsLocation];
        uint64_t v8 = *(void *)((char *)&v19 + 4);
      }
      else
      {
        uint64_t v8 = 0;
        uint64_t v7 = 0;
        uint64_t v6 = 0;
        long long v40 = 0u;
        memset(v41, 0, sizeof(v41));
        long long v39 = 0u;
        long long v37 = 0u;
        memset(v38, 0, sizeof(v38));
        long long v36 = 0u;
        memset(__p, 0, sizeof(__p));
        long long v33 = 0u;
        memset(v34, 0, sizeof(v34));
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v28 = 0u;
        memset(v27, 0, sizeof(v27));
        long long v25 = 0u;
        memset(v26, 0, sizeof(v26));
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        *(_OWORD *)id v18 = 0u;
      }
      *(_DWORD *)std::string buf = 134349568;
      uint64_t v43 = v6;
      __int16 v44 = 2050;
      uint64_t v45 = v7;
      __int16 v46 = 2050;
      uint64_t v47 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CLIndoorProvider] startUpdatingLocationDeferred. Skip, stale location, %{public}lf, %{public}lf, %{public}.2lf", buf, 0x20u);
    }

    sub_100092088((uint64_t)__p, "deferred startUpdatingLocationAtLocation - location");
    id v13 = [(CLIndoorProvider *)self mutableDeferredState];
    id v14 = v13;
    uint64_t v15 = *(void *)__p;
    if (*((unsigned char *)v13 + 8))
    {
      *(void *)__n128 __p = 0;
      id v16 = (void *)v13[2];
      v13[2] = v15;
    }
    else
    {
      v13[2] = *(id *)__p;
      *(_OWORD *)(v14 + 3) = *(_OWORD *)&__p[8];
      char v17 = *(void **)__p;
      v14[5] = *(void *)&__p[24];
      memset(__p, 0, sizeof(__p));

      *((unsigned char *)v14 + 8) = 1;
    }
    sub_100091F70((uint64_t)__p);
  }
  else
  {
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
    }
    id v9 = (id)qword_10047BF00;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v4)
      {
        [v4 gpsLocation];
        uint64_t v10 = *(void *)&__p[4];
        [v4 gpsLocation];
        uint64_t v11 = *(uint64_t *)((char *)&v27[1] + 4);
        [v4 gpsLocation];
        uint64_t v12 = *(void *)((char *)&v19 + 4);
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v11 = 0;
        uint64_t v10 = 0;
        long long v40 = 0u;
        memset(v41, 0, sizeof(v41));
        long long v39 = 0u;
        long long v37 = 0u;
        memset(v38, 0, sizeof(v38));
        long long v36 = 0u;
        memset(__p, 0, sizeof(__p));
        long long v33 = 0u;
        memset(v34, 0, sizeof(v34));
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v28 = 0u;
        memset(v27, 0, sizeof(v27));
        long long v25 = 0u;
        memset(v26, 0, sizeof(v26));
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        *(_OWORD *)id v18 = 0u;
      }
      *(_DWORD *)std::string buf = 134284033;
      uint64_t v43 = v10;
      __int16 v44 = 2049;
      uint64_t v45 = v11;
      __int16 v46 = 2050;
      uint64_t v47 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[CLIndoorProvider] startUpdatingLocationDeferred. Starting at latlon: %{private}.8lf,%{private}.8lf, %{public}.2lf", buf, 0x20u);
    }

    [(CLIndoorProvider *)self startUpdatingLocationAtLocation:v4];
  }
}

- (void)onQueueInterruptDownloads:(int)a3
{
  [(CLIndoorProvider *)self setCurrentForegroundFetchRequest:0];
}

- (void)stopUpdatingLocation
{
}

- (void)onQueueStopUpdatingLocation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    id v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_3:
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "stopUpdatingLocation", buf, 2u);
  }
LABEL_4:
  if (self->_deferredState.m_initialized && self->_anon_11[7])
  {
    sub_100091F70((uint64_t)&self->_anon_11[15]);
    self->_anon_11[7] = 0;
  }
  if (!self->_serviceLocalizer.__ptr_.__value_ && ![(CLIndoorProvider *)self localizationStarted])
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v7 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      uint64_t v7 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
    }
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "request to stop localizing indoor is ignored because no localization active", v8, 2u);
    goto LABEL_13;
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    uint64_t v6 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v6 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_11:
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "request to stop localizing indoor", v9, 2u);
  }
LABEL_12:
  [(CLIndoorProvider *)self stopLocalizer];
LABEL_13:
  [(CLIndoorProvider *)self onQueueInterruptDownloads:v3];
  [(CLIndoorProvider *)self setLocalizationActive:0];
}

- (void)stopLocalizer
{
  if (qword_10047BEF8 == -1)
  {
    uint64_t v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  uint64_t v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_3:
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopLocalizer", buf, 2u);
  }
LABEL_4:
  if (!self->_serviceLocalizer.__ptr_.__value_) {
    goto LABEL_23;
  }
  if (qword_10047BEF8 == -1)
  {
    id v4 = (id)qword_10047BF00;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  id v4 = (id)qword_10047BF00;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
LABEL_7:
    unsigned int v5 = [(CLIndoorProvider *)self localizationActive];
    unsigned int v6 = [(CLIndoorProvider *)self localizationStarted];
    *(_DWORD *)std::string buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v5;
    LOWORD(v21) = 1024;
    *(_DWORD *)((char *)&v21 + 2) = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "estimation stopped. active=%d, started = %d", buf, 0xEu);
  }
LABEL_8:

  ptr = self->_localizationSensorCollection.__ptr_;
  (*(void (**)(LocalizerApi *))(*(void *)self->_serviceLocalizer.__ptr_.__value_ + 32))(self->_serviceLocalizer.__ptr_.__value_);
  uint64_t v8 = self->_sensorLogger.__ptr_;
  if (v8 && sub_10015969C((uint64_t)v8))
  {
    (*(void (**)(SensorCollection *, uint64_t))(*(void *)ptr + 32))(ptr, 2);
    sub_10015654C(self->_sensorLogger.__ptr_);
  }
  value = self->_serviceLocalizer.__ptr_.__value_;
  self->_serviceLocalizer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(LocalizerApi *))(*(void *)value + 8))(value);
  }
  uint64_t v10 = self->_sensorLogger.__ptr_;
  if (v10)
  {
    uint64_t v11 = (char *)v10 + 24;
    cntrl = self->_sensorLogger.__cntrl_;
    *(void *)std::string buf = v11;
    *(void *)&long long v21 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    sub_10036BBF8((uint64_t)ptr, buf);
    id v13 = (std::__shared_weak_count *)v21;
    if ((void)v21 && !atomic_fetch_add((atomic_ullong *volatile)(v21 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    id v14 = self->_sensorLogger.__cntrl_;
    self->_sensorLogger.__ptr_ = 0;
    self->_sensorLogger.__cntrl_ = 0;
    if (v14 && !atomic_fetch_add((atomic_ullong *volatile)v14 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)v14 + 16))(v14);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v14);
    }
  }
  self->_localizationSessionMetrics.sessionStopTimeNanos.__rep_ = sub_100048550();
  sub_10037EBB4((uint64_t)&self->_localizationSessionMetrics);
  long long v21 = 0u;
  memset(v22, 0, sizeof(v22));
  *(_OWORD *)&self->_localizationSessionMetrics.avgNumOfSelectedLocations = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.numOfIncomingVIOEstimates = 0u;
  long long v15 = v22[0];
  *(_OWORD *)&self->_localizationSessionMetrics.sessionStartTimeNanos.__rep_ = v21;
  *(_OWORD *)&self->_localizationSessionMetrics.ttffNanos.__rep_ = v15;
  *(_OWORD *)&self->_localizationSessionMetrics.avgHorizontalAccuracy = v22[1];
LABEL_23:
  [(CLIndoorProvider *)self setLocalizationStarted:0];
  indoorUniverse = self->_indoorUniverse;
  self->_indoorUniverse = 0;

  lastOutdoorPositionAvailable = self->_lastOutdoorPositionAvailable;
  self->_lastOutdoorPositionAvailable = 0;

  v18[0] = 0;
  [(CLIndoorProvider *)self setSelectedLocation:v18];
  if (v18[0]) {
    sub_1000748BC(v19);
  }
}

- (void)gpsSignalQualityAvailable:(id)a3
{
  id v4 = a3;
  if (self->_serviceLocalizer.__ptr_.__value_) {
    goto LABEL_2;
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B230);
    unsigned int v5 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_5;
    }
LABEL_2:

    return;
  }
  unsigned int v5 = qword_10047BF00;
  if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
    goto LABEL_2;
  }
LABEL_5:
  *(_WORD *)unsigned int v6 = 0;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ignoring GPS signal quality - not localizing yet", v6, 2u);
}

- (void)clpOutdoorEstimatorLogEntryNotificationAvailable:(id)a3
{
  id v4 = a3;
  if (self->_serviceLocalizer.__ptr_.__value_)
  {
    if (qword_10047BEF8 == -1)
    {
      id v9 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B230);
      id v9 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_6;
      }
    }
    LOWORD(__p) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Receiving CLPOutdoorEstimatorLogEntry notification", (uint8_t *)&__p, 2u);
LABEL_6:
    sub_100016A80((uint64_t)v20);
    sub_1000FDE70((uint64_t)v19);
    if (v4)
    {
      [v4 serializedOutdoorEstimatorLogEntry];
    }
    else
    {
      __n128 __p = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
    wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
    if (SHIBYTE(v15) < 0) {
      operator delete(__p);
    }
    uint64_t v5 = *(void *)(*(uint64_t (**)(LocalizerApi *))(*(void *)self->_serviceLocalizer.__ptr_.__value_
                                                              + 120))(self->_serviceLocalizer.__ptr_.__value_);
    sub_10035F7D8(&__p, (uint64_t)v20, (uint64_t)v19);
    unsigned int v6 = operator new(0x108uLL);
    v6[1] = 0;
    v6[2] = 0;
    *unsigned int v6 = off_100454870;
    v6[4] = __p;
    sub_1000FE5B4((uint64_t)(v6 + 5), (uint64_t)&v14);
    sub_100018854((uint64_t)(v6 + 17), (uint64_t)v16);
    *((_DWORD *)v6 + 6) = 21;
    char v17 = (char *)(v6 + 3);
    id v18 = (std::__shared_weak_count *)v6;
    sub_100041DEC(v5, (uint64_t)&v17);
    uint64_t v7 = v18;
    if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      sub_1000428B0((uint64_t)v16);
      sub_1000FE82C(&v14);
      ptr = self->_sensorLogger.__ptr_;
      if (ptr)
      {
LABEL_18:
        if (self->_localizationActive) {
          sub_10015C5F0((uint64_t)ptr);
        }
      }
    }
    else
    {
      sub_1000428B0((uint64_t)v16);
      sub_1000FE82C(&v14);
      ptr = self->_sensorLogger.__ptr_;
      if (ptr) {
        goto LABEL_18;
      }
    }
    sub_1000FE82C(v19);
    sub_1000428B0((uint64_t)v20);
    goto LABEL_21;
  }
  if (qword_10047BEF8 == -1)
  {
    uint64_t v11 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
LABEL_11:
    LOWORD(__p) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ignoring outdoor estimator update notification - not localizing yet", (uint8_t *)&__p, 2u);
    goto LABEL_21;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  uint64_t v11 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
LABEL_21:
}

- (void)clVisionNotificationVIOEstimationAvailable:(id)a3
{
  id v4 = a3;
  if (qword_10047BEF8 == -1)
  {
    uint64_t v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  uint64_t v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(__p) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Receiving CLVision notification - VIOEstimation", (uint8_t *)&__p, 2u);
  }
LABEL_4:
  sub_100016A80((uint64_t)v17);
  sub_1000E833C((uint64_t)v16);
  if (v4)
  {
    [v4 serializedVIOEstimation];
  }
  else
  {
    __n128 __p = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
  if (SHIBYTE(v12) < 0) {
    operator delete(__p);
  }
  uint64_t v6 = *(void *)(*(uint64_t (**)(LocalizerApi *))(*(void *)self->_serviceLocalizer.__ptr_.__value_ + 120))(self->_serviceLocalizer.__ptr_.__value_);
  sub_10035F428(&__p, (uint64_t)v17, (uint64_t)v16);
  uint64_t v7 = operator new(0x108uLL);
  v7[1] = 0;
  v7[2] = 0;
  void *v7 = off_100454870;
  v7[4] = __p;
  sub_1000EF490((uint64_t)(v7 + 5), (uint64_t)&v11);
  sub_100018854((uint64_t)(v7 + 18), (uint64_t)v13);
  *((_DWORD *)v7 + 6) = 18;
  uint64_t v14 = (char *)(v7 + 3);
  uint64_t v15 = (std::__shared_weak_count *)v7;
  sub_100041DEC(v6, (uint64_t)&v14);
  uint64_t v8 = v15;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    sub_1000428B0((uint64_t)v13);
    sub_1000EF770(&v11);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr) {
      goto LABEL_14;
    }
  }
  else
  {
    sub_1000428B0((uint64_t)v13);
    sub_1000EF770(&v11);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr) {
      goto LABEL_14;
    }
  }
  if (self->_localizationActive) {
    sub_10015C39C((uint64_t)ptr);
  }
LABEL_14:
  ++self->_localizationSessionMetrics.numOfIncomingVIOEstimates;
  sub_1000EF770(v16);
  sub_1000428B0((uint64_t)v17);
}

- (void)clVisionNotificationVLLocalizationResultAvailable:(id)a3
{
  id v4 = a3;
  if (qword_10047BEF8 == -1)
  {
    uint64_t v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B230);
  uint64_t v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(__p) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Receiving CLVision notification - VLLocalizationResult", (uint8_t *)&__p, 2u);
  }
LABEL_4:
  sub_100016A80((uint64_t)v17);
  sub_1000E8488((uint64_t)v16);
  if (v4)
  {
    [v4 serializedVLLocalizationResult];
  }
  else
  {
    __n128 __p = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
  if (SHIBYTE(v12) < 0) {
    operator delete(__p);
  }
  uint64_t v6 = *(void *)(*(uint64_t (**)(LocalizerApi *))(*(void *)self->_serviceLocalizer.__ptr_.__value_ + 120))(self->_serviceLocalizer.__ptr_.__value_);
  sub_10035F584(&__p, (uint64_t)v17, (uint64_t)v16);
  uint64_t v7 = operator new(0x108uLL);
  v7[1] = 0;
  v7[2] = 0;
  void *v7 = off_100454870;
  v7[4] = __p;
  sub_1000FA680((uint64_t)(v7 + 5), (uint64_t)&v11);
  sub_100018854((uint64_t)(v7 + 14), (uint64_t)v13);
  *((_DWORD *)v7 + 6) = 19;
  uint64_t v14 = (char *)(v7 + 3);
  uint64_t v15 = (std::__shared_weak_count *)v7;
  sub_100041DEC(v6, (uint64_t)&v14);
  uint64_t v8 = v15;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    sub_1000428B0((uint64_t)v13);
    sub_1000FA868(&v11);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr) {
      goto LABEL_14;
    }
  }
  else
  {
    sub_1000428B0((uint64_t)v13);
    sub_1000FA868(&v11);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr) {
      goto LABEL_14;
    }
  }
  if (self->_localizationActive) {
    sub_10015C4B8((uint64_t)ptr);
  }
LABEL_14:
  ++self->_localizationSessionMetrics.numOfIncomingVLLocalizationResults;
  sub_1000FA868(v16);
  sub_1000428B0((uint64_t)v17);
}

- (void)setXpcConnection:(id)a3
{
}

- (shared_ptr<ITileDb>)fsDb
{
  cntrl = self->_fsDb.__cntrl_;
  unsigned char *v2 = self->_fsDb.__ptr_;
  v2[1] = (ITileDb *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ITileDb *)self;
  return result;
}

- (CLIndoorTilePrefetcher)prefetcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prefetcher);

  return (CLIndoorTilePrefetcher *)WeakRetained;
}

- (int)prefetchFloorLimitIndoor
{
  return self->_prefetchFloorLimitIndoor;
}

- (int)prefetchFloorLimitRegional
{
  return self->_prefetchFloorLimitRegional;
}

- (int)prefetchByteSizeLimitIndoor
{
  return self->_prefetchByteSizeLimitIndoor;
}

- (int)prefetchByteSizeLimitRegional
{
  return self->_prefetchByteSizeLimitRegional;
}

- (float)numOfDaysBeforeIndoorTileRedownload
{
  return self->_numOfDaysBeforeIndoorTileRedownload;
}

- (void)setNumOfDaysBeforeIndoorTileRedownload:(float)a3
{
  self->_numOfDaysBeforeIndoorTileRedownload = a3;
}

- (float)numOfDaysBeforeRegionalTileRedownload
{
  return self->_numOfDaysBeforeRegionalTileRedownload;
}

- (void)setNumOfDaysBeforeRegionalTileRedownload:(float)a3
{
  self->_numOfDaysBeforeRegionalTileRedownload = a3;
}

- (BOOL)demoRunStarted
{
  return self->_demoRunStarted;
}

- (void)setDemoRunStarted:(BOOL)a3
{
  self->_demoRunStarted = a3;
}

- (CLIndoorLocation)latestFix
{
  return self->_latestFix;
}

- (void)setLatestFix:(id)a3
{
}

- (void)setIsRegionalEnabled:(BOOL)a3
{
  self->_isRegionalEnabled = a3;
}

- (CLIndoorUniverse)indoorUniverse
{
  return self->_indoorUniverse;
}

- (void)setIndoorUniverse:(id)a3
{
}

- (void).cxx_destruct
{
  if (self->_selectedLocation.m_initialized)
  {
    sub_1000748BC((a8 *)((char *)&self->_selectedLocation.m_storage.dummy_.aligner_ + 7));
    self->_selectedLocation.m_initialized = 0;
  }
  cntrl = self->_fsDb.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_currentForegroundFetchRequest, 0);
  objc_storeStrong((id *)&self->_indoorUniverse, 0);
  objc_storeStrong((id *)&self->_latestFix, 0);
  objc_storeStrong((id *)&self->_workdir, 0);
  objc_destroyWeak((id *)&self->_prefetcher);
  objc_destroyWeak((id *)&self->_xpcConnection);
  id v4 = self->_sensorMetricsObserver.__cntrl_;
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_avlVenuesStateMachine, 0);
  objc_storeStrong((id *)&self->_lastNonGpsPositionAvailable, 0);
  objc_storeStrong((id *)&self->_lastGpsPositionAvailable, 0);
  objc_storeStrong((id *)&self->_lastOutdoorPositionAvailable, 0);
  if (self->_params.m_initialized)
  {
    uint64_t v5 = *(void *)&self->_anon_251[7];
    *(void *)&self->_anon_251[7] = 0;
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
    self->_params.m_initialized = 0;
  }
  if (self->_paramOverrides.m_initialized)
  {
    sub_10006E2E4((a8 *)((char *)&self->_paramOverrides.m_storage.dummy_.aligner_ + 7));
    self->_paramOverrides.m_initialized = 0;
  }
  uint64_t v6 = self->_sensorLogger.__cntrl_;
  if (!v6 || atomic_fetch_add((atomic_ullong *volatile)v6 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (!self->_possibleLocationObserver.m_initialized) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  (*(void (**)(__shared_weak_count *))(*(void *)v6 + 16))(v6);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  if (self->_possibleLocationObserver.m_initialized)
  {
LABEL_18:

    self->_possibleLocationObserver.m_initialized = 0;
  }
LABEL_19:
  if (self->_localizerObserver.m_initialized)
  {

    self->_localizerObserver.m_initialized = 0;
  }
  uint64_t v7 = self->_scanPriorityObserver.__cntrl_;
  if (v7 && !atomic_fetch_add((atomic_ullong *volatile)v7 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v7 + 16))(v7);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
    uint64_t v8 = self->_localizationSensorCollection.__cntrl_;
    if (!v8) {
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v8 = self->_localizationSensorCollection.__cntrl_;
    if (!v8) {
      goto LABEL_29;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v8 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v8 + 16))(v8);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v8);
  }
LABEL_29:
  id v9 = self->_eventBuses.__cntrl_;
  if (v9 && !atomic_fetch_add((atomic_ullong *volatile)v9 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v9 + 16))(v9);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
    uint64_t v10 = self->_platformInfo.__cntrl_;
    if (!v10) {
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v10 = self->_platformInfo.__cntrl_;
    if (!v10) {
      goto LABEL_35;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v10 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v10 + 16))(v10);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10);
  }
LABEL_35:
  if (!self->_simulation.m_initialized) {
    goto LABEL_41;
  }
  uint64_t v11 = *(std::__shared_weak_count **)&self->_anon_59[31];
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
    if (((char)self->_anon_59[22] & 0x80000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if ((char)self->_anon_59[22] < 0) {
LABEL_39:
  }
    operator delete(*(void **)((char *)&self->_simulation.m_storage.dummy_.aligner_ + 7));
LABEL_40:
  self->_simulation.m_initialized = 0;
LABEL_41:
  value = self->_serviceLocalizer.__ptr_.__value_;
  self->_serviceLocalizer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(LocalizerApi *))(*(void *)value + 8))(value);
  }
  id v13 = self->_floorEnvironmentLoader.__ptr_.__value_;
  self->_floorEnvironmentLoader.__ptr_.__value_ = 0;
  if (v13) {
    (*(void (**)(FloorEnvironmentLoader *))(*(void *)v13 + 8))(v13);
  }
  if (self->_deferredState.m_initialized)
  {
    if (self->_anon_11[7])
    {
      sub_100091F70((uint64_t)&self->_anon_11[15]);
      self->_anon_11[7] = 0;
    }

    self->_deferredState.m_initialized = 0;
  }
}

@end