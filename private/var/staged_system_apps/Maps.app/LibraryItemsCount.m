@interface LibraryItemsCount
- (_TtC4Maps17LibraryItemsCount)init;
- (_TtC4Maps17LibraryItemsCount)initWithGuidesCount:(int64_t)a3 pinnedItemsCount:(int64_t)a4 placesCount:(int64_t)a5 routesCount:(int64_t)a6;
- (id)createCopy;
- (id)descriptionForLibrarySectionInHome;
- (int64_t)guidesCount;
- (int64_t)pinnedItemsCount;
- (int64_t)placesCount;
- (int64_t)routesCount;
- (int64_t)total;
- (void)setGuidesCount:(int64_t)a3;
- (void)setPinnedItemsCount:(int64_t)a3;
- (void)setPlacesCount:(int64_t)a3;
- (void)setRoutesCount:(int64_t)a3;
@end

@implementation LibraryItemsCount

- (int64_t)guidesCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_guidesCount);
}

- (void)setGuidesCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_guidesCount) = (Class)a3;
}

- (int64_t)pinnedItemsCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_pinnedItemsCount);
}

- (void)setPinnedItemsCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_pinnedItemsCount) = (Class)a3;
}

- (int64_t)placesCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_placesCount);
}

- (void)setPlacesCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_placesCount) = (Class)a3;
}

- (int64_t)routesCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_routesCount);
}

- (void)setRoutesCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_routesCount) = (Class)a3;
}

- (_TtC4Maps17LibraryItemsCount)initWithGuidesCount:(int64_t)a3 pinnedItemsCount:(int64_t)a4 placesCount:(int64_t)a5 routesCount:(int64_t)a6
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_guidesCount) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_pinnedItemsCount) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_placesCount) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_routesCount) = (Class)a6;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LibraryItemsCount();
  return [(LibraryItemsCount *)&v7 init];
}

- (int64_t)total
{
  v2 = self;
  int64_t v3 = sub_1002FDC68();

  return v3;
}

- (id)descriptionForLibrarySectionInHome
{
  v2 = self;
  LibraryItemsCount.descriptionForLibrarySectionInHome()();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)createCopy
{
  v2 = self;
  id v3 = sub_1002FDD38();

  return v3;
}

- (_TtC4Maps17LibraryItemsCount)init
{
  result = (_TtC4Maps17LibraryItemsCount *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end