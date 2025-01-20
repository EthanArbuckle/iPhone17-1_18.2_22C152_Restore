@interface SASServerBoundConfusionNetwork
+ (id)serverBoundConfusionNetwork;
- (BOOL)requiresResponse;
- (SASRecognition)rawRecognition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRawRecognition:(id)a3;
@end

@implementation SASServerBoundConfusionNetwork

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"ServerBoundConfusionNetwork";
}

+ (id)serverBoundConfusionNetwork
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

- (BOOL)requiresResponse
{
  return 0;
}

@end