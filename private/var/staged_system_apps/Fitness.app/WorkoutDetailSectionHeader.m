@interface WorkoutDetailSectionHeader
- (_TtC10FitnessApp26WorkoutDetailSectionHeader)initWithCoder:(id)a3;
- (_TtC10FitnessApp26WorkoutDetailSectionHeader)initWithReuseIdentifier:(id)a3;
- (void)configureWithTitle:(id)a3 buttonAction:(id)a4;
@end

@implementation WorkoutDetailSectionHeader

- (void)configureWithTitle:(id)a3 buttonAction:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  if (v5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v5;
    v5 = sub_10060FE20;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = self;
  sub_100570074(v6, v8, 0, 0, (uint64_t)v5, v9, 0.0);
  sub_10005E5F8((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (_TtC10FitnessApp26WorkoutDetailSectionHeader)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WorkoutDetailSectionHeader();
  v5 = [(ActivityTileSectionHeader *)&v7 initWithReuseIdentifier:v4];

  return v5;
}

- (_TtC10FitnessApp26WorkoutDetailSectionHeader)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailSectionHeader();
  return [(ActivityTileSectionHeader *)&v5 initWithCoder:a3];
}

@end