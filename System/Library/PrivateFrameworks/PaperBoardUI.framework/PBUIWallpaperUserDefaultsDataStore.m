@interface PBUIWallpaperUserDefaultsDataStore
- (BOOL)hasWallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (BOOL)setOriginalVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setProceduralWallpaperInfo:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperColor:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setWallpaperColorName:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setWallpaperGradient:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setWallpaperImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperImageHashData:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperOriginalImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)supportsWallpaperImageHashDataStorage;
- (NSString)description;
- (PBUIWallpaperDefaults)wallpaperDefaults;
- (PBUIWallpaperDefaultsDomain)defaultsDomain;
- (PBUIWallpaperUserDefaultsDataStore)init;
- (PBUIWallpaperUserDefaultsDataStore)initWithUserdefaultsDomain:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)proceduralWallpaperInfoForVariant:(int64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)unverifiedVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)verifiedOriginalVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)verifiedVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperColorForVariant:(int64_t)a3;
- (id)wallpaperColorNameForVariant:(int64_t)a3;
- (id)wallpaperGradientForVariant:(int64_t)a3;
- (id)wallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperImageHashDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperOptionsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperOriginalImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperThumbnailDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (void)moveWallpaperImageDataTypes:(unint64_t)a3 fromVariant:(int64_t)a4 toVariant:(int64_t)a5;
- (void)removeProceduralWallpaperForVariants:(int64_t)a3;
- (void)removeWallpaperColorForVariants:(int64_t)a3;
- (void)removeWallpaperGradientForVariants:(int64_t)a3;
- (void)removeWallpaperImageDataTypes:(unint64_t)a3 forVariants:(int64_t)a4;
- (void)removeWallpaperImageHashDataForVariants:(int64_t)a3;
- (void)removeWallpaperOptionsForVariants:(int64_t)a3;
- (void)updateProceduralWallpaperDefaultsWithIdentifier:(id)a3 options:(id)a4 forVariant:(int64_t)a5;
@end

@implementation PBUIWallpaperUserDefaultsDataStore

- (PBUIWallpaperUserDefaultsDataStore)initWithUserdefaultsDomain:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBUIWallpaperUserDefaultsDataStore;
  v6 = [(PBUIWallpaperUserDefaultsDataStore *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaultsDomain, a3);
    v8 = [[PBUIWallpaperDefaults alloc] initWithdefaultsDomain:v5];
    wallpaperDefaults = v7->_wallpaperDefaults;
    v7->_wallpaperDefaults = v8;
  }
  return v7;
}

- (PBUIWallpaperUserDefaultsDataStore)init
{
  v3 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
  v4 = [(PBUIWallpaperUserDefaultsDataStore *)self initWithUserdefaultsDomain:v3];

  return v4;
}

- (id)wallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (BOOL)hasWallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (id)wallpaperThumbnailDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (id)wallpaperOriginalImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (BOOL)setWallpaperImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (BOOL)setWallpaperOriginalImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (void)moveWallpaperImageDataTypes:(unint64_t)a3 fromVariant:(int64_t)a4 toVariant:(int64_t)a5
{
  if (a3)
  {
    id v9 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
    v8 = [v9 imageHashForVariant:a4 wallpaperMode:0];
    if (v8)
    {
      [v9 setImageHash:0 forLocations:PBUIWallpaperLocationForVariant(a4) wallpaperMode:0];
      [v9 setImageHash:v8 forLocations:PBUIWallpaperLocationForVariant(a5) wallpaperMode:0];
    }
  }
}

- (void)removeWallpaperImageDataTypes:(unint64_t)a3 forVariants:(int64_t)a4
{
  if (a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __80__PBUIWallpaperUserDefaultsDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke;
    v4[3] = &unk_1E62B2D28;
    v4[4] = self;
    PBUIWallpaperEnumerateVariantsForLocations(a4, v4);
  }
}

void __80__PBUIWallpaperUserDefaultsDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (a2 != 1) {
      return;
    }
    v2 = [*(id *)(a1 + 32) wallpaperDefaults];
    v3 = &__block_literal_global_24;
    id v5 = v2;
    uint64_t v4 = 2;
  }
  else
  {
    v2 = [*(id *)(a1 + 32) wallpaperDefaults];
    v3 = &__block_literal_global_3_0;
    id v5 = v2;
    uint64_t v4 = 1;
  }
  [v2 updateDefaultsForLocations:v4 updater:v3];
}

uint64_t __80__PBUIWallpaperUserDefaultsDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setImageHashData:0];
}

uint64_t __80__PBUIWallpaperUserDefaultsDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setImageHashData:0];
}

- (BOOL)supportsWallpaperImageHashDataStorage
{
  return 1;
}

- (BOOL)setWallpaperImageHashData:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  [v9 setImageHash:v8 forLocations:a4 wallpaperMode:a5];

  return 1;
}

- (id)wallpaperImageHashDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  if ((unint64_t)a3 > 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
    v7 = [v6 imageHashForVariant:a3 wallpaperMode:a4];
  }
  return v7;
}

