@interface PlaybackController.PlayerPathCoordinator
- (_TtCC10PodcastsUI18PlaybackController21PlayerPathCoordinator)init;
@end

@implementation PlaybackController.PlayerPathCoordinator

- (_TtCC10PodcastsUI18PlaybackController21PlayerPathCoordinator)init
{
  result = (_TtCC10PodcastsUI18PlaybackController21PlayerPathCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController21PlayerPathCoordinator__playerPathInfo;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE24D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController21PlayerPathCoordinator_routingController));

  swift_bridgeObjectRelease();
}

@end