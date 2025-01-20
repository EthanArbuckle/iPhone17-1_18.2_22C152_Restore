@interface SAStartMultiUserTestRequest
+ (id)startMultiUserTestRequest;
- (BOOL)requiresResponse;
- (NSString)expectedSelectedSharedUserId;
- (SAConfidenceScores)voiceIDConfidenceScores;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setExpectedSelectedSharedUserId:(id)a3;
- (void)setVoiceIDConfidenceScores:(id)a3;
@end

@implementation SAStartMultiUserTestRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StartMultiUserTestRequest";
}

+ (id)startMultiUserTestRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)expectedSelectedSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"expectedSelectedSharedUserId"];
}

- (void)setExpectedSelectedSharedUserId:(id)a3
{
}

- (SAConfidenceScores)voiceIDConfidenceScores
{
  return (SAConfidenceScores *)AceObjectAceObjectForProperty(self, @"voiceIDConfidenceScores");
}

- (void)setVoiceIDConfidenceScores:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end