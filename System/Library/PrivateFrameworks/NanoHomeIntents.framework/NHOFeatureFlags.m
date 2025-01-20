@interface NHOFeatureFlags
+ (BOOL)eagleRoostFeatureFlagIsEnabled;
- (NHOFeatureFlags)init;
@end

@implementation NHOFeatureFlags

+ (BOOL)eagleRoostFeatureFlagIsEnabled
{
  v5 = &type metadata for NHOFeatureFlags;
  unint64_t v6 = sub_257307A08();
  char v2 = sub_257321648();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2 & 1;
}

- (NHOFeatureFlags)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NHOFeatureFlagsObjC();
  return [(NHOFeatureFlags *)&v3 init];
}

@end