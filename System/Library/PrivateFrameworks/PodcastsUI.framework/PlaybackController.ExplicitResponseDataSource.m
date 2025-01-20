@interface PlaybackController.ExplicitResponseDataSource
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (_TtCC10PodcastsUI18PlaybackController26ExplicitResponseDataSource)init;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
@end

@implementation PlaybackController.ExplicitResponseDataSource

- (_TtCC10PodcastsUI18PlaybackController26ExplicitResponseDataSource)init
{
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return sub_1E3CF0C98(self, (uint64_t)a2, a3, a4);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController26ExplicitResponseDataSource_playerPath));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController26ExplicitResponseDataSource_playerRequestController));

  swift_bridgeObjectRelease();
}

@end