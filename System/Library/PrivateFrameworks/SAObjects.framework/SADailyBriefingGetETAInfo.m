@interface SADailyBriefingGetETAInfo
- (BOOL)requiresResponse;
- (double)latitude;
- (double)longitude;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
@end

@implementation SADailyBriefingGetETAInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.dailybriefing";
}

- (id)encodedClassName
{
  return @"GetETAInfo";
}

- (double)latitude
{
  return AceObjectDoubleForProperty(self, @"latitude");
}

- (void)setLatitude:(double)a3
{
}

- (double)longitude
{
  return AceObjectDoubleForProperty(self, @"longitude");
}

- (void)setLongitude:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end