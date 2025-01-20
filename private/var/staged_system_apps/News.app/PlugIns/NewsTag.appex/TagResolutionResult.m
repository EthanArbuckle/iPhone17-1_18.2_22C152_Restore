@interface TagResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithTagToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithTagsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedTag:(id)a3;
- (TagResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation TagResolutionResult

+ (id)successWithResolvedTag:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static TagResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithTagsToDisambiguate:(id)a3
{
  type metadata accessor for Tag();
  unint64_t v3 = sub_1000CC3B0();
  swift_getObjCClassMetadata();
  id v4 = static TagResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithTagToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static TagResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_1000CC870();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_1000CC870();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_1000CC870();
  __break(1u);
  return result;
}

- (TagResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_1000CC110();
  id v6 = a4;
  Class isa = sub_1000CC100().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TagResolutionResult();
  v8 = [(TagResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end