@interface VUIFavoritesState
- (NSArray)favorites;
- (NSDate)lastModifiedDate;
- (_TtC8VideosUI17VUIFavoritesState)init;
@end

@implementation VUIFavoritesState

- (NSArray)favorites
{
  VUIFavoritesState.favorites.getter();
  type metadata accessor for VUIFavorite();
  v2 = (void *)sub_1E387CC88();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)sub_1E32E9FAC((uint64_t)self, (uint64_t)a2, (void (*)(void))VUIFavoritesState.lastModifiedDate.getter);
}

- (_TtC8VideosUI17VUIFavoritesState)init
{
}

- (void).cxx_destruct
{
}

@end