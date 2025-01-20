@interface JSBrickModelRequestOperation
- (_TtC16MusicApplication28JSBrickModelRequestOperation)init;
- (void)execute;
@end

@implementation JSBrickModelRequestOperation

- (void)execute
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSBrickModelRequestOperation();
  id v2 = v5.receiver;
  [(JSBrickModelRequestOperation *)&v5 execute];
  sub_638F0();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_D2F44, v3);

  swift_release();
}

- (_TtC16MusicApplication28JSBrickModelRequestOperation)init
{
  result = (_TtC16MusicApplication28JSBrickModelRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end