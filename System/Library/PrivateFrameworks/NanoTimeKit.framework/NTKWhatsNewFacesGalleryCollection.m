@interface NTKWhatsNewFacesGalleryCollection
+ (id)_gloryBDefaultFacesForDevice:(id)a3;
+ (id)_gloryEDefaultFacesForDevice:(id)a3;
+ (id)_gloryFDefaultFacesForDevice:(id)a3;
+ (id)_graceDefaultFacesForDevice:(id)a3;
+ (id)_legacyDefaultFacesForDevice:(id)a3;
+ (id)_pride2020DefaultFacesForDevice:(id)a3;
+ (id)_spring2020DefaultFacesForDevice:(id)a3;
+ (id)whistlerSubdialsSpring2020ComplicationTypesBySlot;
- (BOOL)hasNewFaces;
- (NTKWhatsNewFacesGalleryCollection)initWithDevice:(id)a3;
- (id)facesForDevice:(id)a3;
- (id)title;
@end

@implementation NTKWhatsNewFacesGalleryCollection

- (NTKWhatsNewFacesGalleryCollection)initWithDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKWhatsNewFacesGalleryCollection;
  v3 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)&v6 initWithDevice:a3];
  v4 = v3;
  if (v3) {
    [(NTKGalleryCollection *)v3 setCalloutName:&__block_literal_global_68];
  }
  return v4;
}

uint64_t __52__NTKWhatsNewFacesGalleryCollection_initWithDevice___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _faceGalleryCalloutName];
}

- (id)title
{
  return NTKCompanionClockFaceLocalizedString(@"NTK_FACE_GALLERY_TITLE_NEW_FACES_COMPANION", @"New Watch faces");
}

- (BOOL)hasNewFaces
{
  v3 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)self device];
  v4 = [(NTKWhatsNewFacesGalleryCollection *)self facesForDevice:v3];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (id)facesForDevice:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D5DDA3E7-8863-48E3-95C7-3C65C5E31718"];
  int v5 = [v3 supportsCapability:v4];

  if (!v5)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
    int v18 = [v3 supportsCapability:v17];

    if (v18)
    {
      uint64_t v19 = [(id)objc_opt_class() _pride2020DefaultFacesForDevice:v3];
    }
    else
    {
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
      int v21 = [v3 supportsCapability:v20];

      if (v21)
      {
        uint64_t v19 = [(id)objc_opt_class() _spring2020DefaultFacesForDevice:v3];
      }
      else if ([v3 isRunningGraceOrLater])
      {
        uint64_t v19 = [(id)objc_opt_class() _graceDefaultFacesForDevice:v3];
      }
      else
      {
        if (![v3 isRunningGloryFOrLater])
        {
          v23 = [v3 nrDevice];
          if (v23 && [MEMORY[0x1E4F19A30] NRProductVersionForNRDevice:v23] <= 0x501FF)
          {
            unsigned int v25 = [MEMORY[0x1E4F19A30] NRProductVersionForNRDevice:v23];
            v26 = objc_opt_class();
            if (v25 <= 0x500FF) {
              [v26 _legacyDefaultFacesForDevice:v3];
            }
            else {
            uint64_t v24 = [v26 _gloryBDefaultFacesForDevice:v3];
            }
          }
          else
          {
            uint64_t v24 = [(id)objc_opt_class() _gloryEDefaultFacesForDevice:v3];
          }
          v16 = (void *)v24;

          goto LABEL_21;
        }
        uint64_t v19 = [(id)objc_opt_class() _gloryFDefaultFacesForDevice:v3];
      }
    }
    v16 = (void *)v19;
    goto LABEL_21;
  }
  objc_super v6 = +[NTKFaceBundleManager sharedManager];
  v7 = [MEMORY[0x1E4F1CA48] array];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__NTKWhatsNewFacesGalleryCollection_facesForDevice___block_invoke;
  v31[3] = &unk_1E62C0F40;
  id v32 = v3;
  id v8 = v7;
  id v33 = v8;
  [v6 enumerateFaceBundlesOnDevice:v32 includingLegacy:1 withBlock:v31];
  [v8 sortUsingSelector:sel_compare_];
  v9 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "face", (void)v27);
        if (v15) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v12);
  }

  v16 = (void *)[v9 copy];
LABEL_21:

  return v16;
}

void __52__NTKWhatsNewFacesGalleryCollection_facesForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 heroFacesForDevice:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObjectsFromArray:v3];
}

