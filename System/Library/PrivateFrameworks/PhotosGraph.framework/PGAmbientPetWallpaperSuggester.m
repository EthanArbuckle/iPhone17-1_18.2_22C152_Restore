@interface PGAmbientPetWallpaperSuggester
+ (id)suggestionSubtypes;
+ (id)suggestionTypes;
- (void)setupFilteringContexts;
@end

@implementation PGAmbientPetWallpaperSuggester

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
    +[PGAmbientPetWallpaperSuggester suggestionSubtypes];
    return;
  }
  if (([(PGAmbientPetWallpaperSuggester *)v2 isMemberOfClass:v3] & 1) == 0)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  id v4 = [[PGPetWallpaperSuggesterFilteringContext alloc] initForAmbient];
  [(PGPetWallpaperSuggester *)v2 setPrimaryFilteringContext:v4];

  [(PGPetWallpaperSuggester *)v2 setSecondaryFilteringContext:0];
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:803];
}

+ (id)suggestionTypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:8];
}

@end