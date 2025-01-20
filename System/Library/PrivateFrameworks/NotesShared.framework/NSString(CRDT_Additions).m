@interface NSString(CRDT_Additions)
- (uint64_t)deltaSince:()CRDT_Additions in:;
- (uint64_t)encodeWithICCRCoder:()CRDT_Additions;
- (uint64_t)initWithICCRCoder:()CRDT_Additions;
- (uint64_t)mergeWith:()CRDT_Additions;
@end

@implementation NSString(CRDT_Additions)

- (uint64_t)mergeWith:()CRDT_Additions
{
  uint64_t result = objc_msgSend(a1, "isEqual:");
  if ((result & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1E4F836F8];
    return [v2 handleFailedAssertWithCondition:"[self isEqual:other]" functionName:"-[NSString(CRDT_Additions) mergeWith:]" simulateCrash:1 showAlert:0 format:@"Cannot merge NSString with different value."];
  }
  return result;
}

- (uint64_t)initWithICCRCoder:()CRDT_Additions
{
  v4 = [a3 decodeStringForKey:@"self"];
  uint64_t v5 = [a1 initWithString:v4];

  return v5;
}

- (uint64_t)encodeWithICCRCoder:()CRDT_Additions
{
  return [a3 encodeString:a1 forKey:@"self"];
}

- (uint64_t)deltaSince:()CRDT_Additions in:
{
  return 0;
}

@end