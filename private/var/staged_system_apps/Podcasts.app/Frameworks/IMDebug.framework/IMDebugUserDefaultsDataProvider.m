@interface IMDebugUserDefaultsDataProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation IMDebugUserDefaultsDataProvider

- (id)debugDataFileName
{
  return @"UserDefaults.txt";
}

- (id)debugData
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 dictionaryRepresentation];

  v4 = [v3 description];
  v5 = [v4 dataUsingEncoding:4];

  return v5;
}

@end