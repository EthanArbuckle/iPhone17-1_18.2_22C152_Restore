@interface MTDebugSharedUserDefaultsDataProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation MTDebugSharedUserDefaultsDataProvider

- (id)debugDataFileName
{
  return @"SharedUserDefaults.txt";
}

- (id)debugData
{
  v2 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  v3 = [v2 dictionaryRepresentation];

  v4 = [v3 description];
  v5 = [v4 dataUsingEncoding:4];

  return v5;
}

@end