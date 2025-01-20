@interface UploadThroughputDelegate
- (BOOL)checkLimits;
- (id)amendRequest:(id)a3;
- (id)createTaskWithRequest:(id)a3 session:(id)a4;
- (unint64_t)maxFlows;
- (unint64_t)minFlows;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)updateResultsWithByteCount;
- (void)updateResultsWithFlowCount;
- (void)updateResultsWithThroughput:(int64_t)a3 confidence:(int64_t)a4;
@end

@implementation UploadThroughputDelegate

- (id)createTaskWithRequest:(id)a3 session:(id)a4
{
  return (id)[a4 uploadTaskWithStreamedRequest:a3];
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  v6 = (void (**)(id, UploadDataStream *))a5;
  v7 = [[UploadDataStream alloc] initWithLength:0x400000000 andThroughputDelegate:self];
  [(NSMutableArray *)self->super._uploadStream addObject:v7];
  v6[2](v6, v7);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (!*(_WORD *)&self->super._canceled)
  {
    if ([(NSMutableArray *)self->super._probeSessions indexOfObject:v10] == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->super._probeSessions addObject:v10];
    }
    v12 = [MEMORY[0x263EFF910] now];
    lastUpdate = self->super._lastUpdate;
    self->super._lastUpdate = v12;

    [(ThroughputDelegate *)self addNewThroughputMeasurement:a5];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v14 = self->super._uploadStream;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) signalProgress:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

- (id)amendRequest:(id)a3
{
  id v3 = a3;
  [v3 setHTTPMethod:@"POST"];
  v4 = [NSString stringWithFormat:@"%lld", 0x400000000];
  [v3 setValue:v4 forHTTPHeaderField:@"Content-Length"];

  return v3;
}

- (void)updateResultsWithFlowCount
{
  if (!self->super._canceled)
  {
    [NSNumber numberWithInteger:-[NSMutableArray count](self->super._tasks, "count")];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(NetworkQualityResult *)self->super._results setUplinkFlows:v3];
  }
}

- (void)updateResultsWithByteCount
{
  if (!self->super._canceled)
  {
    id v3 = [NSNumber numberWithInteger:self->super._currentBytesTransferred];
    [(NetworkQualityResult *)self->super._results setUplinkBytesTransferred:v3];
  }
}

- (void)updateResultsWithThroughput:(int64_t)a3 confidence:(int64_t)a4
{
  if (!self->super._canceled)
  {
    v6 = [NSNumber numberWithInteger:a3];
    v7 = [(NetworkQualityResult *)self->super._results uplinkCapacity];
    [v7 setValue:v6];

    id v8 = [(NetworkQualityResult *)self->super._results uplinkCapacity];
    [v8 updateConfidence:a4];
  }
}

- (BOOL)checkLimits
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(NetworkQualityConfiguration *)self->super._nqConfig maxUplinkData])
  {
    int64_t currentBytesTransferred = self->super._currentBytesTransferred;
    if (currentBytesTransferred > [(NetworkQualityConfiguration *)self->super._nqConfig maxUplinkData])
    {
      netqual_log_init();
      v4 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v5 = self->super._currentBytesTransferred;
        nqConfig = self->super._nqConfig;
        v7 = v4;
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = "-[UploadThroughputDelegate checkLimits]";
        __int16 v25 = 1024;
        int v26 = 655;
        __int16 v27 = 2048;
        double v28 = *(double *)&v5;
        __int16 v29 = 2048;
        double v30 = COERCE_DOUBLE([(NetworkQualityConfiguration *)nqConfig maxUplinkData]);
        _os_log_impl(&dword_2192FE000, v7, OS_LOG_TYPE_DEFAULT, "%s:%u - Uploaded too many bytes: %ld max: %ld", buf, 0x26u);
      }
      if (!self->super._canceled)
      {
        id v17 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v21 = *MEMORY[0x263F08320];
        long long v22 = @"Datalimit exceeded";
        BOOL v8 = 1;
        v18 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        long long v19 = (NSError *)[v17 initWithDomain:@"NetworkQualityErrorDomain" code:1005 userInfo:v18];
        error = self->super._error;
        self->super._error = v19;

        (*((void (**)(void))self->super._completionHandler + 2))();
        return v8;
      }
      return 1;
    }
  }
  [(SaturationDetection *)self->super._saturation getAverage];
  if (self->super._exitCriteriaMet) {
    return 0;
  }
  float v11 = v9;
  if (![(NetworkQualityConfiguration *)self->super._nqConfig maxUplinkThroughput]
    || [(NetworkQualityConfiguration *)self->super._nqConfig maxUplinkThroughput] >= (uint64_t)v11)
  {
    return 0;
  }
  netqual_log_init();
  v12 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->super._nqConfig;
    v14 = v12;
    *(_DWORD *)buf = 136315906;
    uint64_t v24 = "-[UploadThroughputDelegate checkLimits]";
    __int16 v25 = 1024;
    int v26 = 673;
    __int16 v27 = 2048;
    double v28 = (double)(uint64_t)v11 * 0.000000953674316;
    __int16 v29 = 2048;
    double v30 = (double)[(NetworkQualityConfiguration *)v13 maxUplinkThroughput] * 0.000000953674316;
    _os_log_impl(&dword_2192FE000, v14, OS_LOG_TYPE_DEFAULT, "%s:%u - Uplink throughput exceeded: %.3f Mbps max: %.3f Mbps", buf, 0x26u);
  }
  [(SaturationDetection *)self->super._saturation getAverage];
  [(UploadThroughputDelegate *)self updateResultsWithThroughput:(uint64_t)v15 confidence:2];
  BOOL v8 = 1;
  self->super._exitCriteriaMet = 1;
  if (!self->super._saturation_reached)
  {
    saturationHandler = (void (**)(void))self->super._saturationHandler;
    if (saturationHandler) {
      saturationHandler[2]();
    }
    return 1;
  }
  return v8;
}

- (unint64_t)minFlows
{
  return [(NetworkQualityConfiguration *)self->super._nqConfig minUploadFlows];
}

- (unint64_t)maxFlows
{
  return [(NetworkQualityConfiguration *)self->super._nqConfig maxUploadFlows];
}

@end