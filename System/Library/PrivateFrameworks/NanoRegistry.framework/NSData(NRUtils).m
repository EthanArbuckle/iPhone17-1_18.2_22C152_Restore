@interface NSData(NRUtils)
+ (id)dataWithRandomBytesOfSize:()NRUtils;
+ (id)fromUUID:()NRUtils;
- (id)NRSHA256;
- (id)toUUID;
- (unsigned)NRSHA256:()NRUtils;
@end

@implementation NSData(NRUtils)

+ (id)dataWithRandomBytesOfSize:()NRUtils
{
  objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = v5;
  unint64_t v7 = a3 >> 2;
  if (a3 >= 4)
  {
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = a3 >> 2;
    }
    v9 = (_DWORD *)v5;
    do
    {
      *v9++ = random();
      --v8;
    }
    while (v8);
  }
  unint64_t v10 = a3 & 3;
  if (v10)
  {
    v11 = (unsigned char *)(v6 + 4 * v7);
    do
    {
      *v11++ = random();
      --v10;
    }
    while (v10);
  }

  return v4;
}

+ (id)fromUUID:()NRUtils
{
  v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [a3 getUUIDBytes:v5];
    v3 = [MEMORY[0x1E4F1CA58] dataWithBytes:v5 length:16];
  }

  return v3;
}

- (id)toUUID
{
  if ([a1 length] == 16) {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(a1, "bytes"));
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (unsigned)NRSHA256:()NRUtils
{
  if (a3)
  {
    id v4 = result;
    uint64_t v5 = (const void *)[v4 bytes];
    CC_LONG v6 = [v4 length];
    return CC_SHA256(v5, v6, a3);
  }
  return result;
}

- (id)NRSHA256
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 NRSHA256:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:32];

  return v1;
}

@end