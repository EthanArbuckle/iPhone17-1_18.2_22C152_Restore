@interface NSData(CRDT)
- (uint64_t)deltaSince:()CRDT in:;
- (uint64_t)encodeWithICCRCoder:()CRDT;
- (uint64_t)initWithICCRCoder:()CRDT;
- (uint64_t)mergeWith:()CRDT;
@end

@implementation NSData(CRDT)

- (uint64_t)mergeWith:()CRDT
{
  uint64_t result = objc_msgSend(a1, "isEqual:");
  if ((result & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1E4F836F8];
    return [v2 handleFailedAssertWithCondition:"[self isEqual:other]" functionName:"-[NSData(CRDT) mergeWith:]" simulateCrash:1 showAlert:0 format:@"Cannot merge NSData with different value."];
  }
  return result;
}

- (uint64_t)initWithICCRCoder:()CRDT
{
  uint64_t v4 = [a3 decodeDataForKey:@"self"];

  return v4;
}

- (uint64_t)encodeWithICCRCoder:()CRDT
{
  return [a3 encodeData:a1 forKey:@"self"];
}

- (uint64_t)deltaSince:()CRDT in:
{
  return 0;
}

@end