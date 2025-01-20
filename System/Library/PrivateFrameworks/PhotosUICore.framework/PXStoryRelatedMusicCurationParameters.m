@interface PXStoryRelatedMusicCurationParameters
- (NSSet)recentlyUsedAppleMusicSongIDs;
- (NSSet)recentlyUsedFlexSongIDs;
- (PXStoryRelatedMusicCurationParameters)init;
- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3;
- (void)setRecentlyUsedFlexSongIDs:(id)a3;
@end

@implementation PXStoryRelatedMusicCurationParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, 0);
}

- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3
{
}

- (NSSet)recentlyUsedAppleMusicSongIDs
{
  return self->_recentlyUsedAppleMusicSongIDs;
}

- (void)setRecentlyUsedFlexSongIDs:(id)a3
{
}

- (NSSet)recentlyUsedFlexSongIDs
{
  return self->_recentlyUsedFlexSongIDs;
}

- (PXStoryRelatedMusicCurationParameters)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryRelatedMusicCurationParameters;
  v2 = [(PXStoryRelatedMusicCurationParameters *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
    recentlyUsedFlexSongIDs = v2->_recentlyUsedFlexSongIDs;
    v2->_recentlyUsedFlexSongIDs = (NSSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
    recentlyUsedAppleMusicSongIDs = v2->_recentlyUsedAppleMusicSongIDs;
    v2->_recentlyUsedAppleMusicSongIDs = (NSSet *)v5;
  }
  return v2;
}

@end