@interface JSFlowcaseModelRequestOperation
- (_TtC16MusicApplication31JSFlowcaseModelRequestOperation)init;
- (void)execute;
@end

@implementation JSFlowcaseModelRequestOperation

- (void)execute
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSFlowcaseModelRequestOperation();
  id v2 = v5.receiver;
  [(JSFlowcaseModelRequestOperation *)&v5 execute];
  sub_638F0();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_B6DC4, v3);

  swift_release();
}

- (_TtC16MusicApplication31JSFlowcaseModelRequestOperation)init
{
  result = (_TtC16MusicApplication31JSFlowcaseModelRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end