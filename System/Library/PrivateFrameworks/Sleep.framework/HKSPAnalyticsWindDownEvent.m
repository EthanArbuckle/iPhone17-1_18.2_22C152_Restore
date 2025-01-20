@interface HKSPAnalyticsWindDownEvent
+ (id)_payloadValueForWindDownAction:(unint64_t)a3;
- (HKSPAnalyticsWindDownEvent)initWithWindDownEventData:(id)a3 watchProductType:(id)a4 weeksSinceOnboarded:(id)a5;
- (NSDictionary)eventPayload;
- (NSString)eventName;
- (void)setEventName:(id)a3;
- (void)setEventPayload:(id)a3;
@end

@implementation HKSPAnalyticsWindDownEvent

- (HKSPAnalyticsWindDownEvent)initWithWindDownEventData:(id)a3 watchProductType:(id)a4 weeksSinceOnboarded:(id)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HKSPAnalyticsWindDownEvent;
  v11 = [(HKSPAnalyticsWindDownEvent *)&v29 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_eventName, @"com.apple.SleepHealth.WindDownActionsEvent");
    v13 = objc_msgSend((id)objc_opt_class(), "_payloadValueForWindDownAction:", objc_msgSend(v8, "action"));
    uint64_t v14 = [v8 wasUsed];
    id v15 = v10;
    id v27 = v9;
    id v16 = v9;
    v17 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v18 = v13;
    id v19 = [v17 alloc];
    v30[0] = @"windDownActionPresented";
    v30[1] = @"windDownActionUsed";
    v31[0] = v18;
    v20 = [MEMORY[0x1E4F28ED0] numberWithBool:v14];
    v31[1] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

    v22 = (void *)[v19 initWithDictionary:v21];
    if (v16) {
      [v22 setObject:v16 forKeyedSubscript:@"activeWatchProductType"];
    }
    if (v15) {
      [v22 setObject:v15 forKeyedSubscript:@"weeksSinceOnboardedWindDownActions"];
    }
    uint64_t v23 = objc_msgSend(v22, "copy", v27);

    eventPayload = v12->_eventPayload;
    v12->_eventPayload = (NSDictionary *)v23;

    v25 = v12;
    id v9 = v28;
  }

  return v12;
}

+ (id)_payloadValueForWindDownAction:(unint64_t)a3
{
  if (a3 > 3) {
    return &stru_1EFE54160;
  }
  else {
    return off_1E5D31B10[a3];
  }
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