@interface NTKPhotosFace
+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5;
+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)supportsExternalAssets;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_localizedStringForExternal:(id)a3 comment:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)addFaceDetailViewController;
- (id)albumFaceContent;
- (id)bundleIdentifierForUpgrade;
- (id)libraryDetailViewController;
- (id)upgradeContext;
- (int64_t)_customEditModeForUniqueConfiguration;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)_cleanupEditOptions;
- (void)_prepareEditOptions;
- (void)companionEditorWithAssets:(id)a3 completion:(id)a4;
- (void)upgradeContext;
@end

@implementation NTKPhotosFace

- (int64_t)timeStyle
{
  return 1;
}

- (id)_customEditModes
{
  v2 = [(NTKFace *)self device];
  v3 = [v2 nrDevice];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5500A959-3C9D-4787-9235-2A1210C3559E"];
  int v5 = [v3 supportsCapability:v4];

  if (v5) {
    return &unk_1F16E8C50;
  }
  else {
    return &unk_1F16E8C68;
  }
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 10:
      v7 = [(NTKFace *)self device];
      uint64_t v8 = +[NTKPhotosColorEditOption optionWithColor:3000 forDevice:v7];
      goto LABEL_7;
    case 14:
      v7 = [(NTKFace *)self device];
      uint64_t v8 = +[NTKDateAlignmentEditOption optionWithAlignment:0 forDevice:v7];
      goto LABEL_7;
    case 12:
      v7 = [(NTKFace *)self device];
      uint64_t v8 = +[NTKPhotosContentEditOption optionWithPhotosContent:0 forDevice:v7];
LABEL_7:
      v9 = (void *)v8;

      goto LABEL_9;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NTKPhotosFace;
  BOOL result = objc_msgSendSuper2(&v6, sel__customEditModeIsRows_forDevice_, a3, a4);
  if (a3 == 12) {
    return 1;
  }
  return result;
}

+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 != 12)
  {
LABEL_5:
    char v9 = 0;
    goto LABEL_6;
  }
  if ([v7 photosContent] != 1)
  {
    if (![v7 photosContent])
    {
      v11 = [v8 nrDevice];
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"41714B27-B839-4AB5-8A36-6191015AA8FE"];
      char v9 = [v11 supportsCapability:v12];

      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v9 = 1;
LABEL_6:

  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 12)
  {
    v4 = NTKCompanionClockFaceLocalizedString(@"EDIT_MODE_LABEL_PHOTOS_CONTENT_COMPANION", @"Photos");
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NTKPhotosFace;
    v4 = objc_msgSendSuper2(&v6, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, a4);
  }
  return v4;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  return 14;
}

- (void)_prepareEditOptions
{
  self->_editing = 1;
}

- (void)_cleanupEditOptions
{
  self->_editing = 0;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPhotosFace;
  return [(NTKFace *)&v4 _hasOptionsForCustomEditMode:a3];
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 10:
      id v7 = NTKPhotosColorEditOption;
      break;
    case 14:
      id v7 = NTKDateAlignmentEditOption;
      break;
    case 12:
      id v7 = NTKPhotosContentEditOption;
      break;
    default:
      unint64_t v9 = 0;
      goto LABEL_9;
  }
  id v8 = [(NTKFace *)self device];
  unint64_t v9 = [(__objc2_class *)v7 numberOfOptionsForDevice:v8];

LABEL_9:
  return v9;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  switch(a4)
  {
    case 10:
      unint64_t v9 = NTKPhotosColorEditOption;
      goto LABEL_7;
    case 14:
      unint64_t v9 = NTKDateAlignmentEditOption;
      goto LABEL_7;
    case 12:
      unint64_t v9 = NTKPhotosContentEditOption;
LABEL_7:
      v10 = [(NTKFace *)self device];
      v11 = [(__objc2_class *)v9 optionAtIndex:a3 forDevice:v10];

      goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 10:
      v10 = NTKPhotosColorEditOption;
      break;
    case 14:
      v10 = NTKDateAlignmentEditOption;
      break;
    case 12:
      v10 = NTKPhotosContentEditOption;
      break;
    default:
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_9;
  }
  v11 = [(NTKFace *)self device];
  unint64_t v12 = [(__objc2_class *)v10 indexOfOption:v8 forDevice:v11];

LABEL_9:
  return v12;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 12 || a3 == 14)
  {
    objc_super v4 = objc_opt_class();
  }
  else
  {
    objc_super v4 = 0;
  }
  return (Class)v4;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKPhotosColorEditOption pigmentFaceDomain];
}