- (void)removeWallpaperImageHashDataForVariants:(int64_t)a3
{
  id v4 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  [v4 updateDefaultsForLocations:a3 updater:&__block_literal_global_6];
}

uint64_t __78__PBUIWallpaperUserDefaultsDataStore_removeWallpaperImageHashDataForVariants___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setImageHashData:0];
}

- (id)unverifiedVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (id)verifiedVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (id)verifiedOriginalVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (BOOL)setVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (BOOL)setOriginalVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (id)proceduralWallpaperInfoForVariant:(int64_t)a3
{
  id v4 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  id v5 = v4;
  if (a3 == -1)
  {
    v7 = 0;
    id v9 = 0;
    v10 = 0;
  }
  else
  {
    BOOL v6 = a3 == 1;
    v7 = [v4 proceduralIdentifierForVariant:v6];
    uint64_t v8 = [v5 proceduralOptionsForVariant:v6];
    id v9 = (void *)v8;
    v10 = 0;
    if (v7 && v8)
    {
      v10 = [MEMORY[0x1E4F1CA60] dictionary];
      [v10 setObject:v9 forKey:@"kSBUIMagicWallpaperPresetOptionsKey"];
      [v10 setObject:v7 forKey:@"kSBUIMagicWallpaperIdentifierKey"];
      objc_super v11 = BundlePathForWallpaperIdentifier(v7);
      if (v11)
      {
        [v10 setObject:v11 forKey:@"kSBUIMagicWallpaperBundlePathKey"];
      }
      else
      {
        v12 = PBUILogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[PBUIWallpaperUserDefaultsDataStore proceduralWallpaperInfoForVariant:]((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);
        }
      }
    }
  }

  return v10;
}

- (void)updateProceduralWallpaperDefaultsWithIdentifier:(id)a3 options:(id)a4 forVariant:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  v10 = v9;
  if (a5)
  {
    if (a5 != 1) {
      goto LABEL_6;
    }
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v11 = 1;
  }
  [v9 setProceduralIdentifier:v12 forLocations:v11];
  [v10 setProceduralOptions:v8 forLocations:v11];
  [v10 setProceduralUserSet:v12 != 0 forLocations:v11];
LABEL_6:
}

- (BOOL)setProceduralWallpaperInfo:(id)a3 forVariants:(int64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  v7 = [v6 objectForKey:@"kSBUIMagicWallpaperIdentifierKey"];
  id v8 = [v6 objectForKey:@"kSBUIMagicWallpaperPresetOptionsKey"];

  if (v4) {
    [(PBUIWallpaperUserDefaultsDataStore *)self updateProceduralWallpaperDefaultsWithIdentifier:v7 options:v8 forVariant:0];
  }
  if ((v4 & 2) != 0) {
    [(PBUIWallpaperUserDefaultsDataStore *)self updateProceduralWallpaperDefaultsWithIdentifier:v7 options:v8 forVariant:1];
  }

  return 1;
}

- (void)removeProceduralWallpaperForVariants:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__PBUIWallpaperUserDefaultsDataStore_removeProceduralWallpaperForVariants___block_invoke;
  v3[3] = &unk_1E62B2D28;
  v3[4] = self;
  PBUIWallpaperEnumerateVariantsForLocations(a3, v3);
}

uint64_t __75__PBUIWallpaperUserDefaultsDataStore_removeProceduralWallpaperForVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateProceduralWallpaperDefaultsWithIdentifier:0 options:0 forVariant:a2];
}

- (id)wallpaperOptionsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  id v6 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  v7 = [v6 wallpaperOptionsForVariant:a3 wallpaperMode:a4];

  return v7;
}

- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  [v9 setWallpaperOptions:v8 forLocations:a4 wallpaperMode:a5];

  return 1;
}

- (void)removeWallpaperOptionsForVariants:(int64_t)a3
{
  id v3 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  [v3 resetDefaults];
}

- (id)wallpaperColorForVariant:(int64_t)a3
{
  char v4 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  id v5 = v4;
  if ((unint64_t)a3 > 1)
  {
    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = [v4 wallpaperColorDataForVariant:a3];
  if (!v6)
  {
LABEL_9:
    id v9 = 0;
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1E4F28DC0];
  id v8 = self;
  id v19 = 0;
  id v9 = [v7 unarchivedObjectOfClass:v8 fromData:v6 error:&v19];
  id v10 = v19;

  if (!v9)
  {
    uint64_t v11 = PBUILogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PBUIWallpaperUserDefaultsDataStore wallpaperColorForVariant:]((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
LABEL_10:

  return v9;
}

- (id)wallpaperColorNameForVariant:(int64_t)a3
{
  char v4 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  id v5 = v4;
  if ((unint64_t)a3 > 1)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v4 wallpaperColorNameForVariant:a3];
  }

  return v6;
}

- (BOOL)setWallpaperColor:(id)a3 forVariants:(int64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  id v17 = 0;
  v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v17];
  id v8 = v17;
  if (!v7)
  {
    id v9 = PBUILogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PBUIWallpaperUserDefaultsDataStore setWallpaperColor:forVariants:]();
    }
  }
  id v10 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__PBUIWallpaperUserDefaultsDataStore_setWallpaperColor_forVariants___block_invoke;
  v14[3] = &unk_1E62B2C88;
  id v15 = v10;
  id v16 = v7;
  id v11 = v7;
  id v12 = v10;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v14);

  return 1;
}

