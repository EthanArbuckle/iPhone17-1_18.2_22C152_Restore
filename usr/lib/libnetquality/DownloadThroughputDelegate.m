@interface DownloadThroughputDelegate
- (BOOL)checkLimits;
- (id)createTaskWithRequest:(id)a3 session:(id)a4;
- (unint64_t)maxFlows;
- (unint64_t)minFlows;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)updateResultsWithByteCount;
- (void)updateResultsWithFlowCount;
- (void)updateResultsWithThroughput:(int64_t)a3 confidence:(int64_t)a4;
@end

@implementation DownloadThroughputDelegate

- (id)createTaskWithRequest:(id)a3 session:(id)a4
{
  return (id)[a4 dataTaskWithRequest:a3];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!*(_WORD *)&self->super._canceled)
  {
    if ([(NSMutableArray *)self->super._probeSessions indexOfObject:v10] == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->super._probeSessions addObject:v10];
    }
    -[ThroughputDelegate addNewThroughputMeasurement:](self, "addNewThroughputMeasurement:", [v9 length]);
  }
}

- (void)updateResultsWithFlowCount
{
  if (!self->super._canceled)
  {
    [NSNumber numberWithInteger:-[NSMutableArray count](self->super._tasks, "count")];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(NetworkQualityResult *)self->super._results setDownlinkFlows:v3];
  }
}

- (void)updateResultsWithByteCount
{
  if (!self->super._canceled)
  {
    id v3 = [NSNumber numberWithInteger:self->super._currentBytesTransferred];
    [(NetworkQualityResult *)self->super._results setDownlinkBytesTransferred:v3];
  }
}

- (void)updateResultsWithThroughput:(int64_t)a3 confidence:(int64_t)a4
{
  if (!self->super._canceled)
  {
    v6 = [NSNumber numberWithInteger:a3];
    v7 = [(NetworkQualityResult *)self->super._results downlinkCapacity];
    [v7 setValue:v6];

    id v8 = [(NetworkQualityResult *)self->super._results downlinkCapacity];
    [v8 updateConfidence:a4];

    id v9 = [NSNumber numberWithInteger:self->super._currentBytesTransferred];
    [(NetworkQualityResult *)self->super._results setDownlinkBytesTransferred:v9];
  }
}

- (BOOL)checkLimits
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(NetworkQualityConfiguration *)self->super._nqConfig maxDownlinkData])
  {
    int64_t currentBytesTransferred = self->super._currentBytesTransferred;
    if (currentBytesTransferred > [(NetworkQualityConfiguration *)self->super._nqConfig maxDownlinkData])
    {
      netqual_log_init();
      v4 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v5 = self->super._currentBytesTransferred;
        nqConfig = self->super._nqConfig;
        v7 = v4;
        *(_DWORD *)buf = 136315906;
        v24 = "-[DownloadThroughputDelegate checkLimits]";
        __int16 v25 = 1024;
        int v26 = 530;
        __int16 v27 = 2048;
        double v28 = *(double *)&v5;
        __int16 v29 = 2048;
        double v30 = COERCE_DOUBLE([(NetworkQualityConfiguration *)nqConfig maxDownlinkData]);
        _os_log_impl(&dword_2192FE000, v7, OS_LOG_TYPE_DEFAULT, "%s:%u - Downloaded too many bytes: %ld max: %ld", buf, 0x26u);
      }
      if (!self->super._canceled)
      {
        id v17 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v21 = *MEMORY[0x263F08320];
        v22 = @"Datalimit exceeded";
        BOOL v8 = 1;
        v18 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        v19 = (NSError *)[v17 initWithDomain:@"NetworkQualityErrorDomain" code:1005 userInfo:v18];
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
  if (![(NetworkQualityConfiguration *)self->super._nqConfig maxDownlinkThroughput]
    || [(NetworkQualityConfiguration *)self->super._nqConfig maxDownlinkThroughput] >= (uint64_t)v11)
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
    v24 = "-[DownloadThroughputDelegate checkLimits]";
    __int16 v25 = 1024;
    int v26 = 549;
    __int16 v27 = 2048;
    double v28 = (double)(uint64_t)v11 * 0.000000953674316;
    __int16 v29 = 2048;
    double v30 = (double)[(NetworkQualityConfiguration *)v13 maxDownlinkThroughput] * 0.000000953674316;
    _os_log_impl(&dword_2192FE000, v14, OS_LOG_TYPE_DEFAULT, "%s:%u - Downlink throughput exceeded: %.3f Mbps max: %.3f Mbps", buf, 0x26u);
  }
  [(SaturationDetection *)self->super._saturation getAverage];
  [(DownloadThroughputDelegate *)self updateResultsWithThroughput:(uint64_t)v15 confidence:2];
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
  return [(NetworkQualityConfiguration *)self->super._nqConfig minDownloadFlows];
}

- (unint64_t)maxFlows
{
  return [(NetworkQualityConfiguration *)self->super._nqConfig maxDownloadFlows];
}

@end