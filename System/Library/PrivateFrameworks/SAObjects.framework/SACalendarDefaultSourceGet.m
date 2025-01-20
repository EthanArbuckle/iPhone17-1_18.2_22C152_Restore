@interface SACalendarDefaultSourceGet
+ (id)defaultSourceGet;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SACalendarDefaultSourceGet

- (id)groupIdentifier
{
  return @"com.apple.ace.calendar";
}

- (id)encodedClassName
{
  return @"DefaultSourceGet";
}

+ (id)defaultSourceGet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end