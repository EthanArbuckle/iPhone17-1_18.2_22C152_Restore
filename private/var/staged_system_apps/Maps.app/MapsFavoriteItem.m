@interface MapsFavoriteItem
+ (NSString)MapsSuggestionsNearbyTransitShortcutIdentifier;
- (BOOL)isAlreadyThere;
- (BOOL)isHidden;
- (BOOL)isHomeWorkOrSchool;
- (BOOL)isMeCardWritebackEnabled;
- (BOOL)isNearbyTransit;
- (BOOL)isPersisted;
- (BOOL)isSetupPlaceholder;
- (BOOL)isShortcutForSetup;
- (GEOFeatureStyleAttributes)proposedFavoriteStyleAttributes;
- (GEOFeatureStyleAttributes)styleAttributes;
- (GEOMapItem)geoMapItem;
- (GEOMapItemStorage)mapItemStorage;
- (MKMapItem)mkMapItem;
- (MSFavoriteItem)favoriteItem;
- (NSArray)contacts;
- (NSString)_maps_diffableDataSourceIdentifier;
- (NSString)analyticsGrouping;
- (NSString)customName;
- (NSString)debugDescription;
- (NSString)identifier;
- (NSString)placeName;
- (NSString)shortAddress;
- (NSString)shortcutIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (NSString)uniqueIdentifier;
- (NSUUID)storageIdentifier;
- (_TtC4Maps16MapsFavoriteItem)init;
- (_TtC4Maps16MapsFavoriteItem)initWithCollectionItem:(id)a3;
- (_TtC4Maps16MapsFavoriteItem)initWithFavoriteItem:(id)a3;
- (id)cnLabledAddress;
- (id)copyWithZone:(void *)a3;
- (id)createUniqueIdentifier;
- (id)identifierForCoordinateWithCoordinate:(id)a3;
- (int64_t)entryType;
- (int64_t)number;
- (int64_t)transportType;
- (int64_t)type;
- (void)addContact:(id)a3;
- (void)deleteWithCompletionHandler:(id)a3;
- (void)deleteWithDeleteFromLibrary:(BOOL)a3 completionHandler:(id)a4;
- (void)moveToBackWithCompletionHandler:(id)a3;
- (void)moveToIndex:(int64_t)a3 with:(id)a4 completion:(id)a5;
- (void)moveToPreferredIndexWith:(id)a3 completion:(id)a4;
- (void)removeContact:(id)a3;
- (void)saveWithCompletionHandler:(id)a3;
- (void)setContacts:(id)a3;
- (void)setCustomName:(id)a3;
- (void)setGeoMapItem:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsAlreadyThere:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsMeCardWritebackEnabled:(BOOL)a3;
- (void)setIsPersisted:(BOOL)a3;
- (void)setIsShortcutForSetup:(BOOL)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setMkMapItem:(id)a3;
- (void)setNumber:(int64_t)a3;
- (void)setShortcutIdentifier:(id)a3;
- (void)setStorageIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)updateSubtitleWithViewMode:(int64_t)a3 currentLocation:(CLLocation *)a4 completionHandler:(id)a5;
@end

@implementation MapsFavoriteItem

- (void)setSubtitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_cachedSubtitle);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (MKMapItem)mkMapItem
{
  v2 = self;
  id v3 = [objc_allocWithZone((Class)MKMapItem) initWithGeoMapItem:[v2 geoMapItem] isPlaceHolderPlace:0];

  swift_unknownObjectRelease();

  return (MKMapItem *)v3;
}

- (int64_t)type
{
  v2 = self;
  __int16 v3 = dispatch thunk of FavoriteItem.type.getter();

  return v3;
}

- (void)updateSubtitleWithViewMode:(int64_t)a3 currentLocation:(CLLocation *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1015DC3F8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1015D5D10;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_1000A2D24((uint64_t)v11, (uint64_t)&unk_1015DA440, (uint64_t)v16);
  swift_release();
}

- (NSString)subtitle
{
  return (NSString *)sub_1000A55F8(self, (uint64_t)a2, (void (*)(void))sub_1000A6574);
}

- (NSString)title
{
  return (NSString *)sub_1000A4038(self, (uint64_t)a2, (void (*)(void))sub_1000A2944);
}

- (NSString)identifier
{
  return (NSString *)sub_1000A588C(self, (uint64_t)a2, (void (*)(void))&dispatch thunk of FavoriteItem.shortcutIdentifier.getter);
}

