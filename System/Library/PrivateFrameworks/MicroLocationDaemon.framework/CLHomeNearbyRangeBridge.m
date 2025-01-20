@interface CLHomeNearbyRangeBridge
- (BOOL)reactivationInProgress;
- (BOOL)setRangingRateWithConfiguration:(int64_t)a3;
- (CLHomeNearbyRangeBridge)initWithDelegate:(CLMicroLocationUwbBridgeWrapper *)a3 withQueue:(id)a4;
- (NISession)session;
- (OS_dispatch_queue)rangingCallbackQueue;
- (ULTimer)customRangeRateTimer;
- (int64_t)reactivationDelayInSeconds;
- (void)createRangeSession;
- (void)dealloc;
- (void)invalidateRangingSession;
- (void)reactivate;
- (void)resetRangingRate;
- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5;
- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)sessionDidStartRunning:(id)a3;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
- (void)setCustomRangeRateTimer:(id)a3;
- (void)setRangingCallbackQueue:(id)a3;
- (void)setReactivationDelayInSeconds:(int64_t)a3;
- (void)setReactivationInProgress:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)startRanging;
- (void)stopRanging;
@end

@implementation CLHomeNearbyRangeBridge

- (CLHomeNearbyRangeBridge)initWithDelegate:(CLMicroLocationUwbBridgeWrapper *)a3 withQueue:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CLHomeNearbyRangeBridge;
  v8 = [(CLHomeNearbyRangeBridge *)&v16 init];
  if (!v8) {
    goto LABEL_5;
  }
  v9 = [MEMORY[0x263F140C0] deviceCapabilities];
  char v10 = [v9 supportsPreciseDistanceMeasurement];

  if ((v10 & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
    }
    v13 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_DEBUG, "ranging is not supported on this platform", v15, 2u);
    }
    goto LABEL_10;
  }
  if (!a3)
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v8->_cppWrapper = a3;
  objc_storeStrong((id *)&v8->_rangingCallbackQueue, a4);
  customRangeRateTimer = v8->_customRangeRateTimer;
  v8->_customRangeRateTimer = 0;

  v8->_reactivationInProgress = 0;
  v8->_reactivationDelayInSeconds = 3;
LABEL_5:
  v12 = v8;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  [(CLHomeNearbyRangeBridge *)self invalidateRangingSession];
  customRangeRateTimer = self->_customRangeRateTimer;
  self->_customRangeRateTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)CLHomeNearbyRangeBridge;
  [(CLHomeNearbyRangeBridge *)&v4 dealloc];
}

- (void)startRanging
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
  }
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: startRanging: starting a ranging session", v5, 2u);
  }
  [(CLHomeNearbyRangeBridge *)self invalidateRangingSession];
  [(CLHomeNearbyRangeBridge *)self createRangeSession];
  id v4 = objc_alloc_init(MEMORY[0x263F140A0]);
  [(NISession *)self->_session runWithConfiguration:v4];
}

- (BOOL)setRangingRateWithConfiguration:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  session = self->_session;
  if (session)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F140A0]);
    [v6 setMinimumPreferredUpdatedRate:a3];
    [(NISession *)self->_session runWithConfiguration:v6];
    CFAbsoluteTime v7 = cl::chrono::CFAbsoluteTimeClock::now();
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
    }
    v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 68289538;
      v11[1] = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 1026;
      int v15 = a3;
      __int16 v16 = 2050;
      CFAbsoluteTime v17 = v7;
      _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMicroLocationHomeNearbyRangeBridge: set high ranging rate\", \"rate\":%{public}d, \"now\":\"%{public}.3f\"}", (uint8_t *)v11, 0x22u);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
    }
    v9 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_ERROR, "CLMicroLocationHomeNearbyRangeBridge: tried to set high ranging rate without an active ranging session!", (uint8_t *)v11, 2u);
    }
  }
  return session != 0;
}

- (void)resetRangingRate
{
  if (self->_session)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
    }
    v3 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: set default ranging rate", buf, 2u);
    }
    id v4 = objc_alloc_init(MEMORY[0x263F140A0]);
    [v4 setMinimumPreferredUpdatedRate:3];
    [(NISession *)self->_session runWithConfiguration:v4];
    [(ULTimer *)self->_customRangeRateTimer invalidate];
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
    }
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_ERROR, "CLMicroLocationHomeNearbyRangeBridge: tried to set default ranging rate without an active ranging session!", v6, 2u);
    }
  }
}

- (void)stopRanging
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
  }
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: stopRanging: stopping a ranging session", v4, 2u);
  }
  [(ULTimer *)self->_customRangeRateTimer invalidate];
  CLMicroLocationUwbBridgeWrapper::onHomeNearbySessionStopped(self->_cppWrapper);
  [(NISession *)self->_session pause];
}

- (void)createRangeSession
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
  }
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: createRangeSession: creating a ranging session", v6, 2u);
  }
  id v4 = [MEMORY[0x263F140C0] observerSession];
  session = self->_session;
  self->_session = v4;

  CLMicroLocationUwbBridgeWrapper::onHomeNearbySessionCreated(self->_cppWrapper);
  [(NISession *)self->_session setDelegate:self];
  [(NISession *)self->_session setDelegateQueue:self->_rangingCallbackQueue];
}

