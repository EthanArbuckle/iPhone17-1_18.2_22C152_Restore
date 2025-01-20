@interface SASSpeechRecognized
+ (id)speechRecognized;
- (BOOL)eager;
- (BOOL)requiresResponse;
- (NSNumber)processedAudioDuration;
- (NSString)resultId;
- (NSString)sessionId;
- (NSString)title;
- (SASAudioAnalytics)audioAnalytics;
- (SASRecognition)recognition;
- (SAUIGetResponseAlternatives)responseAlternatives;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioAnalytics:(id)a3;
- (void)setEager:(BOOL)a3;
- (void)setProcessedAudioDuration:(id)a3;
- (void)setRecognition:(id)a3;
- (void)setResponseAlternatives:(id)a3;
- (void)setResultId:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SASSpeechRecognized

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SpeechRecognized";
}

+ (id)speechRecognized
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASAudioAnalytics)audioAnalytics
{
  return (SASAudioAnalytics *)AceObjectAceObjectForProperty(self, @"audioAnalytics");
}

- (void)setAudioAnalytics:(id)a3
{
}

- (BOOL)eager
{
  return AceObjectBoolForProperty(self, @"eager");
}

- (void)setEager:(BOOL)a3
{
}

- (NSNumber)processedAudioDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"processedAudioDuration"];
}

- (void)setProcessedAudioDuration:(id)a3
{
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, @"recognition");
}

- (void)setRecognition:(id)a3
{
}

- (SAUIGetResponseAlternatives)responseAlternatives
{
  return (SAUIGetResponseAlternatives *)AceObjectAceObjectForProperty(self, @"responseAlternatives");
}

- (void)setResponseAlternatives:(id)a3
{
}

- (NSString)resultId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resultId"];
}

- (void)setResultId:(id)a3
{
}

- (NSString)sessionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sessionId"];
}

- (void)setSessionId:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end