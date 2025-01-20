@interface SATTSSpeechSynthesisStreaming
+ (id)speechSynthesisStreaming;
- (BOOL)requiresResponse;
- (NSString)streamId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStreamId:(id)a3;
@end

@implementation SATTSSpeechSynthesisStreaming

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisStreaming";
}

+ (id)speechSynthesisStreaming
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)streamId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"streamId"];
}

- (void)setStreamId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end