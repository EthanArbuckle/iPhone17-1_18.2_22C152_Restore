@interface NSUUID(CRDT_Additions)
+ (id)CR_repeatedCharUUID:()CRDT_Additions;
+ (id)CR_unknown;
+ (id)CR_unserialized;
+ (id)CR_zero;
- (id)CR_shortDescription;
- (uint64_t)CR_compare:()CRDT_Additions;
- (uint64_t)deltaSince:()CRDT_Additions in:;
- (uint64_t)initWithICCRCoder:()CRDT_Additions;
- (void)encodeWithICCRCoder:()CRDT_Additions;
- (void)mergeWith:()CRDT_Additions;
@end

@implementation NSUUID(CRDT_Additions)

+ (id)CR_unknown
{
  if (CR_unknown_onceToken != -1) {
    dispatch_once(&CR_unknown_onceToken, &__block_literal_global_6_0);
  }
  v0 = (void *)CR_unknown_unserialized;
  return v0;
}

+ (id)CR_unserialized
{
  if (CR_unserialized_onceToken != -1) {
    dispatch_once(&CR_unserialized_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)CR_unserialized_unserialized;
  return v0;
}

- (uint64_t)initWithICCRCoder:()CRDT_Additions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "decodeUUIDFromUUIDIndex:", objc_msgSend(v4, "decodeUInt64ForKey:", @"UUIDIndex"));

  v8[0] = 0;
  v8[1] = 0;
  [v5 getUUIDBytes:v8];
  uint64_t v6 = [a1 initWithUUIDBytes:v8];

  return v6;
}

- (void)mergeWith:()CRDT_Additions
{
  id v5 = a3;
  if ((objc_msgSend(a1, "isEqual:") & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Cannot merge NSUUID with different value." userInfo:0];
    objc_exception_throw(v4);
  }
}

- (uint64_t)deltaSince:()CRDT_Additions in:
{
  return 0;
}

+ (id)CR_repeatedCharUUID:()CRDT_Additions
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = 0x101010101010101 * a3;
  v5[1] = v5[0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v5];
  return v3;
}

+ (id)CR_zero
{
  if (CR_zero_once != -1) {
    dispatch_once(&CR_zero_once, &__block_literal_global_66);
  }
  v0 = (void *)CR_zero_zero;
  return v0;
}

- (uint64_t)CR_compare:()CRDT_Additions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(void *)uu1 = 0;
  uint64_t v9 = 0;
  *(void *)uu2 = 0;
  uint64_t v7 = 0;
  id v4 = a3;
  [a1 getUUIDBytes:uu1];
  [v4 getUUIDBytes:uu2];

  return uuid_compare(uu1, uu2);
}

- (id)CR_shortDescription
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X", LOBYTE(v3[0]), BYTE1(v3[0]));
  return v1;
}

- (void)encodeWithICCRCoder:()CRDT_Additions
{
  id v4 = a3;
  objc_msgSend(v4, "encodeUInt64:forKey:", objc_msgSend(v4, "encodeUUIDIndexFromUUID:", a1), @"UUIDIndex");
}

@end