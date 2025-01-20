@interface CLAvengerScannerPolicy
+ (id)convertCLAvengerScannerPolicyScanTypeToString:(int64_t)a3;
- (BOOL)associatedTo2GHzWiFi;
- (BOOL)bluetoothAudioActive;
- (BOOL)downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
- (BOOL)hasActiveAggressiveScan;
- (BOOL)hasActiveBTFindingScan;
- (BOOL)optedIn;
- (BOOL)wifi2GHzCriticalState;
- (CLAvengerScannerPolicy)initWithDelegate:(id)a3 platformType:(int64_t)a4 supportsPerTypeDuplicateFilter:(BOOL)a5;
- (CLAvengerScannerScanParameters)currentScanParameters;
- (id).cxx_construct;
- (int64_t)currentScanType;
- (int64_t)desiredAggressiveDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)desiredBTFindingDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)desiredCoexFriendlyAggressiveDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)desiredDefaultScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)desiredHawkeyeLowEnergyScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)desiredWatchAdvertisementBufferScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)resolveNewScanTypeWithNewContext:(CLAvengerScannerPolicyContext *)a3;
- (unint64_t)totalAdvertisementBuffersAvailable;
- (void)setAssociatedTo2GHzWiFi:(BOOL)a3;
- (void)setBluetoothAudioActive:(BOOL)a3;
- (void)setOptedIn:(BOOL)a3;
- (void)setTotalAdvertisementBuffersAvailable:(unint64_t)a3;
- (void)setWifi2GHzCriticalState:(BOOL)a3;
- (void)startAggressiveScan;
- (void)startBTFindingScan;
- (void)startCoexFriendlyAggressiveScan;
- (void)startHawkeyeLowEnergyScan;
- (void)startWatchAdvertisementBufferScan;
- (void)stopAggressiveScan;
- (void)stopBTFindingScan;
- (void)stopCoexFriendlyAggressiveScan;
- (void)stopHawkeyeLowEnergyScan;
- (void)stopWatchAdvertisementBufferScan;
- (void)updateContext:(CLAvengerScannerPolicyContext *)a3;
@end

@implementation CLAvengerScannerPolicy

- (CLAvengerScannerPolicy)initWithDelegate:(id)a3 platformType:(int64_t)a4 supportsPerTypeDuplicateFilter:(BOOL)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CLAvengerScannerPolicy;
  v8 = [(CLAvengerScannerPolicy *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLAvengerScannerPolicyDelegate *)a3;
    v8->_currentContext.platformType = a4;
    v8->_currentContext.supportsPerTypeDuplicateFilter = a5;
    long long v10 = *(_OWORD *)&v8->_currentContext.watchAdvertisementBufferScanCount;
    v13[1] = *(_OWORD *)&v8->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v13[2] = v10;
    long long v11 = *(_OWORD *)&v8->_currentContext.platformType;
    v13[0] = *(_OWORD *)&v8->_currentContext.optedIn;
    v13[3] = v11;
    uint64_t v14 = *(void *)&v8->_currentContext.supportsPerTypeDuplicateFilter;
    v8->_currentScanType = [(CLAvengerScannerPolicy *)v8 resolveNewScanTypeWithNewContext:v13];
  }
  return v9;
}

- (int64_t)desiredDefaultScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  int64_t platformType = a3->platformType;
  if (platformType == 3) {
    return 2;
  }
  if (platformType != 1) {
    return 0;
  }
  unint64_t totalAdvertisementBuffersAvailable = a3->totalAdvertisementBuffersAvailable;
  if (totalAdvertisementBuffersAvailable >= 2)
  {
    BOOL v5 = !a3->optedIn;
    int64_t v6 = 6;
    int64_t v7 = 4;
    goto LABEL_8;
  }
  if (totalAdvertisementBuffersAvailable != 1) {
    return 2;
  }
  BOOL v5 = !a3->optedIn;
  int64_t v6 = 5;
  int64_t v7 = 3;
