@interface NINearbyUpdatesEngine
- (AoARad)_convertFromPointingCoordinatesToSpatial:(const void *)a3;
- (BOOL)_shouldConsumeRoseSolution:(const void *)a3;
- (FindeeAlgorithmConfig)_getFindeeAlgorithmConfig;
- (NIConfiguration)configuration;
- (NINearbyUpdatesEngine)initWithConfiguration:(id)a3 queue:(id)a4 delegate:(id)a5 dataSource:(id)a6 analyticsManager:(id)a7 protobufLogger:(shared_ptr<rose:(id *)a9 :protobuf::Logger>)a8 error:;
- (NINearbyUpdatesEngineDataSource)dataSource;
- (NINearbyUpdatesEngineDelegate)delegate;
- (NIServerAnalyticsManager)analyticsManager;
- (PeopleFinderAlgorithmConfig)_getPeopleFinderAlgorithmConfig;
- (PeopleFinderAlgorithmConfig)_getPeopleFinderAlgorithmConfigForPeerSessions;
- (double)_getRangeUncertaintyWhenBiasEstimateNotAvailable;
- (id).cxx_construct;
- (id)_configureForRegionMonitoring:(id)a3;
- (id)_consolidateInputToMLModel:(const void *)a3;
- (id)_handleRangeAndAoASolution:(const void *)a3;
- (id)_handleRangeOnlySolution:(const void *)a3;
- (id)configure:(id)a3;
- (id)nearbyObjectFromDeviceIdentifier:(unint64_t)a3;
- (id)nearbyObjectFromRangeResult:(const void *)a3;
- (id)nearbyObjectFromSolution:(const void *)a3;
- (id)nearbyObjectFromSolution:(const void *)a3 forPeer:(id)a4;
- (id)nearbyObjectFromToken:(id)a3;
- (id)niConvergenceStateFromSolution:(const void *)a3;
- (int)_setReadValidateDefaultsWriteForTypeOfPredictor;
- (set<NIRegionSizeCategory,)_getRegionSizeCategoriesFromRegions:(std:(NINearbyUpdatesEngine *)self :(SEL)a3 allocator<NIRegionSizeCategory>> *__return_ptr)retstr;
- (void)_configureRangeBiasEstimator;
- (void)_createDeviceFinderAlgoContainer;
- (void)_createFindeeAlgoContainer;
- (void)_createPeerFindingAlgoContainer;
- (void)_createPeopleFinderAlgoContainer;
- (void)_createSyntheticApertureAlgoContainer;
- (void)_handleBoundedRegionRange:(double)a3 forDevice:(unint64_t)a4 rangeResult:(optional<nearby::algorithms::common::RangeResult> *)a5;
- (void)_handleDeviceMonitorActivation:(BOOL)a3 forDevice:(unint64_t)a4 timestamp:(double)a5 regionSizeCategory:(int)a6 regions:(optional<std:(int)a8 :vector<nearby::algorithms::region_monitoring::Region>> *)a7 predictorType:;
- (void)_handleRegionChangeForDevice:(unint64_t)a3 currentRegion:(optional<nearby::algorithms::region_monitoring::Region> *)a4 prevRegion:timestamp:rangeResult:intentPrediction:regionTransitionSuppressed:;
- (void)_handleWiFiRangeResults:(const void *)a3;
- (void)_sendTimeTupleToAlgorithms;
- (void)acceptAltimeterData:(const AltimeterInput *)a3;
- (void)acceptBluetoothSample:(const void *)a3 coarseEstimation:(BOOL)a4 regionCategory:(int64_t)a5;
- (void)acceptDeviceMotion:(const void *)a3;
- (void)acceptDeviceMotionInput:(const void *)a3;
- (void)acceptDevicePDRInput:(const void *)a3;
- (void)acceptDiscoveryEventForPeer:(id)a3;
- (void)acceptGnssSatelliteData:(const void *)a3;
- (void)acceptHeadingData:(const HeadingInput *)a3;
- (void)acceptMagneticFieldStrength:(double)a3;
- (void)acceptMotionActivity:(const MotionActivityInput *)a3;
- (void)acceptPedometerData:(const PedometerDataInput *)a3;
- (void)acceptPedometerEvent:(const PedometerEventInput *)a3;
- (void)acceptPeerData:(const void *)a3 fromPeer:(id)a4;
- (void)acceptPeerDeviceType:(BOOL)a3;
- (void)acceptPeerLocationData:(const LocationInput *)a3 forPeer:(id)a4;
- (void)acceptRoseSolution:(const void *)a3;
- (void)acceptRoseSolution:(const void *)a3 withProcessingOptions:(const AlgorithmProcessingOptions *)a4;
- (void)acceptSelfLocationData:(const LocationInput *)a3;
- (void)acceptUnsuccessfulRoseSolution:(const void *)a3;
- (void)acceptVisionInput:(id)a3;
- (void)acceptWatchOrientation:(const WatchOrientationInput *)a3;
- (void)acceptWiFiRangeResults:(const void *)a3;
- (void)clearStateForToken:(id)a3;
- (void)fillNearbyObject:(id)a3 fromRangeResult:(const void *)a4;
- (void)fillNearbyObject:(id)a3 fromSolution:(const void *)a4;
- (void)getPeerDataFromFindingContainerWithToken:(id)a3;
- (void)invalidate;
- (void)logSolution:(const void *)a3;
- (void)probeRegions;
- (void)processUWBResultForRegionMonitoring:(id)a3 roseSolution:(const void *)a4 processingOptions:(const AlgorithmProcessingOptions *)a5;
- (void)processUWBResultForSyntheticAperture:(id)a3 roseSolution:(const void *)a4;
- (void)provideFindingSolution:(id)a3;
- (void)reportAndLogNearbyObject:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFindingPeerToken:(id)a3;
@end

@implementation NINearbyUpdatesEngine

- (NINearbyUpdatesEngine)initWithConfiguration:(id)a3 queue:(id)a4 delegate:(id)a5 dataSource:(id)a6 analyticsManager:(id)a7 protobufLogger:(shared_ptr<rose:(id *)a9 :protobuf::Logger>)a8 error:
{
  v10 = v9;
  id v17 = a3;
  id v40 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
LABEL_23:
    v37 = +[NSAssertionHandler currentHandler];
    [v37 handleFailureInMethod:a2, self, @"NIServerNearbyUpdatesEngine.mm", 192, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v19) {
      goto LABEL_4;
    }
    goto LABEL_24;
  }
  v36 = +[NSAssertionHandler currentHandler];
  [v36 handleFailureInMethod:a2, self, @"NIServerNearbyUpdatesEngine.mm", 191, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

  if (!v18) {
    goto LABEL_23;
  }
LABEL_3:
  if (v19) {
    goto LABEL_4;
  }
LABEL_24:
  v38 = +[NSAssertionHandler currentHandler];
  [v38 handleFailureInMethod:a2, self, @"NIServerNearbyUpdatesEngine.mm", 193, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];

LABEL_4:
  if (!a8.__ptr_)
  {
    v39 = +[NSAssertionHandler currentHandler];
    [v39 handleFailureInMethod:a2, self, @"NIServerNearbyUpdatesEngine.mm", 196, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  v43.receiver = self;
  v43.super_class = (Class)NINearbyUpdatesEngine;
  v21 = [(NINearbyUpdatesEngine *)&v43 init];
  v22 = v21;
  v23 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_queue, a4);
    objc_storeWeak((id *)&v22->_configuration, v18);
    objc_storeWeak((id *)&v22->_previousNIObjectUpdate, v19);
    v25 = *v10;
    v24 = v10[1];
    if (v24) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v24 + 1, 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v23->_protobufLogger.__cntrl_;
    v23->_protobufLogger.__ptr_ = v25;
    v23->_protobufLogger.__cntrl_ = (__shared_weak_count *)v24;
    if (cntrl) {
      sub_10001A970(cntrl);
    }
    objc_storeStrong((id *)&v22->_dataSource, a7);
    if (v19)
    {
      [v19 uniqueIdentifierForEngine:v23];
    }
    else
    {
      long long v41 = 0uLL;
      uint64_t v42 = 0;
    }
    p_uniqueIdentifier = (void **)&v22->_uniqueIdentifier;
    if (*((char *)&v23->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
      operator delete(*p_uniqueIdentifier);
    }
    *(_OWORD *)p_uniqueIdentifier = v41;
    *((void *)&v22->_uniqueIdentifier.__r_.__value_.var0.var1 + 2) = v42;
    v23->_rangeMeasSourcePref = 0;
    uint64_t v29 = objc_opt_new();
    value = v23->_syntheticApertureFilter.__ptr_.__value_;
    v23->_syntheticApertureFilter.__ptr_.__value_ = (SyntheticApertureFilter *)v29;

    LOBYTE(v23->_convStateForObject) = 1;
    v31 = +[NSUserDefaults standardUserDefaults];
    LOBYTE(v23->_cachedMagneticFieldStrength.var0.__val_.value) = [v31 BOOLForKey:@"NIFindingOnlySendKinematicPeerData"];

    *(_OWORD *)&v23->_findingLatencyBookkeeping.receivedFirstMeasurement = 0u;
    *(_OWORD *)&v23->_cachedMagneticFieldStrength.__engaged_ = 0u;
    double lastProcessTimeSeconds = v23->_findingLatencyBookkeeping.lastProcessTimeSeconds;
    v23->_findingLatencyBookkeeping.double lastProcessTimeSeconds = 0.0;

    v33 = [(NINearbyUpdatesEngine *)v23 configure:v17];
    v34 = v33;
    if (v33)
    {
      v27 = 0;
      *(void *)a8.__ptr_ = v33;
    }
    else
    {
      v27 = v23;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)_configureRangeBiasEstimator
{
  LOBYTE(self->_convStateForObject) = 0;
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 objectForKey:@"NIHomeBypassResponderBiasEstimation"];

  if (v4)
  {
    unsigned int v5 = [v3 BOOLForKey:@"NIHomeBypassResponderBiasEstimation"];
    LOBYTE(self->_convStateForObject) = v5;
    if (v5) {
      goto LABEL_3;
    }
  }
  else if (LOBYTE(self->_convStateForObject))
  {
LABEL_3:
    v6 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Bypassing range bias estimation", buf, 2u);
    }
    goto LABEL_17;
  }
  if (byte_1008A9E57 >= 0) {
    v7 = &qword_1008A9E40;
  }
  else {
    v7 = (uint64_t *)qword_1008A9E40;
  }
  v8 = +[NSString stringWithUTF8String:v7];
  if (byte_1008A9E6F >= 0) {
    v9 = &qword_1008A9E58;
  }
  else {
    v9 = (uint64_t *)qword_1008A9E58;
  }
  v10 = +[NSString stringWithUTF8String:v9];
  v11 = [[NIMLModelResourceFileHandler alloc] initWithResourceBundleDirectory:v8 bundleName:v10];
  v12 = objc_alloc_init(RangeBiasEstimatorSingleAntennaModel);
  value = self->_findingAlgorithmContainer.__ptr_.__value_;
  self->_findingAlgorithmContainer.__ptr_.__value_ = (NRBYFindingContainer *)v12;

  if (([(NRBYFindingContainer *)self->_findingAlgorithmContainer.__ptr_.__value_ configureWithResourceFileHandler:v11] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042F960();
    }
    LOBYTE(self->_convStateForObject) = 1;
  }

LABEL_17:
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    if (LOBYTE(self->_convStateForObject))
    {
      LOBYTE(v24[0]) = 0;
      char v25 = 0;
      sub_10029FB24((uint64_t)ptr, 0, 0, (uint64_t)v24);
      if (v25)
      {
        v15 = (void *)v24[0];
        if (v24[0])
        {
          v24[1] = v24[0];
LABEL_27:
          operator delete(v15);
        }
      }
    }
    else
    {
      *(void *)buf = 0;
      v22 = 0;
      uint64_t v23 = 0;
      sub_10031F564(buf, &unk_1004C0A38, (uint64_t)&xmmword_1004C0A90, 0xBuLL);
      v16 = self->_protobufLogger.__ptr_;
      id v18 = 0;
      uint64_t v19 = 0;
      __p = 0;
      sub_10015036C(&__p, *(const void **)buf, (uint64_t)v22, ((uint64_t)v22 - *(void *)buf) >> 3);
      char v20 = 1;
      sub_10029FB24((uint64_t)v16, 1, 0x100000002, (uint64_t)&__p);
      if (v20 && __p)
      {
        id v18 = __p;
        operator delete(__p);
      }
      v15 = *(void **)buf;
      if (*(void *)buf)
      {
        v22 = *(const void **)buf;
        goto LABEL_27;
      }
    }
  }
}

- (id)configure:(id)a3
{
  id v5 = a3;
  v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v35) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#nrby-eng,configure", (uint8_t *)&v35, 2u);
  }
  p_accumulatedExcessSeconds = &self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
  objc_storeStrong((id *)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NINearbyUpdatesEngine *)self _configureRangeBiasEstimator];
    id v8 = *(id *)p_accumulatedExcessSeconds;
    v9 = [v8 monitoredRegions];
    v10 = [(NINearbyUpdatesEngine *)self _configureForRegionMonitoring:v9];

    self->_rangeMeasSourcePref = 1;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = 0;
    self->_rangeMeasSourcePref = 1;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = *(id *)p_accumulatedExcessSeconds;
    v12 = [v11 debugParameters];
    if (v12)
    {
      v13 = [v11 debugParameters];
      v14 = [v13 objectForKey:@"enableAdditionalUWBSignalFeatures"];
      BOOL v15 = v14 == 0;

      if (!v15) {
        [(NINearbyUpdatesEngine *)self _configureRangeBiasEstimator];
      }
    }
    self->_rangeMeasSourcePref = 0;

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_15:
    v10 = 0;
    goto LABEL_18;
  }
  id v16 = *(id *)p_accumulatedExcessSeconds;
  id v17 = [v16 monitoredRegions];
  BOOL v18 = v17 == 0;

  if (v18)
  {
    uint64_t v19 = [v16 innerBoundary];
    v37[0] = v19;
    char v20 = [v16 outerBoundary];
    v37[1] = v20;
    v21 = +[NSArray arrayWithObjects:v37 count:2];
    v10 = [(NINearbyUpdatesEngine *)self _configureForRegionMonitoring:v21];
  }
  else
  {
    uint64_t v19 = [v16 monitoredRegions];
    v10 = [(NINearbyUpdatesEngine *)self _configureForRegionMonitoring:v19];
  }

LABEL_18:
  v22 = +[NSUserDefaults standardUserDefaults];
  unsigned int v23 = [v22 BOOLForKey:@"ForcePeerFindingAlgorithms"];

  if (v23)
  {
    v24 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#nrby-eng,ForcePeerFindingAlgorithms set.  ", (uint8_t *)&v35, 2u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v25 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      p_uniqueIdentifier = &self->_uniqueIdentifier;
      if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
        p_uniqueIdentifier = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_uniqueIdentifier->__r_.__value_.var0.var1.__data_;
      }
      int v35 = 136315138;
      v36 = p_uniqueIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_configuration is NIFindingConfiguration. Unique identifier: %s", (uint8_t *)&v35, 0xCu);
    }
    id v27 = *(id *)p_accumulatedExcessSeconds;
    if ([v27 isFinder])
    {
      v28 = +[NSUserDefaults standardUserDefaults];
      unsigned int v29 = [v28 BOOLForKey:@"EnableDeviceFindingOnPhone"];

      if (v29)
      {
        v30 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#nrby-eng,For rdar://102527413 (Test hook to use Wenda arrow interface on phone), enabling device finding on phone", (uint8_t *)&v35, 2u);
        }
        [(NINearbyUpdatesEngine *)self _createDeviceFinderAlgoContainer];
      }
      else
      {
        v34 = sub_100007D00();
        if (sub_100005424(v34[144])) {
          [(NINearbyUpdatesEngine *)self _createPeopleFinderAlgoContainer];
        }
      }
    }
    else
    {
      [(NINearbyUpdatesEngine *)self _createFindeeAlgoContainer];
    }
  }
  else if (([*(id *)p_accumulatedExcessSeconds _internalIsExtendedDistanceMeasurementEnabled] | v23) == 1)
  {
    [(NINearbyUpdatesEngine *)self _createPeerFindingAlgoContainer];
  }
  else if ([*(id *)p_accumulatedExcessSeconds _internalIsCameraAssistanceEnabled])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v31 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        data = &self->_uniqueIdentifier;
        if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
          data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
        }
        int v35 = 136315138;
        v36 = data;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_configuration is NINearbyPeerConfiguration AND has camera assistance; but it does not have enhanced"
          " ranging or test mode enabled. Unique identifier: %s",
          (uint8_t *)&v35,
          0xCu);
      }
      [(NINearbyUpdatesEngine *)self _createSyntheticApertureAlgoContainer];
    }
  }

  return v10;
}

