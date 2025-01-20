@interface SASInterfaceTouch
- ($3FFB85F807698FB051441EDCD924163A)phone_telemetry;
- ($F2544535907296EB357DA0304DEA202B)cover_gesture;
- (BOOL)handleInputStream:(id)a3;
- (BOOL)injectProperty:(id)a3;
- (BOOL)injectProperty:(id)a3 value:(id)a4;
- (BOOL)isContactReclassificationNeeded;
- (BOOL)touch_system_ready;
- (NSData)emptyPaths;
- (NSMutableArray)versions;
- (NSMutableData)inputBuffer;
- (NSMutableData)outputBuffer;
- (NSMutableDictionary)propertyDatabase;
- (SASInterfaceTouch)initWithStreamSize:(unint64_t)a3 platformId:(unint64_t)a4 streamCallback:(id)a5;
- (SASInterfaceTouch)initWithStreamSize:(unint64_t)a3 streamCallback:(id)a4;
- (const)duration_between_touches;
- (const)event_info;
- (const)fingers;
- (const)hand;
- (const)interpolated_event_info;
- (const)interpolated_fingers;
- (const)interpolated_hand;
- (const)path_stats;
- (const)tap;
- (id)coreAnalyticsCallback;
- (id)eventCallback;
- (id)generateCoverGesture:(unint64_t)a3 state:(unsigned __int8)a4 surfaceCovered:(float)a5;
- (id)generateEventInfo:(id *)a3 interpolated:(BOOL)a4 timestamp:(unint64_t)a5;
- (id)generateFingerEvent:(id *)a3 interpolated:(BOOL)a4 now:(unint64_t)a5;
- (id)generateHandEvent:(id *)a3 interpolated:(BOOL)a4 now:(unint64_t)a5;
- (id)generateSwipeUp:(unint64_t)a3;
- (id)generateTapEvent:(id *)a3 transducerType:(unsigned int)a4 now:(unint64_t)a5;
- (id)generateTouchSystemReady:(unint64_t)a3;
- (id)generateWakeEvent:(int)a3 timestamp:(unint64_t)a4;
- (id)resetRequestCallback;
- (id)streamCallback;
- (int64_t)getValidTimestamp:(unint64_t)a3 now:(unint64_t)a4;
- (int64_t)timestamp_offset;
- (uint64_t)configureCallbacks;
- (unint64_t)cont_abs_diff;
- (unint64_t)last_frame_time_us;
- (unint64_t)prev_frame_diff_us;
- (unint64_t)timestampMachToUs:(unint64_t)a3;
- (unint64_t)timestampUsToAbsoluteMach:(unint64_t)a3;
- (unsigned)atomic_wake_event;
- (unsigned)cover_gesture_state;
- (unsigned)planId;
- (unsigned)wake_event_detected;
- (void)addVersion:(id)a3;
- (void)callCoreAnalyticsCallback;
- (void)callEventCallback;
- (void)callResetRequestCallback:(unsigned __int16)a3 arg_ptr:(const void *)a4;
- (void)callStreamCallback:(unint64_t)a3;
- (void)cleanNodes;
- (void)configureCallbacks;
- (void)configureTranslation;
- (void)defaultStreamingConfiguration;
- (void)device;
- (void)initContactReclassificationParams;
- (void)initProperties;
- (void)isContactReclassificationNeeded;
- (void)setAtomic_wake_event:(unsigned __int8)a3;
- (void)setCont_abs_diff:(unint64_t)a3;
- (void)setCoreAnalyticsCallback:(id)a3;
- (void)setCover_gesture:(id)a3;
- (void)setCover_gesture_state:(unsigned __int8)a3;
- (void)setDevice:(void *)a3;
- (void)setDuration_between_touches:(const float *)a3;
- (void)setEmptyPaths:(id)a3;
- (void)setEventCallback:(id)a3;
- (void)setEvent_info:(id *)a3;
- (void)setFingers:(id *)a3;
- (void)setHand:(id *)a3;
- (void)setInputBuffer:(id)a3;
- (void)setInterpolated_event_info:(id *)a3;
- (void)setInterpolated_fingers:(id *)a3;
- (void)setInterpolated_hand:(id *)a3;
- (void)setLast_frame_time_us:(unint64_t)a3;
- (void)setOutputBuffer:(id)a3;
- (void)setPath_stats:(id *)a3;
- (void)setPhone_telemetry:(id)a3;
- (void)setPlanId:(unsigned __int8)a3;
- (void)setPrev_frame_diff_us:(unint64_t)a3;
- (void)setPropertyDatabase:(id)a3;
- (void)setResetRequestCallback:(id)a3;
- (void)setStreamCallback:(id)a3;
- (void)setTap:(id *)a3;
- (void)setTimestamp_offset:(int64_t)a3;
- (void)setTouch_system_ready:(BOOL)a3;
- (void)setVersions:(id)a3;
- (void)setWake_event_detected:(unsigned __int8)a3;
@end

@implementation SASInterfaceTouch

