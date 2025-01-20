@interface SiriDonator
- (_TtC18PodcastsFoundation11SiriDonator)init;
- (_TtC18PodcastsFoundation11SiriDonator)initWithBackgroundTaskManager:(id)a3;
- (void)startDonation;
@end

@implementation SiriDonator

- (_TtC18PodcastsFoundation11SiriDonator)initWithBackgroundTaskManager:(id)a3
{
  return (_TtC18PodcastsFoundation11SiriDonator *)SiriDonator.init(backgroundTaskManager:)((uint64_t)a3);
}

- (void)startDonation
{
  v2 = self;
  sub_1ACDFE7AC();
}

- (_TtC18PodcastsFoundation11SiriDonator)init
{
  result = (_TtC18PodcastsFoundation11SiriDonator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation11SiriDonator_mediaRequestController));
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
}

@end