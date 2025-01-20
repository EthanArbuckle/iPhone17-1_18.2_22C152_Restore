@interface SiriAnalyticsRootClock
- (BOOL)isTrackingDerivativeClockByStreamUUID:(id)a3;
- (SiriAnalyticsRootClock)initWithClockIdentifier:(id)a3 timestampOffset:(unint64_t)a4 startedOn:(unint64_t)a5 metastore:(id)a6;
- (SiriAnalyticsSensitiveConditionsLedger)sensitiveConditionsLedger;
- (id)derivativeClockForStreamUUID:(id)a3;
- (id)derivativeClocks;
- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4;
- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4;
@end

@implementation SiriAnalyticsRootClock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveConditionsLedger, 0);
  objc_storeStrong((id *)&self->_derivativeClocksByStreamUUID, 0);
}

- (SiriAnalyticsSensitiveConditionsLedger)sensitiveConditionsLedger
{
  return self->_sensitiveConditionsLedger;
}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(SiriAnalyticsLogicalClock *)self containsTimestamp:a4])
  {
    sensitiveConditionsLedger = self->_sensitiveConditionsLedger;
    [(SiriAnalyticsSensitiveConditionsLedger *)sensitiveConditionsLedger endWithSensitiveCondition:v5 at:a4];
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v8 = SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      v10 = "-[SiriAnalyticsRootClock sensitiveCondition:endedAt:]";
      __int16 v11 = 2048;
      uint64_t v12 = (int)v5;
      __int16 v13 = 2112;
      v14 = self;
      _os_log_error_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_ERROR, "%s Attempted to track end for sensitive condition %lu outside scope of clock: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(SiriAnalyticsLogicalClock *)self containsTimestamp:a4])
  {
    sensitiveConditionsLedger = self->_sensitiveConditionsLedger;
    [(SiriAnalyticsSensitiveConditionsLedger *)sensitiveConditionsLedger startWithSensitiveCondition:v5 at:a4];
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v8 = SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      v10 = "-[SiriAnalyticsRootClock sensitiveCondition:startedAt:]";
      __int16 v11 = 2048;
      uint64_t v12 = (int)v5;
      __int16 v13 = 2112;
      v14 = self;
      _os_log_error_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_ERROR, "%s Attempted to track begin for sensitive condition %lu outside scope of clock: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (id)derivativeClocks
{
  return (id)[(NSMutableDictionary *)self->_derivativeClocksByStreamUUID allValues];
}

- (id)derivativeClockForStreamUUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_derivativeClocksByStreamUUID objectForKey:v4];
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E4F29128];
    v7 = [(SiriAnalyticsLogicalClock *)self clockIdentifier];
    v8 = objc_msgSend(v6, "sa_deterministicUUIDv5ForNamespaceUUID:sourceUUID:", v7, v4);

    uint64_t v5 = [[SiriAnalyticsDerivativeClock alloc] initWithClockIdentifier:v8 isolatedStreamUUID:v4 timestampOffset:[(SiriAnalyticsLogicalClock *)self timestampOffset] rootClock:self];
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    int v9 = SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
    {
      int v11 = 136316162;
      uint64_t v12 = "-[SiriAnalyticsRootClock derivativeClockForStreamUUID:]";
      __int16 v13 = 2112;
      v14 = v5;
      __int16 v15 = 2112;
      v16 = v8;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      v20 = self;
      _os_log_impl(&dword_1A2B39000, v9, OS_LOG_TYPE_INFO, "%s Created derivative clock: %@ with identifer: %@ for streamUUID: %@ with parent clock: %@", (uint8_t *)&v11, 0x34u);
    }
    [(NSMutableDictionary *)self->_derivativeClocksByStreamUUID setObject:v5 forKey:v4];
  }
  return v5;
}

- (BOOL)isTrackingDerivativeClockByStreamUUID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_derivativeClocksByStreamUUID objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (SiriAnalyticsRootClock)initWithClockIdentifier:(id)a3 timestampOffset:(unint64_t)a4 startedOn:(unint64_t)a5 metastore:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SiriAnalyticsRootClock;
  uint64_t v12 = [(SiriAnalyticsLogicalClock *)&v18 initWithClockIdentifier:v10 timestampOffset:a4 startedOn:a5];
  if (v12)
  {
    __int16 v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    derivativeClocksByStreamUUID = v12->_derivativeClocksByStreamUUID;
    v12->_derivativeClocksByStreamUUID = v13;

    __int16 v15 = [[SiriAnalyticsSensitiveConditionsLedger alloc] initWithClockIdentifier:v10 metastore:v11];
    sensitiveConditionsLedger = v12->_sensitiveConditionsLedger;
    v12->_sensitiveConditionsLedger = v15;
  }
  return v12;
}

@end