- (BOOL)handleInputStream:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v33 = 0;
  unint64_t v34 = 0;
  unsigned __int16 v32 = 0;
  if ([v4 length])
  {
    id v5 = v4;
    uint64_t v6 = [v5 bytes];
    unint64_t v7 = [v5 length] - 1;
    if (v7 >= 2 && *(unsigned char *)(v6 + 1) == 1 && *(unsigned char *)(v6 + 2) == 1 && !self->_planId)
    {
      if (self->_cover_gesture_state == 1)
      {
        v21 = objc_opt_new();
        v22 = [(SASInterfaceTouch *)self generateCoverGesture:mach_absolute_time() state:3 surfaceCovered:0.0];
        [v21 addObject:v22];
        (*((void (**)(void))self->_eventCallback + 2))();
      }
      memset(v31, 0, sizeof(v31));
      long long v29 = xmmword_25BF26080;
      LODWORD(v29) = 0x2000;
      v30 = v31;
      AlgDataPacket::AlgDataPacket((uint64_t)v28, 0xAF83667BDA1FDB60, 0x310DDDD485, 12288, 1, 1, (uint64_t)[(NSData *)self->_emptyPaths bytes], [(NSData *)self->_emptyPaths length], 0, 0);
      PacketCollection::PacketCollection((uint64_t)v27, 1, 1);
      v27[0] = &unk_27096BEE0;
      AlgDataInjector::add((AlgDataInjector *)v27, (const AlgDataPacket *)v28);
      unint64_t v34 = [(NSMutableData *)self->_outputBuffer length] - 1;
      char v8 = (*(uint64_t (**)(void *, long long *, void *, void *, unint64_t *))(*(void *)self->_device
                                                                                               + 24))(self->_device, &v29, v27, [(NSMutableData *)self->_outputBuffer mutableBytes] + 1, &v34);
      [(SASInterfaceTouch *)self callStreamCallback:v34];
      [(SASInterfaceTouch *)self callEventCallback];
      [(SASInterfaceTouch *)self callCoreAnalyticsCallback];
      PacketCollection::~PacketCollection((PacketCollection *)v27);
      AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v28);
    }
    else
    {
      char v8 = 1;
    }
    v28[0] = 0;
    unint64_t v34 = [(NSMutableData *)self->_outputBuffer length] - 1;
    v9 = [(NSMutableData *)self->_outputBuffer mutableBytes];
    device = (AlgsDevice *)self->_device;
    id v11 = v5;
    AlgsDevice::handleInputStream(device, (const void *)([v11 bytes] + 1), objc_msgSend(v11, "length") - 1, v9 + 1, &v34, v28, &v32, (const void **)&v33);
    char v13 = v12;
    [(SASInterfaceTouch *)self callStreamCallback:v34];
    [(SASInterfaceTouch *)self callEventCallback];
    [(SASInterfaceTouch *)self callCoreAnalyticsCallback];
    int v14 = v28[0];
    if (v28[0] == 1)
    {
      [(SASInterfaceTouch *)self callResetRequestCallback:v32 arg_ptr:v33];
      int v14 = v28[0];
    }
    if (v14 == 2) {
      [(SASInterfaceTouch *)self defaultStreamingConfiguration];
    }
    if (self->_planId != ((unsigned __int16)(AlgsDevice::getInfo((AlgsDevice *)self->_device) >> 32) >> 8))
    {
      self->_planId = (unsigned __int16)(AlgsDevice::getInfo((AlgsDevice *)self->_device) >> 32) >> 8;
      [(SASInterfaceTouch *)self configureCallbacks];
    }
    if (v7 >= 2 && *(unsigned char *)(v6 + 1) == 1 && *(unsigned char *)(v6 + 2) == 1 && !self->_planId)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v15 = self->_propertyDatabase;
      uint64_t v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v15);
            }
            [(SASInterfaceTouch *)self injectProperty:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          }
          uint64_t v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
        }
        while (v16);
      }
    }
    char v19 = v8 & v13;
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (unint64_t)timestampMachToUs:(unint64_t)a3
{
  return _timebase * a3 / *(unsigned int *)algn_26B34C1E4 / 0x3E8;
}

- (void)cleanNodes
{
  self->_touch_system_ready = 0;
  self->_cover_gesture.state = 0;
  self->_atomic_wake_event = 0;
  *(_OWORD *)&self->_fingers = 0u;
  *(_OWORD *)&self->_hand = 0u;
  self->_event_info = 0;
  self->_interpolated_event_info = 0;
  self->_tap = 0;
}

- (void)callStreamCallback:(unint64_t)a3
{
  if (a3 && self->_streamCallback)
  {
    objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSMutableData mutableBytes](self->_outputBuffer, "mutableBytes"), a3 + 1, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_streamCallback + 2))();
  }
}

- (void)callEventCallback
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25BF13000, log, OS_LOG_TYPE_ERROR, "Wake Event but no hand!", v1, 2u);
}

