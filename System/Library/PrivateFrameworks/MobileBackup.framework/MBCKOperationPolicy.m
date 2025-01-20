@interface MBCKOperationPolicy
+ (id)authPromptReason;
+ (id)expensiveCellularPolicy;
+ (int64_t)defaultQualityOfService;
- (BOOL)automaticallyRetryNetworkFailures;
- (BOOL)fetchAssets;
- (MBCKOperationPolicy)init;
- (MBCellularAccess)cellularAccess;
- (double)retryAfterInterval;
- (double)timeoutIntervalForFetch;
- (double)timeoutIntervalForModify;
- (id)copyWithZone:(_NSZone *)a3;
- (id)operationGroupWithName:(id)a3;
- (id)operationGroupWithName:(id)a3 processName:(id)a4;
- (int64_t)maxBatchCount;
- (int64_t)maxBatchSize;
- (int64_t)maxRetryAttempts;
- (int64_t)qualityOfService;
- (int64_t)recordSavePolicy;
- (unint64_t)maxBatchFetchAssetSize;
- (unint64_t)maxBatchSaveAssetSize;
- (void)setAutomaticallyRetryNetworkFailures:(BOOL)a3;
- (void)setCellularAccess:(id)a3;
- (void)setFetchAssets:(BOOL)a3;
- (void)setMaxBatchCount:(int64_t)a3;
- (void)setMaxBatchFetchAssetSize:(unint64_t)a3;
- (void)setMaxBatchSaveAssetSize:(unint64_t)a3;
- (void)setMaxBatchSize:(int64_t)a3;
- (void)setMaxRetryAttempts:(int64_t)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRecordSavePolicy:(int64_t)a3;
- (void)setRetryAfterInterval:(double)a3;
- (void)setTimeoutIntervalForFetch:(double)a3;
- (void)setTimeoutIntervalForModify:(double)a3;
@end

@implementation MBCKOperationPolicy

+ (int64_t)defaultQualityOfService
{
  return 17;
}

+ (id)authPromptReason
{
  if (qword_1004827E8 != -1) {
    dispatch_once(&qword_1004827E8, &stru_100417580);
  }
  v2 = (void *)qword_1004827E0;
  return v2;
}

+ (id)expensiveCellularPolicy
{
  v2 = objc_opt_new();
  v3 = +[MBCellularAccess expensiveCellularAccess];
  [v2 setCellularAccess:v3];

  return v2;
}

