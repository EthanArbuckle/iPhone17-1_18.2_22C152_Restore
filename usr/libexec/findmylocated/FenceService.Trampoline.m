@interface FenceService.Trampoline
- (_TtCC13findmylocated12FenceService10Trampoline)init;
- (void)request:(id)a3 completion:(id)a4;
@end

@implementation FenceService.Trampoline

- (void)request:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_1001715C0(v8, v10, (uint64_t)v11, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_100044090(v8, v10);
}

- (_TtCC13findmylocated12FenceService10Trampoline)init
{
  result = (_TtCC13findmylocated12FenceService10Trampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end