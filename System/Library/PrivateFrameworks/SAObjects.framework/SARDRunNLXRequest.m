@interface SARDRunNLXRequest
- (BOOL)requiresResponse;
- (NSNumber)processedAudioDuration;
- (NSString)userId;
- (SASRecognition)asrOutput;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAsrOutput:(id)a3;
- (void)setProcessedAudioDuration:(id)a3;
- (void)setUserId:(id)a3;
@end

@implementation SARDRunNLXRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"RunNLXRequest";
}

- (SASRecognition)asrOutput
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, @"asrOutput");
}

- (void)setAsrOutput:(id)a3
{
}

- (NSNumber)processedAudioDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"processedAudioDuration"];
}

- (void)setProcessedAudioDuration:(id)a3
{
}

- (NSString)userId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userId"];
}

- (void)setUserId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end