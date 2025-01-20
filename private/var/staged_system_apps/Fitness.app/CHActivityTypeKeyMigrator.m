@interface CHActivityTypeKeyMigrator
- (CHActivityTypeKeyMigrator)init;
- (CHActivityTypeKeyMigrator)initWithMigrationKeys:(id)a3;
- (void)migrateIfNeeded;
@end

@implementation CHActivityTypeKeyMigrator

- (void)migrateIfNeeded
{
  v2 = self;
  ActivityTypeKeyMigrator.migrateIfNeeded()();
}

- (CHActivityTypeKeyMigrator)initWithMigrationKeys:(id)a3
{
  uint64_t v4 = type metadata accessor for ActivityTypeKeyMigrator();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  v9 = self;
  id v10 = [v8 standardUserDefaults];
  ActivityTypeKeyMigrator.init(migrationKeys:userDefaults:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v9 + OBJC_IVAR___CHActivityTypeKeyMigrator_activityTypeKeyMigrator, v7, v4);

  v11 = (objc_class *)type metadata accessor for ActivityTypeKeyMigratorBridge();
  v13.receiver = v9;
  v13.super_class = v11;
  return [(CHActivityTypeKeyMigrator *)&v13 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___CHActivityTypeKeyMigrator_activityTypeKeyMigrator;
  uint64_t v3 = type metadata accessor for ActivityTypeKeyMigrator();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (CHActivityTypeKeyMigrator)init
{
  result = (CHActivityTypeKeyMigrator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end