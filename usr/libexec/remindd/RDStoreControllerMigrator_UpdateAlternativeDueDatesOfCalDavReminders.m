@interface RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders
- (_TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders)init;
- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4;
@end

@implementation RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders

- (_TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_100094134((uint64_t *)&unk_100909A40);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100907640 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = sub_10008E2DC(v6, (uint64_t)qword_1009199F8);
  uint64_t v8 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v5, v7, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v6);
  v9 = (char *)objc_allocWithZone(ObjectType);
  *(void *)&v9[OBJC_IVAR____TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders_maxReminderCountToMigrate] = 100;
  sub_1000CAA4C((uint64_t)v5, (uint64_t)&v9[OBJC_IVAR____TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders_lastModifiedAfterDate]);
  v12.receiver = v9;
  v12.super_class = ObjectType;
  v10 = [(RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders *)&v12 init];
  sub_1000966BC((uint64_t)v5, (uint64_t *)&unk_100909A40);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders.migrateStoreIfNeeded(_:metadata:)((NSPersistentStore)v6, (NSMutableDictionary)v7);
}

- (void).cxx_destruct
{
}

@end