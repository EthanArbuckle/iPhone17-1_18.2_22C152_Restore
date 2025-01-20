@interface ActionParameterResolutionResult
+ (id)confirmationRequiredWithActionParameterToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithActionParametersToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedActionParameter:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
@end

@implementation ActionParameterResolutionResult

+ (id)successWithResolvedActionParameter:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_21EFEF72C((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithActionParametersToDisambiguate:(id)a3
{
  type metadata accessor for ActionParameter();
  unint64_t v3 = sub_21EFF1660();
  swift_getObjCClassMetadata();
  id v4 = sub_21EFEF7E0(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithActionParameterToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_21EFEF944((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_21EFF1670();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_21EFF1670();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_21EFF1670();
  __break(1u);
  return result;
}

@end