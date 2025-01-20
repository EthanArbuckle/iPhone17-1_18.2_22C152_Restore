@interface STPresetsValueChangedCoreAnalyticsEvent
+ (id)description;
- (NSDictionary)payload;
- (NSString)fieldName;
- (NSString)name;
- (NSString)recommendedPresetId;
- (NSString)sessionId;
- (STPresetsValueChangedCoreAnalyticsEvent)initWithSessionId:(id)a3 recommendedPresetId:(id)a4 fieldName:(id)a5 recommendedValue:(id)a6 selectedValue:(id)a7;
- (id)recommendedValue;
- (id)selectedValue;
@end

@implementation STPresetsValueChangedCoreAnalyticsEvent

- (STPresetsValueChangedCoreAnalyticsEvent)initWithSessionId:(id)a3 recommendedPresetId:(id)a4 fieldName:(id)a5 recommendedValue:(id)a6 selectedValue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)STPresetsValueChangedCoreAnalyticsEvent;
  v17 = [(STPresetsValueChangedCoreAnalyticsEvent *)&v21 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    sessionId = v17->_sessionId;
    v17->_sessionId = (NSString *)v18;

    objc_storeStrong((id *)&v17->_recommendedPresetId, a4);
    objc_storeStrong((id *)&v17->_fieldName, a5);
    objc_storeStrong(&v17->_recommendedValue, a6);
    objc_storeStrong(&v17->_selectedValue, a7);
  }

  return v17;
}

- (NSString)name
{
  return (NSString *)@"com.apple.Family.PresetsValueChanged";
}

+ (id)description
{
  return @"PresetsValueChanged";
}

- (NSDictionary)payload
{
  v3 = objc_opt_new();
  v4 = [(STPresetsValueChangedCoreAnalyticsEvent *)self fieldName];
  [v3 setObject:v4 forKeyedSubscript:@"fieldName"];

  v5 = [(STPresetsValueChangedCoreAnalyticsEvent *)self recommendedPresetId];
  [v3 setObject:v5 forKeyedSubscript:@"recommendedPresetId"];

  v6 = [(STPresetsValueChangedCoreAnalyticsEvent *)self recommendedValue];
  [v3 setObject:v6 forKeyedSubscript:@"recommendedValue"];

  v7 = [(STPresetsValueChangedCoreAnalyticsEvent *)self selectedValue];
  [v3 setObject:v7 forKeyedSubscript:@"selectedValue"];

  return (NSDictionary *)v3;
}

- (NSString)sessionId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)fieldName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)recommendedPresetId
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)recommendedValue
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)selectedValue
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedValue, 0);
  objc_storeStrong(&self->_recommendedValue, 0);
  objc_storeStrong((id *)&self->_recommendedPresetId, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end