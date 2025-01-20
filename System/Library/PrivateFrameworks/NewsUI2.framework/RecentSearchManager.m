@interface RecentSearchManager
- (_TtC7NewsUI219RecentSearchManager)init;
- (void)readingHistoryDidClear:(id)a3;
@end

@implementation RecentSearchManager

- (_TtC7NewsUI219RecentSearchManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI219RecentSearchManager_observers) = (Class)MEMORY[0x1E4FBC860];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(RecentSearchManager *)&v5 init];
}

- (void).cxx_destruct
{
}

- (void)readingHistoryDidClear:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  RecentSearchManager.clearRecentSearches()();

  swift_release();
}

@end