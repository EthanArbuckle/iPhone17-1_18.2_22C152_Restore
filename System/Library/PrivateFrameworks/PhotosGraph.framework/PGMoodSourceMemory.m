@interface PGMoodSourceMemory
+ (id)_plistName;
- (BOOL)_shouldProcessSource;
- (double)weight;
- (id)_plistMoodIdentifiersWithGraph:(id)a3;
@end

@implementation PGMoodSourceMemory

+ (id)_plistName
{
  return @"MoodSourceMemory";
}

- (BOOL)_shouldProcessSource
{
  v3 = [(PGMoodSource *)self enrichedMemory];
  uint64_t v4 = [v3 memoryCategory];

  if (v4) {
    return 1;
  }
  v6 = [(PGMoodSource *)self assetCollection];
  if ([v6 assetCollectionType] == 4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7 = [(PGMoodSource *)self options];
    BOOL v5 = [v7 memoryCategory] != 0;
  }
  return v5;
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if ([(PGMoodSourceMemory *)self _shouldProcessSource])
  {
    uint64_t v4 = [(PGMoodSource *)self enrichedMemory];

    if (v4)
    {
      BOOL v5 = &unk_1F28D3F48;
    }
    else
    {
      v7 = [(PGMoodSource *)self assetCollection];
      uint64_t v8 = [v7 assetCollectionType];

      if (v8 == 4)
      {
        v9 = [(PGMoodSource *)self assetCollection];
        uint64_t v10 = [v9 category];
        uint64_t v11 = [v9 subcategory];
      }
      else
      {
        v12 = [(PGMoodSource *)self options];
        uint64_t v10 = [v12 memoryCategory];

        v9 = [(PGMoodSource *)self options];
        uint64_t v11 = [v9 memorySubcategory];
      }
      uint64_t v13 = v11;

      BOOL v5 = &unk_1F28D3F60;
      if (v10 != 212 && v10 != 215)
      {
        v14 = [MEMORY[0x1E4F39160] stringForCategory:v10];
        v15 = [v14 capitalizedString];
        v16 = [v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F283BC78];

        v17 = [MEMORY[0x1E4F39160] stringForSubcategory:v13];
        v18 = [v17 capitalizedString];
        v19 = [v18 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F283BC78];

        char v20 = [v16 containsString:@"Holiday"];
        if (v10 != 218 && (v20 & 1) != 0 || ([v19 containsString:@"Holiday"] & 1) != 0)
        {
          BOOL v5 = &unk_1F28D3F78;
        }
        else
        {
          v21 = [NSString stringWithFormat:@"%@.%@", v16, v19];
          v22[0] = v21;
          BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
        }
      }
    }
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (double)weight
{
  BOOL v2 = [(PGMoodSourceMemory *)self _shouldProcessSource];
  double result = 0.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

@end