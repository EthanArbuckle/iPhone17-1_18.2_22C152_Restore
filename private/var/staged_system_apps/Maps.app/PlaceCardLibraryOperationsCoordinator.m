@interface PlaceCardLibraryOperationsCoordinator
- (BOOL)isPinned;
- (MKMapItem)mapItem;
- (NSArray)storeSubscriptionTypes;
- (NSString)placeNote;
- (UIViewController)viewControllerForPresentingAlert;
- (_TtC4Maps37PlaceCardLibraryOperationsCoordinator)init;
- (_TtC8MapsSync14MapsSyncObject)syncObject;
- (int64_t)savedStateOfPlace;
- (void)addPlaceToLibraryWithCustomName:(id)a3;
- (void)dealloc;
- (void)deletePlaceFromLibrary;
- (void)registerObserver:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setSavedStateOfPlace:(int64_t)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)setViewControllerForPresentingAlert:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updatePlaceNote:(id)a3;
@end

@implementation PlaceCardLibraryOperationsCoordinator

- (MKMapItem)mapItem
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_mapItem);
  swift_beginAccess();
  return (MKMapItem *)*v2;
}

- (void)setMapItem:(id)a3
{
  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_mapItem);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;
  sub_100237ABC(v6);
}

- (int64_t)savedStateOfPlace
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_savedStateOfPlace);
  swift_beginAccess();
  return *v2;
}

- (void)setSavedStateOfPlace:(int64_t)a3
{
  v5 = (int64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_savedStateOfPlace);
  swift_beginAccess();
  int64_t *v5 = a3;
  v6 = self;
  sub_100237F08();
}

- (UIViewController)viewControllerForPresentingAlert
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIViewController *)Strong;
}

- (void)setViewControllerForPresentingAlert:(id)a3
{
}

- (NSString)placeNote
{
  v2 = self;
  PlaceCardLibraryOperationsCoordinator.placeNote.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isPinned
{
  if (!*(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_placeItemInLibrary))
    return 0;
  type metadata accessor for FavoriteItem();
  return swift_dynamicCastClass() != 0;
}

- (_TtC8MapsSync14MapsSyncObject)syncObject
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_placeItemInLibrary))
  {
    type metadata accessor for MapsSyncObject();
    v2 = (void *)swift_dynamicCastClass();
    if (v2) {
      swift_unknownObjectRetain();
    }
  }
  else
  {
    v2 = 0;
  }

  return (_TtC8MapsSync14MapsSyncObject *)v2;
}

- (_TtC4Maps37PlaceCardLibraryOperationsCoordinator)init
{
  return (_TtC4Maps37PlaceCardLibraryOperationsCoordinator *)sub_1002386A0();
}

- (void)dealloc
{
  type metadata accessor for MapsSyncStore();
  uint64_t v3 = self;
  uint64_t v4 = (void *)static MapsSyncStore.sharedStore.getter();
  NSString v5 = v3;
  dispatch thunk of MapsSyncStore.unsubscribe(_:)();

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for PlaceCardLibraryOperationsCoordinator();
  [(PlaceCardLibraryOperationsCoordinator *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_savedStateObservers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_dataOperationsProvider));
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)addPlaceToLibraryWithCustomName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = self;
  sub_100238AC8(v4, v6, 0, 0);

  swift_bridgeObjectRelease();
}

- (void)deletePlaceFromLibrary
{
  v2 = self;
  PlaceCardLibraryOperationsCoordinator.deletePlaceFromLibrary()();
}

- (void)updatePlaceNote:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  PlaceCardLibraryOperationsCoordinator.updatePlaceNote(to:)(v8);

  swift_bridgeObjectRelease();
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (NSArray)storeSubscriptionTypes
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1000FF33C(&qword_1015CD300);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  sub_1000FF33C(&qword_1015CD300);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_storeSubscriptionTypes);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v3 = self;
  _s4Maps37PlaceCardLibraryOperationsCoordinatorC14storeDidChange5typesySaySSG_tF_0();
}

@end