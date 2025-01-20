@interface SALCMVodViewingContext
+ (id)vodViewingContext;
- (NSDate)originalEventStartTime;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setOriginalEventStartTime:(id)a3;
@end

@implementation SALCMVodViewingContext

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"VodViewingContext";
}

+ (id)vodViewingContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)originalEventStartTime
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"originalEventStartTime"];
}

- (void)setOriginalEventStartTime:(id)a3
{
}

@end