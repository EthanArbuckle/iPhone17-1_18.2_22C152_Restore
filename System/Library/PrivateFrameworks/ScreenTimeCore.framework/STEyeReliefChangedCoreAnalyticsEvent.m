@interface STEyeReliefChangedCoreAnalyticsEvent
+ (id)description;
- (BOOL)eyeReliefEnabled;
- (NSDictionary)payload;
- (NSString)name;
- (STEyeReliefChangedCoreAnalyticsEvent)initWithEyeReliefEnabled:(BOOL)a3;
@end

@implementation STEyeReliefChangedCoreAnalyticsEvent

- (STEyeReliefChangedCoreAnalyticsEvent)initWithEyeReliefEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STEyeReliefChangedCoreAnalyticsEvent;
  result = [(STEyeReliefChangedCoreAnalyticsEvent *)&v5 init];
  result->_eyeReliefEnabled = a3;
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.ScreenTime.eyeReliefChanged";
}

+ (id)description
{
  return @"EyeReliefChanged";
}

- (NSDictionary)payload
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = @"eyeReliefEnabled";
  v2 = objc_msgSend(NSNumber, "numberWithBool:", -[STEyeReliefChangedCoreAnalyticsEvent eyeReliefEnabled](self, "eyeReliefEnabled"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (BOOL)eyeReliefEnabled
{
  return self->_eyeReliefEnabled;
}

@end