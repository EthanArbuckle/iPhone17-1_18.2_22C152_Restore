@interface PRSharingSession
- (BOOL)addRssiSample:(double)a3 channel:(unsigned int)a4 forPeer:(id)a5 peerDeviceModel:(id)a6 withError:(id *)a7;
- (BOOL)trackNewBTPeer:(id)a3 withDviceModel:(id)a4 error:(id *)a5;
- (PRSharingSession)init;
- (PRSharingSession)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (PRSharingSessionDelegate)delegate;
- (void)beacon:(id)a3 didChangeState:(unint64_t)a4;
- (void)beacon:(id)a3 didFailWithError:(id)a4;
- (void)beacon:(id)a3 didOutputRangeResults:(id)a4;
- (void)didFailWithError:(id)a3;
- (void)estimator:(id)a3 didEstimateProximity:(int64_t)a4 toPeer:(id)a5;
- (void)invokeDelegateBlock:(id)a3;
- (void)logScores:(id)a3;
- (void)onNewSharingChoiceScores:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startInitiating;
- (void)startWatchDogWithDuration:(int64_t)a3;
- (void)stopInitiating;
- (void)stopProx;
- (void)watchDogTimedOut;
@end

@implementation PRSharingSession

- (PRSharingSession)init
{
  return 0;
}

- (void)watchDogTimedOut
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double MachTimeSeconds = PRCommonGetMachTimeSeconds();
  double MachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = MachTimeSeconds;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "Watchdog timed out %lf", (uint8_t *)&v6, 0xCu);
  }
  [(PRSharingChoice *)self->_sharingChoiceEstimator heartbeatTimeout:1 currentMachContTime:MachTimeSeconds useUpdatedScores:MachContinuousTimeSeconds];
  if ([(PRSharingChoice *)self->_sharingChoiceEstimator currentlyInitiating]) {
    [(PRSharingSession *)self startWatchDogWithDuration:1000000000];
  }
}

- (void)startWatchDogWithDuration:(int64_t)a3
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PRSharingSession_startWatchDogWithDuration___block_invoke;
  v8[3] = &unk_1E5999DA8;
  objc_copyWeak(&v9, &location);
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, v8);
  id reportWatchdog = self->_reportWatchdog;
  self->_id reportWatchdog = v5;

  dispatch_time_t v7 = dispatch_time(0, a3);
  dispatch_after(v7, (dispatch_queue_t)self->_delegateQueue, self->_reportWatchdog);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__PRSharingSession_startWatchDogWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained watchDogTimedOut];
}

- (PRSharingSession)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PRSharingSession.mm", 75, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)PRSharingSession;
  id v9 = [(PRSharingSession *)&v33 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v7);
    objc_storeStrong((id *)&v10->_delegateQueue, a4);
    v10->_needToRestart = 0;
    v10->_scoresReported = 0;
    os_log_t v11 = os_log_create("com.apple.proximity", "PRSharingSession");
    logger = v10->_logger;
    v10->_logger = (OS_os_log *)v11;

    objc_initWeak(&location, v10);
    if (+[PRRangingDevice isSupported])
    {
      v13 = [[PRBeacon alloc] initWithDelegate:v10 queue:v10->_delegateQueue];
      nearbyDaemonSession = v10->_nearbyDaemonSession;
      v10->_nearbyDaemonSession = v13;
    }
    v15 = [[PRSharingChoice alloc] initWithQueue:v10->_delegateQueue];
    sharingChoiceEstimator = v10->_sharingChoiceEstimator;
    v10->_sharingChoiceEstimator = v15;

    [(PRSharingChoice *)v10->_sharingChoiceEstimator setCurrentlyInitiating:0];
    [(PRSharingChoice *)v10->_sharingChoiceEstimator setLogger:v10->_logger];
    v17 = v10->_sharingChoiceEstimator;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __51__PRSharingSession_initWithDelegate_delegateQueue___block_invoke;
    v30[3] = &unk_1E5999DD0;
    objc_copyWeak(&v31, &location);
    [(PRSharingChoice *)v17 setNewScoresHandler:v30];
    v18 = [[PRProximityEstimator alloc] initSingleThresholdEstmatorWithDelegate:v10 delegateQueue:v10->_delegateQueue];
    btProxEstimator = v10->_btProxEstimator;
    v10->_btProxEstimator = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedBTPeers = v10->_trackedBTPeers;
    v10->_trackedBTPeers = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedBTPeersDevice = v10->_trackedBTPeersDevice;
    v10->_trackedBTPeersDevice = v22;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PRSharingSession_initWithDelegate_delegateQueue___block_invoke_2;
    block[3] = &unk_1E5999DA8;
    objc_copyWeak(&v29, &location);
    dispatch_block_t v24 = dispatch_block_create((dispatch_block_flags_t)0, block);
    id reportWatchdog = v10->_reportWatchdog;
    v10->_id reportWatchdog = v24;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __51__PRSharingSession_initWithDelegate_delegateQueue___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained onNewSharingChoiceScores:v3];
}

