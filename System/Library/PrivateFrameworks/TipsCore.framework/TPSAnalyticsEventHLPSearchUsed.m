@interface TPSAnalyticsEventHLPSearchUsed
+ (BOOL)supportsSecureCoding;
+ (id)event;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
@end

@implementation TPSAnalyticsEventHLPSearchUsed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)event
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDate:0];
  return v2;
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"HLPsearchUsed"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v2 setObject:v3 forKeyedSubscript:@"u65_flag"];

  return v2;
}

@end