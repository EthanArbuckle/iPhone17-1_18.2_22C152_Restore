@interface PGTopPeopleWallpaperSuggester
+ (BOOL)filtersForTopSuggestions;
+ (id)suggestionSubtypes;
- (void)setupFilteringContexts;
@end

@implementation PGTopPeopleWallpaperSuggester

+ (BOOL)filtersForTopSuggestions
{
  return 1;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:602];
}

- (void)setupFilteringContexts
{
  int IsIPad = PLPhysicalDeviceIsIPad();
  v4 = [PGPeopleWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    id v5 = [(PGPeopleWallpaperSuggesterFilteringContext *)v4 initForTopPeopleInOrientation:2];
    [(PGPeopleWallpaperSuggester *)self setPrimaryFilteringContext:v5];

    id v7 = [[PGPeopleWallpaperSuggesterFilteringContext alloc] initForTopPeopleInOrientation:1];
    [(PGPeopleWallpaperSuggester *)self setSecondaryFilteringContext:v7];
  }
  else
  {
    id v6 = [(PGPeopleWallpaperSuggesterFilteringContext *)v4 initForTopPeopleInOrientation:1];
    [(PGPeopleWallpaperSuggester *)self setPrimaryFilteringContext:v6];

    [(PGPeopleWallpaperSuggester *)self setSecondaryFilteringContext:0];
  }
}

@end