uint64_t __68__PBUIWallpaperUserDefaultsDataStore_setWallpaperColor_forVariants___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    if (a2 != 1) {
      return result;
    }
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 1;
  }
  return [*(id *)(result + 32) setColorData:*(void *)(result + 40) forLocations:v2];
}

- (BOOL)setWallpaperColorName:(id)a3 forVariants:(int64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  v7 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__PBUIWallpaperUserDefaultsDataStore_setWallpaperColorName_forVariants___block_invoke;
  v11[3] = &unk_1E62B2C88;
  id v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v11);

  return 1;
}

uint64_t __72__PBUIWallpaperUserDefaultsDataStore_setWallpaperColorName_forVariants___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    if (a2 != 1) {
      return result;
    }
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 1;
  }
  return [*(id *)(result + 32) setColorName:*(void *)(result + 40) forLocations:v2];
}

- (void)removeWallpaperColorForVariants:(int64_t)a3
{
  id v4 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  [v4 setColorName:0 forLocations:a3];
  [v4 setColorData:0 forLocations:a3];
}

- (id)wallpaperGradientForVariant:(int64_t)a3
{
  id v4 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  id v5 = v4;
  if ((unint64_t)a3 > 1)
  {
    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = [v4 wallpaperGradientDataForVariant:a3];
  if (!v6)
  {
LABEL_9:
    id v9 = 0;
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1E4F28DC0];
  id v8 = self;
  id v19 = 0;
  id v9 = [v7 unarchivedObjectOfClass:v8 fromData:v6 error:&v19];
  id v10 = v19;

  if (!v9)
  {
    id v11 = PBUILogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PBUIWallpaperUserDefaultsDataStore wallpaperGradientForVariant:]((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
LABEL_10:

  return v9;
}

- (BOOL)setWallpaperGradient:(id)a3 forVariants:(int64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  id v17 = 0;
  v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v17];
  id v8 = v17;
  if (!v7)
  {
    id v9 = PBUILogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PBUIWallpaperUserDefaultsDataStore setWallpaperGradient:forVariants:]();
    }
  }
  id v10 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__PBUIWallpaperUserDefaultsDataStore_setWallpaperGradient_forVariants___block_invoke;
  v14[3] = &unk_1E62B2C88;
  id v15 = v10;
  id v16 = v7;
  id v11 = v7;
  id v12 = v10;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v14);

  return 1;
}

uint64_t __71__PBUIWallpaperUserDefaultsDataStore_setWallpaperGradient_forVariants___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    if (a2 != 1) {
      return result;
    }
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 1;
  }
  return [*(id *)(result + 32) setGradientData:*(void *)(result + 40) forLocations:v2];
}

- (void)removeWallpaperGradientForVariants:(int64_t)a3
{
  char v3 = a3;
  char v4 = [(PBUIWallpaperUserDefaultsDataStore *)self wallpaperDefaults];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__PBUIWallpaperUserDefaultsDataStore_removeWallpaperGradientForVariants___block_invoke;
  v6[3] = &unk_1E62B2D28;
  id v7 = v4;
  id v5 = v4;
  PBUIWallpaperEnumerateVariantsForLocations(v3, v6);
}

uint64_t __73__PBUIWallpaperUserDefaultsDataStore_removeWallpaperGradientForVariants___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    if (a2 != 1) {
      return result;
    }
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 1;
  }
  return [*(id *)(result + 32) setGradientData:0 forLocations:v2];
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperUserDefaultsDataStore *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(PBUIWallpaperUserDefaultsDataStore *)self descriptionBuilderWithMultilinePrefix:a3];
  char v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(PBUIWallpaperUserDefaultsDataStore *)self defaultsDomain];
  id v6 = (id)[v4 appendObject:v5 withName:@"userDefaults"];

  return v4;
}

- (id)succinctDescription
{
  uint64_t v2 = [(PBUIWallpaperUserDefaultsDataStore *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (PBUIWallpaperDefaultsDomain)defaultsDomain
{
  return self->_defaultsDomain;
}

- (PBUIWallpaperDefaults)wallpaperDefaults
{
  return self->_wallpaperDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperDefaults, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
}

- (void)proceduralWallpaperInfoForVariant:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)wallpaperColorForVariant:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setWallpaperColor:forVariants:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BC4B3000, v0, v1, "Error archiving wallpaper color '%@': %{public}@");
}

- (void)wallpaperGradientForVariant:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setWallpaperGradient:forVariants:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BC4B3000, v0, v1, "Error archiving wallpaper gradient '%@': %{public}@");
}

@end