- (void)callCoreAnalyticsCallback
{
  v2 = self;
  v76[1] = *MEMORY[0x263EF8340];
  if (self->_coreAnalyticsCallback)
  {
    if (self->_duration_between_touches)
    {
      HIDWORD(v3) = -1030792151 * rand();
      LODWORD(v3) = HIDWORD(v3);
      if ((v3 >> 2) <= 0x28F5C28)
      {
        coreAnalyticsCallback = (void (**)(id, __CFString *, void *))v2->_coreAnalyticsCallback;
        v75 = @"Duration";
        *(float *)&double v4 = *v2->_duration_between_touches;
        v51 = [NSNumber numberWithFloat:v4];
        v76[0] = v51;
        uint64_t v6 = [NSDictionary dictionaryWithObjects:v76 forKeys:&v75 count:1];
        coreAnalyticsCallback[2](coreAnalyticsCallback, @"com.apple.Multitouch.EmbeddedStatistics.DurationBetweenTouches", v6);

        v2 = self;
      }
    }
    path_stats = v2->_path_stats;
    if (path_stats && path_stats->var0)
    {
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      do
      {
        HIDWORD(v10) = -1030792151 * rand();
        LODWORD(v10) = HIDWORD(v10);
        if ((v10 >> 2) <= 0x28F5C28)
        {
          char v12 = (void (**)(id, __CFString *, void *))self->_coreAnalyticsCallback;
          v73[0] = @"MinGeometricMean";
          LODWORD(v11) = LODWORD(path_stats->var1[v8].var0);
          v52 = [NSNumber numberWithFloat:v11];
          v74[0] = v52;
          v73[1] = @"MaxGeometricMean";
          LODWORD(v13) = LODWORD(path_stats->var1[v8].var1);
          int v14 = [NSNumber numberWithFloat:v13];
          v74[1] = v14;
          v73[2] = @"EccentricityForMin";
          LODWORD(v15) = LODWORD(path_stats->var1[v8].var2);
          uint64_t v16 = [NSNumber numberWithFloat:v15];
          v74[2] = v16;
          v73[3] = @"EccentricityForMax";
          LODWORD(v17) = LODWORD(path_stats->var1[v8].var3);
          v18 = [NSNumber numberWithFloat:v17];
          v74[3] = v18;
          v73[4] = @"InitialTouchIdentity";
          char v19 = &path_stats->var0 + v8 * 24;
          v20 = [NSNumber numberWithUnsignedInt:path_stats->var1[v8].var4];
          v74[4] = v20;
          v73[5] = @"LiftoffTouchIdentity";
          v21 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v19 + 6)];
          v74[5] = v21;
          v22 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:6];
          v12[2](v12, @"com.apple.Multitouch.EmbeddedStatistics.LiftoffPathStats", v22);
        }
        ++v9;
        v2 = self;
        path_stats = self->_path_stats;
        ++v8;
      }
      while (v9 < path_stats->var0);
    }
    if (v2->_phone_telemetry.event_occurred)
    {
      if (v2->_phone_telemetry.baseline_inversion_occurred)
      {
        long long v23 = (void (**)(id, __CFString *, void *))v2->_coreAnalyticsCallback;
        v71[0] = @"Lockscreen_Status";
        v53 = [NSNumber numberWithBool:v2->_phone_telemetry.is_on_coversheet];
        v71[1] = @"Touch_Frequency";
        v72[0] = v53;
        long long v24 = [NSNumber numberWithUnsignedChar:self->_phone_telemetry.scan_frequency_index];
        v72[1] = v24;
        long long v25 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
        v23[2](v23, @"com.apple.multitouch.baseline.inversion", v25);

        long long v26 = SALoggingGeneral();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int baseline_adaption_interval_ms = self->_phone_telemetry.baseline_adaption_interval_ms;
          int time_since_last_baseline_change_ms = self->_phone_telemetry.time_since_last_baseline_change_ms;
          int scan_frequency_index = self->_phone_telemetry.scan_frequency_index;
          if (self->_phone_telemetry.is_on_coversheet) {
            v30 = "onCoversheet";
          }
          else {
            v30 = "";
          }
          *(_DWORD *)buf = 67109890;
          int v62 = baseline_adaption_interval_ms;
          __int16 v63 = 1024;
          int v64 = time_since_last_baseline_change_ms;
          __int16 v65 = 1024;
          int v66 = scan_frequency_index;
          __int16 v67 = 2080;
          v68 = v30;
          _os_log_impl(&dword_25BF13000, v26, OS_LOG_TYPE_INFO, "Baseline Inversion: Interval=%dms SinceLast=%dms FreqIdx=%d %s", buf, 0x1Eu);
        }

        v2 = self;
      }
      if (v2->_phone_telemetry.nondefault_baseline_adapt_occurred)
      {
        v31 = SALoggingGeneral();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          int v32 = self->_phone_telemetry.baseline_adaption_interval_ms;
          int v33 = self->_phone_telemetry.time_since_last_baseline_change_ms;
          int v34 = self->_phone_telemetry.scan_frequency_index;
          v35 = "onCoversheet";
          if (!self->_phone_telemetry.is_on_coversheet) {
            v35 = "";
          }
          if (self->_phone_telemetry.has_touch_above_threshold) {
            uint64_t v36 = "aboveThreshold";
          }
          else {
            uint64_t v36 = "";
          }
          *(_DWORD *)buf = 67110146;
          int v62 = v32;
          __int16 v63 = 1024;
          int v64 = v33;
          __int16 v65 = 1024;
          int v66 = v34;
          __int16 v67 = 2080;
          v68 = v35;
          __int16 v69 = 2080;
          v70 = v36;
          _os_log_impl(&dword_25BF13000, v31, OS_LOG_TYPE_INFO, "Non Default Baseline: Interval=%dms SinceLast=%dms FreqIdx=%d %s %s", buf, 0x28u);
        }

        v37 = (void (**)(id, __CFString *, void *))self->_coreAnalyticsCallback;
        v59[0] = @"AdaptationInterval";
        v54 = [NSNumber numberWithInt:self->_phone_telemetry.baseline_adaption_interval_ms];
        v60[0] = v54;
        v59[1] = @"FreqDuringAdaptation";
        v38 = [NSNumber numberWithUnsignedChar:self->_phone_telemetry.scan_frequency_index];
        v60[1] = v38;
        v59[2] = @"Lockscreen_Status";
        v39 = [NSNumber numberWithBool:self->_phone_telemetry.is_on_coversheet];
        v60[2] = v39;
        v59[3] = @"TimeSinceLastAdapt";
        v40 = [NSNumber numberWithInt:self->_phone_telemetry.time_since_last_baseline_change_ms];
        v60[3] = v40;
        v59[4] = @"Touching";
        v41 = [NSNumber numberWithBool:self->_phone_telemetry.has_touch_above_threshold];
        v60[4] = v41;
        v42 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:5];
        v37[2](v37, @"com.apple.multitouch.baseline.adaptation", v42);

        v2 = self;
      }
      if (v2->_phone_telemetry.all_columns_covered_occurred)
      {
        v43 = SALoggingGeneral();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          int v44 = self->_phone_telemetry.baseline_adaption_interval_ms;
          int v45 = self->_phone_telemetry.time_since_last_baseline_change_ms;
          int v46 = self->_phone_telemetry.scan_frequency_index;
          if (self->_phone_telemetry.is_on_coversheet) {
            v47 = "onCoversheet";
          }
          else {
            v47 = "";
          }
          *(_DWORD *)buf = 67109890;
          int v62 = v44;
          __int16 v63 = 1024;
          int v64 = v45;
          __int16 v65 = 1024;
          int v66 = v46;
          __int16 v67 = 2080;
          v68 = v47;
          _os_log_impl(&dword_25BF13000, v43, OS_LOG_TYPE_INFO, "All Columns Covered: Interval=%dms SinceLast=%dms FreqIdx=%d %s", buf, 0x1Eu);
        }

        v48 = (void (**)(id, __CFString *, void *))self->_coreAnalyticsCallback;
        v57[0] = @"Lockscreen_Status";
        v55 = [NSNumber numberWithBool:self->_phone_telemetry.is_on_coversheet];
        v57[1] = @"Touch_Frequency";
        v58[0] = v55;
        v49 = [NSNumber numberWithUnsignedChar:self->_phone_telemetry.scan_frequency_index];
        v58[1] = v49;
        v50 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
        v48[2](v48, @"com.apple.multitouch.dtn.allcolumnscovered", v50);

        v2 = self;
      }
    }
  }
  v2->_phone_telemetry.event_occurred = 0;
  v2->_path_stats = 0;
  v2->_duration_between_touches = 0;
}

- (SASInterfaceTouch)initWithStreamSize:(unint64_t)a3 streamCallback:(id)a4
{
  return [(SASInterfaceTouch *)self initWithStreamSize:a3 platformId:0 streamCallback:a4];
}

