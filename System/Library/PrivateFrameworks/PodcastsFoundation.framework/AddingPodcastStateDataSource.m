@interface AddingPodcastStateDataSource
- (_TtC18PodcastsFoundation28AddingPodcastStateDataSource)init;
- (void)updateAddingShowsWithStoreCollectionIds:(id)a3;
@end

@implementation AddingPodcastStateDataSource

- (void)updateAddingShowsWithStoreCollectionIds:(id)a3
{
  uint64_t v4 = sub_1ACE76988();
  v5 = self;
  sub_1ACE28CE8(v4);

  swift_bridgeObjectRelease();
}

- (_TtC18PodcastsFoundation28AddingPodcastStateDataSource)init
{
  return (_TtC18PodcastsFoundation28AddingPodcastStateDataSource *)AddingPodcastStateDataSource.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation28AddingPodcastStateDataSource_refreshQueue));
  swift_release();
  swift_bridgeObjectRelease();
}

@end