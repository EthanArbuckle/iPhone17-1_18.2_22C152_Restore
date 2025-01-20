@interface PFFairPlayMigrationController
+ (PFFairPlayMigrationController)sharedInstance;
- (PFFairPlayMigrationController)init;
- (void)migrateIfNecessaryWithCompletion:(id)a3;
- (void)rollbackIfNecessaryWithCompletion:(id)a3;
@end

@implementation PFFairPlayMigrationController

+ (PFFairPlayMigrationController)sharedInstance
{
  if (qword_1EB769548 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB76C730;
  return (PFFairPlayMigrationController *)v2;
}

- (PFFairPlayMigrationController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MediaItemMetadataLoader()), sel_init);
  id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CoreDataKeyRequestStorage()), sel_init);
  id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FairPlayInvalidationManager()), sel_init);
  type metadata accessor for CoreDataFairPlayEpisodeDataFetcher();
  uint64_t v6 = swift_allocObject();
  id v7 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureDownloadRenewalManager()), sel_init);
  v8 = (PFFairPlayMigrationController *)sub_1ACD44620(v3, v4, v5, v6, v7, (char *)objc_allocWithZone(ObjectType));

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (void)migrateIfNecessaryWithCompletion:(id)a3
{
}

- (void)rollbackIfNecessaryWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFFairPlayMigrationController_fairPlayEpisodeDataFetcher);

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFFairPlayMigrationController_internalQueue);
}

@end