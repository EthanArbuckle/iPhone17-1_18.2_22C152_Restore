@interface NTKBasePhotosFace
+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
- (BOOL)_allowsEditing;
- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4;
- (BOOL)_sanitizeFaceConfiguration:(id *)a3;
- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_resourceDirectorySnapshotKey;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_migrateLegibility;
- (void)_updateForResourceDirectoryChange:(id)a3;
@end

@implementation NTKBasePhotosFace

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKBasePhotosFace;
  v4 = [(NTKFace *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_cachedResourceDirectorySnapshotKey copy];
  v6 = (void *)v4[20];
  v4[20] = v5;

  return v4;
}

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 14;
}

+ (id)_complicationSlotDescriptors
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = NTKAllUtilitySmallFlatComplicationTypes();
  v3 = NTKAllUtilityLargeNarrowComplicationTypes();
  v10[0] = @"top";
  v4 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA0A8);
  uint64_t v5 = NTKComplicationSlotDescriptor(6, v2, v4);
  v11[0] = v5;
  v10[1] = @"bottom";
  v6 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA0C0);
  v7 = NTKComplicationSlotDescriptor(104, v3, v6);
  v11[1] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return @"top";
}

+ (id)_orderedComplicationSlots
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top";
  v4[1] = @"bottom";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"top"])
  {
    v4 = @"ABOVE_TIME";
  }
  else
  {
    int v5 = [v3 isEqualToString:@"bottom"];
    v4 = @"BELOW_TIME";
    if (!v5) {
      v4 = 0;
    }
  }
  v6 = [NSString stringWithFormat:@"SLOT_LABEL_%@", v4];
  v7 = NTKClockFaceLocalizedString(v6, @"slot name");

  return v7;
}

- (BOOL)_allowsEditing
{
  return 1;
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
  self->_cachedResourceDirectorySnapshotKey = 0;
}

- (id)_resourceDirectorySnapshotKey
{
  uint64_t v3 = [(NTKFace *)self resourceDirectory];
  if (!v3) {
    goto LABEL_5;
  }
  v4 = (void *)v3;
  int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [(NTKFace *)self resourceDirectory];
  int v7 = [v5 fileExistsAtPath:v6];

  if (!v7)
  {
LABEL_5:
    cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
    self->_cachedResourceDirectorySnapshotKey = 0;

LABEL_6:
    v11 = [MEMORY[0x1E4F19A30] currentDevice];
    int v12 = [v11 isTinker];

    if (v12) {
      v9 = @"T";
    }
    else {
      v9 = 0;
    }
    goto LABEL_9;
  }
  objc_super v8 = self->_cachedResourceDirectorySnapshotKey;
  if (v8)
  {
    v9 = v8;
    goto LABEL_9;
  }
  v14 = [(NTKFace *)self resourceDirectory];
  v15 = +[NTKPhotosReader readerForResourceDirectory:v14];

  if ([v15 count])
  {
    v16 = [v15 objectAtIndexedSubscript:0];
    NTKUniqueIDForNTKPhoto(v16);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = self->_cachedResourceDirectorySnapshotKey;
    self->_cachedResourceDirectorySnapshotKey = v17;
  }
  v9 = self->_cachedResourceDirectorySnapshotKey;
  if (!v9) {
    goto LABEL_6;
  }
LABEL_9:

  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 14)
  {
    int v5 = NTKCompanionClockFaceLocalizedString(@"EDIT_MODE_LABEL_PHOTO_POSITION_COMPANION", @"Time Position");
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = objc_opt_new();
  v15 = v7;
  objc_super v8 = objc_opt_new();
  v16 = v8;
  v9 = objc_opt_new();
  v17 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:3];

  v11 = [NTKResourceDirectoryScrubber alloc];
  int v12 = -[NTKResourceDirectoryScrubber initWithOperations:](v11, "initWithOperations:", v10, v15, v16);
  v13 = [(NTKFace *)self resourceDirectory];
  LOBYTE(a4) = [(NTKResourceDirectoryScrubber *)v12 scrubDirectoryAtPath:v13 toDestinationPath:v6 error:a4];

  return (char)a4;
}

- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace
{
  return 1;
}

- (BOOL)_sanitizeFaceConfiguration:(id *)a3
{
  int v5 = [(NTKFace *)self selectedOptionsForCustomEditModes];
  id v6 = [v5 objectForKeyedSubscript:&unk_1F16E1E78];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    objc_super v8 = v7;
    if (!v7 || [v7 photosContent] != 1)
    {
      if (a3)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.photos" code:1005 userInfo:0];
        BOOL v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v16 = 0;
      }
      goto LABEL_20;
    }
    v9 = [(NTKFace *)self resourceDirectory];
    v10 = +[NTKBasePhotoResourcesManifest manifestForResourceDirectory:v9];

    if (v10)
    {
      if ([v10 validateManifestWithError:a3])
      {
        v11 = [(NTKFace *)self resourceDirectory];
        int v12 = +[NTKPhotosReader readerForResourceDirectory:v11];

        uint64_t v13 = [v12 count];
        v14 = [v10 imageList];
        uint64_t v15 = [v14 count];

        BOOL v16 = v13 == v15;
        if (v16)
        {
          [(NTKBasePhotosFace *)self _migrateLegibility];
        }
        else if (a3)
        {
          *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.photos" code:1006 userInfo:0];
        }

        goto LABEL_19;
      }
    }
    else if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.photos" code:1006 userInfo:0];
      BOOL v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    BOOL v16 = 0;
    goto LABEL_19;
  }
  BOOL v16 = 0;
LABEL_21:

  return v16;
}

- (void)_migrateLegibility
{
  uint64_t v3 = [(NTKFace *)self resourceDirectory];

  if (v3)
  {
    uint64_t v4 = [(NTKFace *)self resourceDirectory];
    id v6 = +[NTKPhotosReader readerForResourceDirectory:v4];

    if (NTKPhotosUpdateLegibility(v6))
    {
      int v5 = NTKCloneResourceDirectoryForReader(v6);
      [(NTKFace *)self setResourceDirectoryByTransferringOwnership:v5];
    }
  }
}

- (void).cxx_destruct
{
}

@end