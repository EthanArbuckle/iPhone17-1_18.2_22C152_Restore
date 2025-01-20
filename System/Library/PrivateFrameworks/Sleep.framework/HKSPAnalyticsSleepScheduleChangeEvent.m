@interface HKSPAnalyticsSleepScheduleChangeEvent
+ (id)_payloadWithApplication:(id)a3 isSleepTrackingEnabled:(BOOL)a4 activeWatchProductType:(id)a5 provenanceSource:(id)a6;
- (HKSPAnalyticsSleepScheduleChangeEvent)initWithScheduleChangeInfo:(id)a3 provenanceInfo:(id)a4;
- (NSDictionary)eventPayload;
- (NSString)description;
- (NSString)eventName;
- (void)setEventName:(id)a3;
- (void)setEventPayload:(id)a3;
@end

@implementation HKSPAnalyticsSleepScheduleChangeEvent

- (HKSPAnalyticsSleepScheduleChangeEvent)initWithScheduleChangeInfo:(id)a3 provenanceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HKSPAnalyticsSleepScheduleChangeEvent;
  v8 = [(HKSPAnalyticsSleepScheduleChangeEvent *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventName, @"com.apple.SleepHealth.ScheduleChangeEvent");
    v10 = objc_opt_class();
    v11 = [v6 applicationPayloadValue];
    uint64_t v12 = [v6 isSleepTrackingEnabled];
    v13 = [v6 activePairedWatchProductType];
    v14 = [v7 source];
    uint64_t v15 = [v10 _payloadWithApplication:v11 isSleepTrackingEnabled:v12 activeWatchProductType:v13 provenanceSource:v14];
    eventPayload = v9->_eventPayload;
    v9->_eventPayload = (NSDictionary *)v15;

    v17 = v9;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"[%@.%p] event=%@, payload=%@", v5, self, self->_eventName, self->_eventPayload];

  return (NSString *)v6;
}

+ (id)_payloadWithApplication:(id)a3 isSleepTrackingEnabled:(BOOL)a4 activeWatchProductType:(id)a5 provenanceSource:(id)a6
{
  BOOL v7 = a4;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v12 = a3;
  id v13 = [v11 alloc];
  v19[0] = @"sourceChange";
  v19[1] = @"watchSleepTrackingEnabled";
  v20[0] = v12;
  v14 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
  v20[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  v16 = (void *)[v13 initWithDictionary:v15];
  if (v9) {
    [v16 setObject:v9 forKeyedSubscript:@"activeWatchProductType"];
  }
  if (v10) {
    [v16 setObject:v10 forKeyedSubscript:@"provenance"];
  }
  v17 = (void *)[v16 copy];

  return v17;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (NSDictionary)eventPayload
{
  return self->_eventPayload;
}

- (void)setEventPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPayload, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end