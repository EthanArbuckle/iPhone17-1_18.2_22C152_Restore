@interface CPBitmapStore(WeatherAppDataProtection)
- (uint64_t)setVersion:()WeatherAppDataProtection withOptions:;
@end

@implementation CPBitmapStore(WeatherAppDataProtection)

- (uint64_t)setVersion:()WeatherAppDataProtection withOptions:
{
  uint64_t v5 = a4 | 1;
  v6 = objc_msgSend(NSNumber, "numberWithInt:");
  v7 = [v6 stringValue];
  v8 = [v7 dataUsingEncoding:4];
  v9 = [a1 _versionPath];
  [v8 writeToFile:v9 options:v5 error:0];

  return [a1 version];
}

@end