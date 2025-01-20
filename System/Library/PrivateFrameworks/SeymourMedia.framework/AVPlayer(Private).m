@interface AVPlayer(Private)
+ (id)smm_playbackRateDidChangedNotification;
+ (id)smm_playbackWasInterruptedNotification;
@end

@implementation AVPlayer(Private)

+ (id)smm_playbackWasInterruptedNotification
{
  return (id)*MEMORY[0x263EFA108];
}

+ (id)smm_playbackRateDidChangedNotification
{
  return (id)*MEMORY[0x263EFA118];
}

@end