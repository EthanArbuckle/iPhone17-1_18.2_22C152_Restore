@interface PGWallpaperSuggestionInformer
- (PGWallpaperSuggestionInformer)initWithWorkingContext:(id)a3;
- (id)personLocalIdentifiersForTopPeople:(BOOL)a3;
@end

@implementation PGWallpaperSuggestionInformer

- (void).cxx_destruct
{
}

- (id)personLocalIdentifiersForTopPeople:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [[PGSuggestionSession alloc] initWithProfile:2 workingContext:self->_workingContext];
  v5 = off_1E68E3188;
  if (!v3) {
    v5 = off_1E68E2BE0;
  }
  v6 = (void *)[objc_alloc(*v5) initWithSession:v4];
  v7 = [v6 personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:&__block_literal_global_33298];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  return v10;
}

- (PGWallpaperSuggestionInformer)initWithWorkingContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGWallpaperSuggestionInformer;
  v6 = [(PGWallpaperSuggestionInformer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workingContext, a3);
  }

  return v7;
}

@end