void __51__PRSharingSession_initWithDelegate_delegateQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained watchDogTimedOut];
}

- (void)startInitiating
{
  [(PRSharingChoice *)self->_sharingChoiceEstimator createEstimators];
  [(PRBeacon *)self->_nearbyDaemonSession startBeaconingWithOptions:0];
  [(PRSharingChoice *)self->_sharingChoiceEstimator setCurrentlyInitiating:1];
  [(PRSharingSession *)self startWatchDogWithDuration:0];
}

- (void)stopInitiating
{
  self->_scoresReported = 0;
}

- (BOOL)addRssiSample:(double)a3 channel:(unsigned int)a4 forPeer:(id)a5 peerDeviceModel:(id)a6 withError:(id *)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PRSharingSession.mm", 133, @"Invalid parameter not satisfying: %@", @"peerMacAddress" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  id v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"PRSharingSession.mm", 134, @"Invalid parameter not satisfying: %@", @"deviceModel" object file lineNumber description];

LABEL_3:
  if ([v13 length] != 6)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PRSharingSession.mm", 135, @"Invalid parameter not satisfying: %@", @"[peerMacAddress length] == BT_MAC_LEN" object file lineNumber description];
  }
  BOOL v16 = [(PRSharingChoice *)self->_sharingChoiceEstimator currentlyInitiating];
  if (v16)
  {
    v17 = self->_logger;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v34 = v13;
      __int16 v35 = 2080;
      uint64_t v36 = [v15 UTF8String];
      __int16 v37 = 1024;
      int v38 = v9;
      __int16 v39 = 2048;
      double v40 = a3;
      _os_log_impl(&dword_19DFF5000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "new RSSI sample:\n MAC address: %@\n model: %s\n channel: %d\n rssi: %f", buf, 0x26u);
    }

    v18 = [(NSMutableDictionary *)self->_trackedBTPeers objectForKeyedSubscript:v13];
    BOOL v19 = v18 == 0;

    if (v19)
    {
      if ([(PRSharingSession *)self trackNewBTPeer:v13 withDviceModel:v15 error:a7])
      {
        goto LABEL_18;
      }
    }
    else
    {
      v20 = [(NSMutableDictionary *)self->_trackedBTPeersDevice objectForKeyedSubscript:v13];
      int v21 = [v15 isEqualToString:v20];

      btProxEstimator = self->_btProxEstimator;
      if (v21)
      {
        v23 = +[PRSharingSessionHelper NSDataMacToUUID:v13];
        [(PRProximityEstimator *)btProxEstimator addRssiSample:v9 channel:v23 forPeer:a7 withError:a3];
LABEL_19:

        goto LABEL_20;
      }
      v25 = +[PRSharingSessionHelper NSDataMacToUUID:v13];
      [(PRProximityEstimator *)btProxEstimator stopEstimatingProximityFor:v25 withError:a7];

      if ([(PRSharingSession *)self trackNewBTPeer:v13 withDviceModel:v15 error:a7])
      {
LABEL_18:
        v26 = self->_btProxEstimator;
        v23 = +[PRSharingSessionHelper NSDataMacToUUID:v13];
        [(PRProximityEstimator *)v26 addRssiSample:v9 channel:v23 forPeer:a7 withError:a3];
        goto LABEL_19;
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      -[PRSharingSession addRssiSample:channel:forPeer:peerDeviceModel:withError:]();
    }
    if (a7)
    {
      dispatch_block_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32 = @"Failed to initiate prior to adding sample";
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      *a7 = [v24 errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:202 userInfo:v23];
      goto LABEL_19;
    }
  }
