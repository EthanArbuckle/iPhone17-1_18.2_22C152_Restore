@interface STPresetsEnableRestrictionsCoreAnalyticsEvent
+ (id)description;
- (NSDictionary)payload;
- (NSNumber)lowerBoundAgeRange;
- (NSNumber)upperBoundAgeRange;
- (NSString)name;
- (NSString)sessionId;
- (STPresetsEnableRestrictionsCoreAnalyticsEvent)initWithSessionId:(id)a3 selectionType:(int64_t)a4 lowerBoundAgeRange:(id)a5 upperBoundAgeRange:(id)a6;
- (id)_stringDescriptionForSelectionType:(int64_t)a3;
- (int64_t)selectionType;
@end

@implementation STPresetsEnableRestrictionsCoreAnalyticsEvent

- (STPresetsEnableRestrictionsCoreAnalyticsEvent)initWithSessionId:(id)a3 selectionType:(int64_t)a4 lowerBoundAgeRange:(id)a5 upperBoundAgeRange:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)STPresetsEnableRestrictionsCoreAnalyticsEvent;
  v13 = [(STPresetsEnableRestrictionsCoreAnalyticsEvent *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    sessionId = v13->_sessionId;
    v13->_sessionId = (NSString *)v14;

    v13->_selectionType = a4;
    objc_storeStrong((id *)&v13->_lowerBoundAgeRange, a5);
    objc_storeStrong((id *)&v13->_upperBoundAgeRange, a6);
  }

  return v13;
}

- (NSString)name
{
  return (NSString *)@"com.apple.Family.EnablePresetsSelected";
}

+ (id)description
{
  return @"EnablePresetsSelected";
}

- (NSDictionary)payload
{
  v3 = objc_opt_new();
  v4 = [(STPresetsEnableRestrictionsCoreAnalyticsEvent *)self sessionId];
  [v3 setObject:v4 forKeyedSubscript:@"sessionId"];

  v5 = [(STPresetsEnableRestrictionsCoreAnalyticsEvent *)self _stringDescriptionForSelectionType:[(STPresetsEnableRestrictionsCoreAnalyticsEvent *)self selectionType]];
  [v3 setObject:v5 forKeyedSubscript:@"selectionType"];

  v6 = [(STPresetsEnableRestrictionsCoreAnalyticsEvent *)self lowerBoundAgeRange];
  [v3 setObject:v6 forKeyedSubscript:@"lowerBoundAgeRange"];

  v7 = [(STPresetsEnableRestrictionsCoreAnalyticsEvent *)self upperBoundAgeRange];
  [v3 setObject:v7 forKeyedSubscript:@"upperBoundAgeRange"];

  return (NSDictionary *)v3;
}

- (id)_stringDescriptionForSelectionType:(int64_t)a3
{
  if (a3) {
    return @"recommended";
  }
  else {
    return @"custom";
  }
}

- (NSString)sessionId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (NSNumber)lowerBoundAgeRange
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)upperBoundAgeRange
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperBoundAgeRange, 0);
  objc_storeStrong((id *)&self->_lowerBoundAgeRange, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end