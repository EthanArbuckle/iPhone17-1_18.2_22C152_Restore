@interface BookmarksMigrationRegistry
+ (id)migrationRegisteredAtVersion:(int64_t)a3;
+ (void)deleteMigrationRegistryAtVersion:(int64_t)a3;
+ (void)registerMigrationOfUUIDs:(id)a3 atVersion:(int64_t)a4;
- (_TtC8Podcasts26BookmarksMigrationRegistry)init;
@end

@implementation BookmarksMigrationRegistry

+ (void)registerMigrationOfUUIDs:(id)a3 atVersion:(int64_t)a4
{
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _s8Podcasts26BookmarksMigrationRegistryC08registerC02of2atySaySSG_SitFZ_0(v5, a4);

  swift_bridgeObjectRelease();
}

+ (id)migrationRegisteredAtVersion:(int64_t)a3
{
  v3 = (void *)_s8Podcasts26BookmarksMigrationRegistryC19migrationRegistered2atAA0C0CSgSi_tFZ_0(a3);

  return v3;
}

+ (void)deleteMigrationRegistryAtVersion:(int64_t)a3
{
}

- (_TtC8Podcasts26BookmarksMigrationRegistry)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BookmarksMigrationRegistry();
  return [(BookmarksMigrationRegistry *)&v3 init];
}

@end