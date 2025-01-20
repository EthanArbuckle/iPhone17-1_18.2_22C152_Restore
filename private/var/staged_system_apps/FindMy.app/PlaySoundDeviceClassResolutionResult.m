@interface PlaySoundDeviceClassResolutionResult
+ (id)confirmationRequiredWithPlaySoundDeviceClassToConfirm:(int64_t)a3;
+ (id)successWithResolvedPlaySoundDeviceClass:(int64_t)a3;
- (PlaySoundDeviceClassResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PlaySoundDeviceClassResolutionResult

+ (id)successWithResolvedPlaySoundDeviceClass:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static PlaySoundDeviceClassResolutionResult.success(with:)(a3);

  return v4;
}

+ (id)confirmationRequiredWithPlaySoundDeviceClassToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static PlaySoundDeviceClassResolutionResult.confirmationRequired(with:)(a3);

  return v4;
}

- (PlaySoundDeviceClassResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PlaySoundDeviceClassResolutionResult();
  v8 = [(PlaySoundDeviceClassResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end