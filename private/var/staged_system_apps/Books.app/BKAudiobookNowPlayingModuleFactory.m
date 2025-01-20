@interface BKAudiobookNowPlayingModuleFactory
+ (id)currentMiniPlayer;
+ (id)fetchOrCreateMiniPlayer;
+ (id)instantiate;
- (BKAudiobookNowPlayingModuleFactory)init;
@end

@implementation BKAudiobookNowPlayingModuleFactory

+ (id)instantiate
{
  v2 = (void *)sub_10045A664(0x657263736C6C7566, (void *)0xEA00000000006E65, (uint64_t (*)(void))type metadata accessor for AudiobookNowPlayingFullscreenTouchViewController, (uint64_t (*)(id, uint64_t, uint64_t, id, uint64_t, id))sub_100459E4C);

  return v2;
}

+ (id)fetchOrCreateMiniPlayer
{
  v2 = (void *)sub_10045A094();
  if (!v2) {
    v2 = (void *)sub_10045A664(1768843629, (void *)0xE400000000000000, (uint64_t (*)(void))type metadata accessor for AudiobookNowPlayingMiniTouchViewController, (uint64_t (*)(id, uint64_t, uint64_t, id, uint64_t, id))sub_10045940C);
  }

  return v2;
}

+ (id)currentMiniPlayer
{
  v2 = (void *)sub_10045A094();

  return v2;
}

- (BKAudiobookNowPlayingModuleFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(BKAudiobookNowPlayingModuleFactory *)&v3 init];
}

@end