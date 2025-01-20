@interface NSData(IMAdditions)
+ (id)imDataFromHexString:()IMAdditions;
+ (id)uniquenessHashForContentsOfFileUrl:()IMAdditions readBufferSize:;
+ (uint64_t)uniquenessHashForContentsOfFileUrl:()IMAdditions;
- (id)hexString;
- (id)uniquenessHash;
@end

@implementation NSData(IMAdditions)

+ (id)imDataFromHexString:()IMAdditions
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  unint64_t v5 = v4 >> 1;
  v6 = malloc_type_malloc(v4 >> 1, 0x7AC88058uLL);
  id v7 = v3;
  uint64_t v8 = [v7 UTF8String];
  if (v4 < 2)
  {
LABEL_7:
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v6 length:v5];
  }
  else
  {
    v9 = (const char *)v8;
    uint64_t v10 = 0;
    if (v5 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v4 >> 1;
    }
    while (1)
    {
      __int16 v14 = 0;
      if (sscanf(v9, "%1hhx%1hhx", (char *)&v14 + 1, &v14) < 2) {
        break;
      }
      v6[v10++] = v14 + 16 * HIBYTE(v14);
      v9 += 2;
      if (v11 == v10) {
        goto LABEL_7;
      }
    }
    free(v6);
    v12 = 0;
  }

  return v12;
}

- (id)hexString
{
  uint64_t v2 = [a1 length];
  id v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:2 * v2];
  uint64_t v4 = [a1 bytes];
  if (v2)
  {
    unint64_t v5 = (unsigned __int8 *)v4;
    do
    {
      unsigned int v6 = *v5++;
      objc_msgSend(v3, "appendFormat:", @"%02x", v6);
      --v2;
    }
    while (v2);
  }
  return v3;
}

- (id)uniquenessHash
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[a1 length];
  if (v2)
  {
    unint64_t v3 = (unint64_t)v2;
    memset(&v9, 0, sizeof(v9));
    CC_MD5_Init(&v9);
    uint64_t v4 = (char *)[a1 bytes];
    if (v3 < 0x10000) {
      goto LABEL_5;
    }
    do
    {
      CC_MD5_Update(&v9, v4, 0x10000u);
      v4 += 0x10000;
      v3 -= 0x10000;
    }
    while (v3 >> 16);
    if (v3) {
LABEL_5:
    }
      CC_MD5_Update(&v9, v4, v3);
    CC_MD5_Final(md, &v9);
    uint64_t v5 = 0;
    char v11 = 0;
    memset(v10, 0, sizeof(v10));
    unsigned int v6 = (char *)v10 + 1;
    do
    {
      unint64_t v7 = md[v5];
      *(v6 - 1) = a0123456789abcd[v7 >> 4];
      unsigned char *v6 = a0123456789abcd[v7 & 0xF];
      v6 += 2;
      ++v5;
    }
    while (v5 != 16);
    uint64_t v2 = (void *)[[NSString alloc] initWithBytes:v10 length:32 encoding:4];
  }
  return v2;
}

+ (uint64_t)uniquenessHashForContentsOfFileUrl:()IMAdditions
{
  return [a1 uniquenessHashForContentsOfFileUrl:a3 readBufferSize:0];
}

+ (id)uniquenessHashForContentsOfFileUrl:()IMAdditions readBufferSize:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4) {
    uint64_t v6 = a4;
  }
  else {
    uint64_t v6 = 0x4000;
  }
  id v17 = 0;
  unint64_t v7 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v5 error:&v17];
  id v8 = v17;
  if (v7)
  {
    memset(&v16, 0, sizeof(v16));
    uint64_t v9 = CC_MD5_Init(&v16);
    do
    {
      uint64_t v10 = (void *)MEMORY[0x1AD11A870](v9);
      char v11 = [v7 readDataOfLength:v6];
      uint64_t v12 = [v11 length];
      if (v12)
      {
        id v13 = v11;
        CC_MD5_Update(&v16, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
      }
    }
    while (v12);
    CC_MD5_Final(md, &v16);
    [v7 closeFile];
    __int16 v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:16];
  }
  else
  {
    __int16 v14 = 0;
  }

  return v14;
}

@end