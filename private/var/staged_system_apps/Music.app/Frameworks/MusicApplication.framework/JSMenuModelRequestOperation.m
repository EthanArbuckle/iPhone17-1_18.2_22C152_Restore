@interface JSMenuModelRequestOperation
- (_TtC16MusicApplication27JSMenuModelRequestOperation)init;
- (void)execute;
@end

@implementation JSMenuModelRequestOperation

- (void)execute
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSMenuModelRequestOperation();
  id v2 = v5.receiver;
  [(JSMenuModelRequestOperation *)&v5 execute];
  sub_173E4(0, (unint64_t *)&qword_DC0F50);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_23A240, v3);

  swift_release();
}

- (_TtC16MusicApplication27JSMenuModelRequestOperation)init
{
  result = (_TtC16MusicApplication27JSMenuModelRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end