- (NSString)uniqueIdentifier
{
  v2 = self;
  dispatch thunk of FavoriteItem.shortcutIdentifier.getter();
  if (v3)
  {

LABEL_5:
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  id v4 = [(MapsFavoriteItem *)v2 createUniqueIdentifier];
  if (v4)
  {
    uint64_t v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    goto LABEL_5;
  }

  NSString v6 = 0;
LABEL_6:

  return (NSString *)v6;
}

- (id)createUniqueIdentifier
{
  return sub_1000A55F8(self, (uint64_t)a2, (void (*)(void))sub_1000A5690);
}

- (GEOMapItem)geoMapItem
{
  v2 = self;
  uint64_t v3 = [(MapsFavoriteItem *)v2 mapItemStorage];

  return v3;
}

- (GEOMapItemStorage)mapItemStorage
{
  v2 = self;
  uint64_t v3 = (void *)dispatch thunk of FavoriteItem.mapItemStorage.getter();

  return (GEOMapItemStorage *)v3;
}

- (id)identifierForCoordinateWithCoordinate:(id)a3
{
  sub_1000A595C(a3.var0, a3.var1);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (NSString)customName
{
  return (NSString *)sub_1000A588C(self, (uint64_t)a2, (void (*)(void))&dispatch thunk of FavoriteItem.customName.getter);
}

- (int64_t)entryType
{
  v2 = self;
  int64_t v3 = sub_1000A5B64();

  return v3;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  v2 = self;
  id v3 = sub_1000A5BF8();

  return (GEOFeatureStyleAttributes *)v3;
}

- (BOOL)isSetupPlaceholder
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isShortcutForSetup);
}

- (BOOL)isShortcutForSetup
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isShortcutForSetup);
}

- (NSString)analyticsGrouping
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)debugDescription
{
  return (NSString *)sub_1000A4038(self, (uint64_t)a2, (void (*)(void))sub_1000A40A8);
}

+ (NSString)MapsSuggestionsNearbyTransitShortcutIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (MSFavoriteItem)favoriteItem
{
  return (MSFavoriteItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_favoriteItem));
}

- (int64_t)number
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_number);
}

- (void)setNumber:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_number) = (Class)a3;
}

- (void)setIsShortcutForSetup:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isShortcutForSetup) = a3;
}

- (BOOL)isPersisted
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isPersisted);
}

- (void)setIsPersisted:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isPersisted) = a3;
}

- (BOOL)isAlreadyThere
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isAlreadyThere);
}

- (void)setIsAlreadyThere:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isAlreadyThere) = a3;
}

- (BOOL)isMeCardWritebackEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isMeCardWritebackEnabled);
}

- (void)setIsMeCardWritebackEnabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_isMeCardWritebackEnabled) = a3;
}

- (int64_t)transportType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_transportType);
}

- (void)setTransportType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_transportType) = (Class)a3;
}

- (BOOL)isHomeWorkOrSchool
{
  NSString v2 = self;
  BOOL v3 = sub_10000D6A0();

  return v3;
}

- (BOOL)isNearbyTransit
{
  NSString v2 = self;
  char v3 = sub_100341530();

  return v3 & 1;
}

- (_TtC4Maps16MapsFavoriteItem)initWithFavoriteItem:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC4Maps16MapsFavoriteItem *)sub_10001C0CC(v3);

  return v4;
}

- (_TtC4Maps16MapsFavoriteItem)init
{
  type metadata accessor for FavoriteItem();
  id v3 = (void *)MapsSyncObject.__allocating_init()();
  id v4 = [(MapsFavoriteItem *)self initWithFavoriteItem:v3];

  return v4;
}

- (_TtC4Maps16MapsFavoriteItem)initWithCollectionItem:(id)a3
{
  return (_TtC4Maps16MapsFavoriteItem *)sub_1003416D8(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16MapsFavoriteItem_favoriteItem);
}

- (void)saveWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1015DC4F0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1015DC4F8;
  v12[5] = v11;
  v13 = self;
  sub_1000A2D24((uint64_t)v7, (uint64_t)&unk_1015DC500, (uint64_t)v12);
  swift_release();
}

- (void)deleteWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1015DC4D0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1015DC4D8;
  v12[5] = v11;
  v13 = self;
  sub_1000A2D24((uint64_t)v7, (uint64_t)&unk_1015DC4E0, (uint64_t)v12);
  swift_release();
}

- (void)deleteWithDeleteFromLibrary:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1015DC4A0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1015DC4A8;
  v14[5] = v13;
  v15 = self;
  sub_1000A2D24((uint64_t)v9, (uint64_t)&unk_1015DC4B0, (uint64_t)v14);
  swift_release();
}

