@interface NSPredicate(PGSinglePersonWallpaperAssetSuggester)
- (id)pg_wallpaperSuggestionReason;
- (void)pg_setWallpaperSuggestionReason:()PGSinglePersonWallpaperAssetSuggester;
@end

@implementation NSPredicate(PGSinglePersonWallpaperAssetSuggester)

- (void)pg_setWallpaperSuggestionReason:()PGSinglePersonWallpaperAssetSuggester
{
}

- (id)pg_wallpaperSuggestionReason
{
  return objc_getAssociatedObject(a1, "wallpaperSuggestionPredicateReason");
}

@end