- (SASInterfaceTouch)initWithStreamSize:(unint64_t)a3 platformId:(unint64_t)a4 streamCallback:(id)a5
{
  id v7 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SASInterfaceTouch;
  uint64_t v8 = [(SASInterfaceTouch *)&v22 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF990] dataWithLength:a3];
    unint64_t v10 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = v9;

    uint64_t v11 = [MEMORY[0x263EFF990] dataWithLength:a3];
    char v12 = (void *)*((void *)v8 + 7);
    *((void *)v8 + 7) = v11;

    *(unsigned char *)[*((id *)v8 + 6) mutableBytes] = 90;
    uint64_t v13 = MEMORY[0x261178C80](v7);
    int v14 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v13;

    double v15 = operator new(0x88uLL);
    TouchService::TouchServiceAlgsDevice::TouchServiceAlgsDevice(v15, 0, 224, 0);
    *((void *)v8 + 9) = v15;
    uint64_t v16 = [MEMORY[0x263EFF990] dataWithLength:868];
    double v17 = (void *)*((void *)v8 + 8);
    *((void *)v8 + 8) = v16;

    mach_timebase_info((mach_timebase_info_t)&_timebase);
    v8[12] = 0;
    v8[214] = 0;
    *(void *)(*((void *)v8 + 9) + 104) = SASGetTimestampCallback;
    v8[224] = 0;
    *(_WORD *)(v8 + 9) = 0;
    uint64_t v18 = objc_opt_new();
    char v19 = (void *)*((void *)v8 + 23);
    *((void *)v8 + 23) = v18;

    [v8 initProperties];
    [v8 initContactReclassificationParams];
    [v8 configureCallbacks];
    [v8 configureTranslation];
    [v8 defaultStreamingConfiguration];
    v20 = v8;
  }

  return (SASInterfaceTouch *)v8;
}

- (void)initProperties
{
  v8[3] = *MEMORY[0x263EF8340];
  unint64_t v3 = (NSMutableDictionary *)objc_opt_new();
  propertyDatabase = self->_propertyDatabase;
  self->_propertyDatabase = v3;

  v7[0] = @"WorkNodeId";
  v7[1] = @"DataNodeId";
  v8[0] = &unk_27096CEA0;
  v8[1] = &unk_27096CEB8;
  v7[2] = @"Type";
  v8[2] = &unk_27096CED0;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  uint64_t v6 = (void *)[v5 mutableCopy];
  [(NSMutableDictionary *)self->_propertyDatabase setObject:v6 forKeyedSubscript:@"QuantizationDPI"];
}

- (BOOL)isContactReclassificationNeeded
{
  char v2 = MGGetBoolAnswer();
  unint64_t v3 = SALoggingGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(SASInterfaceTouch *)v2 isContactReclassificationNeeded];
  }

  return v2;
}

- (void)initContactReclassificationParams
{
  v22[4] = *MEMORY[0x263EF8340];
  memset(&v16[1], 0, 32);
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  v16[0] = 2047803400;
  LOWORD(v16[1]) = 28;
  BOOL v3 = [(SASInterfaceTouch *)self isContactReclassificationNeeded];
  if (v3)
  {
    int v4 = 1;
    HIWORD(v16[1]) = 1;
    *(_OWORD *)&v16[2] = xmmword_25BF26070;
    *(void *)&v16[6] = 0x10000000001FLL;
    LOWORD(v16[8]) = 0x4000;
    BYTE2(v16[8]) = 4;
  }
  else
  {
    int v4 = 0;
  }
  id v5 = (void *)MGCopyAnswer();
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 bytes];
    HIWORD(v16[1]) = v4 + 1;
    uint64_t v8 = (float *)&v16[7 * v4];
    double v9 = *(double *)(v7 + 8);
    double v10 = *(double *)(v7 + 24);
    float v11 = 1.0 - (v9 + v10 * -0.5);
    v8[5] = v11;
    v8[2] = -5.0;
    *(float *)&double v9 = 1.0 - (v9 + v10 * 1.5);
    v8[3] = *(float *)&v9;
    void v8[4] = 1.0;
    *((void *)v8 + 3) = 0x1000000001DELL;
    *((_WORD *)v8 + 16) = 0x4000;
    *((unsigned char *)v8 + 34) = 4;
    uint64_t v12 = (28 * (v4 + 1) + 8);
LABEL_8:
    v22[0] = &unk_27096CEA0;
    v21[0] = @"WorkNodeId";
    v21[1] = @"DataNodeId";
    v22[1] = &unk_27096CEE8;
    v22[2] = &unk_27096CF00;
    v21[2] = @"Type";
    v21[3] = @"Value";
    uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithBytes:v16 length:v12];
    v22[3] = v13;
    int v14 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
    double v15 = (void *)[v14 mutableCopy];
    [(NSMutableDictionary *)self->_propertyDatabase setObject:v15 forKeyedSubscript:@"ContactReclassificationParams"];

    goto LABEL_9;
  }
  if (v3)
  {
    uint64_t v12 = 36;
    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)injectProperty:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_propertyDatabase objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (!v5
    || ([v5 objectForKeyedSubscript:@"Value"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    long long v18 = SALoggingGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SASInterfaceTouch injectProperty:]((uint64_t)v4, v18);
    }
    goto LABEL_8;
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"WorkNodeId"];
  uint64_t v9 = [v8 unsignedLongLongValue];

  double v10 = [v6 objectForKeyedSubscript:@"DataNodeId"];
  uint64_t v11 = [v10 unsignedLongLongValue];

  uint64_t v12 = [v6 objectForKeyedSubscript:@"Type"];
  int v13 = [v12 unsignedShortValue];

  if (v13 == 39426)
  {
    id v20 = [v6 objectForKeyedSubscript:@"Value"];
    v21 = (const void *)[v20 bytes];

    objc_super v22 = [v6 objectForKeyedSubscript:@"Value"];
    uint64_t v17 = [v22 length];

    uint64_t v16 = operator new[](v17);
    memcpy(v16, v21, v17);
    goto LABEL_10;
  }
  if (v13 != 20486)
  {
    long long v18 = SALoggingGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SASInterfaceTouch injectProperty:](v13, v18);
    }
LABEL_8:

    LOBYTE(v19) = 0;
    goto LABEL_15;
  }
  int v14 = [v6 objectForKeyedSubscript:@"Value"];
  int v15 = [v14 unsignedIntValue];

  uint64_t v16 = operator new[](4uLL);
  *uint64_t v16 = v15;
  uint64_t v17 = 4;
