@interface SAUIRevealRecognizedSpeech
- (BOOL)requiresResponse;
- (NSArray)asrAlternatives;
- (NSString)overriddenSpeech;
- (NSString)speechRecognizedAceId;
- (SASRecognition)recognition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAsrAlternatives:(id)a3;
- (void)setOverriddenSpeech:(id)a3;
- (void)setRecognition:(id)a3;
- (void)setSpeechRecognizedAceId:(id)a3;
@end

@implementation SAUIRevealRecognizedSpeech

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"RevealRecognizedSpeech";
}

- (NSArray)asrAlternatives
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"asrAlternatives"];
}

- (void)setAsrAlternatives:(id)a3
{
}

- (NSString)overriddenSpeech
{
  return (NSString *)[(AceObject *)self propertyForKey:@"overriddenSpeech"];
}

- (void)setOverriddenSpeech:(id)a3
{
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, @"recognition");
}

- (void)setRecognition:(id)a3
{
}

- (NSString)speechRecognizedAceId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speechRecognizedAceId"];
}

- (void)setSpeechRecognizedAceId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end