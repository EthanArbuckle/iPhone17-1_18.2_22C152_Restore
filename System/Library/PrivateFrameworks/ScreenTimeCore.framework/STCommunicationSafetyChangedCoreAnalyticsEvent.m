@interface STCommunicationSafetyChangedCoreAnalyticsEvent
+ (id)description;
- (BOOL)communicationSafetyEnabled;
- (NSDictionary)payload;
- (NSString)name;
- (STCommunicationSafetyChangedCoreAnalyticsEvent)initWithCommunicationSafetyEnabled:(BOOL)a3;
@end

@implementation STCommunicationSafetyChangedCoreAnalyticsEvent

- (STCommunicationSafetyChangedCoreAnalyticsEvent)initWithCommunicationSafetyEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STCommunicationSafetyChangedCoreAnalyticsEvent;
  result = [(STCommunicationSafetyChangedCoreAnalyticsEvent *)&v5 init];
  result->_communicationSafetyEnabled = a3;
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.ScreenTime.communicationSafetyChanged";
}

+ (id)description
{
  return @"CommunicationSafetyChanged";
}

- (NSDictionary)payload
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = @"communicationSafetyEnabled";
  v2 = objc_msgSend(NSNumber, "numberWithBool:", -[STCommunicationSafetyChangedCoreAnalyticsEvent communicationSafetyEnabled](self, "communicationSafetyEnabled"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (BOOL)communicationSafetyEnabled
{
  return self->_communicationSafetyEnabled;
}

@end