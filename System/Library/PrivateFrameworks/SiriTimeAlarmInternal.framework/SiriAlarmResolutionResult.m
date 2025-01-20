@interface SiriAlarmResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithSiriAlarmToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithSiriAlarmsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedSiriAlarm:(id)a3;
- (SiriAlarmResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SiriAlarmResolutionResult

+ (id)successWithResolvedSiriAlarm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_25DC929C8((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSiriAlarmsToDisambiguate:(id)a3
{
  type metadata accessor for SiriAlarm();
  unint64_t v3 = sub_25DC95F80();
  swift_getObjCClassMetadata();
  id v4 = sub_25DC92A2C(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithSiriAlarmToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_25DC92B64((uint64_t)a3);

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

- (SiriAlarmResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_25DC95E40();
  id v6 = a4;
  v7 = (void *)sub_25DC95E30();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriAlarmResolutionResult();
  v8 = [(SiriAlarmResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end