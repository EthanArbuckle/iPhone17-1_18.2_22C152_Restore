@interface PNLocationCuration
+ (id)representativeAssetsForMapDisplayFromAssets:(id)a3;
+ (id)requiredFetchPropertySets;
+ (int64_t)fetchLimit;
- (PNLocationCuration)init;
@end

@implementation PNLocationCuration

+ (id)requiredFetchPropertySets
{
  static LocationCuration.requiredFetchPropertySets()();
  v2 = (void *)sub_2598444E0();
  swift_bridgeObjectRelease();
  return v2;
}

+ (int64_t)fetchLimit
{
  return 1000;
}

+ (id)representativeAssetsForMapDisplayFromAssets:(id)a3
{
  swift_getObjCClassMetadata();
  v4 = (char *)a3;
  static LocationCuration.representativeAssetsForMapDisplay(from:)(v4);

  sub_25946D748();
  v5 = (void *)sub_2598444E0();
  swift_bridgeObjectRelease();
  return v5;
}

- (PNLocationCuration)init
{
  return (PNLocationCuration *)LocationCuration.init()();
}

@end