LABEL_10:
  AlgDataPacket::AlgDataPacket((uint64_t)v31, v9, v11, v13, 1, 1, (uint64_t)v16, v17, 0, 0);
  PacketCollection::PacketCollection((uint64_t)v30, 1, 1);
  v30[0] = &unk_27096BEE0;
  PacketCollection::PacketCollection((uint64_t)v29, 0, 1);
  v29[10] = 0;
  v29[11] = 0;
  v29[0] = &unk_27096BE80;
  AlgDataInjector::add((AlgDataInjector *)v30, (const AlgDataPacket *)v31);
  NSUInteger v28 = [(NSMutableData *)self->_outputBuffer length] - 1;
  int v19 = (*(uint64_t (**)(void *, void *, void *, void *, NSUInteger *))(*(void *)self->_device + 32))(self->_device, v30, v29, [(NSMutableData *)self->_outputBuffer mutableBytes] + 1, &v28);
  [(SASInterfaceTouch *)self callStreamCallback:v28];
  long long v23 = SALoggingGeneral();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = [v6 objectForKeyedSubscript:@"Value"];
    long long v25 = (void *)v24;
    long long v26 = "Error";
    *(_DWORD *)buf = 138412802;
    id v33 = v4;
    if (v19) {
      long long v26 = "OK";
    }
    __int16 v34 = 2112;
    uint64_t v35 = v24;
    __int16 v36 = 2080;
    v37 = v26;
    _os_log_impl(&dword_25BF13000, v23, OS_LOG_TYPE_INFO, "InjectProperty: %@=%@ result %s", buf, 0x20u);
  }
  operator delete[](v16);
  PacketCollection::~PacketCollection((PacketCollection *)v29);
  PacketCollection::~PacketCollection((PacketCollection *)v30);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v31);
LABEL_15:

  return v19;
}

- (BOOL)injectProperty:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_propertyDatabase objectForKeyedSubscript:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setObject:v7 forKeyedSubscript:@"Value"];
    BOOL v10 = [(SASInterfaceTouch *)self injectProperty:v6];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)configureCallbacks
{
  if (self->_planId == 1)
  {
    PacketCollection::PacketCollection((uint64_t)v3, 1, 1);
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    v3[0] = &unk_27096BE80;
    AlgDataExtractor::callbackFor((uint64_t)v3, 0x42BD12136436D303, 0x1AE6533682FB2CLL, 2);
    AlgsDevice::configureInternalClient((uint64_t)self->_device, (const PacketCollection *)v3, 0);
  }
  else
  {
    if (self->_planId) {
      return;
    }
    PacketCollection::PacketCollection((uint64_t)v3, 13, 1);
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    v3[0] = &unk_27096BE80;
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0xBB59337C2FBD0775, 2);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0xA6CEC30BA0ABCAE0, 2);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0x377A1603BFB01C2, 2);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0x348FFB668AEB850DLL, 2);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0x377AB9DB80CC6E1, 2);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0xE6B312786F98B150, 2);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0xFC9144553B9D1414, 1);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0xB0A60E3AEC10AE51, 1);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0x614773EFA4E20E8CLL, 1);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0x7E2F3B82958BC45, 1);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0xDACD1AB81EF736C2, 2);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0x3779E57A5AD9093, 2);
    AlgDataExtractor::callbackFor((uint64_t)v3, 0xAF83667BDA1FDB60, 0x348FF85DF49E13DELL, 2);
    AlgsDevice::configureInternalClient((uint64_t)self->_device, (const PacketCollection *)v3, 0);
  }
  PacketCollection::~PacketCollection((PacketCollection *)v3);
}

- (void)configureTranslation
{
  PacketCollection::PacketCollection(v5, 5, 1);
  PacketCollection::PacketCollection(v4, 5, 1);
  AlgDataPacket::AlgDataPacket((uint64_t)v3, 0x193B6A12DA1B4A4FLL, 0x17DF1F63A854DE7ELL, 0, 0, 2, 0, 0, 0, 0);
  PacketCollection::add((PacketCollection *)v5, (const AlgDataPacket *)v3);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v3);
  AlgDataPacket::AlgDataPacket((uint64_t)v3, 0xAF83667BDA1FDB60, 0x310DDDD485, 0, 0, 1, 0, 0, 0, 0);
  PacketCollection::add((PacketCollection *)v4, (const AlgDataPacket *)v3);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v3);
  AlgDataPacket::AlgDataPacket((uint64_t)v3, 0x193B6A12DA1B4A4FLL, 0x29965DE49819D20DLL, 0, 0, 2, 0, 0, 0, 0);
  PacketCollection::add((PacketCollection *)v5, (const AlgDataPacket *)v3);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v3);
  AlgDataPacket::AlgDataPacket((uint64_t)v3, 0xAF83667BDA1FDB60, 0x29965DE49819D20DLL, 0, 0, 1, 0, 0, 0, 0);
  PacketCollection::add((PacketCollection *)v4, (const AlgDataPacket *)v3);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v3);
  AlgDataPacket::AlgDataPacket((uint64_t)v3, 0x193B6A12DA1B4A4FLL, 0xEDBB78967950011, 0, 0, 2, 0, 0, 0, 0);
  PacketCollection::add((PacketCollection *)v5, (const AlgDataPacket *)v3);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v3);
  AlgDataPacket::AlgDataPacket((uint64_t)v3, 0xAF83667BDA1FDB60, 0xEDBB78967950011, 0, 0, 1, 0, 0, 0, 0);
  PacketCollection::add((PacketCollection *)v4, (const AlgDataPacket *)v3);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v3);
  AlgDataPacket::AlgDataPacket((uint64_t)v3, 0x193B6A12DA1B4A4FLL, 0x4D123D542B029C57, 0, 0, 2, 0, 0, 0, 0);
  PacketCollection::add((PacketCollection *)v5, (const AlgDataPacket *)v3);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v3);
  AlgDataPacket::AlgDataPacket((uint64_t)v3, 0xAF83667BDA1FDB60, 0x4D123D542B029C57, 0, 0, 1, 0, 0, 0, 0);
  PacketCollection::add((PacketCollection *)v4, (const AlgDataPacket *)v3);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v3);
  AlgDataPacket::AlgDataPacket((uint64_t)v3, 0xC4B4E96450B4BB52, 0x67E8309EEB362582, 0, 0, 2, 0, 0, 0, 0);
  PacketCollection::add((PacketCollection *)v5, (const AlgDataPacket *)v3);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v3);
  AlgDataPacket::AlgDataPacket((uint64_t)v3, 0x42BD12136436D303, 0x726DB665A87D6D56, 0, 0, 1, 0, 0, 0, 0);
  PacketCollection::add((PacketCollection *)v4, (const AlgDataPacket *)v3);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v3);
  AlgsDevice::configureTranslation((AlgsDevice::StreamingClient **)self->_device, (const PacketCollection *)v5, (const PacketCollection *)v4);
  PacketCollection::~PacketCollection((PacketCollection *)v4);
  PacketCollection::~PacketCollection((PacketCollection *)v5);
}

