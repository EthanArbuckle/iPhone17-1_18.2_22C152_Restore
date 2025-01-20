@interface JSTVShowEpisodeDetailModelRequestOperation
- (_TtC16MusicApplication42JSTVShowEpisodeDetailModelRequestOperation)init;
- (void)execute;
@end

@implementation JSTVShowEpisodeDetailModelRequestOperation

- (void)execute
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSTVShowEpisodeDetailModelRequestOperation();
  id v2 = v5.receiver;
  [(JSTVShowEpisodeDetailModelRequestOperation *)&v5 execute];
  sub_638F0();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_2485E0, v3);

  swift_release();
}

- (_TtC16MusicApplication42JSTVShowEpisodeDetailModelRequestOperation)init
{
  result = (_TtC16MusicApplication42JSTVShowEpisodeDetailModelRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end