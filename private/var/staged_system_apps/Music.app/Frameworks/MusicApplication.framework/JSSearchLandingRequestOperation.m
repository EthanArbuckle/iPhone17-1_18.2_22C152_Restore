@interface JSSearchLandingRequestOperation
- (_TtC16MusicApplication31JSSearchLandingRequestOperation)init;
- (void)execute;
@end

@implementation JSSearchLandingRequestOperation

- (void)execute
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSSearchLandingRequestOperation();
  id v2 = v5.receiver;
  [(JSSearchLandingRequestOperation *)&v5 execute];
  sub_638F0();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_2299FC, v3);

  swift_release();
}

- (_TtC16MusicApplication31JSSearchLandingRequestOperation)init
{
  result = (_TtC16MusicApplication31JSSearchLandingRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end