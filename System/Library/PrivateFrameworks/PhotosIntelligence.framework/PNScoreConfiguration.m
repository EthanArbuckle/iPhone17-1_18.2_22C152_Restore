@interface PNScoreConfiguration
+ (id)plistPathForPhotoLibrary:(id)a3 dataType:(int64_t)a4;
+ (id)scoreConfigurationNameForDataType:(int64_t)a3 withThemeType:(int64_t)a4;
+ (id)scoreConfigurationNamePrefixForDataType:(int64_t)a3;
+ (id)scoreConfigurationNameSuffixForThemeType:(int64_t)a3;
- (NSString)name;
- (PNScoreConfiguration)initWithScoreConfigurationDataType:(int64_t)a3 scoreConfigurationThemeType:(int64_t)a4;
- (int64_t)dataType;
- (int64_t)themeType;
@end

@implementation PNScoreConfiguration

- (void).cxx_destruct
{
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)themeType
{
  return self->_themeType;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (PNScoreConfiguration)initWithScoreConfigurationDataType:(int64_t)a3 scoreConfigurationThemeType:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PNScoreConfiguration;
  v6 = [(PNScoreConfiguration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_dataType = a3;
    v6->_themeType = a4;
    uint64_t v8 = +[PNScoreConfiguration scoreConfigurationNameForDataType:a3 withThemeType:a4];
    name = v7->_name;
    v7->_name = (NSString *)v8;
  }
  return v7;
}

+ (id)plistPathForPhotoLibrary:(id)a3 dataType:(int64_t)a4
{
  id v5 = a3;
  v6 = +[PNScoreConfiguration scoreConfigurationNamePrefixForDataType:a4];
  v7 = [v5 urlForApplicationDataFolderIdentifier:1];

  uint64_t v8 = [NSString stringWithFormat:@"%@.plist", v6];
  v9 = [v7 URLByAppendingPathComponent:v8];

  v10 = [v9 path];

  return v10;
}

+ (id)scoreConfigurationNameForDataType:(int64_t)a3 withThemeType:(int64_t)a4
{
  id v5 = +[PNScoreConfiguration scoreConfigurationNamePrefixForDataType:a3];
  v6 = +[PNScoreConfiguration scoreConfigurationNameSuffixForThemeType:a4];
  v7 = [NSString stringWithFormat:@"%@ - %@", v5, v6];

  return v7;
}

+ (id)scoreConfigurationNameSuffixForThemeType:(int64_t)a3
{
  v3 = @"??";
  if (a3 == 1) {
    v3 = @"Grouped By GeoHash";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Grouped By People";
  }
}

+ (id)scoreConfigurationNamePrefixForDataType:(int64_t)a3
{
  v3 = @"??";
  if (a3 == 1) {
    v3 = @"IconicScore";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"WallpaperScore";
  }
}

@end