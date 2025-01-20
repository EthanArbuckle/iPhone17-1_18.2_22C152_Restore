@interface GEOWiFiQualityIndex(Serialization)
- (uint64_t)score;
- (uint64_t)typeDescription;
@end

@implementation GEOWiFiQualityIndex(Serialization)

- (uint64_t)typeDescription
{
  uint64_t v2 = [a1 type];

  return [a1 typeAsString:v2];
}

- (uint64_t)score
{
  return [a1 value];
}

@end