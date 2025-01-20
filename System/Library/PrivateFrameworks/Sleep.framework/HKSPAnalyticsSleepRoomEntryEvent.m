@interface HKSPAnalyticsSleepRoomEntryEvent
+ (id)_payloadWithProvidenceInfo:(id)a3 isOnboarded:(BOOL)a4;
- (HKSPAnalyticsSleepRoomEntryEvent)initWithProvenanceInfo:(id)a3 isOnboarded:(BOOL)a4;
- (NSDictionary)eventPayload;
- (NSString)description;
- (NSString)eventName;
- (void)setEventName:(id)a3;
- (void)setEventPayload:(id)a3;
@end

@implementation HKSPAnalyticsSleepRoomEntryEvent

- (HKSPAnalyticsSleepRoomEntryEvent)initWithProvenanceInfo:(id)a3 isOnboarded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSPAnalyticsSleepRoomEntryEvent;
  v7 = [(HKSPAnalyticsSleepRoomEntryEvent *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_eventName, @"com.apple.SleepHealth.SleepRoomView");
    uint64_t v9 = [(id)objc_opt_class() _payloadWithProvidenceInfo:v6 isOnboarded:v4];
    eventPayload = v8->_eventPayload;
    v8->_eventPayload = (NSDictionary *)v9;

    v11 = v8;
  }

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"[%@.%p] event=%@, payload=%@", v5, self, self->_eventName, self->_eventPayload];

  return (NSString *)v6;
}

+ (id)_payloadWithProvidenceInfo:(id)a3 isOnboarded:(BOOL)a4
{
  BOOL v4 = a4;
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"provenance";
  id v5 = a3;
  id v6 = [v5 source];
  v12[0] = v6;
  v11[1] = @"context";
  v7 = [v5 presentation];

  v12[1] = v7;
  v11[2] = @"isOnboardedSleep";
  v8 = [NSNumber numberWithBool:v4];
  v12[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
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