@interface HDSHBreathingDisturbanceAnalysisAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HDSHBreathingDisturbanceAnalysisAnalyticsEvent)initWithDefaultAnalyticsPayload:(id)a3;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HDSHBreathingDisturbanceAnalysisAnalyticsEvent

- (NSString)eventName
{
  return (NSString *)@"com.apple.hid.bd.sleepnotification";
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (HDSHBreathingDisturbanceAnalysisAnalyticsEvent)initWithDefaultAnalyticsPayload:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSHBreathingDisturbanceAnalysisAnalyticsEvent;
  v6 = [(HDSHBreathingDisturbanceAnalysisAnalyticsEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_defaultAnalyticsPayload, a3);
  }

  return v7;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = [(NSDictionary *)self->_defaultAnalyticsPayload objectForKeyedSubscript:@"bd_count"];
  [v7 setObject:v8 forKeyedSubscript:@"bd_count"];

  objc_super v9 = NSNumber;
  v10 = [v6 environmentDataSource];

  v11 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isImproveHealthAndActivityEnabled"));
  [v7 setObject:v11 forKeyedSubscript:@"is_improve_health_and_activity_allowed"];

  v12 = (void *)[v7 copy];
  return v12;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithDictionary:self->_defaultAnalyticsPayload];
  v8 = NSNumber;
  objc_super v9 = [v6 environmentDataSource];

  v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "isImproveHealthAndActivityEnabled"));
  [v7 setObject:v10 forKeyedSubscript:@"is_improve_health_and_activity_allowed"];

  v11 = (void *)[v7 copy];
  return v11;
}

- (void).cxx_destruct
{
}

@end