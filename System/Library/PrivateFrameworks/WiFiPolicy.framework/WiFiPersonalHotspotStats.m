@interface WiFiPersonalHotspotStats
+ (id)sharedInstance;
- (BOOL)successfulJoinAttempt;
- (NSString)deviceName;
- (NSString)failureReporter;
- (NSString)joinReason;
- (WiFiPersonalHotspotStats)init;
- (double)joinEndedAt;
- (double)joinStartedAt;
- (double)latency;
- (double)personalHotspotDiscoveryEndedAt;
- (int64_t)band;
- (int64_t)joinFailureCode;
- (void)__resetWiFiPersonalHotspotStats;
- (void)__submitWiFiPersonalHotspotStats:(double)a3 end:(double)a4 latencyType:(id)a5;
- (void)setJoinEndedEvent:(double)a3 successfulJoinAttempt:(BOOL)a4 joinFailureCode:(int64_t)a5 failureReporter:(id)a6 band:(int64_t)a7 deviceName:(id)a8;
- (void)setJoinStartedEvent:(double)a3 withReason:(unint64_t)a4 deviceName:(id)a5;
- (void)setPersonalHotspotDiscoveryEndedAt:(double)a3;
@end

@implementation WiFiPersonalHotspotStats

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sharedPersonalHotspotStats;

  return v2;
}

uint64_t __42__WiFiPersonalHotspotStats_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(WiFiPersonalHotspotStats);
  uint64_t v2 = sharedInstance_sharedPersonalHotspotStats;
  sharedInstance_sharedPersonalHotspotStats = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v2, v1);
}

- (WiFiPersonalHotspotStats)init
{
  v5.receiver = self;
  v5.super_class = (Class)WiFiPersonalHotspotStats;
  uint64_t v2 = [(WiFiPersonalHotspotStats *)&v5 init];
  v3 = v2;
  if (v2) {
    [(WiFiPersonalHotspotStats *)v2 __resetWiFiPersonalHotspotStats];
  }
  return v3;
}

- (void)__resetWiFiPersonalHotspotStats
{
  self->_successfulJoinAttempt = 0;
  *(_OWORD *)&self->_joinStartedAt = 0u;
  *(_OWORD *)&self->_joinEndedAt = 0u;
  joinReason = self->_joinReason;
  self->_joinReason = 0;

  failureReporter = self->_failureReporter;
  self->_failureReporter = 0;

  self->_joinFailureCode = 0;
  deviceName = self->_deviceName;
  self->_deviceName = 0;

  self->_band = 0;
}

- (void)setJoinStartedEvent:(double)a3 withReason:(unint64_t)a4 deviceName:(id)a5
{
  v8 = (NSString *)a5;
  [(WiFiPersonalHotspotStats *)self __resetWiFiPersonalHotspotStats];
  self->_joinStartedAt = a3;
  v9 = +[WiFiUsageSession joinReasonString:a4];
  joinReason = self->_joinReason;
  self->_joinReason = v9;

  deviceName = self->_deviceName;
  self->_deviceName = v8;
}

- (void)setJoinEndedEvent:(double)a3 successfulJoinAttempt:(BOOL)a4 joinFailureCode:(int64_t)a5 failureReporter:(id)a6 band:(int64_t)a7 deviceName:(id)a8
{
  id v16 = a6;
  id v15 = a8;
  if (self->_joinStartedAt != 0.0
    && self->_latency == 0.0
    && [(NSString *)self->_deviceName isEqualToString:v15])
  {
    self->_joinEndedAt = a3;
    self->_successfulJoinAttempt = a4;
    self->_joinFailureCode = a5;
    objc_storeStrong((id *)&self->_failureReporter, a6);
    self->_band = a7;
    self->_latency = self->_joinEndedAt - self->_joinStartedAt;
    -[WiFiPersonalHotspotStats __submitWiFiPersonalHotspotStats:end:latencyType:](self, "__submitWiFiPersonalHotspotStats:end:latencyType:", @"PH Enablement");
    [(WiFiPersonalHotspotStats *)self __submitWiFiPersonalHotspotStats:@"WiFi" end:self->_personalHotspotDiscoveryEndedAt latencyType:self->_joinEndedAt];
    [(WiFiPersonalHotspotStats *)self __submitWiFiPersonalHotspotStats:@"Total" end:self->_joinStartedAt latencyType:self->_joinEndedAt];
  }
}

- (void)__submitWiFiPersonalHotspotStats:(double)a3 end:(double)a4 latencyType:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a3 != 0.0 && a4 != 0.0)
  {
    v10 = [NSNumber numberWithDouble:a4 - a3];
    [v9 setObject:v10 forKeyedSubscript:@"latency"];
  }
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:@"latencyType"];
  }
  v11 = [NSNumber numberWithBool:self->_successfulJoinAttempt];
  [v9 setObject:v11 forKeyedSubscript:@"successfulJoinAttempt"];

  joinReason = self->_joinReason;
  if (joinReason) {
    [v9 setObject:joinReason forKeyedSubscript:@"joinReason"];
  }
  v13 = [NSNumber numberWithInteger:self->_band];
  [v9 setObject:v13 forKeyedSubscript:@"band"];

  failureReporter = self->_failureReporter;
  if (failureReporter) {
    [v9 setObject:failureReporter forKeyedSubscript:@"failureReporter"];
  }
  id v15 = [NSNumber numberWithInteger:self->_joinFailureCode];
  [v9 setObject:v15 forKeyedSubscript:@"joinFailureCode"];

  v17 = v9;
  id v16 = v9;
  AnalyticsSendEventLazy();
}

id __77__WiFiPersonalHotspotStats___submitWiFiPersonalHotspotStats_end_latencyType___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (double)joinStartedAt
{
  return self->_joinStartedAt;
}

- (double)personalHotspotDiscoveryEndedAt
{
  return self->_personalHotspotDiscoveryEndedAt;
}

- (void)setPersonalHotspotDiscoveryEndedAt:(double)a3
{
  self->_personalHotspotDiscoveryEndedAt = a3;
}

- (double)joinEndedAt
{
  return self->_joinEndedAt;
}

- (double)latency
{
  return self->_latency;
}

- (BOOL)successfulJoinAttempt
{
  return self->_successfulJoinAttempt;
}

- (NSString)joinReason
{
  return self->_joinReason;
}

- (NSString)failureReporter
{
  return self->_failureReporter;
}

- (int64_t)joinFailureCode
{
  return self->_joinFailureCode;
}

- (int64_t)band
{
  return self->_band;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_failureReporter, 0);

  objc_storeStrong((id *)&self->_joinReason, 0);
}

@end