- (id)_configureForRegionMonitoring:(id)a3
{
  id v104 = a3;
  if ([v104 count])
  {
    v106 = self;
    uint64_t v4 = objc_opt_new();
    regionDict = v106->_regionDict;
    v106->_regionDict = (NSMutableDictionary *)v4;

    memset(v142, 0, sizeof(v142));
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    obuint64_t j = v104;
    id v6 = [obj countByEnumeratingWithState:&v138 objects:v220 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v139;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v139 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v138 + 1) + 8 * i);
          v10 = [NIRegionKey alloc];
          id v11 = [v9 name];
          v12 = -[NIRegionKey initWithName:regionSizeCategory:](v10, "initWithName:regionSizeCategory:", v11, [v9 regionSizeCategory]);

          [(NSMutableDictionary *)v106->_regionDict setObject:v9 forKey:v12];
          id v13 = [v9 name];
          sub_100004950(v110, (char *)[v13 UTF8String]);
          [v9 radius];
          int v15 = v14;
          unsigned int v16 = [v9 regionSizeCategory];
          id v17 = (char *)[v9 preferredUpdateRate];
          if ((unint64_t)(v17 - 1) >= 3) {
            int v18 = 1;
          }
          else {
            int v18 = v17 + 1;
          }
          uint64_t v19 = (char *)[v9 devicePresencePreset];
          if ((unint64_t)(v19 - 1) >= 6) {
            int v20 = 1;
          }
          else {
            int v20 = v19 + 1;
          }
          unsigned __int8 v21 = [v9 requiresUserIntent];
          if (SHIBYTE(v111[0]) < 0)
          {
            sub_100002DE4(__p, v110[0], (unint64_t)v110[1]);
          }
          else
          {
            *(_OWORD *)__p = *(_OWORD *)v110;
            *(void *)&__p[16] = v111[0];
          }
          *(_DWORD *)&__p[24] = v15;
          unsigned int v152 = v16;
          float v153 = *(float *)&v18;
          float v154 = *(float *)&v20;
          LOWORD(v155) = v21;
          sub_100315740((uint64_t *)v142, (long long *)__p);
          if ((__p[23] & 0x80000000) != 0) {
            operator delete(*(void **)__p);
          }
          if (SHIBYTE(v111[0]) < 0) {
            operator delete(v110[0]);
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v138 objects:v220 count:16];
      }
      while (v6);
    }

    v22 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10042F9C8(v219, (uint64_t)[(NSMutableDictionary *)v106->_regionDict count], v22);
    }

    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    unsigned int v23 = v106->_regionDict;
    id v24 = [(NSMutableDictionary *)v23 countByEnumeratingWithState:&v134 objects:v218 count:16];
    if (v24)
    {
      int v25 = 0;
      uint64_t v26 = *(void *)v135;
      do
      {
        id v27 = 0;
        do
        {
          if (*(void *)v135 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v134 + 1) + 8 * (void)v27);
          unsigned int v29 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v30 = [v28 description];
            v31 = [(NSMutableDictionary *)v106->_regionDict objectForKey:v28];
            v32 = [v31 description];
            *(_DWORD *)__p = 67109634;
            *(_DWORD *)&__p[4] = v25 + v27;
            *(_WORD *)&__p[8] = 2112;
            *(void *)&__p[10] = v30;
            *(_WORD *)&__p[18] = 2112;
            *(void *)&__p[20] = v32;
            _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "#nrby-eng,#region-class _regionDict (%d) key %@: %@", __p, 0x1Cu);
          }
          id v27 = (char *)v27 + 1;
        }
        while (v24 != v27);
        id v24 = [(NSMutableDictionary *)v23 countByEnumeratingWithState:&v134 objects:v218 count:16];
        v25 += (int)v27;
      }
      while (v24);
    }

    v33 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      p_uniqueIdentifier = (__long *)&v106->_uniqueIdentifier;
      if (*((char *)&v106->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
        p_uniqueIdentifier = (__long *)p_uniqueIdentifier->__data_;
      }
      int v35 = v106->_regionDict;
      *(_DWORD *)__p = 136315394;
      *(void *)&__p[4] = p_uniqueIdentifier;
      *(_WORD *)&__p[12] = 2112;
      *(void *)&__p[14] = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions _configureForRegionMonitoring. Unique identifier: %s. Regions: %@", __p, 0x16u);
    }

    v36 = +[NSUserDefaults standardUserDefaults];
    [v36 doubleForKey:@"RegMonFilterAlphaOverride"];
    double v38 = v37;
    [v36 doubleForKey:@"RegMonHystEnterDistMOverride"];
    double v40 = v39;
    [v36 doubleForKey:@"RegMonHystExitDistMOverride"];
    double v42 = v41;
    [v36 doubleForKey:@"HandoffUserIntentScoreThresholdOverride"];
    double v44 = v43;
    unsigned int v101 = DWORD1(xmmword_1008A9E88);
    float v45 = *(float *)&xmmword_1008A9E88;
    float v46 = *((float *)&xmmword_1008A9E88 + 3);
    float v47 = *((float *)&xmmword_1008A9E88 + 2);
    uint64_t v48 = qword_1008A9E98;
    long long v215 = unk_1008A9EC0;
    long long v216 = *(_OWORD *)&dword_1008A9ED0;
    uint64_t v217 = qword_1008A9EE0;
    long long v213 = unk_1008A9EA0;
    long long v214 = *(_OWORD *)&qword_1008A9EB0;
    if (v38 > 0.0 && v38 < 1.0)
    {
      v49 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v38;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override regMonFilterAlphaOverride = %f", __p, 0xCu);
      }

      float v45 = v38;
    }
    if (v40 > 0.0)
    {
      v50 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v40;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override regMonHystEnterDistMOverride = %f", __p, 0xCu);
      }

      float v46 = v40;
    }
    if (v42 > 0.0)
    {
      v51 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v42;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override regMonHystExitDistMOverride = %f", __p, 0xCu);
      }

      float v47 = v42;
    }
    if (v44 > 0.0)
    {
      v52 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v44;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override handoffUserIntentScoreThresholdOverride = %f", __p, 0xCu);
      }

      uint64_t v48 = *(void *)&v44;
    }
    char v53 = byte_1008A9EE8;
    long long v211 = unk_1008A9F49;
    v212[0] = *(long long *)((char *)&xmmword_1008A9F58 + 1);
    *(void *)((char *)v212 + 15) = qword_1008A9F68;
    long long v207 = unk_1008A9F09;
    long long v208 = *(long long *)((char *)&xmmword_1008A9F18 + 1);
    long long v209 = *(_OWORD *)((char *)&qword_1008A9F28 + 1);
    long long v210 = *(long long *)((char *)&xmmword_1008A9F38 + 1);
    long long v205 = unk_1008A9EE9;
    long long v206 = *(long long *)((char *)&xmmword_1008A9EF8 + 1);
    if ([v36 BOOLForKey:@"RegMonDisableRVKalmanFilter"])
    {
      v54 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__p = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override disabled rv kalman filters", __p, 2u);
      }

      char v53 = 1;
    }
    sub_10031F8BC(v133, (uint64_t)&unk_1008A9E70);
    uint64_t v100 = qword_1008A9F70;
    double v55 = *(double *)&xmmword_1008A9F78;
    long long v130 = *(long long *)((char *)&xmmword_1008A9F78 + 8);
    long long v131 = unk_1008A9F90;
    long long v132 = *(long long *)((char *)&xmmword_1008A9F98 + 8);
    uint64_t v102 = *((void *)&xmmword_1008A9FB0 + 1);
    uint64_t v103 = xmmword_1008A9FB0;
    int8x8_t v56 = (int8x8_t)qword_1008A9FC0;
    v204[0] = *(long long *)((char *)&xmmword_1008A9FF0 + 8);
    v204[1] = *(_OWORD *)&qword_1008AA008;
    long long v202 = *(_OWORD *)&qword_1008A9FD8;
    long long v203 = unk_1008A9FE8;
    long long v201 = xmmword_1008A9FC8;
    [v36 doubleForKey:@"RegMonKalmanFilterHystUpperOverride"];
    float64_t v99 = v57;
    [v36 doubleForKey:@"RegMonKalmanFilterHystLowerOverride"];
    float64_t v98 = v58;
    int v59 = [v36 integerForKey:@"RegMonKalmanFilterNStartupMeasurementsOverride"];
    [v36 doubleForKey:@"RegMonKalmanFilterProcessStdOverride"];
    double v61 = v60;
    int v62 = [v36 integerForKey:@"RegMonKalmanFilterTimeoutSeconds"];
    if (v59 > 0)
    {
      v63 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 67109120;
        *(_DWORD *)&__p[4] = v59;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override RegMonKalmanFilterNStartupMeasurementsOverride = %i", __p, 8u);
      }

      uint64_t v103 = v59;
    }
    if (v61 > 0.0)
    {
      v64 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v61;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override RegMonKalmanFilterProcessStdOverride = %f", __p, 0xCu);
      }

      double v55 = v61;
    }
    if (v62 >= 1)
    {
      v65 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 67109120;
        *(_DWORD *)&__p[4] = v62;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override RegMonKalmanFilterTimeoutSeconds = %i", __p, 8u);
      }

      uint64_t v102 = v62;
    }
    int v66 = [v36 integerForKey:@"RegMonThresholdDetectorBufferSize"];
    *(_OWORD *)v110 = xmmword_1008AA018;
    sub_10025A138(v111, (uint64_t)algn_1008AA028);
    v112[0] = xmmword_1008AA040;
    *(_OWORD *)((char *)v112 + 12) = *(long long *)((char *)&xmmword_1008AA040 + 12);
    sub_10025A21C((uint64_t)v113, &byte_1008AA060);
    long long v126 = xmmword_1008AA120;
    long long v127 = *(_OWORD *)&dword_1008AA130;
    long long v128 = xmmword_1008AA140;
    long long v122 = xmmword_1008AA0E0;
    long long v123 = unk_1008AA0F0;
    long long v124 = xmmword_1008AA100;
    long long v125 = xmmword_1008AA110;
    long long v118 = *(long long *)((char *)&xmmword_1008AA098 + 8);
    long long v119 = unk_1008AA0B0;
    long long v120 = *(long long *)((char *)&xmmword_1008AA0B8 + 8);
    long long v121 = xmmword_1008AA0D0;
    long long v116 = xmmword_1008AA080;
    uint64_t v129 = qword_1008AA150;
    long long v117 = *(_OWORD *)&byte_1008AA090;
    if (v66 >= 1) {
      LODWORD(v110[0]) = v66;
    }
    int v67 = [v36 integerForKey:@"RegMonBoundedRegionRangeEstimatorType"];
    if (v67 < 1)
    {
LABEL_86:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v71 = *(id *)&v106->_findingLatencyBookkeeping.accumulatedExcessSeconds;
        v72 = [v71 token];
        BOOL v73 = v72 == 0;

        if (!v73)
        {
          BYTE8(v116) = 1;
          LOBYTE(v117) = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (+[NSUserDefaults standardUserDefaults],
              v74 = objc_claimAutoreleasedReturnValue(),
              unsigned int v75 = [v74 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"],
              v74,
              !v75))
        {
LABEL_94:
          sub_10031F8BC((uint64_t *)__p, (uint64_t)v133);
          v76.f64[0] = v99;
          v76.f64[1] = v98;
          *(float *)&__p[24] = v45;
          unsigned int v152 = v101;
          float v153 = v47;
          float v154 = v46;
          uint64_t v155 = v48;
          long long v158 = v215;
          long long v159 = v216;
          int v160 = v217;
          long long v156 = v213;
          long long v157 = v214;
          char v161 = v53;
          long long v162 = v205;
          long long v166 = v209;
          long long v165 = v208;
          long long v164 = v207;
          long long v163 = v206;
          *(void *)&v169[15] = *(void *)((char *)v212 + 15);
          *(_OWORD *)v169 = v212[0];
          long long v168 = v211;
          long long v167 = v210;
          uint64_t v170 = v100;
          double v171 = v55;
          long long v172 = v130;
          long long v173 = v131;
          long long v174 = v132;
          uint64_t v175 = v103;
          uint64_t v176 = v102;
          int8x8_t v177 = vbsl_s8((int8x8_t)vmovn_s64(vcgtzq_f64(v76)), (int8x8_t)vcvt_f32_f64(v76), v56);
          long long v179 = v202;
          long long v180 = v203;
          v181[0] = v204[0];
          *(_OWORD *)((char *)v181 + 12) = *(_OWORD *)((char *)v204 + 12);
          long long v178 = v201;
          v181[2] = *(_OWORD *)v110;
          sub_10025A138(v182, (uint64_t)v111);
          *(_OWORD *)((char *)v183 + 12) = *(_OWORD *)((char *)v112 + 12);
          v183[0] = v112[0];
          sub_10025A21C((uint64_t)&v184, (long long *)v113);
          long long v197 = v126;
          long long v198 = v127;
          long long v199 = v128;
          uint64_t v200 = v129;
          long long v193 = v122;
          long long v194 = v123;
          long long v195 = v124;
          long long v196 = v125;
          long long v189 = v118;
          long long v190 = v119;
          long long v191 = v120;
          long long v192 = v121;
          long long v187 = v116;
          long long v188 = v117;
          HIDWORD(v106->_convStateForObject) = [(NINearbyUpdatesEngine *)v106 _setReadValidateDefaultsWriteForTypeOfPredictor];
          sub_1002BA304(v109);
          switch(HIDWORD(v106->_convStateForObject))
          {
            case 0:
              v82 = (id)qword_1008ABDE0;
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
                *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = 0xBFB999999999999ALL;
                _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor Using default user intent threshold value for (no AoA + no spatial gestures) predictor: %f", (uint8_t *)&buf, 0xCu);
              }
              goto LABEL_120;
            case 1:
            case 3:
              sub_1002BA308((uint64_t)v109, (uint64_t)&buf);
              uint64_t v77 = 0;
              int v78 = v149;
              do
              {
                v79 = (void **)((char *)&buf.__r_.__value_.__l.__data_ + v77);
                if (v150[v77] && *((char *)v79 + 55) < 0) {
                  operator delete(v79[4]);
                }
                v77 -= 32;
              }
              while (v77 != -64);
              v80 = (id)qword_1008ABDE0;
              v81 = v80;
              if (v78)
              {
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor Successfully obtained trained model weights filepath", (uint8_t *)&buf, 2u);
                }

                v82 = +[NSUserDefaults standardUserDefaults];
                v83 = [v82 objectForKey:@"SpatialGesturesIntentPredictorThresholdSingleAntenna"];
                BOOL v84 = v83 == 0;

                if (!v84)
                {
                  [v82 doubleForKey:@"SpatialGesturesIntentPredictorThresholdSingleAntenna"];
                  std::string::size_type v86 = v85;
                  v87 = (id)qword_1008ABDE0;
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
                    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v86;
                    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor Setting user intent threshold value for spatial gestures single antenna predictor: %f", (uint8_t *)&buf, 0xCu);
                  }
                }
                v88 = [v82 objectForKey:@"SpatialGesturesIntentPredictorThresholdDualAntenna"];
                BOOL v89 = v88 == 0;

                if (!v89)
                {
                  [v82 doubleForKey:@"SpatialGesturesIntentPredictorThresholdDualAntenna"];
                  std::string::size_type v91 = v90;
                  v92 = (id)qword_1008ABDE0;
                  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
                    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v91;
                    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor Setting user intent threshold value for spatial gestures dual antenna predictor: %f", (uint8_t *)&buf, 0xCu);
                  }
                }
LABEL_120:
              }
              else
              {
                if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
                  sub_10042F994();
                }

                HIDWORD(v106->_convStateForObject) = 0;
              }
LABEL_121:
              v147[3] = 0;
              v146[3] = 0;
              v145[3] = 0;
              [(NINearbyUpdatesEngine *)v106 _getRegionSizeCategoriesFromRegions:obj];
              if (v107 != &v108)
              {
                sub_1002BA308((uint64_t)v109, (uint64_t)&buf);
                operator new();
              }
              sub_10003E96C((uint64_t)&v107, v108);
              uint64_t ptr = (uint64_t)v106->_protobufLogger.__ptr_;
              if (ptr)
              {
                sub_100221F28();
                id v94 = objc_claimAutoreleasedReturnValue();
                sub_100004950(&buf, (char *)[v94 UTF8String]);
                int v143 = 0;
                char v144 = 1;
                sub_10029C7DC(ptr, (const std::string *)&v106->_uniqueIdentifier, v142, (uint64_t)__p, &buf, (uint64_t)&v143);
                if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(buf.__r_.__value_.__l.__data_);
                }
              }
              sub_10031FA1C(v145);
              sub_10031F998(v146);
              sub_10031F914(v147);
              for (uint64_t j = 0; j != -64; j -= 32)
              {
                v96 = (void **)((char *)&v109[0].__r_.__value_.__l.__data_ + j);
                if (v109[2].__r_.__value_.__s.__data_[j + 8] && *((char *)v96 + 55) < 0) {
                  operator delete(v96[4]);
                }
              }
              if (v186 && v185 < 0) {
                operator delete(v184);
              }
              sub_10003E96C((uint64_t)v182, (void *)v182[1]);
              sub_10003E96C((uint64_t)__p, *(void **)&__p[8]);
              if (v115 && v114 < 0) {
                operator delete(v113[0]);
              }
              sub_10003E96C((uint64_t)v111, (void *)v111[1]);
              sub_10003E96C((uint64_t)v133, (void *)v133[1]);

              *(void *)__p = v142;
              sub_10031F5E0((void ***)__p);

              break;
            case 2:
              v82 = (id)qword_1008ABDE0;
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
                *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = 0x3FE8000000000000;
                _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor Using default user intent threshold value for AoA predictor: %f", (uint8_t *)&buf, 0xCu);
              }
              goto LABEL_120;
            case 4:
              __assert_rtn("-[NINearbyUpdatesEngine _configureForRegionMonitoring:]", "NIServerNearbyUpdatesEngine.mm", 626, "false");
            default:
              goto LABEL_121;
          }
          goto LABEL_139;
        }
        BYTE8(v116) = 1;
        LOBYTE(v117) = 0;
        *(void *)&long long v121 = 1;
        v71 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__p = 0;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override Enable BT-based region monitoring in Home session with HomeDeviceSessionBTLeechingEnabled.", __p, 2u);
        }
      }

      goto LABEL_94;
    }
    if (v67 == 1)
    {
      HIDWORD(v116) = 1;
      v68 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__p = 0;
        v69 = "#nrby-eng,#regions #config-override RegMonBoundedRegionRangeEstimatorType = KALMAN_FILTER";
        goto LABEL_84;
      }
    }
    else if (v67 == 2)
    {
      HIDWORD(v116) = 2;
      v68 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__p = 0;
        v69 = "#nrby-eng,#regions #config-override RegMonBoundedRegionRangeEstimatorType = MAX_OF_MEAN_OF_CHAN_FILTER";
LABEL_84:
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, v69, __p, 2u);
      }
    }
    else
    {
      v68 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__p = 0;
        v69 = "#nrby-eng,#regions #config-override Invalid value specified for RegMonBoundedRegionRangeEstimatorType, NOT overriding";
        goto LABEL_84;
      }
    }

    goto LABEL_86;
  }
  v70 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__p = 0;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions No regions to be monitored.", __p, 2u);
  }
LABEL_139:

  return 0;
}

- (int)_setReadValidateDefaultsWriteForTypeOfPredictor
{
  v2 = +[NSUserDefaults standardUserDefaults];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1008AA280, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1008AA280))
  {
    dword_1008AA278 = *((_DWORD *)sub_100007D00() + 144);
    __cxa_guard_release(&qword_1008AA280);
  }
  v3 = [v2 objectForKey:@"HandoffIntentPredictorType"];

  if (!v3)
  {
    if (dword_1008AA278 > 99)
    {
      if (dword_1008AA278 > 199)
      {
        if ((dword_1008AA278 - 200) >= 2 && dword_1008AA278 != 997 && dword_1008AA278 != 999) {
          goto LABEL_3;
        }
      }
      else if ((dword_1008AA278 - 100) >= 0x16)
      {
        goto LABEL_3;
      }
      uint64_t v7 = qword_1008ABDE0;
      int v6 = 0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#intentPredictorDefaultsWrite Intent predictor not enabled for this device type", v11, 2u);
        int v6 = 0;
      }
      goto LABEL_29;
    }
    if (dword_1008AA278 < 0x18)
    {
      v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#intentPredictorDefaultsWrite Intent predictor type for this device: Spatial Gestures", buf, 2u);
      }
      int v6 = 3;
      goto LABEL_29;
    }
  }
LABEL_3:
  unsigned int v4 = [v2 integerForKey:@"HandoffIntentPredictorType"];
  int v5 = v4;
  int v6 = 0;
  if (dword_1008AA278 <= 199)
  {
    if ((dword_1008AA278 - 100) < 0x16) {
      goto LABEL_29;
    }
    if ((dword_1008AA278 - 11) >= 0xD)
    {
      if (dword_1008AA278 >= 0xB || v4 < 4) {
        goto LABEL_25;
      }
      id v8 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
LABEL_27:
      }
        sub_10042FA10(v5, v8);
    }
    else
    {
      if (v4 <= 3 && v4 != 2) {
        goto LABEL_25;
      }
      id v8 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
    }
    int v6 = 1;
    goto LABEL_29;
  }
  if ((dword_1008AA278 - 200) >= 2 && dword_1008AA278 != 997 && dword_1008AA278 != 999) {
LABEL_25:
  }
    int v6 = v4;
LABEL_29:

  return v6;
}

- (PeopleFinderAlgorithmConfig)_getPeopleFinderAlgorithmConfigForPeerSessions
{
  [(NINearbyUpdatesEngine *)self _getPeopleFinderAlgorithmConfig];
  *(int64x2_t *)&retstr->double var8 = vdupq_n_s64(0x7FF0000000000000uLL);
  *(_OWORD *)&retstr->double var10 = 0u;
  *(_OWORD *)&retstr->double var12 = 0u;
  retstr->var18 = INFINITY;
  retstr->var19 = 1;
  unsigned int v4 = qword_1008ABDE0;
  result = (PeopleFinderAlgorithmConfig *)os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (result)
  {
    double var10 = retstr->var10;
    double var11 = retstr->var11;
    double var12 = retstr->var12;
    double var13 = retstr->var13;
    double var8 = retstr->var8;
    double var9 = retstr->var9;
    int v12 = 134219264;
    double v13 = var8;
    __int16 v14 = 2048;
    double v15 = var10;
    __int16 v16 = 2048;
    double v17 = var11;
    __int16 v18 = 2048;
    double v19 = var12;
    __int16 v20 = 2048;
    double v21 = var13;
    __int16 v22 = 2048;
    double v23 = var9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#nrby-eng,People-finder yield for peer session config set to maxUWBRange, %f, minUWBRangeRate, %f, rangeRateWindow, %f, groupFindingMinUWBRangeRate, %f, groupFindingRangeRateWindow, %f,  maxUWBRangeInFavorableGnssConditions, %f", (uint8_t *)&v12, 0x3Eu);
  }
  return result;
}