- (void)defaultStreamingConfiguration
{
  PacketCollection::PacketCollection((uint64_t)v4, 8, 1);
  v4[10] = 0;
  v4[11] = 0;
  v4[0] = &unk_27096BE80;
  AlgDataExtractor::requestFor((uint64_t)v4, 0xAF83667BDA1FDB60, 0x377A1603BFB01C2, 2);
  AlgDataExtractor::requestFor((uint64_t)v4, 0xAF83667BDA1FDB60, 0xBB59337C2FBD0775, 2);
  AlgDataExtractor::requestFor((uint64_t)v4, 0xAF83667BDA1FDB60, 0x348FFB668AEB850DLL, 2);
  AlgDataExtractor::requestFor((uint64_t)v4, 0xAF83667BDA1FDB60, 0xA6CEC30BA0ABCAE0, 2);
  AlgDataExtractor::requestFor((uint64_t)v4, 0xAF83667BDA1FDB60, 0x3779E57A5AD9093, 2);
  AlgDataExtractor::requestFor((uint64_t)v4, 0xAF83667BDA1FDB60, 0x348FF85DF49E13DELL, 2);
  AlgDataExtractor::requestFor((uint64_t)v4, 0xAF83667BDA1FDB60, 0xDACD1AB81EF736C2, 2);
  AlgDataExtractor::requestFor((uint64_t)v4, 0x42BD12136436D303, 0x1AE6533682FB2CLL, 2);
  unint64_t v3 = [(NSMutableData *)self->_outputBuffer length] - 1;
  AlgsDevice::configureStreaming((AlgsDevice::StreamingClient **)self->_device, 1, (AlgDataExtractor *)v4, [(NSMutableData *)self->_outputBuffer mutableBytes] + 1, &v3);
  [(SASInterfaceTouch *)self callStreamCallback:v3];
  PacketCollection::~PacketCollection((PacketCollection *)v4);
}

- (void)callResetRequestCallback:(unsigned __int16)a3 arg_ptr:(const void *)a4
{
  resetRequestCallback = (void (**)(id, void))self->_resetRequestCallback;
  if (resetRequestCallback)
  {
    if (a3 == 1) {
      uint64_t v5 = *(unsigned __int8 *)a4;
    }
    else {
      uint64_t v5 = 0;
    }
    resetRequestCallback[2](resetRequestCallback, v5);
  }
}

- (id)generateHandEvent:(id *)a3 interpolated:(BOOL)a4 now:(unint64_t)a5
{
  if (a4) {
    int v7 = 35;
  }
  else {
    int v7 = 3;
  }
  unsigned int var15 = a3->var15;
  uint64_t v8 = objc_msgSend(MEMORY[0x263F0EC40], "digitizerEvent:transducerType:x:y:z:options:", -[SASInterfaceTouch getValidTimestamp:now:](self, "getValidTimestamp:now:", a3->var0, a5), 3, var15 | v7, a3->var5, a3->var6, 0.0);
  [v8 setIntegerValue:a3->var3 forField:720902];
  [v8 setIntegerValue:a3->var4 forField:720903];
  [v8 setIntegerValue:a3->var1 forField:720923];
  [v8 setIntegerValue:a3->var13 forField:720904];
  [v8 setIntegerValue:a3->var14 forField:720905];

  return v8;
}

- (id)generateFingerEvent:(id *)a3 interpolated:(BOOL)a4 now:(unint64_t)a5
{
  if (a4) {
    int v7 = 33;
  }
  else {
    int v7 = 1;
  }
  unsigned int var15 = a3->var15;
  uint64_t v8 = objc_msgSend(MEMORY[0x263F0EC40], "qualityDigitizerEvent:quality:density:irregularity:majorRadius:minorRadius:accuracy:options:", -[SASInterfaceTouch getValidTimestamp:now:](self, "getValidTimestamp:now:", a3->var0, a5), var15 | v7, a3->var10, a3->var11, 0.0, a3->var8, a3->var7, 0.0);
  [v8 setIntegerValue:2 forField:720900];
  [v8 setIntegerValue:a3->var2 forField:720901];
  [v8 setIntegerValue:a3->var3 forField:720902];
  [v8 setIntegerValue:a3->var4 forField:720903];
  [v8 setIntegerValue:a3->var1 forField:720923];
  [v8 setDoubleValue:720896 forField:a3->var5];
  [v8 setDoubleValue:720897 forField:a3->var6];
  [v8 setDoubleValue:720908 forField:a3->var12];
  [v8 setDoubleValue:720922 forField:a3->var9];
  [v8 setIntegerValue:a3->var13 forField:720904];
  [v8 setIntegerValue:a3->var14 forField:720905];
  IOHIDEventSetPhase();

  return v8;
}

- (id)generateEventInfo:(id *)a3 interpolated:(BOOL)a4 timestamp:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a4) {
    int v9 = 33;
  }
  else {
    int v9 = 1;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  LOWORD(v17) = *(_WORD *)&a3->var0;
  *((void *)&v17 + 1) = [(SASInterfaceTouch *)self timestampUsToAbsoluteMach:self->_timestamp_offset + a3->var2];
  *(void *)&long long v18 = [(SASInterfaceTouch *)self timestampUsToAbsoluteMach:self->_timestamp_offset + a3->var3];
  BYTE8(v18) = a3->var4;
  LODWORD(v16) = v9;
  BOOL v10 = [MEMORY[0x263F0EC40] vendorDefinedEvent:a5 usagePage:65308 usage:32 version:1 data:&v17 length:32 options:v16];
  uint64_t v11 = SALoggingGeneral();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = "";
    int v14 = "YES";
    if (v6) {
      int v13 = "Interpolated ";
    }
    if ((_BYTE)v17) {
      int v15 = "YES";
    }
    else {
      int v15 = "NO";
    }
    *(_DWORD *)buf = 136316674;
    if (!BYTE1(v17)) {
      int v14 = "NO";
    }
    id v20 = v13;
    __int16 v21 = 2080;
    objc_super v22 = v15;
    __int16 v23 = 2080;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = BYTE8(v18);
    __int16 v27 = 2048;
    uint64_t v28 = *((void *)&v17 + 1);
    __int16 v29 = 2048;
    uint64_t v30 = v18;
    __int16 v31 = 2048;
    unint64_t v32 = a5;
    _os_log_debug_impl(&dword_25BF13000, v11, OS_LOG_TYPE_DEBUG, "Generating %sEvent Info: expectNext=%s information=%s reason=%u deadline=%llu nextTimestamp=%llu now=%llu", buf, 0x44u);
  }

  return v10;
}

