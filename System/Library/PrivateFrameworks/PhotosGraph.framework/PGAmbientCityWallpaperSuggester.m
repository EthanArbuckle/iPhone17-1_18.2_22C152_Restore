@interface PGAmbientCityWallpaperSuggester
+ (BOOL)filtersForAmbientSuggestions;
+ (id)suggestionSubtypes;
+ (id)suggestionTypes;
- (void)setupFilteringContexts;
@end

@implementation PGAmbientCityWallpaperSuggester

- (void)setupFilteringContexts
{
  v2 = self;
  v3 = (objc_class *)objc_opt_class();
  if (!v2)
  {
    NSStringFromClass(v3);
    objc_claimAutoreleasedReturnValue();
LABEL_8:
    v7 = (void *)_PFAssertFailHandler();
    +[PGAmbientCityWallpaperSuggester filtersForAmbientSuggestions];
    return;
  }
  if (([(PGAmbientCityWallpaperSuggester *)v2 isMemberOfClass:v3] & 1) == 0)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  id v4 = [[PGCityscapeWallpaperSuggesterFilteringContext alloc] initForAmbient];
  [(PGCityscapeWallpaperSuggester *)v2 setPrimaryFilteringContext:v4];

  [(PGCityscapeWallpaperSuggester *)v2 setSecondaryFilteringContext:0];
}

+ (BOOL)filtersForAmbientSuggestions
{
  return 1;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:802];
}

+ (id)suggestionTypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:8];
}

@end