+ (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if ([v3 deviceCategory] != 1)
  {
    if ([v3 collectionType] == 5)
    {
      int v5 = +[NTKFaceBundleManager sharedManager];
      objc_super v6 = [v5 faceBundleForFaceStyle:14 onDevice:v3];

      v7 = [v6 heroLegacyDefaultFacesForDevice:v3];
      if (v7) {
        [v4 addObjectsFromArray:v7];
      }
    }
    if (NTKShowVictoryFaces(v3))
    {
      id v8 = +[NTKFaceBundleManager sharedManager];
      v9 = [v8 faceBundleForFaceStyle:19 onDevice:v3];

      if (v9)
      {
        id v10 = [v9 heroLegacyDefaultFacesForDevice:v3];
        if ([v10 count]) {
          [v4 addObjectsFromArray:v10];
        }
      }
    }
    uint64_t v11 = +[NTKFaceBundleManager sharedManager];
    uint64_t v12 = [v11 faceBundleForFaceStyle:30 onDevice:v3];

    if (v12)
    {
      uint64_t v13 = [v12 heroLegacyDefaultFacesForDevice:v3];
      if ([v13 count]) {
        [v4 addObjectsFromArray:v13];
      }
    }
    v14 = +[NTKFaceBundleManager sharedManager];
    v15 = [v14 faceBundleForFaceStyle:29 onDevice:v3];

    if (v12)
    {
      v16 = [v15 heroLegacyDefaultFacesForDevice:v3];
      if ([v16 count]) {
        [v4 addObjectsFromArray:v16];
      }
    }
    v17 = +[NTKFace defaultFaceOfStyle:23 forDevice:v3];
    int v18 = +[NTKKaleidoscopeStyleOption optionWithStyle:3 forDevice:v3];
    [v17 selectOption:v18 forCustomEditMode:15 slot:0];

    uint64_t v19 = +[NTKKaleidoscopeAssetOption optionWithAsset:13 forDevice:v3];
    [v17 selectOption:v19 forCustomEditMode:12 slot:0];

    v20 = +[NTKCKaleidoscopeFacesGalleryCollection complicationTypesBySlot];
    [v17 _setFaceGalleryComplicationTypesForSlots:v20];

    [v4 addObject:v17];
  }
  int v21 = +[NTKFaceBundleManager sharedManager];
  v22 = [v21 faceBundleForFaceStyle:27 onDevice:v3];

  if (v22)
  {
    v23 = [v22 heroLegacyDefaultFacesForDevice:v3];
    if ([v23 count]) {
      [v4 addObjectsFromArray:v23];
    }
  }
  uint64_t v24 = +[NTKFaceBundleManager sharedManager];
  unsigned int v25 = [v24 faceBundleForFaceStyle:32 onDevice:v3];

  if (v25)
  {
    v26 = [v25 heroLegacyDefaultFacesForDevice:v3];
    if ([v26 count]) {
      [v4 addObjectsFromArray:v26];
    }
  }
  long long v27 = +[NTKFaceBundleManager sharedManager];
  long long v28 = [v27 faceBundleForFaceStyle:31 onDevice:v3];

  if (v28)
  {
    long long v29 = [v28 heroLegacyDefaultFacesForDevice:v3];
    if ([v29 count]) {
      [v4 addObjectsFromArray:v29];
    }
  }
  long long v30 = +[NTKFaceBundleManager sharedManager];
  v31 = [v30 faceBundleForFaceStyle:28 onDevice:v3];

  if (v31)
  {
    id v32 = [v31 heroLegacyDefaultFacesForDevice:v3];
    if ([v32 count]) {
      [v4 addObjectsFromArray:v32];
    }
  }
  return v4;
}

+ (id)_gloryBDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  objc_super v6 = [a1 _legacyDefaultFacesForDevice:v4];
  [v5 addObjectsFromArray:v6];

  v7 = +[NTKFaceBundleManager sharedManager];
  id v8 = [v7 faceBundleForFaceStyle:3 onDevice:v4];

  if (v8)
  {
    v9 = [v8 heroGloryBDefaultFacesForDevice:v4];
    if (v9) {
      [v5 addObjectsFromArray:v9];
    }
  }
  return v5;
}

+ (id)_gloryEDefaultFacesForDevice:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_opt_new();
  objc_super v6 = [a1 _gloryBDefaultFacesForDevice:v4];
  [v5 addObjectsFromArray:v6];

  v7 = +[NTKFaceBundleManager sharedManager];
  id v8 = [v7 faceBundleForFaceStyle:14 onDevice:v4];

  v9 = [v8 heroGloryEDefaultFacesForDevice:v4];
  id v10 = (void *)[v9 mutableCopy];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = objc_msgSend(v5, "copy", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v16 faceStyle] == 14)
        {
          uint64_t v17 = [v5 indexOfObject:v16];
          int v18 = [v10 objectAtIndexedSubscript:0];
          [v5 replaceObjectAtIndex:v17 withObject:v18];

          [v10 removeObjectAtIndex:0];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v5;
}

