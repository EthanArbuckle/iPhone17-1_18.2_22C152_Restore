@interface SACalendarShowNextEvent
+ (id)showNextEvent;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SACalendarShowNextEvent

- (id)groupIdentifier
{
  return @"com.apple.ace.calendar";
}

- (id)encodedClassName
{
  return @"ShowNextEvent";
}

+ (id)showNextEvent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end