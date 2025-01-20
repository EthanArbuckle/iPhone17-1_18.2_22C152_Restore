@interface PGTopLandscapeWallpaperSuggester
+ (BOOL)filtersForTopSuggestions;
+ (id)suggestionSubtypes;
- (void)setupFilteringContexts;
@end

@implementation PGTopLandscapeWallpaperSuggester

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
    +[PGTopLandscapeWallpaperSuggester filtersForTopSuggestions];
    return;
  }
  if (([(PGTopLandscapeWallpaperSuggester *)v2 isMemberOfClass:v3] & 1) == 0)
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
  v5 = [PGLandscapeWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    id v6 = [(PGLandscapeWallpaperSuggesterFilteringContext *)v5 initForTopLandscapesInOrientation:2];
    [(PGLandscapeWallpaperSuggester *)v2 setPrimaryFilteringContext:v6];

    id v12 = [[PGLandscapeWallpaperSuggesterFilteringContext alloc] initForTopLandscapesInOrientation:1];
    [(PGLandscapeWallpaperSuggester *)v2 setSecondaryFilteringContext:v12];
  }
  else
  {
    id v7 = [(PGLandscapeWallpaperSuggesterFilteringContext *)v5 initForTopLandscapesInOrientation:1];
    [(PGLandscapeWallpaperSuggester *)v2 setPrimaryFilteringContext:v7];

    [(PGLandscapeWallpaperSuggester *)v2 setSecondaryFilteringContext:0];
  }
}

+ (BOOL)filtersForTopSuggestions
{
  return 1;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:604];
}

@end