@interface MFIntentAccountResolutionResult
+ (id)confirmationRequiredWithMFIntentAccountToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithMFIntentAccountsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedMFIntentAccount:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (MFIntentAccountResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation MFIntentAccountResolutionResult

+ (id)successWithResolvedMFIntentAccount:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = static MFIntentAccountResolutionResult.success(with:)((uint64_t)a3);

  return v6;
}

+ (id)disambiguationWithMFIntentAccountsToDisambiguate:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  type metadata accessor for MFIntentAccount();
  uint64_t v5 = sub_10008A190();
  swift_getObjCClassMetadata();
  id v7 = static MFIntentAccountResolutionResult.disambiguation(with:)(v5);
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)confirmationRequiredWithMFIntentAccountToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = static MFIntentAccountResolutionResult.confirmationRequired(with:)(a3);

  return v6;
}

+ (id)successWithResolvedObject:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  static MFIntentAccountResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  sub_100087D14();
  sub_10008A190();
  swift_getObjCClassMetadata();
  static MFIntentAccountResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  static MFIntentAccountResolutionResult.confirmationRequired(with:)();
}

- (MFIntentAccountResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  uint64_t v6 = sub_100089FF0();
  v10 = (MFIntentAccountResolutionResult *)MFIntentAccountResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end