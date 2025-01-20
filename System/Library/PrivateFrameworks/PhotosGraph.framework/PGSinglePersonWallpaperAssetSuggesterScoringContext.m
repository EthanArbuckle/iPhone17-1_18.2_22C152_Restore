@interface PGSinglePersonWallpaperAssetSuggesterScoringContext
- (BOOL)isEqual:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation PGSinglePersonWallpaperAssetSuggesterScoringContext

- (id)dictionaryRepresentation
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGSinglePersonWallpaperAssetSuggesterScoringContext *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class();
  }

  return v6;
}

@end