@interface SBFWallpaperAggdLogger
- (SBFWallpaperAggdLogger)init;
- (id)_valueString;
- (unint64_t)_bucketedPlayCount;
- (void)_clearAggdKeysForLocations:(int64_t)a3;
- (void)_resetPlayCountDate;
- (void)incrementIrisPlayCount;
- (void)saveWallpaperAggdCurrentValues;
- (void)updateWallpaperAggdKeysForLocations:(int64_t)a3 withHasVideo:(BOOL)a4 hasProcedural:(BOOL)a5 name:(id)a6;
@end

@implementation SBFWallpaperAggdLogger

- (SBFWallpaperAggdLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFWallpaperAggdLogger;
  v2 = [(SBFWallpaperAggdLogger *)&v6 init];
  if (v2)
  {
    v3 = (PBUIWallpaperDefaultsDomain *)objc_alloc_init(MEMORY[0x1E4F83BE8]);
    wallpaperDefaults = v2->_wallpaperDefaults;
    v2->_wallpaperDefaults = v3;

    [(SBFWallpaperAggdLogger *)v2 _clearAggdKeysForLocations:3];
  }
  return v2;
}

- (void)updateWallpaperAggdKeysForLocations:(int64_t)a3 withHasVideo:(BOOL)a4 hasProcedural:(BOOL)a5 name:(id)a6
{
  BOOL v7 = a4;
  id v14 = a6;
  [(SBFWallpaperAggdLogger *)self _clearAggdKeysForLocations:a3];
  uint64_t v10 = [v14 length];
  int64_t v11 = 1;
  if (v7) {
    int64_t v11 = 2;
  }
  uint64_t v12 = 3;
  if (v7) {
    uint64_t v12 = 4;
  }
  if (v10) {
    int64_t v11 = v12;
  }
  if (a5) {
    int64_t v11 = 0;
  }
  if (a3)
  {
    self->_aggd_lockscreenWallpaperType = v11;
    if ((a3 & 2) == 0)
    {
LABEL_11:
      if (!v10) {
        goto LABEL_20;
      }
      goto LABEL_15;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_aggd_homescreenWallpaperType = v11;
  if (!v10) {
    goto LABEL_20;
  }
LABEL_15:
  int64_t v13 = [v14 integerValue];
  if ((v13 & 0x8000000000000000) == 0)
  {
    if (a3) {
      self->_aggd_lockscreenWallpaperIdentifier = v13;
    }
    if ((a3 & 2) != 0) {
      self->_aggd_homescreenWallpaperIdentifier = v13;
    }
  }
LABEL_20:
  if (a3) {
    self->_aggd_irisWallpaperEnabled = v7;
  }
  self->_aggd_sharedWallpaper = a3 == 3;
}

- (void)saveWallpaperAggdCurrentValues
{
  if ((self->_aggd_lockscreenWallpaperType & 0x8000000000000000) == 0) {
    ADClientSetValueForScalarKey();
  }
  if ((self->_aggd_lockscreenWallpaperIdentifier & 0x8000000000000000) == 0) {
    ADClientSetValueForScalarKey();
  }
  if ((self->_aggd_homescreenWallpaperType & 0x8000000000000000) == 0) {
    ADClientSetValueForScalarKey();
  }
  if ((self->_aggd_lockscreenWallpaperIdentifier & 0x8000000000000000) == 0) {
    ADClientSetValueForScalarKey();
  }
  if ((self->_aggd_irisWallpaperEnabled & 0x8000000000000000) == 0) {
    ADClientSetValueForScalarKey();
  }
  if ((self->_aggd_sharedWallpaper & 0x8000000000000000) == 0)
  {
    ADClientSetValueForScalarKey();
  }
}

- (void)incrementIrisPlayCount
{
  id v11 = [(PBUIWallpaperDefaultsDomain *)self->_wallpaperDefaults dateIrisWallpaperLastPlayed];
  uint64_t v3 = [(PBUIWallpaperDefaultsDomain *)self->_wallpaperDefaults irisWallpaperPlayCount];
  if (v11
    && ([MEMORY[0x1E4F1C9A8] currentCalendar],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isDateInToday:v11],
        v4,
        v5))
  {
    unint64_t v6 = v3 + 1;
    id v7 = v11;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];

    unint64_t v6 = 1;
    id v7 = (id)v8;
  }
  id v12 = v7;
  -[PBUIWallpaperDefaultsDomain setDateIrisWallpaperLastPlayed:](self->_wallpaperDefaults, "setDateIrisWallpaperLastPlayed:");
  [(PBUIWallpaperDefaultsDomain *)self->_wallpaperDefaults setIrisWallpaperPlayCount:v6];
  uint64_t v9 = 0;
  uint64_t v10 = 8u;
  do
  {
    if (*(void *)((char *)&buckets + v10) > v6) {
      break;
    }
    v9 += 0x100000000;
    v10 += 8;
  }
  while (v10 != 56);
  ADClientSetValueForScalarKey();
}

- (void)_clearAggdKeysForLocations:(int64_t)a3
{
  if (a3)
  {
    self->_aggd_irisWallpaperEnabled = -1;
    self->_aggd_lockscreenWallpaperType = -1;
    self->_aggd_lockscreenWallpaperIdentifier = -1;
  }
  if ((a3 & 2) != 0)
  {
    self->_aggd_homescreenWallpaperType = -1;
    self->_aggd_homescreenWallpaperIdentifier = -1;
  }
  self->_aggd_sharedWallpaper = -1;
}

- (id)_valueString
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld/%lld/%lld/%lld/%lld/%lld", self->_aggd_lockscreenWallpaperType, self->_aggd_lockscreenWallpaperIdentifier, self->_aggd_homescreenWallpaperType, self->_aggd_homescreenWallpaperIdentifier, self->_aggd_irisWallpaperEnabled, self->_aggd_sharedWallpaper);
}

- (unint64_t)_bucketedPlayCount
{
  unint64_t v2 = [(PBUIWallpaperDefaultsDomain *)self->_wallpaperDefaults irisWallpaperPlayCount];
  uint64_t v3 = 0;
  uint64_t v4 = 8u;
  unint64_t result = 1000;
  while (*(void *)((char *)&buckets + v4) <= v2)
  {
    v3 += 0x100000000;
    v4 += 8;
    if (v4 == 56) {
      return result;
    }
  }
  return *(void *)((char *)&buckets + (v3 >> 29));
}

- (void)_resetPlayCountDate
{
  wallpaperDefaults = self->_wallpaperDefaults;
  id v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(PBUIWallpaperDefaultsDomain *)wallpaperDefaults setDateIrisWallpaperLastPlayed:v3];
}

- (void).cxx_destruct
{
}

@end