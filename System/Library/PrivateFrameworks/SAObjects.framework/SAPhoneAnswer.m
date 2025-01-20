@interface SAPhoneAnswer
+ (id)answer;
- (BOOL)requiresResponse;
- (BOOL)videoAllowed;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setVideoAllowed:(BOOL)a3;
@end

@implementation SAPhoneAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"Answer";
}

+ (id)answer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)videoAllowed
{
  return AceObjectBoolForProperty(self, @"videoAllowed");
}

- (void)setVideoAllowed:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end