+ (id)_gloryFDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  objc_super v6 = [a1 _gloryEDefaultFacesForDevice:v4];
  [v5 addObjectsFromArray:v6];

  v7 = +[NTKFaceBundleManager sharedManager];
  id v8 = [v7 faceBundleForFaceStyle:26 onDevice:v4];

  v9 = [v8 heroGloryFDefaultFacesForDevice:v4];
  if (v9) {
    [v5 addObjectsFromArray:v9];
  }
  id v10 = +[NTKFaceBundleManager sharedManager];
  uint64_t v11 = [v10 faceBundleForFaceStyle:33 onDevice:v4];

  uint64_t v12 = [v11 heroGloryFDefaultFacesForDevice:v4];
  if (v12) {
    [v5 addObjectsFromArray:v12];
  }

  return v5;
}

+ (id)_graceDefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 deviceCategory];
  objc_super v6 = +[NTKFaceBundleManager sharedManager];
  v7 = v6;
  if (v5 == 1)
  {
    id v8 = [v6 faceBundleForFaceStyle:37 onDevice:v3];

    v9 = [v8 heroGraceDefaultFacesForDevice:v3];
    if (v9) {
      [v4 addObjectsFromArray:v9];
    }
    id v10 = +[NTKFaceBundleManager sharedManager];
    uint64_t v11 = [v10 faceBundleForFaceStyle:38 onDevice:v3];

    uint64_t v12 = [v11 heroGraceDefaultFacesForDevice:v3];
    if (v12) {
      [v4 addObjectsFromArray:v12];
    }
  }
  else
  {
    uint64_t v13 = [v6 faceBundleForFaceStyle:42 onDevice:v3];

    uint64_t v14 = [v13 heroGraceDefaultFacesForDevice:v3];
    if (v14) {
      [v4 addObjectsFromArray:v14];
    }
    v42 = v13;
    v15 = +[NTKFaceBundleManager sharedManager];
    v16 = [v15 faceBundleForFaceStyle:14 onDevice:v3];

    uint64_t v12 = [v16 heroGraceDefaultFacesForDevice:v3];
    if (v12) {
      [v4 addObjectsFromArray:v12];
    }
    if ([v3 collectionType] == 6)
    {
      uint64_t v17 = +[NTKFaceBundleManager sharedManager];
      int v18 = [v17 faceBundleForFaceStyle:35 onDevice:v3];

      uint64_t v19 = [v18 heroGraceDefaultFacesForDevice:v3];
      if (v19) {
        [v4 addObjectsFromArray:v19];
      }
    }
    v40 = v16;
    v41 = (void *)v14;
    v39 = +[NTKFace defaultFaceOfStyle:40 forDevice:v3];
    objc_msgSend(v4, "addObject:");
    long long v20 = +[NTKFaceBundleManager sharedManager];
    long long v21 = [v20 faceBundleForFaceStyle:39 onDevice:v3];

    v38 = v21;
    v37 = [v21 heroGraceDefaultFacesForDevice:v3];
    objc_msgSend(v4, "addObjectsFromArray:");
    v36 = +[NTKFace defaultFaceOfStyle:34 forDevice:v3];
    objc_msgSend(v4, "addObject:");
    uint64_t v35 = +[NTKFaceBundleManager sharedManager];
    v34 = [v35 faceBundleForFaceStyle:36 onDevice:v3];
    id v33 = [v34 heroGraceDefaultFacesForDevice:v3];
    objc_msgSend(v4, "addObjectsFromArray:");
    long long v22 = +[NTKFaceBundleManager sharedManager];
    long long v23 = [v22 faceBundleForFaceStyle:41 onDevice:v3];

    uint64_t v24 = [v23 heroGraceDefaultFacesForDevice:v3];
    if (v24) {
      [v4 addObjectsFromArray:v24];
    }
    uint64_t v25 = +[NTKFaceBundleManager sharedManager];
    v26 = [v25 faceBundleForFaceStyle:37 onDevice:v3];

    long long v27 = [v26 heroGraceDefaultFacesForDevice:v3];
    if (v27) {
      [v4 addObjectsFromArray:v27];
    }
    long long v28 = +[NTKFaceBundleManager sharedManager];
    long long v29 = [v28 faceBundleForFaceStyle:38 onDevice:v3];

    long long v30 = [v29 heroGraceDefaultFacesForDevice:v3];
    if (v30) {
      [v4 addObjectsFromArray:v30];
    }
    v31 = +[NTKFace defaultFaceOfStyle:38 forDevice:v3];
    [v4 addObject:v31];

    v9 = v41;
    id v8 = v42;
    uint64_t v11 = v40;
  }

  return v4;
}

