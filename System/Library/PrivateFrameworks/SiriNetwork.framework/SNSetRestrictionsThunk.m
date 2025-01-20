@interface SNSetRestrictionsThunk
- (SNSetRestrictionsThunk)init;
- (SNSetRestrictionsThunk)initWithCoder:(id)a3;
- (SNSetRestrictionsThunk)initWithDictionary:(id)a3;
- (SNSetRestrictionsThunk)initWithDictionary:(id)a3 context:(id)a4;
- (SNSetRestrictionsThunk)initWithThunk:(id)a3;
- (void)siriNetwork_invokeThunk;
@end

@implementation SNSetRestrictionsThunk

- (SNSetRestrictionsThunk)initWithThunk:(id)a3
{
  v3 = _Block_copy(a3);
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v3 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned SNLinkRecommendationInfo?) -> ();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (SNSetRestrictionsThunk *)SNSetRestrictionsThunk.init(thunk:)((uint64_t)v3, v5);
}

- (SNSetRestrictionsThunk)initWithCoder:(id)a3
{
  return (SNSetRestrictionsThunk *)SNSetRestrictionsThunk.init(coder:)(a3);
}

- (SNSetRestrictionsThunk)initWithDictionary:(id)a3 context:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  SNSetRestrictionsThunk.init(dictionary:context:)(v5, (uint64_t)a4);
  return result;
}

- (SNSetRestrictionsThunk)initWithDictionary:(id)a3
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  SNSetRestrictionsThunk.init(dictionary:)();
  return result;
}

- (void)siriNetwork_invokeThunk
{
  v2 = self;
  SNSetRestrictionsThunk.siriNetwork_invokeThunk()();
}

- (SNSetRestrictionsThunk)init
{
}

- (void).cxx_destruct
{
}

@end