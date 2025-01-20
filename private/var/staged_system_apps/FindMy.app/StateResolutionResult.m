@interface StateResolutionResult
+ (id)confirmationRequiredWithStateToConfirm:(int64_t)a3;
+ (id)successWithResolvedState:(int64_t)a3;
- (StateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation StateResolutionResult

+ (id)successWithResolvedState:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static PlaySoundDeviceClassResolutionResult.success(with:)(a3);

  return v4;
}

+ (id)confirmationRequiredWithStateToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static PlaySoundDeviceClassResolutionResult.confirmationRequired(with:)(a3);

  return v4;
}

- (StateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for StateResolutionResult();
  v8 = [(StateResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end