- (void)reactivate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!self->_reactivationInProgress)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
    }
    v3 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t reactivationDelayInSeconds = self->_reactivationDelayInSeconds;
      *(_DWORD *)buf = 134217984;
      int64_t v10 = reactivationDelayInSeconds;
      _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: reactivate: start ranging session in %.3lldsec", buf, 0xCu);
    }
    self->_reactivationInProgress = 1;
    dispatch_time_t v5 = dispatch_time(0, 1000000000 * self->_reactivationDelayInSeconds);
    rangingCallbackQueue = self->_rangingCallbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__CLHomeNearbyRangeBridge_reactivate__block_invoke;
    block[3] = &unk_2653F97F8;
    block[4] = self;
    dispatch_after(v5, rangingCallbackQueue, block);
    CLMicroLocationUwbBridgeWrapper::onHomeNearbySessionSuspended(self->_cppWrapper);
    int64_t v7 = 2 * self->_reactivationDelayInSeconds;
    if (v7 >= 120) {
      int64_t v7 = 120;
    }
    self->_int64_t reactivationDelayInSeconds = v7;
  }
}

uint64_t __37__CLHomeNearbyRangeBridge_reactivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startRanging];
  v2 = *(void **)(a1 + 32);
  return [v2 setReactivationInProgress:0];
}

- (void)invalidateRangingSession
{
  if (self->_session)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
    }
    v3 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v5 = 0;
      _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: invalidateRangingSession: invalidating a ranging session", v5, 2u);
    }
    [(NISession *)self->_session invalidate];
    session = self->_session;
    self->_session = 0;
  }
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v20 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v7)
  {
    v9 = "unknown";
    uint64_t v10 = *(void *)v25;
    if (a5 == 1) {
      v9 = "PeerEnded";
    }
    if (a5) {
      uint64_t v11 = (char *)v9;
    }
    else {
      uint64_t v11 = "Timeout";
    }
    *(void *)&long long v8 = 134349570;
    long long v19 = v8;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        if (onceToken_MicroLocation_Default != -1) {
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
        }
        __int16 v14 = (id)logObject_MicroLocation_Default;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, v11);
          if (v23 >= 0) {
            int v15 = __p;
          }
          else {
            int v15 = (void **)__p[0];
          }
          __int16 v16 = objc_msgSend(v13, "discoveryToken", v19);
          id v17 = [v16 description];
          uint64_t v18 = [v17 UTF8String];
          *(_DWORD *)buf = v19;
          id v29 = v20;
          __int16 v30 = 2082;
          v31 = v15;
          __int16 v32 = 2082;
          uint64_t v33 = v18;
          _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_DEFAULT, "NI, Session %{public}p did remove nearby object with reason: '%{public}s'. %{public}s", buf, 0x20u);

          if (v23 < 0) {
            operator delete(__p[0]);
          }
        }

        ++v12;
      }
      while (v7 != v12);
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v7);
  }
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  v38 = 0;
  v39 = 0;
  uint64_t v40 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = a4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v53 count:16];
  if (v5)
  {
    id v6 = (float *)MEMORY[0x263F14078];
    uint64_t v7 = *(void *)v35;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
        char v10 = [v9 relationship];
        [v9 distance];
        if (v11 != *v6 && (v10 & 2) != 0)
        {
          __int16 v14 = [v9 deviceIdentifer];
          BOOL v15 = v14 == 0;

          if (!v15)
          {
            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            *(_OWORD *)v43 = 0u;
            long long v41 = 0u;
            *(void *)&long long v41 = cl::chrono::CFAbsoluteTimeClock::now();
            [v9 distance];
            DWORD2(v41) = v16;
            [v9 direction];
            long long v42 = v17;
            id v18 = [v9 deviceIdentifer];
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v18 UTF8String]);
            *(_OWORD *)v43 = *(_OWORD *)__p;
            *(void *)&long long v44 = v33;
            HIBYTE(v33) = 0;
            LOBYTE(__p[0]) = 0;
            BYTE8(v44) = 2;
            [v9 azimuth];
            HIDWORD(v44) = v19;
            [v9 elevation];
            LODWORD(v45) = v20;
            unint64_t v21 = [v9 distanceMeasurementQuality];
            if (v21 >= 4) {
              char v22 = 0;
            }
            else {
              char v22 = v21;
            }
            BYTE4(v45) = v22;
            CLHomeNearbyObjectInternal::Builder::build((CLHomeNearbyObjectInternal::Builder *)&v41, (uint64_t)buf);
            if (SHIBYTE(v33) < 0) {
              operator delete(__p[0]);
            }

            if (SBYTE7(v44) < 0) {
              operator delete(v43[0]);
            }
            std::vector<CLHomeNearbyObjectInternal>::emplace_back<CLHomeNearbyObjectInternal>((uint64_t *)&v38, (uint64_t)buf);
            if (v52 < 0) {
              operator delete(v51);
            }
            goto LABEL_33;
          }
