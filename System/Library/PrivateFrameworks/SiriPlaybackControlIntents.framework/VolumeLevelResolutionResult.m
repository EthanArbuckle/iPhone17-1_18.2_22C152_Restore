@interface VolumeLevelResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithVolumeLevelToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithVolumeLevelsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedVolumeLevel:(id)a3;
- (VolumeLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation VolumeLevelResolutionResult

+ (id)successWithResolvedVolumeLevel:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232843574((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithVolumeLevelsToDisambiguate:(id)a3
{
  type metadata accessor for VolumeLevel();
  unint64_t v3 = sub_232A68658();
  swift_getObjCClassMetadata();
  id v4 = sub_232A61BE4(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithVolumeLevelToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A61CDC((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
}

- (VolumeLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (VolumeLevelResolutionResult *)VolumeLevelResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end