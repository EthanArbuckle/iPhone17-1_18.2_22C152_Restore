@interface PersonTypeResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithPersonTypeToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithPersonTypesToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedPersonType:(id)a3;
- (PersonTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PersonTypeResolutionResult

+ (id)successWithResolvedPersonType:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_1C6DBA75C((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithPersonTypesToDisambiguate:(id)a3
{
  type metadata accessor for PersonType();
  unint64_t v3 = sub_1C6DBC070();
  swift_getObjCClassMetadata();
  id v4 = sub_1C6DBA810(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithPersonTypeToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_1C6DBA9B4((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_1C6DBC7E0();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_1C6DBC7E0();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_1C6DBC7E0();
  __break(1u);
  return result;
}

- (PersonTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_1C6DBBC30();
  id v6 = a4;
  v7 = (void *)sub_1C6DBBC20();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PersonTypeResolutionResult();
  v8 = [(PersonTypeResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end