@interface SAUIExtendCurrentTTS
+ (id)extendCurrentTTS;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAUIExtendCurrentTTS

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ExtendCurrentTTS";
}

+ (id)extendCurrentTTS
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end