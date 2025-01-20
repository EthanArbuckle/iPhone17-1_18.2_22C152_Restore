@interface ClimateSensorIntentTypeResolutionResult
+ (id)confirmationRequiredWithClimateSensorIntentTypeToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithClimateSensorIntentTypesToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedClimateSensorIntentType:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (ClimateSensorIntentTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ClimateSensorIntentTypeResolutionResult

+ (id)successWithResolvedClimateSensorIntentType:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ClimateSensorIntentTypeResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithClimateSensorIntentTypesToDisambiguate:(id)a3
{
  type metadata accessor for ClimateSensorIntentType();
  unint64_t v3 = sub_10002A038();
  swift_getObjCClassMetadata();
  id v4 = static ClimateSensorIntentTypeResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithClimateSensorIntentTypeToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ClimateSensorIntentTypeResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_10002A2A8();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_10002A2A8();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_10002A2A8();
  __break(1u);
  return result;
}

- (ClimateSensorIntentTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_100029E88();
  id v6 = a4;
  Class isa = sub_100029E78().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ClimateSensorIntentTypeResolutionResult();
  v8 = [(ClimateSensorIntentTypeResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end