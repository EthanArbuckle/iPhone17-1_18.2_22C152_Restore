@interface ConfigurationListResolutionResult
+ (id)confirmationRequiredWithConfigurationListToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithConfigurationListsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedConfigurationList:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (ConfigurationListResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ConfigurationListResolutionResult

+ (id)successWithResolvedConfigurationList:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_1A7570AD8((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithConfigurationListsToDisambiguate:(id)a3
{
  type metadata accessor for ConfigurationList();
  unint64_t v3 = sub_1A7572A10();
  swift_getObjCClassMetadata();
  id v4 = sub_1A7570B8C(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithConfigurationListToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_1A7570D30((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_1A7573840();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_1A7573840();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_1A7573840();
  __break(1u);
  return result;
}

- (ConfigurationListResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_1A75723F0();
  id v6 = a4;
  v7 = (void *)sub_1A75723D0();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ConfigurationListResolutionResult();
  v8 = [(ConfigurationListResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end