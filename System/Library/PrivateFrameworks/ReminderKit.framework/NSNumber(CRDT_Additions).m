@interface NSNumber(CRDT_Additions)
- (uint64_t)deltaSince:()CRDT_Additions in:;
- (uint64_t)initWithCRCoder:()CRDT_Additions;
- (void)encodeWithCRCoder:()CRDT_Additions;
- (void)mergeWith:()CRDT_Additions;
@end

@implementation NSNumber(CRDT_Additions)

- (void)mergeWith:()CRDT_Additions
{
  id v5 = a3;
  if ((objc_msgSend(a1, "isEqual:") & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Cannot merge NSNumber with different value." userInfo:0];
    objc_exception_throw(v4);
  }
}

- (uint64_t)initWithCRCoder:()CRDT_Additions
{
  id v4 = a3;
  if ([v4 hasDecodableValueForKey:@"integerValue"])
  {
    uint64_t v5 = objc_msgSend(a1, "initWithInteger:", (int)objc_msgSend(v4, "decodeInt32ForKey:", @"integerValue"));
  }
  else if ([v4 hasDecodableValueForKey:@"doubleValue"])
  {
    [v4 decodeDoubleForKey:@"doubleValue"];
    uint64_t v5 = objc_msgSend(a1, "initWithDouble:");
  }
  else
  {
    uint64_t v5 = [a1 init];
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)encodeWithCRCoder:()CRDT_Additions
{
  id v5 = a3;
  CFNumberType Type = CFNumberGetType(a1);
  if ((unint64_t)Type <= kCFNumberCGFloatType)
  {
    if (((1 << Type) & 0xCF9E) != 0)
    {
      objc_msgSend(v5, "encodeInt64:forKey:", -[__CFNumber integerValue](a1, "integerValue"), @"integerValue");
    }
    else if (((1 << Type) & 0x13060) != 0)
    {
      [(__CFNumber *)a1 doubleValue];
      objc_msgSend(v5, "encodeDouble:forKey:", @"doubleValue");
    }
  }
}

- (uint64_t)deltaSince:()CRDT_Additions in:
{
  return 0;
}

@end