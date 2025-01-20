@interface PodcastFeedDownloader
- (_TtC18PodcastsFoundation21PodcastFeedDownloader)init;
- (void)downloadPodcast:(id)a3 triggerBy:(id)a4 allowEpisodesTo404:(BOOL)a5 isImplicitActionRequest:(BOOL)a6 completion:(id)a7;
@end

@implementation PodcastFeedDownloader

- (_TtC18PodcastsFoundation21PodcastFeedDownloader)init
{
  return (_TtC18PodcastsFoundation21PodcastFeedDownloader *)PodcastFeedDownloader.init()();
}

- (void)downloadPodcast:(id)a3 triggerBy:(id)a4 allowEpisodesTo404:(BOOL)a5 isImplicitActionRequest:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  v12 = _Block_copy(a7);
  if (a4)
  {
    uint64_t v13 = sub_1ACE761B8();
    a4 = v14;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  id v16 = a3;
  v17 = self;
  sub_1ACC98AA4(v16, v13, (uint64_t)a4, v8, v7, (uint64_t)sub_1ACC9AE00, v15);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end