@interface ATXModeReadingFeaturizer
- (id)additionalAllowedBundleIds;
- (id)registrationId;
- (int)modeFeatureType;
- (unint64_t)expectedGenreId;
@end

@implementation ATXModeReadingFeaturizer

- (unint64_t)expectedGenreId
{
  return 6018;
}

- (id)additionalAllowedBundleIds
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.iBooks"];
}

- (int)modeFeatureType
{
  return 15;
}

- (id)registrationId
{
  return @"FocusModes.ReadingMode";
}

@end