+ (id)whistlerSubdialsSpring2020ComplicationTypesBySlot
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top";
  v4[1] = @"center";
  v5[0] = &unk_1F16E9C28;
  v5[1] = &unk_1F16E9C40;
  v4[2] = @"bottom";
  v5[2] = &unk_1F16E9C58;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (id)_spring2020DefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if ([v3 deviceCategory] != 1)
  {
    if ([v3 collectionType] == 5)
    {
      uint64_t v5 = +[NTKFaceBundleManager sharedManager];
      objc_super v6 = [v5 faceBundleForFaceStyle:14 onDevice:v3];

      v7 = [v6 heroSpring2020DefaultFacesForDevice:v3];
      if (v7) {
        [v4 addObjectsFromArray:v7];
      }
    }
    if ([v3 collectionType] == 6)
    {
      id v8 = +[NTKFaceBundleManager sharedManager];
      v9 = [v8 faceBundleForFaceStyle:35 onDevice:v3];

      id v10 = [v9 heroSpring2020DefaultFacesForDevice:v3];
      if (v10) {
        [v4 addObjectsFromArray:v10];
      }
    }
    uint64_t v11 = +[NTKFace defaultFaceOfStyle:40 forDevice:v3];
    uint64_t v12 = +[NTKCBlackcombFacesGalleryCollection complicationTypesBySlot];
    [v11 _setFaceGalleryComplicationTypesForSlots:v12];

    [v4 addObject:v11];
    uint64_t v13 = +[NTKFaceBundleManager sharedManager];
    uint64_t v14 = [v13 faceBundleForFaceStyle:39 onDevice:v3];

    v31 = v14;
    v15 = [v14 heroSpring2020DefaultFacesForDevice:v3];
    [v4 addObjectsFromArray:v15];
    v16 = +[NTKFace defaultFaceOfStyle:34 forDevice:v3];
    uint64_t v17 = +[NTKWhatsNewFacesGalleryCollection whistlerSubdialsSpring2020ComplicationTypesBySlot];
    [v16 _setFaceGalleryComplicationTypesForSlots:v17];

    [v4 addObject:v16];
    int v18 = +[NTKFaceBundleManager sharedManager];
    uint64_t v19 = [v18 faceBundleForFaceStyle:36 onDevice:v3];
    long long v20 = [v19 heroGraceDefaultFacesForDevice:v3];
    [v4 addObjectsFromArray:v20];
    long long v21 = +[NTKFaceBundleManager sharedManager];
    long long v22 = [v21 faceBundleForFaceStyle:41 onDevice:v3];

    long long v23 = [v22 heroSpring2020DefaultFacesForDevice:v3];
    if (v23) {
      [v4 addObjectsFromArray:v23];
    }
  }
  uint64_t v24 = +[NTKFaceBundleManager sharedManager];
  uint64_t v25 = [v24 faceBundleForFaceStyle:37 onDevice:v3];

  v26 = [v25 heroSpring2020DefaultFacesForDevice:v3];
  if (v26) {
    [v4 addObjectsFromArray:v26];
  }
  long long v27 = +[NTKFaceBundleManager sharedManager];
  long long v28 = [v27 faceBundleForFaceStyle:38 onDevice:v3];

  long long v29 = [v28 heroSpring2020DefaultFacesForDevice:v3];
  if (v29) {
    [v4 addObjectsFromArray:v29];
  }

  return v4;
}

+ (id)_pride2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  objc_super v6 = +[NTKFaceBundleManager sharedManager];
  v7 = [v6 faceBundleForFaceStyle:26 onDevice:v4];

  id v8 = [v7 heroPride2020DefaultFacesForDevice:v4];
  if (v8) {
    [v5 addObjectsFromArray:v8];
  }
  v9 = +[NTKFaceBundleManager sharedManager];
  id v10 = [v9 faceBundleForFaceStyle:33 onDevice:v4];

  uint64_t v11 = [v10 heroPride2020DefaultFacesForDevice:v4];
  if (v11) {
    [v5 addObjectsFromArray:v11];
  }
  uint64_t v12 = [a1 _spring2020DefaultFacesForDevice:v4];
  [v5 addObjectsFromArray:v12];

  return v5;
}

@end