LABEL_26:
          char v23 = [v9 deviceIdentifer];
          BOOL v24 = v23 == 0;

          if (v24)
          {
            CLMicroLocationErrorHandling::reportError((CLMicroLocationErrorHandling *)@"NI, known device but deviceIdentifier is nil", v25);
          }
          else
          {
            if (onceToken_MicroLocation_Default != -1) {
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
            }
            long long v26 = (id)logObject_MicroLocation_Default;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              id v27 = [v9 deviceIdentifer];
              uint64_t v28 = [v27 UTF8String];
              *(_DWORD *)buf = 68289282;
              *(_DWORD *)&uint8_t buf[4] = 0;
              __int16 v47 = 2082;
              v48 = "";
              __int16 v49 = 2082;
              uint64_t v50 = v28;
              _os_log_impl(&dword_25631F000, v26, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"NI, known device's distance is not available\", \"deviceIdentifer\":%{public, location:escape_only}s}", buf, 0x1Cu);
            }
          }
          goto LABEL_33;
        }
        if ((v10 & 2) != 0) {
          goto LABEL_26;
        }
        if (onceToken_MicroLocation_Default != -1) {
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
        }
        v13 = logObject_MicroLocation_Default;
        if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289026;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v47 = 2082;
          v48 = "";
          _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"NI, unknwon device, ignore\"}", buf, 0x12u);
        }
LABEL_33:
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v53 count:16];
    }
    while (v5);
  }

  cppWrapper = self->_cppWrapper;
  memset(v31, 0, sizeof(v31));
  std::vector<CLHomeNearbyObjectInternal>::__init_with_size[abi:ne180100]<CLHomeNearbyObjectInternal*,CLHomeNearbyObjectInternal*>(v31, v38, v39, 0xCCCCCCCCCCCCCCCDLL * (v39 - v38));
  CLMicroLocationUwbBridgeWrapper::onHomeNearbyObjects((uint64_t)cppWrapper, v31);
  *(void *)buf = v31;
  std::vector<CLHomeNearbyObjectInternal>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(void *)buf = &v38;
  std::vector<CLHomeNearbyObjectInternal>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
}

- (void)sessionWasSuspended:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
  }
  uint64_t v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134349056;
    id v7 = v4;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p was suspended.", (uint8_t *)&v6, 0xCu);
  }
  CLMicroLocationUwbBridgeWrapper::onHomeNearbySessionSuspended(self->_cppWrapper);
}

- (void)sessionSuspensionEnded:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
  }
  uint64_t v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134349056;
    id v7 = v4;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p suspension ended. Restarting...", (uint8_t *)&v6, 0xCu);
  }
  CLMicroLocationUwbBridgeWrapper::onHomeNearbySessionResumed(self->_cppWrapper);
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@ %@", @"Uwb range session invalidated error:", v7];
    CLMicroLocationErrorHandling::reportError(v8, v9);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
    }
    char v10 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [0 debugDescription];
      uint64_t v12 = [v11 UTF8String];
      int64_t reactivationDelayInSeconds = self->_reactivationDelayInSeconds;
      *(_DWORD *)buf = 134349570;
      id v15 = v6;
      __int16 v16 = 2080;
      uint64_t v17 = v12;
      __int16 v18 = 2048;
      int64_t v19 = reactivationDelayInSeconds;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "NI, Error: session %{public}p invalidated with error: %s next reactivation try in %lldsec", buf, 0x20u);
    }
  }
  [(CLHomeNearbyRangeBridge *)self invalidateRangingSession];
  [(CLHomeNearbyRangeBridge *)self reactivate];
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
  }
  id v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 description];
    int v9 = 136446210;
    uint64_t v10 = [v8 UTF8String];
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "NI, failed (non-fatal): %{public}s.", (uint8_t *)&v9, 0xCu);
  }
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
  }
  id v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v6 description];
    int v9 = 136446210;
    uint64_t v10 = [v8 UTF8String];
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEBUG, "NI, discovered object: %{public}s", (uint8_t *)&v9, 0xCu);
  }
}

- (void)sessionDidStartRunning:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_118);
  }
  id v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134349056;
    id v7 = v4;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p Start Running", (uint8_t *)&v6, 0xCu);
  }
  self->_int64_t reactivationDelayInSeconds = 3;
}

- (ULTimer)customRangeRateTimer
{
  return self->_customRangeRateTimer;
}

- (void)setCustomRangeRateTimer:(id)a3
{
}

- (NISession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (OS_dispatch_queue)rangingCallbackQueue
{
  return self->_rangingCallbackQueue;
}

- (void)setRangingCallbackQueue:(id)a3
{
}

- (BOOL)reactivationInProgress
{
  return self->_reactivationInProgress;
}

- (void)setReactivationInProgress:(BOOL)a3
{
  self->_reactivationInProgress = a3;
}

- (int64_t)reactivationDelayInSeconds
{
  return self->_reactivationDelayInSeconds;
}

- (void)setReactivationDelayInSeconds:(int64_t)a3
{
  self->_int64_t reactivationDelayInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangingCallbackQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_customRangeRateTimer, 0);
}

@end