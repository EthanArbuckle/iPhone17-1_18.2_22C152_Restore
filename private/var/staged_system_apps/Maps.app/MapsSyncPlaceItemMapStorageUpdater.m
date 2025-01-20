@interface MapsSyncPlaceItemMapStorageUpdater
- (_TtC4Maps34MapsSyncPlaceItemMapStorageUpdater)init;
- (void)updateMapsSyncPlaceItemsMatchingMapItem:(id)a3 withStorageFrom:(id)a4;
@end

@implementation MapsSyncPlaceItemMapStorageUpdater

- (void)updateMapsSyncPlaceItemsMatchingMapItem:(id)a3 withStorageFrom:(id)a4
{
  uint64_t v7 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC4Maps34MapsSyncPlaceItemMapStorageUpdater_libraryDataOperationsProvider);
  id v11 = a3;
  id v12 = a4;
  v22 = self;
  id v13 = [v12 _geoMapItem];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
    v16 = (void *)swift_allocObject();
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = v10;
    v16[5] = v11;
    v16[6] = v14;
    v16[7] = v12;
    id v17 = v11;
    id v18 = v12;
    id v19 = v10;
    sub_100042AF4((uint64_t)v9, (uint64_t)&unk_1015DA4B0, (uint64_t)v16);

    swift_release();
  }
  else
  {

    v20 = v22;
  }
}

- (_TtC4Maps34MapsSyncPlaceItemMapStorageUpdater)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC4Maps34MapsSyncPlaceItemMapStorageUpdater_libraryDataOperationsProvider;
  type metadata accessor for MapsSyncStore();
  v5 = self;
  uint64_t v6 = static MapsSyncStore.sharedStore.getter();
  uint64_t v7 = (objc_class *)type metadata accessor for LibraryDataOperationsProvider();
  uint64_t v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[OBJC_IVAR____TtC4Maps29LibraryDataOperationsProvider_mapsSyncStore] = v6;
  v11.receiver = v8;
  v11.super_class = v7;
  *(Class *)((char *)&self->super.isa + v4) = (Class)[(MapsSyncPlaceItemMapStorageUpdater *)&v11 init];

  v10.receiver = v5;
  v10.super_class = ObjectType;
  return [(MapsSyncPlaceItemMapStorageUpdater *)&v10 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps34MapsSyncPlaceItemMapStorageUpdater_libraryDataOperationsProvider));
}

@end