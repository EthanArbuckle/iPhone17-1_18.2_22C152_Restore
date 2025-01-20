@interface PGAmbientPeopleWallpaperSuggester
+ (id)suggestionSubtypes;
+ (id)suggestionTypes;
- (void)setupFilteringContexts;
@end

@implementation PGAmbientPeopleWallpaperSuggester

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
    +[PGAmbientPeopleWallpaperSuggester suggestionSubtypes];
    return;
  }
  if (([(PGAmbientPeopleWallpaperSuggester *)v2 isMemberOfClass:v3] & 1) == 0)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  id v4 = [[PGPeopleWallpaperSuggesterFilteringContext alloc] initForAmbient];
  [(PGPeopleWallpaperSuggester *)v2 setPrimaryFilteringContext:v4];

  [(PGPeopleWallpaperSuggester *)v2 setSecondaryFilteringContext:0];
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:804];
}

+ (id)suggestionTypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:8];
}

@end