- (id)generateTouchSystemReady:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v10 = 1;
  LODWORD(v9) = 1;
  uint64_t v4 = [MEMORY[0x263F0EC40] vendorDefinedEvent:a3 usagePage:65376 usage:9 version:1 data:&v10 length:1 options:v9];
  uint64_t v5 = SALoggingGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t prev_frame_diff_us = self->_prev_frame_diff_us;
    *(_DWORD *)buf = 134217984;
    unint64_t v12 = prev_frame_diff_us;
    _os_log_impl(&dword_25BF13000, v5, OS_LOG_TYPE_DEFAULT, "Generating Touch System Ready (%lluus since last frame)\n", buf, 0xCu);
  }

  int v7 = SALoggingHIDEventSignpost();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF13000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TouchSystemReady", "Touch System Ready", buf, 2u);
  }

  return v4;
}

- (id)generateCoverGesture:(unint64_t)a3 state:(unsigned __int8)a4 surfaceCovered:(float)a5
{
  int v5 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  float v11 = a5;
  self->_cover_gesture_state = a4;
  LODWORD(v10) = 0;
  BOOL v6 = [MEMORY[0x263F0EC40] vendorDefinedEvent:a3 usagePage:65280 usage:89 version:1 data:&v11 length:4 options:v10];
  IOHIDEventSetPhase();
  int v7 = SALoggingGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v13 = v5;
    __int16 v14 = 2048;
    double v15 = v11;
    _os_log_impl(&dword_25BF13000, v7, OS_LOG_TYPE_DEFAULT, "Generate CoverGesture %d surface %0.2f", buf, 0x12u);
  }

  uint64_t v8 = SALoggingHIDEventSignpost();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 67109376;
    int v13 = v5;
    __int16 v14 = 2048;
    double v15 = v11;
    _os_signpost_emit_with_name_impl(&dword_25BF13000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GenerateCoverGesture", "Cover Gesture %d surface %0.2f", buf, 0x12u);
  }

  return v6;
}

- (id)generateSwipeUp:(unint64_t)a3
{
  NavigationSwipeEvent = (void *)IOHIDEventCreateNavigationSwipeEvent();
  uint64_t v4 = SALoggingGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25BF13000, v4, OS_LOG_TYPE_DEFAULT, "Generate Swipe Up Wake Event", buf, 2u);
  }

  int v5 = SALoggingHIDEventSignpost();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)int v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF13000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GenerateWakeEvent", "Atomic Swipe Up Wake Event", v7, 2u);
  }

  return NavigationSwipeEvent;
}

- (int64_t)getValidTimestamp:(unint64_t)a3 now:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int64_t v6 = a4 - a3;
  if (a4 - a3 - 1 >= 0xF423F)
  {
    int64_t timestamp_offset = self->_timestamp_offset;
    if ((unint64_t)(v6 - timestamp_offset) >= 0xF4240)
    {
      self->_int64_t timestamp_offset = v6;
      __int16 v14 = SALoggingGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int64_t v15 = self->_timestamp_offset;
        int v16 = 134218496;
        unint64_t v17 = a4;
        __int16 v18 = 2048;
        unint64_t v19 = a3;
        __int16 v20 = 2048;
        int64_t v21 = v15;
        _os_log_error_impl(&dword_25BF13000, v14, OS_LOG_TYPE_ERROR, "New timestamp offset: now=%llu timestamp=%llu offset=%lld", (uint8_t *)&v16, 0x20u);
      }

      unint64_t v12 = self;
      unint64_t v13 = a4;
    }
    else
    {
      unint64_t v10 = timestamp_offset + a3;
      float v11 = SALoggingGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 134218496;
        unint64_t v17 = a4;
        __int16 v18 = 2048;
        unint64_t v19 = a3;
        __int16 v20 = 2048;
        int64_t v21 = v10;
        _os_log_debug_impl(&dword_25BF13000, v11, OS_LOG_TYPE_DEBUG, "Adjusting timestamp: now=%llu timestamp=%llu adjusted=%llu", (uint8_t *)&v16, 0x20u);
      }

      unint64_t v12 = self;
      unint64_t v13 = v10;
    }
    return [(SASInterfaceTouch *)v12 timestampUsToAbsoluteMach:v13];
  }
  else
  {
    self->_int64_t timestamp_offset = 0;
    return -[SASInterfaceTouch timestampUsToAbsoluteMach:](self, "timestampUsToAbsoluteMach:");
  }
}

- (id)generateTapEvent:(id *)a3 transducerType:(unsigned int)a4 now:(unint64_t)a5
{
  if (a4 == 3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 1;
  }
  int v7 = objc_msgSend(MEMORY[0x263F0EC40], "digitizerEvent:transducerType:x:y:z:options:", -[SASInterfaceTouch getValidTimestamp:now:](self, "getValidTimestamp:now:", a3->var0, a5), *(void *)&a4, v6, a3->var5, a3->var6, 0.0);
  [v7 setIntegerValue:a3->var4 forField:720903];
  [v7 setIntegerValue:a3->var13 forField:720904];
  [v7 setIntegerValue:a3->var14 forField:720905];
  [v7 setIntegerValue:1 forField:720921];

  return v7;
}

- (id)generateWakeEvent:(int)a3 timestamp:(unint64_t)a4
{
  uint64_t v7 = a3;
  LODWORD(v6) = 0;
  uint64_t v4 = [MEMORY[0x263F0EC40] vendorDefinedEvent:a4 usagePage:65376 usage:10 version:0 data:&v7 length:8 options:v6];

  return v4;
}

- (unint64_t)timestampUsToAbsoluteMach:(unint64_t)a3
{
  return 1000 * a3 * *(unsigned int *)algn_26B34C1E4 / _timebase - self->_cont_abs_diff;
}

- (void)addVersion:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_versions addObject:v4];
  device = (AlgsDevice *)self->_device;
  id v6 = v4;
  AlgsDevice::addVersion(device, (const char *)[v6 UTF8String]);
}

- (id)streamCallback
{
  return self->_streamCallback;
}

- (void)setStreamCallback:(id)a3
{
}

- (id)eventCallback
{
  return self->_eventCallback;
}

- (void)setEventCallback:(id)a3
{
}

- (id)resetRequestCallback
{
  return self->_resetRequestCallback;
}

- (void)setResetRequestCallback:(id)a3
{
}