- (PeopleFinderAlgorithmConfig)_getPeopleFinderAlgorithmConfig
{
  unsigned int v4 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v92 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableCL"];
  unsigned __int8 v91 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisablePF"];
  unsigned __int8 v90 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableSA"];
  unsigned __int8 v89 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableSAWithFindeeVIO"];
  unsigned __int8 v5 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableSARangeOnly"];
  unsigned __int8 v6 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsEnableStraightPathFilter"];
  unsigned __int8 v7 = [v4 BOOLForKey:@"DisableUseOfRangesWithStatus7"];
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldMaxRange"];
  double v9 = v8;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldMaxRangeInFavorableGnssConditions"];
  double v11 = v10;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldMinUWBRangeRate"];
  double v13 = v12;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldRangeRateWindow"];
  double v15 = v14;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldGroupFindingMinUWBRangeRate"];
  double v17 = v16;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldGroupFindingRangeRateWindow"];
  double v19 = v18;
  unsigned __int8 v20 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableRelaxedYieldCriteria"];
  unsigned int v94 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableStrictSABoxSpanRequirement"];
  unsigned int v93 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableFinderIO"];
  [v4 doubleForKey:@"PeopleFinderMinSvTrackedToAvailableRatioForFavorableGnssConditions"];
  double v86 = v21;
  [v4 doubleForKey:@"PeopleFinderMinGnssSatelliteElevationDeg"];
  double v84 = v22;
  unsigned int v88 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsParticleFilterSeedWithCL"];
  unsigned int v23 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsParticleFilterDisableSeedWithSA"];
  int64_t v87 = (int64_t)[v4 integerForKey:@"PeopleFinderAlgorithmsParticleFilterNumParticles"];
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterPDRFrameRotationNoiseRads"];
  double v85 = v24;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterPDRScaleNoiseMuLognormal"];
  double v83 = v25;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterPDRScaleNoiseSigmaLognormal"];
  double v82 = v26;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterMultipathProcessVarianceScaling"];
  double v81 = v27;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterMultipathMeasurementStd"];
  double v80 = v28;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterTrailingMeasurementStdThreshold"];
  double v79 = v29;
  uint64_t v30 = (uint64_t)[v4 integerForKey:@"PeopleFinderAlgorithmsParticleFilterNLOSTimeoutSec"];
  uint64_t v31 = (uint64_t)[v4 integerForKey:@"PeopleFinderAlgorithmsParticleFilterNoMeasurementTimeoutSec"];
  uint64_t v32 = (uint64_t)[v4 integerForKey:@"PeopleFinderAlgorithmsParticleFilterConservativeNLOSTimeoutSec"];
  [v4 doubleForKey:@"PeopleFindingFindButtonTimeoutSecondsOverride"];
  double v34 = v33;
  *(_OWORD *)&retstr->var7 = xmmword_1004C0950;
  *(_OWORD *)&retstr->double var9 = xmmword_1004C0960;
  __asm { FMOV            V0.2D, #2.0 }
  *(_OWORD *)&retstr->double var11 = _Q0;
  retstr->double var13 = 2.0;
  *(_WORD *)&retstr->var14.BOOL var0 = 0;
  retstr->var14.BOOL var2 = 0.05;
  retstr->var14.BOOL var3 = 20000;
  *(_OWORD *)&retstr->var14.BOOL var4 = xmmword_1004C0970;
  *(_OWORD *)&retstr->var14.var6 = xmmword_1004C0980;
  *(_OWORD *)&retstr->var14.double var8 = xmmword_1004C0990;
  *(_OWORD *)&retstr->var14.double var10 = xmmword_1004C09A0;
  retstr->var16 = (GnssReliabilityIndicatorConfig)xmmword_1004C09B0;
  retstr->var18 = 10.0;
  retstr->var19 = 0;
  retstr->BOOL var0 = v92 ^ 1;
  retstr->BOOL var1 = v91 ^ 1;
  retstr->BOOL var2 = v90 ^ 1;
  retstr->BOOL var4 = v89 ^ 1;
  retstr->BOOL var3 = v5 ^ 1;
  retstr->var5 = v6;
  retstr->var6 = v7 ^ 1;
  retstr->BOOL var15 = v20 ^ 1;
  retstr->var17 = v94 ^ 1;
  retstr->var20 = v93 ^ 1;
  double v40 = +[NSUserDefaults standardUserDefaults];
  double v41 = [v40 objectForKey:@"PeopleFinderLowPassFilterTimeConstant"];

  if (v41)
  {
    double v42 = +[NSUserDefaults standardUserDefaults];
    [v42 doubleForKey:@"PeopleFinderLowPassFilterTimeConstant"];
    double v44 = v43;

    retstr->var7 = v44;
    float v45 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v44;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Setting PeopleFinderAlgorithms low pass filter time constant to %3.2f", buf, 0xCu);
    }
  }
  if (v9 > 0.0) {
    retstr->double var8 = v9;
  }
  if (v11 > 0.0) {
    retstr->double var9 = v11;
  }
  if (v13 > 0.0 && v15 > 0.0)
  {
    retstr->double var10 = v13;
    retstr->double var11 = v15;
  }
  if (v17 > 0.0 && v19 > 0.0)
  {
    retstr->double var12 = v17;
    retstr->double var13 = v19;
  }
  if (v34 > 0.0) {
    retstr->var18 = v34;
  }
  float v46 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    double var10 = retstr->var10;
    double var11 = retstr->var11;
    double var12 = retstr->var12;
    double var13 = retstr->var13;
    BOOL var15 = retstr->var15;
    double var8 = retstr->var8;
    double var9 = retstr->var9;
    *(_DWORD *)std::string buf = 134219520;
    *(double *)v96 = var8;
    *(_WORD *)&v96[8] = 2048;
    double v97 = var10;
    *(_WORD *)float64_t v98 = 2048;
    *(double *)&v98[2] = var11;
    __int16 v99 = 2048;
    double v100 = var12;
    __int16 v101 = 2048;
    double v102 = var13;
    __int16 v103 = 1024;
    BOOL v104 = var15;
    __int16 v105 = 2048;
    double v106 = var9;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "#nrby-eng,People-finder yield config set to maxUWBRange, %f, minUWBRangeRate, %f, rangeRateWindow, %f, groupFindingMinUWBRangeRate, %f, groupFindingRangeRateWindow, %f, enableRelaxedYieldCriteriaInFavorableGnssConditions, %d, maxUWBRangeInFavorableGnssConditions, %f", buf, 0x44u);
  }

  v54.i32[0] = *(_DWORD *)&retstr->var1;
  if ((vmaxv_u16((uint16x4_t)vceqz_s16((int16x4_t)(vmovl_u8(v54).u64[0] & 0xFF00FF00FF00FFLL))) & 1) != 0
    || !retstr->var0)
  {
    double v55 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      BOOL var1 = retstr->var1;
      BOOL var2 = retstr->var2;
      BOOL var4 = retstr->var4;
      BOOL var3 = retstr->var3;
      BOOL var0 = retstr->var0;
      *(_DWORD *)std::string buf = 67110144;
      *(_DWORD *)v96 = var1;
      *(_WORD *)&v96[4] = 1024;
      *(_DWORD *)&v96[6] = var2;
      LOWORD(v97) = 1024;
      *(_DWORD *)((char *)&v97 + 2) = var4;
      HIWORD(v97) = 1024;
      *(_DWORD *)float64_t v98 = var3;
      *(_WORD *)&v98[4] = 1024;
      *(_DWORD *)&v98[6] = var0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#nrby-eng,WARNING: One or more estimators disabled via default,pf,%d,sa,%d,savio,%d,saro,%d,cl,%d", buf, 0x20u);
    }
  }
  if (retstr->var5)
  {
    double v61 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Straight path estimator enabled via default", buf, 2u);
    }
  }
  if (v94)
  {
    int v62 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Strict SA box span requirement disabled via default", buf, 2u);
    }
  }
  if (v93)
  {
    v63 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Finder IO usage enabled via default", buf, 2u);
    }
  }
  if (v87 >= 1)
  {
    retstr->var14.BOOL var3 = v87;
    v64 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(void *)v96 = v87;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, number of particles in PF: %ld", buf, 0xCu);
    }
  }
  if (v88)
  {
    retstr->var14.BOOL var0 = v88;
    v65 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#nrby-eng,People-finder enabling seeding PF solution with CL arrow", buf, 2u);
    }
  }
  if (v23)
  {
    retstr->var14.BOOL var1 = v23;
    int v66 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Disabling the ability to seed PF with SA solution when findee motion detected", buf, 2u);
    }
  }
  if (v85 > 0.0)
  {
    retstr->var14.BOOL var2 = v85;
    int v67 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v85;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, pdrFrameRotationNoise: %f rads", buf, 0xCu);
    }
  }
  if (v83 > 0.0)
  {
    retstr->var14.double var10 = v83;
    v68 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v83;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, pdrScaleMu: %f", buf, 0xCu);
    }
  }
  if (v82 > 0.0)
  {
    retstr->var14.double var11 = v82;
    v69 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v82;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, pdrScalSigma: %f", buf, 0xCu);
    }
  }
  if (v81 > 0.0)
  {
    retstr->var14.BOOL var4 = v81;
    v70 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v81;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, processVarInnovationScale: %f", buf, 0xCu);
    }
  }
  if (v80 > 0.0)
  {
    retstr->var14.var5 = v80;
    v71 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v80;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, measurementStdForInnovationCheck: %f", buf, 0xCu);
    }
  }
  if (v79 > 0.0)
  {
    retstr->var14.var6 = v79;
    v72 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v79;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, trailingStdThreshold: %f", buf, 0xCu);
    }
  }
  if (v30 >= 1)
  {
    retstr->var14.var7 = (double)v30;
    BOOL v73 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = (double)v30;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, nlosTimeThreshSec: %f", buf, 0xCu);
    }
  }
  if (v31 >= 1)
  {
    retstr->var14.double var9 = (double)v31;
    v74 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = (double)v31;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, timeoutAfterNoMeasurementsSec: %f", buf, 0xCu);
    }
  }
  if (v32 >= 1)
  {
    retstr->var14.double var8 = (double)v32;
    unsigned int v75 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = (double)v32;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, conservativeNlosTimeThreshSec: %f", buf, 0xCu);
    }
  }
  if (v86 > 0.0)
  {
    retstr->var16.BOOL var0 = v86;
    float64x2_t v76 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v86;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding GRI parameter, minSvTrackedToAvailableRatioForFavorableGnssConditions: %.2lf", buf, 0xCu);
    }
  }
  if (v84 > 0.0 && v84 <= 90.0)
  {
    retstr->var16.BOOL var1 = v84;
    uint64_t v77 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v84;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding GRI parameter, minGnssSatelliteElevationDeg: %f", buf, 0xCu);
    }
  }
  return result;
}

- (FindeeAlgorithmConfig)_getFindeeAlgorithmConfig
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 doubleForKey:@"FindeeMinSvTrackedToAvailableRatioForFavorableGnssConditions"];
  double v4 = v3;
  [v2 doubleForKey:@"FindeeMinGnssSatelliteElevationDeg"];
  double v6 = v5;
  double v7 = 0.5;
  if (v4 > 0.0)
  {
    double v8 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding GRI parameter, minSvTrackedToAvailableRatioForFavorableGnssConditions: %.2lf", (uint8_t *)&v13, 0xCu);
    }
    double v7 = v4;
  }
  double v9 = 15.0;
  if (v6 > 0.0 && v6 <= 90.0)
  {
    double v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding GRI parameter, minGnssSatelliteElevationDeg: %f", (uint8_t *)&v13, 0xCu);
    }
    double v9 = v6;
  }

  double v11 = v7;
  double v12 = v9;
  result.var0.BOOL var1 = v12;
  result.var0.BOOL var0 = v11;
  return result;
}

- (void)_sendTimeTupleToAlgorithms
{
  double v7 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  if (sub_10002D598(&v7, &v6, &v5))
  {
    int64_t var0 = self->_uniqueIdentifier.var0;
    if (var0)
    {
      *(double *)double v4 = v5;
      *(double *)&v4[1] = v6;
      *(double *)&v4[2] = v7;
      if (self->_protobufLogger.__ptr_)
      {
        sub_1002A336C((uint64_t)self->_protobufLogger.__ptr_, (const std::string *)&self->_uniqueIdentifier, v5, v6, v7);
        int64_t var0 = self->_uniqueIdentifier.var0;
      }
      (*(void (**)(int64_t, void *))(*(void *)var0 + 16))(var0, v4);
    }
  }
}

- (void)_createSyntheticApertureAlgoContainer
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_syntheticApertureFilter", v3, 2u);
  }
  operator new();
}

- (void)_createPeerFindingAlgoContainer
{
  double v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_findingAlgorithmContainer = PeerFindingAlgorithms", buf, 2u);
  }
  [(NINearbyUpdatesEngine *)self _getPeopleFinderAlgorithmConfigForPeerSessions];
  [(NINearbyUpdatesEngine *)self _getFindeeAlgorithmConfig];
  uint64_t v6 = v4;
  uint64_t v7 = v5;
  operator new();
}

- (void)_createPeopleFinderAlgoContainer
{
  double v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_findingAlgorithmContainer = PeopleFinderAlgorithms", v4, 2u);
  }
  [(NINearbyUpdatesEngine *)self _getPeopleFinderAlgorithmConfig];
  operator new();
}

- (void)_createDeviceFinderAlgoContainer
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_findingAlgorithmContainer = DeviceFinderAlgorithms", v3, 2u);
  }
  operator new();
}

- (void)_createFindeeAlgoContainer
{
  double v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_findingAlgorithmContainer = FindeeAlgorithms", (uint8_t *)v6, 2u);
  }
  [(NINearbyUpdatesEngine *)self _getFindeeAlgorithmConfig];
  v6[0] = v4;
  v6[1] = v5;
  operator new();
}

- (void)provideFindingSolution:(id)a3
{
  id v5 = a3;
  if (self->_uniqueIdentifier.var0)
  {
    sub_1001F2E48();
    (**(void (***)(float32x2_t *__return_ptr))self->_uniqueIdentifier.var0)(v44);
    sub_1001F2E48();
    uint64_t ptr = self->_protobufLogger.__ptr_;
    if (ptr) {
      sub_1002A2878((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v44);
    }
    [(NINearbyUpdatesEngine *)self logSolution:v44];
    uint64_t v7 = [(NINearbyUpdatesEngine *)self nearbyObjectFromSolution:v44];
    if (v7
      || self->_findingPeerToken
      && (-[NINearbyUpdatesEngine nearbyObjectFromSolution:forPeer:](self, "nearbyObjectFromSolution:forPeer:", v44),
          (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      double v8 = self->_protobufLogger.__ptr_;
      if (v8)
      {
        [v7 timestamp];
        double v10 = v9;
        sub_100290760(v7, (uint64_t)&__p);
        memset(&v40, 0, sizeof(v40));
        v39.__r_.__value_.__s.__data_[8] = 0;
        v40.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0xA0uLL);
        v40.__r_.__value_.__l.__size_ = v40.__r_.__value_.__r.__words[0];
        v40.__r_.__value_.__r.__words[2] = v40.__r_.__value_.__r.__words[0] + 160;
        v40.__r_.__value_.__l.__size_ = sub_100321364((uint64_t)&v40.__r_.__value_.__r.__words[2], (uint64_t)&__p, (uint64_t)v44, (uint64_t)v40.__r_.__value_.__l.__data_);
        sub_10029BB5C((uint64_t)v8, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)&v40, v10);
        v39.__r_.__value_.__r.__words[0] = (std::string::size_type)&v40;
        sub_1003214E4((void ***)&v39);
        if (__p.__r_.__value_.__r.__words[0])
        {
          __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      dataSource = self->_dataSource;
      if (dataSource) {
        [(NINearbyUpdatesEngineDataSource *)dataSource updateWithSolution:v44];
      }
      if (v5)
      {
        [v7 setNbRxStatus:[v5 nbRxStatus]];
        [v7 setMmsRxStatus:[v5 mmsRxStatus]];
        [v5 nbRssi];
        [v7 setNbRssi:];
        [v5 signalStrength];
        [v7 setSignalStrength:];
      }
      sub_100004950(&v40, "");
      sub_100004950(&v39, "RawDist = ");
      if (v5)
      {
        objc_storeStrong((id *)&self->_findingLatencyBookkeeping.lastProcessTimeSeconds, a3);
        [v5 distance];
      }
      else
      {
        [*(id *)&self->_findingLatencyBookkeeping.lastProcessTimeSeconds distance];
      }
      sub_100317914(2);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      std::string::append(&v39, (const std::string::value_type *)p_p, size);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        double v14 = &v39;
      }
      else {
        double v14 = (std::string *)v39.__r_.__value_.__r.__words[0];
      }
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v15 = HIBYTE(v39.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v15 = v39.__r_.__value_.__l.__size_;
      }
      std::string::append(&v40, (const std::string::value_type *)v14, v15);
      std::string::append(&v40, " ");
      std::string::append(&v40, ", ");
      if ((v45 & 0xFF00000000) != 0) {
        double v16 = (&off_1008614E0)[(int)v45];
      }
      else {
        double v16 = "Unavailable";
      }
      sub_100004950(&v36, v16);
      double v17 = std::string::append(&v36, " : ");
      long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v18;
      v17->__r_.__value_.__l.__size_ = 0;
      v17->__r_.__value_.__r.__words[2] = 0;
      v17->__r_.__value_.__r.__words[0] = 0;
      if (v44[0].i32[0])
      {
        double v19 = "Converged   ";
      }
      else if ((*(void *)v44 & 0x100000000) != 0)
      {
        double v19 = "LowDisp     ";
      }
      else if ((*(void *)v44 & 0x100000000000000) != 0)
      {
        double v19 = "LowLighting ";
      }
      else if ((*(void *)v44 & 0x10000000000) != 0)
      {
        double v19 = "LowHorzDisp ";
      }
      else if ((*(void *)v44 & 0x1000000000000) != 0)
      {
        double v19 = "LowVertDisp ";
      }
      else
      {
        double v19 = "NotConverged";
      }
      sub_100004950(v34, v19);
      if ((v35 & 0x80u) == 0) {
        unsigned __int8 v20 = v34;
      }
      else {
        unsigned __int8 v20 = (void **)v34[0];
      }
      if ((v35 & 0x80u) == 0) {
        std::string::size_type v21 = v35;
      }
      else {
        std::string::size_type v21 = (std::string::size_type)v34[1];
      }
      double v22 = std::string::append(&__p, (const std::string::value_type *)v20, v21);
      long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
      int64_t v38 = v22->__r_.__value_.__r.__words[2];
      *(_OWORD *)double v37 = v23;
      v22->__r_.__value_.__l.__size_ = 0;
      v22->__r_.__value_.__r.__words[2] = 0;
      v22->__r_.__value_.__r.__words[0] = 0;
      if ((char)v35 < 0) {
        operator delete(v34[0]);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v36.__r_.__value_.__l.__data_);
      }
      if (v38 >= 0) {
        double v24 = v37;
      }
      else {
        double v24 = (void **)v37[0];
      }
      if (v38 >= 0) {
        std::string::size_type v25 = HIBYTE(v38);
      }
      else {
        std::string::size_type v25 = (std::string::size_type)v37[1];
      }
      std::string::append(&v40, (const std::string::value_type *)v24, v25);
      if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        double v26 = &v40;
      }
      else {
        double v26 = (std::string *)v40.__r_.__value_.__r.__words[0];
      }
      double v27 = +[NSString stringWithUTF8String:v26];
      [v7 setDebugDisplayInfo:v27];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
      if (objc_opt_respondsToSelector())
      {
        double v41 = v7;
        double v29 = +[NSArray arrayWithObjects:&v41 count:1];
        [WeakRetained updatesEngine:self didUpdateNearbyObjects:v29];
      }
      if (self->_findingPeerToken)
      {
        uint64_t v30 = [(NINearbyUpdatesEngine *)self niConvergenceStateFromSolution:v44];
        uint64_t v31 = [(SyntheticApertureFilter *)self->_syntheticApertureFilter.__ptr_.__value_ objectForKeyedSubscript:self->_findingPeerToken];
        if (([v31 isEqual:v30] & 1) == 0)
        {
          [(SyntheticApertureFilter *)self->_syntheticApertureFilter.__ptr_.__value_ setObject:v30 forKeyedSubscript:self->_findingPeerToken];
          uint64_t v32 = [[NINearbyObject alloc] initWithToken:self->_findingPeerToken];
          if (objc_opt_respondsToSelector()) {
            [WeakRetained updatesEngine:self didUpdateAlgorithmConvergenceState:v30 forObject:v32];
          }
          double v33 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(__p.__r_.__value_.__l.__data_) = 138412802;
            *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v32;
            WORD2(__p.__r_.__value_.__r.__words[1]) = 2112;
            *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v30;
            HIWORD(__p.__r_.__value_.__r.__words[2]) = 2112;
            double v43 = v31;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#finding, Updated convergence state for object: %@. New state: %@. Previous state: %@", (uint8_t *)&__p, 0x20u);
          }
        }
      }

      if (SHIBYTE(v38) < 0) {
        operator delete(v37[0]);
      }
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v39.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v40.__r_.__value_.__l.__data_);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    sub_10042FA88();
  }
}

- (void)acceptRoseSolution:(const void *)a3
{
  long long v3 = xmmword_1004C0A90;
  uint64_t v4 = 1;
  [(NINearbyUpdatesEngine *)self acceptRoseSolution:a3 withProcessingOptions:&v3];
}

