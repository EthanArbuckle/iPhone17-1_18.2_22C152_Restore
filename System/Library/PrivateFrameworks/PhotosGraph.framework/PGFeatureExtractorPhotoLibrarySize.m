@interface PGFeatureExtractorPhotoLibrarySize
+ (BOOL)preCalculatePhotoLibrarySizeWithPhotoLibrary:(id)a3;
+ (id)_allAssetsOfType:(int64_t)a3 withOptions:(id)a4;
+ (unint64_t)preCalculatedPhotoLibrarySize;
+ (void)resetPreCalculatedPhotoLibrarySize;
+ (void)setPreCalculatedPhotoLibrarySize:(unint64_t)a3;
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorPhotoLibrarySize

+ (void)setPreCalculatedPhotoLibrarySize:(unint64_t)a3
{
  preCalculatedPhotoLibrarySize = a3;
}

+ (unint64_t)preCalculatedPhotoLibrarySize
{
  return preCalculatedPhotoLibrarySize;
}

+ (void)resetPreCalculatedPhotoLibrarySize
{
}

+ (id)_allAssetsOfType:(int64_t)a3 withOptions:(id)a4
{
  return (id)[MEMORY[0x1E4F38EB8] fetchAssetsWithMediaType:a3 options:a4];
}

+ (BOOL)preCalculatePhotoLibrarySizeWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  [a1 resetPreCalculatedPhotoLibrarySize];
  v5 = [v4 librarySpecificFetchOptions];

  [v5 setWantsIncrementalChangeDetails:0];
  [v5 setShouldPrefetchCount:1];
  [v5 setIsExclusivePredicate:1];
  v6 = [a1 _allAssetsOfType:1 withOptions:v5];
  v7 = [a1 _allAssetsOfType:2 withOptions:v5];
  objc_msgSend(a1, "setPreCalculatedPhotoLibrarySize:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count"));

  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(id)objc_opt_class() preCalculatedPhotoLibrarySize];
  if (v5) {
    goto LABEL_4;
  }
  if ([(id)objc_opt_class() preCalculatePhotoLibrarySizeWithPhotoLibrary:v4])
  {
    unint64_t v5 = [(id)objc_opt_class() preCalculatedPhotoLibrarySize];
LABEL_4:
    id v6 = objc_alloc(MEMORY[0x1E4F71ED0]);
    *(float *)&double v7 = (float)v5;
    v8 = [NSNumber numberWithFloat:v7];
    v12[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v10 = (void *)[v6 initWithArray:v9];

    goto LABEL_5;
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (int64_t)featureLength
{
  return 1;
}

- (id)featureNames
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PhotoLibrarySize";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)name
{
  v2 = @"PhotoLibrarySize";
  return @"PhotoLibrarySize";
}

@end