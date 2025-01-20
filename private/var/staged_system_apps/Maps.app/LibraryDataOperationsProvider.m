@interface LibraryDataOperationsProvider
- (BOOL)saveNote:(id)a3 libraryPlaceItem:(id)a4;
- (_TtC4Maps29LibraryDataOperationsProvider)init;
- (_TtC4Maps29LibraryDataOperationsProvider)initWithMapsSyncStore:(id)a3;
- (_TtC8MapsSync13MapsSyncStore)mapsSyncStore;
- (void)addToLibraryWithMapItem:(id)a3 customName:(id)a4 alsoAddnote:(id)a5 completion:(id)a6;
- (void)alertMessageForDeletingPlaceItem:(_TtP4Maps26LibraryPlaceItemCompatible_ *)a3 completionHandler:(id)a4;
- (void)deleteFavoriteItem:(id)a3;
- (void)deleteFromLibraryWithPlaceItem:(id)a3 viewControllerForPresentingAlert:(id)a4 completion:(id)a5;
- (void)deleteFromLibraryWithPlaceItems:(id)a3 completion:(id)a4;
- (void)deleteFromLibraryWithPlaceItems:(id)a3 viewControllerForPresentingAlert:(id)a4 completion:(id)a5;
- (void)deleteFromLibraryWithRouteData:(id)a3 viewControllerForPresentingAlert:(id)a4 completion:(id)a5;
- (void)existingPlaceItemForMapItem:(id)a3 completion:(id)a4;
- (void)existingPlaceItemsForMapItem:(MKMapItem *)a3 completionHandler:(id)a4;
- (void)saveAsFavoriteWithCollectionPlaceItem:(id)a3;
- (void)saveNote:(id)a3 collectionPlaceItem:(id)a4;
- (void)updateSavedPlaceItemsMatchingMapItem:(id)a3 withStorageFrom:(id)a4;
@end

@implementation LibraryDataOperationsProvider

- (_TtC8MapsSync13MapsSyncStore)mapsSyncStore
{
  return (_TtC8MapsSync13MapsSyncStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC4Maps29LibraryDataOperationsProvider_mapsSyncStore));
}

- (_TtC4Maps29LibraryDataOperationsProvider)initWithMapsSyncStore:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29LibraryDataOperationsProvider_mapsSyncStore) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(LibraryDataOperationsProvider *)&v8 init];
}

- (void)saveNote:(id)a3 collectionPlaceItem:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_bridgeObjectRetain();
  id v6 = a4;
  v7 = self;
  dispatch thunk of CollectionPlaceItem.placeItemNote.setter();
  type metadata accessor for MapsSyncStore();
  objc_super v8 = (void *)static MapsSyncStore.sharedStore.getter();
  sub_1000FF33C(&qword_1015CD310);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100F5DFF0;
  *(void *)(v9 + 32) = v6;
  specialized Array._endMutation()();
  id v10 = v6;
  dispatch thunk of MapsSyncStore.save(_:)();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)saveNote:(id)a3 libraryPlaceItem:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    v7 = 0;
  }
  swift_unknownObjectRetain();
  objc_super v8 = self;
  char v9 = sub_1002DDB28(v5, v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (void)addToLibraryWithMapItem:(id)a3 customName:(id)a4 alsoAddnote:(id)a5 completion:(id)a6
{
  id v10 = _Block_copy(a6);
  if (a4)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v12;
    if (a5)
    {
LABEL_3:
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      a5 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v10;
  swift_bridgeObjectRetain();
  v16 = self;
  id v17 = a3;
  swift_bridgeObjectRetain();
  sub_1002E61A0(v17, (uint64_t)sub_1001DC444, v15, v16, v17, v11, (uint64_t)a4, v13, (uint64_t)a5);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_release();
}

- (void)deleteFromLibraryWithPlaceItem:(id)a3 viewControllerForPresentingAlert:(id)a4 completion:(id)a5
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v10 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t (*)())_Block_copy(a5);
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    uint64_t v13 = sub_1002EA4FC;
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = v13;
  v16[7] = v14;
  v16[8] = a4;
  v16[9] = ObjectType;
  swift_unknownObjectRetain_n();
  id v17 = a4;
  v18 = self;
  id v19 = v17;
  sub_1000F4F24((uint64_t)v13);
  sub_100042AF4((uint64_t)v12, (uint64_t)&unk_1015DA530, (uint64_t)v16);
  swift_release();
  sub_10006C5D8((uint64_t)v13);

  swift_unknownObjectRelease();
}

