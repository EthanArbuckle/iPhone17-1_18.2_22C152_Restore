@interface SBFWallpaperCoreAnalyticsLogger
- (SBFWallpaperCoreAnalyticsLogger)init;
- (SBFWallpaperCoreAnalyticsLogger)initWithWallpaperDefaultsDomain:(id)a3;
- (unint64_t)ageOfWallpaper;
- (void)saveStateOfWallpaperToCoreAnalytics:(int64_t)a3 withHasVideo:(BOOL)a4 hasProcedural:(BOOL)a5 name:(id)a6;
- (void)sendStateOfWallpaperToCoreAnalytics;
- (void)setAgeOfWallpaper:(unint64_t)a3;
@end

@implementation SBFWallpaperCoreAnalyticsLogger

- (SBFWallpaperCoreAnalyticsLogger)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F83BE8]);
  v4 = [(SBFWallpaperCoreAnalyticsLogger *)self initWithWallpaperDefaultsDomain:v3];

  return v4;
}

- (SBFWallpaperCoreAnalyticsLogger)initWithWallpaperDefaultsDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFWallpaperCoreAnalyticsLogger;
  v6 = [(SBFWallpaperCoreAnalyticsLogger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wallpaperDefaultsDomain, a3);
  }

  return v7;
}

- (unint64_t)ageOfWallpaper
{
  v2 = [(PBUIWallpaperDefaultsDomain *)self->_wallpaperDefaultsDomain dateWallpaperLastChanged];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  if (v2)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    id v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    v6 = [v5 components:16 fromDate:v2 toDate:v3 options:0];
    unint64_t v7 = [v6 day];
  }
  else
  {
    unint64_t v7 = 1;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 8u;
  unint64_t v10 = 365;
  while (v7 >= *(void *)((char *)&unk_18B5E4050 + v9))
  {
    v9 += 8;
    v8 += 0x100000000;
    if (v9 == 56) {
      goto LABEL_9;
    }
  }
  unint64_t v10 = *(void *)((char *)&unk_18B5E4050 + (v8 >> 29));
LABEL_9:

  return v10;
}

- (void)saveStateOfWallpaperToCoreAnalytics:(int64_t)a3 withHasVideo:(BOOL)a4 hasProcedural:(BOOL)a5 name:(id)a6
{
  BOOL v8 = a4;
  id v18 = a6;
  uint64_t v11 = [v18 length];
  uint64_t v12 = v11;
  v13 = @"UserPhoto";
  if (v8)
  {
    v13 = @"UserIris";
    v14 = @"PreCannedIris";
  }
  else
  {
    v14 = @"PreCannedPhoto";
  }
  if (v11) {
    v13 = v14;
  }
  if (a5) {
    v15 = @"Procedural";
  }
  else {
    v15 = v13;
  }
  if ([(__CFString *)v15 length])
  {
    if (a3)
    {
      lockType = self->_lockType;
      self->_lockType = &v15->isa;
    }
    if ((a3 & 2) != 0)
    {
      homeType = self->_homeType;
      self->_homeType = &v15->isa;
    }
  }
  if (v12 && [v18 length])
  {
    if (a3) {
      objc_storeStrong((id *)&self->_lockName, a6);
    }
    if ((a3 & 2) != 0) {
      objc_storeStrong((id *)&self->_homeName, a6);
    }
  }
  if (a3) {
    self->_irisEnabled = v8;
  }
  self->_sharedWallpaper = a3 == 3;
}

- (void)sendStateOfWallpaperToCoreAnalytics
{
}

id __70__SBFWallpaperCoreAnalyticsLogger_sendStateOfWallpaperToCoreAnalytics__block_invoke(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"irisEnabled";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 48)];
  v13[0] = v2;
  v12[1] = @"irisPlayCount";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "irisWallpaperPlayCount"));
  v13[1] = v3;
  v12[2] = @"shared";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 49)];
  v13[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v6 = (void *)[v5 mutableCopy];

  if ([*(id *)(*(void *)(a1 + 32) + 16) length])
  {
    unint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
    [v6 setObject:v7 forKeyedSubscript:@"homeType"];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 24) length])
  {
    BOOL v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
    [v6 setObject:v8 forKeyedSubscript:@"lockType"];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 32) length])
  {
    uint64_t v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
    [v6 setObject:v9 forKeyedSubscript:@"homeName"];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 40) length])
  {
    unint64_t v10 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];
    [v6 setObject:v10 forKeyedSubscript:@"lockName"];
  }
  return v6;
}

- (void)setAgeOfWallpaper:(unint64_t)a3
{
  self->_ageOfWallpaper = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockName, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_lockType, 0);
  objc_storeStrong((id *)&self->_homeType, 0);
  objc_storeStrong((id *)&self->_wallpaperDefaultsDomain, 0);
}

@end