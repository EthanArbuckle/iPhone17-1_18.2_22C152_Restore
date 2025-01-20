@interface PGAmbientNatureWallpaperSuggester
+ (BOOL)filtersForAmbientSuggestions;
+ (id)suggestionSubtypes;
+ (id)suggestionTypes;
- (void)setupFilteringContexts;
@end

@implementation PGAmbientNatureWallpaperSuggester

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
    +[PGAmbientNatureWallpaperSuggester filtersForAmbientSuggestions];
    return;
  }
  if (([(PGAmbientNatureWallpaperSuggester *)v2 isMemberOfClass:v3] & 1) == 0)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  id v4 = [[PGLandscapeWallpaperSuggesterFilteringContext alloc] initForAmbient];
  [(PGLandscapeWallpaperSuggester *)v2 setPrimaryFilteringContext:v4];

  [(PGLandscapeWallpaperSuggester *)v2 setSecondaryFilteringContext:0];
}

+ (BOOL)filtersForAmbientSuggestions
{
  return 1;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:801];
}

+ (id)suggestionTypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:8];
}

@end