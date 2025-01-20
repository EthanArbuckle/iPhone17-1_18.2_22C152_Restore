@interface LibraryItemsCountManager
+ (_TtC4Maps24LibraryItemsCountManager)sharedManager;
- (NSArray)storeSubscriptionTypes;
- (_TtC4Maps17LibraryItemsCount)lastFetchedCounts;
- (_TtC4Maps24LibraryItemsCountManager)init;
- (void)collectionManager:(id)a3 contentDidChange:(id)a4;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)setLastFetchedCounts:(id)a3;
- (void)setNeedsRefresh;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation LibraryItemsCountManager

- (_TtC4Maps24LibraryItemsCountManager)init
{
  return (_TtC4Maps24LibraryItemsCountManager *)sub_100060034();
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) & 1) == 0)
  {
    *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) = 1;
    id v5 = a3;
    v6 = self;
    sub_100023BFC();
  }
}

+ (_TtC4Maps24LibraryItemsCountManager)sharedManager
{
  if (qword_1015CBF98 != -1) {
    swift_once();
  }
  v2 = (void *)static LibraryItemsCountManager.shared;

  return (_TtC4Maps24LibraryItemsCountManager *)v2;
}

- (_TtC4Maps17LibraryItemsCount)lastFetchedCounts
{
  return (_TtC4Maps17LibraryItemsCount *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_lastFetchedCounts));
}

- (void)setLastFetchedCounts:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_lastFetchedCounts);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_lastFetchedCounts) = (Class)a3;
  id v3 = a3;
}

- (void)dealloc
{
  v2 = self;
  LibraryItemsCountManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)setNeedsRefresh
{
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) & 1) == 0)
  {
    *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) = 1;
    v2 = self;
    sub_100023BFC();
  }
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
  id v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_storeSubscriptionTypes);
  swift_beginAccess();
  *id v5 = v4;
  swift_bridgeObjectRelease();
}

- (void)storeDidChangeWithTypes:(id)a3
{
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) & 1) == 0)
  {
    *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) = 1;
    id v3 = self;
    sub_100023BFC();
  }
}

@end