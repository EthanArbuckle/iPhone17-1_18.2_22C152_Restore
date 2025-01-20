@interface PLPhotoEffect
+ (BOOL)isEffectNoneForIdentifier:(id)a3;
+ (BOOL)isEffectWithIdentifier:(id)a3 equalToEffectWithIdentifier:(id)a4;
+ (id)_effectWithIdentifier:(id)a3 CIFilterName:(id)a4 displayName:(id)a5;
+ (id)_legacyEffectWithIdentifier:(id)a3 CIFilterName:(id)a4;
+ (id)_lightingEffectWithIdentifier:(id)a3 relatedVersionIdentifier:(id)a4 CIFilterName:(id)a5 lightingVersion:(int64_t)a6;
+ (id)allEffects;
+ (id)allSupportedEffects;
+ (id)effectWithCIFilterName:(id)a3;
+ (id)effectWithIdentifier:(id)a3;
+ (id)equivalentEffectForIdentifier:(id)a3 version:(int64_t)a4;
+ (id)standardSupportedEffects;
+ (unint64_t)_indexOfEffectWithIdentifier:(id)a3;
- (BOOL)isLegacy;
- (BOOL)isPortrait;
- (NSString)CIFilterName;
- (NSString)displayName;
- (NSString)filterIdentifier;
- (NSString)relatedVersionIdentifier;
- (id)description;
- (id)newEffectFilter;
- (int64_t)latestVersion;
- (int64_t)lightingVersion;
@end

@implementation PLPhotoEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CIFilterName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_relatedVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_filterIdentifier, 0);
}

- (BOOL)isLegacy
{
  return self->_isLegacy;
}

- (BOOL)isPortrait
{
  return self->_isPortrait;
}

- (int64_t)lightingVersion
{
  return self->_lightingVersion;
}

- (NSString)CIFilterName
{
  return self->_CIFilterName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)relatedVersionIdentifier
{
  return self->_relatedVersionIdentifier;
}

- (NSString)filterIdentifier
{
  return self->_filterIdentifier;
}

- (id)newEffectFilter
{
  v3 = [(PLPhotoEffect *)self CIFilterName];

  if (!v3) {
    return 0;
  }
  v4 = (void *)MEMORY[0x1E4F1E040];
  v5 = [(PLPhotoEffect *)self CIFilterName];
  v6 = [v4 filterWithName:v5];

  return v6;
}

- (int64_t)latestVersion
{
  id v2 = [(PLPhotoEffect *)self newEffectFilter];
  v3 = [v2 valueForKey:*MEMORY[0x1E4F1E510]];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PLPhotoEffect;
  v3 = [(PLPhotoEffect *)&v8 description];
  int64_t v4 = NSString;
  v5 = [(PLPhotoEffect *)self displayName];
  v6 = [v4 stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

+ (id)equivalentEffectForIdentifier:(id)a3 version:(int64_t)a4
{
  v6 = [a1 effectWithIdentifier:a3];
  v7 = [v6 relatedVersionIdentifier];
  if ([v6 lightingVersion] == a4)
  {
    id v8 = v6;
  }
  else if (v7)
  {
    v9 = [a1 effectWithIdentifier:v7];
    if ([v9 lightingVersion] == a4) {
      id v8 = v9;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v10 = v8;

  return v10;
}

+ (id)effectWithCIFilterName:(id)a3
{
  id v4 = a3;
  v5 = [a1 allEffects];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__PLPhotoEffect_effectWithCIFilterName___block_invoke;
  v11[3] = &unk_1E5872F70;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v11];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = +[PLPhotoEffect effectWithIdentifier:@"PUPhotoEffectNone"];
  }
  else
  {
    v9 = [a1 allEffects];
    id v8 = [v9 objectAtIndex:v7];
  }
  return v8;
}

uint64_t __40__PLPhotoEffect_effectWithCIFilterName___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 CIFilterName];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  *a4 = v7;

  return v7;
}

+ (id)effectWithIdentifier:(id)a3
{
  uint64_t v4 = [a1 _indexOfEffectWithIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = [a1 allEffects];
    v5 = [v7 objectAtIndex:v6];
  }
  return v5;
}

+ (unint64_t)_indexOfEffectWithIdentifier:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"PUPhotoEffectNone";
  }
  uint64_t v6 = [a1 allEffects];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__PLPhotoEffect__indexOfEffectWithIdentifier___block_invoke;
  v10[3] = &unk_1E5872F48;
  v11 = v5;
  uint64_t v7 = v5;
  unint64_t v8 = [v6 indexOfObjectPassingTest:v10];

  return v8;
}

uint64_t __46__PLPhotoEffect__indexOfEffectWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 filterIdentifier];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  *a4 = v7;

  return v7;
}