- (void)acceptRoseSolution:(const void *)a3 withProcessingOptions:(const AlgorithmProcessingOptions *)a4
{
  if (*((unsigned char *)a3 + 24))
  {
    unsigned int v5 = *((_DWORD *)a3 + 8);
    if (v5 > 5) {
      return;
    }
    int v6 = 1 << v5;
    if ((v6 & 0x31) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042FB64();
      }
      return;
    }
    if ((v6 & 0xC) != 0) {
      [(NINearbyUpdatesEngine *)self _handleRangeAndAoASolution:a3];
    }
    else {
    double v9 = [(NINearbyUpdatesEngine *)self _handleRangeOnlySolution:a3];
    }
    double v10 = v9;
    if (v9)
    {
      if (!*((unsigned char *)a3 + 24)) {
        sub_10000AE44();
      }
      [v9 setTimestamp:*((double *)a3 + 2)];
      [v10 setRequiresBiasCorrection:a4->requiresBiasCorrection];
      double v11 = [v10 discoveryToken];
      id v120 = [v11 hash];
      *(void *)&long long buf = &v120;
      double v12 = (id *)sub_100321590((uint64_t)&self->_hashToTokenMap, (unint64_t *)&v120, (uint64_t)&unk_1004BC2F8, (void **)&buf);
      objc_storeStrong(v12 + 3, v11);
      [v10 setRangeBiasEstimate:*(double *)&NINearbyObjectRangeBiasEstimateNotAvailable];
      [v10 setRangeUncertainty:*(double *)&NINearbyObjectRangeUncertaintyNotAvailable];
      if (LOBYTE(self->_convStateForObject))
      {
        int v13 = qword_1008ABDE0;
        if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_41;
        }
        LOWORD(buf) = 0;
        double v14 = "#nrby-eng,#bias-est, Bypass estimating bias correction.";
      }
      else
      {
        unsigned int v15 = [v10 requiresBiasCorrection];
        int v13 = qword_1008ABDE0;
        BOOL v16 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v16)
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est This device type requires bias estimation.", (uint8_t *)&buf, 2u);
          }
          if (*((unsigned char *)a3 + 600))
          {
            if (*((unsigned __int16 *)a3 + 215) > 0xFFu)
            {
              int v13 = qword_1008ABDE0;
              if (*((unsigned char *)a3 + 1312))
              {
                double v17 = (id)qword_1008ABDE0;
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  if (!*((unsigned char *)a3 + 600)) {
                    sub_10000AE44();
                  }
                  uint64_t v18 = *((void *)a3 + 14);
                  LODWORD(buf) = 67109120;
                  DWORD1(buf) = v18;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Calculating bias for device mac addr : %d", (uint8_t *)&buf, 8u);
                }

                if (self->_protobufLogger.__ptr_)
                {
                  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
                    sub_10042FB30();
                  }
                  sub_10029EFEC((uint64_t)self->_protobufLogger.__ptr_, (uint64_t)a3);
                }
                v112 = objc_alloc_init(UWBSignalFeatures);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v19 = *(id *)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
                  unsigned __int8 v20 = [v19 debugParameters];
                  if (v20)
                  {
                    std::string::size_type v21 = [v19 debugParameters];
                    double v22 = [v21 objectForKey:@"enableAdditionalUWBSignalFeatures"];
                    BOOL v114 = v22 != 0;
                  }
                  else
                  {
                    BOOL v114 = 0;
                  }
                }
                else
                {
                  BOOL v114 = 0;
                }
                v111 = [(NINearbyUpdatesEngine *)self _consolidateInputToMLModel:a3];
                v109 = [(NRBYFindingContainer *)self->_findingAlgorithmContainer.__ptr_.__value_ consumeInputFeatures:v111];
                v110 = [(NRBYFindingContainer *)self->_findingAlgorithmContainer.__ptr_.__value_ preprocessInputFeatures:v109];
                double v43 = -[NRBYFindingContainer predictOutput:](self->_findingAlgorithmContainer.__ptr_.__value_, "predictOutput:");
                v113 = [(NRBYFindingContainer *)self->_findingAlgorithmContainer.__ptr_.__value_ biasCorrectionEstimate];
                if (v113 && v43)
                {
                  long long buf = 0uLL;
                  v126[0] = 0;
                  id v116 = [objc_alloc((Class)NSMutableString) initWithFormat:&stru_100869B68];
                  for (unint64_t i = 0; (unint64_t)[v43 count] > i; ++i)
                  {
                    uint64_t v45 = [v43 objectAtIndexedSubscript:i];
                    [v45 doubleValue];
                    uint64_t v47 = v46;

                    [v116 appendFormat:@"%f ", v47];
                    uint64_t v48 = (char *)*((void *)&buf + 1);
                    if (*((void *)&buf + 1) >= v126[0])
                    {
                      v50 = (char *)buf;
                      uint64_t v51 = (uint64_t)(*((void *)&buf + 1) - buf) >> 3;
                      unint64_t v52 = v51 + 1;
                      if ((unint64_t)(v51 + 1) >> 61) {
                        sub_1000267C4();
                      }
                      uint64_t v53 = v126[0] - buf;
                      if ((uint64_t)(v126[0] - buf) >> 2 > v52) {
                        unint64_t v52 = v53 >> 2;
                      }
                      if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8) {
                        unint64_t v54 = 0x1FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v54 = v52;
                      }
                      if (v54)
                      {
                        double v55 = (char *)sub_100056BF0((uint64_t)v126, v54);
                        uint64_t v48 = (char *)*((void *)&buf + 1);
                        v50 = (char *)buf;
                      }
                      else
                      {
                        double v55 = 0;
                      }
                      int8x8_t v56 = &v55[8 * v51];
                      *(void *)int8x8_t v56 = v47;
                      v49 = v56 + 8;
                      while (v48 != v50)
                      {
                        uint64_t v57 = *((void *)v48 - 1);
                        v48 -= 8;
                        *((void *)v56 - 1) = v57;
                        v56 -= 8;
                      }
                      *(void *)&long long buf = v56;
                      *((void *)&buf + 1) = v49;
                      v126[0] = &v55[8 * v54];
                      if (v50) {
                        operator delete(v50);
                      }
                    }
                    else
                    {
                      **((void **)&buf + 1) = v47;
                      v49 = v48 + 8;
                    }
                    *((void *)&buf + 1) = v49;
                  }
                  double v60 = (id)qword_1008ABDE0;
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                  {
                    if (!*((unsigned char *)a3 + 600) || (unsigned int v61 = *((unsigned __int16 *)a3 + 215), v61 <= 0xFF)) {
                      sub_10000AE44();
                    }
                    *(_DWORD *)long long v121 = 67109378;
                    *(_DWORD *)&v121[4] = v61;
                    *(_WORD *)&v121[8] = 2112;
                    *(void *)&v121[10] = v116;
                    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Output probabilities for antenna mask %d : %@", v121, 0x12u);
                  }

                  int v62 = (id)qword_1008ABDE0;
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                  {
                    [v10 distance];
                    float v64 = v63;
                    [v10 distance];
                    float v66 = v65;
                    [v113 doubleValue];
                    *(_DWORD *)long long v121 = 134218240;
                    *(double *)&v121[4] = v64;
                    *(_WORD *)&v121[12] = 2048;
                    *(double *)&v121[14] = v67 + v66;
                    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Range result (raw) = %f, Corrected Range = %f", v121, 0x16u);
                  }

                  [v113 doubleValue];
                  [v10 setRangeBiasEstimate:];
                  BOOL v68 = v114;
                  if (!v111) {
                    BOOL v68 = 0;
                  }
                  if (v68)
                  {
                    v69 = objc_alloc_init(BiasEstimatorOutputs);
                    [v10 distance];
                    [(BiasEstimatorOutputs *)v69 setRawRange:v70];
                    [v10 distance];
                    float v72 = v71;
                    [v113 doubleValue];
                    [(BiasEstimatorOutputs *)v69 setCorrectedRange:v73 + v72];
                    [(BiasEstimatorOutputs *)v69 setOutProbabilities:v43];
                    [(UWBSignalFeatures *)v112 setInputFeatures:v111];
                    [(UWBSignalFeatures *)v112 setOutputs:v69];
                    [v10 setUwbSignalFeatures:v112];
                  }
                  if (self->_protobufLogger.__ptr_)
                  {
                    memset(v121, 0, sizeof(v121));
                    v74 = [v109 featureValueForName:@"input"];
                    unsigned int v75 = [v74 multiArrayValue];

                    std::string __p = 0;
                    long long v118 = 0;
                    long long v119 = 0;
                    float64x2_t v76 = [v110 featureValueForName:@"input"];
                    char v115 = [v76 multiArrayValue];

                    for (uint64_t j = 0; (uint64_t)[v75 count] > j; ++j)
                    {
                      int v78 = [v75 objectAtIndexedSubscript:j];
                      [v78 doubleValue];
                      uint64_t v80 = v79;
                      double v81 = *(char **)&v121[8];
                      if (*(void *)&v121[8] >= *(void *)&v121[16])
                      {
                        double v83 = *(char **)v121;
                        uint64_t v84 = (uint64_t)(*(void *)&v121[8] - *(void *)v121) >> 3;
                        unint64_t v85 = v84 + 1;
                        if ((unint64_t)(v84 + 1) >> 61) {
                          sub_1000267C4();
                        }
                        uint64_t v86 = *(void *)&v121[16] - *(void *)v121;
                        if ((uint64_t)(*(void *)&v121[16] - *(void *)v121) >> 2 > v85) {
                          unint64_t v85 = v86 >> 2;
                        }
                        if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF8) {
                          unint64_t v87 = 0x1FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v87 = v85;
                        }
                        if (v87)
                        {
                          unsigned int v88 = (char *)sub_100056BF0((uint64_t)&v121[16], v87);
                          double v83 = *(char **)v121;
                          double v81 = *(char **)&v121[8];
                        }
                        else
                        {
                          unsigned int v88 = 0;
                        }
                        unsigned __int8 v89 = &v88[8 * v84];
                        *(void *)unsigned __int8 v89 = v80;
                        double v82 = v89 + 8;
                        while (v81 != v83)
                        {
                          uint64_t v90 = *((void *)v81 - 1);
                          v81 -= 8;
                          *((void *)v89 - 1) = v90;
                          v89 -= 8;
                        }
                        *(void *)long long v121 = v89;
                        *(void *)&v121[8] = v82;
                        *(void *)&v121[16] = &v88[8 * v87];
                        if (v83) {
                          operator delete(v83);
                        }
                      }
                      else
                      {
                        **(void **)&v121[8] = v79;
                        double v82 = v81 + 8;
                      }
                      *(void *)&v121[8] = v82;

                      unsigned __int8 v91 = [v115 objectAtIndexedSubscript:j];
                      [v91 doubleValue];
                      uint64_t v93 = v92;
                      unsigned int v94 = v118;
                      if (v118 >= v119)
                      {
                        v96 = (char *)__p;
                        uint64_t v97 = (v118 - (unsigned char *)__p) >> 3;
                        unint64_t v98 = v97 + 1;
                        if ((unint64_t)(v97 + 1) >> 61) {
                          sub_1000267C4();
                        }
                        uint64_t v99 = v119 - (unsigned char *)__p;
                        if ((v119 - (unsigned char *)__p) >> 2 > v98) {
                          unint64_t v98 = v99 >> 2;
                        }
                        if ((unint64_t)v99 >= 0x7FFFFFFFFFFFFFF8) {
                          unint64_t v100 = 0x1FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v100 = v98;
                        }
                        if (v100)
                        {
                          __int16 v101 = (char *)sub_100056BF0((uint64_t)&v119, v100);
                          v96 = (char *)__p;
                          unsigned int v94 = v118;
                        }
                        else
                        {
                          __int16 v101 = 0;
                        }
                        double v102 = &v101[8 * v97];
                        *(void *)double v102 = v93;
                        v95 = v102 + 8;
                        while (v94 != v96)
                        {
                          uint64_t v103 = *((void *)v94 - 1);
                          v94 -= 8;
                          *((void *)v102 - 1) = v103;
                          v102 -= 8;
                        }
                        std::string __p = v102;
                        long long v118 = v95;
                        long long v119 = &v101[8 * v100];
                        if (v96) {
                          operator delete(v96);
                        }
                      }
                      else
                      {
                        *(void *)long long v118 = v92;
                        v95 = v94 + 8;
                      }
                      long long v118 = v95;
                    }
                    if (!*((unsigned char *)a3 + 600)
                      || (unsigned int v104 = *((unsigned __int16 *)a3 + 215), v104 < 0x100)
                      || (uint64_t ptr = self->_protobufLogger.__ptr_,
                          [v10 distance],
                          float v107 = v106,
                          [v113 doubleValue],
                          !*((unsigned char *)a3 + 24)))
                    {
                      sub_10000AE44();
                    }
                    sub_10029F828((uint64_t)ptr, v104, v107, v108, *((double *)a3 + 2), (uint64_t)v121, (uint64_t)&__p, (uint64_t *)&buf, *((unsigned __int16 *)a3 + 18), *((void *)a3 + 5));

                    if (__p)
                    {
                      long long v118 = (char *)__p;
                      operator delete(__p);
                    }

                    if (*(void *)v121)
                    {
                      *(void *)&v121[8] = *(void *)v121;
                      operator delete(*(void **)v121);
                    }
                  }

                  if ((void)buf)
                  {
                    *((void *)&buf + 1) = buf;
                    operator delete((void *)buf);
                  }
                }
                else
                {
                  [(NINearbyUpdatesEngine *)self _getRangeUncertaintyWhenBiasEstimateNotAvailable];
                  [v10 setRangeUncertainty:];
                  double v58 = (id)qword_1008ABDE0;
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                  {
                    [v10 rangeUncertainty];
                    LODWORD(buf) = 134217984;
                    *(void *)((char *)&buf + 4) = v59;
                    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Could not compute bias estimate, override range uncertainty to %.2f", (uint8_t *)&buf, 0xCu);
                  }
                }
                goto LABEL_41;
              }
              if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
              {
LABEL_41:
                unsigned int v23 = [(NINearbyUpdatesEngine *)self _shouldConsumeRoseSolution:a3];
                if (!sub_1003217DC(&self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&a4->regionSizeCategory))goto LABEL_166; {
                double v24 = sub_100056B3C(&self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&a4->regionSizeCategory);
                }
                if (!v24) {
                  sub_10015FDEC("unordered_map::at: key not found");
                }
                if (v24[3])
                {
                  if (v23) {
                    [(NINearbyUpdatesEngine *)self processUWBResultForRegionMonitoring:v10 roseSolution:a3 processingOptions:a4];
                  }
                }
                else
                {
LABEL_166:
                  if (*(void *)&self->_uniqueIdentifier.__r_.var0)
                  {
                    [(NINearbyUpdatesEngine *)self processUWBResultForSyntheticAperture:v10 roseSolution:a3];
                  }
                  else if (self->_uniqueIdentifier.var0)
                  {
                    if (*((unsigned char *)a3 + 600))
                    {
                      std::string::size_type v25 = [v10 discoveryToken];
                      id v26 = [v25 hash];
                      if (!*((unsigned char *)a3 + 24) || !*((unsigned char *)a3 + 600)) {
                        sub_10000AE44();
                      }
                      uint64_t v27 = *((void *)a3 + 2);
                      *(float *)&unsigned int v28 = *((double *)a3 + 44);
                      uint64_t v29 = *((void *)a3 + 27);
                      int v30 = *((unsigned __int16 *)a3 + 80) | 0x10000;
                      __int16 v31 = *((_WORD *)a3 + 257);
                      __int16 v32 = *((_WORD *)a3 + 280);
                      *(void *)&long long buf = v26;
                      *((void *)&buf + 1) = v27;
                      v126[0] = v28 | 0x100000000;
                      char v127 = 0;
                      char v128 = 0;
                      char v129 = 0;
                      char v130 = 0;
                      v126[1] = 0;
                      v126[2] = 0;
                      uint64_t v131 = v29;
                      uint64_t v132 = 1;
                      __int16 v133 = 0;
                      v135[48] = 0;
                      memset(v135, 0, 25);
                      long long v134 = 0u;
                      uint64_t v136 = 0;
                      uint64_t v137 = 0;
                      int v138 = v30;
                      __int16 v139 = v31;
                      __int16 v140 = v32;

                      [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
                      double v33 = self->_protobufLogger.__ptr_;
                      if (v33) {
                        sub_1002A358C((uint64_t)v33, (const std::string *)&self->_uniqueIdentifier, (float32x2_t *)&buf);
                      }
                      dataSource = self->_dataSource;
                      if (dataSource)
                      {
                        if (!*((unsigned char *)a3 + 600)) {
                          sub_10000AE44();
                        }
                        -[NINearbyUpdatesEngineDataSource updateWithSuccessfulRange:uwbRSSI:nbRSSI:](dataSource, "updateWithSuccessfulRange:uwbRSSI:nbRSSI:", *((void *)a3 + 28), *((void *)a3 + 29), *((double *)a3 + 44), *((double *)a3 + 27));
                      }
                      double v35 = *((double *)&buf + 1);
                      double v36 = *(double *)&self->_onlySendKinematicFindeeData;
                      *(void *)&self->_onlySendKinematicFindeeData = *((void *)&buf + 1);
                      double v37 = sub_100006C38();
                      double v38 = v35 - v36;
                      double v39 = v37 - *(double *)&self->_findingLatencyBookkeeping.receivedFirstMeasurement;
                      *(double *)&self->_findingLatencyBookkeeping.receivedFirstMeasurement = v37;
                      double v40 = v39 - v38;
                      if (self->_cachedMagneticFieldStrength.__engaged_) {
                        self->_findingLatencyBookkeeping.double lastMeasurementTimeSeconds = v40
                      }
                                                                                    + self->_findingLatencyBookkeeping.lastMeasurementTimeSeconds;
                      double v41 = qword_1008ABDE0;
                      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
                      {
                        double lastMeasurementTimeSeconds = self->_findingLatencyBookkeeping.lastMeasurementTimeSeconds;
                        *(_DWORD *)long long v121 = 134349824;
                        *(double *)&v121[4] = v38;
                        *(_WORD *)&v121[12] = 2050;
                        *(double *)&v121[14] = v39;
                        *(_WORD *)&v121[22] = 1026;
                        int v122 = (int)(v40 * 1000.0);
                        __int16 v123 = 1026;
                        int v124 = (int)(lastMeasurementTimeSeconds * 1000.0);
                        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Finding range result latency report. measDelta: %{public}0.3f [s]. processDelta: %{public}0.3f [s]. Excess ms: %{public}d. Accumulated excess ms: %{public}d", v121, 0x22u);
                      }
                      self->_cachedMagneticFieldStrength.__engaged_ = 1;
                      sub_1001F2E48();
                      (*(void (**)(int64_t, long long *))(*(void *)self->_uniqueIdentifier.var0 + 24))(self->_uniqueIdentifier.var0, &buf);
                      sub_1001F2E48();
                      if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0
                                                                          + 32))(self->_uniqueIdentifier.var0))
                        [(NINearbyUpdatesEngine *)self provideFindingSolution:v10];
                      if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0
                                                                          + 40))(self->_uniqueIdentifier.var0))
                        [(NINearbyUpdatesEngine *)self getPeerDataFromFindingContainerWithToken:v11];
                    }
                    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
                    {
                      sub_10042FAFC();
                    }
                  }
                  else if (v23)
                  {
                    [(NINearbyUpdatesEngine *)self reportAndLogNearbyObject:v10];
                  }
                }

                return;
              }
              LOWORD(buf) = 0;
              double v14 = "#nrby-eng,#bias-est Not estimating range bias correction for this range result since no TOA V2 CIRs";
            }
            else
            {
              int v13 = qword_1008ABDE0;
              if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_41;
              }
              LOWORD(buf) = 0;
              double v14 = "#nrby-eng,#bias-est received raw rose range measurement without remoteTxAntennaMask, Bypass estimati"
                    "ng bias correction.";
            }
          }
          else
          {
            int v13 = qword_1008ABDE0;
            if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_41;
            }
            LOWORD(buf) = 0;
            double v14 = "#nrby-eng,#bias-est raw_rose_measurement not available, Bypass estimating bias correction.";
          }
        }
        else
        {
          if (!v16) {
            goto LABEL_41;
          }
          LOWORD(buf) = 0;
          double v14 = "#nrby-eng,#bias-est This device type does not require bias estimation";
        }
      }
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, 2u);
      goto LABEL_41;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10042FAC8();
  }
}

- (void)acceptUnsuccessfulRoseSolution:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10042FC94();
  }
  unsigned int v5 = +[NSUserDefaults standardUserDefaults];
  int v6 = [v5 objectForKey:@"ForwardUnsuccessfulRangingEvents"];

  if (v6)
  {
    unsigned int v7 = *((_DWORD *)a3 + 8);
    if (v7 <= 5)
    {
      int v8 = 1 << v7;
      if ((v8 & 0x31) == 0)
      {
        if ((v8 & 0xC) != 0) {
          [(NINearbyUpdatesEngine *)self _handleRangeAndAoASolution:a3];
        }
        else {
        double v9 = [(NINearbyUpdatesEngine *)self _handleRangeOnlySolution:a3];
        }
        if (v9) {
          [(NINearbyUpdatesEngine *)self reportAndLogNearbyObject:v9];
        }
        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042FB64();
      }
    }
    double v9 = 0;
LABEL_14:
  }
  if (self->_uniqueIdentifier.var0)
  {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
    if (*((unsigned char *)a3 + 24))
    {
      if (*((unsigned char *)a3 + 600))
      {
        unsigned int v10 = *((unsigned __int16 *)a3 + 280);
        if (v10 <= 0xFF) {
          sub_10042FB98();
        }
        __int16 v11 = *((_WORD *)a3 + 80);
        uint64_t v19 = *((void *)a3 + 2);
        LOWORD(v20) = v11;
        BYTE2(v20) = v10;
        uint64_t ptr = self->_protobufLogger.__ptr_;
        if (ptr) {
          sub_1002A2658((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)&v19);
        }
        dataSource = self->_dataSource;
        if (dataSource) {
          [(NINearbyUpdatesEngineDataSource *)dataSource updateWithMissedRange];
        }
        if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 304))(self->_uniqueIdentifier.var0))
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
            sub_10042FC60();
          }
          sub_1001F2E48();
          (*(void (**)(void))(*(void *)self->_uniqueIdentifier.var0 + 296))();
          sub_1001F2E48();
          if ((*(unsigned int (**)(void))(*(void *)self->_uniqueIdentifier.var0 + 312))())
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
            unsigned int v15 = [WeakRetained objectFromIdentifier:*((void *)a3 + 5)];

            if (v15)
            {
              if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
                sub_10042FC2C();
              }
              BOOL v16 = [v15 discoveryToken:v19, v20];
              [(NINearbyUpdatesEngine *)self getPeerDataFromFindingContainerWithToken:v16];
            }
            else
            {
              findingPeerToken = self->_findingPeerToken;
              BOOL v18 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG);
              if (findingPeerToken)
              {
                if (v18) {
                  sub_10042FBF8();
                }
                -[NINearbyUpdatesEngine getPeerDataFromFindingContainerWithToken:](self, "getPeerDataFromFindingContainerWithToken:", self->_findingPeerToken, v19, v20);
              }
              else if (v18)
              {
                sub_10042FBC4();
              }
            }
          }
        }
      }
    }
  }
}

- (void)reportAndLogNearbyObject:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if (objc_opt_respondsToSelector())
  {
    id v17 = v4;
    int v6 = +[NSArray arrayWithObjects:&v17 count:1];
    [WeakRetained updatesEngine:self didUpdateNearbyObjects:v6];
  }
  dataSource = self->_dataSource;
  if (dataSource) {
    [(NINearbyUpdatesEngineDataSource *)dataSource nearbyObjectUpdated:v4];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    [v4 timestamp];
    double v10 = v9;
    sub_100290760(v4, (uint64_t)__p);
    __int16 v11 = 0;
    uint64_t v12 = 0;
    int v13 = 0;
    double v14 = &v11;
    char v15 = 0;
    __int16 v11 = (char *)operator new(0xA0uLL);
    uint64_t v12 = (uint64_t)v11;
    int v13 = v11 + 160;
    uint64_t v12 = sub_100321364((uint64_t)&v13, (uint64_t)__p, (uint64_t)&v17, (uint64_t)v11);
    sub_10029BB5C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)&v11, v10);
    double v14 = &v11;
    sub_1003214E4((void ***)&v14);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
}

