@interface SAPerformDataDetectionMatch
+ (id)performDataDetectionMatch;
- (BOOL)requiresResponse;
- (NSNumber)length;
- (NSNumber)location;
- (NSString)dataDetectionType;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDataDetectionType:(id)a3;
- (void)setLength:(id)a3;
- (void)setLocation:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SAPerformDataDetectionMatch

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PerformDataDetectionMatch";
}

+ (id)performDataDetectionMatch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)dataDetectionType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dataDetectionType"];
}

- (void)setDataDetectionType:(id)a3
{
}

- (NSNumber)length
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"length"];
}

- (void)setLength:(id)a3
{
}

- (NSNumber)location
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"location"];
}

- (void)setLocation:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end