- (id)albumFaceContent
{
  return 0;
}

- (id)bundleIdentifierForUpgrade
{
  return @"com.apple.NTKParmesanFaceBundle";
}

- (id)upgradeContext
{
  uint64_t v3 = [(NTKFace *)self resourceDirectory];
  objc_super v4 = +[NTKPhotosReader readerForResourceDirectory:v3];

  int v5 = [(NTKFace *)self selectedOptionsForCustomEditModes];
  id v6 = [v5 objectForKeyedSubscript:&unk_1F16E0630];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(NTKFace *)self selectedOptionsForCustomEditModes];
    uint64_t v8 = [v7 objectForKeyedSubscript:&unk_1F16E0648];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(NTKFace *)self complicationForSlot:@"top"];
      v10 = [(NTKFace *)self complicationForSlot:@"bottom"];
      v11 = [(NTKFace *)self selectedOptionsForCustomEditModes];
      unint64_t v12 = [v11 objectForKeyedSubscript:&unk_1F16E0618];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = v12;
        v14 = [[_NTKPhotosPhotoFaceUpgradeContext alloc] initWithReader:v4 contentOption:v6 positionOption:v8 topComplication:v9 bottomComplication:v10 colorOption:v13];
      }
      else
      {
        v17 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[NTKPhotosFace upgradeContext]();
        }

        v14 = 0;
      }

      v16 = v8;
    }
    else
    {
      v16 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[NTKPhotosFace upgradeContext]();
      }
      v14 = 0;
      unint64_t v12 = v8;
    }

    v15 = v6;
    id v6 = v12;
  }
  else
  {
    v15 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NTKPhotosFace upgradeContext]();
    }
    v14 = 0;
  }

  return v14;
}

- (id)libraryDetailViewController
{
  v2 = [[NTKCFaceDetailViewController alloc] initWithLibraryFace:self];
  return v2;
}

- (id)addFaceDetailViewController
{
  uint64_t v3 = [NTKCFaceDetailViewController alloc];
  objc_super v4 = [(NTKFace *)self externalAssets];
  int v5 = [(NTKCFaceDetailViewController *)v3 initWithCandidateFace:self externalAssets:v4];

  return v5;
}

+ (BOOL)supportsExternalAssets
{
  return 1;
}

+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x1E4F29128];
  id v7 = a4;
  uint64_t v8 = (void *)[[v6 alloc] initWithUUIDString:@"F27862F8-5179-4DB0-9F89-179EA7CB4011"];
  char v9 = [v7 supportsCapability:v8];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F19A30] currentDevice];
    unint64_t v12 = +[NTKFace defaultFaceOfStyle:22 forDevice:v11];

    [v12 setExternalAssets:v5];
    v13 = [v12 device];
    v14 = +[NTKPhotosContentEditOption optionWithPhotosContent:1 forDevice:v13];

    [v12 selectOption:v14 forCustomEditMode:12 slot:0];
    if (v12) {
      v10 = [[NTKFaceBundleSortableGalleryFace alloc] initWithFace:v12 priority:200];
    }
    else {
      v10 = 0;
    }
  }
  return v10;
}

- (void)companionEditorWithAssets:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  uint64_t v8 = [v7 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [NTKCompanionCustomPhotosEditor alloc];
    v11 = [(NTKFace *)self device];
    v14 = [(NTKCompanionCustomPhotosEditor *)v10 initWithResourceDirectory:0 forDevice:v11];

    [(NTKCompanionTransientCustomPhotosEditor *)v14 addAssetsFromAssetList:v7];
  }
  else
  {
    unint64_t v12 = [NTKCompanionTransientCustomPhotosEditor alloc];
    v13 = [(NTKFace *)self device];
    v14 = [(NTKCompanionTransientCustomPhotosEditor *)v12 initWithResourceDirectory:0 forDevice:v13];

    [(NTKCompanionTransientCustomPhotosEditor *)v14 addImageList:v7];
  }

  v6[2](v6, v14);
}

- (id)_localizedStringForExternal:(id)a3 comment:(id)a4
{
  return NTKCompanionClockFaceLocalizedString(a3, a4);
}

- (void)upgradeContext
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1BC5A9000, v0, v1, "%s: bad photo content edit option: %@", v2, v3, v4, v5, 2u);
}

@end