@interface NSUUID(NSUUIDAdditions)
+ (id)TTZero;
- (id)TTShortDescription;
- (uint64_t)TTCompare:()NSUUIDAdditions;
@end

@implementation NSUUID(NSUUIDAdditions)

+ (id)TTZero
{
  if (TTZero_once != -1) {
    dispatch_once(&TTZero_once, &__block_literal_global_8);
  }
  v0 = (void *)TTZero_zero;
  return v0;
}

- (uint64_t)TTCompare:()NSUUIDAdditions
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

- (id)TTShortDescription
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X", LOBYTE(v3[0]), BYTE1(v3[0]));
  return v1;
}

@end