+ (BOOL)isEffectWithIdentifier:(id)a3 equalToEffectWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [a1 isEffectNoneForIdentifier:v6];
  char v9 = [a1 isEffectNoneForIdentifier:v7];
  if (v6) {
    char v10 = [v6 isEqualToString:v7];
  }
  else {
    char v10 = 0;
  }
  char v11 = v10 | v8 & v9;

  return v11;
}

+ (BOOL)isEffectNoneForIdentifier:(id)a3
{
  BOOL result = [a3 isEqualToString:@"PUPhotoEffectNone"];
  if (!a3) {
    return 1;
  }
  return result;
}

+ (id)allSupportedEffects
{
  pl_dispatch_once();
  id v2 = (void *)allSupportedEffects_supportedEffects;
  return v2;
}

void __36__PLPhotoEffect_allSupportedEffects__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = +[PLPhotoEffect allEffects];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isLegacy", (void)v9) & 1) == 0) {
          [v1 addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  char v8 = (void *)allSupportedEffects_supportedEffects;
  allSupportedEffects_supportedEffects = (uint64_t)v1;
}

+ (id)standardSupportedEffects
{
  pl_dispatch_once();
  id v2 = (void *)standardSupportedEffects_standardEffects;
  return v2;
}

void __41__PLPhotoEffect_standardSupportedEffects__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = +[PLPhotoEffect allEffects];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isPortrait", (void)v9) & 1) == 0 && (objc_msgSend(v7, "isLegacy") & 1) == 0) {
          [v1 addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  char v8 = (void *)standardSupportedEffects_standardEffects;
  standardSupportedEffects_standardEffects = (uint64_t)v1;
}

+ (id)allEffects
{
  pl_dispatch_once();
  id v2 = (void *)allEffects_allPhotoEffects;
  return v2;
}