LABEL_20:

  return v16;
}

- (BOOL)trackNewBTPeer:(id)a3 withDviceModel:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  os_log_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PRSharingSession.mm", 185, @"Invalid parameter not satisfying: %@", @"peerMacAddress" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PRSharingSession.mm", 186, @"Invalid parameter not satisfying: %@", @"deviceModel" object file lineNumber description];

LABEL_3:
  if (self->_scoresReported)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      -[PRSharingSession trackNewBTPeer:withDviceModel:error:]();
    }
    [(PRSharingChoice *)self->_sharingChoiceEstimator reportScoresToClientAlways:1 useUpdatedScoreList:0 currentMachContTime:PRCommonGetMachContinuousTimeSeconds()];
  }
  btProxEstimator = self->_btProxEstimator;
  id v13 = +[PRSharingSessionHelper NSDataMacToUUID:v9];
  BOOL v14 = [(PRProximityEstimator *)btProxEstimator startEstimatingProximityFor:v13 peerDeviceModel:v11 withError:a5];

  if (v14)
  {
    [(NSMutableDictionary *)self->_trackedBTPeers setObject:&unk_1EF0978F8 forKeyedSubscript:v9];
    [(NSMutableDictionary *)self->_trackedBTPeersDevice setObject:v11 forKeyedSubscript:v9];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      -[PRSharingSession trackNewBTPeer:withDviceModel:error:]();
    }
    if (a5)
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = @"Failed to start estimating proximity to peer";
      BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *a5 = [v15 errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:202 userInfo:v16];
    }
  }

  return v14;
}

- (void)stopProx
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl(&dword_19DFF5000, log, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
}

- (void)logScores:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    for (unint64_t i = 0; i < [v4 count]; ++i)
    {
      kdebug_trace();
      int v6 = [MEMORY[0x1E4F28E78] string];
      [v6 appendFormat:@"New scores: "];
      id v7 = [v4 objectAtIndexedSubscript:i];
      uint64_t v8 = [v7 btAddress];
      [v6 appendFormat:@"mac address: %@, ", v8];

      [v7 score];
      [v6 appendFormat:@"score: %f, ", v9];
      id v10 = [v7 angle];
      LOBYTE(v8) = v10 == 0;

      if (v8)
      {
        [v6 appendFormat:@"angle degrees: nil, "];
        [v6 appendFormat:@"angle uncertainty: nil, "];
      }
      else
      {
        os_log_t v11 = [v7 angle];
        [v11 measurement];
        [v6 appendFormat:@"angle degrees: %f, ", v12];

        id v13 = [v7 angle];
        [v13 uncertainty];
        [v6 appendFormat:@"angle uncertainty: %f, ", v14];

        [v7 timestamp];
        [v6 appendFormat:@"#bighead_test mach_abs_time: %f, ", v15];
      }
      BOOL v16 = [v7 range];
      BOOL v17 = v16 == 0;

      if (v17)
      {
        [v6 appendFormat:@"range meters: nil, "];
        [v6 appendFormat:@"range uncertainty: nil, "];
      }
      else
      {
        v18 = [v7 range];
        [v18 measurement];
        [v6 appendFormat:@"range meters: %f, ", v19];

        uint64_t v20 = [v7 range];
        [v20 uncertainty];
        [v6 appendFormat:@"range uncertainty: %f, ", v21];
      }
      v22 = +[PRSharingSessionHelper ProxToString:](PRSharingSessionHelper, "ProxToString:", [v7 proximity]);
      [v6 appendFormat:@"prox: %@, ", v22];

      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      kdebug_trace();
    }
  }
  else
  {
    dispatch_block_t v24 = self->_logger;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DFF5000, v24, OS_LOG_TYPE_DEFAULT, "New scores: empty list", buf, 2u);
    }
  }
}