LABEL_8:
  if (v5) {
    return v7;
  }
  else {
    return v6;
  }
}

- (int64_t)desiredAggressiveDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (a3->aggressiveDiscoveryScanCount) {
    return 11;
  }
  else {
    return 0;
  }
}

- (int64_t)desiredCoexFriendlyAggressiveDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (!a3->coexFriendlyAggressiveDiscoveryScanCount) {
    return 0;
  }
  if ((!a3->associatedTo2GHzWiFi || !a3->wifi2GHzCriticalState)
    && !a3->bluetoothAudioActive
    && !a3->downgradedDuringCoexFriendlyAggressiveDiscoveryScan)
  {
    return 11;
  }
  if (!self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022B6660);
    }
    v4 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: downgrading CoexFriendlyAggressiveDiscovery scan\"}", (uint8_t *)v6, 0x12u);
    }
  }
  self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan = 1;
  return 9;
}

- (int64_t)desiredBTFindingDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (!a3->btFindingDiscoveryScanCount) {
    return 0;
  }
  if (!a3->associatedTo2GHzWiFi) {
    return 12;
  }
  if (a3->wifi2GHzCriticalState) {
    return 8;
  }
  return 10;
}

- (int64_t)desiredWatchAdvertisementBufferScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  return a3->watchAdvertisementBufferScanCount && a3->platformType == 2 && a3->totalAdvertisementBuffersAvailable;
}

- (int64_t)desiredHawkeyeLowEnergyScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (a3->hawkeyeLowEnergyScanCount) {
    return 7;
  }
  else {
    return 0;
  }
}

