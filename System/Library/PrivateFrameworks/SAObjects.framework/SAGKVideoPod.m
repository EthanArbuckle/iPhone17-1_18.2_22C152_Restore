@interface SAGKVideoPod
+ (id)videoPod;
- (NSArray)videos;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setVideos:(id)a3;
@end

@implementation SAGKVideoPod

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"VideoPod";
}

+ (id)videoPod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)videos
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"videos", v3);
}

- (void)setVideos:(id)a3
{
}

@end