@interface SASClientBoundConfusionNetwork
+ (id)clientBoundConfusionNetwork;
- (BOOL)requiresResponse;
- (NSString)sessionId;
- (SASRecognition)rawRecognition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRawRecognition:(id)a3;
- (void)setSessionId:(id)a3;
@end

@implementation SASClientBoundConfusionNetwork

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"ClientBoundConfusionNetwork";
}

+ (id)clientBoundConfusionNetwork
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASRecognition)rawRecognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, @"rawRecognition");
}

- (void)setRawRecognition:(id)a3
{
}

- (NSString)sessionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sessionId"];
}

- (void)setSessionId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end