- (void)acceptDeviceMotion:(const void *)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    uint64_t v12 = *((void *)a3 + 1);
    long long v13 = *(_OWORD *)((char *)a3 + 24);
    uint64_t v14 = *((void *)a3 + 5);
    long long v15 = *((_OWORD *)a3 + 3);
    uint64_t v16 = *((void *)a3 + 8);
    long long v3 = *(_OWORD *)((char *)a3 + 88);
    long long v17 = *(_OWORD *)((char *)a3 + 72);
    long long v18 = v3;
    uint64_t v20 = *((void *)a3 + 15);
    long long v19 = *(_OWORD *)((char *)a3 + 104);
    long long v4 = *(_OWORD *)((char *)a3 + 152);
    uint64_t v22 = *((void *)a3 + 21);
    long long v21 = v4;
    p_regionMonitorMap = &self->_regionMonitorMap;
    unint64_t v11 = 0;
    if (sub_1003217DC(&self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_, &v11))
    {
      unint64_t v10 = 0;
      int v6 = sub_100056B3C(p_regionMonitorMap, &v10);
      if (!v6) {
        goto LABEL_13;
      }
      if (v6[3])
      {
        unint64_t v11 = 0;
        unsigned int v7 = sub_100056B3C(p_regionMonitorMap, &v11);
        if (!v7) {
          goto LABEL_13;
        }
        sub_10038FE20((void *)v7[3], (double *)&v12, 0);
      }
    }
    unint64_t v11 = 10;
    if (!sub_1003217DC(p_regionMonitorMap, &v11)) {
      return;
    }
    unint64_t v10 = 10;
    int v8 = sub_100056B3C(p_regionMonitorMap, &v10);
    if (v8)
    {
      if (!v8[3]) {
        return;
      }
      unint64_t v11 = 10;
      double v9 = sub_100056B3C(p_regionMonitorMap, &v11);
      if (v9)
      {
        sub_10038FE20((void *)v9[3], (double *)&v12, 0);
        return;
      }
    }
LABEL_13:
    sub_10015FDEC("unordered_map::at: key not found");
  }
}

- (void)acceptMagneticFieldStrength:(double)a3
{
  double v5 = sub_100006C38();
  int null_state = self->_cachedMagneticFieldStrength.var0.__null_state_;
  *(double *)&self->_rangeBiasEstimatorSingleAntennaModel = v5;
  *(double *)&self->_shouldBypassBiasCorrection = a3;
  if (!null_state) {
    self->_cachedMagneticFieldStrength.var0.__null_state_ = 1;
  }
}

- (void)acceptBluetoothSample:(const void *)a3 coarseEstimation:(BOOL)a4 regionCategory:(int64_t)a5
{
  BOOL v5 = a4;
  v54[0] = a5;
  p_regionMonitorMap = &self->_regionMonitorMap;
  if (sub_1003217DC(&self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_, v54))
  {
    double v9 = sub_100056B3C(p_regionMonitorMap, v54);
    if (!v9) {
      sub_10015FDEC("unordered_map::at: key not found");
    }
    if (v9[3])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
      unint64_t v11 = [WeakRetained objectFromIdentifier:*((void *)a3 + 9)];

      if (v11)
      {
        uint64_t ptr = self->_protobufLogger.__ptr_;
        if (ptr) {
          sub_10029C28C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
        }
        obuint64_t j = [v11 discoveryToken];
        id v53 = [obj hash];
        v45[0] = &v53;
        long long v13 = (id *)sub_100321590((uint64_t)&self->_hashToTokenMap, (unint64_t *)&v53, (uint64_t)&unk_1004BC2F8, v45);
        objc_storeStrong(v13 + 3, obj);
        int v38 = v54[0];
        uint64_t v14 = sub_100056B3C(p_regionMonitorMap, v54);
        if (!v14) {
          sub_10015FDEC("unordered_map::at: key not found");
        }
        sub_1003904E0((uint64_t *)v14[3], v5, v38, (uint64_t *)&v51);
        v50[0] = 0;
        v50[1] = 0;
        v49 = v50;
        long long v15 = sub_100056B3C(p_regionMonitorMap, v54);
        if (!v15) {
          goto LABEL_41;
        }
        if (sub_1003903F8(v15[3], *((void *)a3 + 9), *((void *)a3 + 10)))
        {
          uint64_t v16 = v51;
          for (unint64_t i = (void *)*v51; ; unint64_t i = v27)
          {
            uint64_t v20 = (void *)v16[1];
            long long v18 = v16 + 1;
            long long v19 = v20;
            if (v20)
            {
              do
              {
                long long v21 = v19;
                long long v19 = (void *)v19[1];
              }
              while (v19);
            }
            else
            {
              do
              {
                long long v21 = (void *)v18[2];
                BOOL v22 = *v21 == (void)v18;
                long long v18 = v21;
              }
              while (v22);
            }
            if (i == v21) {
              break;
            }
            unsigned int v23 = sub_1003196BC();
            int v24 = *((_DWORD *)i + 17);
            sub_100221F28();
            id v25 = objc_claimAutoreleasedReturnValue();
            sub_100004950(v43, (char *)[v25 UTF8String]);
            if (*((char *)a3 + 47) < 0)
            {
              sub_100002DE4(__p, *((void **)a3 + 3), *((void *)a3 + 4));
            }
            else
            {
              *(_OWORD *)std::string __p = *(_OWORD *)((char *)a3 + 24);
              uint64_t v42 = *((void *)a3 + 5);
            }
            sub_100259374((uint64_t)v23, v24, (uint64_t)v43, (uint64_t)__p, (uint64_t)v45);
            if (SHIBYTE(v42) < 0) {
              operator delete(__p[0]);
            }
            if (v44 < 0) {
              operator delete(v43[0]);
            }

            sub_10032193C((uint64_t)&v49, (uint64_t)v45, (uint64_t)v45);
            if (v48 && v47 < 0) {
              operator delete(v46[7]);
            }
            sub_10003E96C((uint64_t)v46, v46[1]);
            id v26 = (void *)i[1];
            if (v26)
            {
              do
              {
                uint64_t v27 = v26;
                id v26 = (void *)*v26;
              }
              while (v26);
            }
            else
            {
              do
              {
                uint64_t v27 = (void *)i[2];
                BOOL v22 = *v27 == (void)i;
                unint64_t i = v27;
              }
              while (!v22);
            }
            uint64_t v16 = v51;
          }
        }
        unsigned int v28 = sub_100056B3C(p_regionMonitorMap, v54);
        if (!v28) {
LABEL_41:
        }
          sub_10015FDEC("unordered_map::at: key not found");
        uint64_t v29 = v28[3];
        sub_100321BB0(v40, (uint64_t)&v49);
        double v30 = sub_100006C38();
        sub_10038FEFC(v29, (uint64_t)a3, (uint64_t)v40, v30, 0, v5, v38);
        sub_100321890((uint64_t)v40, (void *)v40[1]);
        sub_100321890((uint64_t)&v49, v50[0]);
        if (v52) {
          sub_10001A970(v52);
        }
      }
      else
      {
        __int16 v31 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10042FCC8((uint64_t)a3 + 72, v31, v32, v33, v34, v35, v36, v37);
        }
      }
    }
  }
}

- (void)clearStateForToken:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained identifierFromDiscoveryToken:v4];
    if (v8)
    {
      uint64_t v9 = (uint64_t)v7;
      double v10 = sub_100006C38();
      for (unint64_t i = self->_regionMonitorMap.__table_.__p1_.__value_.__next_; i; unint64_t i = (void *)*i)
      {
        uint64_t v12 = i[3];
        if (v12) {
          sub_10038FA78(v12, v9, 0, v10);
        }
      }
      if (self->_protobufLogger.__ptr_)
      {
        long long v13 = [v6 objectFromIdentifier:v9];
        uint64_t v14 = v13;
        if (v13)
        {
          uint64_t ptr = self->_protobufLogger.__ptr_;
          sub_100290760(v13, (uint64_t)__p);
          sub_10029E530((uint64_t)ptr, (uint64_t)__p, v10);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
      }
    }
  }
}

- (void)invalidate
{
  if (self->_regionMonitorMap.__table_.__p2_.__value_)
  {
    uint64_t ptr = self->_protobufLogger.__ptr_;
    if (ptr) {
      sub_10029D20C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier);
    }
    for (unint64_t i = self->_regionMonitorMap.__table_.__p1_.__value_.__next_; i; unint64_t i = (void *)*i)
      sub_100319994(i + 3, 0);
    sub_100321EC8((uint64_t)&self->_hashToTokenMap);
    [(NSMutableDictionary *)self->_regionDict removeAllObjects];
    sub_100321F20((uint64_t)&self->_regionMonitorMap);
  }
  HIDWORD(self->_convStateForObject) = 0;
  if (*(void *)&self->_uniqueIdentifier.__r_.var0)
  {
    BOOL v5 = self->_protobufLogger.__ptr_;
    if (v5) {
      sub_1002A317C((uint64_t)v5, (const std::string *)&self->_uniqueIdentifier);
    }
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 328))(var0, a2)) {
      (*(void (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 336))(self->_uniqueIdentifier.var0);
    }
    id v7 = self->_protobufLogger.__ptr_;
    if (v7)
    {
      sub_1002A317C((uint64_t)v7, (const std::string *)&self->_uniqueIdentifier);
    }
  }
}

- (id)_consolidateInputToMLModel:(const void *)a3
{
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Consolidating input to bias estimator", buf, 2u);
  }
  if (!*((unsigned char *)a3 + 600)) {
    sub_10000AE44();
  }
  if (!*((unsigned char *)a3 + 1312)) {
    sub_10042FD38();
  }
  if (*((unsigned __int16 *)a3 + 215) <= 0xFFu) {
    sub_10042FD64();
  }
  float v70 = (char *)a3 + 1208;
  BOOL v5 = (__int16 *)sub_1001771A0((uint64_t)a3 + 1208, 0);
  int v6 = [Complex alloc];
  double v81 = +[NSNumber numberWithDouble:(double)*v5];
  float v65 = +[NSNumber numberWithDouble:(double)v5[1]];
  BOOL v68 = -[Complex initWithRealPart:imagPart:](v6, "initWithRealPart:imagPart:", v81);
  v85[0] = v68;
  id v7 = [Complex alloc];
  uint64_t v79 = +[NSNumber numberWithDouble:(double)v5[2]];
  unsigned int v61 = +[NSNumber numberWithDouble:(double)v5[3]];
  float v63 = -[Complex initWithRealPart:imagPart:](v7, "initWithRealPart:imagPart:", v79);
  v85[1] = v63;
  char v8 = [Complex alloc];
  uint64_t v77 = +[NSNumber numberWithDouble:(double)v5[4]];
  uint64_t v57 = +[NSNumber numberWithDouble:(double)v5[5]];
  uint64_t v59 = -[Complex initWithRealPart:imagPart:](v8, "initWithRealPart:imagPart:", v77);
  v85[2] = v59;
  uint64_t v9 = [Complex alloc];
  unsigned int v75 = +[NSNumber numberWithDouble:(double)v5[6]];
  id v53 = +[NSNumber numberWithDouble:(double)v5[7]];
  double v55 = -[Complex initWithRealPart:imagPart:](v9, "initWithRealPart:imagPart:", v75);
  v85[3] = v55;
  double v10 = [Complex alloc];
  double v73 = +[NSNumber numberWithDouble:(double)v5[8]];
  v49 = +[NSNumber numberWithDouble:(double)v5[9]];
  uint64_t v51 = -[Complex initWithRealPart:imagPart:](v10, "initWithRealPart:imagPart:", v73);
  v85[4] = v51;
  unint64_t v11 = [Complex alloc];
  float v71 = +[NSNumber numberWithDouble:(double)v5[10]];
  uint64_t v12 = +[NSNumber numberWithDouble:(double)v5[11]];
  long long v13 = [(Complex *)v11 initWithRealPart:v71 imagPart:v12];
  v85[5] = v13;
  uint64_t v14 = [Complex alloc];
  long long v15 = +[NSNumber numberWithDouble:(double)v5[12]];
  uint64_t v16 = +[NSNumber numberWithDouble:(double)v5[13]];
  long long v17 = [(Complex *)v14 initWithRealPart:v15 imagPart:v16];
  v85[6] = v17;
  long long v18 = [Complex alloc];
  long long v19 = +[NSNumber numberWithDouble:(double)v5[14]];
  uint64_t v20 = +[NSNumber numberWithDouble:(double)v5[15]];
  long long v21 = [(Complex *)v18 initWithRealPart:v19 imagPart:v20];
  v85[7] = v21;
  double v67 = +[NSArray arrayWithObjects:v85 count:8];

  BOOL v22 = (__int16 *)sub_1001771A0((uint64_t)a3 + 1208, 1);
  unsigned int v23 = [Complex alloc];
  double v82 = +[NSNumber numberWithDouble:(double)*v22];
  float v66 = +[NSNumber numberWithDouble:(double)v22[1]];
  float v64 = -[Complex initWithRealPart:imagPart:](v23, "initWithRealPart:imagPart:", v82);
  v84[0] = v64;
  int v24 = [Complex alloc];
  uint64_t v80 = +[NSNumber numberWithDouble:(double)v22[2]];
  double v60 = +[NSNumber numberWithDouble:(double)v22[3]];
  int v62 = -[Complex initWithRealPart:imagPart:](v24, "initWithRealPart:imagPart:", v80);
  v84[1] = v62;
  id v25 = [Complex alloc];
  int v78 = +[NSNumber numberWithDouble:(double)v22[4]];
  int8x8_t v56 = +[NSNumber numberWithDouble:(double)v22[5]];
  double v58 = -[Complex initWithRealPart:imagPart:](v25, "initWithRealPart:imagPart:", v78);
  v84[2] = v58;
  id v26 = [Complex alloc];
  float64x2_t v76 = +[NSNumber numberWithDouble:(double)v22[6]];
  unint64_t v52 = +[NSNumber numberWithDouble:(double)v22[7]];
  unint64_t v54 = -[Complex initWithRealPart:imagPart:](v26, "initWithRealPart:imagPart:", v76);
  v84[3] = v54;
  uint64_t v27 = [Complex alloc];
  v74 = +[NSNumber numberWithDouble:(double)v22[8]];
  char v48 = +[NSNumber numberWithDouble:(double)v22[9]];
  v50 = -[Complex initWithRealPart:imagPart:](v27, "initWithRealPart:imagPart:", v74);
  v84[4] = v50;
  unsigned int v28 = [Complex alloc];
  float v72 = +[NSNumber numberWithDouble:(double)v22[10]];
  uint64_t v29 = +[NSNumber numberWithDouble:(double)v22[11]];
  double v30 = [(Complex *)v28 initWithRealPart:v72 imagPart:v29];
  v84[5] = v30;
  __int16 v31 = [Complex alloc];
  uint64_t v32 = +[NSNumber numberWithDouble:(double)v22[12]];
  uint64_t v33 = +[NSNumber numberWithDouble:(double)v22[13]];
  uint64_t v34 = [(Complex *)v31 initWithRealPart:v32 imagPart:v33];
  v84[6] = v34;
  uint64_t v35 = [Complex alloc];
  uint64_t v36 = +[NSNumber numberWithDouble:(double)v22[14]];
  uint64_t v37 = +[NSNumber numberWithDouble:(double)v22[15]];
  int v38 = [(Complex *)v35 initWithRealPart:v36 imagPart:v37];
  v84[7] = v38;
  v69 = +[NSArray arrayWithObjects:v84 count:8];

  double v39 = objc_alloc_init(BiasEstimatorFeatures);
  double v40 = +[NSDate date];
  [v40 timeIntervalSince1970];
  double v42 = v41;

  [(BiasEstimatorFeatures *)v39 setTimestamp:v42];
  if (!*((unsigned char *)a3 + 24)) {
    __assert_rtn("-[NINearbyUpdatesEngine _consolidateInputToMLModel:]", "NIServerNearbyUpdatesEngine.mm", 1835, "solution.mach_continuous_time_sec.has_value()");
  }
  [(BiasEstimatorFeatures *)v39 setUwbTime:*((double *)a3 + 2)];
  if (*((unsigned __int16 *)a3 + 215) <= 0xFFu) {
    sub_10000AE44();
  }
  [(BiasEstimatorFeatures *)v39 setAntennaMask:*((_WORD *)a3 + 215)];
  [(BiasEstimatorFeatures *)v39 setSoiRssiDbm:*((double *)a3 + 27)];
  [(BiasEstimatorFeatures *)v39 setRssiDbm:*((double *)a3 + 26)];
  [(BiasEstimatorFeatures *)v39 setTofPicSecond:*((double *)a3 + 22)];
  LOWORD(v43) = *((_WORD *)a3 + 212);
  [(BiasEstimatorFeatures *)v39 setToaNoiseRms:(double)v43];
  LOWORD(v44) = *((_WORD *)a3 + 213);
  [(BiasEstimatorFeatures *)v39 setToaPpwinRms:(double)v44];
  LOWORD(v45) = *((_WORD *)a3 + 214);
  [(BiasEstimatorFeatures *)v39 setToaPpwinPeak:(double)v45];
  if (*((unsigned char *)a3 + 440) && *((unsigned char *)a3 + 456) && *((unsigned char *)a3 + 472) && *((unsigned char *)a3 + 488))
  {
    [(BiasEstimatorFeatures *)v39 setRttInitiator:(double)*((unint64_t *)a3 + 54)];
    if (!*((unsigned char *)a3 + 456)) {
      sub_10000AE44();
    }
    [(BiasEstimatorFeatures *)v39 setTatInitiator:(double)*((unint64_t *)a3 + 56)];
    if (!*((unsigned char *)a3 + 472)) {
      sub_10000AE44();
    }
    [(BiasEstimatorFeatures *)v39 setRttResponder:(double)*((unint64_t *)a3 + 58)];
    if (!*((unsigned char *)a3 + 488)) {
      sub_10000AE44();
    }
    [(BiasEstimatorFeatures *)v39 setTatResponder:(double)*((unint64_t *)a3 + 60)];
    [(BiasEstimatorFeatures *)v39 setCirPacket1:v67];
    [(BiasEstimatorFeatures *)v39 setLeadingEdgePacket1:(double)sub_100177148((uint64_t)v70, 0)];
    [(BiasEstimatorFeatures *)v39 setFirstPathIndexPacket1:(double)sub_10017711C((uint64_t)v70, 0)];
    [(BiasEstimatorFeatures *)v39 setRxAntennaPacket1:sub_1001770F0((uint64_t)v70, 0)];
    [(BiasEstimatorFeatures *)v39 setCirPacket2:v69];
    [(BiasEstimatorFeatures *)v39 setLeadingEdgePacket2:(double)sub_100177148((uint64_t)v70, 1)];
    [(BiasEstimatorFeatures *)v39 setFirstPathIndexPacket2:(double)sub_10017711C((uint64_t)v70, 1)];
    [(BiasEstimatorFeatures *)v39 setRxAntennaPacket2:sub_1001770F0((uint64_t)v70, 1)];
    uint64_t v46 = v39;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042FD90();
    }
    uint64_t v46 = 0;
  }

  return v46;
}

- (id)_handleRangeAndAoASolution:(const void *)a3
{
  if (!*((unsigned char *)a3 + 752)) {
    sub_10042FDC4();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  int v6 = [WeakRetained objectFromIdentifier:*((void *)a3 + 5)];

  if (v6)
  {
    [(NINearbyUpdatesEngine *)self _convertFromPointingCoordinatesToSpatial:(char *)a3 + 608];
    float v15 = *(float *)&v7;
    float v16 = v8;
    int rangeMeasSourcePref = self->_rangeMeasSourcePref;
    if (rangeMeasSourcePref)
    {
      if (rangeMeasSourcePref != 1) {
        goto LABEL_12;
      }
      if (!*((unsigned char *)a3 + 600))
      {
        *(float *)&double v7 = NINearbyObjectDistanceNotAvailable;
        goto LABEL_11;
      }
      double v7 = *((double *)a3 + 44);
    }
    else
    {
      double v7 = *((double *)a3 + 81);
    }
    *(float *)&double v7 = v7;
LABEL_11:
    [v6 setDistance:v7];
LABEL_12:
    [v6 setDirection:sub_10003F778(&v15)];
    [v6 setDistanceMeasurementQuality:1];
    [v6 setQuaternion:sub_10003F6C8(v15, v16)];
    *(float *)&double v11 = v15;
    [v6 setAzimuth:v11];
    *(float *)&double v12 = v16;
    [v6 setElevation:v12];
    if (*((unsigned char *)a3 + 600))
    {
      [v6 setSignalStrength:*((double *)a3 + 27)];
      if (*((unsigned __int16 *)a3 + 215) >= 0x100u) {
        [v6 setRemoteTxAntennaMask:*((_WORD *)a3 + 215)];
      }
    }
    id v13 = v6;
    goto LABEL_16;
  }
  double v10 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#warning _handleRangeAndAoASolution failed to convert identifier to object.", buf, 2u);
  }
LABEL_16:

  return v6;
}

