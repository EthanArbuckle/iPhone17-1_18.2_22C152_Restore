@interface SuggestionResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithSuggestionToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithSuggestionsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedSuggestion:(id)a3;
@end

@implementation SuggestionResolutionResult

+ (id)successWithResolvedSuggestion:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_21EFEEDEC((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSuggestionsToDisambiguate:(id)a3
{
  type metadata accessor for Suggestion();
  unint64_t v3 = sub_21EFF1660();
  swift_getObjCClassMetadata();
  id v4 = sub_21EFEEEA0(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithSuggestionToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_21EFEF044((uint64_t)a3);

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