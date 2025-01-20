@interface JSSocialProfileCollectionModelRequestOperation
- (_TtC16MusicApplicationP33_9AFC986C3EE3F16591D3B34D5D62C9B146JSSocialProfileCollectionModelRequestOperation)init;
- (void)execute;
@end

@implementation JSSocialProfileCollectionModelRequestOperation

- (void)execute
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSSocialProfileCollectionModelRequestOperation();
  id v2 = v5.receiver;
  [(JSSocialProfileCollectionModelRequestOperation *)&v5 execute];
  sub_638F0();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_1068F4, v3);

  swift_release();
}

- (_TtC16MusicApplicationP33_9AFC986C3EE3F16591D3B34D5D62C9B146JSSocialProfileCollectionModelRequestOperation)init
{
  result = (_TtC16MusicApplicationP33_9AFC986C3EE3F16591D3B34D5D62C9B146JSSocialProfileCollectionModelRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end