- (id)_handleRangeOnlySolution:(const void *)a3
{
  if (!*((unsigned char *)a3 + 600)) {
    sub_10042FDF0();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  int v6 = [WeakRetained objectFromIdentifier:*((void *)a3 + 5)];

  if (v6)
  {
    if (!*((unsigned char *)a3 + 600)) {
      sub_10000AE44();
    }
    if (self->_rangeMeasSourcePref < 2u)
    {
      double v7 = *((double *)a3 + 44);
      *(float *)&double v7 = v7;
      [v6 setDistance:v7];
    }
    [v6 setDirection:*(double *)NINearbyObjectDirectionNotAvailable.i64];
    [v6 setDistanceMeasurementQuality:1];
    [v6 setSignalStrength:*((double *)a3 + 27)];
    if (*((unsigned __int16 *)a3 + 215) >= 0x100u) {
      [v6 setRemoteTxAntennaMask:*((_WORD *)a3 + 215)];
    }
    if (*((unsigned __int16 *)a3 + 248) >= 0x100u && *((unsigned __int16 *)a3 + 249) >= 0x100u)
    {
      [v6 setNbRxStatus:*((_WORD *)a3 + 248)];
      if (*((unsigned __int16 *)a3 + 249) <= 0xFFu) {
        sub_10000AE44();
      }
      [v6 setMmsRxStatus:*((_WORD *)a3 + 249)];
    }
    if (*((unsigned char *)a3 + 232)) {
      [v6 setNbRssi:*((double *)a3 + 28)];
    }
    id v8 = v6;
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10042FE1C();
  }

  return v6;
}

- (double)_getRangeUncertaintyWhenBiasEstimateNotAvailable
{
  return 0.5;
}

- (BOOL)_shouldConsumeRoseSolution:(const void *)a3
{
  if (*((unsigned char *)a3 + 600))
  {
    long long v4 = *((_OWORD *)a3 + 6);
    long long v16 = *((_OWORD *)a3 + 5);
    long long v17 = v4;
    long long v5 = *((_OWORD *)a3 + 4);
    long long v14 = *((_OWORD *)a3 + 3);
    long long v15 = v5;
    int v6 = (const void *)*((void *)a3 + 15);
    uint64_t v18 = *((void *)a3 + 14);
    long long v19 = 0;
    uint64_t v7 = *((void *)a3 + 16);
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    sub_10015036C(&v19, v6, v7, (v7 - (uint64_t)v6) >> 3);
    long long v8 = *((_OWORD *)a3 + 10);
    long long v22 = *((_OWORD *)a3 + 9);
    long long v23 = v8;
    uint64_t v9 = (const void *)*((void *)a3 + 23);
    uint64_t v24 = *((void *)a3 + 22);
    std::string __p = 0;
    id v26 = 0;
    uint64_t v27 = 0;
    sub_10015042C(&__p, v9, *((void *)a3 + 24), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a3 + 24) - (void)v9) >> 3));
    memcpy(v28, (char *)a3 + 208, 0x181uLL);
    if (v28[153] > 0xFFu)
    {
      if (LOBYTE(v28[153]) <= 2u)
      {
        double v11 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          if (v28[153] <= 0xFFu) {
            sub_10000AE44();
          }
          v13[0] = 67109120;
          v13[1] = LOBYTE(v28[153]);
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#nrby-eng,mmsValStatus %d does not pass check, rejecting range result event", (uint8_t *)v13, 8u);
        }

        BOOL v10 = 0;
        goto LABEL_14;
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG))
    {
      sub_10042FE84();
    }
    BOOL v10 = 1;
LABEL_14:
    if (__p)
    {
      id v26 = __p;
      operator delete(__p);
    }
    if (v19)
    {
      uint64_t v20 = v19;
      operator delete(v19);
    }
    return v10;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10042FE50();
  }
  return 0;
}

- (void)_handleRegionChangeForDevice:(unint64_t)a3 currentRegion:(optional<nearby::algorithms::region_monitoring::Region> *)a4 prevRegion:timestamp:rangeResult:intentPrediction:regionTransitionSuppressed:
{
  unsigned int v40 = v7;
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  double v11 = v8;
  uint64_t v12 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if (WeakRetained)
  {
    uint64_t v38 = v9;
    if (LOBYTE(a4->var3))
    {
      data = a4;
      if (*((char *)&a4->var0.var1.var0.__r_.__value_.var0.var1 + 23) < 0) {
        data = (optional<nearby::algorithms::region_monitoring::Region> *)a4->var0.var1.var0.__r_.__value_.var0.var1.__data_;
      }
      long long v16 = +[NSString stringWithUTF8String:data];
      if (!LOBYTE(a4->var3)) {
        sub_10000AE44();
      }
      long long v17 = [[NIRegionKey alloc] initWithName:v16 regionSizeCategory:*(int *)&a4->var0.var1.var0.__r_.var1];
      uint64_t v18 = [(NSMutableDictionary *)self->_regionDict objectForKey:v17];
      if (!v18 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10042FF20();
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    if (*(unsigned char *)(v12 + 48))
    {
      uint64_t v20 = v12;
      if (*(char *)(v12 + 23) < 0) {
        uint64_t v20 = *(void *)v12;
      }
      uint64_t v21 = +[NSString stringWithUTF8String:v20];
      if (!*(unsigned char *)(v12 + 48)) {
        sub_10000AE44();
      }
      long long v22 = [[NIRegionKey alloc] initWithName:v21 regionSizeCategory:*(int *)(v12 + 28)];
      long long v23 = [(NSMutableDictionary *)self->_regionDict objectForKey:v22];
      if (!v23 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10042FF20();
      }
    }
    else
    {
      long long v23 = 0;
    }
    if ((v38 & 0xFF00000000) != 0) {
      std::to_string(&v49, *(float *)&v38);
    }
    else {
      sub_100004950(&v49, "N/A");
    }
    if ((v40 & 1) == 0)
    {
      sub_100004950(&__p, "NONE");
      sub_100004950(&v48, "NONE");
      if (*(unsigned char *)(v10 + 184))
      {
        sub_10031B528();
        if (*((char *)&__p.var0.var1 + 23) < 0) {
          operator delete(__p.var0.var1.__data_);
        }
        __rep __p = buf;
        if (!*(unsigned char *)(v10 + 184)) {
          sub_10000AE44();
        }
        if (*(unsigned char *)(v10 + 72))
        {
          sub_10031B528();
          if (*((char *)&v48.var0.var1 + 23) < 0) {
            operator delete(v48.var0.var1.__data_);
          }
          __rep v48 = buf;
        }
      }
      uint64_t v24 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = v23;
        p_uniqueIdentifier = &self->_uniqueIdentifier;
        if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
          p_uniqueIdentifier = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_uniqueIdentifier->__r_.__value_.var0.var1.__data_;
        }
        int v36 = *(unsigned __int8 *)(v12 + 48);
        if (*(unsigned char *)(v12 + 48))
        {
          sub_100359BB0(v12);
          if (v47 >= 0) {
            id v26 = (const char *)&v46;
          }
          else {
            id v26 = (const char *)v46;
          }
        }
        else
        {
          id v26 = "NONE";
        }
        if (LOBYTE(a4->var3))
        {
          sub_100359BB0((uint64_t)a4);
          if (v45 >= 0) {
            uint64_t v27 = (const char *)&v44;
          }
          else {
            uint64_t v27 = (const char *)v44;
          }
          unsigned int v28 = &v49;
          if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            unsigned int v28 = (std::string *)v49.__r_.__value_.__r.__words[0];
          }
          p_p = &__p;
          if (*((char *)&__p.var0.var1 + 23) < 0) {
            p_p = (__rep *)__p.var0.var1.__data_;
          }
          double v30 = (std::string *)&v48;
          if (*((char *)&v48.var0.var1 + 23) < 0) {
            double v30 = (std::string *)v48.var0.var1.__data_;
          }
          *(_DWORD *)buf.var0.var0.__data_ = 136316674;
          *(char **)((char *)&buf.var0.var1.__data_ + 4) = (char *)p_uniqueIdentifier;
          WORD2(buf.var0.var1.__size_) = 2048;
          *(unint64_t *)((char *)&buf.var0.var1.__size_ + 6) = a3;
          *((_WORD *)&buf.var0.var1 + 11) = 2080;
          uint64_t v51 = v26;
          __int16 v52 = 2080;
          id v53 = v27;
          __int16 v54 = 2080;
          double v55 = v28;
          __int16 v56 = 2080;
          uint64_t v57 = p_p;
          __int16 v58 = 2080;
          uint64_t v59 = v30;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor #region change ses_id: %s dev: 0x%llx from %s -> %s, intent score: %s, range_m: %s, rssi_dbm: %s", (uint8_t *)&buf, 0x48u);
          if (v45 < 0) {
            operator delete(v44);
          }
        }
        else
        {
          __int16 v31 = &v49;
          if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            __int16 v31 = (std::string *)v49.__r_.__value_.__r.__words[0];
          }
          uint64_t v32 = &__p;
          if (*((char *)&__p.var0.var1 + 23) < 0) {
            uint64_t v32 = (__rep *)__p.var0.var1.__data_;
          }
          uint64_t v33 = (std::string *)&v48;
          if (*((char *)&v48.var0.var1 + 23) < 0) {
            uint64_t v33 = (std::string *)v48.var0.var1.__data_;
          }
          *(_DWORD *)buf.var0.var0.__data_ = 136316674;
          *(char **)((char *)&buf.var0.var1.__data_ + 4) = (char *)p_uniqueIdentifier;
          WORD2(buf.var0.var1.__size_) = 2048;
          *(unint64_t *)((char *)&buf.var0.var1.__size_ + 6) = a3;
          *((_WORD *)&buf.var0.var1 + 11) = 2080;
          uint64_t v51 = v26;
          __int16 v52 = 2080;
          id v53 = "NONE";
          __int16 v54 = 2080;
          double v55 = v31;
          __int16 v56 = 2080;
          uint64_t v57 = v32;
          __int16 v58 = 2080;
          uint64_t v59 = v33;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor #region change ses_id: %s dev: 0x%llx from %s -> %s, intent score: %s, range_m: %s, rssi_dbm: %s", (uint8_t *)&buf, 0x48u);
        }
        long long v23 = v37;
        if (v36 && v47 < 0) {
          operator delete(v46);
        }
      }

      if (*((char *)&v48.var0.var1 + 23) < 0) {
        operator delete(v48.var0.var1.__data_);
      }
      if (*((char *)&__p.var0.var1 + 23) < 0) {
        operator delete(__p.var0.var1.__data_);
      }
    }
    if (*(unsigned char *)(v10 + 184)) {
      [(NINearbyUpdatesEngine *)self nearbyObjectFromRangeResult:v10];
    }
    else {
    uint64_t v34 = [(NINearbyUpdatesEngine *)self nearbyObjectFromDeviceIdentifier:a3];
    }
    if (v18) {
      -[NINearbyUpdatesEngine _fillNearbyObject:fromRegionSizeCategory:](self, "_fillNearbyObject:fromRegionSizeCategory:", v34, [v18 regionSizeCategory]);
    }
    if (v34)
    {
      if (objc_opt_respondsToSelector()) {
        [WeakRetained updatesEngine:self object:v34 didUpdateRegion:v18 previousRegion:v23 regionTransitionSuppressed:v40];
      }
      if (self->_protobufLogger.__ptr_)
      {
        sub_100290760(v34, (uint64_t)&buf);
        uint64_t ptr = self->_protobufLogger.__ptr_;
        if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
          sub_100002DE4(&__p, self->_uniqueIdentifier.__r_.__value_.var0.var1.__data_, self->_uniqueIdentifier.__r_.__value_.var0.var1.__size_);
        }
        else {
          __rep __p = self->_uniqueIdentifier.__r_.__value_;
        }
        char v43 = 1;
        sub_10029E14C((uint64_t)ptr, (const std::string *)&__p, (uint64_t)&buf, (std::string *)a4, (std::string *)v12, v38, v40, v11);
        if (v43 && *((char *)&__p.var0.var1 + 23) < 0) {
          operator delete(__p.var0.var1.__data_);
        }
        if (buf.var0.var1.__data_)
        {
          buf.var0.var1.__size_ = (unint64_t)buf.var0.var1.__data_;
          operator delete(buf.var0.var1.__data_);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10042FEB8();
    }

    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v49.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    long long v19 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.var0.__data_ = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions, no delegate.", (uint8_t *)&buf, 2u);
    }
  }
}

- (void)_handleBoundedRegionRange:(double)a3 forDevice:(unint64_t)a4 rangeResult:(optional<nearby::algorithms::common::RangeResult> *)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if (!a5->var1) {
    sub_10000AE44();
  }
  uint64_t v9 = [(NINearbyUpdatesEngine *)self nearbyObjectFromRangeResult:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a5->var0.var1.var15.__engaged_)
    {
      double val = a5->var0.var1.var15.var0.__val_;
      *(float *)&double val = val;
      [v9 setBoundedRegionRange:val];
    }
    if (objc_opt_respondsToSelector())
    {
      long long v14 = v10;
      uint64_t v12 = +[NSArray arrayWithObjects:&v14 count:1];
      [WeakRetained updatesEngine:self didUpdateNearbyObjects:v12];
    }
    if (self->_protobufLogger.__ptr_)
    {
      if (a5->var0.var1.var15.__engaged_)
      {
        sub_100290760(v10, (uint64_t)__p);
        sub_10029DE94((uint64_t)self->_protobufLogger.__ptr_, (const std::string *)&self->_uniqueIdentifier, (uint64_t)__p, a3);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10042FEB8();
  }
}

- (void)_handleDeviceMonitorActivation:(BOOL)a3 forDevice:(unint64_t)a4 timestamp:(double)a5 regionSizeCategory:(int)a6 regions:(optional<std:(int)a8 :vector<nearby::algorithms::region_monitoring::Region>> *)a7 predictorType:
{
  BOOL v13 = a3;
  long long v15 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10042FFC0(v13, a4, v15);
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    if (v13)
    {
      if (!a7->var1) {
        sub_10042FF94();
      }
      sub_10029D44C((uint64_t)ptr, a4, a6, (std::string **)a7, a8, a5);
    }
    else
    {
      sub_10029D76C((uint64_t)ptr, a4);
    }
  }
}

- (void)processUWBResultForRegionMonitoring:(id)a3 roseSolution:(const void *)a4 processingOptions:(const AlgorithmProcessingOptions *)a5
{
  id v9 = a3;
  uint64_t v10 = v9;
  if (!*((unsigned char *)a4 + 24)) {
    __assert_rtn("-[NINearbyUpdatesEngine processUWBResultForRegionMonitoring:roseSolution:processingOptions:]", "NIServerNearbyUpdatesEngine.mm", 2175, "solution.mach_continuous_time_sec.has_value()");
  }
  double v11 = *((double *)a4 + 2);
  [v9 distance];
  if (v12 != NINearbyObjectDistanceNotAvailable)
  {
    [v10 azimuth];
    unsigned int v13 = 0;
    if (v14 == *(float *)&NINearbyObjectAzimuthNotAvailable
      || ([v10 elevation], v15 == *(float *)&NINearbyObjectElevationNotAvailable))
    {
      uint64_t v18 = 0;
    }
    else
    {
      [v10 azimuth];
      unsigned int v13 = v16;
      [v10 elevation];
      unsigned int v5 = v17;
      uint64_t v18 = 0x100000001;
    }
    __int16 v58 = [v10 discoveryToken];
    id v57 = [v58 hash];
    if (self->_protobufLogger.__ptr_)
    {
      sub_100290760(v10, (uint64_t)__p);
      sub_10029D970((uint64_t)self->_protobufLogger.__ptr_, *((unsigned __int16 *)a4 + 18), *((void *)a4 + 5), (uint64_t)__p, (char)[v10 requiresBiasCorrection], v11);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    unsigned int v19 = [v10 remoteTxAntennaMask];
    if (v19 == NINearbyObjectRemoteTxAntennaMaskNotAvailable) {
      unsigned __int16 v20 = 1;
    }
    else {
      unsigned __int16 v20 = (unsigned __int16)[v10 remoteTxAntennaMask];
    }
    int convStateForObject_high = HIDWORD(self->_convStateForObject);
    uint64_t v55 = v18;
    switch(convStateForObject_high)
    {
      case 1:
      case 2:
        break;
      case 3:
        int intentPredictorConfiguration = a5->intentPredictorConfiguration;
        if (intentPredictorConfiguration == 2) {
          int v23 = 3;
        }
        else {
          int v23 = 0;
        }
        if (intentPredictorConfiguration == 1) {
          int convStateForObject_high = 1;
        }
        else {
          int convStateForObject_high = v23;
        }
        break;
      case 4:
        __assert_rtn("-[NINearbyUpdatesEngine processUWBResultForRegionMonitoring:roseSolution:processingOptions:]", "NIServerNearbyUpdatesEngine.mm", 2244, "false");
      default:
        int convStateForObject_high = 0;
        break;
    }
    unsigned int magneticFieldStrengthCheckOption = a5->magneticFieldStrengthCheckOption;
    uint64_t v25 = 0;
    if (magneticFieldStrengthCheckOption == 1)
    {
      unsigned int v26 = 0;
    }
    else
    {
      if (self->_cachedMagneticFieldStrength.var0.__null_state_)
      {
        rangeBiasEstimatorSingleAntennaModel = self->_rangeBiasEstimatorSingleAntennaModel;
        if (vabdd_f64(*(double *)&rangeBiasEstimatorSingleAntennaModel, v11) < 0.07)
        {
          unsigned int v26 = magneticFieldStrengthCheckOption >> 8;
          uint64_t v25 = *(void *)&self->_shouldBypassBiasCorrection;
LABEL_28:
          p_regionSizeCategory = &a5->regionSizeCategory;
          if (sub_1003217DC(&self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)p_regionSizeCategory))
          {
            uint64_t v29 = sub_100056B3C(&self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)p_regionSizeCategory);
            if (!v29) {
              sub_10015FDEC("unordered_map::at: key not found");
            }
            if (v29[3])
            {
              double v30 = sub_100056B3C(&self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)p_regionSizeCategory);
              if (!v30) {
                sub_10015FDEC("unordered_map::at: key not found");
              }
              std::string::size_type v31 = v30[3];
              [v10 distance];
              int v33 = v32;
              [v10 signalStrength];
              uint64_t v35 = v34;
              [v10 rangeBiasEstimate];
              if (v36 == *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable)
              {
                uint64_t v37 = 0;
                uint64_t v38 = 0;
              }
              else
              {
                [v10 rangeBiasEstimate];
                uint64_t v38 = v39;
                uint64_t v37 = 1;
              }
              [v10 rangeUncertainty:v55];
              if (v40 == *(double *)&NINearbyObjectRangeUncertaintyNotAvailable)
              {
                uint64_t v41 = 0;
                uint64_t v42 = 0;
              }
              else
              {
                [v10 rangeUncertainty];
                uint64_t v41 = 1;
              }
              unint64_t v43 = *p_regionSizeCategory;
              *(void *)__rep buf = v57;
              int v44 = magneticFieldStrengthCheckOption | (v26 << 8);
              *(double *)float v64 = v11;
              BOOL v45 = v44 == 1;
              BOOL v46 = v44 != 1;
              *(_DWORD *)&v64[8] = v33;
              if (v45) {
                char v47 = 0;
              }
              else {
                char v47 = magneticFieldStrengthCheckOption;
              }
              *(_DWORD *)float v65 = 1;
              *(void *)&v65[4] = v13 | ((unint64_t)v5 << 32);
              *(void *)&v65[12] = v56;
              char v66 = 0;
              char v67 = 0;
              char v68 = 0;
              char v69 = 0;
              uint64_t v70 = v35;
              uint64_t v71 = 1;
              __int16 v72 = v20 | 0x100;
              uint64_t v73 = v38;
              uint64_t v74 = v37;
              uint64_t v75 = v42;
              uint64_t v76 = v41;
              int v77 = v43;
              int v78 = convStateForObject_high;
              char v79 = v47;
              __int16 v80 = v26;
              char v81 = BYTE2(v26);
              double v82 = rangeBiasEstimatorSingleAntennaModel;
              uint64_t v83 = v25;
              BOOL v84 = v46;
              uint64_t v85 = 0;
              uint64_t v86 = 0;
              uint64_t v87 = 0;
              sub_10038FBBC(v31, (uint64_t)buf, 0, (uint64_t)__p);
              if (v61)
              {
                *(float *)&double v48 = v60;
                [v10 setDistance:v48];
                [v10 setDistanceMeasurementQuality:1];
                [v10 setMotionState:0];
                [v10 setTimestamp:v11];
                std::string v49 = (id)qword_1008ABDE0;
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  if (!v61) {
                    sub_10000AE44();
                  }
                  int v50 = *((unsigned __int16 *)a4 + 18);
                  unint64_t v51 = 0xBFF0000000000000;
                  if (*((unsigned char *)a4 + 24)) {
                    unint64_t v51 = *((void *)a4 + 2);
                  }
                  *(_DWORD *)__rep buf = 67109888;
                  *(_DWORD *)&uint8_t buf[4] = v50;
                  *(_WORD *)float v64 = 2048;
                  *(void *)&v64[2] = v51;
                  *(_WORD *)&v64[10] = 2048;
                  *(void *)float v65 = v57;
                  *(_WORD *)&v65[8] = 2048;
                  *(double *)&v65[10] = v60;
                  _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions filtered solution. {'ticket id': %d, 'cont time s': %0.3f, 'identifier': %llx, 'range_m': %0.2f}", buf, 0x26u);
                }

                if (self->_protobufLogger.__ptr_)
                {
                  sub_100290760(v10, (uint64_t)buf);
                  sub_10029DC08((uint64_t)self->_protobufLogger.__ptr_, *((unsigned __int16 *)a4 + 18), *((void *)a4 + 5), (uint64_t)buf, v11);
                  if (*(void *)buf)
                  {
                    *(void *)float v64 = *(void *)buf;
                    operator delete(*(void **)buf);
                  }
                }
                if (v10)
                {
                  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
                  if (objc_opt_respondsToSelector())
                  {
                    int v62 = v10;
                    id v53 = +[NSArray arrayWithObjects:&v62 count:1];
                    [WeakRetained updatesEngine:self didUpdateNearbyObjects:v53];
                  }
                  dataSource = self->_dataSource;
                  if (dataSource) {
                    [(NINearbyUpdatesEngineDataSource *)dataSource nearbyObjectUpdated:v10];
                  }
                }
              }
            }
          }

          goto LABEL_57;
        }
      }
      unsigned int v26 = 0;
      LOBYTE(magneticFieldStrengthCheckOption) = 1;
    }
    rangeBiasEstimatorSingleAntennaModel = 0;
    goto LABEL_28;
  }
