@interface HomeListLibraryCountsDataProvider
- (BOOL)active;
- (BOOL)hasInitialData;
- (_TtC4Maps17LibraryItemsCount)counts;
- (_TtC4Maps33HomeListLibraryCountsDataProvider)init;
- (_TtC4Maps33HomeListLibraryCountsDataProvider)initWithCountsManager:(id)a3;
- (id)observers;
- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4;
- (void)notifyObserversIfNeeded;
- (void)setActive:(BOOL)a3;
- (void)setHasInitialData:(BOOL)a3;
@end

@implementation HomeListLibraryCountsDataProvider

- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10003B790();
}

- (BOOL)hasInitialData
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_hasInitialData);
}

- (id)observers
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_observers));
}

- (void)setActive:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_active) = a3;
  if (a3)
  {
    uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_countsManager);
    if ((*(unsigned char *)(v3 + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) & 1) == 0)
    {
      *(unsigned char *)(v3 + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) = 1;
      v4 = self;
      sub_100023BFC();
    }
  }
}

- (BOOL)active
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_active);
}

- (void)setHasInitialData:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_hasInitialData) = a3;
}

- (_TtC4Maps17LibraryItemsCount)counts
{
  return (_TtC4Maps17LibraryItemsCount *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_countsManager)
                                                                                 + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_lastFetchedCounts));
}

- (_TtC4Maps33HomeListLibraryCountsDataProvider)initWithCountsManager:(id)a3
{
  return (_TtC4Maps33HomeListLibraryCountsDataProvider *)sub_100033468(a3);
}

- (void)notifyObserversIfNeeded
{
  v2 = self;
  sub_10003B790();
}

- (_TtC4Maps33HomeListLibraryCountsDataProvider)init
{
  result = (_TtC4Maps33HomeListLibraryCountsDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_countsManager);
}

@end