- (void)moveToBackWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1015DC478;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1015DC480;
  v12[5] = v11;
  v13 = self;
  sub_1000A2D24((uint64_t)v7, (uint64_t)&unk_1015DC488, (uint64_t)v12);
  swift_release();
}

- (void)moveToIndex:(int64_t)a3 with:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  type metadata accessor for MapsFavoriteItem();
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = self;
  sub_100344CCC(a3, v8, (uint64_t)sub_1002C6810, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)moveToPreferredIndexWith:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  type metadata accessor for MapsFavoriteItem();
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  unint64_t v8 = self;
  sub_100345C74(v6, (uint64_t)sub_1001225E4, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  sub_1003463A4(v6);

  sub_1000FF380(v6, v6[3]);
  id v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_1000FF22C((uint64_t)v6);
  return v4;
}

- (NSString)placeName
{
  return (NSString *)sub_1000A4038(self, (uint64_t)a2, (void (*)(void))sub_100346D00);
}

- (NSString)shortAddress
{
  return (NSString *)sub_1000A4038(self, (uint64_t)a2, (void (*)(void))sub_100346E80);
}

- (GEOFeatureStyleAttributes)proposedFavoriteStyleAttributes
{
  NSString v2 = self;
  id v3 = sub_1003472F4();

  return (GEOFeatureStyleAttributes *)v3;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = self;
  unint64_t v8 = [(MapsFavoriteItem *)v7 uniqueIdentifier];
  if (v8)
  {
    uint64_t v9 = v8;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v10;
}

- (void)setType:(int64_t)a3
{
  if (a3 < -32768)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (a3 >= 0x8000)
  {
LABEL_7:
    __break(1u);
    return;
  }
  uint64_t v3 = self;
  dispatch thunk of FavoriteItem.type.setter();
}

- (BOOL)isHidden
{
  NSString v2 = self;
  char v3 = dispatch thunk of FavoriteItem.hidden.getter();

  return v3 & 1;
}

- (void)setIsHidden:(BOOL)a3
{
  char v3 = self;
  dispatch thunk of FavoriteItem.hidden.setter();
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)shortcutIdentifier
{
  return (NSString *)sub_1000A588C(self, (uint64_t)a2, (void (*)(void))&dispatch thunk of FavoriteItem.shortcutIdentifier.getter);
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (void)setCustomName:(id)a3
{
}

- (NSUUID)storageIdentifier
{
  uint64_t v3 = sub_1000FF33C((uint64_t *)&unk_1015D5DE0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = self;
  dispatch thunk of MapsSyncObject.identifier.getter();

  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSUUID *)isa;
}

- (void)setStorageIdentifier:(id)a3
{
  uint64_t v5 = sub_1000FF33C((uint64_t *)&unk_1015D5DE0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  NSString v10 = (char *)&v14 - v9;
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  sub_1001CD278((uint64_t)v10, (uint64_t)v7);
  v13 = self;
  dispatch thunk of MapsSyncObject.identifier.setter();
  sub_1000FF2E0((uint64_t)v10, (uint64_t *)&unk_1015D5DE0);
}

- (void)setGeoMapItem:(id)a3
{
  uint64_t v5 = self;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  id v7 = [v5 mapItemStorageForGEOMapItem:a3];
  [(MapsFavoriteItem *)v6 setMapItemStorage:v7];

  swift_unknownObjectRelease();
}

- (void)setMapItemStorage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  dispatch thunk of FavoriteItem.mapItemStorage.setter();
}

- (void)setMkMapItem:(id)a3
{
  uint64_t v3 = self;
  if (a3) {
    id v4 = [a3 _geoMapItem];
  }
  else {
    id v4 = 0;
  }
  [(MapsFavoriteItem *)v3 setGeoMapItem:v4];

  swift_unknownObjectRelease();
}

- (void)removeContact:(id)a3
{
}

- (void)addContact:(id)a3
{
}

- (NSArray)contacts
{
  NSString v2 = self;
  dispatch thunk of FavoriteItem.fetchContactHandles()();

  v3.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)setContacts:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = self;
    uint64_t v7 = v4 + 40;
    do
    {
      swift_bridgeObjectRetain();
      dispatch thunk of FavoriteItem.addContactHandle(_:)();
      swift_bridgeObjectRelease();
      v7 += 16;
      --v5;
    }
    while (v5);
  }

  swift_bridgeObjectRelease();
}

- (id)cnLabledAddress
{
  NSString v2 = self;
  id v3 = sub_100347F7C();

  return v3;
}

@end