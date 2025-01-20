@interface PXPhotoKitAssetSpotlightActionManager
+ (id)notThisPersonLocalizedTitleForPerson:(id)a3;
+ (id)notThisPersonSystemImage;
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)supportsActionType:(id)a3;
- (unint64_t)presentationSource;
- (void)px_registerAdditionalPerformerClasses;
@end

@implementation PXPhotoKitAssetSpotlightActionManager

- (unint64_t)presentationSource
{
  return 1;
}

- (void)px_registerAdditionalPerformerClasses
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitAssetSpotlightActionManager;
  [(PXAssetActionManager *)&v3 px_registerAdditionalPerformerClasses];
  [(PXPhotoKitAssetActionManager *)self registerPerformerClass:objc_opt_class() forType:@"PXAssetActionTypeSpotlightOpenApp"];
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"PXAssetActionTypeShare"] & 1) != 0
    || ([v4 isEqualToString:@"PXAssetActionTypeSpotlightOpenApp"] & 1) != 0)
  {
    goto LABEL_11;
  }
  if (![v4 isEqualToString:@"PXAssetActionTypeCopy"])
  {
    if (([v4 isEqualToString:@"PXAssetActionTypeAddToAlbum"] & 1) == 0
      && ([v4 isEqualToString:@"PXAssetActionTypeAddToAlbumStream"] & 1) == 0)
    {
      if ([v4 isEqualToString:@"PXAssetActionTypeSyndicationSaveToLibrary"])
      {
        v9 = self;
        v5 = (objc_super *)&v9;
        goto LABEL_5;
      }
      if (([v4 isEqualToString:@"PXAssetActionTypeShowActionsMenu"] & 1) == 0)
      {
        if (![v4 isEqualToString:@"PXAssetActionTypeNotThisPerson"])
        {
          unsigned __int8 v6 = 0;
          goto LABEL_12;
        }
        v8 = self;
        v5 = (objc_super *)&v8;
        goto LABEL_5;
      }
    }
LABEL_11:
    unsigned __int8 v6 = 1;
    goto LABEL_12;
  }
  v10.receiver = self;
  v5 = &v10;
LABEL_5:
  v5->super_class = (Class)PXPhotoKitAssetSpotlightActionManager;
  unsigned __int8 v6 = -[objc_super canPerformActionType:](v5, sel_canPerformActionType_, v4, v8);
LABEL_12:

  return v6;
}

- (BOOL)supportsActionType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"PXAssetActionTypeShare"] & 1) != 0
    || ([v3 isEqualToString:@"PXAssetActionTypeSpotlightOpenApp"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"PXAssetActionTypeCopy"];
  }

  return v4;
}

+ (id)notThisPersonSystemImage
{
  return (id)[MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.xmark"];
}

+ (id)notThisPersonLocalizedTitleForPerson:(id)a3
{
  id v3 = a3;
  char v4 = objc_msgSend(v3, "px_localizedName");
  if ([v4 length])
  {
    uint64_t v5 = PXLocalizedStringForPersonOrPetAndVisibility(v3, 0, @"PXPeopleAssetNotThisNamedPersonFormat");

    unsigned __int8 v6 = PXStringWithValidatedFormat();
    id v3 = (id)v5;
  }
  else
  {
    unsigned __int8 v6 = PXLocalizedStringForPersonOrPetAndVisibility(v3, 0, @"PXPeopleAssetNotThisUnnamedPerson");
  }

  return v6;
}

@end