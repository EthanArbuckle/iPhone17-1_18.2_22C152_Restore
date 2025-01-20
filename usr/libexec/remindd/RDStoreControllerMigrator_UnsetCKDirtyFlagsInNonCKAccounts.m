@interface RDStoreControllerMigrator_UnsetCKDirtyFlagsInNonCKAccounts
- (_TtC7remindd58RDStoreControllerMigrator_UnsetCKDirtyFlagsInNonCKAccounts)init;
- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4;
@end

@implementation RDStoreControllerMigrator_UnsetCKDirtyFlagsInNonCKAccounts

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  RDStoreControllerMigrator_UnsetCKDirtyFlagsInNonCKAccounts.migrateStoreIfNeeded(_:metadata:)((NSPersistentStore)v6, (NSMutableDictionary)v7);
}

- (_TtC7remindd58RDStoreControllerMigrator_UnsetCKDirtyFlagsInNonCKAccounts)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDStoreControllerMigrator_UnsetCKDirtyFlagsInNonCKAccounts();
  return [(RDStoreControllerMigrator_UnsetCKDirtyFlagsInNonCKAccounts *)&v3 init];
}

@end