@interface SAUICancelCurrentTTS
+ (id)cancelCurrentTTS;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAUICancelCurrentTTS

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"CancelCurrentTTS";
}

+ (id)cancelCurrentTTS
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end