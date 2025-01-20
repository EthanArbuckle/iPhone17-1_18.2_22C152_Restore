@interface HKSPAnalyticsOnboardingEvent
- (HKSPAnalyticsOnboardingEvent)initWithOnboardingInfo:(id)a3 provenanceInfo:(id)a4;
- (NSDictionary)eventPayload;
- (NSString)description;
- (NSString)eventName;
- (void)setEventName:(id)a3;
- (void)setEventPayload:(id)a3;
@end

@implementation HKSPAnalyticsOnboardingEvent

- (HKSPAnalyticsOnboardingEvent)initWithOnboardingInfo:(id)a3 provenanceInfo:(id)a4
{
  v32[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HKSPAnalyticsOnboardingEvent;
  v8 = [(HKSPAnalyticsOnboardingEvent *)&v30 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventName, @"com.apple.SleepHealth.OnboardingSteps");
    v10 = [v6 stepPayloadValue];
    v11 = [v6 entryPointPayloadValue];
    v12 = [v6 actionPayloadValue];
    v13 = [v7 source];
    id v29 = v7;
    v14 = [v7 presentation];
    id v15 = v12;
    v16 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v17 = v14;
    id v18 = v13;
    id v19 = v11;
    id v20 = v10;
    id v21 = [v16 alloc];
    v31[0] = @"step";
    v31[1] = @"entryPoint";
    v32[0] = v20;
    v32[1] = v19;
    v31[2] = @"device";
    v22 = +[HKSPAnalyticsManager currentDeviceType];
    v32[2] = v22;
    v32[3] = v18;
    v31[3] = @"provenance";
    v31[4] = @"context";
    v32[4] = v17;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:5];

    v24 = (void *)[v21 initWithDictionary:v23];
    if (v15) {
      [v24 setObject:v15 forKeyedSubscript:@"action"];
    }
    uint64_t v25 = [v24 copy];

    eventPayload = v9->_eventPayload;
    v9->_eventPayload = (NSDictionary *)v25;

    v27 = v9;
    id v7 = v29;
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