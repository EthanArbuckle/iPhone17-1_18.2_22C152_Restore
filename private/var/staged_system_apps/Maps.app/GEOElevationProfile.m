@interface GEOElevationProfile
- (BOOL)isValid;
@end

@implementation GEOElevationProfile

- (BOOL)isValid
{
  return (unint64_t)[(GEOElevationProfile *)self pointsCount] > 1;
}

@end