- (MBCKOperationPolicy)init
{
  v12.receiver = self;
  v12.super_class = (Class)MBCKOperationPolicy;
  v2 = [(MBCKOperationPolicy *)&v12 init];
  if (v2)
  {
    if (qword_100482818 != -1) {
      dispatch_once(&qword_100482818, &stru_1004175A0);
    }
    *((_WORD *)v2 + 4) = 256;
    *((void *)v2 + 3) = [(id)objc_opt_class() defaultQualityOfService];
    *((void *)v2 + 4) = 2;
    uint64_t v3 = qword_1004827F8;
    *((void *)v2 + 5) = qword_1004827F0;
    *((void *)v2 + 6) = v3;
    uint64_t v4 = qword_100482808;
    *((void *)v2 + 7) = qword_100482800;
    *((void *)v2 + 8) = v4;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v2 + 72) = _Q0;
    uint64_t v10 = qword_100482810;
    *((void *)v2 + 11) = 0x3FF0000000000000;
    *((void *)v2 + 12) = v10;
  }
  return (MBCKOperationPolicy *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(MBCKOperationPolicy *)self cellularAccess];
  id v6 = [v5 copy];
  [v4 setCellularAccess:v6];

  objc_msgSend(v4, "setAutomaticallyRetryNetworkFailures:", -[MBCKOperationPolicy automaticallyRetryNetworkFailures](self, "automaticallyRetryNetworkFailures"));
  objc_msgSend(v4, "setFetchAssets:", -[MBCKOperationPolicy fetchAssets](self, "fetchAssets"));
  objc_msgSend(v4, "setQualityOfService:", -[MBCKOperationPolicy qualityOfService](self, "qualityOfService"));
  objc_msgSend(v4, "setRecordSavePolicy:", -[MBCKOperationPolicy recordSavePolicy](self, "recordSavePolicy"));
  objc_msgSend(v4, "setMaxBatchCount:", -[MBCKOperationPolicy maxBatchCount](self, "maxBatchCount"));
  objc_msgSend(v4, "setMaxBatchSize:", -[MBCKOperationPolicy maxBatchSize](self, "maxBatchSize"));
  objc_msgSend(v4, "setMaxBatchFetchAssetSize:", -[MBCKOperationPolicy maxBatchFetchAssetSize](self, "maxBatchFetchAssetSize"));
  objc_msgSend(v4, "setMaxBatchSaveAssetSize:", -[MBCKOperationPolicy maxBatchSaveAssetSize](self, "maxBatchSaveAssetSize"));
  [(MBCKOperationPolicy *)self timeoutIntervalForFetch];
  objc_msgSend(v4, "setTimeoutIntervalForFetch:");
  [(MBCKOperationPolicy *)self timeoutIntervalForModify];
  objc_msgSend(v4, "setTimeoutIntervalForModify:");
  [(MBCKOperationPolicy *)self retryAfterInterval];
  objc_msgSend(v4, "setRetryAfterInterval:");
  objc_msgSend(v4, "setMaxRetryAttempts:", -[MBCKOperationPolicy maxRetryAttempts](self, "maxRetryAttempts"));
  return v4;
}

- (id)operationGroupWithName:(id)a3 processName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  v9 = [(MBCKOperationPolicy *)self cellularAccess];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = [v9 allowsExpensiveNetworkAccess];
    [v8 setAllowsCellularAccess:1];
    [v8 setAllowsExpensiveNetworkAccess:v11];
  }
  else
  {
    [v8 setAllowsCellularAccess:0];
    LODWORD(v11) = 0;
  }
  objc_msgSend(v8, "setQualityOfService:", -[MBCKOperationPolicy qualityOfService](self, "qualityOfService"));
  [v8 setDiscretionaryNetworkBehavior:0];
  objc_msgSend(v8, "setAutomaticallyRetryNetworkFailures:", -[MBCKOperationPolicy automaticallyRetryNetworkFailures](self, "automaticallyRetryNetworkFailures"));
  objc_super v12 = objc_opt_new();
  if (v6 && v7)
  {
    id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%@|%@", v6, v7];

    id v6 = v13;
  }
  if (v6) {
    [v12 setName:v6];
  }
  [v12 setDefaultConfiguration:v8];
  v14 = [(id)objc_opt_class() authPromptReason];
  [v12 setAuthPromptReason:v14];

  v15 = [v12 name];

  v16 = MBGetDefaultLog();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (!v17) {
      goto LABEL_15;
    }
    id v29 = v7;
    BOOL v18 = v10 != 0;
    v19 = [v12 name];
    [v12 operationGroupID];
    v20 = v28 = v10;
    [(MBCKOperationPolicy *)self qualityOfService];
    v21 = MBLogStringForNSQualityOfService();
    *(_DWORD *)buf = 138544386;
    v31 = v19;
    __int16 v32 = 2114;
    v33 = v20;
    __int16 v34 = 2112;
    *(void *)v35 = v21;
    *(_WORD *)&v35[8] = 1024;
    BOOL v36 = v18;
    __int16 v37 = 1024;
    int v38 = (int)v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "=ck-op= Created operation group, gn:\"%{public}@\", gid:%{public}@, qos:%@, ac:%d(%d)", buf, 0x2Cu);

    uint64_t v10 = v28;
    v22 = [v12 name];
    v23 = [v12 operationGroupID];
    [(MBCKOperationPolicy *)self qualityOfService];
    v27 = MBLogStringForNSQualityOfService();
    _MBLog();
  }
  else
  {
    if (!v17) {
      goto LABEL_15;
    }
    id v29 = v7;
    v24 = [v12 operationGroupID];
    [(MBCKOperationPolicy *)self qualityOfService];
    v25 = MBLogStringForNSQualityOfService();
    *(_DWORD *)buf = 138544130;
    v31 = v24;
    __int16 v32 = 2114;
    v33 = v25;
    __int16 v34 = 1024;
    *(_DWORD *)v35 = v10 != 0;
    *(_WORD *)&v35[4] = 1024;
    *(_DWORD *)&v35[6] = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "=ck-op= Created operation group, gid:%{public}@, qos:%{public}@, ac:%d(%d)", buf, 0x22u);

    v22 = [v12 operationGroupID];
    [(MBCKOperationPolicy *)self qualityOfService];
    v23 = MBLogStringForNSQualityOfService();
    _MBLog();
  }

  id v7 = v29;
