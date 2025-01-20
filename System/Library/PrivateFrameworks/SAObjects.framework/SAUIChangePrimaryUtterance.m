@interface SAUIChangePrimaryUtterance
+ (id)changePrimaryUtterance;
- (BOOL)requiresResponse;
- (NSString)speechRecognitionId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)utteranceIndex;
- (void)setSpeechRecognitionId:(id)a3;
- (void)setUtteranceIndex:(int64_t)a3;
@end

@implementation SAUIChangePrimaryUtterance

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ChangePrimaryUtterance";
}

+ (id)changePrimaryUtterance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)speechRecognitionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speechRecognitionId"];
}

- (void)setSpeechRecognitionId:(id)a3
{
}

- (int64_t)utteranceIndex
{
  return AceObjectIntegerForProperty(self, @"utteranceIndex");
}

- (void)setUtteranceIndex:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end