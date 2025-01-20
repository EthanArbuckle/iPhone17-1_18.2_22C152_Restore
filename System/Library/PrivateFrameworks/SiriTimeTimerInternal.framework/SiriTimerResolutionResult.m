@interface SiriTimerResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithSiriTimerToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithSiriTimersToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedSiriTimer:(id)a3;
- (SiriTimerResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SiriTimerResolutionResult

+ (id)successWithResolvedSiriTimer:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_25DD1D908((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSiriTimersToDisambiguate:(id)a3
{
  type metadata accessor for SiriTimer();
  unint64_t v3 = sub_25DD203B8();
  swift_getObjCClassMetadata();
  id v4 = sub_25DD1D9BC(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithSiriTimerToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_25DD1DB60((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_25DD20818();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_25DD20818();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_25DD20818();
  __break(1u);
  return result;
}

- (SiriTimerResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_25DD202C8();
  id v6 = a4;
  v7 = (void *)sub_25DD202B8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriTimerResolutionResult();
  v8 = [(SiriTimerResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end