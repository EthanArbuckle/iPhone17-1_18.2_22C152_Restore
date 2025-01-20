@interface SAUIShowSpeechAlternatives
+ (id)showSpeechAlternatives;
- (BOOL)requiresResponse;
- (NSString)requestId;
- (NSString)title;
- (SASRecognition)recognition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRecognition:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAUIShowSpeechAlternatives

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ShowSpeechAlternatives";
}

+ (id)showSpeechAlternatives
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, @"recognition");
}

- (void)setRecognition:(id)a3
{
}

- (NSString)requestId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestId"];
}

- (void)setRequestId:(id)a3
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