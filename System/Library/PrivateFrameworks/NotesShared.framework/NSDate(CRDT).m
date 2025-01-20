@interface NSDate(CRDT)
- (uint64_t)deltaSince:()CRDT in:;
- (uint64_t)initWithICCRCoder:()CRDT;
- (uint64_t)mergeWith:()CRDT;
- (void)encodeWithICCRCoder:()CRDT;
@end

@implementation NSDate(CRDT)

- (uint64_t)mergeWith:()CRDT
{
  uint64_t result = objc_msgSend(a1, "isEqual:");
  if ((result & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1E4F836F8];
    return [v2 handleFailedAssertWithCondition:"[self isEqual:other]" functionName:"-[NSDate(CRDT) mergeWith:]" simulateCrash:1 showAlert:0 format:@"Cannot merge NSDate with different value."];
  }
  return result;
}

- (uint64_t)initWithICCRCoder:()CRDT
{
  id v4 = a3;
  if ([v4 hasDecodableValueForKey:@"doubleValue"])
  {
    v5 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 decodeDoubleForKey:@"doubleValue"];
    uint64_t v6 = objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    uint64_t v6 = [a1 init];
  }

  return v6;
}

- (void)encodeWithICCRCoder:()CRDT
{
  id v4 = a3;
  [a1 timeIntervalSince1970];
  objc_msgSend(v4, "encodeDouble:forKey:", @"doubleValue");
}

- (uint64_t)deltaSince:()CRDT in:
{
  return 0;
}

@end