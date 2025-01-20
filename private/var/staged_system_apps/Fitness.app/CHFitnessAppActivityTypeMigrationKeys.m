@interface CHFitnessAppActivityTypeMigrationKeys
+ (NSArray)migrationKeys;
+ (void)setMigrationKeys:(id)a3;
- (CHFitnessAppActivityTypeMigrationKeys)init;
@end

@implementation CHFitnessAppActivityTypeMigrationKeys

+ (NSArray)migrationKeys
{
  if (qword_10094A6F0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

+ (void)setMigrationKeys:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (qword_10094A6F0 != -1) {
    swift_once();
  }
  qword_100997890 = v3;

  swift_bridgeObjectRelease();
}

- (CHFitnessAppActivityTypeMigrationKeys)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FitnessAppActivityTypeMigrationKeys();
  return [(CHFitnessAppActivityTypeMigrationKeys *)&v3 init];
}

@end