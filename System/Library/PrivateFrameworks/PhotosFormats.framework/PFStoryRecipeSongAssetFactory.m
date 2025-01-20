@interface PFStoryRecipeSongAssetFactory
+ (PFStoryRecipeSongAsset)nullAsset;
+ (id)createAssetWithCategory:(int64_t)a3 subcategory:(int64_t)a4 catalog:(id)a5 songID:(id)a6 title:(id)a7 subtitle:(id)a8 colorGradeCategory:(id)a9;
@end

@implementation PFStoryRecipeSongAssetFactory

+ (PFStoryRecipeSongAsset)nullAsset
{
  return (PFStoryRecipeSongAsset *)objc_msgSend(a1, "createAssetWithCategory:subcategory:catalog:songID:title:subtitle:colorGradeCategory:", 0, 0, @"null");
}

+ (id)createAssetWithCategory:(int64_t)a3 subcategory:(int64_t)a4 catalog:(id)a5 songID:(id)a6 title:(id)a7 subtitle:(id)a8 colorGradeCategory:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  v20 = [[PFStoryConcreteRecipeSongAsset alloc] initWithIdentifier:0 category:a3 subcategory:a4 catalog:v19 songID:v18 title:v17 subtitle:v16];

  [(PFStoryConcreteRecipeSongAsset *)v20 setColorGradeCategory:v15];

  return v20;
}

@end