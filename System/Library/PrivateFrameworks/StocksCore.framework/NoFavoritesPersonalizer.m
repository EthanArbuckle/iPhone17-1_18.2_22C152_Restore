@interface NoFavoritesPersonalizer
- (FCPersonalizationWhitelist)whitelist;
- (unint64_t)whitelistLevelForTagID:(id)a3;
- (void)prepareFavorites:(id)a3;
@end

@implementation NoFavoritesPersonalizer

- (FCPersonalizationWhitelist)whitelist
{
  return (FCPersonalizationWhitelist *)0;
}

- (void)prepareFavorites:(id)a3
{
  v3 = _Block_copy(a3);
  v4 = (void (*)(void *))v3[2];
  sub_1AFFC8E48();
  v4(v3);
  _Block_release(v3);

  swift_release();
}

- (unint64_t)whitelistLevelForTagID:(id)a3
{
  return 2;
}

@end