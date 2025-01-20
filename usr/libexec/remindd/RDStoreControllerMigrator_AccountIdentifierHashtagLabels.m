@interface RDStoreControllerMigrator_AccountIdentifierHashtagLabels
- (_TtC7remindd56RDStoreControllerMigrator_AccountIdentifierHashtagLabels)init;
- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4;
@end

@implementation RDStoreControllerMigrator_AccountIdentifierHashtagLabels

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  RDStoreControllerMigrator_AccountIdentifierHashtagLabels.migrateStoreIfNeeded(_:metadata:)((NSPersistentStore)v6, (NSMutableDictionary)v7);
}

- (_TtC7remindd56RDStoreControllerMigrator_AccountIdentifierHashtagLabels)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDStoreControllerMigrator_AccountIdentifierHashtagLabels();
  return [(RDStoreControllerMigrator_AccountIdentifierHashtagLabels *)&v3 init];
}

@end