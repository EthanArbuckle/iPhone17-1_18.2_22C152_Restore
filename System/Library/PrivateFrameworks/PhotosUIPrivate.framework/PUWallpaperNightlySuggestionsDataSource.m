@interface PUWallpaperNightlySuggestionsDataSource
- (NSDate)date;
- (PUWallpaperNightlySuggestionsDataSource)initWithPhotoLibrary:(id)a3;
- (PUWallpaperNightlySuggestionsPosterConfiguration)posterConfiguration;
- (id)_dictionaryWithPosterConfiguration:(id)a3;
- (id)delegates;
- (id)fetchResult;
- (id)objectAtIndexPath:(id)a3;
- (id)title;
- (unsigned)subtype;
- (void)refresh;
- (void)setDate:(id)a3;
- (void)setPosterConfiguration:(id)a3;
@end

@implementation PUWallpaperNightlySuggestionsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (NSDate)date
{
  return self->_date;
}

- (PUWallpaperNightlySuggestionsPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (id)delegates
{
  return self->_delegates;
}

- (id)fetchResult
{
  return self->_fetchResult;
}

- (id)_dictionaryWithPosterConfiguration:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"personLocalIdentifiers";
  id v3 = a3;
  v4 = [v3 personLocalIdentifiers];
  v5 = [v4 allObjects];
  v14[0] = v5;
  v13[1] = @"includePets";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "includePets"));
  v14[1] = v6;
  v13[2] = @"includeLandscapes";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "includeLandscapes"));
  v14[2] = v7;
  v13[3] = @"includeCityscapes";
  v8 = NSNumber;
  uint64_t v9 = [v3 includeCityscapes];

  v10 = [v8 numberWithBool:v9];
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (void)refresh
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (self->_date && self->_posterConfiguration)
  {
    id v3 = -[PUWallpaperNightlySuggestionsDataSource _dictionaryWithPosterConfiguration:](self, "_dictionaryWithPosterConfiguration:");
    v4 = [(PHPhotoLibrary *)self->_photoLibrary photoAnalysisClient];
    date = self->_date;
    id v35 = 0;
    v6 = [v4 requestNightlySuggestionsForPosterConfiguration:v3 atDate:date error:&v35];
    id v7 = v35;

    v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8B118]];
    if (v8)
    {
      id v27 = v7;
      v28 = v3;
      uint64_t v9 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      v10 = (void *)MEMORY[0x1E4F28BA0];
      v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
      v37[0] = v11;
      v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier IN %@", v8];
      v37[1] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      v14 = [v10 andPredicateWithSubpredicates:v13];
      [v9 setPredicate:v14];

      v15 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v9];
      v16 = [v15 fetchedObjects];
      v17 = (void *)[v16 copy];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __50__PUWallpaperNightlySuggestionsDataSource_refresh__block_invoke;
      v33[3] = &unk_1E5F2A078;
      id v34 = v8;
      v18 = [v17 sortedArrayUsingComparator:v33];

      id v19 = objc_alloc(MEMORY[0x1E4F39150]);
      v20 = (PHFetchResult *)[v19 initWithObjects:v18 photoLibrary:self->_photoLibrary fetchType:*MEMORY[0x1E4F39688] fetchPropertySets:0 identifier:0 registerIfNeeded:0];
      fetchResult = self->_fetchResult;
      self->_fetchResult = v20;

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v22 = [(PUWallpaperNightlySuggestionsDataSource *)self delegates];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v30 != v25) {
              objc_enumerationMutation(v22);
            }
            [*(id *)(*((void *)&v29 + 1) + 8 * i) dataSourceChanged:self];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v36 count:16];
        }
        while (v24);
      }

      id v7 = v27;
      id v3 = v28;
    }
  }
}

uint64_t __50__PUWallpaperNightlySuggestionsDataSource_refresh__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = NSNumber;
  v6 = *(void **)(a1 + 32);
  id v7 = a3;
  v8 = [a2 localIdentifier];
  uint64_t v9 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v8));
  v10 = NSNumber;
  v11 = *(void **)(a1 + 32);
  v12 = [v7 localIdentifier];

  v13 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfObject:", v12));
  uint64_t v14 = [v9 compare:v13];

  return v14;
}

- (void)setPosterConfiguration:(id)a3
{
  v5 = (PUWallpaperNightlySuggestionsPosterConfiguration *)a3;
  if (self->_posterConfiguration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_posterConfiguration, a3);
    [(PUWallpaperNightlySuggestionsDataSource *)self refresh];
    v5 = v6;
  }
}

- (void)setDate:(id)a3
{
  v5 = (NSDate *)a3;
  if (self->_date != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_date, a3);
    [(PUWallpaperNightlySuggestionsDataSource *)self refresh];
    v5 = v6;
  }
}

- (id)objectAtIndexPath:(id)a3
{
  fetchResult = self->_fetchResult;
  uint64_t v4 = [a3 row];
  return [(PHFetchResult *)fetchResult objectAtIndex:v4];
}

- (unsigned)subtype
{
  return 0;
}

- (id)title
{
  return [(NSDateFormatter *)self->_dateFormatter stringFromDate:self->_date];
}

- (PUWallpaperNightlySuggestionsDataSource)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUWallpaperNightlySuggestionsDataSource;
  v6 = [(PUWallpaperNightlySuggestionsDataSource *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

    [(NSDateFormatter *)v7->_dateFormatter setTimeStyle:0];
    [(NSDateFormatter *)v7->_dateFormatter setDateStyle:3];
    uint64_t v10 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    delegates = v7->_delegates;
    v7->_delegates = (NSPointerArray *)v10;
  }
  return v7;
}

@end