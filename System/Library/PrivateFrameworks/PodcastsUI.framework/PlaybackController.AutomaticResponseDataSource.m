@interface PlaybackController.AutomaticResponseDataSource
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (_TtCC10PodcastsUI18PlaybackController27AutomaticResponseDataSource)init;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
@end

@implementation PlaybackController.AutomaticResponseDataSource

- (_TtCC10PodcastsUI18PlaybackController27AutomaticResponseDataSource)init
{
}

- (void)dealloc
{
  v2 = self;
  sub_1E3CEFA94();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController27AutomaticResponseDataSource_playerRequestController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController27AutomaticResponseDataSource_pathCoordinator));

  swift_release();
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return sub_1E3CF0C98(self, (uint64_t)a2, a3, a4);
}

@end