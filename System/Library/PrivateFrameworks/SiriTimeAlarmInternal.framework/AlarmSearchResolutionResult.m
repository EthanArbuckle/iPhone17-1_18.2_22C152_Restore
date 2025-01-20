@interface AlarmSearchResolutionResult
+ (id)confirmationRequiredWithAlarmSearchToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithAlarmSearchsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedAlarmSearch:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (AlarmSearchResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation AlarmSearchResolutionResult

+ (id)successWithResolvedAlarmSearch:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_25DC94548((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithAlarmSearchsToDisambiguate:(id)a3
{
  type metadata accessor for AlarmSearch();
  unint64_t v3 = sub_25DC95F80();
  swift_getObjCClassMetadata();
  id v4 = sub_25DC945FC(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithAlarmSearchToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_25DC94760((uint64_t)a3);

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

- (AlarmSearchResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_25DC95E40();
  id v6 = a4;
  v7 = (void *)sub_25DC95E30();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AlarmSearchResolutionResult();
  v8 = [(AlarmSearchResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end