- (void)estimator:(id)a3 didEstimateProximity:(int64_t)a4 toPeer:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = +[PRSharingSessionHelper UUIDToNSDataMac:v7 len:6];
  uint64_t v9 = [(NSMutableDictionary *)self->_trackedBTPeers objectForKeyedSubscript:v8];

  if (v9)
  {
    double v28 = 0.0;
    double v29 = 0.0;
    if (PRCommonGetAllTimes(0, &v29, &v28))
    {
      id v10 = [NSNumber numberWithInteger:a4];
      [(NSMutableDictionary *)self->_trackedBTPeers setObject:v10 forKeyedSubscript:v8];

      os_log_t v11 = +[PRSharingSessionHelper reverseNSData:v8];
      +[PRSharingSessionHelper UIntToHexString:len:](PRSharingSessionHelper, "UIntToHexString:len:", +[PRSharingSessionHelper NSDataToUInt64:v11], 6);
      double v12 = v29;
      std::string v24 = buf;
      *(double *)&long long v25 = v29;
      WORD4(v25) = 0;
      long long v26 = xmmword_19E02CDC0;
      v27[0] = 1;
      *(_DWORD *)&v27[4] = +[PRSharingSessionHelper ProxToCoarseRange:a4];
      *(_WORD *)&v27[24] = 0;
      v27[8] = 0;
      *(void *)&v27[16] = 0;
      sharingChoiceEstimator = self->_sharingChoiceEstimator;
      int v14 = SHIBYTE(v24.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v24;
      }
      long long v21 = v25;
      long long v22 = v26;
      v23[0] = *(_OWORD *)v27;
      *(_OWORD *)((char *)v23 + 10) = *(_OWORD *)&v27[10];
      [(PRSharingChoice *)sharingChoiceEstimator addBluetoothProximityEstimate:&__p currentMachContTime:v28];
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      BOOL v16 = self->_logger;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = +[PRSharingSessionHelper ProxToString:a4];
        v18 = (void *)v17;
        uint64_t v19 = (std::string *)v24.__r_.__value_.__r.__words[0];
        if (v14 >= 0) {
          uint64_t v19 = &v24;
        }
        LODWORD(buf.__r_.__value_.__l.__data_) = 138412802;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v17;
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v19;
        HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
        double v31 = v12;
        _os_log_impl(&dword_19DFF5000, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "PTS: BT Prox estimate of %@ for device %s at time %f", (uint8_t *)&buf, 0x20u);
      }
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24.__r_.__value_.__l.__data_);
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      -[PRSharingSession estimator:didEstimateProximity:toPeer:]();
    }
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR)) {
      -[PRSharingSession estimator:didEstimateProximity:toPeer:]((uint64_t)v8, logger);
    }
  }
}

- (void)beacon:(id)a3 didOutputRangeResults:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  [(PRSharingChoice *)self->_sharingChoiceEstimator addRoseSolutions:v5 currentMachContTime:PRCommonGetMachContinuousTimeSeconds()];
  kdebug_trace();
}

- (void)beacon:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "PRSharingSession: PRBeaconStateUnknown", buf, 2u);
      }
      if (![(PRSharingChoice *)self->_sharingChoiceEstimator currentlyInitiating]) {
        goto LABEL_7;
      }
      uint64_t v8 = self->_logger;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_WORD *)std::string buf = 0;
      goto LABEL_22;
    case 1uLL:
      uint64_t v9 = self->_logger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_19DFF5000, v9, OS_LOG_TYPE_DEFAULT, "PRSharingSession: PRBeaconStateIdle", buf, 2u);
      }
      if (self->_needToRestart)
      {
        id v10 = self->_logger;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)std::string buf = 0;
          _os_log_impl(&dword_19DFF5000, v10, OS_LOG_TYPE_DEFAULT, "PRSharingSession: Attempting to restart initiator session", buf, 2u);
        }
        [(PRSharingSession *)self startInitiating];
      }
      a4 = 1;
      goto LABEL_26;
    case 2uLL:
      os_log_t v11 = self->_logger;
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      BOOL v13 = 0;
      if (v12)
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_19DFF5000, v11, OS_LOG_TYPE_DEFAULT, "PRSharingSession: PRBeaconStateBeaconing", buf, 2u);
        BOOL v13 = 0;
      }
      goto LABEL_24;
    case 3uLL:
      int v14 = self->_logger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_19DFF5000, v14, OS_LOG_TYPE_DEFAULT, "PRSharingSession: PRBeaconStateUnavailable", buf, 2u);
      }
      if ([(PRSharingChoice *)self->_sharingChoiceEstimator currentlyInitiating])
      {
        uint64_t v8 = self->_logger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)std::string buf = 0;
