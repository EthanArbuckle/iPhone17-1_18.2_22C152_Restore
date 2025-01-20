@interface MapsFavoritesManager
+ (_TtC4Maps20MapsFavoritesManager)sharedManager;
- (BOOL)active;
- (BOOL)hasInitialData;
- (NSArray)shortcuts;
- (NSArray)shortcutsForCarplay;
- (NSArray)shortcutsForLibrary;
- (NSArray)shortcutsForMapsHome;
- (NSArray)sortedShortcuts;
- (NSArray)storeSubscriptionTypes;
- (NSArray)suggestions;
- (_TtC4Maps20MapsFavoritesManager)init;
- (id)observers;
- (id)shortcutForMapItem:(id)a3;
- (int64_t)mapViewMode;
- (void)getShortcutsCountWithIncludeNearbyTransit:(BOOL)a3 completionHandler:(id)a4;
- (void)loadAllShortcutsWithCompletionHandler:(id)a3;
- (void)migrateFavoritesIfNeededWithCompletionHandler:(id)a3;
- (void)proposePlacesForTypeWithType:(int64_t)a3 completionHandler:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setHasInitialData:(BOOL)a3;
- (void)setMapViewMode:(int64_t)a3;
- (void)setShortcuts:(id)a3;
- (void)setSortedShortcuts:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation MapsFavoritesManager

- (NSArray)shortcutsForMapsHome
{
  return (NSArray *)sub_100064C50(self, (uint64_t)a2, (void (*)(void))sub_100064CD4);
}

+ (_TtC4Maps20MapsFavoritesManager)sharedManager
{
  if (qword_1015CBCD8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_101611650;

  return (_TtC4Maps20MapsFavoritesManager *)v2;
}

- (BOOL)hasInitialData
{
  v3 = (os_unfair_lock_s **)((char *)self + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__hasInitialData);
  swift_beginAccess();
  v4 = *v3;
  v5 = *v3 + 4;
  v6 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 5);
  sub_1000F3E3C(v5, &v8);
  os_unfair_lock_unlock(v4 + 5);
  LOBYTE(v5) = v8;

  swift_release();
  return (char)v5;
}

- (BOOL)active
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_active);
}

- (_TtC4Maps20MapsFavoritesManager)init
{
  return (_TtC4Maps20MapsFavoritesManager *)sub_10007F804();
}

- (id)observers
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_observers));
}

- (void)setActive:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_active) = a3;
}

- (void)registerObserver:(id)a3
{
}

- (NSArray)storeSubscriptionTypes
{
  swift_bridgeObjectRetain();
  sub_1000FF33C(&qword_1015CD300);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  sub_1000FF33C(&qword_1015CD300);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_storeSubscriptionTypes) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (NSArray)shortcuts
{
  return (NSArray *)sub_1002241F0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps20MapsFavoritesManager__shortcuts);
}

- (void)setShortcuts:(id)a3
{
}

- (NSArray)sortedShortcuts
{
  return (NSArray *)sub_1002241F0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps20MapsFavoritesManager__sortedShortcuts);
}

- (void)setSortedShortcuts:(id)a3
{
}

- (NSArray)suggestions
{
  return (NSArray *)sub_1002241F0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps20MapsFavoritesManager__suggestions);
}

- (void)setSuggestions:(id)a3
{
}

- (void)setHasInitialData:(BOOL)a3
{
  v4 = (os_unfair_lock_s **)((char *)self + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__hasInitialData);
  swift_beginAccess();
  v5 = *v4 + 4;
  v6 = *v4 + 5;
  v7 = self;
  os_unfair_lock_lock(v6);
  sub_10023165C(v5);
  os_unfair_lock_unlock(v6);
  swift_endAccess();
}

- (NSArray)shortcutsForLibrary
{
  return (NSArray *)sub_100064C50(self, (uint64_t)a2, (void (*)(void))sub_1002244B8);
}

- (NSArray)shortcutsForCarplay
{
  return (NSArray *)sub_100064C50(self, (uint64_t)a2, (void (*)(void))sub_1002244DC);
}

- (int64_t)mapViewMode
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_mapViewMode);
}

- (void)setMapViewMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_mapViewMode) = (Class)a3;
  v3 = self;
  sub_1002248B0();
}

- (void)proposePlacesForTypeWithType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1015D5E70;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1015D5E78;
  v14[5] = v13;
  v15 = self;
  sub_1000A2D24((uint64_t)v9, (uint64_t)&unk_1015D5E80, (uint64_t)v14);
  swift_release();
}

- (id)shortcutForMapItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_100226660(v4);

  return v6;
}

- (void)getShortcutsCountWithIncludeNearbyTransit:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1015D5E48;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1015D5E50;
  v14[5] = v13;
  v15 = self;
  sub_1000A2D24((uint64_t)v9, (uint64_t)&unk_1015D5E58, (uint64_t)v14);
  swift_release();
}

- (void)loadAllShortcutsWithCompletionHandler:(id)a3
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
  v11[4] = &unk_1015D5E28;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1015D5E30;
  v12[5] = v11;
  v13 = self;
  sub_1000A2D24((uint64_t)v7, (uint64_t)&unk_1015D5E38, (uint64_t)v12);
  swift_release();
}

- (void)unregisterObserver:(id)a3
{
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  var1 = a3.var1;
  unsigned int var0 = a3.var0;
  uint64_t v5 = self;
  sub_100229FD8(var0, (uint64_t)var1);
}

- (void)storeDidChangeWithTypes:(id)a3
{
  v3 = self;
  sub_100024958((uint64_t)&unk_1012DE6A0, (uint64_t)&unk_1012DE6C8, (uint64_t)&unk_1015D5E10);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps20MapsFavoritesManager____lazy_storage___msgRoutine));

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)migrateFavoritesIfNeededWithCompletionHandler:(id)a3
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
  v11[4] = &unk_1015D5D08;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1015D5D10;
  v12[5] = v11;
  v13 = self;
  sub_1000A2D24((uint64_t)v7, (uint64_t)&unk_1015DA440, (uint64_t)v12);
  swift_release();
}

@end