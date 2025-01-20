@interface AutoFavoritesService
- (void)prepareFavorites:(id)a3;
@end

@implementation AutoFavoritesService

- (void)prepareFavorites:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_1DE724D24((uint64_t)sub_1DE6EA070, v4);
  swift_release();

  swift_release();
}

@end