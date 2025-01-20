@interface MFIntentMailboxKindResolutionResult
+ (id)confirmationRequiredWithMFIntentMailboxKindToConfirm:(int64_t)a3;
+ (id)successWithResolvedMFIntentMailboxKind:(int64_t)a3;
- (MFIntentMailboxKindResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation MFIntentMailboxKindResolutionResult

+ (id)successWithResolvedMFIntentMailboxKind:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static MFIntentMailboxKindResolutionResult.success(with:)();

  return v3;
}

+ (id)confirmationRequiredWithMFIntentMailboxKindToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static MFIntentMailboxKindResolutionResult.confirmationRequired(with:)();

  return v3;
}

- (MFIntentMailboxKindResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  uint64_t v6 = sub_100089FF0();
  v10 = (MFIntentMailboxKindResolutionResult *)MFIntentMailboxKindResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end