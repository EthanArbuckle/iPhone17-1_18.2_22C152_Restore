@interface PGTopCityscapeWallpaperSuggester
+ (BOOL)filtersForTopSuggestions;
+ (id)suggestionSubtypes;
- (void)setupFilteringContexts;
@end

@implementation PGTopCityscapeWallpaperSuggester

- (void)setupFilteringContexts
{
  v2 = self;
  v3 = (objc_class *)objc_opt_class();
  if (!v2)
  {
    NSStringFromClass(v3);
    objc_claimAutoreleasedReturnValue();
LABEL_12:
    v10 = (void *)_PFAssertFailHandler();
    +[PGTopCityscapeWallpaperSuggester filtersForTopSuggestions];
    return;
  }
  if (([(PGTopCityscapeWallpaperSuggester *)v2 isMemberOfClass:v3] & 1) == 0)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  int IsIPad = PLPhysicalDeviceIsIPad();
  v5 = [PGCityscapeWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    id v6 = [(PGCityscapeWallpaperSuggesterFilteringContext *)v5 initForTopCityscapesInOrientation:2];
    [(PGCityscapeWallpaperSuggester *)v2 setPrimaryFilteringContext:v6];

    id v12 = [[PGCityscapeWallpaperSuggesterFilteringContext alloc] initForTopCityscapesInOrientation:1];
    [(PGCityscapeWallpaperSuggester *)v2 setSecondaryFilteringContext:v12];
  }
  else
  {
    id v7 = [(PGCityscapeWallpaperSuggesterFilteringContext *)v5 initForTopCityscapesInOrientation:1];
    [(PGCityscapeWallpaperSuggester *)v2 setPrimaryFilteringContext:v7];

    [(PGCityscapeWallpaperSuggester *)v2 setSecondaryFilteringContext:0];
  }
}

+ (BOOL)filtersForTopSuggestions
{
  return 1;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:605];
}

@end