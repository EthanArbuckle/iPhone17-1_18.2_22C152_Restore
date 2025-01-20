@interface String:
- (uint64_t)ActionParameter;
- (uint64_t)NSNumber;
- (uint64_t)String;
@end

@implementation String:

- (uint64_t)String
{
  return swift_release();
}

- (uint64_t)NSNumber
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = a3;
    return specialized _resumeUnsafeThrowingContinuationWithError<A>(_:_:)(v3, (uint64_t)v4);
  }
  else
  {
    type metadata accessor for LNActionParameterMetadata(0, &lazy cache variable for type metadata for NSNumber);
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    return specialized _resumeUnsafeThrowingContinuation<A>(_:_:)(v3, v6);
  }
}

- (uint64_t)ActionParameter
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

@end