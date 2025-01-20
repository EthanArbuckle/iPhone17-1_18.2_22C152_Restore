@interface SASmsPlayAudio
+ (id)playAudio;
- (BOOL)requiresResponse;
- (SASmsSms)message;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMessage:(id)a3;
@end

@implementation SASmsPlayAudio

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"PlayAudio";
}

+ (id)playAudio
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASmsSms)message
{
  return (SASmsSms *)AceObjectAceObjectForProperty(self, @"message");
}

- (void)setMessage:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end