@interface SAMPNowPlayingQueuePosition
+ (id)nowPlayingQueuePosition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)index;
- (int64_t)queueSize;
- (void)setIndex:(int64_t)a3;
- (void)setQueueSize:(int64_t)a3;
@end

@implementation SAMPNowPlayingQueuePosition

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"NowPlayingQueuePosition";
}

+ (id)nowPlayingQueuePosition
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)index
{
  return AceObjectIntegerForProperty(self, @"index");
}

- (void)setIndex:(int64_t)a3
{
}

- (int64_t)queueSize
{
  return AceObjectIntegerForProperty(self, @"queueSize");
}

- (void)setQueueSize:(int64_t)a3
{
}

@end