- (void)deleteFromLibraryWithPlaceItems:(id)a3 viewControllerForPresentingAlert:(id)a4 completion:(id)a5
{
  v7 = (void (*)(uint64_t, void, __n128))_Block_copy(a5);
  sub_1000FF33C(&qword_1015D6930);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    v7 = (void (*)(uint64_t, void, __n128))sub_1002EA190;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v11 = a4;
  uint64_t v10 = self;
  sub_1002DF968(v8, v11, v7, v9);
  sub_10006C5D8((uint64_t)v7);
  swift_bridgeObjectRelease();
}

- (void)deleteFromLibraryWithPlaceItems:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_1000FF33C(&qword_1015D6930);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    unint64_t v8 = sub_1002C6810;
  }
  else
  {
    unint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v9 = self;
  sub_1002DF408(v6, (uint64_t (*)(void))v8, v7);
  sub_10006C5D8((uint64_t)v8);
  swift_bridgeObjectRelease();
}

- (void)deleteFromLibraryWithRouteData:(id)a3 viewControllerForPresentingAlert:(id)a4 completion:(id)a5
{
  unint64_t v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    unint64_t v8 = sub_1001225E4;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_1002E8D30(v10, v11, (uint64_t)v8, v9);
  sub_10006C5D8((uint64_t)v8);
}

- (void)existingPlaceItemForMapItem:(id)a3 completion:(id)a4
{
  unint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  unint64_t v8 = self;
  sub_1002E69E4(v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)existingPlaceItemsForMapItem:(MKMapItem *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1015DA510;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1015DA518;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_1000A2D24((uint64_t)v9, (uint64_t)&unk_1015DA520, (uint64_t)v14);
  swift_release();
}

- (void)updateSavedPlaceItemsMatchingMapItem:(id)a3 withStorageFrom:(id)a4
{
  uint64_t v7 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = a3;
  id v10 = a4;
  id v11 = self;
  id v12 = [v10 _geoMapItem];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v11;
    v16 = v22;
    v15[5] = v22;
    v15[6] = v13;
    v15[7] = v10;
    id v17 = v16;
    id v18 = v10;
    id v19 = v11;
    sub_100042AF4((uint64_t)v9, (uint64_t)&unk_1015DA500, (uint64_t)v15);
    swift_release();
  }
  else
  {

    uint64_t v20 = v22;
  }
}

- (void)deleteFavoriteItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1002E9BD0(v4);
}

- (void)saveAsFavoriteWithCollectionPlaceItem:(id)a3
{
  uint64_t v5 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a3;
  v9[5] = self;
  id v10 = a3;
  id v11 = self;
  id v12 = v10;
  id v13 = v11;
  sub_100042AF4((uint64_t)v7, (uint64_t)&unk_1015DA4D0, (uint64_t)v9);
  swift_release();
}

- (_TtC4Maps29LibraryDataOperationsProvider)init
{
  result = (_TtC4Maps29LibraryDataOperationsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)alertMessageForDeletingPlaceItem:(_TtP4Maps26LibraryPlaceItemCompatible_ *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1015DA430;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1015D5D10;
  v14[5] = v13;
  swift_unknownObjectRetain();
  uint64_t v15 = self;
  sub_1000A2D24((uint64_t)v9, (uint64_t)&unk_1015DA440, (uint64_t)v14);
  swift_release();
}

@end