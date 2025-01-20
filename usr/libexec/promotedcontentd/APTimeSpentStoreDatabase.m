@interface APTimeSpentStoreDatabase
- (APTimeSpentStoreDatabase)init;
- (APTimeSpentStoreDatabase)initWithDatabase:(id)a3;
- (id)retrieveTimeSpentEntriesOlderThan:(id)a3;
- (void)removeEntriesForContentIds:(id)a3;
- (void)storeEntryForContentId:(id)a3;
- (void)storeEntryForContentId:(id)a3 timeStamp:(id)a4;
@end

@implementation APTimeSpentStoreDatabase

- (APTimeSpentStoreDatabase)initWithDatabase:(id)a3
{
  sub_10000C6C8(0, (unint64_t *)&qword_100284870);
  id v5 = a3;
  v6 = self;
  sub_10019B470();
  sub_10019AE20();
  swift_allocObject();
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___APTimeSpentStoreDatabase_database) = (Class)sub_10019AE10();

  v9.receiver = v6;
  v9.super_class = (Class)APTimeSpentStoreDatabase;
  v7 = [(APTimeSpentStoreDatabase *)&v9 init];

  return v7;
}

- (id)retrieveTimeSpentEntriesOlderThan:(id)a3
{
  uint64_t v4 = sub_10019ABA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10019AB70();
  v8 = self;
  uint64_t v9 = APTimeSpentStoreDatabase.retrieveTimeSpentEntriesOlderThan(_:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v9)
  {
    type metadata accessor for APTimeSpentEntry();
    v10.super.isa = sub_10019B2A0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v10.super.isa = 0;
  }

  return v10.super.isa;
}

- (void)removeEntriesForContentIds:(id)a3
{
  uint64_t v4 = sub_10019B2B0();
  uint64_t v5 = self;
  APTimeSpentStoreDatabase.removeEntries(forContentIds:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)storeEntryForContentId:(id)a3
{
  uint64_t v4 = sub_10019ABA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10019B0B0();
  v8 = self;
  NSString v9 = sub_10019B0A0();
  sub_10019AB90();
  Class isa = sub_10019AAF0().super.isa;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  [(APTimeSpentStoreDatabase *)v8 storeEntryForContentId:v9 timeStamp:isa];

  swift_bridgeObjectRelease();
}

- (void)storeEntryForContentId:(id)a3 timeStamp:(id)a4
{
  uint64_t v5 = sub_10019ABA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10019B0B0();
  uint64_t v11 = v10;
  sub_10019AB70();
  uint64_t v12 = self;
  APTimeSpentStoreDatabase.storeEntry(forContentId:timeStamp:)(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (APTimeSpentStoreDatabase)init
{
  result = (APTimeSpentStoreDatabase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end