LABEL_15:

  if (!v12) {
    __assert_rtn("-[MBCKOperationPolicy operationGroupWithName:processName:]", "MBCKOperationTracker.m", 129, "group");
  }

  return v12;
}

- (id)operationGroupWithName:(id)a3
{
  return [(MBCKOperationPolicy *)self operationGroupWithName:a3 processName:0];
}

- (MBCellularAccess)cellularAccess
{
  return self->_cellularAccess;
}

- (void)setCellularAccess:(id)a3
{
}

- (BOOL)automaticallyRetryNetworkFailures
{
  return self->_automaticallyRetryNetworkFailures;
}

- (void)setAutomaticallyRetryNetworkFailures:(BOOL)a3
{
  self->_automaticallyRetryNetworkFailures = a3;
}

- (BOOL)fetchAssets
{
  return self->_fetchAssets;
}

- (void)setFetchAssets:(BOOL)a3
{
  self->_fetchAssets = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)recordSavePolicy
{
  return self->_recordSavePolicy;
}

- (void)setRecordSavePolicy:(int64_t)a3
{
  self->_recordSavePolicy = a3;
}

- (int64_t)maxBatchCount
{
  return self->_maxBatchCount;
}

- (void)setMaxBatchCount:(int64_t)a3
{
  self->_maxBatchCount = a3;
}

- (int64_t)maxBatchSize
{
  return self->_maxBatchSize;
}

- (void)setMaxBatchSize:(int64_t)a3
{
  self->_maxBatchSize = a3;
}

- (unint64_t)maxBatchFetchAssetSize
{
  return self->_maxBatchFetchAssetSize;
}

- (void)setMaxBatchFetchAssetSize:(unint64_t)a3
{
  self->_maxBatchFetchAssetSize = a3;
}

- (unint64_t)maxBatchSaveAssetSize
{
  return self->_maxBatchSaveAssetSize;
}

- (void)setMaxBatchSaveAssetSize:(unint64_t)a3
{
  self->_maxBatchSaveAssetSize = a3;
}

- (double)timeoutIntervalForFetch
{
  return self->_timeoutIntervalForFetch;
}

- (void)setTimeoutIntervalForFetch:(double)a3
{
  self->_timeoutIntervalForFetch = a3;
}

- (double)timeoutIntervalForModify
{
  return self->_timeoutIntervalForModify;
}

- (void)setTimeoutIntervalForModify:(double)a3
{
  self->_timeoutIntervalForModify = a3;
}

- (double)retryAfterInterval
{
  return self->_retryAfterInterval;
}

- (void)setRetryAfterInterval:(double)a3
{
  self->_retryAfterInterval = a3;
}

- (int64_t)maxRetryAttempts
{
  return self->_maxRetryAttempts;
}

- (void)setMaxRetryAttempts:(int64_t)a3
{
  self->_maxRetryAttempts = a3;
}

- (void).cxx_destruct
{
}

@end