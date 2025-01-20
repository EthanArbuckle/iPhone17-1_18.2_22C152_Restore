@interface ATXModeGamingFeaturizer
- (id)registrationId;
- (int)modeFeatureType;
- (unint64_t)expectedGenreId;
@end

@implementation ATXModeGamingFeaturizer

- (unint64_t)expectedGenreId
{
  return 6014;
}

- (int)modeFeatureType
{
  return 8;
}

- (id)registrationId
{
  return @"FocusModes.GamingMode";
}

@end