@interface SLAMSwift
- (id)transceive:(id)a3 error:(id *)a4;
- (void)log:(id)a3;
@end

@implementation SLAMSwift

- (id)transceive:(id)a3 error:(id *)a4
{
  id v5 = a3;
  swift_retain();
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  uint64_t v9 = *(void *)&self->session[24];
  uint64_t v10 = *(void *)&self->session[32];
  sub_100006788(self->session, v9);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v10 + 16))(v6, v8, v9, v10);
  unint64_t v13 = v12;
  sub_10005CA20(v6, v8, v11, v12);
  swift_release();
  sub_100006628(v6, v8);
  v14.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100006628(v11, v13);

  return v14.super.isa;
}

- (void)log:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v5 = v4;
  swift_retain();
  sub_10005C2CC(v3, v5);
  swift_release();

  swift_bridgeObjectRelease();
}

@end