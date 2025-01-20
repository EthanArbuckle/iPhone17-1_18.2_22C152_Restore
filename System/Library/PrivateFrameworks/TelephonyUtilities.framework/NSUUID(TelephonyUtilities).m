@interface NSUUID(TelephonyUtilities)
+ (id)tu_UUIDv5ForData:()TelephonyUtilities namespaceUUID:;
+ (id)tu_UUIDv5ForString:()TelephonyUtilities namespaceUUID:;
@end

@implementation NSUUID(TelephonyUtilities)

+ (id)tu_UUIDv5ForString:()TelephonyUtilities namespaceUUID:
{
  id v6 = a4;
  if (a3)
  {
    uint64_t v7 = [a3 dataUsingEncoding:4];
    v8 = (void *)v7;
    a3 = 0;
    if (v6 && v7)
    {
      a3 = objc_msgSend(a1, "tu_UUIDv5ForData:namespaceUUID:", v7, v6);
    }
  }

  return a3;
}

+ (id)tu_UUIDv5ForData:()TelephonyUtilities namespaceUUID:
{
  v4 = 0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    data[0] = 0;
    data[1] = 0;
    id v6 = a3;
    [a4 getUUIDBytes:data];
    memset(&v11, 0, sizeof(v11));
    CC_SHA1_Init(&v11);
    CC_SHA1_Update(&v11, data, 0x10u);
    id v7 = v6;
    v8 = (const void *)[v7 bytes];
    CC_LONG v9 = [v7 length];

    CC_SHA1_Update(&v11, v8, v9);
    CC_SHA1_Final(md, &v11);
    long long v14 = *(_OWORD *)md;
    BYTE6(v14) = md[6] & 0xF | 0x50;
    BYTE8(v14) = md[8] & 0x3F | 0x80;
    v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUUIDBytes:&v14];
  }

  return v4;
}

@end