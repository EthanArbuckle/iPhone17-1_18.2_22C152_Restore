@interface MusicDistributedNotificationCenter
+ (id)default;
@end

@implementation MusicDistributedNotificationCenter

+ (id)default
{
  return +[NSDistributedNotificationCenter defaultCenter];
}

@end