@interface JournalSearchController
- (_TtC7Journal23JournalSearchController)initWithCoder:(id)a3;
- (_TtC7Journal23JournalSearchController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal23JournalSearchController)initWithSearchResultsController:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation JournalSearchController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for JournalSearchController();
  id v2 = v4.receiver;
  [(JournalSearchController *)&v4 viewDidLoad];
  [v2 setSearchResultsUpdater:v2];
  id v3 = [v2 searchBar];
  [v3 setDelegate:v2];
}

- (_TtC7Journal23JournalSearchController)initWithSearchResultsController:(id)a3
{
  *(void *)&self->searchDelegate[OBJC_IVAR____TtC7Journal23JournalSearchController_searchDelegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7Journal23JournalSearchController_currentSearchText);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal23JournalSearchController_currentSearchTokens) = (Class)_swiftEmptyArrayStorage;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JournalSearchController();
  return [(JournalSearchController *)&v7 initWithSearchResultsController:a3];
}

- (_TtC7Journal23JournalSearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7Journal23JournalSearchController *)sub_1000677B0(v5, v7, a4);
}

- (_TtC7Journal23JournalSearchController)initWithCoder:(id)a3
{
  *(void *)&self->searchDelegate[OBJC_IVAR____TtC7Journal23JournalSearchController_searchDelegate] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7Journal23JournalSearchController_currentSearchText);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal23JournalSearchController_currentSearchTokens) = (Class)_swiftEmptyArrayStorage;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JournalSearchController();
  return [(JournalSearchController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal23JournalSearchController_searchDelegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100067A1C(v4);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC7Journal23JournalSearchController_searchDelegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC7Journal23JournalSearchController_currentSearchText);
    uint64_t v9 = *(void *)&self->searchDelegate[OBJC_IVAR____TtC7Journal23JournalSearchController_currentSearchText];
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 24);
    id v11 = a3;
    v12 = self;
    swift_bridgeObjectRetain();
    v10(v8, v9, ObjectType, v6);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
}

@end