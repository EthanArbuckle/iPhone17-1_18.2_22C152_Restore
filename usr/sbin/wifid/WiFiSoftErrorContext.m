@interface WiFiSoftErrorContext
- (WiFiSoftErrorContext)initWithErrorType:(int)a3 deviceContext:(void *)a4;
- (double)detectionTime;
- (id)fetchSoftErrorContextData;
- (int)errorState;
- (void)addStatsRecord:(id)a3;
- (void)setDetectionTime:(double)a3;
- (void)setErrorState:(int)a3;
@end

@implementation WiFiSoftErrorContext

- (WiFiSoftErrorContext)initWithErrorType:(int)a3 deviceContext:(void *)a4
{
  v15.receiver = self;
  v15.super_class = (Class)WiFiSoftErrorContext;
  v6 = [(WiFiSoftErrorContext *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_errorType = a3;
    v6->_errorState = 0;
    uint64_t v8 = 24;
    if (a3 == 1) {
      uint64_t v8 = 16;
    }
    *(Class *)((char *)&v6->super.isa + v8) = (Class)a4;
    v6->_triggerTime = CFAbsoluteTimeGetCurrent();
    v7->_detectionTime = 0.0;
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    errorContextData = v7->_errorContextData;
    v7->_errorContextData = v9;

    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    statsRecordData = v7->_statsRecordData;
    v7->_statsRecordData = v11;
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: super-init failed!", "-[WiFiSoftErrorContext initWithErrorType:deviceContext:]");
    }
  }
  return v7;
}

- (void)addStatsRecord:(id)a3
{
  statsRecordData = self->_statsRecordData;
  if (statsRecordData) {
    [(NSMutableArray *)statsRecordData addObject:a3];
  }
}

- (id)fetchSoftErrorContextData
{
  errorContextData = self->_errorContextData;
  if (!errorContextData)
  {
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5 = self->_errorContextData;
    self->_errorContextData = v4;

    errorContextData = self->_errorContextData;
    if (!errorContextData)
    {
      if (qword_10027DD68)
      {
        context = v7;
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Couldn't allocate contextData", "-[WiFiSoftErrorContext fetchSoftErrorContextData]");
        v7 = context;
      }
      errorContextData = self->_errorContextData;
    }
  }

  return errorContextData;
}

- (int)errorState
{
  return self->_errorState;
}

- (void)setErrorState:(int)a3
{
  self->_errorState = a3;
}

- (double)detectionTime
{
  return self->_detectionTime;
}

- (void)setDetectionTime:(double)a3
{
  self->_detectionTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsRecordData, 0);

  objc_storeStrong((id *)&self->_errorContextData, 0);
}

@end