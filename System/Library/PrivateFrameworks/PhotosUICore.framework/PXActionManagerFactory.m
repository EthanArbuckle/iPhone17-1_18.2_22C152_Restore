@interface PXActionManagerFactory
+ (id)actionManagerForObject:(id)a3;
+ (id)actionManagerForObjects:(id)a3;
@end

@implementation PXActionManagerFactory

+ (id)actionManagerForObjects:(id)a3
{
  id v3 = a3;
  v4 = [v3 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [[PXPhotoKitAssetActionManager alloc] initWithSuggestion:v4];
LABEL_13:
    v10 = (PXPhotoKitSocialGroupActionManager *)v5;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:v4 displayTitleInfo:0];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [[PXPhotoKitCollectionListActionManager alloc] initWithCollectionList:v4];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [[PXPhotoKitPersonActionManager alloc] initWithPeople:v3];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v3;
    v7 = [PXPhotoKitSocialGroupActionManager alloc];
    v8 = [v6 firstObject];
    v9 = [v8 photoLibrary];
    v10 = [(PXPhotoKitSocialGroupActionManager *)v7 initWithSocialGroups:v6 photoLibrary:v9];

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [[PXPhotoKitAssetActionManager alloc] initWithAsset:v4];
    goto LABEL_13;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

+ (id)actionManagerForObject:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = objc_msgSend(a1, "actionManagerForObjects:", v6, v9, v10);

  return v7;
}

@end