@interface STPresetsConfiguration
- (BOOL)areMusicProfilesAllowed;
- (BOOL)areMusicVideosAllowed;
- (BOOL)isBooksAllowed;
- (BOOL)isDeletingAppsAllowed;
- (BOOL)isExplicitMediaAllowed;
- (BOOL)isSiriExplicitAllowed;
- (BOOL)isSiriWebSearchAllowed;
- (NSNumber)allowedAppStoreRating;
- (NSNumber)allowedMovieRating;
- (NSNumber)allowedTVRating;
- (int64_t)allowedWebContent;
@end

@implementation STPresetsConfiguration

- (NSNumber)allowedAppStoreRating
{
  v2 = NSNumber;
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "integerForKey:", @"AllowedAppStoreRating"));

  return (NSNumber *)v4;
}

- (BOOL)isBooksAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"BooksAllowed"];

  return v3;
}

- (NSNumber)allowedTVRating
{
  v2 = NSNumber;
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "integerForKey:", @"AllowedTVRating"));

  return (NSNumber *)v4;
}

- (NSNumber)allowedMovieRating
{
  v2 = NSNumber;
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "integerForKey:", @"AllowedMovieRating"));

  return (NSNumber *)v4;
}

- (BOOL)isExplicitMediaAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ExplicitMediaAllowed"];

  return v3;
}

- (BOOL)areMusicVideosAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"MusicVideosAllowed"];

  return v3;
}

- (BOOL)areMusicProfilesAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"MusicProfilesAllowed"];

  return v3;
}

- (int64_t)allowedWebContent
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"AllowedWebContent"];

  return v3;
}

- (BOOL)isSiriWebSearchAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"SiriWebSearchAllowed"];

  return v3;
}

- (BOOL)isSiriExplicitAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"SiriExplicitAllowed"];

  return v3;
}

- (BOOL)isDeletingAppsAllowed
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"DeletingAppsAllowed"];

  return v3;
}

@end