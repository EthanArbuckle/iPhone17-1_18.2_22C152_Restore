@interface MXSourceXPCPayload(MXSourceXPCPayloadCategory)
- (id)bundleID;
- (uint64_t)sourceIDString;
@end

@implementation MXSourceXPCPayload(MXSourceXPCPayloadCategory)

- (id)bundleID
{
  v1 = [a1 metrics];
  v2 = [v1 allKeys];
  v3 = [v2 firstObject];

  return v3;
}

- (uint64_t)sourceIDString
{
  uint64_t v1 = [a1 sourceID];

  return [&unk_26DF1F680 objectAtIndexedSubscript:v1];
}

@end