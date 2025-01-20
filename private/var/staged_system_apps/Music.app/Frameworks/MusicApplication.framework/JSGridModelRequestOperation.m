@interface JSGridModelRequestOperation
- (_TtC16MusicApplication27JSGridModelRequestOperation)init;
- (void)execute;
@end

@implementation JSGridModelRequestOperation

- (void)execute
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSGridModelRequestOperation();
  id v2 = v5.receiver;
  [(JSGridModelRequestOperation *)&v5 execute];
  sub_638F0();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_187010, v3);

  swift_release();
}

- (_TtC16MusicApplication27JSGridModelRequestOperation)init
{
  result = (_TtC16MusicApplication27JSGridModelRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end