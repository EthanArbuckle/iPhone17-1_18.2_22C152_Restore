@interface SASSpeechAlternativesSnippet
+ (id)speechAlternativesSnippet;
- (NSString)sessionId;
- (SASRecognition)recognition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)maxEntryToShow;
- (void)setMaxEntryToShow:(int64_t)a3;
- (void)setRecognition:(id)a3;
- (void)setSessionId:(id)a3;
@end

@implementation SASSpeechAlternativesSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SpeechAlternativesSnippet";
}

+ (id)speechAlternativesSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)maxEntryToShow
{
  return AceObjectIntegerForProperty(self, @"maxEntryToShow");
}

- (void)setMaxEntryToShow:(int64_t)a3
{
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, @"recognition");
}

- (void)setRecognition:(id)a3
{
}

- (NSString)sessionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sessionId"];
}

- (void)setSessionId:(id)a3
{
}

@end