@interface SALCMSportingEvent
+ (id)sportingEvent;
- (NSURL)sportingEventId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSportingEventId:(id)a3;
@end

@implementation SALCMSportingEvent

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"SportingEvent";
}

+ (id)sportingEvent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)sportingEventId
{
  return (NSURL *)AceObjectURLForProperty(self, @"sportingEventId");
}

- (void)setSportingEventId:(id)a3
{
}

@end