LABEL_57:
}

- (void)acceptWiFiRangeResults:(const void *)a3
{
}

- (void)_handleWiFiRangeResults:(const void *)a3
{
  long long v3 = *(uint64_t **)a3;
  int v33 = (uint64_t *)*((void *)a3 + 1);
  if (*(uint64_t **)a3 != v33)
  {
    p_previousNIObjectUpdate = &self->_previousNIObjectUpdate;
    p_regionMonitorMap = &self->_regionMonitorMap;
    p_hashToTokenMap = &self->_hashToTokenMap;
    location = (id *)&self->_configuration;
    while (1)
    {
      uint64_t v7 = v3[3];
      if (v3[4] != v7) {
        break;
      }
LABEL_37:
      v3 += 7;
      if (v3 == v33) {
        return;
      }
    }
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = v7 + v8;
      int v11 = *(_DWORD *)v10;
      double v12 = sub_100006A9C(*(void *)(v10 + 16));
      id WeakRetained = objc_loadWeakRetained((id *)p_previousNIObjectUpdate);
      float v14 = [WeakRetained objectFromIdentifier:*v3];

      if (!v14)
      {
        double v30 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = *v3;
          *(_DWORD *)__rep buf = 134217984;
          *(void *)&uint8_t buf[4] = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#nrby-eng,_handleWiFiRangeResult failed to create object from address 0x%llx ", buf, 0xCu);
        }
        goto LABEL_36;
      }
      double v15 = (double)v11 * 0.0149896229;
      float v16 = v15;
      *(float *)&double v15 = v16;
      [v14 setDistance:v15];
      [v14 setDirection:*(double *)NINearbyObjectDirectionNotAvailable.i64];
      [v14 setDistanceMeasurementQuality:2];
      uint64_t ptr = self->_protobufLogger.__ptr_;
      if (ptr) {
        sub_10029C094((uint64_t)ptr, *v3, *(unsigned __int8 *)(v3[3] + v8 + 8), *(unsigned __int8 *)(v3[3] + v8 + 9), v3[1], v16, v12);
      }
      *(void *)__rep buf = 0;
      if (!sub_1003217DC(p_regionMonitorMap, (unint64_t *)buf)) {
        goto LABEL_39;
      }
      v36[0] = 0;
      uint64_t v18 = sub_100056B3C(p_regionMonitorMap, v36);
      if (!v18) {
        sub_10015FDEC("unordered_map::at: key not found");
      }
      if (!v18[3])
      {
LABEL_39:

        return;
      }
      *(void *)__rep buf = 0;
      unsigned int v19 = sub_100056B3C(p_regionMonitorMap, (unint64_t *)buf);
      if (!v19) {
        sub_10015FDEC("unordered_map::at: key not found");
      }
      if (v19[3])
      {
        unsigned __int16 v20 = [v14 discoveryToken];
        id v53 = 0;
        id v53 = [v20 hash];
        *(void *)__rep buf = &v53;
        uint64_t v21 = (id *)sub_100321590((uint64_t)p_hashToTokenMap, (unint64_t *)&v53, (uint64_t)&unk_1004BC2F8, (void **)buf);
        objc_storeStrong(v21 + 3, v20);
        v36[0] = (unint64_t)[v20 hash];
        *(double *)&v36[1] = v12;
        float v37 = v16;
        int v38 = 2;
        char v41 = 0;
        char v42 = 0;
        char v43 = 0;
        char v44 = 0;
        v49[48] = 0;
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        __int16 v47 = 0;
        long long v48 = 0u;
        memset(v49, 0, 25);
        uint64_t v50 = 0;
        uint64_t v51 = 0;
        uint64_t v52 = 0;
        uint64_t v23 = v3[3];
        uint64_t v22 = v3[4];
        *(void *)__rep __p = 0;
        uint64_t v24 = sub_100056B3C(p_regionMonitorMap, (unint64_t *)__p);
        if (!v24) {
          sub_10015FDEC("unordered_map::at: key not found");
        }
        sub_10038FBBC(v24[3], (uint64_t)v36, v9 == 0xAAAAAAAAAAAAAAABLL * ((v22 - v23) >> 3) - 1, (uint64_t)buf);
        if (!v65)
        {
          int v32 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__rep __p = 134217984;
            *(double *)&__p[4] = v37;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#wifi_regions: measurement processed but no filtered solution returned, Distance: %f m", __p, 0xCu);
          }
          goto LABEL_35;
        }
        *(float *)&double v25 = v63;
        [v14 setDistance:v25];
        if (!v65) {
          sub_10000AE44();
        }
        if (v64 > 1.0 && v64 != -1.0) {
          [v14 setDistanceMeasurementQuality:3 v64];
        }
        if (self->_protobufLogger.__ptr_)
        {
          sub_100290760(v14, (uint64_t)__p);
          sub_10029DC08((uint64_t)self->_protobufLogger.__ptr_, v3[1], *v3, (uint64_t)__p, v12);
          if (*(void *)__p)
          {
            *(void *)&__p[8] = *(void *)__p;
            operator delete(*(void **)__p);
          }
        }
        unsigned int v26 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          if (!v65) {
            sub_10000AE44();
          }
          uint64_t v27 = v3[1];
          *(_DWORD *)__rep __p = 134219008;
          *(void *)&__p[4] = v27;
          *(_WORD *)&__p[12] = 2048;
          *(double *)&__p[14] = v12;
          __int16 v56 = 2048;
          unint64_t v57 = (unint64_t)v53;
          __int16 v58 = 2048;
          double v59 = v63;
          __int16 v60 = 2048;
          double v61 = v64;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#wifi_regions: filtered solution. {'ticket id': %llu, 'cont time s': %0.3f, 'identifier': %llx, 'range_m': %0.2f, 'uncertainty: %0.2f}", __p, 0x34u);
        }

        [v14 setMotionState:0];
      }
      unsigned __int16 v20 = objc_loadWeakRetained(location);
      if (objc_opt_respondsToSelector())
      {
        __int16 v54 = v14;
        unsigned int v28 = +[NSArray arrayWithObjects:&v54 count:1];
        [v20 updatesEngine:self didUpdateNearbyObjects:v28];
      }
      dataSource = self->_dataSource;
      if (dataSource) {
        [(NINearbyUpdatesEngineDataSource *)dataSource nearbyObjectUpdated:v14];
      }
LABEL_35:

LABEL_36:
      ++v9;
      uint64_t v7 = v3[3];
      v8 += 24;
      if (0xAAAAAAAAAAAAAAABLL * ((v3[4] - v7) >> 3) <= v9) {
        goto LABEL_37;
      }
    }
  }
}

- (void)acceptVisionInput:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  uint64_t v6 = v5;
  [v4 devicePose];
  long long v31 = v8;
  long long v32 = v7;
  long long v29 = v10;
  long long v30 = v9;
  id v11 = [v4 trackingState];
  if (v11 == (id)2) {
    int v12 = 2;
  }
  else {
    int v12 = v11 == (id)1;
  }
  *(void *)&long long v44 = v6;
  long long v45 = v32;
  long long v46 = v31;
  long long v47 = v30;
  long long v48 = v29;
  LODWORD(v49) = v12;
  BYTE4(v49) = [v4 majorRelocalization];
  BYTE5(v49) = [v4 minorRelocalization];
  BYTE8(v49) = 0;
  LOBYTE(v50) = 0;
  BYTE8(v50) = 0;
  BYTE12(v50) = 0;
  LOBYTE(v51) = 0;
  BYTE4(v51) = 0;
  [v4 lightEstimate];
  if (v13 != *(double *)&NIARLightEstimateNotAvailable)
  {
    [v4 lightEstimate];
    *((void *)&v49 + 1) = v14;
    LOBYTE(v50) = 1;
  }
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10029FE58((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)&v44);
  }
  dataSource = self->_dataSource;
  if (dataSource) {
    [(NINearbyUpdatesEngineDataSource *)dataSource updateWithPose:&v44];
  }
  uint64_t v17 = *(void *)&self->_uniqueIdentifier.__r_.var0;
  if (!v17) {
    goto LABEL_27;
  }
  sub_10033BCD4(v17, (uint64_t)&v44);
  uint64_t v18 = self->_dataSource;
  if (v18)
  {
    v43[4] = v48;
    v43[5] = v49;
    v43[6] = v50;
    v43[7] = v51;
    v43[0] = v44;
    v43[1] = v45;
    v43[2] = v46;
    v43[3] = v47;
    [(NINearbyUpdatesEngineDataSource *)v18 updateWithVIOPose:v43];
  }
  sub_10033DE98(*(void *)&self->_uniqueIdentifier.__r_.var0, (uint64_t)__src);
  unsigned int v19 = self->_dataSource;
  if (v19)
  {
    memcpy(__dst, __src, sizeof(__dst));
    [(NINearbyUpdatesEngineDataSource *)v19 updateWithSASolution:__dst];
  }
  if (!LOBYTE(__src[24])) {
    goto LABEL_27;
  }
  unsigned __int16 v20 = [(NINearbyUpdatesEngine *)self nearbyObjectFromSolution:__src];
  if (v20)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v40 = v20;
      uint64_t v22 = +[NSArray arrayWithObjects:&v40 count:1];
      [WeakRetained updatesEngine:self didUpdateNearbyObjects:v22];
    }
    uint64_t v23 = self->_dataSource;
    if (v23) {
      [(NINearbyUpdatesEngineDataSource *)v23 nearbyObjectUpdated:v20];
    }
    uint64_t v24 = self->_protobufLogger.__ptr_;
    if (v24)
    {
      [v20 timestamp];
      double v26 = v25;
      sub_100290760(v20, (uint64_t)__p);
      int v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      double v36 = &v33;
      char v37 = 0;
      int v33 = (char *)operator new(0xA0uLL);
      uint64_t v34 = (uint64_t)v33;
      uint64_t v35 = v33 + 160;
      uint64_t v34 = sub_100321364((uint64_t)&v35, (uint64_t)__p, (uint64_t)&v39, (uint64_t)v33);
      sub_10029BB5C((uint64_t)v24, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)&v33, v26);
      double v36 = &v33;
      sub_1003214E4((void ***)&v36);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }

LABEL_27:
    int64_t var0 = self->_uniqueIdentifier.var0;
    if (var0)
    {
      if ((*(unsigned int (**)(int64_t))(*(void *)var0 + 56))(var0))
      {
        (*(void (**)(int64_t, long long *))(*(void *)self->_uniqueIdentifier.var0 + 48))(self->_uniqueIdentifier.var0, &v44);
        if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 64))(self->_uniqueIdentifier.var0)) {
          [(NINearbyUpdatesEngine *)self provideFindingSolution:0];
        }
      }
    }
    goto LABEL_35;
  }
  unsigned int v28 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    if (!LOBYTE(__src[24])) {
      sub_10000AE44();
    }
    sub_100430060(&__src[1], (uint8_t *)__p, v28);
  }

LABEL_35:
}

- (void)processUWBResultForSyntheticAperture:(id)a3 roseSolution:(const void *)a4
{
  id v7 = a3;
  if (!*(void *)&self->_uniqueIdentifier.__r_.var0) {
    __assert_rtn("-[NINearbyUpdatesEngine processUWBResultForSyntheticAperture:roseSolution:]", "NIServerNearbyUpdatesEngine.mm", 2620, "_syntheticApertureFilter != nullptr");
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if (*((unsigned char *)a4 + 24))
  {
    unsigned int v9 = *((_DWORD *)a4 + 8);
    BOOL v10 = v9 > 5;
    int v11 = (1 << v9) & 0x25;
    if (v10 || v11 == 0)
    {
      if (*((unsigned char *)a4 + 752))
      {
        sub_10040AD00(__src);
        uint64_t v21 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          if (!*((unsigned char *)a4 + 600) || !*((unsigned char *)a4 + 24)) {
            sub_10000AE44();
          }
          uint64_t v51 = *((void *)a4 + 44);
          uint64_t v52 = *((void *)a4 + 2);
          p_uniqueIdentifier = &self->_uniqueIdentifier;
          if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
            p_uniqueIdentifier = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_uniqueIdentifier->__r_.__value_.var0.var1.__data_;
          }
          *(_DWORD *)char v67 = 134219010;
          *(void *)&v67[4] = v51;
          *(_WORD *)&v67[12] = 2048;
          *(void *)&v67[14] = v52;
          *(_WORD *)&v67[22] = 2048;
          *(void *)&v67[24] = __src[7];
          *(_WORD *)char v68 = 2048;
          *(void *)&v68[2] = __src[6];
          *(_WORD *)&v68[10] = 2080;
          *(void *)&v68[12] = p_uniqueIdentifier;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#nrby-eng,#sa_algo,New measurement with distance %4.3f m, timestamp %f, az %4.1f deg, and el %4.1f deg. Unique identifier: %s", v67, 0x34u);
        }

        float v22 = sub_100030414(*(double *)&__src[7]);
        float v4 = sub_100030414(*(double *)&__src[6]);
        sub_10003E96C((uint64_t)&__src[2], (void *)__src[3]);
        uint64_t v23 = 0x100000001;
      }
      else
      {
        uint64_t v24 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          if (!*((unsigned char *)a4 + 600) || !*((unsigned char *)a4 + 24)) {
            sub_10000AE44();
          }
          uint64_t v54 = *((void *)a4 + 44);
          uint64_t v55 = *((void *)a4 + 2);
          data = &self->_uniqueIdentifier;
          if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
            data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
          }
          LODWORD(__src[0]) = 134218498;
          *(uint64_t *)((char *)__src + 4) = v54;
          WORD2(__src[1]) = 2048;
          *(uint64_t *)((char *)&__src[1] + 6) = v55;
          HIWORD(__src[2]) = 2080;
          __src[3] = (uint64_t)data;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "#nrby-eng,#sa_algo,New measurement with distance %4.3f m, timestamp %f, no az or el. Unique identifier: %s", (uint8_t *)__src, 0x20u);
        }

        uint64_t v23 = 0;
        float v22 = 0.0;
      }
      double v25 = [v7 discoveryToken];
      id v26 = [v25 hash];
      if (!*((unsigned char *)a4 + 24) || !*((unsigned char *)a4 + 600)) {
        sub_10000AE44();
      }
      uint64_t v27 = *((void *)a4 + 2);
      float v28 = *((double *)a4 + 44);
      __int16 v29 = *((_WORD *)a4 + 257);
      __int16 v30 = *((_WORD *)a4 + 280);
      *(void *)char v67 = v26;
      *(void *)&v67[8] = v27;
      *(float *)&v67[16] = v28;
      *(_DWORD *)&v67[20] = 1;
      *(void *)&v67[24] = LODWORD(v22) | ((unint64_t)LODWORD(v4) << 32);
      *(void *)char v68 = v23;
      v68[16] = 0;
      v68[20] = 0;
      v68[24] = 0;
      v68[28] = 0;
      BYTE8(v71) = 0;
      long long v69 = 0uLL;
      LOWORD(v70[0]) = 0;
      *(_OWORD *)((char *)&v70[2] + 1) = 0u;
      *(_OWORD *)((char *)&v70[1] + 8) = 0u;
      *(_OWORD *)((char *)v70 + 8) = 0u;
      LODWORD(v73) = 0;
      long long v72 = 0uLL;
      WORD2(v73) = v29;
      HIWORD(v73) = v30;

      uint64_t ptr = self->_protobufLogger.__ptr_;
      if (ptr) {
        sub_1002A358C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (float32x2_t *)v67);
      }
      sub_10033D9C8(*(void *)&self->_uniqueIdentifier.__r_.var0, (uint64_t)v67);
      dataSource = self->_dataSource;
      if (dataSource)
      {
        v58[9] = v71;
        v58[10] = v72;
        v58[4] = v69;
        v58[5] = v70[0];
        v58[6] = v70[1];
        uint64_t v59 = v73;
        v58[7] = v70[2];
        v58[8] = v70[3];
        v58[0] = *(_OWORD *)v67;
        v58[1] = *(_OWORD *)&v67[16];
        v58[2] = *(_OWORD *)v68;
        v58[3] = *(_OWORD *)&v68[16];
        [(NINearbyUpdatesEngineDataSource *)dataSource updateWithRangeResult:v58];
      }
      sub_10033DE98(*(void *)&self->_uniqueIdentifier.__r_.var0, (uint64_t)__src);
      int v33 = self->_dataSource;
      if (v33)
      {
        memcpy(__dst, __src, sizeof(__dst));
        [(NINearbyUpdatesEngineDataSource *)v33 updateWithSASolution:__dst];
      }
      uint64_t v34 = [(NINearbyUpdatesEngine *)self niConvergenceStateFromSolution:__src];
      value = self->_syntheticApertureFilter.__ptr_.__value_;
      double v36 = [v7 discoveryToken];
      char v37 = [(SyntheticApertureFilter *)value objectForKeyedSubscript:v36];

      if (([v37 isEqual:v34] & 1) == 0)
      {
        int v38 = self->_syntheticApertureFilter.__ptr_.__value_;
        uint64_t v39 = [v7 discoveryToken];
        [(SyntheticApertureFilter *)v38 setObject:v34 forKeyedSubscript:v39];

        uint64_t v40 = [NINearbyObject alloc];
        char v41 = [v7 discoveryToken];
        char v42 = [(NINearbyObject *)v40 initWithToken:v41];

        if (objc_opt_respondsToSelector()) {
          [WeakRetained updatesEngine:self didUpdateAlgorithmConvergenceState:v34 forObject:v42];
        }
        char v43 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__rep buf = 138412802;
          *(void *)&uint8_t buf[4] = v42;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v34;
          __int16 v62 = 2112;
          float v63 = v37;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#sa_algo,Updated convergence state for object: %@. New state: %@. Previous state: %@", buf, 0x20u);
        }
      }
      if (LOBYTE(__src[24]))
      {
        long long v44 = [(NINearbyUpdatesEngine *)self nearbyObjectFromSolution:__src];
        if (v44)
        {
          if (objc_opt_respondsToSelector())
          {
            double v64 = v44;
            long long v45 = +[NSArray arrayWithObjects:&v64 count:1];
            [WeakRetained updatesEngine:self didUpdateNearbyObjects:v45];
          }
          long long v46 = self->_dataSource;
          if (v46) {
            [(NINearbyUpdatesEngineDataSource *)v46 nearbyObjectUpdated:v44];
          }
          long long v47 = self->_protobufLogger.__ptr_;
          if (v47)
          {
            [v44 timestamp];
            double v49 = v48;
            sub_100290760(v44, (uint64_t)buf);
            sub_100317874(v57, (uint64_t)buf, 1uLL);
            sub_10029BB5C((uint64_t)v47, (const std::string *)&self->_uniqueIdentifier, v57, v49);
            __int16 v60 = (void **)v57;
            sub_1003214E4(&v60);
            if (*(void *)buf)
            {
              *(void *)&uint8_t buf[8] = *(void *)buf;
              operator delete(*(void **)buf);
            }
          }
        }
        else
        {
          long long v50 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            if (!LOBYTE(__src[24])) {
              sub_10000AE44();
            }
            sub_100430060(&__src[1], buf, v50);
          }
        }
      }
    }
    else
    {
      double v13 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        if (!*((unsigned char *)a4 + 24)) {
          sub_10000AE44();
        }
        sub_100430128((uint64_t *)a4 + 2, (uint64_t)self, (uint8_t *)__src, v13);
      }
    }
  }
  else
  {
    uint64_t v14 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004300AC((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)acceptPeerDeviceType:(BOOL)a3
{
  dataSource = self->_dataSource;
  if (dataSource) {
    [(NINearbyUpdatesEngineDataSource *)dataSource updateWithPeerDeviceType:a3];
  }
}

- (void)acceptDeviceMotionInput:(const void *)a3
{
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A021C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 80))(var0, a2))
    {
      sub_1001F2E48();
      (*(void (**)(int64_t, const void *))(*(void *)self->_uniqueIdentifier.var0 + 72))(self->_uniqueIdentifier.var0, a3);
      sub_1001F2E48();
      if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 88))(self->_uniqueIdentifier.var0))
      {
        [(NINearbyUpdatesEngine *)self provideFindingSolution:0];
      }
    }
  }
}

- (void)acceptAltimeterData:(const AltimeterInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A06E0((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 104))(var0, a2))
  {
    sub_1001F2E48();
    (*(void (**)(int64_t, const AltimeterInput *))(*(void *)self->_uniqueIdentifier.var0 + 96))(self->_uniqueIdentifier.var0, a3);
    sub_1001F2E48();
  }
}

