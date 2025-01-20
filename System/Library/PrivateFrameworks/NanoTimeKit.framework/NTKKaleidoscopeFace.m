@interface NTKKaleidoscopeFace
+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5;
+ (BOOL)supportsExternalAssets;
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_sortableFaceOfStyle:(int64_t)a3 withAssets:(id)a4;
+ (id)sortableFaceWithAssets:(id)a3;
- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4;
- (BOOL)_sanitizeFaceConfiguration:(id *)a3;
- (BOOL)isUsingCustomAsset;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (Class)_optionClassForCustomEditMode:(int64_t)a3 resourceDirectoryExists:(BOOL)a4;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)_resourceDirectorySnapshotKey;
- (id)addFaceDetailViewController;
- (id)copyWithZone:(_NSZone *)a3;
- (id)editOptionThatHidesAllComplications;
- (id)libraryDetailViewController;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)_updateForResourceDirectoryChange:(id)a3;
- (void)companionEditorWithAssets:(id)a3 completion:(id)a4;
@end

@implementation NTKKaleidoscopeFace

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKKaleidoscopeFace;
  v4 = [(NTKFace *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_cachedResourceDirectorySnapshotKey copy];
  v6 = (void *)v4[20];
  v4[20] = v5;

  return v4;
}

+ (id)_complicationSlotDescriptors
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = NTKAllSmallComplicationTypes();
  v3 = NTKAllUtilityLargeComplicationTypes();
  v12[0] = @"top-left";
  v4 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA588);
  uint64_t v5 = NTKComplicationSlotDescriptor(4, v2, v4);
  v13[0] = v5;
  v12[1] = @"top-right";
  v6 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA5A0);
  v7 = NTKComplicationSlotDescriptor(4, v2, v6);
  v13[1] = v7;
  v12[2] = @"bottom-center";
  objc_super v8 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA5B8);
  v9 = NTKComplicationSlotDescriptor(3, v3, v8);
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (id)_orderedComplicationSlots
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top-left";
  v4[1] = @"top-right";
  v4[2] = @"bottom-center";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)_customEditModes
{
  return &unk_1F16EA5D0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 12)
  {
    v10 = [(NTKFace *)self device];
    uint64_t v11 = +[NTKKaleidoscopeAssetOption optionWithAsset:27 forDevice:v10];
LABEL_8:
    v12 = (void *)v11;

    goto LABEL_10;
  }
  if (a3 == 15)
  {
    v7 = [(NTKFace *)self device];
    uint64_t v8 = [v7 deviceCategory];

    if (v8 == 1) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 3;
    }
    v10 = [(NTKFace *)self device];
    uint64_t v11 = +[NTKKaleidoscopeStyleOption optionWithStyle:v9 forDevice:v10];
    goto LABEL_8;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5
{
  id v6 = a4;
  v7 = v6;
  BOOL v8 = a3 == 12 && [v6 asset] == 1000;

  return v8;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = -[NTKKaleidoscopeFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKFace *)self device];
  unint64_t v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  unint64_t v7 = [(NTKKaleidoscopeFace *)self _optionClassForCustomEditMode:a4];
  BOOL v8 = [(NTKFace *)self device];
  uint64_t v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  BOOL v8 = [(NTKKaleidoscopeFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v9 = [(NTKFace *)self device];
  unint64_t v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  return [(NTKKaleidoscopeFace *)self _optionClassForCustomEditMode:a3 resourceDirectoryExists:1];
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3 resourceDirectoryExists:(BOOL)a4
{
  if (a3 == 12)
  {
    id v4 = (id)objc_opt_class();
  }
  else if (a3 == 15)
  {
    objc_opt_class();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (id)_resourceDirectorySnapshotKey
{
  uint64_t v3 = [(NTKFace *)self resourceDirectory];
  if (!v3) {
    goto LABEL_8;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [(NTKFace *)self resourceDirectory];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
    if (!cachedResourceDirectorySnapshotKey)
    {
      uint64_t v9 = [(NTKFace *)self resourceDirectory];
      unint64_t v10 = +[NTKPhotosReader readerForResourceDirectory:v9];

      if ([v10 count])
      {
        uint64_t v11 = [v10 objectAtIndexedSubscript:0];
        NTKUniqueIDForNTKPhoto(v11);
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        v13 = self->_cachedResourceDirectorySnapshotKey;
        self->_cachedResourceDirectorySnapshotKey = v12;
      }
      cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
    }
    v14 = cachedResourceDirectorySnapshotKey;
  }
  else
  {
LABEL_8:
    v15 = self->_cachedResourceDirectorySnapshotKey;
    self->_cachedResourceDirectorySnapshotKey = 0;

    v14 = 0;
  }
  return v14;
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
  self->_cachedResourceDirectorySnapshotKey = 0;

  id v6 = [(NTKFace *)self resourceDirectory];
  int v7 = v6;
  if (a3)
  {

    if (v7) {
      return;
    }
  }
  else
  {
    if (!v6) {
      return;
    }
  }
  [(NTKFace *)self _notifyObserversOptionsDidChangeForEditMode:12];
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (a3 == 12)
  {
    id v6 = [@"EDIT_MODE_LABEL_KALEIDOSCOPE_IMAGE_CONTENT" stringByAppendingString:@"_COMPANION"];
    int v7 = v6;
    BOOL v8 = @"Photo";
    goto LABEL_5;
  }
  if (a3 == 15)
  {
    id v6 = [@"EDIT_MODE_LABEL_STYLE" stringByAppendingString:@"_COMPANION"];
    int v7 = v6;
    BOOL v8 = @"Style";
LABEL_5:
    uint64_t v9 = NTKCompanionClockFaceLocalizedString(v6, v8);

    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

- (id)editOptionThatHidesAllComplications
{
  v2 = [(NTKFace *)self device];
  uint64_t v3 = +[NTKKaleidoscopeStyleOption optionWithStyle:3 forDevice:v2];

  return v3;
}

- (BOOL)isUsingCustomAsset
{
  v2 = [(NTKFace *)self resourceDirectory];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = objc_opt_new();
  v15 = v7;
  BOOL v8 = objc_opt_new();
  v16 = v8;
  uint64_t v9 = objc_opt_new();
  v17 = v9;
  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:3];

  uint64_t v11 = [NTKResourceDirectoryScrubber alloc];
  v12 = -[NTKResourceDirectoryScrubber initWithOperations:](v11, "initWithOperations:", v10, v15, v16);
  v13 = [(NTKFace *)self resourceDirectory];
  LOBYTE(a4) = [(NTKResourceDirectoryScrubber *)v12 scrubDirectoryAtPath:v13 toDestinationPath:v6 error:a4];

  return (char)a4;
}

- (BOOL)_sanitizeFaceConfiguration:(id *)a3
{
  id v5 = [(NTKFace *)self resourceDirectory];
  id v6 = +[NTKBasePhotoResourcesManifest manifestForResourceDirectory:v5];

  if (!v6)
  {
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.resourceDirectory" code:2003 userInfo:0];
      BOOL v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  if (![v6 validateManifestWithError:a3]) {
    goto LABEL_9;
  }
  int v7 = [(NTKFace *)self resourceDirectory];
  BOOL v8 = +[NTKPhotosReader readerForResourceDirectory:v7];

  uint64_t v9 = [v8 count];
  unint64_t v10 = [v6 imageList];
  uint64_t v11 = [v10 count];
  BOOL v12 = v9 == v11;

  if (a3 && v9 != v11)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.resourceDirectory" code:2003 userInfo:0];
  }

LABEL_10:
  return v12;
}

- (void).cxx_destruct
{
}

- (id)libraryDetailViewController
{
  v2 = [[NTKCFaceDetailViewController alloc] initWithLibraryFace:self];
  return v2;
}

- (id)addFaceDetailViewController
{
  BOOL v3 = [NTKCFaceDetailViewController alloc];
  id v4 = [(NTKFace *)self externalAssets];
  id v5 = [(NTKCFaceDetailViewController *)v3 initWithCandidateFace:self externalAssets:v4];

  return v5;
}

+ (BOOL)supportsExternalAssets
{
  char v2 = [a1 isSubclassOfClass:objc_opt_class()];
  BOOL v3 = [MEMORY[0x1E4F19A30] currentDevice];
  char v4 = NTKShowBlueRidgeUI(v3);

  return v2 ^ v4 ^ 1;
}

+ (id)_sortableFaceOfStyle:(int64_t)a3 withAssets:(id)a4
{
  id v5 = a4;
  if ([v5 count] == 1)
  {
    id v6 = [MEMORY[0x1E4F19A30] currentDevice];
    int v7 = +[NTKFace defaultFaceOfStyle:a3 forDevice:v6];

    [v7 setExternalAssets:v5];
    BOOL v8 = [v7 device];
    uint64_t v9 = +[NTKKaleidoscopeAssetOption optionWithAsset:1000 forDevice:v8];

    [v7 selectOption:v9 forCustomEditMode:12 slot:0];
    if (v7) {
      unint64_t v10 = [[NTKFaceBundleSortableGalleryFace alloc] initWithFace:v7 priority:100];
    }
    else {
      unint64_t v10 = 0;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

+ (id)sortableFaceWithAssets:(id)a3
{
  return (id)[a1 _sortableFaceOfStyle:23 withAssets:a3];
}

- (void)companionEditorWithAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__49;
  v21 = __Block_byref_object_dispose__49;
  unint64_t v10 = [NTKCompanionKaleidoscopeEditor alloc];
  uint64_t v11 = [(NTKFace *)self device];
  v22 = [(NTKCompanionKaleidoscopeEditor *)v10 initWithResourceDirectory:0 forDevice:v11];

  BOOL v12 = [v6 firstObject];
  v13 = (void *)v18[5];
  if (isKindOfClass)
  {
    v14 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__NTKKaleidoscopeFace_ExternalAssets__companionEditorWithAssets_completion___block_invoke;
    v16[3] = &unk_1E62C3280;
    v16[4] = v7;
    v16[5] = &v17;
    [v13 setAsset:v12 completion:v16];
  }
  else
  {
    v14 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__NTKKaleidoscopeFace_ExternalAssets__companionEditorWithAssets_completion___block_invoke_2;
    v15[3] = &unk_1E62C3280;
    v15[4] = v7;
    v15[5] = &v17;
    [v13 setRawImage:v12 completion:v15];
  }

  _Block_object_dispose(&v17, 8);
}

void __76__NTKKaleidoscopeFace_ExternalAssets__companionEditorWithAssets_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __76__NTKKaleidoscopeFace_ExternalAssets__companionEditorWithAssets_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end