@interface RDStoreControllerMigrator_AutoConvertSharedInlineTags
- (_TtC7remindd53RDStoreControllerMigrator_AutoConvertSharedInlineTags)init;
- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4;
@end

@implementation RDStoreControllerMigrator_AutoConvertSharedInlineTags

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100177A68(v6, v7);
}

- (_TtC7remindd53RDStoreControllerMigrator_AutoConvertSharedInlineTags)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDStoreControllerMigrator_AutoConvertSharedInlineTags();
  return [(RDStoreControllerMigrator_AutoConvertSharedInlineTags *)&v3 init];
}

@end