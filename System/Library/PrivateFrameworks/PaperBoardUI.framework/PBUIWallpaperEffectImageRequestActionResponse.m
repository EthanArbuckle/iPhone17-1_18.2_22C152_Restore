@interface PBUIWallpaperEffectImageRequestActionResponse
- (CGSize)size;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)actualStyle;
@end

@implementation PBUIWallpaperEffectImageRequestActionResponse

- (int64_t)actualStyle
{
  v2 = [(PBUIWallpaperEffectImageRequestActionResponse *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (CGSize)size
{
  v2 = [(PBUIWallpaperEffectImageRequestActionResponse *)self info];
  v3 = [v2 objectForSetting:2];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return (id)*((void *)&off_1E62B2E38 + a3 - 1);
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6 = a4;
  double v7 = v6;
  if (a5 == 2)
  {
    [v6 CGSizeValue];
    uint64_t v8 = NSStringFromCGSize(v12);
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    uint64_t v8 = PBUIWallpaperStyleDescription([v6 integerValue]);
LABEL_5:
    double v9 = (void *)v8;
    goto LABEL_7;
  }
  double v9 = 0;
LABEL_7:

  return v9;
}

@end