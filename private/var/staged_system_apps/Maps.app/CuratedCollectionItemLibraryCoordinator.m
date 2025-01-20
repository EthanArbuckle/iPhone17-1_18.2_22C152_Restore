@interface CuratedCollectionItemLibraryCoordinator
- (BOOL)isPlaceInLibrary;
- (MKMapItem)initialMapItem;
- (_TtC4Maps29LibraryDataOperationsProvider)dataOperationsProvider;
- (_TtC4Maps39CuratedCollectionItemLibraryCoordinator)init;
- (_TtC4Maps39CuratedCollectionItemLibraryCoordinator)initWithInitialMapItem:(id)a3 dataOperationsProvider:(id)a4;
- (void)addPlaceToLibraryWithRefinedMapItem:(id)a3;
- (void)deletePlaceFromLibraryWithViewControllerForPresentingAlert:(id)a3;
- (void)determineSavedStateWithCompletion:(id)a3;
@end

@implementation CuratedCollectionItemLibraryCoordinator

- (MKMapItem)initialMapItem
{
  return (MKMapItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_initialMapItem));
}

- (_TtC4Maps29LibraryDataOperationsProvider)dataOperationsProvider
{
  return (_TtC4Maps29LibraryDataOperationsProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_dataOperationsProvider));
}

- (_TtC4Maps39CuratedCollectionItemLibraryCoordinator)initWithInitialMapItem:(id)a3 dataOperationsProvider:(id)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_placeItemInLibrary) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_isAddingToLibrary) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_initialMapItem) = (Class)a3;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_dataOperationsProvider) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CuratedCollectionItemLibraryCoordinator();
  id v6 = a3;
  id v7 = a4;
  return [(CuratedCollectionItemLibraryCoordinator *)&v9 init];
}

- (BOOL)isPlaceInLibrary
{
  return (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_isAddingToLibrary) & 1) != 0
      || *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_placeItemInLibrary) != 0;
}

- (void)determineSavedStateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_initialMapItem);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8 = self;
  sub_1002E65E0(v6, v7, (void (*)(uint64_t))sub_100135AFC, v5);

  swift_release();

  swift_release();
}

- (void)addPlaceToLibraryWithRefinedMapItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CuratedCollectionItemLibraryCoordinator.addPlaceToLibrary(refinedMapItem:)((MKMapItem)v4);
}

- (void)deletePlaceFromLibraryWithViewControllerForPresentingAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CuratedCollectionItemLibraryCoordinator.deletePlaceFromLibrary(viewControllerForPresentingAlert:)((UIViewController)v4);
}

- (_TtC4Maps39CuratedCollectionItemLibraryCoordinator)init
{
  result = (_TtC4Maps39CuratedCollectionItemLibraryCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_initialMapItem));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_dataOperationsProvider));

  swift_unknownObjectRelease();
}

@end