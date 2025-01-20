@interface StoryPassthroughMusicCurationProvider
- (NSArray)recentlyUsedAppleMusicSongIDs;
- (NSArray)recentlyUsedFlexSongIDs;
- (id)requestMusicCurationForAssetContainer:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3;
- (void)setRecentlyUsedFlexSongIDs:(id)a3;
@end

@implementation StoryPassthroughMusicCurationProvider

- (id)requestMusicCurationForAssetContainer:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  sub_1AB22F8DC();
  v11 = (void *)sub_1AA864CA0((uint64_t)v9, a4, (uint64_t)self, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
  return v11;
}

- (NSArray)recentlyUsedFlexSongIDs
{
  swift_beginAccess();
  if (*(void *)self->recentlyUsedFlexSongIDs) {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  }
  return (NSArray *)0;
}

- (void)setRecentlyUsedFlexSongIDs:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1AB23AADC();
  }
  else {
    uint64_t v4 = 0;
  }
  swift_beginAccess();
  *(void *)self->recentlyUsedFlexSongIDs = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)recentlyUsedAppleMusicSongIDs
{
  swift_beginAccess();
  if (*(void *)self->recentlyUsedAppleMusicSongIDs) {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  }
  return (NSArray *)0;
}

- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1AB23AADC();
  }
  else {
    uint64_t v4 = 0;
  }
  swift_beginAccess();
  *(void *)self->recentlyUsedAppleMusicSongIDs = v4;
  swift_bridgeObjectRelease();
}

@end