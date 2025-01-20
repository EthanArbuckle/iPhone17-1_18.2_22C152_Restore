@interface RDStoreControllerMigrator_DiacriticsInsensitiveHashtagLabels
- (_TtC7remindd60RDStoreControllerMigrator_DiacriticsInsensitiveHashtagLabels)init;
- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4;
@end

@implementation RDStoreControllerMigrator_DiacriticsInsensitiveHashtagLabels

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  RDStoreControllerMigrator_DiacriticsInsensitiveHashtagLabels.migrateStoreIfNeeded(_:metadata:)((NSPersistentStore)v6, (NSMutableDictionary)v7);
}

- (_TtC7remindd60RDStoreControllerMigrator_DiacriticsInsensitiveHashtagLabels)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDStoreControllerMigrator_DiacriticsInsensitiveHashtagLabels();
  return [(RDStoreControllerMigrator_DiacriticsInsensitiveHashtagLabels *)&v3 init];
}

@end