LABEL_22:
          _os_log_impl(&dword_19DFF5000, v8, OS_LOG_TYPE_DEFAULT, "PRSharingSession: Need to restart!", buf, 2u);
        }
LABEL_23:
        BOOL v13 = 1;
LABEL_24:
        self->_needToRestart = v13;
      }
      else
      {
        a4 = 3;
      }
LABEL_26:
      uint64_t v15 = [(PRSharingSession *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __42__PRSharingSession_beacon_didChangeState___block_invoke;
        v17[3] = &unk_1E5999DF8;
        v17[4] = self;
        v17[5] = a4;
        [(PRSharingSession *)self invokeDelegateBlock:v17];
      }

      return;
    default:
LABEL_7:
      a4 = 0;
      goto LABEL_26;
  }
}

void __42__PRSharingSession_beacon_didChangeState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  [WeakRetained session:*(void *)(a1 + 32) didChangeProximitySensorState:*(void *)(a1 + 40)];
}

- (void)beacon:(id)a3 didFailWithError:(id)a4
{
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PRSharingSession_didFailWithError___block_invoke;
  v6[3] = &unk_1E5999E20;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PRSharingSession *)self invokeDelegateBlock:v6];
}

void __37__PRSharingSession_didFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  [WeakRetained session:*(void *)(a1 + 32) didFailwithError:*(void *)(a1 + 40)];
}

- (void)onNewSharingChoiceScores:(id)a3
{
  id v4 = a3;
  [(PRSharingSession *)self logScores:v4];
  if (!self->_scoresReported && [v4 count]) {
    self->_scoresReported = 1;
  }
  dispatch_block_cancel(self->_reportWatchdog);
  if ([(PRSharingChoice *)self->_sharingChoiceEstimator currentlyInitiating]) {
    [(PRSharingSession *)self startWatchDogWithDuration:1000000000];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PRSharingSession_onNewSharingChoiceScores___block_invoke;
  v6[3] = &unk_1E5999E20;
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = self;
  [(PRSharingSession *)self invokeDelegateBlock:v6];
}

void __45__PRSharingSession_onNewSharingChoiceScores___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 88));
  [WeakRetained session:*(void *)(a1 + 40) didEstimateScores:*(void *)(a1 + 32)];
}

- (void)invokeDelegateBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  delegateQueue = self->_delegateQueue;
  id v6 = v4;
  if (delegateQueue) {
    dispatch_async(delegateQueue, v4);
  }
  else {
    v4[2](v4);
  }
}

- (PRSharingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRSharingSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sharingChoiceEstimator, 0);
  objc_storeStrong(&self->_reportWatchdog, 0);
  objc_storeStrong((id *)&self->_nearbyDaemonSession, 0);
  objc_storeStrong((id *)&self->_trackedBTPeersDevice, 0);
  objc_storeStrong((id *)&self->_trackedBTPeers, 0);
  objc_storeStrong((id *)&self->_btProxEstimator, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)addRssiSample:channel:forPeer:peerDeviceModel:withError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19DFF5000, v0, v1, "Failed to initiate prior to adding sample", v2, v3, v4, v5, v6);
}

- (void)trackNewBTPeer:withDviceModel:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19DFF5000, v0, v1, "Failed to start estimating proximity to peer", v2, v3, v4, v5, v6);
}

- (void)trackNewBTPeer:withDviceModel:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_19DFF5000, v0, OS_LOG_TYPE_DEBUG, "Tracking a new BT Peer. Reporting scores immediately.", v1, 2u);
}

- (void)estimator:(uint64_t)a1 didEstimateProximity:(NSObject *)a2 toPeer:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19DFF5000, a2, OS_LOG_TYPE_ERROR, "PTS: Received Proximity estimation for a device we are not tracking: %@", (uint8_t *)&v2, 0xCu);
}

- (void)estimator:didEstimateProximity:toPeer:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19DFF5000, v0, v1, "PTS: Unable to get absolute time stamp", v2, v3, v4, v5, v6);
}

@end