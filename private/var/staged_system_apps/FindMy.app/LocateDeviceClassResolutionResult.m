@interface LocateDeviceClassResolutionResult
+ (id)confirmationRequiredWithLocateDeviceClassToConfirm:(int64_t)a3;
+ (id)successWithResolvedLocateDeviceClass:(int64_t)a3;
- (LocateDeviceClassResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation LocateDeviceClassResolutionResult

+ (id)successWithResolvedLocateDeviceClass:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static PlaySoundDeviceClassResolutionResult.success(with:)(a3);

  return v4;
}

+ (id)confirmationRequiredWithLocateDeviceClassToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static PlaySoundDeviceClassResolutionResult.confirmationRequired(with:)(a3);

  return v4;
}

- (LocateDeviceClassResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LocateDeviceClassResolutionResult();
  v8 = [(LocateDeviceClassResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end