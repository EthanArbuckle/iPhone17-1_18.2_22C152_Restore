@interface NSString(OCBStringAdditions)
+ (id)stringWithCsString:()OCBStringAdditions;
+ (id)stringWithOcText:()OCBStringAdditions;
- (__CFString)initWithOcText:()OCBStringAdditions;
- (id)dataUsingWordEncoding:()OCBStringAdditions;
- (uint64_t)copyToOcText:()OCBStringAdditions;
- (uint64_t)initWithCsString:()OCBStringAdditions;
- (void)copyToCsString:()OCBStringAdditions;
- (void)copyToOcText:()OCBStringAdditions encoding:;
@end

@implementation NSString(OCBStringAdditions)

- (uint64_t)initWithCsString:()OCBStringAdditions
{
  if (a3 && (unsigned int v4 = *(_DWORD *)(a3 + 16)) != 0)
  {
    if (*(void *)(a3 + 8)) {
      v5 = *(const UInt8 **)(a3 + 8);
    }
    else {
      v5 = (const UInt8 *)&unk_238EDE13C;
    }
    if (!*(_WORD *)&v5[2 * v4 - 2]) {
      --v4;
    }
    CFStringRef v6 = CFStringCreateWithBytes(0, v5, 2 * v4, 0x100u, 0);

    return (uint64_t)v6;
  }
  else
  {
    return [a1 init];
  }
}

+ (id)stringWithCsString:()OCBStringAdditions
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCsString:a3];
  return v3;
}

+ (id)stringWithOcText:()OCBStringAdditions
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOcText:a3];
  return v3;
}

- (__CFString)initWithOcText:()OCBStringAdditions
{
  v3 = a1;
  if (!a3 || !*(_DWORD *)(a3 + 16))
  {
    CFStringRef v6 = [(__CFString *)a1 init];
LABEL_14:
    v3 = v6;
    v7 = v3;
    goto LABEL_15;
  }
  int v5 = *(_DWORD *)(a3 + 8);
  if (v5 == 2) {
    operator new();
  }
  v7 = 0;
  v8 = *(const UInt8 **)(a3 + 24);
  int isSingleByteEncoding = OcText::isSingleByteEncoding(v5);
  int v10 = *(_DWORD *)(a3 + 16);
  unint64_t v11 = OCNsEncodingForOcEncoding(*(_DWORD *)(a3 + 8));
  if (isSingleByteEncoding) {
    int v12 = 1;
  }
  else {
    int v12 = 2;
  }
  if (v11)
  {
LABEL_13:
    CFStringEncoding v15 = CFStringConvertNSStringEncodingToEncoding(v11);
    CFStringRef v6 = (__CFString *)CFStringCreateWithBytes(0, v8, v10 * (uint64_t)v12, v15, 0);

    goto LABEL_14;
  }
  uint64_t v14 = *(unsigned int *)(a3 + 16);
  uint64_t v13 = *(unsigned int *)(a3 + 20);
  if (v13 == v14 || v13 == v14 + 1)
  {
    int v12 = 1;
    unint64_t v11 = 4;
    goto LABEL_13;
  }
  int v12 = 2;
  unint64_t v11 = 10;
  if (v13 == 2 * v14 || 2 * (v14 + 1) == v13) {
    goto LABEL_13;
  }
LABEL_15:

  return v7;
}

- (uint64_t)copyToOcText:()OCBStringAdditions
{
  return [a1 copyToOcText:a3 encoding:1];
}

- (void)copyToOcText:()OCBStringAdditions encoding:
{
  v7 = (void *)MEMORY[0x23EC9A170]();
  v8 = [a1 dataUsingWordEncoding:a4];
  unsigned int v9 = [v8 length];
  if (v9)
  {
    if (OcText::isSingleByteEncoding(a4)) {
      int v10 = 1;
    }
    else {
      int v10 = 2;
    }
    OcText::allocBuffer(a3, v10 + v9, 1);
    OcText::copyBuffer(a3, (const unsigned __int8 *)[v8 bytes], v9);
    a3->var3 = [a1 length];
    a3->var1 = a4;
  }
  else
  {
    OcText::removeBuffer(a3);
  }
}

- (id)dataUsingWordEncoding:()OCBStringAdditions
{
  unint64_t v4 = OCNsEncodingForOcEncoding(a3);
  id v5 = [a1 dataUsingEncoding:v4];
  if (!v5)
  {
    CFStringRef v6 = (void *)[NSString availableStringEncodings];
    while (*v6++)
    {
      uint64_t v8 = objc_msgSend(a1, "dataUsingEncoding:");
      if (v8)
      {
        id v5 = (id)v8;
        goto LABEL_7;
      }
    }
    id v5 = 0;
  }
LABEL_7:
  if (v4 == 10)
  {
    id v5 = v5;
    unsigned int v9 = (__int16 *)[v5 bytes];
    uint64_t v10 = [v5 length];
    if (v10)
    {
      if (*v9 == -257)
      {
        uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v9 + 1 length:v10 - 2 freeWhenDone:0];

        id v5 = (id)v11;
      }
    }
  }
  return v5;
}

- (void)copyToCsString:()OCBStringAdditions
{
  id v5 = (void *)MEMORY[0x23EC9A170]();
  CFStringRef v6 = [a1 dataUsingWordEncoding:1];
  unsigned int v7 = [v6 length];
  a3->var2 = 0;
  bzero(a3->var1, 2 * a3->var3);
  if (v7) {
    CsString::append(a3, (const unsigned __int16 *)[v6 bytes], v7 >> 1);
  }
}

@end