@interface PUPhotoEditAppearancePreference
+ (id)_identifierForAppearance:(int64_t)a3;
+ (int64_t)preferredAppearance;
+ (void)setPreferredAppearance:(int64_t)a3;
@end

@implementation PUPhotoEditAppearancePreference

+ (id)_identifierForAppearance:(int64_t)a3
{
  v3 = @"PUPhotoEditAppearanceSystem";
  if (a3 == 1) {
    v3 = @"PUPhotoEditAppearanceDark";
  }
  if (a3 == 2) {
    return @"PUPhotoEditAppearanceLight";
  }
  else {
    return v3;
  }
}

+ (void)setPreferredAppearance:(int64_t)a3
{
  id v4 = [a1 _identifierForAppearance:a3];
  v3 = +[PUPhotoEditAppearancePreference _userDefaults];
  [v3 setObject:v4 forKey:@"PUPhotoEditAppearanceKey"];
}

+ (int64_t)preferredAppearance
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = +[PUPhotoEditAppearancePreference _userDefaults];
  id v4 = [v3 stringForKey:@"PUPhotoEditAppearanceKey"];

  if (!v4)
  {
    id v4 = [a1 _identifierForAppearance:0];
  }
  int64_t v5 = 0;
  while (1)
  {
    v6 = [a1 _identifierForAppearance:v5];
    char v7 = [v6 isEqualToString:v4];

    if (v7) {
      break;
    }
    if (++v5 == 3)
    {
      v8 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Failed to restore edit appearance preference with identifier %@", (uint8_t *)&v10, 0xCu);
      }

      int64_t v5 = 1;
      break;
    }
  }

  return v5;
}

@end