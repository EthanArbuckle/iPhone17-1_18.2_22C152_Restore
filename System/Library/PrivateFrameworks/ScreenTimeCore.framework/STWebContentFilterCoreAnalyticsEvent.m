@interface STWebContentFilterCoreAnalyticsEvent
+ (id)description;
- (BOOL)webContentFilterEnabled;
- (NSDictionary)payload;
- (NSString)name;
- (STWebContentFilterCoreAnalyticsEvent)initWithWebContentFilterEnabled:(BOOL)a3;
@end

@implementation STWebContentFilterCoreAnalyticsEvent

- (STWebContentFilterCoreAnalyticsEvent)initWithWebContentFilterEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STWebContentFilterCoreAnalyticsEvent;
  result = [(STWebContentFilterCoreAnalyticsEvent *)&v5 init];
  result->_webContentFilterEnabled = a3;
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.ScreenTime.webContentFilterEnabled";
}

+ (id)description
{
  return @"WebContentFilterState";
}

- (NSDictionary)payload
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = @"webContentFilterEnabled";
  v2 = objc_msgSend(NSNumber, "numberWithBool:", -[STWebContentFilterCoreAnalyticsEvent webContentFilterEnabled](self, "webContentFilterEnabled"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (BOOL)webContentFilterEnabled
{
  return self->_webContentFilterEnabled;
}

@end