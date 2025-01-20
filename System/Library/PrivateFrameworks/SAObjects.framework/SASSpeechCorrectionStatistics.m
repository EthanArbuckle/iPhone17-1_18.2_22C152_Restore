@interface SASSpeechCorrectionStatistics
+ (id)speechCorrectionStatistics;
- (BOOL)requiresResponse;
- (NSString)correctionSource;
- (NSString)correctionText;
- (NSString)interactionId;
- (NSString)sessionId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)alternativeSelectCount;
- (int64_t)characterChangeCount;
- (void)setAlternativeSelectCount:(int64_t)a3;
- (void)setCharacterChangeCount:(int64_t)a3;
- (void)setCorrectionSource:(id)a3;
- (void)setCorrectionText:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setSessionId:(id)a3;
@end

@implementation SASSpeechCorrectionStatistics

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SpeechCorrectionStatistics";
}

+ (id)speechCorrectionStatistics
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)alternativeSelectCount
{
  return AceObjectIntegerForProperty(self, @"alternativeSelectCount");
}

- (void)setAlternativeSelectCount:(int64_t)a3
{
}

- (int64_t)characterChangeCount
{
  return AceObjectIntegerForProperty(self, @"characterChangeCount");
}

- (void)setCharacterChangeCount:(int64_t)a3
{
}

- (NSString)correctionSource
{
  return (NSString *)[(AceObject *)self propertyForKey:@"correctionSource"];
}

- (void)setCorrectionSource:(id)a3
{
}

- (NSString)correctionText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"correctionText"];
}

- (void)setCorrectionText:(id)a3
{
}

- (NSString)interactionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interactionId"];
}

- (void)setInteractionId:(id)a3
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