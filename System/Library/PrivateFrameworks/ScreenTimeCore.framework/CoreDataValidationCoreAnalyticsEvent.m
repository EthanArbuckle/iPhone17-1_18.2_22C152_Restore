@interface CoreDataValidationCoreAnalyticsEvent
+ (id)description;
- (CoreDataValidationCoreAnalyticsEvent)initWithValidationError:(int64_t)a3;
- (NSDictionary)payload;
- (NSString)name;
- (int64_t)validationError;
@end

@implementation CoreDataValidationCoreAnalyticsEvent

- (CoreDataValidationCoreAnalyticsEvent)initWithValidationError:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreDataValidationCoreAnalyticsEvent;
  result = [(CoreDataValidationCoreAnalyticsEvent *)&v5 init];
  if (result) {
    result->_validationError = a3;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.ScreenTime.coreDataValidation";
}

+ (id)description
{
  return @"CoreDataValidation";
}

- (NSDictionary)payload
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = @"validationError";
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", -[CoreDataValidationCoreAnalyticsEvent validationError](self, "validationError"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (int64_t)validationError
{
  return self->_validationError;
}

@end