@interface SASPronunciationRecognized
+ (id)pronunciationRecognized;
- (BOOL)requiresResponse;
- (NSNumber)errorCode;
- (NSString)interactionId;
- (SASPronunciationData)pronunciationData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setErrorCode:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setPronunciationData:(id)a3;
@end

@implementation SASPronunciationRecognized

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"PronunciationRecognized";
}

+ (id)pronunciationRecognized
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)errorCode
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"errorCode"];
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)interactionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interactionId"];
}

- (void)setInteractionId:(id)a3
{
}

- (SASPronunciationData)pronunciationData
{
  return (SASPronunciationData *)AceObjectAceObjectForProperty(self, @"pronunciationData");
}

- (void)setPronunciationData:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end