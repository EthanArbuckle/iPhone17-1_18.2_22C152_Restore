@interface NSData(Base64Additions)
+ (id)tsu_decodeFromBase64CString:()Base64Additions srcLength:;
+ (uint64_t)tsu_decodeFromBase64String:()Base64Additions;
+ (uint64_t)tsu_decodeFromBase64StringWithWhitespace:()Base64Additions;
- (id)tsu_encodeToBase64String;
- (id)tsu_encodeToBase64URLSafeString;
@end

@implementation NSData(Base64Additions)

- (id)tsu_encodeToBase64String
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v2 = [a1 length];
  unint64_t v3 = (v2 + 2) / 3;
  size_t v4 = 8 * v3;
  if (v2 >= 0xBFFFFFFFFFFFFFFELL)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[NSData(Base64Additions) tsu_encodeToBase64String]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSData_Base64Additions.mm"], 86, 0, "Overflow when calculating buffer size!");
    +[OITSUAssertionHandler logBacktraceThrottled];
    goto LABEL_5;
  }
  if ((v3 & 0x2000000000000000) != 0)
  {
LABEL_5:
    uint64_t v6 = [NSString stringWithUTF8String:"-[NSData(Base64Additions) tsu_encodeToBase64String]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSData_Base64Additions.mm"], 87, 0, "Overflow when calculating buffer size!");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v7 = malloc_type_malloc(v4, 0x2EA6E3A7uLL);
  if (!v7)
  {
    uint64_t v8 = [NSString stringWithUTF8String:"-[NSData(Base64Additions) tsu_encodeToBase64String]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSData_Base64Additions.mm"], 91, 0, "invalid nil value for '%{public}s'", "result");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  uint64_t v9 = [a1 bytes];
  if (v2)
  {
    v10 = (char *)v9;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    uint64_t updated = 0;
    unint64_t v14 = 384;
    size_t v15 = v2;
    do
    {
      if (v2 >= v14) {
        unint64_t v16 = v14;
      }
      else {
        unint64_t v16 = v2;
      }
      v12 += 384;
      if (v12 <= v2)
      {
        memcpy(__dst, v10, sizeof(__dst));
        v10 += 384;
      }
      else
      {
        memcpy(__dst, v10, v15);
      }
      uint64_t updated = TSUBase64UpdateBase64StringWithChunk((uint64_t)v7, updated, (uint64_t)__dst, v16 + v11);
      v14 += 384;
      v11 -= 384;
      v15 -= 384;
    }
    while (v12 < v2);
  }
  else
  {
    uint64_t updated = 0;
  }
  v17 = (void *)[[NSString alloc] initWithCharactersNoCopy:v7 length:updated freeWhenDone:1];
  return v17;
}

- (id)tsu_encodeToBase64URLSafeString
{
  id v1 = (id)objc_msgSend((id)objc_msgSend(a1, "base64EncodedStringWithOptions:", 0), "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"+", @"-", 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"=", &stru_26EBF24D8, 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

+ (uint64_t)tsu_decodeFromBase64StringWithWhitespace:()Base64Additions
{
  uint64_t v4 = objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[ \r\n\t]+", &stru_26EBF24D8, 1024, 0, objc_msgSend(a3, "length"));
  return objc_msgSend(a1, "tsu_decodeFromBase64String:", v4);
}

+ (uint64_t)tsu_decodeFromBase64String:()Base64Additions
{
  uint64_t v4 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v5 = [a3 UTF8String];
  uint64_t v6 = [a3 length];
  return objc_msgSend(v4, "tsu_decodeFromBase64CString:srcLength:", v5, v6);
}

+ (id)tsu_decodeFromBase64CString:()Base64Additions srcLength:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ((a4 & 3) != 0)
  {
LABEL_2:
    size_t v6 = (unint64_t)((double)a4 * 0.25 * 3.0);
    if (*(unsigned char *)(a4 + a3 - 1) == 61)
    {
      uint64_t v7 = -2;
      if (*(unsigned char *)(a4 + a3 - 2) != 61) {
        uint64_t v7 = -1;
      }
      v6 += v7;
    }
    uint64_t v8 = (char *)malloc_type_calloc(v6, 1uLL, 0xA354556FuLL);
    if (!v8)
    {
      uint64_t v9 = [NSString stringWithUTF8String:"+[NSData(Base64Additions) tsu_decodeFromBase64CString:srcLength:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSData_Base64Additions.mm"], 186, 0, "invalid nil value for '%{public}s'", "result");
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    if (a4 < 5)
    {
      size_t v11 = 0;
      unint64_t v17 = 0;
      unint64_t v12 = v8;
    }
    else
    {
      uint64_t v10 = 0;
      size_t v11 = 0;
      unint64_t v12 = v8;
      do
      {
        unsigned __int8 v13 = DECODE_DATA[*(char *)(a3 + v10 + 1)];
        unsigned int v14 = DECODE_DATA[*(char *)(a3 + v10 + 2)];
        unsigned __int8 v15 = DECODE_DATA[*(char *)(a3 + v10 + 3)];
        unint64_t v16 = &__src[v11];
        *unint64_t v16 = (v13 >> 4) | (4 * DECODE_DATA[*(char *)(a3 + v10)]);
        v16[1] = (v14 >> 2) | (16 * v13);
        v11 += 3;
        v16[2] = v15 | ((_BYTE)v14 << 6);
        if (v11 == 384)
        {
          memcpy(v12, __src, 0x180uLL);
          size_t v11 = 0;
          v12 += 384;
        }
        unint64_t v17 = v10 + 4;
        unint64_t v18 = v10 + 8;
        v10 += 4;
      }
      while (v18 < a4);
    }
    if (v17 < a4)
    {
      int v19 = DECODE_DATA[*(char *)(a3 + (v17 | 1))];
      size_t v20 = v11 + 1;
      __src[v11] = (DECODE_DATA[*(char *)(a3 + (v17 | 1))] >> 4) | (4 * DECODE_DATA[*(char *)(a3 + v17)]);
      if ((v17 | 2) >= a4 || (uint64_t v21 = *(char *)(a3 + (v17 | 2)), v21 == 61))
      {
        ++v11;
        if (!v20) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      unsigned int v26 = DECODE_DATA[v21];
      int v27 = (v26 >> 2) | (16 * v19);
      unint64_t v28 = v17 | 3;
      size_t v29 = v11 + 2;
      __src[v20] = v27;
      if (v28 < a4)
      {
        uint64_t v30 = *(char *)(a3 + v28);
        if (v30 != 61)
        {
          v11 += 3;
          __src[v29] = DECODE_DATA[v30] | ((_BYTE)v26 << 6);
          if (!v11) {
            goto LABEL_30;
          }
          goto LABEL_29;
        }
      }
      v11 += 2;
    }
    if (!v11)
    {
LABEL_30:
      v31 = (void *)MEMORY[0x263EFF8F8];
      return (id)[v31 dataWithBytesNoCopy:v8 length:v6 freeWhenDone:1];
    }
LABEL_29:
    memcpy(v12, __src, v11);
    goto LABEL_30;
  }
  v22 = (void *)MEMORY[0x23EC9A170]();
  uint64_t v23 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  v24 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedData:v23 options:1];
  if (v24)
  {
    if ([v24 length])
    {
      return v24;
    }
  }
  if (a4) {
    goto LABEL_2;
  }
  v32 = (void *)MEMORY[0x263EFF8F8];
  return (id)[v32 data];
}

@end