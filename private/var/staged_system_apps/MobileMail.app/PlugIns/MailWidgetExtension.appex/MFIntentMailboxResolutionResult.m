@interface MFIntentMailboxResolutionResult
+ (id)confirmationRequiredWithMFIntentMailboxToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithMFIntentMailboxsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedMFIntentMailbox:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (MFIntentMailboxResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation MFIntentMailboxResolutionResult

+ (id)successWithResolvedMFIntentMailbox:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = static MFIntentMailboxResolutionResult.success(with:)((uint64_t)a3);

  return v6;
}

+ (id)disambiguationWithMFIntentMailboxsToDisambiguate:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  type metadata accessor for MFIntentMailbox();
  uint64_t v5 = sub_10008A190();
  swift_getObjCClassMetadata();
  id v7 = static MFIntentMailboxResolutionResult.disambiguation(with:)(v5);
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)confirmationRequiredWithMFIntentMailboxToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = static MFIntentMailboxResolutionResult.confirmationRequired(with:)(a3);

  return v6;
}

+ (id)successWithResolvedObject:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  static MFIntentMailboxResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  sub_100087D14();
  sub_10008A190();
  swift_getObjCClassMetadata();
  static MFIntentMailboxResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  static MFIntentMailboxResolutionResult.confirmationRequired(with:)();
}

- (MFIntentMailboxResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  uint64_t v6 = sub_100089FF0();
  v10 = (MFIntentMailboxResolutionResult *)MFIntentMailboxResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end