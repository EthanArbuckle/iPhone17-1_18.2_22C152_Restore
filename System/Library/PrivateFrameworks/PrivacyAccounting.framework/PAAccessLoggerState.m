@interface PAAccessLoggerState
- (BOOL)loggingEnabled;
- (NSCache)negativeAccessCache;
- (NSDictionary)ongoingAccessIntervals;
- (NSDictionary)slotByAccessForOngoingAccessInterval;
- (PAAccessLoggerState)init;
- (id)lookupCurrentAccessForSlot:(id)a3;
- (id)takeOngoingAccessIntervalStateForAccess:(id)a3;
- (id)takeOngoingAccessIntervalStateForSlot:(id)a3;
- (int64_t)topAccessIntervalSlot;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)setOngoingAccessIntervalState:(id)a3 forSlot:(id)a4;
- (void)setTopAccessIntervalSlot:(int64_t)a3;
@end

@implementation PAAccessLoggerState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeAccessCache, 0);
  objc_storeStrong((id *)&self->_slotByAccessForOngoingAccessInterval, 0);

  objc_storeStrong((id *)&self->_ongoingAccessIntervals, 0);
}

- (BOOL)loggingEnabled
{
  return self->_loggingEnabled;
}

- (NSCache)negativeAccessCache
{
  return self->_negativeAccessCache;
}

- (void)setTopAccessIntervalSlot:(int64_t)a3
{
  self->_topAccessIntervalSlot = a3;
}

- (PAAccessLoggerState)init
{
  v11.receiver = self;
  v11.super_class = (Class)PAAccessLoggerState;
  v2 = [(PAAccessLoggerState *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_loggingEnabled = 1;
    v2->_topAccessIntervalSlot = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    ongoingAccessIntervals = v3->_ongoingAccessIntervals;
    v3->_ongoingAccessIntervals = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    slotByAccessForOngoingAccessInterval = v3->_slotByAccessForOngoingAccessInterval;
    v3->_slotByAccessForOngoingAccessInterval = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    negativeAccessCache = v3->_negativeAccessCache;
    v3->_negativeAccessCache = (NSCache *)v8;

    [(NSCache *)v3->_negativeAccessCache setName:@"com.apple.PrivacyAccounting.NegativeAccessCache"];
  }
  return v3;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_loggingEnabled = a3;
}

- (NSDictionary)ongoingAccessIntervals
{
  return &self->_ongoingAccessIntervals->super;
}

- (int64_t)topAccessIntervalSlot
{
  return self->_topAccessIntervalSlot;
}

- (void)setOngoingAccessIntervalState:(id)a3 forSlot:(id)a4
{
  ongoingAccessIntervals = self->_ongoingAccessIntervals;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableDictionary *)ongoingAccessIntervals setObject:v8 forKeyedSubscript:v7];
  slotByAccessForOngoingAccessInterval = self->_slotByAccessForOngoingAccessInterval;
  id v10 = [v8 access];

  [(NSMutableDictionary *)slotByAccessForOngoingAccessInterval setObject:v7 forKeyedSubscript:v10];
}

- (id)takeOngoingAccessIntervalStateForAccess:(id)a3
{
  uint64_t v4 = [(NSMutableDictionary *)self->_slotByAccessForOngoingAccessInterval objectForKeyedSubscript:a3];
  if (v4)
  {
    v5 = [(PAAccessLoggerState *)self takeOngoingAccessIntervalStateForSlot:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)lookupCurrentAccessForSlot:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_ongoingAccessIntervals objectForKeyedSubscript:a3];
  uint64_t v4 = [v3 access];

  return v4;
}

- (id)takeOngoingAccessIntervalStateForSlot:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_ongoingAccessIntervals objectForKeyedSubscript:v4];
  if (v5)
  {
    [(NSMutableDictionary *)self->_ongoingAccessIntervals setObject:0 forKeyedSubscript:v4];
    slotByAccessForOngoingAccessInterval = self->_slotByAccessForOngoingAccessInterval;
    id v7 = [v5 access];
    [(NSMutableDictionary *)slotByAccessForOngoingAccessInterval setObject:0 forKeyedSubscript:v7];

    id v8 = v5;
  }

  return v5;
}

- (NSDictionary)slotByAccessForOngoingAccessInterval
{
  return &self->_slotByAccessForOngoingAccessInterval->super;
}

@end