- (id)coreAnalyticsCallback
{
  return self->_coreAnalyticsCallback;
}

- (void)setCoreAnalyticsCallback:(id)a3
{
}

- (NSMutableData)outputBuffer
{
  return self->_outputBuffer;
}

- (void)setOutputBuffer:(id)a3
{
}

- (NSMutableData)inputBuffer
{
  return self->_inputBuffer;
}

- (void)setInputBuffer:(id)a3
{
}

- (NSData)emptyPaths
{
  return self->_emptyPaths;
}

- (void)setEmptyPaths:(id)a3
{
}

- (void)device
{
  return self->_device;
}

- (void)setDevice:(void *)a3
{
  self->_device = a3;
}

- (const)fingers
{
  return self->_fingers;
}

- (void)setFingers:(id *)a3
{
  self->_fingers = a3;
}

- (const)interpolated_fingers
{
  return self->_interpolated_fingers;
}

- (void)setInterpolated_fingers:(id *)a3
{
  self->_interpolated_fingers = a3;
}

- (const)hand
{
  return self->_hand;
}

- (void)setHand:(id *)a3
{
  self->_hand = a3;
}

- (const)interpolated_hand
{
  return self->_interpolated_hand;
}

- (void)setInterpolated_hand:(id *)a3
{
  self->_interpolated_hand = a3;
}

- (const)path_stats
{
  return self->_path_stats;
}

- (void)setPath_stats:(id *)a3
{
  self->_path_stats = a3;
}

- (const)duration_between_touches
{
  return self->_duration_between_touches;
}

- (void)setDuration_between_touches:(const float *)a3
{
  self->_duration_between_touches = a3;
}

- (const)tap
{
  return self->_tap;
}

- (void)setTap:(id *)a3
{
  self->_tap = a3;
}

- (const)event_info
{
  return self->_event_info;
}

- (void)setEvent_info:(id *)a3
{
  self->_event_info = a3;
}

- (const)interpolated_event_info
{
  return self->_interpolated_event_info;
}

- (void)setInterpolated_event_info:(id *)a3
{
  self->_interpolated_event_info = a3;
}

- ($3FFB85F807698FB051441EDCD924163A)phone_telemetry
{
  uint64_t v2 = *(void *)&self->_phone_telemetry.scan_frequency_index;
  uint64_t v3 = *(void *)&self->_phone_telemetry.baseline_adaption_interval_ms;
  result.var2 = v2;
  result.var3 = BYTE1(v2);
  result.var4 = BYTE2(v2);
  result.var5 = BYTE3(v2);
  result.var6 = BYTE4(v2);
  result.var7 = BYTE5(v2);
  result.var8 = BYTE6(v2);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (void)setPhone_telemetry:(id)a3
{
  self->_phone_telemetry = ($71B42478F67790D7C8E4F78F12357DE6)a3;
}

- (unsigned)wake_event_detected
{
  return self->_wake_event_detected;
}

- (void)setWake_event_detected:(unsigned __int8)a3
{
  self->_wake_event_detected = a3;
}

- (unsigned)atomic_wake_event
{
  return self->_atomic_wake_event;
}

- (void)setAtomic_wake_event:(unsigned __int8)a3
{
  self->_atomic_wake_event = a3;
}

- ($F2544535907296EB357DA0304DEA202B)cover_gesture
{
  uint64_t v2 = *(void *)&self->_cover_gesture.state;
  unint64_t timestamp_us = self->_cover_gesture.timestamp_us;
  result.var1 = v2;
  result.var2 = *((float *)&v2 + 1);
  result.var0 = timestamp_us;
  return result;
}

- (void)setCover_gesture:(id)a3
{
  self->_cover_gesture = ($C2F8AE2B4AE5955422F6EE7E575A10CD)a3;
}

- (unsigned)cover_gesture_state
{
  return self->_cover_gesture_state;
}

- (void)setCover_gesture_state:(unsigned __int8)a3
{
  self->_cover_gesture_state = a3;
}

- (BOOL)touch_system_ready
{
  return self->_touch_system_ready;
}

- (void)setTouch_system_ready:(BOOL)a3
{
  self->_touch_system_ready = a3;
}

- (int64_t)timestamp_offset
{
  return self->_timestamp_offset;
}

- (void)setTimestamp_offset:(int64_t)a3
{
  self->_int64_t timestamp_offset = a3;
}

- (unint64_t)cont_abs_diff
{
  return self->_cont_abs_diff;
}

- (void)setCont_abs_diff:(unint64_t)a3
{
  self->_cont_abs_diff = a3;
}

- (unint64_t)last_frame_time_us
{
  return self->_last_frame_time_us;
}

- (void)setLast_frame_time_us:(unint64_t)a3
{
  self->_last_frame_time_us = a3;
}

- (unint64_t)prev_frame_diff_us
{
  return self->_prev_frame_diff_us;
}

- (void)setPrev_frame_diff_us:(unint64_t)a3
{
  self->_unint64_t prev_frame_diff_us = a3;
}

- (unsigned)planId
{
  return self->_planId;
}

- (void)setPlanId:(unsigned __int8)a3
{
  self->_planId = a3;
}

- (NSMutableArray)versions
{
  return self->_versions;
}

- (void)setVersions:(id)a3
{
}

- (NSMutableDictionary)propertyDatabase
{
  return self->_propertyDatabase;
}

- (void)setPropertyDatabase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyDatabase, 0);
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_emptyPaths, 0);
  objc_storeStrong((id *)&self->_inputBuffer, 0);
  objc_storeStrong((id *)&self->_outputBuffer, 0);
  objc_storeStrong(&self->_coreAnalyticsCallback, 0);
  objc_storeStrong(&self->_resetRequestCallback, 0);
  objc_storeStrong(&self->_eventCallback, 0);

  objc_storeStrong(&self->_streamCallback, 0);
}

- (uint64_t)configureCallbacks
{
  return [*(id *)a1 setTap:*(void *)(a1 + 56)];
}

- (void)isContactReclassificationNeeded
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_25BF13000, a2, OS_LOG_TYPE_DEBUG, "GreyMatter eligibility: 0x%x", (uint8_t *)v2, 8u);
}

- (void)injectProperty:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25BF13000, a2, OS_LOG_TYPE_ERROR, "InjectProperty: %@ key not found", (uint8_t *)&v2, 0xCu);
}

- (void)injectProperty:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25BF13000, a2, OS_LOG_TYPE_ERROR, "InjectProperty: cannot handle type 0x%x", (uint8_t *)v2, 8u);
}

@end