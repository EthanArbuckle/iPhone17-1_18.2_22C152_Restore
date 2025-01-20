@interface JSShelfModelRequestOperation
- (_TtC16MusicApplication28JSShelfModelRequestOperation)init;
- (void)execute;
@end

@implementation JSShelfModelRequestOperation

- (void)execute
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSShelfModelRequestOperation();
  id v2 = v5.receiver;
  [(JSShelfModelRequestOperation *)&v5 execute];
  sub_638F0();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_2CABD0, v3);

  swift_release();
}

- (_TtC16MusicApplication28JSShelfModelRequestOperation)init
{
  result = (_TtC16MusicApplication28JSShelfModelRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end