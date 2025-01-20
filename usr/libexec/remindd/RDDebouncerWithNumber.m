@interface RDDebouncerWithNumber
- (_TtC7remindd21RDDebouncerWithNumber)init;
- (_TtC7remindd21RDDebouncerWithNumber)initWithDebouncingInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (double)debouncingInterval;
- (void)fire:(id)a3 completion:(id)a4;
- (void)setDebouncingInterval:(double)a3;
@end

@implementation RDDebouncerWithNumber

- (double)debouncingInterval
{
  v2 = self;
  double v3 = sub_1003FBC08();

  return v3;
}

- (void)setDebouncingInterval:(double)a3
{
  v4 = self;
  sub_1000E5CA0(a3);
}

- (_TtC7remindd21RDDebouncerWithNumber)initWithDebouncingInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(double *)v15 = a3;
  memset(&v15[1], 0, 24);
  __int16 v16 = 0;
  objc_allocWithZone((Class)sub_100094134(&qword_10090A7D0));
  id v10 = a4;
  v11 = self;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC7remindd21RDDebouncerWithNumber_debouncer) = (Class)sub_100407F54(0, 0, v15, v10, sub_1000E6F84, v9);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for RDDebouncerWithNumber();
  v12 = [(RDDebouncerWithNumber *)&v14 init];

  swift_release();
  return v12;
}

- (void)fire:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_1000E6EE8();
  sub_1000E6F28(&qword_100917D50, 255, (void (*)(uint64_t))sub_1000E6EE8);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v8 = sub_1000E6F7C;
  }
  else
  {
    v8 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v9 = self;
  sub_1003FBED8(v6, (uint64_t (*)(uint64_t, uint64_t))v8, v7);
  sub_100096314((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (_TtC7remindd21RDDebouncerWithNumber)init
{
  result = (_TtC7remindd21RDDebouncerWithNumber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end