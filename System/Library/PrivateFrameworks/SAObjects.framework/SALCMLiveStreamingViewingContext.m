@interface SALCMLiveStreamingViewingContext
+ (id)liveStreamingViewingContext;
- (BOOL)watchingLive;
- (NSDate)eventStartTime;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEventStartTime:(id)a3;
- (void)setWatchingLive:(BOOL)a3;
@end

@implementation SALCMLiveStreamingViewingContext

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"LiveStreamingViewingContext";
}

+ (id)liveStreamingViewingContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)eventStartTime
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"eventStartTime"];
}

- (void)setEventStartTime:(id)a3
{
}

- (BOOL)watchingLive
{
  return AceObjectBoolForProperty(self, @"watchingLive");
}

- (void)setWatchingLive:(BOOL)a3
{
}

@end