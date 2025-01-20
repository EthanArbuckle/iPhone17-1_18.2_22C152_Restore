@interface STRecoveryEmailMismatchCoreAnalyticsEvent
+ (id)description;
- (BOOL)isRecoveryEmailMismatched;
- (NSDictionary)payload;
- (NSString)name;
- (STRecoveryEmailMismatchCoreAnalyticsEvent)initWithRecoveryEmailMismatched:(BOOL)a3;
@end

@implementation STRecoveryEmailMismatchCoreAnalyticsEvent

- (STRecoveryEmailMismatchCoreAnalyticsEvent)initWithRecoveryEmailMismatched:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STRecoveryEmailMismatchCoreAnalyticsEvent;
  result = [(STRecoveryEmailMismatchCoreAnalyticsEvent *)&v5 init];
  result->_isRecoveryEmailMismatched = a3;
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.ScreenTime.RecoveryEmailMismatch";
}

+ (id)description
{
  return @"RecoveryEmailMismatch";
}

- (NSDictionary)payload
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = @"isRecoveryEmailMismatched";
  v2 = objc_msgSend(NSNumber, "numberWithBool:", -[STRecoveryEmailMismatchCoreAnalyticsEvent isRecoveryEmailMismatched](self, "isRecoveryEmailMismatched"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (BOOL)isRecoveryEmailMismatched
{
  return self->_isRecoveryEmailMismatched;
}

@end