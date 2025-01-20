@interface BKAssetMetadataCache
- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3;
- (id)plistEntryAsDictionaryFromAssetID:(id)a3 path:(id)a4 needsCoordination:(BOOL)a5;
- (void)saveTitle:(id)a3 author:(id)a4 genre:(id)a5 language:(id)a6 pageProgressionDirection:(id)a7 forAssetID:(id)a8;
@end

@implementation BKAssetMetadataCache

- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v4 coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:v3];

  return v5;
}

- (id)plistEntryAsDictionaryFromAssetID:(id)a3 path:(id)a4 needsCoordination:(BOOL)a5
{
  return 0;
}

- (void)saveTitle:(id)a3 author:(id)a4 genre:(id)a5 language:(id)a6 pageProgressionDirection:(id)a7 forAssetID:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = (id)objc_opt_new();
  [v19 saveTitle:v18 author:v17 genre:v16 language:v15 pageProgressionDirection:v14 forAssetID:v13];
}

@end