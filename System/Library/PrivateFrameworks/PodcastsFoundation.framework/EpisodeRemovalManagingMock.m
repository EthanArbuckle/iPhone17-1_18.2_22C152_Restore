@interface EpisodeRemovalManagingMock
- (void)removeEpisodesWith:(id)a3;
@end

@implementation EpisodeRemovalManagingMock

- (void)removeEpisodesWith:(id)a3
{
  uint64_t v4 = sub_1ACE76578();
  v5 = *(void (**)(uint64_t))self->removeEpisodesHandler;
  if (v5)
  {
    swift_retain();
    v5(v4);
    swift_release();
  }
  swift_bridgeObjectRelease();
}

@end