@interface SiriRemoteTimerTargetResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithSiriRemoteTimerTargetToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithSiriRemoteTimerTargetsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedSiriRemoteTimerTarget:(id)a3;
- (SiriRemoteTimerTargetResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SiriRemoteTimerTargetResolutionResult

+ (id)successWithResolvedSiriRemoteTimerTarget:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_25DD1F500((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSiriRemoteTimerTargetsToDisambiguate:(id)a3
{
  type metadata accessor for SiriRemoteTimerTarget();
  unint64_t v3 = sub_25DD203B8();
  swift_getObjCClassMetadata();
  id v4 = sub_25DD1F5B4(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithSiriRemoteTimerTargetToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_25DD1F718((uint64_t)a3);

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

- (SiriRemoteTimerTargetResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_25DD202C8();
  id v6 = a4;
  v7 = (void *)sub_25DD202B8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriRemoteTimerTargetResolutionResult();
  v8 = [(SiriRemoteTimerTargetResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end