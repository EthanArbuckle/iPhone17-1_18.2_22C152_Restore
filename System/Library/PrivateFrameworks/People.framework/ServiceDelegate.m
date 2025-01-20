@interface ServiceDelegate
- (void)sendMessageWith:(id)a3 completion:(id)a4;
@end

@implementation ServiceDelegate

- (void)sendMessageWith:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  id v6 = a3;
  swift_retain();
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v5;
  sub_10003014C(v7, v9, (uint64_t)sub_100031658, v10);
  swift_release();
  sub_100031490(v7, v9);
  swift_release();
}

@end