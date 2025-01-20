@interface HKSPAnalyticsSleepNotificationEvent
- (HKSPAnalyticsSleepNotificationEvent)initWithType:(unint64_t)a3 action:(unint64_t)a4;
- (NSDictionary)eventPayload;
- (NSString)description;
- (NSString)eventName;
- (void)setEventName:(id)a3;
- (void)setEventPayload:(id)a3;
@end

@implementation HKSPAnalyticsSleepNotificationEvent

- (HKSPAnalyticsSleepNotificationEvent)initWithType:(unint64_t)a3 action:(unint64_t)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HKSPAnalyticsSleepNotificationEvent;
  v6 = [(HKSPAnalyticsSleepNotificationEvent *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, @"com.apple.SleepHealth.SleepNotificationEvent");
    v8 = @"FocusIntroduction";
    if (!a3) {
      v8 = @"BedtimeReminder";
    }
    v17[0] = @"notificationType";
    v17[1] = @"notificationAction";
    v18[0] = v8;
    if (a4 - 1 > 3) {
      v9 = @"Fired";
    }
    else {
      v9 = off_1E5D343A0[a4 - 1];
    }
    v18[1] = v9;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11 = v8;
    uint64_t v12 = [v10 dictionaryWithObjects:v18 forKeys:v17 count:2];
    eventPayload = v7->_eventPayload;
    v7->_eventPayload = (NSDictionary *)v12;

    v14 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"[%@.%p] event=%@, payload=%@", v5, self, self->_eventName, self->_eventPayload];

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