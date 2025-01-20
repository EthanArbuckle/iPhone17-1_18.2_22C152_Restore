@interface PBUIWallpaperDidChangeAction
- (PBUIWallpaperDidChangeAction)initWithVariant:(int64_t)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)variant;
@end

@implementation PBUIWallpaperDidChangeAction

- (PBUIWallpaperDidChangeAction)initWithVariant:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)PBUIWallpaperDidChangeAction;
  v7 = [(PBUIWallpaperDidChangeAction *)&v9 initWithInfo:v5 responder:0];

  return v7;
}

- (int64_t)variant
{
  v2 = [(PBUIWallpaperDidChangeAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"variant";
  }
  else {
    return 0;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 == 1)
  {
    v7 = PBUIStringForWallpaperVariant(objc_msgSend(a4, "integerValue", a3, v5));
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end