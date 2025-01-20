@interface SASmsCancelCurrentAudioPlayBack
+ (id)cancelCurrentAudioPlayBack;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASmsCancelCurrentAudioPlayBack

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"CancelCurrentAudioPlayBack";
}

+ (id)cancelCurrentAudioPlayBack
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end