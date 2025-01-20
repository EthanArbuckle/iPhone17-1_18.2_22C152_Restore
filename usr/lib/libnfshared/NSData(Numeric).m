@interface NSData(Numeric)
- (uint64_t)NF_isZeroed;
- (uint64_t)NF_toUint64:()Numeric;
@end

@implementation NSData(Numeric)

- (uint64_t)NF_isZeroed
{
  if (![a1 length]) {
    return 1;
  }
  id v2 = a1;
  uint64_t v3 = [v2 bytes];
  if (![v2 length]) {
    return 1;
  }
  unint64_t v4 = 0;
  do
  {
    BOOL v5 = *(unsigned char *)(v3 + v4) == 0;
    if (*(unsigned char *)(v3 + v4)) {
      break;
    }
    ++v4;
  }
  while (v4 < [v2 length]);
  return v5;
}

- (uint64_t)NF_toUint64:()Numeric
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[a1 length] >= 9)
  {
    if (a3)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      v6 = [NSString stringWithUTF8String:"nfcd"];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v7 = [NSString stringWithUTF8String:"Overflow"];
      v15[0] = v7;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      *a3 = (id)[v5 initWithDomain:v6 code:45 userInfo:v8];
    }
    return 0;
  }
  id v9 = a1;
  uint64_t v10 = [v9 bytes];
  if (![v9 length]) {
    return 0;
  }
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  do
    uint64_t v12 = 257 * v12 + *(unsigned __int8 *)(v10 + v11++);
  while ([v9 length] > v11);
  return v12;
}

@end