- (void)acceptGnssSatelliteData:(const void *)a3
{
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_100430194();
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A08F0((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t))(*(void *)var0 + 192))(var0))
  {
    (*(void (**)(int64_t, const void *))(*(void *)self->_uniqueIdentifier.var0 + 184))(self->_uniqueIdentifier.var0, a3);
    if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 200))(self->_uniqueIdentifier.var0)) {
      [(NINearbyUpdatesEngine *)self provideFindingSolution:0];
    }
  }
}

- (void)acceptSelfLocationData:(const LocationInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A1108((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3, 0);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 144))(var0, a2))
  {
    (*(void (**)(int64_t, const LocationInput *, void))(*(void *)self->_uniqueIdentifier.var0
                                                                          + 136))(self->_uniqueIdentifier.var0, a3, 0);
    if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 152))(self->_uniqueIdentifier.var0)) {
      [(NINearbyUpdatesEngine *)self provideFindingSolution:0];
    }
    dataSource = self->_dataSource;
    if (dataSource)
    {
      [(NINearbyUpdatesEngineDataSource *)dataSource updateWithSelfLocation:a3];
    }
  }
}

- (void)acceptHeadingData:(const HeadingInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A1770((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 168))(var0, a2))
    {
      (*(void (**)(int64_t, const HeadingInput *))(*(void *)self->_uniqueIdentifier.var0 + 160))(self->_uniqueIdentifier.var0, a3);
      if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 176))(self->_uniqueIdentifier.var0))
      {
        [(NINearbyUpdatesEngine *)self provideFindingSolution:0];
      }
    }
  }
}

- (void)acceptDiscoveryEventForPeer:(id)a3
{
  id v8 = a3;
  if (self->_uniqueIdentifier.var0)
  {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
    [(NINearbyUpdatesEngine *)self setFindingPeerToken:v8];
  }
  double v4 = sub_100006C38();
  double v5 = v4;
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A1C40((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v4);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t))(*(void *)var0 + 120))(var0))
    {
      (*(void (**)(int64_t, double))(*(void *)self->_uniqueIdentifier.var0 + 112))(self->_uniqueIdentifier.var0, v5);
      if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 128))(self->_uniqueIdentifier.var0)) {
        [(NINearbyUpdatesEngine *)self provideFindingSolution:0];
      }
    }
  }
}

- (void)acceptPeerLocationData:(const LocationInput *)a3 forPeer:(id)a4
{
  id v9 = a4;
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A1108((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3, 1);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t))(*(void *)var0 + 144))(var0))
  {
    (*(void (**)(int64_t, const LocationInput *, uint64_t))(*(void *)self->_uniqueIdentifier.var0
                                                                           + 136))(self->_uniqueIdentifier.var0, a3, 1);
    if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 152))(self->_uniqueIdentifier.var0)) {
      [(NINearbyUpdatesEngine *)self provideFindingSolution:0];
    }
    dataSource = self->_dataSource;
    if (dataSource) {
      [(NINearbyUpdatesEngineDataSource *)dataSource updateWithPeerLocationFromFMF];
    }
  }
}

- (void)acceptPedometerData:(const PedometerDataInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A0CB0((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 232))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_1004301C8();
    }
    (*(void (**)(int64_t, const PedometerDataInput *))(*(void *)self->_uniqueIdentifier.var0 + 224))(self->_uniqueIdentifier.var0, a3);
  }
}

- (void)acceptPedometerEvent:(const PedometerEventInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A0EF8((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 248))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_1004301FC();
    }
    (*(void (**)(int64_t, const PedometerEventInput *))(*(void *)self->_uniqueIdentifier.var0 + 240))(self->_uniqueIdentifier.var0, a3);
  }
}

- (void)acceptMotionActivity:(const MotionActivityInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A1980((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 216))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_100430230();
    }
    (*(void (**)(int64_t, const MotionActivityInput *))(*(void *)self->_uniqueIdentifier.var0 + 208))(self->_uniqueIdentifier.var0, a3);
  }
}

- (void)acceptPeerData:(const void *)a3 fromPeer:(id)a4
{
  id v6 = a4;
  id v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nrby-eng,acceptPeerData:FromPeer:", (uint8_t *)v11, 2u);
  }
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  sub_100289414((uint64_t)a3, (uint64_t)v11);
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_1002A1E4C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v11);
  }
  dataSource = self->_dataSource;
  if (dataSource) {
    [(NINearbyUpdatesEngineDataSource *)dataSource updateWithFinderPeerData:v11];
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t))(*(void *)var0 + 280))(var0))
    {
      [(NINearbyUpdatesEngine *)self setFindingPeerToken:v6];
      sub_1001F2E48();
      (*(void (**)(int64_t, uint64_t *))(*(void *)self->_uniqueIdentifier.var0 + 272))(self->_uniqueIdentifier.var0, v11);
      sub_1001F2E48();
      if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 288))(self->_uniqueIdentifier.var0)) {
        [(NINearbyUpdatesEngine *)self provideFindingSolution:0];
      }
    }
  }
}

- (void)acceptDevicePDRInput:(const void *)a3
{
  if (self->_uniqueIdentifier.var0) {
    [(NINearbyUpdatesEngine *)self _sendTimeTupleToAlgorithms];
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    long long v6 = *((_OWORD *)a3 + 7);
    v29[6] = *((_OWORD *)a3 + 6);
    v29[7] = v6;
    long long v7 = *((_OWORD *)a3 + 9);
    v29[8] = *((_OWORD *)a3 + 8);
    v29[9] = v7;
    long long v8 = *((_OWORD *)a3 + 3);
    v29[2] = *((_OWORD *)a3 + 2);
    v29[3] = v8;
    long long v9 = *((_OWORD *)a3 + 5);
    v29[4] = *((_OWORD *)a3 + 4);
    v29[5] = v9;
    long long v10 = *((_OWORD *)a3 + 1);
    v29[0] = *(_OWORD *)a3;
    v29[1] = v10;
    sub_1002A239C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)v29);
  }
  dataSource = self->_dataSource;
  if (dataSource) {
    [(NINearbyUpdatesEngineDataSource *)dataSource updateWithPDR:a3];
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 264))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_100430264();
    }
    if (LOBYTE(self->_cachedMagneticFieldStrength.var0.__val_.value))
    {
      long long v15 = *((_OWORD *)a3 + 7);
      long long v25 = *((_OWORD *)a3 + 6);
      long long v26 = v15;
      long long v16 = *((_OWORD *)a3 + 9);
      long long v27 = *((_OWORD *)a3 + 8);
      long long v28 = v16;
      long long v17 = *((_OWORD *)a3 + 3);
      long long v21 = *((_OWORD *)a3 + 2);
      long long v22 = v17;
      long long v18 = *((_OWORD *)a3 + 5);
      long long v23 = *((_OWORD *)a3 + 4);
      long long v24 = v18;
      long long v19 = *((_OWORD *)a3 + 1);
      v20[0] = *(_OWORD *)a3;
      v20[1] = v19;
      if ((_BYTE)v21) {
        LOBYTE(v21) = 0;
      }
      if ((_BYTE)v22) {
        LOBYTE(v22) = 0;
      }
      if ((_BYTE)v23) {
        LOBYTE(v23) = 0;
      }
      (*(void (**)(int64_t, _OWORD *, uint64_t, uint64_t))(*(void *)self->_uniqueIdentifier.var0
                                                                         + 256))(self->_uniqueIdentifier.var0, v20, v13, v14);
    }
    else
    {
      (*(void (**)(int64_t, const void *, uint64_t, uint64_t))(*(void *)self->_uniqueIdentifier.var0
                                                                             + 256))(self->_uniqueIdentifier.var0, a3, v13, v14);
    }
  }
}

- (void)acceptWatchOrientation:(const WatchOrientationInput *)a3
{
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0) {
    (*(void (**)(int64_t, const WatchOrientationInput *))(*(void *)var0 + 320))(var0, a3);
  }
}

- (void)setFindingPeerToken:(id)a3
{
  id v4 = a3;
  findingPeerToken = self->_findingPeerToken;
  p_findingPeerToken = (uint64_t *)&self->_findingPeerToken;
  double v5 = findingPeerToken;
  if (findingPeerToken)
  {
    if (![(NIDiscoveryToken *)v5 isEqual:v4])
    {
      long long v8 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_100430298(p_findingPeerToken, (uint64_t)v4, v8);
      }
    }
  }
  long long v9 = (void *)*p_findingPeerToken;
  uint64_t *p_findingPeerToken = (uint64_t)v4;
}

- (AoARad)_convertFromPointingCoordinatesToSpatial:(const void *)a3
{
  float v4 = sub_100030414(*((double *)a3 + 7));
  float v5 = sub_100030414(*((double *)a3 + 6));
  float v6 = cosf(v4);
  __float2 v7 = __sincosf_stret(v5);
  float v8 = atan2f(v6 * v7.__cosval, -(float)(v6 * v7.__sinval));
  float v9 = v4;
  result.BOOL var1 = v8;
  result.int64_t var0 = v9;
  return result;
}

- (id)nearbyObjectFromSolution:(const void *)a3 forPeer:(id)a4
{
  float v6 = [(NINearbyUpdatesEngine *)self nearbyObjectFromToken:a4];
  if (v6)
  {
    if (*((unsigned char *)a3 + 192)) {
      [(NINearbyUpdatesEngine *)self fillNearbyObject:v6 fromRangeResult:(char *)a3 + 8];
    }
    [(NINearbyUpdatesEngine *)self fillNearbyObject:v6 fromSolution:a3];
    id v7 = v6;
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100430324();
  }

  return v6;
}

- (id)nearbyObjectFromToken:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  float v6 = WeakRetained;
  if (!WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100430358();
    }
    goto LABEL_9;
  }
  id v7 = [WeakRetained identifierFromDiscoveryToken:v4];
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10043038C();
    }
LABEL_9:
    long long v10 = 0;
    goto LABEL_13;
  }
  float v9 = [v6 objectFromIdentifier:v7];
  long long v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_1004303F4();
  }

LABEL_13:

  return v10;
}

- (id)nearbyObjectFromDeviceIdentifier:(unint64_t)a3
{
  unint64_t v11 = a3;
  id v4 = sub_100056B3C(&self->_hashToTokenMap.__table_.__bucket_list_.__ptr_.__value_, &v11);
  if (v4)
  {
    id v5 = (id)v4[3];
    float v6 = [(NINearbyUpdatesEngine *)self nearbyObjectFromToken:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10043045C();
    }
  }
  else
  {
    float v9 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__rep buf = 134217984;
      unint64_t v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#nrby-eng,nearbyObjectFromDeviceIdentifier - failed to find token mapped to hash: %llu", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)nearbyObjectFromRangeResult:(const void *)a3
{
  id v5 = [(NINearbyUpdatesEngine *)self nearbyObjectFromDeviceIdentifier:*(void *)a3];
  if (v5) {
    goto LABEL_5;
  }
  float v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#nrby-eng,attempting to get NIObject from session's database", v10, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  uint64_t v8 = [WeakRetained objectFromIdentifier:*(void *)a3];

  id v5 = (void *)v8;
  if (v8) {
LABEL_5:
  }
    [(NINearbyUpdatesEngine *)self fillNearbyObject:v5 fromRangeResult:a3];

  return v5;
}

- (id)niConvergenceStateFromSolution:(const void *)a3
{
  if (*(_DWORD *)a3 == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = *(_DWORD *)a3 == 0;
  }
  id v5 = [[NIAlgorithmConvergenceState alloc] initWithConvergenceStatus:v4];
  [(NIAlgorithmConvergenceState *)v5 setInsufficientMovement:*((unsigned __int8 *)a3 + 4)];
  [(NIAlgorithmConvergenceState *)v5 setInsufficientHorizontalSweep:*((unsigned __int8 *)a3 + 5)];
  [(NIAlgorithmConvergenceState *)v5 setInsufficientVerticalSweep:*((unsigned __int8 *)a3 + 6)];
  [(NIAlgorithmConvergenceState *)v5 setInsufficientLighting:*((unsigned __int8 *)a3 + 7)];

  return v5;
}

- (void)fillNearbyObject:(id)a3 fromRangeResult:(const void *)a4
{
  id v5 = a3;
  LODWORD(v6) = *((_DWORD *)a4 + 4);
  [v5 setDistance:v6];
  int v7 = *((_DWORD *)a4 + 5) - 1;
  if (v7 < 5) {
    [v5 setDistanceMeasurementQuality:qword_1004C0F68[v7]];
  }
  if (*((unsigned char *)a4 + 36))
  {
    uint64_t v8 = *((void *)a4 + 3);
    [v5 setDirection:sub_10003F778((float *)&v8)];
  }
}

- (void)fillNearbyObject:(id)a3 fromSolution:(const void *)a4
{
  id v9 = a3;
  if (*((unsigned char *)a4 + 208))
  {
    double v5 = *((double *)a4 + 25) * 0.0174532925;
    *(float *)&double v5 = v5;
    [v9 setHorizontalAngle:v5];
  }
  if (*((unsigned char *)a4 + 328))
  {
    double v6 = *((double *)a4 + 40) * 0.0174532925;
    *(float *)&double v6 = v6;
    [v9 setHorizontalAngleAccuracy:v6];
  }
  if (*((_DWORD *)a4 + 58) <= 4u) {
    [v9 setVerticalDirectionEstimate:];
  }
  if (*((unsigned char *)a4 + 272)) {
    [v9 setDirection:*((double *)a4 + 32)];
  }
  if (*((unsigned char *)a4 + 304)) {
    [v9 setWorldPosition:*((double *)a4 + 36)];
  }
  if (*((unsigned char *)a4 + 368))
  {
    uint64_t v7 = *((unsigned int *)a4 + 91);
    if (v7 <= 7) {
      [v9 setAlgorithmSource:v7 + 1];
    }
  }
  if (!*((unsigned char *)a4 + 376))
  {
    uint64_t v8 = 0;
    goto LABEL_18;
  }
  uint64_t v8 = *((unsigned int *)a4 + 93);
  if (v8 <= 2) {
LABEL_18:
  }
    [v9 setMotionState:v8];
  if (*((unsigned char *)a4 + 380)) {
    [v9 setResetARSession:1];
  }
  if (*((unsigned char *)a4 + 381)) {
    [v9 setRevokeFindingExperience:1];
  }
}

- (id)nearbyObjectFromSolution:(const void *)a3
{
  if (*((unsigned char *)a3 + 192))
  {
    double v5 = (uint64_t *)((char *)a3 + 8);
    double v6 = [(NINearbyUpdatesEngine *)self nearbyObjectFromRangeResult:(char *)a3 + 8];
    if (v6)
    {
      [(NINearbyUpdatesEngine *)self fillNearbyObject:v6 fromSolution:a3];
      id v7 = v6;
    }
    else
    {
      uint64_t v8 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        if (!*((unsigned char *)a3 + 192)) {
          sub_10000AE44();
        }
        uint64_t v9 = *v5;
        int v11 = 134217984;
        uint64_t v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#nrby-eng,no object for identifier 0x%llx", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)logSolution:(const void *)a3
{
  sub_1002363E4((uint64_t)v14);
  sub_100056628(v14, (uint64_t)"#solutionDebug: ", 16);
  sub_100056628(v14, (uint64_t)"Range ", 6);
  if (!*((unsigned char *)a3 + 192) || *((float *)a3 + 6) == 1.1755e-38)
  {
    sub_100056628(v14, (uint64_t)"-, ", 3);
  }
  else
  {
    uint64_t v4 = v14[0];
    *(_DWORD *)((char *)&v14[1] + *(void *)(v14[0] - 24)) = *(_DWORD *)((unsigned char *)&v14[1] + *(void *)(v14[0] - 24)) & 0xFFFFFEFB | 4;
    *(void *)((char *)&v14[2] + *(void *)(v4 - 24)) = 2;
    double v5 = (void *)std::ostream::operator<<();
    sub_100056628(v5, (uint64_t)" m, ", 4);
  }
  sub_100056628(v14, (uint64_t)"Horizontal angle ", 17);
  if (*((unsigned char *)a3 + 208))
  {
    uint64_t v6 = v14[0];
    *(_DWORD *)((char *)&v14[1] + *(void *)(v14[0] - 24)) = *(_DWORD *)((unsigned char *)&v14[1] + *(void *)(v14[0] - 24)) & 0xFFFFFEFB | 4;
    *(void *)((char *)&v14[2] + *(void *)(v6 - 24)) = 2;
    id v7 = (void *)std::ostream::operator<<();
    sub_100056628(v7, (uint64_t)" deg, ", 6);
  }
  else
  {
    sub_100056628(v14, (uint64_t)"-, ", 3);
  }
  sub_100056628(v14, (uint64_t)"Horizontal angle unc ", 21);
  if (*((unsigned char *)a3 + 328))
  {
    uint64_t v8 = v14[0];
    *(_DWORD *)((char *)&v14[1] + *(void *)(v14[0] - 24)) = *(_DWORD *)((unsigned char *)&v14[1] + *(void *)(v14[0] - 24)) & 0xFFFFFEFB | 4;
    *(void *)((char *)&v14[2] + *(void *)(v8 - 24)) = 2;
    uint64_t v9 = (void *)std::ostream::operator<<();
    sub_100056628(v9, (uint64_t)" deg, ", 6);
  }
  else
  {
    sub_100056628(v14, (uint64_t)"-, ", 3);
  }
  sub_100056628(v14, (uint64_t)"Vertical state ", 15);
  uint64_t v10 = *((int *)a3 + 58);
  if (v10 <= 4) {
    sub_100056628(v14, (uint64_t)(&off_100861520)[v10], qword_1004C0F90[v10]);
  }
  sub_100056628(v14, (uint64_t)", Algorithm source ", 19);
  if (*((unsigned char *)a3 + 368))
  {
    uint64_t v11 = *((int *)a3 + 91);
    if (v11 <= 7) {
      sub_100056628(v14, (uint64_t)(&off_100861548)[v11], qword_1004C0FB8[v11]);
    }
  }
  uint64_t v12 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    std::stringbuf::str();
    sub_1004304C4(v13, buf, v12);
  }

  if (v15 < 0) {
    operator delete((void *)v14[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
}

- (void)getPeerDataFromFindingContainerWithToken:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_uniqueIdentifier.var0)
  {
    [v4 hash];
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_100430538();
    }
    (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_uniqueIdentifier.var0 + 8))(v10);
    sub_100288FEC((uint64_t)v10, (uint64_t)v9);
    uint64_t ptr = self->_protobufLogger.__ptr_;
    if (ptr) {
      sub_1002A1E4C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v10);
    }
    dataSource = self->_dataSource;
    if (dataSource) {
      [(NINearbyUpdatesEngineDataSource *)dataSource updateWithFindeePeerData:v10];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained updatesEngine:self didUpdateFindeeData:v9 forToken:v5];
    }
  }
}

- (void)probeRegions
{
  for (unint64_t i = self->_regionMonitorMap.__table_.__p1_.__value_.__next_; i; unint64_t i = (void *)*i)
  {
    uint64_t v3 = i[3];
    double v4 = sub_100006C38();
    sub_10039046C(v3, v4);
  }
}

- (set<NIRegionSizeCategory,)_getRegionSizeCategoriesFromRegions:(std:(NINearbyUpdatesEngine *)self :(SEL)a3 allocator<NIRegionSizeCategory>> *__return_ptr)retstr
{
  id v5 = a4;
  retstr->var0.var2.int64_t var0 = 0;
  retstr->var0.var1.var0.__left_ = 0;
  retstr->var0.int64_t var0 = &retstr->var0.var1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) regionSizeCategory];
        sub_100321FC0((uint64_t **)retstr, (uint64_t *)&v11, (uint64_t *)&v11);
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return result;
}

- (NIConfiguration)configuration
{
  return *(NIConfiguration **)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
}

- (NINearbyUpdatesEngineDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);

  return (NINearbyUpdatesEngineDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NINearbyUpdatesEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);

  return (NINearbyUpdatesEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NIServerAnalyticsManager)analyticsManager
{
  return (NIServerAnalyticsManager *)self->_dataSource;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_configuration);
  objc_destroyWeak((id *)&self->_previousNIObjectUpdate);
  objc_storeStrong((id *)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds, 0);
  objc_storeStrong((id *)&self->_findingLatencyBookkeeping.lastProcessTimeSeconds, 0);
  objc_storeStrong((id *)&self->_findingAlgorithmContainer.__ptr_.__value_, 0);
  objc_storeStrong((id *)&self->_syntheticApertureFilter.__ptr_.__value_, 0);
  int64_t var0 = self->_uniqueIdentifier.var0;
  self->_uniqueIdentifier.int64_t var0 = 0;
  if (var0) {
    (*(void (**)(int64_t))(*(void *)var0 + 368))(var0);
  }
  uint64_t v4 = *(void *)&self->_uniqueIdentifier.__r_.var0;
  *(void *)&self->_uniqueIdentifier.__r_.int64_t var0 = 0;
  if (v4) {
    sub_100320D40((uint64_t)&self->_uniqueIdentifier.__r_.var0, v4);
  }
  if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_uniqueIdentifier.__r_.__value_.var0.var1.__data_);
  }
  cntrl = (std::__shared_weak_count *)self->_protobufLogger.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
  objc_storeStrong((id *)&self->_findingPeerToken, 0);
  sub_1001A6A10((uint64_t)&self->_hashToTokenMap);
  objc_storeStrong((id *)&self->_regionDict, 0);
  sub_10032207C((uint64_t)&self->_regionMonitorMap);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  *((unsigned char *)self + 200) = 0;
  *((unsigned char *)self + 216) = 0;
  *((unsigned char *)self + 232) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 30) = 0;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((void *)self + 21) = 0;
  return self;
}

@end