- (int64_t)resolveNewScanTypeWithNewContext:(CLAvengerScannerPolicyContext *)a3
{
  long long v5 = *(_OWORD *)&a3->platformType;
  v53[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v53[3] = v5;
  uint64_t v54 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  long long v6 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v53[0] = *(_OWORD *)&a3->optedIn;
  v53[1] = v6;
  if ([(CLAvengerScannerPolicy *)self desiredDefaultScanParameters:v53] < 1)
  {
    int64_t v9 = 0;
  }
  else
  {
    long long v7 = *(_OWORD *)&a3->platformType;
    v51[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v51[3] = v7;
    uint64_t v52 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    long long v8 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v51[0] = *(_OWORD *)&a3->optedIn;
    v51[1] = v8;
    int64_t v9 = [(CLAvengerScannerPolicy *)self desiredDefaultScanParameters:v51];
  }
  long long v10 = *(_OWORD *)&a3->platformType;
  v49[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v49[3] = v10;
  uint64_t v50 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  long long v11 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v49[0] = *(_OWORD *)&a3->optedIn;
  v49[1] = v11;
  if ([(CLAvengerScannerPolicy *)self desiredAggressiveDiscoveryScanParameters:v49] > v9)
  {
    long long v12 = *(_OWORD *)&a3->platformType;
    v47[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v47[3] = v12;
    uint64_t v48 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    long long v13 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v47[0] = *(_OWORD *)&a3->optedIn;
    v47[1] = v13;
    int64_t v9 = [(CLAvengerScannerPolicy *)self desiredAggressiveDiscoveryScanParameters:v47];
  }
  long long v14 = *(_OWORD *)&a3->platformType;
  v45[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v45[3] = v14;
  uint64_t v46 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  long long v15 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v45[0] = *(_OWORD *)&a3->optedIn;
  v45[1] = v15;
  if ([(CLAvengerScannerPolicy *)self desiredBTFindingDiscoveryScanParameters:v45] > v9)
  {
    long long v16 = *(_OWORD *)&a3->platformType;
    v43[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v43[3] = v16;
    uint64_t v44 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    long long v17 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v43[0] = *(_OWORD *)&a3->optedIn;
    v43[1] = v17;
    int64_t v9 = [(CLAvengerScannerPolicy *)self desiredBTFindingDiscoveryScanParameters:v43];
  }
  long long v18 = *(_OWORD *)&a3->platformType;
  v41[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v41[3] = v18;
  uint64_t v42 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  long long v19 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v41[0] = *(_OWORD *)&a3->optedIn;
  v41[1] = v19;
  if ([(CLAvengerScannerPolicy *)self desiredWatchAdvertisementBufferScanParameters:v41] > v9)
  {
    long long v20 = *(_OWORD *)&a3->platformType;
    v39[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v39[3] = v20;
    uint64_t v40 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    long long v21 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v39[0] = *(_OWORD *)&a3->optedIn;
    v39[1] = v21;
    int64_t v9 = [(CLAvengerScannerPolicy *)self desiredWatchAdvertisementBufferScanParameters:v39];
  }
  long long v22 = *(_OWORD *)&a3->platformType;
  v37[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v37[3] = v22;
  uint64_t v38 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  long long v23 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v37[0] = *(_OWORD *)&a3->optedIn;
  v37[1] = v23;
  if ([(CLAvengerScannerPolicy *)self desiredHawkeyeLowEnergyScanParameters:v37] > v9)
  {
    long long v24 = *(_OWORD *)&a3->platformType;
    v35[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v35[3] = v24;
    uint64_t v36 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    long long v25 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v35[0] = *(_OWORD *)&a3->optedIn;
    v35[1] = v25;
    int64_t v9 = [(CLAvengerScannerPolicy *)self desiredHawkeyeLowEnergyScanParameters:v35];
  }
  long long v26 = *(_OWORD *)&a3->platformType;
  v33[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v33[3] = v26;
  uint64_t v34 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  long long v27 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v33[0] = *(_OWORD *)&a3->optedIn;
  v33[1] = v27;
  if ([(CLAvengerScannerPolicy *)self desiredCoexFriendlyAggressiveDiscoveryScanParameters:v33] > v9)
  {
    long long v28 = *(_OWORD *)&a3->platformType;
    v31[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v31[3] = v28;
    uint64_t v32 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    long long v29 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v31[0] = *(_OWORD *)&a3->optedIn;
    v31[1] = v29;
    return [(CLAvengerScannerPolicy *)self desiredCoexFriendlyAggressiveDiscoveryScanParameters:v31];
  }
  return v9;
}

- (void)updateContext:(CLAvengerScannerPolicyContext *)a3
{
  *(_OWORD *)&self->_currentContext.optedIn = *(_OWORD *)&a3->optedIn;
  long long v4 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  long long v5 = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  long long v6 = *(_OWORD *)&a3->platformType;
  *(unint64_t *)((char *)&self->_currentContext.totalAdvertisementBuffersAvailable + 5) = *(unint64_t *)((char *)&a3->totalAdvertisementBuffersAvailable + 5);
  *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount = v5;
  *(_OWORD *)&self->_currentContext.int64_t platformType = v6;
  *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount = v4;
  long long v7 = *(_OWORD *)&a3->platformType;
  v10[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v10[3] = v7;
  uint64_t v11 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  long long v8 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v10[0] = *(_OWORD *)&a3->optedIn;
  v10[1] = v8;
  int64_t v9 = [(CLAvengerScannerPolicy *)self resolveNewScanTypeWithNewContext:v10];
  if (v9 != self->_currentScanType)
  {
    self->_currentScanType = v9;
    if (objc_opt_respondsToSelector()) {
      [(CLAvengerScannerPolicyDelegate *)self->_delegate scanTypeUpdated:self->_currentScanType];
    }
  }
}

- (void)startAggressiveScan
{
  if (self->_currentContext.aggressiveDiscoveryScanCount != -1)
  {
    unsigned __int8 v3 = [(CLAvengerScannerPolicy *)self hasActiveAggressiveScan];
    uint64_t v4 = *(void *)&self->_currentContext.optedIn;
    unint64_t aggressiveDiscoveryScanCount = self->_currentContext.aggressiveDiscoveryScanCount;
    long long v6 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    long long v8 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    long long v9 = v6;
    long long v10 = *(_OWORD *)&self->_currentContext.platformType;
    uint64_t v11 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    v7[0] = v4;
    v7[1] = aggressiveDiscoveryScanCount + 1;
    [(CLAvengerScannerPolicy *)self updateContext:v7];
    if ((v3 & 1) == 0)
    {
      if ([(CLAvengerScannerPolicy *)self hasActiveAggressiveScan])
      {
        if (objc_opt_respondsToSelector()) {
          [(CLAvengerScannerPolicyDelegate *)self->_delegate startedAggressiveDiscoveryScan];
        }
      }
    }
  }
}

- (void)stopAggressiveScan
{
  if (self->_currentContext.aggressiveDiscoveryScanCount)
  {
    unsigned int v3 = [(CLAvengerScannerPolicy *)self hasActiveAggressiveScan];
    uint64_t v4 = *(void *)&self->_currentContext.optedIn;
    unint64_t aggressiveDiscoveryScanCount = self->_currentContext.aggressiveDiscoveryScanCount;
    long long v6 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    long long v8 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    long long v9 = v6;
    long long v10 = *(_OWORD *)&self->_currentContext.platformType;
    uint64_t v11 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    v7[0] = v4;
    v7[1] = aggressiveDiscoveryScanCount - 1;
    [(CLAvengerScannerPolicy *)self updateContext:v7];
    if (v3)
    {
      if (![(CLAvengerScannerPolicy *)self hasActiveAggressiveScan]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [(CLAvengerScannerPolicyDelegate *)self->_delegate stoppedAggressiveDiscoveryScan];
      }
    }
  }
}

- (void)startCoexFriendlyAggressiveScan
{
  if (self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount != -1)
  {
    unsigned __int8 v3 = [(CLAvengerScannerPolicy *)self hasActiveAggressiveScan];
    long long v5 = *(_OWORD *)&self->_currentContext.optedIn;
    unint64_t coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    long long v7 = *(_OWORD *)&self->_currentContext.btFindingDiscoveryScanCount;
    long long v8 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    long long v9 = *(_OWORD *)&self->_currentContext.totalAdvertisementBuffersAvailable;
    unint64_t v6 = coexFriendlyAggressiveDiscoveryScanCount + 1;
    [(CLAvengerScannerPolicy *)self updateContext:&v5];
    if ((v3 & 1) == 0)
    {
      if ([(CLAvengerScannerPolicy *)self hasActiveAggressiveScan])
      {
        if (objc_opt_respondsToSelector()) {
          [(CLAvengerScannerPolicyDelegate *)self->_delegate startedAggressiveDiscoveryScan];
        }
      }
    }
  }
}

- (void)stopCoexFriendlyAggressiveScan
{
  if (self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount)
  {
    unsigned int v3 = [(CLAvengerScannerPolicy *)self hasActiveAggressiveScan];
    long long v7 = *(_OWORD *)&self->_currentContext.optedIn;
    unint64_t coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    long long v9 = *(_OWORD *)&self->_currentContext.btFindingDiscoveryScanCount;
    *(_OWORD *)long long v10 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    *(_OWORD *)&v10[12] = *(_OWORD *)((char *)&self->_currentContext.platformType + 4);
    BOOL downgradedDuringCoexFriendlyAggressiveDiscoveryScan = self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
    __int16 v12 = *(_WORD *)(&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 1);
    char v13 = *(&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 3);
    unint64_t v6 = coexFriendlyAggressiveDiscoveryScanCount - 1;
    if (!v6) {
      BOOL downgradedDuringCoexFriendlyAggressiveDiscoveryScan = 0;
    }
    unint64_t v8 = v6;
    BOOL v11 = downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
    [(CLAvengerScannerPolicy *)self updateContext:&v7];
    if (v3
      && ![(CLAvengerScannerPolicy *)self hasActiveAggressiveScan]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(CLAvengerScannerPolicyDelegate *)self->_delegate stoppedAggressiveDiscoveryScan];
    }
  }
}

- (BOOL)hasActiveAggressiveScan
{
  return self->_currentContext.aggressiveDiscoveryScanCount
      || self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount != 0;
}

- (void)startBTFindingScan
{
  unint64_t btFindingDiscoveryScanCount = self->_currentContext.btFindingDiscoveryScanCount;
  if (btFindingDiscoveryScanCount != -1)
  {
    long long v15 = *(_OWORD *)&self->_currentContext.optedIn;
    unint64_t coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    long long v4 = *(_OWORD *)&self->_currentContext.platformType;
    long long v12 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    long long v13 = v4;
    uint64_t v14 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    unint64_t v5 = btFindingDiscoveryScanCount + 1;
    if (!btFindingDiscoveryScanCount && (objc_opt_respondsToSelector() & 1) != 0) {
      [(CLAvengerScannerPolicyDelegate *)self->_delegate startedBTFindingDiscoveryScan];
    }
    long long v6 = v15;
    unint64_t v7 = coexFriendlyAggressiveDiscoveryScanCount;
    unint64_t v8 = v5;
    long long v9 = v12;
    long long v10 = v13;
    uint64_t v11 = v14;
    [(CLAvengerScannerPolicy *)self updateContext:&v6];
  }
}

- (void)stopBTFindingScan
{
  unint64_t btFindingDiscoveryScanCount = self->_currentContext.btFindingDiscoveryScanCount;
  if (btFindingDiscoveryScanCount)
  {
    long long v7 = *(_OWORD *)&self->_currentContext.optedIn;
    unint64_t coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    long long v5 = *(_OWORD *)&self->_currentContext.platformType;
    long long v10 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    long long v11 = v5;
    uint64_t v12 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    unint64_t v6 = btFindingDiscoveryScanCount - 1;
    unint64_t v8 = coexFriendlyAggressiveDiscoveryScanCount;
    unint64_t v9 = btFindingDiscoveryScanCount - 1;
    [(CLAvengerScannerPolicy *)self updateContext:&v7];
    if (!v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      [(CLAvengerScannerPolicyDelegate *)self->_delegate stoppedBTFindingDiscoveryScan];
    }
  }
}

- (void)startWatchAdvertisementBufferScan
{
  unint64_t watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
  if (watchAdvertisementBufferScanCount != -1)
  {
    long long v3 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v4[0] = *(_OWORD *)&self->_currentContext.optedIn;
    v4[1] = v3;
    long long v6 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    long long v7 = *(_OWORD *)&self->_currentContext.totalAdvertisementBuffersAvailable;
    unint64_t v5 = watchAdvertisementBufferScanCount + 1;
    [(CLAvengerScannerPolicy *)self updateContext:v4];
  }
}

- (void)stopWatchAdvertisementBufferScan
{
  unint64_t watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
  if (watchAdvertisementBufferScanCount)
  {
    long long v3 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v4[0] = *(_OWORD *)&self->_currentContext.optedIn;
    v4[1] = v3;
    long long v6 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    long long v7 = *(_OWORD *)&self->_currentContext.totalAdvertisementBuffersAvailable;
    unint64_t v5 = watchAdvertisementBufferScanCount - 1;
    [(CLAvengerScannerPolicy *)self updateContext:v4];
  }
}

- (void)startHawkeyeLowEnergyScan
{
  unint64_t hawkeyeLowEnergyScanCount = self->_currentContext.hawkeyeLowEnergyScanCount;
  if (hawkeyeLowEnergyScanCount != -1)
  {
    long long v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    long long v13 = *(_OWORD *)&self->_currentContext.optedIn;
    long long v14 = v4;
    unint64_t watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
    long long v11 = *(_OWORD *)&self->_currentContext.platformType;
    uint64_t v12 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    unint64_t v5 = hawkeyeLowEnergyScanCount + 1;
    if (!hawkeyeLowEnergyScanCount && (objc_opt_respondsToSelector() & 1) != 0) {
      [(CLAvengerScannerPolicyDelegate *)self->_delegate startedHawkeyeLowEnergyScan];
    }
    v6[0] = v13;
    v6[1] = v14;
    unint64_t v7 = watchAdvertisementBufferScanCount;
    unint64_t v8 = v5;
    long long v9 = v11;
    uint64_t v10 = v12;
    [(CLAvengerScannerPolicy *)self updateContext:v6];
  }
}

- (void)stopHawkeyeLowEnergyScan
{
  unint64_t hawkeyeLowEnergyScanCount = self->_currentContext.hawkeyeLowEnergyScanCount;
  if (hawkeyeLowEnergyScanCount)
  {
    long long v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v7[0] = *(_OWORD *)&self->_currentContext.optedIn;
    v7[1] = v4;
    unint64_t watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
    long long v10 = *(_OWORD *)&self->_currentContext.platformType;
    uint64_t v11 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    unint64_t v6 = hawkeyeLowEnergyScanCount - 1;
    unint64_t v8 = watchAdvertisementBufferScanCount;
    unint64_t v9 = hawkeyeLowEnergyScanCount - 1;
    [(CLAvengerScannerPolicy *)self updateContext:v7];
    if (!v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      [(CLAvengerScannerPolicyDelegate *)self->_delegate stoppedHawkeyeLowEnergyScan];
    }
  }
}

- (BOOL)hasActiveBTFindingScan
{
  return self->_currentContext.btFindingDiscoveryScanCount != 0;
}

- (BOOL)optedIn
{
  return self->_currentContext.optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = *(_OWORD *)((char *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount + 1);
  long long v6 = *(_OWORD *)((char *)&self->_currentContext.watchAdvertisementBufferScanCount + 1);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)((char *)&self->_currentContext.platformType + 1);
  *(void *)&v7[15] = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
  long long v4 = *(_OWORD *)(&self->_currentContext.optedIn + 1);
  [(CLAvengerScannerPolicy *)self updateContext:&v3];
}

- (BOOL)associatedTo2GHzWiFi
{
  return self->_currentContext.associatedTo2GHzWiFi;
}

- (void)setAssociatedTo2GHzWiFi:(BOOL)a3
{
  long long v3 = *(_OWORD *)&self->_currentContext.platformType;
  v5[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  v5[3] = v3;
  BOOL supportsPerTypeDuplicateFilter = self->_currentContext.supportsPerTypeDuplicateFilter;
  long long v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v5[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v5[1] = v4;
  int v8 = *(_DWORD *)&self->_currentContext.wifi2GHzCriticalState;
  __int16 v9 = *((_WORD *)&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 1);
  BOOL v7 = a3;
  [(CLAvengerScannerPolicy *)self updateContext:v5];
}

- (BOOL)wifi2GHzCriticalState
{
  return self->_currentContext.wifi2GHzCriticalState;
}

- (void)setWifi2GHzCriticalState:(BOOL)a3
{
  long long v3 = *(_OWORD *)&self->_currentContext.platformType;
  v5[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  v5[3] = v3;
  __int16 v6 = *(_WORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
  long long v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v5[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v5[1] = v4;
  BOOL v7 = a3;
  int v8 = *(_DWORD *)&self->_currentContext.bluetoothAudioActive;
  char v9 = *(&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 3);
  [(CLAvengerScannerPolicy *)self updateContext:v5];
}

- (BOOL)bluetoothAudioActive
{
  return self->_currentContext.bluetoothAudioActive;
}

- (void)setBluetoothAudioActive:(BOOL)a3
{
  long long v3 = *(_OWORD *)&self->_currentContext.platformType;
  _OWORD v6[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  *(_OWORD *)BOOL v7 = v3;
  *(_DWORD *)&v7[15] = *(_DWORD *)((char *)&self->_currentContext.totalAdvertisementBuffersAvailable + 7);
  long long v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v6[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v6[1] = v4;
  int v5 = *(_DWORD *)&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
  BOOL v8 = a3;
  int v9 = v5;
  [(CLAvengerScannerPolicy *)self updateContext:v6];
}

- (BOOL)downgradedDuringCoexFriendlyAggressiveDiscoveryScan
{
  return self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
}

- (unint64_t)totalAdvertisementBuffersAvailable
{
  return self->_currentContext.totalAdvertisementBuffersAvailable;
}

- (void)setTotalAdvertisementBuffersAvailable:(unint64_t)a3
{
  long long v3 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v5[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  uint64_t v4 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
  int64_t platformType = self->_currentContext.platformType;
  unint64_t v7 = a3;
  uint64_t v8 = v4;
  [(CLAvengerScannerPolicy *)self updateContext:v5];
}

- (CLAvengerScannerScanParameters)currentScanParameters
{
  switch(self[2].var2)
  {
    case 0:
      *(_WORD *)&retstr->var0 = 0;
      *(void *)&long long v3 = 0xFFFFLL;
      *((void *)&v3 + 1) = 0xFFFFLL;
      goto LABEL_19;
    case 1:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      long long v4 = xmmword_101D219D0;
      goto LABEL_9;
    case 2:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      int64x2_t v5 = (int64x2_t)xmmword_101D219C0;
      goto LABEL_17;
    case 3:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      retstr->var2 = 300;
      retstr->var3 = 0;
      int64_t v6 = 5;
      goto LABEL_20;
    case 4:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      retstr->var2 = 300;
      retstr->var3 = 0;
      int64_t v6 = 7;
      goto LABEL_20;
    case 5:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      *(_OWORD *)&retstr->var2 = xmmword_101D21990;
      long long v7 = xmmword_101D219B0;
      goto LABEL_10;
    case 6:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      long long v4 = xmmword_101D21990;
LABEL_9:
      *(_OWORD *)&retstr->var2 = v4;
      long long v7 = xmmword_101D219A0;
LABEL_10:
      *(_OWORD *)&retstr->var4 = v7;
      return self;
    case 7:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      unint64_t v8 = 300;
      goto LABEL_16;
    case 8:
      *(_WORD *)&retstr->var0 = 257;
      long long v3 = xmmword_101D21980;
      goto LABEL_19;
    case 9:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      unint64_t v8 = 90;
      goto LABEL_16;
    case 0xALL:
      *(_WORD *)&retstr->var0 = 257;
      long long v3 = xmmword_101D21970;
      goto LABEL_19;
    case 0xBLL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      unint64_t v8 = 30;
LABEL_16:
      int64x2_t v5 = vdupq_n_s64(v8);
LABEL_17:
      *(int64x2_t *)&retstr->var2 = v5;
      retstr->var4 = 0;
      retstr->var5 = 0;
      break;
    case 0xCLL:
      *(_WORD *)&retstr->var0 = 257;
      long long v3 = xmmword_101D21960;
LABEL_19:
      *(_OWORD *)&retstr->var2 = v3;
      int64_t v6 = 4 * (self[1].var5 != 0);
LABEL_20:
      retstr->var4 = 0;
      retstr->var5 = v6;
      break;
    default:
      return self;
  }
  return self;
}

+ (id)convertCLAvengerScannerPolicyScanTypeToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xB) {
    return @"Off";
  }
  else {
    return *(&off_1022B6680 + a3 - 1);
  }
}

- (int64_t)currentScanType
{
  return self->_currentScanType;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 16) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 69) = 0u;
  return self;
}

@end