@interface SleepAlarmAttributeResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithSleepAlarmAttributeToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithSleepAlarmAttributesToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedSleepAlarmAttribute:(id)a3;
- (SleepAlarmAttributeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SleepAlarmAttributeResolutionResult

+ (id)successWithResolvedSleepAlarmAttribute:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_25DC93B50((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSleepAlarmAttributesToDisambiguate:(id)a3
{
  type metadata accessor for SleepAlarmAttribute();
  unint64_t v3 = sub_25DC95F80();
  swift_getObjCClassMetadata();
  id v4 = sub_25DC93C04(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithSleepAlarmAttributeToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_25DC93D68((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_25DC962C0();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_25DC962C0();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_25DC962C0();
  __break(1u);
  return result;
}

- (SleepAlarmAttributeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_25DC95E40();
  id v6 = a4;
  v7 = (void *)sub_25DC95E30();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SleepAlarmAttributeResolutionResult();
  v8 = [(SleepAlarmAttributeResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end