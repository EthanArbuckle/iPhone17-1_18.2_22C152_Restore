@interface PBUIWallpaperUpdateLocationsAction
- (PBUIWallpaperUpdateLocationsAction)initWithLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 responder:(id)a5;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)locations;
- (int64_t)wallpaperMode;
@end

@implementation PBUIWallpaperUpdateLocationsAction

- (PBUIWallpaperUpdateLocationsAction)initWithLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 responder:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v9 = a5;
  id v10 = objc_alloc_init(v8);
  v11 = [NSNumber numberWithInteger:a3];
  [v10 setObject:v11 forSetting:1];

  v12 = [NSNumber numberWithInteger:a4];
  [v10 setObject:v12 forSetting:2];

  v15.receiver = self;
  v15.super_class = (Class)PBUIWallpaperUpdateLocationsAction;
  v13 = [(PBUIWallpaperUpdateLocationsAction *)&v15 initWithInfo:v10 responder:v9];

  return v13;
}

- (int64_t)locations
{
  v2 = [(PBUIWallpaperUpdateLocationsAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)wallpaperMode
{
  v2 = [(PBUIWallpaperUpdateLocationsAction *)self info];
  v3 = [v2 objectForSetting:2];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v3 = @"wallpaperMode";
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return @"locations";
  }
  else {
    return v3;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6 = a4;
  v7 = v6;
  if (a5 == 2)
  {
    uint64_t v8 = PBUIStringForWallpaperMode([v6 integerValue]);
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    uint64_t v8 = PBUIStringForWallpaperLocations([v6 integerValue]);
LABEL_5:
    id v9 = (void *)v8;
    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

@end