void __27__PLPhotoEffect_allEffects__block_invoke()
{
  v39[27] = *MEMORY[0x1E4F143B8];
  v38 = +[PLPhotoEffect _lightingEffectWithIdentifier:@"StageWhite" relatedVersionIdentifier:0 CIFilterName:@"CIPortraitEffectStageWhite" lightingVersion:2];
  v39[0] = v38;
  v37 = +[PLPhotoEffect _lightingEffectWithIdentifier:@"StageMonoV2" relatedVersionIdentifier:@"BlackoutMono" CIFilterName:@"CIPortraitEffectStageMonoV2" lightingVersion:2];
  v39[1] = v37;
  v36 = +[PLPhotoEffect _lightingEffectWithIdentifier:@"StageV2" relatedVersionIdentifier:@"Black" CIFilterName:@"CIPortraitEffectStageV2" lightingVersion:2];
  v39[2] = v36;
  v35 = +[PLPhotoEffect _lightingEffectWithIdentifier:@"ContourV2" relatedVersionIdentifier:@"Contour" CIFilterName:@"CIPortraitEffectContourV2" lightingVersion:2];
  v39[3] = v35;
  v34 = +[PLPhotoEffect _lightingEffectWithIdentifier:@"StudioV2" relatedVersionIdentifier:@"Commercial" CIFilterName:@"CIPortraitEffectStudioV2" lightingVersion:2];
  v39[4] = v34;
  v33 = +[PLPhotoEffect _lightingEffectWithIdentifier:@"BlackoutMono" relatedVersionIdentifier:@"StageMonoV2" CIFilterName:@"CIPortraitEffectStageMono" lightingVersion:1];
  v39[5] = v33;
  v32 = +[PLPhotoEffect _lightingEffectWithIdentifier:@"Black" relatedVersionIdentifier:@"StageV2" CIFilterName:@"CIPortraitEffectStage" lightingVersion:1];
  v39[6] = v32;
  v31 = +[PLPhotoEffect _lightingEffectWithIdentifier:@"Contour" relatedVersionIdentifier:@"ContourV2" CIFilterName:@"CIPortraitEffectContour" lightingVersion:1];
  v39[7] = v31;
  v30 = +[PLPhotoEffect _lightingEffectWithIdentifier:@"Commercial" relatedVersionIdentifier:@"StudioV2" CIFilterName:@"CIPortraitEffectStudio" lightingVersion:1];
  v39[8] = v30;
  v29 = +[PLPhotoEffect _lightingEffectWithIdentifier:@"Light" relatedVersionIdentifier:0 CIFilterName:@"CIPortraitEffectLight" lightingVersion:1];
  v39[9] = v29;
  v28 = PLServicesLocalizedFrameworkString();
  v27 = +[PLPhotoEffect _effectWithIdentifier:@"PUPhotoEffectNone" CIFilterName:0 displayName:v28];
  v39[10] = v27;
  v26 = PLServicesLocalizedFrameworkString();
  v25 = +[PLPhotoEffect _effectWithIdentifier:@"3DVivid" CIFilterName:@"CIPhotoEffect3DVivid" displayName:v26];
  v39[11] = v25;
  v24 = PLServicesLocalizedFrameworkString();
  v23 = +[PLPhotoEffect _effectWithIdentifier:@"3DVividWarm" CIFilterName:@"CIPhotoEffect3DVividWarm" displayName:v24];
  v39[12] = v23;
  v22 = PLServicesLocalizedFrameworkString();
  v21 = +[PLPhotoEffect _effectWithIdentifier:@"3DVividCool" CIFilterName:@"CIPhotoEffect3DVividCool" displayName:v22];
  v39[13] = v21;
  v20 = PLServicesLocalizedFrameworkString();
  v19 = +[PLPhotoEffect _effectWithIdentifier:@"3DDramatic" CIFilterName:@"CIPhotoEffect3DDramatic" displayName:v20];
  v39[14] = v19;
  v18 = PLServicesLocalizedFrameworkString();
  v17 = +[PLPhotoEffect _effectWithIdentifier:@"3DDramaticWarm" CIFilterName:@"CIPhotoEffect3DDramaticWarm" displayName:v18];
  v39[15] = v17;
  v16 = PLServicesLocalizedFrameworkString();
  v15 = +[PLPhotoEffect _effectWithIdentifier:@"3DDramaticCool" CIFilterName:@"CIPhotoEffect3DDramaticCool" displayName:v16];
  v39[16] = v15;
  uint64_t v14 = PLServicesLocalizedFrameworkString();
  v13 = +[PLPhotoEffect _effectWithIdentifier:@"Mono" CIFilterName:@"CIPhotoEffectMono" displayName:v14];
  v39[17] = v13;
  long long v12 = PLServicesLocalizedFrameworkString();
  long long v11 = +[PLPhotoEffect _effectWithIdentifier:@"3DSilverplate" CIFilterName:@"CIPhotoEffect3DSilverplate" displayName:v12];
  v39[18] = v11;
  v0 = PLServicesLocalizedFrameworkString();
  id v1 = +[PLPhotoEffect _effectWithIdentifier:@"3DNoir" CIFilterName:@"CIPhotoEffect3DNoir" displayName:v0];
  v39[19] = v1;
  id v2 = +[PLPhotoEffect _legacyEffectWithIdentifier:@"Tonal" CIFilterName:@"CIPhotoEffectTonal"];
  v39[20] = v2;
  uint64_t v3 = +[PLPhotoEffect _legacyEffectWithIdentifier:@"Fade" CIFilterName:@"CIPhotoEffectFade"];
  v39[21] = v3;
  uint64_t v4 = +[PLPhotoEffect _legacyEffectWithIdentifier:@"Chrome" CIFilterName:@"CIPhotoEffectChrome"];
  v39[22] = v4;
  uint64_t v5 = +[PLPhotoEffect _legacyEffectWithIdentifier:@"Process" CIFilterName:@"CIPhotoEffectProcess"];
  v39[23] = v5;
  id v6 = +[PLPhotoEffect _legacyEffectWithIdentifier:@"Transfer" CIFilterName:@"CIPhotoEffectTransfer"];
  v39[24] = v6;
  id v7 = +[PLPhotoEffect _legacyEffectWithIdentifier:@"Instant" CIFilterName:@"CIPhotoEffectInstant"];
  v39[25] = v7;
  char v8 = +[PLPhotoEffect _legacyEffectWithIdentifier:@"Noir" CIFilterName:@"CIPhotoEffectNoir"];
  v39[26] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:27];
  long long v10 = (void *)allEffects_allPhotoEffects;
  allEffects_allPhotoEffects = v9;
}

+ (id)_lightingEffectWithIdentifier:(id)a3 relatedVersionIdentifier:(id)a4 CIFilterName:(id)a5 lightingVersion:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  long long v12 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v13 = [v11 copy];

  uint64_t v14 = (void *)v12[2];
  v12[2] = v13;

  uint64_t v15 = [v10 copy];
  v16 = (void *)v12[3];
  v12[3] = v15;

  uint64_t v17 = [v9 copy];
  v18 = (void *)v12[5];
  v12[5] = v17;

  *((unsigned char *)v12 + 8) = 1;
  v12[6] = a6;
  return v12;
}

+ (id)_effectWithIdentifier:(id)a3 CIFilterName:(id)a4 displayName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v11 = [v9 copy];

  long long v12 = (void *)v10[2];
  v10[2] = v11;

  uint64_t v13 = [v8 copy];
  uint64_t v14 = (void *)v10[5];
  v10[5] = v13;

  uint64_t v15 = [v7 copy];
  v16 = (void *)v10[4];
  void v10[4] = v15;

  *((_WORD *)v10 + 4) = 0;
  return v10;
}

+ (id)_legacyEffectWithIdentifier:(id)a3 CIFilterName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = [v6 copy];

  id v9 = (void *)v7[2];
  v7[2] = v8;

  uint64_t v10 = [v5 copy];
  uint64_t v11 = (void *)v7[5];
  v7[5] = v10;

  *((_WORD *)v7 + 4) = 256;
  return v7;
}

@end